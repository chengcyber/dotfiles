# Dependencies

- neovim >= 0.6
- [Nerd Font](https://www.nerdfonts.com/)
- [sharkdp/fd](https://github.com/sharkdp/fd)

# Setup

```bash
# clear current config
rm -rf ~/.config/nvim # !!! backup if needed

# link nvim folder under config directory
ln -s <absolute_path>/nvim ~/.config/nvim

# install packages in one line
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
```

# Screenshots

![nvim](./screenshots/nvim.png)
