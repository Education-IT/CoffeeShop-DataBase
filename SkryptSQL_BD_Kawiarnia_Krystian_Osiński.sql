USE master
GO

IF DB_ID('Kawiarnia') IS NULL
CREATE DATABASE Kawiarnia
GO



USE Kawiarnia

-- ------------------------------------------------------
-- Usuwanie tabel (w odwrotnej kolejnoœci do tworzenia!)
-- ------------------------------------------------------
IF OBJECT_ID('Pozycje_rejestru_sprzedazy','U') IS NOT NULL
DROP TABLE Pozycje_rejestru_sprzedazy

IF OBJECT_ID('Menu','U') IS NOT NULL
DROP TABLE Menu

IF OBJECT_ID('Typ_menu','U') IS NOT NULL
DROP TABLE Typ_menu

IF OBJECT_ID('Rejestr_sprzedazy','U') IS NOT NULL
DROP TABLE Rejestr_sprzedazy

IF OBJECT_ID('Klienci','U') IS NOT NULL
DROP TABLE Klienci

IF OBJECT_ID('Barisci','U') IS NOT NULL
DROP TABLE Barisci

GO

-- --------------------------------
-- Tworzenie tabel
-- --------------------------------
IF OBJECT_ID('Barisci','U') IS NULL
CREATE TABLE Barisci (
ID INT IDENTITY(1,1) NOT NULL,
	Imie VARCHAR(30) NOT NULL,
	Nazwisko VARCHAR(30) NOT NULL,
	Nr_pracownika NCHAR(3) NOT NULL,
	Pesel NCHAR(11) NOT NULL,
	Nr_telefonu NCHAR(9) NULL,
	E_mail VARCHAR(50) NULL,
	Urodziny DATE NOT NULL,
	Aktywny BIT CHECK (Aktywny in (1,0)) DEFAULT 1 NOT NULL,
	UNIQUE (Nr_pracownika),
	PRIMARY KEY (ID)
	)

IF OBJECT_ID('Klienci','U') IS NULL
CREATE TABLE Klienci (
ID INT IDENTITY(1,1) NOT NULL,
	Imie VARCHAR(30) NOT NULL,
	Nazwisko VARCHAR(30) NOT NULL,
	Nr_karty NCHAR(5) NOT NULL,
	Nr_telefonu NCHAR(9) NULL,
	E_mail VARCHAR(50) NULL,
	Urodziny DATE NULL,
	UNIQUE (Nr_karty),
	PRIMARY KEY (ID)
)

	
IF OBJECT_ID('Rejestr_sprzedazy','U') IS NULL
CREATE TABLE Rejestr_sprzedazy (
ID INT IDENTITY(1,1) NOT NULL,
	Data_sprzedazy DATETIME NOT NULL,
	ID_baristy INT NOT NULL,
	ID_klienta INT NOT NULL DEFAULT 1,
	PRIMARY KEY (ID),
	FOREIGN KEY (ID_baristy) REFERENCES Barisci (ID),
	FOREIGN KEY (ID_klienta) REFERENCES Klienci (ID)
)




IF OBJECT_ID('Typ_menu','U') IS NULL
CREATE TABLE Typ_menu (
	ID SMALLINT IDENTITY(1,1) NOT NULL,
	Nazwa_typu VARCHAR(15) CHECK (Nazwa_typu in ('Jedzenie','Napój','Kawa_paczkowana'))  NOT NULL,
	PRIMARY KEY (ID)
)



IF OBJECT_ID('Menu','U') IS NULL
CREATE TABLE Menu (
	ID INT IDENTITY(1,1) NOT NULL,
	Nazwa VARCHAR(45) NOT NULL,
	ID_typ_menu SMALLINT CHECK (ID_typ_menu in (1,2,3))  NOT NULL,
	Wartosc_sprzedazy FLOAT NOT NULL,
	Koszt_wytworzenia FLOAT NOT NULL,
	Dostêpny BIT CHECK (Dostêpny in (0,1)) DEFAULT 1 NOT NULL,
	PRIMARY KEY (ID),
	FOREIGN KEY (ID_typ_menu) REFERENCES Typ_menu (ID)
)


IF OBJECT_ID('Pozycje_rejestru_sprzedazy','U') IS NULL
CREATE TABLE Pozycje_rejestru_sprzedazy (
ID INT IDENTITY(1,1) NOT NULL,
	ID_rejestru_sprzedazy INT NOT NULL,
	ID_menu INT NOT NULL,
	Iloœæ SMALLINT CHECK (Iloœæ > 0) NOT NULL,
	PRIMARY KEY (ID),
	FOREIGN KEY (ID_rejestru_sprzedazy) REFERENCES Rejestr_sprzedazy (ID),
	FOREIGN KEY (ID_menu) REFERENCES Menu (ID)
)





GO

-- ---------------------------------
-- Wstawianie wartoœci do tabel
-- ---------------------------------

INSERT INTO Barisci (Imie,Nazwisko,Nr_pracownika,Pesel,Nr_telefonu,E_mail,Urodziny) VALUES ('Krystian','Osiñski',001,99070611111,504960083,'Kryosi@st.amu.edu.pl','19990706')
INSERT INTO Barisci (Imie,Nazwisko,Nr_pracownika,Pesel,Nr_telefonu,E_mail,Urodziny) VALUES ('Agata','Cholewiñska',005,99070622222,504961184,'Agacho@stmed.edu.pl','19990202')
INSERT INTO Barisci (Imie,Nazwisko,Nr_pracownika,Pesel,Nr_telefonu,E_mail,Urodziny) VALUES ('Karolina','Szykowna',101,99070633333,504962285,'Szykokaro@Starcost.com','19901221')
INSERT INTO Barisci (Imie,Nazwisko,Nr_pracownika,Pesel,Nr_telefonu,E_mail,Urodziny,Aktywny) VALUES ('Karolina','Socha',006,99070644444,504963386,'szoszyna@Starcost.com','19980326',0)
INSERT INTO Barisci (Imie,Nazwisko,Nr_pracownika,Pesel,Nr_telefonu,E_mail,Urodziny) VALUES ('Adrian','Nowakowski',102,99070655555,504964487,'Boskynowakowsky@gmail.com','19830601')
INSERT INTO Barisci (Imie,Nazwisko,Nr_pracownika,Pesel,Nr_telefonu,E_mail,Urodziny) VALUES ('Maciej','Œwierblewski',002,99070666666,504965588,'swierblasmac@starcost.com','20010317')
INSERT INTO Barisci (Imie,Nazwisko,Nr_pracownika,Pesel,Nr_telefonu,E_mail,Urodziny) VALUES ('Maciej','Nowak',003,99070677777,504966689,'Nowmacnok@Sstarcost.com','19741109')
INSERT INTO Barisci (Imie,Nazwisko,Nr_pracownika,Pesel,Nr_telefonu,E_mail,Urodziny) VALUES ('Magdalena','Szczepañska',004,99070688888,504967790,'Szczepanska@st.amu.edu.pl','19990706')
INSERT INTO Barisci (Imie,Nazwisko,Nr_pracownika,Pesel,Nr_telefonu,E_mail,Urodziny) VALUES ('Anna','Kujawa-Bartkowiak',007,99070699999,504968891,'kujanbar@o2.pl','19840413')
INSERT INTO Barisci (Imie,Nazwisko,Nr_pracownika,Pesel,Nr_telefonu,E_mail,Urodziny) VALUES ('Ola','Szlapka',008,99070610222,504969991,'Olszlap01@interia.pl','19990914')
INSERT INTO Barisci (Imie,Nazwisko,Nr_pracownika,Pesel,Nr_telefonu,E_mail,Urodziny,Aktywny) VALUES ('Weronika','Nowak',009,99070610333,504961001,'NowakowaWeronika0234@gmail.com','19900330',0)
INSERT INTO Barisci (Imie,Nazwisko,Nr_pracownika,Pesel,Nr_telefonu,E_mail,Urodziny,Aktywny) VALUES ('Radek','Dlango',010,99070610444,504961002,'djlango@gmai.com','19990130',0)
INSERT INTO Barisci (Imie,Nazwisko,Nr_pracownika,Pesel,Nr_telefonu,E_mail,Urodziny,Aktywny) VALUES ('Borys','Czajka',103,99070610555,504961003,'czajowskyy@interia.pl','19940706',0)
INSERT INTO Barisci (Imie,Nazwisko,Nr_pracownika,Pesel,Nr_telefonu,E_mail,Urodziny) VALUES ('Krystian','Draus',011,99070610666,504961004,'drausdraus@02.pl','19990603')
GO



INSERT INTO Klienci (Imie,Nazwisko,Nr_karty,Nr_telefonu,E_mail,Urodziny) VALUES ('N.N.','N.N',00000,NULL,NULL,NULL)
INSERT INTO Klienci (Imie,Nazwisko,Nr_karty,Nr_telefonu,E_mail,Urodziny) VALUES ('Lidia','Wójcik',00001,601415195,'wojcik@gmail.com',NULL)
INSERT INTO Klienci (Imie,Nazwisko,Nr_karty,Nr_telefonu,E_mail,Urodziny) VALUES ('Michal','Torba',00002,503366636,'TOrba@gmai.com','19990607')
INSERT INTO Klienci (Imie,Nazwisko,Nr_karty,Nr_telefonu,E_mail,Urodziny) VALUES ('Adam','Grzywczak',00003,123123123,'Grzywczak@gmail.com','19990608')
INSERT INTO Klienci (Imie,Nazwisko,Nr_karty,Nr_telefonu,E_mail,Urodziny) VALUES ('Adam','Janyska',00004,234234234,'Janyska@gmail.com','19990609')
INSERT INTO Klienci (Imie,Nazwisko,Nr_karty,Nr_telefonu,E_mail,Urodziny) VALUES ('Adrian','Waszak',00005,345345345,'waszak@gmail.com','19990610')
INSERT INTO Klienci (Imie,Nazwisko,Nr_karty,Nr_telefonu,E_mail,Urodziny) VALUES ('Adrian','Gawryszewski',0006,456456456,'Gawryszewski@gmail.com','19990611')
INSERT INTO Klienci (Imie,Nazwisko,Nr_karty,Nr_telefonu,E_mail,Urodziny) VALUES ('Aga','Toton',00007,567567567,'toton@gmail.com','19990612')
INSERT INTO Klienci (Imie,Nazwisko,Nr_karty,Nr_telefonu,E_mail,Urodziny) VALUES ('Agata','Filutowska',00008,NULL,NULL,NULL)
INSERT INTO Klienci (Imie,Nazwisko,Nr_karty,Nr_telefonu,E_mail,Urodziny) VALUES ('Agnieszka','Maleszyk-kajzera',00009,678678678,'Kajzerka@gmail.com','19990707')
INSERT INTO Klienci (Imie,Nazwisko,Nr_karty,Nr_telefonu,E_mail,Urodziny) VALUES ('Aleksandra','Jankowiak',00010,789789789,NULL,'19990708')
INSERT INTO Klienci (Imie,Nazwisko,Nr_karty,Nr_telefonu,E_mail,Urodziny) VALUES ('Alicja','Janas',00011,890890890,'Janas@gmail.com','19990303')
INSERT INTO Klienci (Imie,Nazwisko,Nr_karty,Nr_telefonu,E_mail,Urodziny) VALUES ('Alicja','Szymanowicz',00012,909090990,'szymanowicz@gmail.com',NULL)
INSERT INTO Klienci (Imie,Nazwisko,Nr_karty,Nr_telefonu,E_mail,Urodziny) VALUES ('Anastasia','Nikoleva',00013,NULL,'nikolewa@gmail.com','20010101')
INSERT INTO Klienci (Imie,Nazwisko,Nr_karty,Nr_telefonu,E_mail,Urodziny) VALUES ('Amanda','Nowak',00014,NULL,'nowak@gmail.com','20041212')
INSERT INTO Klienci (Imie,Nazwisko,Nr_karty,Nr_telefonu,E_mail,Urodziny) VALUES ('Andrzej','Faryñski',00015,NULL,NULL,NULL)
INSERT INTO Klienci (Imie,Nazwisko,Nr_karty,Nr_telefonu,E_mail,Urodziny) VALUES ('Angelika','£awniczak',00016,111222333,'lawniczak@gmail.com','20100303')
INSERT INTO Klienci (Imie,Nazwisko,Nr_karty,Nr_telefonu,E_mail,Urodziny) VALUES ('Anna','Wuwer',00017,111333444,'weuwer@gmail.com',NULL)
INSERT INTO Klienci (Imie,Nazwisko,Nr_karty,Nr_telefonu,E_mail,Urodziny) VALUES ('Ania','Osiñski',00018,NULL,NULL,NULL)
INSERT INTO Klienci (Imie,Nazwisko,Nr_karty,Nr_telefonu,E_mail,Urodziny) VALUES ('Anna','Rusel-Wasiak',00019,111444555,'ruselwasiak@gmail.com','19801212')
INSERT INTO Klienci (Imie,Nazwisko,Nr_karty,Nr_telefonu,E_mail,Urodziny) VALUES ('Artur','Osiñski',00020,111555666,NULL,'19791212')
INSERT INTO Klienci (Imie,Nazwisko,Nr_karty,Nr_telefonu,E_mail,Urodziny) VALUES ('Asia','Bemowicz',00021,111666777,'bemowicz@gmail.com','19990909')
INSERT INTO Klienci (Imie,Nazwisko,Nr_karty,Nr_telefonu,E_mail,Urodziny) VALUES ('Barbara','Urbaniak',00023,111777888,'urbaniak@gmail.com','20020405')
INSERT INTO Klienci (Imie,Nazwisko,Nr_karty,Nr_telefonu,E_mail,Urodziny) VALUES ('Bartek','Kryczka',00024,111888999,'kryczka@gmail.com','20000101')
INSERT INTO Klienci (Imie,Nazwisko,Nr_karty,Nr_telefonu,E_mail,Urodziny) VALUES ('Bartosz','£eszyk',00025,222111222,'leszyk@gmail.com','18991112')
INSERT INTO Klienci (Imie,Nazwisko,Nr_karty,Nr_telefonu,E_mail,Urodziny) VALUES ('Bartosz','Pawlak',00026,222222333,NULL,NULL)
INSERT INTO Klienci (Imie,Nazwisko,Nr_karty,Nr_telefonu,E_mail,Urodziny) VALUES ('Bart³omiej','Cupta',00027,NULL,NULL,'20020202')
INSERT INTO Klienci (Imie,Nazwisko,Nr_karty,Nr_telefonu,E_mail,Urodziny) VALUES ('Beata','Koz³owksa',0028,222333444,'kozlowka@gmail.com',NULL)
INSERT INTO Klienci (Imie,Nazwisko,Nr_karty,Nr_telefonu,E_mail,Urodziny) VALUES ('Beata','Prusak',0029,NULL,NULL,'20010605')
INSERT INTO Klienci (Imie,Nazwisko,Nr_karty,Nr_telefonu,E_mail,Urodziny) VALUES ('Daniel','Medic',0030,222333555,'danielmedic@gmail.com',NULL)
INSERT INTO Klienci (Imie,Nazwisko,Nr_karty,Nr_telefonu,E_mail,Urodziny) VALUES ('Daniel','Wardowski',00022,NULL,'Wardowski@gmail.com',NULL)
INSERT INTO Klienci (Imie,Nazwisko,Nr_karty,Nr_telefonu,E_mail,Urodziny) VALUES ('Danka','Ciborowska',0031,222333666,'ciborowskadanka@gmail.com',NULL)
INSERT INTO Klienci (Imie,Nazwisko,Nr_karty,Nr_telefonu,E_mail,Urodziny) VALUES ('Daria','Wróbel',00032,222333777,'wrobel@gmail.com','20040404')
INSERT INTO Klienci (Imie,Nazwisko,Nr_karty,Nr_telefonu,E_mail,Urodziny) VALUES ('Dariusz','Pomian',00033,222333888,'pomianowiskyy@gmail.com',NULL)
INSERT INTO Klienci (Imie,Nazwisko,Nr_karty,Nr_telefonu,E_mail,Urodziny) VALUES ('Dawid','Nowak',00034,NULL,'dawidnowak1@gmail.com',NULL)
INSERT INTO Klienci (Imie,Nazwisko,Nr_karty,Nr_telefonu,E_mail,Urodziny) VALUES ('David','Lesso',00035,NULL,'lessodavidlesso@gmail.com','19800903')
INSERT INTO Klienci (Imie,Nazwisko,Nr_karty,Nr_telefonu,E_mail,Urodziny) VALUES ('Dominik','Borowczyk',00036,222333999,'Borowczyk@gmail.com',NULL)
INSERT INTO Klienci (Imie,Nazwisko,Nr_karty,Nr_telefonu,E_mail,Urodziny) VALUES ('Dominika','Leœniewska',00037,222444111,'lesniewska@gmail.com','19730814')
INSERT INTO Klienci (Imie,Nazwisko,Nr_karty,Nr_telefonu,E_mail,Urodziny) VALUES ('Edyta','Nawrotek-Wrych',00038,222444222,NULL,'19580405')
INSERT INTO Klienci (Imie,Nazwisko,Nr_karty,Nr_telefonu,E_mail,Urodziny) VALUES ('Ewa','Migdalska',00039,NULL,'migdalska@gmail.com','19680430')
INSERT INTO Klienci (Imie,Nazwisko,Nr_karty,Nr_telefonu,E_mail,Urodziny) VALUES ('Ewelina','Komorowska',00040,222444333,'Komorowskaewilna@gmail.com','19991229')
INSERT INTO Klienci (Imie,Nazwisko,Nr_karty,Nr_telefonu,E_mail,Urodziny) VALUES ('Filip','Ostrowski',00041,222444444,'ostrowskyyfilip@gmail.com','19990909')
INSERT INTO Klienci (Imie,Nazwisko,Nr_karty,Nr_telefonu,E_mail,Urodziny) VALUES ('Filip','Nowaczyk',00042,222444555,'nowaczykfilip@gmail.com','19991010')
INSERT INTO Klienci (Imie,Nazwisko,Nr_karty,Nr_telefonu,E_mail,Urodziny) VALUES ('Gabriel','Najdyhor',00043,501501501,'najdyhor@gmail.com',NULL)
INSERT INTO Klienci (Imie,Nazwisko,Nr_karty,Nr_telefonu,E_mail,Urodziny) VALUES ('Gra¿yna','Zaj¹c',00044,502502502,'zajackrolikzajac@gmail.com','19660606')
INSERT INTO Klienci (Imie,Nazwisko,Nr_karty,Nr_telefonu,E_mail,Urodziny) VALUES ('Grzegorz','Wrzuszczak',00045,503503503,'Grzeswrzusz@gmail.com','19990716')
INSERT INTO Klienci (Imie,Nazwisko,Nr_karty,Nr_telefonu,E_mail,Urodziny) VALUES ('Hania','Wac³awek',00046,506506506,'haniawacla@gmail.com',NULL)
INSERT INTO Klienci (Imie,Nazwisko,Nr_karty,Nr_telefonu,E_mail,Urodziny) VALUES ('Hania','Pyzik',00047,NULL,NULL,NULL)
INSERT INTO Klienci (Imie,Nazwisko,Nr_karty,Nr_telefonu,E_mail,Urodziny) VALUES ('Hubert','Raczyk',00048,507507507,NULL,'20040721')
INSERT INTO Klienci (Imie,Nazwisko,Nr_karty,Nr_telefonu,E_mail,Urodziny) VALUES ('Izabela','Alberti',00049,508508508,'alberti@gmail.com','20071228')
INSERT INTO Klienci (Imie,Nazwisko,Nr_karty,Nr_telefonu,E_mail,Urodziny) VALUES ('Iza','Nowicka',00050,NULL,'nowicka@gmail.com',NULL)
GO
INSERT INTO Klienci (Imie,Nazwisko,Nr_karty,Nr_telefonu,E_mail,Urodziny) VALUES ('Jagoda','Pawelec',00051,509509509,'pawelec@gmail.com','19781013')
INSERT INTO Klienci (Imie,Nazwisko,Nr_karty,Nr_telefonu,E_mail,Urodziny) VALUES ('Jakub','Wiœniewski',00052,NULL,'wisnieskikuba@gmail.com','19930911')
INSERT INTO Klienci (Imie,Nazwisko,Nr_karty,Nr_telefonu,E_mail,Urodziny) VALUES ('Kuba','Pera',00053,987987987,'perajakub@gmail.com','19950912')
INSERT INTO Klienci (Imie,Nazwisko,Nr_karty,Nr_telefonu,E_mail,Urodziny) VALUES ('Jacob','Kochanek',00054,987987777,'kochanek@gmail.com',NULL)
INSERT INTO Klienci (Imie,Nazwisko,Nr_karty,Nr_telefonu,E_mail,Urodziny) VALUES ('Jan','Wojciechowski',00055,876876876,'wojciechowskijan@gmail.com','20001227')
INSERT INTO Klienci (Imie,Nazwisko,Nr_karty,Nr_telefonu,E_mail,Urodziny) VALUES ('Joanna','Przyby³',00056,765765765,'przybyljoanna@gmail.com','20070316')
INSERT INTO Klienci (Imie,Nazwisko,Nr_karty,Nr_telefonu,E_mail,Urodziny) VALUES ('Joanna','Felisiak',00057,654654654,'felciajoanna@gmail.com','20031213')
INSERT INTO Klienci (Imie,Nazwisko,Nr_karty,Nr_telefonu,E_mail,Urodziny) VALUES ('Jonasz','Janecki',00058,NULL,'janeckijonasz234@gmail.com',NULL)
INSERT INTO Klienci (Imie,Nazwisko,Nr_karty,Nr_telefonu,E_mail,Urodziny) VALUES ('Judyta','Rykaszewska',00059,NULL,'rykaszewskajudyta@gmail.com','19870814')
INSERT INTO Klienci (Imie,Nazwisko,Nr_karty,Nr_telefonu,E_mail,Urodziny) VALUES ('Julia','Tracz',00060,NULL,NULL,NULL)
INSERT INTO Klienci (Imie,Nazwisko,Nr_karty,Nr_telefonu,E_mail,Urodziny) VALUES ('Julia','Zagrodzka',00061,543543543,'zagrodka@gmail.com','19981023')
INSERT INTO Klienci (Imie,Nazwisko,Nr_karty,Nr_telefonu,E_mail,Urodziny) VALUES ('Justyna','Wejman',00062,432432432,'wejmanowska@gmail.com','19930329')
INSERT INTO Klienci (Imie,Nazwisko,Nr_karty,Nr_telefonu,E_mail,Urodziny) VALUES ('Jêdzej','Chwojnowksi',00063,321321321,'chwojnowksi@gmail.com','19990408')
INSERT INTO Klienci (Imie,Nazwisko,Nr_karty,Nr_telefonu,E_mail,Urodziny) VALUES ('Kacper','Kowalewski',00064,NULL,'kowalkacpery@gmail.com',NULL)
INSERT INTO Klienci (Imie,Nazwisko,Nr_karty,Nr_telefonu,E_mail,Urodziny) VALUES ('Kaja','Pob³ocka',00065,NULL,'Poblockakajka@gmail.com','20010126')
INSERT INTO Klienci (Imie,Nazwisko,Nr_karty,Nr_telefonu,E_mail,Urodziny) VALUES ('Kamil','Pr¹dziñski',00066,765567765,NULL,NULL)
INSERT INTO Klienci (Imie,Nazwisko,Nr_karty,Nr_telefonu,E_mail,Urodziny) VALUES ('Kamil','Szahun',00067,654456654,'szachunhun@gmail.com',NULL)
INSERT INTO Klienci (Imie,Nazwisko,Nr_karty,Nr_telefonu,E_mail,Urodziny) VALUES ('Kamila','Kuciel',00068,432234432,NULL,NULL)
INSERT INTO Klienci (Imie,Nazwisko,Nr_karty,Nr_telefonu,E_mail,Urodziny) VALUES ('Karina','Czarska',00069,NULL,NULL,NULL)
INSERT INTO Klienci (Imie,Nazwisko,Nr_karty,Nr_telefonu,E_mail,Urodziny) VALUES ('Karolina','Paizert',00070,321123321,'paizert@gmail.com','20121103')
INSERT INTO Klienci (Imie,Nazwisko,Nr_karty,Nr_telefonu,E_mail,Urodziny) VALUES ('Karolina','Konieczna',00071,191919191,'koniecznakarola@gmail.com','19650405')
INSERT INTO Klienci (Imie,Nazwisko,Nr_karty,Nr_telefonu,E_mail,Urodziny) VALUES ('Karolina','Klusek',00072,192192192,'klusk@gmail.com','19960714')
INSERT INTO Klienci (Imie,Nazwisko,Nr_karty,Nr_telefonu,E_mail,Urodziny) VALUES ('Kasper','Honkisz',00073,193193193,'honkisz@gmail.com','19840918')
INSERT INTO Klienci (Imie,Nazwisko,Nr_karty,Nr_telefonu,E_mail,Urodziny) VALUES ('Katarzyna','Grzelak',00074,NULL,'grzelka@gmail.com','19790408')
INSERT INTO Klienci (Imie,Nazwisko,Nr_karty,Nr_telefonu,E_mail,Urodziny) VALUES ('Kateryna','Dyka',00075,NULL,'dyykkaa@gmail.com',NULL)
INSERT INTO Klienci (Imie,Nazwisko,Nr_karty,Nr_telefonu,E_mail,Urodziny) VALUES ('Kinga','Waselczyk',00076,194194194,'waselczyk@gmail.com','19990909')
INSERT INTO Klienci (Imie,Nazwisko,Nr_karty,Nr_telefonu,E_mail,Urodziny) VALUES ('Klaudia','Soloch',00077,195195195,'soloch@gmail.com','20050505')
INSERT INTO Klienci (Imie,Nazwisko,Nr_karty,Nr_telefonu,E_mail,Urodziny) VALUES ('£ukasz','Scharam',00078,197197197,'scharam@gmail.com',NULL)
INSERT INTO Klienci (Imie,Nazwisko,Nr_karty,Nr_telefonu,E_mail,Urodziny) VALUES ('Zuzia','Donat',00079,NULL,'donayt@gmail.com',NULL)
INSERT INTO Klienci (Imie,Nazwisko,Nr_karty,Nr_telefonu,E_mail,Urodziny) VALUES ('Zuzanna','Fornalik',00080,NULL,NULL,'20020202')
INSERT INTO Klienci (Imie,Nazwisko,Nr_karty,Nr_telefonu,E_mail,Urodziny) VALUES ('Zenobiusz','Draus',00081,NULL,'drauszenon@gmail.com','19610318')
INSERT INTO Klienci (Imie,Nazwisko,Nr_karty,Nr_telefonu,E_mail,Urodziny) VALUES ('Wojciech','Maækowiak',00082,19990919,'wojcmackowiak@gmail.com','19991213')
INSERT INTO Klienci (Imie,Nazwisko,Nr_karty,Nr_telefonu,E_mail,Urodziny) VALUES ('Wiktoria','Figas',00083,NULL,'figaswik@gmail.com',NULL)
INSERT INTO Klienci (Imie,Nazwisko,Nr_karty,Nr_telefonu,E_mail,Urodziny) VALUES ('Aurelia','Wiktoria',00084,NULL,'aurwikt193@gmail.com',NULL)
INSERT INTO Klienci (Imie,Nazwisko,Nr_karty,Nr_telefonu,E_mail,Urodziny) VALUES ('Wiktoria','Dyszy',00085,NULL,NULL,NULL)
INSERT INTO Klienci (Imie,Nazwisko,Nr_karty,Nr_telefonu,E_mail,Urodziny) VALUES ('Wiktor','Maækowiak',00086,385638910,'wiktormackowiak@gmail.com','19961113')
INSERT INTO Klienci (Imie,Nazwisko,Nr_karty,Nr_telefonu,E_mail,Urodziny) VALUES ('Weronika','Cholewa',00087,NULL,'cholewaweronika@gmail.com',NULL)
INSERT INTO Klienci (Imie,Nazwisko,Nr_karty,Nr_telefonu,E_mail,Urodziny) VALUES ('Weronika','Gorzelanczyk',00088,504000504,NULL,'19990726')
INSERT INTO Klienci (Imie,Nazwisko,Nr_karty,Nr_telefonu,E_mail,Urodziny) VALUES ('Weronika','Wa³kowska',00089,501703505,'walkowska22@gmail.com',NULL)
INSERT INTO Klienci (Imie,Nazwisko,Nr_karty,Nr_telefonu,E_mail,Urodziny) VALUES ('Urszula','Palacz',00090,123987456,'urszupala1234321@gmail.com','19560427')
INSERT INTO Klienci (Imie,Nazwisko,Nr_karty,Nr_telefonu,E_mail,Urodziny) VALUES ('Sylwia','Roszyk',00091,NULL,'roszyksylwia@gmail.com','19741229')
INSERT INTO Klienci (Imie,Nazwisko,Nr_karty,Nr_telefonu,E_mail,Urodziny) VALUES ('Simona','Sêdera',00092,1,NULL,'20050619')
INSERT INTO Klienci (Imie,Nazwisko,Nr_karty,Nr_telefonu,E_mail,Urodziny) VALUES ('Nadia','Ciborowska',00093,1,NULL,'19990804')
GO



INSERT INTO Typ_menu(Nazwa_typu) VALUES ('Napój')
INSERT INTO Typ_menu(Nazwa_typu) VALUES ('Jedzenie')
INSERT INTO Typ_menu(Nazwa_typu) VALUES ('Kawa_paczkowana')
GO

INSERT INTO Menu (Nazwa, ID_typ_menu, Wartosc_sprzedazy, Koszt_wytworzenia) VALUES ('Espresso',1,10.9,3.45)
INSERT INTO Menu (Nazwa, ID_typ_menu, Wartosc_sprzedazy, Koszt_wytworzenia) VALUES ('Espresso macchiato',1,10.9,4.0)
INSERT INTO Menu (Nazwa, ID_typ_menu, Wartosc_sprzedazy, Koszt_wytworzenia,Dostêpny) VALUES ('Espresso Con Panna',1,10.9,4.1,0)
INSERT INTO Menu (Nazwa, ID_typ_menu, Wartosc_sprzedazy, Koszt_wytworzenia) VALUES ('Latte',1,13.9,7.0)
INSERT INTO Menu (Nazwa, ID_typ_menu, Wartosc_sprzedazy, Koszt_wytworzenia) VALUES ('Cappuccino',1,13.9,6.4)
INSERT INTO Menu (Nazwa, ID_typ_menu, Wartosc_sprzedazy, Koszt_wytworzenia) VALUES ('Americano',1,12,4.0)
INSERT INTO Menu (Nazwa, ID_typ_menu, Wartosc_sprzedazy, Koszt_wytworzenia) VALUES ('Filter coffee',1,9.5,3.0)
INSERT INTO Menu (Nazwa, ID_typ_menu, Wartosc_sprzedazy, Koszt_wytworzenia) VALUES ('Flat White',1,13.9,8.00)
INSERT INTO Menu (Nazwa, ID_typ_menu, Wartosc_sprzedazy, Koszt_wytworzenia) VALUES ('Latte macchiato',1,13.9,6.9)
INSERT INTO Menu (Nazwa, ID_typ_menu, Wartosc_sprzedazy, Koszt_wytworzenia) VALUES ('Caramel macchiato',1,15.9,8.9)
INSERT INTO Menu (Nazwa, ID_typ_menu, Wartosc_sprzedazy, Koszt_wytworzenia) VALUES ('Vanilla Latte',1,15.9,8.5)
INSERT INTO Menu (Nazwa, ID_typ_menu, Wartosc_sprzedazy, Koszt_wytworzenia) VALUES ('Mocha',1,16.9,9.0)
INSERT INTO Menu (Nazwa, ID_typ_menu, Wartosc_sprzedazy, Koszt_wytworzenia) VALUES ('White mocha',1,16.9,9.1)
INSERT INTO Menu (Nazwa, ID_typ_menu, Wartosc_sprzedazy, Koszt_wytworzenia) VALUES ('Clasic hot chocolate',1,12.5,4.9)
INSERT INTO Menu (Nazwa, ID_typ_menu, Wartosc_sprzedazy, Koszt_wytworzenia) VALUES ('White hot chocolate',1,12.5,5.0)
INSERT INTO Menu (Nazwa, ID_typ_menu, Wartosc_sprzedazy, Koszt_wytworzenia) VALUES ('Cold brew',1,11.9,4.6)
INSERT INTO Menu (Nazwa, ID_typ_menu, Wartosc_sprzedazy, Koszt_wytworzenia) VALUES ('Cold brew latte',1,12.9,5.2)
INSERT INTO Menu (Nazwa, ID_typ_menu, Wartosc_sprzedazy, Koszt_wytworzenia) VALUES ('Nitro cold brew',1,13.9,5.5)
INSERT INTO Menu (Nazwa, ID_typ_menu, Wartosc_sprzedazy, Koszt_wytworzenia) VALUES ('Woda',1,0.0,0.2)
INSERT INTO Menu (Nazwa, ID_typ_menu, Wartosc_sprzedazy, Koszt_wytworzenia) VALUES ('Mleko',1,5.5,1.0)
INSERT INTO Menu (Nazwa, ID_typ_menu, Wartosc_sprzedazy, Koszt_wytworzenia) VALUES ('Spienione mleko',1,5.5,1.2)
INSERT INTO Menu (Nazwa, ID_typ_menu, Wartosc_sprzedazy, Koszt_wytworzenia,Dostêpny) VALUES ('Truskawkowe acai',1,18.95,9.82,0)
INSERT INTO Menu (Nazwa, ID_typ_menu, Wartosc_sprzedazy, Koszt_wytworzenia) VALUES ('Berry hibiscus',1,17.95,8.5)
INSERT INTO Menu (Nazwa, ID_typ_menu, Wartosc_sprzedazy, Koszt_wytworzenia,Dostêpny) VALUES ('Dragon drink',1,19.95,12.35,0)
INSERT INTO Menu (Nazwa, ID_typ_menu, Wartosc_sprzedazy, Koszt_wytworzenia) VALUES ('Earl Grey',1,11.9,3.2)
INSERT INTO Menu (Nazwa, ID_typ_menu, Wartosc_sprzedazy, Koszt_wytworzenia) VALUES ('Matcha tea latte',1,14.5,8.0)
INSERT INTO Menu (Nazwa, ID_typ_menu, Wartosc_sprzedazy, Koszt_wytworzenia) VALUES ('Royal English Breakfast tea',1,11.9,3.4)
INSERT INTO Menu (Nazwa, ID_typ_menu, Wartosc_sprzedazy, Koszt_wytworzenia) VALUES ('Chai tea',1,11.9,3.5)
INSERT INTO Menu (Nazwa, ID_typ_menu, Wartosc_sprzedazy, Koszt_wytworzenia, Dostêpny) VALUES ('Espresso frappe',1,18.9,11.25,0)
INSERT INTO Menu (Nazwa, ID_typ_menu, Wartosc_sprzedazy, Koszt_wytworzenia, Dostêpny) VALUES ('Caramel frappe',1,18.9,10.25,0)
GO

INSERT INTO Menu (Nazwa, ID_typ_menu, Wartosc_sprzedazy, Koszt_wytworzenia) VALUES ('Bubble frappe',1,20.9,13.5)
INSERT INTO Menu (Nazwa, ID_typ_menu, Wartosc_sprzedazy, Koszt_wytworzenia) VALUES ('Tropical mango frappe',1,14.50,7.50)
INSERT INTO Menu (Nazwa, ID_typ_menu, Wartosc_sprzedazy, Koszt_wytworzenia) VALUES ('Java chip frappe',1,18.95,11.85)
INSERT INTO Menu (Nazwa, ID_typ_menu, Wartosc_sprzedazy, Koszt_wytworzenia) VALUES ('Vanilla frappe',1,16.95,9.95)
INSERT INTO Menu (Nazwa, ID_typ_menu, Wartosc_sprzedazy, Koszt_wytworzenia,Dostêpny) VALUES ('Kokosowe latte',1,13.9,9.9,0)
INSERT INTO Menu (Nazwa, ID_typ_menu, Wartosc_sprzedazy, Koszt_wytworzenia) VALUES ('Croissant Parma',2,13.9,7.0)
INSERT INTO Menu (Nazwa, ID_typ_menu, Wartosc_sprzedazy, Koszt_wytworzenia) VALUES ('Croissant Mozzarella',2,13.9,8.0)
INSERT INTO Menu (Nazwa, ID_typ_menu, Wartosc_sprzedazy, Koszt_wytworzenia) VALUES ('Bajgiel Kozi Ser',2,14.9,9.00)
INSERT INTO Menu (Nazwa, ID_typ_menu, Wartosc_sprzedazy, Koszt_wytworzenia) VALUES ('Bajgiel z jajkiem i boczkiem',2,14.9,9.5)
INSERT INTO Menu (Nazwa, ID_typ_menu, Wartosc_sprzedazy, Koszt_wytworzenia) VALUES ('Jogurt z malinami',2,8.95,4.25)
INSERT INTO Menu (Nazwa, ID_typ_menu, Wartosc_sprzedazy, Koszt_wytworzenia) VALUES ('Jogurt z mango',2,8.95,4.5)
INSERT INTO Menu (Nazwa, ID_typ_menu, Wartosc_sprzedazy, Koszt_wytworzenia) VALUES ('Cynamonka',2,8.95,3.95)
INSERT INTO Menu (Nazwa, ID_typ_menu, Wartosc_sprzedazy, Koszt_wytworzenia,Dostêpny) VALUES ('Gofr',2,4.95,1.5,0)
INSERT INTO Menu (Nazwa, ID_typ_menu, Wartosc_sprzedazy, Koszt_wytworzenia) VALUES ('Ciastko owsiane z Nutell¹',2,6.0,3.5)
INSERT INTO Menu (Nazwa, ID_typ_menu, Wartosc_sprzedazy, Koszt_wytworzenia) VALUES ('Ciastko czekoladowe',2,7.0,4.0)
INSERT INTO Menu (Nazwa, ID_typ_menu, Wartosc_sprzedazy, Koszt_wytworzenia) VALUES ('Sernik z truskawkami',2,13.9,6.9)
INSERT INTO Menu (Nazwa, ID_typ_menu, Wartosc_sprzedazy, Koszt_wytworzenia) VALUES ('Szarlotka',2,13.9,7.1)
INSERT INTO Menu (Nazwa, ID_typ_menu, Wartosc_sprzedazy, Koszt_wytworzenia,Dostêpny) VALUES ('Espresso Brownie',2,8.95,5.85,0)
INSERT INTO Menu (Nazwa, ID_typ_menu, Wartosc_sprzedazy, Koszt_wytworzenia,Dostêpny) VALUES ('Muffin jagodowy',2,8.95,6.25,0)
INSERT INTO Menu (Nazwa, ID_typ_menu, Wartosc_sprzedazy, Koszt_wytworzenia) VALUES ('Muffin czekoladowy',2,8.95,5.75)
INSERT INTO Menu (Nazwa, ID_typ_menu, Wartosc_sprzedazy, Koszt_wytworzenia) VALUES ('Sernik Nowojorski',2,16.9,10.5)
INSERT INTO Menu (Nazwa, ID_typ_menu, Wartosc_sprzedazy, Koszt_wytworzenia) VALUES ('Ciasto marchewkowe',2,16.9,11.5)
INSERT INTO Menu (Nazwa, ID_typ_menu, Wartosc_sprzedazy, Koszt_wytworzenia,Dostêpny) VALUES ('Naleœnik',2,4.00,1.5,0)
INSERT INTO Menu (Nazwa, ID_typ_menu, Wartosc_sprzedazy, Koszt_wytworzenia) VALUES ('Croissant',2,4.95,1.55)
INSERT INTO Menu (Nazwa, ID_typ_menu, Wartosc_sprzedazy, Koszt_wytworzenia) VALUES ('Shoarma Vege',2,14.9,7.95)
INSERT INTO Menu (Nazwa, ID_typ_menu, Wartosc_sprzedazy, Koszt_wytworzenia,Dostêpny) VALUES ('Croissant Italiano',2,13.9,6.95,0)
INSERT INTO Menu (Nazwa, ID_typ_menu, Wartosc_sprzedazy, Koszt_wytworzenia) VALUES ('Espresso Roast',3,31,21)
INSERT INTO Menu (Nazwa, ID_typ_menu, Wartosc_sprzedazy, Koszt_wytworzenia) VALUES ('Blond Roast',3,31,19)
INSERT INTO Menu (Nazwa, ID_typ_menu, Wartosc_sprzedazy, Koszt_wytworzenia) VALUES ('Sumatra',3,35,24.45)
INSERT INTO Menu (Nazwa, ID_typ_menu, Wartosc_sprzedazy, Koszt_wytworzenia) VALUES ('Guatemala',3,33.5,21.55)
INSERT INTO Menu (Nazwa, ID_typ_menu, Wartosc_sprzedazy, Koszt_wytworzenia,Dostêpny) VALUES ('Pike Place',3,19.9,14.05,0)
INSERT INTO Menu (Nazwa, ID_typ_menu, Wartosc_sprzedazy, Koszt_wytworzenia,Dostêpny) VALUES ('Verona',3,21,16.10,0)
INSERT INTO Menu (Nazwa, ID_typ_menu, Wartosc_sprzedazy, Koszt_wytworzenia) VALUES ('Colombia',3,35,23.45)
INSERT INTO Menu (Nazwa, ID_typ_menu, Wartosc_sprzedazy, Koszt_wytworzenia) VALUES ('Ethiopia',3,40,28.95)
INSERT INTO Menu (Nazwa, ID_typ_menu, Wartosc_sprzedazy, Koszt_wytworzenia) VALUES ('Kenya',3,37.5,29.95)
INSERT INTO Menu (Nazwa, ID_typ_menu, Wartosc_sprzedazy, Koszt_wytworzenia,Dostêpny) VALUES ('Decaf Kenya',3,20,8.5,0)
INSERT INTO Menu (Nazwa, ID_typ_menu, Wartosc_sprzedazy, Koszt_wytworzenia,Dostêpny) VALUES ('Decaf Trojan',3,22,11.95,0)
GO
--=================================================================================================================================
--== NIEDZIELA - ROZPOCZÊCIE PRACY KAWIARNI 8:00 ===============================================================================================
--=================================================================================================================================

-- SPRZEDA¯ - NR TRANZAKCJI

--1
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy,ID_Klienta) VALUES ('20200514 08:03:45',1,3) 
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (1,1,1)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (1,2,3)

--2
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 08:08:21',1) 
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (2,8,1)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (2,38,1)

--3
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 08:09:07',5) 
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (3,42,1)

--4
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 08:10:07',5)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (4,12,1)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (4,65,1)

--5
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 08:14:58',5)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (5,5,1)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (5,41,1)

--6
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy, ID_klienta ) VALUES ('20200514 08:17:34',1,6)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (6,4,2)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (6,44,1)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (6,50,1)

--7
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 08:20:03',1)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (7,1,1)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (7,37,1)

--8
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 08:25:32',1)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (8,54,1)

--9
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 08:27:09',1)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (9,6,2)

--10
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 08:28:26',1)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (10,6,2)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (10,2,1)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (10,4,2)

--11
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 08:30:55',5)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (11,6,2)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (11,7,1)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (11,39,1)
--12
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy, ID_klienta) VALUES ('20200514 08:34:59',5,10)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (12,5,2)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (12,8,3)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (12,52,1)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (12,39,1)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (12,51,1)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (12,59,1)

--13
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 08:40:25',5)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (13,6,2)

--14
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 08:43:46',5)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (14,6,1)

--15
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 08:45:00',1)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (15,1,1)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (15,23,1)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (15,25,1)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (15,50,2)

--16
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 08:46:51',5)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (16,6,3)
GO

--17
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 08:47:20',1)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (17,12,1)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (17,19,1)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (17,19,1)

--18
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 08:48:01',5)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (18,39,1)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (18,4,1)

--19
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 08:49:29',5)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (19,7,2)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (19,11,1)

--20
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 08:51:21',1)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (20,36,1)

--21
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 08:51:24',1)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (21,4,2)


--22
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy, ID_klienta) VALUES ('20200514 08:54:59',1,27)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (22,17,1)

--23
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 08:56:46',5)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (23,6,2)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (23,10,1)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (23,4,1)

--24
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 08:57:21',1)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (24,4,4)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (24,38,2)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (24,40,1)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (24,31,1)

--25
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 08:59:02',1)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (25,54,1)

--26
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 08:59:45',5)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (26,5,1)

--27
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy,ID_klienta) VALUES ('20200514 09:00:25',1,39)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (27,23,1)

--28
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 09:02:25',1)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (28,55,1)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (28,59,1)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (28,64,1)

--29
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy,ID_klienta) VALUES ('20200514 09:03:28',5,53)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (29,42,1)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (29,7,2)

--30
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 09:03:25',5)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (30,9,1)

--31
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 09:03:47',1)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (31,4,1)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (31,53,3)
GO
--32
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 09:06:07',1)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (32,32,1)

--33
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 09:07:27',1)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (33,27,1)

--34
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 09:08:57',5)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (34,58,1)

--35
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 09:10:35',1)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (35,16,1)


--36
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 09:11:00',5)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (36,6,1)

--37
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 09:11:59',5)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (37,10,1)

--38
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 09:12:13',5)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (38,10,1)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (38,11,1)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (38,19,1)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (38,39,1)

--39
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 09:16:56',1)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (39,8,1)

--40
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 09:18:42',1)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (40,7,1)

--41
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 09:24:18',5)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (41,43,2)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (41,25,1)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (41,32,1)

--42
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 09:30:23',1)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (42,1,1)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (42,19,1)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (42,57,1)

--43
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 09:33:11',1)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (43,54,3)

--44
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy,ID_klienta) VALUES ('20200514 09:36:07',5,13)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (44,54,1)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (44,60,1)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (44,50,1)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (44,4,1)

--45
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 09:38:53',1)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (45,5,1)

--46
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 09:40:37',1)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (46,17,1)

--47
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 09:43:37',5)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (47,39,1)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (47,7,1)

--48
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 09:45:22',5)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (48,1,2)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (48,4,1)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (48,36,1)

--49
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 09:48:12',1)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (49,31,1)

--50 
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 09:49:01',5)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (50,63,1)
GO
--51
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 09:51:11',1)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (51,6,1)

--52
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 09:54:24',5)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (52,8,1)

--53
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 09:55:01',1)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (53,8,2)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (53,42,2)

--54
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 09:58:27',1)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (54,43,1)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (54,25,1)

--55
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 09:59:13',5)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (55,4,1)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (55,52,2)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (55,8,1)

--56
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy,ID_klienta) VALUES ('20200514 09:59:19',1,4)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (56,58,3)

--57
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 10:04:03',5)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (57,39,1)

--58
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 10:05:23',1)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (58,38,1)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (58,6,1)

--59
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 10:08:13',1)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (59,4,2)

--60
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 10:10:44',5)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (60,7,1)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (60,42,1)

--61
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 10:11:49',1)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (61,4,1)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (61,16,3)
GO
--62
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 10:14:13',1)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (62,20,1)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (62,19,2)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (62,16,1)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (62,34,1)

--63
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 10:15:03',5)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (63,16,4)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (63,17,1)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (63,39,1)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (63,38,1)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (63,37,1)

--64
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 10:16:39',5)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (64,13,1)

--65
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 10:18:18',5)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (65,8,2)

--64
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 10:21:33',1)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (66,6,1)

--67
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 10:23:11',1)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (67,6,1)

--68
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 10:25:31',5)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (68,8,1)

--69
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 10:26:42',1)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (69,1,1)

--70
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 10:26:35',1)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (70,42,2)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (70,4,1)

--71
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 10:29:53',5)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (71,8,1)

--72
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 10:32:12',1)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (72,6,1)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (72,25,1)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (72,36,3)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (72,28,1)

--73
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 10:34:22',1)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (73,6,1)
GO
--74
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 10:34:22',1)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (74,5,2)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (74,38,1)

--75
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 10:37:42',1)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (74,8,1)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (74,39,1)

--76
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 10:37:58',5)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (76,8,2)

--77
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 10:39:36',5)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (77,9,1)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (77,41,2)
--78
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy,ID_klienta) VALUES ('20200514 10:42:21',1,31)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (78,47,1)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (78,42,1)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (78,16,2)
--79
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 10:44:44',1)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (79,18,1)

--80
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 10:47:55',1)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (80,14,1)

--81
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 10:49:39',5)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (81,13,2)

--82
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 10:55:22',5)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (82,6,1)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (82,54,4)

--83
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 10:58:11',1)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (83,54,1)

--84
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 11:03:17',1)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (84,42,1)

--85
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 11:07:16',1)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (85,16,2)

--86
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 11:14:54',5)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (86,8,1)

--87
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 11:14:54',5)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (87,60,1)

--88
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 11:18:07',1)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (88,38,2)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (88,6,3)

--89
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy,ID_klienta) VALUES ('20200514 11:22:16',1,54)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (89,38,2)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (89,16,3)

--90
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 11:18:07',1)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (90,40,1)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (90,1,1)

--91
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 11:25:59',5)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (91,9,1)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (91,8,1)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (91,37,1)

--92
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 11:28:13',1)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (92,5,2)

--93
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 11:31:24',1)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (93,8,1)
GO

--94
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 11:33:03',5)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (94,6,1)

--95
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 11:38:33',1)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (95,39,1)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (95,7,1)

--96
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 11:44:21',5)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (96,40,2)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (96,5,2)

--97
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 11:46:47',5)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (97,41,1)

--98
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 11:49:32',1)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (98,4,1)

--99
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 11:55:11',1)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (99,12,1)

--100
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 11:58:49',1)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (100,42,1)

--101
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 11:58:45',1)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (101,54,1)

--102
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 12:00:49',5)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (102,54,1)

--103
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 12:02:24',1)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (103,42,1)

--104
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 12:06:44',1)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (104,5,1)

--105
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 12:16:44',10)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (105,7,1)

--106
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy,ID_klienta) VALUES ('20200514 12:18:34',10,2)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (106,7,1)

--107
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy,ID_klienta) VALUES ('20200514 12:22:24',10,7)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (107,65,2)

--108
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 12:25:11',6)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (108,42,1)

--109
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 12:29:39',6)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (109,16,1)

--110
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 12:34:33',10)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (110,47,5)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (110,19,4)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (110,16,1)

--111
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 12:36:11',10)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (111,42,1)

--112
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 12:39:43',10)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (112,42,1)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (112,26,1)

--113
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 12:47:14',6)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (113,20,1)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (113,21,1)

--114
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 12:50:34',10)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (114,54,1)
GO
--115
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 12:50:37',10)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (115,54,1)

--116
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 12:50:59',10)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (116,54,1)

--117
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 12:51:52',10)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (117,54,1)

--118
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 12:55:11',6)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (118,5,2)

--119
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 12:59:34',10)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (119,5,1)

--120
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 13:10:34',10)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (120,6,1)

--121
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 13:14:03',10)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (121,16,1)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (121,42,1)

--122
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy,ID_klienta) VALUES ('20200514 13:17:16',6,66)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (122,64,1)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (122,5,1)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (122,39,1)

--123
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy,ID_klienta) VALUES ('20200514 13:20:16',6,69)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (123,42,1)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (123,5,1)

--124
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 13:24:16',10)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (124,6,3)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (124,55,1)

--125
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 13:26:16',10)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (125,5,1)

--126
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 13:29:42',6)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (126,59,1)

--127
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 13:33:11',10)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (127,8,1)

--128
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 13:33:31',10)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (128,6,1)

--129
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 13:36:26',10)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (129,28,1)

--130
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 13:40:52',6)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (130,1,3)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (130,54,1)
GO
--131
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 13:45:52',6)

INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (131,5,3)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (131,4,3)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (131,6,3)


--132
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 13:49:52',10)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (132,4,2)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (132,42,3)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (132,39,3)

--133
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 13:51:55',10)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (133,42,4)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (133,2,1)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (133,44,3)

--134
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 13:54:53',6)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (134,4,3)

--135
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 13:59:23',6)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (135,12,1)

--135
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 14:03:59',6)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (135,8,2)

--136
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 14:03:59',6)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (136,11,1)

--137
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 14:05:22',10)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (137,32,2)

--138
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 14:08:22',10)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (138,10,1)

--139
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy,ID_klienta) VALUES ('20200514 14:25:12',10,33)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (139,13,1)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (139,44,1)

--140
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy,ID_klienta) VALUES ('20200514 14:30:12',6,76)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (140,6,4)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (140,26,3)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (140,39,5)
--141
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy,ID_klienta) VALUES ('20200514 14:30:22',10,65)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (141,25,2)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (141,34,2)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (141,28,2)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (141,25,2)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (141,5,1)


--142
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 14:34:23',6)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (142,15,1)
GO
--143
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 14:37:59',6)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (143,42,1)

--144
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 14:39:25',6)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (144,42,1)

--145
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 14:39:25',6)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (145,28,1)

--146
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 14:52:03',10)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (146,39,1)

--147
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 14:54:01',10)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (147,5,1)

--148
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 14:57:02',10)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (148,6,1)

--149
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 14:59:03',6)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (149,5,1)

--150
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 15:03:03',10)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (150,16,2)

--151
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 15:07:13',10)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (151,54,1)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (151,42,1)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (151,6,1)

--152
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 15:10:59',6)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (152,39,1)

--153
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 15:15:59',6)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (153,8,1)

--154
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 15:19:19',6)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (154,1,2)

--155
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy,ID_klienta) VALUES ('20200514 15:20:22',10,81)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (155,1,1)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (155,5,1)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (155,2,2)
GO
--156
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy,ID_klienta) VALUES ('20200514 15:24:59',10,84)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (156,1,1)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (156,6,1)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (156,8,2)

--157
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 15:28:01',6)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (157,5,1)

--158
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 15:29:29',10)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (158,16,2)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (158,39,1)

--159
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 15:33:33',6)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (159,17,4)

--160
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 15:36:33',10)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (160,47,1)

--161
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 15:37:42',6)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (161,51,1)

--162
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 15:40:30',6)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (162,44,3)

--163
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 15:41:30',10)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (163,31,1)

--164
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 15:43:23',6)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (164,6,2)

--165
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy,ID_klienta) VALUES ('20200514 15:45:23',10,21)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (165,28,2)

--166
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy,ID_klienta) VALUES ('20200514 15:46:57',10,23)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (166,34,1)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (166,44,1)

--167
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy,ID_klienta) VALUES ('20200514 15:48:12',6,91)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (167,44,2)

--168
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 15:48:12',10)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (168,4,2)

--169
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 15:50:01',6)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (169,60,2)

--170
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 15:54:01',10)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (170,9,2)

--171
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 15:55:06',6)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (171,9,1)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (171,19,1)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (171,52,3)

--172
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 15:58:15',10)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (172,31,1)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (172,60,2)

--173
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 15:59:15',6)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (173,32,1)

--174
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 15:59:32',10)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (174,4,1)

--175
INSERT INTO Rejestr_sprzedazy(Data_sprzedazy, ID_baristy) VALUES ('20200514 15:59:58',6)
INSERT INTO Pozycje_rejestru_sprzedazy(ID_rejestru_sprzedazy,ID_menu,Iloœæ) VALUES (175,6,1)
GO


--=================================================================================================================================
--== NIEDZIELA - ZAKOÑCZENIE PRACY KAWIARNI 16:00 ===============================================================================================
--=================================================================================================================================


-- ---------------------------------
-- Usuwanie i tworzenie widoków
-- ---------------------------------
IF OBJECT_ID('Procent_przychodu_od_stalych_klientow','V') IS NOT NULL
DROP VIEW Procent_przychodu_od_stalych_klientow
GO

CREATE VIEW Procent_przychodu_od_stalych_klientow AS (

SELECT     [% Przychodu od sta³ych klientów]=   ROUND(SUM(PRS.Iloœæ * M.Wartosc_sprzedazy) /
                             (SELECT        SUM(Pozycje_rejestru_sprzedazy.Iloœæ * Menu.Wartosc_sprzedazy)
                              FROM            Rejestr_sprzedazy INNER JOIN
                              Pozycje_rejestru_sprzedazy ON Rejestr_sprzedazy.ID = Pozycje_rejestru_sprzedazy.ID_rejestru_sprzedazy INNER JOIN
                              Menu ON Pozycje_rejestru_sprzedazy.ID_menu = Menu.ID)*100,2) 

FROM            Rejestr_sprzedazy RS INNER JOIN
                        Pozycje_rejestru_sprzedazy PRS ON RS.ID = PRS.ID_rejestru_sprzedazy INNER JOIN
                         Menu M ON PRS.ID_menu = M.ID
WHERE        (ID_klienta!=1)
)
GO

IF OBJECT_ID('Sredni_rachunek','V') IS NOT NULL
DROP VIEW Sredni_rachunek
GO

CREATE VIEW Sredni_rachunek AS (
SELECT     Œredni_rachunek =   ROUND(SUM(PRS.Iloœæ * Menu.Wartosc_sprzedazy) / MAX(Rejestr_sprzedazy.ID), 2)
FROM            Rejestr_sprzedazy INNER JOIN
                         Pozycje_rejestru_sprzedazy PRS ON Rejestr_sprzedazy.ID = PRS.ID_rejestru_sprzedazy INNER JOIN
                         Menu ON PRS.ID_menu = Menu.ID
)
GO

IF OBJECT_ID('Zysk','V') IS NOT NULL
DROP VIEW Zysk
GO

CREATE VIEW Zysk AS (
SELECT   Zysk = SUM(ROUND((M.Wartosc_sprzedazy - M.Koszt_wytworzenia) * PRS.Iloœæ, 2))
FROM           Rejestr_sprzedazy INNER JOIN
                         Barisci ON Rejestr_sprzedazy.ID_baristy = Barisci.ID INNER JOIN
                         Pozycje_rejestru_sprzedazy PRS ON Rejestr_sprzedazy.ID = PRS.ID_rejestru_sprzedazy INNER JOIN
                         Menu M ON PRS.ID_menu = M.ID INNER JOIN
                         Typ_menu ON M.ID_typ_menu = Typ_menu.ID
)
GO

IF OBJECT_ID('Jedzenie','V') IS NOT NULL
DROP VIEW Jedzenie
GO

-- WIDOK 'Jedzenie' oraz WIDOK 'Sprzedaz' zostaj¹ stworzone na potrzeby procedur --------------------------------------------------------------
CREATE VIEW Jedzenie AS (
SELECT        PRS.Iloœæ, RS.ID_baristy, Menu.ID_typ_menu
FROM            Rejestr_sprzedazy RS INNER JOIN
                         Pozycje_rejestru_sprzedazy PRS ON RS.ID = PRS.ID_rejestru_sprzedazy INNER JOIN
                         Menu ON PRS.ID_menu = Menu.ID
						
)
GO

IF OBJECT_ID('Sprzedaz','V') IS NOT NULL
DROP VIEW Sprzedaz
GO

CREATE VIEW Sprzedaz
AS
SELECT        Menu.Nazwa, PRS.Iloœæ, Menu.ID_typ_menu
FROM            Menu INNER JOIN
                         Pozycje_rejestru_sprzedazy PRS ON Menu.ID = PRS.ID_menu

GO
------------------------------------------------------------------------------------------------------------------------------------------------
-- ---------------------------------
-- Tworzenie procedur
-- ---------------------------------
IF OBJECT_ID('Sugestywna_sprzedaz','P') IS NOT NULL
DROP PROCEDURE Sugestywna_sprzedaz
GO

CREATE PROCEDURE Sugestywna_sprzedaz
@ID_baristy INT
AS 
DECLARE @imie VARCHAR(30)
DECLARE @nazwisko VARCHAR(30)
DECLARE @ilosc_sprzedanego_towaru FLOAT = 0
DECLARE @ilosc_spredanego_jedzenia FLOAT = 0
DECLARE @procent_sprzedazy FLOAT 

BEGIN 

SELECT @imie = Imie, @nazwisko = nazwisko FROM Barisci WHERE ID = @ID_baristy

SELECT  @ilosc_sprzedanego_towaru = SUM(J.Iloœæ)
FROM Jedzenie J
WHERE J.ID_baristy = @ID_baristy 

SELECT @ilosc_spredanego_jedzenia = SUM(J.Iloœæ)
FROM Jedzenie J
WHERE J.ID_baristy = @ID_baristy AND J.ID_typ_menu = 2

SELECT @procent_sprzedazy = ROUND((@ilosc_spredanego_jedzenia / @ilosc_sprzedanego_towaru)*100,2)

SELECT  @imie 'Imie', @nazwisko 'Nazwisko', @ilosc_sprzedanego_towaru 'Ilosc sprzedanego towaru', @ilosc_spredanego_jedzenia 'Ilosc sprzedanego jedzenia', @procent_sprzedazy '% Sprzeda¿y jedzenia (Badanie sugestywnej sprzeda¿y)'
END
GO



IF OBJECT_ID('Top_5','P') IS NOT NULL
DROP PROCEDURE Top_5
GO

CREATE PROCEDURE Top_5 
@ID_typ_menu INT
AS
BEGIN 
SELECT TOP (5) iloœæ_sum = SUM(Iloœæ) , Nazwa
FROM           Sprzedaz 
WHERE      ID_typ_menu = @ID_typ_menu
GROUP BY Nazwa
ORDER BY iloœæ_sum DESC
END
GO

-- ---------------------------------------------
-- Utworzenie raportów (wywo³anie widoków i procedur)
-- ---------------------------------------------

-- RAPORT 1 - WIDOK - Procent_przychodu_od_stalych_klientow
PRINT 'Procent przychodu od sta³ych klientów'
SELECT * FROM Procent_przychodu_od_stalych_klientow

-- RAPORT 2 - WIDOK - Sredni_rachunek
PRINT 'Ukazanie œredniego rachunku - Ile œrednio jeden klient zostawia pieniêdzy w naszej kawiarni'
SELECT * FROM Sredni_rachunek

-- RAPORT 3 - WIDOK - Zysk
PRINT 'Ukazanie zysku kawiarni'
SELECT * FROM Zysk

-- RAPORT 4 - PROCEDURA - Sugestywna_sprzedaz
PRINT 'PROCEDURA (Badanie sugestywnej sprzeda¿y baristów, Stosunek sprzedanego jedzenia do ca³oœci wyra¿ony w %. Parametr ID_baristy - Parametr do wyboru "1" "5"'
EXEC Sugestywna_sprzedaz @ID_baristy =1
EXEC Sugestywna_sprzedaz @ID_baristy =5
EXEC Sugestywna_sprzedaz @ID_baristy =10
EXEC Sugestywna_sprzedaz @ID_baristy =6

-- RAPORT 5 - PROCEDURA - Top_5
PRINT 'Badanie najlepiej sprzedaj¹cych siê produktów. Parametr - kategoria. Mo¿liwe parametry do wyboru "1" "2" "3"'
EXEC Top_5 @ID_typ_menu= 1
EXEC Top_5 @ID_typ_menu= 2
EXEC Top_5 @ID_typ_menu= 3
-- ---------------------------------------------
-- Usuniêcie bazy
-- ---------------------------------------------
USE master
GO

IF DB_ID('Kawiarnia') IS NOT NULL
DROP DATABASE Kawiarnia
GO
