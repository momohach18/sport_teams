//
//  TeamTests.swift
//  LeaguesTests
//
//  Created by Macbook on 07/01/2019.
//  Copyright © 2019 MAH. All rights reserved.
//

import Foundation

@testable import Leagues

import Nimble
import Quick

class TeamSpec: QuickSpec {
    override func spec() {
        describe("Team") {
            context("Nominal case") {
                let teamJson = JsonFileReaded(fileName: "TeamNominal").data
                let team = try? JSONDecoder().decode(TeamEntity.self, from: teamJson)
                it("should be non nil") {
                    expect(team).toNot(beNil())
                }
                
                it("should contain all fields") {
                    expect(team?.identifier).to(equal("133604"))
                    expect(team?.name).to(equal("Arsenal"))
                    expect(team?.badgeUrl).to(equal("https://www.thesportsdb.com/images/media/team/badge/vrtrtp1448813175.png"))
                }
            }
            
            context("null optional fields") {
                let leagueJson = JsonFileReaded(fileName: "TeamNullFields").data
                let team = try? JSONDecoder().decode(TeamEntity.self, from: leagueJson)
                it("should be non nil") {
                    expect(team).toNot(beNil())
                }
                
                it("should contain all fields") {
                    expect(team?.identifier).to(equal("133604"))
                    expect(team?.name).to(beNil())
                    expect(team?.badgeUrl).to(beNil())
                }
            }
        }
    }
}
