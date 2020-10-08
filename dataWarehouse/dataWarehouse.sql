/*==============================================================*/
/* Table: Dodatek                                               */
/*==============================================================*/
create table Dodatek (
   IdDodatek            int                  null,
   KodDodatek           varchar(10)                null,
   Nazwa                varchar(100)         null,
   Cena                 int                  null,
    StartDTTM   datetime  NULL,
	EndDTTM   datetime  NULL
)
go
create table DodatekBad (
   IdDodatek            int                  null,
   KodDodatek           varchar(10)                 null,
   Nazwa                varchar(100)         null,
   Cena                 int                  null,
    StartDTTM   datetime  NULL,
	 EndDTTM   datetime  NULL,
	 Rozwiazany   bit  NULL
)
go
create table DodatekDB (
   IdDodatekDB            int                  IDENTITY(1,1) NOT NULL,
   KodDodatek           varchar(10)                  null,
   Nazwa                varchar(100)         null,
   Cena                 int                  null,
	 StageDTTM   datetime  NULL,
	 DUPLIKAT   bit  NULL
)
go
create table DodatekStg (
   IdDodatek            int                  null,
   KodDodatek           varchar(10)                  null,
   Nazwa                varchar(100)         null,
   Cena                 int                  null,
    StartDTTM   datetime  NULL,
	 EndDTTM   datetime  NULL
)
go
create table DodatekTmp (
   IdDodatek            int                  null,
   KodDodatek          varchar(10)                  null,
   Nazwa                varchar(100)         null,
   Cena                 int                  null,
    StartDTTM   datetime  NULL,
	 EndDTTM   datetime  NULL
)
go

/*==============================================================*/
/* Table: HotelWycieczka                                        */
/*==============================================================*/
create table HotelWycieczka (
   IdHotelWycieczka     int                  null,
   _KodNocleg            varchar(10)                 null,
   _KodWycieczka         varchar(10)                null,
   DataPrzyjazdu        datetime             null,
   DataWyjazdu          datetime             null,
    StartDTTM   datetime  NULL,
	 EndDTTM   datetime  NULL
)
go
create table HotelWycieczkaBad (
   IdHotelWycieczka     int                  null,
   _KodNocleg            varchar(10)                 null,
   _KodWycieczka         varchar(10)                null,
   DataPrzyjazdu        datetime             null,
   DataWyjazdu          datetime             null,
    StartDTTM   datetime  NULL,
	 EndDTTM   datetime  NULL,
	 Rozwiazany   bit  NULL
)
go
create table HotelWycieczkaDB (
   IdHotelWycieczkaDB     int                  IDENTITY(1,1) NOT NULL,
   _KodNocleg            varchar(10)                 null,
   _KodWycieczka         varchar(10)                null,
   DataPrzyjazdu        datetime             null,
   DataWyjazdu          datetime             null,
    StageDTTM   datetime  NULL,
	 DUPLIKAT   bit  NULL
)
go
create table HotelWycieczkaStg (
   IdHotelWycieczka     int                  null,
   _KodNocleg            varchar(10)                 null,
   _KodWycieczka         varchar(10)                null,
   DataPrzyjazdu        datetime             null,
   DataWyjazdu          datetime             null,
    StartDTTM   datetime  NULL,
	 EndDTTM   datetime  NULL
)
go
create table HotelWycieczkaTmp (
   IdHotelWycieczka     int                  null,
  _KodNocleg            varchar(10)                 null,
   _KodWycieczka         varchar(10)                null,
   DataPrzyjazdu        datetime             null,
   DataWyjazdu          datetime             null,
    StartDTTM   datetime  NULL,
	 EndDTTM   datetime  NULL
)
go

/*==============================================================*/
/* Table: Klient                                                */
/*==============================================================*/
create table Klient (
   IdKlient             int                  null,
   KodKlient            varchar(10)                 null,
   Ulica                varchar(50)          null,
   Nr                   varchar(10)          null,
   Kod                  varchar(6)           null,
   Miejscowosc          varchar(80)          null,
   Kraj                 varchar(80)          null,
   Imie                 varchar(30)          null,
   Nazwisko             varchar(30)          null,
   Telefon              char(9)              null,
   StartDTTM   datetime  NULL,
	 EndDTTM   datetime  NULL
)
go
create table KlientBad (
   IdKlient             int                  null,
   KodKlient            varchar(10)                  null,
   Ulica                varchar(50)          null,
   Nr                   varchar(10)          null,
   Kod                  varchar(6)           null,
   Miejscowosc          varchar(80)          null,
   Kraj                 varchar(80)          null,
   Imie                 varchar(30)          null,
   Nazwisko             varchar(30)          null,
   Telefon              char(9)              null,
   StartDTTM   datetime  NULL,
	 EndDTTM   datetime  NULL,
	 Rozwiazany   bit  NULL
)
go
create table KlientDB (
   IdKlientDB             int                  IDENTITY(1,1) NOT NULL,
   KodKlient            varchar(10)                 null,
   Ulica                varchar(50)          null,
   Nr                   varchar(10)          null,
   Kod                  varchar(6)           null,
   Miejscowosc          varchar(80)          null,
   Kraj                 varchar(80)          null,
   Imie                 varchar(30)          null,
   Nazwisko             varchar(30)          null,
   Telefon              char(9)              null,
    StageDTTM   datetime  NULL,
	 DUPLIKAT   bit  NULL
)
go
create table KlientStg (
   IdKlient             int                  null,
   KodKlient            varchar(10)                  null,
   Ulica                varchar(50)          null,
   Nr                   varchar(10)          null,
   Kod                  varchar(6)           null,
   Miejscowosc          varchar(80)          null,
   Kraj                 varchar(80)          null,
   Imie                 varchar(30)          null,
   Nazwisko             varchar(30)          null,
   Telefon              char(9)              null,
   StartDTTM   datetime  NULL,
	 EndDTTM   datetime  NULL
)
go
create table KlientTmp (
   IdKlient             int                  null,
   KodKlient            varchar(10)                  null,
   Ulica                varchar(50)          null,
   Nr                   varchar(10)          null,
   Kod                  varchar(6)           null,
   Miejscowosc          varchar(80)          null,
   Kraj                 varchar(80)          null,
   Imie                 varchar(30)          null,
   Nazwisko             varchar(30)          null,
   Telefon              char(9)              null,
   StartDTTM   datetime  NULL,
	 EndDTTM   datetime  NULL
)
go


/*==============================================================*/
/* Table: Nocleg                                                */
/*==============================================================*/
create table Nocleg (
   IdNocleg             int                  null,
   KodNocleg           varchar(10)                  null,
   Ulica                varchar(50)          null,
   Nr                   varchar(10)          null,
   Kod                  varchar(6)           null,
   Miejscowosc          varchar(80)          null,
   Kraj                 varchar(80)          null,
   Nazwa                varchar(100)         null,
   Standard             int                  null,
   Telefon              char(9)              null,
   Cena                 int                  null,
    StartDTTM   datetime  NULL,
	 EndDTTM   datetime  NULL
)
go
create table NoclegBad (
   IdNocleg             int                  null,
   KodNocleg           varchar(10)                 null,
   Ulica                varchar(50)          null,
   Nr                   varchar(10)          null,
   Kod                  varchar(6)           null,
   Miejscowosc          varchar(80)          null,
   Kraj                 varchar(80)          null,
   Nazwa                varchar(100)         null,
   Standard             int                  null,
   Telefon              char(9)              null,
   Cena                 int                  null,
    StartDTTM   datetime  NULL,
	 EndDTTM   datetime  NULL,
	 Rozwiazany   bit  NULL
)
go
create table NoclegDB (
   IdNoclegDB             int                  IDENTITY(1,1) NOT NULL,
   KodNocleg            varchar(10)                  null,
   Ulica                varchar(50)          null,
   Nr                   varchar(10)          null,
   Kod                  varchar(6)           null,
   Miejscowosc          varchar(80)          null,
   Kraj                 varchar(80)          null,
   Nazwa                varchar(100)         null,
   Standard             int                  null,
   Telefon              char(9)              null,
   Cena                 int                  null,
     StageDTTM   datetime  NULL,
	 DUPLIKAT   bit  NULL
)
go
create table NoclegStg (
   IdNocleg             int                  null,
   KodNocleg            varchar(10)                  null,
   Ulica                varchar(50)          null,
   Nr                   varchar(10)          null,
   Kod                  varchar(6)           null,
   Miejscowosc          varchar(80)          null,
   Kraj                 varchar(80)          null,
   Nazwa                varchar(100)         null,
   Standard             int                  null,
   Telefon              char(9)              null,
   Cena                 int                  null,
    StartDTTM   datetime  NULL,
	 EndDTTM   datetime  NULL
)
go
create table NoclegTmp (
   IdNocleg             int                  null,
   KodNocleg            varchar(10)          null,
   Ulica                varchar(50)          null,
   Nr                   varchar(10)          null,
   Kod                  varchar(6)           null,
   Miejscowosc          varchar(80)          null,
   Kraj                 varchar(80)          null,
   Nazwa                varchar(100)         null,
   Standard             int                  null,
   Telefon              char(9)              null,
   Cena                 int                  null,
    StartDTTM   datetime  NULL,
	 EndDTTM   datetime  NULL
)
go

/*==============================================================*/
/* Table: Pracownik                                             */
/*==============================================================*/
create table Pracownik (
   IdPracownik          int                  null,
   KodPracownik         varchar(10)                  null,
   Ulica                varchar(50)          null,
   Nr                   varchar(10)          null,
   Kod                  varchar(6)           null,
   Miejscowosc          varchar(80)          null,
   Kraj                 varchar(80)          null,
   Imie                 varchar(30)          null,
   Nazwisko             varchar(30)          null,
   Telefon              char(9)              null,
    StartDTTM   datetime  NULL,
	 EndDTTM   datetime  NULL
)
go
create table PracownikBad (
   IdPracownik          int                  null,
   KodPracownik         varchar(10)                  null,
   Ulica                varchar(50)          null,
   Nr                   varchar(10)          null,
   Kod                  varchar(6)           null,
   Miejscowosc          varchar(80)          null,
   Kraj                 varchar(80)          null,
   Imie                 varchar(30)          null,
   Nazwisko             varchar(30)          null,
   Telefon              char(9)              null,
    StartDTTM   datetime  NULL,
	 EndDTTM   datetime  NULL,
	 Rozwiazany   bit  NULL
)
go
create table PracownikCSV (
   IdPracownikCSV          int                  IDENTITY(1,1) NOT NULL,
   KodPracownik         varchar(10)                  null,
   Ulica                varchar(50)          null,
   Nr                   varchar(10)          null,
   Kod                  varchar(6)           null,
   Miejscowosc          varchar(80)          null,
   Kraj                 varchar(80)          null,
   Imie                 varchar(30)          null,
   Nazwisko             varchar(30)          null,
   Telefon              char(9)              null,
     StageDTTM   datetime  NULL,
	 DUPLIKAT   bit  NULL
)
go
create table PracownikCSVBezDTTM (
   KodPracownik         varchar(10)                  null,
   Ulica                varchar(50)          null,
   Nr                   varchar(10)          null,
   Kod                  varchar(6)           null,
   Miejscowosc          varchar(80)          null,
   Kraj                 varchar(80)          null,
   Imie                 varchar(30)          null,
   Nazwisko             varchar(30)          null,
   Telefon              char(9)              null
)



go
create table PracownikStg (
   IdPracownik          int                  null,
   KodPracownik         varchar(10)                  null,
   Ulica                varchar(50)          null,
   Nr                   varchar(10)          null,
   Kod                  varchar(6)           null,
   Miejscowosc          varchar(80)          null,
   Kraj                 varchar(80)          null,
   Imie                 varchar(30)          null,
   Nazwisko             varchar(30)          null,
   Telefon              char(9)              null,
    StartDTTM   datetime  NULL,
	 EndDTTM   datetime  NULL
)
go
create table PracownikTmp (
   IdPracownik          int                  null,
   KodPracownik         varchar(10)                  null,
   Ulica                varchar(50)          null,
   Nr                   varchar(10)          null,
   Kod                  varchar(6)           null,
   Miejscowosc          varchar(80)          null,
   Kraj                 varchar(80)          null,
   Imie                 varchar(30)          null,
   Nazwisko             varchar(30)          null,
   Telefon              char(9)              null,
    StartDTTM   datetime  NULL,
	 EndDTTM   datetime  NULL
)
go


/*==============================================================*/
/* Table: RejestrDodatekNocleg                                  */
/*==============================================================*/
create table RejestrDodatekNocleg (
   IdRejestrDodatekNocleg int                  null,
   _KodNocleg            varchar(10)                  null,
   _KodDodatek           varchar(10)                  null,
    StartDTTM   datetime  NULL,
	 EndDTTM   datetime  NULL
)
go
create table RejestrDodatekNoclegBad (
   IdRejestrDodatekNocleg int                  null,
   _KodNocleg            varchar(10)                  null,
   _KodDodatek           varchar(10)                  null,
    StartDTTM   datetime  NULL,
	 EndDTTM   datetime  NULL,
	 Rozwiazany   bit  NULL
)
go
create table RejestrDodatekNoclegDB (
   IdRejestrDodatekNoclegDB int                 IDENTITY(1,1) NOT NULL,
   _KodNocleg            varchar(10)                  null,
   _KodDodatek           varchar(10)                  null,
    StageDTTM   datetime  NULL,
	 DUPLIKAT   bit  NULL
)
go
create table RejestrDodatekNoclegStg (
   IdRejestrDodatekNocleg int                  null,
  _KodNocleg            varchar(10)                  null,
   _KodDodatek           varchar(10)                  null,
    StartDTTM   datetime  NULL,
	 EndDTTM   datetime  NULL
)
go
create table RejestrDodatekNoclegTmp (
   IdRejestrDodatekNocleg int                  null,
   _KodNocleg            varchar(10)                  null,
   _KodDodatek           varchar(10)                  null,
    StartDTTM   datetime  NULL,
	 EndDTTM   datetime  NULL
)
go


/*==============================================================*/
/* Table: RejestrDodatekWycieczka                               */
/*==============================================================*/
create table RejestrDodatekWycieczka (
   IdRejestrDodatekWycieczka int                  null,
   _KodDodatek           varchar(10)                  null,
   _KodWycieczka         varchar(10)                  null,
    StartDTTM   datetime  NULL,
	 EndDTTM   datetime  NULL
)
go
create table RejestrDodatekWycieczkaBad (
   IdRejestrDodatekWycieczka int                  null,
    _KodDodatek           varchar(10)                  null,
   _KodWycieczka         varchar(10)                  null,
    StartDTTM   datetime  NULL,
	 EndDTTM   datetime  NULL,
	 Rozwiazany   bit  NULL
)
go
create table RejestrDodatekWycieczkaDB (
   IdRejestrDodatekWycieczkaDB int           IDENTITY(1,1) NOT NULL,
    _KodDodatek           varchar(10)                  null,
   _KodWycieczka         varchar(10)                  null,
    StageDTTM   datetime  NULL,
	 DUPLIKAT   bit  NULL
)
go
create table RejestrDodatekWycieczkaStg (
   IdRejestrDodatekWycieczka int                  null,
    _KodDodatek           varchar(10)                  null,
   _KodWycieczka         varchar(10)                  null,
    StartDTTM   datetime  NULL,
	 EndDTTM   datetime  NULL
)
go
create table RejestrDodatekWycieczkaTmp (
   IdRejestrDodatekWycieczka int                  null,
    _KodDodatek           varchar(10)                  null,
   _KodWycieczka         varchar(10)                  null,
    StartDTTM   datetime  NULL,
	 EndDTTM   datetime  NULL
)
go

/*==============================================================*/
/* Table: RejestrZamowien                                       */
/*==============================================================*/
create table RejestrZamowien (
   IdRejestrZamowien    int                  null,
   _KodKlient            varchar(10)                 null,
   _KodWycieczka         varchar(10)                  null,
   _KodPracownik         varchar(10)                  null,
   IloscMiejsc          int                  null,
   DataZamowienia       datetime             null,
   DataPlatnosci        datetime             null,
   StartDTTM   datetime  NULL,
	 EndDTTM   datetime  NULL
)
go
create table RejestrZamowienBad (
   IdRejestrZamowien    int                  null,
   _KodKlient            varchar(10)                 null,
   _KodWycieczka         varchar(10)                  null,
   _KodPracownik         varchar(10)                  null,
   IloscMiejsc          varchar(10)                  null,
   DataZamowienia       datetime             null,
   DataPlatnosci        datetime             null,
   StartDTTM   datetime  NULL,
	 EndDTTM   datetime  NULL,
	 Rozwiazany   bit  NULL
)
go
create table RejestrZamowienDB (
   IdRejestrZamowienDB    int                IDENTITY(1,1) NOT NULL,
   _KodKlient            varchar(10)                 null,
   _KodWycieczka         varchar(10)                  null,
   _KodPracownik         varchar(10)                  null,
   IloscMiejsc          int                  null,
   DataZamowienia       datetime             null,
   DataPlatnosci        datetime             null,
   StageDTTM   datetime  NULL,
	 DUPLIKAT   bit  NULL
)
go
create table RejestrZamowienStg (
   IdRejestrZamowien    int                  null,
   _KodKlient            varchar(10)                 null,
   _KodWycieczka         varchar(10)                  null,
   _KodPracownik         varchar(10)                  null,
   IloscMiejsc          int                  null,
   DataZamowienia       datetime             null,
   DataPlatnosci        datetime             null,
   StartDTTM   datetime  NULL,
	 EndDTTM   datetime  NULL
)
go
create table RejestrZamowienTmp (
   IdRejestrZamowien    int                  null,
   _KodKlient            varchar(10)                 null,
   _KodWycieczka         varchar(10)                  null,
   _KodPracownik         varchar(10)                  null,
   IloscMiejsc          int                  null,
   DataZamowienia       datetime             null,
   DataPlatnosci        datetime             null,
   StartDTTM   datetime  NULL,
	 EndDTTM   datetime  NULL
)
go

/*==============================================================*/
/* Table: Wycieczka                                             */
/*==============================================================*/
create table Wycieczka (
   IdWycieczka          int                  null,
   KodWycieczka         varchar(10)                  null,
   Nazwa                varchar(100)         null,
   IloscMiejsc          int                  null,
   IloscZajetych        int                  null,
   Cena                 int                  null,
   DataWyjazdu          datetime             null,
   DataPowrotu          datetime             null,
   StartDTTM   datetime  NULL,
	 EndDTTM   datetime  NULL
)
go
create table WycieczkaBad (
   IdWycieczka          int                  null,
   KodWycieczka         varchar(10)                  null,
   Nazwa                varchar(100)         null,
   IloscMiejsc          int                  null,
   IloscZajetych        int                  null,
   Cena                 int                  null,
   DataWyjazdu          datetime             null,
   DataPowrotu          datetime             null,
   StartDTTM   datetime  NULL,
   EndDTTM   datetime  NULL,
   Rozwiazany   bit  NULL
)

go
create table WycieczkaCSV (
   IdWycieczkaCSV          int               IDENTITY(1,1) NOT NULL,
   KodWycieczka         varchar(10)                 null,
   Nazwa                varchar(100)         null,
   IloscMiejsc          int                  null,
   IloscZajetych        int                  null,
   Cena                 int                  null,
   DataWyjazdu          datetime             null,
   DataPowrotu          datetime             null,
   StageDTTM   datetime  NULL,
   DUPLIKAT   bit  NULL
)
go
create table WycieczkaCSVBezDTTM (
   KodWycieczka         varchar(10)                 null,
   Nazwa                varchar(100)         null,
   IloscMiejsc          int                  null,
   IloscZajetych        int                  null,
   Cena                 int                  null,
   DataWyjazdu          datetime             null,
   DataPowrotu          datetime             null
)
go
create table WycieczkaStg (
   IdWycieczka          int                  null,
   KodWycieczka         varchar(10)                  null,
   Nazwa                varchar(100)         null,
   IloscMiejsc          int                  null,
   IloscZajetych        int                  null,
   Cena                 int                  null,
   DataWyjazdu          datetime             null,
   DataPowrotu          datetime             null,
   StartDTTM   datetime  NULL,
   EndDTTM   datetime  NULL
)
go
create table WycieczkaTmp (
   IdWycieczka          int                  null,
   KodWycieczka         varchar(10)                 null,
   Nazwa                varchar(100)         null,
   IloscMiejsc          int                  null,
   IloscZajetych        int                  null,
   Cena                 int                  null,
   DataWyjazdu          datetime             null,
   DataPowrotu          datetime             null,
   StartDTTM   datetime  NULL,
	 EndDTTM   datetime  NULL
)
go

/*==============================================================*/
/* Table: WycieczkaPracownik                                    */
/*==============================================================*/
create table WycieczkaPracownik (
   IdWycieczkaPracownik int                  null,
   _KodWycieczka         varchar(10)                  null,
   _KodPracownik         varchar(10)                  null,
    StartDTTM   datetime  NULL,
	 EndDTTM   datetime  NULL
)
go
create table WycieczkaPracownikBad (
   IdWycieczkaPracownik int                  null,
   _KodWycieczka         varchar(10)                  null,
   _KodPracownik         varchar(10)                  null,
   StartDTTM   datetime  NULL,
   EndDTTM   datetime  NULL,
   Rozwiazany   bit  NULL
)
go
create table WycieczkaPracownikCSV (
   IdWycieczkaPracownikCSV int                IDENTITY(1,1) NOT NULL,
   _KodWycieczka         varchar(10)                  null,
   _KodPracownik         varchar(10)                  null,
   StageDTTM   datetime  NULL,
   DUPLIKAT   bit  NULL
)

go
create table WycieczkaPracownikCSVBezDTTM (
   _KodWycieczka         varchar(10)                  null,
   _KodPracownik         varchar(10)                  null
)

go
create table WycieczkaPracownikStg (
   IdWycieczkaPracownik int                  null,
   _KodWycieczka         varchar(10)                  null,
   _KodPracownik         varchar(10)                  null,
    StartDTTM   datetime  NULL,
	 EndDTTM   datetime  NULL
)
go
create table WycieczkaPracownikTmp (
   IdWycieczkaPracownik int                  null,
   _KodWycieczka         varchar(10)                  null,
   _KodPracownik         varchar(10)                  null,
    StartDTTM   datetime  NULL,
	 EndDTTM   datetime  NULL
)
go
/*==============================================================*/
/* Table: Klucz                                                 */
/*==============================================================*/
GO
CREATE TABLE Klucz(
	 Klucz   int  IDENTITY(1,1) NOT NULL,
	 PolaKlucza   varchar (100) NULL,
	 Zrodlo   varchar (100) NULL,
 CONSTRAINT  PK_KLUCZ  PRIMARY KEY CLUSTERED 
(
	 Klucz  ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) 
) 

/*==============================================================*/
/* Table: Metadane                                              */
/*==============================================================*/


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE  dbo.MetadaneGenerowanieKluczy (
	 Tabela   varchar (50) NULL,
	 PolaKlucza   varchar (200) NULL,
	 NazwaZrodla   varchar (100) NULL
) 
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE  dbo.MetadaneStageDoTmp (
	 Tabela   varchar (1000) NULL,
	 Zrodlo   varchar (1000) NULL,
	 Pola   varchar (1000) NULL,
	 KluczGlowny   varchar (1000) NULL,
	 PolaKlucza   varchar (1000) NULL
) 
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE  dbo.MetadaneTmpDoStgLubBad (
	 Tabela   varchar (1000) NULL,
	 Pola   varchar (1000) NULL,
	 KluczGlowny   varchar (100) NULL,
	 Wymiar   bit  NULL,
	 WymaganeKlucze   varchar (1000) NULL
) 
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE  dbo.MetadaneWczytanieDanychZeZrodla (
	 Id   int  IDENTITY(1,1) NOT NULL,
	 TypZrodla   varchar (5) NULL,
	 Zrodlo   varchar (50) NULL,
	 TabelaZrodla   varchar (50) NULL,
	 PolaZrodlowe   varchar (200) NULL,
	 TabelaDocelowa   varchar (50) NULL,
	 PolaDocelowe   varchar (200) NULL,
	 Grupowanie   varchar (1000) NULL,
	 NazwaId   varchar (50) NULL,
 CONSTRAINT  PK_METADANEWCZYTANIEDANYCHZEZR  PRIMARY KEY CLUSTERED 
(
	 Id  ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) 
) 
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE  dbo.MetadaneWczytanieDoHurtowni (
	 Tabela   varchar (100) NULL,
	 Pola   varchar (1000) NULL,
	 KluczGlowny   varchar (100) NULL,
	 WymaganeKlucze   varchar (1000) NULL
) 
GO


























