const mysql = require("mysql");
let con = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "root"
});

con.connect((err, res) => {
  if (err) throw err;
});

module.exports = con;
