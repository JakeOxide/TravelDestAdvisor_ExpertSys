const express = require("express");
const { exec } = require("child_process");
const cors = require("cors"); // Import cors
const app = express();
const port = 3000;

app.use(cors()); // Enable CORS for all routes
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

app.get("/suggest", (req, res) => {
  const weather = req.query.weather.replace(/[^a-zA-Z0-9 ]/g, "");
  const feature = req.query.feature.replace(/[^a-zA-Z0-9 ]/g, "");

  // Call the Prolog script

  const pathToPrologFile =
    'D:\\SPR2024\\AI\\Assignments\\Assignment III\\PrologTests\\Test v1.0\\TravelDestAdvisor_ExpertSys\\InferenceEngine.pl';

  const command = `swipl -s "${pathToPrologFile}" -g "findall(City, suggestDestination(City, '${weather}', '${feature}'), Cities), write(Cities), halt." -t halt`;
  console.log("Executing command:", command);

  exec(command, (error, stdout, stderr) => {
    if (error) {
      console.error("Prolog execution error:", stderr);
      return res.status(500).send("Error executing Prolog: " + stderr);
    }
    const cities = stdout
      .trim()
      .split(",")
      .map((city) => city.trim())
      .filter((city) => !city.startsWith("_"));
    console.log("Cities found:", cities);
    res.json({ cities });
  });
});

app.listen(port, () => {
  console.log(`Server running at http://localhost:${port}`);
});
