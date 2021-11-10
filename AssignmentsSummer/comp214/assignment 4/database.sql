alter session set nls_date_language='american';
--drop tables and sequences--
drop table address;
drop table customer;
drop table inventory;
drop table orderitem;
drop table orders;
drop table product;
drop table promotion;
drop sequence addressid_seq;
drop sequence customerid_seq;
drop sequence inventoryid_seq;
drop sequence orderid_seq;
drop sequence orderitemid_seq;
drop sequence productid_seq;
drop sequence promotionid_seq;

--create tables and sequences--
create sequence addressid_seq start with 100 increment by 1;
create sequence customerid_seq start with 100 increment by 1;
create sequence inventoryid_seq start with 100 increment by 1;
create sequence orderid_seq start with 100 increment by 1;
create sequence orderitemid_seq start with 100 increment by 1;
create sequence productid_seq start with 100 increment by 1;
create sequence promotionid_seq start with 100 increment by 1;
create table address (
	addressid number(10) not null,
	customerid number(10) not null,
	address varchar2(255),
	city varchar2(20),
	state varchar2(2),
	zip varchar2(6),
primary key (addressid),
constraint address_zip_ck check (translate(zip, '123456789', '000000000') = '00000'),
constraint address_state_ck check (length(state) = 2));
create table customer (
	customerid number(10) not null,
	firstname varchar2(20),
	lastname varchar2(20),
	email varchar2(50) not null,
	password varchar2(255) not null,
primary key (customerid));
create table inventory (
	inventoryid number(10) not null,
	productid number(10) not null,
	quantity number(2),
	location varchar2(6),
primary key (inventoryid),
constraint quantity_ck check (quantity >= 0));
create table orderitem (
	orderitemid number(10) not null,
	orderid number(10) not null,
	productid number(10) not null,
	quantity number(10) not null,
primary key (orderitemid));
create table orders (
	orderid number(10) not null,
	customerid number(10) not null,
	status varchar2(20) default 'inactive' not null,
	payment_type varchar2(20),
	order_date date default sysdate,
	ship_date date,
	ship_street varchar2(255),
	ship_city varchar2(20),
	ship_state varchar2(2),
	ship_zip varchar2(5),
primary key (orderid),
constraint shipdate_ck check (order_date <= ship_date),
constraint paymenttype_ck check (payment_type in ('debit', 'credit', 'paypal', 'bitcoin')),
constraint status_ck check (status in ('active', 'inactive', 'confirmed')),
constraint shipzip_ck check (translate(ship_zip, '123456789', '000000000') = '00000'),
constraint shipstate_ck check (length(ship_state) = 2));
create table product (
	productid number(10) not null,
	title     varchar2(50),
	cost      number(10, 2),
	retail    number(10, 2),
	category  varchar2(20),
	summary   varchar2(2000),
	status    varchar2(20),
primary key (productid),
constraint retail_ck check (retail >= cost),
constraint cost_ck check (cost >= 1),
constraint product_status_ck check (status in ('high stock level', 'average stock level', 'low stock level', 'limited stock level', 'out of stock')));
create table promotion (
	promoteid number(10) not null,
	category varchar2(20),
	discount number(2),
	times number(5) default 30,
	promotecode varchar2(10) not null unique,
	active_date date,
	expire_date date,
primary key (promoteid),
constraint expiredate_ck check (active_date < expire_date),
constraint discount_ck check (discount >= 1),
constraint times_ck check (times >= 0));

--create indices--
create index address_customerid on address (customerid);
create index orderitem_orderid on orderitem (orderid);
create index orderitem_productid on orderitem (productid);
create index orders_customerid on orders (customerid);

--insert values--
--customer and address
insert into
	customer (customerid, firstname, lastname, email, password)
values(
	customerid_seq.nextval,
	'Syed',
	'Abdullah',
	'asyed126@my.centennialcollege.ca',
	standard_hash('123456'));
insert into
	address (addressid, customerid, address, city, state, zip)
values(
	addressid_seq.nextval,
	customerid_seq.currval,
	'4611 Mapleview Drive',
	'St Petersburg',
	'FL',
	'33701');
insert into
	customer (customerid, firstname, lastname, email, password)
values(
	customerid_seq.nextval,
	'Alvarado',
	'Bernadette',
	'balvara1@my.centennialcollege.ca',
	standard_hash('123456'));
insert into
	address (addressid, customerid, address, city, state, zip)
values(
	addressid_seq.nextval,
	customerid_seq.currval,
	'282 Bottom Lane',
	'Tonawanda',
	'NY',
	'14150');
insert into
	customer (customerid, firstname, lastname, email, password)
values(
	customerid_seq.nextval,
	'Sloan',
	'Curtis',
	'csloan4@my.centennialcollege.ca',
	standard_hash('123456'));
insert into
	address (addressid, customerid, address, city, state, zip)
values(
	addressid_seq.nextval,
	customerid_seq.currval,
	'893 Thunder Road',
	'San Francisco',
	'CA',
	'94111');
insert into
	customer (customerid, firstname, lastname, email, password)
values(
	customerid_seq.nextval,
	'Tan',
	'Terry',
	'jtan73@my.centennialcollege.ca',
	standard_hash('123456'));
insert into
	address (addressid, customerid, address, city, state, zip)
values(
	addressid_seq.nextval,
	customerid_seq.currval,
	'4770 Jefferson Street',
	'Norfolk',
	'VA',
	'23510');
insert into
	customer (customerid, firstname, lastname, email, password)
values(
	customerid_seq.nextval,
	'Li',
	'Jiaxing',
	'jli445@my.centennialcollege.ca',
	standard_hash('123456'));
insert into
	address (addressid, customerid, address, city, state, zip)
values(
	addressid_seq.nextval,
	customerid_seq.currval,
	'2543 Vernon Street',
	'La Mesa',
	'CA',
	'91941');
insert into
	customer (customerid, firstname, lastname, email, password)
values(
	customerid_seq.nextval,
	'Kelawala',
	'Jiya',
	'jkelawal@my.centennialcollege.ca',
	standard_hash('123456'));
insert into
	address (addressid, customerid, address, city, state, zip)
values(
	addressid_seq.nextval,
	customerid_seq.currval,
	'3609 Linden Avenue',
	'Buffalo',
	'ND',
	'58011');
insert into
	customer (customerid, firstname, lastname, email, password)
values(
	customerid_seq.nextval,
	'Min',
	'Katherine',
	'smin9@my.centennialcollege.ca',
	standard_hash('123456'));
insert into
	address (addressid, customerid, address, city, state, zip)
values(
	addressid_seq.nextval,
	customerid_seq.currval,
	'4557 Rafe Lane',
	'Grand Junction',
	'MS',
	'38039');
insert into
	customer (customerid, firstname, lastname, email, password)
values(
	customerid_seq.nextval,
	'Legaspi',
	'Kervin',
	'klegasp3@my.centennialcollege.ca',
	standard_hash('123456'));
insert into
	address (addressid, customerid, address, city, state, zip)
values(
	addressid_seq.nextval,
	customerid_seq.currval,
	'1181 Burke Street',
	'Belmont',
	'LA',
	'71406');
insert into
	customer (customerid, firstname, lastname, email, password)
values(
	customerid_seq.nextval,
	'Hanlan',
	'Matt',
	'mhanlan@my.centennialcollege.ca',
	standard_hash('123456'));
insert into
	address (addressid, customerid, address, city, state, zip)
values(
	addressid_seq.nextval,
	customerid_seq.currval,
	'4415 Chenoweth Drive',
	'Cookeville',
	'TN',
	'38501');
insert into
	customer (customerid, firstname, lastname, email, password)
values(
	customerid_seq.nextval,
	'Joy',
	'Mintu',
	'mvipinjo@my.centennialcollege.ca',
	standard_hash('123456'));
insert into
	address (addressid, customerid, address, city, state, zip)
values(
	addressid_seq.nextval,
	customerid_seq.currval,
	'1597 Del Dew Drive',
	'Oakland',
	'NJ',
	'07436');
--inventory, product, and promotion
insert into
	product (productid, title, cost, retail, category, summary, status)
values(
	productid_seq.nextval,
	'total war: three kingdoms',
	50.00,
	59.99,
	'strategy',
	'Total War: THREE KINGDOMS is the first in the multi award-winning strategy series to recreate epic conflict across ancient China. Combining a gripping turn-based campaign game of empire-building, statecraft and conquest with stunning real-time battles, Total War: THREE KINGDOMS redefines the series in an age of heroes and legends.',
	'average stock level');
insert into
	inventory (inventoryid, productid, quantity, location)
values(
	inventoryid_seq.nextval,
	productid_seq.currval,
	30,
	'010');
insert into
	promotion (promoteid, category, discount, times, promotecode, active_date, expire_date)
values(
	promotionid_seq.nextval,
	'strategy',
	20,
	12,
	'AclnsKi6C0',
	sysdate,
	sysdate + 30);
insert into
	product (productid, title, cost, retail, category, summary, status)
values(
	productid_seq.nextval,
	'american truck simulator',
	10,
	19.99,
	'simulation',
	'Experience legendary American trucks and deliver various cargoes across sunny California, sandy Nevada, and the Grand Canyon State of Arizona. American Truck Simulator takes you on a journey through the breathtaking landscapes and widely recognized landmarks around the States.',
	'high stock level');
insert into
	inventory (inventoryid, productid, quantity, location)
values(
	inventoryid_seq.nextval,
	productid_seq.currval,
	50,
	'020');
insert into
	promotion (promoteid, category, discount, times, promotecode, active_date, expire_date)
values(
	promotionid_seq.nextval,
	'simulation',
	10,
	2,
	'AclnsKi6C1',
	to_date('2019-9-30', 'YYYY-MM-DD'),
	to_date('2019-9-30', 'YYYY-MM-DD') + 15);
insert into
	product (productid, title, cost, retail, category, summary, status)
values(
	productid_seq.nextval,
	'grand theft auto v',
	50,
	99.99,
	'action',
	'When a young street hustler, a retired bank robber and a terrifying psychopath find themselves entangled with some of the most frightening and deranged elements of the criminal underworld, the U.S. government and the entertainment industry, they must pull off a series of dangerous heists to survive in a ruthless city in which they can trust nobody, least of all each other.
',
	'limited stock level');
insert into
	inventory (inventoryid, productid, quantity, location)
values(
	inventoryid_seq.nextval,
	productid_seq.currval,
	10,
	'012');
insert into
	promotion (promoteid, category, discount, times, promotecode, active_date, expire_date)
values(
	promotionid_seq.nextval,
	'action',
	60,
	1,
	'AclnsKi6C2',
	to_date('2019-12-30', 'YYYY-MM-DD'),
	to_date('2019-12-30', 'YYYY-MM-DD') + 60);
insert into
	product (productid, title, cost, retail, category, summary, status)
values(
	productid_seq.nextval,
	'red dead redemption 2',
	50,
	99.99,
	'action',
	'Arthur Morgan and the Van der Linde gang are outlaws on the run. With federal agents and the best bounty hunters in the nation massing on their heels, the gang must rob, steal and fight their way across the rugged heartland of America in order to survive. As deepening internal divisions threaten to tear the gang apart, Arthur must make a choice between his own ideals and loyalty to the gang who raised him.',
	'low stock level');
insert into
	inventory (inventoryid, productid, quantity, location)
values(
	inventoryid_seq.nextval,
	productid_seq.currval,
	20,
	'012');
insert into
	promotion (promoteid, category, discount, times, promotecode, active_date, expire_date)
values(
	promotionid_seq.nextval,
	'action',
	40,
	2,
	'AclnsKi6C3',
	to_date('2020-1-30', 'YYYY-MM-DD'),
	to_date('2020-1-30', 'YYYY-MM-DD') + 60);
insert into
	product (productid, title, cost, retail, category, summary, status)
values(
	productid_seq.nextval,
	'cyberpunk 2077',
	40,
	59.99,
	'RPG',
	'Cyberpunk 2077 is an open-world, action-adventure story set in Night City, a megalopolis
obsessed with power, glamour and body modification. You play as V, a mercenary outlaw going after a one-of-a-kind implant that is the key to immortality. You can customize your character¡¯s cyberware, skillset and playstyle, and explore a vast city where the choices you make shape the story and the world around you.',
	'average stock level');
insert into
	inventory (inventoryid, productid, quantity, location)
values(
	inventoryid_seq.nextval,
	productid_seq.currval,
	40,
	'013');
insert into
	promotion (promoteid, category, discount, times, promotecode, active_date, expire_date)
values(
	promotionid_seq.nextval,
	'RPG',
	20,
	1,
	'AclnsKi6C4',
	to_date('2020-12-30', 'YYYY-MM-DD'),
	to_date('2020-12-30', 'YYYY-MM-DD') + 30);
insert into
	product (productid, title, cost, retail, category, summary, status)
values(
	productid_seq.nextval,
	'sid meier¡¯s civilization? VI',
	50,
	167.91,
	'strategy',
	'Originally created by legendary game designer Sid Meier, Civilization is a turn-based strategy game in which you attempt to build an empire to stand the test of time. Become Ruler of the World by establishing and leading a civilization from the Stone Age to the Information Age. Wage war, conduct diplomacy, advance your culture, and go head-to-head with history¡¯s greatest leaders as you attempt to build the greatest civilization the world has ever known.
',
	'high stock level');
insert into
	inventory (inventoryid, productid, quantity, location)
values(
	inventoryid_seq.nextval,
	productid_seq.currval,
	60,
	'021');
insert into
	promotion (promoteid, category, discount, times, promotecode, active_date, expire_date)
values(
	promotionid_seq.nextval,
	'strategy',
	76,
	10,
	'AclnsKi6C5',
	to_date('2016-10-21', 'YYYY-MM-DD'),
	to_date('2016-10-21', 'YYYY-MM-DD') + 15);
insert into
	product (productid, title, cost, retail, category, summary, status)
values(
	productid_seq.nextval,
	'hunt: showdown',
	40,
	63.95,
	'action',
	'The year is 1895, and you are a Hunter tasked with eliminating the savage, nightmarish monsters that have infested the Louisiana Bayou. Play alone or in teams of two or three, as you search for clues to help you track your target and compete against other Hunters who are after the same reward. Kill and banish your target, collect the bounty, and then get ready for the showdown; once the bounty is in your hands every other Hunter on the map will be after your prize. Show no mercy as you fight through a dark, ruthless world with brutal, period-inspired weapons, as you level up, unlock gear, and collect experience and gold for your Bloodline.',
	'average stock level');
insert into
	inventory (inventoryid, productid, quantity, location)
values(
	inventoryid_seq.nextval,
	productid_seq.currval,
	40,
	'012');
insert into
	promotion (promoteid, category, discount, times, promotecode, active_date, expire_date)
values(
	promotionid_seq.nextval,
	'action',
	54,
	5,
	'AclnsKi6C6',
	to_date('2019-8-27', 'YYYY-MM-DD'),
	to_date('2019-8-27', 'YYYY-MM-DD') + 30);
insert into
	product (productid, title, cost, retail, category, summary, status)
values(
	productid_seq.nextval,
	'sniper elite 4',
	60,
	89.99,
	'action',
	'Discover unrivalled sniping freedom in the largest and most advanced World War 2 shooter ever built. Experience tactical third-person combat, gameplay choice and epic longshots across gigantic levels as you liberate wartime Italy from the grip of Fascism.',
	'average stock level');
insert into
	inventory (inventoryid, productid, quantity, location)
values(
	inventoryid_seq.nextval,
	productid_seq.currval,
	44,
	'012');
insert into
	promotion (promoteid, category, discount, times, promotecode, active_date, expire_date)
values(
	promotionid_seq.nextval,
	'action',
	18,
	20,
	'AclnsKi6C7',
	to_date('2017-2-14', 'YYYY-MM-DD'),
	to_date('2017-2-14', 'YYYY-MM-DD') + 60);
insert into
	product (productid, title, cost, retail, category, summary, status)
values(
	productid_seq.nextval,
	'microsoft flight simulator',
	50,
	119.99,
	'simulation',
	'From light planes to wide-body jets, fly highly detailed and accurate aircraft in the next generation of Microsoft Flight Simulator. Test your piloting skills against the challenges of night flying, real-time atmospheric simulation and live weather in a dynamic and living world. Create your flight plan to anywhere on the planet. Microsoft Flight Simulator includes 20 highly detailed planes with unique flight models and 30 hand-crafted airports.',
	'high stock level');
insert into
	inventory (inventoryid, productid, quantity, location)
values(
	inventoryid_seq.nextval,
	productid_seq.currval,
	70,
	'020');
insert into
	product (productid, title, cost, retail, category, summary, status)
values(
	productid_seq.nextval,
	'forza horizon 4',
	40,
	99.99,
	'racing',
	'Dynamic seasons change everything at the world¡¯s greatest automotive festival. Go it alone or team up with others to explore beautiful and historic Britain in a shared open world. Collect, modify and drive over 450 cars. Race, stunt, create and explore ¨C choose your own path to become a Horizon Superstar.',
	'average stock level');
insert into
	inventory (inventoryid, productid, quantity, location)
values(
	inventoryid_seq.nextval,
	productid_seq.currval,
	42,
	'010');
--orders and orderitem
insert into
	orders (orderid, customerid, status, payment_type, order_date, ship_date, ship_street, ship_city, ship_state, ship_zip)
values(
	orderid_seq.nextval,
	100,
	'confirmed',
	'debit',
	to_date('2019-11-30', 'YYYY-MM-DD'),
	to_date('2019-11-30', 'YYYY-MM-DD') + 11,
	'4611 Mapleview Drive',
	'St Petersburg',
	'FL',
	'33701');
insert into
	orderitem (orderitemid, orderid, productid, quantity)
values(
	orderitemid_seq.nextval,
	orderid_seq.currval,
	100,
	1);
insert into
	orders (orderid, customerid, status, payment_type, order_date, ship_date, ship_street, ship_city, ship_state, ship_zip)
values(
	orderid_seq.nextval,
	101,
	'confirmed',
	'debit',
	to_date('2018-6-30', 'YYYY-MM-DD'),
	to_date('2018-6-30', 'YYYY-MM-DD') + 10,
	'282 Bottom Lane',
	'Tonawanda',
	'NY',
	'14150');
insert into
	orderitem (orderitemid, orderid, productid, quantity)
values(
	orderitemid_seq.nextval,
	orderid_seq.currval,
	101,
	2);
insert into
	orders (orderid, customerid, status, payment_type, order_date, ship_date, ship_street, ship_city, ship_state, ship_zip)
values(
	orderid_seq.nextval,
	102,
	'confirmed',
	'credit',
	to_date('2017-2-28', 'YYYY-MM-DD'),
	to_date('2017-2-28', 'YYYY-MM-DD') + 8,
	'893 Thunder Road',
	'San Francisco',
	'CA',
	'94111');
insert into
	orderitem (orderitemid, orderid, productid, quantity)
values(
	orderitemid_seq.nextval,
	orderid_seq.currval,
	102,
	4);
insert into
	orders (orderid, customerid, status, payment_type, order_date, ship_date, ship_street, ship_city, ship_state, ship_zip)
values(
	orderid_seq.nextval,
	103,
	'confirmed',
	'credit',
	to_date('2021-3-10', 'YYYY-MM-DD'),
	to_date('2021-3-10', 'YYYY-MM-DD') + 2,
	'4770 Jefferson Street',
	'Norfolk',
	'VA',
	'23510');
insert into
	orderitem (orderitemid, orderid, productid, quantity)
values(
	orderitemid_seq.nextval,
	orderid_seq.currval,
	103,
	1);
insert into
	orders (orderid, customerid, status, payment_type, order_date, ship_date, ship_street, ship_city, ship_state, ship_zip)
values(
	orderid_seq.nextval,
	104,
	'confirmed',
	'credit',
	to_date('2017-2-14', 'YYYY-MM-DD'),
	to_date('2017-2-14', 'YYYY-MM-DD') + 2,
	'2543 Vernon Street',
	'La Mesa',
	'CA',
	'91941');
insert into
	orderitem (orderitemid, orderid, productid, quantity)
values(
	orderitemid_seq.nextval,
	orderid_seq.currval,
	104,
	1);
insert into
	orders (orderid, customerid, status, payment_type, order_date, ship_date, ship_street, ship_city, ship_state, ship_zip)
values(
	orderid_seq.nextval,
	105,
	'confirmed',
	'credit',
	to_date('2020-9-11', 'YYYY-MM-DD'),
	to_date('2020-9-11', 'YYYY-MM-DD') + 4,
	'3609 Linden Avenue',
	'Buffalo',
	'ND',
	'58011');
insert into
	orderitem (orderitemid, orderid, productid, quantity)
values(
	orderitemid_seq.nextval,
	orderid_seq.currval,
	105,
	2);
insert into
	orders (orderid, customerid, status, payment_type, order_date, ship_date, ship_street, ship_city, ship_state, ship_zip)
values(
	orderid_seq.nextval,
	106,
	'confirmed',
	'credit',
	to_date('2020-12-30', 'YYYY-MM-DD'),
	to_date('2020-12-30', 'YYYY-MM-DD') + 4,
	'4557 Rafe Lane',
	'Grand Junction',
	'MS',
	'38039');
insert into
	orderitem (orderitemid, orderid, productid, quantity)
values(
	orderitemid_seq.nextval,
	orderid_seq.currval,
	106,
	1);
insert into
	orders (orderid, customerid, status, payment_type, order_date, ship_date, ship_street, ship_city, ship_state, ship_zip)
values(
	orderid_seq.nextval,
	107,
	'confirmed',
	'paypal',
	to_date('2020-1-2', 'YYYY-MM-DD'),
	to_date('2020-1-2', 'YYYY-MM-DD') + 10,
	'1181 Burke Street',
	'Belmont',
	'LA',
	'71406');
insert into
	orderitem (orderitemid, orderid, productid, quantity)
values(
	orderitemid_seq.nextval,
	orderid_seq.currval,
	107,
	5);
insert into
	orders (orderid, customerid, status, payment_type, order_date, ship_date, ship_street, ship_city, ship_state, ship_zip)
values(
	orderid_seq.nextval,
	108,
	'confirmed',
	'paypal',
	to_date('2018-6-2', 'YYYY-MM-DD'),
	to_date('2018-6-2', 'YYYY-MM-DD') + 2,
	'4415 Chenoweth Drive',
	'Cookeville',
	'TN',
	'38501');
insert into
	orderitem (orderitemid, orderid, productid, quantity)
values(
	orderitemid_seq.nextval,
	orderid_seq.currval,
	108,
	1);
insert into
	orders (orderid, customerid, status, payment_type, order_date, ship_date, ship_street, ship_city, ship_state, ship_zip)
values(
	orderid_seq.nextval,
	109,
	'confirmed',
	'bitcoin',
	to_date('2019-12-05', 'YYYY-MM-DD'),
	to_date('2019-12-05', 'YYYY-MM-DD') + 2,
	'1597 Del Dew Drive',
	'Oakland',
	'NJ',
	'07436');
insert into
	orderitem (orderitemid, orderid, productid, quantity)
values(
	orderitemid_seq.nextval,
	orderid_seq.currval,
	109,
	1);
--more orderitem
insert into
	orderitem (orderitemid, orderid, productid, quantity)
values(
	orderitemid_seq.nextval,
	103,
	105,
	1);
insert into
	orderitem (orderitemid, orderid, productid, quantity)
values(
	orderitemid_seq.nextval,
	109,
	105,
	1);
insert into
	orderitem (orderitemid, orderid, productid, quantity)
values(
	orderitemid_seq.nextval,
	105,
	104,
	1);
insert into
	orderitem (orderitemid, orderid, productid, quantity)
values(
	orderitemid_seq.nextval,
	105,
	104,
	1);
insert into
	orderitem (orderitemid, orderid, productid, quantity)
values(
	orderitemid_seq.nextval,
	101,
	104,
	1);
insert into
	orderitem (orderitemid, orderid, productid, quantity)
values(
	orderitemid_seq.nextval,
	101,
	105,
	1);
commit;

--triggers--
--keep quantity in inventory identical with quantity in orderitem
create or replace trigger update_inventory_quantity
for insert or update of quantity on orderitem
compound trigger
type type_inventory_quantity is record (productid inventory.productid%type, inventory_quantity inventory.quantity%type);
inventory_info type_inventory_quantity;
type type_order_quantity is record (productid orderitem.productid%type, order_quantity orderitem.quantity%type);
type orderitem_info is table of type_order_quantity index by binary_integer;
orderitem_info_list orderitem_info;
total_order_quantity number := 0;
new_quantity number;
before each row is
begin
	select
		productid,
		quantity
	into
		inventory_info
	from
		inventory
	where
		productid = :new.productid;
end before each row;
after statement is
begin
	select
		productid,
		sum(quantity)
	bulk collect into
		orderitem_info_list
	from
		orderitem
	group by
		productid;
	for i in orderitem_info_list.first..orderitem_info_list.last loop
		if orderitem_info_list(i).productid = inventory_info.productid then
			total_order_quantity := total_order_quantity + orderitem_info_list(i).order_quantity;
		end if;
	end loop;
	new_quantity := inventory_info.inventory_quantity - total_order_quantity;
	dbms_output.put_line(inventory_info.productid);
	dbms_output.put_line(inventory_info.inventory_quantity);
	dbms_output.put_line(total_order_quantity);
	dbms_output.put_line(new_quantity);
	update
		inventory
	set
		quantity = new_quantity
	where
		productid = inventory_info.productid;
end after statement;
end;
/
--keep status identical with quantity in inventory
create or replace trigger update_product_status
after insert or update of quantity on inventory
for each row
declare
pragma autonomous_transaction;
type type_quantity is record (productid inventory.productid%type, inventory_quantity inventory.quantity%type);
inventory_info type_quantity;
product_status product.status%type;
begin
	select
		productid,
		:new.quantity
	into
		inventory_info
	from
		inventory
	where
		productid = :new.productid;
	if inventory_info.inventory_quantity = 0 then
		product_status := 'out of stock';
	elsif inventory_info.inventory_quantity > 0 and inventory_info.inventory_quantity <= 10 then
		product_status := 'limited stock level';
	elsif inventory_info.inventory_quantity > 10 and inventory_info.inventory_quantity <= 20 then
		product_status := 'low stock level';
	elsif inventory_info.inventory_quantity > 20 and inventory_info.inventory_quantity <= 40 then
		product_status := 'average stock level';
	else
		product_status := 'high stock level';
	end if;
	dbms_output.put_line(inventory_info.productid);
	dbms_output.put_line(inventory_info.inventory_quantity);
	dbms_output.put_line(product_status);
	update
		product
	set
		status = product_status
	where
		productid = inventory_info.productid;
	commit;
end;
/

--procedures--
--judge validation of promotion code
create or replace procedure valid_code (input_category in promotion.category%type, code in promotion.promotecode%type, available out boolean) is
type type_info is record (expire_date promotion.expire_date%type, times promotion.times%type);
info type_info;
begin
	available := false;
	select
		expire_date,
		times
	into
		info
	from
		promotion
	where
		category = input_category
	and
		promotecode = code;
	if info.times > 0 and info.expire_date >= sysdate then
		available := true;
	end if;
exception
	when no_data_found then
		dbms_output.put_line('invalid promotion code or category');
end;
/
--price after discount
create or replace procedure after_discount (total in product.retail%type, discount in promotion.discount%type, final_total out product.retail%type) is
begin
	final_total := total - total * discount / 100;
end;
/

--functions--
create or replace function order_payment (input_orderid in orderitem.orderid%type, promote_category in promotion.category%type, code in promotion.promotecode%type) return number is
type type_info is record (productid orderitem.productid%type, category product.category%type, order_quantity orderitem.quantity%type, retail product.retail%type);
type type_info_list is table of type_info;
info_list type_info_list;
invalid_id exception;
code_available boolean;
product_discount number;
item_price number;
payment number := 0;
begin
	valid_code(promote_category, code, code_available);
	select
		productid,
		category,
		quantity,
		retail
	bulk collect into
		info_list
	from
		(select
			productid,
			sum(quantity) as quantity
		from
			orderitem
		where
			orderid = input_orderid
		group by
			productid)
	join
		product
	using
		(productid);
	if not info_list.exists(1) then
		raise invalid_id;
	end if;
	if code_available then
		select
			discount
		into
			product_discount
		from
			promotion
		where
			promotecode = code;
		update
			promotion
		set
			times = times - 1
		where
			promotecode = code;
		commit;
	end if;
	for i in 1..info_list.count loop
		if code_available and info_list(i).category = promote_category then
			after_discount(info_list(i).retail * info_list(i).order_quantity, product_discount, item_price);
			payment := payment + item_price;
		else
			payment := payment + info_list(i).retail * info_list(i).order_quantity;
		end if;
	end loop;
	return payment;
exception
	when invalid_id then
		dbms_output.put_line('invalid order id');
end;