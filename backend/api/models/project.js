const mongoose = require("mongoose");
const Schema = mongoose.Schema;

const projectSchema = new Schema({
    project_url: {
      type: String, required: true
    },
    project_title: {
      type: String, required: true
    },
    banner_url: {
      type: String, required: true
    },
    author_year: {
      type: String, required: true
    },
    author_uid: {
      type: mongoose.Types.ObjectId,
      required: true,
      ref: "Users"
    }
});

module.exports = mongoose.model("Projects",projectSchema);
