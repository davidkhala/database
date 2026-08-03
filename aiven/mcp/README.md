### Enable
Ensure MCP access enabled for your organization by an admin in the Aiven Console under Admin > Authentication > 

> **Allow MCP connections**

> Users can use MCP clients with services and other resources they have access to in this organization.

### configure
- Aiven MCP has not release in vscode extension

For full access + Allow connection credentials (development only)
```
    "aiven": {
      "type": "http",
      "url": "https://mcp.aiven.live/mcp?allow_secrets=true"
    }
```