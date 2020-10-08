/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2012                    */
/* Created on:     2019-10-06 22:02:56                          */
/*==============================================================*/

/*==============================================================*/
/* Table: Dodatek                                               */
/*==============================================================*/
create table Dodatek (
   DodatekId            int                  IDENTITY(1,1) NOT NULL,
   KodDodatek           varchar(10)            null,
   Nazwa                varchar(100)         null,
   Cena                 int                  null,
   constraint PK_DODATEK primary key (DodatekId)
)
go
create table DodatekDelete (
   DodatekId            int                  not null,
   KodDodatek           varchar(10)                  null,
   Nazwa                varchar(100)         null,
   Cena                 int                  null
)
go



/*==============================================================*/
/* Table: HotelWycieczka                                        */
/*==============================================================*/
create table HotelWycieczka (
   HotelWycieczkaId     int                  IDENTITY(1,1) NOT NULL,
   _KodNocleg            varchar(10)                  null,
   _KodWycieczka         varchar(10)                  null,
   DataPrzyjazdu        datetime             null,
   DataWyjazdu          datetime             null,
   constraint PK_HOTELWYCIECZKA primary key nonclustered (HotelWycieczkaId)
)
go
create table HotelWycieczkaDelete (
   HotelWycieczkaId     int                  not null,
   _KodNocleg            varchar(10)            null,
   _KodWycieczka         varchar(10)            null,
   DataPrzyjazdu        datetime             null,
   DataWyjazdu          datetime             null
)
go



/*==============================================================*/
/* Table: Klient                                                */
/*==============================================================*/
create table Klient (
   KlientId             int                 IDENTITY(1,1) NOT NULL,
   KodKlient            varchar(10)                 null,
   Ulica                varchar(50)          null,
   Nr                   varchar(10)          null,
   Kod                  varchar(6)           null,
   Miejscowosc          varchar(80)          null,
   Kraj                 varchar(80)          null,
   Imie                 varchar(30)          null,
   Nazwisko             varchar(30)          null,
   Telefon              char(9)              null,
   constraint PK_KLIENT primary key nonclustered (KlientId)
)
go
create table KlientDelete (
   KlientId             int                  not null,
   KodKlient            varchar(10)                 null,
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



/*==============================================================*/
/* Table: Nocleg                                                */
/*==============================================================*/
create table Nocleg (
   NoclegId             int                  IDENTITY(1,1) NOT NULL,
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
   constraint PK_NOCLEG primary key nonclustered (NoclegId)
)
go
create table NoclegDelete (
   NoclegId             int                  not null,
   KodNocleg            varchar(10)                 null,
   Ulica                varchar(50)          null,
   Nr                   varchar(10)          null,
   Kod                  varchar(6)           null,
   Miejscowosc          varchar(80)          null,
   Kraj                 varchar(80)          null,
   Nazwa                varchar(100)         null,
   Standard             int                  null,
   Telefon              char(9)              null,
   Cena                 int                  null
)
go







/*==============================================================*/
/* Table: RejestrDodatekNocleg                                  */
/*==============================================================*/
create table RejestrDodatekNocleg (
   RejestrDodatekNoclegId int                  IDENTITY(1,1) NOT NULL,
   _KodNocleg            varchar(10)                 null,
   _KodDodatek           varchar(10)                 null,
   constraint PK_REJESTRDODATEKNOCLEG primary key nonclustered (RejestrDodatekNoclegId)
)
go
create table RejestrDodatekNoclegDelete (
   RejestrDodatekNoclegId int                  not null,
   _KodNocleg            varchar(10)                  null,
   _KodDodatek           varchar(10)                  null
)
go



/*==============================================================*/
/* Table: RejestrDodatekWycieczka                               */
/*==============================================================*/
create table RejestrDodatekWycieczka (
   RejestrDodatekWycieczkaId int                  IDENTITY(1,1) NOT NULL,
   _KodDodatek           varchar(10)                  null,
   _KodWycieczka         varchar(10)                  null,
   constraint PK_REJESTRDODATEKWYCIECZKA primary key nonclustered (RejestrDodatekWycieczkaId)
)
go
create table RejestrDodatekWycieczkaDelete (
   RejestrDodatekWycieczkaId int                  not null,
   _KodDodatek           varchar(10)                 null,
   _KodWycieczka         varchar(10)                 null
)
go



/*==============================================================*/
/* Table: RejestrZamowien                                       */
/*==============================================================*/
create table RejestrZamowien (
   RejestrZamowienId    int                  IDENTITY(1,1) NOT NULL,
   _KodKlient            varchar(10)          null,
   _KodWycieczka         varchar(10)          null,
   _KodPracownik         varchar(10)          null,
   IloscMiejsc          int                  null,
   DataZamowienia       datetime             null,
   DataPlatnosci        datetime             null,
   constraint PK_REJESTRZAMOWIEN primary key nonclustered (RejestrZamowienId)
)
go
create table RejestrZamowienDelete (
   RejestrZamowienId    int                  not null,
   _KodKlient            varchar(10)          null,
   _KodWycieczka         varchar(10)          null,
   _KodPracownik         varchar(10)          null,
   IloscMiejsc          int                  null,
   DataZamowienia       datetime             null,
   DataPlatnosci        datetime             null
)
go











