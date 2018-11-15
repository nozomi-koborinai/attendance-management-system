package dto;

public class AttendanceStatus {
	private final String attendance = "〇";
	private final String absence = "欠";
	private final String late = "遅";
	private final String early = "早";
	private final String pblc = "公";

	public AttendanceStatus(){

	}

	public String getAttendance() {
		return attendance;
	}
	public String getAbsence() {
		return absence;
	}
	public String getLate() {
		return late;
	}
	public String getEarly() {
		return early;
	}
	public String getPblc() {
		return pblc;
	}



}
