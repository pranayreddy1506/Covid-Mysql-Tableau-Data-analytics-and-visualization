select * 
From PortfolioProjects..CovidDeaths



select *
from PortfolioProjects..CovidVaccinations

-- select data that are going to be using

select Location, date, total_cases, new_cases, total_deaths, population
From PortfolioProjects..CovidDeaths
order by 1,2

-- looking at total cases vs total deaths
--- shows likelihood of dying in country
select Location, date, total_cases, new_cases, total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
From PortfolioProjects..CovidDeaths
where location like '%states%'
order by 1,2


-- looking at total cases vs total population

select Location, date, total_cases, new_cases, Population, (total_cases/Population)*100 as DeathPercentage
From PortfolioProjects..CovidDeaths
where location like '%states%'
order by 1,2

--- looking at countries with highest infection rate compared to population
select Location, Population, Max(total_cases) as HighestInfectioncount, Max((total_cases/Population))*100 as PercentpopulationInfected
From PortfolioProjects..CovidDeaths
Group by Location, Population
order by PercentpopulationInfected desc

-- showing countires with highest deathcount
select Location, MAX(cast(total_deaths as int)) as TotalDeathCount
From PortfolioProjects..CovidDeaths
where continent is not null
Group by Location
Order by TotalDeathCount desc

--- showing deathcount with highest deathcount

select continent, MAX(cast(total_deaths as int)) as TotalDeathCount
From PortfolioProjects..CovidDeaths
where continent is not null
Group by continent
Order by TotalDeathCount desc

-- Global Numbers
select SUM(new_cases) as total_cases, SUM(cast(new_deaths as int)) as total_deaths,SUM(cast(new_deaths as int))/SUM(new_cases)*100  as deathpercentage
From PortfolioProjects..CovidDeaths
where continent is not null
order by 1,2

-- joining two tables with locations and date
select * 
from PortfolioProjects..CovidDeaths dea
join PortfolioProjects..CovidVaccinations vac
on dea.location = vac.location
and dea.date = vac.date

