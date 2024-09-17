CREATE TABLE Users (
    user_id INTEGER PRIMARY KEY AUTOINCREMENT, 
    name TEXT NOT NULL,
    email TEXT NOT NULL,
    password TEXT NOT NULL,
    role TEXT CHECK(role IN ('user', 'trainer')) NOT NULL,
    signup_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Workout_Routines (
    routine_id INTEGER PRIMARY KEY AUTOINCREMENT, 
    user_id INTEGER,
    routine_name TEXT NOT NULL,
    routine_date DATE NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

CREATE TABLE Exercises (
    exercise_id INTEGER PRIMARY KEY AUTOINCREMENT,
    routine_id INTEGER,
    exercise_name TEXT NOT NULL,
    sets INTEGER NOT NULL,
    reps INTEGER NOT NULL,
    weight REAL, 
    duration INTEGER, 
    FOREIGN KEY (routine_id) REFERENCES Workout_Routines(routine_id)
);

CREATE TABLE Exercise_Analytics (
    analytics_id INTEGER PRIMARY KEY AUTOINCREMENT, 
    user_id INTEGER,
    average_sets REAL, 
    average_reps REAL,
    average_weight REAL,
    workout_frequency INTEGER, 
    progress_notes TEXT,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

CREATE TABLE Goals (
    goal_id INTEGER PRIMARY KEY AUTOINCREMENT, 
    user_id INTEGER,
    goal_type TEXT NOT NULL,
    goal_description TEXT,
    target_date DATE,
    status TEXT CHECK(status IN ('in progress', 'achieved', 'failed')) DEFAULT 'in progress',
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

INSERT INTO Users (name, email, password, role) 
VALUES 
    ('Ethan Rambutan', 'ethanrambutan@example.com', 'password123', 'user'), 
    ('Gab London', 'gablon@example.com', 'password456', 'user'), 
    ('Eli Thomas', 'thomaseli@example.com', 'password789', 'trainer'); 

INSERT INTO Workout_Routines (user_id, routine_name, routine_date) 
VALUES 
    (1, 'Upper Body Strength', '2024-09-17'),
    (1, 'Cardio Blast', '2024-09-18'),
    (2, 'Full Body Workout', '2024-09-19');

INSERT INTO Exercises (routine_id, exercise_name, sets, reps, weight, duration) 
VALUES 
    (1, 'Bench Press', 4, 10, 80.0, NULL),
    (1, 'Pull-Ups', 3, 8, NULL, NULL),
    (2, 'Running', NULL, NULL, NULL, 30),
    (3, 'Squats', 4, 12, 100.0, NULL),
    (3, 'Deadlift', 3, 10, 120.0, NULL);

INSERT INTO Exercises (routine_id, exercise_name, sets, reps, weight, duration) 
VALUES 
    (1, 'Dumbbell Curl', 3, 15, 20.0, NULL),
    (1, 'Tricep Dips', 4, 12, NULL, NULL),
    (2, 'Cycling', NULL, NULL, NULL, 45),
    (2, 'Jump Rope', NULL, NULL, NULL, 20),
    (3, 'Leg Press', 4, 10, 150.0, NULL),
    (3, 'Bench Press', 4, 8, 90.0, NULL),
    (3, 'Lat Pulldown', 3, 12, 70.0, NULL),
    (3, 'Running', NULL, NULL, NULL, 40);

INSERT INTO Exercise_Analytics (user_id, average_sets, average_reps, average_weight, workout_frequency, progress_notes) 
VALUES 
    (1, 3.5, 9, 80.0, 3, 'Improving strength'),
    (2, 4, 12, 95.0, 4, 'Good progress');

INSERT INTO Exercise_Analytics (user_id, average_sets, average_reps, average_weight, workout_frequency, progress_notes) 
VALUES 
    (1, 4.0, 10.5, 85.0, 4, 'Steady improvement in strength training.'),
    (2, 4.5, 12.0, 100.0, 5, 'Excellent progress in cardio and strength.'),
    (3, 3.5, 11.0, 90.0, 3, 'Good overall progress but needs more consistency.');

INSERT INTO Goals (user_id, goal_type, goal_description, target_date, status) 
VALUES 
    (1, 'muscle gain', 'Increase muscle mass by 5kg in 3 months', '2024-12-31', 'in progress'),
    (2, 'cardio improvement', 'Run 5km in under 25 minutes', '2024-12-31', 'in progress');

INSERT INTO Goals (user_id, goal_type, goal_description, target_date, status) 
VALUES 
    (1, 'strength gain', 'Increase bench press weight to 100kg', '2024-11-30', 'in progress'),
    (2, 'weight loss', 'Reduce body fat by 5%', '2024-12-31', 'in progress'),
    (3, 'muscle gain', 'Gain 3kg of muscle in 2 months', '2024-11-30', 'achieved');
