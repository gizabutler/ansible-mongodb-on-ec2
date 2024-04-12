use admin;
db.createUser({ user: "admin", pwd: "", roles: [ { role: "userAdminAnyDatabase", db: "admin" } ]});
db.auth({user: "admin", pwd: ""});
use admin;
db.createUser({user: "tasky" , pwd: "", roles: [ "userAdminAnyDatabase","readWriteAnyDatabase" ]});
use admin;
db.createUser({ user: "backup", pwd: "", roles: [ "root" ]})

