package dto;

public class AttendanceInfo {
	private int sNumber;
	private String name;
	private String date;
	private int time;
	private String info;
	private int absence;
	private int late;
	private double attendanceRate;
	private int publicFlag;

	public AttendanceInfo(int sNumber, String name, String date, int time, String info, int absence, int late, double attendanceRate,
			int publicFlag) {
		super();
		this.sNumber = sNumber;
		this.name = name;
		this.date = date;
		this.time = time;
		this.info = info;
		this.absence = absence;
		this.late = late;
		this.attendanceRate = attendanceRate;
		this.publicFlag = publicFlag;
	}

	public int getSNumber() {
		return sNumber;
	}

	public void setSNumber(int sNumber) {
		this.sNumber = sNumber;
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

	public double getAttendanceRate() {
		return attendanceRate;
	}

	public void setAttendanceRate(double attendanceRate) {
		this.attendanceRate = attendanceRate;
	}

	public int getPublicFlag() {
		return publicFlag;
	}

	public void setPublicFlag(int publicFlag) {
		this.publicFlag = publicFlag;
	}

}
