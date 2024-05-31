use publicaciones;

# Desafío 1 - ¿Quién ha publicado qué y dónde?
SELECT authors.au_id, authors.au_lname, authors.au_fname, titles.title, publishers.pub_name FROM titleauthor
LEFT JOIN authors
ON titleauthor.au_id = authors.au_id
LEFT JOIN titles
ON titles.title_id = titleauthor.title_id
LEFT JOIN publishers
ON titles.pub_id = publishers.pub_id
ORDER BY authors.au_id asc;