package com.company.myapp.config;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Properties;

import javax.sql.DataSource;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

@Configuration
public class DataSourceConfiguration {

	File file = new File("C:\\vDashboard\\" + "vdashboard.properties");

	@Bean(name = "dataSource")
	public DataSource getDataSource() throws IOException {
		DriverManagerDataSource dataSource = new DriverManagerDataSource();
		Properties dataSourceProperties = getDataSourceProperties();
		StringBuffer sb = new StringBuffer();
		sb.append("jdbc:sqlserver://");
		sb.append(dataSourceProperties.getProperty("serverName")).append("\\\\")
				.append(dataSourceProperties.getProperty("serverName")).append(":1433;").append("databasename=")
				.append(dataSourceProperties.getProperty("dbName") + ";");
		dataSource.setDriverClassName(dataSourceProperties.getProperty("driverClassName"));
		dataSource.setUrl(sb.toString());
		dataSource.setUsername(dataSourceProperties.getProperty("username"));
		dataSource.setPassword(dataSourceProperties.getProperty("password"));
		return dataSource;
	}
	
	
	public Properties getDataSourceProperties() throws IOException {
		boolean result = file.createNewFile();
		if (result) {
			storeDatabaseProperties(file);
		} else {
		}
		FileInputStream fileInputStream = new FileInputStream(file);
		Properties properties = new Properties();
		properties.load(fileInputStream);
		return properties;
	}

	private void storeDatabaseProperties(File file) throws IOException {
		FileInputStream fis = new FileInputStream(file);
		Properties properties = new Properties();
		properties.load(fis);
		fis.close();
		FileOutputStream fileOutputStream = new FileOutputStream(file);
		properties.setProperty("driverClassName", "com.microsoft.sqlserver.jdbc.SQLServerDriver");
		properties.setProperty("username", "vdashboard");
		properties.setProperty("password", "Pune@123");
		properties.setProperty("serverName", "HOST_NAME");
		properties.setProperty("dbName", "DB_NAME");
		properties.store(fileOutputStream, null);
		fileOutputStream.close();
	}

	// public void getFile() throws IOException {
	// File file = new File(Paths.get(".").toAbsolutePath().toString() + "\\" +
	// "application.properties");
	// boolean result = file.createNewFile();
	// System.out.println(FileSystemView.getFileSystemView().getDefaultDirectory()
	// + "\n"
	// + FileSystemView.getFileSystemView().getHomeDirectory() + "\n"
	// + FileSystemView.getFileSystemView()
	// .createFileObject(Paths.get(System.getProperty("user.dir")).toAbsolutePath().toString()
	// + "\\"
	// + "application.properties")
	// + "\n" + FileSystems.getDefault().getPath("").toAbsolutePath()
	//
	// );
	// System.out.println("current project directory : " +
	// System.getProperty("user.dir"));
	// System.out.println(this.getClass().getClassLoader().getResource("").getPath());
	// String path = this.getClass().getClassLoader().getResource("").getPath();
	// String fullPath = URLDecoder.decode(path, "UTF-8");
	// // FileSystemView.getFileSystemView().getParentDirectory();
	//
	// if (result) {
	// System.out.println("File Created : " + "application.properties" + ", at
	// path :" + file.getAbsolutePath());
	// // return file;
	// } else {
	// System.out.println(
	// "File already exists : " + "application.properties" + "\n at path:" +
	// file.getAbsolutePath());
	// // return file;
	// }
	//
	// FileSystemResource resource = new FileSystemResource(file);
	// // resource.getFile();
	// PropertyPlaceholderConfigurer propertyPlaceholderConfigurer = new
	// PropertyPlaceholderConfigurer();
	// propertyPlaceholderConfigurer.setLocation(resource);
	//
	// }
	//
//	public static void main(String[] args) throws IOException {
//		DataSourceConfiguration dataSourceConfiguration = new DataSourceConfiguration();
//		dataSourceConfiguration.getDataSourceProperties();
//		// dataSourceConfiguration.getDataSourceProperties();
//	}

}
