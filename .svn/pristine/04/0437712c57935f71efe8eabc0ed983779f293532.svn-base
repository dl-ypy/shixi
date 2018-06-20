package com.bonc.pure.web.action.sso;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

public class CloudStorm {
	public static final String[] STEPS = {"1","1.1","1.2","2","2.2","2.2.1","2.2.2","2.3","2.4","2.5","2.6","2.7","9"};
	private static CloudStorm cloudStorm = new CloudStorm();
	private DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	private List<CloudLogItem> logs;
	private Map<String,List<CloudLogItem>> logsSessionIdMap;
	private Date lastIntoDbTime;
	private Date lastClearTime;
	private CloudStorm(){
		this.logs = new ArrayList<CloudLogItem>();
		this.logsSessionIdMap = new HashMap<String,List<CloudLogItem>>();
	}
	
	public static CloudStorm getInstance(){
		return cloudStorm;
	}
	synchronized public void log(String login_id, String session_id,  String if_check, String type_id,  String type_desc){
		CloudLogItem ci = this.buildItem(login_id, session_id, if_check, type_id, type_desc);
		this.logs.add(ci);
		List<CloudLogItem> session_logs = this.logsSessionIdMap.get(session_id);
		if(session_logs == null){
			session_logs = new ArrayList<CloudLogItem>();
			this.logsSessionIdMap.put(session_id, session_logs);
		}
		session_logs.add(ci);
	}
	
	synchronized public void clearLogs(){
		this.logs.clear();
		this.logsSessionIdMap.clear();
		this.lastClearTime = Calendar.getInstance().getTime();
	}
	
	synchronized public int getLogSize(){
		return this.logs.size();
	}
	public Date getLastClearTime(){
		return this.lastClearTime;
	}
	public Date getLastIntoDbTime(){
		return this.lastIntoDbTime;
	}
	/**
	 * 获取超时统计
	 * 0-超时时间ms
	 * 1-步骤超时总数
	 * 2-总时长超时总数
	 * 3。。。各步骤超时个数
	 * @param timeOutLong
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	synchronized public String[] getTimeOutItemCount(long timeOutLong){
		int count = 0;
		int countAllStep = 0;
		Map<String,Integer> step_count = new HashMap<String,Integer>();
		Set session_keys = this.logsSessionIdMap.keySet();
		for(Object key:session_keys){
			List<CloudLogItem> one_session_logs = this.logsSessionIdMap.get(key);
			int one_session_logs_size = one_session_logs.size();
			long first_time = 0;
			for(int i=0;i<one_session_logs_size;i++){
				CloudLogItem cli_1 = one_session_logs.get(i);
				if("1".equals(cli_1.getLog_type())){//记录每次登录第一个节点的时间点，用于计算登录总时长超时
					first_time = cli_1.getTimePoint();
				}
				CloudLogItem cli_2 = null;
				if(i+1 < one_session_logs_size && !"1".equals((cli_2 = one_session_logs.get(i+1)).getLog_type())){
					//如果不是登录操作的最后一个步骤，就计算其与下一步节点之间的时差，如果超时就计数
					if(!"1".equals(cli_2.getLog_type()) && (cli_2.getTimePoint() - cli_1.getTimePoint()) > timeOutLong){
						count ++;
						Integer type_count = step_count.get(cli_1.getLog_type());
						step_count.put(cli_1.getLog_type(), (type_count==null?0:type_count)+1);
					}
				}else{//否则的话就认为是登录操作的最后一个步骤，计算其与第一步之间的时差，如果超时，计数
					if((cli_1.getTimePoint() - first_time) > timeOutLong){
						countAllStep ++;
					}
				}
			}
		}
		String[] result = new String[STEPS.length + 3];
		result[0] = timeOutLong+"";
		result[1] = count+"";
		result[2] = countAllStep+"";
		for(int i=0;i<STEPS.length;i++){
			Integer c = step_count.get(STEPS[i]);
			result[i+3] = (c==null?0:c)+"";
		}
		return result;
	}

	private CloudLogItem buildItem(String login_id, String session_id,  String if_check, String type_id,  String type_desc){
		return new CloudLogItem(login_id, session_id, if_check, type_id, "");
	}
	private class CloudLogItem {
		private String sso_login_id;
		private String sso_session_id;
		private String if_checked;
		private String log_type;
		private String log_type_desc;
		private String server_name;
		private long timePoint ;
		private String log_date;
		
		
		public CloudLogItem(String sso_login_id, String sso_session_id,
				String if_checked, String log_type, String log_type_desc) {
			this.sso_login_id = sso_login_id;
			this.sso_session_id = sso_session_id;
			this.if_checked = if_checked;
			this.log_type = log_type;
			this.log_type_desc = log_type_desc;
			
			this.timePoint = System.currentTimeMillis();
			this.log_date = df.format(Calendar.getInstance().getTime());
		}
		@Override
		public String toString() {
			return "CloudLogItem [sso_login_id=" + sso_login_id
					+ ", sso_session_id=" + sso_session_id + ", if_checked="
					+ if_checked + ", log_type=" + log_type
					+ ", log_type_desc=" + log_type_desc + ", server_name="
					+ server_name + ", timePoint=" + timePoint + ", log_date="
					+ log_date + "]";
		}
		public String getLog_type() {
			return log_type;
		}
		public long getTimePoint() {
			return timePoint;
		}
	}
}
