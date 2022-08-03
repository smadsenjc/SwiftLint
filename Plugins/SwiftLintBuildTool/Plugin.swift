import PackagePlugin

@main
struct SwiftLintBuildTool: BuildToolPlugin {
    func createBuildCommands(context: PackagePlugin.PluginContext, target: PackagePlugin.Target) async throws -> [Command] {
        [
            .prebuildCommand(
                displayName: "Linting \(target.name)...",
                executable: try context.tool(named: "swiftlint").path,
                arguments: [
                    "lint",
                    "--in-process-sourcekit",
                    target.directory.string
                ],
                outputFilesDirectory: target.directory)
        ]
    }
}

#if canImport(XcodeProjectPlugin)
import XcodeProjectPlugin

extension SwiftLintBuildTool: XcodeBuildToolPlugin {
    func createBuildCommands(context: XcodePluginContext, target: XcodeTarget) throws -> [Command] {
        [
            .prebuildCommand(
                displayName: "Linting \(target.displayName)...",
                executable: try context.tool(named: "swiftlint").path,
                arguments: [
                    "lint",
                    "--in-process-sourcekit",
                    context.xcodeProject.directory
                ],
                outputFilesDirectory: context.xcodeProject.directory)
        ]
    }
}
#endif
