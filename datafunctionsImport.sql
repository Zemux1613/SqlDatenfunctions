-- This function will return 1 in case that the target year is a leap year. In case that the condotion is wron the function will return 0.

DELIMITER $$
CREATE OR REPLACE FUNCTION isLeapYear(targetYear DATE)
returns INT
BEGIN
	DECLARE yearNumber INT;
	SET yearNumber = YEAR(targetYear);
	IF (MOD(yearNumber,4) = 0 AND 
        (MOD(yearNumber, 100) = 0 AND 
        MOD(yearNumber, 400) = 0))
		THEN return 1;
		ELSE return 0;
    END IF;
END$$
DELIMITER ;