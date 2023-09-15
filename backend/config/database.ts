export default ({ env }) => {
  const dbConfig = {
    connection: {
      connectionString: env('DATABASE_URL'),
      host: env('BACKEND_DATABASE_HOST', 'localhost'),
      port: env.int('BACKEND_DATABASE_PORT', 5432),
      database: env('BACKEND_DATABASE_NAME', 'strapi'),
      user: env('BACKEND_DATABASE_USERNAME', 'strapi'),
      password: env('BACKEND_DATABASE_PASSWORD', 'strapi'),
      ssl: env.bool('BACKEND_DATABASE_SSL', false) && {
        key: env('DATABASE_SSL_KEY', undefined),
        cert: env('DATABASE_SSL_CERT', undefined),
        ca: env('DATABASE_SSL_CA', undefined),
        capath: env('DATABASE_SSL_CAPATH', undefined),
        cipher: env('DATABASE_SSL_CIPHER', undefined),
        rejectUnauthorized: env.bool(
          'DATABASE_SSL_REJECT_UNAUTHORIZED',
          true
        ),
      },
      schema: env('DATABASE_SCHEMA', 'public'),
    },
    pool: { min: env.int('DATABASE_POOL_MIN', 2), max: env.int('DATABASE_POOL_MAX', 10) },
  };

  return {
    connection: {
      client: 'postgres',
      ...dbConfig,
      acquireConnectionTimeout: env.int('DATABASE_CONNECTION_TIMEOUT', 60000),
    },
  };
};
