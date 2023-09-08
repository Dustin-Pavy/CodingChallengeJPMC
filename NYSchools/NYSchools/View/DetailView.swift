//
//  DetailView.swift
//  NYSchools
//
//  Created by Consultant on 9/7/23.
//

import SwiftUI

struct DetailView: View {
    
    @State var schoolInfo: SchoolObject
    @State var schoolScores: SchoolScoresObject
    @State var noScoreInfo: Bool = false
    
    var linearGradientColors = [Color.white, Color(hex: "34859d", alpha: 1)]
    
    var body: some View {
        ZStack{
            LinearGradient(colors: linearGradientColors, startPoint: .topTrailing, endPoint: .bottomLeading).ignoresSafeArea()
            VStack(alignment: .center){
                Text("\(schoolInfo.school_name)")
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                Divider()
                ScrollView{
                    //school summary
                    VStack{
                        Text("About Us")
                            .font(.title)
                        Text("    \(schoolInfo.overview_paragraph!)")
                    }
                    .padding(.horizontal)
                    Divider()
                    
                    //extracurricular informaition
                    VStack{
                        Text("Further Opportunities")
                            .font(.title)
                            .multilineTextAlignment(.center)
                        Text("Some of the Academic Opportunities offered:")
                            .font(.title3)
                            .padding(.top)
                        Text(
                            "\(schoolInfo.academicopportunities1!). \(schoolInfo.academicopportunities2 != nil ? "\n\( schoolInfo.academicopportunities2!))" : "") \(schoolInfo.academicopportunities3 != nil ? "\n\( schoolInfo.academicopportunities3!))" : "") \(schoolInfo.academicopportunities4 != nil ? "\n\(schoolInfo.academicopportunities4!))" : "")  ")
                            .multilineTextAlignment(.center)
                        Text("Extracurriculars:")
                            .font(.title3)
                            .padding(.top)
                        Text("\(schoolInfo.extracurricular_activities!)")
                            .multilineTextAlignment(.center)
                        if schoolInfo.school_sports != nil{
                            Text("School Sports: ")
                                .font(.title3)
                                .padding(.top)
                            Text("\(schoolInfo.school_sports!)")
                                .multilineTextAlignment(.center)
                        }
                    }
                    .padding(.horizontal)
                    Divider()
                    
                    //average scores display
                    if !noScoreInfo{
                        VStack{
                            Text("Average SAT Scores: ")
                                .font(.title)
                                .padding(.bottom)
                            Text("Number of test takers: \(schoolScores.num_of_sat_test_takers)")
                            Text("Critical Reading: \(schoolScores.sat_critical_reading_avg_score)")
                                .padding(.top, 1.0)
                            HStack{
                                Text("Math: \(schoolScores.sat_math_avg_score)")
                                    .padding(.trailing, 10.0)
                                Text("Writing: \(schoolScores.sat_writing_avg_score)")
                            }
                            .padding(.top, 2.0)
                        }
                    }else{
                        Text("No average scores found!!")
                            .font(.title)
                            .italic()
                    }
                    Divider()
                    
                    //other useful info like accepting applicants, total students, etc
                    VStack{
                        Text("Other Information")
                            .font(.title)
                            .padding(.bottom)
                        Text("Number of Students: \(schoolInfo.total_students!)")
                            Text("Grades: \(schoolInfo.finalgrades!)")
                            .multilineTextAlignment(.center)
                        Text("Accepting 9th grade applicants: \(schoolInfo.grade9gefilledflag1! == "N" ? "Yes" : "No")")
                        if schoolInfo.start_time != nil && schoolInfo.end_time != nil{
                            HStack{
                                Text("Start: \(schoolInfo.start_time!)")
                                Text("End: \(schoolInfo.end_time!)")
                            }
                        }
                        
                    }
                    .padding(.horizontal)
                    Divider()
                    
                    //contact info
                    VStack(alignment: .center){
                        Text("Contact Us")
                            .font(.title)
                        if schoolInfo.website != nil{
                            Text("Website: ")
                            Link("\(schoolInfo.website!)", destination: URL(string: schoolInfo.website!)!)
                                .foregroundColor(Color(hex: "17434b", alpha: 1))
                        }
                        if schoolInfo.school_email != nil{
                            Text("Email: \(schoolInfo.school_email!)")
                        }
                        if schoolInfo.phone_number != nil{
                            HStack{
                                Text("Phone Number: ")
                                Link("\(schoolInfo.phone_number!)", destination: URL(string: "tel:\(schoolInfo.phone_number!)")!)
                                    .foregroundColor(Color(hex: "17434b", alpha: 1))
                            }
                        }
                        if schoolInfo.fax_number != nil{
                            Text("Fax Number: \(schoolInfo.fax_number!)")
                        }
                        if schoolInfo.primary_address_line_1 != nil && schoolInfo.city != nil && schoolInfo.state_code != nil && schoolInfo.zip != nil {
                            Text("Address: \(schoolInfo.primary_address_line_1!), \(schoolInfo.city!), \(schoolInfo.state_code!), \(schoolInfo.zip!)")
                                .multilineTextAlignment(.center)
                        }
                    }
                    .padding(.horizontal)
                }
                Spacer()
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        let dummyData:SchoolObject = SchoolObject(school_name: "SomeName")
        let dummyScores: SchoolScoresObject = SchoolScoresObject(dbn: "", school_name: "", num_of_sat_test_takers: "234", sat_critical_reading_avg_score: "523", sat_math_avg_score: "234", sat_writing_avg_score: "234")
        DetailView(schoolInfo: dummyData, schoolScores: dummyScores)
    }
}
