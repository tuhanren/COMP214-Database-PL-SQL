alter session set nls_date_language='american';
-- question 1
create or replace procedure ddproj_sp(proj_id in dd_project.idproj%type, project_items out sys_refcursor) as
	str_sql varchar(200) := '';
begin
	str_sql := 'select * from dd_project where idproj=' || proj_id;
	open project_items for str_sql;
end;
/
declare
	project_cursor sys_refcursor;
	item dd_project%rowtype;
begin
	ddproj_sp(500, project_cursor);
	fetch project_cursor into item;
	if project_cursor%notfound then
		raise_application_error(-20000,'no such id');
	end if;
	while project_cursor%found loop
		fetch project_cursor into item;
		dbms_output.put_line('project id is '||item.idproj||chr(9)||'project name is '||item.projname||chr(9)||'start date is '||item.projstartdate||chr(9)||'end date is '||item.projenddate||chr(9)||'fund goal is '||item.projfundgoal||chr(9)||'coordinator is '||item.projcoord);
	end loop;
	close project_cursor;
end;
/
-- question 2
create or replace procedure ddpay_sp(donor_id in dd_pledge.iddonor%type, status out boolean, valid_id out boolean) as
	record dd_pledge%rowtype;
begin
	valid_id := true;
	-- only the latest pledge would be included
	select
		*
	into
		record
	from
		(select
			*
		from
			dd_pledge
		where
			iddonor = donor_id
		order by
			pledgedate desc)
	where
		rownum = 1;
	if record.idstatus = 10 and record.paymonths <> 0 then
		status := true;
	else
		status := false;
	end if;
exception
	when no_data_found then
		dbms_output.put_line('no such id');
		valid_id := false;
end;
/
declare
	status boolean;
	valid_id boolean;
begin
	ddpay_sp(0, status, valid_id);
	if valid_id then
		if status then
			dbms_output.put_line('active donor');
		else
			dbms_output.put_line('inactive donor');
		end if;
	end if;
	ddpay_sp(302, status, valid_id);
	if valid_id then
		if status then
			dbms_output.put_line('active donor');
		else
			dbms_output.put_line('inactive donor');
		end if;
	end if;
	ddpay_sp(306, status, valid_id);
	if valid_id then
		if valid_id and status then
			dbms_output.put_line('active donor');
		else
			dbms_output.put_line('inactive donor');
		end if;
	end if;
end;
/
-- question 3
create or replace procedure ddckpay_sp(pledge_id in dd_pledge.idpledge%type, payment_amount in dd_payment.payamt%type) as
	valid_pledge dd_pledge%rowtype;
	valid_payment dd_payment%rowtype;
begin
	select
		*
	into
		valid_pledge
	from
		dd_pledge
	where
		idpledge = pledge_id and paymonths <> 0;
	if valid_pledge.idpledge is not null and valid_pledge.paymonths <> 0 then
		-- only the latest payment is valuable
		select
			*
		into
			valid_payment
		from
			(select
				*
			from
				dd_payment
			where
				idpledge = pledge_id
			order by
				paydate desc)
		where rownum = 1;
		if valid_payment.payamt = payment_amount then
			dbms_output.put_line('pledge '||valid_payment.idpledge||' has a correct monthly increment amount');
		else
			raise_application_error(-20050,'incorrect payment amount - planned payment = $'||valid_payment.payamt);
		end if;
	end if;
exception
	when no_data_found then
		dbms_output.put_line('no payment information');
end;
/
begin
	ddckpay_sp(104, 25);
end;
/
begin
	ddckpay_sp(104, 20);
end;
/
begin
	ddckpay_sp(0, 20);
end;
/
-- question 4
create or replace procedure ddckbal_sp(pledge_id in dd_pledge.idpledge%type) as
	type type_pledge is record(id dd_pledge.idpledge%type, amount dd_pledge.pledgeamt%type, payment_date dd_payment.paydate%type, balance dd_payment.payamt%type);
	pledge type_pledge;
begin
	select
		idpledge, pledgeamt, paydate, pledgeamt-payamt balance
	into
		pledge
	from
		(select
			idpledge, payamt, paydate
		from
			(select
				*
			from
				dd_payment
			where
				idpledge = pledge_id
			order by
				paydate desc)
		where
			rownum = 1)
	natural join
		dd_pledge;
	dbms_output.put_line('pledge amount = '||pledge.amount||chr(9)||'payment date = '||pledge.payment_date||chr(9)||'balance = '||pledge.balance);
exception
	when no_data_found then
		dbms_output.put_line('no such id');
end;
/
begin
	ddckbal_sp(104);
end;