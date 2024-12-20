---
layout: post
title:  "Mac Developer Setting"
---

## Nico 쌤의 개발자 세팅 따라하기

최근 NomadCoder로 유명한 니꼴라스 쌤의 강의를 듣고 있다. 그런데 동영상에서 보이는 니꼴라스 쌤의 터미널 화면은 내 밋밋한 화면에 비해서 다양한 customization이 되어있었다.
하지만 딱히 찾아볼 시간은 없어서 안했는데 어떤 분이 그 세팅을 물어봤고 니꼬 쌤은 이미 [유튜브](https://www.youtube.com/watch?v=B26yiuC5zPM)에 공유를 해놓으셨다. ㅎㅎ

이 좋은걸 이제 알게 되었다니.. 아직 세상엔 배울게 많은 것 같다.

정리해보자면,

1. Homebrew 설치
2. Set iTerm2 `Preferences > Appearance > General > Theme` to `Minimal`
3. Check iTerm2 `Preferences > Profile > Session > Status bar enabled` and configure it.
4. (oh my zsh 설치)는 생략해도 될 듯 하다. 결국 `powerlevel10k`를 설치하고자 하는 것인데 homebrew를 통해서 설치가 가능하다.
5. 아래 코드 실행

    ```sh
    brew install powerlevel10k
    echo "source $(brew --prefix)/share/powerlevel10k/powerlevel10k.zsh-theme" >>~/.zshrc
    ```

6. iterm2 재실행 및 `powerlevel10k` 설정
7. vscode의 *Settings*에서 `terminal.integrated.fontFamily`을 검색하고 해당 부분의 value를 `MesloLGS NF`로 변경한다.
8. MesloLGS NF font가 없는 경우에는 [링크](https://github.com/romkatv/powerlevel10k/issues/671#issuecomment-621031981)에서 하라는 대로 다운 받아서 하면 된다.
