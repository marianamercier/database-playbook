// 08. Collections Size (MB)
db.getCollectionNames().forEach(c => {
  printjson({ collection: c, sizeMB: db[c].stats().size / 1024 / 1024 });
});
