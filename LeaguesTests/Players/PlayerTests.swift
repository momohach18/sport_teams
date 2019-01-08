//
//  PlayerTests.swift
//  LeaguesTests
//
//  Created by Macbook on 07/01/2019.
//  Copyright © 2019 MAH. All rights reserved.
//

import Foundation

@testable import Leagues

import Nimble
import Quick

class PlayerSpec: QuickSpec {
    override func spec() {
        describe("Player") {
            context("Nominal case") {
                let teamJson = JsonFileReaded(fileName: "PlayerNominal").data
                let team = try? JSONDecoder().decode(PlayerEntity.self, from: teamJson)
                it("should be non nil") {
                    expect(team).toNot(beNil())
                }
                
                it("should contain all fields") {
                    expect(team?.identifier).to(equal("34145937"))
                    expect(team?.name).to(equal("Mario Balotelli"))
                    expect(team?.birthDate).to(equal("1990-08-12"))
                    expect(team?.signingAmout).to(equal("£16,000,000"))
                    expect(team?.headImageUrlString).to(equal("https://www.thesportsdb.com/images/media/player/cutout/43001238.png"))
                    expect(team?.thumbnailImageUrlString).to(equal("https://www.thesportsdb.com/images/media/player/thumb/qqvuvq1431622719.jpg"))
                }
            }
            
            context("null optional fields") {
                let leagueJson = JsonFileReaded(fileName: "PlayerNullFields").data
                let team = try? JSONDecoder().decode(PlayerEntity.self, from: leagueJson)
                it("should be non nil") {
                    expect(team).toNot(beNil())
                }
                
                it("should contain all fields") {
                    expect(team?.identifier).to(equal("34145937"))
                    expect(team?.name).to(equal("Mario Balotelli"))
                    expect(team?.birthDate).to(beNil())
                    expect(team?.signingAmout).to(beNil())
                    expect(team?.headImageUrlString).to(beNil())
                    expect(team?.thumbnailImageUrlString).to(beNil())
                }
            }
        }
    }
}
