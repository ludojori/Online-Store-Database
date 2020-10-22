USE tech_store
GO

IF EXISTS (SELECT 1 FROM sys.views WHERE name = 'V_join_techittech' AND type = 'v')
DROP VIEW V_join_techittech;
GO

CREATE VIEW V_join_techittech AS
SELECT it_tech.ser_num
FROM it_tech JOIN tech
ON tech.ser_num = it_tech.ser_num;
GO

IF EXISTS (SELECT 1 FROM sys.views WHERE name = 'V_join_techwhitetech' AND type = 'v')
DROP VIEW V_join_techwhitetech;
GO

CREATE VIEW V_join_techwhitetech AS
SELECT white_tech.ser_num
FROM white_tech JOIN tech
ON tech.ser_num = white_tech.ser_num;
GO

IF EXISTS (SELECT 1 FROM sys.views WHERE name = 'V_join_techaudiotech' AND type = 'v')
DROP VIEW V_join_techaudiotech;
GO

CREATE VIEW V_join_techaudiotech AS
SELECT audio_tech.ser_num
FROM audio_tech JOIN tech
ON tech.ser_num = audio_tech.ser_num;
GO
