//
//  Quest.swift
//  ECS
//
//  Created by Kiar on 11/01/23.
//

import Foundation

enum Trophy: Codable
{
    case bronze
    case silver
    case gold
}

struct Quest: Codable
{
    var title: String
    var description: String
    var backgroundImage: String
    var difficultyLevel: [String]
    var completed: Bool = false
    var trophy: Trophy
}

struct City: Codable
{
    var name: String
    var description: String
    var background: String
    var quests: [Quest]
    var visited: Bool = false
    var platinum: Bool = false
}

struct Nation: Codable
{
    var name: String
    var backgroundImage: String
    var visited: Bool = false
    var city: [City]
}

struct CountriesAPIElements: Codable
{
     let gdp: Int
     let sexRatio: Double
     let surfaceArea, lifeExpectancyMale: Int
     let unemployment: Double
     let imports: Int
     let homicideRate: Double
     let currency: Currency
     let iso2: String
     let employmentServices, employmentIndustry, urbanPopulationGrowth, secondarySchoolEnrollmentFemale: Double
     let employmentAgriculture: Double
     let capital: String
     let co2Emissions, forestedArea: Double
     let tourists, exports: Int
     let lifeExpectancyFemale, postSecondaryEnrollmentFemale: Double
     let postSecondaryEnrollmentMale: Int
     let primarySchoolEnrollmentFemale, infantMortality, gdpGrowth: Double
     let threatenedSpecies, population: Int
     let urbanPopulation, secondarySchoolEnrollmentMale: Double
     let name: String
     let popGrowth: Int
     let region: String
     let popDensity, internetUsers, gdpPerCapita, fertility: Double
     let refugees, primarySchoolEnrollmentMale: Double

     enum CodingKeys: String, CodingKey {
         case gdp
         case sexRatio = "sex_ratio"
         case surfaceArea = "surface_area"
         case lifeExpectancyMale = "life_expectancy_male"
         case unemployment, imports
         case homicideRate = "homicide_rate"
         case currency, iso2
         case employmentServices = "employment_services"
         case employmentIndustry = "employment_industry"
         case urbanPopulationGrowth = "urban_population_growth"
         case secondarySchoolEnrollmentFemale = "secondary_school_enrollment_female"
         case employmentAgriculture = "employment_agriculture"
         case capital
         case co2Emissions = "co2_emissions"
         case forestedArea = "forested_area"
         case tourists, exports
         case lifeExpectancyFemale = "life_expectancy_female"
         case postSecondaryEnrollmentFemale = "post_secondary_enrollment_female"
         case postSecondaryEnrollmentMale = "post_secondary_enrollment_male"
         case primarySchoolEnrollmentFemale = "primary_school_enrollment_female"
         case infantMortality = "infant_mortality"
         case gdpGrowth = "gdp_growth"
         case threatenedSpecies = "threatened_species"
         case population
         case urbanPopulation = "urban_population"
         case secondarySchoolEnrollmentMale = "secondary_school_enrollment_male"
         case name
         case popGrowth = "pop_growth"
         case region
         case popDensity = "pop_density"
         case internetUsers = "internet_users"
         case gdpPerCapita = "gdp_per_capita"
         case fertility, refugees
         case primarySchoolEnrollmentMale = "primary_school_enrollment_male"
     }
 }
 struct Currency: Codable {
     let code, name: String
 }

typealias CountriesAPIElementsImport = [CountriesAPIElements]

struct NasaJ: Codable
{
    let copyright, date, explanation: String?
    let hdurl: String?
    let mediaType, serviceVersion, title: String?
    let url: String?

    enum CodingKeys: String, CodingKey
    {
        case copyright, date, explanation, hdurl
        case mediaType = "media_type"
        case serviceVersion = "service_version"
        case title, url
    }
}



