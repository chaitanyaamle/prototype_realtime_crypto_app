# Crypto Real-Time Price Tracker

This is a simple real-time cryptocurrency price tracker that uses WebSocket communication to track the prices of four cryptocurrencies. The backend is powered by a mock server created using **Node.js**, **Express.js**, and **Socket.io**. The frontend showcases the live price updates, with **green** indicating price increases and **red** indicating price decreases for the selected cryptocurrencies.

The project utilizes a mock server from [crypto_mock_server](https://github.com/chaitanyaamle/crypto_mock_server), which broadcasts real-time cryptocurrency price data.

## Demo Video
[Watch the Demo Video](https://github.com/user-attachments/assets/26bb7512-136f-4ceb-9a26-ca6483a68d24)

## Features

- Real-time cryptocurrency price updates.
- Visual indicators for price changes: **Green** for increases, **Red** for decreases.
- Simple WebSocket communication using **Socket.io** for live data fetching.

## Conclusion
This project demonstrates how to build a real-time cryptocurrency price tracker using Socket.io for WebSocket communication. It tracks the price changes of four cryptocurrencies and updates the frontend dynamically with green (for price increases) and red (for price decreases) indicators.

The mock server provides the real-time data, which is consumed by the frontend, making it easy to see how price changes affect the display.
