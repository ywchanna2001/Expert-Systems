import streamlit as st
from clips import Environment

# Initialize the Clips Environment
env = Environment()

# Load the CLIPS rules from the external file
try:
    env.load("gym_instructor.clp")
except Exception as e:
    st.error(f"Error loading knowledge base: {e}")

# Function to reset and run the CLIPS environment
def reset_environment():
    env.reset()
    env.run()

# Function to fetch diet recommendations
def fetch_recommendations():
    recommendations = []
    for fact in env.facts():
    #    print("Fact Debugging:", fact)  # Debugging the facts
        if str(fact).startswith("(diet-recommendation"):
            # Extract slot values directly from the slots dictionary
            try:
                slot_values = {slot.name: fact[slot.name] for slot in fact.template.slots}
                recommendations.append({
                    "name": slot_values["name"],
                    "description": slot_values["description"],
                    "breakfast": slot_values["breakfast"],
                    "lunch": slot_values["lunch"],
                    "snack": slot_values["snack"],
                    "dinner": slot_values["dinner"],
                    "notes": slot_values["notes"],
                })
            except Exception as e:
                print("Error accessing slot value:", e)
                raise
    return recommendations

# Function to fetch supplement recommendations
def fetch_supplement_recommendations():
    recommendations = []
    for fact in env.facts():
#        print("Fact Debugging:", fact)  # Debugging the facts
        if str(fact).startswith("(recommendation-supplement"):
            try:
                slot_values = {slot.name: fact[slot.name] for slot in fact.template.slots}
                recommendations.append({
                    "type": slot_values["type"],
                    "recommendation": slot_values["recommendation"],
                    "notes": slot_values["notes"],
                })
            except Exception as e:
                print("Error accessing slot value:", e)
                raise
    return recommendations

# Function to fetch workout plan recommendations
# def fetch_workout_recommendations():
#     recommendations = []
#     for fact in env.facts():
#         if str(fact).startswith("(workout-plan"):
#             try:
#                 slot_values = {slot.name: fact[slot.name] for slot in fact.template.slots}
#                 # Debugging: Print slot values to verify
#                 print(f"Slot Values Debug: {slot_values}")
#                 if all(val is not None for val in slot_values.values()):  # Only add valid facts
#                     recommendations.append({
#                         "goal": slot_values.get("goal", "N/A"),
#                         "experience-level": slot_values.get("experience-level", "N/A"),
#                         "body-type": slot_values.get("body-type", "N/A"),
#                         "duration": slot_values.get("duration", "N/A"),
#                         "frequency": slot_values.get("frequency", "N/A"),
#                         "exercises": slot_values.get("exercises", "N/A"),
#                     })
#             except Exception as e:
#                 print("Error accessing slot value:", e)
#                 raise
#     return recommendations

def fetch_best_workout():
    best_workout = None
    for fact in env.facts():
        if str(fact).startswith("(validated-best-plan"):
            slot_values = {slot.name: fact[slot.name] for slot in fact.template.slots}
            best_workout = slot_values
            break  # There's only one best plan
    return best_workout



# Streamlit UI
st.title("Gym Instructor Expert System")

# Dropdown menu for options
option = st.selectbox(
    "Please select an option:",
    ["Diet plans", "Gym Equipments", "Supplements", "Advices about exercises", "Workout Plans"]
)

# Handle Diet Plans Option
if option == "Diet plans":
    st.header("Diet Plans")

    with st.form("diet_form"):
        height = st.number_input("Enter your height (in cm):", min_value=0)
        weight = st.number_input("Enter your weight (in kg):", min_value=0)
        age = st.number_input("Enter your age:", min_value=0)
        body_type = st.selectbox("Select your body type:", ["Ectomorph", "Mesomorph", "Endomorph"])
        experience_level = st.selectbox("Select your experience level:", ["Beginner", "Intermediate", "Advanced"])
        goal = st.selectbox("Select your fitness goal:", [
            "muscle-gain", "fat-loss", "athletic-performance", "general-health", 
            "immune-boost", "heart-health"
        ])
        submitted = st.form_submit_button("Submit")
        


    if submitted:
        # Reset and run the environment
        reset_environment()

        # Assert user data into CLIPS
        env.assert_string(f'(user-details (height {height}) (weight {weight}) (age {age}) '
                          f'(body-type "{body_type.lower()}") (experience-level "{experience_level.lower()}") '
                          f'(goal "{goal.lower()}"))')
        
        # Debugging: Print all facts in the environment after asserting user details
        # for fact in env.facts():
        #     print(fact)
        env.run()
        # Check the asserted facts for recommendations
        # for fact in env.facts():
        #     print(fact)

        # Fetch recommendations
        plans = fetch_recommendations()

        if plans:
            st.subheader("Recommended Diet Plans:")
            for plan in plans:
                st.text(f"Plan Name: {plan['name']}")
                st.text(f"Description: {plan['description']}")
                st.text(f"Breakfast: {plan['breakfast']}")
                st.text(f"Lunch: {plan['lunch']}")
                st.text(f"Snack: {plan['snack']}")
                st.text(f"Dinner: {plan['dinner']}")
                st.text(f"Notes: {plan['notes']}")
        else:
            st.error("No diet plans found for your selection.")

# ========================================================================>>>>>>>>>>>>>>>>

# Handle Suppliments Option
elif option == "Supplements":
    st.header("Supplement Recommendations")

    with st.form("diet_form"):
        height = st.number_input("Enter your height (in cm):", min_value=0)
        weight = st.number_input("Enter your weight (in kg):", min_value=0)
        goal = st.selectbox("Select your fitness goal:", [
            "muscle-gain", "weight-loss", "athletic-performance", "general-health" 
            ,"recovery", "immune-boost", "heart-health"
        ])
        submitted = st.form_submit_button("Submit")
        


    if submitted:
        # Reset and run the environment
        reset_environment()

        # Assert user data into CLIPS
        env.assert_string(f'(user-details-supplements (height {height}) (weight {weight}) '
                          f'(goal "{goal.lower()}"))')
        
        # Debugging: Print all facts in the environment after asserting user details
        # for fact in env.facts():
        #     print(fact)
        env.run()
        # Check the asserted facts for recommendations
        # for fact in env.facts():
        #     print(fact)

        # Fetch recommendations
        supplements = fetch_supplement_recommendations()

        if supplements:
            st.subheader("Recommended Supplements:")
            for supplement in supplements:
                
                st.text(f"Type: {supplement['type']}")
                st.text(f"Recommendation: {supplement['recommendation']}")
                st.text(f"Notes: {supplement['notes']}")        
        else:
            st.error("No supplement reccomendations found for your selection.")


# =================================================================================>>>>

elif option == "Workout Plans":
    st.header("Workout Plans Recommendations")

    with st.form("workout_form"):
        height = st.number_input("Enter your height (in cm):", min_value=0)
        weight = st.number_input("Enter your weight (in kg):", min_value=0)
        age = st.number_input("Enter your age:", min_value=0)
        body_type = st.selectbox("Select your body type:", ["Ectomorph", "Mesomorph", "Endomorph"])
        experience_level = st.selectbox("Select your experience level:", ["Beginner", "Intermediate", "Advanced"])
        goal = st.selectbox("Select your fitness goal:", [
            "muscle-gain", "fat-loss", "athletic-performance", "general-health", 
            "immune-boost", "heart-health"
        ])
        submitted = st.form_submit_button("Submit")


    if submitted:
        # Reset and run the environment
        reset_environment()

         # Assert user data into CLIPS
        env.assert_string(f'(user-details-workout-plan (height {height}) (weight {weight}) (age {age}) '
                          f'(body-type "{body_type.lower()}") (experience-level "{experience_level.lower()}") '
                          f'(goal "{goal.lower()}"))')
        
        
        env.run()
        
        # Check the asserted facts for recommendations
        for fact in env.facts():
            print(fact)

        # Fetch recommendations
        # workouts = fetch_workout_recommendations()

        # Fetch the best workout plan
        best_workout = fetch_best_workout()

        if best_workout:
                st.subheader("Recommended Workout Plans:")
            
                st.text(f"Goal: {best_workout['goal']}")
                st.text(f"Experience Level: {best_workout['experience-level']}")
                st.text(f"Body Type: {best_workout['body-type']}")
                st.text(f"Duration: {best_workout['duration']} minutes")
                st.text(f"Frequency: {best_workout['frequency']} times per week")
                st.text(f"Exercises: {best_workout['exercises']}")
        else:
            st.error("No workout plan recommendations found for your selections.")

