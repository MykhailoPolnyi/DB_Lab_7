USE `polnyi_7_41`;
-- ---------------
-- count_avg_street use
-- ---------------
select * from worker where worker.seniority > polnyi_7_41.count_avg_seniority();

-- ---------------
-- count_avg_street use
-- ---------------
select id, name, select_street(pharmacy.id) as street, house_num, work_time_start, work_time_end, is_saturday_weekend, is_sunday_weekend from pharmacy;
