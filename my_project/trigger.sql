DELIMITER 
//
CREATE TRIGGER trigger_passwords 
	BEFORE INSERT 
		ON users
			FOR EACH ROW
				begin
					SET NEW.password = md5(NEW.password);
				end;			
//
DELIMITER ;			

			
			
			
			
			
			