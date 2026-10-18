.class public Lcom/yc/pedometer/sports/util/StravaMapHelper;
.super Ljava/lang/Object;


# static fields
.field private static sSportsTabWebView:Landroid/webkit/WebView;

.field private static sWorkoutWebView:Landroid/webkit/WebView;

.field public static sUploadToStravaOnFinish:Z

.field private static sAutoPaused:Z

.field private static sLastMovingTime:J

.field private static sLowSpeedSeconds:I

.field private static sLastGpsUtcMillis:J

.field private static sLastStepCount:I

.field private static sLastStepTime:J

.field private static sCurrentCadence:I

.field private static sWorkoutStartStep:I

.field private static sWorkoutStartTime:J


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/4 v0, 0x1

    sput-boolean v0, Lcom/yc/pedometer/sports/util/StravaMapHelper;->sUploadToStravaOnFinish:Z

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static configureWebView(Landroid/webkit/WebView;)V
    .locals 3

    if-nez p0, :cond_0

    return-void

    :cond_0
    invoke-virtual {p0}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/webkit/WebSettings;->setJavaScriptEnabled(Z)V

    invoke-virtual {v0, v1}, Landroid/webkit/WebSettings;->setDomStorageEnabled(Z)V

    invoke-virtual {v0, v1}, Landroid/webkit/WebSettings;->setAllowFileAccess(Z)V

    invoke-virtual {v0, v1}, Landroid/webkit/WebSettings;->setAllowFileAccessFromFileURLs(Z)V

    invoke-virtual {v0, v1}, Landroid/webkit/WebSettings;->setAllowUniversalAccessFromFileURLs(Z)V

    const v1, -0xededec

    invoke-virtual {p0, v1}, Landroid/webkit/WebView;->setBackgroundColor(I)V

    new-instance v1, Landroid/webkit/WebViewClient;

    invoke-direct {v1}, Landroid/webkit/WebViewClient;-><init>()V

    invoke-virtual {p0, v1}, Landroid/webkit/WebView;->setWebViewClient(Landroid/webkit/WebViewClient;)V

    return-void
.end method

.method private static getLastLocation(Landroid/content/Context;)Landroid/location/Location;
    .locals 3

    const/4 v0, 0x0

    if-nez p0, :cond_0

    return-object v0

    :cond_0
    :try_start_0
    const-string v1, "location"

    invoke-virtual {p0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/location/LocationManager;

    if-nez v1, :cond_1

    return-object v0

    :cond_1
    const-string v2, "gps"

    invoke-virtual {v1, v2}, Landroid/location/LocationManager;->getLastKnownLocation(Ljava/lang/String;)Landroid/location/Location;

    move-result-object v2

    if-eqz v2, :cond_2

    return-object v2

    :cond_2
    const-string v2, "network"

    invoke-virtual {v1, v2}, Landroid/location/LocationManager;->getLastKnownLocation(Ljava/lang/String;)Landroid/location/Location;

    move-result-object v2

    if-eqz v2, :cond_3

    return-object v2

    :cond_3
    const-string v2, "fused"

    invoke-virtual {v1, v2}, Landroid/location/LocationManager;->getLastKnownLocation(Ljava/lang/String;)Landroid/location/Location;

    move-result-object v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-object v1

    :catchall_0
    return-object v0
.end method

.method public static initSportsTabMap(Landroid/view/View;Landroid/content/Context;)V
    .locals 6

    if-eqz p0, :cond_0

    if-nez p1, :cond_1

    :cond_0
    return-void

    :cond_1
    :try_start_0
    const v0, 0x7f090fba

    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/webkit/WebView;

    if-nez v0, :cond_2

    return-void

    :cond_2
    sput-object v0, Lcom/yc/pedometer/sports/util/StravaMapHelper;->sSportsTabWebView:Landroid/webkit/WebView;

    invoke-static {v0}, Lcom/yc/pedometer/sports/util/StravaMapHelper;->configureWebView(Landroid/webkit/WebView;)V

    invoke-static {p1}, Lcom/yc/pedometer/sports/util/StravaMapHelper;->getLastLocation(Landroid/content/Context;)Landroid/location/Location;

    move-result-object v1

    if-eqz v1, :cond_3

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "file:///android_asset/sport_tab_map.html?lat="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Landroid/location/Location;->getLatitude()D

    move-result-wide v3

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    const-string v3, "&lng="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Landroid/location/Location;->getLongitude()D

    move-result-wide v3

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    goto :goto_0

    :cond_3
    const-string v1, "file:///android_asset/sport_tab_map.html?lat=28.6211&lng=77.1403"

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :catchall_0
    :goto_0
    return-void
.end method

.method public static initWorkoutMap(Landroid/app/Activity;)V
    .locals 6

    if-nez p0, :cond_0

    return-void

    :cond_0
    :try_start_0
    const v0, 0x7f090fba

    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/webkit/WebView;

    if-nez v0, :cond_1

    return-void

    :cond_1
    sput-object v0, Lcom/yc/pedometer/sports/util/StravaMapHelper;->sWorkoutWebView:Landroid/webkit/WebView;

    invoke-static {v0}, Lcom/yc/pedometer/sports/util/StravaMapHelper;->configureWebView(Landroid/webkit/WebView;)V

    invoke-static {p0}, Lcom/yc/pedometer/sports/util/StravaMapHelper;->getLastLocation(Landroid/content/Context;)Landroid/location/Location;

    move-result-object v1

    if-eqz v1, :cond_2

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "file:///android_asset/sport_map.html?lat="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Landroid/location/Location;->getLatitude()D

    move-result-wide v3

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    const-string v3, "&lng="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Landroid/location/Location;->getLongitude()D

    move-result-wide v3

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    goto :goto_0

    :cond_2
    const-string v1, "file:///android_asset/sport_map.html?lat=28.6211&lng=77.1403"

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :catchall_0
    :goto_0
    return-void
.end method

.method public static onLocationChanged(Landroid/location/Location;)V
    .locals 5

    sget-object v0, Lcom/yc/pedometer/sports/util/StravaMapHelper;->sWorkoutWebView:Landroid/webkit/WebView;

    if-eqz v0, :cond_0

    if-nez p0, :cond_1

    :cond_0
    return-void

    :cond_1
    :try_start_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "javascript:updateLocation("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Landroid/location/Location;->getLatitude()D

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    const-string v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Landroid/location/Location;->getLongitude()D

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    const-string v2, ");"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :catchall_0
    return-void
.end method

.method public static recenter()V
    .locals 2

    sget-object v0, Lcom/yc/pedometer/sports/util/StravaMapHelper;->sWorkoutWebView:Landroid/webkit/WebView;

    if-eqz v0, :cond_0

    :try_start_0
    const-string v1, "javascript:recenter();"

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :catchall_0
    :cond_0
    return-void
.end method

.method public static showWorkoutEndDialog(Landroid/app/Activity;)V
    .locals 4

    if-nez p0, :cond_check_finishing

    return-void

    :cond_check_finishing
    invoke-virtual {p0}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-eqz v0, :cond_show

    return-void

    :cond_show
    new-instance v0, Landroid/app/AlertDialog$Builder;

    const/4 v1, 0x4

    invoke-direct {v0, p0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;I)V

    const-string v1, "Finish Workout"

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/CharSequence;

    const/4 v2, 0x0

    const-string v3, "\ud83d\ude80  Upload to Strava"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "\ud83d\udcbe  Save Locally Only"

    aput-object v3, v1, v2

    const/4 v2, 0x2

    const-string v3, "\ud83d\uddd1\ufe0f  Dump Workout"

    aput-object v3, v1, v2

    new-instance v2, Lcom/yc/pedometer/sports/util/StravaEndWorkoutListener;

    const/4 v3, 0x0

    invoke-direct {v2, p0, v3}, Lcom/yc/pedometer/sports/util/StravaEndWorkoutListener;-><init>(Landroid/app/Activity;I)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setItems([Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    const-string v1, "Cancel"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    return-void
.end method

.method public static showDumpConfirmDialog(Landroid/app/Activity;)V
    .locals 4

    if-nez p0, :cond_check_finishing

    return-void

    :cond_check_finishing
    invoke-virtual {p0}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-eqz v0, :cond_show

    return-void

    :cond_show
    new-instance v0, Landroid/app/AlertDialog$Builder;

    const/4 v1, 0x4

    invoke-direct {v0, p0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;I)V

    const-string v1, "Dump Workout?"

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    const-string v1, "Are you sure? This workout will be permanently discarded and won\'t be saved or uploaded to Strava."

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    const-string v1, "Dump"

    new-instance v2, Lcom/yc/pedometer/sports/util/StravaEndWorkoutListener;

    const/4 v3, 0x1

    invoke-direct {v2, p0, v3}, Lcom/yc/pedometer/sports/util/StravaEndWorkoutListener;-><init>(Landroid/app/Activity;I)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    const-string v1, "Keep Workout"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    return-void
.end method

.method public static resetAutoPause()V
    .locals 0

    invoke-static {}, Lcom/yc/pedometer/sports/util/StravaMapHelper;->resetWorkoutTelemetry()V

    return-void
.end method

.method public static resetWorkoutTelemetry()V
    .locals 3

    const-wide/16 v0, 0x0

    sput-wide v0, Lcom/yc/pedometer/sports/util/StravaMapHelper;->sWorkoutStartTime:J

    sput-wide v0, Lcom/yc/pedometer/sports/util/StravaMapHelper;->sLastStepTime:J

    const/4 v2, 0x0

    sput v2, Lcom/yc/pedometer/sports/util/StravaMapHelper;->sWorkoutStartStep:I

    sput v2, Lcom/yc/pedometer/sports/util/StravaMapHelper;->sLastStepCount:I

    sput v2, Lcom/yc/pedometer/sports/util/StravaMapHelper;->sCurrentCadence:I

    sput-wide v0, Lcom/yc/pedometer/sports/util/StravaMapHelper;->sLastGpsUtcMillis:J

    sput v2, Lcom/yc/pedometer/column/GlobalVariable;->multipleSportSwitchStatus:I

    return-void
.end method

.method public static recordGpsTelemetry(Lcom/yc/pedometer/sports/entity/GPSData;)V
    .locals 9

    if-nez p0, :cond_start

    return-void

    :cond_start
    :try_start_0
    invoke-static {}, Lcom/yc/pedometer/sports/db/DataRepo;->getInstance()Lcom/yc/pedometer/sports/db/DataRepo;

    move-result-object v0

    invoke-virtual {v0}, Lcom/yc/pedometer/sports/db/DataRepo;->getCurrentStep()I

    move-result v0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    sget-wide v3, Lcom/yc/pedometer/sports/util/StravaMapHelper;->sWorkoutStartTime:J

    const-wide/16 v5, 0x0

    cmp-long v3, v3, v5

    if-nez v3, :cond_init_done

    sput-wide v1, Lcom/yc/pedometer/sports/util/StravaMapHelper;->sWorkoutStartTime:J

    sput v0, Lcom/yc/pedometer/sports/util/StravaMapHelper;->sWorkoutStartStep:I

    sput v0, Lcom/yc/pedometer/sports/util/StravaMapHelper;->sLastStepCount:I

    sput-wide v1, Lcom/yc/pedometer/sports/util/StravaMapHelper;->sLastStepTime:J

    const/4 v3, 0x0

    sput v3, Lcom/yc/pedometer/sports/util/StravaMapHelper;->sCurrentCadence:I

    :cond_init_done
    sget-wide v3, Lcom/yc/pedometer/sports/util/StravaMapHelper;->sLastStepTime:J

    sub-long v3, v1, v3

    sget v5, Lcom/yc/pedometer/sports/util/StravaMapHelper;->sLastStepCount:I

    sub-int v5, v0, v5

    const-wide/16 v6, 0x5dc

    cmp-long v6, v3, v6

    if-ltz v6, :cond_calc_done

    if-ltz v5, :cond_calc_done

    int-to-long v5, v5

    const-wide/32 v7, 0xea60

    mul-long/2addr v5, v7

    div-long/2addr v5, v3

    long-to-int v3, v5

    sput-wide v1, Lcom/yc/pedometer/sports/util/StravaMapHelper;->sLastStepTime:J

    sput v0, Lcom/yc/pedometer/sports/util/StravaMapHelper;->sLastStepCount:I

    const/16 v4, 0x50

    if-lt v3, v4, :cond_calc_done

    const/16 v4, 0xe6

    if-gt v3, v4, :cond_calc_done

    sget v4, Lcom/yc/pedometer/sports/util/StravaMapHelper;->sCurrentCadence:I

    if-nez v4, :cond_ema

    sput v3, Lcom/yc/pedometer/sports/util/StravaMapHelper;->sCurrentCadence:I

    goto :cond_calc_done

    :cond_ema
    mul-int/lit8 v4, v4, 0x7

    mul-int/lit8 v3, v3, 0x3

    add-int/2addr v4, v3

    div-int/lit8 v4, v4, 0xa

    sput v4, Lcom/yc/pedometer/sports/util/StravaMapHelper;->sCurrentCadence:I

    :cond_calc_done
    iget v1, p0, Lcom/yc/pedometer/sports/entity/GPSData;->speed:F

    const/high16 v2, 0x3fc00000    # 1.5f

    cmpg-float v2, v1, v2

    if-gez v2, :cond_moving

    const/4 v1, 0x0

    iput v1, p0, Lcom/yc/pedometer/sports/entity/GPSData;->frequency:I

    return-void

    :cond_moving
    sget v2, Lcom/yc/pedometer/sports/util/StravaMapHelper;->sCurrentCadence:I

    if-lez v2, :cond_est_speed

    iput v2, p0, Lcom/yc/pedometer/sports/entity/GPSData;->frequency:I

    return-void

    :cond_est_speed
    const/high16 v2, 0x40200000    # 2.5f

    mul-float/2addr v1, v2

    float-to-int v1, v1

    add-int/lit16 v1, v1, 0x9b    # 155

    const/16 v2, 0xc3    # 195

    if-le v1, v2, :cond_save_est

    const/16 v1, 0xc3

    :cond_save_est
    iput v1, p0, Lcom/yc/pedometer/sports/entity/GPSData;->frequency:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-void

    :catchall_0
    move-exception v0

    return-void
.end method

.method public static formatPointCadence(Lcom/yc/pedometer/sports/entity/GPSData;Lcom/yc/pedometer/sports/entity/ExerciseData;I)I
    .locals 2

    if-lez p2, :cond_check_gps

    return p2

    :cond_check_gps
    if-eqz p0, :cond_check_exercise

    iget v0, p0, Lcom/yc/pedometer/sports/entity/GPSData;->frequency:I

    if-lez v0, :cond_check_speed

    return v0

    :cond_check_speed
    iget v0, p0, Lcom/yc/pedometer/sports/entity/GPSData;->speed:F

    const/high16 v1, 0x3fc00000    # 1.5f

    cmpg-float v0, v0, v1

    if-gez v0, :cond_check_exercise

    const/4 p0, 0x0

    return p0

    :cond_check_exercise
    if-eqz p1, :cond_fallback_speed

    invoke-virtual {p1}, Lcom/yc/pedometer/sports/entity/ExerciseData;->getStep()I

    move-result p2

    invoke-virtual {p1}, Lcom/yc/pedometer/sports/entity/ExerciseData;->getDuration()I

    move-result p1

    const/4 v0, 0x5

    if-le p1, v0, :cond_fallback_speed

    if-lez p2, :cond_fallback_speed

    mul-int/lit8 p2, p2, 0x3c

    div-int/2addr p2, p1

    const/16 p1, 0x5a

    if-lt p2, p1, :cond_fallback_speed

    const/16 p1, 0xe1

    if-gt p2, p1, :cond_fallback_speed

    return p2

    :cond_fallback_speed
    if-eqz p0, :cond_zero

    iget p1, p0, Lcom/yc/pedometer/sports/entity/GPSData;->speed:F

    const/high16 p2, 0x40400000    # 3.0f

    cmpl-float p1, p1, p2

    if-ltz p1, :cond_zero

    iget p0, p0, Lcom/yc/pedometer/sports/entity/GPSData;->speed:F

    const/high16 p1, 0x40200000    # 2.5f

    mul-float/2addr p0, p1

    float-to-int p0, p0

    add-int/lit16 p0, p0, 0x9b

    const/16 p1, 0xc3

    if-le p0, p1, :cond_ret_p0

    const/16 p0, 0xc3

    :cond_ret_p0
    return p0

    :cond_zero
    const/4 p0, 0x0

    return p0
.end method

.method public static calculatePointPower(Lcom/yc/pedometer/sports/entity/GPSData;)I
    .locals 2

    if-nez p0, :cond_check_speed

    const/4 p0, 0x0

    return p0

    :cond_check_speed
    iget p0, p0, Lcom/yc/pedometer/sports/entity/GPSData;->speed:F

    const/high16 v0, 0x3fc00000    # 1.5f

    cmpg-float v0, p0, v0

    if-gez v0, :cond_calc

    const/4 p0, 0x0

    return p0

    :cond_calc
    const/high16 v0, 0x41a00000    # 20.0f

    mul-float/2addr p0, v0

    float-to-int p0, p0

    return p0
.end method

.method public static onGpsSpeed(F)V
    .locals 0

    return-void
.end method

.method public static isAutoPaused()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public static formatGpsPointTime(Lcom/yc/pedometer/sports/entity/GPSData;Ljava/lang/String;III)Ljava/lang/String;
    .locals 5

    if-nez p4, :cond_check_gps

    const-wide/16 v0, 0x0

    sput-wide v0, Lcom/yc/pedometer/sports/util/StravaMapHelper;->sLastGpsUtcMillis:J

    :cond_check_gps
    if-eqz p0, :cond_fallback

    iget-object v0, p0, Lcom/yc/pedometer/sports/entity/GPSData;->time:Ljava/lang/String;

    if-eqz v0, :cond_fallback

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    const/16 v2, 0xe

    if-lt v1, v2, :cond_fallback

    invoke-static {v0}, Lcom/yc/pedometer/utils/CalendarUtil;->dateToStamp(Ljava/lang/String;)J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    if-lez v2, :cond_fallback

    invoke-static {}, Lcom/yc/pedometer/utils/strava/gpxlib/TimeFormatUtils;->getTimeZone()F

    move-result v2

    const/high16 v3, 0x42700000    # 60.0f

    mul-float/2addr v2, v3

    mul-float/2addr v2, v3

    const/high16 v3, 0x447a0000    # 1000.0f

    mul-float/2addr v2, v3

    float-to-long v2, v2

    sub-long/2addr v0, v2

    if-lez p4, :cond_store_and_format

    sget-wide v2, Lcom/yc/pedometer/sports/util/StravaMapHelper;->sLastGpsUtcMillis:J

    cmp-long v4, v0, v2

    if-gtz v4, :cond_store_and_format

    const-wide/16 v0, 0x3e8

    add-long/2addr v0, v2

    :cond_store_and_format
    sput-wide v0, Lcom/yc/pedometer/sports/util/StravaMapHelper;->sLastGpsUtcMillis:J

    new-instance p0, Ljava/text/SimpleDateFormat;

    const-string p1, "yyyy-MM-dd HH:mm:ss"

    invoke-direct {p0, p1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    new-instance p1, Ljava/util/Date;

    invoke-direct {p1, v0, v1}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {p0, p1}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object p0

    const-string p1, " "

    const-string p2, "T"

    invoke-virtual {p0, p1, p2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, ".00Z"

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_fallback
    invoke-static {p1, p2, p3, p4}, Lcom/yc/pedometer/utils/strava/gpxlib/GpsToGpxUtils;->getGpsPointTime(Ljava/lang/String;III)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method


