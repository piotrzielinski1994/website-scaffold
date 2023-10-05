export interface PageProps extends RouteMetadata {}

export interface RouteMetadata {
  params: {
    slugs?: string[];
  };
  searchParams: Record<string, string | string[] | undefined>;
}
