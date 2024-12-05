; User attributes
(deftemplate user-details
   (slot height)           ; Height in cm
   (slot weight)           ; Weight in kg
   (slot age)              ; Age in years
   (slot body-type)        ; Body type: ectomorph, mesomorph, endomorph
   (slot experience-level) ; Biginner, Intermediate, Advanced
   (slot goal))            ; Fitness goal: weight-loss, muscle-gain, endurance

; User attributes/inputs for workout plan
(deftemplate user-details-workout-plan
   (slot height)           ; Height in cm
   (slot weight)           ; Weight in kg
   (slot age)              ; Age in years
   (slot body-type)        ; Body type: ectomorph, mesomorph, endomorph
   (slot experience-level) ; Biginner, Intermediate, Advanced
   (slot goal))            ; Fitness goal: weight-loss, muscle-gain, endurance

(deftemplate best-plan
   "Represents the current best workout plan based on score"
   (slot id)
   (slot score))


; User inputs for supplement recommendation
(deftemplate user-details-supplements
    (slot height)           ; Height in cm
    (slot weight)           ; Weight in kg
    (slot goal)            ; Fitness goal: weight-loss, muscle-gain, endurance
    )

;Template for workout plans
(deftemplate workout-plan
   (slot id)                  ; Unique identifier for the plan
   (slot goal)                ; Target fitness goal
   (slot experience-level)    ; Applicable experience level
   (slot body-type)           ; Suitable body type
   (slot duration)            ; Duration of workout in minutes
   (slot frequency)           ; Days per week
   (slot exercises)           ; Key exercises
   (slot score))              ; Suitability score

(deftemplate validated-best-plan
   (slot goal (type STRING))
   (slot experience-level (type STRING))
   (slot body-type (type STRING))
   (slot duration (type INTEGER))
   (slot frequency (type INTEGER))
   (slot exercises (type STRING))
)


; Exercise details
(deftemplate exercise
   (slot name)             ; Exercise name
   (slot category)         ; Category: strength, cardio, flexibility
   (slot description)      ; Brief explanation
   (slot equipment))       ; Equipment required, if any

; Diet plans
(deftemplate diet
   (slot goal)             ; Fitness goal (e.g., muscle-gain, weight-loss)
   (slot name)             ; Name of the diet plan
   (slot description)      ; Description of the diet plan
   (slot breakfast)        ; Breakfast meal plan
   (slot lunch)            ; Lunch meal plan
   (slot snack)            ; Snack meal plan
   (slot dinner)           ; Dinner meal plan
   (slot notes))           ; Additional notes for the diet

; Supplements
(deftemplate supplement
   (slot goal)             ; Fitness goal
   (slot type)             ; Supplement type
   (slot recommendation)   ; Recommendation details
   (slot notes))           ; Additional notes or usage tips


(deftemplate plan-validated
   (slot id)       ; ID of the workout plan
   (slot status))  ; Validation status (e.g., "Valid")


; Equipment details
(deftemplate equipment
   (slot name)             ; Equipment name
   (slot usage)            ; How it's used
   (slot related-exercises)) ; Exercises it is used for

; ###################################################################

(deffacts exercise-facts
   "Initial set of exercise facts"
   (exercise 
      (name squat) 
      (category strength) 
      (description "Strengthens legs and core.") 
      (equipment "Barbell"))
   (exercise 
      (name treadmill-running) 
      (category cardio) 
      (description "Improves cardiovascular endurance.") 
      (equipment "Treadmill"))
   (exercise 
      (name bench-press) 
      (category strength) 
      (description "Builds chest, shoulders, and triceps.") 
      (equipment "Barbell"))
   (exercise 
      (name pull-up) 
      (category strength) 
      (description "Strengthens back, biceps, and core.") 
      (equipment "Pull-up bar"))
   (exercise 
      (name deadlift) 
      (category strength) 
      (description "Works the entire posterior chain.") 
      (equipment "Barbell"))
   (exercise 
      (name cycling) 
      (category cardio) 
      (description "Enhances cardiovascular fitness and leg strength.") 
      (equipment "Stationary bike"))
   (exercise 
      (name plank) 
      (category core) 
      (description "Strengthens core muscles and improves stability.") 
      (equipment "None"))
   (exercise 
      (name bicep-curl) 
      (category strength) 
      (description "Isolates and strengthens the biceps.") 
      (equipment "Dumbbells"))
   (exercise 
      (name yoga) 
      (category flexibility) 
      (description "Improves flexibility and reduces stress.") 
      (equipment "Yoga mat"))
   (exercise 
      (name burpees) 
      (category cardio) 
      (description "Full-body workout that improves cardiovascular fitness.") 
      (equipment "None"))
   (exercise 
      (name shoulder-press) 
      (category strength) 
      (description "Targets shoulders and triceps.") 
      (equipment "Dumbbells"))
   (exercise 
      (name rowing-machine) 
      (category cardio) 
      (description "Works both cardiovascular and muscular endurance.") 
      (equipment "Rowing machine"))
   (exercise 
      (name kettlebell-swing) 
      (category strength) 
      (description "Improves power and core strength.") 
      (equipment "Kettlebell"))
   (exercise 
      (name lunges) 
      (category strength) 
      (description "Strengthens legs and improves balance.") 
      (equipment "Dumbbells"))
   (exercise 
      (name push-ups) 
      (category strength) 
      (description "Works chest, shoulders, triceps, and core.") 
      (equipment "None"))
   (exercise 
      (name jumping-jacks) 
      (category cardio) 
      (description "Boosts cardiovascular endurance.") 
      (equipment "None"))
   (exercise 
      (name cable-crossover) 
      (category strength) 
      (description "Isolates chest muscles.") 
      (equipment "Cable machine"))
   (exercise 
      (name leg-press) 
      (category strength) 
      (description "Targets quadriceps, hamstrings, and glutes.") 
      (equipment "Leg press machine"))
   (exercise 
      (name Russian-twists) 
      (category core) 
      (description "Strengthens obliques and core muscles.") 
      (equipment "Medicine ball"))
   (exercise 
      (name step-ups) 
      (category strength) 
      (description "Works legs and improves coordination.") 
      (equipment "Box or bench")))

; ################################################################################

(deffacts workout-plan-facts
   "Facts for different workout plans based on goals, experience level, and body type"
   
   ; Workout Plan for Weight Loss - Beginner
   (workout-plan
      (id "WL-BEG-01")
      (goal "weight-loss")
      (experience-level "beginner")
      (body-type "endomorph")
      (duration 45)
      (frequency 3)
      (exercises "Brisk walking, Bodyweight squats, Push-ups, Plank")
      (score 85))

   ; Workout Plan for Weight Loss - Intermediate
   (workout-plan
      (id "WL-INT-01")
      (goal "weight-loss")
      (experience-level "intermediate")
      (body-type "mesomorph")
      (duration 60)
      (frequency 4)
      (exercises "Jogging, Lunges, Dumbbell rows, Mountain climbers")
      (score 90))

   ; Workout Plan for Muscle Gain - Beginner
   (workout-plan
      (id "MG-BEG-01")
      (goal "muscle-gain")
      (experience-level "beginner")
      (body-type "ectomorph")
      (duration 50)
      (frequency 3)
      (exercises "Dumbbell bench press, Barbell deadlift, Pull-ups, Plank")
      (score 80))

   ; Workout Plan for Muscle Gain - Advanced
   (workout-plan
      (id "MG-ADV-01")
      (goal "muscle-gain")
      (experience-level "advanced")
      (body-type "mesomorph")
      (duration 90)
      (frequency 5)
      (exercises "Barbell squats, Bench press, Deadlift, Weighted pull-ups, Overhead press")
      (score 95))

   ; Workout Plan for Endurance - Beginner
   (workout-plan
      (id "EN-BEG-01")
      (goal "endurance")
      (experience-level "beginner")
      (body-type "any")
      (duration 30)
      (frequency 2)
      (exercises "Cycling, Jump rope, Bodyweight circuit training")
      (score 70))

   ; Workout Plan for Endurance - Intermediate
   (workout-plan
      (id "EN-INT-01")
      (goal "endurance")
      (experience-level "intermediate")
      (body-type "any")
      (duration 60)
      (frequency 4)
      (exercises "Running intervals, Kettlebell swings, Rowing machine")
      (score 85))

   ; Workout Plan for Endurance - Advanced
   (workout-plan
      (id "EN-ADV-01")
      (goal "endurance")
      (experience-level "advanced")
      (body-type "any")
      (duration 75)
      (frequency 5)
      (exercises "Marathon training, High-intensity interval training (HIIT), Long-distance cycling")
      (score 95)))



; ################################################################################

; Diet Facts

(deffacts diet-plan-facts
    "Initial set of diet facts"
    (diet 
        (goal "muscle-gain") 
        (name "High-Protein Muscle Gain Plan") 
        (description "Designed to fuel your journey to building muscle, this diet plan emphasizes high-protein foods to support muscle repair and growth, alongside complex carbohydrates to provide sustained energy for intense workouts. Healthy fats are included to enhance recovery and overall hormonal balance, creating the perfect nutritional foundation for achieving your muscle-gain goals.") 
        (breakfast "6 egg whites, 2 slices of whole-grain toast, 1 banana, and 1 cup of black coffee.") 
        (lunch "Grilled chicken breast, 1 cup of brown rice, and steamed broccoli.") 
        (snack "Greek yogurt with a handful of almonds.") 
        (dinner "Grilled salmon, sweet potato, and a mixed green salad with olive oil dressing.") 
        (notes "Ensure adequate hydration and supplement with a protein shake post-workout."))

    (diet 
        (goal "muscle-gain") 
        (name "Plant-Based Muscle Gain Plan") 
        (description "A nutrient-dense plant-based diet packed with proteins, healthy fats, and complex carbohydrates to support muscle growth and recovery.") 
        (breakfast "Tofu scramble with spinach, mushrooms, and whole-grain toast, paired with a cup of almond milk.") 
        (lunch "Lentil and quinoa salad with mixed greens, cherry tomatoes, and tahini dressing.") 
        (snack "A protein smoothie with pea protein, almond butter, banana, and oat milk.") 
        (dinner "Chickpea curry with brown rice and roasted vegetables.") 
        (notes "Include fortified plant-based foods for additional B12 and iron, and consider a vegan protein powder post-workout."))

    (diet 
        (goal "muscle-gain") 
        (name "Keto Muscle Gain Plan") 
        (description "A high-fat, moderate-protein, and low-carb diet designed to support muscle growth while staying in ketosis.") 
        (breakfast "3 scrambled eggs cooked in butter, 2 slices of avocado, and a handful of walnuts.") 
        (lunch "Grilled chicken thighs with sautéed spinach and cauliflower rice.") 
        (snack "A keto-friendly protein shake with coconut milk and chia seeds.") 
        (dinner "Baked salmon with asparagus and a side of zucchini noodles tossed in olive oil.") 
        (notes "Monitor your carb intake carefully and ensure adequate electrolytes to sustain energy during workouts."))

    (diet 
        (goal "muscle-gain") 
        (name "High-Calorie Bulk Plan") 
        (description "A calorie-dense plan ideal for individuals looking to maximize muscle gain by consuming surplus calories.") 
        (breakfast "4 scrambled eggs, 2 slices of whole-grain toast with peanut butter, and a glass of whole milk.") 
        (lunch "Grilled beef burger (without the bun), a baked potato, and a side of steamed green beans.") 
        (snack "Cottage cheese with a handful of mixed nuts and honey.") 
        (dinner "Grilled chicken thighs, quinoa, and roasted sweet potatoes.") 
        (notes "Add calorie-dense snacks like trail mix or nut butter to meet your daily caloric needs."))


    (diet 
        (goal "fat-loss") 
        (name "Low-Carb Fat Loss Plan") 
        (description "A diet low in carbs and high in healthy fats to promote fat burning.") 
        (breakfast "2 boiled eggs, 1/2 avocado, and a cup of green tea.") 
        (lunch "Grilled chicken salad with mixed greens, cucumber, and a lemon vinaigrette.") 
        (snack "1 small handful of mixed nuts and seeds.") 
        (dinner "Grilled turkey burger without the bun, sautéed spinach, and steamed asparagus.") 
        (notes "Avoid processed sugars and include at least 30 minutes of daily exercise."))

    (diet 
        (goal "fat-loss") 
        (name "High-Protein Fat Loss Plan") 
        (description "A high-protein diet designed to preserve muscle mass while promoting fat loss.") 
        (breakfast "3 egg whites, 1 slice of whole-grain toast, and a cup of black coffee.") 
        (lunch "Grilled salmon with a side of quinoa and steamed broccoli.") 
        (snack "Greek yogurt (low-fat) with a sprinkle of chia seeds.") 
        (dinner "Grilled chicken breast with roasted zucchini and a mixed green salad with olive oil dressing.") 
        (notes "Stay hydrated and prioritize lean protein sources to enhance satiety and fat metabolism."))

    (diet 
        (goal "fat-loss") 
        (name "Vegan Fat Loss Plan") 
        (description "A nutrient-dense, plant-based diet focused on whole foods to support fat loss.") 
        (breakfast "Chia pudding made with almond milk, topped with fresh blueberries and sliced almonds.") 
        (lunch "Quinoa and chickpea salad with mixed greens, cherry tomatoes, and lemon-tahini dressing.") 
        (snack "A handful of roasted chickpeas or air-popped popcorn.") 
        (dinner "Lentil stew with a side of steamed broccoli and roasted sweet potatoes.") 
        (notes "Include fortified foods or supplements to meet B12 and iron needs."))



   (diet 
        (goal "athletic-performance") 
        (name "Performance Boost Plan") 
        (description "A balanced diet to improve stamina, recovery, and overall athletic performance.") 
        (breakfast "Oatmeal with berries, a tablespoon of peanut butter, and a glass of orange juice.") 
        (lunch "Grilled chicken wrap with whole-grain tortilla, spinach, and hummus.") 
        (snack "A smoothie with spinach, banana, protein powder, and almond milk.") 
        (dinner "Quinoa, grilled steak, roasted sweet potato, and green beans.") 
        (notes "Stay hydrated, and consider electrolyte drinks during high-intensity workouts."))

    (diet 
        (goal "athletic-performance") 
        (name "Endurance Fuel Plan") 
        (description "Designed to sustain energy levels during long training sessions, this plan combines complex carbs, lean proteins, and essential fats.") 
        (breakfast "Scrambled eggs with spinach, whole-grain toast, and a cup of mixed berries.") 
        (lunch "Grilled salmon with a side of brown rice and steamed broccoli.") 
        (snack "Trail mix with nuts, seeds, and dried fruits.") 
        (dinner "Whole-wheat pasta with grilled chicken, olive oil, cherry tomatoes, and Parmesan cheese.") 
        (notes "Include carb-rich snacks before and after workouts to optimize energy and recovery."))

    (diet 
        (goal "athletic-performance") 
        (name "Plant-Based Power Plan") 
        (description "A plant-based diet emphasizing nutrient-dense foods to fuel athletic performance and recovery.") 
        (breakfast "Chia seed pudding with almond milk, topped with sliced bananas and a handful of walnuts.") 
        (lunch "Lentil and quinoa salad with mixed greens, roasted veggies, and tahini dressing.") 
        (snack "A protein smoothie with pea protein, spinach, and frozen mango.") 
        (dinner "Tofu stir-fry with brown rice, bell peppers, broccoli, and a ginger-soy glaze.") 
        (notes "Ensure adequate intake of plant-based protein sources and consider a B12 supplement."))

    (diet 
        (goal "athletic-performance") 
        (name "Keto-Athlete Plan") 
        (description "A low-carb, high-fat ketogenic plan tailored for athletes focusing on fat as the primary fuel source.") 
        (breakfast "Scrambled eggs with spinach and a side of avocado.") 
        (lunch "Grilled chicken with a side of mixed greens, olive oil dressing, and a sprinkle of feta cheese.") 
        (snack "A handful of macadamia nuts.") 
        (dinner "Grilled salmon with cauliflower mash and roasted Brussels sprouts.") 
        (notes "Monitor carb intake carefully to stay in ketosis and include electrolytes for hydration."))


    (diet 
        (goal "general-health") 
        (name "Balanced Nutrition Plan") 
        (description "A balanced diet for maintaining general health and wellness.") 
        (breakfast "1 slice of whole-grain toast with avocado, 1 boiled egg, and herbal tea.") 
        (lunch "Grilled chicken Caesar salad with light dressing and a slice of whole-grain bread.") 
        (snack "A piece of fresh fruit, such as an apple or orange.") 
        (dinner "Grilled fish, roasted vegetables, and a small portion of quinoa.") 
        (notes "Include plenty of water, and aim for 5 servings of fruits and vegetables daily."))

    (diet 
        (goal "general-health") 
        (name "Plant-Based Health Plan") 
        (description "A plant-forward diet to promote overall wellness, packed with vitamins, minerals, and fiber.") 
        (breakfast "Chia seed pudding made with almond milk, topped with sliced banana and a sprinkle of flaxseeds.") 
        (lunch "Lentil and vegetable soup with a slice of whole-grain bread.") 
        (snack "A handful of unsalted mixed nuts and a pear.") 
        (dinner "Tofu stir-fry with brown rice, broccoli, bell peppers, and a sesame-soy glaze.") 
        (notes "Aim for a variety of colorful vegetables to maximize nutrient intake."))

    (diet 
        (goal "general-health") 
        (name "High-Fiber Nutrition Plan") 
        (description "A diet emphasizing high-fiber foods for improved digestion and overall wellness.") 
        (breakfast "Whole-grain cereal with low-fat milk and a handful of raspberries.") 
        (lunch "Black bean and avocado salad with a lime vinaigrette.") 
        (snack "Air-popped popcorn or a handful of almonds.") 
        (dinner "Grilled chicken breast, quinoa, and steamed green beans.") 
        (notes "Ensure at least 25-30 grams of fiber daily by including fruits, vegetables, and whole grains."))


    (diet 
        (goal "immune-boost") 
        (name "Immune-Boost Plan") 
        (description "A diet to strengthen immunity with vitamins and antioxidants.") 
        (breakfast "Greek yogurt with honey and a handful of mixed berries.") 
        (lunch "Chicken soup with whole-grain bread and a side of spinach salad.") 
        (snack "Carrot sticks with hummus.") 
        (dinner "Baked salmon with turmeric, steamed broccoli, and quinoa.") 
        (notes "Include foods rich in vitamin C and zinc for added benefits."))

    (diet 
        (goal "immune-boost") 
        (name "Antioxidant-Rich Plan") 
        (description "A diet emphasizing foods packed with antioxidants, vitamins, and minerals to support immune function.") 
        (breakfast "Oatmeal topped with blueberries, walnuts, and a drizzle of honey.") 
        (lunch "Grilled chicken breast, steamed asparagus, and a side of sweet potato.") 
        (snack "A handful of mixed nuts and a small orange.") 
        (dinner "Stir-fried tofu with bell peppers, broccoli, and garlic served over brown rice.") 
        (notes "Incorporate a variety of colorful fruits and vegetables daily to maximize antioxidants."))
    
    (diet 
        (goal "immune-boost") 
        (name "Vitamin-D Support Plan") 
        (description "A diet incorporating foods and nutrients to improve vitamin D levels and immunity.") 
        (breakfast "Egg omelet with spinach, mushrooms, and a slice of whole-grain toast.") 
        (lunch "Grilled salmon with a side of roasted Brussels sprouts and mashed sweet potato.") 
        (snack "A handful of walnuts and a small bunch of grapes.") 
        (dinner "Grilled chicken with a mixed greens salad and a drizzle of olive oil.") 
        (notes "Pair foods rich in vitamin D with healthy fats for better absorption."))



    (diet 
        (goal "heart-health") 
        (name "Heart-Healthy Plan") 
        (description "A diet low in saturated fats and rich in omega-3 for cardiovascular health.") 
        (breakfast "Oatmeal with flaxseeds, walnuts, and blueberries.") 
        (lunch "Grilled salmon, quinoa, and steamed asparagus.") 
        (snack "A handful of unsalted nuts and an apple.") 
        (dinner "Grilled chicken, brown rice, and a side of mixed greens with olive oil dressing.") 
        (notes "Limit sodium intake and avoid trans fats."))

    (diet 
        (goal "heart-health") 
        (name "Mediterranean Heart-Health Plan") 
        (description "Inspired by the Mediterranean diet, this plan emphasizes healthy fats, whole grains, and fresh produce to support cardiovascular health.") 
        (breakfast "Whole-grain toast with avocado, a boiled egg, and a side of fresh orange slices.") 
        (lunch "Grilled mackerel, a quinoa and chickpea salad with cherry tomatoes, cucumber, and olive oil dressing.") 
        (snack "Greek yogurt with a drizzle of honey and a handful of almonds.") 
        (dinner "Baked cod with lemon and herbs, steamed broccoli, and roasted sweet potatoes.") 
        (notes "Incorporate olive oil as the primary cooking fat, and eat fatty fish at least twice a week.")))



; #######################################################################################################


; Supplement Facts

(deffacts supplement-facts
    "Initial set of supplement facts"
    (supplement 
        (goal "muscle-gain") 
        (type "protein") 
        (recommendation "Whey protein after workouts for muscle repair and growth.") 
        (notes "Best taken within 30 minutes post-workout."))

    (supplement 
        (goal "muscle-gain") 
        (type "creatine") 
        (recommendation "Creatine monohydrate for strength and size gains.") 
        (notes "Take 5 grams daily, preferably post-workout."))

    (supplement 
        (goal "muscle-gain") 
        (type "BCAA") 
        (recommendation "Branched-Chain Amino Acids (BCAAs) to reduce muscle soreness.") 
        (notes "Consume during or immediately after workouts."))

    (supplement 
        (goal "muscle-gain") 
        (type "pre-workout") 
        (recommendation "Pre-workout supplements for increased energy and focus.") 
        (notes "Take 20-30 minutes before workouts. Avoid if sensitive to caffeine."))

    (supplement 
        (goal "weight-loss") 
        (type "fat-burner") 
        (recommendation "Green tea extract to boost metabolism.") 
        (notes "Take 1-2 capsules with meals."))

    (supplement 
        (goal "weight-loss") 
        (type "L-carnitine") 
        (recommendation "L-carnitine to promote fat burning during workouts.") 
        (notes "Consume 1-2 grams before exercise."))

    (supplement 
        (goal "weight-loss") 
        (type "CLA") 
        (recommendation "Conjugated Linoleic Acid (CLA) to support fat loss.") 
        (notes "Take 1-2 grams with meals."))

    (supplement 
        (goal "weight-loss") 
        (type "fiber") 
        (recommendation "Psyllium husk to improve satiety and digestion.") 
        (notes "Mix 1 teaspoon in water before meals."))

    
    (supplement 
        (goal "athletic-performance") 
        (type "beta-alanine") 
        (recommendation "Beta-alanine to delay fatigue during high-intensity activities.") 
        (notes "Take 2-5 grams daily, preferably before workouts."))

    (supplement 
        (goal "athletic-performance") 
        (type "electrolyte") 
        (recommendation "Electrolyte powders to maintain hydration during endurance activities.") 
        (notes "Mix with water and consume during workouts."))

    (supplement 
        (goal "athletic-performance") 
        (type "caffeine") 
        (recommendation "Caffeine for improved endurance and focus.") 
        (notes "Consume 100-200 mg 30 minutes before workouts. Avoid late in the day to prevent sleep issues."))

    
    (supplement 
        (goal "general-health") 
        (type "multivitamin") 
        (recommendation "A high-quality multivitamin to cover daily nutrient needs.") 
        (notes "Take with breakfast for optimal absorption."))

    (supplement 
        (goal "general-health") 
        (type "omega-3") 
        (recommendation "Fish oil or flaxseed oil for heart and brain health.") 
        (notes "Take 1-2 grams daily with meals."))

    (supplement 
        (goal "general-health") 
        (type "vitamin-D") 
        (recommendation "Vitamin D3 for immune support and bone health.") 
        (notes "Take 1000-2000 IU daily, preferably with a meal containing fat."))

    (supplement 
        (goal "general-health") 
        (type "magnesium") 
        (recommendation "Magnesium to support muscle function and reduce cramps.") 
        (notes "Take 200-400 mg before bed for relaxation and better sleep."))

    
    (supplement 
        (goal "recovery") 
        (type "glutamine") 
        (recommendation "Glutamine for improved recovery and immune support.") 
        (notes "Take 5-10 grams post-workout or before bed."))

    (supplement 
        (goal "recovery") 
        (type "zinc-magnesium") 
        (recommendation "ZMA (Zinc, Magnesium, Vitamin B6) to enhance recovery and sleep.") 
        (notes "Take before bed on an empty stomach."))

    
    (supplement 
        (goal "immune-boost") 
        (type "vitamin-C") 
        (recommendation "Vitamin C for enhanced immune function.") 
        (notes "Take 500-1000 mg daily, especially during illness or stress."))

    (supplement 
        (goal "immune-boost") 
        (type "echinacea") 
        (recommendation "Echinacea extract to reduce the severity and duration of colds.") 
        (notes "Use at the onset of symptoms for best results."))

    (supplement 
        (goal "immune-boost") 
        (type "probiotics") 
        (recommendation "Probiotic supplements to improve gut health and immunity.") 
        (notes "Consume daily with meals."))

    
    (supplement 
        (goal "cognitive-boost") 
        (type "nootropics") 
        (recommendation "Nootropics like L-theanine and alpha-GPC to enhance focus.") 
        (notes "Take 1-2 capsules as needed, typically before mentally demanding tasks.")))


; ##############################################################################################

; Equipment Facts
(deffacts equipment-facts
    "Initial set of equipment facts"
    (equipment 
        (name treadmill) 
        (usage "Cardio exercises like running or walking.") 
        (related-exercises "treadmill-running"))

    (equipment 
        (name dumbbell) 
        (usage "Strength exercises like bicep curls, lunges, shoulder press.") 
        (related-exercises "bicep-curls, lunges, shoulder-press"))

    (equipment 
        (name barbell) 
        (usage "Heavy lifting exercises to build strength, such as squats, deadlifts.") 
        (related-exercises "squats, deadlifts, bench-press"))

    (equipment 
        (name kettlebell) 
        (usage "Dynamic strength exercises and conditioning.") 
        (related-exercises "kettlebell-swings, goblet-squats, Turkish-get-up"))

    (equipment 
        (name rowing-machine) 
        (usage "Cardio and full-body endurance workouts.") 
        (related-exercises "rowing"))

    (equipment 
        (name pull-up-bar) 
        (usage "Upper body strength exercises.") 
        (related-exercises "pull-ups, chin-ups, hanging-leg-raises"))

    (equipment 
        (name stability-ball) 
        (usage "Core-strengthening and balance exercises.") 
        (related-exercises "plank-on-stability-ball, stability-ball-crunches"))

    (equipment 
        (name resistance-bands) 
        (usage "Low-impact strength exercises and stretching.") 
        (related-exercises "banded-squats, band-pull-aparts, resistance-band-curls"))

    (equipment 
        (name leg-press-machine) 
        (usage "Lower body strength exercises focusing on legs.") 
        (related-exercises "leg-press"))

    (equipment 
        (name bench) 
        (usage "Support for exercises like bench press, step-ups.") 
        (related-exercises "bench-press, step-ups, tricep-dips"))

    (equipment 
        (name elliptical-machine) 
        (usage "Low-impact cardio exercises.") 
        (related-exercises "elliptical-training"))

    (equipment 
        (name cable-machine) 
        (usage "Strength exercises with adjustable resistance.") 
        (related-exercises "cable-lateral-raises, cable-rows, tricep-pushdowns"))

    (equipment 
        (name squat-rack) 
        (usage "Strength exercises such as squats and overhead press.") 
        (related-exercises "squats, overhead-press"))

    (equipment 
        (name punching-bag) 
        (usage "Boxing and cardio workouts.") 
        (related-exercises "boxing, kickboxing"))

    (equipment 
        (name spin-bike) 
        (usage "Indoor cycling for cardio and leg endurance.") 
        (related-exercises "cycling, spin-workouts"))

    (equipment 
        (name medicine-ball) 
        (usage "Explosive power and core-strengthening exercises.") 
        (related-exercises "medicine-ball-slams, Russian-twists"))

    (equipment 
        (name foam-roller) 
        (usage "Post-workout muscle recovery and mobility.") 
        (related-exercises "foam-rolling, stretching"))

    (equipment 
        (name lat-pulldown-machine) 
        (usage "Back-strengthening exercises.") 
        (related-exercises "lat-pulldowns"))

    (equipment 
        (name smith-machine) 
        (usage "Assisted barbell strength exercises.") 
        (related-exercises "Smith-machine-squats, bench-press"))

    (equipment 
        (name jump-rope) 
        (usage "Cardio and agility training.") 
        (related-exercises "jumping-rope, double-unders")))

; ###############################################################################
(deftemplate diet-recommendation
   (slot name)
   (slot description)
   (slot breakfast)
   (slot lunch)
   (slot snack)
   (slot dinner)
   (slot notes))

(deftemplate recommendation-supplement
   (slot goal)             
   (slot type)            
   (slot recommendation)   
   (slot notes))           

;rule to suggest diet plans
(defrule recommend-diets
   "Recommend a diet plan based on the user's fitness goal"
   ?user-details <- (user-details (goal ?goal))  ;; Match user goal
   ?diet-fact <- (diet (goal ?goal)      ;; Match diet plan with the same goal
                       (name ?name)
                       (description ?description)
                       (breakfast ?breakfast)
                       (lunch ?lunch)
                       (snack ?snack)
                       (dinner ?dinner)
                       (notes ?notes))
   =>
   ;; Assert a recommendation based on the matched goal
   (assert (diet-recommendation 
            (name ?name) 
            (description ?description)
            (breakfast ?breakfast)
            (lunch ?lunch)
            (snack ?snack)
            (dinner ?dinner)
            (notes ?notes))))


;rule to suggest supplements
(defrule recommend-supplements
   "Recommend a supplement plan based on the user's fitness goal"
   ?user-details-supplements <- (user-details-supplements (goal ?goal))  ;; Match user goal
   ?supplement-facts <- (supplement (goal ?goal)  ;; Match diet suppliment with the same goal
                       (type ?type)
                       (recommendation ?recommendation)
                       (notes ?notes))
   =>
   ;; Assert a recommendation based on the matched goal
   (assert (recommendation-supplement
            (goal ?goal)
            (type ?type)
            (recommendation ?recommendation)
            (notes ?notes))))



;; Scoring rules

;score rule for goal 
(defrule calculate-score-goal
   "Increase score for matching fitness goals"
   ?user-details-workout-plan <- (user-details-workout-plan (goal ?goal))
   ?plan <- (workout-plan (goal ?goal) (score ?score))
   =>
   (modify ?plan (score (+ ?score 10))))

;score rule for experience levels
(defrule calculate-score-experience
   "Increase score for matching experience levels"
   ?user-details-workout-plan <- (user-details-workout-plan (experience-level ?experience))
   ?plan <- (workout-plan (experience-level ?experience) (score ?score))
   =>
   (modify ?plan (score (+ ?score 5))))

;score rule for body type
(defrule calculate-score-body-type
   "Increase score for matching body types"
   ?user-details-workout-plan <- (user-details-workout-plan (body-type ?body-type))
   ?plan <- (workout-plan (body-type ?body-type) (score ?score))
   =>
   (modify ?plan (score (+ ?score 3))))



(defrule find-best-plan
   "Identify the best workout plan based on the highest score"
   ?current-best <- (best-plan (id ?best-id) (score ?best-score))
   ?plan <- (workout-plan (id ?plan-id) (score ?score&: (> ?score ?best-score)))
   =>
   (retract ?current-best)
   (assert (best-plan (id ?plan-id) (score ?score))))

;; Initial fact for comparison
(deffacts initialize-best-plan
   (best-plan (id "none") (score 0)))

(defrule create-validated-best-plan
   ?best <- (best-plan (id ?id&~"none") (score ?score))
   ?plan <- (workout-plan (id ?id)
                          (goal ?goal)
                          (experience-level ?exp-level)
                          (body-type ?body-type)
                          (duration ?duration)
                          (frequency ?freq)
                          (exercises ?exercises))
   =>
   (assert (validated-best-plan 
      (goal ?goal)
      (experience-level ?exp-level)
      (body-type ?body-type)
      (duration ?duration)
      (frequency ?freq)
      (exercises ?exercises)
   ))
)