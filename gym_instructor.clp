; User attributes
(deftemplate user-details
   (slot height)           ; Height in cm
   (slot weight)           ; Weight in kg
   (slot age)              ; Age in years
   (slot body-type)        ; Body type: ectomorph, mesomorph, endomorph
   (slot experience-level) ; Biginner, Intermediate, Advanced
   (slot goal))            ; Fitness goal: weight-loss, muscle-gain, endurance

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

; Diet Facts

(deffacts diet-plan-facts
    "Initial set of diet facts"
    (diet 
        (goal "muscle-gain") 
        (name "High-Protein Muscle Gain Plan") 
        (description "A diet rich in proteins and complex carbs to support muscle repair and growth.") 
        (breakfast "6 egg whites, 2 slices of whole-grain toast, 1 banana, and 1 cup of black coffee.") 
        (lunch "Grilled chicken breast, 1 cup of brown rice, and steamed broccoli.") 
        (snack "Greek yogurt with a handful of almonds.") 
        (dinner "Grilled salmon, sweet potato, and a mixed green salad with olive oil dressing.") 
        (notes "Ensure adequate hydration and supplement with a protein shake post-workout."))


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
        (goal "athletic-performance") 
        (name "Performance Boost Plan") 
        (description "A balanced diet to improve stamina, recovery, and overall athletic performance.") 
        (breakfast "Oatmeal with berries, a tablespoon of peanut butter, and a glass of orange juice.") 
        (lunch "Grilled chicken wrap with whole-grain tortilla, spinach, and hummus.") 
        (snack "A smoothie with spinach, banana, protein powder, and almond milk.") 
        (dinner "Quinoa, grilled steak, roasted sweet potato, and green beans.") 
        (notes "Stay hydrated, and consider electrolyte drinks during high-intensity workouts."))

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
        (goal "muscle-gain") 
        (name "Vegan High-Protein Plan") 
        (description "A plant-based diet rich in proteins to support muscle growth.") 
        (breakfast "Tofu scramble with spinach, a slice of whole-grain toast, and an apple.") 
        (lunch "Lentil curry with quinoa and a side of steamed vegetables.") 
        (snack "A protein smoothie with pea protein powder, almond milk, and frozen berries.") 
        (dinner "Grilled tempeh, sweet potato mash, and sautéed kale.") 
        (notes "Supplement with B12 and omega-3 if needed."))


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
        (goal "heart-health") 
        (name "Heart-Healthy Plan") 
        (description "A diet low in saturated fats and rich in omega-3 for cardiovascular health.") 
        (breakfast "Oatmeal with flaxseeds, walnuts, and blueberries.") 
        (lunch "Grilled salmon, quinoa, and steamed asparagus.") 
        (snack "A handful of unsalted nuts and an apple.") 
        (dinner "Grilled chicken, brown rice, and a side of mixed greens with olive oil dressing.") 
        (notes "Limit sodium intake and avoid trans fats.")))


; #######################################################################################################


; Supplement Facts

(deffacts supplement-facts
    "Initial set of supplement facts"
    (supplement 
        (goal muscle-gain) 
        (type protein) 
        (recommendation "Whey protein after workouts for muscle repair and growth.") 
        (notes "Best taken within 30 minutes post-workout."))

    (supplement 
        (goal muscle-gain) 
        (type creatine) 
        (recommendation "Creatine monohydrate for strength and size gains.") 
        (notes "Take 5 grams daily, preferably post-workout."))

    (supplement 
        (goal muscle-gain) 
        (type BCAA) 
        (recommendation "Branched-Chain Amino Acids (BCAAs) to reduce muscle soreness.") 
        (notes "Consume during or immediately after workouts."))

    (supplement 
        (goal muscle-gain) 
        (type pre-workout) 
        (recommendation "Pre-workout supplements for increased energy and focus.") 
        (notes "Take 20-30 minutes before workouts. Avoid if sensitive to caffeine."))

    (supplement 
        (goal weight-loss) 
        (type fat-burner) 
        (recommendation "Green tea extract to boost metabolism.") 
        (notes "Take 1-2 capsules with meals."))

    (supplement 
        (goal weight-loss) 
        (type L-carnitine) 
        (recommendation "L-carnitine to promote fat burning during workouts.") 
        (notes "Consume 1-2 grams before exercise."))

    (supplement 
        (goal weight-loss) 
        (type CLA) 
        (recommendation "Conjugated Linoleic Acid (CLA) to support fat loss.") 
        (notes "Take 1-2 grams with meals."))

    (supplement 
        (goal weight-loss) 
        (type fiber) 
        (recommendation "Psyllium husk to improve satiety and digestion.") 
        (notes "Mix 1 teaspoon in water before meals."))

    
    (supplement 
        (goal athletic-performance) 
        (type beta-alanine) 
        (recommendation "Beta-alanine to delay fatigue during high-intensity activities.") 
        (notes "Take 2-5 grams daily, preferably before workouts."))

    (supplement 
        (goal athletic-performance) 
        (type electrolyte) 
        (recommendation "Electrolyte powders to maintain hydration during endurance activities.") 
        (notes "Mix with water and consume during workouts."))

    (supplement 
        (goal athletic-performance) 
        (type caffeine) 
        (recommendation "Caffeine for improved endurance and focus.") 
        (notes "Consume 100-200 mg 30 minutes before workouts. Avoid late in the day to prevent sleep issues."))

    
    (supplement 
        (goal general-health) 
        (type multivitamin) 
        (recommendation "A high-quality multivitamin to cover daily nutrient needs.") 
        (notes "Take with breakfast for optimal absorption."))

    (supplement 
        (goal general-health) 
        (type omega-3) 
        (recommendation "Fish oil or flaxseed oil for heart and brain health.") 
        (notes "Take 1-2 grams daily with meals."))

    (supplement 
        (goal general-health) 
        (type vitamin-D) 
        (recommendation "Vitamin D3 for immune support and bone health.") 
        (notes "Take 1000-2000 IU daily, preferably with a meal containing fat."))

    (supplement 
        (goal general-health) 
        (type magnesium) 
        (recommendation "Magnesium to support muscle function and reduce cramps.") 
        (notes "Take 200-400 mg before bed for relaxation and better sleep."))

    
    (supplement 
        (goal recovery) 
        (type glutamine) 
        (recommendation "Glutamine for improved recovery and immune support.") 
        (notes "Take 5-10 grams post-workout or before bed."))

    (supplement 
        (goal recovery) 
        (type zinc-magnesium) 
        (recommendation "ZMA (Zinc, Magnesium, Vitamin B6) to enhance recovery and sleep.") 
        (notes "Take before bed on an empty stomach."))

    
    (supplement 
        (goal immune-boost) 
        (type vitamin-C) 
        (recommendation "Vitamin C for enhanced immune function.") 
        (notes "Take 500-1000 mg daily, especially during illness or stress."))

    (supplement 
        (goal immune-boost) 
        (type echinacea) 
        (recommendation "Echinacea extract to reduce the severity and duration of colds.") 
        (notes "Use at the onset of symptoms for best results."))

    (supplement 
        (goal immune-boost) 
        (type probiotics) 
        (recommendation "Probiotic supplements to improve gut health and immunity.") 
        (notes "Consume daily with meals."))

    
    (supplement 
        (goal cognitive-boost) 
        (type nootropics) 
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

(deftemplate supplement-recommendation
   (slot goal)             
   (slot type)            
   (slot recommendation)   
   (slot notes))           


(defrule gym-equipments-rule
   "Respond to Gym Equipments choice"
   (user-choice 2)
   =>
   (printout t "You selected 'Gym Equipments'." crlf)
   ;; Add logic or call other rules here
   (assert (selected-option "Gym Equipments")))


(defrule supplements-rule
   "Respond to Supplements choice"
   (user-choice 3)
   =>
   (printout t "You selected 'Supplements'." crlf)
   ;; Add logic or call other rules here
   (assert (selected-option "Supplements")))

(defrule advices-rule
   "Respond to Advices about exercises choice"
   (user-choice 4)
   =>
   (printout t "You selected 'Advices about exercises'." crlf)
   ;; Add logic or call other rules here
   (assert (selected-option "Advices about exercises")))


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
   ?user-details <- (user-details (goal ?goal))  ;; Match user goal
   ?supplement-fact <- (supplement (goal ?goal)      ;; Match diet plan with the same goal
                       (type ?type)
                       (recommendation ?recommendation)
                       (notes ?notes))
   =>
   ;; Assert a recommendation based on the matched goal
   (assert (supplement-recommendation 
            (type ?type)
            (recommendation ?recommendation)
            (notes ?notes))))
