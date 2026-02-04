# Use the official Ollama image which has the drivers/runtime hooks
FROM docker.io/ollama/ollama:latest

# Set Environment Variables for GPU performance
# OLLAMA_HOST ensures the API is reachable
# OLLAMA_NUM_PARALLEL allows multiple requests if VRAM permits
ENV OLLAMA_HOST=0.0.0.0
ENV OLLAMA_ORIGINS="*"

# Ensure the container uses the NVIDIA runtime
ENV NVIDIA_VISIBLE_DEVICES=all
ENV NVIDIA_DRIVER_CAPABILITIES=compute,utility

# Expose the Ollama port
EXPOSE 11434

# Start the server
ENTRYPOINT ["/bin/ollama"]
CMD ["serve"]