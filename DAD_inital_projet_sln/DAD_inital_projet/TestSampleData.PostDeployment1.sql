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