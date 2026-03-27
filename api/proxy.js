// proxy.js
const express = require("express");
const fetch = require("node-fetch");
const cors = require("cors");

const app = express();
const PORT = process.env.PORT || 3000;

// Enable CORS for all routes
app.use(cors());
app.use(express.json());

const API_BASE = "https://simba-39la.onrender.com/api";

// Proxy endpoint for login
app.post("/api/login", async (req, res) => {
  try {
    const response = await fetch(`${API_BASE}/users/login`, {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify(req.body),
    });

    const data = await response.json();
    res.status(response.status).json(data);
  } catch (err) {
    console.error(err);
    res.status(500).json({ message: "Proxy error" });
  }
});

// Proxy endpoint for register
app.post("/api/register", async (req, res) => {
  try {
    const response = await fetch(`${API_BASE}/users/register`, {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify(req.body),
    });

    const data = await response.json();
    res.status(response.status).json(data);
  } catch (err) {
    console.error(err);
    res.status(500).json({ message: "Proxy error" });
  }
});

// Start server
app.listen(PORT, () => {
  console.log(`Proxy running on port ${PORT}`);
});