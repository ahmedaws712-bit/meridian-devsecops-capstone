import json
import urllib.parse
import urllib.request

query = '{job="devsecops-capstone"}'
url = "http://localhost:3100/loki/api/v1/query?" + urllib.parse.urlencode({"query": query})

with urllib.request.urlopen(url) as response:
    data = json.loads(response.read().decode("utf-8"))

alerts = []

for result in data.get("data", {}).get("result", []):
    labels = result.get("stream", {})
    severity = labels.get("severity", "unknown")
    source = labels.get("source", "unknown")

    if severity in ["high", "critical"]:
        for value in result.get("values", []):
            alerts.append({
                "severity": severity,
                "source": source,
                "message": value[1]
            })

if alerts:
    print("ALERT SIMULATION RESULT: HIGH/CRITICAL security events found.")
    for alert in alerts:
        print(f"- severity={alert['severity']} source={alert['source']} message={alert['message']}")
    print("Action: email/PagerDuty notification would be sent in production.")
else:
    print("ALERT SIMULATION RESULT: no high or critical events found.")
