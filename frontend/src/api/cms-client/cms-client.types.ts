export interface RequestOptions<B = undefined> {
  method?: RequestInit['method'];
  headers?: RequestInit['headers'];
  body?: B;
}
