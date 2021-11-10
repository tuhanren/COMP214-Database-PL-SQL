alter session set nls_date_language='american';
-- question 1
select
    a.officer_id, b.last, b.first, a.report_num
from
    (select
        officer_id, count(officer_id) as report_num
    from
        crime_officers
    group by
        officer_id) a
join
    officers b
on
    a.officer_id=b.officer_id
where
    report_num<(
    select
        max(count(officer_id))
    from
        crime_officers
    group by
        officer_id);

-- question 2
select
    criminal_id, b.crime_id, b.classification, c.last, c.first, a.crime_num
from
    (select
        criminal_id, count(crime_id) as crime_num
    from
        crimes
    group by
        criminal_id) a
join
    crimes b
using
    (criminal_id)
join
    criminals c
using
    (criminal_id)
where
    crime_num>(
        select
            avg(count(crime_num)) as avg_crime
        from
            crimes
        group by
            criminal_id)
    and
    b.classification<>'f';

-- question 3
select
    *
from
    (select
        appeal_id, crime_id, filing_date, hearing_date, ROUND(TO_NUMBER(hearing_date - filing_date)) as date_gap, status
    from
        appeals)
where
    date_gap<
    (select
        avg(ROUND(TO_NUMBER(hearing_date - filing_date)))
    from
        appeals);

-- question 4
select
    prob_id, last, first, criminal_num
from
    (select
            prob_id, count(criminal_id) as criminal_num
        from
            sentences
        group by
            prob_id
        having
            prob_id is not null)
join
    prob_officers
using
    (prob_id)
where
    criminal_num>
    (select
        avg(count(criminal_id))
    from
        sentences
    group by
        prob_id
    having
        prob_id is not null);

-- question 5
select
    *
from
    (select
        crime_id, count(appeal_id) as appeal_num
    from
        appeals
    group by
        crime_id)
join
    crimes
using
    (crime_id)
where
    appeal_num=
    (select
        min(count(appeal_id)) as min_appeal
    from
        appeals
    group by
        crime_id)