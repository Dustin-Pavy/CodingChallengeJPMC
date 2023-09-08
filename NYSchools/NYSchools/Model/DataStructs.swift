//
//  DataStructs.swift
//  NYSchools
//
//  Created by Dustin Pavy on 9/6/23.
//

import Foundation

struct SchoolObject: Decodable{
    var dbn:String?
    var school_name:String
    var boro:String?
    var overview_paragraph:String?
    var school_10th_seats:String?
    var academicopportunities1:String?
    var academicopportunities2:String?
    var academicopportunities3:String?
    var academicopportunities4:String?
    var ell_programs:String?
    var neighborhood:String?
    var building_code:String?
    var location:String?
    var phone_number:String?
    var fax_number:String?
    var school_email:String?
    var website:String?
    var subway:String?
    var bus:String?
    var grades2018:String?
    var finalgrades:String?
    var total_students:String?
    var start_time: String?
    var end_time: String?
    var extracurricular_activities:String?
    var school_sports:String?
    var attendance_rate:String?
    var pct_stu_enough_variety:String?
    var pct_stu_safe:String?
    var school_accessibility_description:String?
    var directions1:String?
    var requirement1_1:String?
    var requirement2_1:String?
    var requirement3_1:String?
    var requirement4_1:String?
    var requirement5_1:String?
    var offer_rate1:String?
    var program1:String?
    var code1:String?
    var interest1:String?
    var method1:String?
    var seats9ge1:String?
    var grade9gefilledflag1:String?
    var grade9geapplicants1:String?
    var seats9swd1:String?
    var grade9swdfilledflag1:String?
    var grade9swdapplicants1:String?
    var seats101:String?
    var admissionspriority11:String?
    var admissionspriority21:String?
    var admissionspriority31:String?
    var grade9geapplicantsperseat1:String?
    var grade9swdapplicantsperseat1:String?
    var primary_address_line_1:String?
    var city:String?
    var zip:String?
    var state_code:String?
    var latitude:String?
    var longitude:String?
    var community_board:String?
    var council_district:String?
    var census_tract:String?
    var bin:String?
    var bbl:String?
    var nta:String?
    var borough:String?
}
extension SchoolObject: Identifiable{
    var id: String {
        return dbn ?? ""
    }
}
extension SchoolObject{
    static func mockSchoolList() -> [SchoolObject]{
        return [SchoolObject(
            dbn:"02M260",
            school_name:"Clinton School Writers & Artists, M.S. 260",
            boro:"M",
            overview_paragraph:"Students who are prepared for college must have an education that encourages them to take risks as they produce and perform. Our college preparatory curriculum develops writers and has built a tight-knit community. Our school develops students who can think analytically and write creatively. Our arts programming builds on our 25 years of experience in visual, performing arts and music on a middle school level. We partner with New Audience and the Whitney Museum as cultural partners. We are a International Baccalaureate (IB) candidate school that offers opportunities to take college courses at neighboring universities.",
            school_10th_seats:"1",
            academicopportunities1:"Free college courses at neighboring universities",
            academicopportunities2:"International Travel, Special Arts Programs, Music, Internships, College Mentoring English Language Learner Programs: English as a New Language",
            ell_programs:"English as a New Language",
            neighborhood:"Chelsea-Union Sq",
            building_code:"M868",
            location:"10 East 15th Street, Manhattan NY 10003 (40.736526, -73.992727)",
            phone_number:"212-524-4360",
            fax_number:"212-524-4365",
            school_email:"admissions@theclintonschool.net",
            website:"www.theclintonschool.net",
            subway:"1, 2, 3, F, M to 14th St - 6th Ave; 4, 5, L, Q to 14th St-Union Square; 6, N, R to 23rd St",
            bus:"BM1, BM2, BM3, BM4, BxM10, BxM6, BxM7, BxM8, BxM9, M1, M101, M102, M103, M14A, M14D, M15, M15-SBS, M2, M20, M23, M3, M5, M7, M8, QM21, X1, X10, X10B, X12, X14, X17, X2, X27, X28, X37, X38, X42, X5, X63, X64, X68, X7, X9",
            grades2018:"6-11",
            finalgrades:"6-12",
            total_students:"376",
            extracurricular_activities:"CUNY College Now, Technology, Model UN, Student Government, School Leadership Team, Music, School Musical, National Honor Society, The Clinton Post (School Newspaper), Clinton Soup (Literary Magazine), GLSEN, Glee",
            school_sports:"Cross Country, Track and Field, Soccer, Flag Football, Basketball",
            attendance_rate:"0.970000029",
            pct_stu_enough_variety:"0.899999976",
            pct_stu_safe:"0.970000029",
            school_accessibility_description:"1",
            directions1:"See theclintonschool.net for more information.",
            requirement1_1:"Course Grades: English (87-100), Math (83-100), Social Studies (90-100), Science (88-100)",
            requirement2_1:"Standardized Test Scores: English Language Arts (2.8-4.5), Math (2.8-4.5)",
            requirement3_1:"Attendance and Punctuality",
            requirement4_1:"Writing Exercise",
            requirement5_1:"Group Interview (On-Site)",
            offer_rate1:"Â—57% of offers went to this group",
            program1:"M.S. 260 Clinton School Writers & Artists",
            code1:"M64A",
            interest1:"Humanities & Interdisciplinary",
            method1:"Screened",
            seats9ge1:"80",
            grade9gefilledflag1:"Y",
            grade9geapplicants1:"1515",
            seats9swd1:"16",
            grade9swdfilledflag1:"Y",
            grade9swdapplicants1:"138",
            seats101:"YesÂ–9",
            admissionspriority11:"Priority to continuing 8th graders",
            admissionspriority21:"Then to Manhattan students or residents",
            admissionspriority31:"Then to New York City residents",
            grade9geapplicantsperseat1:"19",
            grade9swdapplicantsperseat1:"9",
            primary_address_line_1:"10 East 15th Street",
            city:"Manhattan",
            zip:"10003",
            state_code:"NY",
            latitude:"40.73653",
            longitude:"-73.9927",
            community_board:"5",
            council_district:"2",
            census_tract:"52",
            bin:"1089902",
            bbl:"1008420034",
            nta:"Hudson Yards-Chelsea-Flatiron-Union Square                                 ",
            borough:"MANHATTAN"
        )]
    }
}

struct SchoolScoresObject: Decodable{
    var dbn: String
    var school_name:String
    var num_of_sat_test_takers:String
    var sat_critical_reading_avg_score: String
    var sat_math_avg_score:String
    var sat_writing_avg_score:String
}

extension SchoolScoresObject{
    static func mockSchoolScoreList() -> [SchoolScoresObject]{
        return [SchoolScoresObject(dbn: "01M292", school_name: "HENRY STREET SCHOOL FOR INTERNATIONAL STUDIES", num_of_sat_test_takers: "29", sat_critical_reading_avg_score: "355", sat_math_avg_score: "404", sat_writing_avg_score: "363")]
    }
}
