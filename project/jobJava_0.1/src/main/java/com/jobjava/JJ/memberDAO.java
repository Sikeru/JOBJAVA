package com.jobjava.JJ;

import java.util.ArrayList;

public interface memberDAO {
	public UserDetailsDto selectUser(String username);
	public ArrayList<String> getAuthList(String username);
	public void userSignUp(String username, String password, char enable);
	public void giveAuth(String username, String authority);
}