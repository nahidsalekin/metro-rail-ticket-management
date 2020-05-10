--
-- PostgreSQL database dump
--

-- Dumped from database version 12.2
-- Dumped by pg_dump version 12.2

-- Started on 2020-05-10 22:57:39

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
-- TOC entry 222 (class 1259 OID 24933)
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 24931)
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- TOC entry 3035 (class 0 OID 0)
-- Dependencies: 221
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- TOC entry 224 (class 1259 OID 24943)
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 24941)
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- TOC entry 3036 (class 0 OID 0)
-- Dependencies: 223
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- TOC entry 220 (class 1259 OID 24925)
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 24923)
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- TOC entry 3037 (class 0 OID 0)
-- Dependencies: 219
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- TOC entry 226 (class 1259 OID 24951)
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 24961)
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 24959)
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO postgres;

--
-- TOC entry 3038 (class 0 OID 0)
-- Dependencies: 227
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- TOC entry 225 (class 1259 OID 24949)
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO postgres;

--
-- TOC entry 3039 (class 0 OID 0)
-- Dependencies: 225
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- TOC entry 230 (class 1259 OID 24969)
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 24967)
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO postgres;

--
-- TOC entry 3040 (class 0 OID 0)
-- Dependencies: 229
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- TOC entry 232 (class 1259 OID 25029)
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 25027)
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- TOC entry 3041 (class 0 OID 0)
-- Dependencies: 231
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- TOC entry 218 (class 1259 OID 24915)
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 24913)
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- TOC entry 3042 (class 0 OID 0)
-- Dependencies: 217
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- TOC entry 203 (class 1259 OID 24844)
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 24842)
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- TOC entry 3043 (class 0 OID 0)
-- Dependencies: 202
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- TOC entry 233 (class 1259 OID 25060)
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 24853)
-- Name: main_booking; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_booking (
    id character varying(50) NOT NULL,
    number character varying(20) NOT NULL,
    date date NOT NULL,
    start_point character varying(50) NOT NULL,
    destination character varying(50) NOT NULL,
    "time" character varying(50) NOT NULL,
    class_type character varying(20) NOT NULL,
    tickets integer NOT NULL,
    cost double precision NOT NULL,
    status character varying(20) NOT NULL
);


ALTER TABLE public.main_booking OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 24860)
-- Name: main_location; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_location (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    lattitude double precision NOT NULL,
    longitude double precision NOT NULL,
    serial integer NOT NULL
);


ALTER TABLE public.main_location OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 24858)
-- Name: main_location_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_location_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_location_id_seq OWNER TO postgres;

--
-- TOC entry 3044 (class 0 OID 0)
-- Dependencies: 205
-- Name: main_location_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_location_id_seq OWNED BY public.main_location.id;


--
-- TOC entry 208 (class 1259 OID 24868)
-- Name: main_main; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_main (
    id integer NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.main_main OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 24866)
-- Name: main_main_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_main_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_main_id_seq OWNER TO postgres;

--
-- TOC entry 3045 (class 0 OID 0)
-- Dependencies: 207
-- Name: main_main_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_main_id_seq OWNED BY public.main_main.id;


--
-- TOC entry 210 (class 1259 OID 24876)
-- Name: main_routes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_routes (
    id integer NOT NULL,
    start_point character varying(50) NOT NULL,
    destination character varying(50) NOT NULL,
    distance double precision NOT NULL,
    price double precision NOT NULL
);


ALTER TABLE public.main_routes OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 24874)
-- Name: main_routes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_routes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_routes_id_seq OWNER TO postgres;

--
-- TOC entry 3046 (class 0 OID 0)
-- Dependencies: 209
-- Name: main_routes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_routes_id_seq OWNED BY public.main_routes.id;


--
-- TOC entry 212 (class 1259 OID 24884)
-- Name: main_seat; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_seat (
    id integer NOT NULL,
    booking_id character varying(50) NOT NULL,
    occupied integer NOT NULL,
    date date NOT NULL,
    start_point character varying(50) NOT NULL,
    destination character varying(50) NOT NULL,
    "time" character varying(50) NOT NULL
);


ALTER TABLE public.main_seat OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 24882)
-- Name: main_seat_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_seat_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_seat_id_seq OWNER TO postgres;

--
-- TOC entry 3047 (class 0 OID 0)
-- Dependencies: 211
-- Name: main_seat_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_seat_id_seq OWNED BY public.main_seat.id;


--
-- TOC entry 214 (class 1259 OID 24892)
-- Name: main_ticket; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_ticket (
    id integer NOT NULL,
    price double precision NOT NULL,
    slots integer NOT NULL,
    class_type text NOT NULL,
    base_fare double precision NOT NULL
);


ALTER TABLE public.main_ticket OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 24890)
-- Name: main_ticket_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_ticket_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_ticket_id_seq OWNER TO postgres;

--
-- TOC entry 3048 (class 0 OID 0)
-- Dependencies: 213
-- Name: main_ticket_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_ticket_id_seq OWNED BY public.main_ticket.id;


--
-- TOC entry 216 (class 1259 OID 24903)
-- Name: main_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_user (
    id integer NOT NULL,
    fullname character varying(50) NOT NULL,
    username character varying(20) NOT NULL,
    email text NOT NULL,
    gender text NOT NULL,
    age integer NOT NULL,
    number character varying(20) NOT NULL,
    password character varying(20) NOT NULL,
    image character varying(100) NOT NULL
);


ALTER TABLE public.main_user OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 24901)
-- Name: main_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_user_id_seq OWNER TO postgres;

--
-- TOC entry 3049 (class 0 OID 0)
-- Dependencies: 215
-- Name: main_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_user_id_seq OWNED BY public.main_user.id;


--
-- TOC entry 2794 (class 2604 OID 24936)
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- TOC entry 2795 (class 2604 OID 24946)
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- TOC entry 2793 (class 2604 OID 24928)
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- TOC entry 2796 (class 2604 OID 24954)
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- TOC entry 2797 (class 2604 OID 24964)
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- TOC entry 2798 (class 2604 OID 24972)
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- TOC entry 2799 (class 2604 OID 25032)
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- TOC entry 2792 (class 2604 OID 24918)
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- TOC entry 2785 (class 2604 OID 24847)
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- TOC entry 2786 (class 2604 OID 24863)
-- Name: main_location id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_location ALTER COLUMN id SET DEFAULT nextval('public.main_location_id_seq'::regclass);


--
-- TOC entry 2787 (class 2604 OID 24871)
-- Name: main_main id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_main ALTER COLUMN id SET DEFAULT nextval('public.main_main_id_seq'::regclass);


--
-- TOC entry 2788 (class 2604 OID 24879)
-- Name: main_routes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_routes ALTER COLUMN id SET DEFAULT nextval('public.main_routes_id_seq'::regclass);


--
-- TOC entry 2789 (class 2604 OID 24887)
-- Name: main_seat id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_seat ALTER COLUMN id SET DEFAULT nextval('public.main_seat_id_seq'::regclass);


--
-- TOC entry 2790 (class 2604 OID 24895)
-- Name: main_ticket id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_ticket ALTER COLUMN id SET DEFAULT nextval('public.main_ticket_id_seq'::regclass);


--
-- TOC entry 2791 (class 2604 OID 24906)
-- Name: main_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_user ALTER COLUMN id SET DEFAULT nextval('public.main_user_id_seq'::regclass);


--
-- TOC entry 3018 (class 0 OID 24933)
-- Dependencies: 222
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- TOC entry 3020 (class 0 OID 24943)
-- Dependencies: 224
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- TOC entry 3016 (class 0 OID 24925)
-- Dependencies: 220
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add booking	7	add_booking
26	Can change booking	7	change_booking
27	Can delete booking	7	delete_booking
28	Can view booking	7	view_booking
29	Can add location	8	add_location
30	Can change location	8	change_location
31	Can delete location	8	delete_location
32	Can view location	8	view_location
33	Can add main	9	add_main
34	Can change main	9	change_main
35	Can delete main	9	delete_main
36	Can view main	9	view_main
37	Can add routes	10	add_routes
38	Can change routes	10	change_routes
39	Can delete routes	10	delete_routes
40	Can view routes	10	view_routes
41	Can add seat	11	add_seat
42	Can change seat	11	change_seat
43	Can delete seat	11	delete_seat
44	Can view seat	11	view_seat
45	Can add ticket	12	add_ticket
46	Can change ticket	12	change_ticket
47	Can delete ticket	12	delete_ticket
48	Can view ticket	12	view_ticket
49	Can add user	13	add_user
50	Can change user	13	change_user
51	Can delete user	13	delete_user
52	Can view user	13	view_user
\.


--
-- TOC entry 3022 (class 0 OID 24951)
-- Dependencies: 226
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$180000$wCt8wpDclUrR$5ME84c0im6Mk39dR13ths1O3SFOCfP25mNBNKxkq5HQ=	2020-04-20 21:16:39.041871+06	t	nahid			khannahid64@gmail.com	t	t	2020-04-20 21:16:09.544528+06
\.


--
-- TOC entry 3024 (class 0 OID 24961)
-- Dependencies: 228
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- TOC entry 3026 (class 0 OID 24969)
-- Dependencies: 230
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- TOC entry 3028 (class 0 OID 25029)
-- Dependencies: 232
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2020-04-30 00:49:08.53079+06	3	Serajus Salekin	1	[{"added": {}}]	13	1
2	2020-04-30 00:50:22.989424+06	3	Serajus Salekin	3		13	1
3	2020-04-30 00:50:39.120078+06	4	Serajus Salekin	1	[{"added": {}}]	13	1
4	2020-04-30 02:32:55.481502+06	2	Mr. x	2	[{"changed": {"fields": ["Image"]}}]	13	1
5	2020-04-30 02:41:24.767706+06	4	Serajus Salekin	3		13	1
6	2020-05-05 23:48:41.064792+06	wicdok	01927904143	2	[{"changed": {"fields": ["Status"]}}]	7	1
7	2020-05-05 23:48:48.419088+06	wclgqi	53241224	2	[{"changed": {"fields": ["Status"]}}]	7	1
8	2020-05-05 23:48:54.935305+06	kqxxry	53241224	2	[{"changed": {"fields": ["Status"]}}]	7	1
9	2020-05-06 00:06:31.978323+06	wicdok	01927904143	2	[{"changed": {"fields": ["Status"]}}]	7	1
10	2020-05-06 00:06:37.757993+06	wclgqi	53241224	2	[{"changed": {"fields": ["Status"]}}]	7	1
11	2020-05-06 00:06:42.731077+06	kqxxry	53241224	2	[{"changed": {"fields": ["Status"]}}]	7	1
12	2020-05-06 00:06:48.050428+06	bpzmzz	53241224	2	[]	7	1
13	2020-05-06 01:50:22.958172+06	kqxxry	53241224	2	[{"changed": {"fields": ["Status"]}}]	7	1
14	2020-05-09 12:53:19.807499+06	6	abc	3		13	1
15	2020-05-10 22:22:51.401658+06	7	Nahid salekin	3		13	1
\.


--
-- TOC entry 3014 (class 0 OID 24915)
-- Dependencies: 218
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	main	booking
8	main	location
9	main	main
10	main	routes
11	main	seat
12	main	ticket
13	main	user
\.


--
-- TOC entry 2999 (class 0 OID 24844)
-- Dependencies: 203
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	main	0001_initial	2020-04-20 21:10:29.660972+06
2	contenttypes	0001_initial	2020-04-20 21:15:16.756506+06
3	auth	0001_initial	2020-04-20 21:15:16.913087+06
4	admin	0001_initial	2020-04-20 21:15:17.021156+06
5	admin	0002_logentry_remove_auto_add	2020-04-20 21:15:17.050078+06
6	admin	0003_logentry_add_action_flag_choices	2020-04-20 21:15:17.063551+06
7	contenttypes	0002_remove_content_type_name	2020-04-20 21:15:17.101451+06
8	auth	0002_alter_permission_name_max_length	2020-04-20 21:15:17.110427+06
9	auth	0003_alter_user_email_max_length	2020-04-20 21:15:17.126383+06
10	auth	0004_alter_user_username_opts	2020-04-20 21:15:17.13935+06
11	auth	0005_alter_user_last_login_null	2020-04-20 21:15:17.15032+06
12	auth	0006_require_contenttypes_0002	2020-04-20 21:15:17.153313+06
13	auth	0007_alter_validators_add_error_messages	2020-04-20 21:15:17.167787+06
14	auth	0008_alter_user_username_max_length	2020-04-20 21:15:17.199702+06
15	auth	0009_alter_user_last_name_max_length	2020-04-20 21:15:17.210672+06
16	auth	0010_alter_group_name_max_length	2020-04-20 21:15:17.225633+06
17	auth	0011_update_proxy_permissions	2020-04-20 21:15:17.240594+06
18	sessions	0001_initial	2020-04-20 21:15:17.254557+06
19	main	0002_user_image	2020-04-30 00:33:02.251257+06
20	main	0003_auto_20200430_0035	2020-04-30 00:35:41.949812+06
21	main	0004_auto_20200430_0048	2020-04-30 00:48:11.987555+06
22	main	0005_auto_20200430_0050	2020-04-30 00:50:04.731071+06
23	main	0006_auto_20200430_0230	2020-04-30 02:30:50.568471+06
24	main	0007_booking_status	2020-05-04 02:54:57.576774+06
25	main	0008_auto_20200506_1616	2020-05-06 16:16:49.975171+06
\.


--
-- TOC entry 3029 (class 0 OID 25060)
-- Dependencies: 233
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
bq8jtv0j4ypw7aej342bcducg1qglgjj	NDcyZWUyNzYzZTI3ZWY0N2JhYmNjYmMxNmI1MGNmYmI2YzZjMmRhMzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjYWNjOGZlMTlmZjQ2NzQzODJhZWI5YTIzYTI5M2Y2ZDgzYjMyNmU4IiwidXNlcm5hbWUiOiJuYWhpZCIsImltYWdlIjoiL21lZGlhL3Byb2ZpbGVfaW1hZ2VzL19EU0MwMzA2X0V6aFNDN3AuSlBHIn0=	2020-05-24 22:24:40.283831+06
\.


--
-- TOC entry 3000 (class 0 OID 24853)
-- Dependencies: 204
-- Data for Name: main_booking; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_booking (id, number, date, start_point, destination, "time", class_type, tickets, cost, status) FROM stdin;
wicdok	01927904143	2020-05-02	Badda	Mouchak	02:00 PM	student	2	74	paid
wclgqi	53241224	2020-05-06	Badda	Mouchak	02:00 PM	student	3	111	paid
xpgkon	123456789	2020-05-10	Motijheel	Uttara	02:00 PM	tourist	2	530	unpaid
ldujso	123456789	2020-05-12	Mirpur-10	Mogbazar	10:00 AM	tourist	2	246	unpaid
knldsn	123456789	2020-05-10	Motijheel	Rampura Bridge	10:30 PM	tourist	3	225	unpaid
efbwda	53241224	2020-05-08	Uttara	Rampura Bridge	10:00 AM	student	3	360	paid
cikbcj	512313315	2020-05-11	Uttara	Rampura Bridge	10:30 PM	student	4	480	unpaid
\.


--
-- TOC entry 3002 (class 0 OID 24860)
-- Dependencies: 206
-- Data for Name: main_location; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_location (id, name, lattitude, longitude, serial) FROM stdin;
1	Badda	23.780253463095754	90.42568499949839	1
3	Uttara	23.8741829486	90.4005289078	1
4	Rampura Bridge	23.7682022173	90.4234457016	1
6	Motijheel	23.7262296719	90.4215145111	1
7	Mirpur-10	23.807260000000042	90.36847000000006	1
8	Bijoy Sarani	23.7644709995	90.3889739513	1
9	Mogbazar	23.7486219504	90.4080927372	1
14	Mouchak	23.745670000000075	90.41208000000006	1
\.


--
-- TOC entry 3004 (class 0 OID 24868)
-- Dependencies: 208
-- Data for Name: main_main; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_main (id, name) FROM stdin;
\.


--
-- TOC entry 3006 (class 0 OID 24876)
-- Dependencies: 210
-- Data for Name: main_routes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_routes (id, start_point, destination, distance, price) FROM stdin;
\.


--
-- TOC entry 3008 (class 0 OID 24884)
-- Dependencies: 212
-- Data for Name: main_seat; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_seat (id, booking_id, occupied, date, start_point, destination, "time") FROM stdin;
27	wicdok	31	2020-05-02	Badda	Mouchak	02:00 PM
28	wicdok	32	2020-05-02	Badda	Mouchak	02:00 PM
33	wclgqi	36	2020-05-06	Badda	Mouchak	02:00 PM
34	wclgqi	37	2020-05-06	Badda	Mouchak	02:00 PM
35	wclgqi	4	2020-05-06	Badda	Mouchak	02:00 PM
39	fhipmk	16	2020-05-06	Uttara	Rampura Bridge	08:00 PM
40	fhipmk	7	2020-05-06	Uttara	Rampura Bridge	08:00 PM
41	efbwda	8	2020-05-08	Uttara	Rampura Bridge	10:00 AM
42	efbwda	9	2020-05-08	Uttara	Rampura Bridge	10:00 AM
43	efbwda	48	2020-05-08	Uttara	Rampura Bridge	10:00 AM
45	xpgkon	32	2020-05-10	Motijheel	Uttara	02:00 PM
46	ldujso	32	2020-05-12	Mirpur-10	Mogbazar	10:00 AM
47	ldujso	32	2020-05-12	Badda	Mogbazar	10:00 AM
48	ldujso	32	2020-05-12	Rampura Bridge	Mogbazar	10:00 AM
49	ldujso	32	2020-05-12	Bijoy Sarani	Mogbazar	10:00 AM
50	ldujso	19	2020-05-12	Mirpur-10	Mogbazar	10:00 AM
51	ldujso	19	2020-05-12	Badda	Mogbazar	10:00 AM
52	ldujso	19	2020-05-12	Rampura Bridge	Mogbazar	10:00 AM
53	ldujso	19	2020-05-12	Bijoy Sarani	Mogbazar	10:00 AM
54	knldsn	6	2020-05-10	Motijheel	Rampura Bridge	10:30 PM
55	knldsn	6	2020-05-10	Mogbazar	Rampura Bridge	10:30 PM
56	knldsn	6	2020-05-11	Mouchak	Rampura Bridge	10:30 PM
57	knldsn	19	2020-05-10	Motijheel	Rampura Bridge	10:30 PM
58	knldsn	19	2020-05-10	Mogbazar	Rampura Bridge	10:30 PM
59	knldsn	19	2020-05-10	Mouchak	Rampura Bridge	10:30 PM
60	knldsn	32	2020-05-10	Motijheel	Rampura Bridge	10:30 PM
61	knldsn	32	2020-05-10	Mogbazar	Rampura Bridge	10:30 PM
62	knldsn	32	2020-05-10	Mouchak	Rampura Bridge	10:30 PM
63	cikbcj	5	2020-05-11	Uttara	Rampura Bridge	10:30 PM
64	cikbcj	5	2020-05-11	Badda	Rampura Bridge	10:30 PM
65	cikbcj	5	2020-05-11	Mirpur-10	Rampura Bridge	10:30 PM
66	cikbcj	6	2020-05-11	Uttara	Rampura Bridge	10:30 PM
67	cikbcj	6	2020-05-11	Badda	Rampura Bridge	10:30 PM
68	cikbcj	6	2020-05-11	Mirpur-10	Rampura Bridge	10:30 PM
69	cikbcj	7	2020-05-11	Uttara	Rampura Bridge	10:30 PM
70	cikbcj	7	2020-05-11	Badda	Rampura Bridge	10:30 PM
71	cikbcj	7	2020-05-11	Mirpur-10	Rampura Bridge	10:30 PM
72	cikbcj	18	2020-05-11	Uttara	Rampura Bridge	10:30 PM
73	cikbcj	18	2020-05-11	Badda	Rampura Bridge	10:30 PM
74	cikbcj	18	2020-05-11	Mirpur-10	Rampura Bridge	10:30 PM
\.


--
-- TOC entry 3010 (class 0 OID 24892)
-- Dependencies: 214
-- Data for Name: main_ticket; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_ticket (id, price, slots, class_type, base_fare) FROM stdin;
3	12	5	category a	0
4	20	10	category b	0
1	16	12	tourist	0
2	10	25	student	0
\.


--
-- TOC entry 3012 (class 0 OID 24903)
-- Dependencies: 216
-- Data for Name: main_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_user (id, fullname, username, email, gender, age, number, password, image) FROM stdin;
1	Mr. Salekin	salekin	khannahid64@gmail.com	male	23	01927904143	1234	profile_images/_DSC0306.JPG
5	Shams Jubair	jubair	jubair32@gmail.com	male	22	123456789	1234	profile_images/_DSC0206.JPG
2	Mr. x	admin	admin@gmail.com	male	23	53241224	admin	profile_images/_DSC0416.JPG
8	Nahid salekin	nahid	nahid@gmail.com	male	23	512313315	1234	profile_images/_DSC0306_EzhSC7p.JPG
\.


--
-- TOC entry 3050 (class 0 OID 0)
-- Dependencies: 221
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- TOC entry 3051 (class 0 OID 0)
-- Dependencies: 223
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- TOC entry 3052 (class 0 OID 0)
-- Dependencies: 219
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 52, true);


--
-- TOC entry 3053 (class 0 OID 0)
-- Dependencies: 227
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- TOC entry 3054 (class 0 OID 0)
-- Dependencies: 225
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, true);


--
-- TOC entry 3055 (class 0 OID 0)
-- Dependencies: 229
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- TOC entry 3056 (class 0 OID 0)
-- Dependencies: 231
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 15, true);


--
-- TOC entry 3057 (class 0 OID 0)
-- Dependencies: 217
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 13, true);


--
-- TOC entry 3058 (class 0 OID 0)
-- Dependencies: 202
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 25, true);


--
-- TOC entry 3059 (class 0 OID 0)
-- Dependencies: 205
-- Name: main_location_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.main_location_id_seq', 16, true);


--
-- TOC entry 3060 (class 0 OID 0)
-- Dependencies: 207
-- Name: main_main_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.main_main_id_seq', 1, false);


--
-- TOC entry 3061 (class 0 OID 0)
-- Dependencies: 209
-- Name: main_routes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.main_routes_id_seq', 1, false);


--
-- TOC entry 3062 (class 0 OID 0)
-- Dependencies: 211
-- Name: main_seat_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.main_seat_id_seq', 74, true);


--
-- TOC entry 3063 (class 0 OID 0)
-- Dependencies: 213
-- Name: main_ticket_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.main_ticket_id_seq', 4, true);


--
-- TOC entry 3064 (class 0 OID 0)
-- Dependencies: 215
-- Name: main_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.main_user_id_seq', 8, true);


--
-- TOC entry 2829 (class 2606 OID 25058)
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- TOC entry 2834 (class 2606 OID 24985)
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- TOC entry 2837 (class 2606 OID 24948)
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 2831 (class 2606 OID 24938)
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- TOC entry 2824 (class 2606 OID 24976)
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- TOC entry 2826 (class 2606 OID 24930)
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2845 (class 2606 OID 24966)
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- TOC entry 2848 (class 2606 OID 25000)
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- TOC entry 2839 (class 2606 OID 24956)
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- TOC entry 2851 (class 2606 OID 24974)
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 2854 (class 2606 OID 25014)
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- TOC entry 2842 (class 2606 OID 25052)
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- TOC entry 2857 (class 2606 OID 25038)
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- TOC entry 2819 (class 2606 OID 24922)
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- TOC entry 2821 (class 2606 OID 24920)
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- TOC entry 2802 (class 2606 OID 24852)
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 2861 (class 2606 OID 25067)
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- TOC entry 2805 (class 2606 OID 24857)
-- Name: main_booking main_booking_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_booking
    ADD CONSTRAINT main_booking_pkey PRIMARY KEY (id);


--
-- TOC entry 2807 (class 2606 OID 24865)
-- Name: main_location main_location_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_location
    ADD CONSTRAINT main_location_pkey PRIMARY KEY (id);


--
-- TOC entry 2809 (class 2606 OID 24873)
-- Name: main_main main_main_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_main
    ADD CONSTRAINT main_main_pkey PRIMARY KEY (id);


--
-- TOC entry 2811 (class 2606 OID 24881)
-- Name: main_routes main_routes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_routes
    ADD CONSTRAINT main_routes_pkey PRIMARY KEY (id);


--
-- TOC entry 2813 (class 2606 OID 24889)
-- Name: main_seat main_seat_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_seat
    ADD CONSTRAINT main_seat_pkey PRIMARY KEY (id);


--
-- TOC entry 2815 (class 2606 OID 24900)
-- Name: main_ticket main_ticket_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_ticket
    ADD CONSTRAINT main_ticket_pkey PRIMARY KEY (id);


--
-- TOC entry 2817 (class 2606 OID 24911)
-- Name: main_user main_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_user
    ADD CONSTRAINT main_user_pkey PRIMARY KEY (id);


--
-- TOC entry 2827 (class 1259 OID 25059)
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- TOC entry 2832 (class 1259 OID 24996)
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- TOC entry 2835 (class 1259 OID 24997)
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- TOC entry 2822 (class 1259 OID 24982)
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- TOC entry 2843 (class 1259 OID 25012)
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- TOC entry 2846 (class 1259 OID 25011)
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- TOC entry 2849 (class 1259 OID 25026)
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- TOC entry 2852 (class 1259 OID 25025)
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- TOC entry 2840 (class 1259 OID 25053)
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- TOC entry 2855 (class 1259 OID 25049)
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- TOC entry 2858 (class 1259 OID 25050)
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- TOC entry 2859 (class 1259 OID 25069)
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- TOC entry 2862 (class 1259 OID 25068)
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- TOC entry 2803 (class 1259 OID 24912)
-- Name: main_booking_id_69d94e07_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_booking_id_69d94e07_like ON public.main_booking USING btree (id varchar_pattern_ops);


--
-- TOC entry 2865 (class 2606 OID 24991)
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2864 (class 2606 OID 24986)
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2863 (class 2606 OID 24977)
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2867 (class 2606 OID 25006)
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2866 (class 2606 OID 25001)
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2869 (class 2606 OID 25020)
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2868 (class 2606 OID 25015)
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2870 (class 2606 OID 25039)
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2871 (class 2606 OID 25044)
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


-- Completed on 2020-05-10 22:57:39

--
-- PostgreSQL database dump complete
--

