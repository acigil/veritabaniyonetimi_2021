--
-- PostgreSQL database dump
--

-- Dumped from database version 12.3
-- Dumped by pg_dump version 12rc1

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
-- Name: adres; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA adres;


ALTER SCHEMA adres OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: adres; Type: TABLE; Schema: adres; Owner: postgres
--

CREATE TABLE adres.adres (
    id integer NOT NULL,
    ilkodu integer NOT NULL,
    ilcekodu smallint NOT NULL
);


ALTER TABLE adres.adres OWNER TO postgres;

--
-- Name: adres_id_seq; Type: SEQUENCE; Schema: adres; Owner: postgres
--

CREATE SEQUENCE adres.adres_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE adres.adres_id_seq OWNER TO postgres;

--
-- Name: adres_id_seq; Type: SEQUENCE OWNED BY; Schema: adres; Owner: postgres
--

ALTER SEQUENCE adres.adres_id_seq OWNED BY adres.adres.id;


--
-- Name: il; Type: TABLE; Schema: adres; Owner: postgres
--

CREATE TABLE adres.il (
    "ilKodu" integer NOT NULL,
    "ilAd" text NOT NULL
);


ALTER TABLE adres.il OWNER TO postgres;

--
-- Name: ilce; Type: TABLE; Schema: adres; Owner: postgres
--

CREATE TABLE adres.ilce (
    "ilceKodu" integer NOT NULL,
    "ilceAdi" text NOT NULL
);


ALTER TABLE adres.ilce OWNER TO postgres;

--
-- Name: ilce_ilceKodu_seq; Type: SEQUENCE; Schema: adres; Owner: postgres
--

CREATE SEQUENCE adres."ilce_ilceKodu_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE adres."ilce_ilceKodu_seq" OWNER TO postgres;

--
-- Name: ilce_ilceKodu_seq; Type: SEQUENCE OWNED BY; Schema: adres; Owner: postgres
--

ALTER SEQUENCE adres."ilce_ilceKodu_seq" OWNED BY adres.ilce."ilceKodu";


--
-- Name: Adres; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Adres" (
    "adresId" integer NOT NULL,
    "ilKodu" integer NOT NULL,
    "ilceKodu" integer NOT NULL
);


ALTER TABLE public."Adres" OWNER TO postgres;

--
-- Name: Adres_adresId_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Adres_adresId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Adres_adresId_seq" OWNER TO postgres;

--
-- Name: Adres_adresId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Adres_adresId_seq" OWNED BY public."Adres"."adresId";


--
-- Name: Bina; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Bina" (
    "binaId" integer NOT NULL,
    "katSayisi" integer NOT NULL,
    "OdaSayisi" integer NOT NULL
);


ALTER TABLE public."Bina" OWNER TO postgres;

--
-- Name: Demirbas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Demirbas" (
    "binaId" integer NOT NULL,
    "malzemeAdi" text NOT NULL,
    adet integer NOT NULL,
    kayittarihi date NOT NULL
);


ALTER TABLE public."Demirbas" OWNER TO postgres;

--
-- Name: acilkisi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.acilkisi (
    "kisiId" integer NOT NULL,
    tel text NOT NULL
);


ALTER TABLE public.acilkisi OWNER TO postgres;

--
-- Name: borc; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.borc (
    "kisiId" integer NOT NULL,
    tutar integer NOT NULL
);


ALTER TABLE public.borc OWNER TO postgres;

--
-- Name: derslik; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.derslik (
    "binaId" integer NOT NULL,
    kapaste integer NOT NULL,
    "katNo" integer NOT NULL
);


ALTER TABLE public.derslik OWNER TO postgres;

--
-- Name: il; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.il (
    "ilKodu" integer NOT NULL,
    "ilAdi" text NOT NULL
);


ALTER TABLE public.il OWNER TO postgres;

--
-- Name: ilce; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ilce (
    "ilceKodu" text NOT NULL,
    "ilceAdi" text NOT NULL
);


ALTER TABLE public.ilce OWNER TO postgres;

--
-- Name: izin; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.izin (
    "kisiId" integer NOT NULL,
    "gunSayisi" integer NOT NULL
);


ALTER TABLE public.izin OWNER TO postgres;

--
-- Name: kisi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kisi (
    "kisiId" integer NOT NULL,
    adi text NOT NULL,
    soyadi text NOT NULL,
    "isPersonel" boolean NOT NULL,
    "isOgrenci" boolean NOT NULL,
    "isVeli" boolean NOT NULL
);


ALTER TABLE public.kisi OWNER TO postgres;

--
-- Name: kisi_kisiId_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."kisi_kisiId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."kisi_kisiId_seq" OWNER TO postgres;

--
-- Name: kisi_kisiId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."kisi_kisiId_seq" OWNED BY public.kisi."kisiId";


--
-- Name: maas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.maas (
    "kisiId" integer NOT NULL,
    maas integer NOT NULL
);


ALTER TABLE public.maas OWNER TO postgres;

--
-- Name: ogrenci; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ogrenci (
    "kisiId" integer NOT NULL,
    "dogumTarihi" date NOT NULL,
    giristarihi date NOT NULL,
    "universteId" integer NOT NULL
);


ALTER TABLE public.ogrenci OWNER TO postgres;

--
-- Name: personel; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.personel (
    "kisiId" integer NOT NULL,
    gorevi text NOT NULL,
    "baslamaTarihi" date NOT NULL
);


ALTER TABLE public.personel OWNER TO postgres;

--
-- Name: sporSalonu; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."sporSalonu" (
    "binaId" integer NOT NULL,
    kapaste integer NOT NULL
);


ALTER TABLE public."sporSalonu" OWNER TO postgres;

--
-- Name: universte; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.universte (
    "universteId" integer NOT NULL,
    "universteAdi" text NOT NULL,
    "adresId" integer NOT NULL
);


ALTER TABLE public.universte OWNER TO postgres;

--
-- Name: universte_universteId_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."universte_universteId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."universte_universteId_seq" OWNER TO postgres;

--
-- Name: universte_universteId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."universte_universteId_seq" OWNED BY public.universte."universteId";


--
-- Name: adres id; Type: DEFAULT; Schema: adres; Owner: postgres
--

ALTER TABLE ONLY adres.adres ALTER COLUMN id SET DEFAULT nextval('adres.adres_id_seq'::regclass);


--
-- Name: ilce ilceKodu; Type: DEFAULT; Schema: adres; Owner: postgres
--

ALTER TABLE ONLY adres.ilce ALTER COLUMN "ilceKodu" SET DEFAULT nextval('adres."ilce_ilceKodu_seq"'::regclass);


--
-- Name: Adres adresId; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Adres" ALTER COLUMN "adresId" SET DEFAULT nextval('public."Adres_adresId_seq"'::regclass);


--
-- Name: kisi kisiId; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kisi ALTER COLUMN "kisiId" SET DEFAULT nextval('public."kisi_kisiId_seq"'::regclass);


--
-- Name: universte universteId; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.universte ALTER COLUMN "universteId" SET DEFAULT nextval('public."universte_universteId_seq"'::regclass);


--
-- Data for Name: adres; Type: TABLE DATA; Schema: adres; Owner: postgres
--

INSERT INTO adres.adres VALUES
	(1, 1, 1),
	(2, 1, 2),
	(3, 2, 1);


--
-- Data for Name: il; Type: TABLE DATA; Schema: adres; Owner: postgres
--

INSERT INTO adres.il VALUES
	(1, 'Ankara'),
	(2, 'istanbul');


--
-- Data for Name: ilce; Type: TABLE DATA; Schema: adres; Owner: postgres
--

INSERT INTO adres.ilce VALUES
	(1, 'haci Bayram');


--
-- Data for Name: Adres; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: Bina; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: Demirbas; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: acilkisi; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: borc; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: derslik; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: il; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: ilce; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: izin; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: kisi; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.kisi VALUES
	(1, 'Ali', 'veli', true, false, false),
	(2, 'Velo', 'ss', false, true, false),
	(3, 'vv', 'sss', false, false, true);


--
-- Data for Name: maas; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: ogrenci; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: personel; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: sporSalonu; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: universte; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: adres_id_seq; Type: SEQUENCE SET; Schema: adres; Owner: postgres
--

SELECT pg_catalog.setval('adres.adres_id_seq', 1, false);


--
-- Name: ilce_ilceKodu_seq; Type: SEQUENCE SET; Schema: adres; Owner: postgres
--

SELECT pg_catalog.setval('adres."ilce_ilceKodu_seq"', 1, false);


--
-- Name: Adres_adresId_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Adres_adresId_seq"', 1, false);


--
-- Name: kisi_kisiId_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."kisi_kisiId_seq"', 1, false);


--
-- Name: universte_universteId_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."universte_universteId_seq"', 1, false);


--
-- Name: adres adres_pkey; Type: CONSTRAINT; Schema: adres; Owner: postgres
--

ALTER TABLE ONLY adres.adres
    ADD CONSTRAINT adres_pkey PRIMARY KEY (id);


--
-- Name: il il_pkey; Type: CONSTRAINT; Schema: adres; Owner: postgres
--

ALTER TABLE ONLY adres.il
    ADD CONSTRAINT il_pkey PRIMARY KEY ("ilKodu");


--
-- Name: ilce unique_ilce_ilceKodu; Type: CONSTRAINT; Schema: adres; Owner: postgres
--

ALTER TABLE ONLY adres.ilce
    ADD CONSTRAINT "unique_ilce_ilceKodu" PRIMARY KEY ("ilceKodu");


--
-- Name: Adres Adres_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Adres"
    ADD CONSTRAINT "Adres_pkey" PRIMARY KEY ("adresId");


--
-- Name: Bina Bina_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Bina"
    ADD CONSTRAINT "Bina_pkey" PRIMARY KEY ("binaId");


--
-- Name: Demirbas Demirbas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Demirbas"
    ADD CONSTRAINT "Demirbas_pkey" PRIMARY KEY ("binaId");


--
-- Name: acilkisi acilkisi_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.acilkisi
    ADD CONSTRAINT acilkisi_pkey PRIMARY KEY ("kisiId");


--
-- Name: borc borc_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.borc
    ADD CONSTRAINT borc_pkey PRIMARY KEY ("kisiId");


--
-- Name: derslik derslik_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.derslik
    ADD CONSTRAINT derslik_pkey PRIMARY KEY ("binaId");


--
-- Name: il il_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.il
    ADD CONSTRAINT il_pkey PRIMARY KEY ("ilKodu");


--
-- Name: ilce ilce_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ilce
    ADD CONSTRAINT ilce_pkey PRIMARY KEY ("ilceKodu");


--
-- Name: izin izin_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.izin
    ADD CONSTRAINT izin_pkey PRIMARY KEY ("kisiId");


--
-- Name: kisi kisi_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kisi
    ADD CONSTRAINT kisi_pkey PRIMARY KEY ("kisiId");


--
-- Name: maas maas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.maas
    ADD CONSTRAINT maas_pkey PRIMARY KEY ("kisiId");


--
-- Name: ogrenci ogrenci_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ogrenci
    ADD CONSTRAINT ogrenci_pkey PRIMARY KEY ("kisiId");


--
-- Name: personel personel_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personel
    ADD CONSTRAINT personel_pkey PRIMARY KEY ("kisiId");


--
-- Name: sporSalonu sporSalonu_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."sporSalonu"
    ADD CONSTRAINT "sporSalonu_pkey" PRIMARY KEY ("binaId");


--
-- Name: kisi unique_kisi_kisiId; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kisi
    ADD CONSTRAINT "unique_kisi_kisiId" UNIQUE ("kisiId");


--
-- Name: universte unique_universte_universteAdi; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.universte
    ADD CONSTRAINT "unique_universte_universteAdi" UNIQUE ("universteAdi");


--
-- Name: universte universte_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.universte
    ADD CONSTRAINT universte_pkey PRIMARY KEY ("universteId", "adresId");


--
-- Name: ilce adresilce; Type: FK CONSTRAINT; Schema: adres; Owner: postgres
--

ALTER TABLE ONLY adres.ilce
    ADD CONSTRAINT adresilce FOREIGN KEY ("ilceKodu") REFERENCES adres.adres(id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: il adrsil; Type: FK CONSTRAINT; Schema: adres; Owner: postgres
--

ALTER TABLE ONLY adres.il
    ADD CONSTRAINT adrsil FOREIGN KEY ("ilKodu") REFERENCES adres.adres(id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: derslik BinaDerslik; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.derslik
    ADD CONSTRAINT "BinaDerslik" FOREIGN KEY ("binaId") REFERENCES public."Bina"("binaId") MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Demirbas binaDemirbas; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Demirbas"
    ADD CONSTRAINT "binaDemirbas" FOREIGN KEY ("binaId") REFERENCES public."Bina"("binaId") MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: sporSalonu binaSporSalonu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."sporSalonu"
    ADD CONSTRAINT "binaSporSalonu" FOREIGN KEY ("binaId") REFERENCES public."Bina"("binaId") MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: acilkisi kisiAcilKisi; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.acilkisi
    ADD CONSTRAINT "kisiAcilKisi" FOREIGN KEY ("kisiId") REFERENCES public.kisi("kisiId") MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ogrenci kisiOgrenci; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ogrenci
    ADD CONSTRAINT "kisiOgrenci" FOREIGN KEY ("kisiId") REFERENCES public.kisi("kisiId") MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: personel kisiPersonel; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personel
    ADD CONSTRAINT "kisiPersonel" FOREIGN KEY ("kisiId") REFERENCES public.kisi("kisiId") MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: borc ogrenciBurc; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.borc
    ADD CONSTRAINT "ogrenciBurc" FOREIGN KEY ("kisiId") REFERENCES public.ogrenci("kisiId") MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: universte ogrenciUnivesrte; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.universte
    ADD CONSTRAINT "ogrenciUnivesrte" FOREIGN KEY ("universteId") REFERENCES public.ogrenci("kisiId") MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: izin personelIzni; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.izin
    ADD CONSTRAINT "personelIzni" FOREIGN KEY ("kisiId") REFERENCES public.personel("kisiId") MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: maas personelMaasi; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.maas
    ADD CONSTRAINT "personelMaasi" FOREIGN KEY ("kisiId") REFERENCES public.personel("kisiId") MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

