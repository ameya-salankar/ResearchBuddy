const express = require("express");
const router = express.Router();
let con = require("../config/connection.js");

let Employee = [];

router.get("/", (req, res, next) => {
  let res1 = res;
  con.query("USE practice", (err, result) => {
    if (err) throw err;
  });
  SQL = "SELECT * FROM WORKER";
  con.query(SQL, (err, result) => {
    if (err) throw err;
    console.log("result", result);
    res1.render("index", { Employee: result, title: "Research Buddy" });
    // con.releaseConnection();
  });
});

router.post("/", (req, res, next) => {
  console.log("In post");
  let res1 = res;
  let condition = req.body.Search;
  con.query("USE practice", (err, result) => {
    if (err) throw err;
  });
  SQL = "SELECT * FROM WORKER WHERE FIRST_NAME = '" + condition + "'";
  con.query(SQL, (err, result) => {
    if (err) throw err;
    console.log("\n", "Here is the result : \n", result);
  });
});

/* GET home page. */

module.exports = router;
