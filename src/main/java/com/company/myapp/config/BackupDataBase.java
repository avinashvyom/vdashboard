package com.company.myapp.config;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;

public class BackupDataBase {

	public static void main(String[] args) throws IOException, SQLException, InterruptedException {
		// TODO Auto-generated method stub
		String backupQuery = "BACKUP DATABASE [POC] TO  DISK = N'D:\\dashboard' "
				+ "WITH NOFORMAT, INIT,  NAME = N'POC-Full Database Backup', "
				+ "SKIP, NOREWIND, NOUNLOAD,  STATS = 10";
		DataSourceConfiguration dataSourceConfiguration = new DataSourceConfiguration();
		DataSource ds = dataSourceConfiguration.getDataSource();
		JdbcTemplate jdbcTemplate = new JdbcTemplate(ds);
		jdbcTemplate.execute(backupQuery);
		File file = new File("D:\\dashboard");
		if (file.exists() && file.length() > 0) {
			System.out.println("Backup created successfully at :" + file.getAbsolutePath());
		} else {
			System.out.println("Failed to create backup");
		}
	}
}
