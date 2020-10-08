INSERT INTO dbo.Dodatek
VALUES ('DOD1','Lot balonem',1000),
('DOD1','Lot balonem',1000),
('DOD1','Lot balonem',1000)
;

-- Dane poprawe. Po procesie ETL powinna zaislić hurtownię danych 
INSERT INTO dbo.Nocleg
VALUES ('NOC1','Nassari','15','05-264','Giza','Egipt','Nootel',5,'548987895',450); 
-- Dane poprawe. Po procesie ETL powinna zaislić hurtownię danych
INSERT INTO dbo.Klient
VALUES ('K001','Kaliskiego','13','01-480','Warszawa','Polska','Karol','Darwin','518091132');
-- Dane poprawe. Po procesie ETL powinna zaislić hurtownię danych
INSERT INTO dbo.RejestrZamowien
VALUES ('K001','WYC1','PRAC01',2,'2019-01-15 00:00','2019-01-20 00:00'), 
-- Dane poprawe. Po procesie ETL powinna zaislić hurtownię danych
('K003','WYC3','PRAC02',3,'2019-01-01 00:00','2019-01-02 00:00'),
('K002','WYC2','PRAC01',1,'2019-02-03 00:00','2019-02-07 00:00'),
('K001','WYC2','PRAC03',2,'2019-02-09 00:00','2019-02-09 00:00');
-- Dane niepoprawne - nie ma wymiaru danego faktu
INSERT INTO dbo.HotelWycieczka
VALUES ('NOC1','WYC1','2019-09-16 00:00','2019-09-22 00:00'),
-- Dane poprawe. Po procesie ETL powinna zaislić hurtownię danych
('NOC2','WYC3', '2019-08-18 00:00','2019-08-27 00:00'),
('NOC4','WYC1', '2019-05-11 00:00','2019-05-13 00:00');
-- Dane niepoprawne - nie ma wymiaru danego faktu
INSERT INTO dbo.RejestrDodatekNocleg
VALUES ('NOC1','DOD1'),
-- Dane poprawe. Po procesie ETL powinna zaislić hurtownię danych
('NOC1','DOD4'),('NOC3','DOD1'),
('NOC2','DOD4'),('NOC2','DOD2');
-- Dane niepoprawne - nie ma wymiaru danego faktu

INSERT INTO dbo.RejestrDodatekWycieczka
VALUES ('DOD1','WYC1'),
-- Dane poprawe. Po procesie ETL powinna zaislić hurtownię danych
('DOD2','WYC1'),('DOD3','WYC3'),
('DOD2','WYC2'),('DOD4','WYC3'),('DOD1','WYC4'); 
-- Dane niepoprawne - nie ma wymiaru danego faktu
