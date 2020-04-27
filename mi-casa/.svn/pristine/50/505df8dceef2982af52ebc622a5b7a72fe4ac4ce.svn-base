package org.habitatnicaragua.micasa.dto.datatable;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.web.bind.ServletRequestUtils;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class SolicitudDataTable {	
	private Integer draw;
	private Integer start;
	private Integer length;
	private Integer order0Column;
	private Direction order0Dir;
	private String searchValue;
	private List<String> columnsData = new ArrayList<>(50);
	
	public SolicitudDataTable(HttpServletRequest request){
		draw = ServletRequestUtils.getIntParameter(request, "draw", 0);
		start = ServletRequestUtils.getIntParameter(request, "start", 0);
		
		length = ServletRequestUtils.getIntParameter(request, "length", 10);
		if(length<=0) length=10;
		
		order0Column = ServletRequestUtils.getIntParameter(request, "order[0][column]", 0);
		
		String direccionRequest = ServletRequestUtils.getStringParameter(request,"order[0][dir]","ASC");
		if("ASC".equalsIgnoreCase(direccionRequest)){
			order0Dir = Direction.ASC;
		} else {
			order0Dir = Direction.DESC;
		}
		
		searchValue = ServletRequestUtils.getStringParameter(request,"search[value]", null);
		
		for(int i=0;;i++){
			String columnData = ServletRequestUtils.getStringParameter(request, "columns[" + i + "][data]",null);
			if(columnData==null) break;
			if(i>200) break;
			columnsData.add(columnData);
		}
	}
	
	public Pageable getSpringPageRequest() {
		return new PageRequest(start/length, length, order0Dir, columnsData.get(order0Column));
	}

	public Pageable getSpringPageRequest(Sort sort) {
		return new PageRequest(start/length, length, sort);
	}
}
