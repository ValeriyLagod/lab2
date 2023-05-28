% Домены
:- dynamic sum/1.

% Предикаты

% Проверка наличия лекарства в аптеке
available(Pharmacy, Medicine) :-
    pharmacy(_, Pharmacy, _, _, _),
    medicine(_, Medicine),
    sells(_, Medicine, _, Pharmacy).

% Поиск аптеки по идентификатору
searchByID(Id, Phone, Location) :-
    pharmacy(Id, _, Location, Phone, _).

% Поиск аптек, продающих определенное лекарство
match(Medicine, Pharm1, Pharm2, Pharm3, Pharm4, Price1, Price2, Price3, Price4) :-
    medicine(MedId, Medicine),
    sells(Id1, MedId, Price1, _),
    pharmacy(Id1, Pharm1, _, _, _),
    sells(Id2, MedId, Price2, _),
    pharmacy(Id2, Pharm2, _, _, _),
    sells(Id3, MedId, Price3, _),
    pharmacy(Id3, Pharm3, _, _, _),
    sells(Id4, MedId, Price4, _),
    pharmacy(Id4, Pharm4, _, _, _),
    Id1 \= Id2, Id1 \= Id3, Id1 \= Id4, Id2 \= Id3, Id2 \= Id4, Id3 \= Id4.

% Подсчет общего бюджета аптек
budget_summary :-
    pharmacy(_, _, _, _, Budget),
    sum(Sum),
    retract(sum(Sum)),
    NewSum is Sum + Budget,
    assert(sum(NewSum)),
    fail.

% Запуск программы
run :-
    consult('facts.pl'),
    console::init(),
    fail.

run :-
    available(Pharmacy, Medicine),
    stdio::write("Лекарство '", Medicine, "' доступно в аптеке '", Pharmacy, "'\n"),
    fail.

run :-
    searchByID(Id, Phone, Location),
    stdio::write("Аптека с ID ", Id, " находится по адресу '", Location, "' и имеет номер телефона '", Phone, "'\n"),
    fail.

run :-
    match(Medicine, Pharm1, Pharm2, Pharm3, Pharm4, Price1, Price2, Price3, Price4),
    stdio::write("Лекарство '", Medicine, "' доступно в аптеках '", Pharm1, "', '", Pharm2, "', '", Pharm3, "', '", Pharm4, "' с ценами: ", Price1, ", ", Price2, ", ", Price3, ", ", Price4, "\n"),
    fail.

run :-
    budget_summary().

run :-
    sum(Sum),
    stdio::write("Общий бюджет аптек: ", Sum, "\n"),
    fail.

run :-
    stdio::write("Тест завершен\n").
