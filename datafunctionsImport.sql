-- This function will return 1 in case that the target year is a leap year. In case that the condotion is wron the function will return 0.

DELIMITER $$
CREATE OR REPLACE FUNCTION isLeapYear(targetYear DATE)
returns BOOLEAN
BEGIN
	DECLARE yearNumber INT;
	SET yearNumber = YEAR(targetYear);
	IF (MOD(yearNumber,4) = 0 AND 
        (MOD(yearNumber, 100) = 0 AND 
        MOD(yearNumber, 400) = 0))
		THEN return TRUE;
		ELSE return FALSE;
    END IF;
END$$
DELIMITER ;

-- This function will return 1 in case that the target data is a valid date. In all other cases the function return 0

DELIMITER $$
CREATE OR REPLACE FUNCTION isValidDate(vDate DATE)
returns BOOLEAN
BEGIN
	DECLARE vMonth, vDay INT; 
    SELECT MONTH(vDate),DAY(vDate) INTO vMonth,vDay;
    IF (vMonth < 13 AND vMonth > 0) AND (vDay > 0 AND vDay < 32)
    THEN return TRUE;
    ELSE return FALSE;
    END IF;
END$$
DELIMITER ;

-- This function will return the number of days to a target month 

DELIMITER $$
CREATE OR REPLACE FUNCTION monthLength(vDate DATE)
returns INT
BEGIN
	DECLARE vMonth, vDays INT; 
    SET vMonth = MONTH(vDate);
    
    IF ((vMonth = 1) OR (vMonth = 3) OR (vMonth = 5) OR (vMonth = 7) OR (vMonth = 8) OR (vMonth = 10) OR (vMonth = 12))
    
    	THEN SET vDays = 31;
    
    ELSEIF vMonth = 2 AND isLeapYear(vDate) = 1
    	
        THEN SET vDays = 29;
        
    ELSEIF vMonth = 2 AND isLeapYear(vDate) = 0
    	
        THEN SET vDays = 28;
        
    ELSE SET vDays = 30;

	END IF;
    return vDays;
END$$
DELIMITER ;
