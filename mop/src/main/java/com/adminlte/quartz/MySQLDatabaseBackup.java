package com.adminlte.quartz;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Properties;

public class MySQLDatabaseBackup {
	
	public void export(){

		try{
			String command = getExportCommand();//拼接shell脚本命令字符串
			Runtime runtime = Runtime.getRuntime();
			runtime.exec(command);//执行shell脚本
			System.out.println("数据库备份成功！");
		}catch(IOException e) {
			System.out.println("数据库备份异常！");
			e.printStackTrace();
		}
	}

	
	public String getExportCommand() throws IOException{
		InputStream is = this.getClass().getClassLoader().getResourceAsStream("/jdbc.properties");//加载属性配置文件

		Properties properties = new Properties();

		properties.load(is);
		StringBuffer command = new StringBuffer();
		String username = properties.getProperty("jdbc.username");// 用户名
		String password = properties.getProperty("jdbc.password");// 用户密码
		String exportDatabaseName = properties.getProperty("jdbc.databaseName");// 需要导出的数据库名
		String host = properties.getProperty("jdbc.host");// 从哪个主机导出数据库，如果没有指定这个值，则默认取localhost
		String port = properties.getProperty("jdbc.port");// 使用的端口号
		String mysqldir = properties.getProperty("jdbc.mysqldir");// 使用的端口号
		String bakdir = properties.getProperty("jdbc.bakdir");// 使用的端口号
		
		//创建以当前日期为名字的sql脚本文件名字
		SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
		String backUpName = date.format(new Date());
		String exportPath = bakdir + "/" +backUpName + ".sql";// 导出路径
		// 注意空格  如果使用了指定服务器的数据库需要负责的授权，因此这个版本只做本地服务器备份
		//linux String[] cmd=new String[]{"/bin/sh ","-c ","/usr/bin/mysqldump -uroot  -padmin minas >/usr/2.sql "};
		//Runtime.getRuntime().exec(cmd);   
		/*
		command.append("cmd.exe "+mysqldir+" /mysqldump -u").append(username)
			.append(" -p")
			.append(password)
			// 密码是用的小p，而端口是用的大P。
			.append(" -h").append(host).append(" -P").append(port)
			.append(" ").append(exportDatabaseName).append(" -r ")
			.append(exportPath);
		*/
		command.append("\""+mysqldir+"/mysqldump\" -u").append(username)
			.append(" -p")
			.append(password)
			// 密码是用的小p，而端口是用的大P。
			//.append(" -h").append(host).append(" -P").append(port)
			.append(" ").append(exportDatabaseName).append(" -r ")
			.append(exportPath);
		
		return command.toString();
	}
	
	//一下的导入没有测试
	public void importSql(String url){
		Runtime runtime = Runtime.getRuntime();
		// 因为在命令窗口进行mysql数据库的导入一般分三步走，所以所执行的命令将以字符串数组的形式出现
		String cmdarray[];
		try {
			cmdarray = getImportCommand(url);
			Process process = runtime.exec(cmdarray[0]);
			// 执行了第一条命令登录到mysql
			// 进程执行后面的代码
			OutputStream os = process.getOutputStream();
			OutputStreamWriter writer = new OutputStreamWriter(os);
			// 选择数据库和要放在一起执行
			writer.write(cmdarray[1] + "\r\n" + cmdarray[2]);
			writer.flush();
			writer.close();
			os.close();
			System.out.println("数据库还原成功！");
		} catch (IOException e) {
			System.out.println("数据库还原异常！");
			e.printStackTrace();
		}
	}

	private String[] getImportCommand(String path) throws IOException {
		InputStream is = MySQLDatabaseBackup.class.getClassLoader().getResourceAsStream("/jdbc.properties");//加载属性配置文件
		Properties properties = new Properties();
		properties.load(is);
		String username = properties.getProperty("user");// 用户名
		String password = properties.getProperty("password");// 用户密码
		String exportDatabaseName = properties.getProperty("databaseName");// 需要导出/入的数据库名
		String host = properties.getProperty("host");// 从哪个主机导出数据库，如果没有指定这个值，则默认取localhost
		String port = properties.getProperty("port");// 使用的端口号
		String Url = properties.getProperty("Url");
		// 第一步，获取登录命令语句
		String loginCommand = new StringBuffer().append("mysql -u")
				.append(username).append(" -p").append(password).append(" -h")
				.append(host).append(" -P").append(port).toString();
				// 第二步，获取切换数据库到目标数据库的命令语句
				String switchCommand = new StringBuffer("use ").append(exportDatabaseName).toString();
				// 第三步，获取导入的命令语句
				String importCommand = new StringBuffer("source ").append(Url).append(path).toString();
				// 需要返回的命令语句数组
				String[] commands = new String[] { loginCommand, switchCommand,
					importCommand };
			return commands;

	}

	
}
