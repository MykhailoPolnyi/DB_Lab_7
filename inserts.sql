use `polnyi_7_41`;

insert into `position` (`name`) values  ('bodyguard'), 
										('consulter'), 
                                        ('seller'), 
                                        ('caretaker');

insert into `street` (`name`) values ('Sadova'),
									 ('Dolishnia'),
                                     ('Pidlisna'),
                                     ('Pidgorodnia'),
                                     ('Gorototska'),
                                     ('Lychakivska'),
                                     ('Starosambirska'),
                                     ('Shevchenka'),
                                     ('Ivana Franka'),
                                     ('Lvivska');
                                     
insert into `cure_target` (`target`) values ('Head'),
											('Muscules'),
                                            ('Heart'),
                                            ('Stomach'),
                                            ('Lung'),
                                            ('Throat'),
                                            ('Eyes'),
                                            ('Ears'),
                                            ('Liver'),
                                            ('Nose');

insert into `cure` (`name`, `by_prescription`, `is_drug`, `is_psychotropic`) values ('Korvalol', 0, 0, 1),
																					('Analgin', 0, 1, 0),
                                                                                    ('Evkalor', 1, 0, 0),
                                                                                    ('Galazolin', 0, 1, 1),
                                                                                    ('Paratsetamol', 1, 1, 1),
                                                                                    ('Nazi win', 0, 0, 1),
                                                                                    ('Laptum forte', 0, 0, 0),
                                                                                    ('Teraflu', 0, 0, 0),
                                                                                    ('Karnityn', 0, 0, 0),
                                                                                    ('Bile Vugillia', 0, 0, 0);
                                                                                    
insert into `cure_has_target` (`cure_id`, `target`) values  ((select id from cure where cure.`name` = 'Korvalol'), 'Heart'),
															((select id from cure where cure.`name` = 'Laptum forte'), 'Muscules'),
                                                            ((select id from cure where cure.`name` = 'Analgin'), 'Head'),
                                                            ((select id from cure where cure.`name` = 'Evkalor'), 'Stomach'),
                                                            ((select id from cure where cure.`name` = 'Teraflu'), 'Lung'),
                                                            ((select id from cure where cure.`name` = 'Galazolin'), 'Throat'),
                                                            ((select id from cure where cure.`name` = 'Nazi win'), 'Nose'),
                                                            ((select id from cure where cure.`name` = 'Galazolin'), 'Nose'),
                                                            ((select id from cure where cure.`name` = 'Paratsetamol'), 'Head'),
                                                            ((select id from cure where cure.`name` = 'Karnityn'), 'Liver');
                                                            
insert into `pharmacy`  (`name`, `street`, `house_num`, `work_time_start`, `work_time_end`, `is_saturday_weekend`, `is_sunday_weekend`) values
						('Zelena apteka', 'Sadova', '11b', '08:00:00', '21:30:00', 0, 1),
                        ('D.S.', 'Sadova', '56', '09:15:00', '22:15:00', 0, 0),
                        ('Zelena apteka', 'Pidgorodnia', '221b', '08:00:00', '21:30:00', 1, 0),
                        ('Pulse', 'Dolishnia', '18', '07:30:00', '22:00:00', 1, 1),
                        ('Znakhar', 'Shevchenka', '94', '09:00:00', '21:00:00', 0, 0),
                        ('Podorozhnyk', 'Starosambirska', '1', '09:30:00', '00:15:00', 0, 1),
                        ('D.S.', 'Gorototska', '190', '09:15:00', '22:15:00', 0, 0),
                        ('Zelena apteka', 'Ivana Franka', '14', '08:00:00', '21:30:00', 0, 1),
                        ('Veres', 'Lvivska', '19a', '08:30:00', '21:21:21', 1, 1);

insert into `pharmacy_has_cure` (`pharmacy_id`, `cure_id`) values 
	((select id from pharmacy where `name`='Zelena apteka' and street='Sadova' and house_num='11b'), (select id from cure where `name`='Korvalol')),
  	((select id from pharmacy where `name`='Zelena apteka' and street='Sadova' and house_num='11b'), (select id from cure where `name`='Galazolin')),
	((select id from pharmacy where `name`='Zelena apteka' and street='Sadova' and house_num='11b'), (select id from cure where `name`='Paratsetamol')),
	((select id from pharmacy where `name`='Zelena apteka' and street='Sadova' and house_num='11b'), (select id from cure where `name`='Karnityn')),  
    ((select id from pharmacy where `name`='D.S.' and street='Sadova' and house_num='56'), (select id from cure where `name`='Analgin')),
	((select id from pharmacy where `name`='D.S.' and street='Sadova' and house_num='56'), (select id from cure where `name`='Evkalor')),
	((select id from pharmacy where `name`='D.S.' and street='Sadova' and house_num='56'), (select id from cure where `name`='Nazi win')),
	((select id from pharmacy where `name`='D.S.' and street='Sadova' and house_num='56'), (select id from cure where `name`='Teraflu')),
    ((select id from pharmacy where `name`='Pulse'), (select id from cure where `name`='Korvalol')),
	((select id from pharmacy where `name`='Pulse'), (select id from cure where `name`='Analgin')),
	((select id from pharmacy where `name`='Pulse'), (select id from cure where `name`='Karnityn'));

insert into `worker` (`surname`, `name`, `middle_name`, `pharmacy_id`, `position`, `id_number`, `passport_series_num`, `seniority`, `birth_date`) values
	('Петрова', 'Олександра', 'Сергіївна', (select id from pharmacy where `name`='Zelena apteka' and street='Sadova' and house_num='11b'), 'caretaker', '1026803149', 'IP 198422', 0, '1990-01-01'),
	('Вавринчук', 'Іван', 'Петрович', (select id from pharmacy where `name`='Zelena apteka' and street='Sadova' and house_num='11b'), 'bodyguard', '2480025962', 'KI 215427', 2, '1991-01-01'),
	('Пітков', 'Василь', 'Іванович', (select id from pharmacy where `name`='Zelena apteka' and street='Sadova' and house_num='11b'), 'consulter', '3607721219', 'KD 347126', 4, '1985-01-01'),
	('Жубрид', 'Іван', 'Андрійович', (select id from pharmacy where `name`='D.S.' and street='Sadova' and house_num='56'), 'bodyguard', '2334383650', 'OK 134150', 1, '1991-01-01'),
	('Андросюк', 'Василь', 'Романовив', (select id from pharmacy where `name`='D.S.' and street='Sadova' and house_num='56'), 'caretaker', '1105715894', 'SO 640829', 7, '1992-01-01'),
	('Філатов', 'Іван', 'Іванович', (select id from pharmacy where `name`='D.S.' and street='Sadova' and house_num='56'), 'bodyguard', '0815521855', 'SO 478595', 2, '1999-01-01'),
	('Рогожинська', 'Олександра', 'Павлівна', (select id from pharmacy where `name`='D.S.' and street='Sadova' and house_num='56'), 'consulter', '5440554452', 'SO 755453', 0, '1997-01-01'),
	('Польний', 'Василь', 'Вікторович', (select id from pharmacy where `name`='D.S.' and street='Sadova' and house_num='56'), 'caretaker', '2935039808', 'SP 349729', 1, '1996-01-01'),
	('Польний', 'Іван', 'Вікторович', (select id from pharmacy where `name`='D.S.' and street='Sadova' and house_num='56'), 'bodyguard', '9015931592', 'KI 330961', 0, '2002-01-01'),
	('Польна', 'Галина', 'Вікторівна', (select id from pharmacy where `name`='Pulse'), 'seller', '0584563307', 'IP 125664', 3, '1995-01-01'),
	('Стець', 'Галина', 'Матвіївна', (select id from pharmacy where `name`='Pulse'), 'caretaker', '3892611772', 'IP 924734', 0, '2003-01-01'),
	('Тиханський', 'Василь', 'Володимирович', (select id from pharmacy where `name`='Pulse'), 'bodyguard', '6088603788', 'OP 198416', 0, '1996-01-01'),
	('Дмитришин', 'Олександра', 'Максимівна', (select id from pharmacy where `name`='Pulse'), 'seller', '7308258425', 'IP 985463', 1, '1999-01-01');
