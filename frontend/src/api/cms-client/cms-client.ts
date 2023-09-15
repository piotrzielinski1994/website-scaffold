import { ApolloClient, InMemoryCache, NormalizedCacheObject, gql } from "@apollo/client";
import { CmsClient } from "./cms-client.types";

const client: ApolloClient<NormalizedCacheObject> = new ApolloClient({
    uri: `${process.env.BACKEND_URL}/graphql`,
    cache: new InMemoryCache(),
    headers: {
      'Authorization': `Bearer ${process.env.BACKEND_API_KEY}`,
    }
});

const cmsClient = {
  request: (query: string, variables?: Record<string, any>) => client.query({ query, variables } as any),
  query: gql,
} as unknown as CmsClient;

export default cmsClient;
