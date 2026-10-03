# KarrotScrollInteraction

<p align="center">
  <img width="128" alt="Demo" src="https://github.com/user-attachments/assets/c9d65a32-9618-46b6-b1e6-f2f67c73e71e" />
</p>

SwiftUI로 구현한 당근 홈 화면의 스크롤 인터랙션

## 주요 기능

### 상단 툴바 축소

<p align="center">
  <img width="128" alt="Collapsing toolbar" src="https://github.com/user-attachments/assets/8929b77c-6a27-4203-b492-fc3d38f583c4" />
</p>

화면을 아래로 스크롤하면 상단 툴바가 접히며 콘텐츠 영역을 더 넓게 사용할 수 있습니다.

스크롤이 끝날 때 현재 위치에 따라 툴바가 완전히 접히거나 다시 펼쳐집니다.

### 툴바 액션 버튼 배경

<p align="center">
  <img width="128" alt="Floating toolbar" src="https://github.com/user-attachments/assets/7db1c42a-cb1d-4b43-8be6-9e92a430d65c" />
</p>

상단 툴바가 접히면 검색, 알림, 메뉴 버튼에 개별 배경이 나타납니다.

SwiftUI의 Glass Effect를 사용해 스크롤되는 콘텐츠와 액션 버튼을 시각적으로 구분합니다.

### 글쓰기 버튼 축소

<p align="center">
  <img width="128" alt="Write button" src="https://github.com/user-attachments/assets/26689d0e-d898-438e-b7de-3629c05b9f46" />
</p>

화면 우측 하단의 **글쓰기** 버튼은 기본 상태에서는 텍스트와 아이콘이 함께 표시됩니다.

스크롤을 시작하면 텍스트가 사라지고 `+` 아이콘만 남는 작은 버튼으로 전환됩니다.

## 구현

주요 인터랙션은 SwiftUI의 기본 API를 사용해 구현했습니다.

- `onScrollGeometryChange`
- `onScrollPhaseChange`
- `safeAreaInset`
- `GlassEffectContainer`
- `glassEffect`
- SwiftUI Animation

## 요구 사항

- iOS 26.0+
- Xcode 26.0+
- SwiftUI
