package  com.suntek.gztpb.util;

import java.text.SimpleDateFormat;
import java.util.Calendar;

import org.apache.commons.dbcp.BasicDataSource;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.support.JdbcDaoSupport;


/**
 * @author zxy
 */
public class IdGenerator extends JdbcDaoSupport {
	private static IdGenerator idGenerator = new IdGenerator();;

	private IdGenerator() {
		// do noting
	}

	public static IdGenerator getInstance() {
		return idGenerator;
	}

	/**
	 * ���32uuid
	 * @return
	 */
	public String getUuid() {
		String uuid = java.util.UUID.randomUUID().toString();

		uuid = uuid.substring(0, 8) + uuid.substring(9, 13)
				+ uuid.substring(14, 18) + uuid.substring(19, 23)
				+ uuid.substring(24);
		return uuid;
	}
	

	public synchronized long getSeq(String seqCode, String seqDesc)
			throws Exception {
		final String SYS_SEQ_TABLENAME = "ITMS_SEQ";
//		JdbcTemplate jdbcTemplate = DaoFactory.getJdbc(Constants.APP_NAME);

		  ApplicationContext ctx = new ClassPathXmlApplicationContext("../spring3-servlet.xml");
		  System.out.println("***02");
		  BasicDataSource db = (BasicDataSource)ctx.getBean("dataSource");
		  System.out.println(db.getPassword()); 
		  JdbcTemplate jdbcTemplate = (JdbcTemplate)ctx .getBean("JdbcTemplate");   
		  
		long seqValue = -1;

		try {
			String sqlStr = "select SEQ_VALUE from " + SYS_SEQ_TABLENAME
					+ " where SEQ_CODE='" + seqCode + "'";
			
			System.out.println("****sql=" + sqlStr);
			try {
				seqValue = jdbcTemplate.queryForLong(sqlStr);
			} catch (EmptyResultDataAccessException e) {

			}

			if (seqValue > 0) {
				seqValue = seqValue + 1;
				sqlStr = "update " + SYS_SEQ_TABLENAME
						+ " set SEQ_VALUE = SEQ_VALUE + 1 where SEQ_CODE='"
						+ seqCode + "'";
				jdbcTemplate.execute(sqlStr);
			} else {
				seqValue = 1;
				sqlStr = "insert into " + SYS_SEQ_TABLENAME
						+ "(SEQ_CODE, SEQ_VALUE, SEQ_DESC) values";
				sqlStr += "('" + seqCode + "', 1, '" + (seqDesc) + "')";
				jdbcTemplate.execute(sqlStr);
			}
		} catch (Exception ex) {
			throw new Exception(ex);
		}

		return seqValue;
	}
	
	

	public long getSeq()
			throws Exception {
		final String code = "ITMS_SEQ";
		final String desc = "ITMS_SEQ";
		return getSeq(code,desc);
	}
	

	private String getFormatStringSeq(int length, String seqCode) throws Exception{
	    String rawString = String.valueOf(getSeq(seqCode,seqCode));
		int rawLength = rawString.length();
	    if(rawLength >= length){
	    	return rawString;
	    }else{
	    	for (; rawLength < length; rawLength++) { 
	    		 rawString = "0" + rawString; 
	    	}
	    	return rawString;
	    }
	}
	

	public String getBizCode(String bizType,int subSeqLen) throws Exception{
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat formatter = new SimpleDateFormat("yyMMdd");
		String nowStr=formatter.format(cal.getTime());

		return nowStr + getFormatStringSeq(subSeqLen,bizType + "@" +  nowStr );
	}
}