CREATE OR REPLACE VIEW `esih_picstoria`.`all_file_info` AS SELECT 
f.id, f.mission, ym.year_mission, f.url, f.geon, f.feat, f.lat, f.lon, m.titre, t.tags_name   
FROM files f
LEFT OUTER JOIN metadata m ON m.id_file = f.id
LEFT OUTER JOIN tags t ON t.id_image = f.id
LEFT OUTER JOIN year_mission ym ON ym.mission = f.mission;