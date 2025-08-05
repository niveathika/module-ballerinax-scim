import ballerina/io;
import ballerinax/scim;

configurable string tokenUrl = ?;
configurable string clientId = ?;
configurable string clientSecret = ?;

public function main() returns error? {
    io:println("Hello, World!");

    scim:Client scim = check new (serviceUrl = "https://api.asgardeo.io/t/niveathika/scim2",
    config = {
        auth: {
            tokenUrl: tokenUrl,
            clientId: clientId,
            clientSecret: clientSecret,
            scopes: ["internal_user_mgt_list", "internal_group_mgt_view"]
        }
    });

    scim:GroupsListResponseObject groupList = check scim->/Groups();
    io:println("Group List: ", groupList);

    scim:UserObjectListResponseObject userList = check scim->/Users();
    io:println("User List: ", userList);
}
