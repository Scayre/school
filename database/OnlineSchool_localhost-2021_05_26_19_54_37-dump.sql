--
-- PostgreSQL database dump
--

-- Dumped from database version 13.1
-- Dumped by pg_dump version 13.1

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

DROP DATABASE "OnlineSchool";
--
-- Name: OnlineSchool; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "OnlineSchool" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Russian_Kazakhstan.1251';


ALTER DATABASE "OnlineSchool" OWNER TO postgres;

\connect "OnlineSchool"

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

--
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hibernate_sequence OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: student; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.student (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    surname character varying(100) NOT NULL,
    receipt_year character varying(100) NOT NULL
);


ALTER TABLE public.student OWNER TO postgres;

--
-- Name: students_subjects; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.students_subjects (
    student_id integer NOT NULL,
    subject_id integer NOT NULL
);


ALTER TABLE public.students_subjects OWNER TO postgres;

--
-- Name: subjects; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.subjects (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text
);


ALTER TABLE public.subjects OWNER TO postgres;

--
-- Name: subjects_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.subjects ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.subjects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Data for Name: student; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.student (id, name, surname, receipt_year) VALUES (6, 'Yestay', 'Tastanov', '2019');
INSERT INTO public.student (id, name, surname, receipt_year) VALUES (7, 'Yerzhigit', 'Myrzabaev', '2019');


--
-- Data for Name: students_subjects; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: subjects; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: hibernate_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.hibernate_sequence', 7, true);


--
-- Name: subjects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.subjects_id_seq', 1, false);


--
-- Name: student students_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student
    ADD CONSTRAINT students_pk PRIMARY KEY (id);


--
-- Name: students_subjects students_subjects_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students_subjects
    ADD CONSTRAINT students_subjects_pk PRIMARY KEY (student_id, subject_id);


--
-- Name: subjects subjects_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subjects
    ADD CONSTRAINT subjects_pk PRIMARY KEY (id);


--
-- Name: students_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX students_id_idx ON public.student USING btree (id);


--
-- Name: students_subjects_student_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX students_subjects_student_id_idx ON public.students_subjects USING btree (student_id, subject_id);


--
-- Name: subjects_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX subjects_id_idx ON public.subjects USING btree (id);


--
-- Name: students_subjects students_subjects_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students_subjects
    ADD CONSTRAINT students_subjects_fk FOREIGN KEY (subject_id) REFERENCES public.subjects(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: students_subjects students_subjects_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students_subjects
    ADD CONSTRAINT students_subjects_fk_1 FOREIGN KEY (student_id) REFERENCES public.student(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

