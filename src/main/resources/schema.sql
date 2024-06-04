CREATE TABLE PAYMENT
(
    ID           BIGINT       NOT NULL AUTO_INCREMENT,
    ORDER_ID     VARCHAR(255) NOT NULL,
    PAYMENT_KEY  VARCHAR(255) NOT NULL,
    ORDER_NAME   VARCHAR(255) NOT NULL,
    TOTAL_AMOUNT BIGINT       NOT NULL,
    PRIMARY KEY (ID),
    UNIQUE (ORDER_ID)
);

CREATE TABLE MEMBER
(
    ID       BIGINT       NOT NULL AUTO_INCREMENT,
    NAME     VARCHAR(255) NOT NULL,
    EMAIL    VARCHAR(255) NOT NULL,
    PASSWORD VARCHAR(255) NOT NULL,
    ROLE     VARCHAR(16)  NOT NULL CHECK (ROLE IN ('ADMIN', 'USER')),
    PRIMARY KEY (ID),
    UNIQUE (EMAIL)
);

CREATE TABLE RESERVATION_TIME
(
    ID       BIGINT NOT NULL AUTO_INCREMENT,
    START_AT TIME   NOT NULL,
    PRIMARY KEY (ID),
    UNIQUE (START_AT)
);

CREATE TABLE THEME
(
    ID          BIGINT       NOT NULL AUTO_INCREMENT,
    NAME        VARCHAR(255) NOT NULL,
    DESCRIPTION VARCHAR(255) NOT NULL,
    THUMBNAIL   VARCHAR(255) NOT NULL,
    PRIMARY KEY (ID)
);

CREATE TABLE RESERVATION
(
    ID        BIGINT NOT NULL AUTO_INCREMENT,
    MEMBER_ID BIGINT NOT NULL,
    DATE      DATE   NOT NULL,
    TIME_ID   BIGINT NOT NULL,
    THEME_ID  BIGINT NOT NULL,
    PAYMENT_ID BIGINT NOT NULL,
    PRIMARY KEY (ID),
    FOREIGN KEY (MEMBER_ID) REFERENCES MEMBER (ID),
    FOREIGN KEY (TIME_ID) REFERENCES RESERVATION_TIME (ID),
    FOREIGN KEY (THEME_ID) REFERENCES THEME (ID),
    FOREIGN KEY (PAYMENT_ID) REFERENCES PAYMENT (ID),
    UNIQUE (MEMBER_ID, DATE, TIME_ID, THEME_ID)
);
