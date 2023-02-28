-- Database Creation 

create database lab4_ecommerce;
use lab4_ecommerce;


-- 1. You are required to create tables for supplier,customer,category,product,supplier_pricing,order,rating to store the data for the E-commerce.

create table `supplier`(
`supp_id` int primary key,
`supp_name` varchar(50) not null,
`supp_city` varchar(50) not null,
`supp_phone` varchar(50) not null
);
desc `supplier`;
select * from `supplier`;

create table `customer`(
`cus_id` int primary key,
`cus_name` varchar(20) not null,
`cus_phone` varchar(10) not null,
`cus_city` varchar(30) not null,
`cus_gender` char
);
desc `customer`;
select * from `customer`;

create table `category`(
`cat_id` int primary key,
`cat_name` varchar(20) not null
);
desc `category`;
select * from `category`;

create table `product`(
`pro_id` int primary key,
`pro_name` varchar(20) not null default "Dummy Product",
`pro_desc` varchar(60),
`cat_id` int not null,
foreign key (`cat_id`) references category (`cat_id`)
);
desc `product`;
select * from `product`;

create table `supplier_pricing`(
`pricing_id` int primary key,
`pro_id` int not null,
`supp_id` int not null,
`supp_price` int default 0,
foreign key (`pro_id`) references product (`pro_id`),
foreign key (`supp_id`) references supplier (`supp_id`)
);
desc `supplier_pricing`;
select * from `supplier_pricing`;

create table `order`(
`ord_id` int primary key,
`ord_amount` int not null,
`ord_date` date not null,
`cus_id` int not null,
`pricing_id` int not null,
foreign key (`cus_id`) references customer (`cus_id`),
foreign key (`pricing_id`) references supplier_pricing (`pricing_id`)
);
desc `order`;
select * from `order`;

create table `rating`(
`rat_id` int primary key,
`ord_id` int not null,
`rat_ratstars` int not null,
foreign key (`ord_id`) references `order` (`ord_id`)
);
desc `rating`;
select * from `rating`;
