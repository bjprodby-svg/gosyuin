import Foundation
import SwiftData

enum CollectedStampSchemaV1: VersionedSchema {
    static var versionIdentifier = Schema.Version(1, 0, 0)
    static var models: [any PersistentModel.Type] { [CollectedStamp.self] }

    @Model
    final class CollectedStamp {
        @Attribute(.unique) var slotId: Int
        var collectedDate: Date

        init(slotId: Int, collectedDate: Date = .now) {
            self.slotId = slotId
            self.collectedDate = collectedDate
        }
    }
}

enum CollectedStampMigrationPlan: SchemaMigrationPlan {
    static var schemas: [any VersionedSchema.Type] {
        [CollectedStampSchemaV1.self]
    }
    static var stages: [MigrationStage] { [] }
}

typealias CollectedStamp = CollectedStampSchemaV1.CollectedStamp
