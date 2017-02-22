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
    let is_kanban_activated: Bool
    let is_epics_activated: Bool
    let is_issues_activated: Bool
    let is_backlog_activated: Bool
    let is_wiki_activated: Bool
    
    init(name: String, description: String, is_kanban_activated: Bool, is_epics_activated: Bool,is_issues_activated: Bool, is_backlog_activated: Bool, is_wiki_activated: Bool) {
        self.name = name
        self.description = description
        self.is_kanban_activated = is_kanban_activated
        self.is_epics_activated = is_epics_activated
        self.is_issues_activated = is_issues_activated
        self.is_backlog_activated = is_backlog_activated
        self.is_wiki_activated = is_wiki_activated
    }
    
    func toJson() -> [String: Any]? {
        return [
           "name": name,
           "description": description,
           "is_kanban_activated": is_kanban_activated,
           "is_epics_activated": is_epics_activated,
           "is_issues_activated": is_issues_activated,
           "is_backlog_activated": is_backlog_activated,
           "is_wiki_activated": is_wiki_activated
        ]
    }
}
