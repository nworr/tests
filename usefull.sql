with tvue as ( 
    select * from pg_views
union
    select schemaname, matviewname, matviewowner, definition from pg_matviews
             )
select * from tvue
where definition like '%<NomTable>%'
-- test de l'appele d'une table par une vue (materialisée ou  non )
