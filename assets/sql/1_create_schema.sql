CREATE TABLE IF NOT EXISTS City (
    id INT PRIMARY KEY,
    lat REAL, 
    lon REAL, 
    name TEXT, 
    updatedCurrent INT,
    updatedDetails INT 
);

CREATE TABLE IF NOT EXISTS Weather (
    id INT PRIMARY KEY, 
    cityId INT,
    type TEXT,
    date INT, 
    weatherId INT,
    weatherDescription TEXT, 
    temperature REAL, 
    temperatureFeelLike REAL, 
    temperatureMax REAL, 
    temperatureMin REAL, 
    pressure REAL, 
    humidity REAL, 
    windSpeed REAL,
    rainProbability REAL,
    FOREIGN KEY (cityId) REFERENCES City(id) ON DELETE CASCADE
);