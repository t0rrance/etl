INSERT INTO dbo.Dodatek
VALUES ('DOD2','Safari',4500),
('DOD3','Nurkowanie',2000),
('DOD4','Niespodzianka',300);

INSERT INTO dbo.Nocleg
VALUES 
('NOC2','Rue de Rivoli','564','98-293','Paryż','Francja','Mercue',5,'938472123',780),
('NOC3','Rua Augusta','98','25-394','Lizbona','Portugalia','Ramada',5,'393874731',1000),
('NOC4','De Crosa','164','58-874','Lizbona','Portugalia','Star',3,'394830239',650);

INSERT INTO dbo.Klient
VALUES 
('K001','Kaliskiego','13','01-480','Warszawa','Polska','Karol','Nowak','518091132'),
-- Poprawna dana do przetestowania modyfikacji danych w hurtowni.
('K002','Nowa','1','01-234','Warszawa','Polska','Eryk','Blar','997997997'),
('K003','Kopernika','234','08-981','Łódź','Polska','Martyna','Śruba','523098655'),
('K004','Słoneczna','5A','02-123','Kraków','Polska','Karolina','Czartoryska','888333666');

-- Dane są poprawne. Niekóre z nich powinny naprawić błędy powstałe z braku wymiaru danego faktu.
