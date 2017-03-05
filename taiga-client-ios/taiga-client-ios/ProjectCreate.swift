//
//  ProjectCreate.swift
//  taiga-client-ios
//
//  Created by Dominik on 22.02.17.
//  Copyright © 2017 r31r0c. All rights reserved.
//

import Foundation

class ProjectCreate {
    let name: String
    let description: String
    let isKanbanActivated: Bool
    let isEpicsActivated: Bool
    let isIssuesActivated: Bool
    let isBacklogActivated: Bool
    let isWikiActivated: Bool
    let isPrivate: Bool
    
    init(name: String, description: String, isKanbanActivated: Bool, isEpicsActivated: Bool,isIssuesActivated: Bool, isBacklogActivated: Bool, isWikiActivated: Bool, isPrivate: Bool) {
        self.name = name
        self.description = description
        self.isKanbanActivated = isKanbanActivated
        self.isEpicsActivated = isEpicsActivated
        self.isIssuesActivated = isIssuesActivated
        self.isBacklogActivated = isBacklogActivated
        self.isWikiActivated = isWikiActivated
        self.isPrivate = isPrivate
    }
    
    func toJson() -> [String: Any]? {
        return [
           "name": name,
           "description": description,
           "is_kanban_activated": isKanbanActivated,
           "is_epics_activated": isEpicsActivated,
           "is_issues_activated": isIssuesActivated,
           "is_backlog_activated": isBacklogActivated,
           "is_wiki_activated": isWikiActivated,
            "is_private": isPrivate
        ]
    }
}
