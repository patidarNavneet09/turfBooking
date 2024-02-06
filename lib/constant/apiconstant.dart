class ApiServer {
  static const baseurl = "https://work.mobidudes.in/CH/TruckManagement/api/";
  static const client =
      "Bearer JzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkMkJSEyXiopIiw";
  static const login = "${baseurl}login";
  static const profiledetail = "${baseurl}profile-detail";
  static const logout = "${baseurl}logout";
  static const privacypolicy = "${baseurl}privacy-policy";
  static const termconditonapi = "${baseurl}terms-and-conditions";
  static const mytripapi = "${baseurl}my-trips?type=";
  static const tripdetailsapi = "${baseurl}trip-details?";
  static const tripaccept = "${baseurl}trip-accept";
  static const tripstart = "${baseurl}trip-start";
  static const addondiesel = "${baseurl}add-on-diesel";
  static const enroutediesel = "${baseurl}enroute-diesel";
  static const enrouterepairs = "${baseurl}enroute-repairs";
  static const enroutetoll = "${baseurl}enroute-toll";
  static const roadaccident = "${baseurl}road-accident";
}
