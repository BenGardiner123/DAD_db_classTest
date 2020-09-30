﻿/*
Deployment script for DAD_inital_projet

This code was generated by a tool.
Changes to this file may cause incorrect behavior and will be lost if
the code is regenerated.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DEPLY_TEST_DATA "FALSE"
:setvar DatabaseName "DAD_inital_projet"
:setvar DefaultFilePrefix "DAD_inital_projet"
:setvar DefaultDataPath "C:\Users\Cooler Master\AppData\Local\Microsoft\VisualStudio\SSDT\DAD_inital_projet_sln"
:setvar DefaultLogPath "C:\Users\Cooler Master\AppData\Local\Microsoft\VisualStudio\SSDT\DAD_inital_projet_sln"

GO
:on error exit
GO
/*
Detect SQLCMD mode and disable script execution if SQLCMD mode is not supported.
To re-enable the script after enabling SQLCMD mode, execute the following:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'SQLCMD mode must be enabled to successfully execute this script.';
        SET NOEXEC ON;
    END


GO
USE [$(DatabaseName)];


GO
PRINT N'Dropping [dbo].[CK_Grade]...';


GO
ALTER TABLE [dbo].[Enrollment] DROP CONSTRAINT [CK_Grade];


GO
PRINT N'Creating [dbo].[CK_Grade]...';


GO
ALTER TABLE [dbo].[Enrollment] WITH NOCHECK
    ADD CONSTRAINT [CK_Grade] CHECK (Grade in ('n', 'p', 'c'));


GO
/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/

IF ('$(DEPLY_TEST_DATA)' = 'FALSE')

begin

DELETE FROM Student;

END

BEGIN

insert into Student (StudentID, FirstName, Surname, NewColumn) values
(1, 'Enrique', 'Bermúdez', NULL),
(2, 'Rigoberto', 'Cruz', NULL),
(3, 'Carlos', 'Fonseca', NULL),
(4, 'Augusto', 'Sandino', NULL),
(5, 'Edén', 'Pastora', NULL);

END
GO

GO
PRINT N'Checking existing data against newly created constraints';


GO
USE [$(DatabaseName)];


GO
ALTER TABLE [dbo].[Enrollment] WITH CHECK CHECK CONSTRAINT [CK_Grade];


GO
PRINT N'Update complete.';


GO
