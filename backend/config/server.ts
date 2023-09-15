export default ({ env }) => ({
  host: env('BACKEND_HOST', '0.0.0.0'),
  port: env.int('BACKEND_PORT', 1337),
  app: {
    keys: env.array('BACKEND_APP_KEYS'),
  },
  webhooks: {
    populateRelations: env.bool('WEBHOOKS_POPULATE_RELATIONS', false),
  },
});
