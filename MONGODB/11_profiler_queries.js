// 11. Profiler - Recent Slow Queries
db.system.profile.find().sort({ ts: -1 }).limit(5);
