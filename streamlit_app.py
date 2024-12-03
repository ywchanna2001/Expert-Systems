import streamlit as st
from clips import Environment

# Initialize CLIPS Environment
env = Environment()
env.load("gym_instructor.clp")  # Load your CLIPS knowledge base
env.reset()

# Title of the application
st.title("Gym Expert System")

# User Options
options = ["Diet Plans", "Gym Equipments", "Supplements", "Advices about Exercises"]
choice = st.selectbox("Choose an option:", options)

# Submit choice and determine navigation
if st.button("Submit Choice"):
    # Assert user choice into CLIPS
    if choice == "Diet Plans":
        env.assert_string('(user-choice 1)')
        st.subheader("Enter Details for Diet Plan Recommendation")
        
        # Input fields with session state keys
        height = st.number_input("Enter your height (cm):", min_value=0, key="height")
        weight = st.number_input("Enter your weight (kg):", min_value=0, key="weight")
        age = st.number_input("Enter your age:", min_value=0, key="age")
        body_type = st.selectbox("Select your body type:", ["ectomorph", "mesomorph", "endomorph"], key="body_type")
        experience = st.selectbox("Select your experience level:", ["beginner", "intermediate", "advanced"], key="experience")
        goal = st.selectbox(
            "Select your fitness goal:",
            ["muscle-gain", "fat-loss", "athletic-performance", "general-health", "immune-boost", "heart-health"],
            key="goal"
        )

        if st.button("Submit Details"):
            # Assert user details into CLIPS
            env.assert_string(
                f'(user (height {height}) (weight {weight}) '
                f'(age {age}) (body-type "{body_type}") '
                f'(experience-level "{experience}") (goal "{goal}"))'
            )
            env.run()

            # Display diet recommendation
            diet_facts = list(env.facts())
            recommendation_found = False
            for fact in diet_facts:
                if "Diet Plan Name" in str(fact):
                    st.text(str(fact))
                    recommendation_found = True
            if not recommendation_found:
                st.text("No recommendations found for the given inputs.")

    elif choice == "Gym Equipments":
        env.assert_string('(user-choice 2)')
        st.subheader("Information about Gym Equipments")
        st.text("Detailed instructions about Gym Equipments will be provided here.")

    elif choice == "Supplements":
        env.assert_string('(user-choice 3)')
        st.subheader("Information about Supplements")
        st.text("Recommendation system for Supplements is under development. Please check back later.")

    elif choice == "Advices about Exercises":
        env.assert_string('(user-choice 4)')
        st.subheader("Advices about Exercises")
        st.text("General tips and advice about exercises will be added here.")
