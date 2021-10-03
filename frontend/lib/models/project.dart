class Project {
  late String bannerUrl, projectUrl, projectTitle, authorName, authorYear, authorUid;

  Project.fromJson(jsonObject) {
    this.bannerUrl = jsonObject['banner_url'] ?? "";
    this.projectUrl = jsonObject['blog_url'] ?? "";
    this.projectTitle = jsonObject['blog_title'] ?? "";
    this.authorName = jsonObject['author_name'] ?? "";
    this.authorYear = jsonObject['author_year'] ?? "";
  }

  Map<String, String> toJson() {
    return {
      "blog_url": this.projectUrl,
      "banner_url": this.bannerUrl,
      "blog_title": this.projectTitle,
      "author_name": this.authorName,
      "author_year": this.authorYear,
      "author_uid": this.authorUid,
    };
  }
}
