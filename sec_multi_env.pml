/*
	Elevator template model for Assignment 2 of 2IX20 - Software Specification.
	Set up for one elevator and two floors.
*/

// the number of floors
#define N 4

// the number of elevators
#define M 2

bool servedArr[M];
// to keep track whether elevator processes a request
byte goArr[M];
bool requestProcessed[N];

// IDs of req_button processes
#define cabin_door_id _pid
#define elevator_engine_id _pid - M
#define main_control_id _pid - 2*M
#define reqid _pid - 3*M - 1

// type for direction of elevator
mtype { down, up, none };
mtype directions[M];

// asynchronous channel to handle passenger requestsg
chan request = [N] of { byte }; 

// status of requests per floor
bool floor_request_made[N];


// status of N floor doors of the elevator shaft
typedef shafts {
    bool shaft[N];
};

//2d array containing the status of N floor doors of M elevator shafts
shafts floor_door_is_open[M];

// status and synchronous channels for elevator cabin and engine
byte current_floor[M];
bool cabin_door_is_open[M];

chan update_cabin_door[M] = [0] of { bool };
chan cabin_door_updated[M] = [0] of { bool };
chan move[M] = [0] of { bool };
chan floor_reached[M] = [0] of { bool };

// synchronous channels for communication between request handler and main control
chan go[M] = [0] of { byte };
chan served[M] = [0] of { bool };

// LTL formulas to be verified

// Property e: When the request button of floor i is pressed, eventually, that request is processed
// ltl e1 { [] ( request?[0] -> <> (requestProcessed[0] == true))};
// ltl e2 { [] ( request?[1] -> <> (requestProcessed[1] == true))};
// ltl e3 { [] ( request?[2] -> <> (requestProcessed[2] == true))};

// Property f: Each elevator eventually processes a request.
// ltl f1 {<> (servedArr[0] == true)};
// ltl f2 {<> (servedArr[1] == true)};
// ltl f3 {<> (servedArr[2] == true)};

// Property g: When an elevator signals that it has processed a request via the served channel, its current floor is equal to the destination floor of the request.
// Modelled as assertion in the main control (line 129)

//Property h: Eventually a request is made at floor number N − 1.
// ltl h {<>(floor_request_made[2]) == true}

// Eventually a request is made at floor number N − 1.
// ltl h {<>(floor_request_made[N-1] == true)};

// cabin door process
active[M] proctype cabin_door() { 
	do
	:: update_cabin_door[cabin_door_id]?true -> floor_door_is_open[cabin_door_id].shaft[current_floor[cabin_door_id]] = true; cabin_door_is_open[cabin_door_id] = true; cabin_door_updated[cabin_door_id]!true;
	:: update_cabin_door[cabin_door_id]?false -> cabin_door_is_open[cabin_door_id] = false; floor_door_is_open[cabin_door_id].shaft[current_floor[cabin_door_id]] = false; cabin_door_updated[cabin_door_id]!false;
	od;
}

// process combining the elevator engine and sensors
active[M] proctype elevator_engine() {
	do
	:: move[elevator_engine_id]?true ->
		do
		:: move[elevator_engine_id]?false -> break;
		:: floor_reached[elevator_engine_id]!true;
		od;
	od;
}

// main control process.
active[M] proctype main_control() {
	byte destination;
	current_floor[main_control_id] = 0;
	do
	:: go[main_control_id]?destination ->
		update_cabin_door[main_control_id]!false; // The door will close no matter the destination upon receiving a request
		cabin_door_updated[main_control_id]?false;
		if
		:: destination > current_floor[main_control_id] -> // Case where destination is above the current floor
			directions[main_control_id] = up; // The elevator will be moving upwards
			move[main_control_id]!true;
			floor_reached[main_control_id]?true; 
			current_floor[main_control_id] = destination; // Update current floor
			move[main_control_id]!false;
			update_cabin_door[main_control_id]!true; 
			cabin_door_updated[main_control_id]?true;
		:: destination < current_floor[main_control_id] -> // Case where destination is below the current floor
			directions[main_control_id] = down; // The elevator will be moving downwards
			move[main_control_id]!true;
			floor_reached[main_control_id]?true;
			current_floor[main_control_id] = destination; // Update current floor
			move[main_control_id]!false;
			update_cabin_door[main_control_id]!true;
			cabin_door_updated[main_control_id]?true;
		:: else -> // Case where destination is on the current floor
			directions[main_control_id] = none; // Elevator does not move
			update_cabin_door[main_control_id]!true;
			cabin_door_updated[main_control_id]?true;
		fi

		floor_request_made[destination] = false;
		served[main_control_id]!true;

		//Property h: When an elevator signals that it has processed a request via the served channel, its current floor is equal to the destination floor of the request.
		assert(current_floor[main_control_id] == destination);
	od;
}


// request handler proces
active proctype req_handler() {
	byte dest;
	int k = 0; // elevator counter variable
   	do
    ::	request?dest -> go[k]!dest; served[k]?true; servedArr[k]=true; requestProcessed[dest]=true; k = (k+1) % M;
	od;
}

// request button associated to a floor i to request an elevator
active [N] proctype req_button() {
	do
	:: !floor_request_made[reqid] ->
	   atomic {
		request!reqid;
		floor_request_made[reqid] = true;
	   }
	od;
}