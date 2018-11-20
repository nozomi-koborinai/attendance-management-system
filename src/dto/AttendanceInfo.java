package dto;

public class AttendanceInfo {
	private String name;
	private String date;
	private int time;
	private String info;
	private int absence;
	private int late;
	private int attendanceRate;
	private int publicFlag;

	public AttendanceInfo(String name, String date, int time, String info, int absence, int late, int attendanceRate,
			int publicFlag) {
		super();
		this.name = name;
		this.date = date;
		this.time = time;
		this.info = info;
		this.absence = absence;
		this.late = late;
		this.attendanceRate = attendanceRate;
		this.publicFlag = publicFlag;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public int getTime() {
		return time;
	}
	public void setTime(int time) {
		this.time = time;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
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
	public int getAttendanceRate() {
		return attendanceRate;
	}
	public void setAttendanceRate(int attendanceRate) {
		this.attendanceRate = attendanceRate;
	}
	public int getPublicFlag() {
		return publicFlag;
	}
	public void setPublicFlag(int publicFlag) {
		this.publicFlag = publicFlag;
	}



}
