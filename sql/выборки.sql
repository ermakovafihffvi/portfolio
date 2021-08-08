use ovoshi;

-- найти все коробки из данного заказа
SET @id_delivery = 1;
SET @str = (select operation_ids from deliveries where id = @id_delivery);
SET @len = LENGTH(@str);
drop procedure if exists proc_op;
delimiter //
create procedure proc_op(str tinytext, len INT)
begin
    SET @box_ids = '';
	SET @i = 0;
	l1: loop
    SET @i = @i + 3;
    IF @i < len THEN
		SET @box_ids = concat_ws(',' ,@box_ids, (SELECT box_id from operation where id = substring(str, @i, 1)));
		iterate l1;
	END IF;
    LEAVE l1;
    END LOOP l1;
end//

call proc_op(@str, @len);
-- select @id_delivery, @box_ids from dual;

-- сколько килограмм какого продукта есть в наличии
select SUM(b.weight) as sum_weight, s.`name` as 'sort', c.`name` as 'categorie' from box b
join sort s on b.sort_id = s.id
join categories c on s.categorie_id = c.id
group by s.id;

-- самые любимые продукт и кем они доставляется
select count(*) as count, u.fav_prod_id from users u where u.fav_prod_id IS NOT NULL 
group by u.fav_prod_id order by count desc;

select count(*) as count, c.`name` as categorie, s.`name` as 'sort', sup.`name` as sup from users u
join sort s on s.id = u.fav_prod_id
join categories c on c.id = s.categorie_id 
join box b on b.sort_id = u.fav_prod_id
join supplier sup on b.supplier_id = sup.id
where u.fav_prod_id IS NOT NULL group by u.fav_prod_id order by count desc;