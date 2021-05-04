import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';

import { Quiz } from './quiz';

@Injectable()
export class HttpClientService {

  httpOptions = {
    headers: new HttpHeaders({ 'Content-Type': 'application/json' })
  };

  private quizUrl: string = '/quizzes';
  private couponUrl: string = '/user/coupons';
  private shop_id;

  constructor(private http: HttpClient) {
    this.setAuthorization('my-auth-token');
  }

  public get(): Observable<Quiz[]> {
    const game_ticket = document.getElementById('quiz_root');
    const count = parseInt(game_ticket.dataset.count, 10);
    this.shop_id = game_ticket.dataset.shop_id;
    return this.http.get<Quiz[]>(this.quizUrl + `?count=${count+1}`, this.httpOptions);
  }

  public getShopId() {
    return this.shop_id;
  }

  public post(params: any): Observable<any> {
    return this.http.post<any>(this.couponUrl, params, this.httpOptions);
  }

  private errorHandler(err) {
    console.log('Error occured.', err);
    return Promise.reject(err.message || err);
  }

  public setAuthorization(token: string = ''): void {
    if (!token) {
      return;
    }
    const bearerToken: string = `Bearer ${token}`;
    this.httpOptions.headers = this.httpOptions.headers.set('Authorization', bearerToken);
  }

}
