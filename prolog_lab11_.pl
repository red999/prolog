/*задання 1.  Підсумувати цілі позитивні числа, які йдуть
одне за другим з кроком d, закінчуються числом n. Значення
d та n вводяться за запитом з екрану монітора
(наприклад, d=3 та n=11, підсумок 11+8+5+2=26).
У випадку d>=n підсумок дорівнює n.
*/

/*
sequsum(D,N,R):- N =< D, R = N,!.

sequsum(D,N,R):- N1 is N-D, sequsum(D,N1,R1),

R is N+R1.

start:- writef("Enter d << "),read(D),

writef("Enter n << "),read(N),

sequsum(D,N,R),write(R).
*/


/*завдання 2.
Звести число a у цілий ступінь m (m може бути позитивним,
нульовим негативним). Скласти два варіанти програми: а)
використовуючи рекурсивний вираз a^m=a^(m-1)*a; б)
використовуючи можливість обчислень за формулою
a^(2*m)=a^m*a^m для парного ступеня. Визначити максимальний ступінь,
у який можна звести число a=2 по першому й другому варіантах програми.
Результати й причини їхнього розходження відобразити у висновках звіту.
*/


degree(A,0,1):-!.
degree(A,0,1):-!.

degree(A,1,A):-!.

degree(A,N,R):- N =< 0, N1 is (-N), degree(A,N1,R1), R is 1/R1,!.

degree(A,N,R):- (N mod 2) =:= 0, N1 is N/2, degree(A,N1,R1), R is (R1*R1),!.

degree(A,N,R):- N1 is N-1, degree(A,N1,R1), R is A*R1.




/*завдання 3.  Знайти підсумок цілих послідовних чисел від 0 до N.
*/

/*
sequsum(X,X,0):-!.

sequsum(X,X+1,0):-!.

sequsum(X,Y,Z) :- Y > X, X1 is X+1,

sequsum(X1,Y,Z1), Z is X+Z1.

calc(X,X,0):-!.

calc(X,Y,Z):- X1 is X+1,sequsum(X1,Y,Z).
*/

/*завдання 4. Обчислити значення наступних функцій,
використовуючи розкладання В ряд (в ітеративному варіанті
програми задавати точність обчислення функції):
*/

/*
mysin(X,E,LASTVALUE,PREVRES,FACTN,SIGN,RES):-

abs(RES - PREVRES) < E,

writef("mysin = "),write(RES),

REALSIN is sin(X),writef("\nSWIsin= "),write(REALSIN),!.

mysin(X,E,LASTVALUE,PREVRES,FACTN,SIGN,RES):-

X1 is X*X,

PREVRES1 is RES,

FACT is (FACTN+1)*(FACTN+2),

FACTN1 is FACTN+2,

SIGN1 is SIGN * (-1),

LASTVALUE1 is LASTVALUE*X1/FACT,

RES1 is RES + SIGN1*LASTVALUE1,

mysin(X,E,LASTVALUE1,PREVRES1,FACTN1,SIGN1,RES1).

start(X,E):-

LASTVALUE is (X*X*X)/(2*3),

PREVRES is X,

FACT is 6,

FACTN is 3,

SIGN is -1,

RES is PREVRES + SIGN*LASTVALUE,

mysin(X,E,LASTVALUE,PREVRES,FACTN,SIGN,RES).

go(X,E):-

abs(X)<10,start(X,E),!.

go(X,E):-

X > 0, X1 is X - 2 * 3.14159265358979323,

calc(X1,E),!.

go(X,E):-

X < 0, X1 is X + 2 * 3.14159265358979323,

calc(X1,E).

calc(X,E):-

go(X,E).

*/


















