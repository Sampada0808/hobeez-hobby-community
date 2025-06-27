# 🐝 Hobeez + CometChat Integration

This branch integrates **CometChat UI Kit** into the Hobeez app to enable **group chat functionality** between hobby communities. The integration uses **CometChatUIKitSwift** within a SwiftUI-based project.

---

## 🧩 Project Overview

**Hobeez** is a hobby-sharing app where users can join or create hobby-based groups and interact with others. The app is built using SwiftUI, and for this branch, CometChat's UI Kit has been used to embed **real-time group chat** support.

Main goals of this integration:
- Integrate group chat with CometChat UI Kit in a SwiftUI project.
- Ensure smooth login/logout and message exchange between multiple users.
- Maintain SwiftUI-first architecture while embedding UIKit-based CometChat components.

---

## ⚠️ Issues Faced During Integration

### 1. UIKit vs SwiftUI Integration
- **Problem:** The official CometChat UI Kit examples were built using UIKit, while Hobeez uses SwiftUI.
- **Impact:** Direct integration wasn’t straightforward, as CometChat's view controllers and components needed to be hosted inside SwiftUI views.

### 2. Lack of Backend Integration
- **Problem:** The app currently runs on dummy data. Real-time interactions such as chat metadata and group syncing are pending.
- **Impact:** While chat appears functional in the UI, backend connection and group management features are incomplete.

---

## ✅ Solutions for the problems

### 1. UIViewControllerRepresentable Wrappers
- **Solution:** The UIKit chat views were wrapped using `UIViewControllerRepresentable` to embed them inside SwiftUI views.
- **Approach:** Code was broken down into chunks to understand and convert each UIKit component (e.g., `CometChatMessageList`, `CometChatMessageComposer`) into SwiftUI-friendly views.

### 2. SwiftUI-Based Login Interface
- A simple CometChat login interface using CometChatUIKit.login was implemented to test real-time group chat with multiple predefined users.

### 📸 Screenshots
<p align="center">
  <img src="https://github.com/Sampada0808/hobeez-hobby-community/blob/cometchat-integration/implementation/ss1.png" alt="Home Screen" height="420"/>
  <img src="https://github.com/Sampada0808/hobeez-hobby-community/blob/cometchat-integration/implementation/ss2.png" alt="Chat Screen" height="420"/>
  <img src="https://github.com/Sampada0808/hobeez-hobby-community/blob/cometchat-integration/implementation/demo.gif" alt="Demo GIF" height="420"/>
</p>

### ❗ Limitations
- App currently uses dummy data for users and messages
- Backend integration is pending — messages are not persisted or synced

