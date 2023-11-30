FROM public.ecr.aws/docker/library/docker:24-dind
RUN set -ex \
    && wget https://storage.googleapis.com/kubernetes-release/release/v1.26.2/bin/linux/amd64/kubectl \
        -O /usr/local/bin/kubectl \
    && wget https://kind.sigs.k8s.io/dl/v0.19.0/kind-linux-amd64 -O /usr/local/bin/kind \
    && chmod +x /usr/local/bin/kubectl /usr/local/bin/kind \
    && wget -O- https://get.helm.sh/helm-v3.8.1-linux-amd64.tar.gz | \
        tar zxvf - -C "/usr/local/bin" linux-amd64/helm --strip-components 1 \
    && export KUSTOMIZE_VERSION=v4.5.7 \
    && wget -O- https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize%2F${KUSTOMIZE_VERSION}/kustomize_${KUSTOMIZE_VERSION}_linux_amd64.tar.gz | \
        tar zxvf - -C "/usr/local/bin" \
    && apk add --no-cache --update \
        zsh tmux vim curl git jq yq k9s skopeo \
        alpine-zsh-config zsh-theme-powerlevel10k \
        zsh-syntax-highlighting zsh-autosuggestions \
        sudo glab firefox kate lxterminal ttf-dejavu font-noto \
        libcanberra-gtk3 dbus-x11 mesa-glapi mesa-gles
RUN set -ex \
    && apk add --no-cache --update \
        font-terminus font-inconsolata font-dejavu font-noto font-noto-cjk font-awesome font-noto-extra
ARG MYUID=$MYUID
RUN set -ex \
    && adduser -D -G root  -s /bin/zsh -u $MYUID myself \
    && addgroup myself wheel \
    && sed -i '/root:x:0:0:root/ s/ash/zsh/g' /etc/passwd \
    && sed -i 's/^audio.*/audio:x:29:myself/g' /etc/group \
    && sed -i '/# %wheel ALL.*/s/^# //' /etc/sudoers \
    && dbus-uuidgen > /var/lib/dbus/machine-id
USER myself
WORKDIR /home/myself
COPY zshrc /root/.zshrc
COPY tmux.conf /root/.tmux.conf
COPY --chmod=755 dockerd.sh /dockerd.sh
COPY --chmod=755 run.sh /run.sh
COPY --chown=myself zshrc /home/myself/.zshrc
COPY --chown=myself kind-config.yaml /home/myself
COPY --chown=myself tmux.conf /home/myself/.tmux.conf
COPY --chown=myself lxterminal.conf /home/myself/.config/lxterminal/lxterminal.conf
ENTRYPOINT ["/run.sh"]
VOLUME /home/myself
VOLUME /root
STOPSIGNAL KILL
ENV LANG='C.UTF-8'
ENV LANGUAGE='en_US:en'

