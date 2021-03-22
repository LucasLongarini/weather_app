CREATE TABLE IF NOT EXISTS City (
    CityId INTEGER PRIMARY KEY,
    lat REAL, 
    lon REAL, 
    name TEXT, 
    updatedCurrent INT,
    updatedDetails INT 
);

CREATE TABLE IF NOT EXISTS Weather (
    WeatherId INTEGER PRIMARY KEY AUTOINCREMENT, 
    cityId INT,
    type TEXT,
    date INT, 
    weatherTag INT,
    weatherDescription TEXT, 
    temperature REAL, 
    temperatureFeelLike REAL, 
    temperatureMax REAL, 
    temperatureMin REAL, 
    pressure REAL, 
    humidity REAL, 
    windSpeed REAL,
    rainProbability REAL,
    FOREIGN KEY (CityId) REFERENCES City(CityId) ON DELETE CASCADE
);