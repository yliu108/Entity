﻿DECLARE @CurrentMigration [nvarchar](max)

IF object_id('[dbo].[__MigrationHistory]') IS NOT NULL
    SELECT @CurrentMigration =
        (SELECT TOP (1) 
        [Project1].[MigrationId] AS [MigrationId]
        FROM ( SELECT 
        [Extent1].[MigrationId] AS [MigrationId]
        FROM [dbo].[__MigrationHistory] AS [Extent1]
        WHERE [Extent1].[ContextKey] = N'CodeFirst.Migrations.Configuration'
        )  AS [Project1]
        ORDER BY [Project1].[MigrationId] DESC)

IF @CurrentMigration IS NULL
    SET @CurrentMigration = '0'

IF @CurrentMigration < '202007292316478_InitialModel'
BEGIN
    CREATE TABLE [dbo].[Genres] (
        [Id] [tinyint] NOT NULL,
        [Name] [nvarchar](max),
        CONSTRAINT [PK_dbo.Genres] PRIMARY KEY ([Id])
    )
    CREATE TABLE [dbo].[Videos] (
        [Id] [int] NOT NULL IDENTITY,
        [Name] [nvarchar](max),
        [ReleaseDate] [datetime] NOT NULL,
        CONSTRAINT [PK_dbo.Videos] PRIMARY KEY ([Id])
    )
    CREATE TABLE [dbo].[__MigrationHistory] (
        [MigrationId] [nvarchar](150) NOT NULL,
        [ContextKey] [nvarchar](300) NOT NULL,
        [Model] [varbinary](max) NOT NULL,
        [ProductVersion] [nvarchar](32) NOT NULL,
        CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY ([MigrationId], [ContextKey])
    )
    INSERT [dbo].[__MigrationHistory]([MigrationId], [ContextKey], [Model], [ProductVersion])
    VALUES (N'202007292316478_InitialModel', N'CodeFirst.Migrations.Configuration',  0x1F8B0800000000000400D558DB6EE336107D2FD07F10F8D4A25933979736907791759222E83A09226FDE6969EC10E54525A9C0EAAFF5A19FD45FE85077C997D8D945B645804022670E67E6CC0C47FEE7AFBFC30F2B29826730966B352627A36312808A75C2D5724C32B778F733F9F0FEFBEFC2AB44AE82C75AEECCCBA1A6B263F2E45C7A4EA98D9F40323B923C36DAEA851BC55A5296687A7A7CFC0B3D39A1801004B182207CC894E3128A177C9D681543EA3226A63A0161AB75DC890AD4E09649B0298B614C262871CD8D7524B8109CA101118805099852DA3187E69D7FB61039A3D5324A718189599E02CA2D98B050997DDE8AEFEBC1F1A9F780B68A35549C59A7E5818027675548E850FD5581254DC8306857185C977BAF8BC08DC9AFA00C7A3E3CE97C228C97EA0475746FF4D230F953A17214341B470DF99823FE0FF732E13203630599334C1C05F7D95CF0F837C867FA7750639509D1B50B2DC3BDDE022EE1812918973FC0A2B2F6262101EDEBD1A162A3D6D1295DF9983B74F516CF6673010DEB74A7BAFF5F0360EA60F29360CA569F402DDDD398E02309AEF90A927AA542FDAC38D60A2A39930D0E09694BC34E721E7902FA30720A95FF233937CA9D9D6E60A7E376E4B401CC3E30CC4172CF9C03A33C061481FB064CAE1FF2000298854BE69AB3FCF38CCB97526F7756601F748CA3EB6D6AFC592CC2CA6DC810EC735592D8CAEEBED5256804AEDB062C095A13CAE639AAFA03DDAD5E64DD26F52A8337F9D978D4B6745AF6F4BAF7D32DCD3F9CB23445FA3A9741B51244D54DF02E3ABC57CA1283C67643CB6CAC6D4EC264644B18EC764A12696773E6599E24724DACC7DF96E0D647F5281AD6611BF25ADC3F972A6D7B28691CE8B671BB4657245651E1153406D4D7C39A5E71FD32C1CC86729E689149B5AD25ECD22E0BB4AB5FAEAC23847460F8302A742D2C83C6340CF25E145469FE3A0ACA52389C822D7ADF9A826D08BD06D805EA6DBC31A56B3D6728D29CDEF49E418F09AB7A3F600AAD1B402942020CD4337289C51FE5D6811C798151F48798088EFEB60253A6F802AC2BAF638213E1E960A2FDEF4C97D4DA44EC3362BEF940E1B8CAB90FEB170C7CEA9999F889991F245BFDD845FAE2A1EECDC35184E2C509EA6D62B5D7D894E0B3FBDA63D3FAEDBCC75CB47D2C2A4B1B6D9DE390332B6DAC47A97D46A6ED13D326E47ACA7AE534B5DEC142DAFDDA0E2FC1F2650BE1BFBD15C4BE35B4A0B5CC8D5AE89A4374AA6B512D32A0780A8E21A7ECC238BE60B1C3ED18AC2DC6F047263214B99273486ED45DE6D2CC5D580B722E7A637D48779F5F8C8C7D9BC3BBD4BFD9AFE1029AC97D5ADEA98F19174963F7F586B4DC02E113B02A40B40A3F43106E993748B75AED095485EF125250BE7C6720538160F64E45EC195E631B7E347C82258BF3FA22DA0EF23211FDB087979CF9EF535B61B4FAFE1724EA7F427AFF2F83D565D774120000 , N'6.1.3-40302')
END

IF @CurrentMigration < '202007300057342_PopulateGenresTable'
BEGIN
    INSERT INTO Genres (Id, Name)
                    VALUES (1, 'Comedy'), 
    	                   (2, 'Action'), 
    	                   (3, 'Horror'), 
    	                   (4, 'Thriller'), 
    	                   (5, 'Family'), 
    	                   (6, 'Romance')
    INSERT [dbo].[__MigrationHistory]([MigrationId], [ContextKey], [Model], [ProductVersion])
    VALUES (N'202007300057342_PopulateGenresTable', N'CodeFirst.Migrations.Configuration',  0x1F8B0800000000000400D558DB6EE336107D2FD07F10F8D4A25933979736907791759222E83A09226FDE6969EC10E54525A9C0EAAFF5A19FD45FE85077C997D8D945B645804022670E67E6CC0C47FEE7AFBFC30F2B29826730966B352627A36312808A75C2D5724C32B778F733F9F0FEFBEFC2AB44AE82C75AEECCCBA1A6B263F2E45C7A4EA98D9F40323B923C36DAEA851BC55A5296687A7A7CFC0B3D39A1801004B182207CC894E3128A177C9D681543EA3226A63A0161AB75DC890AD4E09649B0298B614C262871CD8D7524B8109CA101118805099852DA3187E69D7FB61039A3D5324A718189599E02CA2D98B050997DDE8AEFEBC1F1A9F780B68A35549C59A7E5818027675548E850FD5581254DC8306857185C977BAF8BC08DC9AFA00C7A3E3CE97C228C97EA0475746FF4D230F953A17214341B470DF99823FE0FF732E13203630599334C1C05F7D95CF0F837C867FA7750639509D1B50B2DC3BDDE022EE1812918973FC0A2B2F6262101EDEBD1A162A3D6D1295DF9983B74F516CF6673010DEB74A7BAFF5F0360EA60F29360CA569F402DDDD398E02309AEF90A927AA542FDAC38D60A2A39930D0E09694BC34E721E7902FA30720A95FF233937CA9D9D6E60A7E376E4B401CC3E30CC4172CF9C03A33C061481FB064CAE1FF2000298854BE69AB3FCF38CCB97526F7756601F748CA3EB6D6AFC592CC2CA6DC810EC735592D8CAEEBED5256804AEDB062C095A13CAE639AAFA03DDAD5E64DD26F52A8337F9D978D4B6745AF6F4BAF7D32DCD3F9CB23445FA3A9741B51244D54DF02E3ABC57CA1283C67643CB6CAC6D4EC264644B18EC764A12696773E6599E24724DACC7DF96E0D647F5281AD6611BF25ADC3F972A6D7B28691CE8B671BB4657245651E1153406D4D7C39A5E71FD32C1CC86729E689149B5AD25ECD22E0BB4AB5FAEAC23847460F8302A742D2C83C6340CF25E145469FE3A0ACA52389C822D7ADF9A826D08BD06D805EA6DBC31A56B3D6728D29CDEF49E418F09AB7A3F600AAD1B402942020CD4337289C51FE5D6811C798151F48798088EFEB60253A6F802AC2BAF638213E1E960A2FDEF4C97D4DA44EC3362BEF940E1B8CAB90FEB170C7CEA9999F889991F245BFDD845FAE2A1EECDC35184E2C509EA6D62B5D7D894E0B3FBDA63D3FAEDBCC75CB47D2C2A4B1B6D9DE390332B6DAC47A97D46A6ED13D326E47ACA7AE534B5DEC142DAFDDA0E2FC1F2650BE1BFBD15C4BE35B4A0B5CC8D5AE89A4374AA6B512D32A0780A8E21A7ECC238BE60B1C3ED18AC2DC6F047263214B99273486ED45DE6D2CC5D580B722E7A637D48779F5F8C8C7D9BC3BBD4BFD9AFE1029AC97D5ADEA98F19174963F7F586B4DC02E113B02A40B40A3F43106E993748B75AED095485EF125250BE7C6720538160F64E45EC195E631B7E347C82258BF3FA22DA0EF23211FDB087979CF9EF535B61B4FAFE1724EA7F427AFF2F83D565D774120000 , N'6.1.3-40302')
END

IF @CurrentMigration < '202007300110560_AddGenreToVideosTable'
BEGIN
    ALTER TABLE [dbo].[Videos] ADD [Genre_Id] [tinyint]
    CREATE INDEX [IX_Genre_Id] ON [dbo].[Videos]([Genre_Id])
    ALTER TABLE [dbo].[Videos] ADD CONSTRAINT [FK_dbo.Videos_dbo.Genres_Genre_Id] FOREIGN KEY ([Genre_Id]) REFERENCES [dbo].[Genres] ([Id])
    INSERT [dbo].[__MigrationHistory]([MigrationId], [ContextKey], [Model], [ProductVersion])
    VALUES (N'202007300110560_AddGenreToVideosTable', N'CodeFirst.Migrations.Configuration',  0x1F8B0800000000000400D559596FE336107E2FD0FF20E8A947D6CAF1D21AF62EB2DEA430BA39103941DF025A1A3B44294A25A9C06ED15FD687FEA4FE850E758B941CD9ED665B183064726638C7C739E4BFFEF873F26E1331E71984A4319FBA27A363D7011EC421E5EBA99BAAD59BEFDC776FBFFC627211461BE7A1A43BD374C8C9E5D47D522A197B9E0C9E20227214D140C4325EA95110471E0963EFF4F8F87BEFE4C40314E1A22CC799DCA55CD108B21FF87316F300129512761587C064B18E3B7E26D5B92611C884043075674871498554AE73CE2841057C602BD7219CC78A28546F7C2FC15722E66B3FC105C216DB04906E45988442ED714D3ED482E3536D81573396A28254AA38DA53E0C959E112CF643FC8B16EE53274DA053A576DB5D599E3A6EE0FC0055A6E9E349E31A1A91A4E1DDD8A782D48F46DC672E4541B4755F01123FA837B2953A98029875409C28E9CDB74C968F0236C17F1CFC0A73C65ACA9176A867BAD055CC20313106A7B07AB42DB79E83A5E9BCF33192BB6064F6ECAFBAD4253AFF16CB2645045DDDBC9AEBF4B01081D04BFEB5C91CD47E06BF53475F1D1752EE906C272A5907ACF29DE15645222B50FB926CF749D79DA38EE8186104BD7B903966DCB279AE4381E655B8F45C02E451CDDC5ACE4C8971F1744AC01E1BF88ED3D3F4E45606832F16A40EC844926683F98642CFF4798CCB93A3BEDC049C36C5FC502D0AD208882F0962805826B199039EEF360CA3804110444C207A2AAB3F4F38246032E412F3E0BF81D06CF12825DF02CA13B049EE752C601CD1468E2B338BC6DC9050F9D1D9AE431A8F4C7382026698228C473A7EE379667BAE55517AF965778A22DEF78343A316D6C5863DF41AC7F8A50045A6DE8AFD9226C54C77DC4FA565C4959A0C4D45E0BF54135C389E9A6F6735B7BCBF8367B99AD2CF6C299067BC3524346899B064507ACCC9BBF3BB695B2B59EDE300965341B124A479969A56D520776AB00D69D8B97B72E658BE3F5F438932B9224981B1A3D4FB1E2F845C3F3C6DFBF258872195E203B3A834ADBEA24CC74640DC66E23DF634E214BA253C82C8C2CB2165C7BB0541ED542A41DA8126125B97ECE59EADAD30993DA6F97684A84293AB30ACCE8DA7C59974918111DB56216B334E27DF56617779EFD9BFCF98A2D61E2198A9B5EF12CB718F0349D3C2804C56D392C04F9CDDF3F043D7C9F3B047D125AD5B529A8B5F1FA216DE7A38EB89699B6377625C1A000E904DAD5C1B613A9ED854131CD657445567BA13A773F958AEA70A04A7B2B83B92FA459A33297BAE9AA1AAE21869AE5C58EB855654C920A6F55B531AACAA4C8F07B8CD765CACF495C076D7F460F63BAF7B7524134D20423FF17366314115E135C114E572055DEDDBB38EA9E1AA3FA7F676CF6A40CD990D9F9D5E71345F9966AB7FE8349963F13113C11F15544365F3725D993C59E33E2ABBB2373C58B03D9EBF86AD01416E2B31A348575CD5E8F1D40B0C680390F6133757FCB18C7CEFCA7C792F7C8B9117813C7CEB1F3FB61713F6CF86A549DFDE623BB493F646A43B081D058200C53A5540293A5557A6F71120F6842584B67BB520C41B0F65F25CFDCF90009700DCD9659430EDA55122BA9C6557AC9F63D2750BBF31F3062F64F987911C15BB1D481CDC1D8336C754E9FFDC36797E4EE41F0130EA62DEB1BB3C68BA3A83DBF7E9AE1D32EFF8898C63B7804ABA4EB5A84EE6838042DAC543473BE8A4BD01A1A9524464EBB024530219273A1E88A040AB70390327B25F640588A2417D112C239BF4955922A3419A2256BBD62D3D0DF757E3661B7759EDC24D9EBAB7FC3045493EA9C7EC3DFA7948595DE97764EEF13A1EF5451BD742C95AE62EB6D25E93AE6030515EEAB52C102A284A13079C37DF20C87E8762FE123AC49B02DBBB87E212F07A2EDF6C9074AF4BB6259C8A8F9F5FF4A9EFE63E9EDDF679835D58A1A0000 , N'6.1.3-40302')
END

IF @CurrentMigration < '202007300114492_AddClassificationToVideoTable'
BEGIN
    ALTER TABLE [dbo].[Videos] ADD [Classification] [int] NOT NULL DEFAULT 0
    INSERT [dbo].[__MigrationHistory]([MigrationId], [ContextKey], [Model], [ProductVersion])
    VALUES (N'202007300114492_AddClassificationToVideoTable', N'CodeFirst.Migrations.Configuration',  0x1F8B0800000000000400D559DB6EE336107D2FD07F10F4D44BD6B2939736B07791F5260BA3EB248892A06F012D8D1DA214A5925460B7E897F5A19FD45FE850A26E94ECC86E36DB62818545CE0CE7723817E6EF3FFF1ABF5B47CC79022169CC27EE6830741DE0411C52BE9AB8A95ABEF9C17DF7F6EBAFC6E761B476EE0BBA134D879C5C4EDC47A59253CF93C12344440E221A8858C64B3508E2C82361EC1D0F873F7AA3910728C245598E33BE49B9A211641FF8398D7900894A099BC7213069D671C7CFA43A97240299900026EE14292EA890CA75CE1825A8800F6CE93A84F3581185EA9DDE49F09588F9CA4F7081B0DB4D0248B7244C8251FBB422EF6BC1F0585BE0558C85A820952A8EF614383A312EF16CF6831CEB962E43A79DA373D5465B9D396EE27E042ED072FBA4D329139AAAE6D4C1B588578244DF672C474EB97154061F31A2FFE15ECA542A60C2215582B023E73A5D301AFC049BDBF817E0139E3256D70B35C3BDC6022EE1810908B5B981A5D17616BA8ED7E4F36CC692ADC6939BF27EA3D0D44B3C9B2C189451F776B2EBFF0B01081D04BFEBCCC9FA13F0957A9CB8F8D3752EE81AC262C548BDE314EF0A322991B60FB9244F749579DA3AEE9E86104BD7B901966DCB479AE4381E645B0F266017228E6E625670E4CB0FB744AC00E17F1BB7F7FC381581A5C9D8AB00B1132699A0FD6092B1FC1F6132E3EAE4B8032735B37D150B40B782200AC26BA21408AE6540E6B82F8329EB10441010091F882ACFD2BF6F69B4FF25983222255DD2C0A421A3BA46A5BDF59CE4ADC837C03E0CF805B8BB805F5C8A7EC04FA31AEC6DE366F28291555530F6B90F4D592F7031100E2108B641F8D481DB74F71CA20508638E4F19D673D7B9272CC5CF512B380DEA8F310B4BDAE3DDB4D73A68E8BB92FEA4EDEFDCB3F5C53329E38066FEA8E71913EAE671E73C7476C4BD02A449557374214DD06918E589FB5D4BFD6E796502ADE419DC35E50D0783916D61CD9A762EC53E4611CA4B87E1A1BF658BB0561D38C23EC540499ADB6E6BAF85FAA0EA9707CB4685EAA6F62DE39BEC45D569B11B675AEC354B2D19C52DAD51745C623B83EF8E6DA96CA5A7D74F4211CD9A84C2517679689AD49129CA00561DA897B7A045ABEA6DE955C773922478496BBDAB59717CD3B8BEF1F76FEDA25C8617C88E0EAFD4B63C092B165981B55BCB53581BC882E8A4360DA3165903AE5BB0541CD540643B5005C20A72FDDB64DB326776C2A4F2DB059A1261A9CDAC023BBA6DBE6C5A208C888E9A3F8D591AF16D7DC32EEEBC8AD7F9F395B684B167296E7BC56BB9C582A7EDE45E2130B7E5B010E4377FFF106CE1FBD221D826A1D125D5053536FACBB33B86BA487BEFF581D2CC721D6829F2F756441404BDC2AED372D77CD34CCF6D2FF4424A2EA30B2FDA0BE5B9FBA9646ACE812AEDAD0C66D49066EDCF4CEAC6B96C2CFB186A17AD76C45BB5CB2629F156D630AB568D4DDDD8E3F1A528243989EBA0ED4FE8612C22FE462A88069A60E0FFCAA68C22C22B8239E1740952E52DAE7B3C1C1D5B0F39FF9D47154FCA90F5795979F5E915DB709C08D4BF7AE7E04F44048F447C1391F5B77549EDB973CF1784577747E68A67C7F5D7F155AF193DC4DFEAE566F443A050251C0B52AD31658613E87AE2FE9E319E3AB39F1F0ADE23E74AE09D3E7586CE1F8721E8B0E1B056BFF69BDFDA43C4215325C216844615619874250EEFB45DC4AF05E5014D086BE8DCAE397DEE82F65F29CFDEF90009700DF286597D0EDA555C4BA9D6A57CCEF63D27E4F664D26304DE3E01E7E508EFD742073607E39661B0733ADE3E1C7749EE1E543FE3E0DCB0BE360B3D3B2AB7E7EBCF331CB71B09444CED6F3D085649579508DD1B71081A582969667C1917A0B5342A48AC9C36074530B59233A1E892040AB703C07CA99F5ECD93D579B48070C6AF5295A40A4D8668C11A4FB91AFABBCECF5E009A3A8FAF92EC31F3254C4035A9AE0E57FC7D4A6B4F7317ED9CBE4D84BE53A60EEA582A5D0F579B52D265CC7B0A32EE2B53C12D44094361F28AFBE4090ED1ED4EC22758916053F483DB853C1F88A6DBC71F28D16FB0D2C8A8F8F113311C46EBB7FF0081C664CBF21C0000 , N'6.1.3-40302')
END

