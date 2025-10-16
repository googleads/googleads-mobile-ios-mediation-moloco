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
  platforms: [.iOS(.v12)],
  products: [
    .library(
      name: "MolocoAdapterTarget",
      targets: ["MolocoAdapterTarget", "MolocoSDK"]
    )
  ],
  targets: [
    .target(
      name: "MolocoAdapterTarget",
      dependencies: [
        .target(name: "MolocoAdapter"),
      ],
      path: "MolocoAdapterTarget"
    ),
    .binaryTarget(
      name: "MolocoAdapter",
      url:
        "https://dl.google.com/googleadmobadssdk/mediation/ios/Moloco/MolocoAdapter-3.13.0.0.zip",
      checksum: "db3b18e76318a433f40426928b43c78c258b99e3ec93578f2eb7b0da4fc0b513"
    ),
    .binaryTarget(
      name: "MolocoSDK",
      url:
        "https://moloco-ios-build.s3.amazonaws.com/moloco-sdk/MolocoSDK-3.13.0.zip",
      checksum: "6689e018e1b7ed51a4832f53bb35ef7d04a5d1d69768646b8cba04e0a3f514a1"
    ),
  ]
)
