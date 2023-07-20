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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    color character varying(20),
    galtype_id integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: galtype; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galtype (
    galtype_id integer NOT NULL,
    name character varying(30) NOT NULL,
    shape character varying(30)
);


ALTER TABLE public.galtype OWNER TO freecodecamp;

--
-- Name: galtype_galtype_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galtype_galtype_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galtype_galtype_id_seq OWNER TO freecodecamp;

--
-- Name: galtype_galtype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galtype_galtype_id_seq OWNED BY public.galtype.galtype_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planet_id integer,
    is_spherical boolean,
    distance_from_earth numeric(10,3)
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    star_id integer,
    has_life boolean,
    age_in_millions_of_years integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_id integer,
    color character varying(20),
    light_years_from_earth numeric(10,3)
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: galtype galtype_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galtype ALTER COLUMN galtype_id SET DEFAULT nextval('public.galtype_galtype_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Its the Galaxy that contains our solar system.', 'bluish-white', 1);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Its the closest galaxy to the Milky Way. Its larger than our galaxy.', 'whitish', 1);
INSERT INTO public.galaxy VALUES (3, 'Sombrero', 'Distinctive galaxy with a prominent dust lane', 'yellowish', 1);
INSERT INTO public.galaxy VALUES (4, 'Centaurus', 'Located in the constelation Centaurus', 'reddish-brown', 2);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 'Its known for its well-defined spiral arms', 'blue and reddish', 1);
INSERT INTO public.galaxy VALUES (6, 'Cartwhell', 'Unique and striking galaxy with a distinct cartwheel shape', 'blue and reddish', 4);


--
-- Data for Name: galtype; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galtype VALUES (1, 'spiral', 'disk with arms');
INSERT INTO public.galtype VALUES (2, 'elliptical', 'oval');
INSERT INTO public.galtype VALUES (3, 'irregular', NULL);
INSERT INTO public.galtype VALUES (4, 'Ring', NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 3, true, 384400.000);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, false, 400.000);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, false, 400.000);
INSERT INTO public.moon VALUES (4, 'Ganymede', 5, true, 928.000);
INSERT INTO public.moon VALUES (5, 'Europa', 5, true, 928.000);
INSERT INTO public.moon VALUES (6, 'Io', 5, true, 928.000);
INSERT INTO public.moon VALUES (7, 'Titan', 6, true, 1.600);
INSERT INTO public.moon VALUES (8, 'Enceladus', 6, true, 1.600);
INSERT INTO public.moon VALUES (9, 'Miranda', 7, false, 3.200);
INSERT INTO public.moon VALUES (10, 'Triton', 8, true, 4.700);
INSERT INTO public.moon VALUES (11, 'Callisto', 5, true, 928.000);
INSERT INTO public.moon VALUES (12, 'Rhea', 6, true, 1.600);
INSERT INTO public.moon VALUES (13, 'Dione', 6, true, 1.600);
INSERT INTO public.moon VALUES (14, 'Tethys', 6, true, 1.600);
INSERT INTO public.moon VALUES (15, 'Iapetus', 6, false, 1.600);
INSERT INTO public.moon VALUES (16, 'Titania', 7, true, 3.200);
INSERT INTO public.moon VALUES (17, 'Oberon', 7, true, 3.200);
INSERT INTO public.moon VALUES (18, 'Proteus', 8, false, 4.700);
INSERT INTO public.moon VALUES (19, 'Nereid', 8, false, 4.700);
INSERT INTO public.moon VALUES (20, 'Charon', 9, true, 7.500);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (12, 'Proxima Centauri b', 3, false, 6000);
INSERT INTO public.planet VALUES (1, 'Mercury', 7, false, 4600);
INSERT INTO public.planet VALUES (2, 'Venus', 7, false, 4600);
INSERT INTO public.planet VALUES (3, 'Earth', 7, true, 4600);
INSERT INTO public.planet VALUES (4, 'Mars', 7, false, 4600);
INSERT INTO public.planet VALUES (5, 'Jupiter', 7, false, 4600);
INSERT INTO public.planet VALUES (6, 'Saturn', 7, false, 4600);
INSERT INTO public.planet VALUES (7, 'Uranus', 7, false, 4600);
INSERT INTO public.planet VALUES (8, 'Neptune', 7, false, 4600);
INSERT INTO public.planet VALUES (9, 'Pluto', 7, false, 4600);
INSERT INTO public.planet VALUES (10, 'Kepler-452b', 8, false, 6000);
INSERT INTO public.planet VALUES (11, 'Trappist-1e', 9, false, 5000);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Betelgeuse', 1, 'reddish-orange', 860.000);
INSERT INTO public.star VALUES (2, 'Rigel', 1, 'bluish-white', 860.000);
INSERT INTO public.star VALUES (3, 'Proxima Centauri', 1, 'reddish', 4.240);
INSERT INTO public.star VALUES (4, 'Alpha Centauri A', 1, 'yellowish-white', 4.370);
INSERT INTO public.star VALUES (5, 'Arcturus', 1, 'reddish-orange', 37.000);
INSERT INTO public.star VALUES (6, 'Alpheratz', 2, 'white', 97.000);
INSERT INTO public.star VALUES (7, 'Sun', 1, 'yellowish-white', 0.000);
INSERT INTO public.star VALUES (8, 'Kepler-452', 1, 'yellowish-white', 1800.000);
INSERT INTO public.star VALUES (9, 'Trappist-1', 1, 'reddish', 39.000);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: galtype_galtype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galtype_galtype_id_seq', 4, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 9, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galtype galtype_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galtype
    ADD CONSTRAINT galtype_name_key UNIQUE (name);


--
-- Name: galtype galtype_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galtype
    ADD CONSTRAINT galtype_pkey PRIMARY KEY (galtype_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--
