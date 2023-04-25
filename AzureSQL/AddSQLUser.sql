DECLARE @roleassigned VARCHAR(25)
DECLARE @username NVARCHAR(100)

-- Create user login from Windows
-- Make sure to put your complete username in the form of USERNAME@ceiwc.com
-- If the user already exists for a database there will be errors displayed.  These can be ignored

-- Enter username here
select @username = 'bgates@contoso.com' -- 'bgates@contoso.com'

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
