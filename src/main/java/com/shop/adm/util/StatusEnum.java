package com.shop.adm.util;

import java.util.HashMap;
import java.util.Map;

public enum StatusEnum {
    NONE(0, "None"),
	ACTIVE(1, "Active"),
	INACTIVE(2, "In Active");
	private Integer                                 value;
    private String                                  description;
    private static Map<Integer, StatusEnum> map = new HashMap<Integer, StatusEnum>();
    
    static {
        for (StatusEnum state : StatusEnum.values()) {
            map.put(state.value, state);
        }
    }
    
    public static StatusEnum valueOf(int state) {
        return map.get(state);
    }
    
    private StatusEnum(Integer value, String description) {
        this.value = value;
        this.description = description;
    }

	public Integer getValue() {
		return value;
	}

	public void setValue(Integer value) {
		this.value = value;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
    
}
