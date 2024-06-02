-- Consultar todos os usuários
SELECT * FROM User;

-- Consultar todos os posts de um grupo específico
SELECT * FROM Post WHERE GroupID = 1;

-- Consultar todos os posts de uma página específica
SELECT * FROM Post WHERE PageID = 1;

-- Consultar todas as reações de um post específico
SELECT * FROM Reaction WHERE PostID = 1;

-- Consultar todos os comentários de um post específico
SELECT * FROM Comment WHERE PostID = 1;

-- Consultar todos os grupos que um usuário participa
SELECT g.* 
FROM Group g
JOIN UserGroup ug ON g.GroupID = ug.GroupID
WHERE ug.UserID = 1;

-- Consultar todas as páginas que um usuário segue
SELECT p.*
FROM Page p
JOIN PageFollower pf ON p.PageID = pf.PageID
WHERE pf.UserID = 1;
