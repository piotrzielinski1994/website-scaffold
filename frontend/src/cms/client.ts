import Api from '@packages/api';

const cmsClient = new Api({
  baseUrl: process.env.API_URL as string,
  token: process.env.API_TOKEN as string,
  transform: (response: any) => response.data,
});

export default cmsClient;
