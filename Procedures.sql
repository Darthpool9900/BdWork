-- Stored procedure para adicionar um novo usuário
CREATE PROCEDURE AddUser(IN username VARCHAR(50), IN email VARCHAR(100), IN password VARCHAR(255))
BEGIN
  INSERT INTO User (Username, Email, Password, DateJoined)
  VALUES (username, email, password, CURRENT_DATE);
END;

-- Stored procedure para adicionar um novo grupo
CREATE PROCEDURE AddGroup(IN groupName VARCHAR(100), IN description TEXT, IN createdBy INT)
BEGIN
  INSERT INTO Group (GroupName, Description, CreatedBy, DateCreated)
  VALUES (groupName, description, createdBy, CURRENT_DATE);
END;

-- Stored procedure para adicionar uma nova página
CREATE PROCEDURE AddPage(IN pageName VARCHAR(100), IN description TEXT, IN createdBy INT)
BEGIN
  INSERT INTO Page (PageName, Description, CreatedBy, DateCreated)
  VALUES (pageName, description, createdBy, CURRENT_DATE);
END;

-- Stored procedure para adicionar um novo post
CREATE PROCEDURE AddPost(IN content TEXT, IN postedBy INT, IN groupID INT, IN pageID INT, IN userID INT)
BEGIN
  INSERT INTO Post (Content, PostedBy, GroupID, PageID, UserID, DatePosted)
  VALUES (content, postedBy, groupID, pageID, userID, CURRENT_DATE);
END;

-- Stored procedure para adicionar uma nova reação
CREATE PROCEDURE AddReaction(IN type VARCHAR(50), IN userID INT, IN postID INT)
BEGIN
  INSERT INTO Reaction (Type, UserID, PostID, DateReacted)
  VALUES (type, userID, postID, CURRENT_DATE);
END;

-- Stored procedure para adicionar um novo comentário
CREATE PROCEDURE AddComment(IN content TEXT, IN userID INT, IN postID INT)
BEGIN
  INSERT INTO Comment (Content, UserID, PostID, DateCommented)
  VALUES (content, userID, postID, CURRENT_DATE);
END;
