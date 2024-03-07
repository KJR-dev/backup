import express from 'express'
import connectDB from "./db/connectdb.js";
import web from "./routes/web.js";
const app = express()
const port = process.env.PORT || '3000'
const DATABASE_URL = process.env.DATABASE_URL || "mongodb://localhost:27017";

// Database Connection
connectDB(DATABASE_URL);

// JSON
app.use(express.json())

// Load Routes
app.use("/student", web)


app.listen(port, () => {
 console.log(`Server listening at http://localhost:${port}`)
})