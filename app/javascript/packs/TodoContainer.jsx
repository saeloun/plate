import React, { Component } from "react";
import axios from "axios";
import update from "immutability-helper";

class TodosContainer extends Component {
  constructor(props) {
    super(props);
    this.state = {
      todos: [],
      count: "",
      activeTodos: [],
      inputValue: "",
    };
    this.getTodos = this.getTodos.bind(this);
  }

  showCompleted(e) {
    $.getJSON("/api/v1/todos.json", response => {
      var completedTodos = response.filter(todo => {
        return todo.status != false;
      });
      this.setState({ todos: completedTodos });
    });
  }

  showActive(e) {
    $.getJSON("/api/v1/todos.json", response => {
      var activeTodos = response.filter(todo => {
        return todo.status != true;
      });
      this.setState({
        todos: activeTodos,
        activeTodos: activeTodos,
        count: activeTodos.length,
      });
    });
  }
  getTodos() {
    $.getJSON("/api/v1/todos.json", response => {
      var allTodos = response;
      var allActiveTodos = response.filter(todo => {
        return todo.status != true;
      });

      this.setState({
        todos: allTodos,
        activeTodos: allActiveTodos,
        count: allActiveTodos.length,
      });
    });
  }

  createTodo = e => {
    console.log("created");
    if (e.key === "Enter" && !(e.target.value === "")) {
      $.ajax({
        url: "/api/v1/todos",
        type: "POST",
        data: { todo: { title: e.target.value, status: false } },
        success: todo => {
          var newState = this.state.todos.concat(todo);
          var newActive = this.state.activeTodos.concat(todo);
          this.setState({
            todos: newState,
            inputValue: "",
            activeTodos: newActive,
          });
        },
      });
    }
  };

  handleChange = e => {
    this.setState({ inputValue: e.target.value });
  };

  updateTodo = (e, todo) => {
    console.log("update");
    $.ajax({
      url: `/api/v1/todos/${todo.id}`,
      type: "PUT",
      data: { todo: { status: e.target.checked } },
      success: () => {
        var todos = this.state.todos.filter(i => {
          return i.id != todo.id;
        });
        todos.push(todo);
        this.setState({ todos: todos });
        this.getTodos();
      },
    });
  };

  deleteTodo = id => {
    $.ajax({
      url: `/api/v1/todos/${id}`,
      type: "DELETE",
      success: () => {
        var newTodos = this.state.todos.filter(todo => {
          return todo.id != id;
        });
        this.setState({ todos: newTodos, activeTodos: newTodos });
      },
    });
  };

  componentDidMount() {
    this.getTodos();
  }

  render() {
    return (
      <div className="todoContainer">
        <div className="inputContainer">
          <input
            className="taskInput"
            type="text"
            placeholder="Add a task"
            maxLength="50"
            onKeyPress={this.createTodo}
            value={this.state.inputValue}
            onChange={this.handleChange}
          />
        </div>
        <div className="listWrapper">
          <ul className="taskList">
            {this.state.todos.map(todo => {
              return (
                <li className="task" key={todo.id}>
                  <input
                    className="taskCheckbox"
                    type="checkbox"
                    checked={todo.status}
                    onChange={e => this.updateTodo(e, todo)}
                  />
                  <label className="taskLabel">{todo.title}</label>

                  <span
                    className="deleteTaskBtn"
                    onClick={e => this.deleteTodo(todo.id)}
                  >
                    x
                  </span>
                </li>
              );
            })}
          </ul>
          <div>
            <span>{this.state.activeTodos.length} items left</span>
            <button onClick={this.getTodos}>All</button>
            <button onClick={e => this.showActive()}>Active</button>
            <button onClick={e => this.showCompleted()}>Completed</button>
          </div>
        </div>
      </div>
    );
  }
}

export default TodosContainer;
