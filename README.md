# Crypto Real-Time Price Tracker

This is a simple real-time cryptocurrency price tracker that uses WebSocket communication to track the prices of four cryptocurrencies. The backend is powered by a mock server created using **Node.js**, **Express.js**, and **Socket.io**. The frontend showcases the live price updates, with **green** indicating price increases and **red** indicating price decreases for the selected cryptocurrencies.

The project utilizes a mock server from [crypto_mock_server](https://github.com/chaitanyaamle/crypto_mock_server), which broadcasts real-time cryptocurrency price data.

## Demo Video
[Watch the Demo Video](https://github.com/user-attachments/assets/d60795f9-c326-4f78-b01c-c589eb97bea5)

## Features

- Real-time cryptocurrency price updates.
- Visual indicators for price changes: **Green** for increases, **Red** for decreases.
- Historical Data Chart clicking on cryptocurrency.
- Simple WebSocket communication using **Socket.io** for live data fetching.

## Conclusion
This project demonstrates how to build a real-time cryptocurrency price tracker using Socket.io for WebSocket communication. It tracks the price changes of four cryptocurrencies and updates the frontend dynamically with green (for price increases) and red (for price decreases) indicators. And on clicking on any cryptocurrency it shows historical data chart. 

The mock server provides the real-time data, which is consumed by the frontend, making it easy to see how price changes affect the display.


