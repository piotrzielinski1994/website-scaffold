export interface ApiWithTimestamps {
  created_at: string;
  updated_at: string | null;
}

export interface WithTimestamps {
  createdAt: Date;
  updatedAt: Date | null;
}

// ==========================================

export interface ApiWithPublicationStatus {
  status: 'published' | 'draft' | 'archieved';
}

export interface WithPublicationStatus {
  status: ApiWithPublicationStatus['status'];
}

// ==========================================

export interface Model {
  id: string;
}
