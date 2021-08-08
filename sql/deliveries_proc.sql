use ovoshi;

/*Delivery1: - увы, можно заказать только два разных сорта чего-либо*/
	SET @utd = 10; /*id юзера которому надо доставить заказ*/
    SET @sort1 = 1; /*id сорта в заказе*/
    SET @weight1 = 1; /*вес сорта в заказе*/
    SET @sort2 = 4;
    SET @weight2 = 0.456;
-- end of condition
-- логичнее передавать список сортов и список весов, но допустим функция разбиения списка на переменные осуществлена где-то отдельно
-- и в процедуру fill_deliveres прилетают отдельные значения; так же в процедуру можно ввести параметр, отвечающий за число заказываемх сортов если из не два

SET @total_weight1 = (select sum from weight_sort where sort_id = @sort1);  
SET @total_weight2 = (select sum from weight_sort where sort_id = @sort2);

delimiter //
drop procedure if exists fill_deliveries// 
create procedure fill_deliveries() /*заполняем таблицу deliveries новой строчкой*/
	begin
		SET @opIds = (select f_opIds());
        SET @price_num = (select f_price_num());
		INSERT INTO ovoshi.deliveries (user_to_deliver, `status`, `operation_ids`, price) 
        VALUES (@utd, 'in progress', @opIds, @price_num);
	end//
drop function if exists f_price_num//
create function f_price_num() /*считаем итоговую стоимость заказа*/
	RETURNS DECIMAL READS SQL DATA
	begin
		DECLARE cost1 DECIMAL;
        DECLARE cost2 DECIMAL;
		SET cost1 = (SELECT price from ovoshi.sort where id = @sort1);
        SET cost2 = (SELECT price from ovoshi.sort where id = @sort2);
        return (cost1 * @weight1 + cost2 * @weight2);
    end//
drop function if exists f_opIds//
create function f_opIds() /*Изменяем вес и статус в таблице box, заполняем таблицу operations, данные из которой пойдут в таблицу deliveries - в итге получаем список операций по взятью веса из коробок*/
	RETURNS TINYTEXT DETERMINISTIC /*получим строку где перечислены id операций по уменьшению массы нужных коробок с вычисленым id*/
    begin
		DECLARE operations_list TINYTEXT;
        
        SET operations_list = '';
		SET @box_weight1 = (select weight from box where sort_id = @sort1 AND box.`status` != 'broken' ORDER BY id LIMIT 1); /*ищем первую нужную коробку - её вес*/
        
        SET @box_id1 = (select id from box where sort_id = @sort1 AND box.`status` != 'broken' ORDER BY id LIMIT 1); /*ищем id первой нужной коробки*/
        

        WHILE (@weight1 > @box_weight1) DO /*если вес, указанный в заказе больше веса первой нужной коробки, то придтся брать из несольких коробок*/
			INSERT INTO operation (box_id, delta_M) VALUES (@box_id1, @box_weight1); /*опустошаем первую нужную коробку - записываем эту операцию*/
            SET @op_id = (select last_insert_id()); /*запоминаем id операции выше*/
            UPDATE box SET `status` = 'empty', `weight` = 0 where id = @box_id1; /*обновляем статус коробки из коробой забрали всё*/
            SET operations_list = concat(operations_list, ', ', @op_id); /*дописываем id операции в строчку*/
		    SET @weight1 = @weight1 - @box_weight1; /*считаем сколько осталось веса набрать после того как взяли из первой нужной коробки*/
            SET @box_weight1 = (select weight from box where sort_id = @sort1 AND box.`status` != 'broken' AND box.`status` != 'empty' ORDER BY id LIMIT 1); /*берём следующую коробку - ищем её вес*/
			SET @box_id1 = (select id from box where sort_id = @sort1 AND box.`status` != 'broken' AND box.`status` != 'empty' ORDER BY id LIMIT 1); /*ищем Id следующей коробки*/
        END WHILE;
		/*если оставшийся вес меньше веса коробки, то мы выходим из цикла - нам больше не нужно искать новые коробки*/
        INSERT INTO operation (box_id, delta_M) VALUES (@box_id1, @weight1); /*записываем операцию по взятью нужного веса*/
		SET @op_id = (select last_insert_id()); /*запоминает id операции выше*/
		SET operations_list = concat(operations_list, ', ', @op_id); /*записываем в строку id этой операции*/
		UPDATE box SET `weight` = (@box_weight1 - @weight1) where id = @box_id1; /*изменяем вес коробки, который умеьшился после того как взяли из неё*/
        
        -- Тоже самое для второго сорта
        SET @box_weight2 = (select weight from box where sort_id = @sort2 AND box.`status` != 'broken' AND box.`status` != 'empty' ORDER BY id LIMIT 1);
        SET @box_id2 = (select id from box where sort_id = @sort2 AND box.`status` != 'broken' AND box.`status` != 'empty' ORDER BY id LIMIT 1);
        
        WHILE @weight2 > @box_weight2 DO
			INSERT INTO operation (box_id, delta_M) VALUES (@box_id2, @box_weight2);
            SET @op_id = (select last_insert_id());
            UPDATE box SET `status` = 'empty', `weight` = 0 where id = @box_id2;
            SET operations_list = concat(operations_list, ', ', @op_id);
		    SET @weight2 = weight2 - @box_weight2;
            SET @box_weight2 = (select weight from box where sort_id = @sort2 AND box.`status` != 'broken' AND box.`status` != 'empty' ORDER BY id LIMIT 1);
			SET @box_id2 = (select id from box where sort_id = @sort2 AND box.`status` != 'broken' AND box.`status` != 'empty' ORDER BY id LIMIT 1);
        END WHILE;
        INSERT INTO operation (box_id, delta_M) VALUES (@box_id2, @weight2);
		SET @op_id = (select last_insert_id());
		SET operations_list = concat(operations_list, ', ', @op_id);
        UPDATE box SET `weight` = (@box_weight2 - @weight2) where id = @box_id2;
        
		return operations_list;
    end//
drop procedure if exists deliveries// 
create procedure deliveries() /*Итоговая самая главная функция - проверяем что у нас на базе есть необходимое количество продуктов чтобы выполнить заказ и заполняем deliveries*/
	begin
		IF (@total_weight1 <=> NULL AND @total_weight2 <=> NULL) OR (@total_weight1 < @weight1 AND @total_weight2 < @weight2) THEN
			select 'НА БАЗЕ НЕТ В НУЖНОМ КОЛИЧЕСТВЕ НИ ОДНОГО ИЗ СОРТОВ';
		elseIF (@total_weight2 <=> NULL) OR (@total_weight2 < @weight2) THEN
			select 'НА БАЗЕ НЕТ В НУЖНОМ КОЛИЧЕСТВЕ второго сорта';
		elseif (@total_weight1 <=> NULL)  OR (@total_weight1 < @weight1) THEN
			select 'НА БЕЗЕ НЕТ В НУЖНОМ КОЛИЧЕСТВЕ первого сорта';
        ELSE
			call fill_deliveries();
        END IF;
	end//
delimiter ;
call deliveries();