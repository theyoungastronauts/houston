CREATE TABLE IF NOT EXISTS "public"."profile" (
    "id" bigint NOT NULL,
    "uuid" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "avatar" character varying NOT NULL,
    "bio" "text" NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL
);
ALTER TABLE "public"."profile" OWNER TO "postgres";
ALTER TABLE "public"."profile"
ALTER COLUMN "id"
ADD GENERATED BY DEFAULT AS IDENTITY (
        SEQUENCE NAME "public"."profile_id_seq" START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1
    );
ALTER TABLE ONLY "public"."profile"
ADD CONSTRAINT "profile_pkey" PRIMARY KEY ("id");