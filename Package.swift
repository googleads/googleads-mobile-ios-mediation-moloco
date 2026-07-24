// swift-tools-version:5.6

// Copyright 2025 Google LLC.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import PackageDescription

let package = Package(
  name: "MolocoAdapter",
  platforms: [.iOS(.v13)],
  products: [
    .library(
      name: "MolocoAdapterTarget",
      targets: ["MolocoAdapterTarget"]
    )
  ],
  dependencies: [
    .package(
      url: "https://github.com/moloco/moloco-sdk-ios-spm.git",
      exact: "4.8.1"
    ),
    .package(
      url: "https://github.com/googleads/swift-package-manager-google-mobile-ads.git",
      from: "13.3.0"
    )
  ],
  targets: [
    .target(
      name: "MolocoAdapterTarget",
      dependencies: [
        .target(name: "MolocoAdapter"),
        .product(name: "MolocoSDK", package: "moloco-sdk-ios-spm"),
        .product(name: "GoogleMobileAds", package: "swift-package-manager-google-mobile-ads"),
      ],
      path: "MolocoAdapterTarget"
    ),
    .binaryTarget(
      name: "MolocoAdapter",
      url:
        "https://dl.google.com/googleadmobadssdk/mediation/ios/Moloco/MolocoAdapter-4.8.1.0.zip",
      checksum: "2df1afab5cb9f14514dd846ebfae8ff65f147a2747e9ead6a6b568548049985e"
    ),
  ]
)
