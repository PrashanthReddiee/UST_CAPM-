const cds = require("@sap/cds");
const cov2ap = require("@sap/cds-odata-v2-adapter-proxy");
cds.on("bootstrap",(app) =>app.use(cov2app()));
module.exports = cds.server;