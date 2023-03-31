/*
	Elevator template model for Assignment 2 of 2IX20 - Software Specification.
	Set up for one elevator and two floors.
*/

// // LTL formulas to be verified
// ltl a1 { [] (floor_request_made[1] -> (<> (current_floor == 1)))}
// ltl a2 { [] (floor_request_made[2] -> (<> (current_floor == 2)))}
// ltl b1 {[]<> (cabin_door_is_open==true)}
// ltl b2 {[]<> (cabin_door_is_open==false)}
// ltl c {[] (cabin_door_is_open == true -> floor_door_is_open[current_floor] == true)}

// the number of floors
#define N 4

// IDs of req_button processes
#define reqid _pid-4

// type for direction of elevator
mtype { down, up, none };

// direction variable for the elevator
mtype direction;

// asynchronous channel to handle passenger requestsg
chan request = [N] of { byte };
// status of requests per floor
bool floor_request_made[N];

// status of floor doors of the shaft of the single elevator
bool floor_door_is_open[N];

// status and synchronous channels for elevator cabin and engine
byte current_floor;
bool cabin_door_is_open;
chan update_cabin_door = [0] of { bool };
chan cabin_door_updated = [0] of { bool };
chan move = [0] of { bool };
chan floor_reached = [0] of { bool };

// synchronous channels for communication between request handler and main control
chan go = [0] of { byte };
chan served = [0] of { bool };

// cabin door process
active proctype cabin_door() {
	do
	:: update_cabin_door?true -> floor_door_is_open[current_floor] = true; cabin_door_is_open = true; cabin_door_updated!true;
	:: update_cabin_door?false -> cabin_door_is_open = false; floor_door_is_open[current_floor] = false; cabin_door_updated!false;
	od;
}

// process combining the elevator engine and sensors
active proctype elevator_engine() {
	do
	:: move?true ->
		do
		:: move?false -> break;
		:: floor_reached!true;
		od;
	od;
}

// DUMMY main control process. Remodel it to control the doors and the engine!
active proctype main_control() {
	byte dest;
	current_floor = 0; // elevator is assumed to be on floor 0 when first connected.
	do
	:: go?dest ->
		update_cabin_door!false; // The door will close upon recieving a request
		cabin_door_updated?false;
		if
		:: dest > current_floor -> // Case where destination is above the current floor
			direction = up; // The elevator will be moving upwards
			move!true;
			floor_reached?true; 
			current_floor = dest; // Update current floor
			move!false;
			update_cabin_door!true; 
			cabin_door_updated?true;
		:: dest < current_floor -> // Case where destination is below the current floor
			direction = down; // The elevator will be moving downwards
			move!true;
			floor_reached?true;
			current_floor = dest; // Update current floor
			move!false;
			update_cabin_door!true;
			cabin_door_updated?true;
		:: else -> // Case where destination is on the current floor
			direction = none; // Elevator does not move
			update_cabin_door!true;
			cabin_door_updated?true;
		fi

	   // an example assertion.
	   assert(0 <= current_floor && current_floor < N);
	   floor_request_made[dest] = false;
	   served!true;
	od;
}

// request handler process. Remodel this process to serve M elevators!
active proctype req_handler() {
	byte dest;
	do
	:: request?dest -> go!dest; served?true;
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
