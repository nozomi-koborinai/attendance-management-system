package dto;

public class Student {
	private int s_number;
	private String s_name;
	private String sex;
	private int year;
	private int absence;
	private int late;
	private int public_flag;
	private String s_class_name;
	private String s_course_name;

	public Student(){

	}

	public Student(int s_number, String s_name){
		super();
		this.s_number = s_number;
		this.s_name = s_name;
	}

	public Student(int s_number, String s_name, String sex, int year, int absence, int late, int public_flag,
			String s_class_name, String s_course_name) {
		super();
		this.s_number = s_number;
		this.s_name = s_name;
		this.sex = sex;
		this.year = year;
		this.absence = absence;
		this.late = late;
		this.public_flag = public_flag;
		this.s_class_name = s_class_name;
		this.s_course_name = s_course_name;
	}

	public int getS_number() {
		return s_number;
	}

	public void setS_number(int s_number) {
		this.s_number = s_number;
	}

	public String getS_name() {
		return s_name;
	}

	public void setS_name(String s_name) {
		this.s_name = s_name;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public int getYear() {
		return year;
	}

	public void setYear(int year) {
		this.year = year;
	}

	public int getAbsence() {
		return absence;
	}

	public void setAbsence(int absence) {
		this.absence = absence;
	}

	public int getLate() {
		return late;
	}

	public void setLate(int late) {
		this.late = late;
	}

	public int getPublic_flag() {
		return public_flag;
	}

	public void setPublic_flag(int public_flag) {
		this.public_flag = public_flag;
	}

	public String getS_class_name() {
		return s_class_name;
	}

	public void setS_class_name(String s_class_name) {
		this.s_class_name = s_class_name;
	}

	public String getS_course_name() {
		return s_course_name;
	}

	public void setS_course_name(String s_course_name) {
		this.s_course_name = s_course_name;
	}


}
