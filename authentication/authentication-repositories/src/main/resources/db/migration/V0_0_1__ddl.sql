-- Users Table
CREATE TABLE Users
(
    Id                    CHAR(36) PRIMARY KEY,
    Name                  VARCHAR(100) NOT NULL,
    Surname               VARCHAR(100) NOT NULL,
    Email                 VARCHAR(255) NOT NULL,
    Password              VARCHAR(255) NOT NULL,
    Phone_Number          VARCHAR(20),
    Address               VARCHAR(255),
    Profile_picture       VARCHAR(255),
    Created               TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Updated               TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    Deleted               BOOLEAN   DEFAULT FALSE,
    Last_login_date       TIMESTAMP,
    Is_verified           BOOLEAN   DEFAULT FALSE,
    Social_media_provider VARCHAR(50),
    Social_media_id       VARCHAR(255),
    UNIQUE (Email, Deleted)
);

-- Roles Table
CREATE TABLE Roles
(
    Id          CHAR(36) PRIMARY KEY,
    Name        VARCHAR(100) NOT NULL,
    Description VARCHAR(255)
);

-- Permissions Table
CREATE TABLE Permissions
(
    Id   CHAR(36) PRIMARY KEY,
    Name VARCHAR(100) NOT NULL
);

-- Roles_Permissions Junction Table
CREATE TABLE Roles_Permissions
(
    role_id       CHAR(36),
    permission_id CHAR(36),
    PRIMARY KEY (role_id, permission_id),
    FOREIGN KEY (role_id) REFERENCES Roles (Id),
    FOREIGN KEY (permission_id) REFERENCES Permissions (Id)
);

-- Roles_Users Junction Table
CREATE TABLE Roles_Users
(
    role_id CHAR(36),
    user_id CHAR(36),
    PRIMARY KEY (role_id, user_id),
    FOREIGN KEY (role_id) REFERENCES Roles (Id),
    FOREIGN KEY (user_id) REFERENCES Users (Id)
);

-- UserSessions Table
CREATE TABLE UserSessions
(
    id               CHAR(36) PRIMARY KEY,
    user_id          CHAR(36),
    Expiry_timestamp TIMESTAMP NOT NULL,
    Is_active        BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (user_id) REFERENCES Users (Id)
);

-- EmailVerifications Table
CREATE TABLE EmailVerifications
(
    id                CHAR(36) PRIMARY KEY,
    user_id           CHAR(36),
    Verification_code VARCHAR(100) NOT NULL,
    Expiry_timestamp  TIMESTAMP    NOT NULL,
    Is_verified       BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (user_id) REFERENCES Users (Id)
);

-- PasswordResets Table
CREATE TABLE PasswordResets
(
    id               CHAR(36) PRIMARY KEY,
    user_id          CHAR(36),
    Reset_code       VARCHAR(100) NOT NULL,
    Expiry_timestamp TIMESTAMP    NOT NULL,
    Is_reset         BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (user_id) REFERENCES Users (Id)
);
