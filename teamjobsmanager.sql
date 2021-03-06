USE [jobManager]
GO
/****** Object:  Table [dbo].[areas]    Script Date: 8/18/2021 4:57:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[areas](
	[id] [int] NOT NULL,
	[name] [nvarchar](75) NOT NULL,
	[description] [nvarchar](120) NOT NULL,
 CONSTRAINT [PK_AREAS] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[clients]    Script Date: 8/18/2021 4:57:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[clients](
	[id] [int] NOT NULL,
	[name] [nvarchar](75) NOT NULL,
	[lastname] [nvarchar](75) NOT NULL,
	[email] [varchar](75) NOT NULL,
 CONSTRAINT [PK_CLIENTS] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[employee_job]    Script Date: 8/18/2021 4:57:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[employee_job](
	[id] [int] NOT NULL,
	[employee_id] [int] NOT NULL,
	[job_id] [int] NOT NULL,
 CONSTRAINT [PK_EMPLOYEE_JOB] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[employees]    Script Date: 8/18/2021 4:57:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[employees](
	[id] [int] NOT NULL,
	[name] [nvarchar](75) NOT NULL,
	[lastname] [nvarchar](75) NOT NULL,
	[email] [nvarchar](75) NOT NULL,
	[area_id] [int] NOT NULL,
 CONSTRAINT [PK_EMPLOYEES] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[jobs]    Script Date: 8/18/2021 4:57:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[jobs](
	[id] [int] NOT NULL,
	[title] [nvarchar](75) NOT NULL,
	[description] [nvarchar](150) NOT NULL,
	[starts_at] [datetime] NOT NULL,
	[ends_at] [datetime] NOT NULL,
	[status] [int] NOT NULL,
	[client_id] [int] NOT NULL,
	[manager_id] [int] NOT NULL,
 CONSTRAINT [PK_JOBS] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[managers]    Script Date: 8/18/2021 4:57:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[managers](
	[id] [int] NOT NULL,
	[name] [nvarchar](75) NOT NULL,
	[lastname] [nvarchar](75) NOT NULL,
	[email] [nvarchar](75) NOT NULL,
 CONSTRAINT [PK_MANAGERS] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__clients__AB6E616493BE0AE0]    Script Date: 8/18/2021 4:57:39 PM ******/
ALTER TABLE [dbo].[clients] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__employee__AB6E616487161CEA]    Script Date: 8/18/2021 4:57:39 PM ******/
ALTER TABLE [dbo].[employees] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__managers__AB6E6164B960CB13]    Script Date: 8/18/2021 4:57:39 PM ******/
ALTER TABLE [dbo].[managers] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[jobs] ADD  CONSTRAINT [DF__jobs__status__29572725]  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[employee_job]  WITH CHECK ADD  CONSTRAINT [employee_job_fk0] FOREIGN KEY([employee_id])
REFERENCES [dbo].[employees] ([id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[employee_job] CHECK CONSTRAINT [employee_job_fk0]
GO
ALTER TABLE [dbo].[employee_job]  WITH CHECK ADD  CONSTRAINT [employee_job_fk1] FOREIGN KEY([job_id])
REFERENCES [dbo].[jobs] ([id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[employee_job] CHECK CONSTRAINT [employee_job_fk1]
GO
ALTER TABLE [dbo].[employees]  WITH CHECK ADD  CONSTRAINT [employees_fk0] FOREIGN KEY([area_id])
REFERENCES [dbo].[areas] ([id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[employees] CHECK CONSTRAINT [employees_fk0]
GO
ALTER TABLE [dbo].[jobs]  WITH CHECK ADD  CONSTRAINT [jobs_fk0] FOREIGN KEY([client_id])
REFERENCES [dbo].[clients] ([id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[jobs] CHECK CONSTRAINT [jobs_fk0]
GO
ALTER TABLE [dbo].[jobs]  WITH CHECK ADD  CONSTRAINT [jobs_fk1] FOREIGN KEY([manager_id])
REFERENCES [dbo].[managers] ([id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[jobs] CHECK CONSTRAINT [jobs_fk1]
GO
/****** Object:  StoredProcedure [dbo].[getJobs]    Script Date: 8/18/2021 4:57:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROC [dbo].[getJobs]
as 
Begin
Select ej.id as #, j.title as Trabajo, CONCAT(e.name, ' ', e.lastname)  as Responsable, CONCAT(c.name, ' ', c.lastname) as Cliente,
CONVERT(VARCHAR(10),j.starts_at,103) as Desde, 
CONVERT(VARCHAR(10),j.ends_at,103) as Hasta, a.name as Área,CONCAT(m.name, ' ', m.lastname) as Gerente
from employee_job ej inner join jobs j on ej.job_id= j.id inner join employees e on e.id=ej.employee_id
inner join areas a on a.id = e.area_id inner join managers m on m.id=j.manager_id inner join clients c
on c.id=j.id
End
GO
/****** Object:  Trigger [dbo].[addJob2]    Script Date: 8/18/2021 4:57:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Trigger [dbo].[addJob2] on [dbo].[jobs] after insert
as
Begin
DECLARE @addDay integer= RAND()*(5-1)+1;
DECLARE @addDay2 integer= RAND()*(9-5)+5
DECLARE @Date datetime =  SYSDATETIME()
DECLARE @start datetime=DATEADD(DAY, @addDay, @Date);
DECLARE @end datetime=DATEADD(DAY, @addDay2, @Date);

 update jobs set starts_at=@start, ends_at=@end where id = (Select id from inserted) 
 End
GO
ALTER TABLE [dbo].[jobs] ENABLE TRIGGER [addJob2]
GO
GO
INSERT [dbo].[areas] ([id], [name], [description]) VALUES (1, N'Diseño', N'Diseño gráfico y publicitario')
INSERT [dbo].[areas] ([id], [name], [description]) VALUES (2, N'Copywriting', N'Redacción y edición de textos')
INSERT [dbo].[areas] ([id], [name], [description]) VALUES (3, N'Programación', N'Creación de programas y aplicaciones')
INSERT [dbo].[areas] ([id], [name], [description]) VALUES (4, N'Desarrollo', N'Desarrollo de páginas web')
INSERT [dbo].[areas] ([id], [name], [description]) VALUES (5, N'Maquetación', N'Diseño y planeación de páginas')
INSERT [dbo].[areas] ([id], [name], [description]) VALUES (6, N'Marketing', N'Publicidad y gestión de marca')
INSERT [dbo].[areas] ([id], [name], [description]) VALUES (7, N'Community Manager', N'Gestión y manejo de redes sociales')
INSERT [dbo].[areas] ([id], [name], [description]) VALUES (8, N'Traducción', N'Traducción de textos legales y otros')
INSERT [dbo].[areas] ([id], [name], [description]) VALUES (9, N'Video y fotos', N'Edición de videos y fotos')
INSERT [dbo].[areas] ([id], [name], [description]) VALUES (10, N'Música y Audio', N'Composición y edición de sonido')
GO
INSERT [dbo].[clients] ([id], [name], [lastname], [email]) VALUES (1, N'Carlos', N'Santana', N'santana@gmail.com')
INSERT [dbo].[clients] ([id], [name], [lastname], [email]) VALUES (2, N'Moises', N'Tavarez', N'tavarez@gmail.com')
INSERT [dbo].[clients] ([id], [name], [lastname], [email]) VALUES (3, N'Clodomiro', N'Nuñez', N'nunez@gmail.com')
INSERT [dbo].[clients] ([id], [name], [lastname], [email]) VALUES (4, N'Santa', N'Trinidad', N'trinidad@gmail.com')
INSERT [dbo].[clients] ([id], [name], [lastname], [email]) VALUES (5, N'Lucía', N'Arnaud', N'arnaud@gmail.com')
INSERT [dbo].[clients] ([id], [name], [lastname], [email]) VALUES (6, N'Cristina', N'Martínez', N'martinez@gmail.com')
INSERT [dbo].[clients] ([id], [name], [lastname], [email]) VALUES (7, N'Joaquín', N'Sabina', N'sabina@gmail.com')
INSERT [dbo].[clients] ([id], [name], [lastname], [email]) VALUES (8, N'Pedro', N'Páramo', N'paramo@gmail.com')
INSERT [dbo].[clients] ([id], [name], [lastname], [email]) VALUES (9, N'Argentina', N'García', N'garcia@gmail.com')
INSERT [dbo].[clients] ([id], [name], [lastname], [email]) VALUES (10, N'Nicolás', N'Almonte', N'almonte@gmail.com')
GO
INSERT [dbo].[employee_job] ([id], [employee_id], [job_id]) VALUES (1, 8, 1)
INSERT [dbo].[employee_job] ([id], [employee_id], [job_id]) VALUES (2, 3, 2)
INSERT [dbo].[employee_job] ([id], [employee_id], [job_id]) VALUES (3, 2, 3)
INSERT [dbo].[employee_job] ([id], [employee_id], [job_id]) VALUES (4, 3, 4)
INSERT [dbo].[employee_job] ([id], [employee_id], [job_id]) VALUES (5, 4, 4)
INSERT [dbo].[employee_job] ([id], [employee_id], [job_id]) VALUES (6, 6, 4)
INSERT [dbo].[employee_job] ([id], [employee_id], [job_id]) VALUES (7, 5, 5)
INSERT [dbo].[employee_job] ([id], [employee_id], [job_id]) VALUES (8, 5, 6)
INSERT [dbo].[employee_job] ([id], [employee_id], [job_id]) VALUES (9, 9, 6)
INSERT [dbo].[employee_job] ([id], [employee_id], [job_id]) VALUES (10, 7, 7)
INSERT [dbo].[employee_job] ([id], [employee_id], [job_id]) VALUES (11, 10, 8)
INSERT [dbo].[employee_job] ([id], [employee_id], [job_id]) VALUES (12, 6, 9)
INSERT [dbo].[employee_job] ([id], [employee_id], [job_id]) VALUES (13, 3, 9)
INSERT [dbo].[employee_job] ([id], [employee_id], [job_id]) VALUES (14, 1, 10)
INSERT [dbo].[employee_job] ([id], [employee_id], [job_id]) VALUES (15, 3, 10)
INSERT [dbo].[employee_job] ([id], [employee_id], [job_id]) VALUES (16, 6, 10)
GO
INSERT [dbo].[employees] ([id], [name], [lastname], [email], [area_id]) VALUES (1, N'Juan Antonio', N'Casas Marchena', N'marchena@gmail.com', 3)
INSERT [dbo].[employees] ([id], [name], [lastname], [email], [area_id]) VALUES (2, N'Miguel', N'Almonte Castro', N'almonte@gmail.com', 2)
INSERT [dbo].[employees] ([id], [name], [lastname], [email], [area_id]) VALUES (3, N'Luisa', N'Mejía Salas', N'mejia@gmail.com', 1)
INSERT [dbo].[employees] ([id], [name], [lastname], [email], [area_id]) VALUES (4, N'Sofía', N'Vergara Vásquez', N'vergara@gmail.com', 4)
INSERT [dbo].[employees] ([id], [name], [lastname], [email], [area_id]) VALUES (5, N'Aurelina', N'Frías Rosario', N'frias@gmail.com', 7)
INSERT [dbo].[employees] ([id], [name], [lastname], [email], [area_id]) VALUES (6, N'Nurbi', N'Del Orbe Ruiz', N'delorbe@gmail.com', 5)
INSERT [dbo].[employees] ([id], [name], [lastname], [email], [area_id]) VALUES (7, N'Esteban', N'De Los Santos Páez', N'delossantos@gmail.com', 9)
INSERT [dbo].[employees] ([id], [name], [lastname], [email], [area_id]) VALUES (8, N'Moisés', N'Ventura Castro', N'ventura@gmail.com', 8)
INSERT [dbo].[employees] ([id], [name], [lastname], [email], [area_id]) VALUES (9, N'Loisse', N'Pierre Vaudert', N'pierre@gmail.com', 6)
INSERT [dbo].[employees] ([id], [name], [lastname], [email], [area_id]) VALUES (10, N'Nicolás', N'Castillo Aponte', N'castillo@gmail.com', 10)
GO
INSERT [dbo].[jobs] ([id], [title], [description], [starts_at], [ends_at], [status], [client_id], [manager_id]) VALUES (1, N'Traducir Acta', N'Traducción de acta de matrimonio', CAST(N'2021-08-19T09:18:54.473' AS DateTime), CAST(N'2021-08-25T09:18:54.473' AS DateTime), 1, 8, 1)
INSERT [dbo].[jobs] ([id], [title], [description], [starts_at], [ends_at], [status], [client_id], [manager_id]) VALUES (2, N'Diseñar logo', N'Crear logotipo e imagen de marca de startup', CAST(N'2021-08-19T09:19:39.313' AS DateTime), CAST(N'2021-08-23T09:19:39.313' AS DateTime), 1, 3, 4)
INSERT [dbo].[jobs] ([id], [title], [description], [starts_at], [ends_at], [status], [client_id], [manager_id]) VALUES (3, N'Post para blog', N'Redactar un post para un blog, de 500 palabras', CAST(N'2021-08-20T09:21:13.037' AS DateTime), CAST(N'2021-08-26T09:21:13.037' AS DateTime), 1, 2, 3)
INSERT [dbo].[jobs] ([id], [title], [description], [starts_at], [ends_at], [status], [client_id], [manager_id]) VALUES (4, N'Página Responsive', N'Desarrollar landpage responsive para abodago', CAST(N'2021-08-20T09:25:38.517' AS DateTime), CAST(N'2021-08-25T09:25:38.517' AS DateTime), 1, 1, 2)
INSERT [dbo].[jobs] ([id], [title], [description], [starts_at], [ends_at], [status], [client_id], [manager_id]) VALUES (5, N'30 Post', N'Publicar 30 post en Facebook e Instagram', CAST(N'2021-08-20T09:26:21.063' AS DateTime), CAST(N'2021-08-23T09:26:21.063' AS DateTime), 1, 5, 8)
INSERT [dbo].[jobs] ([id], [title], [description], [starts_at], [ends_at], [status], [client_id], [manager_id]) VALUES (6, N'Campaña publicitaria', N'Crear campaña publicitaria para un político', CAST(N'2021-08-19T09:27:02.490' AS DateTime), CAST(N'2021-08-23T09:27:02.490' AS DateTime), 1, 9, 6)
INSERT [dbo].[jobs] ([id], [title], [description], [starts_at], [ends_at], [status], [client_id], [manager_id]) VALUES (7, N'Video blog', N'Editar 10 videos de un bloguero', CAST(N'2021-08-20T09:27:33.860' AS DateTime), CAST(N'2021-08-23T09:27:33.860' AS DateTime), 1, 6, 7)
INSERT [dbo].[jobs] ([id], [title], [description], [starts_at], [ends_at], [status], [client_id], [manager_id]) VALUES (8, N'Crear pista', N'Crear pista de audio para rapero', CAST(N'2021-08-19T09:28:02.663' AS DateTime), CAST(N'2021-08-26T09:28:02.663' AS DateTime), 1, 4, 5)
INSERT [dbo].[jobs] ([id], [title], [description], [starts_at], [ends_at], [status], [client_id], [manager_id]) VALUES (9, N'Maquetar ecommerce', N'Maquetar sitio para una tienda virtual', CAST(N'2021-08-20T09:28:41.193' AS DateTime), CAST(N'2021-08-23T09:28:41.193' AS DateTime), 1, 7, 9)
INSERT [dbo].[jobs] ([id], [title], [description], [starts_at], [ends_at], [status], [client_id], [manager_id]) VALUES (10, N'Aplicación tipo UBER', N'Crear aplicación para taxistas y motoconchos tipo UBER', CAST(N'2021-08-22T09:29:53.817' AS DateTime), CAST(N'2021-08-24T09:29:53.817' AS DateTime), 1, 10, 10)
GO
INSERT [dbo].[managers] ([id], [name], [lastname], [email]) VALUES (1, N'Josías', N'Amarante', N'amarante@gmail.com')
INSERT [dbo].[managers] ([id], [name], [lastname], [email]) VALUES (2, N'César', N'Caamaño', N'caamano@gmail.com')
INSERT [dbo].[managers] ([id], [name], [lastname], [email]) VALUES (3, N'Toribio', N'Palacios', N'palacios@gmail.com')
INSERT [dbo].[managers] ([id], [name], [lastname], [email]) VALUES (4, N'Nicacia', N'Del Monte', N'delmonte@gmail.com')
INSERT [dbo].[managers] ([id], [name], [lastname], [email]) VALUES (5, N'Silvio', N'Rodríguez', N'rodriguez@gmail.com')
INSERT [dbo].[managers] ([id], [name], [lastname], [email]) VALUES (6, N'Nancy', N'Reynoso', N'reynoso@gmail.com')
INSERT [dbo].[managers] ([id], [name], [lastname], [email]) VALUES (7, N'Carmen', N'Pimentel', N'pimentel@gmail.com')
INSERT [dbo].[managers] ([id], [name], [lastname], [email]) VALUES (8, N'Camila', N'Santana', N'santana@gmail.com')
INSERT [dbo].[managers] ([id], [name], [lastname], [email]) VALUES (9, N'Alexandra', N'García', N'garcia@gmail.com')
INSERT [dbo].[managers] ([id], [name], [lastname], [email]) VALUES (10, N'Keyla', N'Monción', N'moncion@gmail.com')
GO