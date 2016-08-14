/*
person("vasyl","male").
person("anatoly","male").
person("igor","male").
person("hanna","femail").
person("dmytro","natalka").
*/

roditel(person("vasyl","male"),person("anatoly","male")).
roditel(person("vasyl","male"),person("igor","male")).
roditel(person("hanna","female"),person("anatoly","male")).
roditel(person("hanna","female"),person("igor","male")).
roditel(person("dmytro","male"),person("natalka","female")).
roditel(person("dmytro","male"),person("marina","female")).
roditel(person("nadya","female"),person("natalka","female")).
roditel(person("nadya","female"),person("marina","female")).

roditel(person("igor","male"),person("evgen","male")).
roditel(person("igor","male"),person("oleksa","male")).
roditel(person("natalka","female"),person("evgen","male")).
roditel(person("natalka","female"),person("oleksa","male")).
roditel(person("mykola","male"),person("oksana","female")).
roditel(person("olga","female"),person("oksana","female")).

roditel(person("oleksa","male"),person("petro","male")).
roditel(person("oleksa","male"),person("roman","male")).
roditel(person("oksana","female"),person("petro","male")).
roditel(person("oksana","female"),person("roman","male")).

are_parent(Parent) :-
    roditel(Parent,Child),
    roditel(GrandParent,Parent).

nochild(Person) :-
    roditel(Parent,Person),
    not roditel(Person,Child).

father(Father) :-
    roditel(Father,Child),
    Father = person(_,"male").

mother(Mother) :-
    roditel(Mother,Child),
    Mother = person(_,"female").

sun(Sun) :-
    roditel(Parent,Sun),
    Sun = person(_,"male").

daugther(Daughter) :-
    roditel(Parent,Daughter),
    Daughter = person(_,"female").

brother(Brother) :-
    Brother = person(_,"male"),
    roditel(Parent,Brother),
    roditel(Parent,Person).

sister(Sister) :-
    Sister = person(_,"female"),
    roditel(Parent,Sister),
    roditel(Parent,Person).

unkle(Unkle) :-
    Unkle = person(_,"male"),
    roditel(Parent,Unkle),
    roditel(Parent,Person),
    roditel(Person,Child),
    not roditel(Unkle,Child).

unte(Unte) :-
    Unte = person(_,"female"),
    roditel(Parent,Unte),
    roditel(Parent,Person),
    roditel(Person,Child),
    not roditel(Unte,Child).

grandpa(GrandPa) :-
    GrandPa = person(_,"male"),
    roditel(GrandPa,Child),
    roditel(Child,Grandchild).

grandma(GrandMa) :-
    GrandMa = person(_,"female"),
    roditel(GrandMa,Child),
    roditel(Child,Grandchild).

grandsun(GDSun) :-
    GDSun = person(_,"male"),
    roditel(Grandpa,Child),
    roditel(Child,GDSun).

granddaughter(GDDaughter) :-
    GDDaughter = person(_,"female"),
    roditel(Grandpa,Child),
    roditel(Child,GDSun).

newphew(NewPhew) :-
    NewPhew = person(_,"male"),
    roditel(Parent,Child1),
    roditel(Parent,Child2),
    roditel(Child1,NewPhew),
    not roditel(Child2,NewPhew).

niece(Niece) :-
    Niece = person(_,"female"),
    roditel(Parent,Child1),
    roditel(Parent,Child2),
    roditel(Child1,Niece),
    not roditel(Child2,Niece).

lovepair(She,He) :-
    She = person(_,"female"),
    He = person(_,"male"),
    roditel(Parent,She),
    roditel(She,Child),
    roditel(He,Child),
    not roditel(Parent,He).

/* теща */
mother_in_law(Mo) :-
    Mo = person(_,"female"),
    lovepair(She,He),
    Daughter = She,
    Daughter = person(_,"female"),
    roditel(Mo,Daughter).

/* тесть */
father_in(Fi) :-
    Fi = person(_,"male"),
    lovepair(She,He),
    Son = He,
    Son = person(_,"male"),
    roditel(Fi,Son).

/* свекруха */
mother_in_law_s(Mo) :-
    Mo = person(_,"female"),
    lovepair(She,He),
    Son = He,
    Son = person(_,"male"),
    roditel(Mo,Son).

/* свекр */
father_in_s(Fi) :-
    Fi = person(_,"male"),
    lovepair(She,He),
    Son = He,
    Son = person(_,"male"),
    roditel(Fi,Son).

/* нев≥стка */
daughter_in_law(Dil) :-
    lovepair(Dil,He),
    roditel(Parent,He),
    Dil = person(_,"female").

/* з€ть */
son_in_h(Si) :-
    lovepair(She,He),
    roditel(Parent,She),
    Si = person(He,"male").

/* сво€чка - сестра дружини */
sister_of_wife(Sow) :-
   Sow = person(_,"female"),
   lovepair(She,He),
   roditel(Parent,She),
   roditel(Parent,Sow),
   roditel(She,Child),
   not roditel(Sow,Child).

/*д≥вер - брат чолов≥ка */
brother_of_husband(Boh) :-
   Boh = person(_,"male"),
   lovepair(She,He),
   roditel(Parent,He),
   roditel(Parent,Boh),
   roditel(He,Child),
   not roditel(Boh,Child).

/*сво€к - чолов≥к сво€чки */
husb(Husb) :-
    Husb = person(_,"male"),
    sister_of_wife(She),
    roditel(Husb,Child),
    roditel(She,Child).

/* внучатий плем≥нник(неб≥ж) - онук р≥дного брата/сестри */
onuk_rid(Onuk) :-
    roditel(Grand,Fath),
    roditel(Grand,K),
    roditel(Fath,Onuk),
    not roditel(K,Onuk).
