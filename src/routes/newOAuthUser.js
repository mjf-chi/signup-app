module.exports = (ctx, next) => {
  // hit newOAuthUser endpoint
  // display thank you / welcome page
  ctx.body = JSON.stringify(ctx.session, null, 2);
};
