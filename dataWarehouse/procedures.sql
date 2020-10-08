/*==============================================================*/
/* Table: Procedury                                             */
/*==============================================================*/

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GenerowanieKluczy]
AS
BEGIN
DECLARE k2 CURSOR FOR
	SELECT [Tabela]
      ,[PolaKlucza]
	  ,[NazwaZrodla]
	FROM [Hurtownia].[dbo].[MetadaneGenerowanieKluczy]
DECLARE
	@Tabela varchar(100),
	@PolaKlucza varchar(1000),
	@NazwaZrodla varchar(100),
	@Zapytanie varchar(1000)
OPEN k2
FETCH NEXT FROM k2 INTO @Tabela, @PolaKlucza, @NazwaZrodla
WHILE @@FETCH_STATUS = 0
	BEGIN
	
		SET @Zapytanie = 'INSERT INTO Klucz (PolaKlucza, Zrodlo) SELECT Tab.PolaKlucza, ''' + 
		@NazwaZrodla + ''' FROM ( SELECT ' + @PolaKlucza + ' AS PolaKlucza FROM ' + 
		@Tabela + @NazwaZrodla + ' WHERE DUPLIKAT IS NULL ) AS Tab WHERE NOT EXISTS 
		( SELECT Null FROM Klucz WHERE Klucz.PolaKlucza = Tab.PolaKlucza AND Klucz.Zrodlo = ''' + @NazwaZrodla + ''')'

		PRINT (@Zapytanie)
		EXEC (@Zapytanie)	
		FETCH NEXT FROM k2 INTO @Tabela, @PolaKlucza, @NazwaZrodla
	END
CLOSE k2
DEALLOCATE k2
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Historyzacja]
AS
DECLARE k5 CURSOR FOR
	SELECT [Tabela]
	  ,[Zrodlo]
      ,[NazwaZrodla]
      ,[PolaKlucza]
  FROM [Hurtownia].[dbo].[MetadaneDelete]
DECLARE
	@Tabela varchar(100),
	@Zrodlo varchar(100),
	@NazwaZrodla varchar(200),
	@PolaKlucza varchar(200),
	@Zapytanie varchar(2000)
OPEN k5
FETCH NEXT FROM k5 INTO @Tabela, @Zrodlo, @NazwaZrodla, @PolaKlucza
WHILE @@FETCH_STATUS = 0
	BEGIN

		SET @Zapytanie = 'UPDATE ' + @Tabela + ' SET EndDTTM = GETDATE() ' +
						'WHERE Id' + @Tabela + ' IN ( SELECT Klucz.Klucz FROM ' + @Zrodlo + '.dbo.' + @Tabela + 'Delete ' +
						'JOIN Klucz ON ' + @PolaKlucza + ' = Klucz.PolaKlucza AND Klucz.Zrodlo = ''' + @NazwaZrodla + ''') ' +
						'AND EndDTTM = ''9999-12-31 23:59:59.997'''
		PRINT (@Zapytanie)
		EXEC (@Zapytanie)
			
		FETCH NEXT FROM k5 INTO @Tabela, @Zrodlo, @NazwaZrodla, @PolaKlucza

	END
CLOSE k5
DEALLOCATE k5
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[StageDoTmp]
AS
DECLARE k3 CURSOR FOR
	SELECT [Tabela]
	  ,[Zrodlo]
      ,[Pola]
      ,[KluczGlowny]
      ,[PolaKlucza]
  FROM [Hurtownia].[dbo].[MetadaneStageDoTmp]
DECLARE
	@Tabela varchar(100),
	@Zrodlo varchar(100),
	@Pola varchar(200),
	@KluczGlowny varchar(200),
	@PolaKlucza varchar(200),
	@MaxDTTM varchar(200),
	@Zapytanie varchar(2000)
OPEN k3
FETCH NEXT FROM k3 INTO @Tabela, @Zrodlo, @Pola, @KluczGlowny, @PolaKlucza
WHILE @@FETCH_STATUS = 0
	BEGIN
		EXEC ('TRUNCATE TABLE ' + @Tabela + 'Tmp')
		SET @MaxDTTM = ' ( SELECT MAX (Tab.StartDTTM) FROM ( SELECT StartDTTM FROM ' + @Tabela + ' UNION ALL SELECT StartDTTM FROM ' + @Tabela + 'Stg ) AS Tab ) ';
		SET @Zapytanie = 'INSERT INTO ' + @Tabela + 'Tmp ( ' + @KluczGlowny + ', ' + @Pola + ', StartDTTM, EndDTTM ) ' +
						'SELECT Klucz.Klucz, ' + @Pola + ', StageDTTM, ''9999-12-31 23:59:59.997'' ' +
						'FROM  ' + @Tabela + @Zrodlo + ' JOIN Klucz ON ' + @PolaKlucza + ' = Klucz.PolaKlucza ' +
						'AND Klucz.Zrodlo = ''' + @Zrodlo + ''' WHERE DUPLIKAT IS NULL AND ' +
						'DATEDIFF(second, ISNULL (' + @MaxDTTM + ', ''2000-01-01 00:00:00.000''), StageDTTM ) > 0'
		PRINT (@Zapytanie)
		EXEC (@Zapytanie)
				
		FETCH NEXT FROM k3 INTO @Tabela, @Zrodlo, @Pola, @KluczGlowny, @PolaKlucza
	END
CLOSE k3
DEALLOCATE k3
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TmpDoStgLubBad]
AS
DECLARE k3 CURSOR FOR
	SELECT [Tabela]
      ,[Pola]
	  ,[KluczGlowny]
      ,[Wymiar]
      ,[WymaganeKlucze]
  FROM [Hurtownia].[dbo].[MetadaneTmpDoStgLubBad]
  ORDER BY [Wymiar] DESC
DECLARE
	@Tabela varchar(1000),
	@Pola varchar(1000),
	@KluczGlowny varchar(100),
	@Wymiar bit,
	@WymaganeKlucze varchar(200),
	@Warunek varchar(1000),
	@Warunki varchar(1000),
	@Zapytanie varchar(2000),
	@Zapytanie2 varchar(2000),
	@Identyfikator varchar(200)
OPEN k3
FETCH NEXT FROM k3 INTO @Tabela, @Pola, @KluczGlowny, @Wymiar, @WymaganeKlucze
WHILE @@FETCH_STATUS = 0
	BEGIN
		SET @Zapytanie = 'INSERT INTO ' + @Tabela + 'Stg ( ' + @KluczGlowny + ', ' + @Pola + ' ) ' +
						'SELECT ' + @KluczGlowny + ', ' + @Pola +
						' FROM  ' + @Tabela + 'Tmp'
		IF @WymaganeKlucze IS NOT NULL
		BEGIN
			SET @Warunki = ' WHERE EXISTS'
			DECLARE wewK CURSOR FOR SELECT value FROM STRING_SPLIT(@WymaganeKlucze, ':')
			OPEN wewK
			FETCH NEXT FROM wewK INTO @Warunek
			WHILE @@FETCH_STATUS = 0
				BEGIN
					SET @Identyfikator = SUBSTRING(@Warunek, 1, CHARINDEX(' ', @Warunek))
					SET @Warunki += ' ( SELECT ' + @Warunek + ' WHERE ' + @Identyfikator + ' = ' + '_' + @Identyfikator + 
								' UNION ALL SELECT ' + 
								@Warunek + 'Stg WHERE ' + @Identyfikator + ' = ' + '_' + @Identyfikator + ') '
					FETCH NEXT FROM wewK INTO @Warunek
					IF @@FETCH_STATUS = 0
					SET @Warunki += ' AND EXISTS'					
				END
			CLOSE wewK
			DEALLOCATE wewK
			SET @Zapytanie2 = @Zapytanie + @Warunki
			PRINT (@Zapytanie2)
			EXEC (@Zapytanie2)
		END
		ELSE
		BEGIN
			PRINT (@Zapytanie)
			EXEC (@Zapytanie)
		END
		
		SET @Zapytanie = 'INSERT INTO ' + @Tabela + 'Bad ( ' + @KluczGlowny + ', ' + @Pola + ' ) ' +
						'SELECT ' + @KluczGlowny + ', ' + @Pola +
						' FROM  ' + @Tabela + 'Tmp WHERE ' + @KluczGlowny + ' NOT IN ( SELECT ' + @KluczGlowny + ' FROM ' + @Tabela + 'Bad ) '
								
		IF @WymaganeKlucze IS NOT NULL
		BEGIN
			SET @Warunki = ' AND ( NOT EXISTS'
			DECLARE wewK CURSOR FOR SELECT value FROM STRING_SPLIT(@WymaganeKlucze, ':')
			OPEN wewK
			FETCH NEXT FROM wewK INTO @Warunek
			WHILE @@FETCH_STATUS = 0
				BEGIN
					SET @Identyfikator = SUBSTRING(@Warunek, 1, CHARINDEX(' ', @Warunek))
					SET @Warunki += ' ( SELECT ' + @Warunek + ' WHERE ' + @Identyfikator + ' = ' + '_' + @Identyfikator + 
								' UNION ALL SELECT ' + 
								@Warunek + 'Stg WHERE ' + @Identyfikator + ' = ' + '_' + @Identyfikator + ') '
					FETCH NEXT FROM wewK INTO @Warunek
					IF @@FETCH_STATUS = 0
					SET @Warunki += ' OR NOT EXISTS'					
				END
			CLOSE wewK
			DEALLOCATE wewK
			SET @Zapytanie2 = @Zapytanie + @Warunki + ' )'
			PRINT (@Zapytanie2)
			EXEC (@Zapytanie2)
		END
		
		
		FETCH NEXT FROM k3 INTO @Tabela, @Pola, @KluczGlowny, @Wymiar, @WymaganeKlucze
	END
CLOSE k3
DEALLOCATE k3
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WczytanieDoHurtowni]
AS
DECLARE k4 CURSOR FOR
	SELECT [Tabela]
      ,[Pola]
      ,[KluczGlowny]
      ,[WymaganeKlucze]
  FROM [Hurtownia].[dbo].[MetadaneWczytanieDoHurtowni]
DECLARE
	@Tabela varchar(100),
	@Pola varchar(200),
	@KluczGlowny varchar(200),
	@WymaganeKlucze varchar(200),
	@EndDTTM datetime,
	@Warunek varchar(200),
	@Warunki varchar (2000),
	@Zapytanie varchar(2000),
	@Identyfikator varchar(200)
OPEN k4
FETCH NEXT FROM k4 INTO @Tabela, @Pola, @KluczGlowny, @WymaganeKlucze
WHILE @@FETCH_STATUS = 0
	BEGIN

		PRINT ('------ Procesowanie Stg ------')
		SET @Zapytanie = 'UPDATE ' + @Tabela + ' SET EndDTTM = ( SELECT MAX(StartDTTM) FROM ' + @Tabela + 'Stg ) ' +
						'WHERE ' + @KluczGlowny + ' IN ( SELECT ' + @KluczGlowny + ' FROM ' + @Tabela + 'Stg )'
		PRINT (@Zapytanie)
		EXEC (@Zapytanie)

		SET @Zapytanie = 'UPDATE ' + @Tabela + 'Bad SET EndDTTM = ( SELECT MAX(StartDTTM) FROM ' + @Tabela + 'Stg ) ' + 
						'WHERE Rozwiazany IS NULL AND EndDTTM = ''9999-12-31 23:59:59.997'' '+
						'AND ' + @KluczGlowny + ' IN ( SELECT ' + @KluczGlowny + ' FROM ' + @Tabela + 'Stg )'		
		PRINT (@Zapytanie)
		EXEC (@Zapytanie)

		SET @Zapytanie = 'INSERT INTO ' + @Tabela + ' ( ' + @KluczGlowny + ', ' + @Pola + ' ) ' +
						'SELECT ' + @KluczGlowny + ', ' + @Pola + ' FROM ' + @Tabela + 'Stg'
		PRINT (@Zapytanie)
		EXEC (@Zapytanie)

		PRINT ('------ Procesowanie Bad ------')
		BEGIN
			SET @Warunki = '';
			DECLARE wewK CURSOR FOR SELECT value FROM STRING_SPLIT(@WymaganeKlucze, ':')
			OPEN wewK
			FETCH NEXT FROM wewK INTO @Warunek
			WHILE @@FETCH_STATUS = 0
			BEGIN
				SET @Identyfikator = SUBSTRING(@Warunek, 1, CHARINDEX(' ', @Warunek))
				SET @Warunki += 'AND EXISTS ( SELECT ' + @Warunek + ' WHERE ' + @Identyfikator + ' = ' + '_' + @Identyfikator + 
								' UNION ALL SELECT ' + 
								@Warunek + 'Stg WHERE ' + @Identyfikator + ' = ' + '_' + @Identyfikator + ') '
				FETCH NEXT FROM wewK INTO @Warunek
			END
			CLOSE wewK
			DEALLOCATE wewK
			SET @Zapytanie = 'INSERT INTO ' + @Tabela + ' ( ' + @KluczGlowny + ', ' + @Pola + ' ) ' +
						'SELECT ' + @KluczGlowny + ', ' + @Pola + ' FROM ' + @Tabela + 'Bad ' + 
						'WHERE Rozwiazany IS NULL AND EndDTTM = ''9999-12-31 23:59:59.997'' ' + @Warunki
			PRINT (@Zapytanie)
			EXEC (@Zapytanie)
			SET @Zapytanie = 'UPDATE ' + @Tabela + 'Bad SET Rozwiazany = 1 WHERE Rozwiazany IS NULL AND EndDTTM = ''9999-12-31 23:59:59.997'' ' + @Warunki 
			PRINT (@Zapytanie)
			EXEC (@Zapytanie)
		END
		EXEC ('TRUNCATE TABLE ' + @Tabela + 'Stg')
		FETCH NEXT FROM k4 INTO @Tabela, @Pola, @KluczGlowny, @WymaganeKlucze		
	END
CLOSE k4
DEALLOCATE k4
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ZrodloDoStage]
AS
DECLARE k1 CURSOR FOR
	SELECT [Id]
      ,[TypZrodla]
      ,[Zrodlo]
      ,[TabelaZrodla]
      ,[PolaZrodlowe]
      ,[TabelaDocelowa]
      ,[PolaDocelowe]
	  ,[Grupowanie]
      ,[NazwaId]
  FROM [Hurtownia].[dbo].[MetadaneWczytanieDanychZeZrodla]
DECLARE
	@Id int,
	@TypZrodla varchar(100),
	@Zrodlo varchar(100),
	@TabelaZrodla varchar(100),
	@PolaZrodlowe varchar(200),
	@TabelaDocelowa varchar(100),
	@PolaDocelowe varchar(200),
	@Grupowanie varchar(1000),
	@NazwaId varchar(100),
	@SciezkaDoFolderu varchar(1000),
	@Zapytanie varchar(2000)
SET @SciezkaDoFolderu = 'D:/Hurtownia'
OPEN k1
FETCH NEXT FROM k1 INTO @Id, @TypZrodla, @Zrodlo, @TabelaZrodla, @PolaZrodlowe, @TabelaDocelowa, @PolaDocelowe, @Grupowanie, @NazwaId
WHILE @@FETCH_STATUS = 0
	BEGIN	
		IF @TypZrodla = 'DB'
		BEGIN
			SET @Zapytanie = 'INSERT INTO ' + @TabelaDocelowa + ' (' + @PolaDocelowe + ', StageDTTM) ' +
								'SELECT ' + @PolaZrodlowe + ', GETDATE() FROM ' + @Zrodlo + '.dbo.' + @TabelaZrodla +
								' WHERE BINARY_CHECKSUM( ' + @PolaDocelowe + ') NOT IN ( SELECT BINARY_CHECKSUM(' + @PolaDocelowe + 
								') FROM ' + @TabelaDocelowa + ')'
			PRINT (@Zapytanie)
			EXEC (@Zapytanie)
		END
		
		ELSE 
		BEGIN
			SET @Zapytanie = 'BULK INSERT ' + @TabelaDocelowa + 'BezDTTM FROM ''' + @SciezkaDoFolderu + @Zrodlo + 
							+ @TabelaZrodla +
							''' WITH ( FIELDTERMINATOR = '';'', ROWTERMINATOR = ''\n'' ) '
			PRINT (@Zapytanie)
			EXEC (@Zapytanie)

			SET @Zapytanie = 'INSERT INTO ' + @TabelaDocelowa + ' (' + @PolaDocelowe + ', StageDTTM) ' +
						' SELECT ' + @PolaZrodlowe + ', GETDATE() ' +
						' FROM ' + @TabelaDocelowa + 'BezDTTM WHERE BINARY_CHECKSUM( ' + @PolaDocelowe + ') NOT IN ( SELECT BINARY_CHECKSUM(' + @PolaDocelowe + 
								') FROM ' + @TabelaDocelowa + ')'
			PRINT (@Zapytanie)
			EXEC (@Zapytanie)

			SET @Zapytanie = 'TRUNCATE TABLE ' + @TabelaDocelowa + 'BezDTTM'
			PRINT (@Zapytanie)
			EXEC (@Zapytanie)

		END

		SET @Zapytanie = 'UPDATE ' + @TabelaDocelowa + ' SET DUPLIKAT = 1 WHERE Id' +
					@TabelaDocelowa + ' NOT IN ( SELECT MAX(Id' + @TabelaDocelowa + ') FROM ' + 
						@TabelaDocelowa + ' GROUP BY ' + @Grupowanie + ' )'
		PRINT (@Zapytanie)
		EXEC (@Zapytanie)

		FETCH NEXT FROM k1 INTO @Id, @TypZrodla, @Zrodlo, @TabelaZrodla, @PolaZrodlowe, @TabelaDocelowa, @PolaDocelowe, @Grupowanie, @NazwaId
	END
CLOSE k1
DEALLOCATE k1
GO