--Char
The length of a CHAR column is fixed to the 
length that you declare when you create the table. 
The length can be any value from 0 to 255. 
When CHAR values are stored, they are right-padded 
with spaces to the specified length. When CHAR 
values are retrieved, trailing spaces are removed 
unless the PAD_CHAR_TO_FULL_LENGTH SQL mode is enabled.

Value	Char(4)	Storage	Varchar(4)	Storage
' '	    '    '	4 bytes	' '	       1 byte
'ab'	'ab  '	4 bytes	'ab'	   3 bytes
'abcd'	'abcd'	4 bytes	'abcd'	   5 bytes

CHAR is faster for fixed length text
Zip codes: 59715, 94924
State Abbreviations: CA, NY
Yes/No Flags: Y/N

DECIMAL(5, 2)
--very fixed
2 = Digits After Decimal
5 = Total Number Of significant digits, that is 3 before decimal 

FLOAT(4 byte) and DOUBLE(8 byte)
= takes up less space than decimal, but comes at a cost of precision 
Float - less precision
Double - more precision

--------Date Functions-------------------------------------------------------------
SELECT CURTIME();
 
SELECT CURDATE();
 
SELECT NOW();
 
 select current_date ;
select current_time;
select current_timestamp;

INSERT INTO people (name, birthdate, birthtime, birthdt)
VALUES ('Hazel', CURDATE(), CURTIME(), NOW());


-- datetime and timestamp
Timestamp store with less space as the time period window is less


