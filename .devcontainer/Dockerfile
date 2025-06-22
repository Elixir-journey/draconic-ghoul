FROM elixir:1.17-alpine AS builder

ENV MIX_ENV=dev
ENV MIX_HOME=/root/.mix
ENV PATH="$MIX_HOME/escripts:$PATH"

# System dependencies for Phoenix & LiveReload
RUN apk add --no-cache \
    git curl bash openssh postgresql-client inotify-tools build-base nodejs npm

WORKDIR /workspace

# Install Hex + Rebar
RUN mix do local.hex --force, local.rebar --force

# Copy mix files + install deps
COPY mix.exs mix.lock ./
RUN mix deps.get

# Copy source code + compile
COPY . .
RUN mix compile

# Install dev tools, runtime, and Zsh enhancements
RUN apk add --no-cache \
    bash openssh postgresql-client inotify-tools build-base \
    git curl zsh zsh-autosuggestions zsh-syntax-highlighting zsh-completions \
    && curl -sfL git.io/antibody | sh -s - -b /usr/local/bin

# Copy compiled app from builder stage
COPY --from=builder /workspace /workspace

# Set up Hex + Rebar again (if using `mix` inside container)
RUN mix do local.hex --force, local.rebar --force

# Powerlevel10k config (fallback if no host bind)
RUN [ -f /root/.p10k.zsh ] || echo 'POWERLEVEL10K_CONFIG_PLACEHOLDER' > /root/.p10k.zsh

# Zsh setup
RUN echo '[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh' > /root/.zshrc \
    && echo 'export ZSH_THEME="powerlevel10k/powerlevel10k"' >> /root/.zshrc \
    && echo "alias ll='ls -la'" >> /root/.zshrc \
    && echo 'export SHELL="/bin/zsh"' >> /root/.zshrc \
    && echo 'source /root/.zsh_plugins.sh' >> /root/.zshrc \
    && antibody bundle zsh-users/zsh-autosuggestions > /root/.zsh_plugins.sh \
    && antibody bundle zsh-users/zsh-syntax-highlighting >> /root/.zsh_plugins.sh \
    && antibody bundle romkatv/powerlevel10k >> /root/.zsh_plugins.sh

CMD ["/bin/zsh"]
