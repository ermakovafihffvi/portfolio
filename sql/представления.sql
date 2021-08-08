-- сколько какого сорта есть коробок (по весу)
use ovoshi;
CREATE OR REPLACE VIEW weight_sort AS SELECT SUM(box.weight) as sum, box.sort_id as sort_id FROM box WHERE box.`status` != 'broken' GROUP BY sort_id;

-- какие сорта при какой температуре хранить 
CREATE OR REPLACE VIEW temperature_of_storage AS 
	SELECT group_concat(concat(categories.name, ' ',sort.`name`) separator ', ') as 'names', temperature.min as min_t, temperature.max as max_t 
	FROM sort join categories on sort.categorie_id = categories.id
	right join temperature on sort.temp_of_storage_id = temperature.id GROUP BY temp_of_storage_id;