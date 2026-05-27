--Enlace del video 
https://drive.google.com/file/d/1JBY4jQvo3Ie14QX9gz7nwaxkOjil9Cgr/view?usp=sharing 

Parte 3 - Modificaciones realizadas
Archivos modificados
- `Vuelo.java` - Se agregó el atributo destino con su getter y setter
- `README.md` - Se documentaron los cambios

Script ejecutado en PostgreSQL
ALTER TABLE vuelos ADD COLUMN destino VARCHAR(100);
SELECT * FROM vuelos WHERE codigo = 'MX-123';
