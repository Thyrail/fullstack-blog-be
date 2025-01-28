import Post from '../models/post.model.js';

export const getAllPosts = async (req, res) =>
{
    try
    {
        const posts = await Post.findAll();
        res.json(posts);
    } catch (error)
    {
        res.status(500).json({ error: error.message });
    }
};

export const getPostById = async (req, res) =>
{
    try
    {
        const { id } = req.params;
        const post = await Post.findByPk(id);
        if (!post)
        {
            return res.status(404).json({ message: 'Post not found' });
        }
        res.json(post);
    } catch (error)
    {
        res.status(500).json({ error: error.message });
    }
};

export const createPost = async (req, res) =>
{
    try
    {
        const { author, title, content, cover } = req.body;
        const newPost = await Post.create({ author, title, content, cover });
        res.status(201).json(newPost);
    } catch (error)
    {
        res.status(500).json({ error: error.message });
    }
};

export const updatePost = async (req, res) =>
{
    try
    {
        const { id } = req.params;
        const { author, title, content, cover } = req.body;
        const post = await Post.findByPk(id);
        if (!post)
        {
            return res.status(404).json({ message: 'Post not found' });
        }
        await post.update({ author, title, content, cover });
        res.json(post);
    } catch (error)
    {
        res.status(500).json({ error: error.message });
    }
};

export const deletePost = async (req, res) =>
{
    try
    {
        const { id } = req.params;
        const post = await Post.findByPk(id);
        if (!post)
        {
            return res.status(404).json({ message: 'Post not found' });
        }
        await post.destroy();
        res.json({ message: 'Post deleted successfully' });
    } catch (error)
    {
        res.status(500).json({ error: error.message });
    }
};