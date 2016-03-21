package entity;

import java.util.Date;

public class Users {
	private String username;
	private String mypassword;
	private String email;
	private String gender;
	private Date birthday;
	private String[] favorites;
	private String introduce;
	private boolean flag;
	
	
	public Users(){
		
	}
	
	
	/**
	 * @return the username
	 */
	public String getUsername() {
		return username;
	}
	/**
	 * @param username the username to set
	 */
	public void setUsername(String username) {
		this.username = username;
	}
	/**
	 * @return the mypassword
	 */
	public String getMypassword() {
		return mypassword;
	}
	/**
	 * @param mypassword the mypassword to set
	 */
	public void setMypassword(String mypassword) {
		this.mypassword = mypassword;
	}
	/**
	 * @return the email
	 */
	public String getEmail() {
		return email;
	}
	/**
	 * @param email the email to set
	 */
	public void setEmail(String email) {
		this.email = email;
	}
	/**
	 * @return the gender
	 */
	public String getGender() {
		return gender;
	}
	/**
	 * @param gender the gender to set
	 */
	public void setGender(String gender) {
		this.gender = gender;
	}
	/**
	 * @return the birthday
	 */
	public Date getBirthday() {
		return birthday;
	}
	/**
	 * @param birthday the birthday to set
	 */
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	/**
	 * @return the favorites
	 */
	public String[] getFavorites() {
		return favorites;
	}
	/**
	 * @param favorites the favorites to set
	 */
	public void setFavorites(String[] favorites) {
		this.favorites = favorites;
	}
	/**
	 * @return the introduce
	 */
	public String getIntroduce() {
		return introduce;
	}
	/**
	 * @param introduce the introduce to set
	 */
	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}


	/**
	 * @return the flag
	 */
	public boolean isFlag() {
		return flag;
	}


	/**
	 * @param flag the flag to set
	 */
	public void setFlag(boolean flag) {
		this.flag = flag;
	}

	
	
}
