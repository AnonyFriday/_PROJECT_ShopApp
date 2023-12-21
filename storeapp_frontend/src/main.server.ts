import { bootstrapApplication } from '@angular/platform-browser';
import { config } from './app/app.config.server';
import { OrderComponent } from './app/order/order.component';
import { LoginComponent } from './app/login/login.component';

const bootstrap = () => bootstrapApplication(LoginComponent, config);

export default bootstrap;
