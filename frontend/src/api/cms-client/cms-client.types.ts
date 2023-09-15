export interface CmsClient {
  request: <T, K extends string>(query: string) => CmsClientResponse<T, K>;
  query: (query: string) => string;
}

interface CmsClientResponse<T, K extends string> {
  data: {
    [key in K]: {
      data: T;
    }
  }
}
