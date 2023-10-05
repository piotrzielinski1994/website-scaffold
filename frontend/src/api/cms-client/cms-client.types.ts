export interface RequestOptions<B = undefined> {
  method?: RequestInit['method'];
  headers?: RequestInit['headers'];
  body?: B;
}

export interface ApiConfig {
  baseUrl: string;
  token: string;
  transform?: <T, P>(responseJson: T) => P;
}
