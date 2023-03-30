use Chinookk
/*--1. Encuentre el número total de facturas (invoices) de cada cliente junto con el nombre completo, la
ciudad y el correo electrónico de cada uno. Después de ejecutar la consulta descrita anteriormente, 
¿cuál es la dirección de correo electrónico de la quinta persona, František Wichterlová?*/

select c.firstname
,c.lastname
,c.city
,c.email
,COUNT( i.invoiceid) as 'total invoices'
from Customer c
left join Invoice i on c.customerid = i.customerid
group by c.firstname,c.lastname,c.city,c.email
;
/*2. Recupere el nombre de la pista, el álbum, el ID del artista (artistID) y el ID de la pista 
(trackID) para todos los álbumes. ¿Cuál es el título de la canción con trackID 12 del álbum 
"For Those About to Rock We Salute You"?*/

select a.title as album_title
--, a.Artistid
,ar.name as artist_name 
, t.Trackid
, t.name as track_name
from Album a
left join Track t on a.albumid = a.albumid
left join Artist as ar on a.albumid = ar.artistid
where a.title = 'For Those About to Rock We Salute You'  and t.trackid='12'
;
/*3. Encuentra el nombre y el ID de los artistas que no tienen álbumes. Después de ejecutar la 
consulta descrita anteriormente, dos de los registros devueltos tienen el mismo apellido. 
Diga cuál es.*/


