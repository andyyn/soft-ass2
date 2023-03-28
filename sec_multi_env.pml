/*
	Elevator template model for Assignment 2 of 2IX20 - Software Specification.
	Set up for one elevator and two floors.
*/

//Soft ass assignment, wijfje
//Don't lose your mind wife everything will be okay
//Thank you schatje i will try my best but i think its already too late the damage is done theres nothing we can do the world is ending

// LTL formulas to be verified
ltl a1 { [] (floor_request_made[1] -> (<> (current_floor == 1)))}
ltl a2 { [] (floor_request_made[2] -> (<> (current_floor == 2)))}
ltl b1 {[]<> (cabin_door_is_open==true)}
ltl b2 {[]<> (cabin_door_is_open==false)}
ltl c {cabin_door_is_open == true -> floor_door_is_open[current_floor] == true}

// the number of floors
#define N 4

// IDs of req_button processes
#define reqid _pid-4

// type for direction of elevator
mtype { down, up, none }; // i want this to be a variable

// asynchronous channel to handle passenger requestsg
chan request = [N] of { byte }; 

// status of requests per floor
bool floor_request_made[N];

// status of floor doors of the shaft of the single elevator
typedef shaft {
    bool shaft[N];
};
//array containing M shafts
shaft floor_door_is_open[M]; 

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

// cabin door process
active[M] proctype cabin_door() { 
	do
	:: update_cabin_door?true -> floor_door_is_open[current_floor] = true; cabin_door_is_open = true; cabin_door_updated!true;
	:: update_cabin_door?false -> cabin_door_is_open = false; floor_door_is_open[current_floor] = false; cabin_door_updated!false;
	od;
}

// process combining the elevator engine and sensors
active[M] proctype elevator_engine() {
	do
	:: move?true ->
		do
		:: move?false -> break;
		:: floor_reached!true;
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
	byte dest;
	mtype direction; //current direction of the elevator
	do
	:: go?dest ->
		update_cabin_door!false; // The door will close no matter the destination upon receiving a request
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
//		assert(0 <= dest && dest <N);

	   floor_request_made[dest] = false;
	   served!true;
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
// See the request queue, check elevator status
// If elevator cabin is going up and requested floor is above current floor, assign person to this elevator
// If elevator cabin is going down and requested floor is below current floor
// Else it waits until an elevator is available
active proctype req_handler() {
	byte dest;
   	do
    ::  byte currentRequest = request?dest;
    ::  if 
        :: current_floor[M] > currentRequest;
            move[M]?true ->
            go!dest; served?true;
        :: current_floor[M] < currentRequest;
            move[M]?true ->
            go!dest; served? true;
	od;
}

// request button associated to a floor i to request an elevator
// how many times should this be instantiated?
active [N*M] proctype req_button() {
	do
	:: !floor_request_made[reqid] ->
	   atomic {
		request!reqid;
		floor_request_made[reqid] = true;
	   }
	od;
}
