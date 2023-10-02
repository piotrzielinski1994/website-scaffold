export interface ApiWithTimestamps {
  created_at: string;
  updated_at: string | null;
}

export interface WithTimestamps {
  createdAt: Date;
  updatedAt: Date | null;
}

// ==========================================

export type PublicationStatus = 'published' | 'draft' | 'archieved';

export interface ApiWithPublicationStatus {
  status: PublicationStatus;
}

export interface WithPublicationStatus {
  status: PublicationStatus;
}

// ==========================================
