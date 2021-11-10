alter session set nls_date_language='american';
-- question 1
drop view tmp;
create view tmp as
select
	idproj, projname, count(idpledge) "PLEDGE_NUMBER", sum(pledgeamt) "total", avg(pledgeamt) "AVERAGE"
from
	DD_PLEDGE
join
	DD_PROJECT
using
	(idproj)
group by
	idproj, projname
order by
	idproj;

accept input number prompt 'Please enter project id:'
declare
	id number;
	record tmp%rowtype;
begin
	id := &input;
	select
		*
	into
		record
	from
		tmp
	where
		idproj = id;
	dbms_output.put_line(record.idproj||' '||record.projname||' '||record.pledge_number||' '||record."total"||' '||record.average);
exception
	when no_data_found then
		dbms_output.put_line('no such id');
end;

-- question 2
drop sequence dd_projid_seq;
create sequence dd_projid_seq
start with 530
increment by 1
nocache
nocycle;

declare
	record DD_PROJECT%rowtype;
begin
	record.projname := 'HK Animal Shelter Extension';
	record.projstartdate := '1-JAN-13';
	record.projenddate := '5-MAY-13';
	record.projfundgoal := 65000;
	insert into DD_PROJECT (IDPROJ, PROJNAME, PROJSTARTDATE, PROJENDDATE, PROJFUNDGOAL)
	values (dd_projid_seq.nextval,record.projname,record.projstartdate,record.projenddate,record.projfundgoal);
end;

-- question 3
declare
	cursor iterator is
	select
		*
	from
		dd_pledge
	where
		pledgedate between '01-SEP-12' and '31-OCT-12'
	order by
		paymonths;
begin
	for item in iterator
	loop
		dbms_output.put_line('IDPLEDGE=' || item.idpledge || chr(9) || 'IDDONOR=' || item.iddonor || chr(9) || 'PLEDGEAMT=' || item.pledgeamt);
		if item.paymonths = 0 THEN
			dbms_output.put_line('lump sum');
		else
			dbms_output.put_line('monthly=' || item.paymonths);
		end if;
	end loop;
end;

-- question 4
drop view tmp;
create view tmp as
select
	distinct(idpledge), iddonor, pledgeamt, payamt, pledgeamt - payamt as difference
from
	dd_pledge
join
	dd_payment
using
	(idpledge)
order by
	idpledge;

accept input number prompt 'Please enter pledge id:'
declare
	id number;
	record tmp%rowtype;
begin
	id := &input;
	select
		*
	into
		record
	from
		tmp
	where
		idpledge = id;
	dbms_output.put_line(record.idpledge||' '||record.iddonor||' '||record.pledgeamt||' '||record.payamt||' '||record.difference);
exception
	when no_data_found then
		dbms_output.put_line('no such id');
end;

-- question 5
accept id number prompt 'Please enter project id:'
accept fund number prompt 'Please enter fund goal:'
declare
	id number;
	fund number;
	type type_project is table of dd_project%rowtype index by pls_integer;
	record type_project;
begin
	id := &id;
	fund := &fund;
	update
		dd_project
	set
		projfundgoal = fund
	where
		idproj = id;
	select
		*
	bulk collect into
		record
	from
		dd_project;
	for item in 1..record.count
	loop
		dbms_output.put_line(record(item).idproj||' '||record(item).projname||' '||record(item).projstartdate||' '||record(item).projenddate||' '||record(item).projfundgoal||' '||record(item).projcoord);
	end loop;
end;