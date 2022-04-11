CREATE TRIGGER R_Insert
BEFORE INSERT ON R
FOR EACH ROW BEGIN
DECLARE counter INT;
SELECT COUNT(*) INTO @counter
FROM R
WHERE R.A = NEW.A
    AND R.B = NEW.B
    AND R.C <> NEW.C;
IF @counter > 0 THEN
    SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'AB -> C on R was violated';
END IF;
SELECT COUNT(*) INTO @counter
FROM R
WHERE (R.A, R.B, R.C, R.D, R.E) = (NEW.A, NEW.B, NEW.C, NEW.D, NEW.E);
IF @counter > 0 THEN
    SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Duplicate rows are not allowed';
END IF;
END;


CREATE TRIGGER R_Update
BEFORE UPDATE ON R
FOR EACH ROW BEGIN
DECLARE counter INT;
SELECT COUNT(*) INTO @counter
FROM R
WHERE R.A = NEW.A
    AND R.B = NEW.B
    AND R.C <> NEW.C
    AND (R.A, R.B, R.C, R.D, R.E) <> (OLD.A, OLD.B, OLD.C, OLD.D, OLD.E);
IF @counter > 0 THEN
    SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'AB -> C on R was violated';
END IF;
END;

