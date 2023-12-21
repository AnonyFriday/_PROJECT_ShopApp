import { bootstrapApplication } from '@angular/platform-browser';
import { appConfig } from './app/app.config';
import { OrderComponent } from './app/order/order.component';
import { LoginComponent } from './app/login/login.component';
import { RegisterComponent } from './app/register/register.component';

bootstrapApplication(RegisterComponent, appConfig).catch((err) =>
  console.error(err)
);
