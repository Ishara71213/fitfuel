Map<String, dynamic> scheduleMock = {
  "Beginner": {
    "description":
        "This program is designed for individuals new to fitness or returning after a break. It focuses on building a foundation of strength, improving basic movements, and gradually increasing intensity.",
    "day1": {
      "workoutType": "Full Body Strength",
      "exercises": [
        {"exercise": "Bodyweight Squats", "sets": 3, "reps": 10},
        {"exercise": "Push-ups", "sets": 3, "reps": 10},
        {"exercise": "Assisted Pull-ups", "sets": 3, "reps": 8},
        {"exercise": "Plank", "sets": 3, "duration": "30 seconds"}
      ]
    },
    "day2": {
      "workoutType": "Cardio",
      "exercises": [
        {"exercise": "Brisk Walking", "duration": "20 minutes"},
        {"exercise": "Cycling", "duration": "20 minutes"}
      ]
    },
    "day3": {"workoutType": "Rest or Light Activity"}
  },
  "Intermediate": {
    "description":
        "For those with some fitness experience, this program adds complexity to workouts. It includes a mix of strength and cardiovascular exercises to enhance overall fitness.",
    "day1": {
      "workoutType": "Upper Body Strength",
      "exercises": [
        {"exercise": "Bench Press", "sets": 4, "reps": 8},
        {"exercise": "Rows", "sets": 4, "reps": 10},
        {"exercise": "Shoulder Press", "sets": 3, "reps": 10},
        {"exercise": "Bicep Curls", "sets": 3, "reps": 12}
      ]
    },
    "day2": {
      "workoutType": "Cardio and Core",
      "exercises": [
        {"exercise": "Running", "duration": "25 minutes"},
        {"exercise": "Plank Variations", "sets": 3, "duration": "30 seconds"}
      ]
    },
    "day3": {
      "workoutType": "Lower Body Strength",
      "exercises": [
        {"exercise": "Squats", "sets": 4, "reps": 10},
        {"exercise": "Deadlifts", "sets": 3, "reps": 8},
        {"exercise": "Lunges", "sets": 3, "reps": 12}
      ]
    },
    "day4": {"workoutType": "Rest or Light Activity"}
  },
  "Advanced": {
    "description":
        "This program is for those who have a solid fitness foundation and are ready to push their limits. It incorporates compound movements and high-intensity training to stimulate muscle growth and endurance.",
    "day1": {
      "workoutType": "Compound Movements",
      "exercises": [
        {"exercise": "Squats", "sets": 5, "reps": 8},
        {"exercise": "Bench Press", "sets": 5, "reps": 8},
        {"exercise": "Deadlifts", "sets": 5, "reps": 6}
      ]
    },
    "day2": {
      "workoutType": "Cardio and Core",
      "exercises": [
        {"exercise": "High-Intensity Sprints", "duration": "20 minutes"},
        {"exercise": "Hanging Leg Raises", "sets": 4, "reps": 15}
      ]
    },
    "day3": {
      "workoutType": "Isolation Movements",
      "exercises": [
        {"exercise": "Dumbbell Flyes", "sets": 4, "reps": 12},
        {"exercise": "Tricep Dips", "sets": 4, "reps": 12},
        {"exercise": "Lat Pulldowns", "sets": 4, "reps": 10}
      ]
    },
    "day4": {"workoutType": "Active Recovery or Rest Day"}
  },
  "Expert": {
    "description":
        "For individuals seeking peak performance, this program focuses on powerlifting, explosive movements, and targeted hypertrophy exercises. It requires a high level of fitness and dedication.",
    "day1": {
      "workoutType": "Powerlifting Focus",
      "exercises": [
        {"exercise": "Back Squats", "sets": 5, "reps": 5},
        {"exercise": "Bench Press", "sets": 5, "reps": 5},
        {"exercise": "Sumo Deadlifts", "sets": 5, "reps": 5}
      ]
    },
    "day2": {
      "workoutType": "Cardio and Explosive Movements",
      "exercises": [
        {"exercise": "Box Jumps", "sets": 4, "reps": 8},
        {"exercise": "Rowing Intervals", "duration": "20 minutes"}
      ]
    },
    "day3": {
      "workoutType": "Hypertrophy Focus",
      "exercises": [
        {"exercise": "Leg Press", "sets": 4, "reps": 10},
        {"exercise": "Incline Dumbbell Press", "sets": 4, "reps": 12},
        {"exercise": "Barbell Rows", "sets": 4, "reps": 10}
      ]
    },
    "day4": {"workoutType": "Active Recovery or Rest Day"}
  },
  "Elite": {
    "description":
        "Designed for elite athletes or individuals with extensive training experience, this program combines strength, conditioning, and advanced techniques. It demands high intensity and meticulous attention to recovery.",
    "day1": {
      "workoutType": "Strength and Power",
      "exercises": [
        {"exercise": "Back Squats", "sets": 5, "reps": 5},
        {"exercise": "Bench Press", "sets": 5, "reps": 5},
        {"exercise": "Deadlifts", "sets": 5, "reps": 5}
      ]
    },
    "day2": {
      "workoutType": "Cardio and Plyometrics",
      "exercises": [
        {"exercise": "Sprint Intervals", "duration": "20 minutes"},
        {"exercise": "Box Jumps", "sets": 4, "reps": 8}
      ]
    },
    "day3": {
      "workoutType": "Hypertrophy Focus",
      "exercises": [
        {"exercise": "Front Squats", "sets": 4, "reps": 8},
        {"exercise": "Incline Dumbbell Press", "sets": 4, "reps": 10},
        {"exercise": "Barbell Rows", "sets": 4, "reps": 10}
      ]
    },
    "day4": {
      "workoutType": "Active Recovery or Low-Intensity Cardio",
      "exercises": [
        {"exercise": "Cycling", "duration": "30 minutes"}
      ]
    },
    "day5": {
      "workoutType": "Powerlifting Accessories",
      "exercises": [
        {"exercise": "Romanian Deadlifts", "sets": 4, "reps": 8},
        {"exercise": "Close-Grip Bench Press", "sets": 4, "reps": 10},
        {"exercise": "Pull-ups", "sets": 4, "reps": 10}
      ]
    },
    "day6": {
      "workoutType": "High-Intensity Interval Training (HIIT)",
      "exercises": [
        {"exercise": "Battle Ropes", "duration": "15 minutes"},
        {"exercise": "Rowing Sprints", "duration": "15 minutes"}
      ]
    },
    "day7": {"workoutType": "Rest or Active Recovery"}
  }
};
