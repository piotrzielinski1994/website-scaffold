import { Entries, ValueOf } from './entries.types';

export const objectEntries = <T extends object>(obj: T): Entries<T> => {
  return Object.entries(obj) as Entries<T>;
};

export const objectFromEntries = <T extends object>(
  entries: Entries<T>,
): Record<keyof T, ValueOf<T>> => {
  return Object.fromEntries(entries) as T;
};
