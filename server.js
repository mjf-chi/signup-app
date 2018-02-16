const Koa = require('koa');
const session = require('koa-session');
const Router = require('koa-router');
const mount = require('koa-mount');
const koaqs = require('koa-qs');
const accesslog = require('koa-accesslog')
const serve = require('koa-static');
const send = require('koa-send');


const fs = require('fs');
const path = require('path');
const clientSecretJson = JSON.parse(fs.readFileSync('./baloo_calendar_secret.json'));
const config = require('./config.json');
const routes = require('./src/routes');

//
// google OAuth2 configuraion
//
//
config.google.key = clientSecretJson.web.client_id;
config.google.secret = clientSecretJson.web.client_secret;

const Grant = require('grant-koa');
const grant = new Grant(config);

const app = new Koa();
app.use(accesslog());

app.keys = ['grant'];
app.use(session(app));

app.use(mount(grant));

app.use(serve(path.join(__dirname, '/dist')));

const router = new Router();
router
  .get('/session', (ctx, next) => {
    ctx.body = JSON.stringify(ctx.session, null, 2);
  })
  .get('/googleAuth', routes.newOAuthUser);

app
 .use(router.routes())
 .use(router.allowedMethods());



// stackoverflow.com/questions/32721311/koa-js-serving-static-files-and-rest-api
//
// allows the elm navigation routes to be linked to directly
//
app.use(async (ctx, next) => {
  return send(
    ctx,
    '/index.html',
    { root: path.join(__dirname, '/dist')})
  .then(() => next())
});

koaqs(app);


app.listen(8080, function() {
  console.log('Koa server listening on port ' + 8080);
});
