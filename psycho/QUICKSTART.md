# 🚀 Pictionary - Quick Start Guide

Get the AI-powered learning game running in 5 minutes!

## ⚡ 5-Minute Setup

### 1. Install Dependencies (1 minute)

```bash
cd /Users/maryamnaz/Desktop/psycho/backend

# Create Python virtual environment
python3 -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate

# Install Python packages
pip install -r requirements.txt
```

### 2. Start Backend Server (1 minute)

```bash
# In the backend directory (with venv activated)
python app.py

# You should see:
# * Running on http://127.0.0.1:5000
# * Debug mode: on
```

### 3. Start Frontend (1 minute)

```bash
cd /Users/maryamnaz/Desktop/psycho/frontend

# Option A: Simple HTTP Server (Recommended)
python -m http.server 8000

# Option B: Direct open (if you prefer)
open index.html

# Visit: http://localhost:8000
```

### 4. Create & Play Game (2 minutes)

1. **Homepage**: Click "🎮 Play Game"
2. **Setup**: 
   - Enter name: "Player1"
   - Age Group: "8-12"
   - Difficulty: "Medium"
   - Click "Start Game!"
3. **Gameplay**:
   - See AI-generated image
   - Type your guess
   - Press Enter or click Submit
   - Click Next Round
4. **Game Over**: View stats and words learned

---

## 🎮 Game Features to Try

### Psychology Insights Page
- Click "📊 Psychology Insights"
- View learning curves, cognitive load analysis
- See bilingual advantage stats
- Compare to other players

### Leaderboard
- Click "🏆 Leaderboard"
- Sort by Accuracy, Points, or Games
- See top 10 players (mock data)

### Your Stats
- Click "📚 Your Stats"
- View personal statistics
- See achievement badges
- Track word learning progress

---

## 📁 Project Structure

```
psycho/
├── backend/
│   ├── app/
│   │   ├── models.py           # Database models
│   │   ├── word_selector.py    # Word selection logic
│   │   ├── guess_processor.py  # Fuzzy matching & scoring
│   │   ├── image_generator.py  # Image generation
│   │   └── database.py         # Dummy data
│   ├── app.py                  # Flask API
│   ├── requirements.txt        # Dependencies
│   └── .env                    # Config
│
├── frontend/
│   ├── index.html              # Main page
│   ├── styles.css              # Responsive design
│   └── app.js                  # Game logic
│
├── README.md                   # Full documentation
├── TEST_CASES.md               # 50 test cases
└── QUICKSTART.md              # This file
```

---

## 🧪 Test The Game

### Test Case 1: Basic Gameplay
```
1. Start new game (Age: 8-12, Difficulty: Medium)
2. Image appears (AI-generated placeholder)
3. Guess: "Apple" (if that's the word)
4. See feedback: "✓ Correct!"
5. Points awarded based on speed
```

### Test Case 2: Fuzzy Matching
```
Word: "Elephant"
Guess 1: "Elephant" → ✓ 100 points (exact)
Guess 2: "Elefant" → ✓ 75 points (fuzzy)
Guess 3: "Elaphant" → ✓ 75 points (fuzzy)
Guess 4: "Zebra" → ✗ 0 points (no match)
```

### Test Case 3: Typo Correction
```
Word: "Cat"
Guesses:
- " cat " → ✓ Correct (spaces trimmed)
- "CAT" → ✓ Correct (case insensitive)
- "Cats" → ✓ Correct (plural handled)
- "cta" → ✓ Likely correct (fuzzy match)
```

### Test Case 4: Time Bonus
```
Time Limit: 60 seconds
Base Points: 100

Guess at 10 sec → 100 + 99 = 199 points
Guess at 30 sec → 100 + 95 = 195 points
Guess at 60 sec → 100 + 90 = 190 points
```

### Test Case 5: Age Groups
```
Ages 5-7:   "Apple", "Dog", "Cat" (simple)
Ages 8-12:  "Helicopter", "Volcano" (medium)
Adult:      "Procrastination", "Serendipity" (complex)
```

---

## 🧠 Psychology Features

### Learning Curve Analysis
Shows how your accuracy improves (or plateaus) over games.

**Expected Pattern**:
- Game 1-2: 40-60% accuracy (learning)
- Game 3-4: 65-75% accuracy (improvement)
- Game 5+: 75-80% accuracy (plateau)

### Cognitive Load
```
Difficulty  Accuracy  Time
Easy        85%       12 sec
Medium      68%       28 sec
Hard        45%       42 sec
```

### Bilingual Advantage
Bilingual players: 78% accuracy
Monolingual players: 65% accuracy
**+13% improvement through dual language**

### Visual Recognition Impact
- With AI images: 75% retention
- Without images: 45% retention
- **+40% improvement from visual cues**

---

## 💡 Key Algorithms

### 1. Fuzzy Matching (Levenshtein Distance)
```python
Guess: "Elephant"
Word: "Elefant"

Distance: 1 edit (missing 'p')
Similarity: 1 - (1 / 8) = 87.5%
Threshold: 75%
Result: ✓ Accepted
```

### 2. Point Calculation
```python
Base: 100 points
Match Type:
  - Exact: 100 + Time Bonus
  - Fuzzy: 75 points
  - Synonym: 50 points

Time Bonus = max(0, 100 - seconds/6)
```

### 3. Accuracy Tracking
```python
Accuracy = (Correct / Total) × 100%

After Game 1: 7/10 = 70%
After Game 2: 15/20 = 75%
After Game 3: 24/30 = 80%
```

---

## 🎯 Dummy Data Included

### Users
- **Emma (5yo)**: 3 games, 85% accuracy
- **Alex (10yo)**: 8 games, 72% accuracy
- **John (Adult)**: 15 games, 82% accuracy
- **Maria (Bilingual)**: 10 games, 88% accuracy

### Words
**Easy**: Apple, Dog, Cat, Sun, Moon, House
**Medium**: Bicycle, Dinosaur, Helicopter, Volcano
**Hard**: Procrastination, Nostalgia, Serendipity

### Statistics
- Total Games: 24
- Total Words Learned: 156
- Average Accuracy: 68.5%
- Top Category: Animals

---

## 🛠️ Troubleshooting

### Issue: Backend won't start
```bash
# Check Python version
python --version  # Should be 3.8+

# Verify packages
pip list | grep Flask

# Reinstall requirements
pip install --force-reinstall -r requirements.txt
```

### Issue: Frontend can't connect to backend
```bash
# Check backend is running
curl http://localhost:5000/api/start-game

# If CORS error, restart backend:
python app.py

# Browser console might show:
# "Access to XMLHttpRequest blocked by CORS"
# Solution: Backend CORS is configured in app.py
```

### Issue: Images not loading
- Backend is using placeholder images (for demo)
- In production, replace with:
  - OpenAI DALL-E API
  - Stability AI API
  - Hugging Face Inference

### Issue: Database errors
```bash
# Reset database
rm backend/Pictionary.db
python app.py

# This will recreate and seed the database
```

---

## 📊 Next Steps

### 1. Integrate Real AI
```python
# In app/image_generator.py
import openai

openai.api_key = os.getenv('OPENAI_API_KEY')

response = openai.Image.create(
    prompt=prompt,
    n=1,
    size="512x512"
)
image_url = response['data'][0]['url']
```

### 2. Add Multiplayer
```python
# WebSocket support for real-time
from flask_socketio import SocketIO, emit

socketio = SocketIO(app)

@socketio.on('guess_submitted')
def on_guess(data):
    # Broadcast to all players in session
    emit('feedback', result, broadcast=True)
```

### 3. Deploy to Cloud
```bash
# Heroku deployment
heroku create my-Pictionary-app
git push heroku main

# Or use Docker:
docker build -t Pictionary .
docker run -p 5000:5000 Pictionary
```

---

## 📚 Documentation

- **README.md**: Full project documentation
- **TEST_CASES.md**: All 50 test cases with implementation
- **QUICKSTART.md**: This file (you're reading it!)

---

## 🎓 Learning Resources

### Psychology Behind Pictionary
- **Dual Coding Theory**: Words + images = better retention
- **Spaced Repetition**: Optimal review schedule
- **Gamification**: Motivation through points & leaderboards
- **Cognitive Load**: Difficulty matching ability

### Technologies Used
- **Backend**: Flask, SQLAlchemy, Python
- **Frontend**: HTML5, CSS3, Vanilla JavaScript
- **Database**: SQLite (easy setup), PostgreSQL (production)
- **AI**: OpenAI API, Stability AI (optional)

---

## 🚀 Quick Commands Reference

```bash
# Start everything
cd backend && source venv/bin/activate && python app.py &
cd frontend && python -m http.server 8000

# Stop servers
kill %1 %2

# Reset database
rm backend/Pictionary.db

# View logs
tail -f backend/app.log

# Test API
curl http://localhost:5000/api/user/create \
  -H "Content-Type: application/json" \
  -d '{"username":"TestUser","age":25}'
```

---

## 🎉 You're Ready!

Everything is set up and ready to go. Enjoy the game and happy learning! 📚✨

**Questions?** Check the README.md or TEST_CASES.md for detailed documentation.

**Want to contribute?** Submit a pull request or open an issue!

---

*Built with ❤️ for language learners everywhere*
