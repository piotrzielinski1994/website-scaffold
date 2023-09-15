export default ({ env }) => ({
  auth: {
    secret: env('BACKEND_ADMIN_JWT_SECRET'),
  },
  apiToken: {
    salt: env('BACKEND_API_TOKEN_SALT'),
  },
  transfer: {
    token: {
      salt: env('BACKEND_TRANSFER_TOKEN_SALT'),
    },
  },
});
