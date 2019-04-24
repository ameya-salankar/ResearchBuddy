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
    "select firstName, lastName, Title from Article,Author,Writes where idArticle = articleID and idAuthor = authorID; ";
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
    let fname = "",
      lname = "";
    let flag = 0;
    for (let i = 0; i < condition.length; i++) {
      if (condition[i] == " ") {
        flag = 1;
        continue;
      }
      if (flag === 0) fname += condition[i];
      else if (flag == 1) lname += condition[i];
    }
    console.log(fname, lname);

    SQL =
      "select idArticle, firstName , lastName , Title from Article,Author,Writes where idArticle = articleID and idAuthor = authorID and firstName LIKE '%" +
      fname +
      "%'";
  } else if (req.body.searchBy === "Keyword") {
    // SQL =
    //   "select articleID, firstName, lastName, Title from Refs, Article, Author where idArticle = articleID and idAuthor = authorID and keyword LIKE '%" +
    //   condition +
    //   "%';";
    SQL =
      "select idArticle, Title from Article where idArticle in (select idArticle from Article, Search where articleID = idArticle and keyword like '%" +
      condition +
      "%');";
  } else if (req.body.searchBy === "Title") {
    SQL =
      "select idArticle, Title, Abstract, URL, dated from Article where Title LIKE '%" +
      condition +
      "%'";
  }

  con.query(SQL, (err, result) => {
    if (err) throw err;
    console.log("\n", "Here is the result : \n", result);
    res1.render("page", {
      Employee: result,
      title: "Research Buddy",
      by: req.body.searchBy,
      query: condition
    });
  });
});

/* GET home page. */
router.get("/search", (req, res, next) => {
  let id = req.query.id;
  con.query("USE RBuddy", (err, result) => {
    if (err) {
      res.render("error", {
        message: "An error occured.",
        error: err
      });
    }
  });
  SQL =
    "SELECT * FROM Article, Author, Writes, Medium, Published_In \
    WHERE Writes.articleID = Article.idArticle and Writes.authorID = Author.idAuthor \
    and \
    Article.idArticle = Published_In.articleID and Published_In.ISBN = Medium.ISBN and idArticle = " +
    id;
  con.query(SQL, (err, result) => {
    console.log(result);
    if (err) {
      res.render("error", {
        message: "An error occured",
        error: err
      });
    }
    res.render("search", { title: "Research Buddy", detail: result });
  });
});
module.exports = router;
