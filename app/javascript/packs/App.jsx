// Run this example by adding <%= javascript_pack_tag 'hello_react' %> to the head of your layout file,
// like app/views/layouts/application.html.erb. All it does is render <div>Hello React</div> at the bottom
// of the page.

import React from "react";
import ReactDOM from "react-dom";
import TodoContainer from "./TodoContainer";
import "./App.css";

document.addEventListener("DOMContentLoaded", () => {
  ReactDOM.render(
    <div className="container">
      <div className="header">
        <h1>todos</h1>
      </div>
      <TodoContainer />
    </div>,
    document.body.appendChild(document.createElement("div"))
  );
});
