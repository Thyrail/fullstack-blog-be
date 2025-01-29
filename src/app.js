import express from 'express';
import postRoutes from './routes/post.routes.js';
import sequelize from './config/database.js';
import cors from 'cors';

const app = express();

app.use(cors({
    origin: 'http://localhost:5173',
    credentials: true
}));

app.use(express.json());
app.use(postRoutes);
//* sync database
sequelize.authenticate().then(() => console.log('Database connected')).catch((err) => console.log('Error: ' + err.message));
sequelize.sync({ alter: true }); //* sync database schema

export default app;