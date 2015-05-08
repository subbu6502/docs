# Save to authentication.sh, then run with:
# sh authentication.sh

: ${baseURL:="https://api.respoke.io/v1"}

: ${endpointId:="spock@enterprise.com"}
: ${appId:="c10a2075-3f3d-466f-82f9-d2285e64c5d4"}
: ${appSecret:="eb327e57-e766-49de-b801-ef612a70509e"}
: ${roleId:="371F82D1-E4CE-4BB0-B2BB-79EA3497FC4F"}

body='{
    "appId": "'$appId'",
    "endpointId": "'$endpointId'",
    "roleId": "'$roleId'",
    "ttl": 3600
}'

# Make a call to /tokens to get a tokenId
tokenResponse=$(curl -s -X POST \
    -H "App-Secret: $appSecret" -H 'Content-type: application/json' \
    -d "$body" $baseURL/tokens)

# Extract the tokenId from the tokenResponse
# Connect your Respoke client using this token
tokenId=$(expr "$tokenResponse" : '.*"tokenId": *"\(.*\)"')

printf "{ token: %s }" "$tokenId"
