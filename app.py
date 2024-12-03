from flask import Flask, request, render_template
from clips import Environment

app = Flask(__name__)

# Initialize the CLIPS environment
clips_env = Environment()
clips_env.load("gym_instructor.clp")
clips_env.reset()

@app.route('/')
def home():
    return render_template('index.html')

@app.route('/recommend', methods=['POST'])
def recommend():
    # Get user input from the form
    goal = request.form['goal']

    # Assert the user input into CLIPS
    clips_env.assert_string(f'(user (goal "{goal}"))')
    clips_env.run()

    # Collect diet recommendations
    diets = []
    for fact in clips_env.facts():
        if fact.template.name == "diet":
            diets.append({
                "goal": fact["goal"],
                "name": fact["name"],
                "description": fact["description"],
                "breakfast": fact["breakfast"],
                "lunch": fact["lunch"],
                "snack": fact["snack"],
                "dinner": fact["dinner"],
                "notes": fact["notes"]
            })

    # Render the results in the UI
    return render_template('recommend.html', diets=diets)

if __name__ == "__main__":
    app.run(debug=True)
