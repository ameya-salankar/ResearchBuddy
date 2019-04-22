const mysql = require("mysql");
let con = mysql.createConnection({
  host: "localhost",
  user: "Atharva",
  password: "3atharva"
});

con.connect((err, res) => {
  if (err) throw err;
});

module.exports = con;
