--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    username character varying(22) NOT NULL,
    tries integer
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    username character varying(22) NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 'user_1691721287528', 661);
INSERT INTO public.games VALUES (2, 'user_1691721287528', 525);
INSERT INTO public.games VALUES (3, 'user_1691721287527', 182);
INSERT INTO public.games VALUES (4, 'user_1691721287527', 236);
INSERT INTO public.games VALUES (5, 'user_1691721287528', 604);
INSERT INTO public.games VALUES (6, 'user_1691721287528', 883);
INSERT INTO public.games VALUES (7, 'user_1691721287528', 508);
INSERT INTO public.games VALUES (8, 'user_1691721337766', 507);
INSERT INTO public.games VALUES (9, 'user_1691721337766', 849);
INSERT INTO public.games VALUES (10, 'user_1691721337765', 537);
INSERT INTO public.games VALUES (11, 'user_1691721337765', 470);
INSERT INTO public.games VALUES (12, 'user_1691721337766', 37);
INSERT INTO public.games VALUES (13, 'user_1691721337766', 761);
INSERT INTO public.games VALUES (14, 'user_1691721337766', 860);
INSERT INTO public.games VALUES (15, 'user_1691721402265', 472);
INSERT INTO public.games VALUES (16, 'user_1691721402265', 720);
INSERT INTO public.games VALUES (17, 'user_1691721402264', 670);
INSERT INTO public.games VALUES (18, 'user_1691721402264', 650);
INSERT INTO public.games VALUES (19, 'user_1691721402265', 178);
INSERT INTO public.games VALUES (20, 'user_1691721402265', 123);
INSERT INTO public.games VALUES (21, 'user_1691721402265', 291);
INSERT INTO public.games VALUES (22, 'user_1691721437100', 711);
INSERT INTO public.games VALUES (23, 'user_1691721437100', 695);
INSERT INTO public.games VALUES (24, 'user_1691721437099', 790);
INSERT INTO public.games VALUES (25, 'user_1691721437099', 404);
INSERT INTO public.games VALUES (26, 'user_1691721437100', 856);
INSERT INTO public.games VALUES (27, 'user_1691721437100', 92);
INSERT INTO public.games VALUES (28, 'user_1691721437100', 475);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES ('tatey');
INSERT INTO public.users VALUES ('user_1691712219757');
INSERT INTO public.users VALUES ('user_1691712219756');
INSERT INTO public.users VALUES ('user_1691721287528');
INSERT INTO public.users VALUES ('user_1691721287527');
INSERT INTO public.users VALUES ('user_1691721337766');
INSERT INTO public.users VALUES ('user_1691721337765');
INSERT INTO public.users VALUES ('user_1691721402265');
INSERT INTO public.users VALUES ('user_1691721402264');
INSERT INTO public.users VALUES ('user_1691721437100');
INSERT INTO public.users VALUES ('user_1691721437099');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 28, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (username);


--
-- Name: games games_username_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_username_fkey FOREIGN KEY (username) REFERENCES public.users(username) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

