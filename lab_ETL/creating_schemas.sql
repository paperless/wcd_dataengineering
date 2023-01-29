USE WCD_LAB;
CREATE SCHEMA IF NOT EXISTS WALMART_ANS;

CREATE TABLE IF NOT EXISTS WALMART_ANS.CALENDAR_DIM
(
	cal_dt date NOT NULL, 
	cal_type_name varchar(30),
	day_of_wk_num integer,
	year_num integer, 
	week_num integer,
	year_wk_num integer,
	month_num integer,
	year_month_num integer,
	qtr_num integer,
	yr_qtr_num integer,
	update_time timestamp DEFAULT current_timestamp
);
--DROP TABLE IF EXISTS WALMART_ANS.STORE_DIM;
CREATE TABLE IF NOT EXISTS WALMART_ANS.STORE_DIM
(
	store_key integer NOT NULL,
	store_name varchar(150),
	status_code varchar(10),
	status_cd_name varchar(50),
	open_dt date,
	close_dt date,
	addr varchar(50),
	city varchar(100),
	region varchar(30),
	cntry_cd integer,
	cntry_nm varchar(30),
	postal_zip_cd integer,
	prov_name varchar(50),
	prov_code integer,
	market_key integer,
	market_name varchar(150),
	submarket_key integer,
	submarket_name varchar(150),
	latitude number(38,2),
	longitude number(38,2),
	tlog_active_flg boolean,
	start_date date,
	end_date date,
	update_time timestamp DEFAULT current_timestamp
);
--DROP TABLE IF EXISTS WALMART_ANS.PRODUCT_DIM;
CREATE TABLE IF NOT EXISTS WALMART_ANS.PRODUCT_DIM
(
	prod_key integer NOT NULL,
	prod_name varchar(30),
	vol number(38,2),
	wgt number(38,2),
	brand_name varchar(30),
	status_code integer,
	status_code_name varchar(30),
	category_key integer,
	category_name varchar(30),
	subcategory_key integer,
	subcategory_name varchar(30),
	tlog_active_flg boolean,
	start_date date,
	end_date date,
	update_time timestamp DEFAULT current_timestamp
);
CREATE TABLE IF NOT EXISTS WALMART_ANS.SALES_INV_STORE_DY
(
	cal_dt date,
	store_key integer,
	prod_key integer,
	sales_qty number(38,2),
	sales_price number(38,2),
	sales_amt number(38,2),
	discount number(38,2),
	sales_cost number(38,2),
	sales_mgrn number(38,2),
	stock_on_hand_qty number(38,2),
	ordered_stock_qty number(38,2),
	out_of_stock_flg boolean,
	in_stock_flg boolean,
	low_stock_flg boolean,
	update_time timestamp DEFAULT current_timestamp
);
CREATE TABLE IF NOT EXISTS WALMART_ANS.SALES_INV_STORE_WK
(
	yr_num integer,
	wk_num integer,
	store_key integer,
	prod_key integer,
	wk_sales_qty number(38,2),
	avg_sales_price number(38,2),
	wk_sales_amt number(38,2),
	wk_discount number(38,2),
	wk_sales_cost number(38,2),
	wk_sales_mgrn number(38,2),
	eop_stock_on_hand_qty number(38,2),
	eop_ordered_stock_qty number(38,2),
	out_of_stock_times integer,
	in_stock_times integer,
	low_stock_times integer,
	update_time timestamp DEFAULT current_timestamp
)

