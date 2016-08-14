/*задание 1 */
sequsum(D,N,R) :- N=<D,R=N,!.
sequsum(D,N,R):- N1 is N-D, sequsum(D,N1,R1),

R is N+R1.

start:- writef("Enter d << "),read(D),

writef("Enter n << "),read(N),

sequsum(D,N,R),write(R).
