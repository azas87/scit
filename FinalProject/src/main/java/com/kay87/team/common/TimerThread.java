package com.kay87.team.common;

import java.util.Calendar;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class TimerThread extends Thread implements ServletContextListener{
	boolean isRefresh = true;
	@Override
	public void contextInitialized(ServletContextEvent sce) {
		// TODO Auto-generated method stub
		System.out.println("server start");
		reFresh reFresh = new reFresh();
		reFresh.start();
	}

	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		// TODO Auto-generated method stub
		System.out.println("server start");
		isRefresh = false;
	}
	
	class reFresh extends Thread {
	    public reFresh(){
	    }

	    public void run()
	    {
	    	Calendar calendar = Calendar.getInstance(); // 싱글톤
			int day = calendar.get(Calendar.DATE);
			System.out.println("day = " + day+", now = " + calendar.get(Calendar.DATE));
			while(isRefresh)
			{
				try {
					Thread.sleep(1000);
				} catch (InterruptedException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				if(day != calendar.get(Calendar.DATE))
				{
					//refresh
					System.out.println("refresh!!!");
					day = calendar.get(Calendar.DATE);
				}
			}
			System.out.println("thread finish");
	    } 
	}
}



