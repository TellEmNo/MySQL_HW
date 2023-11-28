/*
Создайте функцию, которая принимает кол-во сек и формат их в кол-во дней часов. Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '
 */
DELIMITER //
DROP FUNCTION IF EXISTS Convert_sec//
CREATE FUNCTION Convert_sec (sec INT)
RETURNS VARCHAR(100) DETERMINISTIC
BEGIN
  DECLARE days, hours, minutes INT;
  IF sec = 0 THEN
	RETURN 'Нужно больше секунд';
  END IF;
  
  SET days = sec / 86400;
  SET sec = sec % 86400;
  IF sec >= 43200 THEN
	SET days = days - 1; 
  END IF;
  
  SET hours = sec / 3600;
  SET sec = sec % 3600;
  IF sec >= 1800 THEN
	SET hours = hours - 1; 
  END IF;
  
  SET minutes = sec / 60;
  SET sec = sec % 60;
  IF sec >= 30 THEN
	SET minutes = minutes - 1; 
  END IF;
  RETURN CONCAT(days, ' days ', hours, ' hours ', 
                  minutes, ' minutes ', sec, ' seconds'); 
END//

SELECT Convert_sec(123456)//
SELECT Convert_sec(853456)//
SELECT Convert_sec(195)//


/* 
Выведите только четные числа от 1 до 10. Пример: 2,4,6,8,10
*/

DROP PROCEDURE IF EXISTS Even_numbers//
CREATE PROCEDURE Even_numbers (IN num INT)
BEGIN
  DECLARE i INT DEFAULT 1;
  IF (num > i) THEN
	IF num = 2 THEN
	  SELECT 2;
	ELSE
	  cycle: WHILE i + 1 < num DO
		IF i % 2 != 0 THEN
		  SET i = i + 1;
		ELSE
		  SET i = i + 2;
		END IF;
		SELECT i;
	  END WHILE cycle;
	END IF;
  ELSE
	SELECT 'Ваше число меньше или равно 1';
  END IF;
END//

CALL Even_numbers(10)//
CALL Even_numbers(2)//
CALL Even_numbers(3)//
