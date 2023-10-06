import Api from '@packages/api';
import { CmsJsonResponse } from './client.types';

const cmsClient = new Api<CmsJsonResponse<unknown>>({
  baseUrl: process.env.API_URL as string,
  token: process.env.API_TOKEN as string,
  transform: (response) => response.data,
});

export default cmsClient;
