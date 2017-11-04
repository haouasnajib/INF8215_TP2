word(abalone, a, b, a, l, o, n, e).
word(abandon, a, b, a, n, d, o, n).
word(enhance, e, n, h, a, n, c, e).
word(anagram, a, n, a, g, r, a, m).
word(connect, c, o, n, n, e, c, t).
word(elegant, e, l, e, g, a, n, t).

crossword(V1,V2,V3,H1,H2,H3) :- word(V1, _, AA, _, BA, _, CA, _), word(V2, _, AB, _, BB, _, CB, _), word(V3, _, AC, _, BC, _, CC, _),
word(H1, _, AA, _, AB, _, AC, _), word(H2, _, BA, _, BB, _, BC, _), word(H3, _, CA, _, CB, _, CC, _), !. % une seule solution suffit.
