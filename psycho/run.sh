#!/bin/bash
# Pictionary - Setup & Run Script

echo "🎨 Pictionary - AI-Powered Learning Game"
echo "=========================================="
echo ""

# Check Python installation
if ! command -v python3 &> /dev/null; then
    echo "❌ Python 3 not found. Please install Python 3.8+"
    exit 1
fi

echo "✅ Python $(python3 --version) detected"
echo ""

# Create virtual environment
echo "📦 Setting up backend..."
cd backend

if [ ! -d "venv" ]; then
    echo "Creating virtual environment..."
    python3 -m venv venv
fi

source venv/bin/activate

echo "Installing dependencies..."
pip install -r requirements.txt > /dev/null 2>&1

echo "✅ Backend setup complete"
echo ""

# Start backend
echo "🚀 Starting backend server on http://localhost:5000"
echo ""
python app.py &
BACKEND_PID=$!

# Start frontend
echo "🚀 Starting frontend server on http://localhost:8000"
cd ../frontend
python -m http.server 8000 > /dev/null 2>&1 &
FRONTEND_PID=$!

echo ""
echo "=========================================="
echo "✅ Pictionary is running!"
echo "=========================================="
echo ""
echo "🌐 Frontend: http://localhost:8000"
echo "🔧 Backend:  http://localhost:5000"
echo ""
echo "Press CTRL+C to stop servers"
echo ""

# Keep servers running
wait

# Cleanup
kill $BACKEND_PID $FRONTEND_PID 2>/dev/null
