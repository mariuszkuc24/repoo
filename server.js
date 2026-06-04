const express = require('express');
const app = express();
const PORT = process.env.PORT || 3000;

// Middleware
app.use(express.json());

// In-memory user storage
let users = [
  { id: 1, name: 'John Doe', email: 'john@example.com' },
  { id: 2, name: 'Jane Smith', email: 'jane@example.com' }
];
let nextUserId = 3;

// Health endpoint
app.get('/health', (req, res) => {
  res.status(200).json({
    status: 'OK',
    timestamp: new Date().toISOString(),
    uptime: process.uptime()
  });
});

// GET all users
app.get('/users', (req, res) => {
  res.status(200).json(users);
});

// GET user by ID
app.get('/users/:id', (req, res) => {
  const id = parseInt(req.params.id);
  const user = users.find(u => u.id === id);
  
  if (!user) {
    return res.status(404).json({ error: 'User not found' });
  }
  
  res.status(200).json(user);
});

// POST create new user
app.post('/users', (req, res) => {
  const { name, email } = req.body;
  
  // Input validation
  if (!name || !email) {
    return res.status(400).json({ 
      error: 'Name and email are required',
      received: { name, email }
    });
  }
  
  // Simple email validation
  if (!email.includes('@')) {
    return res.status(400).json({ 
      error: 'Invalid email format',
      received: email
    });
  }
  
  const newUser = {
    id: nextUserId++,
    name: name.trim(),
    email: email.trim().toLowerCase()
  };
  
  users.push(newUser);
  res.status(201).json(newUser);
});

// PUT update user
app.put('/users/:id', (req, res) => {
  const id = parseInt(req.params.id);
  const { name, email } = req.body;
  
  // Find user
  const userIndex = users.findIndex(u => u.id === id);
  
  if (userIndex === -1) {
    return res.status(404).json({ error: 'User not found' });
  }
  
  // Input validation
  if (!name && !email) {
    return res.status(400).json({ 
      error: 'At least one field (name or email) must be provided for update',
      received: { name, email }
    });
  }
  
  if (email && !email.includes('@')) {
    return res.status(400).json({ 
      error: 'Invalid email format',
      received: email
    });
  }
  
  // Update user
  const updatedUser = { ...users[userIndex] };
  if (name) updatedUser.name = name.trim();
  if (email) updatedUser.email = email.trim().toLowerCase();
  
  users[userIndex] = updatedUser;
  res.status(200).json(updatedUser);
});

// DELETE user
app.delete('/users/:id', (req, res) => {
  const id = parseInt(req.params.id);
  const userIndex = users.findIndex(u => u.id === id);
  
  if (userIndex === -1) {
    return res.status(404).json({ error: 'User not found' });
  }
  
  const deletedUser = users.splice(userIndex, 1)[0];
  res.status(200).json({
    message: 'User deleted successfully',
    user: deletedUser
  });
});

// Error handling middleware
app.use((err, req, res, next) => {
  console.error(err.stack);
  res.status(500).json({
    error: 'Something went wrong!',
    message: process.env.NODE_ENV === 'development' ? err.message : 'Internal server error'
  });
});

// 404 handler
app.use((req, res) => {
  res.status(404).json({ error: 'Endpoint not found' });
});

// Start server
app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
  console.log(`Health endpoint: http://localhost:${PORT}/health`);
  console.log(`Users endpoint: http://localhost:${PORT}/users`);
});

module.exports = app;