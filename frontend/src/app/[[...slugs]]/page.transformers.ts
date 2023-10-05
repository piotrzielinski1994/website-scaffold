export const slugsToPath = (slugs: string[]): string => {
  return `/${slugs.join('/') ?? ''}`;
};
