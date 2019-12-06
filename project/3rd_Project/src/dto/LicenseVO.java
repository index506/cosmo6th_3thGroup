package dto;

public class LicenseVO {
	String license_name;
	String license_abbreviation;

	public LicenseVO() {}

	public LicenseVO(String license_name, String license_abbreviation) {
		super();
		this.license_name = license_name;
		this.license_abbreviation = license_abbreviation;
	}

	public String getLicense_name() {
		return license_name;
	}

	public void setLicense_name(String license_name) {
		this.license_name = license_name;
	}

	public String getLicense_abbreviation() {
		return license_abbreviation;
	}

	public void setLicense_abbreviation(String license_abbreviation) {
		this.license_abbreviation = license_abbreviation;
	}
	
	
}
