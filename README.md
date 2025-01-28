# **Fullstack Blog Backend**

This project is a backend application for managing blog posts, built with **Node.js**, **Express**, **Sequelize**, and a **PostgreSQL** database hosted on **neon.tech**. It provides CRUD operations for managing posts and uses a RESTful API structure.

## **Features**

- Create, read, update, and delete blog posts
- Connected to a remote PostgreSQL database using Sequelize
- Easy-to-extend and modular structure

## **Getting Started**

### **Prerequisites**

Ensure you have the following installed on your machine:

- Node.js (v18 or later)
- pnpm (preferred package manager)
- Access to the internet (for the remote database)

### **Clone the repository**

```bash
git clone https://github.com/yourusername/fullstack-blog-backend.git
cd fullstack-blog-backend
```

## **Setup**

1. Install dependencies:

```bash
pnpm install
```

2. Create a `.env` file in the project root directory:

```bash
touch .env
```

3. Add the following variables to the `.env` file:

```bash
request them by Thyrail, coz they're secret ;)
```

## **Run the application**

Start the server in development mode:

```bash
pnpm dev
```

The server will run on `http://localhost:4000`.

## **API Endpoints**

**Posts**

| Method    | Endpoint      | Description                   |
| --------- | ------------- | ----------------------------- |
| GET       | `/posts`      | Get all posts                 |
| GET       | `/posts/:id`  | Get a single post by ID       |
| POST      | `/posts`      | Create a new post             |
| PUT       | `/posts/:id`  | Update an existing post by ID |
| DELETE    | `/posts/:id`  | Delete a post by ID           |


## **Testing the API**

You can teste the API using tools like:

- [Postman](https://www.postman.com/)
- [curl](https://curl.se/)
- [Swagger UI](optional setup, not included in this template)