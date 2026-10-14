--use master;

----verificacao se a base de dados já existe, caso exista apaga a base de dados
--if exists (select * from sys.databases where name = 'GestaoEquipas')
--begin
--	drop database GestaoEquipas;
--end

----criamos a nossa nova base de dados vazia
--create database GestaoEquipas;
Use GestaoEquipas;

----tabelas para as entidades principais
--create table Equipas(
--	ID int not null,
--	Nome varchar(100) not null,
--	Alcunha varchar(100), -- pode ser NUll por isso nao leva o not null
--	Pais varchar(100) not null,
--	Data_Fundacao date not null,
--	primary key (ID),
--	check (ID > 0)
--)

--create table Local(
--	Codigo int not null,
--	Nome varchar(100) not null,
--	primary key (Codigo),
--	check (Codigo > 0)
--)

--create table Torneios (
--	ID int not null,
--	Nome varchar(100) not null,
--	Descricao varchar(500), -- opcional
--	primary key (ID),
--	check (ID > 0)
--)

--create table Jogo (
--	ID int not null,
--	Titulo varchar(100) not null,
--	Local varchar(100) not null,
--	primary key (ID),
--	check (ID > 0)
--)

---- tabelas para as entidades de herença
--create table Seniores (
--	-- ID_Equipa serve como PK e FK(liga à tabela Equipas)
--	ID_Equipa int not null,
--	--Estes dois campos vem da relacao "Organizar"
--	--como a relação no diagrama é (1,1) para os seniores
--	-- a tabela Seniores absorve as chaves do local e do torneio
--	Codigo_Local int not null,
--	ID_Torneio int not null,
--	Data_Organizar date not null,
--	primary key (ID_Equipa),
--	-- on delete cascade: Se a equipa principal for apagada na tabela Equipas, o registo sénior também desaparece automaticamente.
--	foreign key (ID_Equipa) references Equipas(ID) on delete cascade on update cascade,
--	foreign key (Codigo_Local) references Local(Codigo) on delete no action on update cascade,
--	foreign key (ID_Torneio) references Torneios(ID) on delete no action on update cascade
--)

--create table Sub18 (
--	Id_Equipa int not null,
--	Idade smallint,
--	Rank_Equipa int not null,
--	primary key (ID_Equipa),
--	foreign key (ID_Equipa) references Equipas (ID) on delete cascade on update cascade,
--	check (Idade is null or Idade <= 18)
--)

--create table Sub17(
--	ID_Equipa int not null,
--	Nivel varchar(50) not null,
--	primary key (ID_Equipa), 
--	foreign key (ID_Equipa) references Equipas (ID) on delete cascade on update cascade
--)

----declaracao do atributo multivalor Patrocinadores
---- como pode existir varios patrocinadores transforma-se numa nova tabela
--create table Patrocinadores (
--	ID_Torneio int not null,
--	Nome_Patrocinador varchar(100) not null,
--	primary key (ID_Torneio, Nome_Patrocinador),
--	foreign key (ID_Torneio) references Torneios (ID) on delete cascade on update cascade
--)

----relacoes (N:M)
----quando duas entidades têm uma relação (0,n) ou (1,n) para ambos os lados, temos de criar uma tabela de junção ("Join Table") que liga as duas.

--create table Comentar (
--	ID_Equipa_Comentadora int not null,
--	Id_Equipa_Comentada int not null,
--	Data_Comentar date not null,
--	Descricao varchar(500),
--	primary key(ID_Equipa_Comentadora, ID_Equipa_Comentada, Data_Comentar),
--	foreign key (ID_Equipa_Comentadora) references Equipas (ID),
--	foreign key (ID_Equipa_Comentada) references Equipas (ID),
--	Check (ID_Equipa_Comentadora <> ID_Equipa_Comentada) --verifica que as equipas nao é a mesma
--)

--create table Participar (
--	ID_Equipa int not null,
--	Id_Jogo int not null,
--	Data_Participacao date not null,
--	Hora time not null,
--	primary key (ID_Equipa, ID_Jogo, Data_Participacao),
--	foreign key (ID_Equipa) references Equipas (ID) on delete cascade,
--	foreign key (ID_Jogo) references Jogo (ID) on delete cascade
--)

--create table Conter (
--	ID_Torneio int not null,
--	ID_Jogo int not null,
--	Ano int not null,
--	primary key (ID_Torneio, ID_Jogo),
--	foreign key (ID_Torneio) references Torneios (ID) on delete cascade,
--	foreign key (ID_Jogo) references Jogo (ID) on delete cascade
--)

--create table Assistir (
--	ID_Equipa int not null,
--	ID_Torneio int not null,
--	Data_Assistir date not null,
--	Local_Assistir varchar(100) not null,
--	primary key (ID_Equipa, ID_Torneio, Data_Assistir),
--	foreign key (ID_Equipa) references Equipas (ID) on delete cascade,
--	foreign key (ID_Torneio) references Torneios (ID) on delete cascade
--)


---- Locais
--INSERT INTO Local VALUES
--(1, 'Estádio do Dragão'),
--(2, 'Estádio da Luz'),
--(3, 'Estádio de Alvalade'),
--(4, 'Estádio D. Afonso Henriques');

---- Equipas
--INSERT INTO Equipas VALUES
--(1, 'FC Porto',       'Dragões',  'Portugal', '1893-09-28'),
--(2, 'SL Benfica',     'Águias',   'Portugal', '1904-02-28'),
--(3, 'Sporting CP',    'Leões',    'Portugal', '1906-07-01'),
--(4, 'Vitória SC',     'Vimaranenses', 'Portugal', '1922-06-13'),
--(5, 'Académica',      'Briosa',   'Portugal', '1876-03-01'),
--(6, 'SC Braga',       'Arsenalistas', 'Portugal', '1921-01-19');

---- Torneios
--INSERT INTO Torneios VALUES
--(1, 'Liga Portugal',   'Campeonato nacional'),
--(2, 'Taça de Portugal', 'Competição eliminatória'),
--(3, 'Supertaça',       'Jogo entre campeão e vencedor da taça');

---- Seniores (absorve relação Organizar)
--INSERT INTO Seniores VALUES
--(1, 1, 1, '2024-08-10'),
--(2, 2, 2, '2025-01-15'),
--(3, 3, 3, '2025-08-01');

---- Sub18
--INSERT INTO Sub18 VALUES
--(4, 17, 3),
--(5, 16, 1),
--(6, 18, 2);

---- Sub17
--INSERT INTO Sub17 VALUES
--(4, 'Regional'),
--(5, 'Nacional'),
--(6, 'Distrital');

---- Patrocinadores
--INSERT INTO Patrocinadores VALUES
--(1, 'NOS'),
--(1, 'MEO'),
--(2, 'Sagres'),
--(3, 'Galp');

---- Jogos
--INSERT INTO Jogo VALUES
--(1, 'Porto vs Benfica',  'Estádio do Dragão'),
--(2, 'Sporting vs Braga', 'Estádio de Alvalade'),
--(3, 'Benfica vs Vitória', 'Estádio da Luz'),
--(4, 'Porto vs Sporting', 'Estádio do Dragão');

---- Conter (jogos em torneios)
--INSERT INTO Conter VALUES
--(1, 1, 2025),
--(1, 2, 2025),
--(2, 3, 2025),
--(3, 4, 2024);

---- Participar
--INSERT INTO Participar VALUES
--(1, 1, '2025-02-10', '20:00'),
--(2, 1, '2025-02-10', '20:00'),
--(3, 2, '2025-03-05', '19:00'),
--(6, 2, '2025-03-05', '19:00'),
--(2, 3, '2025-04-20', '21:00'),
--(4, 3, '2025-04-20', '21:00'),
--(1, 4, '2024-09-01', '18:00'),
--(3, 4, '2024-09-01', '18:00');

---- Comentar
--INSERT INTO Comentar VALUES
--(1, 2, '2026-04-01', 'Bom jogo'),
--(1, 3, '2026-04-15', 'Excelente desempenho'),
--(2, 1, '2026-03-20', 'Grande equipa'),
--(1, 4, '2026-05-01', 'Parabéns'),
--(3, 1, '2026-05-10', 'Bem jogado');

---- Assistir
--INSERT INTO Assistir VALUES
--(3, 1, '2025-02-10', 'Estádio do Dragão'),
--(4, 1, '2025-02-10', 'Estádio do Dragão'),
--(1, 2, '2025-04-20', 'Estádio da Luz'),
--(5, 3, '2024-09-01', 'Estádio do Dragão');

SELECT TOP 1
    t.Nome        AS Torneio,
    e.Nome        AS EquipaOrganizadora,
    s.Data_Organizar AS Data,
    l.Nome        AS Local
FROM Seniores s
    JOIN Equipas  e ON e.ID       = s.ID_Equipa
    JOIN Torneios t ON t.ID       = s.ID_Torneio
    JOIN Local    l ON l.Codigo   = s.Codigo_Local
ORDER BY s.Data_Organizar ASC;

-- "Assistir" regista equipas que assistem a torneios, não a jogos diretamente.
-- Consideramos as equipas que assistiram ao torneio onde o jogo foi disputado.
SELECT
    j.Titulo          AS Jogo,
    COUNT(a.ID_Equipa) AS N_Equipas
FROM Jogo j
    JOIN Conter  c ON c.ID_Jogo    = j.ID
    LEFT JOIN Assistir a ON a.ID_Torneio = c.ID_Torneio
GROUP BY j.ID, j.Titulo
ORDER BY j.Titulo;

-- "mais nova" = Data_Fundacao mais recente
SELECT
    j.Titulo  AS Jogo,
    e.Nome    AS Equipa,
    e.Alcunha,
    DATEDIFF(YEAR, e.Data_Fundacao, GETDATE()) AS Idade
FROM Equipas e
    JOIN Participar p ON p.ID_Equipa = e.ID
    JOIN Jogo       j ON j.ID        = p.ID_Jogo
WHERE e.Data_Fundacao = (
    SELECT MAX(Data_Fundacao) FROM Equipas
);

SELECT TOP 1
    e.Nome    AS Equipa,
    e.Alcunha,
    COUNT(*) AS TotalComentarios
FROM Comentar c
    JOIN Equipas e ON e.ID = c.ID_Equipa_Comentadora
WHERE c.Data_Comentar >= DATEADD(DAY, -60, GETDATE())
GROUP BY e.ID, e.Nome, e.Alcunha
ORDER BY TotalComentarios DESC;

SELECT
    e.Nome,
    e.Pais
FROM Equipas e
WHERE e.ID NOT IN (
    SELECT DISTINCT ID_Equipa
    FROM Assistir
)
ORDER BY e.Nome ASC;

go

-- ============================================================
-- QUESTÃO 3
-- Procedimento: torneios com prejuízo no último ano
-- ============================================================
CREATE OR ALTER PROCEDURE PrejuizoTorneios -- Mudado para CREATE OR ALTER
    @PrejuizoTotal money OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    CREATE TABLE #ResultadosTorneios (
        Torneio     varchar(100),
        Receita     money,
        Custo       money,
        Prejuizo    money
    );

    -- O Torneio paga 250€ (Custo) e recebe 20€ por participação (Receita).
    INSERT INTO #ResultadosTorneios
    SELECT
        t.Nome                          AS Torneio,
        COUNT(p.ID_Equipa) * 20         AS Receita,
        250                             AS Custo,
        250 - (COUNT(p.ID_Equipa) * 20) AS Prejuizo
    FROM Torneios t
        JOIN Conter     c ON c.ID_Torneio = t.ID
        JOIN Participar p ON p.ID_Jogo    = c.ID_Jogo
    WHERE p.Data_Participacao >= DATEADD(YEAR, -1, GETDATE())
    GROUP BY t.ID, t.Nome
    HAVING (COUNT(p.ID_Equipa) * 20) < 250;

    -- Apresenta os torneios que deram prejuízo
    SELECT
        Torneio,
        Receita,
        Custo,
        Prejuizo
    FROM #ResultadosTorneios
    ORDER BY Prejuizo DESC;

    -- Calcula e devolve o prejuízo total somado
    SELECT @PrejuizoTotal = ISNULL(SUM(Prejuizo), 0)
    FROM #ResultadosTorneios;

    DROP TABLE #ResultadosTorneios;
END;
GO

-- ============================================================
-- EXECUTAR A QUESTÃO 3 PARA VER OS RESULTADOS
-- ============================================================
DECLARE @Total money;
EXEC PrejuizoTorneios @PrejuizoTotal = @Total OUTPUT;
SELECT @Total AS PrejuizoTotal_De_Todos_Os_Torneios;

---- ============================================================
---- QUESTÃO 4
---- Trigger: impede inserção em Participar se as duas equipas
---- no mesmo jogo forem a mesma
---- ============================================================
--CREATE OR ALTER TRIGGER trg_Participar_EquipasDiferentes -- Mudado para CREATE OR ALTER
--ON Participar
--INSTEAD OF INSERT
--AS
--BEGIN
--    SET NOCOUNT ON;

--     --Verifica se se está a tentar inserir uma equipa num jogo onde ela já está inscrita
--    IF EXISTS (
--        SELECT 1
--        FROM inserted i
--        JOIN Participar p ON p.ID_Jogo = i.ID_Jogo
--                          AND p.ID_Equipa = i.ID_Equipa
--    )
--    BEGIN
--        RAISERROR('Erro (Trigger): Não é possível inserir a mesma equipa duas vezes no mesmo jogo.', 16, 1);
--        ROLLBACK TRANSACTION;
--        RETURN;
--    END

--     --Se não houver duplicação, permite a inserção normalmente
--    INSERT INTO Participar (ID_Equipa, ID_Jogo, Data_Participacao, Hora)
--    SELECT ID_Equipa, ID_Jogo, Data_Participacao, Hora
--    FROM inserted;
--END;
--GO
