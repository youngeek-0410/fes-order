import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { HttpClientModule } from '@angular/common/http';

import { AppComponent } from './app.component';
import { QuestionnairModule } from './quiznair/quiznair.module';
import { QuizService } from './quiz.service';
import { HttpClientService } from './http-client.service';


@NgModule({
  declarations: [
    AppComponent
  ],
  imports: [
    BrowserModule,
    QuestionnairModule,
    HttpClientModule
  ],
  providers: [
    QuizService,
    HttpClientService
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }
