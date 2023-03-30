	switch (t->back) {
	default: Uerror("bad return move");
	case  0: goto R999; /* nothing to undo */

		 /* PROC req_button */
;
		;
		
	case 4: // STATE 2
		;
		_m = unsend(now.request);
		;
		goto R999;

	case 5: // STATE 3
		;
		now.floor_request_made[ Index((((P4 *)_this)->_pid-(4*3)), 3) ] = trpt->bup.oval;
		;
		goto R999;

	case 6: // STATE 8
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC req_handler */

	case 7: // STATE 1
		;
		XX = 1;
		unrecv(now.request, XX-1, 0, ((int)((P3 *)_this)->dest), 1);
		((P3 *)_this)->dest = trpt->bup.oval;
		;
		;
		goto R999;

	case 8: // STATE 2
		;
		_m = unsend(now.go[ Index((((int)((P3 *)_this)->_pid)-(3*3)), 3) ]);
		;
		goto R999;

	case 9: // STATE 3
		;
		XX = 1;
		unrecv(now.served[ Index((((int)((P3 *)_this)->_pid)-(3*3)), 3) ], XX-1, 0, 1, 1);
		;
		;
		goto R999;

	case 10: // STATE 7
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC main_control */

	case 11: // STATE 1
		;
		XX = 1;
		unrecv(now.go[ Index((((int)((P2 *)_this)->_pid)-(2*3)), 3) ], XX-1, 0, ((int)((P2 *)_this)->dest), 1);
		((P2 *)_this)->dest = trpt->bup.oval;
		;
		;
		goto R999;

	case 12: // STATE 2
		;
		_m = unsend(now.update_cabin_door[ Index((((int)((P2 *)_this)->_pid)-(2*3)), 3) ]);
		;
		goto R999;

	case 13: // STATE 3
		;
		XX = 1;
		unrecv(now.cabin_door_updated[ Index((((int)((P2 *)_this)->_pid)-(2*3)), 3) ], XX-1, 0, 0, 1);
		;
		;
		goto R999;
;
		;
		
	case 15: // STATE 5
		;
		((P2 *)_this)->direction = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 16: // STATE 6
		;
		_m = unsend(now.move[ Index((((int)((P2 *)_this)->_pid)-(2*3)), 3) ]);
		;
		goto R999;

	case 17: // STATE 7
		;
		XX = 1;
		unrecv(now.floor_reached[ Index((((int)((P2 *)_this)->_pid)-(2*3)), 3) ], XX-1, 0, 1, 1);
		;
		;
		goto R999;

	case 18: // STATE 8
		;
		now.current_floor[ Index((((P2 *)_this)->_pid-(2*3)), 3) ] = trpt->bup.oval;
		;
		goto R999;

	case 19: // STATE 9
		;
		_m = unsend(now.move[ Index((((int)((P2 *)_this)->_pid)-(2*3)), 3) ]);
		;
		goto R999;

	case 20: // STATE 10
		;
		_m = unsend(now.update_cabin_door[ Index((((int)((P2 *)_this)->_pid)-(2*3)), 3) ]);
		;
		goto R999;

	case 21: // STATE 11
		;
		XX = 1;
		unrecv(now.cabin_door_updated[ Index((((int)((P2 *)_this)->_pid)-(2*3)), 3) ], XX-1, 0, 1, 1);
		;
		;
		goto R999;
;
		;
		
	case 23: // STATE 13
		;
		((P2 *)_this)->direction = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 24: // STATE 14
		;
		_m = unsend(now.move[ Index((((int)((P2 *)_this)->_pid)-(2*3)), 3) ]);
		;
		goto R999;

	case 25: // STATE 15
		;
		XX = 1;
		unrecv(now.floor_reached[ Index((((int)((P2 *)_this)->_pid)-(2*3)), 3) ], XX-1, 0, 1, 1);
		;
		;
		goto R999;

	case 26: // STATE 16
		;
		now.current_floor[ Index((((P2 *)_this)->_pid-(2*3)), 3) ] = trpt->bup.oval;
		;
		goto R999;

	case 27: // STATE 17
		;
		_m = unsend(now.move[ Index((((int)((P2 *)_this)->_pid)-(2*3)), 3) ]);
		;
		goto R999;

	case 28: // STATE 18
		;
		_m = unsend(now.update_cabin_door[ Index((((int)((P2 *)_this)->_pid)-(2*3)), 3) ]);
		;
		goto R999;

	case 29: // STATE 19
		;
		XX = 1;
		unrecv(now.cabin_door_updated[ Index((((int)((P2 *)_this)->_pid)-(2*3)), 3) ], XX-1, 0, 1, 1);
		;
		;
		goto R999;

	case 30: // STATE 21
		;
		((P2 *)_this)->direction = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 31: // STATE 22
		;
		_m = unsend(now.update_cabin_door[ Index((((int)((P2 *)_this)->_pid)-(2*3)), 3) ]);
		;
		goto R999;

	case 32: // STATE 23
		;
		XX = 1;
		unrecv(now.cabin_door_updated[ Index((((int)((P2 *)_this)->_pid)-(2*3)), 3) ], XX-1, 0, 1, 1);
		;
		;
		goto R999;
;
		;
		
	case 34: // STATE 27
		;
		now.floor_request_made[ Index(((P2 *)_this)->dest, 3) ] = trpt->bup.oval;
		;
		goto R999;

	case 35: // STATE 28
		;
		_m = unsend(now.served[ Index((((int)((P2 *)_this)->_pid)-(2*3)), 3) ]);
		;
		goto R999;

	case 36: // STATE 32
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC elevator_engine */

	case 37: // STATE 1
		;
		XX = 1;
		unrecv(now.move[ Index((((int)((P1 *)_this)->_pid)-3), 3) ], XX-1, 0, 1, 1);
		;
		;
		goto R999;

	case 38: // STATE 2
		;
		XX = 1;
		unrecv(now.move[ Index((((int)((P1 *)_this)->_pid)-3), 3) ], XX-1, 0, 0, 1);
		;
		;
		goto R999;

	case 39: // STATE 4
		;
		_m = unsend(now.floor_reached[ Index((((int)((P1 *)_this)->_pid)-3), 3) ]);
		;
		goto R999;

	case 40: // STATE 11
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC cabin_door */

	case 41: // STATE 1
		;
		XX = 1;
		unrecv(now.update_cabin_door[ Index(((int)((P0 *)_this)->_pid), 3) ], XX-1, 0, 1, 1);
		;
		;
		goto R999;

	case 42: // STATE 2
		;
		now.floor_door_is_open[ Index(now.current_floor[ Index(((P0 *)_this)->_pid, 3) ], 3) ].shaft[ Index(((P0 *)_this)->_pid, 3) ] = trpt->bup.oval;
		;
		goto R999;

	case 43: // STATE 3
		;
		cabin_door_is_open[ Index(((P0 *)_this)->_pid, 3) ] = trpt->bup.oval;
		;
		goto R999;

	case 44: // STATE 4
		;
		_m = unsend(now.cabin_door_updated[ Index(((int)((P0 *)_this)->_pid), 3) ]);
		;
		goto R999;

	case 45: // STATE 5
		;
		XX = 1;
		unrecv(now.update_cabin_door[ Index(((int)((P0 *)_this)->_pid), 3) ], XX-1, 0, 0, 1);
		;
		;
		goto R999;

	case 46: // STATE 6
		;
		cabin_door_is_open[ Index(((P0 *)_this)->_pid, 3) ] = trpt->bup.oval;
		;
		goto R999;

	case 47: // STATE 7
		;
		now.floor_door_is_open[ Index(now.current_floor[ Index(((P0 *)_this)->_pid, 3) ], 3) ].shaft[ Index(((P0 *)_this)->_pid, 3) ] = trpt->bup.oval;
		;
		goto R999;

	case 48: // STATE 8
		;
		_m = unsend(now.cabin_door_updated[ Index(((int)((P0 *)_this)->_pid), 3) ]);
		;
		goto R999;

	case 49: // STATE 12
		;
		p_restor(II);
		;
		;
		goto R999;
	}

