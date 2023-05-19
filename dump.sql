--
-- PostgreSQL database dump
--

-- Dumped from database version 12.14 (Ubuntu 12.14-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.14 (Ubuntu 12.14-0ubuntu0.20.04.1)

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
-- Name: sessions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sessions (
    id integer NOT NULL,
    "sessionToken" text NOT NULL,
    "userId" text NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sessions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sessions_id_seq OWNED BY public.sessions.id;


--
-- Name: urls; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.urls (
    id integer NOT NULL,
    url text NOT NULL,
    "shortUrl" text NOT NULL,
    "userId" text NOT NULL,
    "visitCount" integer DEFAULT 0 NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: urls_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.urls_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: urls_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.urls_id_seq OWNED BY public.urls.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name text NOT NULL,
    email text NOT NULL,
    password text NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: sessions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions ALTER COLUMN id SET DEFAULT nextval('public.sessions_id_seq'::regclass);


--
-- Name: urls id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls ALTER COLUMN id SET DEFAULT nextval('public.urls_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.sessions VALUES (1, '5ae99aa4-85ad-4d74-9730-66841d594bdc', '2', '2023-05-19 11:10:36.429606');
INSERT INTO public.sessions VALUES (2, 'cbcbf405-c7f2-4df2-ae00-673ea87e0bfa', '1', '2023-05-19 11:10:41.416934');


--
-- Data for Name: urls; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.urls VALUES (3, 'https://gin111', 'sLcRvAgb', '1', 0, '2023-05-19 11:14:13.832711');
INSERT INTO public.urls VALUES (4, 'https://gin2', 'TVUDr4pH', '2', 0, '2023-05-19 11:14:32.846944');
INSERT INTO public.urls VALUES (5, 'https://gin22', 'l9WTMdt5', '2', 0, '2023-05-19 11:14:35.127447');
INSERT INTO public.urls VALUES (6, 'https://gin222', 'DxU60zCq', '2', 3, '2023-05-19 11:14:36.858673');
INSERT INTO public.urls VALUES (1, 'https://gin1', 'v1vjk0wj', '1', 2, '2023-05-19 11:14:04.277073');
INSERT INTO public.urls VALUES (2, 'https://gin11', 'iQV9jkrY', '1', 2, '2023-05-19 11:14:09.944497');


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users VALUES (1, 'Gin', 'gin@gin.com', '$2b$10$KphmD6TXzQ.5mNsLquyPM.8t/ad1pho4b7HyjIg3427tjvcUMdsAy', '2023-05-19 11:07:16.981389');
INSERT INTO public.users VALUES (2, 'Gin2', 'gin2@gin.com', '$2b$10$n2l1DELLe1zM0Dv3PqMTPebq59yZEhKJgi1WiLVwLLej9RU60L9zO', '2023-05-19 11:07:27.072776');


--
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sessions_id_seq', 2, true);


--
-- Name: urls_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.urls_id_seq', 6, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 2, true);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: urls urls_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls
    ADD CONSTRAINT urls_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

