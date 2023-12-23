export type ValueOf<T> = T[keyof T];

export type Entry<T> = [keyof T, ValueOf<T>];

export type Entries<T> = Entry<T>[];
