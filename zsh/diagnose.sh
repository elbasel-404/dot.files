time zsh -i -c exit

zsh -xvs <<<'exit' 2>&1 | head -20

zsh ./diagnose-profile.zsh
