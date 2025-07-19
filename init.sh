#!/usr/bin/env sh

# Start tailscaled and connect to tailnet
/usr/sbin/tailscaled --state=/var/lib/tailscale/tailscaled.state &> /var/lib/tailscale/tailscaled_initial.log &
/usr/bin/tailscale up --accept-routes=true --accept-dns=true --auth-key $TAILSCALE_AUTH_KEY &> /var/lib/tailscale/tailscale_onboard.log &

# (可选的调试行，可以加上看看PATH到底是什么)
# echo "DEBUG: My PATH is $PATH"

# Start Tailscale derp server using its full, absolute path
/usr/local/bin/derper --hostname=$TAILSCALE_DERP_HOSTNAME --a=$TAILSCALE_DERP_ADDR --stun-port=$TAILSCALE_DERP_STUN_PORT --verify-clients=$TAILSCALE_DERP_VERIFY_CLIENTS
