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
		now.floor_request_made[ Index((((P4 *)_this)->_pid-4), 4) ] = trpt->bup.oval;
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
		_m = unsend(now.go);
		;
		goto R999;

	case 9: // STATE 3
		;
		XX = 1;
		unrecv(now.served, XX-1, 0, 1, 1);
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
		now.current_floor = trpt->bup.oval;
		;
		goto R999;

	case 12: // STATE 2
		;
		XX = 1;
		unrecv(now.go, XX-1, 0, ((int)((P2 *)_this)->dest), 1);
		((P2 *)_this)->dest = trpt->bup.oval;
		;
		;
		goto R999;

	case 13: // STATE 3
		;
		_m = unsend(now.update_cabin_door);
		;
		goto R999;

	case 14: // STATE 4
		;
		XX = 1;
		unrecv(now.cabin_door_updated, XX-1, 0, 0, 1);
		;
		;
		goto R999;
;
		;
		
	case 16: // STATE 6
		;
		direction = trpt->bup.oval;
		;
		goto R999;

	case 17: // STATE 7
		;
		_m = unsend(now.move);
		;
		goto R999;

	case 18: // STATE 8
		;
		XX = 1;
		unrecv(now.floor_reached, XX-1, 0, 1, 1);
		;
		;
		goto R999;

	case 19: // STATE 9
		;
		now.current_floor = trpt->bup.oval;
		;
		goto R999;

	case 20: // STATE 10
		;
		_m = unsend(now.move);
		;
		goto R999;

	case 21: // STATE 11
		;
		_m = unsend(now.update_cabin_door);
		;
		goto R999;

	case 22: // STATE 12
		;
		XX = 1;
		unrecv(now.cabin_door_updated, XX-1, 0, 1, 1);
		;
		;
		goto R999;
;
		;
		
	case 24: // STATE 14
		;
		direction = trpt->bup.oval;
		;
		goto R999;

	case 25: // STATE 15
		;
		_m = unsend(now.move);
		;
		goto R999;

	case 26: // STATE 16
		;
		XX = 1;
		unrecv(now.floor_reached, XX-1, 0, 1, 1);
		;
		;
		goto R999;

	case 27: // STATE 17
		;
		now.current_floor = trpt->bup.oval;
		;
		goto R999;

	case 28: // STATE 18
		;
		_m = unsend(now.move);
		;
		goto R999;

	case 29: // STATE 19
		;
		_m = unsend(now.update_cabin_door);
		;
		goto R999;

	case 30: // STATE 20
		;
		XX = 1;
		unrecv(now.cabin_door_updated, XX-1, 0, 1, 1);
		;
		;
		goto R999;

	case 31: // STATE 22
		;
		direction = trpt->bup.oval;
		;
		goto R999;

	case 32: // STATE 23
		;
		_m = unsend(now.update_cabin_door);
		;
		goto R999;

	case 33: // STATE 24
		;
		XX = 1;
		unrecv(now.cabin_door_updated, XX-1, 0, 1, 1);
		;
		;
		goto R999;
;
		;
		
	case 35: // STATE 28
		;
		now.floor_request_made[ Index(((P2 *)_this)->dest, 4) ] = trpt->bup.oval;
		;
		goto R999;

	case 36: // STATE 29
		;
		_m = unsend(now.served);
		;
		goto R999;

	case 37: // STATE 33
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC elevator_engine */

	case 38: // STATE 1
		;
		XX = 1;
		unrecv(now.move, XX-1, 0, 1, 1);
		;
		;
		goto R999;

	case 39: // STATE 2
		;
		XX = 1;
		unrecv(now.move, XX-1, 0, 0, 1);
		;
		;
		goto R999;

	case 40: // STATE 4
		;
		_m = unsend(now.floor_reached);
		;
		goto R999;

	case 41: // STATE 11
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC cabin_door */

	case 42: // STATE 1
		;
		XX = 1;
		unrecv(now.update_cabin_door, XX-1, 0, 1, 1);
		;
		;
		goto R999;

	case 43: // STATE 2
		;
		floor_door_is_open[ Index(now.current_floor, 4) ] = trpt->bup.oval;
		;
		goto R999;

	case 44: // STATE 3
		;
		cabin_door_is_open = trpt->bup.oval;
		;
		goto R999;

	case 45: // STATE 4
		;
		_m = unsend(now.cabin_door_updated);
		;
		goto R999;

	case 46: // STATE 5
		;
		XX = 1;
		unrecv(now.update_cabin_door, XX-1, 0, 0, 1);
		;
		;
		goto R999;

	case 47: // STATE 6
		;
		cabin_door_is_open = trpt->bup.oval;
		;
		goto R999;

	case 48: // STATE 7
		;
		floor_door_is_open[ Index(now.current_floor, 4) ] = trpt->bup.oval;
		;
		goto R999;

	case 49: // STATE 8
		;
		_m = unsend(now.cabin_door_updated);
		;
		goto R999;

	case 50: // STATE 12
		;
		p_restor(II);
		;
		;
		goto R999;
	}

