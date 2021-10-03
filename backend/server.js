const app = require("./app")
const http = require("http").createServer(app);

const PORT = process.env.PORT || 3000;
http.listen(PORT, () => {
    console.log(`Server running on port: ${PORT}`);
});
