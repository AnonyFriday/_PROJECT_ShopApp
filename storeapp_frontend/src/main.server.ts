import { bootstrapApplication } from '@angular/platform-browser';
import { config } from './app/app.config.server';
import { OrderComponent } from './app/order/order.component';

const bootstrap = () => bootstrapApplication(OrderComponent, config);

export default bootstrap;
