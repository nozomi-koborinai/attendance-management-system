package dto;

public class PublicStatus {
	int publicId;			//申請ID
	String publicDate;		//申請日
	String reason;			//公欠申請理由
	String place;			//場所
	String period;			//期間
	int auth;				//許可フラグ

	public PublicStatus(){

	}

	public PublicStatus(int publicId, String publicDate, String reason, String place, String period, int auth) {
		super();
		this.publicId = publicId;
		this.publicDate = publicDate;
		this.reason = reason;
		this.place = place;
		this.period = period;
		this.auth = auth;
	}

	public int getPublicId() {
		return publicId;
	}

	public void setPublicId(int publicId) {
		this.publicId = publicId;
	}

	public String getPublicDate() {
		return publicDate;
	}

	public void setPublicDate(String publicDate) {
		this.publicDate = publicDate;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public String getPlace() {
		return place;
	}

	public void setPlace(String place) {
		this.place = place;
	}

	public String getPeriod() {
		return period;
	}

	public void setPeriod(String period) {
		this.period = period;
	}

	public int getAuth() {
		return auth;
	}

	public void setAuth(int auth) {
		this.auth = auth;
	}

}
