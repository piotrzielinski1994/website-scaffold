export interface RequestOptions<B = undefined> {
  method?: RequestInit['method'];
  headers?: RequestInit['headers'];
  body?: B;
}

export interface ApiConfig<J> {
  baseUrl: string;
  token: string;
  transform?: (responseJson: J) => unknown;
}
