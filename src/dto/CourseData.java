package dto;

public class CourseData {
	private int course_id;
	private int class_id;
	private String  course_name;

	public CourseData(){

	}

	public CourseData(int course_id, int class_id, String course_name) {
		super();
		this.course_id = course_id;
		this.class_id = class_id;
		this.course_name = course_name;
	}

	public int getCourse_id() {
		return course_id;
	}

	public void setCourse_id(int course_id) {
		this.course_id = course_id;
	}

	public int getClass_id() {
		return class_id;
	}

	public void setClass_id(int class_id) {
		this.class_id = class_id;
	}

	public String getCourse_name() {
		return course_name;
	}

	public void setCourse_name(String course_name) {
		this.course_name = course_name;
	}

}
