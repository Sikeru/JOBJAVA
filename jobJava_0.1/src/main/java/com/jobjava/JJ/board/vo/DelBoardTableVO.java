package com.jobjava.JJ.board.vo;

import org.springframework.stereotype.Component;

public class DelBoardTableVO {
	private String BOARD_NO;
	private String BOARD_FILENAME;
	
	public String getBOARD_NO() {
		return BOARD_NO;
	}
	public void setBOARD_NO(String bOARD_NO) {
		BOARD_NO = bOARD_NO;
	}
	public String getBOARD_FILENAME() {
		return BOARD_FILENAME;
	}
	public void setBOARD_FILENAME(String bOARD_FILENAME) {
		BOARD_FILENAME = bOARD_FILENAME;
	}
}
