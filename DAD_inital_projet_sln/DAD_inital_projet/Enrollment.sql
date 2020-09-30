CREATE TABLE [dbo].[Enrollment]
(
	[StudentID] INT NOT NULL,
	[SubjCode] NVARCHAR(100) NOT null, 
	[Grade] NVARCHAR(2) NULL
	PRIMARY KEY ([StudentID], SubjCode)
	CONSTRAINT MAttAskedForThis FOREIGN KEY (STUDENTID) REFERENCES STUDENT, 
    CONSTRAINT [CK_Grade] CHECK (Grade in ('n', 'p', 'c')), 
    
)
