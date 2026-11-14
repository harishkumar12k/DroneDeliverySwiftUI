# DroneDelivery iOS Application

## Overview
DroneDelivery iOS is a SwiftUI-based quick-commerce drone delivery application built with Swift 6 strict concurrency, Clean Architecture, MVVM+C (Model-View-ViewModel + Coordinator), and Unidirectional Data Flow (UDF).

---

## Architecture & Design Patterns

The codebase strictly adheres to the engineering rules defined under `.agent/rules/ios-standards.md`:

```
┌────────────────────────────────────────────────────────┐
│                   Presentation Layer                   │
│      (SwiftUI Views, ViewModels, Coordinators)         │
└──────────────────────────┬─────────────────────────────┘
                           │ depends on
                           ▼
┌────────────────────────────────────────────────────────┐
│                      Domain Layer                      │
│      (Entities, Repository Protocols, Use Cases)       │
│               * Imports Foundation only *              │
└──────────────────────────▲─────────────────────────────┘
                           │ implemented by
┌──────────────────────────┴─────────────────────────────┐
│                       Data Layer                       │
│          (DTOs, Mappers, Repository Implementations)   │
└────────────────────────────────────────────────────────┘
```

### Key Architectural Guidelines
1. **Pure Domain Layer:** Only imports `Foundation`. All domain models (`ProductCategory`, `ProductItem`, `HomeDashboard`, `Advertisement`, `DomainError`) are immutable `Sendable` and `Equatable` structs. Pricing uses `Decimal` (never `Double`/`Float`).
2. **Stateless Mappers:** DTOs (`<Name>DTO`) and `Codable` mappings reside exclusively in `Data`. Stateless mappers (`<Name>Mapper.toDomain(_:)`) transform DTOs into domain entities before crossing into `Domain`.
3. **Single Responsibility Use Cases:** Each business action is encapsulated in a protocol and struct (`GetHomeDashboardUseCase` / `GetHomeDashboardUseCaseImpl`) exposing a single `execute() async throws` method.
4. **MVVM+C & UDF:**
   - **Single State Source of Truth:** `@Observable` `@MainActor` `HomeViewModel` exposes `private(set) var state: HomeViewState`.
   - **Single Action Entry Point:** `func send(_ action: HomeViewAction)` processes all user intents.
   - **Coordinator Navigation:** `HomeCoordinator` manages `NavigationPath` and retains the ViewModel lifecycle across push/pop transitions.
5. **Dumb SwiftUI Views:** Views only render state and forward user intents. All `body` implementations are under 40 lines with extracted subviews.
6. **Design System:** Zero hardcoded magic literals. Uses typed tokens (`Spacing`, `Radius`, `AppColors`).

---

## Screen Flow & Navigation Hierarchy

```
MainTabView (Custom Tab Bar: Home, Pick Up/Drop, Order History, Profile)
│
├── [Tab 0: Home] ── NavigationStack (managed by HomeCoordinator)
│   │
│   └── HomeView
│       ├── Header Section (Fixed top)
│       │   ├── HomeNavigationBarView
│       │   │   ├── Address / "Delivered in 2 Mins" Button ──> InDevelopmentView(title: "Address Selector")
│       │   │   └── Cart Icon Button ───────────────────────> InDevelopmentView(title: "Cart")
│       │   │
│       │   └── HomeSearchBarView
│       │       └── Capsule Search Field ───────────────────> InDevelopmentView(title: "Search")
│       │
│       └── Content ScrollView (.vertical)
│           ├── HomeAdSliderView (16:9 aspect ratio, max 5 banners, page indicators)
│           │   └── Banner Tap ─────────────────────────────> InDevelopmentView(title: "<Ad Title>")
│           │
│           ├── HomeCategoryGridView (3-column grid, 12 categories, circular primary borders)
│           │   └── Category Tap ───────────────────────────> InDevelopmentView(title: "<Category Title>")
│           │
│           ├── HomeDeliverySectionView ("2 Minutes Delivery", horizontal scroll)
│           │   ├── "Reveal All ->" Button ─────────────────> InDevelopmentView(title: "2 Minutes Delivery")
│           │   └── Product Card Tap ───────────────────────> InDevelopmentView(title: "<Product Name>")
│           │
│           ├── HomeDeliverySectionView ("5 Minutes Delivery", horizontal scroll)
│           │   ├── "Reveal All ->" Button ─────────────────> InDevelopmentView(title: "5 Minutes Delivery")
│           │   └── Product Card Tap ───────────────────────> InDevelopmentView(title: "<Product Name>")
│           │
│           └── HomeQuoteView (Centered italic quote of the day)
│
├── [Tab 1: Pick Up/Drop] ─── Centered Placeholder View ("Pick Up/Drop")
├── [Tab 2: Order History] ── Centered Placeholder View ("Order History")
└── [Tab 3: Profile] ──────── Centered Placeholder View ("Profile")
```

---

## Directory Structure

```
DroneDelivery-iOS/
├── Core/
│   └── DesignSystem/
│       ├── AppColors.swift          # Semantic colors (primary, textPrimary, searchBar, tabs)
│       ├── Radius.swift             # Corner radius tokens (small, button, card, capsule)
│       └── Spacing.swift            # Layout spacing tokens (zero, xxxs, xxs, xs, sm, md, lg, xl, xxl)
│
├── Features/
│   ├── Home/
│   │   ├── Domain/
│   │   │   ├── Entities/
│   │   │   │   ├── Advertisement.swift
│   │   │   │   ├── DomainError.swift
│   │   │   │   ├── HomeDashboard.swift
│   │   │   │   ├── ProductCategory.swift
│   │   │   │   └── ProductItem.swift
│   │   │   ├── Repositories/
│   │   │   │   └── HomeRepository.swift
│   │   │   └── UseCases/
│   │   │       ├── GetHomeDashboardUseCase.swift
│   │   │       └── GetHomeDashboardUseCaseImpl.swift
│   │   │
│   │   ├── Data/
│   │   │   ├── DTOs/
│   │   │   │   ├── AdvertisementDTO.swift
│   │   │   │   ├── HomeDashboardDTO.swift
│   │   │   │   ├── ProductCategoryDTO.swift
│   │   │   │   └── ProductItemDTO.swift
│   │   │   ├── Mappers/
│   │   │   │   ├── AdvertisementMapper.swift
│   │   │   │   ├── HomeDashboardMapper.swift
│   │   │   │   ├── ProductCategoryMapper.swift
│   │   │   │   └── ProductItemMapper.swift
│   │   │   └── Repositories/
│   │   │       └── HomeRepositoryImpl.swift
│   │   │
│   │   └── Presentation/
│   │       ├── Coordinator/
│   │       │   ├── HomeCoordinator.swift
│   │       │   └── HomeRoute.swift
│   │       ├── ViewModel/
│   │       │   ├── HomeViewAction.swift
│   │       │   ├── HomeViewModel.swift
│   │       │   └── HomeViewState.swift
│   │       └── Views/
│   │           ├── HomeAdSliderView.swift
│   │           ├── HomeCategoryGridView.swift
│   │           ├── HomeDeliverySectionView.swift
│   │           ├── HomeNavigationBarView.swift
│   │           ├── HomeProductCardView.swift
│   │           ├── HomeQuoteView.swift
│   │           ├── HomeSearchBarView.swift
│   │           ├── HomeView.swift
│   │           └── InDevelopmentView.swift
│   │
│   └── MainTab/
│       └── Presentation/
│           └── Views/
│               ├── AppTab.swift
│               ├── CustomTabBarView.swift
│               └── MainTabView.swift
│
├── Assets.xcassets/                 # Vector PDFs & color sets (primary, textPrimary, searchBar)
├── ContentView.swift                # Root view presenting MainTabView
└── DroneDelivery_iOSApp.swift       # Application entry point
```

---

## Detailed Component Specifications

### 1. Navigation Bar (`HomeNavigationBarView`)
- **Background Color:** `AppColors.primary`
- **Text Color:** `AppColors.textPrimary`
- **Title / Address:** Displays delivery estimate (`"Delivered in 2 Mins"`) and active delivery address (`"#123, HSK, Bangalore"`).
- **Cart Icon:** Uses `cart` vector asset from `Assets.xcassets/Common/cart.imageset` rendered as a template matching `textPrimary`.
- **Navigation:** Tapping address or cart routes to `InDevelopmentView`.

### 2. Search Bar (`HomeSearchBarView`)
- **Background Color:** `AppColors.primary`
- **Field Shape:** Capsule (`Capsule()`) filled with `AppColors.searchBarBackground`.
- **Placeholder:** `"Search"` with leading magnifying glass icon.
- **Navigation:** Tapping routes to `InDevelopmentView(title: "Search")`.

### 3. Ad Slider (`HomeAdSliderView`)
- **Aspect Ratio:** Fixed 16:9 (`16.0 / 9.0`) dynamically scaled across device widths.
- **Indicators:** Shows page indicator dots (`.tabViewStyle(.page(indexDisplayMode: .always))`).
- **Capacity:** Displays up to 5 advertisement banners (`special_offer`).
- **Navigation:** Tapping any banner routes to `InDevelopmentView(title: "<Banner Title>")`.

### 4. Categories (`HomeCategoryGridView`)
- **Grid Layout:** 3-column `LazyVGrid`.
- **Items (12 Categories):** Vegetables, Fruits, Milk Products, Meat, Medicine, cakes And Chocolates, Mobile And Accessories, Cloth And Shoe, Game, Toy, Soap And Shampoo, Pet Food.
- **Styling:** Circular icon bordered with `AppColors.primary` (3 pt width), followed by a 2-line centered title.
- **Navigation:** Tapping any category routes to `InDevelopmentView(title: "<Category Name>")`.

### 5. Delivery Sections (`HomeDeliverySectionView` & `HomeProductCardView`)
- **2 Minutes Delivery:**
  - Items: Demo Tabs (25mg), Banana (Ripped), Demo battery (AA).
- **5 Minutes Delivery:**
  - Items: Demo Mobile (White), Demo Perfume (Gold), Demo Aluminium Foil, Demo Battery (AAA).
- **Card Specifications:**
  - Fixed width: 130 pt, rounded rectangle with 1 pt border.
  - Image with green discount badge overlay (`"10% OFF"`).
  - 2-line product title, weight label (`"40 gms"`).
  - Discounted offer price and strikethrough maximum retail price (`₹ 450  ~~₹ 500~~`).
- **"Reveal All" Button:** Tapping header button routes to `InDevelopmentView` for the respective section.
- **Product Card:** Tapping any card routes to `InDevelopmentView` for that item.

### 6. Quote of the Day (`HomeQuoteView`)
- Displays an italicized inspirational quote centered at the bottom of the feed:
  *"Every day is a journey, and the journey itself is home."*

### 7. Custom Tab Bar (`CustomTabBarView`)
- **Tabs:** Home, Pick Up/Drop, Order History, Profile.
- **Background:** `AppColors.primary`.
- **Colors:** White for selected tab, `lightGray` for unselected tabs.
- **Icons:** Vector tab icons from asset catalog (`home`, `send`, `orderHistory`, `profile`).
- **Non-Home Tabs:** Displays centered title text (`"Pick Up/Drop"`, `"Order History"`, `"Profile"`).
