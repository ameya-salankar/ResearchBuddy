const express = require("express");
const router = express.Router();
let con = require("../config/connection.js");

let Employee = [];

router.get("/", (req, res, next) => {
  let res1 = res;
  con.query("USE RBuddy", (err, result) => {
    if (err) throw err;
  });
  SQL =
    "select firstName , lastName , Title from Article,Author,Writes where idArticle = articleID and idAuthor = authorID; ";
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
  con.query("USE RBuddy", (err, result) => {
    if (err) throw err;
  });
  let SQL = "";
  if (req.body.searchBy === "Author") {
    SQL =
      "select idArticle, firstName , lastName , Title from article,author,writes where idArticle = articleID and idAuthor = authorID and firstName = '" +
      condition +
      "'";
  } else if (req.body.searchBy === "Keyword") {
    res.render("search");
  } else if (req.body.searchBy === "Title") {
    SQL =
      "select idArticle, firstName , lastName , Title,Abstract, URL from article,author,writes where idArticle = articleID and idAuthor = authorID and Title = '" +
      condition +
      "'";
  }
  con.query(SQL, (err, result) => {
    if (err) throw err;
    console.log("\n", "Here is the result : \n", result);
    res1.render("page", {
      Employee: result,
      title: "Research Buddy"
    });
  });
});

/* GET home page. */
router.get("/search", (req, res, next) => {
  let id = req.query.id;
  con.query("USE RBuddy", (err, result) => {
    if (err) throw err;
  });
  SQL = "SELECT * FROM article WHERE idArticle = " + id;
  con.query(SQL, (err, result) => {
    console.log(result);
    res.render("search", { title: "Research Buddy", detail: result });
  });
});
module.exports = router;
