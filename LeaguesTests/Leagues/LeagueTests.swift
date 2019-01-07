//
//  LeaguesTests.swift
//  LeaguesTests
//
//  Created by Macbook on 07/01/2019.
//  Copyright © 2019 MAH. All rights reserved.
//

import Foundation

@testable import Leagues

import Nimble
import Quick

class LeagueSpec: QuickSpec {
    override func spec() {
        describe("League") {
            context("Nominal case") {
                let leagueJson = JsonFileReaded(fileName: "LeagueNominal").data
                let league = try? JSONDecoder().decode(LeagueEntity.self, from: leagueJson)
                it("should be non nil") {
                    expect(league).toNot(beNil())
                }
                
                it("should contain all fields") {
                    expect(league?.identifier).to(equal("4328"))
                    expect(league?.name).to(equal("English Premier League"))
                    expect(league?.sport).to(equal("Soccer"))
                    expect(league?.alternativeName).to(equal("Premier League"))
                }
            }
            
            context("null optional fields") {
                let leagueJson = JsonFileReaded(fileName: "LeagueNullFields").data
                let league = try? JSONDecoder().decode(LeagueEntity.self, from: leagueJson)
                it("should be non nil") {
                    expect(league).toNot(beNil())
                }
                
                it("should contain all fields") {
                    expect(league?.identifier).to(equal("4328"))
                    expect(league?.name).to(equal("English Premier League"))
                    expect(league?.sport).to(beNil())
                    expect(league?.alternativeName).to(beNil())
                }
            }
        }
    }
}
