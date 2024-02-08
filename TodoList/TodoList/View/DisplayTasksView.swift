//
//  DisplayTasksView.swift
//  TodoList
//
//  Created by Paul, Debojyoti on 27/01/24.
//

import SwiftUI

import SwiftUI

struct DisplayTasksView: View {
    
    @StateObject var vm = CoreDataViewModel()
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Text("Not Completed")
                    .font(.title2)
                    .padding()
                    .foregroundColor(.red)
                
                List{
                    ForEach(vm.saved,id: \.self) { item in
                        if(!item.isCompleted){
                            VStack(alignment:.leading){
                                HStack{Image(systemName: item.isCompleted ? "checkmark.circle" :"circle")
                                        .foregroundColor(item.isCompleted ? .green:.red)
                                        .onTapGesture {
                                            vm.mark(entity: item)
                                            withAnimation(.linear) {
                                                
                                            }
                                        }
                                    Text(item.name)
                                }
                                HStack{
                                    Text("Description:")
                                        .bold()
                                    
                                    Text(item.desc)
                                    Spacer()
                                    if(!item.isCompleted){
                                        
                                        DueDateView(due:vm.formatDate(date: item.date, format: "EEEE, MMM d, yyyy"))
                                        
                                    }else{
                                        Text("Completed")
                                            .foregroundStyle(Color.green)
                                    }
                                }
                            }
                        }
                        
                    }.onDelete(perform: vm.deleteTasks)
                }.listStyle(PlainListStyle())
                Text("Completed")
                    .font(.title2)
                    .padding()
                    .foregroundColor(.green)
                List{
                    ForEach(vm.saved,id: \.self) { item in
                        
                        if(item.isCompleted){
                            VStack(alignment:.leading) {
                                
                                HStack{Image(systemName: item.isCompleted ? "checkmark.circle" :"circle")
                                        .foregroundColor(item.isCompleted ? .green:.red)
                                        .onTapGesture {
                                            vm.mark(entity: item)
                                            withAnimation(.linear) {
                                            }
                                        }
                                    Text(item.name )
                                }
                                
                                HStack {
                                    Text("Description:")
                                        .bold()
                                    Text(item.desc)
                                    Spacer()
                                    if(!item.isCompleted) {
                                        
                                        DueDateView(due:vm.formatDate(date: item.date, format: "EEEE, MMM d, yyyy"))
                                        
                                    } else {
                                        Text("Completed")
                                            .foregroundStyle(Color.green)
                                    }
                                }
                            }
                            
                        }
                    }
                    .onDelete(perform: vm.deleteTasks)
                }
            }
            .onAppear(perform: {
                vm.fetchTasks()
            })
            .navigationTitle("To Do List 📝")
            .navigationBarItems(
                leading: EditButton(),
                trailing: NavigationLink("Add", destination: {
                    AddTasks()
                }))
        }
       
    }
}

#Preview {
    DisplayTasksView()
}

