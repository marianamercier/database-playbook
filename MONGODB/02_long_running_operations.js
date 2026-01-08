// 02. Long Running Operations (>60s)
db.currentOp({ active: true, secs_running: { $gt: 60 } });
