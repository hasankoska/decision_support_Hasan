--
-- PostgreSQL database dump
--

\restrict hq2t0WCffj3DcZ9azsFeZhAp7AVc7kE4iSuQqET5XxjxH55fE2dVfdS6cUAgjYs

-- Dumped from database version 16.13
-- Dumped by pg_dump version 18.0

-- Started on 2026-03-30 11:41:02 CEST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- TOC entry 220 (class 1259 OID 16977)
-- Name: alerts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.alerts (
    alert_id integer NOT NULL,
    patient_id integer,
    alert_level character varying(20),
    alert_message character varying(255),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.alerts OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16976)
-- Name: alerts_alert_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.alerts_alert_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.alerts_alert_id_seq OWNER TO postgres;

--
-- TOC entry 3727 (class 0 OID 0)
-- Dependencies: 219
-- Name: alerts_alert_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.alerts_alert_id_seq OWNED BY public.alerts.alert_id;


--
-- TOC entry 216 (class 1259 OID 16957)
-- Name: patients; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.patients (
    patient_id integer NOT NULL,
    full_name character varying(100) NOT NULL,
    age integer,
    gender character varying(10),
    room_number character varying(10),
    diagnosis character varying(100)
);


ALTER TABLE public.patients OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16956)
-- Name: patients_patient_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.patients_patient_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.patients_patient_id_seq OWNER TO postgres;

--
-- TOC entry 3728 (class 0 OID 0)
-- Dependencies: 215
-- Name: patients_patient_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.patients_patient_id_seq OWNED BY public.patients.patient_id;


--
-- TOC entry 218 (class 1259 OID 16964)
-- Name: vital_signs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vital_signs (
    vital_id integer NOT NULL,
    patient_id integer,
    heart_rate integer,
    temperature numeric(4,1),
    oxygen_level integer,
    systolic_bp integer,
    diastolic_bp integer,
    respiratory_rate integer,
    measurement_time timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.vital_signs OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16963)
-- Name: vital_signs_vital_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.vital_signs_vital_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.vital_signs_vital_id_seq OWNER TO postgres;

--
-- TOC entry 3729 (class 0 OID 0)
-- Dependencies: 217
-- Name: vital_signs_vital_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vital_signs_vital_id_seq OWNED BY public.vital_signs.vital_id;


--
-- TOC entry 3563 (class 2604 OID 16980)
-- Name: alerts alert_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alerts ALTER COLUMN alert_id SET DEFAULT nextval('public.alerts_alert_id_seq'::regclass);


--
-- TOC entry 3560 (class 2604 OID 16960)
-- Name: patients patient_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.patients ALTER COLUMN patient_id SET DEFAULT nextval('public.patients_patient_id_seq'::regclass);


--
-- TOC entry 3561 (class 2604 OID 16967)
-- Name: vital_signs vital_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vital_signs ALTER COLUMN vital_id SET DEFAULT nextval('public.vital_signs_vital_id_seq'::regclass);


--
-- TOC entry 3721 (class 0 OID 16977)
-- Dependencies: 220
-- Data for Name: alerts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.alerts (alert_id, patient_id, alert_level, alert_message, created_at) FROM stdin;
1	2	Warning	Ayse Demir: Warning. HR=102, Temp=37.8, O2=93	2026-03-25 18:40:09.011639
2	3	Critical	Mehmet Kaya: CRITICAL! HR=121, Temp=38.7, O2=88	2026-03-25 18:40:09.018291
3	5	Warning	Ali Can: Warning. HR=110, Temp=38.1, O2=91	2026-03-25 18:40:09.024142
4	2	Warning	Ayse Demir: Warning. HR=102, Temp=37.8, O2=93	2026-03-25 18:40:39.058793
5	3	Critical	Mehmet Kaya: CRITICAL! HR=121, Temp=38.7, O2=88	2026-03-25 18:40:39.066341
6	5	Warning	Ali Can: Warning. HR=110, Temp=38.1, O2=91	2026-03-25 18:40:39.072485
7	2	Warning	Ayse Demir: Warning. HR=102, Temp=37.8, O2=93	2026-03-25 18:41:09.099585
8	3	Critical	Mehmet Kaya: CRITICAL! HR=121, Temp=38.7, O2=88	2026-03-25 18:41:09.105876
9	5	Warning	Ali Can: Warning. HR=110, Temp=38.1, O2=91	2026-03-25 18:41:09.111232
10	2	Warning	Ayse Demir: Warning. HR=102, Temp=37.8, O2=93	2026-03-25 18:41:39.142983
11	3	Critical	Mehmet Kaya: CRITICAL! HR=121, Temp=38.7, O2=88	2026-03-25 18:41:39.149864
12	5	Warning	Ali Can: Warning. HR=110, Temp=38.1, O2=91	2026-03-25 18:41:39.155549
13	2	Warning	Ayse Demir: Warning. HR=102, Temp=37.8, O2=93	2026-03-25 18:42:09.18899
14	3	Critical	Mehmet Kaya: CRITICAL! HR=121, Temp=38.7, O2=88	2026-03-25 18:42:09.195756
15	5	Warning	Ali Can: Warning. HR=110, Temp=38.1, O2=91	2026-03-25 18:42:09.201842
16	2	Warning	Ayse Demir: Warning. HR=102, Temp=37.8, O2=93	2026-03-25 18:42:39.230071
17	3	Critical	Mehmet Kaya: CRITICAL! HR=121, Temp=38.7, O2=88	2026-03-25 18:42:39.238444
18	5	Warning	Ali Can: Warning. HR=110, Temp=38.1, O2=91	2026-03-25 18:42:39.246051
19	2	Warning	Ayse Demir: Warning. HR=102, Temp=37.8, O2=93	2026-03-25 18:42:47.549179
20	3	Critical	Mehmet Kaya: CRITICAL! HR=121, Temp=38.7, O2=88	2026-03-25 18:42:47.555129
21	5	Warning	Ali Can: Warning. HR=110, Temp=38.1, O2=91	2026-03-25 18:42:47.560759
22	2	Warning	Ayse Demir: Warning. HR=102, Temp=37.8, O2=93	2026-03-25 18:42:52.59243
23	3	Critical	Mehmet Kaya: CRITICAL! HR=121, Temp=38.7, O2=88	2026-03-25 18:42:52.599256
24	5	Warning	Ali Can: Warning. HR=110, Temp=38.1, O2=91	2026-03-25 18:42:52.605259
25	2	Warning	Ayse Demir: Warning. HR=102, Temp=37.8, O2=93	2026-03-25 18:42:57.637102
26	3	Critical	Mehmet Kaya: CRITICAL! HR=121, Temp=38.7, O2=88	2026-03-25 18:42:57.643999
27	5	Warning	Ali Can: Warning. HR=110, Temp=38.1, O2=91	2026-03-25 18:42:57.649881
28	2	Warning	Ayse Demir: Warning. HR=102, Temp=37.8, O2=93	2026-03-25 18:43:02.682313
29	3	Critical	Mehmet Kaya: CRITICAL! HR=121, Temp=38.7, O2=88	2026-03-25 18:43:02.689324
30	5	Warning	Ali Can: Warning. HR=110, Temp=38.1, O2=91	2026-03-25 18:43:02.695371
31	2	Warning	Ayse Demir: Warning. HR=102, Temp=37.8, O2=93	2026-03-25 18:43:07.72704
32	3	Critical	Mehmet Kaya: CRITICAL! HR=121, Temp=38.7, O2=88	2026-03-25 18:43:07.733502
33	5	Warning	Ali Can: Warning. HR=110, Temp=38.1, O2=91	2026-03-25 18:43:07.739034
34	2	Warning	Ayse Demir: Warning. HR=102, Temp=37.8, O2=93	2026-03-25 18:43:12.772163
35	3	Critical	Mehmet Kaya: CRITICAL! HR=121, Temp=38.7, O2=88	2026-03-25 18:43:12.779487
36	5	Warning	Ali Can: Warning. HR=110, Temp=38.1, O2=91	2026-03-25 18:43:12.787413
37	2	Warning	Ayse Demir: Warning. HR=102, Temp=37.8, O2=93	2026-03-25 18:43:17.818332
38	3	Critical	Mehmet Kaya: CRITICAL! HR=121, Temp=38.7, O2=88	2026-03-25 18:43:17.824992
39	5	Warning	Ali Can: Warning. HR=110, Temp=38.1, O2=91	2026-03-25 18:43:17.83088
40	2	Warning	Ayse Demir: Warning. HR=102, Temp=37.8, O2=93	2026-03-25 18:43:22.861094
41	3	Critical	Mehmet Kaya: CRITICAL! HR=121, Temp=38.7, O2=88	2026-03-25 18:43:22.867874
42	5	Warning	Ali Can: Warning. HR=110, Temp=38.1, O2=91	2026-03-25 18:43:22.874615
43	2	Warning	Ayse Demir: Warning. HR=102, Temp=37.8, O2=93	2026-03-25 18:43:27.908341
44	3	Critical	Mehmet Kaya: CRITICAL! HR=121, Temp=38.7, O2=88	2026-03-25 18:43:27.915396
45	5	Warning	Ali Can: Warning. HR=110, Temp=38.1, O2=91	2026-03-25 18:43:27.921909
46	2	Warning	Ayse Demir: Warning. HR=102, Temp=37.8, O2=93	2026-03-25 18:43:32.960085
47	3	Critical	Mehmet Kaya: CRITICAL! HR=121, Temp=38.7, O2=88	2026-03-25 18:43:32.966304
48	5	Warning	Ali Can: Warning. HR=110, Temp=38.1, O2=91	2026-03-25 18:43:32.973053
49	2	Warning	Ayse Demir: Warning. HR=102, Temp=37.8, O2=93	2026-03-25 18:43:38.009299
50	3	Critical	Mehmet Kaya: CRITICAL! HR=121, Temp=38.7, O2=88	2026-03-25 18:43:38.017661
51	5	Warning	Ali Can: Warning. HR=110, Temp=38.1, O2=91	2026-03-25 18:43:38.026539
52	2	Warning	Ayse Demir: Warning. HR=102, Temp=37.8, O2=93	2026-03-25 18:43:43.064644
53	3	Critical	Mehmet Kaya: CRITICAL! HR=121, Temp=38.7, O2=88	2026-03-25 18:43:43.071856
54	5	Warning	Ali Can: Warning. HR=110, Temp=38.1, O2=91	2026-03-25 18:43:43.078465
55	2	Warning	Ayse Demir: Warning. HR=102, Temp=37.8, O2=93	2026-03-25 18:43:48.112094
56	3	Critical	Mehmet Kaya: CRITICAL! HR=121, Temp=38.7, O2=88	2026-03-25 18:43:48.118957
57	5	Warning	Ali Can: Warning. HR=110, Temp=38.1, O2=91	2026-03-25 18:43:48.124924
58	2	Warning	Ayse Demir: Warning. HR=102, Temp=37.8, O2=93	2026-03-25 18:43:53.153983
59	3	Critical	Mehmet Kaya: CRITICAL! HR=121, Temp=38.7, O2=88	2026-03-25 18:43:53.161132
60	5	Warning	Ali Can: Warning. HR=110, Temp=38.1, O2=91	2026-03-25 18:43:53.168321
61	2	Warning	Ayse Demir: Warning. HR=102, Temp=37.8, O2=93	2026-03-25 18:43:58.208078
62	3	Critical	Mehmet Kaya: CRITICAL! HR=121, Temp=38.7, O2=88	2026-03-25 18:43:58.216805
63	5	Warning	Ali Can: Warning. HR=110, Temp=38.1, O2=91	2026-03-25 18:43:58.224551
64	2	Warning	Ayse Demir: Warning. HR=102, Temp=37.8, O2=93	2026-03-25 18:44:03.255469
65	3	Critical	Mehmet Kaya: CRITICAL! HR=121, Temp=38.7, O2=88	2026-03-25 18:44:03.263794
66	5	Warning	Ali Can: Warning. HR=110, Temp=38.1, O2=91	2026-03-25 18:44:03.271075
67	2	Warning	Ayse Demir: Warning. HR=102, Temp=37.8, O2=93	2026-03-25 18:44:08.310053
68	3	Critical	Mehmet Kaya: CRITICAL! HR=121, Temp=38.7, O2=88	2026-03-25 18:44:08.317274
69	5	Warning	Ali Can: Warning. HR=110, Temp=38.1, O2=91	2026-03-25 18:44:08.324569
70	2	Warning	Ayse Demir: Warning. HR=102, Temp=37.8, O2=93	2026-03-25 18:44:13.357447
71	3	Critical	Mehmet Kaya: CRITICAL! HR=121, Temp=38.7, O2=88	2026-03-25 18:44:13.363541
72	5	Warning	Ali Can: Warning. HR=110, Temp=38.1, O2=91	2026-03-25 18:44:13.369389
73	2	Warning	Ayse Demir: Warning. HR=102, Temp=37.8, O2=93	2026-03-25 18:44:18.402444
74	3	Critical	Mehmet Kaya: CRITICAL! HR=121, Temp=38.7, O2=88	2026-03-25 18:44:18.410647
75	5	Warning	Ali Can: Warning. HR=110, Temp=38.1, O2=91	2026-03-25 18:44:18.417735
76	2	Warning	Ayse Demir: Warning. HR=102, Temp=37.8, O2=93	2026-03-25 18:44:23.449417
77	3	Critical	Mehmet Kaya: CRITICAL! HR=121, Temp=38.7, O2=88	2026-03-25 18:44:23.456478
78	5	Warning	Ali Can: Warning. HR=110, Temp=38.1, O2=91	2026-03-25 18:44:23.463119
79	2	Warning	Ayse Demir: Warning. HR=102, Temp=37.8, O2=93	2026-03-25 18:45:56.355049
80	3	Critical	Mehmet Kaya: CRITICAL! HR=121, Temp=38.7, O2=88	2026-03-25 18:45:56.361371
81	5	Warning	Ali Can: Warning. HR=110, Temp=38.1, O2=91	2026-03-25 18:45:56.366874
82	2	Warning	Ayse Demir: Warning. HR=102, Temp=37.8, O2=93	2026-03-25 18:46:01.399714
83	3	Critical	Mehmet Kaya: CRITICAL! HR=121, Temp=38.7, O2=88	2026-03-25 18:46:01.406555
84	5	Warning	Ali Can: Warning. HR=110, Temp=38.1, O2=91	2026-03-25 18:46:01.412731
85	2	Warning	Ayse Demir: Warning. HR=102, Temp=37.8, O2=93	2026-03-25 18:46:06.447593
86	3	Critical	Mehmet Kaya: CRITICAL! HR=121, Temp=38.7, O2=88	2026-03-25 18:46:06.454665
87	5	Warning	Ali Can: Warning. HR=110, Temp=38.1, O2=91	2026-03-25 18:46:06.460749
88	2	Warning	Ayse Demir: Warning. HR=102, Temp=37.8, O2=93	2026-03-25 18:46:11.492325
89	3	Critical	Mehmet Kaya: CRITICAL! HR=121, Temp=38.7, O2=88	2026-03-25 18:46:11.499223
90	5	Warning	Ali Can: Warning. HR=110, Temp=38.1, O2=91	2026-03-25 18:46:11.505422
91	2	Warning	Ayse Demir: Warning. HR=102, Temp=37.8, O2=93	2026-03-25 18:46:16.538539
92	3	Critical	Mehmet Kaya: CRITICAL! HR=121, Temp=38.7, O2=88	2026-03-25 18:46:16.545684
93	5	Warning	Ali Can: Warning. HR=110, Temp=38.1, O2=91	2026-03-25 18:46:16.55158
94	2	Warning	Ayse Demir: Warning. HR=102, Temp=37.8, O2=93	2026-03-25 18:46:21.584029
95	3	Critical	Mehmet Kaya: CRITICAL! HR=121, Temp=38.7, O2=88	2026-03-25 18:46:21.591337
96	5	Warning	Ali Can: Warning. HR=110, Temp=38.1, O2=91	2026-03-25 18:46:21.597766
97	2	Warning	Ayse Demir: Warning. HR=102, Temp=37.8, O2=93	2026-03-25 18:46:26.631593
98	3	Critical	Mehmet Kaya: CRITICAL! HR=121, Temp=38.7, O2=88	2026-03-25 18:46:26.638842
99	5	Warning	Ali Can: Warning. HR=110, Temp=38.1, O2=91	2026-03-25 18:46:26.645175
100	2	Warning	Ayse Demir: Warning. HR=102, Temp=37.8, O2=93	2026-03-25 18:46:31.677243
101	3	Critical	Mehmet Kaya: CRITICAL! HR=121, Temp=38.7, O2=88	2026-03-25 18:46:31.683848
102	5	Warning	Ali Can: Warning. HR=110, Temp=38.1, O2=91	2026-03-25 18:46:31.689823
103	2	Warning	Ayse Demir: Warning. HR=102, Temp=37.8, O2=93	2026-03-25 18:46:36.72243
104	3	Critical	Mehmet Kaya: CRITICAL! HR=121, Temp=38.7, O2=88	2026-03-25 18:46:36.729551
105	5	Warning	Ali Can: Warning. HR=110, Temp=38.1, O2=91	2026-03-25 18:46:36.736249
106	2	Warning	Ayse Demir: Warning. HR=102, Temp=37.8, O2=93	2026-03-25 18:46:41.770384
107	3	Critical	Mehmet Kaya: CRITICAL! HR=121, Temp=38.7, O2=88	2026-03-25 18:46:41.777466
108	5	Warning	Ali Can: Warning. HR=110, Temp=38.1, O2=91	2026-03-25 18:46:41.783257
109	2	Warning	Ayse Demir: Warning. HR=102, Temp=37.8, O2=93	2026-03-25 18:46:46.817586
110	3	Critical	Mehmet Kaya: CRITICAL! HR=121, Temp=38.7, O2=88	2026-03-25 18:46:46.824251
111	5	Warning	Ali Can: Warning. HR=110, Temp=38.1, O2=91	2026-03-25 18:46:46.830668
112	2	Warning	Ayse Demir: Warning. HR=102, Temp=37.8, O2=93	2026-03-25 18:49:20.075485
113	3	Critical	Mehmet Kaya: CRITICAL! HR=121, Temp=38.7, O2=88	2026-03-25 18:49:20.081415
114	5	Warning	Ali Can: Warning. HR=110, Temp=38.1, O2=91	2026-03-25 18:49:20.087021
115	2	Warning	Ayse Demir: Warning. HR=102, Temp=37.8, O2=93	2026-03-25 18:49:25.119437
116	3	Critical	Mehmet Kaya: CRITICAL! HR=121, Temp=38.7, O2=88	2026-03-25 18:49:25.125819
117	5	Warning	Ali Can: Warning. HR=110, Temp=38.1, O2=91	2026-03-25 18:49:25.131837
118	2	Warning	Ayse Demir: Warning. HR=102, Temp=37.8, O2=93	2026-03-25 18:49:30.162502
119	3	Critical	Mehmet Kaya: CRITICAL! HR=121, Temp=38.7, O2=88	2026-03-25 18:49:30.16998
120	5	Warning	Ali Can: Warning. HR=110, Temp=38.1, O2=91	2026-03-25 18:49:30.177623
121	2	Warning	Ayse Demir: Warning. HR=102, Temp=37.8, O2=93	2026-03-25 18:49:35.20989
122	3	Critical	Mehmet Kaya: CRITICAL! HR=121, Temp=38.7, O2=88	2026-03-25 18:49:35.216528
123	5	Warning	Ali Can: Warning. HR=110, Temp=38.1, O2=91	2026-03-25 18:49:35.224178
124	2	Warning	Ayse Demir: Warning. HR=102, Temp=37.8, O2=93	2026-03-25 18:49:40.255471
125	3	Critical	Mehmet Kaya: CRITICAL! HR=121, Temp=38.7, O2=88	2026-03-25 18:49:40.262292
126	5	Warning	Ali Can: Warning. HR=110, Temp=38.1, O2=91	2026-03-25 18:49:40.268542
127	2	Warning	Ayse Demir: Warning. HR=102, Temp=37.8, O2=93	2026-03-25 18:49:45.301824
128	3	Critical	Mehmet Kaya: CRITICAL! HR=121, Temp=38.7, O2=88	2026-03-25 18:49:45.30876
129	5	Warning	Ali Can: Warning. HR=110, Temp=38.1, O2=91	2026-03-25 18:49:45.31474
130	2	Warning	Ayse Demir: Warning. HR=102, Temp=37.8, O2=93	2026-03-25 18:49:50.347868
131	3	Critical	Mehmet Kaya: CRITICAL! HR=121, Temp=38.7, O2=88	2026-03-25 18:49:50.355106
132	5	Warning	Ali Can: Warning. HR=110, Temp=38.1, O2=91	2026-03-25 18:49:50.361013
133	2	Warning	Ayse Demir: Warning. HR=102, Temp=37.8, O2=93	2026-03-25 18:49:55.393657
134	3	Critical	Mehmet Kaya: CRITICAL! HR=121, Temp=38.7, O2=88	2026-03-25 18:49:55.400846
135	5	Warning	Ali Can: Warning. HR=110, Temp=38.1, O2=91	2026-03-25 18:49:55.406903
136	2	Warning	Ayse Demir: Warning. HR=102, Temp=37.8, O2=93	2026-03-25 18:50:00.436907
137	3	Critical	Mehmet Kaya: CRITICAL! HR=121, Temp=38.7, O2=88	2026-03-25 18:50:00.443438
138	5	Warning	Ali Can: Warning. HR=110, Temp=38.1, O2=91	2026-03-25 18:50:00.44979
139	2	Warning	Ayse Demir: Warning. HR=102, Temp=37.8, O2=93	2026-03-25 18:50:05.481208
140	3	Critical	Mehmet Kaya: CRITICAL! HR=121, Temp=38.7, O2=88	2026-03-25 18:50:05.487241
141	5	Warning	Ali Can: Warning. HR=110, Temp=38.1, O2=91	2026-03-25 18:50:05.492495
142	2	Warning	Ayse Demir: Warning. HR=102, Temp=37.8, O2=93	2026-03-25 18:50:10.526828
143	3	Critical	Mehmet Kaya: CRITICAL! HR=121, Temp=38.7, O2=88	2026-03-25 18:50:10.533824
144	5	Warning	Ali Can: Warning. HR=110, Temp=38.1, O2=91	2026-03-25 18:50:10.539696
145	2	Warning	Ayse Demir: Warning. HR=102, Temp=37.8, O2=93	2026-03-25 18:50:15.576164
146	3	Critical	Mehmet Kaya: CRITICAL! HR=121, Temp=38.7, O2=88	2026-03-25 18:50:15.58268
147	5	Warning	Ali Can: Warning. HR=110, Temp=38.1, O2=91	2026-03-25 18:50:15.588801
148	2	Warning	Ayse Demir: Warning. HR=102, Temp=37.8, O2=93	2026-03-25 18:50:20.624811
149	3	Critical	Mehmet Kaya: CRITICAL! HR=121, Temp=38.7, O2=88	2026-03-25 18:50:20.631498
150	5	Warning	Ali Can: Warning. HR=110, Temp=38.1, O2=91	2026-03-25 18:50:20.63741
151	2	Warning	Ayse Demir: Warning. HR=102, Temp=37.8, O2=93	2026-03-25 18:50:25.673129
152	3	Critical	Mehmet Kaya: CRITICAL! HR=121, Temp=38.7, O2=88	2026-03-25 18:50:25.679932
153	5	Warning	Ali Can: Warning. HR=110, Temp=38.1, O2=91	2026-03-25 18:50:25.685984
154	2	Warning	Ayse Demir: Warning. HR=102, Temp=37.8, O2=93	2026-03-25 18:50:30.723899
155	3	Critical	Mehmet Kaya: CRITICAL! HR=121, Temp=38.7, O2=88	2026-03-25 18:50:30.731492
156	5	Warning	Ali Can: Warning. HR=110, Temp=38.1, O2=91	2026-03-25 18:50:30.738018
157	2	Warning	Ayse Demir: Warning. HR=102, Temp=37.8, O2=93	2026-03-25 18:50:35.771737
158	3	Critical	Mehmet Kaya: CRITICAL! HR=121, Temp=38.7, O2=88	2026-03-25 18:50:35.778269
159	5	Warning	Ali Can: Warning. HR=110, Temp=38.1, O2=91	2026-03-25 18:50:35.784116
160	2	Warning	Ayse Demir: Warning. HR=102, Temp=37.8, O2=93	2026-03-25 18:50:40.817491
161	3	Critical	Mehmet Kaya: CRITICAL! HR=121, Temp=38.7, O2=88	2026-03-25 18:50:40.824303
162	5	Warning	Ali Can: Warning. HR=110, Temp=38.1, O2=91	2026-03-25 18:50:40.830454
163	2	Warning	Ayse Demir: Warning. HR=102, Temp=37.8, O2=93	2026-03-25 18:50:45.866673
164	3	Critical	Mehmet Kaya: CRITICAL! HR=121, Temp=38.7, O2=88	2026-03-25 18:50:45.873029
165	5	Warning	Ali Can: Warning. HR=110, Temp=38.1, O2=91	2026-03-25 18:50:45.879764
166	2	Warning	Ayse Demir: Warning. HR=102, Temp=37.8, O2=93	2026-03-25 18:50:50.916155
167	3	Critical	Mehmet Kaya: CRITICAL! HR=121, Temp=38.7, O2=88	2026-03-25 18:50:50.922918
168	5	Warning	Ali Can: Warning. HR=110, Temp=38.1, O2=91	2026-03-25 18:50:50.928531
169	2	Warning	Ayse Demir: Warning. HR=102, Temp=37.8, O2=93	2026-03-25 18:50:55.961433
170	3	Critical	Mehmet Kaya: CRITICAL! HR=121, Temp=38.7, O2=88	2026-03-25 18:50:55.968003
171	5	Warning	Ali Can: Warning. HR=110, Temp=38.1, O2=91	2026-03-25 18:50:55.973813
172	2	Warning	Ayse Demir: Warning. HR=102, Temp=37.8, O2=93	2026-03-25 18:51:01.010252
173	3	Critical	Mehmet Kaya: CRITICAL! HR=121, Temp=38.7, O2=88	2026-03-25 18:51:01.017716
174	5	Warning	Ali Can: Warning. HR=110, Temp=38.1, O2=91	2026-03-25 18:51:01.024205
175	2	Warning	Ayse Demir: Warning. HR=102, Temp=37.8, O2=93	2026-03-25 18:51:06.061604
176	3	Critical	Mehmet Kaya: CRITICAL! HR=121, Temp=38.7, O2=88	2026-03-25 18:51:06.068392
177	5	Warning	Ali Can: Warning. HR=110, Temp=38.1, O2=91	2026-03-25 18:51:06.074425
178	2	Warning	Ayse Demir: Warning. HR=102, Temp=37.8, O2=93	2026-03-25 18:51:11.109589
179	3	Critical	Mehmet Kaya: CRITICAL! HR=121, Temp=38.7, O2=88	2026-03-25 18:51:11.116126
180	5	Warning	Ali Can: Warning. HR=110, Temp=38.1, O2=91	2026-03-25 18:51:11.1221
181	2	Warning	Ayse Demir: Warning. HR=102, Temp=37.8, O2=93	2026-03-25 18:51:16.154376
182	3	Critical	Mehmet Kaya: CRITICAL! HR=121, Temp=38.7, O2=88	2026-03-25 18:51:16.160587
183	5	Warning	Ali Can: Warning. HR=110, Temp=38.1, O2=91	2026-03-25 18:51:16.167267
184	2	Warning	Ayse Demir: Warning. HR=102, Temp=37.8, O2=93	2026-03-25 18:51:21.201824
185	3	Critical	Mehmet Kaya: CRITICAL! HR=121, Temp=38.7, O2=88	2026-03-25 18:51:21.208377
186	5	Warning	Ali Can: Warning. HR=110, Temp=38.1, O2=91	2026-03-25 18:51:21.21489
187	2	Warning	Ayse Demir: Warning. HR=102, Temp=37.8, O2=93	2026-03-25 18:51:26.241802
188	3	Critical	Mehmet Kaya: CRITICAL! HR=121, Temp=38.7, O2=88	2026-03-25 18:51:26.248509
189	5	Warning	Ali Can: Warning. HR=110, Temp=38.1, O2=91	2026-03-25 18:51:26.255205
190	2	Warning	Ayse Demir: Warning. HR=102, Temp=37.8, O2=93	2026-03-25 18:51:31.392823
191	3	Critical	Mehmet Kaya: CRITICAL! HR=121, Temp=38.7, O2=88	2026-03-25 18:51:31.463194
192	5	Warning	Ali Can: Warning. HR=110, Temp=38.1, O2=91	2026-03-25 18:51:31.471807
193	2	Warning	Ayse Demir: Warning. HR=102, Temp=37.8, O2=93	2026-03-25 18:51:36.500118
194	3	Critical	Mehmet Kaya: CRITICAL! HR=121, Temp=38.7, O2=88	2026-03-25 18:51:36.506443
195	5	Warning	Ali Can: Warning. HR=110, Temp=38.1, O2=91	2026-03-25 18:51:36.512231
196	2	Warning	Ayse Demir: Warning. HR=102, Temp=37.8, O2=93	2026-03-25 18:51:41.548037
197	3	Critical	Mehmet Kaya: CRITICAL! HR=121, Temp=38.7, O2=88	2026-03-25 18:51:41.554499
198	5	Warning	Ali Can: Warning. HR=110, Temp=38.1, O2=91	2026-03-25 18:51:41.560492
199	2	Warning	Ayse Demir: Warning. HR=102, Temp=37.8, O2=93	2026-03-25 18:51:46.596061
200	3	Critical	Mehmet Kaya: CRITICAL! HR=121, Temp=38.7, O2=88	2026-03-25 18:51:46.603159
201	5	Warning	Ali Can: Warning. HR=110, Temp=38.1, O2=91	2026-03-25 18:51:46.609499
202	2	Warning	Ayse Demir: Warning. HR=102, Temp=37.8, O2=93	2026-03-25 18:51:51.646362
203	3	Critical	Mehmet Kaya: CRITICAL! HR=121, Temp=38.7, O2=88	2026-03-25 18:51:51.653067
204	5	Warning	Ali Can: Warning. HR=110, Temp=38.1, O2=91	2026-03-25 18:51:51.659238
205	2	Warning	Ayse Demir: Warning. HR=102, Temp=37.8, O2=93	2026-03-25 18:51:56.693228
206	3	Critical	Mehmet Kaya: CRITICAL! HR=121, Temp=38.7, O2=88	2026-03-25 18:51:56.699653
207	5	Warning	Ali Can: Warning. HR=110, Temp=38.1, O2=91	2026-03-25 18:51:56.706391
208	2	Warning	Ayse Demir: Warning. HR=102, Temp=37.8, O2=93	2026-03-25 18:52:01.743884
209	3	Critical	Mehmet Kaya: CRITICAL! HR=121, Temp=38.7, O2=88	2026-03-25 18:52:01.75072
210	5	Warning	Ali Can: Warning. HR=110, Temp=38.1, O2=91	2026-03-25 18:52:01.756847
211	2	Warning	Ayse Demir: Warning. HR=102, Temp=37.8, O2=93	2026-03-25 18:52:06.798036
212	3	Critical	Mehmet Kaya: CRITICAL! HR=121, Temp=38.7, O2=88	2026-03-25 18:52:06.808251
213	5	Warning	Ali Can: Warning. HR=110, Temp=38.1, O2=91	2026-03-25 18:52:06.815691
214	2	Warning	Ayse Demir: Warning. HR=102, Temp=37.8, O2=93	2026-03-25 18:52:11.854949
215	3	Critical	Mehmet Kaya: CRITICAL! HR=121, Temp=38.7, O2=88	2026-03-25 18:52:11.861777
216	5	Warning	Ali Can: Warning. HR=110, Temp=38.1, O2=91	2026-03-25 18:52:11.867742
217	2	Warning	Ayse Demir: Warning. HR=102, Temp=37.8, O2=93	2026-03-25 18:52:17.328514
218	3	Critical	Mehmet Kaya: CRITICAL! HR=121, Temp=38.7, O2=88	2026-03-25 18:52:17.332962
219	5	Warning	Ali Can: Warning. HR=110, Temp=38.1, O2=91	2026-03-25 18:52:17.337914
220	2	Warning	Ayse Demir: Warning. HR=102, Temp=37.8, O2=93	2026-03-25 18:52:22.369085
221	3	Critical	Mehmet Kaya: CRITICAL! HR=121, Temp=38.7, O2=88	2026-03-25 18:52:22.375472
222	5	Warning	Ali Can: Warning. HR=110, Temp=38.1, O2=91	2026-03-25 18:52:22.381796
223	2	Warning	Ayse Demir: Warning. HR=102, Temp=37.8, O2=93	2026-03-25 18:52:27.412902
224	3	Critical	Mehmet Kaya: CRITICAL! HR=121, Temp=38.7, O2=88	2026-03-25 18:52:27.420105
225	5	Warning	Ali Can: Warning. HR=110, Temp=38.1, O2=91	2026-03-25 18:52:27.426038
226	2	Warning	Ayse Demir: Warning. HR=102, Temp=37.8, O2=93	2026-03-25 18:52:32.460931
227	3	Critical	Mehmet Kaya: CRITICAL! HR=121, Temp=38.7, O2=88	2026-03-25 18:52:32.468092
228	5	Warning	Ali Can: Warning. HR=110, Temp=38.1, O2=91	2026-03-25 18:52:32.474271
229	2	Warning	Ayse Demir: Warning. HR=102, Temp=37.8, O2=93	2026-03-25 18:52:37.508642
230	3	Critical	Mehmet Kaya: CRITICAL! HR=121, Temp=38.7, O2=88	2026-03-25 18:52:37.515574
231	5	Warning	Ali Can: Warning. HR=110, Temp=38.1, O2=91	2026-03-25 18:52:37.521731
232	2	Warning	Ayse Demir: Warning. HR=102, Temp=37.8, O2=93	2026-03-25 18:53:55.613911
233	3	Critical	Mehmet Kaya: CRITICAL! HR=121, Temp=38.7, O2=88	2026-03-25 18:53:55.619131
234	5	Warning	Ali Can: Warning. HR=110, Temp=38.1, O2=91	2026-03-25 18:53:55.623713
235	2	Warning	Ayse Demir: Warning. HR=102, Temp=37.8, O2=93	2026-03-25 18:54:00.658916
236	3	Critical	Mehmet Kaya: CRITICAL! HR=121, Temp=38.7, O2=88	2026-03-25 18:54:00.667366
237	5	Warning	Ali Can: Warning. HR=110, Temp=38.1, O2=91	2026-03-25 18:54:00.674207
238	2	Warning	Ayse Demir: Warning. HR=102, Temp=37.8, O2=93	2026-03-25 18:54:05.707032
239	3	Critical	Mehmet Kaya: CRITICAL! HR=121, Temp=38.7, O2=88	2026-03-25 18:54:05.713535
240	5	Warning	Ali Can: Warning. HR=110, Temp=38.1, O2=91	2026-03-25 18:54:05.719688
241	2	Warning	Ayse Demir: Warning. HR=102, Temp=37.8, O2=93	2026-03-25 18:54:10.756872
242	3	Critical	Mehmet Kaya: CRITICAL! HR=121, Temp=38.7, O2=88	2026-03-25 18:54:10.763855
243	5	Warning	Ali Can: Warning. HR=110, Temp=38.1, O2=91	2026-03-25 18:54:10.770391
244	2	Warning	Ayse Demir: Warning. HR=102, Temp=37.8, O2=93	2026-03-25 18:54:15.803132
245	3	Critical	Mehmet Kaya: CRITICAL! HR=121, Temp=38.7, O2=88	2026-03-25 18:54:15.810221
246	5	Warning	Ali Can: Warning. HR=110, Temp=38.1, O2=91	2026-03-25 18:54:15.816202
247	2	Warning	Ayse Demir: Warning. HR=102, Temp=37.8, O2=93	2026-03-25 18:54:20.860168
248	3	Critical	Mehmet Kaya: CRITICAL! HR=121, Temp=38.7, O2=88	2026-03-25 18:54:20.866907
249	5	Warning	Ali Can: Warning. HR=110, Temp=38.1, O2=91	2026-03-25 18:54:20.872601
250	2	Warning	Ayse Demir: Warning. HR=102, Temp=37.8, O2=93	2026-03-25 18:54:25.91317
251	3	Critical	Mehmet Kaya: CRITICAL! HR=121, Temp=38.7, O2=88	2026-03-25 18:54:25.923555
252	5	Warning	Ali Can: Warning. HR=110, Temp=38.1, O2=91	2026-03-25 18:54:25.931283
253	2	Warning	Ayse Demir: Warning. HR=102, Temp=37.8, O2=93	2026-03-25 18:54:30.9596
254	3	Critical	Mehmet Kaya: CRITICAL! HR=121, Temp=38.7, O2=88	2026-03-25 18:54:30.965132
255	5	Warning	Ali Can: Warning. HR=110, Temp=38.1, O2=91	2026-03-25 18:54:30.970046
256	2	Warning	Ayse Demir: Warning. HR=102, Temp=37.8, O2=93	2026-03-25 18:54:35.992534
257	3	Critical	Mehmet Kaya: CRITICAL! HR=121, Temp=38.7, O2=88	2026-03-25 18:54:35.998566
258	5	Warning	Ali Can: Warning. HR=110, Temp=38.1, O2=91	2026-03-25 18:54:36.003698
259	2	Warning	Ayse Demir: Warning. HR=102, Temp=37.8, O2=93	2026-03-25 18:54:41.02666
260	3	Critical	Mehmet Kaya: CRITICAL! HR=121, Temp=38.7, O2=88	2026-03-25 18:54:41.032795
261	5	Warning	Ali Can: Warning. HR=110, Temp=38.1, O2=91	2026-03-25 18:54:41.039102
262	2	Warning	Ayse Demir: Warning. HR=102, Temp=37.8, O2=93	2026-03-25 18:54:46.068879
263	3	Critical	Mehmet Kaya: CRITICAL! HR=121, Temp=38.7, O2=88	2026-03-25 18:54:46.074444
264	5	Warning	Ali Can: Warning. HR=110, Temp=38.1, O2=91	2026-03-25 18:54:46.079716
265	2	Warning	Ayse Demir: Warning. HR=102, Temp=37.8, O2=93	2026-03-25 18:54:51.108056
266	3	Critical	Mehmet Kaya: CRITICAL! HR=121, Temp=38.7, O2=88	2026-03-25 18:54:51.113515
267	5	Warning	Ali Can: Warning. HR=110, Temp=38.1, O2=91	2026-03-25 18:54:51.11806
268	2	Warning	Ayse Demir: Warning. HR=102, Temp=37.8, O2=93	2026-03-25 18:54:56.150335
269	3	Critical	Mehmet Kaya: CRITICAL! HR=121, Temp=38.7, O2=88	2026-03-25 18:54:56.159353
270	5	Warning	Ali Can: Warning. HR=110, Temp=38.1, O2=91	2026-03-25 18:54:56.168645
271	2	Warning	Ayse Demir: Warning. HR=102, Temp=37.8, O2=93	2026-03-25 18:55:01.207753
272	3	Critical	Mehmet Kaya: CRITICAL! HR=121, Temp=38.7, O2=88	2026-03-25 18:55:01.217001
273	5	Warning	Ali Can: Warning. HR=110, Temp=38.1, O2=91	2026-03-25 18:55:01.223533
274	2	Warning	Ayse Demir: Warning. HR=102, Temp=37.8, O2=93	2026-03-25 18:55:06.260805
275	3	Critical	Mehmet Kaya: CRITICAL! HR=121, Temp=38.7, O2=88	2026-03-25 18:55:06.269303
276	5	Warning	Ali Can: Warning. HR=110, Temp=38.1, O2=91	2026-03-25 18:55:06.275713
277	2	Warning	Ayse Demir: Warning. HR=102, Temp=37.8, O2=93	2026-03-25 18:55:11.305514
278	3	Critical	Mehmet Kaya: CRITICAL! HR=121, Temp=38.7, O2=88	2026-03-25 18:55:11.311906
279	5	Warning	Ali Can: Warning. HR=110, Temp=38.1, O2=91	2026-03-25 18:55:11.317737
280	2	Warning	Ayse Demir: Warning. HR=102, Temp=37.8, O2=93	2026-03-25 18:55:16.351767
281	3	Critical	Mehmet Kaya: CRITICAL! HR=121, Temp=38.7, O2=88	2026-03-25 18:55:16.359439
282	5	Warning	Ali Can: Warning. HR=110, Temp=38.1, O2=91	2026-03-25 18:55:16.367464
283	2	Warning	Ayse Demir: Warning. HR=102, Temp=37.8, O2=93	2026-03-25 18:55:21.406135
284	3	Critical	Mehmet Kaya: CRITICAL! HR=121, Temp=38.7, O2=88	2026-03-25 18:55:21.413748
285	5	Warning	Ali Can: Warning. HR=110, Temp=38.1, O2=91	2026-03-25 18:55:21.420151
286	2	Warning	Ayse Demir: Warning. HR=102, Temp=37.8, O2=93	2026-03-25 18:55:26.465391
287	3	Critical	Mehmet Kaya: CRITICAL! HR=121, Temp=38.7, O2=88	2026-03-25 18:55:26.475171
288	5	Warning	Ali Can: Warning. HR=110, Temp=38.1, O2=91	2026-03-25 18:55:26.483283
289	2	Warning	Ayse Demir: Warning. HR=102, Temp=37.8, O2=93	2026-03-25 18:55:31.518788
290	3	Critical	Mehmet Kaya: CRITICAL! HR=121, Temp=38.7, O2=88	2026-03-25 18:55:31.525383
291	5	Warning	Ali Can: Warning. HR=110, Temp=38.1, O2=91	2026-03-25 18:55:31.531424
292	2	Warning	Ayse Demir: Warning. HR=102, Temp=37.8, O2=93	2026-03-25 18:55:36.564621
293	3	Critical	Mehmet Kaya: CRITICAL! HR=121, Temp=38.7, O2=88	2026-03-25 18:55:36.574773
294	5	Warning	Ali Can: Warning. HR=110, Temp=38.1, O2=91	2026-03-25 18:55:36.582323
295	2	Warning	Ayse Demir: Warning. HR=102, Temp=37.8, O2=93	2026-03-25 18:55:41.627378
296	3	Critical	Mehmet Kaya: CRITICAL! HR=121, Temp=38.7, O2=88	2026-03-25 18:55:41.636721
297	5	Warning	Ali Can: Warning. HR=110, Temp=38.1, O2=91	2026-03-25 18:55:41.643747
298	2	Warning	Ayse Demir: Warning. HR=102, Temp=37.8, O2=93	2026-03-25 18:55:46.677864
299	3	Critical	Mehmet Kaya: CRITICAL! HR=121, Temp=38.7, O2=88	2026-03-25 18:55:46.685254
300	5	Warning	Ali Can: Warning. HR=110, Temp=38.1, O2=91	2026-03-25 18:55:46.691507
301	2	Warning	Ayse Demir: Warning. HR=102, Temp=37.8, O2=93	2026-03-25 18:55:49.892361
302	3	Critical	Mehmet Kaya: CRITICAL! HR=121, Temp=38.7, O2=88	2026-03-25 18:55:49.898133
303	5	Warning	Ali Can: Warning. HR=110, Temp=38.1, O2=91	2026-03-25 18:55:49.903098
304	2	Warning	Ayse Demir: Warning. HR=102, Temp=37.8, O2=93	2026-03-25 18:55:54.935302
305	3	Critical	Mehmet Kaya: CRITICAL! HR=121, Temp=38.7, O2=88	2026-03-25 18:55:54.942351
306	5	Warning	Ali Can: Warning. HR=110, Temp=38.1, O2=91	2026-03-25 18:55:54.948411
307	2	Warning	Ayse Demir: Warning. HR=102, Temp=37.8, O2=93	2026-03-25 18:55:59.9797
308	3	Critical	Mehmet Kaya: CRITICAL! HR=121, Temp=38.7, O2=88	2026-03-25 18:55:59.987773
309	5	Warning	Ali Can: Warning. HR=110, Temp=38.1, O2=91	2026-03-25 18:55:59.994525
310	2	Warning	Ayse Demir: Warning. HR=102, Temp=37.8, O2=93	2026-03-25 18:56:05.024484
311	3	Critical	Mehmet Kaya: CRITICAL! HR=121, Temp=38.7, O2=88	2026-03-25 18:56:05.032797
312	5	Warning	Ali Can: Warning. HR=110, Temp=38.1, O2=91	2026-03-25 18:56:05.039651
313	2	Warning	Ayse Demir: Warning. HR=102, Temp=37.8, O2=93	2026-03-25 18:56:10.067221
314	3	Critical	Mehmet Kaya: CRITICAL! HR=121, Temp=38.7, O2=88	2026-03-25 18:56:10.072595
315	5	Warning	Ali Can: Warning. HR=110, Temp=38.1, O2=91	2026-03-25 18:56:10.077372
316	2	Warning	Ayse Demir: Warning. HR=102, Temp=37.8, O2=93	2026-03-25 18:56:15.110432
317	3	Critical	Mehmet Kaya: CRITICAL! HR=121, Temp=38.7, O2=88	2026-03-25 18:56:15.117376
318	5	Warning	Ali Can: Warning. HR=110, Temp=38.1, O2=91	2026-03-25 18:56:15.12429
319	2	Warning	Ayse Demir: Warning. HR=102, Temp=37.8, O2=93	2026-03-25 18:56:20.15988
320	3	Critical	Mehmet Kaya: CRITICAL! HR=121, Temp=38.7, O2=88	2026-03-25 18:56:20.166552
321	5	Warning	Ali Can: Warning. HR=110, Temp=38.1, O2=91	2026-03-25 18:56:20.173093
322	2	Warning	Ayse Demir: Warning. HR=102, Temp=37.8, O2=93	2026-03-25 18:56:25.205135
323	3	Critical	Mehmet Kaya: CRITICAL! HR=121, Temp=38.7, O2=88	2026-03-25 18:56:25.211855
324	5	Warning	Ali Can: Warning. HR=110, Temp=38.1, O2=91	2026-03-25 18:56:25.218492
325	2	Warning	Ayse Demir: Warning. HR=102, Temp=37.8, O2=93	2026-03-25 18:56:30.252707
326	3	Critical	Mehmet Kaya: CRITICAL! HR=121, Temp=38.7, O2=88	2026-03-25 18:56:30.259123
327	5	Warning	Ali Can: Warning. HR=110, Temp=38.1, O2=91	2026-03-25 18:56:30.265616
328	2	Warning	Ayse Demir: Warning. HR=102, Temp=37.8, O2=93	2026-03-25 18:56:35.298024
329	3	Critical	Mehmet Kaya: CRITICAL! HR=121, Temp=38.7, O2=88	2026-03-25 18:56:35.304959
330	5	Warning	Ali Can: Warning. HR=110, Temp=38.1, O2=91	2026-03-25 18:56:35.311777
331	2	Warning	Ayse Demir: Warning. HR=102, Temp=37.8, O2=93	2026-03-25 19:01:10.725378
332	3	Critical	Mehmet Kaya: CRITICAL! HR=121, Temp=38.7, O2=88	2026-03-25 19:01:10.731523
333	5	Warning	Ali Can: Warning. HR=110, Temp=38.1, O2=91	2026-03-25 19:01:10.73638
334	2	Warning	Ayse Demir: Warning. HR=102, Temp=37.8, O2=93	2026-03-25 19:01:15.768634
335	3	Critical	Mehmet Kaya: CRITICAL! HR=121, Temp=38.7, O2=88	2026-03-25 19:01:15.775541
336	5	Warning	Ali Can: Warning. HR=110, Temp=38.1, O2=91	2026-03-25 19:01:15.782595
337	2	Warning	Ayse Demir: Warning. HR=102, Temp=37.8, O2=93	2026-03-25 19:01:20.814895
338	3	Critical	Mehmet Kaya: CRITICAL! HR=121, Temp=38.7, O2=88	2026-03-25 19:01:20.82148
339	5	Warning	Ali Can: Warning. HR=110, Temp=38.1, O2=91	2026-03-25 19:01:20.827713
340	2	Warning	Ayse Demir: Warning. HR=102, Temp=37.8, O2=93	2026-03-25 19:01:25.858753
341	3	Critical	Mehmet Kaya: CRITICAL! HR=121, Temp=38.7, O2=88	2026-03-25 19:01:25.865242
342	5	Warning	Ali Can: Warning. HR=110, Temp=38.1, O2=91	2026-03-25 19:01:25.871395
343	2	Warning	Ayse Demir: Warning. HR=102, Temp=37.8, O2=93	2026-03-25 19:01:30.905706
344	3	Critical	Mehmet Kaya: CRITICAL! HR=121, Temp=38.7, O2=88	2026-03-25 19:01:30.912342
345	5	Warning	Ali Can: Warning. HR=110, Temp=38.1, O2=91	2026-03-25 19:01:30.918657
346	2	Warning	Ayse Demir: Warning. HR=102, Temp=37.8, O2=93	2026-03-25 19:01:35.951345
347	3	Critical	Mehmet Kaya: CRITICAL! HR=121, Temp=38.7, O2=88	2026-03-25 19:01:35.957731
348	5	Warning	Ali Can: Warning. HR=110, Temp=38.1, O2=91	2026-03-25 19:01:35.963406
349	2	Warning	Ayse Demir: Warning. HR=102, Temp=37.8, O2=93	2026-03-25 19:01:40.998688
350	3	Critical	Mehmet Kaya: CRITICAL! HR=121, Temp=38.7, O2=88	2026-03-25 19:01:41.005969
351	5	Warning	Ali Can: Warning. HR=110, Temp=38.1, O2=91	2026-03-25 19:01:41.012347
352	2	Warning	Ayse Demir: Warning. HR=102, Temp=37.8, O2=93	2026-03-25 19:01:46.047789
353	3	Critical	Mehmet Kaya: CRITICAL! HR=121, Temp=38.7, O2=88	2026-03-25 19:01:46.054861
354	5	Warning	Ali Can: Warning. HR=110, Temp=38.1, O2=91	2026-03-25 19:01:46.061394
355	2	Warning	Ayse Demir: Warning. HR=102, Temp=37.8, O2=93	2026-03-25 19:01:51.097037
356	3	Critical	Mehmet Kaya: CRITICAL! HR=121, Temp=38.7, O2=88	2026-03-25 19:01:51.105028
357	5	Warning	Ali Can: Warning. HR=110, Temp=38.1, O2=91	2026-03-25 19:01:51.111695
358	2	Warning	Ayse Demir: Warning. HR=102, Temp=37.8, O2=93	2026-03-25 19:01:56.145885
359	3	Critical	Mehmet Kaya: CRITICAL! HR=121, Temp=38.7, O2=88	2026-03-25 19:01:56.151071
360	5	Warning	Ali Can: Warning. HR=110, Temp=38.1, O2=91	2026-03-25 19:01:56.155717
361	2	Warning	Ayse Demir: Warning. HR=102, Temp=37.8, O2=93	2026-03-25 19:02:01.186967
362	3	Critical	Mehmet Kaya: CRITICAL! HR=121, Temp=38.7, O2=88	2026-03-25 19:02:01.193911
363	5	Warning	Ali Can: Warning. HR=110, Temp=38.1, O2=91	2026-03-25 19:02:01.200642
364	2	Warning	Ayse Demir: Warning. HR=102, Temp=37.7, O2=92	2026-03-25 19:08:54.31976
365	3	Critical	Mehmet Kaya: CRITICAL! HR=125, Temp=39.4, O2=84	2026-03-25 19:08:54.32557
366	5	Warning	Ali Can: Warning. HR=109, Temp=37.8, O2=91	2026-03-25 19:08:54.330531
367	1	Warning	Ahmet Yilmaz: Warning. HR=104, Temp=38.3, O2=90	2026-03-25 19:08:56.689169
368	2	Critical	Ayse Demir: CRITICAL! HR=125, Temp=39.3, O2=89	2026-03-25 19:08:56.695564
369	4	Warning	Zeynep Arslan: Warning. HR=106, Temp=38.3, O2=93	2026-03-25 19:08:56.701462
370	5	Critical	Ali Can: CRITICAL! HR=134, Temp=39.5, O2=87	2026-03-25 19:08:56.706274
371	1	Critical	Ahmet Yilmaz: CRITICAL! HR=135, Temp=39.0, O2=85	2026-03-25 19:09:01.741158
372	3	Warning	Mehmet Kaya: Warning. HR=107, Temp=38.0, O2=93	2026-03-25 19:09:01.748789
373	4	Critical	Zeynep Arslan: CRITICAL! HR=134, Temp=39.1, O2=84	2026-03-25 19:09:01.757642
374	2	Warning	Ayse Demir: Warning. HR=111, Temp=38.0, O2=91	2026-03-25 19:09:06.790411
375	3	Critical	Mehmet Kaya: CRITICAL! HR=126, Temp=39.1, O2=86	2026-03-25 19:09:06.797271
376	5	Warning	Ali Can: Warning. HR=112, Temp=37.7, O2=91	2026-03-25 19:09:06.803309
377	1	Warning	Ahmet Yilmaz: Warning. HR=108, Temp=38.4, O2=92	2026-03-25 19:09:11.838567
378	2	Critical	Ayse Demir: CRITICAL! HR=132, Temp=38.7, O2=85	2026-03-25 19:09:11.844945
379	4	Warning	Zeynep Arslan: Warning. HR=101, Temp=38.0, O2=92	2026-03-25 19:09:11.851406
380	5	Critical	Ali Can: CRITICAL! HR=123, Temp=39.4, O2=86	2026-03-25 19:09:11.858286
381	1	Critical	Ahmet Yilmaz: CRITICAL! HR=124, Temp=38.8, O2=85	2026-03-25 19:09:16.888894
382	3	Warning	Mehmet Kaya: Warning. HR=118, Temp=38.2, O2=94	2026-03-25 19:09:16.895112
383	4	Critical	Zeynep Arslan: CRITICAL! HR=128, Temp=38.6, O2=88	2026-03-25 19:09:16.900948
384	2	Warning	Ayse Demir: Warning. HR=116, Temp=38.0, O2=91	2026-03-25 19:16:21.694424
385	3	Critical	Mehmet Kaya: CRITICAL! HR=135, Temp=39.3, O2=88	2026-03-25 19:16:21.701036
386	5	Warning	Ali Can: Warning. HR=117, Temp=37.8, O2=91	2026-03-25 19:16:21.706038
387	1	Warning	Ahmet Yilmaz: Warning. HR=101, Temp=37.7, O2=92	2026-03-25 19:16:26.738198
388	2	Critical	Ayse Demir: CRITICAL! HR=124, Temp=38.8, O2=87	2026-03-25 19:16:26.746008
389	4	Warning	Zeynep Arslan: Warning. HR=104, Temp=37.9, O2=94	2026-03-25 19:16:26.752886
390	5	Critical	Ali Can: CRITICAL! HR=125, Temp=39.2, O2=87	2026-03-25 19:16:26.759668
391	1	Critical	Ahmet Yilmaz: CRITICAL! HR=132, Temp=38.8, O2=87	2026-03-25 19:16:27.255573
392	3	Warning	Mehmet Kaya: Warning. HR=113, Temp=38.2, O2=93	2026-03-25 19:16:27.261988
393	4	Critical	Zeynep Arslan: CRITICAL! HR=134, Temp=39.0, O2=84	2026-03-25 19:16:27.268205
394	2	Warning	Ayse Demir: Warning. HR=109, Temp=37.9, O2=92	2026-03-25 19:16:28.533415
395	3	Critical	Mehmet Kaya: CRITICAL! HR=132, Temp=38.7, O2=84	2026-03-25 19:16:28.540287
396	5	Warning	Ali Can: Warning. HR=105, Temp=38.4, O2=90	2026-03-25 19:16:28.547154
397	1	Warning	Ahmet Yilmaz: Warning. HR=113, Temp=37.8, O2=91	2026-03-25 19:16:31.793175
398	2	Critical	Ayse Demir: CRITICAL! HR=128, Temp=39.3, O2=86	2026-03-25 19:16:31.799933
399	4	Warning	Zeynep Arslan: Warning. HR=104, Temp=37.6, O2=92	2026-03-25 19:16:31.805918
400	5	Critical	Ali Can: CRITICAL! HR=135, Temp=39.4, O2=88	2026-03-25 19:16:31.81251
401	1	Critical	Ahmet Yilmaz: CRITICAL! HR=124, Temp=39.5, O2=85	2026-03-25 19:16:32.298785
402	3	Warning	Mehmet Kaya: Warning. HR=109, Temp=38.4, O2=90	2026-03-25 19:16:32.305801
403	4	Critical	Zeynep Arslan: CRITICAL! HR=123, Temp=39.0, O2=88	2026-03-25 19:16:32.312033
404	2	Warning	Ayse Demir: Warning. HR=105, Temp=38.4, O2=90	2026-03-25 19:16:33.581812
405	3	Critical	Mehmet Kaya: CRITICAL! HR=130, Temp=38.7, O2=89	2026-03-25 19:16:33.589406
406	5	Warning	Ali Can: Warning. HR=114, Temp=38.1, O2=93	2026-03-25 19:16:33.596932
407	1	Warning	Ahmet Yilmaz: Warning. HR=105, Temp=38.4, O2=90	2026-03-25 19:16:36.844063
408	2	Critical	Ayse Demir: CRITICAL! HR=126, Temp=39.3, O2=88	2026-03-25 19:16:36.851442
409	4	Warning	Zeynep Arslan: Warning. HR=104, Temp=37.8, O2=92	2026-03-25 19:16:36.860765
410	5	Critical	Ali Can: CRITICAL! HR=129, Temp=39.3, O2=89	2026-03-25 19:16:36.86753
411	1	Critical	Ahmet Yilmaz: CRITICAL! HR=135, Temp=39.5, O2=89	2026-03-25 19:16:37.34859
412	3	Warning	Mehmet Kaya: Warning. HR=116, Temp=38.3, O2=93	2026-03-25 19:16:37.356277
413	4	Critical	Zeynep Arslan: CRITICAL! HR=123, Temp=39.0, O2=88	2026-03-25 19:16:37.363746
414	2	Warning	Ayse Demir: Warning. HR=117, Temp=38.1, O2=93	2026-03-25 19:16:38.633563
415	3	Critical	Mehmet Kaya: CRITICAL! HR=135, Temp=38.7, O2=86	2026-03-25 19:16:38.641675
416	5	Warning	Ali Can: Warning. HR=107, Temp=37.9, O2=91	2026-03-25 19:16:38.65095
417	1	Warning	Ahmet Yilmaz: Warning. HR=118, Temp=38.2, O2=91	2026-03-25 19:16:41.896521
418	2	Critical	Ayse Demir: CRITICAL! HR=126, Temp=38.8, O2=89	2026-03-25 19:16:41.902941
419	4	Warning	Zeynep Arslan: Warning. HR=107, Temp=38.0, O2=92	2026-03-25 19:16:41.909588
420	5	Critical	Ali Can: CRITICAL! HR=130, Temp=39.5, O2=86	2026-03-25 19:16:41.916579
421	1	Critical	Ahmet Yilmaz: CRITICAL! HR=127, Temp=39.0, O2=84	2026-03-25 19:16:42.394779
422	3	Warning	Mehmet Kaya: Warning. HR=104, Temp=37.9, O2=90	2026-03-25 19:16:42.401211
423	4	Critical	Zeynep Arslan: CRITICAL! HR=130, Temp=39.6, O2=84	2026-03-25 19:16:42.407399
424	2	Warning	Ayse Demir: Warning. HR=109, Temp=37.8, O2=91	2026-03-25 19:16:43.683985
425	3	Critical	Mehmet Kaya: CRITICAL! HR=125, Temp=39.6, O2=87	2026-03-25 19:16:43.69127
426	5	Warning	Ali Can: Warning. HR=108, Temp=38.0, O2=93	2026-03-25 19:16:43.69822
427	1	Warning	Ahmet Yilmaz: Warning. HR=102, Temp=37.6, O2=94	2026-03-25 19:16:46.948121
428	2	Critical	Ayse Demir: CRITICAL! HR=132, Temp=38.7, O2=89	2026-03-25 19:16:46.955202
429	4	Warning	Zeynep Arslan: Warning. HR=104, Temp=38.2, O2=93	2026-03-25 19:16:46.961622
430	5	Critical	Ali Can: CRITICAL! HR=122, Temp=38.8, O2=85	2026-03-25 19:16:46.968854
431	1	Critical	Ahmet Yilmaz: CRITICAL! HR=134, Temp=38.8, O2=84	2026-03-25 19:16:47.446662
432	3	Warning	Mehmet Kaya: Warning. HR=107, Temp=38.2, O2=90	2026-03-25 19:16:47.455481
433	4	Critical	Zeynep Arslan: CRITICAL! HR=130, Temp=38.9, O2=84	2026-03-25 19:16:47.46115
434	2	Warning	Ayse Demir: Warning. HR=104, Temp=37.7, O2=94	2026-03-25 19:16:48.731134
435	3	Critical	Mehmet Kaya: CRITICAL! HR=124, Temp=39.0, O2=89	2026-03-25 19:16:48.740148
436	5	Warning	Ali Can: Warning. HR=107, Temp=38.0, O2=91	2026-03-25 19:16:48.748242
437	1	Warning	Ahmet Yilmaz: Warning. HR=102, Temp=37.6, O2=91	2026-03-25 19:16:50.74717
438	2	Critical	Ayse Demir: CRITICAL! HR=135, Temp=39.6, O2=89	2026-03-25 19:16:50.753867
439	4	Warning	Zeynep Arslan: Warning. HR=110, Temp=37.7, O2=90	2026-03-25 19:16:50.759661
440	5	Critical	Ali Can: CRITICAL! HR=129, Temp=38.8, O2=89	2026-03-25 19:16:50.766091
441	1	Critical	Ahmet Yilmaz: CRITICAL! HR=126, Temp=39.3, O2=86	2026-03-25 19:16:52.001626
442	3	Warning	Mehmet Kaya: Warning. HR=105, Temp=38.3, O2=94	2026-03-25 19:16:52.008684
443	4	Critical	Zeynep Arslan: CRITICAL! HR=123, Temp=38.8, O2=87	2026-03-25 19:16:52.015822
444	2	Warning	Ayse Demir: Warning. HR=112, Temp=37.9, O2=92	2026-03-25 19:16:52.494984
445	3	Critical	Mehmet Kaya: CRITICAL! HR=134, Temp=39.6, O2=86	2026-03-25 19:16:52.501923
446	5	Warning	Ali Can: Warning. HR=105, Temp=38.0, O2=90	2026-03-25 19:16:52.508539
447	1	Warning	Ahmet Yilmaz: Warning. HR=113, Temp=37.8, O2=92	2026-03-25 19:16:55.845095
448	2	Critical	Ayse Demir: CRITICAL! HR=121, Temp=39.3, O2=89	2026-03-25 19:16:55.850549
449	4	Warning	Zeynep Arslan: Warning. HR=112, Temp=37.9, O2=91	2026-03-25 19:16:55.855593
450	5	Critical	Ali Can: CRITICAL! HR=132, Temp=38.6, O2=84	2026-03-25 19:16:55.85921
451	1	Critical	Ahmet Yilmaz: CRITICAL! HR=122, Temp=39.1, O2=86	2026-03-25 19:17:00.892129
452	3	Warning	Mehmet Kaya: Warning. HR=105, Temp=38.2, O2=91	2026-03-25 19:17:00.899118
453	4	Critical	Zeynep Arslan: CRITICAL! HR=132, Temp=38.7, O2=88	2026-03-25 19:17:00.906024
454	2	Warning	Ayse Demir: Warning. HR=111, Temp=37.6, O2=91	2026-03-25 19:17:05.942944
455	3	Critical	Mehmet Kaya: CRITICAL! HR=127, Temp=39.2, O2=85	2026-03-25 19:17:05.950301
456	5	Warning	Ali Can: Warning. HR=117, Temp=37.7, O2=92	2026-03-25 19:17:05.957949
457	1	Warning	Ahmet Yilmaz: Warning. HR=112, Temp=37.9, O2=93	2026-03-25 19:17:10.992425
458	2	Critical	Ayse Demir: CRITICAL! HR=127, Temp=39.3, O2=89	2026-03-25 19:17:10.999852
459	4	Warning	Zeynep Arslan: Warning. HR=116, Temp=38.3, O2=93	2026-03-25 19:17:11.00609
460	5	Critical	Ali Can: CRITICAL! HR=126, Temp=39.2, O2=86	2026-03-25 19:17:11.011886
461	1	Critical	Ahmet Yilmaz: CRITICAL! HR=135, Temp=39.2, O2=86	2026-03-25 19:17:16.05007
462	3	Warning	Mehmet Kaya: Warning. HR=105, Temp=38.1, O2=94	2026-03-25 19:17:16.056841
463	4	Critical	Zeynep Arslan: CRITICAL! HR=135, Temp=39.0, O2=87	2026-03-25 19:17:16.063142
464	2	Warning	Ayse Demir: Warning. HR=101, Temp=38.2, O2=94	2026-03-25 19:17:21.102075
465	3	Critical	Mehmet Kaya: CRITICAL! HR=125, Temp=38.7, O2=87	2026-03-25 19:17:21.108861
466	5	Warning	Ali Can: Warning. HR=113, Temp=37.9, O2=92	2026-03-25 19:17:21.115202
467	1	Warning	Ahmet Yilmaz: Warning. HR=113, Temp=37.7, O2=92	2026-03-25 19:17:26.155374
468	2	Critical	Ayse Demir: CRITICAL! HR=132, Temp=39.4, O2=89	2026-03-25 19:17:26.162876
469	4	Warning	Zeynep Arslan: Warning. HR=113, Temp=37.9, O2=92	2026-03-25 19:17:26.169493
470	5	Critical	Ali Can: CRITICAL! HR=130, Temp=39.5, O2=85	2026-03-25 19:17:26.176679
471	1	Critical	Ahmet Yilmaz: CRITICAL! HR=129, Temp=38.6, O2=84	2026-03-25 19:17:31.215039
472	3	Warning	Mehmet Kaya: Warning. HR=116, Temp=38.0, O2=94	2026-03-25 19:17:31.222623
473	4	Critical	Zeynep Arslan: CRITICAL! HR=134, Temp=39.3, O2=85	2026-03-25 19:17:31.229095
474	2	Warning	Ayse Demir: Warning. HR=104, Temp=38.2, O2=90	2026-03-25 19:17:36.262551
475	3	Critical	Mehmet Kaya: CRITICAL! HR=124, Temp=38.7, O2=86	2026-03-25 19:17:36.269673
476	5	Warning	Ali Can: Warning. HR=112, Temp=38.0, O2=91	2026-03-25 19:17:36.278165
477	1	Warning	Ahmet Yilmaz: Warning. HR=111, Temp=37.8, O2=90	2026-03-25 19:17:41.310978
478	2	Critical	Ayse Demir: CRITICAL! HR=133, Temp=38.7, O2=85	2026-03-25 19:17:41.319979
479	4	Warning	Zeynep Arslan: Warning. HR=109, Temp=37.7, O2=92	2026-03-25 19:17:41.327053
480	5	Critical	Ali Can: CRITICAL! HR=132, Temp=39.1, O2=84	2026-03-25 19:17:41.333278
481	1	Critical	Ahmet Yilmaz: CRITICAL! HR=121, Temp=38.7, O2=85	2026-03-25 19:17:46.372909
482	3	Warning	Mehmet Kaya: Warning. HR=103, Temp=37.7, O2=90	2026-03-25 19:17:46.380743
483	4	Critical	Zeynep Arslan: CRITICAL! HR=130, Temp=38.8, O2=84	2026-03-25 19:17:46.387264
484	2	Warning	Ayse Demir: Warning. HR=113, Temp=38.2, O2=90	2026-03-25 19:17:51.419193
485	3	Critical	Mehmet Kaya: CRITICAL! HR=125, Temp=39.1, O2=89	2026-03-25 19:17:51.426213
486	5	Warning	Ali Can: Warning. HR=118, Temp=37.8, O2=93	2026-03-25 19:17:51.432489
487	1	Warning	Ahmet Yilmaz: Warning. HR=114, Temp=38.3, O2=91	2026-03-25 19:19:07.881362
488	2	Critical	Ayse Demir: CRITICAL! HR=133, Temp=38.6, O2=87	2026-03-25 19:19:07.887585
489	4	Warning	Zeynep Arslan: Warning. HR=103, Temp=38.2, O2=93	2026-03-25 19:19:07.893285
490	5	Critical	Ali Can: CRITICAL! HR=133, Temp=39.5, O2=86	2026-03-25 19:19:07.897454
491	1	Critical	Ahmet Yilmaz: CRITICAL! HR=130, Temp=39.1, O2=89	2026-03-25 19:19:12.931562
492	3	Warning	Mehmet Kaya: Warning. HR=103, Temp=37.7, O2=90	2026-03-25 19:19:12.939469
493	4	Critical	Zeynep Arslan: CRITICAL! HR=135, Temp=39.4, O2=87	2026-03-25 19:19:12.946308
494	2	Warning	Ayse Demir: Warning. HR=105, Temp=37.9, O2=94	2026-03-25 19:19:17.98627
495	3	Critical	Mehmet Kaya: CRITICAL! HR=130, Temp=38.7, O2=84	2026-03-25 19:19:17.993982
496	5	Warning	Ali Can: Warning. HR=106, Temp=38.1, O2=92	2026-03-25 19:19:18.000835
497	1	Warning	Ahmet Yilmaz: Warning. HR=109, Temp=38.0, O2=90	2026-03-25 19:19:23.044811
498	2	Critical	Ayse Demir: CRITICAL! HR=130, Temp=38.8, O2=88	2026-03-25 19:19:23.054577
499	4	Warning	Zeynep Arslan: Warning. HR=116, Temp=38.0, O2=94	2026-03-25 19:19:23.062506
500	5	Critical	Ali Can: CRITICAL! HR=134, Temp=39.4, O2=86	2026-03-25 19:19:23.068932
501	1	Critical	Ahmet Yilmaz: CRITICAL! HR=133, Temp=39.6, O2=89	2026-03-25 19:19:23.827007
502	3	Warning	Mehmet Kaya: Warning. HR=110, Temp=38.1, O2=91	2026-03-25 19:19:23.834334
503	4	Critical	Zeynep Arslan: CRITICAL! HR=133, Temp=38.9, O2=86	2026-03-25 19:19:23.841308
504	2	Warning	Ayse Demir: Warning. HR=113, Temp=38.2, O2=91	2026-03-25 19:19:24.891042
505	3	Critical	Mehmet Kaya: CRITICAL! HR=134, Temp=39.2, O2=84	2026-03-25 19:19:24.898504
506	5	Warning	Ali Can: Warning. HR=115, Temp=38.0, O2=93	2026-03-25 19:19:24.905276
507	1	Warning	Ahmet Yilmaz: Warning. HR=102, Temp=38.0, O2=93	2026-03-25 19:19:26.003227
508	2	Critical	Ayse Demir: CRITICAL! HR=126, Temp=39.3, O2=87	2026-03-25 19:19:26.009946
509	4	Warning	Zeynep Arslan: Warning. HR=112, Temp=37.8, O2=94	2026-03-25 19:19:26.016262
510	5	Critical	Ali Can: CRITICAL! HR=123, Temp=39.0, O2=88	2026-03-25 19:19:26.023223
511	1	Critical	Ahmet Yilmaz: CRITICAL! HR=126, Temp=39.3, O2=86	2026-03-25 19:19:28.107896
512	3	Warning	Mehmet Kaya: Warning. HR=116, Temp=38.3, O2=93	2026-03-25 19:19:28.115469
513	4	Critical	Zeynep Arslan: CRITICAL! HR=130, Temp=39.2, O2=86	2026-03-25 19:19:28.12206
514	2	Warning	Ayse Demir: Warning. HR=104, Temp=37.6, O2=90	2026-03-25 19:19:29.26633
515	3	Critical	Mehmet Kaya: CRITICAL! HR=127, Temp=38.8, O2=86	2026-03-25 19:19:29.273282
516	5	Warning	Ali Can: Warning. HR=103, Temp=38.0, O2=94	2026-03-25 19:19:29.279025
517	1	Warning	Ahmet Yilmaz: Warning. HR=105, Temp=37.8, O2=94	2026-03-25 19:19:31.781876
518	2	Critical	Ayse Demir: CRITICAL! HR=131, Temp=39.4, O2=86	2026-03-25 19:19:31.789162
519	4	Warning	Zeynep Arslan: Warning. HR=104, Temp=37.9, O2=93	2026-03-25 19:19:31.796052
520	5	Critical	Ali Can: CRITICAL! HR=131, Temp=38.8, O2=85	2026-03-25 19:19:31.802665
521	1	Critical	Ahmet Yilmaz: CRITICAL! HR=134, Temp=39.2, O2=88	2026-03-25 19:19:36.361707
522	3	Warning	Mehmet Kaya: Warning. HR=115, Temp=37.7, O2=94	2026-03-25 19:19:36.369001
523	4	Critical	Zeynep Arslan: CRITICAL! HR=123, Temp=39.0, O2=88	2026-03-25 19:19:36.375313
524	2	Warning	Ayse Demir: Warning. HR=113, Temp=37.9, O2=90	2026-03-25 19:19:39.291244
525	3	Critical	Mehmet Kaya: CRITICAL! HR=123, Temp=39.3, O2=88	2026-03-25 19:19:39.298406
526	5	Warning	Ali Can: Warning. HR=112, Temp=38.4, O2=91	2026-03-25 19:19:39.304466
527	1	Warning	Ahmet Yilmaz: Warning. HR=104, Temp=38.0, O2=93	2026-03-25 19:19:40.755253
528	2	Critical	Ayse Demir: CRITICAL! HR=130, Temp=39.4, O2=88	2026-03-25 19:19:40.762451
529	4	Warning	Zeynep Arslan: Warning. HR=108, Temp=38.2, O2=92	2026-03-25 19:19:40.769118
530	5	Critical	Ali Can: CRITICAL! HR=133, Temp=38.9, O2=86	2026-03-25 19:19:40.775615
531	1	Critical	Ahmet Yilmaz: CRITICAL! HR=129, Temp=39.4, O2=89	2026-03-25 19:19:45.81305
532	3	Warning	Mehmet Kaya: Warning. HR=115, Temp=37.8, O2=93	2026-03-25 19:19:45.819435
533	4	Critical	Zeynep Arslan: CRITICAL! HR=125, Temp=38.7, O2=87	2026-03-25 19:19:45.82518
534	2	Warning	Ayse Demir: Warning. HR=107, Temp=37.8, O2=94	2026-03-25 21:56:54.014115
535	3	Critical	Mehmet Kaya: CRITICAL! HR=135, Temp=39.0, O2=88	2026-03-25 21:56:54.019447
536	5	Warning	Ali Can: Warning. HR=106, Temp=37.7, O2=92	2026-03-25 21:56:54.024281
537	1	Warning	Ahmet Yilmaz: Warning. HR=118, Temp=38.3, O2=91	2026-03-25 21:56:59.056679
538	2	Critical	Ayse Demir: CRITICAL! HR=135, Temp=38.8, O2=87	2026-03-25 21:56:59.062726
539	4	Warning	Zeynep Arslan: Warning. HR=111, Temp=38.3, O2=92	2026-03-25 21:56:59.068654
540	5	Critical	Ali Can: CRITICAL! HR=127, Temp=39.5, O2=84	2026-03-25 21:56:59.073987
541	1	Critical	Ahmet Yilmaz: CRITICAL! HR=122, Temp=39.1, O2=86	2026-03-25 21:57:04.113955
542	3	Warning	Mehmet Kaya: Warning. HR=108, Temp=37.9, O2=94	2026-03-25 21:57:04.121667
543	4	Critical	Zeynep Arslan: CRITICAL! HR=133, Temp=39.1, O2=89	2026-03-25 21:57:04.128108
544	2	Warning	Ayse Demir: Warning. HR=101, Temp=38.1, O2=92	2026-03-25 21:57:09.165721
545	3	Critical	Mehmet Kaya: CRITICAL! HR=129, Temp=39.0, O2=85	2026-03-25 21:57:09.173803
546	5	Warning	Ali Can: Warning. HR=116, Temp=37.7, O2=94	2026-03-25 21:57:09.181426
547	1	Warning	Ahmet Yilmaz: Warning. HR=107, Temp=38.2, O2=92	2026-03-25 21:57:14.218187
548	2	Critical	Ayse Demir: CRITICAL! HR=128, Temp=39.5, O2=88	2026-03-25 21:57:14.224666
549	4	Warning	Zeynep Arslan: Warning. HR=105, Temp=37.6, O2=92	2026-03-25 21:57:14.23181
550	5	Critical	Ali Can: CRITICAL! HR=135, Temp=39.6, O2=89	2026-03-25 21:57:14.239551
551	1	Critical	Ahmet Yilmaz: CRITICAL! HR=123, Temp=39.2, O2=85	2026-03-25 21:57:19.282018
552	3	Warning	Mehmet Kaya: Warning. HR=107, Temp=37.9, O2=92	2026-03-25 21:57:19.288976
553	4	Critical	Zeynep Arslan: CRITICAL! HR=129, Temp=39.0, O2=86	2026-03-25 21:57:19.2936
554	2	Warning	Ayse Demir: Warning. HR=113, Temp=38.3, O2=91	2026-03-25 21:57:24.33332
555	3	Critical	Mehmet Kaya: CRITICAL! HR=126, Temp=39.6, O2=84	2026-03-25 21:57:24.342624
556	5	Warning	Ali Can: Warning. HR=111, Temp=37.7, O2=93	2026-03-25 21:57:24.350328
557	1	Warning	Ahmet Yilmaz: Warning. HR=116, Temp=37.9, O2=92	2026-03-25 21:57:29.391602
558	2	Critical	Ayse Demir: CRITICAL! HR=126, Temp=39.4, O2=85	2026-03-25 21:57:29.398077
559	4	Warning	Zeynep Arslan: Warning. HR=107, Temp=38.0, O2=90	2026-03-25 21:57:29.403903
560	5	Critical	Ali Can: CRITICAL! HR=131, Temp=39.6, O2=88	2026-03-25 21:57:29.411221
561	1	Critical	Ahmet Yilmaz: CRITICAL! HR=124, Temp=39.3, O2=89	2026-03-25 21:57:34.455799
562	3	Warning	Mehmet Kaya: Warning. HR=113, Temp=37.8, O2=91	2026-03-25 21:57:34.462456
563	4	Critical	Zeynep Arslan: CRITICAL! HR=125, Temp=38.6, O2=88	2026-03-25 21:57:34.468282
564	2	Warning	Ayse Demir: Warning. HR=112, Temp=38.0, O2=91	2026-03-25 21:57:39.505595
565	3	Critical	Mehmet Kaya: CRITICAL! HR=126, Temp=38.8, O2=88	2026-03-25 21:57:39.512551
566	5	Warning	Ali Can: Warning. HR=117, Temp=37.9, O2=94	2026-03-25 21:57:39.519356
567	1	Warning	Ahmet Yilmaz: Warning. HR=110, Temp=37.8, O2=90	2026-03-25 21:57:44.560206
568	2	Critical	Ayse Demir: CRITICAL! HR=126, Temp=39.1, O2=86	2026-03-25 21:57:44.567531
569	4	Warning	Zeynep Arslan: Warning. HR=112, Temp=37.7, O2=93	2026-03-25 21:57:44.573847
570	5	Critical	Ali Can: CRITICAL! HR=127, Temp=38.6, O2=85	2026-03-25 21:57:44.580738
571	1	Critical	Ahmet Yilmaz: CRITICAL! HR=127, Temp=38.6, O2=89	2026-03-25 21:57:49.620465
572	3	Warning	Mehmet Kaya: Warning. HR=104, Temp=37.7, O2=91	2026-03-25 21:57:49.628706
573	4	Critical	Zeynep Arslan: CRITICAL! HR=132, Temp=38.7, O2=86	2026-03-25 21:57:49.635532
574	2	Warning	Ayse Demir: Warning. HR=113, Temp=38.2, O2=90	2026-03-25 21:57:54.670744
575	3	Critical	Mehmet Kaya: CRITICAL! HR=131, Temp=39.0, O2=89	2026-03-25 21:57:54.677781
576	5	Warning	Ali Can: Warning. HR=103, Temp=38.2, O2=93	2026-03-25 21:57:54.683869
577	1	Warning	Ahmet Yilmaz: Warning. HR=101, Temp=38.0, O2=90	2026-03-25 21:57:59.728025
578	2	Critical	Ayse Demir: CRITICAL! HR=128, Temp=39.4, O2=88	2026-03-25 21:57:59.732852
579	4	Warning	Zeynep Arslan: Warning. HR=104, Temp=37.7, O2=94	2026-03-25 21:57:59.736884
580	5	Critical	Ali Can: CRITICAL! HR=128, Temp=39.1, O2=85	2026-03-25 21:57:59.740436
581	1	Critical	Ahmet Yilmaz: CRITICAL! HR=129, Temp=38.6, O2=87	2026-03-25 21:58:04.779147
582	3	Warning	Mehmet Kaya: Warning. HR=103, Temp=38.2, O2=94	2026-03-25 21:58:04.785308
583	4	Critical	Zeynep Arslan: CRITICAL! HR=133, Temp=39.0, O2=89	2026-03-25 21:58:04.791822
584	2	Warning	Ayse Demir: Warning. HR=104, Temp=37.6, O2=92	2026-03-25 21:58:09.839992
585	3	Critical	Mehmet Kaya: CRITICAL! HR=132, Temp=39.1, O2=88	2026-03-25 21:58:09.848078
586	5	Warning	Ali Can: Warning. HR=105, Temp=37.9, O2=94	2026-03-25 21:58:09.855571
587	1	Warning	Ahmet Yilmaz: Warning. HR=115, Temp=37.7, O2=90	2026-03-25 21:58:14.899021
588	2	Critical	Ayse Demir: CRITICAL! HR=132, Temp=39.4, O2=84	2026-03-25 21:58:14.90625
589	4	Warning	Zeynep Arslan: Warning. HR=110, Temp=38.2, O2=93	2026-03-25 21:58:14.91251
590	5	Critical	Ali Can: CRITICAL! HR=135, Temp=39.2, O2=87	2026-03-25 21:58:14.91869
591	1	Critical	Ahmet Yilmaz: CRITICAL! HR=124, Temp=39.4, O2=86	2026-03-29 21:29:12.205367
592	3	Warning	Mehmet Kaya: Warning. HR=101, Temp=38.0, O2=94	2026-03-29 21:29:12.211091
593	4	Critical	Zeynep Arslan: CRITICAL! HR=130, Temp=39.1, O2=87	2026-03-29 21:29:12.21528
594	2	Warning	Ayse Demir: Warning. HR=111, Temp=37.8, O2=93	2026-03-29 21:29:32.252296
595	3	Critical	Mehmet Kaya: CRITICAL! HR=133, Temp=39.1, O2=88	2026-03-29 21:29:32.260323
596	5	Warning	Ali Can: Warning. HR=105, Temp=38.0, O2=90	2026-03-29 21:29:32.26742
\.


--
-- TOC entry 3717 (class 0 OID 16957)
-- Dependencies: 216
-- Data for Name: patients; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.patients (patient_id, full_name, age, gender, room_number, diagnosis) FROM stdin;
1	Ahmet Yilmaz	67	Male	101	Pneumonia
2	Ayse Demir	45	Female	102	Asthma
3	Mehmet Kaya	72	Male	103	Heart Disease
4	Zeynep Arslan	33	Female	104	Flu
5	Ali Can	58	Male	105	COPD
\.


--
-- TOC entry 3719 (class 0 OID 16964)
-- Dependencies: 218
-- Data for Name: vital_signs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vital_signs (vital_id, patient_id, heart_rate, temperature, oxygen_level, systolic_bp, diastolic_bp, respiratory_rate, measurement_time) FROM stdin;
1	1	88	37.2	96	125	80	18	2026-03-25 20:28:37.866428
2	2	102	37.8	93	130	85	22	2026-03-25 20:28:37.866428
3	3	121	38.7	88	145	95	26	2026-03-25 20:28:37.866428
4	4	79	37.0	98	118	76	17	2026-03-25 20:28:37.866428
5	5	110	38.1	91	135	88	23	2026-03-25 20:28:37.866428
6	1	94	37.4	96	125	83	16	2026-03-25 18:40:08.998156
7	2	97	38.2	90	135	87	22	2026-03-25 18:40:08.998824
8	3	129	38.9	87	151	98	27	2026-03-25 18:40:08.999282
9	4	74	37.4	98	115	72	17	2026-03-25 18:40:08.999602
10	5	106	38.1	88	132	90	21	2026-03-25 18:40:08.999898
11	1	85	37.2	95	121	80	20	2026-03-25 18:40:39.038983
12	2	100	37.8	91	127	85	20	2026-03-25 18:40:39.040473
13	3	122	39.2	86	142	93	26	2026-03-25 18:40:39.041132
14	4	80	37.0	96	113	78	16	2026-03-25 18:40:39.041685
15	5	121	39.0	87	139	84	27	2026-03-25 18:40:39.042213
16	1	90	37.4	96	127	78	18	2026-03-25 18:41:09.084125
17	2	110	37.8	94	126	89	24	2026-03-25 18:41:09.084944
18	3	123	38.9	86	144	91	26	2026-03-25 18:41:09.085243
19	4	75	36.9	95	117	76	16	2026-03-25 18:41:09.085587
20	5	108	37.9	92	134	90	22	2026-03-25 18:41:09.085851
21	1	83	37.4	95	123	80	16	2026-03-25 18:41:39.12379
22	2	128	38.8	92	136	88	23	2026-03-25 18:41:39.124877
23	3	128	38.7	88	147	92	27	2026-03-25 18:41:39.125334
24	4	87	37.0	99	117	77	16	2026-03-25 18:41:39.125822
25	5	104	38.3	89	135	90	25	2026-03-25 18:41:39.126241
26	1	83	37.1	94	119	77	16	2026-03-25 18:42:09.171067
27	2	99	38.3	95	135	88	23	2026-03-25 18:42:09.172349
28	3	115	38.4	88	151	97	24	2026-03-25 18:42:09.172959
29	4	77	36.8	100	119	79	16	2026-03-25 18:42:09.173487
30	5	103	38.5	90	140	88	22	2026-03-25 18:42:09.174065
31	1	95	37.4	94	127	81	19	2026-03-25 18:42:39.21456
32	2	108	38.7	87	124	85	26	2026-03-25 18:42:39.215641
33	3	129	39.2	88	143	98	27	2026-03-25 18:42:39.216117
34	4	88	38.3	93	119	77	20	2026-03-25 18:42:39.216555
35	5	117	38.4	87	135	84	28	2026-03-25 18:42:39.216967
36	1	86	36.9	94	124	84	19	2026-03-25 18:42:47.535748
37	2	95	37.6	90	127	87	23	2026-03-25 18:42:47.536373
38	3	124	39.9	82	140	91	27	2026-03-25 18:42:47.536855
39	4	80	37.2	99	115	72	18	2026-03-25 18:42:47.537167
40	5	111	38.3	89	139	85	23	2026-03-25 18:42:47.537406
41	1	88	36.9	96	123	76	18	2026-03-25 18:42:52.573696
42	2	122	39.1	91	125	84	22	2026-03-25 18:42:52.574882
43	3	118	38.6	89	142	99	25	2026-03-25 18:42:52.575459
44	4	73	36.7	97	116	73	18	2026-03-25 18:42:52.575977
45	5	117	38.4	88	140	85	24	2026-03-25 18:42:52.576445
46	1	85	37.0	97	119	80	18	2026-03-25 18:42:57.619478
47	2	96	37.6	92	125	84	22	2026-03-25 18:42:57.620614
48	3	113	38.8	90	148	93	26	2026-03-25 18:42:57.621128
49	4	89	38.2	94	120	78	18	2026-03-25 18:42:57.621572
50	5	117	37.8	89	129	90	23	2026-03-25 18:42:57.621979
51	1	85	37.3	95	119	79	18	2026-03-25 18:43:02.663769
52	2	109	37.8	92	125	82	20	2026-03-25 18:43:02.664909
53	3	118	38.5	89	147	92	27	2026-03-25 18:43:02.665432
54	4	80	37.2	95	117	80	15	2026-03-25 18:43:02.665923
55	5	105	38.1	92	140	88	23	2026-03-25 18:43:02.66639
56	1	84	37.6	97	130	76	17	2026-03-25 18:43:07.710077
57	2	96	38.3	91	130	83	22	2026-03-25 18:43:07.711286
58	3	127	38.5	90	148	92	25	2026-03-25 18:43:07.711806
59	4	87	37.0	98	114	79	16	2026-03-25 18:43:07.712325
60	5	106	38.3	88	129	90	22	2026-03-25 18:43:07.712852
61	1	84	37.1	97	122	79	17	2026-03-25 18:43:12.753905
62	2	95	37.7	93	129	88	24	2026-03-25 18:43:12.755108
63	3	129	38.7	89	140	94	25	2026-03-25 18:43:12.755676
64	4	77	37.2	100	113	76	15	2026-03-25 18:43:12.756166
65	5	103	38.2	88	136	89	21	2026-03-25 18:43:12.756621
66	1	91	37.1	93	128	79	20	2026-03-25 18:43:17.801854
67	2	105	37.7	92	128	87	24	2026-03-25 18:43:17.802957
68	3	129	38.9	90	143	94	28	2026-03-25 18:43:17.803577
69	4	84	36.9	95	122	77	17	2026-03-25 18:43:17.804135
70	5	116	38.1	88	136	87	21	2026-03-25 18:43:17.804651
71	1	84	37.3	95	121	81	20	2026-03-25 18:43:22.844431
72	2	107	37.9	92	124	82	21	2026-03-25 18:43:22.845566
73	3	115	38.6	87	140	93	26	2026-03-25 18:43:22.846156
74	4	76	36.7	95	118	79	15	2026-03-25 18:43:22.846659
75	5	128	39.1	83	134	85	27	2026-03-25 18:43:22.847125
76	1	113	37.9	91	126	80	21	2026-03-25 18:43:27.88961
77	2	108	37.4	93	131	86	21	2026-03-25 18:43:27.890938
78	3	124	38.6	89	145	93	26	2026-03-25 18:43:27.891614
79	4	74	36.7	96	123	80	15	2026-03-25 18:43:27.892171
80	5	108	38.6	88	138	84	25	2026-03-25 18:43:27.892685
81	1	94	37.5	94	119	82	20	2026-03-25 18:43:32.93983
82	2	99	37.7	91	125	89	24	2026-03-25 18:43:32.941266
83	3	117	38.8	88	139	94	24	2026-03-25 18:43:32.941917
84	4	86	36.7	98	117	74	16	2026-03-25 18:43:32.942531
85	5	110	37.9	93	134	90	25	2026-03-25 18:43:32.943162
86	1	95	37.2	97	131	83	16	2026-03-25 18:43:37.991355
87	2	108	37.9	92	129	83	21	2026-03-25 18:43:37.992998
88	3	117	38.3	86	141	98	24	2026-03-25 18:43:37.993749
89	4	84	37.5	88	121	77	23	2026-03-25 18:43:37.994412
90	5	106	38.1	92	133	88	23	2026-03-25 18:43:37.995255
91	1	86	37.0	93	124	83	20	2026-03-25 18:43:43.04226
92	2	96	38.1	91	131	81	21	2026-03-25 18:43:43.043277
93	3	124	38.3	90	146	98	24	2026-03-25 18:43:43.043613
94	4	71	37.2	95	123	78	19	2026-03-25 18:43:43.043914
95	5	115	38.2	88	130	90	24	2026-03-25 18:43:43.044211
96	1	93	37.4	96	123	84	17	2026-03-25 18:43:48.09305
97	2	101	37.9	90	134	83	23	2026-03-25 18:43:48.094327
98	3	121	39.0	86	142	98	27	2026-03-25 18:43:48.094977
99	4	71	36.9	99	119	75	16	2026-03-25 18:43:48.095514
100	5	114	38.2	93	133	85	21	2026-03-25 18:43:48.096006
101	1	95	37.6	98	130	78	20	2026-03-25 18:43:53.13785
102	2	99	38.3	95	131	89	21	2026-03-25 18:43:53.139278
103	3	113	38.8	85	147	96	28	2026-03-25 18:43:53.139986
104	4	83	37.2	97	119	76	16	2026-03-25 18:43:53.140623
105	5	114	38.2	88	140	91	22	2026-03-25 18:43:53.140988
106	1	93	37.0	97	128	78	17	2026-03-25 18:43:58.185504
107	2	104	38.2	92	127	81	22	2026-03-25 18:43:58.186684
108	3	124	38.9	90	144	98	28	2026-03-25 18:43:58.187187
109	4	71	37.1	98	121	76	16	2026-03-25 18:43:58.188252
110	5	105	37.8	88	134	89	24	2026-03-25 18:43:58.188684
111	1	94	37.3	94	126	80	16	2026-03-25 18:44:03.237375
112	2	120	38.2	91	133	87	26	2026-03-25 18:44:03.238716
113	3	118	38.3	86	147	93	24	2026-03-25 18:44:03.239311
114	4	74	36.8	95	112	80	17	2026-03-25 18:44:03.23976
115	5	102	38.1	93	130	91	25	2026-03-25 18:44:03.240211
116	1	89	37.3	93	122	83	19	2026-03-25 18:44:08.288227
117	2	110	37.6	92	126	88	20	2026-03-25 18:44:08.289689
118	3	113	38.3	88	139	98	24	2026-03-25 18:44:08.290357
119	4	74	37.5	96	122	75	15	2026-03-25 18:44:08.290998
120	5	112	37.7	89	133	91	23	2026-03-25 18:44:08.291543
121	1	80	36.9	95	123	83	17	2026-03-25 18:44:13.339904
122	2	101	37.9	93	133	81	24	2026-03-25 18:44:13.34116
123	3	129	38.3	86	149	99	26	2026-03-25 18:44:13.341671
124	4	99	37.8	89	119	78	19	2026-03-25 18:44:13.34212
125	5	123	39.1	88	133	88	23	2026-03-25 18:44:13.342586
126	1	80	36.9	96	125	84	17	2026-03-25 18:44:18.383082
127	2	95	37.6	93	129	85	20	2026-03-25 18:44:18.384321
128	3	125	38.6	85	146	94	24	2026-03-25 18:44:18.384612
129	4	71	37.4	96	119	76	18	2026-03-25 18:44:18.384861
130	5	106	37.8	91	132	84	25	2026-03-25 18:44:18.385093
131	1	83	37.0	95	125	82	16	2026-03-25 18:44:23.432129
132	2	94	38.3	93	130	85	24	2026-03-25 18:44:23.43326
133	3	129	38.9	90	140	91	25	2026-03-25 18:44:23.433683
134	4	78	37.4	97	115	78	19	2026-03-25 18:44:23.434166
135	5	110	37.8	93	138	88	23	2026-03-25 18:44:23.43454
136	1	117	38.2	90	133	86	24	2026-03-25 18:45:56.340958
137	2	103	37.8	91	140	87	21	2026-03-25 18:45:56.3424
138	3	130	38.8	84	145	102	28	2026-03-25 18:45:56.342982
139	4	134	39.3	88	148	97	26	2026-03-25 18:45:56.343501
140	5	89	36.5	99	123	72	16	2026-03-25 18:45:56.343971
141	1	86	36.6	99	113	75	20	2026-03-25 18:46:01.380558
142	2	77	36.6	99	113	75	17	2026-03-25 18:46:01.381745
143	3	101	38.0	91	133	86	22	2026-03-25 18:46:01.382275
144	4	111	37.8	92	132	87	24	2026-03-25 18:46:01.382782
145	5	82	36.7	99	123	73	20	2026-03-25 18:46:01.383272
146	1	109	38.0	92	139	87	23	2026-03-25 18:46:06.427192
147	2	107	38.1	94	133	85	21	2026-03-25 18:46:06.428565
148	3	124	39.2	88	156	97	30	2026-03-25 18:46:06.429224
149	4	95	37.2	95	111	72	17	2026-03-25 18:46:06.429809
150	5	118	37.6	91	138	90	24	2026-03-25 18:46:06.43032
151	1	132	38.6	86	157	99	27	2026-03-25 18:46:11.474834
152	2	134	38.7	85	159	94	30	2026-03-25 18:46:11.476162
153	3	133	38.9	88	142	98	28	2026-03-25 18:46:11.47674
154	4	127	39.7	87	154	104	27	2026-03-25 18:46:11.477239
155	5	105	37.6	93	133	92	24	2026-03-25 18:46:11.477707
156	1	94	37.3	98	122	70	18	2026-03-25 18:46:16.519953
157	2	106	37.8	92	131	92	23	2026-03-25 18:46:16.521418
158	3	122	38.7	89	152	105	26	2026-03-25 18:46:16.522043
159	4	122	39.7	89	157	96	30	2026-03-25 18:46:16.522588
160	5	133	38.9	88	141	96	29	2026-03-25 18:46:16.523106
161	1	128	39.3	85	144	94	25	2026-03-25 18:46:21.566573
162	2	83	36.8	99	120	81	19	2026-03-25 18:46:21.567954
163	3	127	39.2	84	141	100	26	2026-03-25 18:46:21.56859
164	4	92	36.6	98	119	77	20	2026-03-25 18:46:21.569149
165	5	103	37.7	91	130	83	22	2026-03-25 18:46:21.5697
166	1	94	36.5	97	123	74	19	2026-03-25 18:46:26.611805
167	2	72	36.6	95	120	73	19	2026-03-25 18:46:26.613195
168	3	134	39.6	84	155	103	29	2026-03-25 18:46:26.613799
169	4	87	36.9	99	116	70	17	2026-03-25 18:46:26.614361
170	5	128	39.3	87	153	102	26	2026-03-25 18:46:26.614926
171	1	131	39.5	88	150	102	25	2026-03-25 18:46:31.659628
172	2	131	39.7	84	153	100	28	2026-03-25 18:46:31.661051
173	3	112	37.6	94	140	91	23	2026-03-25 18:46:31.661717
174	4	108	37.9	92	135	92	22	2026-03-25 18:46:31.662274
175	5	105	38.4	92	131	92	22	2026-03-25 18:46:31.662881
176	1	129	39.4	89	153	103	29	2026-03-25 18:46:36.704121
177	2	109	38.0	93	132	89	23	2026-03-25 18:46:36.705496
178	3	112	37.9	94	134	91	24	2026-03-25 18:46:36.706154
179	4	133	39.5	88	155	105	29	2026-03-25 18:46:36.706717
180	5	126	38.7	89	157	104	30	2026-03-25 18:46:36.707252
181	1	78	36.9	98	121	72	17	2026-03-25 18:46:41.75308
182	2	127	38.8	88	150	96	27	2026-03-25 18:46:41.754203
183	3	86	36.9	96	112	71	18	2026-03-25 18:46:41.754664
184	4	135	39.7	84	159	97	26	2026-03-25 18:46:41.755095
185	5	81	36.8	95	125	80	18	2026-03-25 18:46:41.755534
186	1	89	37.1	95	113	74	18	2026-03-25 18:46:46.799991
187	2	84	37.4	96	112	79	16	2026-03-25 18:46:46.801311
188	3	117	38.3	92	134	92	24	2026-03-25 18:46:46.801789
189	4	127	38.7	86	144	100	28	2026-03-25 18:46:46.802226
190	5	78	36.6	98	124	71	17	2026-03-25 18:46:46.802651
191	1	108	38.0	92	135	88	22	2026-03-25 18:49:20.060318
192	2	128	39.1	87	150	98	28	2026-03-25 18:49:20.061199
193	3	84	36.9	97	120	78	18	2026-03-25 18:49:20.061544
194	4	108	38.0	92	135	88	22	2026-03-25 18:49:20.061809
195	5	128	39.1	87	150	98	28	2026-03-25 18:49:20.062056
196	1	108	38.0	92	135	88	22	2026-03-25 18:49:25.10192
197	2	128	39.1	87	150	98	28	2026-03-25 18:49:25.103228
198	3	84	36.9	97	120	78	18	2026-03-25 18:49:25.10375
199	4	108	38.0	92	135	88	22	2026-03-25 18:49:25.104205
200	5	128	39.1	87	150	98	28	2026-03-25 18:49:25.104639
201	1	108	38.0	92	135	88	22	2026-03-25 18:49:30.144775
202	2	128	39.1	87	150	98	28	2026-03-25 18:49:30.146056
203	3	84	36.9	97	120	78	18	2026-03-25 18:49:30.146514
204	4	108	38.0	92	135	88	22	2026-03-25 18:49:30.146869
205	5	128	39.1	87	150	98	28	2026-03-25 18:49:30.1472
206	1	108	38.0	92	135	88	22	2026-03-25 18:49:35.191925
207	2	128	39.1	87	150	98	28	2026-03-25 18:49:35.193023
208	3	84	36.9	97	120	78	18	2026-03-25 18:49:35.193434
209	4	108	38.0	92	135	88	22	2026-03-25 18:49:35.193828
210	5	128	39.1	87	150	98	28	2026-03-25 18:49:35.194278
211	1	108	38.0	92	135	88	22	2026-03-25 18:49:40.237906
212	2	128	39.1	87	150	98	28	2026-03-25 18:49:40.239315
213	3	84	36.9	97	120	78	18	2026-03-25 18:49:40.239944
214	4	108	38.0	92	135	88	22	2026-03-25 18:49:40.240493
215	5	128	39.1	87	150	98	28	2026-03-25 18:49:40.240985
216	1	108	38.0	92	135	88	22	2026-03-25 18:49:45.282818
217	2	128	39.1	87	150	98	28	2026-03-25 18:49:45.283953
218	3	84	36.9	97	120	78	18	2026-03-25 18:49:45.284425
219	4	108	38.0	92	135	88	22	2026-03-25 18:49:45.284873
220	5	128	39.1	87	150	98	28	2026-03-25 18:49:45.285352
221	1	108	38.0	92	135	88	22	2026-03-25 18:49:50.328998
222	2	128	39.1	87	150	98	28	2026-03-25 18:49:50.330349
223	3	84	36.9	97	120	78	18	2026-03-25 18:49:50.330965
224	4	108	38.0	92	135	88	22	2026-03-25 18:49:50.3315
225	5	128	39.1	87	150	98	28	2026-03-25 18:49:50.332014
226	1	108	38.0	92	135	88	22	2026-03-25 18:49:55.375056
227	2	128	39.1	87	150	98	28	2026-03-25 18:49:55.376435
228	3	84	36.9	97	120	78	18	2026-03-25 18:49:55.377097
229	4	108	38.0	92	135	88	22	2026-03-25 18:49:55.377653
230	5	128	39.1	87	150	98	28	2026-03-25 18:49:55.378152
231	1	108	38.0	92	135	88	22	2026-03-25 18:50:00.420401
232	2	128	39.1	87	150	98	28	2026-03-25 18:50:00.421449
233	3	84	36.9	97	120	78	18	2026-03-25 18:50:00.421879
234	4	108	38.0	92	135	88	22	2026-03-25 18:50:00.422282
235	5	128	39.1	87	150	98	28	2026-03-25 18:50:00.422734
236	1	108	38.0	92	135	88	22	2026-03-25 18:50:05.463682
237	2	128	39.1	87	150	98	28	2026-03-25 18:50:05.465034
238	3	84	36.9	97	120	78	18	2026-03-25 18:50:05.465583
239	4	108	38.0	92	135	88	22	2026-03-25 18:50:05.466089
240	5	128	39.1	87	150	98	28	2026-03-25 18:50:05.466597
241	1	108	38.0	92	135	88	22	2026-03-25 18:50:10.507535
242	2	128	39.1	87	150	98	28	2026-03-25 18:50:10.509056
243	3	84	36.9	97	120	78	18	2026-03-25 18:50:10.509793
244	4	108	38.0	92	135	88	22	2026-03-25 18:50:10.510541
245	5	128	39.1	87	150	98	28	2026-03-25 18:50:10.511192
246	1	108	38.0	92	135	88	22	2026-03-25 18:50:15.557496
247	2	128	39.1	87	150	98	28	2026-03-25 18:50:15.558875
248	3	84	36.9	97	120	78	18	2026-03-25 18:50:15.55945
249	4	108	38.0	92	135	88	22	2026-03-25 18:50:15.55999
250	5	128	39.1	87	150	98	28	2026-03-25 18:50:15.560512
251	1	108	38.0	92	135	88	22	2026-03-25 18:50:20.605614
252	2	128	39.1	87	150	98	28	2026-03-25 18:50:20.60708
253	3	84	36.9	97	120	78	18	2026-03-25 18:50:20.607683
254	4	108	38.0	92	135	88	22	2026-03-25 18:50:20.608234
255	5	128	39.1	87	150	98	28	2026-03-25 18:50:20.608771
256	1	108	38.0	92	135	88	22	2026-03-25 18:50:25.653689
257	2	128	39.1	87	150	98	28	2026-03-25 18:50:25.655306
258	3	84	36.9	97	120	78	18	2026-03-25 18:50:25.65614
259	4	108	38.0	92	135	88	22	2026-03-25 18:50:25.65693
260	5	128	39.1	87	150	98	28	2026-03-25 18:50:25.657619
261	1	108	38.0	92	135	88	22	2026-03-25 18:50:30.703067
262	2	128	39.1	87	150	98	28	2026-03-25 18:50:30.70468
263	3	84	36.9	97	120	78	18	2026-03-25 18:50:30.705484
264	4	108	38.0	92	135	88	22	2026-03-25 18:50:30.706265
265	5	128	39.1	87	150	98	28	2026-03-25 18:50:30.706931
266	1	108	38.0	92	135	88	22	2026-03-25 18:50:35.754077
267	2	128	39.1	87	150	98	28	2026-03-25 18:50:35.755502
268	3	84	36.9	97	120	78	18	2026-03-25 18:50:35.756181
269	4	108	38.0	92	135	88	22	2026-03-25 18:50:35.756751
270	5	128	39.1	87	150	98	28	2026-03-25 18:50:35.757287
271	1	108	38.0	92	135	88	22	2026-03-25 18:50:40.79877
272	2	128	39.1	87	150	98	28	2026-03-25 18:50:40.800162
273	3	84	36.9	97	120	78	18	2026-03-25 18:50:40.800779
274	4	108	38.0	92	135	88	22	2026-03-25 18:50:40.801316
275	5	128	39.1	87	150	98	28	2026-03-25 18:50:40.801815
276	1	108	38.0	92	135	88	22	2026-03-25 18:50:45.84683
277	2	128	39.1	87	150	98	28	2026-03-25 18:50:45.848493
278	3	84	36.9	97	120	78	18	2026-03-25 18:50:45.849252
279	4	108	38.0	92	135	88	22	2026-03-25 18:50:45.850017
280	5	128	39.1	87	150	98	28	2026-03-25 18:50:45.850774
281	1	108	38.0	92	135	88	22	2026-03-25 18:50:50.895396
282	2	128	39.1	87	150	98	28	2026-03-25 18:50:50.896799
283	3	84	36.9	97	120	78	18	2026-03-25 18:50:50.897458
284	4	108	38.0	92	135	88	22	2026-03-25 18:50:50.898054
285	5	128	39.1	87	150	98	28	2026-03-25 18:50:50.898664
286	1	108	38.0	92	135	88	22	2026-03-25 18:50:55.943649
287	2	128	39.1	87	150	98	28	2026-03-25 18:50:55.945006
288	3	84	36.9	97	120	78	18	2026-03-25 18:50:55.945617
289	4	108	38.0	92	135	88	22	2026-03-25 18:50:55.946199
290	5	128	39.1	87	150	98	28	2026-03-25 18:50:55.946767
291	1	108	38.0	92	135	88	22	2026-03-25 18:51:00.988726
292	2	128	39.1	87	150	98	28	2026-03-25 18:51:00.990113
293	3	84	36.9	97	120	78	18	2026-03-25 18:51:00.99074
294	4	108	38.0	92	135	88	22	2026-03-25 18:51:00.991286
295	5	128	39.1	87	150	98	28	2026-03-25 18:51:00.991804
296	1	108	38.0	92	135	88	22	2026-03-25 18:51:06.041047
297	2	128	39.1	87	150	98	28	2026-03-25 18:51:06.042732
298	3	84	36.9	97	120	78	18	2026-03-25 18:51:06.043518
299	4	108	38.0	92	135	88	22	2026-03-25 18:51:06.044284
300	5	128	39.1	87	150	98	28	2026-03-25 18:51:06.044943
301	1	108	38.0	92	135	88	22	2026-03-25 18:51:11.091158
302	2	128	39.1	87	150	98	28	2026-03-25 18:51:11.092449
303	3	84	36.9	97	120	78	18	2026-03-25 18:51:11.09302
304	4	108	38.0	92	135	88	22	2026-03-25 18:51:11.093528
305	5	128	39.1	87	150	98	28	2026-03-25 18:51:11.094262
306	1	108	38.0	92	135	88	22	2026-03-25 18:51:16.136916
307	2	128	39.1	87	150	98	28	2026-03-25 18:51:16.138222
308	3	84	36.9	97	120	78	18	2026-03-25 18:51:16.138827
309	4	108	38.0	92	135	88	22	2026-03-25 18:51:16.139375
310	5	128	39.1	87	150	98	28	2026-03-25 18:51:16.139893
311	1	108	38.0	92	135	88	22	2026-03-25 18:51:21.182738
312	2	128	39.1	87	150	98	28	2026-03-25 18:51:21.184054
313	3	84	36.9	97	120	78	18	2026-03-25 18:51:21.184631
314	4	108	38.0	92	135	88	22	2026-03-25 18:51:21.185143
315	5	128	39.1	87	150	98	28	2026-03-25 18:51:21.185639
316	1	108	38.0	92	135	88	22	2026-03-25 18:51:26.22653
317	2	128	39.1	87	150	98	28	2026-03-25 18:51:26.22764
318	3	84	36.9	97	120	78	18	2026-03-25 18:51:26.22817
319	4	108	38.0	92	135	88	22	2026-03-25 18:51:26.228603
320	5	128	39.1	87	150	98	28	2026-03-25 18:51:26.228984
321	1	108	38.0	92	135	88	22	2026-03-25 18:51:31.293397
322	2	128	39.1	87	150	98	28	2026-03-25 18:51:31.294227
323	3	84	36.9	97	120	78	18	2026-03-25 18:51:31.294669
324	4	108	38.0	92	135	88	22	2026-03-25 18:51:31.294975
325	5	128	39.1	87	150	98	28	2026-03-25 18:51:31.295277
326	1	108	38.0	92	135	88	22	2026-03-25 18:51:36.483419
327	2	128	39.1	87	150	98	28	2026-03-25 18:51:36.484426
328	3	84	36.9	97	120	78	18	2026-03-25 18:51:36.484916
329	4	108	38.0	92	135	88	22	2026-03-25 18:51:36.485358
330	5	128	39.1	87	150	98	28	2026-03-25 18:51:36.485821
331	1	108	38.0	92	135	88	22	2026-03-25 18:51:41.528907
332	2	128	39.1	87	150	98	28	2026-03-25 18:51:41.530589
333	3	84	36.9	97	120	78	18	2026-03-25 18:51:41.531438
334	4	108	38.0	92	135	88	22	2026-03-25 18:51:41.532239
335	5	128	39.1	87	150	98	28	2026-03-25 18:51:41.532934
336	1	108	38.0	92	135	88	22	2026-03-25 18:51:46.576299
337	2	128	39.1	87	150	98	28	2026-03-25 18:51:46.577923
338	3	84	36.9	97	120	78	18	2026-03-25 18:51:46.578736
339	4	108	38.0	92	135	88	22	2026-03-25 18:51:46.579463
340	5	128	39.1	87	150	98	28	2026-03-25 18:51:46.58019
341	1	108	38.0	92	135	88	22	2026-03-25 18:51:51.626034
342	2	128	39.1	87	150	98	28	2026-03-25 18:51:51.627437
343	3	84	36.9	97	120	78	18	2026-03-25 18:51:51.628056
344	4	108	38.0	92	135	88	22	2026-03-25 18:51:51.628629
345	5	128	39.1	87	150	98	28	2026-03-25 18:51:51.629199
346	1	108	38.0	92	135	88	22	2026-03-25 18:51:56.675639
347	2	128	39.1	87	150	98	28	2026-03-25 18:51:56.677016
348	3	84	36.9	97	120	78	18	2026-03-25 18:51:56.67766
349	4	108	38.0	92	135	88	22	2026-03-25 18:51:56.678236
350	5	128	39.1	87	150	98	28	2026-03-25 18:51:56.678817
351	1	108	38.0	92	135	88	22	2026-03-25 18:52:01.72296
352	2	128	39.1	87	150	98	28	2026-03-25 18:52:01.724403
353	3	84	36.9	97	120	78	18	2026-03-25 18:52:01.725016
354	4	108	38.0	92	135	88	22	2026-03-25 18:52:01.725588
355	5	128	39.1	87	150	98	28	2026-03-25 18:52:01.726156
356	1	108	38.0	92	135	88	22	2026-03-25 18:52:06.773347
357	2	128	39.1	87	150	98	28	2026-03-25 18:52:06.774629
358	3	84	36.9	97	120	78	18	2026-03-25 18:52:06.775295
359	4	108	38.0	92	135	88	22	2026-03-25 18:52:06.775971
360	5	128	39.1	87	150	98	28	2026-03-25 18:52:06.776587
361	1	108	38.0	92	135	88	22	2026-03-25 18:52:11.833208
362	2	128	39.1	87	150	98	28	2026-03-25 18:52:11.834763
363	3	84	36.9	97	120	78	18	2026-03-25 18:52:11.835595
364	4	108	38.0	92	135	88	22	2026-03-25 18:52:11.836291
365	5	128	39.1	87	150	98	28	2026-03-25 18:52:11.836928
366	1	108	38.0	92	135	88	22	2026-03-25 18:52:17.317446
367	2	128	39.1	87	150	98	28	2026-03-25 18:52:17.318493
368	3	84	36.9	97	120	78	18	2026-03-25 18:52:17.318755
369	4	108	38.0	92	135	88	22	2026-03-25 18:52:17.31901
370	5	128	39.1	87	150	98	28	2026-03-25 18:52:17.319306
371	1	108	38.0	92	135	88	22	2026-03-25 18:52:22.35106
372	2	128	39.1	87	150	98	28	2026-03-25 18:52:22.352448
373	3	84	36.9	97	120	78	18	2026-03-25 18:52:22.352999
374	4	108	38.0	92	135	88	22	2026-03-25 18:52:22.353478
375	5	128	39.1	87	150	98	28	2026-03-25 18:52:22.353963
376	1	108	38.0	92	135	88	22	2026-03-25 18:52:27.396092
377	2	128	39.1	87	150	98	28	2026-03-25 18:52:27.397231
378	3	84	36.9	97	120	78	18	2026-03-25 18:52:27.397709
379	4	108	38.0	92	135	88	22	2026-03-25 18:52:27.398125
380	5	128	39.1	87	150	98	28	2026-03-25 18:52:27.398519
381	1	108	38.0	92	135	88	22	2026-03-25 18:52:32.440749
382	2	128	39.1	87	150	98	28	2026-03-25 18:52:32.442084
383	3	84	36.9	97	120	78	18	2026-03-25 18:52:32.44278
384	4	108	38.0	92	135	88	22	2026-03-25 18:52:32.443368
385	5	128	39.1	87	150	98	28	2026-03-25 18:52:32.443985
386	1	108	38.0	92	135	88	22	2026-03-25 18:52:37.488521
387	2	128	39.1	87	150	98	28	2026-03-25 18:52:37.489815
388	3	84	36.9	97	120	78	18	2026-03-25 18:52:37.490514
389	4	108	38.0	92	135	88	22	2026-03-25 18:52:37.491089
390	5	128	39.1	87	150	98	28	2026-03-25 18:52:37.491641
391	1	108	38.0	92	135	88	22	2026-03-25 18:53:55.601498
392	2	128	39.1	87	150	98	28	2026-03-25 18:53:55.602647
393	3	84	36.9	97	120	78	18	2026-03-25 18:53:55.603175
394	4	108	38.0	92	135	88	22	2026-03-25 18:53:55.603667
395	5	128	39.1	87	150	98	28	2026-03-25 18:53:55.604144
396	1	108	38.0	92	135	88	22	2026-03-25 18:54:00.637229
397	2	128	39.1	87	150	98	28	2026-03-25 18:54:00.638842
398	3	84	36.9	97	120	78	18	2026-03-25 18:54:00.639375
399	4	108	38.0	92	135	88	22	2026-03-25 18:54:00.639799
400	5	128	39.1	87	150	98	28	2026-03-25 18:54:00.640392
401	1	108	38.0	92	135	88	22	2026-03-25 18:54:05.689673
402	2	128	39.1	87	150	98	28	2026-03-25 18:54:05.690973
403	3	84	36.9	97	120	78	18	2026-03-25 18:54:05.691544
404	4	108	38.0	92	135	88	22	2026-03-25 18:54:05.692055
405	5	128	39.1	87	150	98	28	2026-03-25 18:54:05.692608
406	1	108	38.0	92	135	88	22	2026-03-25 18:54:10.735428
407	2	128	39.1	87	150	98	28	2026-03-25 18:54:10.736886
408	3	84	36.9	97	120	78	18	2026-03-25 18:54:10.737543
409	4	108	38.0	92	135	88	22	2026-03-25 18:54:10.738431
410	5	128	39.1	87	150	98	28	2026-03-25 18:54:10.739187
411	1	108	38.0	92	135	88	22	2026-03-25 18:54:15.784925
412	2	128	39.1	87	150	98	28	2026-03-25 18:54:15.78634
413	3	84	36.9	97	120	78	18	2026-03-25 18:54:15.78704
414	4	108	38.0	92	135	88	22	2026-03-25 18:54:15.787653
415	5	128	39.1	87	150	98	28	2026-03-25 18:54:15.788213
416	1	108	38.0	92	135	88	22	2026-03-25 18:54:20.834511
417	2	128	39.1	87	150	98	28	2026-03-25 18:54:20.836973
418	3	84	36.9	97	120	78	18	2026-03-25 18:54:20.838553
419	4	108	38.0	92	135	88	22	2026-03-25 18:54:20.839405
420	5	128	39.1	87	150	98	28	2026-03-25 18:54:20.840141
421	1	108	38.0	92	135	88	22	2026-03-25 18:54:25.890248
422	2	128	39.1	87	150	98	28	2026-03-25 18:54:25.891808
423	3	84	36.9	97	120	78	18	2026-03-25 18:54:25.89247
424	4	108	38.0	92	135	88	22	2026-03-25 18:54:25.893277
425	5	128	39.1	87	150	98	28	2026-03-25 18:54:25.893984
426	1	108	38.0	92	135	88	22	2026-03-25 18:54:30.944253
427	2	128	39.1	87	150	98	28	2026-03-25 18:54:30.945371
428	3	84	36.9	97	120	78	18	2026-03-25 18:54:30.945829
429	4	108	38.0	92	135	88	22	2026-03-25 18:54:30.946268
430	5	128	39.1	87	150	98	28	2026-03-25 18:54:30.946828
431	1	108	38.0	92	135	88	22	2026-03-25 18:54:35.978393
432	2	128	39.1	87	150	98	28	2026-03-25 18:54:35.979216
433	3	84	36.9	97	120	78	18	2026-03-25 18:54:35.979659
434	4	108	38.0	92	135	88	22	2026-03-25 18:54:35.980077
435	5	128	39.1	87	150	98	28	2026-03-25 18:54:35.980556
436	1	108	38.0	92	135	88	22	2026-03-25 18:54:41.011857
437	2	128	39.1	87	150	98	28	2026-03-25 18:54:41.012526
438	3	84	36.9	97	120	78	18	2026-03-25 18:54:41.012954
439	4	108	38.0	92	135	88	22	2026-03-25 18:54:41.013426
440	5	128	39.1	87	150	98	28	2026-03-25 18:54:41.013828
441	1	108	38.0	92	135	88	22	2026-03-25 18:54:46.052506
442	2	128	39.1	87	150	98	28	2026-03-25 18:54:46.053911
443	3	84	36.9	97	120	78	18	2026-03-25 18:54:46.054533
444	4	108	38.0	92	135	88	22	2026-03-25 18:54:46.055175
445	5	128	39.1	87	150	98	28	2026-03-25 18:54:46.055729
446	1	108	38.0	92	135	88	22	2026-03-25 18:54:51.093597
447	2	128	39.1	87	150	98	28	2026-03-25 18:54:51.09494
448	3	84	36.9	97	120	78	18	2026-03-25 18:54:51.095413
449	4	108	38.0	92	135	88	22	2026-03-25 18:54:51.095857
450	5	128	39.1	87	150	98	28	2026-03-25 18:54:51.096288
451	1	108	38.0	92	135	88	22	2026-03-25 18:54:56.131434
452	2	128	39.1	87	150	98	28	2026-03-25 18:54:56.132511
453	3	84	36.9	97	120	78	18	2026-03-25 18:54:56.133042
454	4	108	38.0	92	135	88	22	2026-03-25 18:54:56.133596
455	5	128	39.1	87	150	98	28	2026-03-25 18:54:56.134085
456	1	108	38.0	92	135	88	22	2026-03-25 18:55:01.185675
457	2	128	39.1	87	150	98	28	2026-03-25 18:55:01.187225
458	3	84	36.9	97	120	78	18	2026-03-25 18:55:01.187986
459	4	108	38.0	92	135	88	22	2026-03-25 18:55:01.188719
460	5	128	39.1	87	150	98	28	2026-03-25 18:55:01.189422
461	1	108	38.0	92	135	88	22	2026-03-25 18:55:06.239891
462	2	128	39.1	87	150	98	28	2026-03-25 18:55:06.241553
463	3	84	36.9	97	120	78	18	2026-03-25 18:55:06.242335
464	4	108	38.0	92	135	88	22	2026-03-25 18:55:06.243162
465	5	128	39.1	87	150	98	28	2026-03-25 18:55:06.243872
466	1	108	38.0	92	135	88	22	2026-03-25 18:55:11.289157
467	2	128	39.1	87	150	98	28	2026-03-25 18:55:11.290365
468	3	84	36.9	97	120	78	18	2026-03-25 18:55:11.290867
469	4	108	38.0	92	135	88	22	2026-03-25 18:55:11.29133
470	5	128	39.1	87	150	98	28	2026-03-25 18:55:11.291783
471	1	108	38.0	92	135	88	22	2026-03-25 18:55:16.332599
472	2	128	39.1	87	150	98	28	2026-03-25 18:55:16.334107
473	3	84	36.9	97	120	78	18	2026-03-25 18:55:16.334808
474	4	108	38.0	92	135	88	22	2026-03-25 18:55:16.33554
475	5	128	39.1	87	150	98	28	2026-03-25 18:55:16.336378
476	1	108	38.0	92	135	88	22	2026-03-25 18:55:21.383803
477	2	128	39.1	87	150	98	28	2026-03-25 18:55:21.385404
478	3	84	36.9	97	120	78	18	2026-03-25 18:55:21.386319
479	4	108	38.0	92	135	88	22	2026-03-25 18:55:21.387093
480	5	128	39.1	87	150	98	28	2026-03-25 18:55:21.387762
481	1	108	38.0	92	135	88	22	2026-03-25 18:55:26.437577
482	2	128	39.1	87	150	98	28	2026-03-25 18:55:26.440635
483	3	84	36.9	97	120	78	18	2026-03-25 18:55:26.441449
484	4	108	38.0	92	135	88	22	2026-03-25 18:55:26.442035
485	5	128	39.1	87	150	98	28	2026-03-25 18:55:26.442541
486	1	108	38.0	92	135	88	22	2026-03-25 18:55:31.499459
487	2	128	39.1	87	150	98	28	2026-03-25 18:55:31.500995
488	3	84	36.9	97	120	78	18	2026-03-25 18:55:31.501695
489	4	108	38.0	92	135	88	22	2026-03-25 18:55:31.502325
490	5	128	39.1	87	150	98	28	2026-03-25 18:55:31.502961
491	1	108	38.0	92	135	88	22	2026-03-25 18:55:36.545746
492	2	128	39.1	87	150	98	28	2026-03-25 18:55:36.546992
493	3	84	36.9	97	120	78	18	2026-03-25 18:55:36.547444
494	4	108	38.0	92	135	88	22	2026-03-25 18:55:36.547788
495	5	128	39.1	87	150	98	28	2026-03-25 18:55:36.548111
496	1	108	38.0	92	135	88	22	2026-03-25 18:55:41.601458
497	2	128	39.1	87	150	98	28	2026-03-25 18:55:41.603182
498	3	84	36.9	97	120	78	18	2026-03-25 18:55:41.603892
499	4	108	38.0	92	135	88	22	2026-03-25 18:55:41.604638
500	5	128	39.1	87	150	98	28	2026-03-25 18:55:41.605309
501	1	108	38.0	92	135	88	22	2026-03-25 18:55:46.6589
502	2	128	39.1	87	150	98	28	2026-03-25 18:55:46.660159
503	3	84	36.9	97	120	78	18	2026-03-25 18:55:46.660715
504	4	108	38.0	92	135	88	22	2026-03-25 18:55:46.661212
505	5	128	39.1	87	150	98	28	2026-03-25 18:55:46.661655
506	1	108	38.0	92	135	88	22	2026-03-25 18:55:49.879237
507	2	128	39.1	87	150	98	28	2026-03-25 18:55:49.880072
508	3	84	36.9	97	120	78	18	2026-03-25 18:55:49.880349
509	4	108	38.0	92	135	88	22	2026-03-25 18:55:49.880597
510	5	128	39.1	87	150	98	28	2026-03-25 18:55:49.881027
511	1	108	38.0	92	135	88	22	2026-03-25 18:55:54.916894
512	2	128	39.1	87	150	98	28	2026-03-25 18:55:54.918273
513	3	84	36.9	97	120	78	18	2026-03-25 18:55:54.918937
514	4	108	38.0	92	135	88	22	2026-03-25 18:55:54.919509
515	5	128	39.1	87	150	98	28	2026-03-25 18:55:54.920095
516	1	108	38.0	92	135	88	22	2026-03-25 18:55:59.960889
517	2	128	39.1	87	150	98	28	2026-03-25 18:55:59.962072
518	3	84	36.9	97	120	78	18	2026-03-25 18:55:59.962802
519	4	108	38.0	92	135	88	22	2026-03-25 18:55:59.963532
520	5	128	39.1	87	150	98	28	2026-03-25 18:55:59.96398
521	1	108	38.0	92	135	88	22	2026-03-25 18:56:05.006993
522	2	128	39.1	87	150	98	28	2026-03-25 18:56:05.008078
523	3	84	36.9	97	120	78	18	2026-03-25 18:56:05.008532
524	4	108	38.0	92	135	88	22	2026-03-25 18:56:05.009092
525	5	128	39.1	87	150	98	28	2026-03-25 18:56:05.009817
526	1	108	38.0	92	135	88	22	2026-03-25 18:56:10.053243
527	2	128	39.1	87	150	98	28	2026-03-25 18:56:10.053846
528	3	84	36.9	97	120	78	18	2026-03-25 18:56:10.05427
529	4	108	38.0	92	135	88	22	2026-03-25 18:56:10.054707
530	5	128	39.1	87	150	98	28	2026-03-25 18:56:10.055191
531	1	108	38.0	92	135	88	22	2026-03-25 18:56:15.092819
532	2	128	39.1	87	150	98	28	2026-03-25 18:56:15.094114
533	3	84	36.9	97	120	78	18	2026-03-25 18:56:15.094723
534	4	108	38.0	92	135	88	22	2026-03-25 18:56:15.095288
535	5	128	39.1	87	150	98	28	2026-03-25 18:56:15.095803
536	1	108	38.0	92	135	88	22	2026-03-25 18:56:20.139591
537	2	128	39.1	87	150	98	28	2026-03-25 18:56:20.14243
538	3	84	36.9	97	120	78	18	2026-03-25 18:56:20.143123
539	4	108	38.0	92	135	88	22	2026-03-25 18:56:20.143725
540	5	128	39.1	87	150	98	28	2026-03-25 18:56:20.14432
541	1	108	38.0	92	135	88	22	2026-03-25 18:56:25.186881
542	2	128	39.1	87	150	98	28	2026-03-25 18:56:25.188065
543	3	84	36.9	97	120	78	18	2026-03-25 18:56:25.188681
544	4	108	38.0	92	135	88	22	2026-03-25 18:56:25.189202
545	5	128	39.1	87	150	98	28	2026-03-25 18:56:25.189691
546	1	108	38.0	92	135	88	22	2026-03-25 18:56:30.233676
547	2	128	39.1	87	150	98	28	2026-03-25 18:56:30.235059
548	3	84	36.9	97	120	78	18	2026-03-25 18:56:30.235722
549	4	108	38.0	92	135	88	22	2026-03-25 18:56:30.236441
550	5	128	39.1	87	150	98	28	2026-03-25 18:56:30.237034
551	1	108	38.0	92	135	88	22	2026-03-25 18:56:35.279817
552	2	128	39.1	87	150	98	28	2026-03-25 18:56:35.280959
553	3	84	36.9	97	120	78	18	2026-03-25 18:56:35.281473
554	4	108	38.0	92	135	88	22	2026-03-25 18:56:35.281937
555	5	128	39.1	87	150	98	28	2026-03-25 18:56:35.282336
556	1	104	38.0	90	132	84	23	2026-03-25 19:01:10.711324
557	2	134	39.1	89	145	102	27	2026-03-25 19:01:10.71244
558	3	86	37.4	97	113	76	18	2026-03-25 19:01:10.712743
559	4	102	37.9	91	139	90	21	2026-03-25 19:01:10.71303
560	5	125	38.7	87	142	105	27	2026-03-25 19:01:10.713288
561	1	121	38.8	88	149	102	30	2026-03-25 19:01:15.751036
562	2	88	36.9	95	113	72	18	2026-03-25 19:01:15.752157
563	3	114	37.7	93	133	85	24	2026-03-25 19:01:15.752642
564	4	131	39.5	85	156	99	25	2026-03-25 19:01:15.753038
565	5	88	37.2	99	115	73	17	2026-03-25 19:01:15.753407
566	1	91	37.1	95	115	79	18	2026-03-25 19:01:20.797433
567	2	101	38.0	91	136	84	22	2026-03-25 19:01:20.798628
568	3	125	39.5	89	156	96	29	2026-03-25 19:01:20.7991
569	4	86	37.1	98	117	76	19	2026-03-25 19:01:20.799596
570	5	113	37.8	94	140	85	21	2026-03-25 19:01:20.800082
571	1	107	38.1	90	127	86	22	2026-03-25 19:01:25.84162
572	2	126	39.5	87	159	104	26	2026-03-25 19:01:25.842674
573	3	75	37.2	95	113	71	17	2026-03-25 19:01:25.843168
574	4	112	38.0	94	134	83	21	2026-03-25 19:01:25.843589
575	5	131	39.0	86	141	105	26	2026-03-25 19:01:25.844009
576	1	131	38.9	88	152	95	29	2026-03-25 19:01:30.887849
577	2	72	37.4	96	119	72	17	2026-03-25 19:01:30.88901
578	3	115	38.2	91	139	92	21	2026-03-25 19:01:30.889484
579	4	135	39.6	86	146	99	26	2026-03-25 19:01:30.889939
580	5	91	37.2	95	120	78	20	2026-03-25 19:01:30.890391
581	1	80	37.4	95	118	82	16	2026-03-25 19:01:35.932599
582	2	101	37.6	92	128	89	22	2026-03-25 19:01:35.933978
583	3	121	39.4	85	150	95	25	2026-03-25 19:01:35.93464
584	4	77	37.3	98	122	74	19	2026-03-25 19:01:35.935265
585	5	116	37.6	90	135	89	24	2026-03-25 19:01:35.935832
586	1	110	38.0	90	132	85	24	2026-03-25 19:01:40.977363
587	2	125	39.1	89	154	104	30	2026-03-25 19:01:40.978783
588	3	95	36.9	97	117	79	20	2026-03-25 19:01:40.97944
589	4	109	38.1	90	130	89	22	2026-03-25 19:01:40.980008
590	5	124	39.4	87	154	103	25	2026-03-25 19:01:40.980526
591	1	130	39.5	89	156	100	26	2026-03-25 19:01:46.026193
592	2	73	36.5	98	113	74	16	2026-03-25 19:01:46.027487
593	3	112	37.9	94	137	89	21	2026-03-25 19:01:46.028154
594	4	127	39.0	88	146	95	27	2026-03-25 19:01:46.028741
595	5	82	36.6	95	115	80	20	2026-03-25 19:01:46.029272
596	1	93	37.0	97	114	75	16	2026-03-25 19:01:51.075431
597	2	106	38.1	93	126	89	22	2026-03-25 19:01:51.076784
598	3	127	39.6	88	157	102	27	2026-03-25 19:01:51.077441
599	4	87	36.8	98	121	76	16	2026-03-25 19:01:51.077981
600	5	101	37.6	92	130	85	23	2026-03-25 19:01:51.078483
601	1	114	38.2	91	138	88	22	2026-03-25 19:01:56.130707
602	2	123	39.4	86	158	94	29	2026-03-25 19:01:56.132107
603	3	89	36.7	97	111	78	17	2026-03-25 19:01:56.132642
604	4	104	38.1	90	127	86	22	2026-03-25 19:01:56.133145
605	5	122	39.4	86	150	96	30	2026-03-25 19:01:56.13358
606	1	128	39.4	89	141	98	30	2026-03-25 19:02:01.169133
607	2	89	36.8	98	113	79	17	2026-03-25 19:02:01.170546
608	3	106	38.3	94	132	86	22	2026-03-25 19:02:01.171203
609	4	133	39.2	89	145	94	28	2026-03-25 19:02:01.171809
610	5	73	37.3	98	124	80	18	2026-03-25 19:02:01.172339
611	1	90	37.4	99	117	80	17	2026-03-25 19:08:54.301899
612	2	102	37.7	92	140	89	24	2026-03-25 19:08:54.303235
613	3	125	39.4	84	150	93	27	2026-03-25 19:08:54.303792
614	4	94	37.4	97	123	81	20	2026-03-25 19:08:54.304467
615	5	109	37.8	91	136	87	24	2026-03-25 19:08:54.304781
616	1	104	38.3	90	140	88	22	2026-03-25 19:08:56.674664
617	2	125	39.3	89	160	93	27	2026-03-25 19:08:56.675702
618	3	93	36.6	95	123	71	19	2026-03-25 19:08:56.676135
619	4	106	38.3	93	134	83	24	2026-03-25 19:08:56.67645
620	5	134	39.5	87	150	94	27	2026-03-25 19:08:56.676751
621	1	135	39.0	85	141	94	28	2026-03-25 19:09:01.720781
622	2	73	36.5	99	121	77	19	2026-03-25 19:09:01.722391
623	3	107	38.0	93	138	92	22	2026-03-25 19:09:01.723021
624	4	134	39.1	84	148	105	28	2026-03-25 19:09:01.723377
625	5	77	36.8	97	114	82	19	2026-03-25 19:09:01.723717
626	1	84	37.4	98	116	70	16	2026-03-25 19:09:06.77217
627	2	111	38.0	91	133	84	21	2026-03-25 19:09:06.77364
628	3	126	39.1	86	147	101	27	2026-03-25 19:09:06.774321
629	4	87	36.9	95	114	79	19	2026-03-25 19:09:06.774938
630	5	112	37.7	91	136	92	21	2026-03-25 19:09:06.775527
631	1	108	38.4	92	140	86	23	2026-03-25 19:09:11.817937
632	2	132	38.7	85	146	93	27	2026-03-25 19:09:11.819351
633	3	79	37.2	98	121	71	16	2026-03-25 19:09:11.82003
634	4	101	38.0	92	135	83	22	2026-03-25 19:09:11.820691
635	5	123	39.4	86	157	103	25	2026-03-25 19:09:11.821256
636	1	124	38.8	85	160	97	29	2026-03-25 19:09:16.873804
637	2	80	37.1	97	118	75	19	2026-03-25 19:09:16.875067
638	3	118	38.2	94	128	89	21	2026-03-25 19:09:16.875506
639	4	128	38.6	88	145	96	28	2026-03-25 19:09:16.875878
640	5	81	36.5	99	120	78	20	2026-03-25 19:09:16.876247
641	1	74	37.4	98	122	78	16	2026-03-25 19:16:21.680222
642	2	116	38.0	91	139	83	22	2026-03-25 19:16:21.680966
643	3	135	39.3	88	158	97	30	2026-03-25 19:16:21.681248
644	4	78	36.7	95	114	73	20	2026-03-25 19:16:21.681618
645	5	117	37.8	91	139	84	23	2026-03-25 19:16:21.68187
646	1	101	37.7	92	137	88	21	2026-03-25 19:16:26.721394
647	2	124	38.8	87	146	97	28	2026-03-25 19:16:26.722797
648	3	81	37.4	99	110	80	19	2026-03-25 19:16:26.723507
649	4	104	37.9	94	131	90	22	2026-03-25 19:16:26.724177
650	5	125	39.2	87	143	105	25	2026-03-25 19:16:26.724791
651	1	132	38.8	87	147	97	26	2026-03-25 19:16:27.241084
652	2	94	37.3	97	114	79	18	2026-03-25 19:16:27.242637
653	3	113	38.2	93	133	92	21	2026-03-25 19:16:27.243026
654	4	134	39.0	84	153	105	25	2026-03-25 19:16:27.243317
655	5	91	36.7	97	124	71	16	2026-03-25 19:16:27.243595
656	1	90	37.3	95	113	81	16	2026-03-25 19:16:28.514966
657	2	109	37.9	92	128	87	21	2026-03-25 19:16:28.516186
658	3	132	38.7	84	144	104	30	2026-03-25 19:16:28.516787
659	4	74	37.2	98	111	72	19	2026-03-25 19:16:28.517384
660	5	105	38.4	90	126	85	23	2026-03-25 19:16:28.51805
661	1	113	37.8	91	137	88	21	2026-03-25 19:16:31.774019
662	2	128	39.3	86	152	94	25	2026-03-25 19:16:31.775314
663	3	95	37.1	99	117	73	20	2026-03-25 19:16:31.775948
664	4	104	37.6	92	127	89	22	2026-03-25 19:16:31.776507
665	5	135	39.4	88	150	93	29	2026-03-25 19:16:31.77702
666	1	124	39.5	85	156	102	28	2026-03-25 19:16:32.2819
667	2	92	36.7	99	119	80	20	2026-03-25 19:16:32.283217
668	3	109	38.4	90	136	83	21	2026-03-25 19:16:32.283833
669	4	123	39.0	88	154	94	26	2026-03-25 19:16:32.284377
670	5	93	36.7	97	123	71	19	2026-03-25 19:16:32.284879
671	1	91	36.5	99	115	80	17	2026-03-25 19:16:33.562452
672	2	105	38.4	90	134	84	21	2026-03-25 19:16:33.564074
673	3	130	38.7	89	156	101	25	2026-03-25 19:16:33.564751
674	4	93	36.7	95	110	76	17	2026-03-25 19:16:33.565374
675	5	114	38.1	93	129	85	21	2026-03-25 19:16:33.565934
676	1	105	38.4	90	132	89	24	2026-03-25 19:16:36.826699
677	2	126	39.3	88	142	98	29	2026-03-25 19:16:36.827885
678	3	93	37.1	99	121	79	20	2026-03-25 19:16:36.828445
679	4	104	37.8	92	134	84	22	2026-03-25 19:16:36.828972
680	5	129	39.3	89	159	102	29	2026-03-25 19:16:36.82948
681	1	135	39.5	89	142	99	28	2026-03-25 19:16:37.328655
682	2	77	37.2	95	113	71	18	2026-03-25 19:16:37.33008
683	3	116	38.3	93	135	83	21	2026-03-25 19:16:37.330721
684	4	123	39.0	88	146	103	27	2026-03-25 19:16:37.331296
685	5	81	37.2	95	116	76	19	2026-03-25 19:16:37.33225
686	1	74	36.7	98	110	76	17	2026-03-25 19:16:38.613572
687	2	117	38.1	93	128	87	21	2026-03-25 19:16:38.614977
688	3	135	38.7	86	150	95	29	2026-03-25 19:16:38.615654
689	4	85	36.5	96	119	71	19	2026-03-25 19:16:38.616415
690	5	107	37.9	91	140	88	21	2026-03-25 19:16:38.617113
691	1	118	38.2	91	140	85	22	2026-03-25 19:16:41.881514
692	2	126	38.8	89	154	104	29	2026-03-25 19:16:41.882661
693	3	87	36.6	99	116	78	16	2026-03-25 19:16:41.88322
694	4	107	38.0	92	129	85	23	2026-03-25 19:16:41.883671
695	5	130	39.5	86	154	96	30	2026-03-25 19:16:41.884091
696	1	127	39.0	84	153	98	28	2026-03-25 19:16:42.377312
697	2	88	37.3	97	120	73	17	2026-03-25 19:16:42.378552
698	3	104	37.9	90	127	85	23	2026-03-25 19:16:42.379122
699	4	130	39.6	84	147	96	25	2026-03-25 19:16:42.379625
700	5	94	36.6	99	121	74	18	2026-03-25 19:16:42.380108
701	1	94	36.6	96	113	73	17	2026-03-25 19:16:43.666317
702	2	109	37.8	91	129	92	23	2026-03-25 19:16:43.667655
703	3	125	39.6	87	145	99	26	2026-03-25 19:16:43.668315
704	4	94	37.3	99	115	71	19	2026-03-25 19:16:43.668873
705	5	108	38.0	93	134	86	23	2026-03-25 19:16:43.66939
706	1	102	37.6	94	137	88	21	2026-03-25 19:16:46.931141
707	2	132	38.7	89	158	104	27	2026-03-25 19:16:46.932342
708	3	90	36.7	95	117	77	19	2026-03-25 19:16:46.932925
709	4	104	38.2	93	130	86	24	2026-03-25 19:16:46.933439
710	5	122	38.8	85	151	94	28	2026-03-25 19:16:46.93393
711	1	134	38.8	84	156	93	28	2026-03-25 19:16:47.423657
712	2	90	37.3	97	122	81	19	2026-03-25 19:16:47.425764
713	3	107	38.2	90	138	86	22	2026-03-25 19:16:47.426546
714	4	130	38.9	84	155	104	27	2026-03-25 19:16:47.427203
715	5	89	36.5	98	116	77	20	2026-03-25 19:16:47.427876
716	1	79	36.9	97	118	76	20	2026-03-25 19:16:48.709143
717	2	104	37.7	94	127	83	23	2026-03-25 19:16:48.710836
718	3	124	39.0	89	149	98	25	2026-03-25 19:16:48.711726
719	4	79	37.2	96	111	71	16	2026-03-25 19:16:48.712465
720	5	107	38.0	91	129	84	24	2026-03-25 19:16:48.713115
721	1	102	37.6	91	129	87	23	2026-03-25 19:16:50.728636
722	2	135	39.6	89	146	104	25	2026-03-25 19:16:50.730347
723	3	86	36.7	96	119	81	18	2026-03-25 19:16:50.731071
724	4	110	37.7	90	136	88	22	2026-03-25 19:16:50.7317
725	5	129	38.8	89	155	96	27	2026-03-25 19:16:50.732288
726	1	126	39.3	86	158	94	26	2026-03-25 19:16:51.983658
727	2	93	37.1	99	117	71	17	2026-03-25 19:16:51.985232
728	3	105	38.3	94	127	90	23	2026-03-25 19:16:51.985922
729	4	123	38.8	87	146	103	30	2026-03-25 19:16:51.98654
730	5	95	36.8	97	123	72	17	2026-03-25 19:16:51.987158
731	1	95	37.1	95	120	79	18	2026-03-25 19:16:52.475987
732	2	112	37.9	92	134	83	23	2026-03-25 19:16:52.477363
733	3	134	39.6	86	143	97	28	2026-03-25 19:16:52.477988
734	4	92	36.6	99	124	81	16	2026-03-25 19:16:52.47854
735	5	105	38.0	90	129	85	22	2026-03-25 19:16:52.4791
736	1	113	37.8	92	126	89	21	2026-03-25 19:16:55.831881
737	2	121	39.3	89	160	105	26	2026-03-25 19:16:55.833352
738	3	72	36.6	96	116	75	19	2026-03-25 19:16:55.833949
739	4	112	37.9	91	139	84	24	2026-03-25 19:16:55.834571
740	5	132	38.6	84	155	96	30	2026-03-25 19:16:55.835072
741	1	122	39.1	86	157	95	27	2026-03-25 19:17:00.871485
742	2	75	36.7	99	122	74	20	2026-03-25 19:17:00.872853
743	3	105	38.2	91	134	86	24	2026-03-25 19:17:00.87349
744	4	132	38.7	88	156	101	29	2026-03-25 19:17:00.874034
745	5	78	36.5	95	116	80	20	2026-03-25 19:17:00.874513
746	1	72	37.1	97	113	73	19	2026-03-25 19:17:05.922381
747	2	111	37.6	91	140	90	24	2026-03-25 19:17:05.924006
748	3	127	39.2	85	141	93	27	2026-03-25 19:17:05.924755
749	4	92	37.3	99	120	71	16	2026-03-25 19:17:05.925636
750	5	117	37.7	92	127	92	24	2026-03-25 19:17:05.926337
751	1	112	37.9	93	129	87	22	2026-03-25 19:17:10.974332
752	2	127	39.3	89	158	102	25	2026-03-25 19:17:10.975679
753	3	76	37.2	99	117	70	17	2026-03-25 19:17:10.976339
754	4	116	38.3	93	131	92	22	2026-03-25 19:17:10.976879
755	5	126	39.2	86	145	102	28	2026-03-25 19:17:10.977386
756	1	135	39.2	86	147	101	27	2026-03-25 19:17:16.029864
757	2	80	36.8	95	121	77	19	2026-03-25 19:17:16.031463
758	3	105	38.1	94	127	90	22	2026-03-25 19:17:16.032239
759	4	135	39.0	87	154	96	25	2026-03-25 19:17:16.032996
760	5	85	37.0	96	114	78	16	2026-03-25 19:17:16.033661
761	1	93	37.1	98	114	80	19	2026-03-25 19:17:21.080117
762	2	101	38.2	94	135	87	22	2026-03-25 19:17:21.081874
763	3	125	38.7	87	152	97	25	2026-03-25 19:17:21.083035
764	4	82	37.1	96	120	71	19	2026-03-25 19:17:21.083812
765	5	113	37.9	92	136	91	23	2026-03-25 19:17:21.084509
766	1	113	37.7	92	127	88	21	2026-03-25 19:17:26.132297
767	2	132	39.4	89	160	94	30	2026-03-25 19:17:26.134205
768	3	86	36.7	97	119	77	20	2026-03-25 19:17:26.135221
769	4	113	37.9	92	132	91	22	2026-03-25 19:17:26.135975
770	5	130	39.5	85	153	103	26	2026-03-25 19:17:26.136764
771	1	129	38.6	84	147	93	30	2026-03-25 19:17:31.193939
772	2	89	36.8	98	116	72	20	2026-03-25 19:17:31.195597
773	3	116	38.0	94	127	91	23	2026-03-25 19:17:31.196424
774	4	134	39.3	85	141	105	28	2026-03-25 19:17:31.19715
775	5	90	37.3	97	118	74	17	2026-03-25 19:17:31.198123
776	1	72	37.3	96	111	71	16	2026-03-25 19:17:36.245223
777	2	104	38.2	90	136	85	24	2026-03-25 19:17:36.246671
778	3	124	38.7	86	141	99	25	2026-03-25 19:17:36.247337
779	4	87	37.0	96	114	79	16	2026-03-25 19:17:36.248006
780	5	112	38.0	91	128	84	22	2026-03-25 19:17:36.248589
781	1	111	37.8	90	131	92	21	2026-03-25 19:17:41.292986
782	2	133	38.7	85	142	104	26	2026-03-25 19:17:41.294015
783	3	88	37.0	95	111	81	19	2026-03-25 19:17:41.294462
784	4	109	37.7	92	133	84	24	2026-03-25 19:17:41.294879
785	5	132	39.1	84	159	99	25	2026-03-25 19:17:41.295384
786	1	121	38.7	85	159	99	27	2026-03-25 19:17:46.350878
787	2	72	36.8	99	110	79	16	2026-03-25 19:17:46.352583
788	3	103	37.7	90	136	90	23	2026-03-25 19:17:46.353449
789	4	130	38.8	84	157	95	25	2026-03-25 19:17:46.354176
790	5	76	37.4	99	116	71	17	2026-03-25 19:17:46.354843
791	1	72	37.0	95	120	77	16	2026-03-25 19:17:51.400466
792	2	113	38.2	90	131	83	24	2026-03-25 19:17:51.401753
793	3	125	39.1	89	150	93	29	2026-03-25 19:17:51.40249
794	4	89	36.6	99	120	72	19	2026-03-25 19:17:51.403279
795	5	118	37.8	93	130	91	22	2026-03-25 19:17:51.403818
796	1	114	38.3	91	138	92	24	2026-03-25 19:19:07.868605
797	2	133	38.6	87	154	105	29	2026-03-25 19:19:07.869439
798	3	84	37.1	98	115	76	18	2026-03-25 19:19:07.869794
799	4	103	38.2	93	132	90	22	2026-03-25 19:19:07.870122
800	5	133	39.5	86	149	104	28	2026-03-25 19:19:07.870387
801	1	130	39.1	89	141	102	28	2026-03-25 19:19:12.912934
802	2	91	36.7	99	118	71	19	2026-03-25 19:19:12.91434
803	3	103	37.7	90	135	87	24	2026-03-25 19:19:12.914927
804	4	135	39.4	87	149	98	25	2026-03-25 19:19:12.915609
805	5	93	37.3	97	118	77	16	2026-03-25 19:19:12.916069
806	1	85	36.7	95	112	78	17	2026-03-25 19:19:17.969902
807	2	105	37.9	94	137	92	24	2026-03-25 19:19:17.970783
808	3	130	38.7	84	160	98	29	2026-03-25 19:19:17.971087
809	4	80	37.0	99	119	82	20	2026-03-25 19:19:17.971399
810	5	106	38.1	92	128	88	23	2026-03-25 19:19:17.971741
811	1	109	38.0	90	134	85	24	2026-03-25 19:19:23.020413
812	2	130	38.8	88	154	100	30	2026-03-25 19:19:23.02216
813	3	84	36.9	98	121	82	18	2026-03-25 19:19:23.023149
814	4	116	38.0	94	135	88	24	2026-03-25 19:19:23.024087
815	5	134	39.4	86	154	101	27	2026-03-25 19:19:23.024926
816	1	133	39.6	89	147	103	26	2026-03-25 19:19:23.809747
817	2	79	36.8	96	123	80	16	2026-03-25 19:19:23.811006
818	3	110	38.1	91	129	92	21	2026-03-25 19:19:23.811586
819	4	133	38.9	86	143	103	25	2026-03-25 19:19:23.812087
820	5	88	36.8	96	123	74	19	2026-03-25 19:19:23.812567
821	1	89	36.9	95	112	77	17	2026-03-25 19:19:24.875291
822	2	113	38.2	91	135	91	24	2026-03-25 19:19:24.876345
823	3	134	39.2	84	155	101	26	2026-03-25 19:19:24.87683
824	4	72	36.5	97	120	75	19	2026-03-25 19:19:24.877244
825	5	115	38.0	93	131	92	24	2026-03-25 19:19:24.877606
826	1	102	38.0	93	134	92	24	2026-03-25 19:19:25.987662
827	2	126	39.3	87	145	98	28	2026-03-25 19:19:25.988726
828	3	93	36.7	99	112	70	16	2026-03-25 19:19:25.989192
829	4	112	37.8	94	137	89	22	2026-03-25 19:19:25.989621
830	5	123	39.0	88	160	101	26	2026-03-25 19:19:25.990002
831	1	126	39.3	86	145	98	30	2026-03-25 19:19:28.08946
832	2	87	36.5	97	124	78	16	2026-03-25 19:19:28.0909
833	3	116	38.3	93	127	87	22	2026-03-25 19:19:28.09163
834	4	130	39.2	86	149	99	30	2026-03-25 19:19:28.092433
835	5	95	36.5	98	123	72	20	2026-03-25 19:19:28.093153
836	1	90	37.2	99	111	70	19	2026-03-25 19:19:29.250772
837	2	104	37.6	90	135	85	24	2026-03-25 19:19:29.251849
838	3	127	38.8	86	159	102	29	2026-03-25 19:19:29.252369
839	4	81	37.1	99	115	81	17	2026-03-25 19:19:29.252841
840	5	103	38.0	94	126	90	24	2026-03-25 19:19:29.253329
841	1	105	37.8	94	139	87	24	2026-03-25 19:19:31.767022
842	2	131	39.4	86	148	95	25	2026-03-25 19:19:31.767972
843	3	94	36.8	98	111	75	16	2026-03-25 19:19:31.768372
844	4	104	37.9	93	138	91	24	2026-03-25 19:19:31.768713
845	5	131	38.8	85	141	100	29	2026-03-25 19:19:31.769039
846	1	134	39.2	88	154	96	25	2026-03-25 19:19:36.346061
847	2	79	36.6	98	124	72	19	2026-03-25 19:19:36.347048
848	3	115	37.7	94	138	86	24	2026-03-25 19:19:36.34744
849	4	123	39.0	88	145	94	29	2026-03-25 19:19:36.34783
850	5	80	36.9	97	122	74	20	2026-03-25 19:19:36.348222
851	1	78	36.8	99	116	77	18	2026-03-25 19:19:39.275233
852	2	113	37.9	90	139	88	22	2026-03-25 19:19:39.276301
853	3	123	39.3	88	155	93	28	2026-03-25 19:19:39.276769
854	4	76	37.4	97	124	75	16	2026-03-25 19:19:39.27719
855	5	112	38.4	91	130	86	23	2026-03-25 19:19:39.277586
856	1	104	38.0	93	131	88	21	2026-03-25 19:19:40.737708
857	2	130	39.4	88	144	98	30	2026-03-25 19:19:40.738693
858	3	95	37.1	98	112	75	17	2026-03-25 19:19:40.739286
859	4	108	38.2	92	139	88	23	2026-03-25 19:19:40.7397
860	5	133	38.9	86	160	101	25	2026-03-25 19:19:40.740111
861	1	129	39.4	89	142	103	29	2026-03-25 19:19:45.796239
862	2	74	36.7	95	119	73	18	2026-03-25 19:19:45.797694
863	3	115	37.8	93	130	92	23	2026-03-25 19:19:45.798427
864	4	125	38.7	87	159	99	27	2026-03-25 19:19:45.799046
865	5	82	36.8	98	110	78	17	2026-03-25 19:19:45.799676
866	1	91	36.8	97	113	82	16	2026-03-25 21:56:54.00141
867	2	107	37.8	94	135	90	23	2026-03-25 21:56:54.002324
868	3	135	39.0	88	159	96	25	2026-03-25 21:56:54.002715
869	4	85	36.7	99	114	81	16	2026-03-25 21:56:54.003077
870	5	106	37.7	92	132	86	22	2026-03-25 21:56:54.003448
871	1	118	38.3	91	134	85	21	2026-03-25 21:56:59.040541
872	2	135	38.8	87	147	99	26	2026-03-25 21:56:59.041736
873	3	83	37.1	97	113	77	19	2026-03-25 21:56:59.042278
874	4	111	38.3	92	131	87	23	2026-03-25 21:56:59.04284
875	5	127	39.5	84	157	99	27	2026-03-25 21:56:59.043384
876	1	122	39.1	86	152	105	29	2026-03-25 21:57:04.093054
877	2	88	36.9	97	119	82	16	2026-03-25 21:57:04.095031
878	3	108	37.9	94	126	88	22	2026-03-25 21:57:04.095743
879	4	133	39.1	89	150	96	25	2026-03-25 21:57:04.096389
880	5	85	37.1	96	113	80	19	2026-03-25 21:57:04.096968
881	1	89	36.5	96	110	79	17	2026-03-25 21:57:09.148359
882	2	101	38.1	92	134	83	21	2026-03-25 21:57:09.149647
883	3	129	39.0	85	157	97	30	2026-03-25 21:57:09.150361
884	4	85	36.6	97	115	81	20	2026-03-25 21:57:09.15091
885	5	116	37.7	94	128	88	23	2026-03-25 21:57:09.151394
886	1	107	38.2	92	132	92	21	2026-03-25 21:57:14.200853
887	2	128	39.5	88	144	99	30	2026-03-25 21:57:14.202267
888	3	82	36.6	95	123	82	17	2026-03-25 21:57:14.202915
889	4	105	37.6	92	137	84	22	2026-03-25 21:57:14.203492
890	5	135	39.6	89	153	100	26	2026-03-25 21:57:14.204062
891	1	123	39.2	85	152	95	26	2026-03-25 21:57:19.259587
892	2	85	37.2	95	119	79	18	2026-03-25 21:57:19.2613
893	3	107	37.9	92	132	83	22	2026-03-25 21:57:19.261776
894	4	129	39.0	86	152	103	25	2026-03-25 21:57:19.26237
895	5	74	36.9	95	122	74	19	2026-03-25 21:57:19.26295
896	1	85	37.2	96	122	77	18	2026-03-25 21:57:24.313377
897	2	113	38.3	91	136	89	22	2026-03-25 21:57:24.314548
898	3	126	39.6	84	153	100	26	2026-03-25 21:57:24.315108
899	4	81	36.9	96	122	82	16	2026-03-25 21:57:24.315642
900	5	111	37.7	93	139	89	23	2026-03-25 21:57:24.316054
901	1	116	37.9	92	134	83	24	2026-03-25 21:57:29.373591
902	2	126	39.4	85	155	93	28	2026-03-25 21:57:29.374934
903	3	88	36.7	97	120	82	18	2026-03-25 21:57:29.375582
904	4	107	38.0	90	126	84	22	2026-03-25 21:57:29.376155
905	5	131	39.6	88	150	102	29	2026-03-25 21:57:29.376684
906	1	124	39.3	89	150	98	27	2026-03-25 21:57:34.435337
907	2	90	37.0	95	122	70	19	2026-03-25 21:57:34.436995
908	3	113	37.8	91	139	91	23	2026-03-25 21:57:34.437794
909	4	125	38.6	88	159	101	25	2026-03-25 21:57:34.4386
910	5	74	37.0	97	117	74	17	2026-03-25 21:57:34.439436
911	1	84	36.5	95	121	79	16	2026-03-25 21:57:39.488653
912	2	112	38.0	91	135	83	21	2026-03-25 21:57:39.489842
913	3	126	38.8	88	160	98	30	2026-03-25 21:57:39.490478
914	4	75	37.4	96	119	72	19	2026-03-25 21:57:39.491065
915	5	117	37.9	94	130	87	24	2026-03-25 21:57:39.491622
916	1	110	37.8	90	127	91	24	2026-03-25 21:57:44.541875
917	2	126	39.1	86	147	94	29	2026-03-25 21:57:44.543245
918	3	85	36.5	97	118	76	20	2026-03-25 21:57:44.543912
919	4	112	37.7	93	128	87	22	2026-03-25 21:57:44.544545
920	5	127	38.6	85	150	101	26	2026-03-25 21:57:44.545092
921	1	127	38.6	89	147	104	30	2026-03-25 21:57:49.602224
922	2	81	36.8	97	123	81	19	2026-03-25 21:57:49.603384
923	3	104	37.7	91	139	92	21	2026-03-25 21:57:49.603968
924	4	132	38.7	86	143	102	30	2026-03-25 21:57:49.604484
925	5	92	37.1	96	120	74	16	2026-03-25 21:57:49.60496
926	1	75	37.0	97	111	74	19	2026-03-25 21:57:54.655591
927	2	113	38.2	90	136	89	21	2026-03-25 21:57:54.656655
928	3	131	39.0	89	160	101	25	2026-03-25 21:57:54.657086
929	4	92	37.1	96	124	72	18	2026-03-25 21:57:54.657531
930	5	103	38.2	93	128	85	22	2026-03-25 21:57:54.657893
931	1	101	38.0	90	126	84	24	2026-03-25 21:57:59.71229
932	2	128	39.4	88	141	105	30	2026-03-25 21:57:59.713444
933	3	86	37.2	96	119	79	20	2026-03-25 21:57:59.713995
934	4	104	37.7	94	130	87	21	2026-03-25 21:57:59.71439
935	5	128	39.1	85	145	103	28	2026-03-25 21:57:59.714859
936	1	129	38.6	87	147	105	28	2026-03-25 21:58:04.760236
937	2	93	37.1	95	112	74	16	2026-03-25 21:58:04.761804
938	3	103	38.2	94	140	92	23	2026-03-25 21:58:04.762628
939	4	133	39.0	89	160	98	28	2026-03-25 21:58:04.763367
940	5	95	36.9	95	110	77	16	2026-03-25 21:58:04.764014
941	1	94	36.5	96	124	70	16	2026-03-25 21:58:09.818766
942	2	104	37.6	92	129	85	22	2026-03-25 21:58:09.820351
943	3	132	39.1	88	145	93	27	2026-03-25 21:58:09.821053
944	4	73	37.1	96	115	79	19	2026-03-25 21:58:09.821886
945	5	105	37.9	94	133	88	23	2026-03-25 21:58:09.822897
946	1	115	37.7	90	133	83	21	2026-03-25 21:58:14.878264
947	2	132	39.4	84	148	99	30	2026-03-25 21:58:14.879936
948	3	77	36.7	95	116	77	19	2026-03-25 21:58:14.880677
949	4	110	38.2	93	126	89	23	2026-03-25 21:58:14.881541
950	5	135	39.2	87	149	99	26	2026-03-25 21:58:14.882009
951	1	124	39.4	86	152	95	30	2026-03-29 21:29:12.189498
952	2	83	37.0	97	115	81	17	2026-03-29 21:29:12.190857
953	3	101	38.0	94	136	84	22	2026-03-29 21:29:12.191477
954	4	130	39.1	87	148	95	28	2026-03-29 21:29:12.192156
955	5	86	37.3	95	121	76	17	2026-03-29 21:29:12.192673
956	1	79	36.8	99	111	77	19	2026-03-29 21:29:32.233001
957	2	111	37.8	93	128	87	21	2026-03-29 21:29:32.234285
958	3	133	39.1	88	146	99	29	2026-03-29 21:29:32.235003
959	4	82	37.1	98	123	73	20	2026-03-29 21:29:32.235832
960	5	105	38.0	90	131	90	24	2026-03-29 21:29:32.236487
\.


--
-- TOC entry 3730 (class 0 OID 0)
-- Dependencies: 219
-- Name: alerts_alert_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.alerts_alert_id_seq', 596, true);


--
-- TOC entry 3731 (class 0 OID 0)
-- Dependencies: 215
-- Name: patients_patient_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.patients_patient_id_seq', 5, true);


--
-- TOC entry 3732 (class 0 OID 0)
-- Dependencies: 217
-- Name: vital_signs_vital_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vital_signs_vital_id_seq', 960, true);


--
-- TOC entry 3570 (class 2606 OID 16983)
-- Name: alerts alerts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alerts
    ADD CONSTRAINT alerts_pkey PRIMARY KEY (alert_id);


--
-- TOC entry 3566 (class 2606 OID 16962)
-- Name: patients patients_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.patients
    ADD CONSTRAINT patients_pkey PRIMARY KEY (patient_id);


--
-- TOC entry 3568 (class 2606 OID 16970)
-- Name: vital_signs vital_signs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vital_signs
    ADD CONSTRAINT vital_signs_pkey PRIMARY KEY (vital_id);


--
-- TOC entry 3572 (class 2606 OID 16984)
-- Name: alerts alerts_patient_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alerts
    ADD CONSTRAINT alerts_patient_id_fkey FOREIGN KEY (patient_id) REFERENCES public.patients(patient_id) ON DELETE CASCADE;


--
-- TOC entry 3571 (class 2606 OID 16971)
-- Name: vital_signs vital_signs_patient_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vital_signs
    ADD CONSTRAINT vital_signs_patient_id_fkey FOREIGN KEY (patient_id) REFERENCES public.patients(patient_id) ON DELETE CASCADE;


-- Completed on 2026-03-30 11:41:02 CEST

--
-- PostgreSQL database dump complete
--

\unrestrict hq2t0WCffj3DcZ9azsFeZhAp7AVc7kE4iSuQqET5XxjxH55fE2dVfdS6cUAgjYs

