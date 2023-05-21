% Факты о аптеках
pharmacy('Столички', 'ул. Пушкина, 10', '8-800-555-35-35').
pharmacy('Аптека+', 'ул. Лермонтова, 5', '8-800-555-25-25').
pharmacy('Аптека24', 'ул. Круглосуточная, 5', '8-800-555-25-25').
pharmacy('ГосАптека', 'ул. Государственная, 5', '8-800-555-25-25').
pharmacy('КайфАптека', 'ул. Кайфушная, 5', '8-800-555-25-25').
pharmacy('АуфАптека', 'ул. Арепитяна, 5', '8-800-555-25-25').
pharmacy('Аптека-кефтеме!', 'ул. Ленинский Проспект, 5', '8-800-555-25-25').
pharmacy('Здоровье', 'ул. Государственная, 5', '8-800-555-25-25').
pharmacy('Забота', 'ул. Лермонтова, 5', '8-800-555-25-25').
pharmacy('Скорая', 'ул. Лермонтова, 5', '8-800-555-25-25').
pharmacy('Аптека-да', 'ул. Лермонтова, 5', '8-800-555-25-25').
pharmacy('АптекаБомбаЧестноГоворя', 'ул. Лермонтова, 5', '8-800-555-25-25').
pharmacy('Семейная', 'ул. Лермонтова, 5', '8-800-555-25-25').
pharmacy('Черемушки', 'ул. Лермонтова, 5', '8-800-555-25-25').
pharmacy('Круглосуточная', 'ул. Лермонтова, 5', '8-800-555-25-25').


% Факты о лекарствах
medicine('Аспирин', 40, 10, 'Столички').
medicine('Анальгин', 30, 5, 'Аптека+').
medicine('Нигденеболин', 100, 3, 'Аптека+').
medicine('Головапроходин', 150, 7, 'Аптека+').
medicine('Парацетамол', 170, 7, 'Аптека+').
medicine('Паразитол', 50, 10, 'Столички')
medicine('Арбидол', 70, 10, 'Столички').
medicine('Фосфолидин', 90, 10, 'Столички').
medicine('CovidDestroyer', 550, 7, 'Аптека+').
medicine('CovidDestroyer', 550, 7, 'ГосАптека').
medicine('Мелатонин', 550, 7, 'Круглосуточная').
medicine('Фосфор', 550, 7, 'ГосАптека').
medicine('Фосфор', 510, 7, 'Черемушки').
medicine('Антибиотик', 150, 7, 'КайфАптека').
medicine('Цинк', 250, 7, 'АуфАптека').
medicine('CovidDestroyer', 550, 7, 'Аптека-Кефтеме!').
medicine('Арбидол', 550, 7, 'Здоровье').
medicine('Апропин', 510, 7, 'Забота').
medicine('Фосфорин', 590, 7, 'Скорая').
medicine('Калий', 566, 7, 'Аптека-да').
medicine('Магний', 110, 7, 'АптекаБомбаЧестноГоворя').
medicine('Натрий', 330, 7, 'Семейная').





% Правило для поиска аптеки по названию
find_pharmacy(Name, Address, Phone) :-
    pharmacy(Name, Address, Phone).


% Правило для поиска лекарства по названию
find_medicine(Name, Price, Count, Pharmacy) :-
    medicine(Name, Price, Count, Pharmacy).

% Правило для поиска доступных лекарств в аптеке
find_available_medicines(Pharmacy) :-
    findall(Name, medicine(Name, _, Count, Pharmacy), MedicineList),
    write('Доступные лекарства в аптеке '), write(Pharmacy), write(': '), write(MedicineList), nl.

% Правило для поиска аптеки с самым дешевым лекарством
find_cheapest_pharmacy(Name, Address, Phone) :-
    medicine(Name, Price, _, Pharmacy),
    \+ (medicine(_, Price2, _, Pharmacy), Price2 < Price),
    pharmacy(Pharmacy, Address, Phone),
    write('Аптека с самым дешевым лекарством '), write(Name), write(': '), write(Pharmacy), write(', Адрес: '), write(Address), nl.

    % Правило для вычисления суммы цен на лекарства в аптеке
calculate_total_price(Pharmacy, TotalPrice) :-
    findall(Price, medicine(_, Price, _, Pharmacy), Prices),
    sum_list(Prices, TotalPrice).
