// swift-tools-version:5.3

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
      targets: ["MolocoAdapterTarget", "MolocoSDK"]
    )
  ],
  dependencies: [
    .package(
      url: "https://github.com/googleads/swift-package-manager-google-mobile-ads.git",
      from: "13.0.0"
    )
  ],
  targets: [
    .target(
      name: "MolocoAdapterTarget",
      dependencies: [
        .target(name: "MolocoAdapter"),
        .product(name: "GoogleMobileAds", package: "swift-package-manager-google-mobile-ads"),
      ],
      path: "MolocoAdapterTarget"
    ),
    .binaryTarget(
      name: "MolocoAdapter",
      url:
        "https://dl.google.com/googleadmobadssdk/mediation/ios/Moloco/MolocoAdapter-4.4.0.0.zip",
      checksum: "db814133e4671ba02745eb66584e1755dc190a5f315324b4a487e4ce7052ee39"
    ),
    .binaryTarget(
      name: "MolocoSDK",
      url:
        "https://moloco-ios-build.s3.amazonaws.com/moloco-sdk/MolocoSDK-4.4.0.zip",
      checksum: "a79a044a693d0501c451b686c8e37db8012715f9e92be549fc6c0319eb32655b"
    ),
  ]
)
