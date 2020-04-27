package org.habitatnicaragua.micasa.dao;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class ComunDao {

	@Inject
	private NamedParameterJdbcTemplate jdbcTemplate;
	
	public String getUser(){
		return this.jdbcTemplate.queryForObject("SELECT current_user", (Map<String, ?>)null, String.class);
	}
	
	public Date getSysDate(){
		return this.jdbcTemplate.queryForObject("SELECT now()", (Map<String, ?>)null, Date.class);
	}
	
	public Timestamp getSysDateTime(){
		return this.jdbcTemplate.queryForObject("SELECT now()", (Map<String, ?>)null, Timestamp.class);
	}
}
