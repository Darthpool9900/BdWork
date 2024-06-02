-- Criação de tablespace (apenas para banco de dados que suportam)
CREATE TABLESPACE socialnetwork_ts
  DATAFILE 'socialnetwork_ts.dbf'
  SIZE 100M
  AUTOEXTEND ON
  NEXT 10M MAXSIZE UNLIMITED;

-- Criação das tabelas
CREATE TABLE User (
  UserID INT PRIMARY KEY,
  Username VARCHAR(50) NOT NULL,
  Email VARCHAR(100) NOT NULL UNIQUE,
  Password VARCHAR(255) NOT NULL,
  DateJoined DATE DEFAULT CURRENT_DATE
);

CREATE TABLE Group (
  GroupID INT PRIMARY KEY,
  GroupName VARCHAR(100) NOT NULL,
  Description TEXT,
  CreatedBy INT,
  DateCreated DATE DEFAULT CURRENT_DATE,
  FOREIGN KEY (CreatedBy) REFERENCES User(UserID)
);

CREATE TABLE Page (
  PageID INT PRIMARY KEY,
  PageName VARCHAR(100) NOT NULL,
  Description TEXT,
  CreatedBy INT,
  DateCreated DATE DEFAULT CURRENT_DATE,
  FOREIGN KEY (CreatedBy) REFERENCES User(UserID)
);

CREATE TABLE Post (
  PostID INT PRIMARY KEY,
  Content TEXT NOT NULL,
  PostedBy INT,
  GroupID INT,
  PageID INT,
  UserID INT,
  DatePosted DATE DEFAULT CURRENT_DATE,
  FOREIGN KEY (PostedBy) REFERENCES User(UserID),
  FOREIGN KEY (GroupID) REFERENCES Group(GroupID),
  FOREIGN KEY (PageID) REFERENCES Page(PageID),
  FOREIGN KEY (UserID) REFERENCES User(UserID)
);

CREATE TABLE Reaction (
  ReactionID INT PRIMARY KEY,
  Type VARCHAR(50) NOT NULL,
  UserID INT,
  PostID INT,
  DateReacted DATE DEFAULT CURRENT_DATE,
  FOREIGN KEY (UserID) REFERENCES User(UserID),
  FOREIGN KEY (PostID) REFERENCES Post(PostID)
);

CREATE TABLE Comment (
  CommentID INT PRIMARY KEY,
  Content TEXT NOT NULL,
  UserID INT,
  PostID INT,
  DateCommented DATE DEFAULT CURRENT_DATE,
  FOREIGN KEY (UserID) REFERENCES User(UserID),
  FOREIGN KEY (PostID) REFERENCES Post(PostID)
);

CREATE TABLE Friendship (
  FriendshipID INT PRIMARY KEY,
  User1ID INT,
  User2ID INT,
  DateAdded DATE DEFAULT CURRENT_DATE,
  FOREIGN KEY (User1ID) REFERENCES User(UserID),
  FOREIGN KEY (User2ID) REFERENCES User(UserID),
  CHECK (User1ID <> User2ID)
);

CREATE TABLE Follower (
  FollowerID INT PRIMARY KEY,
  FollowerUserID INT,
  FollowedUserID INT,
  DateFollowed DATE DEFAULT CURRENT_DATE,
  FOREIGN KEY (FollowerUserID) REFERENCES User(UserID),
  FOREIGN KEY (FollowedUserID) REFERENCES User(UserID),
  CHECK (FollowerUserID <> FollowedUserID)
);

CREATE TABLE PageFollower (
  PageFollowerID INT PRIMARY KEY,
  UserID INT,
  PageID INT,
  DateFollowed DATE DEFAULT CURRENT_DATE,
  FOREIGN KEY (UserID) REFERENCES User(UserID),
  FOREIGN KEY (PageID) REFERENCES Page(PageID)
);

CREATE TABLE UserGroup (
  UserID INT,
  GroupID INT,
  PRIMARY KEY (UserID, GroupID),
  FOREIGN KEY (UserID) REFERENCES User(UserID),
  FOREIGN KEY (GroupID) REFERENCES Group(GroupID)
);
