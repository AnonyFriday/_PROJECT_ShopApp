import { bootstrapApplication } from '@angular/platform-browser';
import { appConfig } from './app/app.config';
import { HomeComponent } from './app/home/home.component';
import { OrderConfirmComponent } from './app/order-confirm/order-confirm.component';

bootstrapApplication(OrderConfirmComponent, appConfig).catch((err) =>
  console.error(err)
);
