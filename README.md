# Player Performance Analysis in the Premier League 24/25 Season :soccer:

## Objective
This project analyzes Premier League player performance by exploring the impact of attacking metrics like expected goals (xG) and shot-creating actions on the total goals scored. Linear regression was employed to quantify these relationships and derive actionable insights.

## Dataset Features
The dataset includes performance metrics for 478 players, covering:

- **Personal Information**: Player, Team, Nation, Position, Age.
- **Performance Metrics**: Goals, Assists, Expected Goals (xG), Expected Assists (xAG), Shot-Creating Actions, Goal-Creating Actions, Touches, Dribbles, Tackles, etc.
- **Passing and Progression**: Passes Completed, Pass Completion %, Progressive Passes, Progressive Carries.
- **Other Metrics**: Minutes, Yellow Cards, Red Cards, and more.

## Methodology
### 1. Data Cleaning
- Handled missing values and outliers using Excel for initial inspection and SQL for detailed validation and aggregation.
- Advanced cleaning and preprocessing performed in Python (pandas).
### 2. Exploratory Data Analysis (EDA)
- Used heatmaps to explore feature correlations and scatter plots to analyze team-level patterns.
- Created radar charts and bubble plots to visualize key player metrics and goal contributions.
### 3. Data Preprocessing
- Engineered features like Goals per Game and scaled data for consistency.
- Split the dataset into training and testing subsets for model evaluation.
### 4. Model Development
- Trained a linear regression model with attacking metrics (Goals per Game, xG, Minutes, Shot-Creating Actions, etc.) to predict total goals scored.
### 5. Model Evaluation
- Metrics: R² = 0.85, MSE = 0.51, RMSE = 0.72.
- Coefficients revealed significant relationships: Goals per Game (1.93), xG (0.27), and Minutes (0.0002).

## Key Visualizations
- **Bubble Plot**: Showed efficient goal scorers (xG vs. goals scored).
- **Heatmap**: Highlighted feature correlations across performance metrics.
- **Radar Chart**: Compared top players' goal contributions (goals + assists).
- **Clustered Bar Chart**: Visualized team-level goal contributions.

## Tools and Libraries
- **Data Cleaning and Aggregation**: Excel, SQL, Python (pandas).
- **Visualization**: Python (matplotlib, seaborn).
- **Modeling**: Python (sklearn – Linear Regression)


  
