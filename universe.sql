--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
    description text,
    galaxy_types_id integer,
    distances_from_earth_yearlight numeric,
    name character varying NOT NULL,
    CONSTRAINT galaxy_check CHECK ((NOT NULL::boolean))
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
-- Name: galaxy_types; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_types (
    galaxy_types_id integer NOT NULL,
    name character varying NOT NULL,
    sub integer
);


ALTER TABLE public.galaxy_types OWNER TO freecodecamp;

--
-- Name: galaxy_types_types_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_types_types_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_types_types_seq OWNER TO freecodecamp;

--
-- Name: galaxy_types_types_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_types_types_seq OWNED BY public.galaxy_types.galaxy_types_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying NOT NULL,
    distances_from_earth numeric,
    planet_id integer,
    description text
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
    name character varying NOT NULL,
    star_id integer,
    has_life boolean,
    has_moon boolean,
    num_moons integer,
    distances_from_earth integer
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
    galaxy_id integer,
    name character varying NOT NULL,
    distances_from_earth numeric,
    description text
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
-- Name: galaxy_types galaxy_types_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types ALTER COLUMN galaxy_types_id SET DEFAULT nextval('public.galaxy_types_types_seq'::regclass);


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

INSERT INTO public.galaxy VALUES (1, 'galaxia que alberga a la tierra', 3, NULL, 'Via lactea');
INSERT INTO public.galaxy VALUES (2, 'satelite de la via lactea', 1, 0.081, 'Enana eliptica de Sagitario');
INSERT INTO public.galaxy VALUES (3, 'satelite de la via lactea', 3, 1.63, 'Gran nube de Magallanes');
INSERT INTO public.galaxy VALUES (4, 'satelite de la via lactea', 3, 0.206, 'Pequeña nube de Magallanes');
INSERT INTO public.galaxy VALUES (5, 'satelite de la via lactea', 1, 0.206, 'Enana de la osa menor');
INSERT INTO public.galaxy VALUES (6, 'satelite de la via lactea', 2, 0.281, 'Enana de Sextan');


--
-- Data for Name: galaxy_types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_types VALUES (1, 'elliptical', NULL);
INSERT INTO public.galaxy_types VALUES (2, 'lenticulars', NULL);
INSERT INTO public.galaxy_types VALUES (3, 'spirals', NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'luna', 384, 1, 'la luna');
INSERT INTO public.moon VALUES (2, 'deimos', NULL, 4, 'la luna de marte');
INSERT INTO public.moon VALUES (3, 'fobos', NULL, 4, 'la luna de marte');
INSERT INTO public.moon VALUES (4, 'andrastea', NULL, 5, 'satelite de jupiter');
INSERT INTO public.moon VALUES (5, 'europa', NULL, 5, 'satelite de jupiter');
INSERT INTO public.moon VALUES (6, 'carpo', NULL, 5, 'satelite de jupiter');
INSERT INTO public.moon VALUES (7, 'celine', NULL, 5, 'satelite de jupiter');
INSERT INTO public.moon VALUES (8, 'tebe', NULL, 5, 'satelite de jupiter');
INSERT INTO public.moon VALUES (9, 'Elara', NULL, 5, 'satelite de jupiter');
INSERT INTO public.moon VALUES (10, 'Euporia', NULL, 5, 'satelite de jupiter');
INSERT INTO public.moon VALUES (11, 'calisto', NULL, 5, 'satelite de jupiter');
INSERT INTO public.moon VALUES (12, 'arce', NULL, 5, 'satelite de jupiter');
INSERT INTO public.moon VALUES (13, 'hersee', NULL, 5, 'satelite de jupiter');
INSERT INTO public.moon VALUES (14, 'temisto', NULL, 5, 'satelite de jupiter');
INSERT INTO public.moon VALUES (15, 'tione', NULL, 5, 'satelite de jupiter');
INSERT INTO public.moon VALUES (16, 'yocasta', NULL, 5, 'satelite de jupiter');
INSERT INTO public.moon VALUES (17, 'pandora', NULL, 6, 'satelite de jupiter');
INSERT INTO public.moon VALUES (18, 'tetis', NULL, 6, 'satelite de jupiter');
INSERT INTO public.moon VALUES (19, 'rea', NULL, 6, 'satelite de jupiter');
INSERT INTO public.moon VALUES (20, 'febe', NULL, 6, 'satelite de jupiter');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (8, 'neptuno', 1, false, true, 14, 4351);
INSERT INTO public.planet VALUES (9, 'K2-18 b', 2, false, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (10, 'Centauri b', 2, false, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (11, 'TRAPPIST-1e', 2, false, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (12, 'GJ 357 cyd', 2, false, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (13, 'HIP 65426 b', 2, false, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (14, 'GJ 357 c', 2, false, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (15, 'GJ 357 a', 2, false, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (16, 'GJ 357 b', 2, false, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (17, 'HIP 65426 a', 2, false, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (18, 'Centauri a', 2, false, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (19, 'Wolf 1069 b', 2, false, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (20, 'Wolf 1069 a', 2, false, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (21, 'TRAPPIST-1f', 2, false, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (1, 'tierra', 1, true, true, 1, NULL);
INSERT INTO public.planet VALUES (2, 'mercurio', 1, false, false, 0, 77);
INSERT INTO public.planet VALUES (3, 'venus', 1, false, false, 0, 61);
INSERT INTO public.planet VALUES (4, 'martes', 1, false, true, 2, 225);
INSERT INTO public.planet VALUES (5, 'jupiter', 1, false, true, 79, 590);
INSERT INTO public.planet VALUES (6, 'saturno', 1, false, true, 82, 1426);
INSERT INTO public.planet VALUES (7, 'urano', 1, false, true, 27, 2721);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 'Sol', NULL, 'estrella del sistema solar de la tierra');
INSERT INTO public.star VALUES (2, 2, 'Kaus Australisl', 145, 'estrella mas brillante de sagitario');
INSERT INTO public.star VALUES (3, 3, 's doradus', 180, 'estrella mas brillante de la enana de magallanes');
INSERT INTO public.star VALUES (4, 4, 'polaris', 431, 'estrella mas conocida de la osa menor');
INSERT INTO public.star VALUES (5, 5, 'Kochab', 129, 'estrella de la osa menor');
INSERT INTO public.star VALUES (6, 5, 'Ursae Minoris', 390, 'estrella de la osa menor');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: galaxy_types_types_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_types_types_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 21, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy_types galaxy_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types
    ADD CONSTRAINT galaxy_types_pkey PRIMARY KEY (galaxy_types_id);


--
-- Name: galaxy_types galaxy_types_sub_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types
    ADD CONSTRAINT galaxy_types_sub_key UNIQUE (sub);


--
-- Name: galaxy_types galaxy_types_types_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types
    ADD CONSTRAINT galaxy_types_types_key UNIQUE (galaxy_types_id);


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
-- Name: star unico; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unico UNIQUE (name);


--
-- Name: galaxy unico1; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unico1 UNIQUE (name);


--
-- Name: galaxy unico2; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unico2 UNIQUE (name);


--
-- Name: galaxy_types unico3; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types
    ADD CONSTRAINT unico3 UNIQUE (name);


--
-- Name: planet unico4; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unico4 UNIQUE (name);


--
-- Name: moon unico5; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unico5 UNIQUE (name);


--
-- Name: galaxy galaxy_galaxy_type_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_type_fkey FOREIGN KEY (galaxy_types_id) REFERENCES public.galaxy_types(galaxy_types_id);


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

