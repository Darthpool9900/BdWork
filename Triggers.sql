-- Trigger para garantir que um usuário não possa reagir ao mesmo post mais de uma vez
CREATE TRIGGER no_duplicate_reactions
BEFORE INSERT ON Reaction
FOR EACH ROW
BEGIN
  IF EXISTS (SELECT 1 FROM Reaction WHERE UserID = NEW.UserID AND PostID = NEW.PostID) THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Duplicate reaction not allowed';
  END IF;
END;

-- Trigger para garantir que um usuário não possa comentar no mesmo post mais de uma vez
CREATE TRIGGER no_duplicate_comments
BEFORE INSERT ON Comment
FOR EACH ROW
BEGIN
  IF EXISTS (SELECT 1 FROM Comment WHERE UserID = NEW.UserID AND PostID = NEW.PostID) THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Duplicate comment not allowed';
  END IF;
END;
