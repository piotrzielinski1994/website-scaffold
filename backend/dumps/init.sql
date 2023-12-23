--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Debian 12.17-1.pgdg120+1)
-- Dumped by pg_dump version 12.17 (Debian 12.17-1.pgdg120+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: directus_activity; Type: TABLE; Schema: public; Owner: website-scaffold
--

CREATE TABLE public.directus_activity (
    id integer NOT NULL,
    action character varying(45) NOT NULL,
    "user" uuid,
    "timestamp" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    ip character varying(50),
    user_agent character varying(255),
    collection character varying(64) NOT NULL,
    item character varying(255) NOT NULL,
    comment text,
    origin character varying(255)
);


ALTER TABLE public.directus_activity OWNER TO "website-scaffold";

--
-- Name: directus_activity_id_seq; Type: SEQUENCE; Schema: public; Owner: website-scaffold
--

CREATE SEQUENCE public.directus_activity_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directus_activity_id_seq OWNER TO "website-scaffold";

--
-- Name: directus_activity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: website-scaffold
--

ALTER SEQUENCE public.directus_activity_id_seq OWNED BY public.directus_activity.id;


--
-- Name: directus_collections; Type: TABLE; Schema: public; Owner: website-scaffold
--

CREATE TABLE public.directus_collections (
    collection character varying(64) NOT NULL,
    icon character varying(30),
    note text,
    display_template character varying(255),
    hidden boolean DEFAULT false NOT NULL,
    singleton boolean DEFAULT false NOT NULL,
    translations json,
    archive_field character varying(64),
    archive_app_filter boolean DEFAULT true NOT NULL,
    archive_value character varying(255),
    unarchive_value character varying(255),
    sort_field character varying(64),
    accountability character varying(255) DEFAULT 'all'::character varying,
    color character varying(255),
    item_duplication_fields json,
    sort integer,
    "group" character varying(64),
    collapse character varying(255) DEFAULT 'open'::character varying NOT NULL,
    preview_url character varying(255),
    versioning boolean DEFAULT false NOT NULL
);


ALTER TABLE public.directus_collections OWNER TO "website-scaffold";

--
-- Name: directus_dashboards; Type: TABLE; Schema: public; Owner: website-scaffold
--

CREATE TABLE public.directus_dashboards (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    icon character varying(30) DEFAULT 'dashboard'::character varying NOT NULL,
    note text,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid,
    color character varying(255)
);


ALTER TABLE public.directus_dashboards OWNER TO "website-scaffold";

--
-- Name: directus_extensions; Type: TABLE; Schema: public; Owner: website-scaffold
--

CREATE TABLE public.directus_extensions (
    name character varying(255) NOT NULL,
    enabled boolean DEFAULT true NOT NULL
);


ALTER TABLE public.directus_extensions OWNER TO "website-scaffold";

--
-- Name: directus_fields; Type: TABLE; Schema: public; Owner: website-scaffold
--

CREATE TABLE public.directus_fields (
    id integer NOT NULL,
    collection character varying(64) NOT NULL,
    field character varying(64) NOT NULL,
    special character varying(64),
    interface character varying(64),
    options json,
    display character varying(64),
    display_options json,
    readonly boolean DEFAULT false NOT NULL,
    hidden boolean DEFAULT false NOT NULL,
    sort integer,
    width character varying(30) DEFAULT 'full'::character varying,
    translations json,
    note text,
    conditions json,
    required boolean DEFAULT false,
    "group" character varying(64),
    validation json,
    validation_message text
);


ALTER TABLE public.directus_fields OWNER TO "website-scaffold";

--
-- Name: directus_fields_id_seq; Type: SEQUENCE; Schema: public; Owner: website-scaffold
--

CREATE SEQUENCE public.directus_fields_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directus_fields_id_seq OWNER TO "website-scaffold";

--
-- Name: directus_fields_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: website-scaffold
--

ALTER SEQUENCE public.directus_fields_id_seq OWNED BY public.directus_fields.id;


--
-- Name: directus_files; Type: TABLE; Schema: public; Owner: website-scaffold
--

CREATE TABLE public.directus_files (
    id uuid NOT NULL,
    storage character varying(255) NOT NULL,
    filename_disk character varying(255),
    filename_download character varying(255) NOT NULL,
    title character varying(255),
    type character varying(255),
    folder uuid,
    uploaded_by uuid,
    uploaded_on timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    modified_by uuid,
    modified_on timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    charset character varying(50),
    filesize bigint,
    width integer,
    height integer,
    duration integer,
    embed character varying(200),
    description text,
    location text,
    tags text,
    metadata json
);


ALTER TABLE public.directus_files OWNER TO "website-scaffold";

--
-- Name: directus_flows; Type: TABLE; Schema: public; Owner: website-scaffold
--

CREATE TABLE public.directus_flows (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    icon character varying(30),
    color character varying(255),
    description text,
    status character varying(255) DEFAULT 'active'::character varying NOT NULL,
    trigger character varying(255),
    accountability character varying(255) DEFAULT 'all'::character varying,
    options json,
    operation uuid,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid
);


ALTER TABLE public.directus_flows OWNER TO "website-scaffold";

--
-- Name: directus_folders; Type: TABLE; Schema: public; Owner: website-scaffold
--

CREATE TABLE public.directus_folders (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    parent uuid
);


ALTER TABLE public.directus_folders OWNER TO "website-scaffold";

--
-- Name: directus_migrations; Type: TABLE; Schema: public; Owner: website-scaffold
--

CREATE TABLE public.directus_migrations (
    version character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    "timestamp" timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.directus_migrations OWNER TO "website-scaffold";

--
-- Name: directus_notifications; Type: TABLE; Schema: public; Owner: website-scaffold
--

CREATE TABLE public.directus_notifications (
    id integer NOT NULL,
    "timestamp" timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    status character varying(255) DEFAULT 'inbox'::character varying,
    recipient uuid NOT NULL,
    sender uuid,
    subject character varying(255) NOT NULL,
    message text,
    collection character varying(64),
    item character varying(255)
);


ALTER TABLE public.directus_notifications OWNER TO "website-scaffold";

--
-- Name: directus_notifications_id_seq; Type: SEQUENCE; Schema: public; Owner: website-scaffold
--

CREATE SEQUENCE public.directus_notifications_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directus_notifications_id_seq OWNER TO "website-scaffold";

--
-- Name: directus_notifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: website-scaffold
--

ALTER SEQUENCE public.directus_notifications_id_seq OWNED BY public.directus_notifications.id;


--
-- Name: directus_operations; Type: TABLE; Schema: public; Owner: website-scaffold
--

CREATE TABLE public.directus_operations (
    id uuid NOT NULL,
    name character varying(255),
    key character varying(255) NOT NULL,
    type character varying(255) NOT NULL,
    position_x integer NOT NULL,
    position_y integer NOT NULL,
    options json,
    resolve uuid,
    reject uuid,
    flow uuid NOT NULL,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid
);


ALTER TABLE public.directus_operations OWNER TO "website-scaffold";

--
-- Name: directus_panels; Type: TABLE; Schema: public; Owner: website-scaffold
--

CREATE TABLE public.directus_panels (
    id uuid NOT NULL,
    dashboard uuid NOT NULL,
    name character varying(255),
    icon character varying(30) DEFAULT NULL::character varying,
    color character varying(10),
    show_header boolean DEFAULT false NOT NULL,
    note text,
    type character varying(255) NOT NULL,
    position_x integer NOT NULL,
    position_y integer NOT NULL,
    width integer NOT NULL,
    height integer NOT NULL,
    options json,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid
);


ALTER TABLE public.directus_panels OWNER TO "website-scaffold";

--
-- Name: directus_permissions; Type: TABLE; Schema: public; Owner: website-scaffold
--

CREATE TABLE public.directus_permissions (
    id integer NOT NULL,
    role uuid,
    collection character varying(64) NOT NULL,
    action character varying(10) NOT NULL,
    permissions json,
    validation json,
    presets json,
    fields text
);


ALTER TABLE public.directus_permissions OWNER TO "website-scaffold";

--
-- Name: directus_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: website-scaffold
--

CREATE SEQUENCE public.directus_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directus_permissions_id_seq OWNER TO "website-scaffold";

--
-- Name: directus_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: website-scaffold
--

ALTER SEQUENCE public.directus_permissions_id_seq OWNED BY public.directus_permissions.id;


--
-- Name: directus_presets; Type: TABLE; Schema: public; Owner: website-scaffold
--

CREATE TABLE public.directus_presets (
    id integer NOT NULL,
    bookmark character varying(255),
    "user" uuid,
    role uuid,
    collection character varying(64),
    search character varying(100),
    layout character varying(100) DEFAULT 'tabular'::character varying,
    layout_query json,
    layout_options json,
    refresh_interval integer,
    filter json,
    icon character varying(30) DEFAULT 'bookmark'::character varying,
    color character varying(255)
);


ALTER TABLE public.directus_presets OWNER TO "website-scaffold";

--
-- Name: directus_presets_id_seq; Type: SEQUENCE; Schema: public; Owner: website-scaffold
--

CREATE SEQUENCE public.directus_presets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directus_presets_id_seq OWNER TO "website-scaffold";

--
-- Name: directus_presets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: website-scaffold
--

ALTER SEQUENCE public.directus_presets_id_seq OWNED BY public.directus_presets.id;


--
-- Name: directus_relations; Type: TABLE; Schema: public; Owner: website-scaffold
--

CREATE TABLE public.directus_relations (
    id integer NOT NULL,
    many_collection character varying(64) NOT NULL,
    many_field character varying(64) NOT NULL,
    one_collection character varying(64),
    one_field character varying(64),
    one_collection_field character varying(64),
    one_allowed_collections text,
    junction_field character varying(64),
    sort_field character varying(64),
    one_deselect_action character varying(255) DEFAULT 'nullify'::character varying NOT NULL
);


ALTER TABLE public.directus_relations OWNER TO "website-scaffold";

--
-- Name: directus_relations_id_seq; Type: SEQUENCE; Schema: public; Owner: website-scaffold
--

CREATE SEQUENCE public.directus_relations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directus_relations_id_seq OWNER TO "website-scaffold";

--
-- Name: directus_relations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: website-scaffold
--

ALTER SEQUENCE public.directus_relations_id_seq OWNED BY public.directus_relations.id;


--
-- Name: directus_revisions; Type: TABLE; Schema: public; Owner: website-scaffold
--

CREATE TABLE public.directus_revisions (
    id integer NOT NULL,
    activity integer NOT NULL,
    collection character varying(64) NOT NULL,
    item character varying(255) NOT NULL,
    data json,
    delta json,
    parent integer,
    version uuid
);


ALTER TABLE public.directus_revisions OWNER TO "website-scaffold";

--
-- Name: directus_revisions_id_seq; Type: SEQUENCE; Schema: public; Owner: website-scaffold
--

CREATE SEQUENCE public.directus_revisions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directus_revisions_id_seq OWNER TO "website-scaffold";

--
-- Name: directus_revisions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: website-scaffold
--

ALTER SEQUENCE public.directus_revisions_id_seq OWNED BY public.directus_revisions.id;


--
-- Name: directus_roles; Type: TABLE; Schema: public; Owner: website-scaffold
--

CREATE TABLE public.directus_roles (
    id uuid NOT NULL,
    name character varying(100) NOT NULL,
    icon character varying(30) DEFAULT 'supervised_user_circle'::character varying NOT NULL,
    description text,
    ip_access text,
    enforce_tfa boolean DEFAULT false NOT NULL,
    admin_access boolean DEFAULT false NOT NULL,
    app_access boolean DEFAULT true NOT NULL
);


ALTER TABLE public.directus_roles OWNER TO "website-scaffold";

--
-- Name: directus_sessions; Type: TABLE; Schema: public; Owner: website-scaffold
--

CREATE TABLE public.directus_sessions (
    token character varying(64) NOT NULL,
    "user" uuid,
    expires timestamp with time zone NOT NULL,
    ip character varying(255),
    user_agent character varying(255),
    share uuid,
    origin character varying(255)
);


ALTER TABLE public.directus_sessions OWNER TO "website-scaffold";

--
-- Name: directus_settings; Type: TABLE; Schema: public; Owner: website-scaffold
--

CREATE TABLE public.directus_settings (
    id integer NOT NULL,
    project_name character varying(100) DEFAULT 'Directus'::character varying NOT NULL,
    project_url character varying(255),
    project_color character varying(255) DEFAULT '#6644FF'::character varying NOT NULL,
    project_logo uuid,
    public_foreground uuid,
    public_background uuid,
    public_note text,
    auth_login_attempts integer DEFAULT 25,
    auth_password_policy character varying(100),
    storage_asset_transform character varying(7) DEFAULT 'all'::character varying,
    storage_asset_presets json,
    custom_css text,
    storage_default_folder uuid,
    basemaps json,
    mapbox_key character varying(255),
    module_bar json,
    project_descriptor character varying(100),
    default_language character varying(255) DEFAULT 'en-US'::character varying NOT NULL,
    custom_aspect_ratios json,
    public_favicon uuid,
    default_appearance character varying(255) DEFAULT 'auto'::character varying NOT NULL,
    default_theme_light character varying(255),
    theme_light_overrides json,
    default_theme_dark character varying(255),
    theme_dark_overrides json
);


ALTER TABLE public.directus_settings OWNER TO "website-scaffold";

--
-- Name: directus_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: website-scaffold
--

CREATE SEQUENCE public.directus_settings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directus_settings_id_seq OWNER TO "website-scaffold";

--
-- Name: directus_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: website-scaffold
--

ALTER SEQUENCE public.directus_settings_id_seq OWNED BY public.directus_settings.id;


--
-- Name: directus_shares; Type: TABLE; Schema: public; Owner: website-scaffold
--

CREATE TABLE public.directus_shares (
    id uuid NOT NULL,
    name character varying(255),
    collection character varying(64) NOT NULL,
    item character varying(255) NOT NULL,
    role uuid,
    password character varying(255),
    user_created uuid,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    date_start timestamp with time zone,
    date_end timestamp with time zone,
    times_used integer DEFAULT 0,
    max_uses integer
);


ALTER TABLE public.directus_shares OWNER TO "website-scaffold";

--
-- Name: directus_translations; Type: TABLE; Schema: public; Owner: website-scaffold
--

CREATE TABLE public.directus_translations (
    id uuid NOT NULL,
    language character varying(255) NOT NULL,
    key character varying(255) NOT NULL,
    value text NOT NULL
);


ALTER TABLE public.directus_translations OWNER TO "website-scaffold";

--
-- Name: directus_users; Type: TABLE; Schema: public; Owner: website-scaffold
--

CREATE TABLE public.directus_users (
    id uuid NOT NULL,
    first_name character varying(50),
    last_name character varying(50),
    email character varying(128),
    password character varying(255),
    location character varying(255),
    title character varying(50),
    description text,
    tags json,
    avatar uuid,
    language character varying(255) DEFAULT NULL::character varying,
    tfa_secret character varying(255),
    status character varying(16) DEFAULT 'active'::character varying NOT NULL,
    role uuid,
    token character varying(255),
    last_access timestamp with time zone,
    last_page character varying(255),
    provider character varying(128) DEFAULT 'default'::character varying NOT NULL,
    external_identifier character varying(255),
    auth_data json,
    email_notifications boolean DEFAULT true,
    appearance character varying(255),
    theme_dark character varying(255),
    theme_light character varying(255),
    theme_light_overrides json,
    theme_dark_overrides json
);


ALTER TABLE public.directus_users OWNER TO "website-scaffold";

--
-- Name: directus_versions; Type: TABLE; Schema: public; Owner: website-scaffold
--

CREATE TABLE public.directus_versions (
    id uuid NOT NULL,
    key character varying(64) NOT NULL,
    name character varying(255),
    collection character varying(64) NOT NULL,
    item character varying(255) NOT NULL,
    hash character varying(255),
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    date_updated timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid,
    user_updated uuid
);


ALTER TABLE public.directus_versions OWNER TO "website-scaffold";

--
-- Name: directus_webhooks; Type: TABLE; Schema: public; Owner: website-scaffold
--

CREATE TABLE public.directus_webhooks (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    method character varying(10) DEFAULT 'POST'::character varying NOT NULL,
    url character varying(255) NOT NULL,
    status character varying(10) DEFAULT 'active'::character varying NOT NULL,
    data boolean DEFAULT true NOT NULL,
    actions character varying(100) NOT NULL,
    collections character varying(255) NOT NULL,
    headers json
);


ALTER TABLE public.directus_webhooks OWNER TO "website-scaffold";

--
-- Name: directus_webhooks_id_seq; Type: SEQUENCE; Schema: public; Owner: website-scaffold
--

CREATE SEQUENCE public.directus_webhooks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directus_webhooks_id_seq OWNER TO "website-scaffold";

--
-- Name: directus_webhooks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: website-scaffold
--

ALTER SEQUENCE public.directus_webhooks_id_seq OWNED BY public.directus_webhooks.id;


--
-- Name: languages; Type: TABLE; Schema: public; Owner: website-scaffold
--

CREATE TABLE public.languages (
    code character varying(255) NOT NULL,
    name character varying(20) NOT NULL
);


ALTER TABLE public.languages OWNER TO "website-scaffold";

--
-- Name: pages; Type: TABLE; Schema: public; Owner: website-scaffold
--

CREATE TABLE public.pages (
    id uuid NOT NULL,
    status character varying(255) DEFAULT 'draft'::character varying NOT NULL,
    sort integer,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    layout character varying(255) DEFAULT 'default'::character varying,
    menu json DEFAULT '["main-menu"]'::json,
    parent_page uuid
);


ALTER TABLE public.pages OWNER TO "website-scaffold";

--
-- Name: pages_translations; Type: TABLE; Schema: public; Owner: website-scaffold
--

CREATE TABLE public.pages_translations (
    id integer NOT NULL,
    pages_id uuid,
    languages_code character varying(255),
    seo uuid
);


ALTER TABLE public.pages_translations OWNER TO "website-scaffold";

--
-- Name: pages_translations_id_seq; Type: SEQUENCE; Schema: public; Owner: website-scaffold
--

CREATE SEQUENCE public.pages_translations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pages_translations_id_seq OWNER TO "website-scaffold";

--
-- Name: pages_translations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: website-scaffold
--

ALTER SEQUENCE public.pages_translations_id_seq OWNED BY public.pages_translations.id;


--
-- Name: seo; Type: TABLE; Schema: public; Owner: website-scaffold
--

CREATE TABLE public.seo (
    id uuid NOT NULL,
    title character varying(255),
    description text,
    image uuid,
    slug character varying(255)
);


ALTER TABLE public.seo OWNER TO "website-scaffold";

--
-- Name: directus_activity id; Type: DEFAULT; Schema: public; Owner: website-scaffold
--

ALTER TABLE ONLY public.directus_activity ALTER COLUMN id SET DEFAULT nextval('public.directus_activity_id_seq'::regclass);


--
-- Name: directus_fields id; Type: DEFAULT; Schema: public; Owner: website-scaffold
--

ALTER TABLE ONLY public.directus_fields ALTER COLUMN id SET DEFAULT nextval('public.directus_fields_id_seq'::regclass);


--
-- Name: directus_notifications id; Type: DEFAULT; Schema: public; Owner: website-scaffold
--

ALTER TABLE ONLY public.directus_notifications ALTER COLUMN id SET DEFAULT nextval('public.directus_notifications_id_seq'::regclass);


--
-- Name: directus_permissions id; Type: DEFAULT; Schema: public; Owner: website-scaffold
--

ALTER TABLE ONLY public.directus_permissions ALTER COLUMN id SET DEFAULT nextval('public.directus_permissions_id_seq'::regclass);


--
-- Name: directus_presets id; Type: DEFAULT; Schema: public; Owner: website-scaffold
--

ALTER TABLE ONLY public.directus_presets ALTER COLUMN id SET DEFAULT nextval('public.directus_presets_id_seq'::regclass);


--
-- Name: directus_relations id; Type: DEFAULT; Schema: public; Owner: website-scaffold
--

ALTER TABLE ONLY public.directus_relations ALTER COLUMN id SET DEFAULT nextval('public.directus_relations_id_seq'::regclass);


--
-- Name: directus_revisions id; Type: DEFAULT; Schema: public; Owner: website-scaffold
--

ALTER TABLE ONLY public.directus_revisions ALTER COLUMN id SET DEFAULT nextval('public.directus_revisions_id_seq'::regclass);


--
-- Name: directus_settings id; Type: DEFAULT; Schema: public; Owner: website-scaffold
--

ALTER TABLE ONLY public.directus_settings ALTER COLUMN id SET DEFAULT nextval('public.directus_settings_id_seq'::regclass);


--
-- Name: directus_webhooks id; Type: DEFAULT; Schema: public; Owner: website-scaffold
--

ALTER TABLE ONLY public.directus_webhooks ALTER COLUMN id SET DEFAULT nextval('public.directus_webhooks_id_seq'::regclass);


--
-- Name: pages_translations id; Type: DEFAULT; Schema: public; Owner: website-scaffold
--

ALTER TABLE ONLY public.pages_translations ALTER COLUMN id SET DEFAULT nextval('public.pages_translations_id_seq'::regclass);


--
-- Data for Name: directus_activity; Type: TABLE DATA; Schema: public; Owner: website-scaffold
--

COPY public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) FROM stdin;
1	login	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 19:27:44.26+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_users	fc0ef3e9-0944-4dae-aedd-c1616608ece1	\N	http://localhost:3001
2	create	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 19:30:02.724+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_collections	system	\N	http://localhost:3001
3	create	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 19:32:29.497+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_collections	content	\N	http://localhost:3001
4	create	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 19:32:49.832+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_collections	blocks	\N	http://localhost:3001
5	update	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 19:33:35.631+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_collections	content	\N	http://localhost:3001
6	update	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 19:33:35.637+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_collections	blocks	\N	http://localhost:3001
7	update	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 19:33:35.642+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_collections	system	\N	http://localhost:3001
8	update	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 19:33:40.279+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_collections	blocks	\N	http://localhost:3001
9	update	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 19:33:40.284+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_collections	content	\N	http://localhost:3001
10	update	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 19:33:40.288+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_collections	system	\N	http://localhost:3001
11	update	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 19:33:44.125+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_collections	blocks	\N	http://localhost:3001
12	create	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 19:40:06.376+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_fields	1	\N	http://localhost:3001
13	create	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 19:40:06.38+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_collections	languages	\N	http://localhost:3001
14	create	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 19:40:21.902+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_fields	2	\N	http://localhost:3001
15	update	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 19:40:46.676+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_fields	2	\N	http://localhost:3001
16	update	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 19:41:07.626+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_fields	1	\N	http://localhost:3001
17	update	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 19:42:39.938+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_collections	blocks	\N	http://localhost:3001
18	update	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 19:42:39.939+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_collections	languages	\N	http://localhost:3001
19	update	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 19:42:39.945+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_collections	content	\N	http://localhost:3001
20	update	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 19:42:39.951+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_collections	system	\N	http://localhost:3001
21	create	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 19:43:02.815+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_fields	3	\N	http://localhost:3001
22	create	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 19:43:02.818+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_collections	seo	\N	http://localhost:3001
23	create	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 19:45:25.27+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_fields	4	\N	http://localhost:3001
24	update	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 19:46:02.107+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_fields	4	\N	http://localhost:3001
25	create	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 19:46:50.606+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_fields	5	\N	http://localhost:3001
26	create	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 19:47:06.027+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_fields	6	\N	http://localhost:3001
27	update	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 19:47:12.58+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_collections	blocks	\N	http://localhost:3001
28	update	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 19:47:12.58+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_collections	seo	\N	http://localhost:3001
29	update	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 19:47:12.585+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_collections	content	\N	http://localhost:3001
30	update	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 19:47:12.59+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_collections	system	\N	http://localhost:3001
31	update	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 19:47:16.927+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_collections	seo	\N	http://localhost:3001
32	create	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 19:48:09.979+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_fields	7	\N	http://localhost:3001
33	update	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 19:48:20.867+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_collections	content	\N	http://localhost:3001
34	update	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 19:48:20.871+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_collections	blocks	\N	http://localhost:3001
35	update	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 19:48:20.876+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_collections	system	\N	http://localhost:3001
36	create	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 19:51:37.463+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_fields	8	\N	http://localhost:3001
37	create	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 19:51:37.467+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_fields	9	\N	http://localhost:3001
38	create	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 19:51:37.47+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_fields	10	\N	http://localhost:3001
39	create	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 19:51:37.473+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_fields	11	\N	http://localhost:3001
40	create	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 19:51:37.475+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_fields	12	\N	http://localhost:3001
41	create	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 19:51:37.478+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_collections	pages	\N	http://localhost:3001
42	create	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 19:53:43.112+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_fields	13	\N	http://localhost:3001
43	create	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 19:53:43.159+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_fields	14	\N	http://localhost:3001
44	create	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 19:53:43.162+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_collections	pages_translations	\N	http://localhost:3001
45	create	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 19:53:43.193+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_fields	15	\N	http://localhost:3001
46	create	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 19:53:43.227+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_fields	16	\N	http://localhost:3001
47	update	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 19:54:38.362+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_fields	13	\N	http://localhost:3001
48	update	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 19:54:43.774+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_collections	pages	\N	http://localhost:3001
49	update	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 19:54:49.835+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_collections	content	\N	http://localhost:3001
50	update	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 19:54:49.835+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_collections	pages	\N	http://localhost:3001
51	update	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 19:54:49.841+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_collections	seo	\N	http://localhost:3001
52	update	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 19:54:49.841+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_collections	blocks	\N	http://localhost:3001
53	update	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 19:54:49.846+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_collections	system	\N	http://localhost:3001
54	update	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 19:54:49.849+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_collections	pages_translations	\N	http://localhost:3001
55	update	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 19:54:52.261+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_collections	pages_translations	\N	http://localhost:3001
56	update	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 19:54:52.261+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_collections	content	\N	http://localhost:3001
57	update	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 19:54:52.266+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_collections	blocks	\N	http://localhost:3001
58	update	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 19:54:52.27+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_collections	system	\N	http://localhost:3001
59	create	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 19:55:25.718+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_translations	eea7a6f4-b65f-4b50-98b3-30b06c01d66e	\N	http://localhost:3001
60	create	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 19:55:36.131+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_translations	e8dc9d68-5bb9-44db-85c6-960e3cf008a7	\N	http://localhost:3001
61	create	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 19:56:03.831+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_fields	17	\N	http://localhost:3001
62	update	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 19:56:20.597+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_fields	17	\N	http://localhost:3001
63	create	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 19:57:06.335+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_translations	9efa2127-862a-4526-b6f5-12c9771db64c	\N	http://localhost:3001
64	create	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 19:57:17.849+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_translations	7450f054-c1fa-4d18-b7cd-386791c3315c	\N	http://localhost:3001
65	create	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 19:57:37.136+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_translations	c2db5f24-d803-4073-a02d-92e8bc0c16dd	\N	http://localhost:3001
66	create	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 19:57:46.193+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_translations	85e194be-38ef-48a3-992e-264c4f3ec262	\N	http://localhost:3001
67	create	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 19:58:03.63+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_fields	18	\N	http://localhost:3001
68	update	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 19:58:20.313+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_fields	18	\N	http://localhost:3001
69	create	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 19:59:02.603+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_fields	19	\N	http://localhost:3001
70	update	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 19:59:23.096+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_fields	19	\N	http://localhost:3001
71	create	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 20:00:10.777+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_fields	20	\N	http://localhost:3001
72	update	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 20:00:12.851+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_fields	3	\N	http://localhost:3001
73	update	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 20:00:12.867+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_fields	20	\N	http://localhost:3001
74	update	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 20:00:12.883+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_fields	4	\N	http://localhost:3001
75	update	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 20:00:12.898+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_fields	5	\N	http://localhost:3001
76	update	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 20:00:12.913+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_fields	6	\N	http://localhost:3001
78	create	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 20:01:11.181+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_fields	21	\N	http://localhost:3001
81	update	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 20:02:37.234+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_fields	8	\N	http://localhost:3001
82	update	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 20:02:37.251+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_fields	10	\N	http://localhost:3001
83	update	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 20:02:37.266+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_fields	9	\N	http://localhost:3001
84	update	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 20:02:37.285+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_fields	11	\N	http://localhost:3001
85	update	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 20:02:37.301+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_fields	12	\N	http://localhost:3001
86	update	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 20:02:37.316+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_fields	13	\N	http://localhost:3001
87	update	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 20:02:37.331+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_fields	17	\N	http://localhost:3001
88	update	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 20:02:37.345+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_fields	18	\N	http://localhost:3001
89	update	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 20:02:37.359+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_fields	19	\N	http://localhost:3001
90	update	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 20:02:37.375+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_fields	22	\N	http://localhost:3001
91	update	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 20:02:40.114+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_fields	8	\N	http://localhost:3001
92	update	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 20:02:40.128+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_fields	10	\N	http://localhost:3001
93	update	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 20:02:40.14+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_fields	11	\N	http://localhost:3001
94	update	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 20:02:40.157+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_fields	9	\N	http://localhost:3001
95	update	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 20:02:40.174+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_fields	12	\N	http://localhost:3001
96	update	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 20:02:40.187+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_fields	13	\N	http://localhost:3001
97	update	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 20:02:40.201+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_fields	17	\N	http://localhost:3001
98	update	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 20:02:40.216+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_fields	18	\N	http://localhost:3001
99	update	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 20:02:40.231+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_fields	19	\N	http://localhost:3001
100	update	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 20:02:40.246+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_fields	22	\N	http://localhost:3001
101	update	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 20:02:41.835+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_fields	8	\N	http://localhost:3001
102	update	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 20:02:41.847+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_fields	10	\N	http://localhost:3001
103	update	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 20:02:41.859+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_fields	11	\N	http://localhost:3001
104	update	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 20:02:41.873+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_fields	12	\N	http://localhost:3001
105	update	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 20:02:41.886+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_fields	9	\N	http://localhost:3001
106	update	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 20:02:41.898+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_fields	13	\N	http://localhost:3001
107	update	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 20:02:41.915+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_fields	17	\N	http://localhost:3001
108	update	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 20:02:41.931+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_fields	18	\N	http://localhost:3001
109	update	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 20:02:41.945+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_fields	19	\N	http://localhost:3001
110	update	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 20:02:41.958+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_fields	22	\N	http://localhost:3001
111	update	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 20:02:47.884+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_fields	8	\N	http://localhost:3001
112	update	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 20:02:47.896+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_fields	11	\N	http://localhost:3001
113	update	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 20:02:47.908+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_fields	12	\N	http://localhost:3001
114	update	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 20:02:47.921+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_fields	10	\N	http://localhost:3001
77	update	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 20:00:40.489+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_fields	20	\N	http://localhost:3001
79	create	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 20:01:58.034+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_fields	22	\N	http://localhost:3001
80	update	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 20:02:15.458+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_fields	22	\N	http://localhost:3001
132	update	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 20:03:05.239+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_fields	19	\N	http://localhost:3001
163	create	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 20:03:36.729+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	languages	en-US	\N	http://localhost:3001
115	update	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 20:02:47.933+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_fields	9	\N	http://localhost:3001
116	update	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 20:02:47.945+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_fields	13	\N	http://localhost:3001
117	update	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 20:02:47.959+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_fields	17	\N	http://localhost:3001
118	update	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 20:02:47.972+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_fields	18	\N	http://localhost:3001
119	update	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 20:02:47.985+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_fields	19	\N	http://localhost:3001
120	update	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 20:02:48.005+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_fields	22	\N	http://localhost:3001
121	update	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 20:02:58.724+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_fields	8	\N	http://localhost:3001
122	update	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 20:02:58.741+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_fields	11	\N	http://localhost:3001
123	update	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 20:02:58.757+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_fields	12	\N	http://localhost:3001
124	update	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 20:02:58.771+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_fields	10	\N	http://localhost:3001
125	update	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 20:02:58.787+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_fields	9	\N	http://localhost:3001
126	update	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 20:02:58.802+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_fields	13	\N	http://localhost:3001
127	update	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 20:02:58.819+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_fields	18	\N	http://localhost:3001
128	update	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 20:02:58.837+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_fields	17	\N	http://localhost:3001
129	update	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 20:02:58.851+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_fields	19	\N	http://localhost:3001
130	update	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 20:02:58.867+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_fields	22	\N	http://localhost:3001
131	update	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 20:03:01.504+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_fields	18	\N	http://localhost:3001
133	update	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 20:03:07.762+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_fields	8	\N	http://localhost:3001
134	update	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 20:03:07.774+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_fields	11	\N	http://localhost:3001
135	update	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 20:03:07.788+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_fields	12	\N	http://localhost:3001
136	update	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 20:03:07.805+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_fields	10	\N	http://localhost:3001
137	update	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 20:03:07.819+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_fields	9	\N	http://localhost:3001
138	update	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 20:03:07.835+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_fields	13	\N	http://localhost:3001
139	update	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 20:03:07.854+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_fields	18	\N	http://localhost:3001
140	update	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 20:03:07.868+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_fields	19	\N	http://localhost:3001
141	update	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 20:03:07.883+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_fields	17	\N	http://localhost:3001
142	update	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 20:03:07.901+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_fields	22	\N	http://localhost:3001
143	update	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 20:03:09.374+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_fields	8	\N	http://localhost:3001
144	update	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 20:03:09.388+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_fields	11	\N	http://localhost:3001
145	update	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 20:03:09.407+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_fields	12	\N	http://localhost:3001
146	update	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 20:03:09.42+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_fields	10	\N	http://localhost:3001
147	update	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 20:03:09.434+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_fields	9	\N	http://localhost:3001
148	update	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 20:03:09.447+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_fields	13	\N	http://localhost:3001
149	update	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 20:03:09.462+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_fields	18	\N	http://localhost:3001
150	update	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 20:03:09.475+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_fields	19	\N	http://localhost:3001
151	update	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 20:03:09.488+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_fields	22	\N	http://localhost:3001
152	update	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 20:03:09.503+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_fields	17	\N	http://localhost:3001
153	update	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 20:03:11.481+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_fields	8	\N	http://localhost:3001
154	update	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 20:03:11.496+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_fields	11	\N	http://localhost:3001
155	update	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 20:03:11.508+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_fields	12	\N	http://localhost:3001
156	update	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 20:03:11.521+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_fields	10	\N	http://localhost:3001
157	update	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 20:03:11.534+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_fields	9	\N	http://localhost:3001
158	update	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 20:03:11.551+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_fields	18	\N	http://localhost:3001
159	update	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 20:03:11.568+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_fields	19	\N	http://localhost:3001
160	update	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 20:03:11.583+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_fields	22	\N	http://localhost:3001
161	update	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 20:03:11.597+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_fields	17	\N	http://localhost:3001
162	update	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 20:03:11.613+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_fields	13	\N	http://localhost:3001
164	create	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 20:03:43.711+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	languages	pl-PL	\N	http://localhost:3001
165	update	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 20:04:55.772+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	directus_fields	19	\N	http://localhost:3001
166	create	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 20:05:34.751+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	seo	1fcc396d-58a7-41cd-ac2e-51ea5b140560	\N	http://localhost:3001
167	create	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 20:05:34.754+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	pages_translations	1	\N	http://localhost:3001
168	create	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 20:05:34.757+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	seo	7b5e0b61-1297-48e2-a0f0-14ac76dd6364	\N	http://localhost:3001
169	create	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 20:05:34.759+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	pages_translations	2	\N	http://localhost:3001
170	create	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 20:05:34.762+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	pages	41449c2e-f83e-4fb5-bf48-80dbe7d3ffb8	\N	http://localhost:3001
171	create	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 20:06:53.093+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	seo	98014689-22f6-4ba3-a523-51a50da4db46	\N	http://localhost:3001
172	create	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 20:06:53.096+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	pages_translations	3	\N	http://localhost:3001
173	create	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 20:06:53.099+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	seo	0e268336-6f5d-4fb3-a33b-5391b8326d59	\N	http://localhost:3001
174	create	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 20:06:53.101+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	pages_translations	4	\N	http://localhost:3001
175	create	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 20:06:53.104+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	pages	fe22a081-f7da-487f-a1bc-a2b448242f08	\N	http://localhost:3001
176	create	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 20:07:25.739+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	seo	3f3d65a3-d443-4cc3-b325-7d4eb7694f4f	\N	http://localhost:3001
177	create	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 20:07:25.742+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	pages_translations	5	\N	http://localhost:3001
178	create	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 20:07:25.745+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	seo	7c58a1ae-dd5d-4fc6-9b30-b60413d96535	\N	http://localhost:3001
179	create	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 20:07:25.747+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	pages_translations	6	\N	http://localhost:3001
180	create	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 20:07:25.75+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	pages	08355f74-b9fb-495a-bc02-e2ca8a3833e7	\N	http://localhost:3001
181	update	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-23 20:07:25.753+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	pages	fe22a081-f7da-487f-a1bc-a2b448242f08	\N	http://localhost:3001
\.


--
-- Data for Name: directus_collections; Type: TABLE DATA; Schema: public; Owner: website-scaffold
--

COPY public.directus_collections (collection, icon, note, display_template, hidden, singleton, translations, archive_field, archive_app_filter, archive_value, unarchive_value, sort_field, accountability, color, item_duplication_fields, sort, "group", collapse, preview_url, versioning) FROM stdin;
languages	\N	\N	\N	f	f	\N	\N	t	\N	\N	\N	all	\N	\N	1	system	open	\N	f
pages	\N	\N	\N	f	f	\N	\N	t	archived	draft	\N	all	\N	\N	1	content	open	\N	f
seo	\N	\N	\N	t	f	\N	\N	t	\N	\N	\N	all	\N	\N	2	content	open	\N	f
pages_translations	import_export	\N	\N	t	f	\N	\N	t	\N	\N	\N	all	\N	\N	1	pages	open	\N	f
content	folder	\N	\N	f	f	[{"language":"en-US","translation":"Content"},{"language":"pl-PL","translation":"Treść"}]	\N	t	\N	\N	\N	all	\N	\N	1	\N	open	\N	f
blocks	folder	\N	\N	f	f	[{"language":"en-US","translation":"Blocks"},{"language":"en-US","translation":"Bloki"}]	\N	t	\N	\N	\N	all	\N	\N	2	\N	open	\N	f
system	folder	\N	\N	f	f	[{"language":"en-US","translation":"System"},{"language":"pl-PL","translation":"System"}]	\N	t	\N	\N	\N	all	\N	\N	3	\N	open	\N	f
\.


--
-- Data for Name: directus_dashboards; Type: TABLE DATA; Schema: public; Owner: website-scaffold
--

COPY public.directus_dashboards (id, name, icon, note, date_created, user_created, color) FROM stdin;
\.


--
-- Data for Name: directus_extensions; Type: TABLE DATA; Schema: public; Owner: website-scaffold
--

COPY public.directus_extensions (name, enabled) FROM stdin;
\.


--
-- Data for Name: directus_fields; Type: TABLE DATA; Schema: public; Owner: website-scaffold
--

COPY public.directus_fields (id, collection, field, special, interface, options, display, display_options, readonly, hidden, sort, width, translations, note, conditions, required, "group", validation, validation_message) FROM stdin;
1	languages	code	\N	input	\N	\N	\N	f	f	1	full	[{"language":"en-US","translation":"Code"},{"language":"pl-PL","translation":"Kod"}]	\N	\N	f	\N	\N	\N
7	languages	name	\N	input	\N	\N	\N	f	f	2	full	[{"language":"en-US","translation":"Name"},{"language":"pl-PL","translation":"Nazwa"}]	\N	\N	t	\N	\N	\N
14	pages_translations	id	\N	\N	\N	\N	\N	f	t	1	full	\N	\N	\N	f	\N	\N	\N
15	pages_translations	pages_id	\N	\N	\N	\N	\N	f	t	2	full	\N	\N	\N	f	\N	\N	\N
16	pages_translations	languages_code	\N	\N	\N	\N	\N	f	t	3	full	\N	\N	\N	f	\N	\N	\N
8	pages	id	uuid	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N
3	seo	id	uuid	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N
11	pages	created_at	date-created	datetime	\N	datetime	{"relative":true}	t	t	2	half	\N	\N	\N	f	\N	\N	\N
4	seo	title	\N	input	\N	\N	\N	f	f	3	full	[{"language":"en-US","translation":"Title"},{"language":"pl-PL","translation":"Tytuł"}]	\N	\N	t	\N	\N	\N
5	seo	description	\N	input-multiline	{"trim":true}	\N	\N	f	f	4	full	\N	\N	\N	f	\N	\N	\N
6	seo	image	file	file-image	\N	\N	\N	f	f	5	full	\N	\N	\N	f	\N	\N	\N
20	seo	slug	\N	input	{"clear":true,"slug":true,"trim":true}	\N	\N	f	f	2	full	\N	\N	\N	f	\N	\N	\N
21	pages_translations	seo	m2o	select-dropdown-m2o	\N	\N	\N	f	f	4	full	\N	\N	\N	t	\N	\N	\N
12	pages	updated_at	date-updated	datetime	\N	datetime	{"relative":true}	t	t	3	half	\N	\N	\N	f	\N	\N	\N
10	pages	sort	\N	input	\N	\N	\N	f	t	4	full	\N	\N	\N	f	\N	\N	\N
9	pages	status	\N	select-dropdown	{"choices":[{"text":"$t:published","value":"published"},{"text":"$t:draft","value":"draft"},{"text":"$t:archived","value":"archived"}]}	labels	{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","foreground":"#FFFFFF","background":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","foreground":"#18222F","background":"#D3DAE4"},{"text":"$t:archived","value":"archived","foreground":"#FFFFFF","background":"var(--theme--warning)"}]}	f	f	5	full	\N	\N	\N	f	\N	\N	\N
18	pages	menu	cast-json	select-multiple-dropdown	{"choices":[{"text":"$t:Main_Menu","value":"main-menu"},{"text":"$t:Footer","value":"footer"}]}	\N	\N	f	f	6	half	[{"language":"en-US","translation":"Menu"},{"language":"pl-PL","translation":"Menu"}]	\N	\N	t	\N	\N	\N
22	pages	subpages	o2m	list-o2m-tree-view	\N	\N	\N	f	f	8	full	[{"language":"en-US","translation":"Subpages"},{"language":"pl-PL","translation":"Podstrony"}]	\N	\N	f	\N	\N	\N
17	pages	layout	\N	select-dropdown	{"choices":[{"text":"$t:Default","value":"default"}]}	\N	\N	f	f	9	full	[{"language":"en-US","translation":"Layout"},{"language":"pl-PL","translation":"Układ"}]	\N	\N	t	\N	\N	\N
13	pages	translations	translations	translations	{"languageField":"name","defaultLanguage":"en-US"}	\N	\N	f	f	10	full	[{"language":"en-US","translation":"Translations"},{"language":"pl-PL","translation":"Tłumaczenia"}]	\N	\N	t	\N	\N	\N
19	pages	parent_page	m2o	select-dropdown-m2o	\N	\N	\N	f	f	7	half	[{"language":"en-US","translation":"Parent Page"},{"language":"pl-PL","translation":"Strona - Rodzic"}]	\N	\N	f	\N	\N	\N
\.


--
-- Data for Name: directus_files; Type: TABLE DATA; Schema: public; Owner: website-scaffold
--

COPY public.directus_files (id, storage, filename_disk, filename_download, title, type, folder, uploaded_by, uploaded_on, modified_by, modified_on, charset, filesize, width, height, duration, embed, description, location, tags, metadata) FROM stdin;
\.


--
-- Data for Name: directus_flows; Type: TABLE DATA; Schema: public; Owner: website-scaffold
--

COPY public.directus_flows (id, name, icon, color, description, status, trigger, accountability, options, operation, date_created, user_created) FROM stdin;
\.


--
-- Data for Name: directus_folders; Type: TABLE DATA; Schema: public; Owner: website-scaffold
--

COPY public.directus_folders (id, name, parent) FROM stdin;
\.


--
-- Data for Name: directus_migrations; Type: TABLE DATA; Schema: public; Owner: website-scaffold
--

COPY public.directus_migrations (version, name, "timestamp") FROM stdin;
20201028A	Remove Collection Foreign Keys	2023-12-23 19:25:57.762981+00
20201029A	Remove System Relations	2023-12-23 19:25:57.7661+00
20201029B	Remove System Collections	2023-12-23 19:25:57.769526+00
20201029C	Remove System Fields	2023-12-23 19:25:57.775198+00
20201105A	Add Cascade System Relations	2023-12-23 19:25:57.816214+00
20201105B	Change Webhook URL Type	2023-12-23 19:25:57.82198+00
20210225A	Add Relations Sort Field	2023-12-23 19:25:57.825659+00
20210304A	Remove Locked Fields	2023-12-23 19:25:57.828377+00
20210312A	Webhooks Collections Text	2023-12-23 19:25:57.833651+00
20210331A	Add Refresh Interval	2023-12-23 19:25:57.836236+00
20210415A	Make Filesize Nullable	2023-12-23 19:25:57.843176+00
20210416A	Add Collections Accountability	2023-12-23 19:25:57.846469+00
20210422A	Remove Files Interface	2023-12-23 19:25:57.848358+00
20210506A	Rename Interfaces	2023-12-23 19:25:57.860501+00
20210510A	Restructure Relations	2023-12-23 19:25:57.880973+00
20210518A	Add Foreign Key Constraints	2023-12-23 19:25:57.885291+00
20210519A	Add System Fk Triggers	2023-12-23 19:25:57.909646+00
20210521A	Add Collections Icon Color	2023-12-23 19:25:57.914012+00
20210525A	Add Insights	2023-12-23 19:25:57.937653+00
20210608A	Add Deep Clone Config	2023-12-23 19:25:57.941044+00
20210626A	Change Filesize Bigint	2023-12-23 19:25:57.953136+00
20210716A	Add Conditions to Fields	2023-12-23 19:25:57.956016+00
20210721A	Add Default Folder	2023-12-23 19:25:57.961006+00
20210802A	Replace Groups	2023-12-23 19:25:57.964065+00
20210803A	Add Required to Fields	2023-12-23 19:25:57.966683+00
20210805A	Update Groups	2023-12-23 19:25:57.969303+00
20210805B	Change Image Metadata Structure	2023-12-23 19:25:57.97219+00
20210811A	Add Geometry Config	2023-12-23 19:25:57.975078+00
20210831A	Remove Limit Column	2023-12-23 19:25:57.977835+00
20210903A	Add Auth Provider	2023-12-23 19:25:57.998105+00
20210907A	Webhooks Collections Not Null	2023-12-23 19:25:58.005242+00
20210910A	Move Module Setup	2023-12-23 19:25:58.018779+00
20210920A	Webhooks URL Not Null	2023-12-23 19:25:58.041542+00
20210924A	Add Collection Organization	2023-12-23 19:25:58.046083+00
20210927A	Replace Fields Group	2023-12-23 19:25:58.052469+00
20210927B	Replace M2M Interface	2023-12-23 19:25:58.054301+00
20210929A	Rename Login Action	2023-12-23 19:25:58.056007+00
20211007A	Update Presets	2023-12-23 19:25:58.062262+00
20211009A	Add Auth Data	2023-12-23 19:25:58.06519+00
20211016A	Add Webhook Headers	2023-12-23 19:25:58.068104+00
20211103A	Set Unique to User Token	2023-12-23 19:25:58.073434+00
20211103B	Update Special Geometry	2023-12-23 19:25:58.075525+00
20211104A	Remove Collections Listing	2023-12-23 19:25:58.07818+00
20211118A	Add Notifications	2023-12-23 19:25:58.090369+00
20211211A	Add Shares	2023-12-23 19:25:58.107207+00
20211230A	Add Project Descriptor	2023-12-23 19:25:58.110036+00
20220303A	Remove Default Project Color	2023-12-23 19:25:58.116686+00
20220308A	Add Bookmark Icon and Color	2023-12-23 19:25:58.11943+00
20220314A	Add Translation Strings	2023-12-23 19:25:58.122125+00
20220322A	Rename Field Typecast Flags	2023-12-23 19:25:58.124783+00
20220323A	Add Field Validation	2023-12-23 19:25:58.127384+00
20220325A	Fix Typecast Flags	2023-12-23 19:25:58.130001+00
20220325B	Add Default Language	2023-12-23 19:25:58.138306+00
20220402A	Remove Default Value Panel Icon	2023-12-23 19:25:58.14508+00
20220429A	Add Flows	2023-12-23 19:25:58.176459+00
20220429B	Add Color to Insights Icon	2023-12-23 19:25:58.179259+00
20220429C	Drop Non Null From IP of Activity	2023-12-23 19:25:58.18193+00
20220429D	Drop Non Null From Sender of Notifications	2023-12-23 19:25:58.188058+00
20220614A	Rename Hook Trigger to Event	2023-12-23 19:25:58.189807+00
20220801A	Update Notifications Timestamp Column	2023-12-23 19:25:58.196503+00
20220802A	Add Custom Aspect Ratios	2023-12-23 19:25:58.199129+00
20220826A	Add Origin to Accountability	2023-12-23 19:25:58.203372+00
20230401A	Update Material Icons	2023-12-23 19:25:58.210843+00
20230525A	Add Preview Settings	2023-12-23 19:25:58.213594+00
20230526A	Migrate Translation Strings	2023-12-23 19:25:58.223646+00
20230721A	Require Shares Fields	2023-12-23 19:25:58.228543+00
20230823A	Add Content Versioning	2023-12-23 19:25:58.24515+00
20230927A	Themes	2023-12-23 19:25:58.260167+00
20231009A	Update CSV Fields to Text	2023-12-23 19:25:58.262813+00
20231009B	Update Panel Options	2023-12-23 19:25:58.26466+00
20231010A	Add Extensions	2023-12-23 19:25:58.269933+00
\.


--
-- Data for Name: directus_notifications; Type: TABLE DATA; Schema: public; Owner: website-scaffold
--

COPY public.directus_notifications (id, "timestamp", status, recipient, sender, subject, message, collection, item) FROM stdin;
\.


--
-- Data for Name: directus_operations; Type: TABLE DATA; Schema: public; Owner: website-scaffold
--

COPY public.directus_operations (id, name, key, type, position_x, position_y, options, resolve, reject, flow, date_created, user_created) FROM stdin;
\.


--
-- Data for Name: directus_panels; Type: TABLE DATA; Schema: public; Owner: website-scaffold
--

COPY public.directus_panels (id, dashboard, name, icon, color, show_header, note, type, position_x, position_y, width, height, options, date_created, user_created) FROM stdin;
\.


--
-- Data for Name: directus_permissions; Type: TABLE DATA; Schema: public; Owner: website-scaffold
--

COPY public.directus_permissions (id, role, collection, action, permissions, validation, presets, fields) FROM stdin;
\.


--
-- Data for Name: directus_presets; Type: TABLE DATA; Schema: public; Owner: website-scaffold
--

COPY public.directus_presets (id, bookmark, "user", role, collection, search, layout, layout_query, layout_options, refresh_interval, filter, icon, color) FROM stdin;
1	\N	fc0ef3e9-0944-4dae-aedd-c1616608ece1	\N	pages	\N	\N	{"tabular":{"page":1,"fields":["status","translations.seo.title","translations.seo.slug"]}}	{"tabular":{"widths":{"translations.seo.title":224}}}	\N	\N	bookmark	\N
\.


--
-- Data for Name: directus_relations; Type: TABLE DATA; Schema: public; Owner: website-scaffold
--

COPY public.directus_relations (id, many_collection, many_field, one_collection, one_field, one_collection_field, one_allowed_collections, junction_field, sort_field, one_deselect_action) FROM stdin;
1	seo	image	directus_files	\N	\N	\N	\N	\N	nullify
2	pages_translations	languages_code	languages	\N	\N	\N	pages_id	\N	nullify
3	pages_translations	pages_id	pages	translations	\N	\N	languages_code	\N	nullify
5	pages_translations	seo	seo	\N	\N	\N	\N	\N	nullify
4	pages	parent_page	pages	subpages	\N	\N	\N	\N	nullify
\.


--
-- Data for Name: directus_revisions; Type: TABLE DATA; Schema: public; Owner: website-scaffold
--

COPY public.directus_revisions (id, activity, collection, item, data, delta, parent, version) FROM stdin;
1	2	directus_collections	system	{"collection":"system","icon":"folder","note":null,"color":null,"translations":[{"language":"en-US","translation":"System"},{"language":"pl-PL","translation":"System"}]}	{"collection":"system","icon":"folder","note":null,"color":null,"translations":[{"language":"en-US","translation":"System"},{"language":"pl-PL","translation":"System"}]}	\N	\N
2	3	directus_collections	content	{"collection":"content","icon":"folder","note":null,"color":null,"translations":[{"language":"en-US","translation":"Content"},{"language":"pl-PL","translation":"Treść"}]}	{"collection":"content","icon":"folder","note":null,"color":null,"translations":[{"language":"en-US","translation":"Content"},{"language":"pl-PL","translation":"Treść"}]}	\N	\N
3	4	directus_collections	blocks	{"collection":"blocks","icon":"folder","note":null,"color":null,"translations":[{"language":"en-US","translation":"Blocks"},{"language":"en-US","translation":"Bloki"}]}	{"collection":"blocks","icon":"folder","note":null,"color":null,"translations":[{"language":"en-US","translation":"Blocks"},{"language":"en-US","translation":"Bloki"}]}	\N	\N
4	5	directus_collections	content	{"collection":"content","icon":"folder","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":[{"language":"en-US","translation":"Content"},{"language":"pl-PL","translation":"Treść"}],"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":1,"group":null}	\N	\N
5	6	directus_collections	blocks	{"collection":"blocks","icon":"folder","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":[{"language":"en-US","translation":"Blocks"},{"language":"en-US","translation":"Bloki"}],"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":2,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":2,"group":null}	\N	\N
6	7	directus_collections	system	{"collection":"system","icon":"folder","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":[{"language":"en-US","translation":"System"},{"language":"pl-PL","translation":"System"}],"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":3,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":3,"group":null}	\N	\N
7	8	directus_collections	blocks	{"collection":"blocks","icon":"folder","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":[{"language":"en-US","translation":"Blocks"},{"language":"en-US","translation":"Bloki"}],"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":1,"group":null}	\N	\N
8	9	directus_collections	content	{"collection":"content","icon":"folder","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":[{"language":"en-US","translation":"Content"},{"language":"pl-PL","translation":"Treść"}],"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":2,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":2,"group":null}	\N	\N
9	10	directus_collections	system	{"collection":"system","icon":"folder","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":[{"language":"en-US","translation":"System"},{"language":"pl-PL","translation":"System"}],"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":3,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":3,"group":null}	\N	\N
10	11	directus_collections	blocks	{"collection":"blocks","icon":"folder","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":[{"language":"en-US","translation":"Blocks"},{"language":"en-US","translation":"Bloki"}],"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"icon":"folder","note":null,"translations":[{"language":"en-US","translation":"Blocks"},{"language":"en-US","translation":"Bloki"}],"color":null}	\N	\N
11	12	directus_fields	1	{"sort":1,"interface":"input","readonly":false,"hidden":false,"field":"code","collection":"languages"}	{"sort":1,"interface":"input","readonly":false,"hidden":false,"field":"code","collection":"languages"}	\N	\N
12	13	directus_collections	languages	{"singleton":false,"collection":"languages"}	{"singleton":false,"collection":"languages"}	\N	\N
13	14	directus_fields	2	{"sort":2,"interface":"input","special":null,"required":true,"collection":"languages","field":"name"}	{"sort":2,"interface":"input","special":null,"required":true,"collection":"languages","field":"name"}	\N	\N
14	15	directus_fields	2	{"id":2,"collection":"languages","field":"name","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":2,"width":"full","translations":[{"language":"en-US","translation":"Name"},{"language":"pl-PL","translation":"Nazwa"}],"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"languages","field":"name","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":2,"width":"full","translations":[{"language":"en-US","translation":"Name"},{"language":"pl-PL","translation":"Nazwa"}],"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	\N	\N
15	16	directus_fields	1	{"id":1,"collection":"languages","field":"code","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":1,"width":"full","translations":[{"language":"en-US","translation":"Code"},{"language":"pl-PL","translation":"Kod"}],"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"languages","field":"code","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":1,"width":"full","translations":[{"language":"en-US","translation":"Code"},{"language":"pl-PL","translation":"Kod"}],"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
22	23	directus_fields	4	{"sort":2,"interface":"input","special":null,"required":true,"collection":"seo","field":"title"}	{"sort":2,"interface":"input","special":null,"required":true,"collection":"seo","field":"title"}	\N	\N
16	17	directus_collections	blocks	{"collection":"blocks","icon":"folder","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":[{"language":"en-US","translation":"Blocks"},{"language":"en-US","translation":"Bloki"}],"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":1,"group":null}	\N	\N
18	19	directus_collections	content	{"collection":"content","icon":"folder","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":[{"language":"en-US","translation":"Content"},{"language":"pl-PL","translation":"Treść"}],"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":2,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":2,"group":null}	\N	\N
19	20	directus_collections	system	{"collection":"system","icon":"folder","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":[{"language":"en-US","translation":"System"},{"language":"pl-PL","translation":"System"}],"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":3,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":3,"group":null}	\N	\N
20	21	directus_fields	3	{"sort":1,"hidden":true,"readonly":true,"interface":"input","special":["uuid"],"field":"id","collection":"seo"}	{"sort":1,"hidden":true,"readonly":true,"interface":"input","special":["uuid"],"field":"id","collection":"seo"}	\N	\N
21	22	directus_collections	seo	{"singleton":false,"collection":"seo"}	{"singleton":false,"collection":"seo"}	\N	\N
17	18	directus_collections	languages	{"collection":"languages","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"group":"system","collapse":"open","preview_url":null,"versioning":false}	{"sort":1,"group":"system"}	\N	\N
23	24	directus_fields	4	{"id":4,"collection":"seo","field":"title","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":2,"width":"full","translations":[{"language":"en-US","translation":"Title"},{"language":"pl-PL","translation":"Tytuł"}],"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"seo","field":"title","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":2,"width":"full","translations":[{"language":"en-US","translation":"Title"},{"language":"pl-PL","translation":"Tytuł"}],"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	\N	\N
24	25	directus_fields	5	{"sort":3,"interface":"input-multiline","special":null,"options":{"trim":true},"collection":"seo","field":"description"}	{"sort":3,"interface":"input-multiline","special":null,"options":{"trim":true},"collection":"seo","field":"description"}	\N	\N
25	26	directus_fields	6	{"sort":4,"interface":"file-image","special":["file"],"collection":"seo","field":"image"}	{"sort":4,"interface":"file-image","special":["file"],"collection":"seo","field":"image"}	\N	\N
26	27	directus_collections	blocks	{"collection":"blocks","icon":"folder","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":[{"language":"en-US","translation":"Blocks"},{"language":"en-US","translation":"Bloki"}],"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":1,"group":null}	\N	\N
27	28	directus_collections	seo	{"collection":"seo","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"group":"content","collapse":"open","preview_url":null,"versioning":false}	{"sort":1,"group":"content"}	\N	\N
28	29	directus_collections	content	{"collection":"content","icon":"folder","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":[{"language":"en-US","translation":"Content"},{"language":"pl-PL","translation":"Treść"}],"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":2,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":2,"group":null}	\N	\N
29	30	directus_collections	system	{"collection":"system","icon":"folder","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":[{"language":"en-US","translation":"System"},{"language":"pl-PL","translation":"System"}],"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":3,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":3,"group":null}	\N	\N
30	31	directus_collections	seo	{"collection":"seo","icon":null,"note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"group":"content","collapse":"open","preview_url":null,"versioning":false}	{"hidden":true}	\N	\N
31	32	directus_fields	7	{"sort":2,"interface":"input","special":null,"translations":[{"language":"en-US","translation":"Name"},{"language":"pl-PL","translation":"Nazwa"}],"required":true,"collection":"languages","field":"name"}	{"sort":2,"interface":"input","special":null,"translations":[{"language":"en-US","translation":"Name"},{"language":"pl-PL","translation":"Nazwa"}],"required":true,"collection":"languages","field":"name"}	\N	\N
32	33	directus_collections	content	{"collection":"content","icon":"folder","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":[{"language":"en-US","translation":"Content"},{"language":"pl-PL","translation":"Treść"}],"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":1,"group":null}	\N	\N
33	34	directus_collections	blocks	{"collection":"blocks","icon":"folder","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":[{"language":"en-US","translation":"Blocks"},{"language":"en-US","translation":"Bloki"}],"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":2,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":2,"group":null}	\N	\N
34	35	directus_collections	system	{"collection":"system","icon":"folder","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":[{"language":"en-US","translation":"System"},{"language":"pl-PL","translation":"System"}],"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":3,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":3,"group":null}	\N	\N
35	36	directus_fields	8	{"sort":1,"hidden":true,"readonly":true,"interface":"input","special":["uuid"],"field":"id","collection":"pages"}	{"sort":1,"hidden":true,"readonly":true,"interface":"input","special":["uuid"],"field":"id","collection":"pages"}	\N	\N
52	53	directus_collections	system	{"collection":"system","icon":"folder","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":[{"language":"en-US","translation":"System"},{"language":"pl-PL","translation":"System"}],"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":3,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":3,"group":null}	\N	\N
53	54	directus_collections	pages_translations	{"collection":"pages_translations","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":4,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":4,"group":null}	\N	\N
36	37	directus_fields	9	{"sort":2,"width":"full","options":{"choices":[{"text":"$t:published","value":"published"},{"text":"$t:draft","value":"draft"},{"text":"$t:archived","value":"archived"}]},"interface":"select-dropdown","display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","foreground":"#FFFFFF","background":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","foreground":"#18222F","background":"#D3DAE4"},{"text":"$t:archived","value":"archived","foreground":"#FFFFFF","background":"var(--theme--warning)"}]},"field":"status","collection":"pages"}	{"sort":2,"width":"full","options":{"choices":[{"text":"$t:published","value":"published"},{"text":"$t:draft","value":"draft"},{"text":"$t:archived","value":"archived"}]},"interface":"select-dropdown","display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","foreground":"#FFFFFF","background":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","foreground":"#18222F","background":"#D3DAE4"},{"text":"$t:archived","value":"archived","foreground":"#FFFFFF","background":"var(--theme--warning)"}]},"field":"status","collection":"pages"}	\N	\N
37	38	directus_fields	10	{"sort":3,"interface":"input","hidden":true,"field":"sort","collection":"pages"}	{"sort":3,"interface":"input","hidden":true,"field":"sort","collection":"pages"}	\N	\N
38	39	directus_fields	11	{"sort":4,"special":["date-created"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"created_at","collection":"pages"}	{"sort":4,"special":["date-created"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"created_at","collection":"pages"}	\N	\N
39	40	directus_fields	12	{"sort":5,"special":["date-updated"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"updated_at","collection":"pages"}	{"sort":5,"special":["date-updated"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"updated_at","collection":"pages"}	\N	\N
40	41	directus_collections	pages	{"sort_field":"sort","archive_field":"status","archive_value":"archived","unarchive_value":"draft","singleton":false,"collection":"pages"}	{"sort_field":"sort","archive_field":"status","archive_value":"archived","unarchive_value":"draft","singleton":false,"collection":"pages"}	\N	\N
41	42	directus_fields	13	{"sort":6,"interface":"translations","special":["translations"],"required":true,"options":{"languageField":"name","defaultLanguage":"en-US"},"collection":"pages","field":"translations"}	{"sort":6,"interface":"translations","special":["translations"],"required":true,"options":{"languageField":"name","defaultLanguage":"en-US"},"collection":"pages","field":"translations"}	\N	\N
42	43	directus_fields	14	{"sort":1,"hidden":true,"field":"id","collection":"pages_translations"}	{"sort":1,"hidden":true,"field":"id","collection":"pages_translations"}	\N	\N
43	44	directus_collections	pages_translations	{"hidden":true,"icon":"import_export","collection":"pages_translations"}	{"hidden":true,"icon":"import_export","collection":"pages_translations"}	\N	\N
44	45	directus_fields	15	{"sort":2,"hidden":true,"collection":"pages_translations","field":"pages_id"}	{"sort":2,"hidden":true,"collection":"pages_translations","field":"pages_id"}	\N	\N
45	46	directus_fields	16	{"sort":3,"hidden":true,"collection":"pages_translations","field":"languages_code"}	{"sort":3,"hidden":true,"collection":"pages_translations","field":"languages_code"}	\N	\N
46	47	directus_fields	13	{"id":13,"collection":"pages","field":"translations","special":["translations"],"interface":"translations","options":{"languageField":"name","defaultLanguage":"en-US"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":6,"width":"full","translations":[{"language":"en-US","translation":"Translations"},{"language":"pl-PL","translation":"Tłumaczenia"}],"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"translations","special":["translations"],"interface":"translations","options":{"languageField":"name","defaultLanguage":"en-US"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":6,"width":"full","translations":[{"language":"en-US","translation":"Translations"},{"language":"pl-PL","translation":"Tłumaczenia"}],"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	\N	\N
47	48	directus_collections	pages	{"collection":"pages","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":null,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"archive_field":null,"sort_field":null}	\N	\N
48	50	directus_collections	pages	{"collection":"pages","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"group":"content","collapse":"open","preview_url":null,"versioning":false}	{"sort":1,"group":"content"}	\N	\N
49	49	directus_collections	content	{"collection":"content","icon":"folder","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":[{"language":"en-US","translation":"Content"},{"language":"pl-PL","translation":"Treść"}],"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":1,"group":null}	\N	\N
50	51	directus_collections	seo	{"collection":"seo","icon":null,"note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":2,"group":"content","collapse":"open","preview_url":null,"versioning":false}	{"sort":2,"group":"content"}	\N	\N
51	52	directus_collections	blocks	{"collection":"blocks","icon":"folder","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":[{"language":"en-US","translation":"Blocks"},{"language":"en-US","translation":"Bloki"}],"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":2,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":2,"group":null}	\N	\N
54	55	directus_collections	pages_translations	{"collection":"pages_translations","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"group":"pages","collapse":"open","preview_url":null,"versioning":false}	{"sort":1,"group":"pages"}	\N	\N
55	56	directus_collections	content	{"collection":"content","icon":"folder","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":[{"language":"en-US","translation":"Content"},{"language":"pl-PL","translation":"Treść"}],"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":1,"group":null}	\N	\N
56	57	directus_collections	blocks	{"collection":"blocks","icon":"folder","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":[{"language":"en-US","translation":"Blocks"},{"language":"en-US","translation":"Bloki"}],"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":2,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":2,"group":null}	\N	\N
57	58	directus_collections	system	{"collection":"system","icon":"folder","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":[{"language":"en-US","translation":"System"},{"language":"pl-PL","translation":"System"}],"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":3,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":3,"group":null}	\N	\N
58	59	directus_translations	eea7a6f4-b65f-4b50-98b3-30b06c01d66e	{"key":"Default","value":"Default","language":"en-US"}	{"key":"Default","value":"Default","language":"en-US"}	\N	\N
59	60	directus_translations	e8dc9d68-5bb9-44db-85c6-960e3cf008a7	{"key":"Default","value":"Domyślny","language":"pl-PL"}	{"key":"Default","value":"Domyślny","language":"pl-PL"}	\N	\N
60	61	directus_fields	17	{"sort":7,"interface":"select-dropdown","special":null,"required":true,"options":{"choices":[{"text":"$t:Default","value":"default"}]},"collection":"pages","field":"layout"}	{"sort":7,"interface":"select-dropdown","special":null,"required":true,"options":{"choices":[{"text":"$t:Default","value":"default"}]},"collection":"pages","field":"layout"}	\N	\N
61	62	directus_fields	17	{"id":17,"collection":"pages","field":"layout","special":null,"interface":"select-dropdown","options":{"choices":[{"text":"$t:Default","value":"default"}]},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":7,"width":"full","translations":[{"language":"en-US","translation":"Layout"},{"language":"pl-PL","translation":"Układ"}],"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"layout","special":null,"interface":"select-dropdown","options":{"choices":[{"text":"$t:Default","value":"default"}]},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":7,"width":"full","translations":[{"language":"en-US","translation":"Layout"},{"language":"pl-PL","translation":"Układ"}],"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	\N	\N
62	63	directus_translations	9efa2127-862a-4526-b6f5-12c9771db64c	{"key":"Main Menu","language":"en-US","value":"Main Menu"}	{"key":"Main Menu","language":"en-US","value":"Main Menu"}	\N	\N
63	64	directus_translations	7450f054-c1fa-4d18-b7cd-386791c3315c	{"key":"Main Menu","language":"pl-PL","value":"Menu Główne"}	{"key":"Main Menu","language":"pl-PL","value":"Menu Główne"}	\N	\N
64	65	directus_translations	c2db5f24-d803-4073-a02d-92e8bc0c16dd	{"key":"Footer","language":"en-US","value":"Footer"}	{"key":"Footer","language":"en-US","value":"Footer"}	\N	\N
65	66	directus_translations	85e194be-38ef-48a3-992e-264c4f3ec262	{"key":"Footer","language":"pl-PL","value":"Stopka"}	{"key":"Footer","language":"pl-PL","value":"Stopka"}	\N	\N
66	67	directus_fields	18	{"sort":8,"interface":"select-multiple-dropdown","special":["cast-json"],"required":true,"options":{"choices":[{"text":"$t:Main_Menu","value":"main-menu"},{"text":"$t:Footer","value":"footer"}]},"collection":"pages","field":"menu"}	{"sort":8,"interface":"select-multiple-dropdown","special":["cast-json"],"required":true,"options":{"choices":[{"text":"$t:Main_Menu","value":"main-menu"},{"text":"$t:Footer","value":"footer"}]},"collection":"pages","field":"menu"}	\N	\N
67	68	directus_fields	18	{"id":18,"collection":"pages","field":"menu","special":["cast-json"],"interface":"select-multiple-dropdown","options":{"choices":[{"text":"$t:Main_Menu","value":"main-menu"},{"text":"$t:Footer","value":"footer"}]},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":8,"width":"full","translations":[{"language":"en-US","translation":"Menu"},{"language":"pl-PL","translation":"Menu"}],"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"menu","special":["cast-json"],"interface":"select-multiple-dropdown","options":{"choices":[{"text":"$t:Main_Menu","value":"main-menu"},{"text":"$t:Footer","value":"footer"}]},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":8,"width":"full","translations":[{"language":"en-US","translation":"Menu"},{"language":"pl-PL","translation":"Menu"}],"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	\N	\N
68	69	directus_fields	19	{"sort":9,"interface":"select-dropdown-m2o","special":["m2o"],"required":true,"collection":"pages","field":"parent_page"}	{"sort":9,"interface":"select-dropdown-m2o","special":["m2o"],"required":true,"collection":"pages","field":"parent_page"}	\N	\N
69	70	directus_fields	19	{"id":19,"collection":"pages","field":"parent_page","special":["m2o"],"interface":"select-dropdown-m2o","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":9,"width":"full","translations":[{"language":"en-US","translation":"Parent Page"},{"language":"pl-PL","translation":"Strona - Rodzic"}],"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"parent_page","special":["m2o"],"interface":"select-dropdown-m2o","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":9,"width":"full","translations":[{"language":"en-US","translation":"Parent Page"},{"language":"pl-PL","translation":"Strona - Rodzic"}],"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	\N	\N
70	71	directus_fields	20	{"sort":5,"interface":"input","special":null,"required":false,"collection":"seo","field":"slug"}	{"sort":5,"interface":"input","special":null,"required":false,"collection":"seo","field":"slug"}	\N	\N
71	72	directus_fields	3	{"id":3,"collection":"seo","field":"id","special":["uuid"],"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo","field":"id","sort":1,"group":null}	\N	\N
72	73	directus_fields	20	{"id":20,"collection":"seo","field":"slug","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo","field":"slug","sort":2,"group":null}	\N	\N
73	74	directus_fields	4	{"id":4,"collection":"seo","field":"title","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":3,"width":"full","translations":[{"language":"en-US","translation":"Title"},{"language":"pl-PL","translation":"Tytuł"}],"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"seo","field":"title","sort":3,"group":null}	\N	\N
74	75	directus_fields	5	{"id":5,"collection":"seo","field":"description","special":null,"interface":"input-multiline","options":{"trim":true},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":4,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo","field":"description","sort":4,"group":null}	\N	\N
75	76	directus_fields	6	{"id":6,"collection":"seo","field":"image","special":["file"],"interface":"file-image","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":5,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo","field":"image","sort":5,"group":null}	\N	\N
77	78	directus_fields	21	{"sort":4,"interface":"select-dropdown-m2o","special":["m2o"],"required":true,"collection":"pages_translations","field":"seo"}	{"sort":4,"interface":"select-dropdown-m2o","special":["m2o"],"required":true,"collection":"pages_translations","field":"seo"}	\N	\N
80	81	directus_fields	8	{"id":8,"collection":"pages","field":"id","special":["uuid"],"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"id","sort":1,"group":null}	\N	\N
81	82	directus_fields	10	{"id":10,"collection":"pages","field":"sort","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":true,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"sort","sort":2,"group":null}	\N	\N
82	83	directus_fields	9	{"id":9,"collection":"pages","field":"status","special":null,"interface":"select-dropdown","options":{"choices":[{"text":"$t:published","value":"published"},{"text":"$t:draft","value":"draft"},{"text":"$t:archived","value":"archived"}]},"display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","foreground":"#FFFFFF","background":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","foreground":"#18222F","background":"#D3DAE4"},{"text":"$t:archived","value":"archived","foreground":"#FFFFFF","background":"var(--theme--warning)"}]},"readonly":false,"hidden":false,"sort":3,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"status","sort":3,"group":null}	\N	\N
83	84	directus_fields	11	{"id":11,"collection":"pages","field":"created_at","special":["date-created"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":true,"sort":4,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"created_at","sort":4,"group":null}	\N	\N
84	85	directus_fields	12	{"id":12,"collection":"pages","field":"updated_at","special":["date-updated"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":true,"sort":5,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"updated_at","sort":5,"group":null}	\N	\N
85	86	directus_fields	13	{"id":13,"collection":"pages","field":"translations","special":["translations"],"interface":"translations","options":{"languageField":"name","defaultLanguage":"en-US"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":6,"width":"full","translations":[{"language":"en-US","translation":"Translations"},{"language":"pl-PL","translation":"Tłumaczenia"}],"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"translations","sort":6,"group":null}	\N	\N
86	87	directus_fields	17	{"id":17,"collection":"pages","field":"layout","special":null,"interface":"select-dropdown","options":{"choices":[{"text":"$t:Default","value":"default"}]},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":7,"width":"full","translations":[{"language":"en-US","translation":"Layout"},{"language":"pl-PL","translation":"Układ"}],"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"layout","sort":7,"group":null}	\N	\N
87	88	directus_fields	18	{"id":18,"collection":"pages","field":"menu","special":["cast-json"],"interface":"select-multiple-dropdown","options":{"choices":[{"text":"$t:Main_Menu","value":"main-menu"},{"text":"$t:Footer","value":"footer"}]},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":8,"width":"full","translations":[{"language":"en-US","translation":"Menu"},{"language":"pl-PL","translation":"Menu"}],"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"menu","sort":8,"group":null}	\N	\N
88	89	directus_fields	19	{"id":19,"collection":"pages","field":"parent_page","special":["m2o"],"interface":"select-dropdown-m2o","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":9,"width":"full","translations":[{"language":"en-US","translation":"Parent Page"},{"language":"pl-PL","translation":"Strona - Rodzic"}],"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"parent_page","sort":9,"group":null}	\N	\N
89	90	directus_fields	22	{"id":22,"collection":"pages","field":"subpages","special":["o2m"],"interface":"list-o2m-tree-view","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":10,"width":"full","translations":[{"language":"en-US","translation":"Subpages"},{"language":"pl-PL","translation":"Podstrony"}],"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"subpages","sort":10,"group":null}	\N	\N
76	77	directus_fields	20	{"id":20,"collection":"seo","field":"slug","special":null,"interface":"input","options":{"clear":true,"slug":true,"trim":true},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo","field":"slug","special":null,"interface":"input","options":{"clear":true,"slug":true,"trim":true},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
78	79	directus_fields	22	{"sort":10,"interface":"list-o2m-tree-view","special":["o2m"],"collection":"pages","field":"subpages"}	{"sort":10,"interface":"list-o2m-tree-view","special":["o2m"],"collection":"pages","field":"subpages"}	\N	\N
79	80	directus_fields	22	{"id":22,"collection":"pages","field":"subpages","special":["o2m"],"interface":"list-o2m-tree-view","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":10,"width":"full","translations":[{"language":"en-US","translation":"Subpages"},{"language":"pl-PL","translation":"Podstrony"}],"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"subpages","special":["o2m"],"interface":"list-o2m-tree-view","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":10,"width":"full","translations":[{"language":"en-US","translation":"Subpages"},{"language":"pl-PL","translation":"Podstrony"}],"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
131	132	directus_fields	19	{"id":19,"collection":"pages","field":"parent_page","special":["m2o"],"interface":"select-dropdown-m2o","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":9,"width":"half","translations":[{"language":"en-US","translation":"Parent Page"},{"language":"pl-PL","translation":"Strona - Rodzic"}],"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"parent_page","width":"half"}	\N	\N
162	163	languages	en-US	{"code":"en-US","name":"English (U.S.)"}	{"code":"en-US","name":"English (U.S.)"}	\N	\N
90	91	directus_fields	8	{"id":8,"collection":"pages","field":"id","special":["uuid"],"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"id","sort":1,"group":null}	\N	\N
91	92	directus_fields	10	{"id":10,"collection":"pages","field":"sort","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":true,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"sort","sort":2,"group":null}	\N	\N
92	93	directus_fields	11	{"id":11,"collection":"pages","field":"created_at","special":["date-created"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":true,"sort":3,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"created_at","sort":3,"group":null}	\N	\N
93	94	directus_fields	9	{"id":9,"collection":"pages","field":"status","special":null,"interface":"select-dropdown","options":{"choices":[{"text":"$t:published","value":"published"},{"text":"$t:draft","value":"draft"},{"text":"$t:archived","value":"archived"}]},"display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","foreground":"#FFFFFF","background":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","foreground":"#18222F","background":"#D3DAE4"},{"text":"$t:archived","value":"archived","foreground":"#FFFFFF","background":"var(--theme--warning)"}]},"readonly":false,"hidden":false,"sort":4,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"status","sort":4,"group":null}	\N	\N
94	95	directus_fields	12	{"id":12,"collection":"pages","field":"updated_at","special":["date-updated"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":true,"sort":5,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"updated_at","sort":5,"group":null}	\N	\N
95	96	directus_fields	13	{"id":13,"collection":"pages","field":"translations","special":["translations"],"interface":"translations","options":{"languageField":"name","defaultLanguage":"en-US"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":6,"width":"full","translations":[{"language":"en-US","translation":"Translations"},{"language":"pl-PL","translation":"Tłumaczenia"}],"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"translations","sort":6,"group":null}	\N	\N
96	97	directus_fields	17	{"id":17,"collection":"pages","field":"layout","special":null,"interface":"select-dropdown","options":{"choices":[{"text":"$t:Default","value":"default"}]},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":7,"width":"full","translations":[{"language":"en-US","translation":"Layout"},{"language":"pl-PL","translation":"Układ"}],"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"layout","sort":7,"group":null}	\N	\N
97	98	directus_fields	18	{"id":18,"collection":"pages","field":"menu","special":["cast-json"],"interface":"select-multiple-dropdown","options":{"choices":[{"text":"$t:Main_Menu","value":"main-menu"},{"text":"$t:Footer","value":"footer"}]},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":8,"width":"full","translations":[{"language":"en-US","translation":"Menu"},{"language":"pl-PL","translation":"Menu"}],"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"menu","sort":8,"group":null}	\N	\N
98	99	directus_fields	19	{"id":19,"collection":"pages","field":"parent_page","special":["m2o"],"interface":"select-dropdown-m2o","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":9,"width":"full","translations":[{"language":"en-US","translation":"Parent Page"},{"language":"pl-PL","translation":"Strona - Rodzic"}],"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"parent_page","sort":9,"group":null}	\N	\N
99	100	directus_fields	22	{"id":22,"collection":"pages","field":"subpages","special":["o2m"],"interface":"list-o2m-tree-view","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":10,"width":"full","translations":[{"language":"en-US","translation":"Subpages"},{"language":"pl-PL","translation":"Podstrony"}],"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"subpages","sort":10,"group":null}	\N	\N
100	101	directus_fields	8	{"id":8,"collection":"pages","field":"id","special":["uuid"],"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"id","sort":1,"group":null}	\N	\N
101	102	directus_fields	10	{"id":10,"collection":"pages","field":"sort","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":true,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"sort","sort":2,"group":null}	\N	\N
102	103	directus_fields	11	{"id":11,"collection":"pages","field":"created_at","special":["date-created"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":true,"sort":3,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"created_at","sort":3,"group":null}	\N	\N
103	104	directus_fields	12	{"id":12,"collection":"pages","field":"updated_at","special":["date-updated"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":true,"sort":4,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"updated_at","sort":4,"group":null}	\N	\N
132	133	directus_fields	8	{"id":8,"collection":"pages","field":"id","special":["uuid"],"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"id","sort":1,"group":null}	\N	\N
104	105	directus_fields	9	{"id":9,"collection":"pages","field":"status","special":null,"interface":"select-dropdown","options":{"choices":[{"text":"$t:published","value":"published"},{"text":"$t:draft","value":"draft"},{"text":"$t:archived","value":"archived"}]},"display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","foreground":"#FFFFFF","background":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","foreground":"#18222F","background":"#D3DAE4"},{"text":"$t:archived","value":"archived","foreground":"#FFFFFF","background":"var(--theme--warning)"}]},"readonly":false,"hidden":false,"sort":5,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"status","sort":5,"group":null}	\N	\N
105	106	directus_fields	13	{"id":13,"collection":"pages","field":"translations","special":["translations"],"interface":"translations","options":{"languageField":"name","defaultLanguage":"en-US"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":6,"width":"full","translations":[{"language":"en-US","translation":"Translations"},{"language":"pl-PL","translation":"Tłumaczenia"}],"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"translations","sort":6,"group":null}	\N	\N
106	107	directus_fields	17	{"id":17,"collection":"pages","field":"layout","special":null,"interface":"select-dropdown","options":{"choices":[{"text":"$t:Default","value":"default"}]},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":7,"width":"full","translations":[{"language":"en-US","translation":"Layout"},{"language":"pl-PL","translation":"Układ"}],"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"layout","sort":7,"group":null}	\N	\N
107	108	directus_fields	18	{"id":18,"collection":"pages","field":"menu","special":["cast-json"],"interface":"select-multiple-dropdown","options":{"choices":[{"text":"$t:Main_Menu","value":"main-menu"},{"text":"$t:Footer","value":"footer"}]},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":8,"width":"full","translations":[{"language":"en-US","translation":"Menu"},{"language":"pl-PL","translation":"Menu"}],"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"menu","sort":8,"group":null}	\N	\N
108	109	directus_fields	19	{"id":19,"collection":"pages","field":"parent_page","special":["m2o"],"interface":"select-dropdown-m2o","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":9,"width":"full","translations":[{"language":"en-US","translation":"Parent Page"},{"language":"pl-PL","translation":"Strona - Rodzic"}],"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"parent_page","sort":9,"group":null}	\N	\N
109	110	directus_fields	22	{"id":22,"collection":"pages","field":"subpages","special":["o2m"],"interface":"list-o2m-tree-view","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":10,"width":"full","translations":[{"language":"en-US","translation":"Subpages"},{"language":"pl-PL","translation":"Podstrony"}],"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"subpages","sort":10,"group":null}	\N	\N
110	111	directus_fields	8	{"id":8,"collection":"pages","field":"id","special":["uuid"],"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"id","sort":1,"group":null}	\N	\N
111	112	directus_fields	11	{"id":11,"collection":"pages","field":"created_at","special":["date-created"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":true,"sort":2,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"created_at","sort":2,"group":null}	\N	\N
112	113	directus_fields	12	{"id":12,"collection":"pages","field":"updated_at","special":["date-updated"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":true,"sort":3,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"updated_at","sort":3,"group":null}	\N	\N
113	114	directus_fields	10	{"id":10,"collection":"pages","field":"sort","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":true,"sort":4,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"sort","sort":4,"group":null}	\N	\N
114	115	directus_fields	9	{"id":9,"collection":"pages","field":"status","special":null,"interface":"select-dropdown","options":{"choices":[{"text":"$t:published","value":"published"},{"text":"$t:draft","value":"draft"},{"text":"$t:archived","value":"archived"}]},"display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","foreground":"#FFFFFF","background":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","foreground":"#18222F","background":"#D3DAE4"},{"text":"$t:archived","value":"archived","foreground":"#FFFFFF","background":"var(--theme--warning)"}]},"readonly":false,"hidden":false,"sort":5,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"status","sort":5,"group":null}	\N	\N
115	116	directus_fields	13	{"id":13,"collection":"pages","field":"translations","special":["translations"],"interface":"translations","options":{"languageField":"name","defaultLanguage":"en-US"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":6,"width":"full","translations":[{"language":"en-US","translation":"Translations"},{"language":"pl-PL","translation":"Tłumaczenia"}],"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"translations","sort":6,"group":null}	\N	\N
116	117	directus_fields	17	{"id":17,"collection":"pages","field":"layout","special":null,"interface":"select-dropdown","options":{"choices":[{"text":"$t:Default","value":"default"}]},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":7,"width":"full","translations":[{"language":"en-US","translation":"Layout"},{"language":"pl-PL","translation":"Układ"}],"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"layout","sort":7,"group":null}	\N	\N
117	118	directus_fields	18	{"id":18,"collection":"pages","field":"menu","special":["cast-json"],"interface":"select-multiple-dropdown","options":{"choices":[{"text":"$t:Main_Menu","value":"main-menu"},{"text":"$t:Footer","value":"footer"}]},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":8,"width":"full","translations":[{"language":"en-US","translation":"Menu"},{"language":"pl-PL","translation":"Menu"}],"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"menu","sort":8,"group":null}	\N	\N
118	119	directus_fields	19	{"id":19,"collection":"pages","field":"parent_page","special":["m2o"],"interface":"select-dropdown-m2o","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":9,"width":"full","translations":[{"language":"en-US","translation":"Parent Page"},{"language":"pl-PL","translation":"Strona - Rodzic"}],"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"parent_page","sort":9,"group":null}	\N	\N
119	120	directus_fields	22	{"id":22,"collection":"pages","field":"subpages","special":["o2m"],"interface":"list-o2m-tree-view","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":10,"width":"full","translations":[{"language":"en-US","translation":"Subpages"},{"language":"pl-PL","translation":"Podstrony"}],"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"subpages","sort":10,"group":null}	\N	\N
120	121	directus_fields	8	{"id":8,"collection":"pages","field":"id","special":["uuid"],"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"id","sort":1,"group":null}	\N	\N
121	122	directus_fields	11	{"id":11,"collection":"pages","field":"created_at","special":["date-created"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":true,"sort":2,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"created_at","sort":2,"group":null}	\N	\N
122	123	directus_fields	12	{"id":12,"collection":"pages","field":"updated_at","special":["date-updated"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":true,"sort":3,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"updated_at","sort":3,"group":null}	\N	\N
123	124	directus_fields	10	{"id":10,"collection":"pages","field":"sort","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":true,"sort":4,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"sort","sort":4,"group":null}	\N	\N
124	125	directus_fields	9	{"id":9,"collection":"pages","field":"status","special":null,"interface":"select-dropdown","options":{"choices":[{"text":"$t:published","value":"published"},{"text":"$t:draft","value":"draft"},{"text":"$t:archived","value":"archived"}]},"display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","foreground":"#FFFFFF","background":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","foreground":"#18222F","background":"#D3DAE4"},{"text":"$t:archived","value":"archived","foreground":"#FFFFFF","background":"var(--theme--warning)"}]},"readonly":false,"hidden":false,"sort":5,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"status","sort":5,"group":null}	\N	\N
125	126	directus_fields	13	{"id":13,"collection":"pages","field":"translations","special":["translations"],"interface":"translations","options":{"languageField":"name","defaultLanguage":"en-US"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":6,"width":"full","translations":[{"language":"en-US","translation":"Translations"},{"language":"pl-PL","translation":"Tłumaczenia"}],"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"translations","sort":6,"group":null}	\N	\N
126	127	directus_fields	18	{"id":18,"collection":"pages","field":"menu","special":["cast-json"],"interface":"select-multiple-dropdown","options":{"choices":[{"text":"$t:Main_Menu","value":"main-menu"},{"text":"$t:Footer","value":"footer"}]},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":7,"width":"full","translations":[{"language":"en-US","translation":"Menu"},{"language":"pl-PL","translation":"Menu"}],"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"menu","sort":7,"group":null}	\N	\N
127	128	directus_fields	17	{"id":17,"collection":"pages","field":"layout","special":null,"interface":"select-dropdown","options":{"choices":[{"text":"$t:Default","value":"default"}]},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":8,"width":"full","translations":[{"language":"en-US","translation":"Layout"},{"language":"pl-PL","translation":"Układ"}],"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"layout","sort":8,"group":null}	\N	\N
128	129	directus_fields	19	{"id":19,"collection":"pages","field":"parent_page","special":["m2o"],"interface":"select-dropdown-m2o","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":9,"width":"full","translations":[{"language":"en-US","translation":"Parent Page"},{"language":"pl-PL","translation":"Strona - Rodzic"}],"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"parent_page","sort":9,"group":null}	\N	\N
129	130	directus_fields	22	{"id":22,"collection":"pages","field":"subpages","special":["o2m"],"interface":"list-o2m-tree-view","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":10,"width":"full","translations":[{"language":"en-US","translation":"Subpages"},{"language":"pl-PL","translation":"Podstrony"}],"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"subpages","sort":10,"group":null}	\N	\N
130	131	directus_fields	18	{"id":18,"collection":"pages","field":"menu","special":["cast-json"],"interface":"select-multiple-dropdown","options":{"choices":[{"text":"$t:Main_Menu","value":"main-menu"},{"text":"$t:Footer","value":"footer"}]},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":7,"width":"half","translations":[{"language":"en-US","translation":"Menu"},{"language":"pl-PL","translation":"Menu"}],"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"menu","width":"half"}	\N	\N
133	134	directus_fields	11	{"id":11,"collection":"pages","field":"created_at","special":["date-created"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":true,"sort":2,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"created_at","sort":2,"group":null}	\N	\N
134	135	directus_fields	12	{"id":12,"collection":"pages","field":"updated_at","special":["date-updated"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":true,"sort":3,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"updated_at","sort":3,"group":null}	\N	\N
135	136	directus_fields	10	{"id":10,"collection":"pages","field":"sort","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":true,"sort":4,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"sort","sort":4,"group":null}	\N	\N
136	137	directus_fields	9	{"id":9,"collection":"pages","field":"status","special":null,"interface":"select-dropdown","options":{"choices":[{"text":"$t:published","value":"published"},{"text":"$t:draft","value":"draft"},{"text":"$t:archived","value":"archived"}]},"display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","foreground":"#FFFFFF","background":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","foreground":"#18222F","background":"#D3DAE4"},{"text":"$t:archived","value":"archived","foreground":"#FFFFFF","background":"var(--theme--warning)"}]},"readonly":false,"hidden":false,"sort":5,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"status","sort":5,"group":null}	\N	\N
137	138	directus_fields	13	{"id":13,"collection":"pages","field":"translations","special":["translations"],"interface":"translations","options":{"languageField":"name","defaultLanguage":"en-US"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":6,"width":"full","translations":[{"language":"en-US","translation":"Translations"},{"language":"pl-PL","translation":"Tłumaczenia"}],"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"translations","sort":6,"group":null}	\N	\N
138	139	directus_fields	18	{"id":18,"collection":"pages","field":"menu","special":["cast-json"],"interface":"select-multiple-dropdown","options":{"choices":[{"text":"$t:Main_Menu","value":"main-menu"},{"text":"$t:Footer","value":"footer"}]},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":7,"width":"half","translations":[{"language":"en-US","translation":"Menu"},{"language":"pl-PL","translation":"Menu"}],"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"menu","sort":7,"group":null}	\N	\N
139	140	directus_fields	19	{"id":19,"collection":"pages","field":"parent_page","special":["m2o"],"interface":"select-dropdown-m2o","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":8,"width":"half","translations":[{"language":"en-US","translation":"Parent Page"},{"language":"pl-PL","translation":"Strona - Rodzic"}],"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"parent_page","sort":8,"group":null}	\N	\N
140	141	directus_fields	17	{"id":17,"collection":"pages","field":"layout","special":null,"interface":"select-dropdown","options":{"choices":[{"text":"$t:Default","value":"default"}]},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":9,"width":"full","translations":[{"language":"en-US","translation":"Layout"},{"language":"pl-PL","translation":"Układ"}],"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"layout","sort":9,"group":null}	\N	\N
141	142	directus_fields	22	{"id":22,"collection":"pages","field":"subpages","special":["o2m"],"interface":"list-o2m-tree-view","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":10,"width":"full","translations":[{"language":"en-US","translation":"Subpages"},{"language":"pl-PL","translation":"Podstrony"}],"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"subpages","sort":10,"group":null}	\N	\N
142	143	directus_fields	8	{"id":8,"collection":"pages","field":"id","special":["uuid"],"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"id","sort":1,"group":null}	\N	\N
143	144	directus_fields	11	{"id":11,"collection":"pages","field":"created_at","special":["date-created"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":true,"sort":2,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"created_at","sort":2,"group":null}	\N	\N
144	145	directus_fields	12	{"id":12,"collection":"pages","field":"updated_at","special":["date-updated"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":true,"sort":3,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"updated_at","sort":3,"group":null}	\N	\N
145	146	directus_fields	10	{"id":10,"collection":"pages","field":"sort","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":true,"sort":4,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"sort","sort":4,"group":null}	\N	\N
146	147	directus_fields	9	{"id":9,"collection":"pages","field":"status","special":null,"interface":"select-dropdown","options":{"choices":[{"text":"$t:published","value":"published"},{"text":"$t:draft","value":"draft"},{"text":"$t:archived","value":"archived"}]},"display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","foreground":"#FFFFFF","background":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","foreground":"#18222F","background":"#D3DAE4"},{"text":"$t:archived","value":"archived","foreground":"#FFFFFF","background":"var(--theme--warning)"}]},"readonly":false,"hidden":false,"sort":5,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"status","sort":5,"group":null}	\N	\N
147	148	directus_fields	13	{"id":13,"collection":"pages","field":"translations","special":["translations"],"interface":"translations","options":{"languageField":"name","defaultLanguage":"en-US"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":6,"width":"full","translations":[{"language":"en-US","translation":"Translations"},{"language":"pl-PL","translation":"Tłumaczenia"}],"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"translations","sort":6,"group":null}	\N	\N
148	149	directus_fields	18	{"id":18,"collection":"pages","field":"menu","special":["cast-json"],"interface":"select-multiple-dropdown","options":{"choices":[{"text":"$t:Main_Menu","value":"main-menu"},{"text":"$t:Footer","value":"footer"}]},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":7,"width":"half","translations":[{"language":"en-US","translation":"Menu"},{"language":"pl-PL","translation":"Menu"}],"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"menu","sort":7,"group":null}	\N	\N
149	150	directus_fields	19	{"id":19,"collection":"pages","field":"parent_page","special":["m2o"],"interface":"select-dropdown-m2o","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":8,"width":"half","translations":[{"language":"en-US","translation":"Parent Page"},{"language":"pl-PL","translation":"Strona - Rodzic"}],"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"parent_page","sort":8,"group":null}	\N	\N
150	151	directus_fields	22	{"id":22,"collection":"pages","field":"subpages","special":["o2m"],"interface":"list-o2m-tree-view","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":9,"width":"full","translations":[{"language":"en-US","translation":"Subpages"},{"language":"pl-PL","translation":"Podstrony"}],"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"subpages","sort":9,"group":null}	\N	\N
151	152	directus_fields	17	{"id":17,"collection":"pages","field":"layout","special":null,"interface":"select-dropdown","options":{"choices":[{"text":"$t:Default","value":"default"}]},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":10,"width":"full","translations":[{"language":"en-US","translation":"Layout"},{"language":"pl-PL","translation":"Układ"}],"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"layout","sort":10,"group":null}	\N	\N
152	153	directus_fields	8	{"id":8,"collection":"pages","field":"id","special":["uuid"],"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"id","sort":1,"group":null}	\N	\N
153	154	directus_fields	11	{"id":11,"collection":"pages","field":"created_at","special":["date-created"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":true,"sort":2,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"created_at","sort":2,"group":null}	\N	\N
154	155	directus_fields	12	{"id":12,"collection":"pages","field":"updated_at","special":["date-updated"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":true,"sort":3,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"updated_at","sort":3,"group":null}	\N	\N
155	156	directus_fields	10	{"id":10,"collection":"pages","field":"sort","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":true,"sort":4,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"sort","sort":4,"group":null}	\N	\N
156	157	directus_fields	9	{"id":9,"collection":"pages","field":"status","special":null,"interface":"select-dropdown","options":{"choices":[{"text":"$t:published","value":"published"},{"text":"$t:draft","value":"draft"},{"text":"$t:archived","value":"archived"}]},"display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","foreground":"#FFFFFF","background":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","foreground":"#18222F","background":"#D3DAE4"},{"text":"$t:archived","value":"archived","foreground":"#FFFFFF","background":"var(--theme--warning)"}]},"readonly":false,"hidden":false,"sort":5,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"status","sort":5,"group":null}	\N	\N
157	158	directus_fields	18	{"id":18,"collection":"pages","field":"menu","special":["cast-json"],"interface":"select-multiple-dropdown","options":{"choices":[{"text":"$t:Main_Menu","value":"main-menu"},{"text":"$t:Footer","value":"footer"}]},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":6,"width":"half","translations":[{"language":"en-US","translation":"Menu"},{"language":"pl-PL","translation":"Menu"}],"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"menu","sort":6,"group":null}	\N	\N
158	159	directus_fields	19	{"id":19,"collection":"pages","field":"parent_page","special":["m2o"],"interface":"select-dropdown-m2o","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":7,"width":"half","translations":[{"language":"en-US","translation":"Parent Page"},{"language":"pl-PL","translation":"Strona - Rodzic"}],"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"parent_page","sort":7,"group":null}	\N	\N
159	160	directus_fields	22	{"id":22,"collection":"pages","field":"subpages","special":["o2m"],"interface":"list-o2m-tree-view","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":8,"width":"full","translations":[{"language":"en-US","translation":"Subpages"},{"language":"pl-PL","translation":"Podstrony"}],"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"subpages","sort":8,"group":null}	\N	\N
160	161	directus_fields	17	{"id":17,"collection":"pages","field":"layout","special":null,"interface":"select-dropdown","options":{"choices":[{"text":"$t:Default","value":"default"}]},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":9,"width":"full","translations":[{"language":"en-US","translation":"Layout"},{"language":"pl-PL","translation":"Układ"}],"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"layout","sort":9,"group":null}	\N	\N
161	162	directus_fields	13	{"id":13,"collection":"pages","field":"translations","special":["translations"],"interface":"translations","options":{"languageField":"name","defaultLanguage":"en-US"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":10,"width":"full","translations":[{"language":"en-US","translation":"Translations"},{"language":"pl-PL","translation":"Tłumaczenia"}],"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"translations","sort":10,"group":null}	\N	\N
163	164	languages	pl-PL	{"code":"pl-PL","name":"Polski"}	{"code":"pl-PL","name":"Polski"}	\N	\N
164	165	directus_fields	19	{"id":19,"collection":"pages","field":"parent_page","special":["m2o"],"interface":"select-dropdown-m2o","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":7,"width":"half","translations":[{"language":"en-US","translation":"Parent Page"},{"language":"pl-PL","translation":"Strona - Rodzic"}],"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"parent_page","special":["m2o"],"interface":"select-dropdown-m2o","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":7,"width":"half","translations":[{"language":"en-US","translation":"Parent Page"},{"language":"pl-PL","translation":"Strona - Rodzic"}],"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
165	166	seo	1fcc396d-58a7-41cd-ac2e-51ea5b140560	{"title":"Home Page"}	{"title":"Home Page"}	166	\N
167	168	seo	7b5e0b61-1297-48e2-a0f0-14ac76dd6364	{"title":"Strona Główna"}	{"title":"Strona Główna"}	168	\N
169	170	pages	41449c2e-f83e-4fb5-bf48-80dbe7d3ffb8	{"translations":{"create":[{"seo":{"title":"Home Page"},"languages_code":{"code":"en-US"}},{"seo":{"title":"Strona Główna"},"languages_code":{"code":"pl-PL"}}],"update":[],"delete":[]},"status":"published"}	{"translations":{"create":[{"seo":{"title":"Home Page"},"languages_code":{"code":"en-US"}},{"seo":{"title":"Strona Główna"},"languages_code":{"code":"pl-PL"}}],"update":[],"delete":[]},"status":"published"}	\N	\N
166	167	pages_translations	1	{"seo":{"title":"Home Page"},"languages_code":{"code":"en-US"},"pages_id":"41449c2e-f83e-4fb5-bf48-80dbe7d3ffb8"}	{"seo":{"title":"Home Page"},"languages_code":{"code":"en-US"},"pages_id":"41449c2e-f83e-4fb5-bf48-80dbe7d3ffb8"}	169	\N
168	169	pages_translations	2	{"seo":{"title":"Strona Główna"},"languages_code":{"code":"pl-PL"},"pages_id":"41449c2e-f83e-4fb5-bf48-80dbe7d3ffb8"}	{"seo":{"title":"Strona Główna"},"languages_code":{"code":"pl-PL"},"pages_id":"41449c2e-f83e-4fb5-bf48-80dbe7d3ffb8"}	169	\N
170	171	seo	98014689-22f6-4ba3-a523-51a50da4db46	{"title":"Subpage 1","slug":"subpage-1"}	{"title":"Subpage 1","slug":"subpage-1"}	171	\N
172	173	seo	0e268336-6f5d-4fb3-a33b-5391b8326d59	{"title":"Podstrona 1","slug":"podstrona-1"}	{"title":"Podstrona 1","slug":"podstrona-1"}	173	\N
174	175	pages	fe22a081-f7da-487f-a1bc-a2b448242f08	{"status":"published","parent_page":"41449c2e-f83e-4fb5-bf48-80dbe7d3ffb8","translations":{"create":[{"seo":{"title":"Subpage 1","slug":"subpage-1"},"languages_code":{"code":"en-US"}},{"seo":{"title":"Podstrona 1","slug":"podstrona-1"},"languages_code":{"code":"pl-PL"}}],"update":[],"delete":[]}}	{"status":"published","parent_page":"41449c2e-f83e-4fb5-bf48-80dbe7d3ffb8","translations":{"create":[{"seo":{"title":"Subpage 1","slug":"subpage-1"},"languages_code":{"code":"en-US"}},{"seo":{"title":"Podstrona 1","slug":"podstrona-1"},"languages_code":{"code":"pl-PL"}}],"update":[],"delete":[]}}	\N	\N
171	172	pages_translations	3	{"seo":{"title":"Subpage 1","slug":"subpage-1"},"languages_code":{"code":"en-US"},"pages_id":"fe22a081-f7da-487f-a1bc-a2b448242f08"}	{"seo":{"title":"Subpage 1","slug":"subpage-1"},"languages_code":{"code":"en-US"},"pages_id":"fe22a081-f7da-487f-a1bc-a2b448242f08"}	174	\N
173	174	pages_translations	4	{"seo":{"title":"Podstrona 1","slug":"podstrona-1"},"languages_code":{"code":"pl-PL"},"pages_id":"fe22a081-f7da-487f-a1bc-a2b448242f08"}	{"seo":{"title":"Podstrona 1","slug":"podstrona-1"},"languages_code":{"code":"pl-PL"},"pages_id":"fe22a081-f7da-487f-a1bc-a2b448242f08"}	174	\N
175	176	seo	3f3d65a3-d443-4cc3-b325-7d4eb7694f4f	{"title":"Subpage 2","slug":"subpage-2"}	{"title":"Subpage 2","slug":"subpage-2"}	176	\N
177	178	seo	7c58a1ae-dd5d-4fc6-9b30-b60413d96535	{"title":"Podstrona 2","slug":"podstrona-2"}	{"title":"Podstrona 2","slug":"podstrona-2"}	178	\N
176	177	pages_translations	5	{"seo":{"title":"Subpage 2","slug":"subpage-2"},"languages_code":{"code":"en-US"},"pages_id":"08355f74-b9fb-495a-bc02-e2ca8a3833e7"}	{"seo":{"title":"Subpage 2","slug":"subpage-2"},"languages_code":{"code":"en-US"},"pages_id":"08355f74-b9fb-495a-bc02-e2ca8a3833e7"}	179	\N
178	179	pages_translations	6	{"seo":{"title":"Podstrona 2","slug":"podstrona-2"},"languages_code":{"code":"pl-PL"},"pages_id":"08355f74-b9fb-495a-bc02-e2ca8a3833e7"}	{"seo":{"title":"Podstrona 2","slug":"podstrona-2"},"languages_code":{"code":"pl-PL"},"pages_id":"08355f74-b9fb-495a-bc02-e2ca8a3833e7"}	179	\N
180	181	pages	fe22a081-f7da-487f-a1bc-a2b448242f08	{"id":"fe22a081-f7da-487f-a1bc-a2b448242f08","status":"published","sort":null,"created_at":"2023-12-23T20:06:53.090Z","updated_at":"2023-12-23T20:07:25.736Z","layout":"default","menu":["main-menu"],"parent_page":"41449c2e-f83e-4fb5-bf48-80dbe7d3ffb8","subpages":["08355f74-b9fb-495a-bc02-e2ca8a3833e7"],"translations":[3,4]}	{"updated_at":"2023-12-23T20:07:25.736Z"}	\N	\N
179	180	pages	08355f74-b9fb-495a-bc02-e2ca8a3833e7	{"status":"published","translations":{"create":[{"seo":{"title":"Subpage 2","slug":"subpage-2"},"languages_code":{"code":"en-US"}},{"seo":{"title":"Podstrona 2","slug":"podstrona-2"},"languages_code":{"code":"pl-PL"}}],"update":[],"delete":[]},"parent_page":"fe22a081-f7da-487f-a1bc-a2b448242f08"}	{"status":"published","translations":{"create":[{"seo":{"title":"Subpage 2","slug":"subpage-2"},"languages_code":{"code":"en-US"}},{"seo":{"title":"Podstrona 2","slug":"podstrona-2"},"languages_code":{"code":"pl-PL"}}],"update":[],"delete":[]},"parent_page":"fe22a081-f7da-487f-a1bc-a2b448242f08"}	180	\N
\.


--
-- Data for Name: directus_roles; Type: TABLE DATA; Schema: public; Owner: website-scaffold
--

COPY public.directus_roles (id, name, icon, description, ip_access, enforce_tfa, admin_access, app_access) FROM stdin;
1d9ca1b2-6385-4ddc-8aa6-463cb540309b	Administrator	verified	$t:admin_description	\N	f	t	t
\.


--
-- Data for Name: directus_sessions; Type: TABLE DATA; Schema: public; Owner: website-scaffold
--

COPY public.directus_sessions (token, "user", expires, ip, user_agent, share, origin) FROM stdin;
m5zfpb4Biksueoc5NqL-h7K3vnjYNGnPmbDhIonIWXPpRzi583SZLaXNCKR_-dpJ	fc0ef3e9-0944-4dae-aedd-c1616608ece1	2023-12-30 20:03:04.03+00	172.23.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0	\N	http://localhost:3001
\.


--
-- Data for Name: directus_settings; Type: TABLE DATA; Schema: public; Owner: website-scaffold
--

COPY public.directus_settings (id, project_name, project_url, project_color, project_logo, public_foreground, public_background, public_note, auth_login_attempts, auth_password_policy, storage_asset_transform, storage_asset_presets, custom_css, storage_default_folder, basemaps, mapbox_key, module_bar, project_descriptor, default_language, custom_aspect_ratios, public_favicon, default_appearance, default_theme_light, theme_light_overrides, default_theme_dark, theme_dark_overrides) FROM stdin;
\.


--
-- Data for Name: directus_shares; Type: TABLE DATA; Schema: public; Owner: website-scaffold
--

COPY public.directus_shares (id, name, collection, item, role, password, user_created, date_created, date_start, date_end, times_used, max_uses) FROM stdin;
\.


--
-- Data for Name: directus_translations; Type: TABLE DATA; Schema: public; Owner: website-scaffold
--

COPY public.directus_translations (id, language, key, value) FROM stdin;
eea7a6f4-b65f-4b50-98b3-30b06c01d66e	en-US	Default	Default
e8dc9d68-5bb9-44db-85c6-960e3cf008a7	pl-PL	Default	Domyślny
9efa2127-862a-4526-b6f5-12c9771db64c	en-US	Main Menu	Main Menu
7450f054-c1fa-4d18-b7cd-386791c3315c	pl-PL	Main Menu	Menu Główne
c2db5f24-d803-4073-a02d-92e8bc0c16dd	en-US	Footer	Footer
85e194be-38ef-48a3-992e-264c4f3ec262	pl-PL	Footer	Stopka
\.


--
-- Data for Name: directus_users; Type: TABLE DATA; Schema: public; Owner: website-scaffold
--

COPY public.directus_users (id, first_name, last_name, email, password, location, title, description, tags, avatar, language, tfa_secret, status, role, token, last_access, last_page, provider, external_identifier, auth_data, email_notifications, appearance, theme_dark, theme_light, theme_light_overrides, theme_dark_overrides) FROM stdin;
fc0ef3e9-0944-4dae-aedd-c1616608ece1	Admin	User	admin@website-scaffold.com	$argon2id$v=19$m=65536,t=3,p=4$MC55510axkkS8/c7PYz1qQ$ZYSd0kW5p1o+ca2YEtn7q1Xqr9xueLtwPEzLFMCjvfo	\N	\N	\N	\N	\N	\N	\N	active	1d9ca1b2-6385-4ddc-8aa6-463cb540309b	\N	2023-12-23 20:03:04.033+00	/content/pages/41449c2e-f83e-4fb5-bf48-80dbe7d3ffb8	default	\N	\N	t	\N	\N	\N	\N	\N
\.


--
-- Data for Name: directus_versions; Type: TABLE DATA; Schema: public; Owner: website-scaffold
--

COPY public.directus_versions (id, key, name, collection, item, hash, date_created, date_updated, user_created, user_updated) FROM stdin;
\.


--
-- Data for Name: directus_webhooks; Type: TABLE DATA; Schema: public; Owner: website-scaffold
--

COPY public.directus_webhooks (id, name, method, url, status, data, actions, collections, headers) FROM stdin;
\.


--
-- Data for Name: languages; Type: TABLE DATA; Schema: public; Owner: website-scaffold
--

COPY public.languages (code, name) FROM stdin;
en-US	English (U.S.)
pl-PL	Polski
\.


--
-- Data for Name: pages; Type: TABLE DATA; Schema: public; Owner: website-scaffold
--

COPY public.pages (id, status, sort, created_at, updated_at, layout, menu, parent_page) FROM stdin;
41449c2e-f83e-4fb5-bf48-80dbe7d3ffb8	published	\N	2023-12-23 20:05:34.749+00	\N	default	["main-menu"]	\N
fe22a081-f7da-487f-a1bc-a2b448242f08	published	\N	2023-12-23 20:06:53.09+00	2023-12-23 20:07:25.736+00	default	["main-menu"]	41449c2e-f83e-4fb5-bf48-80dbe7d3ffb8
08355f74-b9fb-495a-bc02-e2ca8a3833e7	published	\N	2023-12-23 20:07:25.737+00	\N	default	["main-menu"]	fe22a081-f7da-487f-a1bc-a2b448242f08
\.


--
-- Data for Name: pages_translations; Type: TABLE DATA; Schema: public; Owner: website-scaffold
--

COPY public.pages_translations (id, pages_id, languages_code, seo) FROM stdin;
1	41449c2e-f83e-4fb5-bf48-80dbe7d3ffb8	en-US	1fcc396d-58a7-41cd-ac2e-51ea5b140560
2	41449c2e-f83e-4fb5-bf48-80dbe7d3ffb8	pl-PL	7b5e0b61-1297-48e2-a0f0-14ac76dd6364
3	fe22a081-f7da-487f-a1bc-a2b448242f08	en-US	98014689-22f6-4ba3-a523-51a50da4db46
4	fe22a081-f7da-487f-a1bc-a2b448242f08	pl-PL	0e268336-6f5d-4fb3-a33b-5391b8326d59
5	08355f74-b9fb-495a-bc02-e2ca8a3833e7	en-US	3f3d65a3-d443-4cc3-b325-7d4eb7694f4f
6	08355f74-b9fb-495a-bc02-e2ca8a3833e7	pl-PL	7c58a1ae-dd5d-4fc6-9b30-b60413d96535
\.


--
-- Data for Name: seo; Type: TABLE DATA; Schema: public; Owner: website-scaffold
--

COPY public.seo (id, title, description, image, slug) FROM stdin;
1fcc396d-58a7-41cd-ac2e-51ea5b140560	Home Page	\N	\N	\N
7b5e0b61-1297-48e2-a0f0-14ac76dd6364	Strona Główna	\N	\N	\N
98014689-22f6-4ba3-a523-51a50da4db46	Subpage 1	\N	\N	subpage-1
0e268336-6f5d-4fb3-a33b-5391b8326d59	Podstrona 1	\N	\N	podstrona-1
3f3d65a3-d443-4cc3-b325-7d4eb7694f4f	Subpage 2	\N	\N	subpage-2
7c58a1ae-dd5d-4fc6-9b30-b60413d96535	Podstrona 2	\N	\N	podstrona-2
\.


--
-- Name: directus_activity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: website-scaffold
--

SELECT pg_catalog.setval('public.directus_activity_id_seq', 181, true);


--
-- Name: directus_fields_id_seq; Type: SEQUENCE SET; Schema: public; Owner: website-scaffold
--

SELECT pg_catalog.setval('public.directus_fields_id_seq', 22, true);


--
-- Name: directus_notifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: website-scaffold
--

SELECT pg_catalog.setval('public.directus_notifications_id_seq', 1, false);


--
-- Name: directus_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: website-scaffold
--

SELECT pg_catalog.setval('public.directus_permissions_id_seq', 1, false);


--
-- Name: directus_presets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: website-scaffold
--

SELECT pg_catalog.setval('public.directus_presets_id_seq', 1, true);


--
-- Name: directus_relations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: website-scaffold
--

SELECT pg_catalog.setval('public.directus_relations_id_seq', 5, true);


--
-- Name: directus_revisions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: website-scaffold
--

SELECT pg_catalog.setval('public.directus_revisions_id_seq', 180, true);


--
-- Name: directus_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: website-scaffold
--

SELECT pg_catalog.setval('public.directus_settings_id_seq', 1, false);


--
-- Name: directus_webhooks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: website-scaffold
--

SELECT pg_catalog.setval('public.directus_webhooks_id_seq', 1, false);


--
-- Name: pages_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: website-scaffold
--

SELECT pg_catalog.setval('public.pages_translations_id_seq', 6, true);


--
-- Name: directus_activity directus_activity_pkey; Type: CONSTRAINT; Schema: public; Owner: website-scaffold
--

ALTER TABLE ONLY public.directus_activity
    ADD CONSTRAINT directus_activity_pkey PRIMARY KEY (id);


--
-- Name: directus_collections directus_collections_pkey; Type: CONSTRAINT; Schema: public; Owner: website-scaffold
--

ALTER TABLE ONLY public.directus_collections
    ADD CONSTRAINT directus_collections_pkey PRIMARY KEY (collection);


--
-- Name: directus_dashboards directus_dashboards_pkey; Type: CONSTRAINT; Schema: public; Owner: website-scaffold
--

ALTER TABLE ONLY public.directus_dashboards
    ADD CONSTRAINT directus_dashboards_pkey PRIMARY KEY (id);


--
-- Name: directus_extensions directus_extensions_pkey; Type: CONSTRAINT; Schema: public; Owner: website-scaffold
--

ALTER TABLE ONLY public.directus_extensions
    ADD CONSTRAINT directus_extensions_pkey PRIMARY KEY (name);


--
-- Name: directus_fields directus_fields_pkey; Type: CONSTRAINT; Schema: public; Owner: website-scaffold
--

ALTER TABLE ONLY public.directus_fields
    ADD CONSTRAINT directus_fields_pkey PRIMARY KEY (id);


--
-- Name: directus_files directus_files_pkey; Type: CONSTRAINT; Schema: public; Owner: website-scaffold
--

ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_pkey PRIMARY KEY (id);


--
-- Name: directus_flows directus_flows_operation_unique; Type: CONSTRAINT; Schema: public; Owner: website-scaffold
--

ALTER TABLE ONLY public.directus_flows
    ADD CONSTRAINT directus_flows_operation_unique UNIQUE (operation);


--
-- Name: directus_flows directus_flows_pkey; Type: CONSTRAINT; Schema: public; Owner: website-scaffold
--

ALTER TABLE ONLY public.directus_flows
    ADD CONSTRAINT directus_flows_pkey PRIMARY KEY (id);


--
-- Name: directus_folders directus_folders_pkey; Type: CONSTRAINT; Schema: public; Owner: website-scaffold
--

ALTER TABLE ONLY public.directus_folders
    ADD CONSTRAINT directus_folders_pkey PRIMARY KEY (id);


--
-- Name: directus_migrations directus_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: website-scaffold
--

ALTER TABLE ONLY public.directus_migrations
    ADD CONSTRAINT directus_migrations_pkey PRIMARY KEY (version);


--
-- Name: directus_notifications directus_notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: website-scaffold
--

ALTER TABLE ONLY public.directus_notifications
    ADD CONSTRAINT directus_notifications_pkey PRIMARY KEY (id);


--
-- Name: directus_operations directus_operations_pkey; Type: CONSTRAINT; Schema: public; Owner: website-scaffold
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_pkey PRIMARY KEY (id);


--
-- Name: directus_operations directus_operations_reject_unique; Type: CONSTRAINT; Schema: public; Owner: website-scaffold
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_reject_unique UNIQUE (reject);


--
-- Name: directus_operations directus_operations_resolve_unique; Type: CONSTRAINT; Schema: public; Owner: website-scaffold
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_resolve_unique UNIQUE (resolve);


--
-- Name: directus_panels directus_panels_pkey; Type: CONSTRAINT; Schema: public; Owner: website-scaffold
--

ALTER TABLE ONLY public.directus_panels
    ADD CONSTRAINT directus_panels_pkey PRIMARY KEY (id);


--
-- Name: directus_permissions directus_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: website-scaffold
--

ALTER TABLE ONLY public.directus_permissions
    ADD CONSTRAINT directus_permissions_pkey PRIMARY KEY (id);


--
-- Name: directus_presets directus_presets_pkey; Type: CONSTRAINT; Schema: public; Owner: website-scaffold
--

ALTER TABLE ONLY public.directus_presets
    ADD CONSTRAINT directus_presets_pkey PRIMARY KEY (id);


--
-- Name: directus_relations directus_relations_pkey; Type: CONSTRAINT; Schema: public; Owner: website-scaffold
--

ALTER TABLE ONLY public.directus_relations
    ADD CONSTRAINT directus_relations_pkey PRIMARY KEY (id);


--
-- Name: directus_revisions directus_revisions_pkey; Type: CONSTRAINT; Schema: public; Owner: website-scaffold
--

ALTER TABLE ONLY public.directus_revisions
    ADD CONSTRAINT directus_revisions_pkey PRIMARY KEY (id);


--
-- Name: directus_roles directus_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: website-scaffold
--

ALTER TABLE ONLY public.directus_roles
    ADD CONSTRAINT directus_roles_pkey PRIMARY KEY (id);


--
-- Name: directus_sessions directus_sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: website-scaffold
--

ALTER TABLE ONLY public.directus_sessions
    ADD CONSTRAINT directus_sessions_pkey PRIMARY KEY (token);


--
-- Name: directus_settings directus_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: website-scaffold
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_pkey PRIMARY KEY (id);


--
-- Name: directus_shares directus_shares_pkey; Type: CONSTRAINT; Schema: public; Owner: website-scaffold
--

ALTER TABLE ONLY public.directus_shares
    ADD CONSTRAINT directus_shares_pkey PRIMARY KEY (id);


--
-- Name: directus_translations directus_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: website-scaffold
--

ALTER TABLE ONLY public.directus_translations
    ADD CONSTRAINT directus_translations_pkey PRIMARY KEY (id);


--
-- Name: directus_users directus_users_email_unique; Type: CONSTRAINT; Schema: public; Owner: website-scaffold
--

ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_email_unique UNIQUE (email);


--
-- Name: directus_users directus_users_external_identifier_unique; Type: CONSTRAINT; Schema: public; Owner: website-scaffold
--

ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_external_identifier_unique UNIQUE (external_identifier);


--
-- Name: directus_users directus_users_pkey; Type: CONSTRAINT; Schema: public; Owner: website-scaffold
--

ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_pkey PRIMARY KEY (id);


--
-- Name: directus_users directus_users_token_unique; Type: CONSTRAINT; Schema: public; Owner: website-scaffold
--

ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_token_unique UNIQUE (token);


--
-- Name: directus_versions directus_versions_pkey; Type: CONSTRAINT; Schema: public; Owner: website-scaffold
--

ALTER TABLE ONLY public.directus_versions
    ADD CONSTRAINT directus_versions_pkey PRIMARY KEY (id);


--
-- Name: directus_webhooks directus_webhooks_pkey; Type: CONSTRAINT; Schema: public; Owner: website-scaffold
--

ALTER TABLE ONLY public.directus_webhooks
    ADD CONSTRAINT directus_webhooks_pkey PRIMARY KEY (id);


--
-- Name: languages languages_name_unique; Type: CONSTRAINT; Schema: public; Owner: website-scaffold
--

ALTER TABLE ONLY public.languages
    ADD CONSTRAINT languages_name_unique UNIQUE (name);


--
-- Name: languages languages_pkey; Type: CONSTRAINT; Schema: public; Owner: website-scaffold
--

ALTER TABLE ONLY public.languages
    ADD CONSTRAINT languages_pkey PRIMARY KEY (code);


--
-- Name: pages pages_pkey; Type: CONSTRAINT; Schema: public; Owner: website-scaffold
--

ALTER TABLE ONLY public.pages
    ADD CONSTRAINT pages_pkey PRIMARY KEY (id);


--
-- Name: pages_translations pages_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: website-scaffold
--

ALTER TABLE ONLY public.pages_translations
    ADD CONSTRAINT pages_translations_pkey PRIMARY KEY (id);


--
-- Name: seo seo_pkey; Type: CONSTRAINT; Schema: public; Owner: website-scaffold
--

ALTER TABLE ONLY public.seo
    ADD CONSTRAINT seo_pkey PRIMARY KEY (id);


--
-- Name: directus_collections directus_collections_group_foreign; Type: FK CONSTRAINT; Schema: public; Owner: website-scaffold
--

ALTER TABLE ONLY public.directus_collections
    ADD CONSTRAINT directus_collections_group_foreign FOREIGN KEY ("group") REFERENCES public.directus_collections(collection);


--
-- Name: directus_dashboards directus_dashboards_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: website-scaffold
--

ALTER TABLE ONLY public.directus_dashboards
    ADD CONSTRAINT directus_dashboards_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_files directus_files_folder_foreign; Type: FK CONSTRAINT; Schema: public; Owner: website-scaffold
--

ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_folder_foreign FOREIGN KEY (folder) REFERENCES public.directus_folders(id) ON DELETE SET NULL;


--
-- Name: directus_files directus_files_modified_by_foreign; Type: FK CONSTRAINT; Schema: public; Owner: website-scaffold
--

ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_modified_by_foreign FOREIGN KEY (modified_by) REFERENCES public.directus_users(id);


--
-- Name: directus_files directus_files_uploaded_by_foreign; Type: FK CONSTRAINT; Schema: public; Owner: website-scaffold
--

ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_uploaded_by_foreign FOREIGN KEY (uploaded_by) REFERENCES public.directus_users(id);


--
-- Name: directus_flows directus_flows_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: website-scaffold
--

ALTER TABLE ONLY public.directus_flows
    ADD CONSTRAINT directus_flows_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_folders directus_folders_parent_foreign; Type: FK CONSTRAINT; Schema: public; Owner: website-scaffold
--

ALTER TABLE ONLY public.directus_folders
    ADD CONSTRAINT directus_folders_parent_foreign FOREIGN KEY (parent) REFERENCES public.directus_folders(id);


--
-- Name: directus_notifications directus_notifications_recipient_foreign; Type: FK CONSTRAINT; Schema: public; Owner: website-scaffold
--

ALTER TABLE ONLY public.directus_notifications
    ADD CONSTRAINT directus_notifications_recipient_foreign FOREIGN KEY (recipient) REFERENCES public.directus_users(id) ON DELETE CASCADE;


--
-- Name: directus_notifications directus_notifications_sender_foreign; Type: FK CONSTRAINT; Schema: public; Owner: website-scaffold
--

ALTER TABLE ONLY public.directus_notifications
    ADD CONSTRAINT directus_notifications_sender_foreign FOREIGN KEY (sender) REFERENCES public.directus_users(id);


--
-- Name: directus_operations directus_operations_flow_foreign; Type: FK CONSTRAINT; Schema: public; Owner: website-scaffold
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_flow_foreign FOREIGN KEY (flow) REFERENCES public.directus_flows(id) ON DELETE CASCADE;


--
-- Name: directus_operations directus_operations_reject_foreign; Type: FK CONSTRAINT; Schema: public; Owner: website-scaffold
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_reject_foreign FOREIGN KEY (reject) REFERENCES public.directus_operations(id);


--
-- Name: directus_operations directus_operations_resolve_foreign; Type: FK CONSTRAINT; Schema: public; Owner: website-scaffold
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_resolve_foreign FOREIGN KEY (resolve) REFERENCES public.directus_operations(id);


--
-- Name: directus_operations directus_operations_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: website-scaffold
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_panels directus_panels_dashboard_foreign; Type: FK CONSTRAINT; Schema: public; Owner: website-scaffold
--

ALTER TABLE ONLY public.directus_panels
    ADD CONSTRAINT directus_panels_dashboard_foreign FOREIGN KEY (dashboard) REFERENCES public.directus_dashboards(id) ON DELETE CASCADE;


--
-- Name: directus_panels directus_panels_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: website-scaffold
--

ALTER TABLE ONLY public.directus_panels
    ADD CONSTRAINT directus_panels_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_permissions directus_permissions_role_foreign; Type: FK CONSTRAINT; Schema: public; Owner: website-scaffold
--

ALTER TABLE ONLY public.directus_permissions
    ADD CONSTRAINT directus_permissions_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles(id) ON DELETE CASCADE;


--
-- Name: directus_presets directus_presets_role_foreign; Type: FK CONSTRAINT; Schema: public; Owner: website-scaffold
--

ALTER TABLE ONLY public.directus_presets
    ADD CONSTRAINT directus_presets_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles(id) ON DELETE CASCADE;


--
-- Name: directus_presets directus_presets_user_foreign; Type: FK CONSTRAINT; Schema: public; Owner: website-scaffold
--

ALTER TABLE ONLY public.directus_presets
    ADD CONSTRAINT directus_presets_user_foreign FOREIGN KEY ("user") REFERENCES public.directus_users(id) ON DELETE CASCADE;


--
-- Name: directus_revisions directus_revisions_activity_foreign; Type: FK CONSTRAINT; Schema: public; Owner: website-scaffold
--

ALTER TABLE ONLY public.directus_revisions
    ADD CONSTRAINT directus_revisions_activity_foreign FOREIGN KEY (activity) REFERENCES public.directus_activity(id) ON DELETE CASCADE;


--
-- Name: directus_revisions directus_revisions_parent_foreign; Type: FK CONSTRAINT; Schema: public; Owner: website-scaffold
--

ALTER TABLE ONLY public.directus_revisions
    ADD CONSTRAINT directus_revisions_parent_foreign FOREIGN KEY (parent) REFERENCES public.directus_revisions(id);


--
-- Name: directus_revisions directus_revisions_version_foreign; Type: FK CONSTRAINT; Schema: public; Owner: website-scaffold
--

ALTER TABLE ONLY public.directus_revisions
    ADD CONSTRAINT directus_revisions_version_foreign FOREIGN KEY (version) REFERENCES public.directus_versions(id) ON DELETE CASCADE;


--
-- Name: directus_sessions directus_sessions_share_foreign; Type: FK CONSTRAINT; Schema: public; Owner: website-scaffold
--

ALTER TABLE ONLY public.directus_sessions
    ADD CONSTRAINT directus_sessions_share_foreign FOREIGN KEY (share) REFERENCES public.directus_shares(id) ON DELETE CASCADE;


--
-- Name: directus_sessions directus_sessions_user_foreign; Type: FK CONSTRAINT; Schema: public; Owner: website-scaffold
--

ALTER TABLE ONLY public.directus_sessions
    ADD CONSTRAINT directus_sessions_user_foreign FOREIGN KEY ("user") REFERENCES public.directus_users(id) ON DELETE CASCADE;


--
-- Name: directus_settings directus_settings_project_logo_foreign; Type: FK CONSTRAINT; Schema: public; Owner: website-scaffold
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_project_logo_foreign FOREIGN KEY (project_logo) REFERENCES public.directus_files(id);


--
-- Name: directus_settings directus_settings_public_background_foreign; Type: FK CONSTRAINT; Schema: public; Owner: website-scaffold
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_public_background_foreign FOREIGN KEY (public_background) REFERENCES public.directus_files(id);


--
-- Name: directus_settings directus_settings_public_favicon_foreign; Type: FK CONSTRAINT; Schema: public; Owner: website-scaffold
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_public_favicon_foreign FOREIGN KEY (public_favicon) REFERENCES public.directus_files(id);


--
-- Name: directus_settings directus_settings_public_foreground_foreign; Type: FK CONSTRAINT; Schema: public; Owner: website-scaffold
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_public_foreground_foreign FOREIGN KEY (public_foreground) REFERENCES public.directus_files(id);


--
-- Name: directus_settings directus_settings_storage_default_folder_foreign; Type: FK CONSTRAINT; Schema: public; Owner: website-scaffold
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_storage_default_folder_foreign FOREIGN KEY (storage_default_folder) REFERENCES public.directus_folders(id) ON DELETE SET NULL;


--
-- Name: directus_shares directus_shares_collection_foreign; Type: FK CONSTRAINT; Schema: public; Owner: website-scaffold
--

ALTER TABLE ONLY public.directus_shares
    ADD CONSTRAINT directus_shares_collection_foreign FOREIGN KEY (collection) REFERENCES public.directus_collections(collection) ON DELETE CASCADE;


--
-- Name: directus_shares directus_shares_role_foreign; Type: FK CONSTRAINT; Schema: public; Owner: website-scaffold
--

ALTER TABLE ONLY public.directus_shares
    ADD CONSTRAINT directus_shares_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles(id) ON DELETE CASCADE;


--
-- Name: directus_shares directus_shares_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: website-scaffold
--

ALTER TABLE ONLY public.directus_shares
    ADD CONSTRAINT directus_shares_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_users directus_users_role_foreign; Type: FK CONSTRAINT; Schema: public; Owner: website-scaffold
--

ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles(id) ON DELETE SET NULL;


--
-- Name: directus_versions directus_versions_collection_foreign; Type: FK CONSTRAINT; Schema: public; Owner: website-scaffold
--

ALTER TABLE ONLY public.directus_versions
    ADD CONSTRAINT directus_versions_collection_foreign FOREIGN KEY (collection) REFERENCES public.directus_collections(collection) ON DELETE CASCADE;


--
-- Name: directus_versions directus_versions_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: website-scaffold
--

ALTER TABLE ONLY public.directus_versions
    ADD CONSTRAINT directus_versions_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_versions directus_versions_user_updated_foreign; Type: FK CONSTRAINT; Schema: public; Owner: website-scaffold
--

ALTER TABLE ONLY public.directus_versions
    ADD CONSTRAINT directus_versions_user_updated_foreign FOREIGN KEY (user_updated) REFERENCES public.directus_users(id);


--
-- Name: pages pages_parent_page_foreign; Type: FK CONSTRAINT; Schema: public; Owner: website-scaffold
--

ALTER TABLE ONLY public.pages
    ADD CONSTRAINT pages_parent_page_foreign FOREIGN KEY (parent_page) REFERENCES public.pages(id);


--
-- Name: pages_translations pages_translations_languages_code_foreign; Type: FK CONSTRAINT; Schema: public; Owner: website-scaffold
--

ALTER TABLE ONLY public.pages_translations
    ADD CONSTRAINT pages_translations_languages_code_foreign FOREIGN KEY (languages_code) REFERENCES public.languages(code) ON DELETE SET NULL;


--
-- Name: pages_translations pages_translations_pages_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: website-scaffold
--

ALTER TABLE ONLY public.pages_translations
    ADD CONSTRAINT pages_translations_pages_id_foreign FOREIGN KEY (pages_id) REFERENCES public.pages(id) ON DELETE SET NULL;


--
-- Name: pages_translations pages_translations_seo_foreign; Type: FK CONSTRAINT; Schema: public; Owner: website-scaffold
--

ALTER TABLE ONLY public.pages_translations
    ADD CONSTRAINT pages_translations_seo_foreign FOREIGN KEY (seo) REFERENCES public.seo(id) ON DELETE SET NULL;


--
-- Name: seo seo_image_foreign; Type: FK CONSTRAINT; Schema: public; Owner: website-scaffold
--

ALTER TABLE ONLY public.seo
    ADD CONSTRAINT seo_image_foreign FOREIGN KEY (image) REFERENCES public.directus_files(id) ON DELETE SET NULL;


--
-- PostgreSQL database dump complete
--

