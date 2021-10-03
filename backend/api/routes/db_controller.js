const mongoose = require('mongoose');

const connectDb = async () => {
    
    const conn = await mongoose.connect(
        process.env.DB_URL,
        {
            useNewUrlParser: true,
            useUnifiedTopology: true,
        }
    ).then(() => {
        console.log("Db connection successful!");
    }).catch((err) => {
	console.log({
	    message: "Database connection failed!",
	    debug: err
	})
    });

}

module.exports = connectDb;
