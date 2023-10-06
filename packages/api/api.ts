import { ApiConfig, RequestOptions } from './api.types';

class Api<J> {
  constructor(private config: ApiConfig<J>) {}

  private request = async <R, B = unknown>(
    path: string,
    options?: RequestOptions<B>,
  ): Promise<R> => {
    const url = `${this.config.baseUrl}/${path}`.replace(/\/\//g, '/');
    const response = await fetch(url, {
      method: options?.method ?? 'GET',
      headers: {
        'Content-Type': 'application/json',
        Authorization: `Bearer ${this.config.token}`,
        ...options?.headers,
      },
      body: options?.body ? JSON.stringify(options.body) : undefined,
    });
    const payload = await response.json();

    return this.config.transform ? this.config.transform(payload) : payload;
  };

  get = <R, B = undefined>(path: string, options?: Omit<RequestOptions<B>, 'method'>) => {
    return this.request<R, B>(path, {
      method: 'GET',
      ...options,
    });
  };

  post = <R, B = undefined>(path: string, options?: Omit<RequestOptions<B>, 'method'>) => {
    return this.request<R, B>(path, {
      method: 'POST',
      ...options,
    });
  };
}

export default Api;
