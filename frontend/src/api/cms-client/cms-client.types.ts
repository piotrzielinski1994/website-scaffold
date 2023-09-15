export interface CmsClient {
  request: <T, K extends string>(query: string, variables?: Record<string, any>) => Promise<CmsClientResponse<T, K>>;
  query: (query: string) => string;
}

interface CmsClientResponse<T, K extends string> {
  data: {
    [key in K]: {
      data: T;
    }
  }
}
