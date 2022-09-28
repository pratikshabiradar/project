package dao;

import java.sql.Connection;
import java.sql.Statement;

public class Tables {
	public static void main(String[] args) {
		try
		{
		Connection con=ConnectionProvider.getCon();
		Statement st=con.createStatement();
		String appUsers ="create table appusers(id int AUTO_INCREMENT primary key,name varchar(100),contactNumber bigint,email varchar(100) UNIQUE,password varchar(100),securityQuestion varchar(200),answer varchar(200),role varchar(20))";
		String medicines = "create table medicines(id int AUTO_INCREMENT primary key,name varchar(200),medicineId varchar(200) UNIQUE,price varchar(50),company varchar(500),description varchar(1000))";
		String equipments = "create table equipments(id int AUTO_INCREMENT primary key,name varchar(200),uses varchar(500),price varchar(50),company varchar(500),description varchar(1000))";
		String departments = "create table departments(id int AUTO_INCREMENT primary key,name varchar(200),description varchar(1000))";
		String doctors = "create table doctors(id int AUTO_INCREMENT primary key,name varchar(200),contactNumber bigint,address varchar(500),email varchar(100) UNIQUE,departmentId varchar(10),specialization varchar(500),yearOfExperience varchar(10),description varchar(1000))";
		}
		catch(Exception e) {
			System.out.println(e);
		}
	}
}
