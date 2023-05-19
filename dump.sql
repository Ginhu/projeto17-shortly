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
    "userId" integer NOT NULL,
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
    "userId" integer NOT NULL,
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

INSERT INTO public.sessions VALUES (1, '4f8dc34f-3f0f-4780-8bd1-b507ab94a46b', 1, '2023-05-19 13:01:38.654151');
INSERT INTO public.sessions VALUES (2, '05a2bd80-5e66-4820-962a-1e9669eb137f', 2, '2023-05-19 13:01:49.32749');
INSERT INTO public.sessions VALUES (3, '7d2a903d-58fd-4a01-9041-44384eab4195', 11, '2023-05-19 16:15:58.004481');


--
-- Data for Name: urls; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.urls VALUES (1, 'https://gin1', 'OfyWDlYI', 1, 4, '2023-05-19 13:10:41.025136');
INSERT INTO public.urls VALUES (5, 'https://gin2', 'l3jYz3Hu', 2, 0, '2023-05-19 13:27:23.204813');
INSERT INTO public.urls VALUES (6, 'https://gin2', '4lu3LD3f', 2, 0, '2023-05-19 13:27:26.66638');
INSERT INTO public.urls VALUES (4, 'https://gin2', 'xtVmr8Om', 2, 1, '2023-05-19 13:27:17.980796');
INSERT INTO public.urls VALUES (3, 'https://gin1', 'a0SIk1uO', 1, 3, '2023-05-19 13:11:19.212537');
INSERT INTO public.urls VALUES (2, 'https://gin1', 'A6fJT0u8', 1, 1, '2023-05-19 13:11:09.796808');
INSERT INTO public.urls VALUES (7, 'https://gin2', 'bkOVRWPf', 2, 5, '2023-05-19 13:27:30.857299');
INSERT INTO public.urls VALUES (9, 'https://gin11', 'FGShl46Q', 11, 1, '2023-05-19 16:17:35.674962');
INSERT INTO public.urls VALUES (8, 'https://gin111', 'F4fmpyBT', 11, 1, '2023-05-19 16:16:21.922176');


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users VALUES (1, 'Gin', 'gin@gin.com', '$2b$10$/KAHq.kgvxNqWqJz39JdnekZVqbz9VLhVAurK9vxgERWozMVKt4QW', '2023-05-19 13:01:18.446545');
INSERT INTO public.users VALUES (2, 'Gin2', 'gin.2@gin.com', '$2b$10$H4vkEzzwlrBjPr6JoWS3Lu3.MLku3Y3nDVSGbsf28nsOqSEXp68NK', '2023-05-19 13:01:30.817034');
INSERT INTO public.users VALUES (3, 'Gin3', 'gin3@gin.com', '$2b$10$.5ANSmSFZmC80K541Ika8.a9jPUcheWlcJSAZJuqsPQhKFMunNr3K', '2023-05-19 16:03:35.694563');
INSERT INTO public.users VALUES (4, 'Gin4', 'gin4@gin.com', '$2b$10$NkHfRSEwD5LMDK/R51pVSebPRKE9vnOUE6jpYUA0hcyBNl/LLGA6i', '2023-05-19 16:03:42.241768');
INSERT INTO public.users VALUES (5, 'Gin5', 'gin5@gin.com', '$2b$10$nkCh8rj5WpAyaAVgyzygruD1XSerwKkjlGP1pgkcnhMjPYO2NOy.y', '2023-05-19 16:03:50.045618');
INSERT INTO public.users VALUES (6, 'Gin6', 'gin6@gin.com', '$2b$10$k04rJBE6q3UlKnRkUe.KP.ypRsBrLf8dGoqJPGb.9UyQAUflcHOcq', '2023-05-19 16:03:55.167554');
INSERT INTO public.users VALUES (7, 'Gin7', 'gin7@gin.com', '$2b$10$5yXBJpidYXBatocaQYjKMe4gAFz6eFP/CzTAATYgR8AjW2VH4mCDi', '2023-05-19 16:04:00.786577');
INSERT INTO public.users VALUES (8, 'Gin8', 'gin8@gin.com', '$2b$10$efkRfzkYgRdWvzjjxiYWGeKCcSWT16cMk9QfcYlhbYk7RnyrpoavO', '2023-05-19 16:04:07.880742');
INSERT INTO public.users VALUES (9, 'Gin9', 'gin9@gin.com', '$2b$10$mOEIqKZm9Hd/tbZgv1hYIulNzrvvIlqyifgU/Zz00LsJg/IX3UwYy', '2023-05-19 16:04:13.968925');
INSERT INTO public.users VALUES (10, 'Gin10', 'gin10@gin.com', '$2b$10$9jDO0WZpORhWvjumBjiBOeNxAasau1w86z.ZcXLyFgCVx0Yay46ry', '2023-05-19 16:04:19.861014');
INSERT INTO public.users VALUES (11, 'Gin11', 'gin11@gin.com', '$2b$10$Fgv2nXy7ukr.v283fjSPeeJ1S6Ol4FNUaATf4gFcnxlALxihxexCy', '2023-05-19 16:04:24.981922');


--
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sessions_id_seq', 3, true);


--
-- Name: urls_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.urls_id_seq', 9, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 11, true);


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
-- Name: sessions users_fk0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT users_fk0 FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- Name: urls users_fk0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls
    ADD CONSTRAINT users_fk0 FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

