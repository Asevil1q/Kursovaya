USE [TokarevKursov]
GO
/****** Object:  Table [dbo].[Вид_жилья]    Script Date: 05.11.2024 14:31:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Вид_жилья](
	[Код жилья] [int] IDENTITY(1,1) NOT NULL,
	[Название] [nvarchar](50) NOT NULL,
	[Категория] [nvarchar](50) NOT NULL,
	[Описание] [nvarchar](max) NULL,
 CONSTRAINT [PK__Вид_жиль__39095CC4AF48182A] PRIMARY KEY CLUSTERED 
(
	[Код жилья] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Клиенты]    Script Date: 05.11.2024 14:31:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Клиенты](
	[Код клиента] [int] IDENTITY(1,1) NOT NULL,
	[Фамилия] [nvarchar](50) NOT NULL,
	[Имя] [nvarchar](50) NOT NULL,
	[Отчество] [nvarchar](50) NULL,
	[Серия паспорта] [nvarchar](4) NOT NULL,
	[Номер паспорта] [nvarchar](6) NOT NULL,
	[Выдан паспорт] [nvarchar](50) NOT NULL,
	[Дата рождения] [date] NOT NULL,
	[Адрес] [nvarchar](50) NOT NULL,
	[Город] [nvarchar](50) NOT NULL,
	[Телефон] [nvarchar](12) NOT NULL,
 CONSTRAINT [PK__Клиенты__FDED6CB1BF5C1841] PRIMARY KEY CLUSTERED 
(
	[Код клиента] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Клиенты_Копия]    Script Date: 05.11.2024 14:31:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Клиенты_Копия](
	[Код клиента] [int] IDENTITY(1,1) NOT NULL,
	[Фамилия] [nvarchar](50) NOT NULL,
	[Имя] [nvarchar](50) NOT NULL,
	[Отчество] [nvarchar](50) NULL,
	[Серия паспорта] [nvarchar](4) NOT NULL,
	[Номер паспорта] [nvarchar](6) NOT NULL,
	[Выдан паспорт] [nvarchar](50) NOT NULL,
	[Дата рождения] [date] NOT NULL,
	[Адрес] [nvarchar](50) NOT NULL,
	[Город] [nvarchar](50) NOT NULL,
	[Телефон] [nvarchar](12) NOT NULL,
	[Возраст] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Пансионаты]    Script Date: 05.11.2024 14:31:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Пансионаты](
	[Код пансионата] [int] IDENTITY(1,1) NOT NULL,
	[Название] [nvarchar](50) NOT NULL,
	[Описание] [nvarchar](max) NULL,
	[Страна] [nvarchar](50) NOT NULL,
	[Город] [nvarchar](50) NOT NULL,
	[Адрес] [nvarchar](50) NOT NULL,
	[Телефон] [nvarchar](50) NOT NULL,
	[Кол-во номеров] [int] NOT NULL,
	[Бассейн] [nvarchar](3) NULL,
	[Мед услуги] [nvarchar](3) NULL,
	[Спа салон] [nvarchar](3) NULL,
	[До моря] [nvarchar](50) NULL,
	[Вид жилья] [int] NOT NULL,
 CONSTRAINT [PK__Пансиона__931686FEA66E6CC6] PRIMARY KEY CLUSTERED 
(
	[Код пансионата] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Путевки]    Script Date: 05.11.2024 14:31:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Путевки](
	[Код_путевки] [int] IDENTITY(1,1) NOT NULL,
	[Клиент] [int] NOT NULL,
	[Тур] [int] NOT NULL,
	[Пансионат] [int] NOT NULL,
	[Дата заезда] [date] NOT NULL,
	[Дата отьезда] [date] NOT NULL,
	[Дети] [nvarchar](10) NULL,
	[Мед страховка] [nvarchar](50) NULL,
	[Кол-во человек] [int] NULL,
	[Сумма] [decimal](18, 2) NULL,
 CONSTRAINT [PK__Путевки__D94EB7C0B10A523E] PRIMARY KEY CLUSTERED 
(
	[Код_путевки] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Тур]    Script Date: 05.11.2024 14:31:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Тур](
	[Код тура] [int] IDENTITY(1,1) NOT NULL,
	[Название] [nvarchar](50) NOT NULL,
	[Вид транспорта] [nvarchar](50) NOT NULL,
	[Вид жилья] [int] NOT NULL,
	[Вид питания] [nvarchar](50) NULL,
	[Цена за сутки] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK__Тур__5FEB9044D3D9348C] PRIMARY KEY CLUSTERED 
(
	[Код тура] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[TUR]    Script Date: 05.11.2024 14:31:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[TUR] AS
SELECT [Код тура], Название, [Вид транспорта], [Вид питания], [Цена за сутки]
FROM Тур
WHERE [Цена за сутки] < 24000
WITH CHECK OPTION
GO
/****** Object:  View [dbo].[View_4]    Script Date: 05.11.2024 14:31:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_4]
AS
SELECT        dbo.TUR.[Код тура], dbo.TUR.Название, dbo.TUR.[Вид транспорта], dbo.TUR.[Вид питания], dbo.TUR.[Цена за сутки], dbo.Путевки.[Дата заезда]
FROM            dbo.TUR INNER JOIN
                         dbo.Путевки ON dbo.TUR.[Код тура] = dbo.Путевки.Тур
WHERE        (dbo.TUR.[Вид транспорта] = N'Вертолет')
GO
/****** Object:  View [dbo].[TUR_2]    Script Date: 05.11.2024 14:31:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[TUR_2] AS
SELECT a.[Код тура], a.Название, a.[Вид транспорта], a.[Вид питания], a.[Цена за сутки],
b.[Дата заезда] AS 'Дата заселения'
FROM TUR a
INNER JOIN [Путевки] b ON b.[Тур] = a.[Код тура]
WHERE [Вид транспорта] = 'Вертолет'
GO
/****** Object:  View [dbo].[TUR_1]    Script Date: 05.11.2024 14:31:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[TUR_1] AS
SELECT [Код тура], Название, [Вид транспорта], [Вид питания], [Цена за сутки]
FROM Тур
WHERE [Цена за сутки] < 24000
WITH CHECK OPTION
GO
/****** Object:  View [dbo].[View_1]    Script Date: 05.11.2024 14:31:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_1]
AS
SELECT        dbo.Вид_жилья.Название AS [Название жилья], COUNT(*) AS [Кол-во пансионатов]
FROM            dbo.Вид_жилья INNER JOIN
                         dbo.Пансионаты ON dbo.Вид_жилья.[Код жилья] = dbo.Пансионаты.[Вид жилья]
GROUP BY dbo.Вид_жилья.Название
GO
/****** Object:  View [dbo].[View_2]    Script Date: 05.11.2024 14:31:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_2]
AS
SELECT        TOP (100) PERCENT dbo.Путевки.Клиент, dbo.Путевки.[Кол-во человек], dbo.Путевки.Пансионат, dbo.Путевки.[Дата заезда], dbo.Путевки.[Дата отьезда], dbo.Путевки.Сумма
FROM            dbo.Путевки INNER JOIN
                         dbo.Тур ON dbo.Путевки.Тур = dbo.Тур.[Код тура]
WHERE        (dbo.Путевки.[Дата заезда] BETWEEN CONVERT(DATETIME, '2024-08-09 00:00:00', 102) AND CONVERT(DATETIME, '2024-08-20 00:00:00', 102))
GO
/****** Object:  View [dbo].[View_3]    Script Date: 05.11.2024 14:31:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_3] AS
SELECT [Код тура], Название, [Вид транспорта], [Вид жилья], [Вид питания], [Цена за сутки]
FROM Тур
WHERE [Цена за сутки] > 15000
GO
/****** Object:  View [dbo].[Путевки_больше_2_человек_в_май_и_июнь]    Script Date: 05.11.2024 14:31:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Путевки_больше_2_человек_в_май_и_июнь] AS
SELECT *
FROM Путевки
WHERE [Кол-во человек] > 2
	AND [Дата заезда] >= '2024-05-01'
	AND [Дата отьезда] <= '2024-07-01';
GO
/****** Object:  View [dbo].[Разница_между_датами_путевок]    Script Date: 05.11.2024 14:31:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Разница_между_датами_путевок] AS
SELECT
	Пансионаты.Название AS [Пансионат],
	Клиенты.Фамилия AS [Фамилия],
	Клиенты.Имя AS [Имя],
	DATEDIFF(day, Путевки.[Дата заезда], Путевки.[Дата отьезда]) AS [Кол-во дней]
FROM
	Путевки
JOIN
	Клиенты ON Путевки.Клиент = Клиенты.[Код клиента]
JOIN
	Пансионаты ON Путевки.Пансионат = Пансионаты.[Код пансионата];
GO
SET IDENTITY_INSERT [dbo].[Вид_жилья] ON 

INSERT [dbo].[Вид_жилья] ([Код жилья], [Название], [Категория], [Описание]) VALUES (1, N'Дом', N'Люкс', N'Просторный дом с бассейном, идеальный выбор для семейного отдыха.')
INSERT [dbo].[Вид_жилья] ([Код жилья], [Название], [Категория], [Описание]) VALUES (2, N'Бунгало', N'Полулюкс', N'Отличное бунгало с красивым видом на океан.')
INSERT [dbo].[Вид_жилья] ([Код жилья], [Название], [Категория], [Описание]) VALUES (3, N'Квартира', N'Стандарт', N'Современная квартира в центре города.')
INSERT [dbo].[Вид_жилья] ([Код жилья], [Название], [Категория], [Описание]) VALUES (4, N'Замок', N'Элитный', N'Исторический замок, великолепное место для роскошного отдыха.')
INSERT [dbo].[Вид_жилья] ([Код жилья], [Название], [Категория], [Описание]) VALUES (5, N'Коттедж', N'Премиум', N'Уютный коттедж с собственным садом и барбекю.')
INSERT [dbo].[Вид_жилья] ([Код жилья], [Название], [Категория], [Описание]) VALUES (6, N'Лофт', N'Уникальный', N'Стильный лофт с панорамными окнами и современным дизайном.')
INSERT [dbo].[Вид_жилья] ([Код жилья], [Название], [Категория], [Описание]) VALUES (7, N'Вилла', N'Эксклюзив', N'Роскошная вилла с собственным пляжем и спа-центром.')
INSERT [dbo].[Вид_жилья] ([Код жилья], [Название], [Категория], [Описание]) VALUES (8, N'Таунхаус', N'Комфорт', N'Удобный таунхаус с террасой и оборудованной кухней.')
INSERT [dbo].[Вид_жилья] ([Код жилья], [Название], [Категория], [Описание]) VALUES (9, N'Дуплекс', N'Современный', N'Стильный дуплекс с видом на городской парк.')
INSERT [dbo].[Вид_жилья] ([Код жилья], [Название], [Категория], [Описание]) VALUES (10, N'Хостел', N'Эконом', N'Просторный хостел с общими комнатами и кухней для самостоятельного приготовления пищи.')
INSERT [dbo].[Вид_жилья] ([Код жилья], [Название], [Категория], [Описание]) VALUES (11, N'Дача', N'Семейный', N'Традиционная дача с баней и беседкой для отдыха на природе.')
INSERT [dbo].[Вид_жилья] ([Код жилья], [Название], [Категория], [Описание]) VALUES (13, N'Дача', N'Люкс', N'Просторная люксовая дача')
SET IDENTITY_INSERT [dbo].[Вид_жилья] OFF
GO
SET IDENTITY_INSERT [dbo].[Клиенты] ON 

INSERT [dbo].[Клиенты] ([Код клиента], [Фамилия], [Имя], [Отчество], [Серия паспорта], [Номер паспорта], [Выдан паспорт], [Дата рождения], [Адрес], [Город], [Телефон]) VALUES (1, N'Токарев', N'Кирилл', N'Олегович', N'1234', N'567890', N'Отделением УФМС по Г. Уфа', CAST(N'2005-01-27' AS Date), N'ул.Пушкина, д. 10', N'Уфа', N'1234567890')
INSERT [dbo].[Клиенты] ([Код клиента], [Фамилия], [Имя], [Отчество], [Серия паспорта], [Номер паспорта], [Выдан паспорт], [Дата рождения], [Адрес], [Город], [Телефон]) VALUES (3, N'Кузнецов', N'Дмитрий', N'Петрович', N'3456', N'789012', N'Отделением УФМС России по г. Екатеринбургу', CAST(N'1986-02-13' AS Date), N'ул. Кирова, д. 30', N'Екатеринбург', N'3456789012')
INSERT [dbo].[Клиенты] ([Код клиента], [Фамилия], [Имя], [Отчество], [Серия паспорта], [Номер паспорта], [Выдан паспорт], [Дата рождения], [Адрес], [Город], [Телефон]) VALUES (4, N'Иванов', N'Алексей', N'Владимирович', N'4567', N'890123', N'Отделением УФМС России по г. Москве', CAST(N'1990-09-15' AS Date), N'ул. Красная, д. 40', N'Москва', N'4567890123')
INSERT [dbo].[Клиенты] ([Код клиента], [Фамилия], [Имя], [Отчество], [Серия паспорта], [Номер паспорта], [Выдан паспорт], [Дата рождения], [Адрес], [Город], [Телефон]) VALUES (5, N'Петров', N'Евгений', N'Игоревич', N'5678', N'901234', N'Отделением УФМС России по г. Новосибирску', CAST(N'1982-05-03' AS Date), N'пр. Советский, д. 50', N'Новосибирск', N'5678901234')
INSERT [dbo].[Клиенты] ([Код клиента], [Фамилия], [Имя], [Отчество], [Серия паспорта], [Номер паспорта], [Выдан паспорт], [Дата рождения], [Адрес], [Город], [Телефон]) VALUES (6, N'Сидоров', N'Никита', N'Андреевич', N'6789', N'012345', N'Отделением УФМС России по г. Казани', CAST(N'1976-11-28' AS Date), N'ул. Гагарина, д. 60', N'Казань', N'6789012345')
INSERT [dbo].[Клиенты] ([Код клиента], [Фамилия], [Имя], [Отчество], [Серия паспорта], [Номер паспорта], [Выдан паспорт], [Дата рождения], [Адрес], [Город], [Телефон]) VALUES (7, N'Морозова', N'Ольга', N'Сергеевна', N'7890', N'123456', N'Отделением УФМС России по г. Воронежу', CAST(N'1988-03-19' AS Date), N'пр. Мира, д. 70', N'Воронеж', N'7890123456')
INSERT [dbo].[Клиенты] ([Код клиента], [Фамилия], [Имя], [Отчество], [Серия паспорта], [Номер паспорта], [Выдан паспорт], [Дата рождения], [Адрес], [Город], [Телефон]) VALUES (8, N'Козлов', N'Игорь', N'Викторович', N'8901', N'234567', N'Отделением УФМС России по г. Ростову-на-Дону', CAST(N'1993-08-07' AS Date), N'ул. Ленинградская, д. 80', N'Ростов-на-Дону', N'8901234567')
INSERT [dbo].[Клиенты] ([Код клиента], [Фамилия], [Имя], [Отчество], [Серия паспорта], [Номер паспорта], [Выдан паспорт], [Дата рождения], [Адрес], [Город], [Телефон]) VALUES (9, N'Васильева', N'Екатерина', N'Анатольевна', N'9012', N'345678', N'Отделением УФМС России по г. Самаре', CAST(N'1979-12-25' AS Date), N'пр. Октября, д. 90', N'Самара', N'9012345678')
INSERT [dbo].[Клиенты] ([Код клиента], [Фамилия], [Имя], [Отчество], [Серия паспорта], [Номер паспорта], [Выдан паспорт], [Дата рождения], [Адрес], [Город], [Телефон]) VALUES (10, N'Новиков', N'Павел', N'Денисович', N'0123', N'456789', N'Отделением УФМС России по г. Красноярску', CAST(N'1985-04-10' AS Date), N'ул. Лесная, д. 100', N'Красноярск', N'0123456789')
SET IDENTITY_INSERT [dbo].[Клиенты] OFF
GO
SET IDENTITY_INSERT [dbo].[Клиенты_Копия] ON 

INSERT [dbo].[Клиенты_Копия] ([Код клиента], [Фамилия], [Имя], [Отчество], [Серия паспорта], [Номер паспорта], [Выдан паспорт], [Дата рождения], [Адрес], [Город], [Телефон], [Возраст]) VALUES (1, N'Токарев', N'Кирилл', N'Олегович', N'1234', N'567890', N'Отделением УФМС по Г. Уфа', CAST(N'2005-01-27' AS Date), N'ул.Пушкина, д. 10', N'Уфа', N'1234567890', NULL)
INSERT [dbo].[Клиенты_Копия] ([Код клиента], [Фамилия], [Имя], [Отчество], [Серия паспорта], [Номер паспорта], [Выдан паспорт], [Дата рождения], [Адрес], [Город], [Телефон], [Возраст]) VALUES (2, N'Смирнова', N'Мария', N'Александровна', N'2345', N'678901', N'Отделением УФМС России по г. Санкт-Петербургу', CAST(N'1995-07-21' AS Date), N'пр. Ленина, д. 20', N'Санкт-Петербург', N'2345678901', NULL)
INSERT [dbo].[Клиенты_Копия] ([Код клиента], [Фамилия], [Имя], [Отчество], [Серия паспорта], [Номер паспорта], [Выдан паспорт], [Дата рождения], [Адрес], [Город], [Телефон], [Возраст]) VALUES (3, N'Кузнецов', N'Максим', N'Петрович', N'2222', N'789012', N'Отделением УФМС России по г. Екатеринбургу', CAST(N'1986-02-13' AS Date), N'ул. Кирова, д. 30', N'Екатеринбург', N'3456789012', NULL)
INSERT [dbo].[Клиенты_Копия] ([Код клиента], [Фамилия], [Имя], [Отчество], [Серия паспорта], [Номер паспорта], [Выдан паспорт], [Дата рождения], [Адрес], [Город], [Телефон], [Возраст]) VALUES (4, N'Иванов', N'Алексей', N'Владимирович', N'4567', N'890123', N'Отделением УФМС России по г. Москве', CAST(N'2006-01-01' AS Date), N'ул. Красная, д. 40', N'Москва', N'4567890123', 18)
INSERT [dbo].[Клиенты_Копия] ([Код клиента], [Фамилия], [Имя], [Отчество], [Серия паспорта], [Номер паспорта], [Выдан паспорт], [Дата рождения], [Адрес], [Город], [Телефон], [Возраст]) VALUES (5, N'Петров', N'Евгений', N'Игоревич', N'5678', N'901234', N'Отделением УФМС России по г. Новосибирску', CAST(N'1982-05-03' AS Date), N'пр. Советский, д. 50', N'Новосибирск', N'5678901234', NULL)
INSERT [dbo].[Клиенты_Копия] ([Код клиента], [Фамилия], [Имя], [Отчество], [Серия паспорта], [Номер паспорта], [Выдан паспорт], [Дата рождения], [Адрес], [Город], [Телефон], [Возраст]) VALUES (6, N'Сидоров', N'Никита', N'Андреевич', N'6789', N'012345', N'Отделением УФМС России по г. Казани', CAST(N'1976-11-28' AS Date), N'ул. Гагарина, д. 60', N'Казань', N'6789012345', NULL)
INSERT [dbo].[Клиенты_Копия] ([Код клиента], [Фамилия], [Имя], [Отчество], [Серия паспорта], [Номер паспорта], [Выдан паспорт], [Дата рождения], [Адрес], [Город], [Телефон], [Возраст]) VALUES (7, N'Морозова', N'Ольга', N'Сергеевна', N'7890', N'123456', N'Отделением УФМС России по г. Воронежу', CAST(N'1988-03-19' AS Date), N'пр. Мира, д. 70', N'Воронеж', N'7890123456', NULL)
INSERT [dbo].[Клиенты_Копия] ([Код клиента], [Фамилия], [Имя], [Отчество], [Серия паспорта], [Номер паспорта], [Выдан паспорт], [Дата рождения], [Адрес], [Город], [Телефон], [Возраст]) VALUES (8, N'Козлов', N'Игорь', N'Викторович', N'8901', N'234567', N'Отделением УФМС России по г. Ростову-на-Дону', CAST(N'1993-08-07' AS Date), N'ул. Ленинградская, д. 80', N'Ростов-на-Дону', N'8901234567', NULL)
INSERT [dbo].[Клиенты_Копия] ([Код клиента], [Фамилия], [Имя], [Отчество], [Серия паспорта], [Номер паспорта], [Выдан паспорт], [Дата рождения], [Адрес], [Город], [Телефон], [Возраст]) VALUES (9, N'Васильева', N'Екатерина', N'Анатольевна', N'9012', N'345678', N'Отделением УФМС России по г. Самаре', CAST(N'1979-12-25' AS Date), N'пр. Октября, д. 90', N'Самара', N'9012345678', NULL)
INSERT [dbo].[Клиенты_Копия] ([Код клиента], [Фамилия], [Имя], [Отчество], [Серия паспорта], [Номер паспорта], [Выдан паспорт], [Дата рождения], [Адрес], [Город], [Телефон], [Возраст]) VALUES (10, N'Новиков', N'Павел', N'Денисович', N'0123', N'456789', N'Отделением УФМС России по г. Красноярску', CAST(N'1985-04-10' AS Date), N'ул. Лесная, д. 100', N'Красноярск', N'0123456789', NULL)
INSERT [dbo].[Клиенты_Копия] ([Код клиента], [Фамилия], [Имя], [Отчество], [Серия паспорта], [Номер паспорта], [Выдан паспорт], [Дата рождения], [Адрес], [Город], [Телефон], [Возраст]) VALUES (11, N'Иванов', N'Иван', N'Олегович', N'1234', N'567890', N'Отделением УФМС по Г. Уфа', CAST(N'2005-01-27' AS Date), N'ул.Пушкина, д. 10', N'Уфа', N'1234567890', 19)
SET IDENTITY_INSERT [dbo].[Клиенты_Копия] OFF
GO
SET IDENTITY_INSERT [dbo].[Пансионаты] ON 

INSERT [dbo].[Пансионаты] ([Код пансионата], [Название], [Описание], [Страна], [Город], [Адрес], [Телефон], [Кол-во номеров], [Бассейн], [Мед услуги], [Спа салон], [До моря], [Вид жилья]) VALUES (1, N'Уютный отдых', N'Прекрасный пансионат с красивым видом на горы и чистым воздухом.', N'Россия', N'Сочи', N'ул. Ленина, д. 10', N'123-456-7890', 50, N'Да', N'Нет', N'Нет', N'500', 1)
INSERT [dbo].[Пансионаты] ([Код пансионата], [Название], [Описание], [Страна], [Город], [Адрес], [Телефон], [Кол-во номеров], [Бассейн], [Мед услуги], [Спа салон], [До моря], [Вид жилья]) VALUES (2, N'Морской бриз', N'Отель на берегу моря с собственным пляжем и панорамным видом.', N'Испания', N'Барселона', N'пр.Гагарина, д. 20', N'234-567-8901', 100, N'Да', N'Да', N'Да', N'200', 2)
INSERT [dbo].[Пансионаты] ([Код пансионата], [Название], [Описание], [Страна], [Город], [Адрес], [Телефон], [Кол-во номеров], [Бассейн], [Мед услуги], [Спа салон], [До моря], [Вид жилья]) VALUES (3, N'Горные вершины', N'Уединенный пансионат в горах с возможностью активного отдыха.', N'Франция', N'Шамони', N'ул. Пушкина, д. 30', N'345-678-9012', 30, N'Нет', N'Да', N'Нет', NULL, 4)
INSERT [dbo].[Пансионаты] ([Код пансионата], [Название], [Описание], [Страна], [Город], [Адрес], [Телефон], [Кол-во номеров], [Бассейн], [Мед услуги], [Спа салон], [До моря], [Вид жилья]) VALUES (4, N'Тихая гавань', N'Уединенный пансионат на берегу озера, идеальное место для релакса.', N'Канада', N'Банфф', N'ул.Озерная, д.5', N'456-789-0123', 20, N'Да', N'Нет', N'Нет', N'100', 5)
INSERT [dbo].[Пансионаты] ([Код пансионата], [Название], [Описание], [Страна], [Город], [Адрес], [Телефон], [Кол-во номеров], [Бассейн], [Мед услуги], [Спа салон], [До моря], [Вид жилья]) VALUES (5, N'Горный уют', N'Атмосферный пансионат в скалистых горах с видом на долину.', N'Швейцария', N'Церматт', N'ул.Горная, д.25', N'789-012-3456', 25, N'Нет', N'Да', N'Да', N'300', 6)
INSERT [dbo].[Пансионаты] ([Код пансионата], [Название], [Описание], [Страна], [Город], [Адрес], [Телефон], [Кол-во номеров], [Бассейн], [Мед услуги], [Спа салон], [До моря], [Вид жилья]) VALUES (6, N'Эксклюзивный ретрит', N'Пансионат высшего класса в эксклюзивной вилле с приватным пляжем.', N'Греция', N'Санторини', N'ул.Морская, д.10', N'890-123-4567', 10, N'Да', N'Да', N'Да', N'20', 7)
INSERT [dbo].[Пансионаты] ([Код пансионата], [Название], [Описание], [Страна], [Город], [Адрес], [Телефон], [Кол-во номеров], [Бассейн], [Мед услуги], [Спа салон], [До моря], [Вид жилья]) VALUES (7, N'Уютный уголок', N'Пансионат с деревенским шармом, идеальное место для спокойного отдыха.', N'Новая Зеландия', N'Квинстаун', N'ул.Овечья, д.8', N'901-234-5678', 18, N'Нет', N'Нет', N'Нет', NULL, 11)
INSERT [dbo].[Пансионаты] ([Код пансионата], [Название], [Описание], [Страна], [Город], [Адрес], [Телефон], [Кол-во номеров], [Бассейн], [Мед услуги], [Спа салон], [До моря], [Вид жилья]) VALUES (8, N'Романтическая дача', N'Уютный пансионат в традиционной даче с возможностью романтического уикенда.', N'Россия', N'Псков', N'ул.Лесная, д.12', N'012-345-6789', 12, N'Нет', N'Нет', N'Нет', N'200', 10)
INSERT [dbo].[Пансионаты] ([Код пансионата], [Название], [Описание], [Страна], [Город], [Адрес], [Телефон], [Кол-во номеров], [Бассейн], [Мед услуги], [Спа салон], [До моря], [Вид жилья]) VALUES (9, N'Уютный отдых ', N'Прекрасный пансионат похожий на дачу', N'Россия', N'Барнаул', N'ул. Ленина, д. 10', N'123-456-7890', 80, N'Да', N'Нет', N'Нет', N'300', 13)
SET IDENTITY_INSERT [dbo].[Пансионаты] OFF
GO
SET IDENTITY_INSERT [dbo].[Путевки] ON 

INSERT [dbo].[Путевки] ([Код_путевки], [Клиент], [Тур], [Пансионат], [Дата заезда], [Дата отьезда], [Дети], [Мед страховка], [Кол-во человек], [Сумма]) VALUES (1, 2, 8, 5, CAST(N'2024-03-10' AS Date), CAST(N'2024-03-24' AS Date), N'1', N'Да', 2, CAST(580000.00 AS Decimal(18, 2)))
INSERT [dbo].[Путевки] ([Код_путевки], [Клиент], [Тур], [Пансионат], [Дата заезда], [Дата отьезда], [Дети], [Мед страховка], [Кол-во человек], [Сумма]) VALUES (2, 3, 7, 2, CAST(N'2024-05-12' AS Date), CAST(N'2024-05-20' AS Date), NULL, N'Нет', 1, CAST(760000.00 AS Decimal(18, 2)))
INSERT [dbo].[Путевки] ([Код_путевки], [Клиент], [Тур], [Пансионат], [Дата заезда], [Дата отьезда], [Дети], [Мед страховка], [Кол-во человек], [Сумма]) VALUES (3, 4, 3, 7, CAST(N'2024-06-13' AS Date), CAST(N'2024-06-27' AS Date), N'2', N'Да', 4, CAST(340000.00 AS Decimal(18, 2)))
INSERT [dbo].[Путевки] ([Код_путевки], [Клиент], [Тур], [Пансионат], [Дата заезда], [Дата отьезда], [Дети], [Мед страховка], [Кол-во человек], [Сумма]) VALUES (4, 1, 6, 4, CAST(N'2024-04-16' AS Date), CAST(N'2024-04-23' AS Date), N'1', N'Да', 2, CAST(510000.00 AS Decimal(18, 2)))
INSERT [dbo].[Путевки] ([Код_путевки], [Клиент], [Тур], [Пансионат], [Дата заезда], [Дата отьезда], [Дети], [Мед страховка], [Кол-во человек], [Сумма]) VALUES (5, 5, 2, 1, CAST(N'2024-07-05' AS Date), CAST(N'2024-07-15' AS Date), N'1', N'Да', 2, CAST(441000.00 AS Decimal(18, 2)))
INSERT [dbo].[Путевки] ([Код_путевки], [Клиент], [Тур], [Пансионат], [Дата заезда], [Дата отьезда], [Дети], [Мед страховка], [Кол-во человек], [Сумма]) VALUES (6, 6, 5, 3, CAST(N'2024-08-09' AS Date), CAST(N'2024-08-18' AS Date), NULL, N'Нет', 2, CAST(234000.00 AS Decimal(18, 2)))
INSERT [dbo].[Путевки] ([Код_путевки], [Клиент], [Тур], [Пансионат], [Дата заезда], [Дата отьезда], [Дети], [Мед страховка], [Кол-во человек], [Сумма]) VALUES (7, 7, 1, 6, CAST(N'2024-09-20' AS Date), CAST(N'2024-09-30' AS Date), NULL, N'Да', 1, CAST(178000.00 AS Decimal(18, 2)))
INSERT [dbo].[Путевки] ([Код_путевки], [Клиент], [Тур], [Пансионат], [Дата заезда], [Дата отьезда], [Дети], [Мед страховка], [Кол-во человек], [Сумма]) VALUES (8, 8, 4, 5, CAST(N'2024-10-14' AS Date), CAST(N'2024-10-21' AS Date), N'2', N'Да', 3, CAST(670000.00 AS Decimal(18, 2)))
INSERT [dbo].[Путевки] ([Код_путевки], [Клиент], [Тур], [Пансионат], [Дата заезда], [Дата отьезда], [Дети], [Мед страховка], [Кол-во человек], [Сумма]) VALUES (9, 9, 8, 8, CAST(N'2024-11-05' AS Date), CAST(N'2024-11-15' AS Date), N'1', N'Нет', 2, CAST(378000.00 AS Decimal(18, 2)))
INSERT [dbo].[Путевки] ([Код_путевки], [Клиент], [Тур], [Пансионат], [Дата заезда], [Дата отьезда], [Дети], [Мед страховка], [Кол-во человек], [Сумма]) VALUES (10, 1, 3, 2, CAST(N'2024-02-05' AS Date), CAST(N'2024-02-15' AS Date), N'3', N'Нет', 5, CAST(1205000.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[Путевки] OFF
GO
SET IDENTITY_INSERT [dbo].[Тур] ON 

INSERT [dbo].[Тур] ([Код тура], [Название], [Вид транспорта], [Вид жилья], [Вид питания], [Цена за сутки]) VALUES (1, N'Путешествие в Европу', N'Автобус', 1, N'Одноразовое', CAST(22890.00 AS Decimal(18, 2)))
INSERT [dbo].[Тур] ([Код тура], [Название], [Вид транспорта], [Вид жилья], [Вид питания], [Цена за сутки]) VALUES (2, N'Отдых на море', N'Самолет', 2, N'Двухразовое', CAST(20895.00 AS Decimal(18, 2)))
INSERT [dbo].[Тур] ([Код тура], [Название], [Вид транспорта], [Вид жилья], [Вид питания], [Цена за сутки]) VALUES (3, N'Эскурсия по историческим местам', N'Поезд', 4, N'Трехразовое', CAST(24045.00 AS Decimal(18, 2)))
INSERT [dbo].[Тур] ([Код тура], [Название], [Вид транспорта], [Вид жилья], [Вид питания], [Цена за сутки]) VALUES (4, N'Семейный курортный отдых', N'Автомобиль', 3, N'Завтраки', CAST(13650.00 AS Decimal(18, 2)))
INSERT [dbo].[Тур] ([Код тура], [Название], [Вид транспорта], [Вид жилья], [Вид питания], [Цена за сутки]) VALUES (5, N'Отдых в эксклюзивной вилле', N'Яхта', 7, N'Полный пансион', CAST(26250.00 AS Decimal(18, 2)))
INSERT [dbo].[Тур] ([Код тура], [Название], [Вид транспорта], [Вид жилья], [Вид питания], [Цена за сутки]) VALUES (6, N'Романтический уикенд в лофте', N'Вертолет', 6, N'Ужины при свечах', CAST(21000.00 AS Decimal(18, 2)))
INSERT [dbo].[Тур] ([Код тура], [Название], [Вид транспорта], [Вид жилья], [Вид питания], [Цена за сутки]) VALUES (7, N'Горнолыжный курорт', N'Вертолет', 8, N'Полупансион', CAST(18900.00 AS Decimal(18, 2)))
INSERT [dbo].[Тур] ([Код тура], [Название], [Вид транспорта], [Вид жилья], [Вид питания], [Цена за сутки]) VALUES (8, N'Спокойный отдых в коттедже', N'Автомобиль', 5, N'Завтраки и ужины', CAST(16800.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[Тур] OFF
GO
ALTER TABLE [dbo].[Пансионаты]  WITH CHECK ADD  CONSTRAINT [FK__Пансионат__Вид ж__59063A47] FOREIGN KEY([Вид жилья])
REFERENCES [dbo].[Вид_жилья] ([Код жилья])
GO
ALTER TABLE [dbo].[Пансионаты] CHECK CONSTRAINT [FK__Пансионат__Вид ж__59063A47]
GO
ALTER TABLE [dbo].[Путевки]  WITH CHECK ADD  CONSTRAINT [FK__Путевки__Пансион__628FA481] FOREIGN KEY([Пансионат])
REFERENCES [dbo].[Пансионаты] ([Код пансионата])
GO
ALTER TABLE [dbo].[Путевки] CHECK CONSTRAINT [FK__Путевки__Пансион__628FA481]
GO
ALTER TABLE [dbo].[Путевки]  WITH CHECK ADD  CONSTRAINT [FK__Путевки__Тур__619B8048] FOREIGN KEY([Тур])
REFERENCES [dbo].[Тур] ([Код тура])
GO
ALTER TABLE [dbo].[Путевки] CHECK CONSTRAINT [FK__Путевки__Тур__619B8048]
GO
ALTER TABLE [dbo].[Тур]  WITH CHECK ADD  CONSTRAINT [FK__Тур__Вид жилья__5BE2A6F2] FOREIGN KEY([Вид жилья])
REFERENCES [dbo].[Вид_жилья] ([Код жилья])
GO
ALTER TABLE [dbo].[Тур] CHECK CONSTRAINT [FK__Тур__Вид жилья__5BE2A6F2]
GO
ALTER TABLE [dbo].[Пансионаты]  WITH CHECK ADD  CONSTRAINT [CK__Пансионат__Бассе__5629CD9C] CHECK  (([Бассейн]='нет' OR [Бассейн]='да'))
GO
ALTER TABLE [dbo].[Пансионаты] CHECK CONSTRAINT [CK__Пансионат__Бассе__5629CD9C]
GO
ALTER TABLE [dbo].[Пансионаты]  WITH CHECK ADD  CONSTRAINT [CK__Пансионат__Мед у__571DF1D5] CHECK  (([Мед услуги]='нет' OR [Мед услуги]='да'))
GO
ALTER TABLE [dbo].[Пансионаты] CHECK CONSTRAINT [CK__Пансионат__Мед у__571DF1D5]
GO
ALTER TABLE [dbo].[Пансионаты]  WITH CHECK ADD  CONSTRAINT [CK__Пансионат__Спа с__5812160E] CHECK  (([Спа салон]='нет' OR [Спа салон]='да'))
GO
ALTER TABLE [dbo].[Пансионаты] CHECK CONSTRAINT [CK__Пансионат__Спа с__5812160E]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[20] 2[15] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Вид_жилья"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Пансионаты"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 426
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 19
         Width = 284
         Width = 2475
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 1740
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1890
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Путевки"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 214
            End
            DisplayFlags = 280
            TopColumn = 6
         End
         Begin Table = "Тур"
            Begin Extent = 
               Top = 6
               Left = 252
               Bottom = 136
               Right = 427
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 3060
         SortOrder = 1410
         GroupBy = 1350
         Filter = 4770
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Тур"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 213
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 75
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_3'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_3'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "TUR"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 165
               Right = 227
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Путевки"
            Begin Extent = 
               Top = 30
               Left = 295
               Bottom = 205
               Right = 490
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 75
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_4'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_4'
GO
