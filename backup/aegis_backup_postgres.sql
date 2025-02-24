PGDMP     .    	    	            z            postgres    14.4 (Debian 14.4-1.pgdg110+1)    14.4 E    F           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            G           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            H           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            I           1262    13757    postgres    DATABASE     \   CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';
    DROP DATABASE postgres;
             
   flypgadmin    false            J           0    0    DATABASE postgres    COMMENT     N   COMMENT ON DATABASE postgres IS 'default administrative connection database';
                
   flypgadmin    false    3401            V           1247    17244    enum_Requests_type    TYPE     P   CREATE TYPE public."enum_Requests_type" AS ENUM (
    'Work',
    'Personal'
);
 '   DROP TYPE public."enum_Requests_type";
       public          postgres    false            �            1259    17207    Duties    TABLE       CREATE TABLE public."Duties" (
    id integer NOT NULL,
    date date NOT NULL,
    "memberId" integer,
    "roleInstanceId" integer NOT NULL,
    "scheduleId" integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public."Duties";
       public         heap    postgres    false            �            1259    17206    Duties_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Duties_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public."Duties_id_seq";
       public          postgres    false    218            K           0    0    Duties_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public."Duties_id_seq" OWNED BY public."Duties".id;
          public          postgres    false    217            �            1259    17165    Members    TABLE     "  CREATE TABLE public."Members" (
    id integer NOT NULL,
    callsign character varying(255) NOT NULL,
    sqn character varying(255) NOT NULL,
    type character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public."Members";
       public         heap    postgres    false            �            1259    17164    Members_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Members_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public."Members_id_seq";
       public          postgres    false    210            L           0    0    Members_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public."Members_id_seq" OWNED BY public."Members".id;
          public          postgres    false    209            �            1259    17228    Qualifications    TABLE     �   CREATE TABLE public."Qualifications" (
    "memberId" integer NOT NULL,
    "roleId" integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
 $   DROP TABLE public."Qualifications";
       public         heap    postgres    false            �            1259    17262    RequestDates    TABLE     �   CREATE TABLE public."RequestDates" (
    id integer NOT NULL,
    "requestId" integer NOT NULL,
    date timestamp with time zone NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
 "   DROP TABLE public."RequestDates";
       public         heap    postgres    false            �            1259    17261    RequestDates_id_seq    SEQUENCE     �   CREATE SEQUENCE public."RequestDates_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public."RequestDates_id_seq";
       public          postgres    false    223            M           0    0    RequestDates_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public."RequestDates_id_seq" OWNED BY public."RequestDates".id;
          public          postgres    false    222            �            1259    17250    Requests    TABLE     p  CREATE TABLE public."Requests" (
    id integer NOT NULL,
    "startDate" timestamp with time zone,
    "endDate" timestamp with time zone,
    reason character varying(255) NOT NULL,
    "memberId" integer NOT NULL,
    type public."enum_Requests_type" NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public."Requests";
       public         heap    postgres    false    854            �            1259    17249    Requests_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Requests_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public."Requests_id_seq";
       public          postgres    false    221            N           0    0    Requests_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public."Requests_id_seq" OWNED BY public."Requests".id;
          public          postgres    false    220            �            1259    17185    RoleInstances    TABLE     �   CREATE TABLE public."RoleInstances" (
    id integer NOT NULL,
    "roleId" integer NOT NULL,
    description character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
 #   DROP TABLE public."RoleInstances";
       public         heap    postgres    false            �            1259    17184    RoleInstances_id_seq    SEQUENCE     �   CREATE SEQUENCE public."RoleInstances_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public."RoleInstances_id_seq";
       public          postgres    false    214            O           0    0    RoleInstances_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public."RoleInstances_id_seq" OWNED BY public."RoleInstances".id;
          public          postgres    false    213            �            1259    17176    Roles    TABLE     �   CREATE TABLE public."Roles" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public."Roles";
       public         heap    postgres    false            �            1259    17175    Roles_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Roles_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public."Roles_id_seq";
       public          postgres    false    212            P           0    0    Roles_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public."Roles_id_seq" OWNED BY public."Roles".id;
          public          postgres    false    211            �            1259    17197 	   Schedules    TABLE     �   CREATE TABLE public."Schedules" (
    id integer NOT NULL,
    "isPublished" boolean DEFAULT false,
    month date NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public."Schedules";
       public         heap    postgres    false            �            1259    17196    Schedules_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Schedules_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public."Schedules_id_seq";
       public          postgres    false    216            Q           0    0    Schedules_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public."Schedules_id_seq" OWNED BY public."Schedules".id;
          public          postgres    false    215            �           2604    17210 	   Duties id    DEFAULT     j   ALTER TABLE ONLY public."Duties" ALTER COLUMN id SET DEFAULT nextval('public."Duties_id_seq"'::regclass);
 :   ALTER TABLE public."Duties" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    217    218            �           2604    17168 
   Members id    DEFAULT     l   ALTER TABLE ONLY public."Members" ALTER COLUMN id SET DEFAULT nextval('public."Members_id_seq"'::regclass);
 ;   ALTER TABLE public."Members" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    209    210    210            �           2604    17265    RequestDates id    DEFAULT     v   ALTER TABLE ONLY public."RequestDates" ALTER COLUMN id SET DEFAULT nextval('public."RequestDates_id_seq"'::regclass);
 @   ALTER TABLE public."RequestDates" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    222    223    223            �           2604    17253    Requests id    DEFAULT     n   ALTER TABLE ONLY public."Requests" ALTER COLUMN id SET DEFAULT nextval('public."Requests_id_seq"'::regclass);
 <   ALTER TABLE public."Requests" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    220    221    221            �           2604    17188    RoleInstances id    DEFAULT     x   ALTER TABLE ONLY public."RoleInstances" ALTER COLUMN id SET DEFAULT nextval('public."RoleInstances_id_seq"'::regclass);
 A   ALTER TABLE public."RoleInstances" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    213    214    214            �           2604    17179    Roles id    DEFAULT     h   ALTER TABLE ONLY public."Roles" ALTER COLUMN id SET DEFAULT nextval('public."Roles_id_seq"'::regclass);
 9   ALTER TABLE public."Roles" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    212    211    212            �           2604    17200    Schedules id    DEFAULT     p   ALTER TABLE ONLY public."Schedules" ALTER COLUMN id SET DEFAULT nextval('public."Schedules_id_seq"'::regclass);
 =   ALTER TABLE public."Schedules" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    216    216            >          0    17207    Duties 
   TABLE DATA           r   COPY public."Duties" (id, date, "memberId", "roleInstanceId", "scheduleId", "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    218   DS       6          0    17165    Members 
   TABLE DATA           V   COPY public."Members" (id, callsign, sqn, type, "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    210   e       ?          0    17228    Qualifications 
   TABLE DATA           Z   COPY public."Qualifications" ("memberId", "roleId", "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    219   Dh       C          0    17262    RequestDates 
   TABLE DATA           Y   COPY public."RequestDates" (id, "requestId", date, "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    223   j       A          0    17250    Requests 
   TABLE DATA           t   COPY public."Requests" (id, "startDate", "endDate", reason, "memberId", type, "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    221   nz       :          0    17185    RoleInstances 
   TABLE DATA           ^   COPY public."RoleInstances" (id, "roleId", description, "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    214   S�       8          0    17176    Roles 
   TABLE DATA           E   COPY public."Roles" (id, name, "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    212   ҂       <          0    17197 	   Schedules 
   TABLE DATA           Y   COPY public."Schedules" (id, "isPublished", month, "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    216   3�       R           0    0    Duties_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public."Duties_id_seq"', 2452, true);
          public          postgres    false    217            S           0    0    Members_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public."Members_id_seq"', 47, true);
          public          postgres    false    209            T           0    0    RequestDates_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public."RequestDates_id_seq"', 981, true);
          public          postgres    false    222            U           0    0    Requests_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public."Requests_id_seq"', 160, true);
          public          postgres    false    220            V           0    0    RoleInstances_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public."RoleInstances_id_seq"', 8, true);
          public          postgres    false    213            W           0    0    Roles_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public."Roles_id_seq"', 3, true);
          public          postgres    false    211            X           0    0    Schedules_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public."Schedules_id_seq"', 14, true);
          public          postgres    false    215            �           2606    17212    Duties Duties_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public."Duties"
    ADD CONSTRAINT "Duties_pkey" PRIMARY KEY (id);
 @   ALTER TABLE ONLY public."Duties" DROP CONSTRAINT "Duties_pkey";
       public            postgres    false    218            �           2606    17174    Members Members_callsign_key 
   CONSTRAINT     _   ALTER TABLE ONLY public."Members"
    ADD CONSTRAINT "Members_callsign_key" UNIQUE (callsign);
 J   ALTER TABLE ONLY public."Members" DROP CONSTRAINT "Members_callsign_key";
       public            postgres    false    210            �           2606    17172    Members Members_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public."Members"
    ADD CONSTRAINT "Members_pkey" PRIMARY KEY (id);
 B   ALTER TABLE ONLY public."Members" DROP CONSTRAINT "Members_pkey";
       public            postgres    false    210            �           2606    17232 "   Qualifications Qualifications_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY public."Qualifications"
    ADD CONSTRAINT "Qualifications_pkey" PRIMARY KEY ("memberId", "roleId");
 P   ALTER TABLE ONLY public."Qualifications" DROP CONSTRAINT "Qualifications_pkey";
       public            postgres    false    219    219            �           2606    17267    RequestDates RequestDates_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public."RequestDates"
    ADD CONSTRAINT "RequestDates_pkey" PRIMARY KEY (id);
 L   ALTER TABLE ONLY public."RequestDates" DROP CONSTRAINT "RequestDates_pkey";
       public            postgres    false    223            �           2606    17255    Requests Requests_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public."Requests"
    ADD CONSTRAINT "Requests_pkey" PRIMARY KEY (id);
 D   ALTER TABLE ONLY public."Requests" DROP CONSTRAINT "Requests_pkey";
       public            postgres    false    221            �           2606    17190     RoleInstances RoleInstances_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public."RoleInstances"
    ADD CONSTRAINT "RoleInstances_pkey" PRIMARY KEY (id);
 N   ALTER TABLE ONLY public."RoleInstances" DROP CONSTRAINT "RoleInstances_pkey";
       public            postgres    false    214            �           2606    17183    Roles Roles_name_key 
   CONSTRAINT     S   ALTER TABLE ONLY public."Roles"
    ADD CONSTRAINT "Roles_name_key" UNIQUE (name);
 B   ALTER TABLE ONLY public."Roles" DROP CONSTRAINT "Roles_name_key";
       public            postgres    false    212            �           2606    17181    Roles Roles_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public."Roles"
    ADD CONSTRAINT "Roles_pkey" PRIMARY KEY (id);
 >   ALTER TABLE ONLY public."Roles" DROP CONSTRAINT "Roles_pkey";
       public            postgres    false    212            �           2606    17205    Schedules Schedules_month_key 
   CONSTRAINT     ]   ALTER TABLE ONLY public."Schedules"
    ADD CONSTRAINT "Schedules_month_key" UNIQUE (month);
 K   ALTER TABLE ONLY public."Schedules" DROP CONSTRAINT "Schedules_month_key";
       public            postgres    false    216            �           2606    17203    Schedules Schedules_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public."Schedules"
    ADD CONSTRAINT "Schedules_pkey" PRIMARY KEY (id);
 F   ALTER TABLE ONLY public."Schedules" DROP CONSTRAINT "Schedules_pkey";
       public            postgres    false    216            �           2606    17213    Duties Duties_memberId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Duties"
    ADD CONSTRAINT "Duties_memberId_fkey" FOREIGN KEY ("memberId") REFERENCES public."Members"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 I   ALTER TABLE ONLY public."Duties" DROP CONSTRAINT "Duties_memberId_fkey";
       public          postgres    false    218    3215    210            �           2606    17218 !   Duties Duties_roleInstanceId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Duties"
    ADD CONSTRAINT "Duties_roleInstanceId_fkey" FOREIGN KEY ("roleInstanceId") REFERENCES public."RoleInstances"(id) ON UPDATE CASCADE;
 O   ALTER TABLE ONLY public."Duties" DROP CONSTRAINT "Duties_roleInstanceId_fkey";
       public          postgres    false    214    218    3221            �           2606    17223    Duties Duties_scheduleId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Duties"
    ADD CONSTRAINT "Duties_scheduleId_fkey" FOREIGN KEY ("scheduleId") REFERENCES public."Schedules"(id) ON UPDATE CASCADE;
 K   ALTER TABLE ONLY public."Duties" DROP CONSTRAINT "Duties_scheduleId_fkey";
       public          postgres    false    3225    216    218            �           2606    17233 +   Qualifications Qualifications_memberId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Qualifications"
    ADD CONSTRAINT "Qualifications_memberId_fkey" FOREIGN KEY ("memberId") REFERENCES public."Members"(id) ON UPDATE CASCADE ON DELETE CASCADE;
 Y   ALTER TABLE ONLY public."Qualifications" DROP CONSTRAINT "Qualifications_memberId_fkey";
       public          postgres    false    219    3215    210            �           2606    17238 )   Qualifications Qualifications_roleId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Qualifications"
    ADD CONSTRAINT "Qualifications_roleId_fkey" FOREIGN KEY ("roleId") REFERENCES public."Roles"(id) ON UPDATE CASCADE ON DELETE CASCADE;
 W   ALTER TABLE ONLY public."Qualifications" DROP CONSTRAINT "Qualifications_roleId_fkey";
       public          postgres    false    3219    219    212            �           2606    17268 (   RequestDates RequestDates_requestId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."RequestDates"
    ADD CONSTRAINT "RequestDates_requestId_fkey" FOREIGN KEY ("requestId") REFERENCES public."Requests"(id) ON UPDATE CASCADE;
 V   ALTER TABLE ONLY public."RequestDates" DROP CONSTRAINT "RequestDates_requestId_fkey";
       public          postgres    false    223    3231    221            �           2606    17256    Requests Requests_memberId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Requests"
    ADD CONSTRAINT "Requests_memberId_fkey" FOREIGN KEY ("memberId") REFERENCES public."Members"(id) ON UPDATE CASCADE ON DELETE CASCADE;
 M   ALTER TABLE ONLY public."Requests" DROP CONSTRAINT "Requests_memberId_fkey";
       public          postgres    false    221    3215    210            �           2606    17191 '   RoleInstances RoleInstances_roleId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."RoleInstances"
    ADD CONSTRAINT "RoleInstances_roleId_fkey" FOREIGN KEY ("roleId") REFERENCES public."Roles"(id) ON UPDATE CASCADE;
 U   ALTER TABLE ONLY public."RoleInstances" DROP CONSTRAINT "RoleInstances_roleId_fkey";
       public          postgres    false    212    3219    214            >      x��][�������=����%�_GZMrT�Gj�0���]Ѓ��R�M�ۋ�?��������?Q�S������~Z��qn�~{���܏/���Q�4J���-.�ja�X{]��ۑ�߮��|�������+��_��CK�O��5��he�]h�Uk���w����1��W�b}��S*������?�ȿ)�$�-�e������lMV��=���~��yxY�ak���lD�ڵ�}�k����(h.4����Ю=p��9Z{?،L�ʍ=�����ih^,׍��������Gz����$���,J>�c4�pGc���X��lw�09�R�èwT�ن����/g��LL-�����3��,8?YGxſ��,�v^8&0��4~��H���E㿤���&�_��#�$^��ǯ�����c�g>jϡx~u�_�@�%V&��:�0۠dX�/c��	��:�V6�{��)v[K(ZB��<��'Tb��ٺ	+3Vĕ�+���M�p��+.��*��0�i0aɨ".��3V���ٰ��2���A��`X�;�����M�'��$U==�J�2~n�Q��������Hr���9>��:����)&$>H�����ŗa�s��ƥ�?ǹB�`[*>��+�!�Z�U�aU����1��^�4���R$��
NS�o/Œa���n�&,6�
��zb��-l�g���� �gLǡ�Z�x�<'ts7A����u�2C���e�9��N�|ߩ��d��Ln敗l�p�r��@�a���o{?���C#��˞�{�yXH����	+2������x�	�h�Z����%��_a�o�d���
S�,^�F�;!z 
�D�`��8�U(	����i�P�90�n�7��x����wk��ʎM�鞒���!�ɇ�n�8�� �G�ٴ �����6Xl{�d!��{,X|��1�~�F�׏���h$�Q�q�H�d�^g$�������H=�a��9x��(��_�e�:�uXl�����8D��@��a�i�{c�}��j�~ah�	V@�
��t�ŗ��ML�p�Ň��h�ƶ`I� GC�����U�xX��٘��e<ZW8�if,���6G�6"��q�%X��!�MG߂ŗX ����`�M���u�	�b��Н	�]=�ŴO�)�=�吠�v���^S��vGfl���)�F�F���6X���oo4aq�ꄵ˅������^
%������,,qƊ�c�ةB�����_�o�b��~��.��`�c?�7Ξ2n_L7	vF�>��J�8�ޠ:�Q7Xy�u^X��"�ĪK,b�)j�v�Ŧ
�0y~�4�]�@�R�fw(�f+����3ֽ�q��f������ѻ~gMP���$C�NT�3�/T��3̈���/S,~��y^fژ���q���(��<��׍��*K�{X�M�4������V5A�#�QD}�&X��_�%�>O:C�j<�8�m\�Z4�e�4./��@��,x�i�$��,��덺.�.��5�^��⩵�&���`�َ���1���4gk���ی�%g��Y�}�b�."��;���-e�FK� `C�E�������U���о큠1C���+��O3�lBN�&T#���蕍hMІ���آ��@/����
�XjV��L7h��m��Ì�FKk4�c#h}�}��5�M��UA+����[�r>��ޮ��n8:��������ڶh_�h<�q���#Z�2Y�Mv4��:�Ӗhe�&����6`|TF�!�����@"8i�OT�*�-On�A�kt��H���*���jWw�MAX�$:ʠj&N�OT����t�UO�w�_��
�z|�1�aѮ�=�J64y��Q�둖M����>61�@�^p��5gك�1%nA�z���D�h8��q���"����C�<���y�.}��Nhr���3�6�,hé��`��'��>=�k�h��2�sͷ}����FN"H8�{��Hk4��@q���К�c�= ��XL3Ḭ�^a, Nb�LXB��Y'"�>�3��r���IL�⇡:��l9�5�d\q�*62��@��mb�ì�4!�$����B�sM��}�Ʀ	�o�������eǼc	c'L�fӸ��#�	#��/'���{��N�� �~�P�&'B�C�a�����N#-ѫp�������۾�tM�}�r!?��b�5��b!�.�I�5�&�S�L�枝[S`�;�}��)��p}i\���51$C������9�m�M0�s����ꮺ4�ɲ�P�MBm��ɛɹ")P���\Q:�#o��4<�S��,hB��w�2k:�
_%��0S�$$���񰁘Д���41�t	ݏ64�� 
�blJ���@fҪ(;���L3	XCc���<�3��-Z@��#ܗ�Z9+���˹���M0/�\��j��jrɃuܹ��_���3Ñ��Rsx+�Li!B�5V��$���"�X�*D_�hidD���c�������ֺ~a8���f4��]��{�ܢ���&��>ޚ���a.�ZК����)0�`A���~�7#�}�C�{� 7h�Ua�6-��� �7�O�Fp������G��3Ȥ�į 
�^��0��BZMN	�R�J�������%�2��8u����F�E�������a�DJz���ĵV��(C��ڧ�4�bR�uʤ	V����pl��2�6��N��&���.!��d�m�
�`&��H�jq�*�5=�;�b�
�pr�l�%XXN�86i�a�2rr��B�:�2JA�K��!��w���Cӗ�2-�5��+s��jlM������VFu�rpײ{��8	�G���i�I�9�'�TN����Lj�޽��HjiDWJ�B�a3�ѪnS�]�6���%aA����-}�AS��f����@�S|���KNiGH���AO =+S�j/�B�"Elj/yգ��:��MR�}2S{�G�-HάG�8z8����A6ҹ��h�b���~z���&�`��@+����fe
�J/�9����b���8��64	f긘��߬�"Q� Q	�<�q�i_L����Q�$��k���N)��tm�^#e������A�H��{+!״o*��]�Tmh*9j���z5U�c�j� �T��o��Aܶ悤���!�[`}�s~�ҴFFN���.=����/nO|�R������p�i/a� k�Ǭ��8,ˁ��]�`+7�BUA֞{�m�D�DNdz��`�.a{���/¾�zME願�Z,!��[ ��z��ZQ����Q^E���(����];ib9X��T�n�0$y>��s��k�>ƀBB���	}��4��}�M�L��Sq�Zy�"]8��Q[�	L&
�K��c7�5�v�����\�����0	���Vj"��&�ܰ1:I� ���M�l��Li�� ��)=�N��,`�A���.@�?���O1e�,�H�h���V�U�?>Q�3�P���k��6pwq��M�ꍴ����(W
�0s:&�()C's��RjsҀ�J;��ت$�$Z�d�N�fXR�x�h����E���_�M(�w�[�B�.*T�����H��y�M�)a���Dja���
���Q����&F��<�G����,������x����&�D7���E+��n
�#�Munm�h��i�#�U{(�\DI�_#�����j���LU�-i�#�=���T�N��Dؚ�Q���eLY�zt�'��M?/b2Ti���})���9�.єK�9�7��&Q{b�c�����yB�b'��1��h�`˝w6��|{��m_y�°�q�]�B�|a�9�}�A��<qC�o��烠�v�~���i�!u�#�;�Th��.�¡����F���\׉��������RΝ�L�2�D�Z{|3M�59��������Z���]�2��N?�S��14�{����K�w���bc�ci&��`n&� �  ' 5����ٮ _��=nw����Rp�O�v��}�q{�},�s���g�U�1��sp\̲��4"������[�9
�B��Թ�Tt��\�Z�2���E�Ņ�p퓹%�F��?��k�XE{���x��1�M3)��XIgU�%�����d�Ƴ�!"���Ѐh��j�*9Q|��5��Q�AT;��T9q9�[T�'s3��E�>��ylU�q27#�^U���R̪d6$��,PԆF U�R�-i[��K�d��a27#��OuXW�jǢ��c��0QAS��UQX���x�il4I�Q�S�Ը���wa�cLdv�Jf ����h��S�5���C�7���Sf�V63�r�E|~��:?m�`�ܾ�r͕i���e������P�Pͅ��kp�'�4�>�Yl�鰖qG�:���W���J�K�?�~�����/      6     x���Ko�@��3��w�վ�έ-}B4U� .&�6�����$a!��-R|��_fvgǫ�8��n����������P�C�dI9rV��H�A��k����	�԰%!4p2�jPEN�,g��p�W��o<Go�/?���<;�N�&��F1����i�Hu����E�L]	a���~��r����2'��u��S�� l�9�a	g�����)+!TΫ��z�B{&��P)����e����
�]ɹv���U��K!s.Be�*����b���(!T�U��ʖV�R9N�C��[/x��p��!�B��}l�ܩ߆9�o{)��}�4�����5�P7�!T%�������TNU&��PK�Yͺ��<�X����B��fM��u�6�3K����0����X#��=�ڐ'βEj��1��P[���oc8��v0n�5�kv�Q��d
K��q���le���V(!��c{U��Z;�_f�B]����q�lV��zh��!�%�֋�r{��VL����a���/�lB�ද�ߞ�?�� �e\	��p��f	}w�^�M���&��	�\q	������	�f�B�`R�W��wNB�Ay�}XO)T�xB�a�O��3iBS��mΣ��a���AhJ��o���3{���4�2.�{SM�kf4R��m�����#�
�?����҅Ft�>Bk��N�����ץ��F�~��ٽ�%Bk����,��t8��+!�>ǋU=d�r��Hm�x��K������c���N!��{��8�+�Hm(Z��2tiְ/~��U*�o      ?   �  x���In�0E��)�/Jp�`���?G%$r��5�~x EQ�֛�L�>�}J�K�EwU6��_�f�`�a�I����Q��$T��%�t!j�Y�V&��������7l.D*P���'�"������ro�h"u�lg�dB��ڹ�dD��{k$G]��&j��h!��������|�Dfh��c����*�zI�D-�n!�n�z2���J�֞]h���Kj�jas��"��2xO��$d��=�d�*j��
3i��<Sh���ߪ+�:b :V"ǫ߹fn!r�K6b���M���
�Ņ[�q �UeO��")����Hs�x��84��1/T}E���.e<����W��(^3�dr�]�ض��~F���8V���v���1�����g4���Uu��p~����2~��W���D苉�.��E      C      x���K�#��qj5w���O���_�Au��+=��Q���:n�$� �L�X�R��B�ǵ\������?�����?��r�����Y�r�c�����b���9���3)�s�S��v�C���U�3��M�˅��;�g�a=�(��������/���n矩��У�������ϗ�;�?_nN��nA���΂@z2�I��&d��iN��hA �Y���F/�������3�z��������<g�rsy�� ����M�<#��tyFf 7��,@n��Yg�o��	��-�'@�x���9@]�s�puA��e6��L`*5if0��4�J�I�L��$���AĚ}6���4���0bͩ�ڍ�5��u.L��l�?�L���\o��ݗ�У�+쫸�˻;Y�<S��G�@*��#��g��r���r��
�r���r��~�����Ǐᷩ,yYӃiq��`Z\!�"���;	�~���i�3B��Cbf0��4�J�N�L}~2f��{�z�`��>?	�;0��ɘL}~2f������#�za�t��6M��`��y_��nC.r2cV0M漬�f�f�w0M�|p`����g3(WҔ8ڶ�Y3�i2�C�d�Kq��L�,`��y���v�ɚL�9��4��r��e&kz0M����!-���$��)>[��!13��ߓ4�lj9�4+��ߓ4�J^"����8390��D�L%/�f S�K��T�iBiy�4!���D�GZ^"M�#-/��Gj��5;�&���&��%���*�`�c�SyF�CbJ��ڋ�ΘL��3���~]L�L=/1f��{m���H��is�ڕ�������+��OoW��_$��@T�9!FչI�	DufbQ���X@TXAT�k��@T�j��gQ�7���4uzfx� ��@4�==�h0{zQ�>��A4���̢^�b� ���A��Ŀ�=�A��:!J��{����G�g�~=$f sum����ꜚ�����wK�v��9�go}=$fS�˘L��/cV0�����Էf����+O�꾓�����z�fS��C��U���U�<7#���<7���<73���yn0W��ܬ`���fsu�=7!���۱ ��~!eB��Bʄ8ZV�&�Ѳ�87!��ȹ	q��A�M��ernB��Bʄ8����	q��3B��B��ie[q%D���0��]j��{܅�.�ǐ�L=23��G&cf0��d�r���fS�L�l`�ɘL=2	390��dL���.*E�`��Q�`��QJ`��Q�`Z�Qo�*�*��I�~{�t��CrӐ�wJM�S1e:�ۇ;�gta=$��Ѷ[���E�����S�hz:���83Km;����vs�5�U�;�gB3]e�CX�\%���ՙ;��z�%�Mww%/Q�W%�͢~��� �C�bQ��s1���Ϲ�Aԣ�\���ʪ��쳲f�D8���X9�We�J�bFY�r"Č�V�D��p6%B�hǺ(bF;�E�3ڑ.J���tQ"Čv��!f��\�1��b�1��D��!��6��5�� �Iw�F0M�������2}��z��˼�>i���N�������{H����9S�>���L
�'^��ܩ�=$fSɿ���T�i�ow5�fSə�Y�T�&i60��I�L%sr���������:ѵ)9�������z�Q��:~���8�I��t����*S�C�O:�Z^&Q��2II4 ��R
�c/Ӷ#3R��Iv{�C~�<qH��^�1fS������U�j���H��zH�<���1�z}Ø�m���I����4����O��L}~2�S�����W��������W���4�M_fs��bL��E��1!�].Ƅ8Z�y�G�<ϘG�<ϘG�ncB-�]�	q��x1&�Ѣ�ŘG��cB-�^�	q��|1&�Ѣ�un暮��m���_����ߛ�=$f�M-/�fS݇H��Hl��wׯ{�c�m���(��Č`�ם1��:���`���s�������
��?����O��`���0�M=2���{EY3�iGU�hz��u�\7�&�]�Rݿ�3�ɦ���ߋ�<>X�rD��ꛟ�	��|?ە��ŝ����[��z�#"vW��Pg|&q�����d�O}������Ӆ��7=R��x1'��#Bm�x�ŘP/�j1&�Ƌ�Z�	����cBml���P���6�ΨW�&�q�`��1��$���$�R �$�R�$�R�$�R�$�R�M�^M�8���$�#�^M�Wz�H�uk�w���z�8$f s��fs��fs��fs��fs��fs��fs��f���=��,�Ul��Sm�q��L�����{~0ܹH���3��L`.��ؔ<?�Y��c���2ϟ�Y�x�?�${_L�]S}�6c6���m�L�_1����g��Sy��u��!1�z�dL���/S�wr���8"bQ�愘AT�7!ը$�
�z� �6�z_�;�j�<%rfQ���ATk.B �!B���!B���!B��!B��!�+��;�����\�lK}I.�s.ע��?0�]���Tw�R&<�>�2ᙘ���	������L�_����L�_��� ��e~��V�`��Yb)���OH|���k7ƌ`�s�1��\b��^2fS����U����۫szƏ}�_Cbz0�]Ҍ����6�����ԟ��������S������q��o\�,oZ=j��[T�����vK"ь��^�\���*l&)�VD�E�Q%�hG�dWsq���.Q%;Sh���vۋ�Fj)C>>�
C�,Yo6��cz0�c0�5cF0�Uc&0�ucf0��c0��cV0�6c���;i�	q�?1a�q�?1�L�#}w+eB�[)�hѡbL��E��1!�]*Ƅ8Z���hѩbL��E��1!��*�LG�~չYK���ɹ��8�TKBԤ�-P-�r�H�ܴ�2�rӢȘ���@Ƅܴ�2&�E7�1!7-���	�I�J����'��	�I�ʘM�i��w�87�³�z���\vq�>:���ɼ^���볥���N���7]�߽ͦ�Cʔ�gs�e<7���>=��O�VŘ0��^=��g�~-ƅ�*�:�_CbF0������G��L��<e0���Y�T��SfS=?ϘR+�p0��S��W_~w?���`��w`L�F��M�fSc60��&0fSoaJ�ܧV��G(�_}�k�3������-����e=$fS��d��>?���_#Ƭ`��4a��G�����iB�Ł��&cz0��d�0��w�0&đַ"M��E�3�XpN��T
�6�i<�ؾ@�E�6��5p8�:DMfT���L�5��5"j���h���z�hF�$�jA�$�jE�$�jC�$�jt� �@�C�$�ژ����]��C�&D{�Г�N�у��Z=h��у���=ٝ�G�C�bJՂ����^��}	���������w�Uܝ�5Iw'h��S���U|�b�v�Z�)��&��-z��x,Z���Q��?"꽐�n�$��n���EO�I����S_�����O��\�QL̨ID�bbFM��(&��V��/���%ъ��=j3jr��Č�d�QL�d<��G��o��&����&DM2ψ�$�^5�����I��Q�,�;�&Y�9�(�J�9�(�Z�9�(�Z��Q��$�����2���\��v�\E���7Dm�~G�"�5��H}�{D-R_�Q�0�{�ԛ˓�<��1$hBt�N��AD�����:A+��u�6D��������5�Rc�y����w_#Bv$w��K�H���#���'d@r7?OȈ�nv��	���<!3�?�z�/>��O[8��k;�8��>~;�kHЄ�23I4#���H� ��N��*�D�����ki��&Q��4m�4�P��4R�F#�&W��V���L��Y�hA�fJU@��&�6Dm��?s��h��?Y��N���C�^���?I�~y�4N��i~���T�=e0�KO�c��F��i8�^�USZ	:�S}�+ʷ��W�^?��t�k�7	 V   �U�>�v@��ϡ�1ٌ*3�D����(�D���U�)�&D�*�DG��^���<$Z ���$:"j�5�D%���w���������S      A   �  x���[S�J���_�O[���hn�=cǆ�SB΋�-U�DY2��=2#K3��
��*���MOO_G�����������z��?-�Rz����׋��pH(���#�	﬛d_�Y��=�\?ɀ��F.s8�-�!�9U�� ���֐��򈉈{#�Ԑ����G�����}_Z�um��Hx��TCd��;�zr��PZx��q���rg�/Տ(��}Rٮ>��n����ӛ�E�aJ"�hM4%��R�G�u��I���z�o`�����ԕD���J^P�<5;p�y��-,��^��'��3xM7�l�����}�4[������L�YZ��.�_8de�����E�7DD�
�C(tϑ�0�qI ����z��W�;��P���H�?�} ���AO���@�CEuR99&Xxnm>D��kaꬶ�&��o�}|��Y��v�p��W��	|���d�"�(�_��=���o��7�[?͈���"�N�$)QWKW3 <*�@�I���T� [?[�4t&�s8��J�T����`GN��T�~9Z���H�3��fw��E��,F
���H����l�j	��S�{�q����OIV ���@�ujw}��y\p�O�����O�i�n����ú��7�y�P�2���)2�.��o��0fLu�>���͜ hUpSd3��nu�2ǡ��0Z�g=�)�Y���L�I������|����a����ðՌ0��*�f�1������������7�����[��b��^�%P}�����ޓ��X���c�
�aK�U�4��Jp�a9I�W�
�b�Ĩ���<��";htjx^���}�J�2�3��Y��L�J�����\�0V5v����}�f�%d����ٞB���GK�Ea�K��%��?�q	���1�2YY���aU_�9n���lr�Q"�!�q�F��n�������S.>����=TCB��nWCQ�Ų=��"�7��g��諨���זؼ�u��@��.�wF[T}�~4'�5E�P)��?p�0�R�GNL���MZSdv:�3�c�m�K��`:�?�W�A��\*D�do�R�.i"[��s���*t}���~/z�-���_N�r����IG}��D�P��߁M�O^��ʬ�a��KU�=sˢ�a]%ҡH��]�?��W�}(U�n��X5�1l��}�L����߈lO��{��'	"�S>}���8�����������
�tW��3���E;n���l&�k�ôE�_'��d�C�6XO
�n]�~��77Um��)UZ\/�T�ԕ����M�!��r쯿���P��k����3��XH�4����z����߆������ʳ\4���a��_�V�j����������ɿJ�����P���x1��5܎&�U�=qB�-�Dv�j���T֫����f#�f��D��І��Ǟ�������� �F���ΰ<ÿ��1�>���&�K����N[dW�INF�����j���g[��o�`j��_b�}�VA��D~��[�+\�q�!��Ή8�2�!V�uY56��H@�����3ׇ���LϤ�ڃ29Wc���;M���~q�j�g��׹�㷥�'MEM��V|Xc�6�"���_QDE@^쬎޼/�4rM8L3��W��>
S���M���Cy��S�;��,�8�u	��;�������&�g�q�=��S�2�̔$��ϱ�pQ�j߁��,.�	ʶ�.q* ��wv4d��CfzV���<.�2��Ί�Y����r:���o`�\�^�ф{����l0Q�I�r�ęn��2����{1������E����@Hĸ���&�U�u���F&E���eS��D.}�U��}�uv[�l���7���i,c�����duQ⸌��!���QS��gze�"BO����r>�U�s�gi	�x�`#�=���ٿ����ȷՅ��<"\�`y5_��b1�ub�t�V;���c����`      :   o   x���1� ��=���BE�<�����gp��XA��/-X &fMA�(
�(�3�~"���=����^^��h��'�,����m�\x��8'x������sO/9;�/���P[u      8   Q   x�3�t7Qp��u�4202�50�50U00�20�25�352�60�#�eԏU����V��1��y=#KK�ZaR\1z\\\ �$"�      <   \   x�U̻�0��L�ź\l'xj��Gw���N�D���޳2��4�d,m�d=�P~���_דQM���Aoz"���v�;n     