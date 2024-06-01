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

# Desafío 2 - ¿Quién ha publicado cuántos y dónde?
SELECT
    authors.au_id,
    authors.au_lname,
    authors.au_fname,
    publishers.pub_name,
    COUNT(titles.title) AS titles_count
FROM titleauthor
LEFT JOIN authors
    ON titleauthor.au_id = authors.au_id
LEFT JOIN titles
    ON titles.title_id = titleauthor.title_id
LEFT JOIN publishers
    ON titles.pub_id = publishers.pub_id
GROUP BY
    authors.au_id,
    authors.au_lname,
    authors.au_fname,
    publishers.pub_name
ORDER BY
    titles_count DESC;
    
# Desafío 3 - Autores Más Vendidos
SELECT
    authors.au_id,
    authors.au_lname,
    authors.au_fname,
    COUNT(titleauthor.title_id) AS titles_count
FROM titleauthor
LEFT JOIN authors
    ON titleauthor.au_id = authors.au_id
GROUP BY
    authors.au_id,
    authors.au_lname,
    authors.au_fname
ORDER BY
    titles_count DESC
LIMIT 3;

# Desafío 4 - Ranking de Autores Más Vendidos
SELECT
    authors.au_id,
    authors.au_lname,
    authors.au_fname,
    COUNT(titleauthor.title_id) AS titles_count
FROM authors
LEFT JOIN titleauthor
    ON titleauthor.au_id = authors.au_id
GROUP BY
    authors.au_id,
    authors.au_lname,
    authors.au_fname
ORDER BY
    titles_count DESC;
