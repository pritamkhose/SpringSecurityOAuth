Welcome to the jCombat Demo!


http://localhost:7080/SpringSecurityOAuth/oauth/token?grant_type=password&client_id=fbApp&client_secret=fbApp&username=admin&password=123

{
"value": "d6e8598b-8863-48c7-a8d3-c947d297ab3e",
"expiration": 1535872867378,
"tokenType": "bearer",
"refreshToken": {
"value": "a82a2ffd-9674-40c1-a8cf-064226bb31d3",
"expiration": 1538464747378
},
"scope": [],
"additionalInformation": {},
"expired": false,
"expiresIn": 119
}
or
{
"access_token": "d1da04c1-e577-40c3-8d59-6e774ae9db63",
"token_type": "bearer",
"refresh_token": "18ec23b4-47db-40b3-a60d-305568c99a92",
"expires_in": 119
}


http://localhost:7080/SpringSecurityOAuth/api/admin?access_token=d6e8598b-8863-48c7-a8d3-c947d297ab3e




http://localhost:7080/SpringSecurityOAuth/api/Employee/pritam?access_token=d6e8598b-8863-48c7-a8d3-c947d297ab3e

http://localhost:7080/SpringSecurityOAuth/api/ServiceDetailAPI/pritam?access_token=d6e8598b-8863-48c7-a8d3-c947d297ab3e


http://localhost:7080/SpringSecurityOAuth/j_spring_security_logout?access_token=d6e8598b-8863-48c7-a8d3-c947d297ab3e



http://localhost:7080/SpringSecurityOAuth/oauth/token?grant_type=refresh_token&client_id=fbApp&client_secret=fbApp&refresh_token=a82a2ffd-9674-40c1-a8cf-064226bb31d3


http://localhost:7080/SpringSecurityOAuth/oauth/token?grant_type=refresh_token&client_id=fbApp&client_secret=fbApp&refresh_token=18ec23b4-47db-40b3-a60d-305568c99a92

{
"value": "ebc8164b-be0f-4622-9b32-de171731de49",
"expiration": 1535873066018,
"tokenType": "bearer",
"refreshToken": {
"value": "a82a2ffd-9674-40c1-a8cf-064226bb31d3",
"expiration": 1538464747378
},
"scope": [],
"additionalInformation": {},
"expired": false,
"expiresIn": 119
}

