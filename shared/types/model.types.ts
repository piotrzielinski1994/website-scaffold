export interface Model<T extends string, Attributes> {
  id: number;
  createdAt: string;
  updatedAt: string;
  attributes: Attributes & {
    __typename: T;
  };
}
