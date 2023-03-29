/*
	Elevator template model for Assignment 2 of 2IX20 - Software Specification.
	Set up for one elevator and two floors.
*/

//Soft ass assignment, wijfje
//Don't lose your mind wife everything will be okay
//Thank you schatje i will try my best but i think its already too late the damage is done theres nothing we can do the world is ending

// LTL formulas to be verified
// ltl a1 { [] (floor_request_made[1] -> (<> (current_floor == 1)))}
// ltl a2 { [] (floor_request_made[2] -> (<> (current_floor == 2)))}
// ltl b1 {[]<> (cabin_door_is_open==true)}
// ltl b2 {[]<> (cabin_door_is_open==false)}
// ltl c {cabin_door_is_open == true -> floor_door_is_open[current_floor] == true}

// the number of floors
#define N 3

// the number of elevators
#define M 3

// IDs of req_button processes
#define reqid _pid-4*M
#define cabin_door_id _pid - M
#define elevator_engine_id _pid - 2*M
#define main_control_id _pid - 3*M

// type for direction of elevator
mtype { down, up, none }; // i want this to be a variable

// asynchronous channel to handle passenger requestsg
chan request = [N] of { byte }; 

// status of requests per floor
bool floor_request_made[N];

// status of floor doors of the shaft of the single elevator
typedef shafts {
    bool shaft[N];
};
//array containing M shafts
shafts floor_door_is_open[M]; 

// status and synchronous channels for elevator cabin and engine
byte current_floor[M];
bool cabin_door_is_open[M]; // check if elevator M's doors are open

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
	:: update_cabin_door[M]?true -> floor_door_is_open[current_floor[N]].shaft[M] = true; cabin_door_is_open[M] = true; cabin_door_updated[M]!true;
	:: update_cabin_door[M]?false -> cabin_door_is_open[M] = false; floor_door_is_open[current_floor[N]].shaft[M] = false; cabin_door_updated[M]!false;
	od;
}

// process combining the elevator engine and sensors
active[M] proctype elevator_engine() {
	do
	:: move[M]?true ->
		do
		:: move[M]?false -> break;
		:: floor_reached[M]!true;
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
	:: go[M]?dest ->
		update_cabin_door[M]!false; // The door will close no matter the destination upon receiving a request
		cabin_door_updated[M]?false;
		if
		:: dest > current_floor[M] -> // Case where destination is above the current floor
			direction = up; // The elevator will be moving upwards
			move[M]!true;
			floor_reached[M]?true; 
			current_floor[M] = dest; // Update current floor
			move[M]!false;
			update_cabin_door[M]!true; 
			cabin_door_updated[M]?true;
		:: dest < current_floor[M] -> // Case where destination is below the current floor
			direction = down; // The elevator will be moving downwards
			move[M]!true;
			floor_reached[M]?true;
			current_floor[M] = dest; // Update current floor
			move[M]!false;
			update_cabin_door[M]!true;
			cabin_door_updated[M]?true;
		:: else -> // Case where destination is on the current floor
			direction = none; // Elevator does not move
			update_cabin_door[M]!true;
			cabin_door_updated[M]?true;
		fi

	   // an example assertion.
	   assert(0 <= current_floor[M] && current_floor[M] < N);
//		assert(0 <= dest && dest <N);

	   floor_request_made[dest] = false;
	   served[M]!true;
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
	byte elevator = 0
   	do
	:: 	elevator < M ->
    	request?dest -> go[M]!dest; served[M]?true;
		M++;
	::	else -> break;
    // ::  if 
    //     :: current_floor[M] > currentRequest;
    //         move[M]?true ->
    //         go!dest; served?true;
    //     :: current_floor[M] < currentRequest;
    //         move[M]?true ->
    //         go!dest; served? true;
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
