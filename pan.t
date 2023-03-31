#ifdef PEG
struct T_SRC {
	char *fl; int ln;
} T_SRC[NTRANS];

void
tr_2_src(int m, char *file, int ln)
{	T_SRC[m].fl = file;
	T_SRC[m].ln = ln;
}

void
putpeg(int n, int m)
{	printf("%5d	trans %4d ", m, n);
	printf("%s:%d\n",
		T_SRC[n].fl, T_SRC[n].ln);
}
#else
#define tr_2_src(m,f,l)
#endif

void
settable(void)
{	Trans *T;
	Trans *settr(int, int, int, int, int, char *, int, int, int);

	trans = (Trans ***) emalloc(7*sizeof(Trans **));

	/* proctype 5: f3 */

	trans[5] = (Trans **) emalloc(7*sizeof(Trans *));

	trans[5][4]	= settr(79,0,3,1,0,".(goto)", 0, 2, 0);
	T = trans[5][3] = settr(78,0,0,0,0,"DO", 0, 2, 0);
		/* _spin_nvr.tmp:3 */
	    T->nxt	= settr(78,0,1,0,0,"DO", 0, 2, 0);
		/* _spin_nvr.tmp:3 */
	trans[5][1]	= settr(76,0,3,3,0,"(!((req_handler.goArr==1)))", 1, 2, 0);
		tr_2_src(3, "_spin_nvr.tmp", 4);
	trans[5][2]	= settr(77,0,3,1,0,"goto T0_init", 0, 2, 0);
	trans[5][5]	= settr(80,0,6,1,0,"break", 0, 2, 0);
	trans[5][6]	= settr(81,0,0,4,4,"-end-", 0, 3500, 0);
		tr_2_src(4, "_spin_nvr.tmp", 6);

	/* proctype 4: req_button */

	trans[4] = (Trans **) emalloc(9*sizeof(Trans *));

	trans[4][6]	= settr(73,0,5,1,0,".(goto)", 0, 2, 0);
	T = trans[4][5] = settr(72,0,0,0,0,"DO", 0, 2, 0);
		/* sec_multi_env.pml:171 */
	    T->nxt	= settr(72,0,1,0,0,"DO", 0, 2, 0);
		/* sec_multi_env.pml:171 */
	trans[4][1]	= settr(68,0,4,5,0,"(!(floor_request_made[((_pid-(3*3))-1)]))", 1, 2, 0);
		tr_2_src(5, "sec_multi_env.pml", 172);
	T = trans[ 4][4] = settr(71,2,0,0,0,"ATOMIC", 1, 2, 0);
		/* sec_multi_env.pml:173 */
	T->nxt	= settr(71,2,2,0,0,"ATOMIC", 1, 3, 0);
		/* sec_multi_env.pml:173 */
	trans[4][2]	= settr(69,2,3,6,6,"request!((_pid-(3*3))-1)", 1, 3, 0);
		tr_2_src(6, "sec_multi_env.pml", 174);
	trans[4][3]	= settr(70,0,5,7,7,"floor_request_made[((_pid-(3*3))-1)] = 1", 1, 3, 0);
		tr_2_src(7, "sec_multi_env.pml", 175);
	trans[4][7]	= settr(74,0,8,1,0,"break", 0, 2, 0);
	trans[4][8]	= settr(75,0,0,8,8,"-end-", 0, 3500, 0);
		tr_2_src(8, "sec_multi_env.pml", 178);

	/* proctype 3: req_handler */

	trans[3] = (Trans **) emalloc(13*sizeof(Trans *));

	trans[3][10]	= settr(65,0,9,1,0,".(goto)", 0, 2, 0);
	T = trans[3][9] = settr(64,0,0,0,0,"DO", 0, 2, 0);
		/* sec_multi_env.pml:162 */
	    T->nxt	= settr(64,0,1,0,0,"DO", 0, 2, 0);
		/* sec_multi_env.pml:162 */
	trans[3][1]	= settr(56,0,2,9,9,"request?dest", 1, 503, 0);
		tr_2_src(9, "sec_multi_env.pml", 163);
	trans[3][2]	= settr(57,0,3,10,10,"servedArr[k] = 0", 0, 2, 0);
		tr_2_src(10, "sec_multi_env.pml", 163);
	trans[3][3]	= settr(58,0,4,11,11,"goArr[k] = 0", 0, 2, 0);
		tr_2_src(11, "sec_multi_env.pml", 163);
	trans[3][4]	= settr(59,0,5,12,12,"go[k]!dest", 1, 8, 0);
		tr_2_src(12, "sec_multi_env.pml", 163);
	trans[3][5]	= settr(60,0,6,13,13,"goArr[k] = 1", 0, 2, 0);
		tr_2_src(13, "sec_multi_env.pml", 163);
	trans[3][6]	= settr(61,0,7,14,14,"served[k]?1", 1, 509, 0);
		tr_2_src(14, "sec_multi_env.pml", 163);
	trans[3][7]	= settr(62,0,8,15,15,"servedArr[k] = 1", 0, 2, 0);
		tr_2_src(15, "sec_multi_env.pml", 163);
	trans[3][8]	= settr(63,0,9,16,16,"k = ((k+1)%3)", 0, 2, 0);
		tr_2_src(16, "sec_multi_env.pml", 163);
	trans[3][11]	= settr(66,0,12,1,0,"break", 0, 2, 0);
	trans[3][12]	= settr(67,0,0,17,17,"-end-", 0, 3500, 0);
		tr_2_src(17, "sec_multi_env.pml", 165);

	/* proctype 2: main_control */

	trans[2] = (Trans **) emalloc(33*sizeof(Trans *));

	trans[2][1]	= settr(24,0,29,18,18,"current_floor[(_pid-(2*3))] = 0", 1, 2, 0);
		tr_2_src(18, "sec_multi_env.pml", 103);
	trans[2][30]	= settr(53,0,29,1,0,".(goto)", 0, 2, 0);
	T = trans[2][29] = settr(52,0,0,0,0,"DO", 0, 2, 0);
		/* sec_multi_env.pml:104 */
	    T->nxt	= settr(52,0,2,0,0,"DO", 0, 2, 0);
		/* sec_multi_env.pml:104 */
	trans[2][2]	= settr(25,0,3,19,19,"go[(_pid-(2*3))]?destination", 1, 508, 0);
		tr_2_src(19, "sec_multi_env.pml", 105);
	trans[2][3]	= settr(26,0,4,20,20,"update_cabin_door[(_pid-(2*3))]!0", 1, 4, 0);
		tr_2_src(20, "sec_multi_env.pml", 106);
	trans[2][4]	= settr(27,0,25,21,21,"cabin_door_updated[(_pid-(2*3))]?0", 1, 505, 0);
		tr_2_src(21, "sec_multi_env.pml", 107);
	T = trans[2][25] = settr(48,0,0,0,0,"IF", 0, 2, 0);
		/* sec_multi_env.pml:108 */
	T = T->nxt	= settr(48,0,5,0,0,"IF", 0, 2, 0);
		/* sec_multi_env.pml:108 */
	T = T->nxt	= settr(48,0,13,0,0,"IF", 0, 2, 0);
		/* sec_multi_env.pml:108 */
	    T->nxt	= settr(48,0,21,0,0,"IF", 0, 2, 0);
		/* sec_multi_env.pml:108 */
	trans[2][5]	= settr(28,0,6,22,0,"((destination>current_floor[(_pid-(2*3))]))", 1, 2, 0);
		tr_2_src(22, "sec_multi_env.pml", 109);
	trans[2][6]	= settr(29,0,7,23,23,"directions[(_pid-(2*3))] = up", 1, 2, 0);
		tr_2_src(23, "sec_multi_env.pml", 110);
	trans[2][7]	= settr(30,0,8,24,24,"move[(_pid-(2*3))]!1", 1, 6, 0);
		tr_2_src(24, "sec_multi_env.pml", 111);
	trans[2][8]	= settr(31,0,9,25,25,"floor_reached[(_pid-(2*3))]?1", 1, 507, 0);
		tr_2_src(25, "sec_multi_env.pml", 112);
	trans[2][9]	= settr(32,0,10,26,26,"current_floor[(_pid-(2*3))] = destination", 1, 2, 0);
		tr_2_src(26, "sec_multi_env.pml", 113);
	trans[2][10]	= settr(33,0,11,27,27,"move[(_pid-(2*3))]!0", 1, 6, 0);
		tr_2_src(27, "sec_multi_env.pml", 114);
	trans[2][11]	= settr(34,0,12,28,28,"update_cabin_door[(_pid-(2*3))]!1", 1, 4, 0);
		tr_2_src(28, "sec_multi_env.pml", 115);
	trans[2][12]	= settr(35,0,27,29,29,"cabin_door_updated[(_pid-(2*3))]?1", 1, 505, 0);
		tr_2_src(29, "sec_multi_env.pml", 116);
	trans[2][26]	= settr(49,0,27,1,0,".(goto)", 0, 2, 0);
	trans[2][13]	= settr(36,0,14,30,0,"((destination<current_floor[(_pid-(2*3))]))", 1, 2, 0);
		tr_2_src(30, "sec_multi_env.pml", 117);
	trans[2][14]	= settr(37,0,15,31,31,"directions[(_pid-(2*3))] = down", 1, 2, 0);
		tr_2_src(31, "sec_multi_env.pml", 118);
	trans[2][15]	= settr(38,0,16,32,32,"move[(_pid-(2*3))]!1", 1, 6, 0);
		tr_2_src(32, "sec_multi_env.pml", 119);
	trans[2][16]	= settr(39,0,17,33,33,"floor_reached[(_pid-(2*3))]?1", 1, 507, 0);
		tr_2_src(33, "sec_multi_env.pml", 120);
	trans[2][17]	= settr(40,0,18,34,34,"current_floor[(_pid-(2*3))] = destination", 1, 2, 0);
		tr_2_src(34, "sec_multi_env.pml", 121);
	trans[2][18]	= settr(41,0,19,35,35,"move[(_pid-(2*3))]!0", 1, 6, 0);
		tr_2_src(35, "sec_multi_env.pml", 122);
	trans[2][19]	= settr(42,0,20,36,36,"update_cabin_door[(_pid-(2*3))]!1", 1, 4, 0);
		tr_2_src(36, "sec_multi_env.pml", 123);
	trans[2][20]	= settr(43,0,27,37,37,"cabin_door_updated[(_pid-(2*3))]?1", 1, 505, 0);
		tr_2_src(37, "sec_multi_env.pml", 124);
	trans[2][21]	= settr(44,0,22,2,0,"else", 0, 2, 0);
	trans[2][22]	= settr(45,0,23,38,38,"directions[(_pid-(2*3))] = none", 1, 2, 0);
		tr_2_src(38, "sec_multi_env.pml", 126);
	trans[2][23]	= settr(46,0,24,39,39,"update_cabin_door[(_pid-(2*3))]!1", 1, 4, 0);
		tr_2_src(39, "sec_multi_env.pml", 127);
	trans[2][24]	= settr(47,0,27,40,40,"cabin_door_updated[(_pid-(2*3))]?1", 1, 505, 0);
		tr_2_src(40, "sec_multi_env.pml", 128);
	trans[2][27]	= settr(50,0,28,41,41,"floor_request_made[destination] = 0", 1, 2, 0);
		tr_2_src(41, "sec_multi_env.pml", 135);
	trans[2][28]	= settr(51,0,29,42,42,"served[(_pid-(2*3))]!1", 1, 9, 0);
		tr_2_src(42, "sec_multi_env.pml", 136);
	trans[2][31]	= settr(54,0,32,1,0,"break", 0, 2, 0);
	trans[2][32]	= settr(55,0,0,43,43,"-end-", 0, 3500, 0);
		tr_2_src(43, "sec_multi_env.pml", 138);

	/* proctype 1: elevator_engine */

	trans[1] = (Trans **) emalloc(12*sizeof(Trans *));

	trans[1][9]	= settr(21,0,8,1,0,".(goto)", 0, 2, 0);
	T = trans[1][8] = settr(20,0,0,0,0,"DO", 0, 2, 0);
		/* sec_multi_env.pml:81 */
	    T->nxt	= settr(20,0,1,0,0,"DO", 0, 2, 0);
		/* sec_multi_env.pml:81 */
	trans[1][1]	= settr(13,0,5,44,44,"move[(_pid-3)]?1", 1, 506, 0);
		tr_2_src(44, "sec_multi_env.pml", 82);
	trans[1][6]	= settr(18,0,5,1,0,".(goto)", 0, 2, 0);
	T = trans[1][5] = settr(17,0,0,0,0,"DO", 0, 2, 0);
		/* sec_multi_env.pml:83 */
	T = T->nxt	= settr(17,0,2,0,0,"DO", 0, 2, 0);
		/* sec_multi_env.pml:83 */
	    T->nxt	= settr(17,0,4,0,0,"DO", 0, 2, 0);
		/* sec_multi_env.pml:83 */
	trans[1][2]	= settr(14,0,8,45,45,"move[(_pid-3)]?0", 1, 506, 0);
		tr_2_src(45, "sec_multi_env.pml", 84);
	trans[1][3]	= settr(15,0,8,1,0,"goto :b2", 0, 2, 0);
	trans[1][4]	= settr(16,0,5,46,46,"floor_reached[(_pid-3)]!1", 1, 7, 0);
		tr_2_src(46, "sec_multi_env.pml", 85);
	trans[1][7]	= settr(19,0,8,1,0,"break", 0, 2, 0);
	trans[1][10]	= settr(22,0,11,1,0,"break", 0, 2, 0);
	trans[1][11]	= settr(23,0,0,47,47,"-end-", 0, 3500, 0);
		tr_2_src(47, "sec_multi_env.pml", 88);

	/* proctype 0: cabin_door */

	trans[0] = (Trans **) emalloc(14*sizeof(Trans *));

	trans[0][11]	= settr(10,0,10,1,0,".(goto)", 0, 2, 0);
	T = trans[0][10] = settr(9,0,0,0,0,"DO", 0, 2, 0);
		/* sec_multi_env.pml:72 */
	T = T->nxt	= settr(9,0,1,0,0,"DO", 0, 2, 0);
		/* sec_multi_env.pml:72 */
	T = T->nxt	= settr(9,0,2,0,0,"DO", 0, 2, 0);
		/* sec_multi_env.pml:72 */
	    T->nxt	= settr(9,0,6,0,0,"DO", 0, 2, 0);
		/* sec_multi_env.pml:72 */
	trans[0][1]	= settr(0,0,10,48,0,"printf('%d',current_floor[_pid])", 1, 2, 0);
		tr_2_src(48, "sec_multi_env.pml", 73);
	trans[0][2]	= settr(1,0,3,49,49,"update_cabin_door[_pid]?1", 1, 504, 0);
		tr_2_src(49, "sec_multi_env.pml", 74);
	trans[0][3]	= settr(2,0,4,50,50,"floor_door_is_open[_pid].shaft[current_floor[_pid]] = 1", 1, 2, 0);
		tr_2_src(50, "sec_multi_env.pml", 74);
	trans[0][4]	= settr(3,0,5,51,51,"cabin_door_is_open[_pid] = 1", 1, 2, 0);
		tr_2_src(51, "sec_multi_env.pml", 74);
	trans[0][5]	= settr(4,0,10,52,52,"cabin_door_updated[_pid]!1", 1, 5, 0);
		tr_2_src(52, "sec_multi_env.pml", 74);
	trans[0][6]	= settr(5,0,7,53,53,"update_cabin_door[_pid]?0", 1, 504, 0);
		tr_2_src(53, "sec_multi_env.pml", 75);
	trans[0][7]	= settr(6,0,8,54,54,"cabin_door_is_open[_pid] = 0", 1, 2, 0);
		tr_2_src(54, "sec_multi_env.pml", 75);
	trans[0][8]	= settr(7,0,9,55,55,"floor_door_is_open[_pid].shaft[current_floor[_pid]] = 0", 1, 2, 0);
		tr_2_src(55, "sec_multi_env.pml", 75);
	trans[0][9]	= settr(8,0,10,56,56,"cabin_door_updated[_pid]!0", 1, 5, 0);
		tr_2_src(56, "sec_multi_env.pml", 75);
	trans[0][12]	= settr(11,0,13,1,0,"break", 0, 2, 0);
	trans[0][13]	= settr(12,0,0,57,57,"-end-", 0, 3500, 0);
		tr_2_src(57, "sec_multi_env.pml", 77);
	/* np_ demon: */
	trans[_NP_] = (Trans **) emalloc(3*sizeof(Trans *));
	T = trans[_NP_][0] = settr(9997,0,1,_T5,0,"(np_)", 1,2,0);
	    T->nxt	  = settr(9998,0,0,_T2,0,"(1)",   0,2,0);
	T = trans[_NP_][1] = settr(9999,0,1,_T5,0,"(np_)", 1,2,0);
}

Trans *
settr(	int t_id, int a, int b, int c, int d,
	char *t, int g, int tpe0, int tpe1)
{	Trans *tmp = (Trans *) emalloc(sizeof(Trans));

	tmp->atom  = a&(6|32);	/* only (2|8|32) have meaning */
	if (!g) tmp->atom |= 8;	/* no global references */
	tmp->st    = b;
	tmp->tpe[0] = tpe0;
	tmp->tpe[1] = tpe1;
	tmp->tp    = t;
	tmp->t_id  = t_id;
	tmp->forw  = c;
	tmp->back  = d;
	return tmp;
}

Trans *
cpytr(Trans *a)
{	Trans *tmp = (Trans *) emalloc(sizeof(Trans));

	int i;
	tmp->atom  = a->atom;
	tmp->st    = a->st;
#ifdef HAS_UNLESS
	tmp->e_trans = a->e_trans;
	for (i = 0; i < HAS_UNLESS; i++)
		tmp->escp[i] = a->escp[i];
#endif
	tmp->tpe[0] = a->tpe[0];
	tmp->tpe[1] = a->tpe[1];
	for (i = 0; i < 6; i++)
	{	tmp->qu[i] = a->qu[i];
		tmp->ty[i] = a->ty[i];
	}
	tmp->tp    = (char *) emalloc(strlen(a->tp)+1);
	strcpy(tmp->tp, a->tp);
	tmp->t_id  = a->t_id;
	tmp->forw  = a->forw;
	tmp->back  = a->back;
	return tmp;
}

#ifndef NOREDUCE
int
srinc_set(int n)
{	if (n <= 2) return LOCAL;
	if (n <= 2+  DELTA) return Q_FULL_F; /* 's' or nfull  */
	if (n <= 2+2*DELTA) return Q_EMPT_F; /* 'r' or nempty */
	if (n <= 2+3*DELTA) return Q_EMPT_T; /* empty */
	if (n <= 2+4*DELTA) return Q_FULL_T; /* full  */
	if (n ==   5*DELTA) return GLOBAL;
	if (n ==   6*DELTA) return TIMEOUT_F;
	if (n ==   7*DELTA) return ALPHA_F;
	Uerror("cannot happen srinc_class");
	return BAD;
}
int
srunc(int n, int m)
{	switch(m) {
	case Q_FULL_F: return n-2;
	case Q_EMPT_F: return n-2-DELTA;
	case Q_EMPT_T: return n-2-2*DELTA;
	case Q_FULL_T: return n-2-3*DELTA;
	case ALPHA_F:
	case TIMEOUT_F: return 257; /* non-zero, and > MAXQ */
	}
	Uerror("cannot happen srunc");
	return 0;
}
#endif
int cnt;
#ifdef HAS_UNLESS
int
isthere(Trans *a, int b)
{	Trans *t;
	for (t = a; t; t = t->nxt)
		if (t->t_id == b)
			return 1;
	return 0;
}
#endif
#ifndef NOREDUCE
int
mark_safety(Trans *t) /* for conditional safety */
{	int g = 0, i, j, k;

	if (!t) return 0;
	if (t->qu[0])
		return (t->qu[1])?2:1;	/* marked */

	for (i = 0; i < 2; i++)
	{	j = srinc_set(t->tpe[i]);
		if (j >= GLOBAL && j != ALPHA_F)
			return -1;
		if (j != LOCAL)
		{	k = srunc(t->tpe[i], j);
			if (g == 0
			||  t->qu[0] != k
			||  t->ty[0] != j)
			{	t->qu[g] = k;
				t->ty[g] = j;
				g++;
	}	}	}
	return g;
}
#endif
void
retrans(int n, int m, int is, short srcln[], uchar reach[], uchar lpstate[])
	/* process n, with m states, is=initial state */
{	Trans *T0, *T1, *T2, *T3;
	Trans *T4, *T5; /* t_reverse or has_unless */
	int i;
#if defined(HAS_UNLESS) || !defined(NOREDUCE)
	int k;
#endif
#ifndef NOREDUCE
	int g, h, j, aa;
#endif
#ifdef HAS_UNLESS
	int p;
#endif
	if (state_tables >= 4)
	{	printf("STEP 1 %s\n", 
			procname[n]);
		for (i = 1; i < m; i++)
		for (T0 = trans[n][i]; T0; T0 = T0->nxt)
			crack(n, i, T0, srcln);
		return;
	}
	do {
		for (i = 1, cnt = 0; i < m; i++)
		{	T2 = trans[n][i];
			T1 = T2?T2->nxt:(Trans *)0;
/* prescan: */		for (T0 = T1; T0; T0 = T0->nxt)
/* choice in choice */	{	if (T0->st && trans[n][T0->st]
				&&  trans[n][T0->st]->nxt)
					break;
			}
#if 0
		if (T0)
		printf("\tstate %d / %d: choice in choice\n",
		i, T0->st);
#endif
			if (T0)
			for (T0 = T1; T0; T0 = T0->nxt)
			{	T3 = trans[n][T0->st];
				if (!T3->nxt)
				{	T2->nxt = cpytr(T0);
					T2 = T2->nxt;
					imed(T2, T0->st, n, i);
					continue;
				}
				do {	T3 = T3->nxt;
					T2->nxt = cpytr(T3);
					T2 = T2->nxt;
					imed(T2, T0->st, n, i);
				} while (T3->nxt);
				cnt++;
			}
		}
	} while (cnt);
	if (state_tables >= 3)
	{	printf("STEP 2 %s\n", 
			procname[n]);
		for (i = 1; i < m; i++)
		for (T0 = trans[n][i]; T0; T0 = T0->nxt)
			crack(n, i, T0, srcln);
		return;
	}
	for (i = 1; i < m; i++)
	{	if (trans[n][i] && trans[n][i]->nxt) /* optimize */
		{	T1 = trans[n][i]->nxt;
#if 0
			printf("\t\tpull %d (%d) to %d\n",
			T1->st, T1->forw, i);
#endif
			srcln[i] = srcln[T1->st];	/* Oyvind Teig, 5.2.0 */

			if (!trans[n][T1->st]) continue;
			T0 = cpytr(trans[n][T1->st]);
			trans[n][i] = T0;
			reach[T1->st] = 1;
			imed(T0, T1->st, n, i);
			for (T1 = T1->nxt; T1; T1 = T1->nxt)
			{
#if 0
			printf("\t\tpull %d (%d) to %d\n",
				T1->st, T1->forw, i);
#endif
		/*		srcln[i] = srcln[T1->st];  gh: not useful */
				if (!trans[n][T1->st]) continue;
				T0->nxt = cpytr(trans[n][T1->st]);
				T0 = T0->nxt;
				reach[T1->st] = 1;
				imed(T0, T1->st, n, i);
	}	}	}
	if (state_tables >= 2)
	{	printf("STEP 3 %s\n", 
			procname[n]);
		for (i = 1; i < m; i++)
		for (T0 = trans[n][i]; T0; T0 = T0->nxt)
			crack(n, i, T0, srcln);
		return;
	}
#ifdef HAS_UNLESS
	for (i = 1; i < m; i++)
	{	if (!trans[n][i]) continue;
		/* check for each state i if an
		 * escape to some state p is defined
		 * if so, copy and mark p's transitions
		 * and prepend them to the transition-
		 * list of state i
		 */
	 if (!like_java) /* the default */
	 {	for (T0 = trans[n][i]; T0; T0 = T0->nxt)
		for (k = HAS_UNLESS-1; k >= 0; k--)
		{	if (p = T0->escp[k])
			for (T1 = trans[n][p]; T1; T1 = T1->nxt)
			{	if (isthere(trans[n][i], T1->t_id))
					continue;
				T2 = cpytr(T1);
				T2->e_trans = p;
				T2->nxt = trans[n][i];
				trans[n][i] = T2;
		}	}
	 } else /* outermost unless checked first */
	 {	T4 = T3 = (Trans *) 0;
		for (T0 = trans[n][i]; T0; T0 = T0->nxt)
		for (k = HAS_UNLESS-1; k >= 0; k--)
		{	if (p = T0->escp[k])
			for (T1 = trans[n][p]; T1; T1 = T1->nxt)
			{	if (isthere(trans[n][i], T1->t_id))
					continue;
				T2 = cpytr(T1);
				T2->nxt = (Trans *) 0;
				T2->e_trans = p;
				if (T3)	T3->nxt = T2;
				else	T4 = T2;
				T3 = T2;
		}	}
		if (T4)
		{	T3->nxt = trans[n][i];
			trans[n][i] = T4;
		}
	 }
	}
#endif
#ifndef NOREDUCE
	for (i = 1; i < m; i++)
	{	if (a_cycles)
		{ /* moves through these states are visible */
	#if PROG_LAB>0 && defined(HAS_NP)
			if (progstate[n][i])
				goto degrade;
			for (T1 = trans[n][i]; T1; T1 = T1->nxt)
				if (progstate[n][T1->st])
					goto degrade;
	#endif
			if (accpstate[n][i] || visstate[n][i])
				goto degrade;
			for (T1 = trans[n][i]; T1; T1 = T1->nxt)
				if (accpstate[n][T1->st])
					goto degrade;
		}
		T1 = trans[n][i];
		if (!T1) continue;
		g = mark_safety(T1);	/* V3.3.1 */
		if (g < 0) goto degrade; /* global */
		/* check if mixing of guards preserves reduction */
		if (T1->nxt)
		{	k = 0;
			for (T0 = T1; T0; T0 = T0->nxt)
			{	if (!(T0->atom&8))
					goto degrade;
				for (aa = 0; aa < 2; aa++)
				{	j = srinc_set(T0->tpe[aa]);
					if (j >= GLOBAL && j != ALPHA_F)
						goto degrade;
					if (T0->tpe[aa]
					&&  T0->tpe[aa]
					!=  T1->tpe[0])
						k = 1;
			}	}
			/* g = 0;	V3.3.1 */
			if (k)	/* non-uniform selection */
			for (T0 = T1; T0; T0 = T0->nxt)
			for (aa = 0; aa < 2; aa++)
			{	j = srinc_set(T0->tpe[aa]);
				if (j != LOCAL)
				{	k = srunc(T0->tpe[aa], j);
					for (h = 0; h < 6; h++)
						if (T1->qu[h] == k
						&&  T1->ty[h] == j)
							break;
					if (h >= 6)
					{	T1->qu[g%6] = k;
						T1->ty[g%6] = j;
						g++;
			}	}	}
			if (g > 6)
			{	T1->qu[0] = 0;	/* turn it off */
				printf("pan: warning, line %d, ",
					srcln[i]);
			 	printf("too many stmnt types (%d)",
					g);
			  	printf(" in selection\n");
			  goto degrade;
			}
		}
		/* mark all options global if >=1 is global */
		for (T1 = trans[n][i]; T1; T1 = T1->nxt)
			if (!(T1->atom&8)) break;
		if (T1)
degrade:	for (T1 = trans[n][i]; T1; T1 = T1->nxt)
			T1->atom &= ~8;	/* mark as unsafe */
		/* can only mix 'r's or 's's if on same chan */
		/* and not mixed with other local operations */
		T1 = trans[n][i];
		if (!T1 || T1->qu[0]) continue;
		j = T1->tpe[0];
		if (T1->nxt && T1->atom&8)
		{ if (j == 5*DELTA)
		  {	printf("warning: line %d ", srcln[i]);
			printf("mixed condition ");
			printf("(defeats reduction)\n");
			goto degrade;
		  }
		  for (T0 = T1; T0; T0 = T0->nxt)
		  for (aa = 0; aa < 2; aa++)
		  if  (T0->tpe[aa] && T0->tpe[aa] != j)
		  {	printf("warning: line %d ", srcln[i]);
			printf("[%d-%d] mixed %stion ",
				T0->tpe[aa], j, 
				(j==5*DELTA)?"condi":"selec");
			printf("(defeats reduction)\n");
			printf("	'%s' <-> '%s'\n",
				T1->tp, T0->tp);
			goto degrade;
		} }
	}
#endif
	for (i = 1; i < m; i++)
	{	T2 = trans[n][i];
		if (!T2
		||  T2->nxt
		||  strncmp(T2->tp, ".(goto)", 7)
		||  !stopstate[n][i])
			continue;
		stopstate[n][T2->st] = 1;
	}
	if (state_tables && !verbose)
	{	if (dodot)
		{	char buf[256], *q = buf, *p = procname[n];
			while (*p != '\0')
			{	if (*p != ':')
				{	*q++ = *p;
				}
				p++;
			}
			*q = '\0';
			printf("digraph ");
			switch (Btypes[n]) {
			case I_PROC:  printf("init {\n"); break;
			case N_CLAIM: printf("claim_%s {\n", buf); break;
			case E_TRACE: printf("notrace {\n"); break;
			case N_TRACE: printf("trace {\n"); break;
			default:      printf("p_%s {\n", buf); break;
			}
			printf("size=\"8,10\";\n");
			printf("  GT [shape=box,style=dotted,label=\"%s\"];\n", buf);
			printf("  GT -> S%d;\n", is);
		} else
		{	switch (Btypes[n]) {
			case I_PROC:  printf("init\n"); break;
			case N_CLAIM: printf("claim %s\n", procname[n]); break;
			case E_TRACE: printf("notrace assertion\n"); break;
			case N_TRACE: printf("trace assertion\n"); break;
			default:      printf("proctype %s\n", procname[n]); break;
		}	}
		for (i = 1; i < m; i++)
		{	reach[i] = 1;
		}
		tagtable(n, m, is, srcln, reach);
		if (dodot) printf("}\n");
	} else
	for (i = 1; i < m; i++)
	{	int nrelse;
		if (Btypes[n] != N_CLAIM)
		{	for (T0 = trans[n][i]; T0; T0 = T0->nxt)
			{	if (T0->st == i
				&& strcmp(T0->tp, "(1)") == 0)
				{	printf("error: proctype '%s' ",
						procname[n]);
		  			printf("line %d, state %d: has un",
						srcln[i], i);
					printf("conditional self-loop\n");
					pan_exit(1);
		}	}	}
		nrelse = 0;
		for (T0 = trans[n][i]; T0; T0 = T0->nxt)
		{	if (strcmp(T0->tp, "else") == 0)
				nrelse++;
		}
		if (nrelse > 1)
		{	printf("error: proctype '%s' state",
				procname[n]);
		  	printf(" %d, inherits %d", i, nrelse);
		  	printf(" 'else' stmnts\n");
			pan_exit(1);
	}	}
#if !defined(LOOPSTATE) && !defined(BFS_PAR)
	if (state_tables)
#endif
	do_dfs(n, m, is, srcln, reach, lpstate);

	if (!t_reverse)
	{	return;
	}
	/* process n, with m states, is=initial state -- reverse list */
	if (!state_tables && Btypes[n] != N_CLAIM)
	{	for (i = 1; i < m; i++)
		{	Trans *Tx = (Trans *) 0; /* list of escapes */
			Trans *Ty = (Trans *) 0; /* its tail element */
			T1 = (Trans *) 0; /* reversed list */
			T2 = (Trans *) 0; /* its tail */
			T3 = (Trans *) 0; /* remembers possible 'else' */

			/* find unless-escapes, they should go first */
			T4 = T5 = T0 = trans[n][i];
	#ifdef HAS_UNLESS
			while (T4 && T4->e_trans) /* escapes are first in orig list */
			{	T5 = T4;	  /* remember predecessor */
				T4 = T4->nxt;
			}
	#endif
			/* T4 points to first non-escape, T5 to its parent, T0 to original list */
			if (T4 != T0)		 /* there was at least one escape */
			{	T3 = T5->nxt;		 /* start of non-escapes */
				T5->nxt = (Trans *) 0;	 /* separate */
				Tx = T0;		 /* start of the escapes */
				Ty = T5;		 /* its tail */
				T0 = T3;		 /* the rest, to be reversed */
			}
			/* T0 points to first non-escape, Tx to the list of escapes, Ty to its tail */

			/* first tail-add non-escape transitions, reversed */
			T3 = (Trans *) 0;
			for (T5 = T0; T5; T5 = T4)
			{	T4 = T5->nxt;
	#ifdef HAS_UNLESS
				if (T5->e_trans)
				{	printf("error: cannot happen!\n");
					continue;
				}
	#endif
				if (strcmp(T5->tp, "else") == 0)
				{	T3 = T5;
					T5->nxt = (Trans *) 0;
				} else
				{	T5->nxt = T1;
					if (!T1) { T2 = T5; }
					T1 = T5;
			}	}
			/* T3 points to a possible else, which is removed from the list */
			/* T1 points to the reversed list so far (without escapes) */
			/* T2 points to the tail element -- where the else should go */
			if (T2 && T3)
			{	T2->nxt = T3;	/* add else */
			} else
			{	if (T3) /* there was an else, but there's no tail */
				{	if (!T1)	/* and no reversed list */
					{	T1 = T3; /* odd, but possible */
					} else		/* even stranger */
					{	T1->nxt = T3;
			}	}	}

			/* add in the escapes, to that they appear at the front */
			if (Tx && Ty) { Ty->nxt = T1; T1 = Tx; }

			trans[n][i] = T1;
			/* reversed, with escapes first and else last */
	}	}
	if (state_tables && verbose)
	{	printf("FINAL proctype %s\n", 
			procname[n]);
		for (i = 1; i < m; i++)
		for (T0 = trans[n][i]; T0; T0 = T0->nxt)
			crack(n, i, T0, srcln);
	}
}
void
imed(Trans *T, int v, int n, int j)	/* set intermediate state */
{	progstate[n][T->st] |= progstate[n][v];
	accpstate[n][T->st] |= accpstate[n][v];
	stopstate[n][T->st] |= stopstate[n][v];
	mapstate[n][j] = T->st;
}
void
tagtable(int n, int m, int is, short srcln[], uchar reach[])
{	Trans *z;

	if (is >= m || !trans[n][is]
	||  is <= 0 || reach[is] == 0)
		return;
	reach[is] = 0;
	if (state_tables)
	for (z = trans[n][is]; z; z = z->nxt)
	{	if (dodot)
			dot_crack(n, is, z);
		else
			crack(n, is, z, srcln);
	}

	for (z = trans[n][is]; z; z = z->nxt)
	{
#ifdef HAS_UNLESS
		int i, j;
#endif
		tagtable(n, m, z->st, srcln, reach);
#ifdef HAS_UNLESS
		for (i = 0; i < HAS_UNLESS; i++)
		{	j = trans[n][is]->escp[i];
			if (!j) break;
			tagtable(n, m, j, srcln, reach);
		}
#endif
	}
}

extern Trans *t_id_lkup[];

void
dfs_table(int n, int m, int is, short srcln[], uchar reach[], uchar lpstate[])
{	Trans *z;

	if (is >= m || is <= 0 || !trans[n][is])
		return;
	if ((reach[is] & (4|8|16)) != 0)
	{	if ((reach[is] & (8|16)) == 16)	/* on stack, not yet recorded */
		{	lpstate[is] = 1;
			reach[is] |= 8; /* recorded */
			if (state_tables && verbose)
			{	printf("state %d line %d is a loopstate\n", is, srcln[is]);
		}	}
		return;
	}
	reach[is] |= (4|16);	/* visited | onstack */
	for (z = trans[n][is]; z; z = z->nxt)
	{	t_id_lkup[z->t_id] = z;
#ifdef HAS_UNLESS
		int i, j;
#endif
		dfs_table(n, m, z->st, srcln, reach, lpstate);
#ifdef HAS_UNLESS
		for (i = 0; i < HAS_UNLESS; i++)
		{	j = trans[n][is]->escp[i];
			if (!j) break;
			dfs_table(n, m, j, srcln, reach, lpstate);
		}
#endif
	}
	reach[is] &= ~16; /* no longer on stack */
}
void
do_dfs(int n, int m, int is, short srcln[], uchar reach[], uchar lpstate[])
{	int i;
	dfs_table(n, m, is, srcln, reach, lpstate);
	for (i = 0; i < m; i++)
		reach[i] &= ~(4|8|16);
}
void
crack(int n, int j, Trans *z, short srcln[])
{	int i;

	if (!z) return;
	printf("	state %3d -(tr %3d)-> state %3d  ",
		j, z->forw, z->st);
	printf("[id %3d tp %3d", z->t_id, z->tpe[0]);
	if (z->tpe[1]) printf(",%d", z->tpe[1]);
#ifdef HAS_UNLESS
	if (z->e_trans)
		printf(" org %3d", z->e_trans);
	else if (state_tables >= 2)
	for (i = 0; i < HAS_UNLESS; i++)
	{	if (!z->escp[i]) break;
		printf(" esc %d", z->escp[i]);
	}
#endif
	printf("]");
	printf(" [%s%s%s%s%s] %s:%d => ",
		z->atom&6?"A":z->atom&32?"D":"-",
		accpstate[n][j]?"a" :"-",
		stopstate[n][j]?"e" : "-",
		progstate[n][j]?"p" : "-",
		z->atom & 8 ?"L":"G",
		PanSource, srcln[j]);
	for (i = 0; z->tp[i]; i++)
		if (z->tp[i] == '\n')
			printf("\\n");
		else
			putchar(z->tp[i]);
	if (verbose && z->qu[0])
	{	printf("\t[");
		for (i = 0; i < 6; i++)
			if (z->qu[i])
				printf("(%d,%d)",
				z->qu[i], z->ty[i]);
		printf("]");
	}
	printf("\n");
	fflush(stdout);
}
/* spin -a m.pml; cc -o pan pan.c; ./pan -D | dot -Tps > foo.ps; ps2pdf foo.ps */
void
dot_crack(int n, int j, Trans *z)
{	int i;

	if (!z) return;
	printf("	S%d -> S%d  [color=black", j, z->st);

	if (z->atom&6) printf(",style=dashed");
	else if (z->atom&32) printf(",style=dotted");
	else if (z->atom&8) printf(",style=solid");
	else printf(",style=bold");

	printf(",label=\"");
	for (i = 0; z->tp[i]; i++)
	{	if (z->tp[i] == '\\'
		&&  z->tp[i+1] == 'n')
		{	i++; printf(" ");
		} else
		{	putchar(z->tp[i]);
	}	}
	printf("\"];\n");
	if (accpstate[n][j]) printf("  S%d [color=red,style=bold];\n", j);
	else if (progstate[n][j]) printf("  S%d [color=green,style=bold];\n", j);
	if (stopstate[n][j]) printf("  S%d [color=blue,style=bold,shape=box];\n", j);
}

#ifdef VAR_RANGES
#define BYTESIZE	32	/* 2^8 : 2^3 = 256:8 = 32 */

typedef struct Vr_Ptr {
	char	*nm;
	uchar	vals[BYTESIZE];
	struct Vr_Ptr *nxt;
} Vr_Ptr;
Vr_Ptr *ranges = (Vr_Ptr *) 0;

void
logval(char *s, int v)
{	Vr_Ptr *tmp;

	if (v<0 || v > 255) return;
	for (tmp = ranges; tmp; tmp = tmp->nxt)
		if (!strcmp(tmp->nm, s))
			goto found;
	tmp = (Vr_Ptr *) emalloc(sizeof(Vr_Ptr));
	tmp->nxt = ranges;
	ranges = tmp;
	tmp->nm = s;
found:
	tmp->vals[(v)/8] |= 1<<((v)%8);
}

void
dumpval(uchar X[], int range)
{	int w, x, i, j = -1;

	for (w = i = 0; w < range; w++)
	for (x = 0; x < 8; x++, i++)
	{
from:		if ((X[w] & (1<<x)))
		{	printf("%d", i);
			j = i;
			goto upto;
	}	}
	return;
	for (w = 0; w < range; w++)
	for (x = 0; x < 8; x++, i++)
	{
upto:		if (!(X[w] & (1<<x)))
		{	if (i-1 == j)
				printf(", ");
			else
				printf("-%d, ", i-1);
			goto from;
	}	}
	if (j >= 0 && j != 255)
		printf("-255");
}

void
dumpranges(void)
{	Vr_Ptr *tmp;
	printf("\nValues assigned within ");
	printf("interval [0..255]:\n");
	for (tmp = ranges; tmp; tmp = tmp->nxt)
	{	printf("\t%s\t: ", tmp->nm);
		dumpval(tmp->vals, BYTESIZE);
		printf("\n");
	}
}
#endif