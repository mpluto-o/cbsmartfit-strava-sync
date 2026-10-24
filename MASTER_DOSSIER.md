# Master Project Dossier: Crossbeats Everest 2.0 (CB SmartFit) Telemetry Engine, Strava Bridge, OLED Dark Mode & Health Connect Integration

---

## 1. Executive Summary & Purpose

This project is a comprehensive reverse-engineering, bytecode patching, and systems-integration overhaul of the **Crossbeats Everest 2.0** companion Android application (**CB SmartFit**, package name `com.yc.cbsmartfit`).

Budget smartwatch hardware (optical PPG heart rate sensors, 3-axis accelerometers, SpO2 monitors, and BLE 5.0 microcontrollers) is often capable, but frequently crippled by OEM companion software that lacks cloud sync, suffers from severe UI contrast bugs, fails to record vital athletic metrics like cadence, crashes during GPS workout mapping, and locks user biometric data into an unmaintained silo.

Through Dalvik bytecode (Smali) decompilation, resource editing, SQLite hook injection, and custom Java/Smali telemetry bridges, we transformed the OEM application into a modern fitness client that:
* Natively exports workouts with paired GPS, continuous heart rate, and real-time cadence (SPM) directly to the **Strava API v3**.
* Continuously commits real-time BLE heart rate measurements into local SQLite storage and streams them to **Android Health Connect** and **Google Fit** without timestamp regressions.
* Eliminates Health Connect record duplication via deterministic `clientRecordId` hashing.
* Overhauls more than 190 layout containers and activities into a true **OLED pitch-black (`#000000` / `#121214`) Dark Mode**.

---

## 2. Hardware & Test Bench Profile

* **Smartwatch Model:** Crossbeats Everest 2.0 (OEM hardware family: Shenzhen Yuchong / Linwear / YC Pedometer platform).
* **Onboard Sensors:** Multi-wavelength optical PPG heart rate sensor, pulse oximeter (SpO2), 3-axis accelerometer / pedometer, blood pressure estimation sensor, sleep stage tracker.
* **Connectivity Protocol:** Bluetooth Low Energy (BLE 5.0), proprietary binary command and packet stream handled by the internal `com.yc.pedometer` SDK.
* **Test Bench Smartphone:** Motorola Edge 50 Neo (ADB Device ID: `ZD222PG7KW`).
* **Operating System:** Android 14 / Android 15.
* **Target Package:** `com.yc.cbsmartfit` (Base APK Version Name: `1.0.4`, Version Code: `104`).

---

## 3. Remote Git Repositories

### A. Public Showcase Repository
* **URL:** [https://github.com/mpluto-o/cbsmartfit-strava-sync](https://github.com/mpluto-o/cbsmartfit-strava-sync)
* **Visibility:** Public
* **Purpose:** Showcase and portfolio repository documenting the complete reverse-engineering methodology, architecture diagrams, Smali patch files, sample telemetry files, and build workflows.

### B. Private Disaster Recovery Repository
* **URL:** [https://github.com/mpluto-o/cbsmartfit-private-backup](https://github.com/mpluto-o/cbsmartfit-private-backup)
* **Visibility:** Private
* **Purpose:** Complete, restorable backup of the entire decompiled source tree (`apk_disassembled`). Split into multi-part archives under GitHub's 100MB limit (`apk_disassembled_source.tar.gz.part_aa` through `part_ad`) to ensure the patched codebase can be cloned, assembled, and recompiled anywhere from scratch.

---

## 4. Local Filesystem Map & Exact Paths

All project assets, tools, build pipelines, and decompiled trees are located on your local workstation at:

### 1. Active Working Directories
* **Development & Build Workspace:**  
  [/Users/mpluto/.gemini/antigravity/scratch/cbsmartfit_dev](file:///Users/mpluto/.gemini/antigravity/scratch/cbsmartfit_dev)
* **Disassembled Bytecode Tree (`v19` live code):**  
  [/Users/mpluto/.gemini/antigravity/scratch/cbsmartfit_dev/apk_disassembled](file:///Users/mpluto/.gemini/antigravity/scratch/cbsmartfit_dev/apk_disassembled)
* **Showcase Git Repository Directory:**  
  [/Users/mpluto/.gemini/antigravity/scratch/cbsmartfit-strava-sync](file:///Users/mpluto/.gemini/antigravity/scratch/cbsmartfit-strava-sync)
* **Private Backup Git Repository Directory:**  
  [/Users/mpluto/.gemini/antigravity/scratch/cbsmartfit-private-backup](file:///Users/mpluto/.gemini/antigravity/scratch/cbsmartfit-private-backup)

### 2. Standalone Tooling & Runtimes
* **Apktool (v2.10.0 JAR):**  
  [/Users/mpluto/.gemini/antigravity/scratch/cbsmartfit_dev/apktool/apktool.jar](file:///Users/mpluto/.gemini/antigravity/scratch/cbsmartfit_dev/apktool/apktool.jar)
* **Uber-APK-Signer (v1.3.0 JAR):**  
  [/Users/mpluto/.gemini/antigravity/scratch/cbsmartfit_dev/apktool/uber-apk-signer-1.3.0.jar](file:///Users/mpluto/.gemini/antigravity/scratch/cbsmartfit_dev/apktool/uber-apk-signer-1.3.0.jar)
* **Standalone JDK 17:**  
  [/Users/mpluto/.gemini/antigravity/scratch/jdk17](file:///Users/mpluto/.gemini/antigravity/scratch/jdk17)
* **Android SDK & ADB:**  
  [/Users/mpluto/.gemini/antigravity/scratch/android-sdk/platform-tools/adb](file:///Users/mpluto/.gemini/antigravity/scratch/android-sdk/platform-tools/adb)

### 3. Generated APK Binaries
* **Final Signed Production APK (`v20` - Battery & Thermal Optimized):**  
  [/Users/mpluto/.gemini/antigravity/scratch/cbsmartfit_dev/signed_output_v20/unsigned_v20-aligned-debugSigned.apk](file:///Users/mpluto/.gemini/antigravity/scratch/cbsmartfit_dev/signed_output_v20/unsigned_v20-aligned-debugSigned.apk)
* **Unsigned Final Build (`v20`):**  
  [/Users/mpluto/.gemini/antigravity/scratch/cbsmartfit_dev/unsigned_v20.apk](file:///Users/mpluto/.gemini/antigravity/scratch/cbsmartfit_dev/unsigned_v20.apk)
* **Historical Builds:**  
  * `v19` (Deterministic Health Connect deduplication): [/Users/mpluto/.gemini/antigravity/scratch/cbsmartfit_dev/signed_output_v19](file:///Users/mpluto/.gemini/antigravity/scratch/cbsmartfit_dev/signed_output_v19)
  * `v18` (SQLite schema verification & dark refresh v1): [/Users/mpluto/.gemini/antigravity/scratch/cbsmartfit_dev/signed_output_v18](file:///Users/mpluto/.gemini/antigravity/scratch/cbsmartfit_dev/signed_output_v18)
  * `v17` (Pull-to-refresh & SQLite persistence): [/Users/mpluto/.gemini/antigravity/scratch/cbsmartfit_dev/signed_output_v17](file:///Users/mpluto/.gemini/antigravity/scratch/cbsmartfit_dev/signed_output_v17)

---

## 5. Chronological Engineering Journey (v1 to v19)

### Phase 1: The Dark Mode Reconstruction (Versions 1–16)
* **The Problem:** While the OEM app had an initial toggle for dark mode on the top-level home tabs, navigating into detail views (Steps, Sleep Stages, Heart Rate, Blood Oxygen, Blood Pressure, Device Settings) displayed broken UI. Layout XML files had hardcoded pure white backgrounds (`#FFFFFFFF`) paired with white text (`#FFFFFFFF`), resulting in invisible numbers and blank screens.
* **The Solution:**
  1. Audited and modified the root application theme in `res/values/styles.xml`, setting `android:windowBackground` and primary card colors to `#121214`.
  2. Inspected over 190 layout XML files in `res/layout/` and performed 306 container replacements across `ScrollView`, `LinearLayout`, `RelativeLayout`, `ViewPager`, and custom card wrappers.
  3. Re-mapped text color references across all detail fragments: primary metrics converted to `#FFFFFFFF` (crisp bold white) and secondary metric descriptions to `#FF9CA3AF` (soft gray).
  4. Patched custom canvas graph views (such as `HeartRateCurveView` and `SleepBarChartView`) to prevent them from rendering dark gray gridlines over dark backgrounds.

### Phase 2: Strava Telemetry Bridge & Map Crash Prevention
* **The Problem:** The OEM app possessed zero third-party export functionality. Furthermore, launching an outdoor GPS run crashed the app immediately upon opening the map interface due to unhandled camera position callbacks and missing lifecycle guards. In addition, the watch provided steps and heart rate, but zero cadence telemetry.
* **The Solution:**
  1. Implemented [`StravaMapHelper.smali`](file:///Users/mpluto/.gemini/antigravity/scratch/cbsmartfit-strava-sync/patches/smali/StravaMapHelper.smali) to safely handle Google Maps / AMap initialization, catch null reference camera updates, and prevent map rendering crashes.
  2. Implemented [`GpsToGpxUtils.smali`](file:///Users/mpluto/.gemini/antigravity/scratch/cbsmartfit-strava-sync/patches/smali/GpsToGpxUtils.smali) to build standard GPX 1.1 workout files containing Garmin/Strava TrackPoint extensions:
     ```xml
     <trkpt lat="28.6211" lon="77.1403">
       <ele>202</ele>
       <time>2026-10-18T08:41:05.00Z</time>
       <extensions>
         <gpxtpx:TrackPointExtension>
           <gpxtpx:hr>134</gpxtpx:hr>
           <gpxtpx:cad>112</gpxtpx:cad>
         </gpxtpx:TrackPointExtension>
       </extensions>
     </trkpt>
     ```
  3. Added real-time cadence calculation logic:
     $$\text{Cadence (Steps per Minute)} = \frac{\Delta \text{Steps}}{\Delta t \text{ (minutes)}}$$
  4. Implemented [`StravaEndWorkoutListener.smali`](file:///Users/mpluto/.gemini/antigravity/scratch/cbsmartfit-strava-sync/patches/smali/StravaEndWorkoutListener.smali) hooked into `SportMapActivity.completeWorkout()`. It streams the generated GPX file directly to Strava's `/api/v3/uploads` API via multipart HTTP POST using OAuth2 access and refresh tokens.

### Phase 3: Real-Time Heart Rate SQLite Persistence (Versions 17–18)
* **The Problem:** When the watch broadcasted real-time BLE heart rate measurements to the phone, the app kept the value in volatile memory or view state. Whenever the app was backgrounded or reopened, the home screen reverted to an older historical point (e.g., reverting from 1:50 PM back to 1:04 PM). The pull-to-refresh spinner on the home screen was also white.
* **The Solution:**
  1. Reverse-engineered the Dalvik message dispatch handler in `FragmentHomePage$6.smali` (`pswitch_15`) and `DataProcessing.smali` (`rateOf24HourRealTimeDataOperate`).
  2. Hooked the incoming BLE real-time packet stream to immediately execute `saveHeartRateData` against the SQLite table `rate_24_hour_table_name`. The record is written with `TimeFormatUtils.getPhoneCurrentMinute()` representing the exact minute of the day (0–1439).
  3. Hooked real-time ingress into `HealthConnectUtils.uploadHeartRateRecord()`.
  4. Patched `FragmentHomePage.smali` to enable manual forced sync on pull-down.

### Phase 4: Deterministic Health Connect Deduplication (Version 19)
* **The Problem:** The Heart Rate card in Google Fit disappeared completely from the home feed or fell 8+ hours behind.
  * Root Cause A (Ghost Bloat): In earlier versions, CB SmartFit uploaded records with `Metadata = null`. Health Connect assigned random UUIDs on every sync event, creating thousands of duplicate records in Health Connect's change log. Google Fit's sync worker bogged down trying to process thousands of duplicate change events.
  * Root Cause B (Google Fit UI Filter): Google Fit's UI hides the Heart Rate card from the Home screen whenever the freshest reading in its cache is $> 8$ hours old.
  * Root Cause C (OS Permission Lock): On Android 14/15, background reading of Health Connect requires `READ_HEALTH_DATA_IN_BACKGROUND`. Because Google Fit is in maintenance mode, it lacks this permission and can **only** sync when open in the foreground.
* **The Solution:**
  1. Patched [`HealthConnectModel.smali`](file:///Users/mpluto/.gemini/antigravity/scratch/cbsmartfit-strava-sync/patches/smali/HealthConnectModel.smali) to create a deterministic metadata builder: `createMetadata(clientRecordId)`.
  2. Updated all record upload callbacks (`uploadHeartRateRecord`, `uploadOxygenSaturationRecord`, `uploadSleepSessionRecord`, `uploadBloodPressureRecord`) to supply deterministic IDs based on the metric and exact timestamp:
     * Heart Rate: `cbsmartfit_hr_<calendarTime>`
     * SpO2: `cbsmartfit_spo2_<startDate>`
     * Blood Pressure: `cbsmartfit_bp_<calendarTime>`
     * Sleep: `cbsmartfit_sleep_<bedtime>`
  3. This ensures Health Connect performs an **idempotent upsert** (`insertRecords`). Updating existing timestamps updates the existing record rather than creating new entries.
  4. Changed the pull-to-refresh spinner background color in `FragmentHomePage.smali` to `#000000` (pure AMOLED black).
  5. Tested and verified on device: Google Fit ingested the deduplicated stream, and the **Heart Rate card reappeared directly on Google Fit's Home dashboard**.

### Phase 5: Power & Thermal Optimization (Version 20)
* **The Problem:** Calling `uploadHeartRateRecord()` on continuous 1-second BLE real-time packets in `DataProcessing.smali` caused a runaway background loop. Because `uploadHeartRateRecord()` queried the entire SQLite database (`queryHeartRateAllInfo`) and generated huge `Gson.toJson()` debug logs on every packet, it pinned the CPU at 100%, causing high device temperatures, exhausting the 512MB heap with `OutOfMemoryError` in both the app and Android OS `system_server`, forcing system reboots, and draining the battery overnight.
* **The Solution:**
  1. **Decoupled Live BLE Stream from Full-Database Health Connect Uploads:** Removed `uploadHeartRateRecord()` from `rateOf24HourRealTimeDataOperate` and `FragmentHomePage$6.smali` (`pswitch_15`).
  2. **Preserved Instant Local Minute Persistence:** Retained `saveHeartRateData` (SQLite write) on the live BLE stream so the app's real-time UI, home screen, and graphs still update and persist instantly for the current minute without reverting.
  3. **Batch Sync Safe Execution:** Health Connect sync now triggers safely during pull-to-refresh (manual sync), hourly periodic sync (OEM event `0x18`), and upon workout completion.
  4. **Eliminated Memory-Intensive Logging:** Replaced massive full-database `Gson.toJson()` log serialization in `HealthConnectUtils.smali` across all health records with lightweight size-counter logging.

---

## 6. Deep Technical Architecture & Bytecode Hooks

```
+--------------------+             BLE Packets             +--------------------------+
| Crossbeats         | ----------------------------------> | CB SmartFit (Patched)    |
| Everest 2.0 Watch  |  (Continuous HR, Steps, Gyro)       | - Intercepts BLE Stream  |
+--------------------+                                     | - Pairs Phone GPS Points |
                                                           | - Injects Cadence Math   |
                                                           | - Commits to SQLite DB   |
                                                           +--------------------------+
                                                             |                      |
                                            TrackPoint Ext.  v                      v HealthConnect
                                           +--------------------+      +-------------------------+
                                           | GPX Builder Engine |      | Android Health Connect  |
                                           +--------------------+      +-------------------------+
                                                     |                              |
                                                     v Multipart POST               v
                                           +--------------------+      +-------------------------+
                                           | Strava API v3      |      | Google Fit / Fitbit     |
                                           | (/api/v3/uploads)  |      +-------------------------+
                                           +--------------------+
```

### A. Real-Time BLE Ingress & SQLite Persistence
* **File:** `smali_classes7/com/yc/pedometer/utils/DataProcessing.smali`
* **Method:** `rateOf24HourRealTimeDataOperate([B)V`
* **Mechanism:** When the BLE characteristic receives real-time heart rate bytes, the value is extracted from payload offset 4. We injected instructions to compute the phone's current minute:
  ```smali
  invoke-static {}, Lcom/yc/pedometer/utils/TimeFormatUtils;->getPhoneCurrentMinute()I
  move-result v0
  ```
  and write it into the SQLite table:
  ```smali
  invoke-static {p0, v0, v1}, Lcom/yc/pedometer/utils/SPUtils;->saveHeartRateData(Landroid/content/Context;II)V
  ```
* **Database Schema:** SQLite database file `cbsmartfit.db` inside `/data/user/0/com.yc.cbsmartfit/databases/`. Table `rate_24_hour_table_name` stores 1440 integer slots per day, corresponding to every minute of the day.

### B. Health Connect Deterministic Deduplication
* **File:** `smali_classes5/com/yc/pedometer/health/HealthConnectModel.smali`
* **Method Added:**
  ```smali
  .method public static final createMetadata(Ljava/lang/String;)Landroidx/health/connect/client/records/metadata/Metadata;
      .registers 10
      new-instance v8, Landroidx/health/connect/client/records/metadata/Metadata;
      sget-object v3, Landroidx/health/connect/client/records/metadata/DataOrigin;->EMPTY:Landroidx/health/connect/client/records/metadata/DataOrigin;
      sget-object v4, Ljava/time/Instant;->EPOCH:Ljava/time/Instant;
      const-wide/16 v5, 0x0
      const/16 v7, 0x67
      const/4 v2, 0x0
      move-object v0, v8
      move-object v1, p0
      invoke-direct/range {v0 .. v7}, Landroidx/health/connect/client/records/metadata/Metadata;-><init>(Ljava/lang/String;Landroidx/health/connect/client/records/metadata/DataOrigin;Ljava/time/Instant;IILkotlin/jvm/internal/DefaultConstructorMarker;)V
      return-object v8
  .end method
  ```
* **Hooked Ingest Classes:**
  * `HealthConnectModel$uploadHeartRateRecord$1.smali`: Instantiates `HeartRateRecord` with deterministic `clientRecordId = "cbsmartfit_hr_" + calendarTime`.
  * `HealthConnectModel$uploadOxygenSaturationRecord$1.smali`: Instantiates `OxygenSaturationRecord` with `clientRecordId = "cbsmartfit_spo2_" + startDate`.
  * `HealthConnectModel$uploadSleepSessionRecord$1.smali`: Instantiates `SleepSessionRecord` with `clientRecordId = "cbsmartfit_sleep_" + bedtime`.
  * `HealthConnectModel$uploadBloodPressureRecord$1.smali`: Instantiates `BloodPressureRecord` with `clientRecordId = "cbsmartfit_bp_" + calendarTime`.

### C. OLED Pure Black UI Styling
* **Files:** `res/values/styles.xml`, `res/values/colors.xml`, `smali_classes2/com/yc/cbsmartfit/home/FragmentHomePage.smali`.
* **Changes:**
  * Pull-to-refresh spinner background set to `-0x1000000` (Smali representation of integer `#FF000000` / pitch black).
  * Card borders and surfaces set to `#121214`.
  * Status bars and action bars forced to dark system ui flags (`SYSTEM_UI_FLAG_LAYOUT_STABLE` and inverted light status bar icons).

---

## 7. The Google Fit vs. Health Connect vs. Fitbit Ecosystem

1. **Google Fit Deprecation Status:**
   * Google has formally deprecated the Google Fit Android APIs and is winding down active development.
   * On Android 14 and 15, background sync requires the system permission `READ_HEALTH_DATA_IN_BACKGROUND`. Google Fit has not been updated with this permission.
   * **Consequence:** Google Fit cannot sync in the background on modern Android. It only fetches updates when you open the app in the foreground.
2. **What Health Connect Is:**
   * Built directly into Android 14+ (`Settings -> Security & Privacy -> Health Connect`).
   * It is an on-device, encrypted database and permission coordinator (analogous to Apple HealthKit). It has no consumer dashboard of its own; it serves as a central data hub.
3. **What App Replaces Google Fit?**
   * **Fitbit App (by Google):** Google's primary fitness frontend. **A Fitbit hardware device is not required.** It reads steps, heart rate, sleep, and workouts directly from Health Connect.
   * **Alternative Viewers:** Samsung Health, Strava, and other third-party Health Connect-enabled apps.

---

## 8. Disaster Recovery & Build Runbook

If you ever need to rebuild the application from scratch or set it up on another machine, use the steps below.

### Step 1: Clone the Backup Repository
```bash
git clone https://github.com/mpluto-o/cbsmartfit-private-backup.git
cd cbsmartfit-private-backup
```

### Step 2: Reassemble the Split Source Archive
```bash
cat apk_disassembled_source.tar.gz.part_* | tar -xz
# This extracts the full apk_disassembled directory containing all smali, resources, and configs.
```

### Step 3: Compile Using Apktool & AAPT2
```bash
java -jar apktool/apktool.jar b apk_disassembled -o unsigned_patched.apk --use-aapt2
```

### Step 4: Align & Sign the APK
```bash
java -jar apktool/uber-apk-signer-1.3.0.jar --apks unsigned_patched.apk -o signed_output
```

### Step 5: Install onto Connected Phone
```bash
adb install -r signed_output/unsigned_patched-aligned-debugSigned.apk
```

---

## 9. Summary of Key Files and References

| Component | Path / Location | Primary Role |
| :--- | :--- | :--- |
| **HealthConnectModel** | `smali_classes5/com/yc/pedometer/health/HealthConnectModel.smali` | Deduplication generator (`createMetadata`) |
| **HR Upload Hook** | `smali_classes5/com/yc/pedometer/health/HealthConnectModel$uploadHeartRateRecord$1.smali` | Deterministic ID assignment for Heart Rate |
| **SpO2 Upload Hook** | `smali_classes5/com/yc/pedometer/health/HealthConnectModel$uploadOxygenSaturationRecord$1.smali` | Deterministic ID assignment for Blood Oxygen |
| **Sleep Upload Hook** | `smali_classes5/com/yc/pedometer/health/HealthConnectModel$uploadSleepSessionRecord$1.smali` | Deterministic ID assignment for Sleep stages |
| **DataProcessing** | `smali_classes7/com/yc/pedometer/utils/DataProcessing.smali` | Real-time BLE packet parsing & SQLite writing |
| **Home Fragment** | `smali_classes2/com/yc/cbsmartfit/home/FragmentHomePage.smali` | Pull-to-refresh forced sync & OLED black spinner |
| **Strava Helper** | `patches/smali/StravaMapHelper.smali` | Map crash prevention and lifecycle handler |
| **GPX Telemetry** | `patches/smali/GpsToGpxUtils.smali` | GPX 1.1 builder with cadence & HR TrackPoint extensions |
| **Strava Listener** | `patches/smali/StravaEndWorkoutListener.smali` | Multipart HTTP POST upload to Strava API |
| **Public Showcase** | [cbsmartfit-strava-sync](https://github.com/mpluto-o/cbsmartfit-strava-sync) | Documentation, architecture, patches, scripts |
| **Private Backup** | [cbsmartfit-private-backup](https://github.com/mpluto-o/cbsmartfit-private-backup) | Full disassembled source code backup |
