const express = require('express');
const { google } = require('googleapis');
const cors = require('cors');
const path = require('path');
const fs = require('fs');
require('dotenv').config();

/**
 * Senior Backend Engineer - Final Refined Implementation
 * Focus: RFC3339 Date compliance, strict validation, and robust error handling.
 */

const app = express();
const PORT = process.env.PORT || 3000;

// Middleware
app.use(cors({ origin: '*' }));
app.use(express.json());

// Path to Google Service Account Credentials
const SERVICE_ACCOUNT_KEY_FILE = path.join(__dirname, 'service-account.json');

// Verify service account key exists before initialization
if (!fs.existsSync(SERVICE_ACCOUNT_KEY_FILE)) {
    console.error(`\n[CRITICAL] Service account file not found at: ${SERVICE_ACCOUNT_KEY_FILE}`);
    console.error('Please ensure the file is named correctly and placed in the project root.\n');
}

// Google Calendar Scopes
const SCOPES = ['https://www.googleapis.com/auth/calendar'];

// Initialize Google Auth
const auth = new google.auth.GoogleAuth({
    keyFile: SERVICE_ACCOUNT_KEY_FILE,
    scopes: SCOPES,
});

const calendar = google.calendar({ version: 'v3', auth });

/**
 * POST /book
 * Endpoint to process car service bookings and create Google Calendar events.
 */
app.post('/book', async (req, res) => {
    try {
        const { name, phone, email, datetime, vehicle, service, notes, paymentMethod } = req.body;

        // 1. INPUT VALIDATION
        if (!name || !datetime) {
            return res.status(400).json({
                success: false,
                error: "Missing required fields: name and datetime are required."
            });
        }

        // 2. DATE PARSING & NORMALIZATION
        const startDate = new Date(datetime);

        // Check for invalid date
        if (isNaN(startDate.getTime())) {
            return res.status(400).json({
                success: false,
                error: "Invalid datetime format provided."
            });
        }

        // Calculate end time (+1 hour)
        const endDate = new Date(startDate.getTime() + (60 * 60 * 1000));

        // 3. EVENT CONSTRUCTION
        const event = {
            summary: `Car Estimate Booking - ${name}`,
            description: [
                `Client: ${name}`,
                `Phone: ${phone || 'N/A'}`,
                `Email: ${email || 'N/A'}`,
                `Vehicle: ${vehicle || 'N/A'}`,
                `Service: ${service || 'N/A'}`,
                `Payment Method: ${paymentMethod || 'N/A'}`,
                `Notes: ${notes || 'None'}`
            ].join('\n'),
            start: {
                dateTime: startDate.toISOString(), // RFC3339 string
                timeZone: 'Asia/Kolkata',
            },
            end: {
                dateTime: endDate.toISOString(), // RFC3339 string
                timeZone: 'Asia/Kolkata',
            },
        };

        // 4. GOOGLE CALENDAR API CALL
        const response = await calendar.events.insert({
            calendarId: "ramcse142@gmail.com",
            resource: event,
        });

        // 5. SUCCESS RESPONSE
        console.log(`[BOOKING SUCCESS] Event created for ${name}: ${response.data.htmlLink}`);

        return res.status(200).json({
            success: true,
            message: "Booking confirmed",
            eventLink: response.data.htmlLink
        });

    } catch (error) {
        // 6. COMPREHENSIVE ERROR LOGGING
        console.error('[BOOKING ERROR] Full Details:', {
            message: error.message,
            apiResponse: error.response ? error.response.data : 'Internal API Error',
            stack: error.stack
        });

        // Ensure we send a numeric status code to prevent server crash
        const statusCode = (typeof error.code === 'number' && error.code >= 100 && error.code < 600) ? error.code : 500;

        return res.status(statusCode).json({
            success: false,
            error: error.message || "Failed to create calendar event."
        });
    }
});

// Health check endpoint
app.get('/', (req, res) => {
    res.json({ status: 'active', message: 'Car Booking API is online' });
});

// Start the server
app.listen(PORT, () => {
    console.log(`🚀 Server running on http://localhost:${PORT}`);
    console.log(`📂 Auth File: ${SERVICE_ACCOUNT_KEY_FILE}`);
});
