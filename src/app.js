import express from 'express';
import postRoutes from './routes/post.routes.js';
import sequelize from './config/database.js';

const app = express();

app.use(express.json());
app.use(postRoutes);
//* sync database
sequelize.authenticate().then(() => console.log('Database connected')).catch((err) => console.log('Error: ' + err.message));
sequelize.sync({ alter: true }); //* sync database schema

export default app;