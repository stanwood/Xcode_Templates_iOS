#!/usr/bin/env swift

import Foundation

func formatURLString(_ url: URL?) -> String? {
  return url?.absoluteString.replacingOccurrences(of: "file://", with: "")
}

let urls = FileManager.default.urls(for: .downloadsDirectory, in: .allDomainsMask)

// print(urls)

let url = FileManager.default.currentDirectoryPath
// print(url)


let tempFolder = "/tmp/"
// print(tempFolder)

let templates = "/Applications/Xcode.app/Contents/Developer/Library/Xcode/Templates/File Templates/Source/"
let templatesContent = try? FileManager.default.contentsOfDirectory(atPath: formatURLString(urls.first) ?? "")
for content in templatesContent ?? [] {
  print(content)
}
//
//
// let _ = try? FileManager.default.contentsOfDirectory(atPath: tempFolder)
//
// let downloadContent = try? FileManager.default.contentsOfDirectory(atPath: formatURLString(urls.first) ?? "")
//
// print(urls.first)
// print(downloadContent?.count ?? -1)
// for content in downloadContent ?? [] {
//   print(content)
// }
