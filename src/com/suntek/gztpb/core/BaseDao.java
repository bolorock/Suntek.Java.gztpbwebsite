package com.suntek.gztpb.core;

import java.util.Map;

import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.simple.SimpleJdbcInsert;
import org.springframework.jdbc.core.support.JdbcDaoSupport;

public class BaseDao extends JdbcDaoSupport{

	/**
	 * 
	 * @param objForSave 要保存的对象
	 * @return
	 */
	public Number saveAndReturnKey(Saveable objForSave){
		return saveAndReturnKey(objForSave, objForSave.getTableName(), objForSave.getKeyColumns());
	}

	public Number saveAndReturnKey(Object objForSave,String tableName,String...keyColumns){
		SimpleJdbcInsert insertActor =   getSimpleJdbcInsert(); 
		insertActor.setTableName(tableName);
		insertActor.usingGeneratedKeyColumns(keyColumns);
		Number newId = insertActor.executeAndReturnKey(new BeanPropertySqlParameterSource(objForSave)) ;
		traceSql(insertActor.getInsertString());
		return newId;
	}

	public void save(Saveable objForSave){
		SimpleJdbcInsert insertActor =   getSimpleJdbcInsert(); 
		insertActor.setTableName(objForSave.getTableName());
		insertActor.execute(new BeanPropertySqlParameterSource(objForSave)) ;
		traceSql(insertActor.getInsertString());
	}

	public void save(Object objForSave,String tableName){
		SimpleJdbcInsert insertActor =   getSimpleJdbcInsert(); 
		insertActor.setTableName(tableName);
		insertActor.execute(new BeanPropertySqlParameterSource(objForSave)) ;
		traceSql(insertActor.getInsertString());
	}
	
	public void save(Object objForSave,String tableName,String...keyColumns){
		SimpleJdbcInsert insertActor =   getSimpleJdbcInsert(); 
		insertActor.setTableName(tableName);
		insertActor.execute(new BeanPropertySqlParameterSource(objForSave)) ;
		traceSql(insertActor.getInsertString());
	}
	/**
	 * 
	 * @param objForSave
	 * @param tableName
	 * @param columnAndValue
	 * @param keyColumns
	 * @return
	 */
	public Number saveAndReturnKey(String tableName,Map<String,Object> columnAndValue,String...keyColumns){
		SimpleJdbcInsert insertActor =   getSimpleJdbcInsert(); 
		insertActor.setTableName(tableName);
		insertActor.usingGeneratedKeyColumns(keyColumns);
		Number newId = insertActor.executeAndReturnKey(columnAndValue) ;
		traceSql(insertActor.getInsertString());
		return newId;
	}
	//----tools
	public SimpleJdbcInsert getSimpleJdbcInsert(){
		return new  SimpleJdbcInsert(getJdbcTemplate());
	}
	public SimpleJdbcInsert getSimpleJdbcInsert(String tableName){
		return new   SimpleJdbcInsert(getJdbcTemplate());
	}
	
   
	
	public void traceSql(String sql){
		System.out.println("JDBC:"+sql);
	}
}
