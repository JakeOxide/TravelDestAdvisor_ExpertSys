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

  const pathToPrologFilei =
    ".\\InferenceEngine.pl";

  // Call only the first solution
  const command = `swipl -s "${pathToPrologFilei}" -g "suggestDestination(City, '${weather}', '${feature}'), write(City), halt." -t halt`;
  console.log("Executing command:", command);

  exec(command, (error, stdout, stderr) => {
    if (error) {
      console.error("Prolog execution error:", stderr);
      return res.status(500).send("Error executing Prolog: " + stderr);
    }

    const city = stdout.trim(); // This will get the first city suggestion
    console.log("City found:", city);

    if (city) {
      res.json({ cities: [city] }); // Return as an array
    } else {
      res.json({ cities: [] }); // No city found
    }
  });
});

app.listen(port, () => {
  console.log(`Server running at http://localhost:${port}`);
});

app.get("/explain", (req, res) => {
  const weather = req.query.weather.replace(/[^a-zA-Z0-9 ]/g, "");
  const feature = req.query.feature.replace(/[^a-zA-Z0-9 ]/g, "");
  const city = req.query.city.replace(/[^a-zA-Z0-9 ]/g, ""); // Get city from query

  const pathToPrologFile =
    ".\\InferenceEngine.pl";

  const command = `swipl -s "${pathToPrologFile}" -g "get_explanation('${city}', '${weather}', '${feature}', Reason), write(Reason), halt." -t halt`;

  console.log("Executing command:", command);

  exec(command, (error, stdout, stderr) => {
    if (error) {
      console.error("Prolog execution error:", stderr);
      return res.status(500).send("Error executing Prolog: " + stderr);
    }
    const reason = stdout.trim();
    console.log("Explanation found:", reason);
    res.json({ reason });
  });
});

app.get("/learn", (req, res) => {
  const city = req.query.city.replace(/[^a-zA-Z0-9 ]/g, "");
  const weather = req.query.weather.replace(/[^a-zA-Z0-9 ]/g, "");
  const feature = req.query.feature.replace(/[^a-zA-Z0-9 ]/g, "");

  const pathToPrologFileL =
    ".\\KnowledgeAcquisition.pl";

  const command = `swipl -s "${pathToPrologFileL}" -g "learn('${city}', '${weather}', '${feature}'), halt." -t halt`;
  console.log("Executing command:", command);

  exec(command, (error, stdout, stderr) => {
    if (error) {
      console.error("Prolog execution error:", stderr);
      return res.status(500).send("Error executing Prolog: " + stderr);
    }
    console.log("Knowledge saved:", stdout);
    res.json({ message: "Knowledge saved successfully." });
  });
});
