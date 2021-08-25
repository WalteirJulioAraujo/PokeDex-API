--
-- PostgreSQL database dump
--

-- Dumped from database version 12.7 (Ubuntu 12.7-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.7 (Ubuntu 12.7-0ubuntu0.20.04.1)

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
-- Name: migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    "timestamp" bigint NOT NULL,
    name character varying NOT NULL
);


--
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- Name: mypokemons; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.mypokemons (
    id integer NOT NULL,
    "userId" integer NOT NULL,
    "pokemonId" integer NOT NULL
);


--
-- Name: mypokemons_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.mypokemons_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: mypokemons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.mypokemons_id_seq OWNED BY public.mypokemons.id;


--
-- Name: pokemons; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.pokemons (
    id integer NOT NULL,
    name character varying NOT NULL,
    number integer NOT NULL,
    image character varying NOT NULL,
    weight integer NOT NULL,
    height integer NOT NULL,
    "baseExp" integer NOT NULL,
    description character varying NOT NULL,
    "inMyPokemons" boolean NOT NULL
);


--
-- Name: pokemons_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.pokemons_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pokemons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.pokemons_id_seq OWNED BY public.pokemons.id;


--
-- Name: sessions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sessions (
    id integer NOT NULL,
    token character varying NOT NULL,
    "userId" integer NOT NULL
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
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id integer NOT NULL,
    email character varying NOT NULL,
    password character varying NOT NULL
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
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- Name: mypokemons id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mypokemons ALTER COLUMN id SET DEFAULT nextval('public.mypokemons_id_seq'::regclass);


--
-- Name: pokemons id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pokemons ALTER COLUMN id SET DEFAULT nextval('public.pokemons_id_seq'::regclass);


--
-- Name: sessions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions ALTER COLUMN id SET DEFAULT nextval('public.sessions_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.migrations VALUES (1, 1628204784823, 'TabelaUser1628204784823');
INSERT INTO public.migrations VALUES (2, 1628247035431, 'sessionsTable1628247035431');
INSERT INTO public.migrations VALUES (3, 1628249826087, 'TabelaSessions1628249826087');
INSERT INTO public.migrations VALUES (4, 1628255128176, 'TabelaPokemons1628255128176');
INSERT INTO public.migrations VALUES (5, 1628257220882, 'TabelaMyPokemons1628257220882');
INSERT INTO public.migrations VALUES (6, 1628284229488, 'TabelaMyPokemons1628284229488');


--
-- Data for Name: mypokemons; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: pokemons; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.pokemons VALUES (3, 'bulbasaur', 1, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png', 69, 7, 64, 'Loves to eat', false);
INSERT INTO public.pokemons VALUES (4, 'ivysaur', 2, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/2.png', 130, 10, 142, 'Proud of its power', false);
INSERT INTO public.pokemons VALUES (5, 'venusaur', 3, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/3.png', 1000, 20, 236, 'Sturdy body', false);
INSERT INTO public.pokemons VALUES (6, 'charmander', 5, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/4.png', 85, 6, 62, 'Highly curious', false);
INSERT INTO public.pokemons VALUES (7, 'charmeleon', 6, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/5.png', 190, 11, 142, 'Strong willed', false);
INSERT INTO public.pokemons VALUES (8, 'charizard', 7, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/6.png', 905, 17, 240, 'Likes to run', false);
INSERT INTO public.pokemons VALUES (9, 'squirtle', 10, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/7.png', 90, 5, 63, 'Takes plenty of siestas', false);
INSERT INTO public.pokemons VALUES (10, 'wartortle', 11, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/8.png', 225, 10, 142, 'Likes to thrash about', false);
INSERT INTO public.pokemons VALUES (11, 'blastoise', 12, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/9.png', 855, 16, 239, 'Capable of taking hits', false);
INSERT INTO public.pokemons VALUES (12, 'caterpie', 14, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/10.png', 29, 3, 39, 'Mischievous', false);
INSERT INTO public.pokemons VALUES (13, 'metapod', 15, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/11.png', 99, 7, 72, 'Somewhat vain', false);
INSERT INTO public.pokemons VALUES (14, 'butterfree', 16, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/12.png', 320, 11, 178, 'Alert to sounds', false);
INSERT INTO public.pokemons VALUES (15, 'weedle', 17, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/13.png', 32, 3, 39, 'Nods off a lot', false);
INSERT INTO public.pokemons VALUES (16, 'kakuna', 18, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/14.png', 100, 6, 72, 'A little quick tempered', false);
INSERT INTO public.pokemons VALUES (17, 'beedrill', 19, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/15.png', 295, 10, 178, 'Highly persistent', false);
INSERT INTO public.pokemons VALUES (18, 'pidgey', 21, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/16.png', 18, 3, 50, 'Thoroughly cunning', false);
INSERT INTO public.pokemons VALUES (19, 'pidgeotto', 22, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/17.png', 300, 11, 122, 'Strongly defiant', false);
INSERT INTO public.pokemons VALUES (20, 'pidgeot', 23, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/18.png', 395, 15, 216, 'Impetuous and silly', false);
INSERT INTO public.pokemons VALUES (21, 'rattata', 25, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/19.png', 35, 3, 51, 'Scatters things often', false);
INSERT INTO public.pokemons VALUES (22, 'raticate', 27, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/20.png', 185, 7, 145, 'Likes to fight', false);
INSERT INTO public.pokemons VALUES (23, 'spearow', 30, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/21.png', 20, 3, 52, 'Good endurance', false);
INSERT INTO public.pokemons VALUES (24, 'fearow', 31, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/22.png', 380, 12, 155, 'Often lost in thought', false);
INSERT INTO public.pokemons VALUES (25, 'ekans', 32, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/23.png', 69, 20, 58, 'Hates to lose', false);
INSERT INTO public.pokemons VALUES (26, 'arbok', 33, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/24.png', 650, 35, 157, 'Somewhat of a clown', false);
INSERT INTO public.pokemons VALUES (27, 'pikachu', 35, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/25.png', 60, 4, 112, 'Likes to relax', false);
INSERT INTO public.pokemons VALUES (28, 'raichu', 49, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/26.png', 300, 8, 218, 'Quick tempered', false);
INSERT INTO public.pokemons VALUES (29, 'sandshrew', 51, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/27.png', 120, 6, 60, 'Good perseverance', false);
INSERT INTO public.pokemons VALUES (30, 'sandslash', 53, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/28.png', 295, 10, 158, 'Very finicky', false);
INSERT INTO public.pokemons VALUES (31, 'nidoran-f', 55, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/29.png', 70, 4, 55, 'Somewhat stubborn', false);
INSERT INTO public.pokemons VALUES (32, 'nidorina', 56, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/30.png', 200, 8, 128, 'Quick to flee', false);


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users VALUES (166, 'email@email.com', '$2b$10$mwyuK3a2babMhAedo0LMXeT6eV62EKDFcMpktwCch99ybvgxl./UG');


--
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.migrations_id_seq', 6, true);


--
-- Name: mypokemons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.mypokemons_id_seq', 12, true);


--
-- Name: pokemons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.pokemons_id_seq', 32, true);


--
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sessions_id_seq', 83, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 166, true);


--
-- Name: sessions PK_3238ef96f18b355b671619111bc; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT "PK_3238ef96f18b355b671619111bc" PRIMARY KEY (id);


--
-- Name: migrations PK_8c82d7f526340ab734260ea46be; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT "PK_8c82d7f526340ab734260ea46be" PRIMARY KEY (id);


--
-- Name: pokemons PK_a3172290413af616d9cfa1fdc9a; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pokemons
    ADD CONSTRAINT "PK_a3172290413af616d9cfa1fdc9a" PRIMARY KEY (id);


--
-- Name: users PK_a3ffb1c0c8416b9fc6f907b7433; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT "PK_a3ffb1c0c8416b9fc6f907b7433" PRIMARY KEY (id);


--
-- Name: mypokemons PK_c4d9f0c6018ec29102a85384953; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mypokemons
    ADD CONSTRAINT "PK_c4d9f0c6018ec29102a85384953" PRIMARY KEY (id);


--
-- Name: sessions REL_57de40bc620f456c7311aa3a1e; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT "REL_57de40bc620f456c7311aa3a1e" UNIQUE ("userId");


--
-- Name: mypokemons FK_53bdd64c7ed91f4de93150cf9ad; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mypokemons
    ADD CONSTRAINT "FK_53bdd64c7ed91f4de93150cf9ad" FOREIGN KEY ("pokemonId") REFERENCES public.pokemons(id);


--
-- Name: sessions FK_57de40bc620f456c7311aa3a1e6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT "FK_57de40bc620f456c7311aa3a1e6" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- Name: mypokemons FK_7c5ded55b40a01faae029cdd2fa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mypokemons
    ADD CONSTRAINT "FK_7c5ded55b40a01faae029cdd2fa" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

