#define rand	pan_rand
#define pthread_equal(a,b)	((a)==(b))
#if defined(HAS_CODE) && defined(VERBOSE)
	#ifdef BFS_PAR
		bfs_printf("Pr: %d Tr: %d\n", II, t->forw);
	#else
		cpu_printf("Pr: %d Tr: %d\n", II, t->forw);
	#endif
#endif
	switch (t->forw) {
	default: Uerror("bad forward move");
	case 0:	/* if without executable clauses */
		continue;
	case 1: /* generic 'goto' or 'skip' */
		IfNotBlocked
		_m = 3; goto P999;
	case 2: /* generic 'else' */
		IfNotBlocked
		if (trpt->o_pm&1) continue;
		_m = 3; goto P999;

		 /* PROC req_button */
	case 3: // STATE 1 - sec_multi_env.pml:155 - [(!(floor_request_made[(_pid-(4*3))]))] (0:0:0 - 1)
		IfNotBlocked
		reached[4][1] = 1;
		if (!( !(((int)now.floor_request_made[ Index((((int)((P4 *)_this)->_pid)-(4*3)), 3) ]))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 4: // STATE 2 - sec_multi_env.pml:157 - [request!(_pid-(4*3))] (0:0:0 - 1)
		IfNotBlocked
		reached[4][2] = 1;
		if (q_full(now.request))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.request);
		sprintf(simtmp, "%d", (((int)((P4 *)_this)->_pid)-(4*3))); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.request, 0, (((int)((P4 *)_this)->_pid)-(4*3)), 1);
		if (q_zero(now.request)) { boq = now.request; };
		_m = 2; goto P999; /* 0 */
	case 5: // STATE 3 - sec_multi_env.pml:158 - [floor_request_made[(_pid-(4*3))] = 1] (0:0:1 - 1)
		IfNotBlocked
		reached[4][3] = 1;
		(trpt+1)->bup.oval = ((int)now.floor_request_made[ Index((((int)((P4 *)_this)->_pid)-(4*3)), 3) ]);
		now.floor_request_made[ Index((((P4 *)_this)->_pid-(4*3)), 3) ] = 1;
#ifdef VAR_RANGES
		logval("floor_request_made[(_pid-(4*3))]", ((int)now.floor_request_made[ Index((((int)((P4 *)_this)->_pid)-(4*3)), 3) ]));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 6: // STATE 8 - sec_multi_env.pml:161 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[4][8] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC req_handler */
	case 7: // STATE 1 - sec_multi_env.pml:146 - [request?dest] (0:0:1 - 1)
		reached[3][1] = 1;
		if (q_zero(now.request))
		{	if (boq != now.request) continue;
		} else
		{	if (boq != -1) continue;
		}
		if (q_len(now.request) == 0) continue;

		XX=1;
		(trpt+1)->bup.oval = ((int)((P3 *)_this)->dest);
		;
		((P3 *)_this)->dest = qrecv(now.request, XX-1, 0, 1);
#ifdef VAR_RANGES
		logval("req_handler:dest", ((int)((P3 *)_this)->dest));
#endif
		;
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.request);
			sprintf(simtmp, "%d", ((int)((P3 *)_this)->dest)); strcat(simvals, simtmp);
		}
#endif
		if (q_zero(now.request))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3ld: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 8: // STATE 2 - sec_multi_env.pml:146 - [go[(_pid-(3*3))]!dest] (0:0:0 - 1)
		IfNotBlocked
		reached[3][2] = 1;
		if (q_full(now.go[ Index((((int)((P3 *)_this)->_pid)-(3*3)), 3) ]))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.go[ Index((((int)((P3 *)_this)->_pid)-(3*3)), 3) ]);
		sprintf(simtmp, "%d", ((int)((P3 *)_this)->dest)); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.go[ Index((((int)((P3 *)_this)->_pid)-(3*3)), 3) ], 0, ((int)((P3 *)_this)->dest), 1);
		if (q_zero(now.go[ Index((((int)((P3 *)_this)->_pid)-(3*3)), 3) ])) { boq = now.go[ Index((((int)((P3 *)_this)->_pid)-(3*3)), 3) ]; };
		_m = 2; goto P999; /* 0 */
	case 9: // STATE 3 - sec_multi_env.pml:146 - [served[(_pid-(3*3))]?1] (0:0:0 - 1)
		reached[3][3] = 1;
		if (q_zero(now.served[ Index((((int)((P3 *)_this)->_pid)-(3*3)), 3) ]))
		{	if (boq != now.served[ Index((((int)((P3 *)_this)->_pid)-(3*3)), 3) ]) continue;
		} else
		{	if (boq != -1) continue;
		}
		if (q_len(now.served[ Index((((int)((P3 *)_this)->_pid)-(3*3)), 3) ]) == 0) continue;

		XX=1;
		if (1 != qrecv(now.served[ Index((((int)((P3 *)_this)->_pid)-(3*3)), 3) ], 0, 0, 0)) continue;
		
#ifndef BFS_PAR
		if (q_flds[((Q0 *)qptr(now.served[ Index((((int)((P3 *)_this)->_pid)-(3*3)), 3) ]-1))->_t] != 1)
			Uerror("wrong nr of msg fields in rcv");
#endif
		;
		qrecv(now.served[ Index((((int)((P3 *)_this)->_pid)-(3*3)), 3) ], XX-1, 0, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.served[ Index((((int)((P3 *)_this)->_pid)-(3*3)), 3) ]);
			sprintf(simtmp, "%d", 1); strcat(simvals, simtmp);
		}
#endif
		if (q_zero(now.served[ Index((((int)((P3 *)_this)->_pid)-(3*3)), 3) ]))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3ld: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 10: // STATE 7 - sec_multi_env.pml:148 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[3][7] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC main_control */
	case 11: // STATE 1 - sec_multi_env.pml:93 - [go[(_pid-(2*3))]?dest] (0:0:1 - 1)
		reached[2][1] = 1;
		if (q_zero(now.go[ Index((((int)((P2 *)_this)->_pid)-(2*3)), 3) ]))
		{	if (boq != now.go[ Index((((int)((P2 *)_this)->_pid)-(2*3)), 3) ]) continue;
		} else
		{	if (boq != -1) continue;
		}
		if (q_len(now.go[ Index((((int)((P2 *)_this)->_pid)-(2*3)), 3) ]) == 0) continue;

		XX=1;
		(trpt+1)->bup.oval = ((int)((P2 *)_this)->dest);
		;
		((P2 *)_this)->dest = qrecv(now.go[ Index((((int)((P2 *)_this)->_pid)-(2*3)), 3) ], XX-1, 0, 1);
#ifdef VAR_RANGES
		logval("main_control:dest", ((int)((P2 *)_this)->dest));
#endif
		;
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.go[ Index((((int)((P2 *)_this)->_pid)-(2*3)), 3) ]);
			sprintf(simtmp, "%d", ((int)((P2 *)_this)->dest)); strcat(simvals, simtmp);
		}
#endif
		if (q_zero(now.go[ Index((((int)((P2 *)_this)->_pid)-(2*3)), 3) ]))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3ld: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 12: // STATE 2 - sec_multi_env.pml:94 - [update_cabin_door[(_pid-(2*3))]!0] (0:0:0 - 1)
		IfNotBlocked
		reached[2][2] = 1;
		if (q_full(now.update_cabin_door[ Index((((int)((P2 *)_this)->_pid)-(2*3)), 3) ]))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.update_cabin_door[ Index((((int)((P2 *)_this)->_pid)-(2*3)), 3) ]);
		sprintf(simtmp, "%d", 0); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.update_cabin_door[ Index((((int)((P2 *)_this)->_pid)-(2*3)), 3) ], 0, 0, 1);
		if (q_zero(now.update_cabin_door[ Index((((int)((P2 *)_this)->_pid)-(2*3)), 3) ])) { boq = now.update_cabin_door[ Index((((int)((P2 *)_this)->_pid)-(2*3)), 3) ]; };
		_m = 2; goto P999; /* 0 */
	case 13: // STATE 3 - sec_multi_env.pml:95 - [cabin_door_updated[(_pid-(2*3))]?0] (0:0:0 - 1)
		reached[2][3] = 1;
		if (q_zero(now.cabin_door_updated[ Index((((int)((P2 *)_this)->_pid)-(2*3)), 3) ]))
		{	if (boq != now.cabin_door_updated[ Index((((int)((P2 *)_this)->_pid)-(2*3)), 3) ]) continue;
		} else
		{	if (boq != -1) continue;
		}
		if (q_len(now.cabin_door_updated[ Index((((int)((P2 *)_this)->_pid)-(2*3)), 3) ]) == 0) continue;

		XX=1;
		if (0 != qrecv(now.cabin_door_updated[ Index((((int)((P2 *)_this)->_pid)-(2*3)), 3) ], 0, 0, 0)) continue;
		
#ifndef BFS_PAR
		if (q_flds[((Q0 *)qptr(now.cabin_door_updated[ Index((((int)((P2 *)_this)->_pid)-(2*3)), 3) ]-1))->_t] != 1)
			Uerror("wrong nr of msg fields in rcv");
#endif
		;
		qrecv(now.cabin_door_updated[ Index((((int)((P2 *)_this)->_pid)-(2*3)), 3) ], XX-1, 0, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.cabin_door_updated[ Index((((int)((P2 *)_this)->_pid)-(2*3)), 3) ]);
			sprintf(simtmp, "%d", 0); strcat(simvals, simtmp);
		}
#endif
		if (q_zero(now.cabin_door_updated[ Index((((int)((P2 *)_this)->_pid)-(2*3)), 3) ]))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3ld: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 14: // STATE 4 - sec_multi_env.pml:97 - [((dest>current_floor[(_pid-(2*3))]))] (0:0:0 - 1)
		IfNotBlocked
		reached[2][4] = 1;
		if (!((((int)((P2 *)_this)->dest)>((int)now.current_floor[ Index((((int)((P2 *)_this)->_pid)-(2*3)), 3) ]))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 15: // STATE 5 - sec_multi_env.pml:98 - [direction = up] (0:0:2 - 1)
		IfNotBlocked
		reached[2][5] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((P2 *)_this)->direction;
		((P2 *)_this)->direction = 2;
#ifdef VAR_RANGES
		logval("main_control:direction", ((P2 *)_this)->direction);
#endif
		;
		if (TstOnly) return 1; /* TT */
		/* dead 2: direction */  
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P2 *)_this)->direction = 0;
		_m = 3; goto P999; /* 0 */
	case 16: // STATE 6 - sec_multi_env.pml:99 - [move[(_pid-(2*3))]!1] (0:0:0 - 1)
		IfNotBlocked
		reached[2][6] = 1;
		if (q_full(now.move[ Index((((int)((P2 *)_this)->_pid)-(2*3)), 3) ]))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.move[ Index((((int)((P2 *)_this)->_pid)-(2*3)), 3) ]);
		sprintf(simtmp, "%d", 1); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.move[ Index((((int)((P2 *)_this)->_pid)-(2*3)), 3) ], 0, 1, 1);
		if (q_zero(now.move[ Index((((int)((P2 *)_this)->_pid)-(2*3)), 3) ])) { boq = now.move[ Index((((int)((P2 *)_this)->_pid)-(2*3)), 3) ]; };
		_m = 2; goto P999; /* 0 */
	case 17: // STATE 7 - sec_multi_env.pml:100 - [floor_reached[(_pid-(2*3))]?1] (0:0:0 - 1)
		reached[2][7] = 1;
		if (q_zero(now.floor_reached[ Index((((int)((P2 *)_this)->_pid)-(2*3)), 3) ]))
		{	if (boq != now.floor_reached[ Index((((int)((P2 *)_this)->_pid)-(2*3)), 3) ]) continue;
		} else
		{	if (boq != -1) continue;
		}
		if (q_len(now.floor_reached[ Index((((int)((P2 *)_this)->_pid)-(2*3)), 3) ]) == 0) continue;

		XX=1;
		if (1 != qrecv(now.floor_reached[ Index((((int)((P2 *)_this)->_pid)-(2*3)), 3) ], 0, 0, 0)) continue;
		
#ifndef BFS_PAR
		if (q_flds[((Q0 *)qptr(now.floor_reached[ Index((((int)((P2 *)_this)->_pid)-(2*3)), 3) ]-1))->_t] != 1)
			Uerror("wrong nr of msg fields in rcv");
#endif
		;
		qrecv(now.floor_reached[ Index((((int)((P2 *)_this)->_pid)-(2*3)), 3) ], XX-1, 0, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.floor_reached[ Index((((int)((P2 *)_this)->_pid)-(2*3)), 3) ]);
			sprintf(simtmp, "%d", 1); strcat(simvals, simtmp);
		}
#endif
		if (q_zero(now.floor_reached[ Index((((int)((P2 *)_this)->_pid)-(2*3)), 3) ]))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3ld: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 18: // STATE 8 - sec_multi_env.pml:101 - [current_floor[(_pid-(2*3))] = dest] (0:0:1 - 1)
		IfNotBlocked
		reached[2][8] = 1;
		(trpt+1)->bup.oval = ((int)now.current_floor[ Index((((int)((P2 *)_this)->_pid)-(2*3)), 3) ]);
		now.current_floor[ Index((((P2 *)_this)->_pid-(2*3)), 3) ] = ((int)((P2 *)_this)->dest);
#ifdef VAR_RANGES
		logval("current_floor[(_pid-(2*3))]", ((int)now.current_floor[ Index((((int)((P2 *)_this)->_pid)-(2*3)), 3) ]));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 19: // STATE 9 - sec_multi_env.pml:102 - [move[(_pid-(2*3))]!0] (0:0:0 - 1)
		IfNotBlocked
		reached[2][9] = 1;
		if (q_full(now.move[ Index((((int)((P2 *)_this)->_pid)-(2*3)), 3) ]))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.move[ Index((((int)((P2 *)_this)->_pid)-(2*3)), 3) ]);
		sprintf(simtmp, "%d", 0); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.move[ Index((((int)((P2 *)_this)->_pid)-(2*3)), 3) ], 0, 0, 1);
		if (q_zero(now.move[ Index((((int)((P2 *)_this)->_pid)-(2*3)), 3) ])) { boq = now.move[ Index((((int)((P2 *)_this)->_pid)-(2*3)), 3) ]; };
		_m = 2; goto P999; /* 0 */
	case 20: // STATE 10 - sec_multi_env.pml:103 - [update_cabin_door[(_pid-(2*3))]!1] (0:0:0 - 1)
		IfNotBlocked
		reached[2][10] = 1;
		if (q_full(now.update_cabin_door[ Index((((int)((P2 *)_this)->_pid)-(2*3)), 3) ]))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.update_cabin_door[ Index((((int)((P2 *)_this)->_pid)-(2*3)), 3) ]);
		sprintf(simtmp, "%d", 1); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.update_cabin_door[ Index((((int)((P2 *)_this)->_pid)-(2*3)), 3) ], 0, 1, 1);
		if (q_zero(now.update_cabin_door[ Index((((int)((P2 *)_this)->_pid)-(2*3)), 3) ])) { boq = now.update_cabin_door[ Index((((int)((P2 *)_this)->_pid)-(2*3)), 3) ]; };
		_m = 2; goto P999; /* 0 */
	case 21: // STATE 11 - sec_multi_env.pml:104 - [cabin_door_updated[(_pid-(2*3))]?1] (0:0:0 - 1)
		reached[2][11] = 1;
		if (q_zero(now.cabin_door_updated[ Index((((int)((P2 *)_this)->_pid)-(2*3)), 3) ]))
		{	if (boq != now.cabin_door_updated[ Index((((int)((P2 *)_this)->_pid)-(2*3)), 3) ]) continue;
		} else
		{	if (boq != -1) continue;
		}
		if (q_len(now.cabin_door_updated[ Index((((int)((P2 *)_this)->_pid)-(2*3)), 3) ]) == 0) continue;

		XX=1;
		if (1 != qrecv(now.cabin_door_updated[ Index((((int)((P2 *)_this)->_pid)-(2*3)), 3) ], 0, 0, 0)) continue;
		
#ifndef BFS_PAR
		if (q_flds[((Q0 *)qptr(now.cabin_door_updated[ Index((((int)((P2 *)_this)->_pid)-(2*3)), 3) ]-1))->_t] != 1)
			Uerror("wrong nr of msg fields in rcv");
#endif
		;
		qrecv(now.cabin_door_updated[ Index((((int)((P2 *)_this)->_pid)-(2*3)), 3) ], XX-1, 0, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.cabin_door_updated[ Index((((int)((P2 *)_this)->_pid)-(2*3)), 3) ]);
			sprintf(simtmp, "%d", 1); strcat(simvals, simtmp);
		}
#endif
		if (q_zero(now.cabin_door_updated[ Index((((int)((P2 *)_this)->_pid)-(2*3)), 3) ]))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3ld: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 22: // STATE 12 - sec_multi_env.pml:105 - [((dest<current_floor[(_pid-(2*3))]))] (0:0:0 - 1)
		IfNotBlocked
		reached[2][12] = 1;
		if (!((((int)((P2 *)_this)->dest)<((int)now.current_floor[ Index((((int)((P2 *)_this)->_pid)-(2*3)), 3) ]))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 23: // STATE 13 - sec_multi_env.pml:106 - [direction = down] (0:0:2 - 1)
		IfNotBlocked
		reached[2][13] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((P2 *)_this)->direction;
		((P2 *)_this)->direction = 3;
#ifdef VAR_RANGES
		logval("main_control:direction", ((P2 *)_this)->direction);
#endif
		;
		if (TstOnly) return 1; /* TT */
		/* dead 2: direction */  
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P2 *)_this)->direction = 0;
		_m = 3; goto P999; /* 0 */
	case 24: // STATE 14 - sec_multi_env.pml:107 - [move[(_pid-(2*3))]!1] (0:0:0 - 1)
		IfNotBlocked
		reached[2][14] = 1;
		if (q_full(now.move[ Index((((int)((P2 *)_this)->_pid)-(2*3)), 3) ]))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.move[ Index((((int)((P2 *)_this)->_pid)-(2*3)), 3) ]);
		sprintf(simtmp, "%d", 1); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.move[ Index((((int)((P2 *)_this)->_pid)-(2*3)), 3) ], 0, 1, 1);
		if (q_zero(now.move[ Index((((int)((P2 *)_this)->_pid)-(2*3)), 3) ])) { boq = now.move[ Index((((int)((P2 *)_this)->_pid)-(2*3)), 3) ]; };
		_m = 2; goto P999; /* 0 */
	case 25: // STATE 15 - sec_multi_env.pml:108 - [floor_reached[(_pid-(2*3))]?1] (0:0:0 - 1)
		reached[2][15] = 1;
		if (q_zero(now.floor_reached[ Index((((int)((P2 *)_this)->_pid)-(2*3)), 3) ]))
		{	if (boq != now.floor_reached[ Index((((int)((P2 *)_this)->_pid)-(2*3)), 3) ]) continue;
		} else
		{	if (boq != -1) continue;
		}
		if (q_len(now.floor_reached[ Index((((int)((P2 *)_this)->_pid)-(2*3)), 3) ]) == 0) continue;

		XX=1;
		if (1 != qrecv(now.floor_reached[ Index((((int)((P2 *)_this)->_pid)-(2*3)), 3) ], 0, 0, 0)) continue;
		
#ifndef BFS_PAR
		if (q_flds[((Q0 *)qptr(now.floor_reached[ Index((((int)((P2 *)_this)->_pid)-(2*3)), 3) ]-1))->_t] != 1)
			Uerror("wrong nr of msg fields in rcv");
#endif
		;
		qrecv(now.floor_reached[ Index((((int)((P2 *)_this)->_pid)-(2*3)), 3) ], XX-1, 0, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.floor_reached[ Index((((int)((P2 *)_this)->_pid)-(2*3)), 3) ]);
			sprintf(simtmp, "%d", 1); strcat(simvals, simtmp);
		}
#endif
		if (q_zero(now.floor_reached[ Index((((int)((P2 *)_this)->_pid)-(2*3)), 3) ]))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3ld: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 26: // STATE 16 - sec_multi_env.pml:109 - [current_floor[(_pid-(2*3))] = dest] (0:0:1 - 1)
		IfNotBlocked
		reached[2][16] = 1;
		(trpt+1)->bup.oval = ((int)now.current_floor[ Index((((int)((P2 *)_this)->_pid)-(2*3)), 3) ]);
		now.current_floor[ Index((((P2 *)_this)->_pid-(2*3)), 3) ] = ((int)((P2 *)_this)->dest);
#ifdef VAR_RANGES
		logval("current_floor[(_pid-(2*3))]", ((int)now.current_floor[ Index((((int)((P2 *)_this)->_pid)-(2*3)), 3) ]));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 27: // STATE 17 - sec_multi_env.pml:110 - [move[(_pid-(2*3))]!0] (0:0:0 - 1)
		IfNotBlocked
		reached[2][17] = 1;
		if (q_full(now.move[ Index((((int)((P2 *)_this)->_pid)-(2*3)), 3) ]))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.move[ Index((((int)((P2 *)_this)->_pid)-(2*3)), 3) ]);
		sprintf(simtmp, "%d", 0); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.move[ Index((((int)((P2 *)_this)->_pid)-(2*3)), 3) ], 0, 0, 1);
		if (q_zero(now.move[ Index((((int)((P2 *)_this)->_pid)-(2*3)), 3) ])) { boq = now.move[ Index((((int)((P2 *)_this)->_pid)-(2*3)), 3) ]; };
		_m = 2; goto P999; /* 0 */
	case 28: // STATE 18 - sec_multi_env.pml:111 - [update_cabin_door[(_pid-(2*3))]!1] (0:0:0 - 1)
		IfNotBlocked
		reached[2][18] = 1;
		if (q_full(now.update_cabin_door[ Index((((int)((P2 *)_this)->_pid)-(2*3)), 3) ]))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.update_cabin_door[ Index((((int)((P2 *)_this)->_pid)-(2*3)), 3) ]);
		sprintf(simtmp, "%d", 1); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.update_cabin_door[ Index((((int)((P2 *)_this)->_pid)-(2*3)), 3) ], 0, 1, 1);
		if (q_zero(now.update_cabin_door[ Index((((int)((P2 *)_this)->_pid)-(2*3)), 3) ])) { boq = now.update_cabin_door[ Index((((int)((P2 *)_this)->_pid)-(2*3)), 3) ]; };
		_m = 2; goto P999; /* 0 */
	case 29: // STATE 19 - sec_multi_env.pml:112 - [cabin_door_updated[(_pid-(2*3))]?1] (0:0:0 - 1)
		reached[2][19] = 1;
		if (q_zero(now.cabin_door_updated[ Index((((int)((P2 *)_this)->_pid)-(2*3)), 3) ]))
		{	if (boq != now.cabin_door_updated[ Index((((int)((P2 *)_this)->_pid)-(2*3)), 3) ]) continue;
		} else
		{	if (boq != -1) continue;
		}
		if (q_len(now.cabin_door_updated[ Index((((int)((P2 *)_this)->_pid)-(2*3)), 3) ]) == 0) continue;

		XX=1;
		if (1 != qrecv(now.cabin_door_updated[ Index((((int)((P2 *)_this)->_pid)-(2*3)), 3) ], 0, 0, 0)) continue;
		
#ifndef BFS_PAR
		if (q_flds[((Q0 *)qptr(now.cabin_door_updated[ Index((((int)((P2 *)_this)->_pid)-(2*3)), 3) ]-1))->_t] != 1)
			Uerror("wrong nr of msg fields in rcv");
#endif
		;
		qrecv(now.cabin_door_updated[ Index((((int)((P2 *)_this)->_pid)-(2*3)), 3) ], XX-1, 0, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.cabin_door_updated[ Index((((int)((P2 *)_this)->_pid)-(2*3)), 3) ]);
			sprintf(simtmp, "%d", 1); strcat(simvals, simtmp);
		}
#endif
		if (q_zero(now.cabin_door_updated[ Index((((int)((P2 *)_this)->_pid)-(2*3)), 3) ]))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3ld: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 30: // STATE 21 - sec_multi_env.pml:114 - [direction = none] (0:0:2 - 1)
		IfNotBlocked
		reached[2][21] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((P2 *)_this)->direction;
		((P2 *)_this)->direction = 1;
#ifdef VAR_RANGES
		logval("main_control:direction", ((P2 *)_this)->direction);
#endif
		;
		if (TstOnly) return 1; /* TT */
		/* dead 2: direction */  
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P2 *)_this)->direction = 0;
		_m = 3; goto P999; /* 0 */
	case 31: // STATE 22 - sec_multi_env.pml:115 - [update_cabin_door[(_pid-(2*3))]!1] (0:0:0 - 1)
		IfNotBlocked
		reached[2][22] = 1;
		if (q_full(now.update_cabin_door[ Index((((int)((P2 *)_this)->_pid)-(2*3)), 3) ]))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.update_cabin_door[ Index((((int)((P2 *)_this)->_pid)-(2*3)), 3) ]);
		sprintf(simtmp, "%d", 1); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.update_cabin_door[ Index((((int)((P2 *)_this)->_pid)-(2*3)), 3) ], 0, 1, 1);
		if (q_zero(now.update_cabin_door[ Index((((int)((P2 *)_this)->_pid)-(2*3)), 3) ])) { boq = now.update_cabin_door[ Index((((int)((P2 *)_this)->_pid)-(2*3)), 3) ]; };
		_m = 2; goto P999; /* 0 */
	case 32: // STATE 23 - sec_multi_env.pml:116 - [cabin_door_updated[(_pid-(2*3))]?1] (0:0:0 - 1)
		reached[2][23] = 1;
		if (q_zero(now.cabin_door_updated[ Index((((int)((P2 *)_this)->_pid)-(2*3)), 3) ]))
		{	if (boq != now.cabin_door_updated[ Index((((int)((P2 *)_this)->_pid)-(2*3)), 3) ]) continue;
		} else
		{	if (boq != -1) continue;
		}
		if (q_len(now.cabin_door_updated[ Index((((int)((P2 *)_this)->_pid)-(2*3)), 3) ]) == 0) continue;

		XX=1;
		if (1 != qrecv(now.cabin_door_updated[ Index((((int)((P2 *)_this)->_pid)-(2*3)), 3) ], 0, 0, 0)) continue;
		
#ifndef BFS_PAR
		if (q_flds[((Q0 *)qptr(now.cabin_door_updated[ Index((((int)((P2 *)_this)->_pid)-(2*3)), 3) ]-1))->_t] != 1)
			Uerror("wrong nr of msg fields in rcv");
#endif
		;
		qrecv(now.cabin_door_updated[ Index((((int)((P2 *)_this)->_pid)-(2*3)), 3) ], XX-1, 0, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.cabin_door_updated[ Index((((int)((P2 *)_this)->_pid)-(2*3)), 3) ]);
			sprintf(simtmp, "%d", 1); strcat(simvals, simtmp);
		}
#endif
		if (q_zero(now.cabin_door_updated[ Index((((int)((P2 *)_this)->_pid)-(2*3)), 3) ]))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3ld: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 33: // STATE 26 - sec_multi_env.pml:120 - [assert(((0<=current_floor[(_pid-(2*3))])&&(current_floor[(_pid-(2*3))]<3)))] (0:0:0 - 4)
		IfNotBlocked
		reached[2][26] = 1;
		spin_assert(((0<=((int)now.current_floor[ Index((((int)((P2 *)_this)->_pid)-(2*3)), 3) ]))&&(((int)now.current_floor[ Index((((int)((P2 *)_this)->_pid)-(2*3)), 3) ])<3)), "((0<=current_floor[(_pid-(2*3))])&&(current_floor[(_pid-(2*3))]<3))", II, tt, t);
		_m = 3; goto P999; /* 0 */
	case 34: // STATE 27 - sec_multi_env.pml:123 - [floor_request_made[dest] = 0] (0:0:1 - 1)
		IfNotBlocked
		reached[2][27] = 1;
		(trpt+1)->bup.oval = ((int)now.floor_request_made[ Index(((int)((P2 *)_this)->dest), 3) ]);
		now.floor_request_made[ Index(((P2 *)_this)->dest, 3) ] = 0;
#ifdef VAR_RANGES
		logval("floor_request_made[main_control:dest]", ((int)now.floor_request_made[ Index(((int)((P2 *)_this)->dest), 3) ]));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 35: // STATE 28 - sec_multi_env.pml:124 - [served[(_pid-(2*3))]!1] (0:0:0 - 1)
		IfNotBlocked
		reached[2][28] = 1;
		if (q_full(now.served[ Index((((int)((P2 *)_this)->_pid)-(2*3)), 3) ]))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.served[ Index((((int)((P2 *)_this)->_pid)-(2*3)), 3) ]);
		sprintf(simtmp, "%d", 1); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.served[ Index((((int)((P2 *)_this)->_pid)-(2*3)), 3) ], 0, 1, 1);
		if (q_zero(now.served[ Index((((int)((P2 *)_this)->_pid)-(2*3)), 3) ])) { boq = now.served[ Index((((int)((P2 *)_this)->_pid)-(2*3)), 3) ]; };
		_m = 2; goto P999; /* 0 */
	case 36: // STATE 32 - sec_multi_env.pml:126 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[2][32] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC elevator_engine */
	case 37: // STATE 1 - sec_multi_env.pml:70 - [move[(_pid-3)]?1] (0:0:0 - 1)
		reached[1][1] = 1;
		if (q_zero(now.move[ Index((((int)((P1 *)_this)->_pid)-3), 3) ]))
		{	if (boq != now.move[ Index((((int)((P1 *)_this)->_pid)-3), 3) ]) continue;
		} else
		{	if (boq != -1) continue;
		}
		if (q_len(now.move[ Index((((int)((P1 *)_this)->_pid)-3), 3) ]) == 0) continue;

		XX=1;
		if (1 != qrecv(now.move[ Index((((int)((P1 *)_this)->_pid)-3), 3) ], 0, 0, 0)) continue;
		
#ifndef BFS_PAR
		if (q_flds[((Q0 *)qptr(now.move[ Index((((int)((P1 *)_this)->_pid)-3), 3) ]-1))->_t] != 1)
			Uerror("wrong nr of msg fields in rcv");
#endif
		;
		qrecv(now.move[ Index((((int)((P1 *)_this)->_pid)-3), 3) ], XX-1, 0, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.move[ Index((((int)((P1 *)_this)->_pid)-3), 3) ]);
			sprintf(simtmp, "%d", 1); strcat(simvals, simtmp);
		}
#endif
		if (q_zero(now.move[ Index((((int)((P1 *)_this)->_pid)-3), 3) ]))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3ld: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 38: // STATE 2 - sec_multi_env.pml:72 - [move[(_pid-3)]?0] (0:0:0 - 1)
		reached[1][2] = 1;
		if (q_zero(now.move[ Index((((int)((P1 *)_this)->_pid)-3), 3) ]))
		{	if (boq != now.move[ Index((((int)((P1 *)_this)->_pid)-3), 3) ]) continue;
		} else
		{	if (boq != -1) continue;
		}
		if (q_len(now.move[ Index((((int)((P1 *)_this)->_pid)-3), 3) ]) == 0) continue;

		XX=1;
		if (0 != qrecv(now.move[ Index((((int)((P1 *)_this)->_pid)-3), 3) ], 0, 0, 0)) continue;
		
#ifndef BFS_PAR
		if (q_flds[((Q0 *)qptr(now.move[ Index((((int)((P1 *)_this)->_pid)-3), 3) ]-1))->_t] != 1)
			Uerror("wrong nr of msg fields in rcv");
#endif
		;
		qrecv(now.move[ Index((((int)((P1 *)_this)->_pid)-3), 3) ], XX-1, 0, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.move[ Index((((int)((P1 *)_this)->_pid)-3), 3) ]);
			sprintf(simtmp, "%d", 0); strcat(simvals, simtmp);
		}
#endif
		if (q_zero(now.move[ Index((((int)((P1 *)_this)->_pid)-3), 3) ]))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3ld: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 39: // STATE 4 - sec_multi_env.pml:73 - [floor_reached[(_pid-3)]!1] (0:0:0 - 1)
		IfNotBlocked
		reached[1][4] = 1;
		if (q_full(now.floor_reached[ Index((((int)((P1 *)_this)->_pid)-3), 3) ]))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.floor_reached[ Index((((int)((P1 *)_this)->_pid)-3), 3) ]);
		sprintf(simtmp, "%d", 1); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.floor_reached[ Index((((int)((P1 *)_this)->_pid)-3), 3) ], 0, 1, 1);
		if (q_zero(now.floor_reached[ Index((((int)((P1 *)_this)->_pid)-3), 3) ])) { boq = now.floor_reached[ Index((((int)((P1 *)_this)->_pid)-3), 3) ]; };
		_m = 2; goto P999; /* 0 */
	case 40: // STATE 11 - sec_multi_env.pml:76 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[1][11] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC cabin_door */
	case 41: // STATE 1 - sec_multi_env.pml:62 - [update_cabin_door[_pid]?1] (0:0:0 - 1)
		reached[0][1] = 1;
		if (q_zero(now.update_cabin_door[ Index(((int)((P0 *)_this)->_pid), 3) ]))
		{	if (boq != now.update_cabin_door[ Index(((int)((P0 *)_this)->_pid), 3) ]) continue;
		} else
		{	if (boq != -1) continue;
		}
		if (q_len(now.update_cabin_door[ Index(((int)((P0 *)_this)->_pid), 3) ]) == 0) continue;

		XX=1;
		if (1 != qrecv(now.update_cabin_door[ Index(((int)((P0 *)_this)->_pid), 3) ], 0, 0, 0)) continue;
		
#ifndef BFS_PAR
		if (q_flds[((Q0 *)qptr(now.update_cabin_door[ Index(((int)((P0 *)_this)->_pid), 3) ]-1))->_t] != 1)
			Uerror("wrong nr of msg fields in rcv");
#endif
		;
		qrecv(now.update_cabin_door[ Index(((int)((P0 *)_this)->_pid), 3) ], XX-1, 0, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.update_cabin_door[ Index(((int)((P0 *)_this)->_pid), 3) ]);
			sprintf(simtmp, "%d", 1); strcat(simvals, simtmp);
		}
#endif
		if (q_zero(now.update_cabin_door[ Index(((int)((P0 *)_this)->_pid), 3) ]))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3ld: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 42: // STATE 2 - sec_multi_env.pml:62 - [floor_door_is_open[current_floor[_pid]].shaft[_pid] = 1] (0:0:1 - 1)
		IfNotBlocked
		reached[0][2] = 1;
		(trpt+1)->bup.oval = ((int)now.floor_door_is_open[ Index(((int)now.current_floor[ Index(((int)((P0 *)_this)->_pid), 3) ]), 3) ].shaft[ Index(((int)((P0 *)_this)->_pid), 3) ]);
		now.floor_door_is_open[ Index(now.current_floor[ Index(((P0 *)_this)->_pid, 3) ], 3) ].shaft[ Index(((P0 *)_this)->_pid, 3) ] = 1;
#ifdef VAR_RANGES
		logval("floor_door_is_open[current_floor[_pid]].shaft[_pid]", ((int)now.floor_door_is_open[ Index(((int)now.current_floor[ Index(((int)((P0 *)_this)->_pid), 3) ]), 3) ].shaft[ Index(((int)((P0 *)_this)->_pid), 3) ]));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 43: // STATE 3 - sec_multi_env.pml:62 - [cabin_door_is_open[_pid] = 1] (0:0:1 - 1)
		IfNotBlocked
		reached[0][3] = 1;
		(trpt+1)->bup.oval = ((int)cabin_door_is_open[ Index(((int)((P0 *)_this)->_pid), 3) ]);
		cabin_door_is_open[ Index(((P0 *)_this)->_pid, 3) ] = 1;
#ifdef VAR_RANGES
		logval("cabin_door_is_open[_pid]", ((int)cabin_door_is_open[ Index(((int)((P0 *)_this)->_pid), 3) ]));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 44: // STATE 4 - sec_multi_env.pml:62 - [cabin_door_updated[_pid]!1] (0:0:0 - 1)
		IfNotBlocked
		reached[0][4] = 1;
		if (q_full(now.cabin_door_updated[ Index(((int)((P0 *)_this)->_pid), 3) ]))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.cabin_door_updated[ Index(((int)((P0 *)_this)->_pid), 3) ]);
		sprintf(simtmp, "%d", 1); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.cabin_door_updated[ Index(((int)((P0 *)_this)->_pid), 3) ], 0, 1, 1);
		if (q_zero(now.cabin_door_updated[ Index(((int)((P0 *)_this)->_pid), 3) ])) { boq = now.cabin_door_updated[ Index(((int)((P0 *)_this)->_pid), 3) ]; };
		_m = 2; goto P999; /* 0 */
	case 45: // STATE 5 - sec_multi_env.pml:63 - [update_cabin_door[_pid]?0] (0:0:0 - 1)
		reached[0][5] = 1;
		if (q_zero(now.update_cabin_door[ Index(((int)((P0 *)_this)->_pid), 3) ]))
		{	if (boq != now.update_cabin_door[ Index(((int)((P0 *)_this)->_pid), 3) ]) continue;
		} else
		{	if (boq != -1) continue;
		}
		if (q_len(now.update_cabin_door[ Index(((int)((P0 *)_this)->_pid), 3) ]) == 0) continue;

		XX=1;
		if (0 != qrecv(now.update_cabin_door[ Index(((int)((P0 *)_this)->_pid), 3) ], 0, 0, 0)) continue;
		
#ifndef BFS_PAR
		if (q_flds[((Q0 *)qptr(now.update_cabin_door[ Index(((int)((P0 *)_this)->_pid), 3) ]-1))->_t] != 1)
			Uerror("wrong nr of msg fields in rcv");
#endif
		;
		qrecv(now.update_cabin_door[ Index(((int)((P0 *)_this)->_pid), 3) ], XX-1, 0, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.update_cabin_door[ Index(((int)((P0 *)_this)->_pid), 3) ]);
			sprintf(simtmp, "%d", 0); strcat(simvals, simtmp);
		}
#endif
		if (q_zero(now.update_cabin_door[ Index(((int)((P0 *)_this)->_pid), 3) ]))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3ld: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 46: // STATE 6 - sec_multi_env.pml:63 - [cabin_door_is_open[_pid] = 0] (0:0:1 - 1)
		IfNotBlocked
		reached[0][6] = 1;
		(trpt+1)->bup.oval = ((int)cabin_door_is_open[ Index(((int)((P0 *)_this)->_pid), 3) ]);
		cabin_door_is_open[ Index(((P0 *)_this)->_pid, 3) ] = 0;
#ifdef VAR_RANGES
		logval("cabin_door_is_open[_pid]", ((int)cabin_door_is_open[ Index(((int)((P0 *)_this)->_pid), 3) ]));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 47: // STATE 7 - sec_multi_env.pml:63 - [floor_door_is_open[current_floor[_pid]].shaft[_pid] = 0] (0:0:1 - 1)
		IfNotBlocked
		reached[0][7] = 1;
		(trpt+1)->bup.oval = ((int)now.floor_door_is_open[ Index(((int)now.current_floor[ Index(((int)((P0 *)_this)->_pid), 3) ]), 3) ].shaft[ Index(((int)((P0 *)_this)->_pid), 3) ]);
		now.floor_door_is_open[ Index(now.current_floor[ Index(((P0 *)_this)->_pid, 3) ], 3) ].shaft[ Index(((P0 *)_this)->_pid, 3) ] = 0;
#ifdef VAR_RANGES
		logval("floor_door_is_open[current_floor[_pid]].shaft[_pid]", ((int)now.floor_door_is_open[ Index(((int)now.current_floor[ Index(((int)((P0 *)_this)->_pid), 3) ]), 3) ].shaft[ Index(((int)((P0 *)_this)->_pid), 3) ]));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 48: // STATE 8 - sec_multi_env.pml:63 - [cabin_door_updated[_pid]!0] (0:0:0 - 1)
		IfNotBlocked
		reached[0][8] = 1;
		if (q_full(now.cabin_door_updated[ Index(((int)((P0 *)_this)->_pid), 3) ]))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.cabin_door_updated[ Index(((int)((P0 *)_this)->_pid), 3) ]);
		sprintf(simtmp, "%d", 0); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.cabin_door_updated[ Index(((int)((P0 *)_this)->_pid), 3) ], 0, 0, 1);
		if (q_zero(now.cabin_door_updated[ Index(((int)((P0 *)_this)->_pid), 3) ])) { boq = now.cabin_door_updated[ Index(((int)((P0 *)_this)->_pid), 3) ]; };
		_m = 2; goto P999; /* 0 */
	case 49: // STATE 12 - sec_multi_env.pml:65 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[0][12] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */
	case  _T5:	/* np_ */
		if (!((!(trpt->o_pm&4) && !(trpt->tau&128))))
			continue;
		/* else fall through */
	case  _T2:	/* true */
		_m = 3; goto P999;
#undef rand
	}

