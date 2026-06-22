# EventHub

[![.NET](https://github.com/volosoft/eventhub/actions/workflows/dotnet.yml/badge.svg)](https://github.com/volosoft/eventhub/actions/workflows/dotnet.yml)

This is a reference application built with the ABP Framework v10.4.1. It implements Domain Driven Design with multiple application layers, separate public/admin hosts, an IdentityServer host, PostgreSQL-backed EF Core migrations, background services, and a custom payment module.

## The book

This solution is originally prepared to be a real-world example for the **Mastering ABP Framework** book.

![abp-book](etc/images/abp-book.png)

**The book is the only source that explains this solution**. This solution is highly referred in *Understanding the Reference Solution*, *Domain Driven Design* and other parts of the book.

**You can order the book on [Amazon](https://www.amazon.com/gp/product/B097Z2DM8Q) or on [Packt's website](https://www.packtpub.com/product/mastering-abp-framework/9781801079242).**

## Requirements

* .NET 10.0
* Docker
* [ABP CLI](https://abp.io/docs/latest/cli) for client-side library restoration
* [ABP Studio](https://abp.io/docs/latest/studio) if you want to use the Solution Runner and initial tasks

## How to run

### Initial tasks in ABP Studio

Open `EventHub.abpsln` in ABP Studio and use the **Default** run profile. The profile defines these tasks in `etc/abp-studio/run-profiles/Default.abprun.json`:

* **Initialize Solution**: Runs once per computer when the solution is initialized. It starts PostgreSQL/Redis containers, runs `abp install-libs`, and executes the DbMigrator.
* **Start Infrastructure**: Starts the PostgreSQL and Redis containers.
* **Install Client-Side Libraries**: Runs `abp install-libs`.
* **Migrate Database**: Runs `EventHub.DbMigrator` to apply EF Core migrations and seed initial data.

After the initial task completes, start the applications from ABP Studio's Solution Runner:

* `EventHub.IdentityServer`
* `EventHub.HttpApi.Host`
* `EventHub.Web`
* `EventHub.Admin.HttpApi.Host`
* `EventHub.Admin.Web`

### Manual startup

From the solution root, you can run the same setup script used by ABP Studio:

```powershell
./scripts/initialize-solution.ps1
```

Or run the steps manually:

```powershell
./etc/docker/up.ps1
abp install-libs
dotnet run --project src/EventHub.DbMigrator/EventHub.DbMigrator.csproj
dotnet build /graphBuild
```

Then run the application projects in this order:

```powershell
dotnet run --project src/EventHub.IdentityServer/EventHub.IdentityServer.csproj
dotnet run --project src/EventHub.HttpApi.Host/EventHub.HttpApi.Host.csproj
dotnet run --project src/EventHub.Web/EventHub.Web.csproj
dotnet run --project src/EventHub.Admin.HttpApi.Host/EventHub.Admin.HttpApi.Host.csproj
dotnet run --project src/EventHub.Admin.Web/EventHub.Admin.Web.csproj
```

`admin` user's password is `1q2w3E*`

## Solution structure

* `src/EventHub.IdentityServer`: Authentication host.
* `src/EventHub.HttpApi.Host`: Public HTTP API host.
* `src/EventHub.Web`: Public MVC/Razor Pages web application.
* `src/EventHub.Admin.HttpApi.Host`: Admin HTTP API host.
* `src/EventHub.Admin.Web`: Admin Blazor WebAssembly application.
* `src/EventHub.DbMigrator`: Console application that applies EF Core migrations and seeds data.
* `src/EventHub.BackgroundServices`: Background worker host.
* `modules/payment`: Custom payment module used by EventHub.

## ABP documentation

* [ABP Studio Solution Runner](https://abp.io/docs/latest/studio/running-applications)
* [ABP CLI install-libs](https://abp.io/docs/latest/cli#install-libs)
* [Layered Solution DbMigrator](https://abp.io/docs/latest/solution-templates/layered-web-application/db-migrator)
* [MVC / Razor Pages UI](https://abp.io/docs/latest/framework/ui/mvc-razor-pages)
* [Blazor UI](https://abp.io/docs/latest/framework/ui/blazor)
* [Entity Framework Core integration](https://abp.io/docs/latest/framework/data/entity-framework-core)

## See live

See the solution live on https://openeventhub.com

## Screenshots

### Public Web Side - (MVC/Razor Page UI)

#### Home Page

![Home Page](etc/images/homepage.png)

#### Event Creation Page

The event creation process consists of three steps: "Create a New Event", "Add Tracks to the Event (optional)" and "Add Sessions to the Tracks (optional)".

* After these steps, an "Event Preview" page is shown to the user to check the event details and publish the event.

##### Create a New Event

![Event Creation Page](etc/images/event-creation-page.png)

##### Add Tracks to the Event (optional)

![Event Creation Page - Tracks](etc/images/event-creation-page-tracks.png)

##### Add Sessions to the Tracks (optional)

![Event Creation Page - Sessions](etc/images/event-creation-page-sessions.png)

#### New Event Preview Page

![Event Creation Page - Preview](etc/images/event-creation-page-preview.png)

#### Events Page

![Events Page](etc/images/events-page.png)

#### Event Details Page

![Event Detail](etc/images/event-detail.png)

#### Organizations Page

![Organizations Page](etc/images/organizations-page.png)

#### Organization Details Page

![Organization Detail Page](etc/images/organization-detail-page.png)

#### Profile Page

![Profile Page](etc/images/profile-page.png)

#### Payment Module Pages

The payment module provides an API to make payments via **PayPal** easily. This application uses this module to perform payment transactions.

> To learn more about the **Payment Module** and see the integration, please check out the [payment module documentation](modules/payment/README.md).

##### Pricing Page

![Pricing Page](etc/images/pricing-page.png)

#### Pre-Checkout Page

![Pre Checkout Page](etc/images/pre-checkout-page.png)
