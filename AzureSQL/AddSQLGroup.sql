DECLARE @roleassigned VARCHAR(25)
DECLARE @username NVARCHAR(100)

-- Create group login from Windows
-- Make sure to put your group in the form of 'SAMAccountName'. No domain here.
-- If the group already exists for a database there will be errors displayed.  These can be ignored

-- Enter Group here
select @username = 'My Test Group' -- 'My Test Group'

-- Enter DB Role here
select @roleassigned = 'db_datareader' -- 'db_datareader'

-- Create User
DECLARE @usercreate NVARCHAR(200)
SET @usercreate = 'CREATE USER ['+@username+'] FROM EXTERNAL PROVIDER;'
EXEC (@usercreate)

-- Assign Role
DECLARE @addrole NVARCHAR(200)
SET @addrole = 'EXEC sp_addrolemember ['+@roleassigned+'] , ['+@username+']'
EXEC (@addrole)
