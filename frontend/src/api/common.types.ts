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

export interface ApiModel {
  id: string;
}

export interface Model {
  id: ApiModel['id'];
}

// ==========================================

export interface ApiImage {
  id: string;
  description: string | null;
  width: number;
  height: number;
}

export interface Image {
  src: string;
  alt: string;
  width: number;
  height: number;
}

// ==========================================
