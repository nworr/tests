-- test de l'appel d'une table <NomTable> par une vue (materialisée ou  non )
with tvue 
as (     select * from pg_views
union
    select schemaname, matviewname, matviewowner, definition from pg_matviews             )
select * from tvue
where definition like '%<NomTable>%'


-- pour cherche une table dans tous les schema
 select * from pg_tables where tablename like '%<Recherche>%'
 
 
-- pour trouver tout les schema (pas l'idéal , contient les objet systeme)
select  *  from information_schema.schemata 

-- pour générer les grant select on all table to pour un utilisateru et une base
select 
'GRANT SELECT ON ALL TABLES IN SCHEMA '||schema_name||' TO <user>;'
 from information_schema.schemata where catalog_name = <db_name> 
 
 
 
 --- import donnée de WFS
 -- 1 creation serv :
 CREATE SERVER <nomServeur>
    FOREIGN DATA WRAPPER ogr_fdw
    OPTIONS (format 'WFS', datasource 'WFS:<URL WFS>');
    
 -- 2 enventuellement changemr droits
 ALTER SERVER wfs_gesteau
    OWNER TO postgres;
    
-- 3 import de 1 ou plusique table
    IMPORT FOREIGN SCHEMA <namespace du serveur>
    -- eventuelleme,t 
    LIMIT TO <nomLayer>
   FROM SERVER <nomServeur> INTO public -- ou nom de schema local;
