import json
import time
import urllib.request

LOKI_URL = "http://localhost:3100/loki/api/v1/push"

events = [
    {
        "labels": {
            "job": "devsecops-capstone",
            "cloud": "aws",
            "source": "guardduty",
            "severity": "high"
        },
        "message": "AWS GuardDuty simulated finding: anomalous API call detected from unusual location"
    },
    {
        "labels": {
            "job": "devsecops-capstone",
            "cloud": "azure",
            "source": "defender",
            "severity": "high"
        },
        "message": "Azure Defender simulated alert: suspicious storage access pattern detected"
    },
    {
        "labels": {
            "job": "devsecops-capstone",
            "cloud": "local",
            "source": "falco",
            "severity": "warning"
        },
        "message": "Falco runtime alert: shell spawned and /etc/passwd read in meridian-devsecops namespace"
    },
    {
        "labels": {
            "job": "devsecops-capstone",
            "cloud": "ci",
            "source": "gitleaks",
            "severity": "critical"
        },
        "message": "CI security gate simulated alert: exposed secret detected in pull request"
    },
    {
        "labels": {
            "job": "devsecops-capstone",
            "cloud": "ci",
            "source": "opa",
            "severity": "high"
        },
        "message": "Compliance gate simulated alert: policy violation blocked before merge"
    }
]

def push_event(labels, message):
    payload = {
        "streams": [
            {
                "stream": labels,
                "values": [
                    [str(time.time_ns()), message]
                ]
            }
        ]
    }

    request = urllib.request.Request(
        LOKI_URL,
        data=json.dumps(payload).encode("utf-8"),
        headers={"Content-Type": "application/json"},
        method="POST"
    )

    with urllib.request.urlopen(request) as response:
        return response.status

for event in events:
    status = push_event(event["labels"], event["message"])
    print(f"Pushed event to Loki. status={status}, source={event['labels']['source']}")
