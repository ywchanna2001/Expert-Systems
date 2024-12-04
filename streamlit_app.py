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
        print("Fact Debugging:", fact)  # Debugging the facts
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
        print("Fact Debugging:", fact)  # Debugging the facts
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




# Streamlit UI
st.title("Gym Instructor Expert System")

# Dropdown menu for options
option = st.selectbox(
    "Please select an option:",
    ["Diet plans", "Gym Equipments", "Supplements", "Advices about exercises"]
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
        for fact in env.facts():
            print(fact)
        env.run()
        # Check the asserted facts for recommendations
        for fact in env.facts():
            print(fact)

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
        for fact in env.facts():
            print(fact)
        env.run()
        # Check the asserted facts for recommendations
        for fact in env.facts():
            print(fact)

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
