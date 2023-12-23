-- public.directus_activity definition

-- Drop table

-- DROP TABLE public.directus_activity;

CREATE TABLE public.directus_activity (
	id serial4 NOT NULL,
	"action" varchar(45) NOT NULL,
	"user" uuid NULL,
	"timestamp" timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
	ip varchar(50) NULL,
	user_agent varchar(255) NULL,
	collection varchar(64) NOT NULL,
	item varchar(255) NOT NULL,
	"comment" text NULL,
	origin varchar(255) NULL,
	CONSTRAINT directus_activity_pkey PRIMARY KEY (id)
);


-- public.directus_extensions definition

-- Drop table

-- DROP TABLE public.directus_extensions;

CREATE TABLE public.directus_extensions (
	"name" varchar(255) NOT NULL,
	enabled bool NOT NULL DEFAULT true,
	CONSTRAINT directus_extensions_pkey PRIMARY KEY (name)
);


-- public.directus_fields definition

-- Drop table

-- DROP TABLE public.directus_fields;

CREATE TABLE public.directus_fields (
	id serial4 NOT NULL,
	collection varchar(64) NOT NULL,
	field varchar(64) NOT NULL,
	special varchar(64) NULL,
	interface varchar(64) NULL,
	"options" json NULL,
	display varchar(64) NULL,
	display_options json NULL,
	readonly bool NOT NULL DEFAULT false,
	hidden bool NOT NULL DEFAULT false,
	sort int4 NULL,
	width varchar(30) NULL DEFAULT 'full'::character varying,
	translations json NULL,
	note text NULL,
	conditions json NULL,
	required bool NULL DEFAULT false,
	"group" varchar(64) NULL,
	validation json NULL,
	validation_message text NULL,
	CONSTRAINT directus_fields_pkey PRIMARY KEY (id)
);


-- public.directus_migrations definition

-- Drop table

-- DROP TABLE public.directus_migrations;

CREATE TABLE public.directus_migrations (
	"version" varchar(255) NOT NULL,
	"name" varchar(255) NOT NULL,
	"timestamp" timestamptz NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT directus_migrations_pkey PRIMARY KEY (version)
);


-- public.directus_relations definition

-- Drop table

-- DROP TABLE public.directus_relations;

CREATE TABLE public.directus_relations (
	id serial4 NOT NULL,
	many_collection varchar(64) NOT NULL,
	many_field varchar(64) NOT NULL,
	one_collection varchar(64) NULL,
	one_field varchar(64) NULL,
	one_collection_field varchar(64) NULL,
	one_allowed_collections text NULL,
	junction_field varchar(64) NULL,
	sort_field varchar(64) NULL,
	one_deselect_action varchar(255) NOT NULL DEFAULT 'nullify'::character varying,
	CONSTRAINT directus_relations_pkey PRIMARY KEY (id)
);


-- public.directus_roles definition

-- Drop table

-- DROP TABLE public.directus_roles;

CREATE TABLE public.directus_roles (
	id uuid NOT NULL,
	"name" varchar(100) NOT NULL,
	icon varchar(30) NOT NULL DEFAULT 'supervised_user_circle'::character varying,
	description text NULL,
	ip_access text NULL,
	enforce_tfa bool NOT NULL DEFAULT false,
	admin_access bool NOT NULL DEFAULT false,
	app_access bool NOT NULL DEFAULT true,
	CONSTRAINT directus_roles_pkey PRIMARY KEY (id)
);


-- public.directus_translations definition

-- Drop table

-- DROP TABLE public.directus_translations;

CREATE TABLE public.directus_translations (
	id uuid NOT NULL,
	"language" varchar(255) NOT NULL,
	"key" varchar(255) NOT NULL,
	value text NOT NULL,
	CONSTRAINT directus_translations_pkey PRIMARY KEY (id)
);


-- public.directus_webhooks definition

-- Drop table

-- DROP TABLE public.directus_webhooks;

CREATE TABLE public.directus_webhooks (
	id serial4 NOT NULL,
	"name" varchar(255) NOT NULL,
	"method" varchar(10) NOT NULL DEFAULT 'POST'::character varying,
	url varchar(255) NOT NULL,
	status varchar(10) NOT NULL DEFAULT 'active'::character varying,
	"data" bool NOT NULL DEFAULT true,
	actions varchar(100) NOT NULL,
	collections varchar(255) NOT NULL,
	headers json NULL,
	CONSTRAINT directus_webhooks_pkey PRIMARY KEY (id)
);


-- public.directus_collections definition

-- Drop table

-- DROP TABLE public.directus_collections;

CREATE TABLE public.directus_collections (
	collection varchar(64) NOT NULL,
	icon varchar(30) NULL,
	note text NULL,
	display_template varchar(255) NULL,
	hidden bool NOT NULL DEFAULT false,
	singleton bool NOT NULL DEFAULT false,
	translations json NULL,
	archive_field varchar(64) NULL,
	archive_app_filter bool NOT NULL DEFAULT true,
	archive_value varchar(255) NULL,
	unarchive_value varchar(255) NULL,
	sort_field varchar(64) NULL,
	accountability varchar(255) NULL DEFAULT 'all'::character varying,
	color varchar(255) NULL,
	item_duplication_fields json NULL,
	sort int4 NULL,
	"group" varchar(64) NULL,
	collapse varchar(255) NOT NULL DEFAULT 'open'::character varying,
	preview_url varchar(255) NULL,
	"versioning" bool NOT NULL DEFAULT false,
	CONSTRAINT directus_collections_pkey PRIMARY KEY (collection),
	CONSTRAINT directus_collections_group_foreign FOREIGN KEY ("group") REFERENCES public.directus_collections(collection)
);


-- public.directus_folders definition

-- Drop table

-- DROP TABLE public.directus_folders;

CREATE TABLE public.directus_folders (
	id uuid NOT NULL,
	"name" varchar(255) NOT NULL,
	parent uuid NULL,
	CONSTRAINT directus_folders_pkey PRIMARY KEY (id),
	CONSTRAINT directus_folders_parent_foreign FOREIGN KEY (parent) REFERENCES public.directus_folders(id)
);


-- public.directus_permissions definition

-- Drop table

-- DROP TABLE public.directus_permissions;

CREATE TABLE public.directus_permissions (
	id serial4 NOT NULL,
	"role" uuid NULL,
	collection varchar(64) NOT NULL,
	"action" varchar(10) NOT NULL,
	permissions json NULL,
	validation json NULL,
	presets json NULL,
	fields text NULL,
	CONSTRAINT directus_permissions_pkey PRIMARY KEY (id),
	CONSTRAINT directus_permissions_role_foreign FOREIGN KEY ("role") REFERENCES public.directus_roles(id) ON DELETE CASCADE
);


-- public.directus_users definition

-- Drop table

-- DROP TABLE public.directus_users;

CREATE TABLE public.directus_users (
	id uuid NOT NULL,
	first_name varchar(50) NULL,
	last_name varchar(50) NULL,
	email varchar(128) NULL,
	"password" varchar(255) NULL,
	"location" varchar(255) NULL,
	title varchar(50) NULL,
	description text NULL,
	tags json NULL,
	avatar uuid NULL,
	"language" varchar(255) NULL DEFAULT NULL::character varying,
	tfa_secret varchar(255) NULL,
	status varchar(16) NOT NULL DEFAULT 'active'::character varying,
	"role" uuid NULL,
	"token" varchar(255) NULL,
	last_access timestamptz NULL,
	last_page varchar(255) NULL,
	provider varchar(128) NOT NULL DEFAULT 'default'::character varying,
	external_identifier varchar(255) NULL,
	auth_data json NULL,
	email_notifications bool NULL DEFAULT true,
	appearance varchar(255) NULL,
	theme_dark varchar(255) NULL,
	theme_light varchar(255) NULL,
	theme_light_overrides json NULL,
	theme_dark_overrides json NULL,
	CONSTRAINT directus_users_email_unique UNIQUE (email),
	CONSTRAINT directus_users_external_identifier_unique UNIQUE (external_identifier),
	CONSTRAINT directus_users_pkey PRIMARY KEY (id),
	CONSTRAINT directus_users_token_unique UNIQUE (token),
	CONSTRAINT directus_users_role_foreign FOREIGN KEY ("role") REFERENCES public.directus_roles(id) ON DELETE SET NULL
);


-- public.directus_versions definition

-- Drop table

-- DROP TABLE public.directus_versions;

CREATE TABLE public.directus_versions (
	id uuid NOT NULL,
	"key" varchar(64) NOT NULL,
	"name" varchar(255) NULL,
	collection varchar(64) NOT NULL,
	item varchar(255) NOT NULL,
	hash varchar(255) NULL,
	date_created timestamptz NULL DEFAULT CURRENT_TIMESTAMP,
	date_updated timestamptz NULL DEFAULT CURRENT_TIMESTAMP,
	user_created uuid NULL,
	user_updated uuid NULL,
	CONSTRAINT directus_versions_pkey PRIMARY KEY (id),
	CONSTRAINT directus_versions_collection_foreign FOREIGN KEY (collection) REFERENCES public.directus_collections(collection) ON DELETE CASCADE,
	CONSTRAINT directus_versions_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL,
	CONSTRAINT directus_versions_user_updated_foreign FOREIGN KEY (user_updated) REFERENCES public.directus_users(id)
);


-- public.directus_dashboards definition

-- Drop table

-- DROP TABLE public.directus_dashboards;

CREATE TABLE public.directus_dashboards (
	id uuid NOT NULL,
	"name" varchar(255) NOT NULL,
	icon varchar(30) NOT NULL DEFAULT 'dashboard'::character varying,
	note text NULL,
	date_created timestamptz NULL DEFAULT CURRENT_TIMESTAMP,
	user_created uuid NULL,
	color varchar(255) NULL,
	CONSTRAINT directus_dashboards_pkey PRIMARY KEY (id),
	CONSTRAINT directus_dashboards_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL
);


-- public.directus_files definition

-- Drop table

-- DROP TABLE public.directus_files;

CREATE TABLE public.directus_files (
	id uuid NOT NULL,
	"storage" varchar(255) NOT NULL,
	filename_disk varchar(255) NULL,
	filename_download varchar(255) NOT NULL,
	title varchar(255) NULL,
	"type" varchar(255) NULL,
	folder uuid NULL,
	uploaded_by uuid NULL,
	uploaded_on timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
	modified_by uuid NULL,
	modified_on timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
	charset varchar(50) NULL,
	filesize int8 NULL,
	width int4 NULL,
	height int4 NULL,
	duration int4 NULL,
	embed varchar(200) NULL,
	description text NULL,
	"location" text NULL,
	tags text NULL,
	metadata json NULL,
	CONSTRAINT directus_files_pkey PRIMARY KEY (id),
	CONSTRAINT directus_files_folder_foreign FOREIGN KEY (folder) REFERENCES public.directus_folders(id) ON DELETE SET NULL,
	CONSTRAINT directus_files_modified_by_foreign FOREIGN KEY (modified_by) REFERENCES public.directus_users(id),
	CONSTRAINT directus_files_uploaded_by_foreign FOREIGN KEY (uploaded_by) REFERENCES public.directus_users(id)
);


-- public.directus_flows definition

-- Drop table

-- DROP TABLE public.directus_flows;

CREATE TABLE public.directus_flows (
	id uuid NOT NULL,
	"name" varchar(255) NOT NULL,
	icon varchar(30) NULL,
	color varchar(255) NULL,
	description text NULL,
	status varchar(255) NOT NULL DEFAULT 'active'::character varying,
	"trigger" varchar(255) NULL,
	accountability varchar(255) NULL DEFAULT 'all'::character varying,
	"options" json NULL,
	operation uuid NULL,
	date_created timestamptz NULL DEFAULT CURRENT_TIMESTAMP,
	user_created uuid NULL,
	CONSTRAINT directus_flows_operation_unique UNIQUE (operation),
	CONSTRAINT directus_flows_pkey PRIMARY KEY (id),
	CONSTRAINT directus_flows_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL
);


-- public.directus_notifications definition

-- Drop table

-- DROP TABLE public.directus_notifications;

CREATE TABLE public.directus_notifications (
	id serial4 NOT NULL,
	"timestamp" timestamptz NULL DEFAULT CURRENT_TIMESTAMP,
	status varchar(255) NULL DEFAULT 'inbox'::character varying,
	recipient uuid NOT NULL,
	sender uuid NULL,
	subject varchar(255) NOT NULL,
	message text NULL,
	collection varchar(64) NULL,
	item varchar(255) NULL,
	CONSTRAINT directus_notifications_pkey PRIMARY KEY (id),
	CONSTRAINT directus_notifications_recipient_foreign FOREIGN KEY (recipient) REFERENCES public.directus_users(id) ON DELETE CASCADE,
	CONSTRAINT directus_notifications_sender_foreign FOREIGN KEY (sender) REFERENCES public.directus_users(id)
);


-- public.directus_operations definition

-- Drop table

-- DROP TABLE public.directus_operations;

CREATE TABLE public.directus_operations (
	id uuid NOT NULL,
	"name" varchar(255) NULL,
	"key" varchar(255) NOT NULL,
	"type" varchar(255) NOT NULL,
	position_x int4 NOT NULL,
	position_y int4 NOT NULL,
	"options" json NULL,
	resolve uuid NULL,
	reject uuid NULL,
	flow uuid NOT NULL,
	date_created timestamptz NULL DEFAULT CURRENT_TIMESTAMP,
	user_created uuid NULL,
	CONSTRAINT directus_operations_pkey PRIMARY KEY (id),
	CONSTRAINT directus_operations_reject_unique UNIQUE (reject),
	CONSTRAINT directus_operations_resolve_unique UNIQUE (resolve),
	CONSTRAINT directus_operations_flow_foreign FOREIGN KEY (flow) REFERENCES public.directus_flows(id) ON DELETE CASCADE,
	CONSTRAINT directus_operations_reject_foreign FOREIGN KEY (reject) REFERENCES public.directus_operations(id),
	CONSTRAINT directus_operations_resolve_foreign FOREIGN KEY (resolve) REFERENCES public.directus_operations(id),
	CONSTRAINT directus_operations_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL
);


-- public.directus_panels definition

-- Drop table

-- DROP TABLE public.directus_panels;

CREATE TABLE public.directus_panels (
	id uuid NOT NULL,
	dashboard uuid NOT NULL,
	"name" varchar(255) NULL,
	icon varchar(30) NULL DEFAULT NULL::character varying,
	color varchar(10) NULL,
	show_header bool NOT NULL DEFAULT false,
	note text NULL,
	"type" varchar(255) NOT NULL,
	position_x int4 NOT NULL,
	position_y int4 NOT NULL,
	width int4 NOT NULL,
	height int4 NOT NULL,
	"options" json NULL,
	date_created timestamptz NULL DEFAULT CURRENT_TIMESTAMP,
	user_created uuid NULL,
	CONSTRAINT directus_panels_pkey PRIMARY KEY (id),
	CONSTRAINT directus_panels_dashboard_foreign FOREIGN KEY (dashboard) REFERENCES public.directus_dashboards(id) ON DELETE CASCADE,
	CONSTRAINT directus_panels_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL
);


-- public.directus_presets definition

-- Drop table

-- DROP TABLE public.directus_presets;

CREATE TABLE public.directus_presets (
	id serial4 NOT NULL,
	bookmark varchar(255) NULL,
	"user" uuid NULL,
	"role" uuid NULL,
	collection varchar(64) NULL,
	"search" varchar(100) NULL,
	layout varchar(100) NULL DEFAULT 'tabular'::character varying,
	layout_query json NULL,
	layout_options json NULL,
	refresh_interval int4 NULL,
	"filter" json NULL,
	icon varchar(30) NULL DEFAULT 'bookmark'::character varying,
	color varchar(255) NULL,
	CONSTRAINT directus_presets_pkey PRIMARY KEY (id),
	CONSTRAINT directus_presets_role_foreign FOREIGN KEY ("role") REFERENCES public.directus_roles(id) ON DELETE CASCADE,
	CONSTRAINT directus_presets_user_foreign FOREIGN KEY ("user") REFERENCES public.directus_users(id) ON DELETE CASCADE
);


-- public.directus_revisions definition

-- Drop table

-- DROP TABLE public.directus_revisions;

CREATE TABLE public.directus_revisions (
	id serial4 NOT NULL,
	activity int4 NOT NULL,
	collection varchar(64) NOT NULL,
	item varchar(255) NOT NULL,
	"data" json NULL,
	delta json NULL,
	parent int4 NULL,
	"version" uuid NULL,
	CONSTRAINT directus_revisions_pkey PRIMARY KEY (id),
	CONSTRAINT directus_revisions_activity_foreign FOREIGN KEY (activity) REFERENCES public.directus_activity(id) ON DELETE CASCADE,
	CONSTRAINT directus_revisions_parent_foreign FOREIGN KEY (parent) REFERENCES public.directus_revisions(id),
	CONSTRAINT directus_revisions_version_foreign FOREIGN KEY ("version") REFERENCES public.directus_versions(id) ON DELETE CASCADE
);


-- public.directus_settings definition

-- Drop table

-- DROP TABLE public.directus_settings;

CREATE TABLE public.directus_settings (
	id serial4 NOT NULL,
	project_name varchar(100) NOT NULL DEFAULT 'Directus'::character varying,
	project_url varchar(255) NULL,
	project_color varchar(255) NOT NULL DEFAULT '#6644FF'::character varying,
	project_logo uuid NULL,
	public_foreground uuid NULL,
	public_background uuid NULL,
	public_note text NULL,
	auth_login_attempts int4 NULL DEFAULT 25,
	auth_password_policy varchar(100) NULL,
	storage_asset_transform varchar(7) NULL DEFAULT 'all'::character varying,
	storage_asset_presets json NULL,
	custom_css text NULL,
	storage_default_folder uuid NULL,
	basemaps json NULL,
	mapbox_key varchar(255) NULL,
	module_bar json NULL,
	project_descriptor varchar(100) NULL,
	default_language varchar(255) NOT NULL DEFAULT 'en-US'::character varying,
	custom_aspect_ratios json NULL,
	public_favicon uuid NULL,
	default_appearance varchar(255) NOT NULL DEFAULT 'auto'::character varying,
	default_theme_light varchar(255) NULL,
	theme_light_overrides json NULL,
	default_theme_dark varchar(255) NULL,
	theme_dark_overrides json NULL,
	CONSTRAINT directus_settings_pkey PRIMARY KEY (id),
	CONSTRAINT directus_settings_project_logo_foreign FOREIGN KEY (project_logo) REFERENCES public.directus_files(id),
	CONSTRAINT directus_settings_public_background_foreign FOREIGN KEY (public_background) REFERENCES public.directus_files(id),
	CONSTRAINT directus_settings_public_favicon_foreign FOREIGN KEY (public_favicon) REFERENCES public.directus_files(id),
	CONSTRAINT directus_settings_public_foreground_foreign FOREIGN KEY (public_foreground) REFERENCES public.directus_files(id),
	CONSTRAINT directus_settings_storage_default_folder_foreign FOREIGN KEY (storage_default_folder) REFERENCES public.directus_folders(id) ON DELETE SET NULL
);


-- public.directus_shares definition

-- Drop table

-- DROP TABLE public.directus_shares;

CREATE TABLE public.directus_shares (
	id uuid NOT NULL,
	"name" varchar(255) NULL,
	collection varchar(64) NOT NULL,
	item varchar(255) NOT NULL,
	"role" uuid NULL,
	"password" varchar(255) NULL,
	user_created uuid NULL,
	date_created timestamptz NULL DEFAULT CURRENT_TIMESTAMP,
	date_start timestamptz NULL,
	date_end timestamptz NULL,
	times_used int4 NULL DEFAULT 0,
	max_uses int4 NULL,
	CONSTRAINT directus_shares_pkey PRIMARY KEY (id),
	CONSTRAINT directus_shares_collection_foreign FOREIGN KEY (collection) REFERENCES public.directus_collections(collection) ON DELETE CASCADE,
	CONSTRAINT directus_shares_role_foreign FOREIGN KEY ("role") REFERENCES public.directus_roles(id) ON DELETE CASCADE,
	CONSTRAINT directus_shares_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL
);


-- public.directus_sessions definition

-- Drop table

-- DROP TABLE public.directus_sessions;

CREATE TABLE public.directus_sessions (
	"token" varchar(64) NOT NULL,
	"user" uuid NULL,
	expires timestamptz NOT NULL,
	ip varchar(255) NULL,
	user_agent varchar(255) NULL,
	"share" uuid NULL,
	origin varchar(255) NULL,
	CONSTRAINT directus_sessions_pkey PRIMARY KEY (token),
	CONSTRAINT directus_sessions_share_foreign FOREIGN KEY ("share") REFERENCES public.directus_shares(id) ON DELETE CASCADE,
	CONSTRAINT directus_sessions_user_foreign FOREIGN KEY ("user") REFERENCES public.directus_users(id) ON DELETE CASCADE
);
