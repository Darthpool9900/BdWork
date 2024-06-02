-- Criar uma visão para ver detalhes dos posts com as reações e comentários
CREATE VIEW PostDetails AS
SELECT p.PostID, p.Content, p.DatePosted, u.Username AS PostedBy,
       r.Type AS ReactionType, c.Content AS CommentContent, c.DateCommented
FROM Post p
JOIN User u ON p.PostedBy = u.UserID
LEFT JOIN Reaction r ON p.PostID = r.PostID
LEFT JOIN Comment c ON p.PostID = c.PostID;
