	switch (t->back) {
	default: Uerror("bad return move");
	case  0: goto R999; /* nothing to undo */

		 /* CLAIM f3 */
;
		;
		
	case 4: // STATE 6
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC req_button */
;
		;
		
	case 6: // STATE 2
		;
		_m = unsend(now.request);
		;
		goto R999;

	case 7: // STATE 3
		;
		now.floor_request_made[ Index(((((P4 *)_this)->_pid-(3*3))-1), 3) ] = trpt->bup.oval;
		;
		goto R999;

	case 8: // STATE 8
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC req_handler */

	case 9: // STATE 1
		;
		XX = 1;
		unrecv(now.request, XX-1, 0, ((int)((P3 *)_this)->dest), 1);
		((P3 *)_this)->dest = trpt->bup.oval;
		;
		;
		goto R999;

	case 10: // STATE 2
		;
		((P3 *)_this)->servedArr[ Index(((P3 *)_this)->k, 3) ] = trpt->bup.oval;
		;
		goto R999;

	case 11: // STATE 3
		;
		((P3 *)_this)->goArr[ Index(((P3 *)_this)->k, 3) ] = trpt->bup.oval;
		;
		goto R999;

	case 12: // STATE 4
		;
		_m = unsend(now.go[ Index(((P3 *)_this)->k, 3) ]);
		;
		goto R999;

	case 13: // STATE 5
		;
		((P3 *)_this)->goArr[ Index(((P3 *)_this)->k, 3) ] = trpt->bup.oval;
		;
		goto R999;

	case 14: // STATE 6
		;
		XX = 1;
		unrecv(now.served[ Index(((P3 *)_this)->k, 3) ], XX-1, 0, 1, 1);
		;
		;
		goto R999;

	case 15: // STATE 7
		;
		((P3 *)_this)->servedArr[ Index(((P3 *)_this)->k, 3) ] = trpt->bup.oval;
		;
		goto R999;

	case 16: // STATE 8
		;
		((P3 *)_this)->k = trpt->bup.oval;
		;
		goto R999;

	case 17: // STATE 12
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC main_control */

	case 18: // STATE 1
		;
		now.current_floor[ Index((((P2 *)_this)->_pid-(2*3)), 3) ] = trpt->bup.oval;
		;
		goto R999;

	case 19: // STATE 2
		;
		XX = 1;
		unrecv(now.go[ Index((((int)((P2 *)_this)->_pid)-(2*3)), 3) ], XX-1, 0, ((int)((P2 *)_this)->destination), 1);
		((P2 *)_this)->destination = trpt->bup.oval;
		;
		;
		goto R999;

	case 20: // STATE 3
		;
		_m = unsend(now.update_cabin_door[ Index((((int)((P2 *)_this)->_pid)-(2*3)), 3) ]);
		;
		goto R999;

	case 21: // STATE 4
		;
		XX = 1;
		unrecv(now.cabin_door_updated[ Index((((int)((P2 *)_this)->_pid)-(2*3)), 3) ], XX-1, 0, 0, 1);
		;
		;
		goto R999;
;
		;
		
	case 23: // STATE 6
		;
		directions[ Index((((P2 *)_this)->_pid-(2*3)), 3) ] = trpt->bup.oval;
		;
		goto R999;

	case 24: // STATE 7
		;
		_m = unsend(now.move[ Index((((int)((P2 *)_this)->_pid)-(2*3)), 3) ]);
		;
		goto R999;

	case 25: // STATE 8
		;
		XX = 1;
		unrecv(now.floor_reached[ Index((((int)((P2 *)_this)->_pid)-(2*3)), 3) ], XX-1, 0, 1, 1);
		;
		;
		goto R999;

	case 26: // STATE 9
		;
		now.current_floor[ Index((((P2 *)_this)->_pid-(2*3)), 3) ] = trpt->bup.oval;
		;
		goto R999;

	case 27: // STATE 10
		;
		_m = unsend(now.move[ Index((((int)((P2 *)_this)->_pid)-(2*3)), 3) ]);
		;
		goto R999;

	case 28: // STATE 11
		;
		_m = unsend(now.update_cabin_door[ Index((((int)((P2 *)_this)->_pid)-(2*3)), 3) ]);
		;
		goto R999;

	case 29: // STATE 12
		;
		XX = 1;
		unrecv(now.cabin_door_updated[ Index((((int)((P2 *)_this)->_pid)-(2*3)), 3) ], XX-1, 0, 1, 1);
		;
		;
		goto R999;
;
		;
		
	case 31: // STATE 14
		;
		directions[ Index((((P2 *)_this)->_pid-(2*3)), 3) ] = trpt->bup.oval;
		;
		goto R999;

	case 32: // STATE 15
		;
		_m = unsend(now.move[ Index((((int)((P2 *)_this)->_pid)-(2*3)), 3) ]);
		;
		goto R999;

	case 33: // STATE 16
		;
		XX = 1;
		unrecv(now.floor_reached[ Index((((int)((P2 *)_this)->_pid)-(2*3)), 3) ], XX-1, 0, 1, 1);
		;
		;
		goto R999;

	case 34: // STATE 17
		;
		now.current_floor[ Index((((P2 *)_this)->_pid-(2*3)), 3) ] = trpt->bup.oval;
		;
		goto R999;

	case 35: // STATE 18
		;
		_m = unsend(now.move[ Index((((int)((P2 *)_this)->_pid)-(2*3)), 3) ]);
		;
		goto R999;

	case 36: // STATE 19
		;
		_m = unsend(now.update_cabin_door[ Index((((int)((P2 *)_this)->_pid)-(2*3)), 3) ]);
		;
		goto R999;

	case 37: // STATE 20
		;
		XX = 1;
		unrecv(now.cabin_door_updated[ Index((((int)((P2 *)_this)->_pid)-(2*3)), 3) ], XX-1, 0, 1, 1);
		;
		;
		goto R999;

	case 38: // STATE 22
		;
		directions[ Index((((P2 *)_this)->_pid-(2*3)), 3) ] = trpt->bup.oval;
		;
		goto R999;

	case 39: // STATE 23
		;
		_m = unsend(now.update_cabin_door[ Index((((int)((P2 *)_this)->_pid)-(2*3)), 3) ]);
		;
		goto R999;

	case 40: // STATE 24
		;
		XX = 1;
		unrecv(now.cabin_door_updated[ Index((((int)((P2 *)_this)->_pid)-(2*3)), 3) ], XX-1, 0, 1, 1);
		;
		;
		goto R999;

	case 41: // STATE 27
		;
		now.floor_request_made[ Index(((P2 *)_this)->destination, 3) ] = trpt->bup.oval;
		;
		goto R999;

	case 42: // STATE 28
		;
		_m = unsend(now.served[ Index((((int)((P2 *)_this)->_pid)-(2*3)), 3) ]);
		;
		goto R999;

	case 43: // STATE 32
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC elevator_engine */

	case 44: // STATE 1
		;
		XX = 1;
		unrecv(now.move[ Index((((int)((P1 *)_this)->_pid)-3), 3) ], XX-1, 0, 1, 1);
		;
		;
		goto R999;

	case 45: // STATE 2
		;
		XX = 1;
		unrecv(now.move[ Index((((int)((P1 *)_this)->_pid)-3), 3) ], XX-1, 0, 0, 1);
		;
		;
		goto R999;

	case 46: // STATE 4
		;
		_m = unsend(now.floor_reached[ Index((((int)((P1 *)_this)->_pid)-3), 3) ]);
		;
		goto R999;

	case 47: // STATE 11
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC cabin_door */
;
		;
		
	case 49: // STATE 2
		;
		XX = 1;
		unrecv(now.update_cabin_door[ Index(((int)((P0 *)_this)->_pid), 3) ], XX-1, 0, 1, 1);
		;
		;
		goto R999;

	case 50: // STATE 3
		;
		now.floor_door_is_open[ Index(((P0 *)_this)->_pid, 3) ].shaft[ Index(now.current_floor[ Index(((P0 *)_this)->_pid, 3) ], 3) ] = trpt->bup.oval;
		;
		goto R999;

	case 51: // STATE 4
		;
		cabin_door_is_open[ Index(((P0 *)_this)->_pid, 3) ] = trpt->bup.oval;
		;
		goto R999;

	case 52: // STATE 5
		;
		_m = unsend(now.cabin_door_updated[ Index(((int)((P0 *)_this)->_pid), 3) ]);
		;
		goto R999;

	case 53: // STATE 6
		;
		XX = 1;
		unrecv(now.update_cabin_door[ Index(((int)((P0 *)_this)->_pid), 3) ], XX-1, 0, 0, 1);
		;
		;
		goto R999;

	case 54: // STATE 7
		;
		cabin_door_is_open[ Index(((P0 *)_this)->_pid, 3) ] = trpt->bup.oval;
		;
		goto R999;

	case 55: // STATE 8
		;
		now.floor_door_is_open[ Index(((P0 *)_this)->_pid, 3) ].shaft[ Index(now.current_floor[ Index(((P0 *)_this)->_pid, 3) ], 3) ] = trpt->bup.oval;
		;
		goto R999;

	case 56: // STATE 9
		;
		_m = unsend(now.cabin_door_updated[ Index(((int)((P0 *)_this)->_pid), 3) ]);
		;
		goto R999;

	case 57: // STATE 13
		;
		p_restor(II);
		;
		;
		goto R999;
	}

