//
//  SelfPractice.swift
//  FastSwiftBasic
//
//  Created by 송지연 on 4/2/25.
//

import SwiftUI

// 할 일 아이템 모델
class TodoItem: Identifiable, ObservableObject {    // ObservableObject 채택
    let id = UUID() // Identifiale 프로토콜: 해당 프로토콜에 있는 프로퍼티 'id'의 정의를 강제화
    // Identifiale을 채택하여 List에서 식별 가능하도록 함.
    @Published var title: String    // @Published - ObservableObject 프로토콜을 따르는 클래스 내부에서 사용됨. (title과 isCompleted가 변경될 때 UI 자동 업데이트 - TodoRow를 다시 그림.)
    @Published var isCompleted: Bool
    
    init(title: String, isCompleted: Bool = false) {
        self.title = title
        self.isCompleted = isCompleted
    }
}

// 할 일 목록을 관리하는 ViewModel
class TodoViewModel: ObservableObject {
    @Published var todos: [TodoItem] = []   // 이 배열이 변경될 때마다 UI 자동 업데이트.
    
    func addTodo(title: String) {
        let newTodo = TodoItem(title: title)
        todos.append(newTodo)
    }
    
    func toggleCompletion(todo: TodoItem) {
        // firstIndex(where:)는 함수 내부적으로 todos 배열을 처음부터 끝까지 순회하면서 조건을 만족하는 첫 번째 요소를 찾음 (찾으면 인덱스를, 못 찾으면 nil 반환)
        if let index = todos.firstIndex(where: { $0.id == todo.id }) {  // $0은 todos 배열을 순회할 때의 현재 요소(TodoItem) 의미 (TodoItem.id == todo.id 이와 같음)
            // index가 존재하는 경우에만 아래 코드 실행
            todos[index].isCompleted.toggle()   // isCompleted는 @Published로 선언되었으므로 UI 자동 업데이트.
        }
        
        
        // ❔ firstIndex(where:)가 하는 일을 직접 구현해 보면...

//        var index: Int? = nil
//            
//        for i in 0..<todos.count {
//            if todos[i].id == todo.id {
//                index = i
//                break  // 첫 번째로 찾은 요소의 인덱스를 저장하고 루프 종료
//            }
//        }
//
//        // 인덱스를 찾았으면 상태 변경
//        if let index = index {
//            todos[index].isCompleted.toggle()
//        }
        
    }
}

// 메인 뷰
struct SelfPractice: View {
    @StateObject private var viewModel = TodoViewModel()    // @StateObject는 SwiftUI 뷰에서 한 번만 초기화되고, 뷰가 다시 생성되더라도 유지됨. (즉, SelfPractice 메인 View가 처음 생성될 때 TodoViewModel이 한 번만 생성됨. 이후 다시 렌더링되어도 viewModel은 새로 생성되지 않고 유지.)
    @State private var newTodoTitle: String = ""

    var body: some View {
        NavigationView {    // 화면 상단에 제목 추가
            VStack {    // 세로 정렬
                HStack {    // 가로 정렬
                    TextField("새로운 할 일", text: $newTodoTitle)   // TextField와 newTodoTitle이 바인딩($) 되어있고, newTodoTitle은 @State로 선언되어 있으므로 실시간으로 값이 업데이트됨.
                    
                    // ❔만약 $를 쓰지 않는다면 -> compile error❗️
                    // 이유: TextField는 Binding<String>을 요구하는데, newTodoTitle은 String이기 때문.
                    // 따라서 $newTodoTitle을 사용해서 바인딩 타입(Binding<String>)으로 변환해야 함!
                    
                    
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()

                    Button(action: {
                        guard !newTodoTitle.isEmpty else { return }
                        viewModel.addTodo(title: newTodoTitle)  // 버튼을 눌렀을 때 newTodoTitle이 비어있지 않으면 실행(할 일 목록에 추가)
                        newTodoTitle = "" // 입력 필드 초기화
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .font(.largeTitle)
                    }
                }
                List {
                    ForEach(viewModel.todos) { todo in  // viewModel.todos 배열을 순회하면서 TodoRow를 생성.
                        TodoRow(todo: todo, viewModel: viewModel)   // 각 TodoItem을 TodoRow에 전달.
                    }
                }
            }
            .navigationTitle("할 일 목록")
        }
    }
}

// 개별 할 일 아이템 뷰
struct TodoRow: View {
    @ObservedObject var todo: TodoItem  // TodoRow는 메인뷰에서 전달된 TodoItem 감시
    var viewModel: TodoViewModel

    var body: some View {
        HStack {
            Text(todo.title)
                .strikethrough(todo.isCompleted, color: .gray)
                .foregroundColor(todo.isCompleted ? .gray : .black) // todo.isCompleted가 true이면 회색 & 취소선 적용.

            Spacer()    // Text와 Button을 양쪽 끝으로 정렬.

            Button(action: {
                viewModel.toggleCompletion(todo: todo)
            }) {
                Image(systemName: todo.isCompleted ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(todo.isCompleted ? .green : .gray)
                    .font(.title)
            }
        }
        .padding(.vertical, 5)
    }
}


#Preview {
    SelfPractice()
}
