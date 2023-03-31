/*
	Elevator template model for Assignment 2 of 2IX20 - Software Specification.
	Set up for one elevator and two floors.
*/

//Soft ass assignment, wijfje
//Don't lose your mind wife everything will be okay
//Thank you schatje i will try my best but i think its already too late the damage is done theres nothing we can do the world is ending

// How to poll a synchronous channel?
// LTL formulas to be verified

// When the request button of floor i is pressed, eventually, that request is processed
// ltl e1 { [] ( request?[0] -> <> (req_handler : servedArr[0]))};
// ltl e2 { [] ( request?[1] -> <> (req_handler : servedArr[1]))};
// ltl e3 { [] ( request?[2] -> <> (req_handler : servedArr[2]))};

// Each elevator eventually processes a request.
// ltl f1 {<> (req_handler : goArr[0] == true)};
// ltl f2 {<> (req_handler : goArr[1] == true)};
// ltl f3 {<> (req_handler : goArr[2] == true)};

// When an elevator signals that it has processed a request via the served channel, its current floor is equal to the destination floor of the request.
// ltl g1 {served[k]?dest -> current_floor[k] == dest}

// Eventually a request is made at floor number N − 1.
// ltl h {<>(floor_request_made[1]) == true}

// the number of floors
#define N 3

// ltl h {<>(floor_request_made[2]) == true}

// the number of elevators
#define M 3

// IDs of req_button processes
#define cabin_door_id _pid
#define elevator_engine_id _pid - M
#define main_control_id _pid - 2*M
#define reqid _pid - 3*M - 1

// type for direction of elevator
mtype { down, up, none }; // i want this to be a variable
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
chan floor_reached[M] = [0] of { bool }; // i think this is just a flag to send im not sure if it needs that many

// synchronous channels for communication between request handler and main control
chan go[M] = [0] of { byte };
chan served[M] = [0] of { bool };

// cabin door process
active[M] proctype cabin_door() { 
	do
	:: printf("%d", current_floor[cabin_door_id]); 
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

//theoretical algorithm
//outside request recieved
// while(request.pending) / when update comes in  {
// for elevator 1:n{
// 	if check request status (or if elevator is idle?){ add request to elevator i request stack and break;}
//  else if request up and elevator status up and elevator below { >> }
//  else if request down and elevator status down and elevator up { >> }
//  }}
// 	next request

// DUMMY main control process. Remodel it to control the doors and the engine!
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

		// an example assertion.
		// assert(0 <= current_floor[main_control_id] && current_floor[main_control_id] < N);
		// assert(0 <= dest && dest <N);

		floor_request_made[destination] = false;
		served[main_control_id]!true;
	od;
}

// Note that since request is an asynchronous channel, it serves as a
// request queue for the handler. Requests made by pressing a floor request button
// are directly added to the queue. Checking for the presence of requests and
// assigning them to the elevator, however, does not need to be done by the request
// handler immediately when a request has been added to request. In other
// words, request?dest can be executed at any time after a request!reqid
// has been executed by a req_button process.

// request handler process. Remodel this process to serve M elevators!
// Possible algorithm:
// See the request queue, check elevator status
// If elevator cabin is going up and requested floor is above current floor, assign person to this elevator
// If elevator cabin is going down and requested floor is below current floor
// Else it waits until an elevator is available
// Current algo: assign the next destination in the queue to every elevator
active proctype req_handler() {
	byte dest;
	// to keep track whether elevator has served a request
	bool servedArr[M];
	// to keep track whether elevator processes a request
	bool goArr[M];
	int k = 0;
   	do
	:: printf("%d", k);
    ::	request?dest -> servedArr[k] = false; goArr[k]=false; go[k]!dest; goArr[k]=true; served[k]?true; servedArr[k] = true; k = (k+1) % M;
	od;
}

// request button associated to a floor i to request an elevator
// how many times should this be instantiated?
// how to find the correct process Id?
active [N] proctype req_button() {
	do
	:: !floor_request_made[reqid] ->
	   atomic {
		request!reqid;
		floor_request_made[reqid] = true;
	   }
	od;
}