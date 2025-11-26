FROM n8nio/n8n:latest

# 1. Switch to root to create folders
USER root

# 2. Configure n8n to use Hugging Face's port
ENV N8N_PORT=7860

# 3. Expose the port so Hugging Face can see it
EXPOSE 7860

# 4. Create the data folder and give permission to the 'node' user
RUN mkdir -p /home/node/.n8n && \
    chown -R node:node /home/node/.n8n

# 5. Switch back to the safe user
USER node

# 6. Start n8n
CMD ["n8n", "start"]

