var clientId = "<%= clientId %>";
var redirectURI = "<%= redirectURI %>";
var state = "<%= state %>";
var apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
apiURL += "&client_id=" + clientId;
apiURL += "&redirect_uri=" + redirectURI;
apiURL += "&state=" + state;

function redirectToNaverLogin() {
  location.href = apiURL;
}
