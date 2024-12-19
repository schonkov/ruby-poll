// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

document.addEventListener("DOMContentLoaded", () => {
    const addAnswerButton = document.getElementById("add-answer");
    const answersFields = document.getElementById("answers-fields");
    const template = document.getElementById("answer-template");

    console.log("addAnswerButton:", addAnswerButton);
    console.log("answersFields:", answersFields);
    console.log("template:", template);

    if (!answersFields) {
        console.error("answers-fields element not found!");
        return;
    }

    let index = answersFields.querySelectorAll('.answer-field').length;

    addAnswerButton.addEventListener("click", () => {
        const clone = template.content.cloneNode(true);
        const input = clone.querySelector('.answer-input');

        input.setAttribute('name', `poll[answers_attributes][${index}][text]`);
        answersFields.appendChild(clone);

        index++;
    });
});

