const express = require('express')
const hbs = require('hbs')
const wax = require('wax-on')
const mysql2 = require('mysql2/promise')
require('dotenv').config()



const app = express()

app.set('view engine', 'hbs')
wax.on(hbs.handlebars)
wax.setLayoutPath('./views/layouts')

async function main() {
    const connection = await mysql2.createConnection({
        'host' : process.env.DB_HOST, // host ==> ip address of the database server
        'user' : process.env.DB_USER,
        'database' : process.env.DB_DATABASE,
        'password' : process.env.DB_PASSWORD
    }
    )

    await connection.execute("SELECT * FROM actor")

    app.get('/actors', async function(req,res){
        //connection.execute returns an array of results
        // the first element is the table that we selected
        // the second element onwards are some housekeeping data
        // the first element will be stored in actors variable 
        const [actors] = await connection.execute("SELECT * FROM actor")
        // short for :
        // const results = await connection.execute("SELECT * FROM actor")
        // const actors = results[0]
        // some array revision 
        res.render ('actors.hbs', {
            'actors' : actors
        })
    })

    app.get('/staff', async function(req,res){
        const [staff] = await connection.execute("SELECT * from staff")
        res.render ('staff.hbs', {
            'staff' : staff
        })
    })

    app.get('/search', async function(req,res){


        //define get all results query
        let query = "SELECT * from actor where 1";
        let [actors] = await connection.execute(query);

        res.render('search', {
            'actors': actors
        })
    })
};

main()

app.use(express.urlencoded({
    'extended' : false 
}))

app.listen(3000, function(){
    console.log("server has started ")
})

