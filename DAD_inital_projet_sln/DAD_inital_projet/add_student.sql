CREATE PROCEDURE [dbo].[add_student]
	@pstudentid int,
	@pFName NVARchaR(50),
	@pSurname NVARchaR(50)
AS
	insert into Student (StudentID, FirstName, Surname, NewColumn) values
(@pstudentid, @pFName, @pSurname, NULL);

RETURN 0


