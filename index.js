const express = require("express");
const http = require("http");
var mysql = require("mysql");

const port = 3000;

const app = express();

// Pour recevoir des données json en post
app.use(express.json());

// Gestion des fichiers statiques
app.use(express.static("public"));


var connection = mysql.createConnection({
	host: "localhost",
	user: "root",
	password: "",
	database: "gestion_repas",
});

connection.connect(function(err) {
   if (err) throw err;
   console.log("Connecté à la base de données MySQL!");
  connection.query("SELECT * from ingredients", function (err, result) {
       if (err) throw err;
       console.log(result);
     });
 });

app.get("/api/ingredients", (req, res) => {
	connection.query("SELECT * FROM ingredients", (error, result) => {
		if (error) throw error;
		res.json(result);
	});
	
});


app.post("/api/ingredients", (req, res) => {
  const data={nom:req.body.name, prix:req.body.prix, poids:req.body.poids};
  var sql = "INSERT INTO ingrédients (Nom, prix, poids) VALUES (?,?,?)"


///////////////////////RECETTE/////////////////////////:

app.get("/api/recette", (req, res) => {
	connection.query("SELECT * FROM recette", (error, result) => {
		if (error) throw error;
		res.json(result);
	});
	
});

//app.post("/api/recette", (req, res) => {
	//const data={nom:req.body.name, prix:req.body.prix, poids:req.body.poids};







	connection.query(sql, [data.nom, data.prix, data.poids], function (error, result) {
		if (error) throw error;
    else{
      console.log("Enregistrement reussie");
    }
	});
});



app.listen(port, () => {
	console.log("serveur lancé sur le port " + port);
});
