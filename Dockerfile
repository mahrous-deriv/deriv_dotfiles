# Use a minimal base image with Neovim support
FROM ubuntu:latest

# Install dependencies
RUN apt update && apt install -y neovim git curl unzip

# Install Packer (Neovim plugin manager)
RUN git clone --depth 1 https://github.com/wbthomason/packer.nvim /root/.local/share/nvim/site/pack/packer/start/packer.nvim

# Set up Neovim configuration directory
RUN mkdir -p /root/.config/nvim

# Copy the Neovim configuration
COPY nvim/lua /root/.config/nvim

# Install plugins
RUN nvim --headless -c 'PackerSync' -c 'qa'

# Set Neovim as the default command
CMD ["cd root/.config/ nvim"]
