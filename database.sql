use quiz_99groups_test;

CREATE TABLE quizzes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    topic VARCHAR(255),
    quiz_data JSON,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    chat_id VARCHAR(20) UNIQUE,
    name VARCHAR(100) NULL,
    state VARCHAR(50) DEFAULT 'START',
    current_quiz_id INT NULL,
    current_question_index INT DEFAULT 0,
    score INT DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    FOREIGN KEY (current_quiz_id) REFERENCES quizzes(id) ON SET NULL
);

CREATE TABLE messages (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    role ENUM('user', 'assistant'),
    message TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);