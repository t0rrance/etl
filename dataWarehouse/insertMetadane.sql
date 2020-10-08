GO
TRUNCATE TABLE [MetadaneDelete]
INSERT INTO [MetadaneDelete] VALUES
('Dodatek', 'Baza', 'DB', 'KodDodatek'),
('HotelWycieczka', 'Baza', 'DB', '_KodNocleg+'':''+_KodWycieczka'),
('Klient', 'Baza', 'DB', 'KodKlient'),
('Nocleg', 'Baza', 'DB', 'KodNocleg'),
('RejestrDodatekNocleg', 'Baza', 'DB', '_KodNocleg+'':''+_KodDodatek'),
('RejestrDodatekWycieczka', 'Baza', 'DB', '_KodDodatek+'':''+_KodWycieczka'),
('RejestrZamowien', 'Baza', 'DB', '_KodKlient+'':''+_KodWycieczka+'':''+_KodPracownik')

GO
TRUNCATE TABLE [MetadaneGenerowanieKluczy]
INSERT INTO [MetadaneGenerowanieKluczy] VALUES
('Dodatek', 'KodDodatek', 'DB'),
('HotelWycieczka', '_KodNocleg+'':''+_KodWycieczka','DB'),
('Klient', 'KodKlient', 'DB'),
('Nocleg', 'KodNocleg',  'DB'),
('RejestrDodatekNocleg', '_KodNocleg+'':''+_KodDodatek',  'DB'),
('RejestrDodatekWycieczka', '_KodDodatek+'':''+_KodWycieczka',  'DB'),
('RejestrZamowien', '_KodKlient+'':''+_KodWycieczka+'':''+_KodPracownik', 'DB'),
('Pracownik', 'KodPracownik',  'CSV'),
('Wycieczka', 'KodWycieczka',  'CSV'),
('WycieczkaPracownik', '_KodWycieczka+'':''+_KodPracownik',  'CSV')

TRUNCATE TABLE MetadaneWczytanieDanychZeZrodla
INSERT INTO MetadaneWczytanieDanychZeZrodla VALUES

('CSV', '/Excel', '/Wycieczka.csv', 'KodWycieczka, Nazwa, IloscMiejsc, IloscZajetych, Cena, DataWyjazdu, DataPowrotu', 'WycieczkaCSV', 'KodWycieczka, Nazwa, IloscMiejsc, IloscZajetych, Cena, DataWyjazdu, DataPowrotu', 'KodWycieczka', null),
('CSV', '/Excel', '/Pracownik.csv', 'KodPracownik, Ulica, Nr, Kod, Miejscowosc, Kraj, Imie, Nazwisko, Telefon', 'PracownikCSV', 'KodPracownik, Ulica, Nr, Kod, Miejscowosc, Kraj, Imie, Nazwisko, Telefon', 'KodPracownik', null),
('CSV', '/Excel', '/WycieczkaPracownik.csv', '_KodWycieczka, _KodPracownik', 'WycieczkaPracownikCSV', '_KodWycieczka, _KodPracownik', '_KodWycieczka, _KodPracownik', null),
('DB', 'Baza', 'Dodatek', 'KodDodatek, Nazwa, Cena','DodatekDB', 'KodDodatek, Nazwa, Cena', 'KodDodatek', 'DodatekId'),
('DB', 'Baza', 'Klient', 'KodKlient, Ulica, Nr, Kod, Miejscowosc, Kraj, Imie, Nazwisko, Telefon', 'KlientDB', 'KodKlient, Ulica, Nr, Kod, Miejscowosc, Kraj, Imie, Nazwisko, Telefon', 'KodKlient', 'KlientId'),
('DB', 'Baza', 'Nocleg', 'KodNocleg, Ulica, Nr, Kod, Miejscowosc, Kraj, Nazwa, Standard, Telefon, Cena', 'NoclegDB', 'KodNocleg, Ulica, Nr, Kod, Miejscowosc, Kraj, Nazwa, Standard, Telefon, Cena', 'KodNocleg', 'NoclegId'),
('DB', 'Baza', 'RejestrDodatekNocleg', '_KodNocleg, _KodDodatek', 'RejestrDodatekNoclegDB', '_KodNocleg, _KodDodatek', '_KodNocleg, _KodDodatek', 'RejestrDodatekNoclegId'),
('DB', 'Baza', 'RejestrDodatekWycieczka', '_KodDodatek, _KodWycieczka', 'RejestrDodatekWycieczkaDB', '_KodDodatek, _KodWycieczka', '_KodDodatek ,_KodWycieczka', 'RejestrDodatekWycieczkaId'),
('DB', 'Baza', 'RejestrZamowien', '_KodKlient, _KodWycieczka, _KodPracownik, IloscMiejsc, DataZamowienia, DataPlatnosci', 'RejestrZamowienDB', '_KodKlient, _KodWycieczka, _KodPracownik, IloscMiejsc, DataZamowienia, DataPlatnosci', '_KodKlient, _KodWycieczka, _KodPracownik', 'RejestrZamowienId'),
('DB', 'Baza', 'HotelWycieczka', '_KodNocleg, _KodWycieczka, DataPrzyjazdu, DataWyjazdu', 'HotelWycieczkaDB', '_KodNocleg, _KodWycieczka, DataPrzyjazdu, DataWyjazdu', '_KodNocleg, _KodWycieczka', 'HotelWycieczkaId');

GO
TRUNCATE TABLE [MetadaneStageDoTmp]
INSERT INTO [MetadaneStageDoTmp] VALUES
('Pracownik', 'CSV', 'KodPracownik, Ulica, Nr, Kod, Miejscowosc, Kraj, Imie, Nazwisko, Telefon', 'IdPracownik', 'KodPracownik'),
('Wycieczka', 'CSV', 'KodWycieczka, Nazwa, IloscMiejsc, IloscZajetych, Cena, DataWyjazdu, DataPowrotu', 'IdWycieczka', 'KodWycieczka'),
('Dodatek', 'DB', 'KodDodatek, Nazwa, Cena', 'IdDodatek','KodDodatek'),
('Klient', 'DB', 'KodKlient, Ulica, Nr, Kod, Miejscowosc, Kraj, Imie, Nazwisko, Telefon', 'IdKlient', 'KodKlient'),
('Nocleg', 'DB', 'KodNocleg, Ulica, Nr, Kod, Miejscowosc, Kraj, Nazwa, Standard, Telefon, Cena', 'IdNocleg', 'KodNocleg'),
('RejestrDodatekNocleg', 'DB', '_KodNocleg , _KodDodatek', 'IdRejestrDodatekNocleg', '_KodNocleg+'':''+_KodDodatek'),
('RejestrDodatekWycieczka', 'DB', '_KodDodatek,_KodWycieczka', 'IdRejestrDodatekWycieczka', '_KodDodatek+'':''+_KodWycieczka'),
('RejestrZamowien', 'DB', '_KodKlient, _KodWycieczka, _KodPracownik, IloscMiejsc, DataZamowienia, DataPlatnosci', 'IdRejestrZamowien', '_KodKlient+'':''+_KodWycieczka+'':''+_KodPracownik'),
('HotelWycieczka', 'DB', '_KodNocleg, _KodWycieczka, DataPrzyjazdu, DataWyjazdu', 'IdHotelWycieczka', '_KodNocleg+'':''+_KodWycieczka'),
('WycieczkaPracownik', 'CSV', '_KodWycieczka, _KodPracownik', 'IdWycieczkaPracownik', '_KodWycieczka+'':''+_KodPracownik');


go

GO
TRUNCATE TABLE [MetadaneTmpDoStgLubBad]
INSERT INTO [MetadaneTmpDoStgLubBad] VALUES

( 'Dodatek', 'KodDodatek, Nazwa, Cena, StartDTTM, EndDTTM','IdDodatek', 1, null),
( 'Wycieczka', 'KodWycieczka, Nazwa, IloscMiejsc, IloscZajetych, Cena, DataWyjazdu, DataPowrotu, StartDTTM, EndDTTM', 'IdWycieczka',1,null ),
( 'Klient', 'KodKlient, Ulica, Nr, Kod, Miejscowosc, Kraj, Imie, Nazwisko, Telefon, StartDTTM, EndDTTM', 'IdKlient',1, null),
( 'Nocleg', 'KodNocleg, Ulica, Nr, Kod, Miejscowosc, Kraj, Nazwa, Standard, Telefon, Cena, StartDTTM, EndDTTM', 'IdNocleg',1, null),
( 'Pracownik', 'KodPracownik, Ulica, Nr, Kod, Miejscowosc, Kraj, Imie, Nazwisko, Telefon, StartDTTM, EndDTTM', 'IdPracownik',1, null),
( 'HotelWycieczka', '_KodNocleg, _KodWycieczka, DataPrzyjazdu, DataWyjazdu, StartDTTM, EndDTTM', 'IdHotelWycieczka',0, 'KodNocleg from Nocleg:KodWycieczka from Wycieczka'),
( 'RejestrDodatekNocleg', '_KodNocleg, _KodDodatek, StartDTTM, EndDTTM', 'IdRejestrDodatekNocleg',0,'KodNocleg from Nocleg:KodDodatek from Dodatek' ),
( 'RejestrDodatekWycieczka', '_KodDodatek, _KodWycieczka, StartDTTM, EndDTTM', 'IdRejestrDodatekWycieczka',0,'KodDodatek from Dodatek:KodWycieczka from Wycieczka'),
( 'RejestrZamowien', '_KodKlient, _KodWycieczka, _KodPracownik, IloscMiejsc, DataZamowienia, DataPlatnosci, StartDTTM, EndDTTM', 'IdRejestrZamowien',0,'KodKlient from Klient:KodWycieczka from Wycieczka:KodPracownik from Pracownik'),
( 'WycieczkaPracownik', '_KodWycieczka, _KodPracownik, StartDTTM, EndDTTM', 'IdWycieczkaPracownik',0,'KodWycieczka from Wycieczka:KodPracownik from Pracownik')

GO
TRUNCATE TABLE [MetadaneWczytanieDoHurtowni]
INSERT INTO [MetadaneWczytanieDoHurtowni] VALUES
( 'Dodatek', 'KodDodatek, Nazwa, Cena, StartDTTM, EndDTTM','IdDodatek', null),
( 'Wycieczka', 'KodWycieczka, Nazwa, IloscMiejsc, IloscZajetych, Cena, DataWyjazdu, DataPowrotu, StartDTTM, EndDTTM', 'IdWycieczka',null ),
( 'Klient', 'KodKlient, Ulica, Nr, Kod, Miejscowosc, Kraj, Imie, Nazwisko, Telefon, StartDTTM, EndDTTM', 'IdKlient', null),
( 'Nocleg', 'KodNocleg, Ulica, Nr, Kod, Miejscowosc, Kraj, Nazwa, Standard, Telefon, Cena, StartDTTM, EndDTTM', 'IdNocleg', null),
( 'Pracownik', 'KodPracownik, Ulica, Nr, Kod, Miejscowosc, Kraj, Imie, Nazwisko, Telefon, StartDTTM, EndDTTM', 'IdPracownik', null),
( 'HotelWycieczka', '_KodNocleg, _KodWycieczka, DataPrzyjazdu, DataWyjazdu, StartDTTM, EndDTTM', 'IdHotelWycieczka', 'KodNocleg from Nocleg:KodWycieczka from Wycieczka'),
( 'RejestrDodatekNocleg', '_KodNocleg, _KodDodatek, StartDTTM, EndDTTM', 'IdRejestrDodatekNocleg','KodNocleg from Nocleg:KodDodatek from Dodatek' ),
( 'RejestrDodatekWycieczka', '_KodDodatek, _KodWycieczka, StartDTTM, EndDTTM', 'IdRejestrDodatekWycieczka','KodDodatek from Dodatek:KodWycieczka from Wycieczka'),
( 'RejestrZamowien', '_KodKlient, _KodWycieczka, _KodPracownik, IloscMiejsc, DataZamowienia, DataPlatnosci, StartDTTM, EndDTTM', 'IdRejestrZamowien','KodKlient from Klient:KodWycieczka from Wycieczka:KodPracownik from Pracownik'),
( 'WycieczkaPracownik', '_KodWycieczka, _KodPracownik, StartDTTM, EndDTTM', 'IdWycieczkaPracownik','KodWycieczka from Wycieczka:KodPracownik from Pracownik')
































 