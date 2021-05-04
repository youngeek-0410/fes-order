import { Component } from '@angular/core';

@Component({
  selector: 'quiz-root',
  template: `
    <!--The content below is only a placeholder and can be replaced.-->
    <div style="text-align:center">
      <h1>
        Welcome to {{ title }}!
      </h1>
    </div>

    <app-quiznair></app-quiznair>
  `
})
export class AppComponent {
  title = 'Angular Quiz';
}
