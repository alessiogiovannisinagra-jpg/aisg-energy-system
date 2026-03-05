# AISG Energy System

## Overview

AISG Energy System is a comprehensive real-time industrial control and energy monitoring platform designed for manufacturing facilities and industrial automation environments. The platform provides centralized machinery control, energy consumption tracking, and efficiency analytics through a TCP/UDP-based communication architecture with REST API integration.

## Project Vision

Enable industrial enterprises to optimize energy consumption, improve operational efficiency, and reduce carbon footprint through real-time monitoring, intelligent analytics, and automated control of manufacturing machinery.

---

## Technical Architecture

### System Components

```
┌─────────────────────────────────────────────────────────────┐
│                    Web Monitoring Dashboard                  │
│              (HTML5 / CSS3 / JavaScript)                     │
└────────────────────┬────────────────────────────────────────┘
                     │ HTTPS/REST API
┌────────────────────▼────────────────────────────────────────┐
│          REST API Server (C-based)                           │
│  - Request routing & validation                             │
│  - Authentication & Authorization                           │
│  - Data formatting & response handling                       │
└────────────────────┬────────────────────────────────────────┘
                     │
    ┌────────────────┼────────────────┐
    │                │                │
┌───▼────┐   ┌──────▼──────┐   ┌─────▼──────┐
│ Control │   │   Energy    │   │ Efficiency │
│ Module  │   │ Monitoring  │   │  Analytics │
│         │   │   Module    │   │   Engine   │
└───┬────┘   └──────┬──────┘   └─────┬──────┘
    │               │                │
    └───────────────┼────────────────┘
                    │ SQLite
            ┌───────▼────────┐
            │ Data Storage   │
            │ (SQLite DB)    │
            └────────────────┘
                    │ TCP/UDP
    ┌───────────────▼────────────────┐
    │   Industrial Machinery Network  │
    │  (Connected Devices & Sensors)  │
    └────────────────────────────────┘
```

### Communication Layers

- **Network Layer (L3)**: IPv4/IPv6
- **Transport Layer (L4)**: TCP/UDP
- **Application Layer**: Custom binary/JSON protocol
- **REST API**: HTTPS/TLS secured endpoints

---

## Core Features

### 1. Machinery Control Module
- Real-time control signal transmission via TCP/UDP
- Multi-device management and orchestration
- Command queuing with priority handling
- Status monitoring and device health checks
- Failover and redundancy mechanisms

### 2. Energy Monitoring Module
- Real-time power consumption measurement and logging
- Voltage, current, and frequency monitoring
- Power factor analysis and harmonic distortion tracking
- Peak load identification and trend analysis
- Sub-second sampling capabilities

### 3. Efficiency Analysis Engine
- Energy consumption per unit production (kWh/unit) calculation
- Historical data aggregation and statistical analysis
- Anomaly detection using statistical methods
- Predictive maintenance alerts based on efficiency degradation
- Benchmark comparison across machinery groups
- Daily/weekly/monthly/yearly consumption reports

### 4. Web Monitoring Dashboard
- Live energy consumption visualization (real-time charts)
- Machinery status and control interface
- Historical data visualization (line graphs, bar charts, heatmaps)
- Customizable alerts and notifications
- User authentication and role-based access control (RBAC)
- Export functionality (CSV, PDF reports)
- Mobile-responsive design

---

## Technology Stack

| Component | Technology | Notes |
|-----------|-----------|-------|
| **Backend** | C (C99/C11) | High performance, low latency |
| **API Server** | Custom C REST Server | HTTPS/TLS encryption |
| **Frontend** | HTML5, CSS3, Vanilla JavaScript | Real-time WebSocket support |
| **Database** | SQLite3 | Embedded, zero-configuration |
| **Protocols** | TCP/UDP, HTTPS/TLS | OSI Layer 3-4 + Application Layer |
| **Build System** | Make, GCC/Clang | Cross-platform compilation |
| **Testing** | Unit Tests (C), Integration Tests | Automated test suite |
| **CI/CD** | GitHub Actions | Automated builds and deployments |
| **Documentation** | Markdown, Doxygen | Code and API documentation |

---

## Performance Requirements

| Metric | Target | Notes |
|--------|--------|-------|
| **Control Command Latency** | < 100ms | End-to-end response time |
| **Data Sampling Rate** | ≥ 1Hz | Real-time monitoring |
| **API Response Time** | < 500ms | REST API endpoints |
| **Concurrent Connections** | 50+ devices | Scalable architecture |
| **Database Query Time** | < 1s | Historical data retrieval |
| **Memory Footprint** | < 100MB | Suitable for industrial PCs |
| **CPU Utilization** | < 30% | Efficient algorithms |

---

## Security Specifications

### Authentication & Authorization
- JWT (JSON Web Tokens) or Bearer token authentication
- Role-based access control (RBAC)
- Multi-user support with permission levels
- Session management and timeout policies

### Data Protection
- HTTPS/TLS 1.2+ encryption for all API communications
- Database encryption for sensitive data (optional)
- Secure credential storage and management
- Audit logging for all critical operations

### Input Validation
- Comprehensive input validation on all API endpoints
- SQL injection prevention (parameterized queries)
- XSS protection in frontend
- CSRF token validation

### Network Security
- Firewall rules and port restrictions
- VPN support for remote access
- Secure certificate management
- Rate limiting on API endpoints

---

## Project Structure

```
aisg-energy-system/
├── README.md                 # Project overview and documentation
├── Makefile                  # Build configuration
├── .gitignore               # Git ignore rules
├── LICENSE                  # Project license
│
├── src/                     # Source code
│   ├── main.c              # Entry point
│   ├── api_server.c        # REST API implementation
│   ├── control_module.c    # Machinery control logic
│   ├── energy_monitor.c    # Energy measurement module
│   ├── efficiency_engine.c # Analytics engine
│   ├── database.c          # SQLite interface
│   ├── protocol.c          # TCP/UDP communication
│   └── utils.c             # Utility functions
│
├── include/                # Header files
│   ├── api_server.h
│   ├── control_module.h
│   ├── energy_monitor.h
│   ├── efficiency_engine.h
│   ├── database.h
│   ├── protocol.h
│   └── utils.h
│
├── frontend/               # Web UI
│   ├── index.html         # Main dashboard
│   ├── css/
│   │   ├── style.css
│   │   └── responsive.css
│   ├── js/
│   │   ├── app.js
│   │   ├── api-client.js
│   │   ├── charts.js
│   │   └── auth.js
│   └── assets/
│       └── icons/
│
├── tests/                  # Unit and integration tests
│   ├── test_control_module.c
│   ├── test_energy_monitor.c
│   ├── test_efficiency_engine.c
│   └── test_api_server.c
│
├── docs/                   # Documentation
│   ├── ARCHITECTURE.md
│   ├── API_DOCUMENTATION.md
│   ├── INSTALLATION.md
│   ├── CONFIGURATION.md
│   ├── DEPLOYMENT.md
│   └── TROUBLESHOOTING.md
│
└── .github/
    └── workflows/
        ├── build.yml       # CI/CD pipeline
        └── tests.yml       # Automated testing
```

---

## Installation & Setup

### Prerequisites
- **OS**: Windows 10+ or Linux (Ubuntu 18.04+, CentOS 7+)
- **Compiler**: GCC 7.0+ or Clang 5.0+
- **Build Tools**: Make 4.0+
- **Dependencies**: 
  - SQLite3 development libraries
  - OpenSSL development libraries
  - Standard C library (libc)

### Quick Start

1. **Clone the repository**:
   ```bash
   git clone https://github.com/alessiogiovannisinagra-jpg/aisg-energy-system.git
   cd aisg-energy-system
   ```

2. **Install dependencies**:
   ```bash
   # Ubuntu/Debian
   sudo apt-get install build-essential sqlite3 libsqlite3-dev libssl-dev

   # CentOS/RHEL
   sudo yum install gcc make sqlite-devel openssl-devel

   # Windows (MSVC)
   # Use Visual Studio or download precompiled binaries
   ```

3. **Build the project**:
   ```bash
   make clean
   make build
   ```

4. **Run the server**:
   ```bash
   ./build/aisg-energy-system --config config.json
   ```

5. **Access the dashboard**:
   ```
   https://localhost:8443
   ```

---

## Configuration

Create a `config.json` file in the project root:

```json
{
  "server": {
    "host": "0.0.0.0",
    "port": 8443,
    "ssl": true,
    "cert_path": "certs/server.crt",
    "key_path": "certs/server.key"
  },
  "database": {
    "path": "data/energy_system.db",
    "backup_path": "data/backups/"
  },
  "monitoring": {
    "sampling_interval_ms": 1000,
    "buffer_size": 10000
  },
  "devices": {
    "max_connections": 100,
    "timeout_ms": 30000
  }
}
```

---

## API Endpoints

### Authentication
- `POST /api/auth/login` - User login
- `POST /api/auth/logout` - User logout
- `POST /api/auth/refresh` - Refresh token

### Machinery Control
- `GET /api/devices` - List all connected devices
- `GET /api/devices/{id}` - Get device details
- `POST /api/devices/{id}/command` - Send control command
- `GET /api/devices/{id}/status` - Get device status

### Energy Monitoring
- `GET /api/energy/current` - Current consumption
- `GET /api/energy/history` - Historical data
- `GET /api/energy/stats` - Energy statistics
- `POST /api/energy/export` - Export energy data

### Efficiency Analytics
- `GET /api/efficiency/analysis` - Efficiency analysis report
- `GET /api/efficiency/anomalies` - Detected anomalies
- `GET /api/efficiency/predictions` - Predictive insights
- `GET /api/efficiency/benchmarks` - Benchmark comparisons

---

## Development Guidelines

### Code Standards
- Follow ANSI C99 standard
- Use meaningful variable and function names
- Maximum line length: 100 characters
- Comment complex logic and algorithms
- Use consistent indentation (4 spaces)

### Testing
```bash
make test          # Run all tests
make test-coverage # Generate coverage report
```

### Documentation
- Maintain README files in each module
- Generate API documentation with Doxygen
- Document configuration options
- Maintain CHANGELOG for version updates

---

## Deployment

### Production Deployment
1. Generate SSL/TLS certificates
2. Configure environment variables
3. Set up database backups
4. Configure firewall rules
5. Deploy using Docker or native binary
6. Monitor system health and logs

### Monitoring & Maintenance
- Regular database maintenance and optimization
- Log rotation and archiving
- Security updates and patches
- Performance monitoring and tuning
- Backup verification and disaster recovery testing

---

## Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit changes (`git commit -m 'Add AmazingFeature'`)
4. Push to branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

---

## License

This project is proprietary and confidential to AISG. All rights reserved.

---

## Support & Documentation

For detailed documentation, see:
- [Architecture Documentation](docs/ARCHITECTURE.md)
- [API Documentation](docs/API_DOCUMENTATION.md)
- [Installation Guide](docs/INSTALLATION.md)
- [Configuration Guide](docs/CONFIGURATION.md)
- [Deployment Guide](docs/DEPLOYMENT.md)
- [Troubleshooting Guide](docs/TROUBLESHOOTING.md)

---

## Contact

For questions or support regarding AISG Energy System, please contact the development team.

**Project Status**: Under Development 🚀

---

*Last Updated: 2026-03-05*