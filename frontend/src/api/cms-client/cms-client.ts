import { RequestOptions } from "./cms-client.types";

class CmsApi {
  constructor(
    private baseUrl: string,
    private token?: string,
    private transform?: any
  ) {}

  private request = async <R, B = unknown>(
    path: string,
    options?: RequestOptions<B>
  ): Promise<R> => {
    const url = `${this.baseUrl}/${path}`.replace(/\/\//g, '/');
    const response = await fetch(url, {
      method: options?.method ?? 'GET',
      headers: {
        'Content-Type': 'application/json',
        'Authorization': `Bearer ${this.token}`,
        ...options?.headers,
      },
      body: options?.body ? JSON.stringify(options.body) : undefined,
    });
    const payload = await response.json();

    return this.transform(payload);
  };

  get = <R, B = undefined>(path: string, options?: Omit<RequestOptions<B>, 'method'>) => {
    return this.request<R, B>(path, { method: 'GET', ...options });
  }

  post = <R, B = undefined>(path: string, options?: Omit<RequestOptions<B>, 'method'>) => {
    return this.request<R, B>(path, { method: 'POST', ...options });
  }
}

const cmsClient = new CmsApi(
  process.env.API_URL as string,
  process.env.API_TOKEN,
  (response: any) => response.data
);

export default cmsClient;
