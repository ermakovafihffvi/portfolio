
-- Триггер для тех, кто при заполнении будет путать где столбик для минимальной температуры, а где для масимальной
drop trigger if exists trigger_temp;
delimiter //
create trigger trigger_temp BEFORE INSERT ON temperature
for each row
begin 
	IF new.min > new.max THEN
		SET @c = new.max;
        SET new.max = new.min;
        SET new.min = @c;
    END IF;
end// 

-- Триггер на добавление пользователя чтобы была корректная дата рождения
drop trigger if exists trigger_users// 
create trigger trigger_users BEFORE INSERT ON users
for each row
begin
	IF new.date_of_birth > now() THEN
		signal sqlstate '45000' set message_text = 'error input';
    END IF;
end//

