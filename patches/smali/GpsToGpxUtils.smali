.class public Lcom/yc/pedometer/utils/strava/gpxlib/GpsToGpxUtils;
.super Ljava/lang/Object;
.source "GpsToGpxUtils.java"


# static fields
.field private static final path:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 34
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lcom/yc/pedometer/MyApplication;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getExternalCacheDir()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/gpx/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/yc/pedometer/utils/strava/gpxlib/GpsToGpxUtils;->path:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static createPoint(Lorg/w3c/dom/Document;Lorg/w3c/dom/Element;Lcom/yc/pedometer/sports/entity/GPSData;Ljava/lang/String;)V
    .locals 3

    .line 154
    const-string v0, "trkpt"

    invoke-interface {p0, v0}, Lorg/w3c/dom/Document;->createElement(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v0

    .line 155
    invoke-virtual {p2}, Lcom/yc/pedometer/sports/entity/GPSData;->getLatitude()D

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/String;->valueOf(D)Ljava/lang/String;

    move-result-object v1

    const-string v2, "lat"

    invoke-interface {v0, v2, v1}, Lorg/w3c/dom/Element;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V

    .line 156
    invoke-virtual {p2}, Lcom/yc/pedometer/sports/entity/GPSData;->getLongitude()D

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/String;->valueOf(D)Ljava/lang/String;

    move-result-object v1

    const-string v2, "lon"

    invoke-interface {v0, v2, v1}, Lorg/w3c/dom/Element;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V

    .line 157
    invoke-interface {p1, v0}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 159
    const-string p1, "ele"

    invoke-interface {p0, p1}, Lorg/w3c/dom/Document;->createElement(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object p1

    .line 160
    invoke-virtual {p2}, Lcom/yc/pedometer/sports/entity/GPSData;->getAltitude()I

    move-result p2

    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p2

    invoke-interface {p1, p2}, Lorg/w3c/dom/Element;->setTextContent(Ljava/lang/String;)V

    .line 161
    invoke-interface {v0, p1}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 164
    const-string p1, "time"

    invoke-interface {p0, p1}, Lorg/w3c/dom/Document;->createElement(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object p0

    .line 165
    invoke-interface {p0, p3}, Lorg/w3c/dom/Element;->setTextContent(Ljava/lang/String;)V

    .line 166
    invoke-interface {v0, p0}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    return-void
.end method

.method private static createPoint(Lorg/w3c/dom/Document;Lorg/w3c/dom/Element;Lcom/yc/pedometer/sports/entity/GPSData;Ljava/lang/String;II)V
    .locals 5

    .line 170
    const-string v3, "trkpt"

    invoke-interface {p0, v3}, Lorg/w3c/dom/Document;->createElement(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v0

    .line 171
    invoke-virtual {p2}, Lcom/yc/pedometer/sports/entity/GPSData;->getLatitude()D

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/String;->valueOf(D)Ljava/lang/String;

    move-result-object v3

    const-string v4, "lat"

    invoke-interface {v0, v4, v3}, Lorg/w3c/dom/Element;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V

    .line 172
    invoke-virtual {p2}, Lcom/yc/pedometer/sports/entity/GPSData;->getLongitude()D

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/String;->valueOf(D)Ljava/lang/String;

    move-result-object v3

    const-string v4, "lon"

    invoke-interface {v0, v4, v3}, Lorg/w3c/dom/Element;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V

    .line 173
    invoke-interface {p1, v0}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 175
    const-string v3, "ele"

    invoke-interface {p0, v3}, Lorg/w3c/dom/Document;->createElement(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v3

    .line 176
    invoke-virtual {p2}, Lcom/yc/pedometer/sports/entity/GPSData;->getAltitude()I

    move-result v4

    invoke-static {v4}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Lorg/w3c/dom/Element;->setTextContent(Ljava/lang/String;)V

    .line 177
    invoke-interface {v0, v3}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 180
    const-string v3, "time"

    invoke-interface {p0, v3}, Lorg/w3c/dom/Document;->createElement(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v3

    .line 181
    invoke-interface {v3, p3}, Lorg/w3c/dom/Element;->setTextContent(Ljava/lang/String;)V

    .line 182
    invoke-interface {v0, v3}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 185
    const-string v3, "extensions"

    invoke-interface {p0, v3}, Lorg/w3c/dom/Document;->createElement(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v1

    .line 186
    invoke-interface {v0, v1}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 187
    invoke-static {p2}, Lcom/yc/pedometer/sports/util/StravaMapHelper;->calculatePointPower(Lcom/yc/pedometer/sports/entity/GPSData;)I

    move-result v4

    if-lez v4, :cond_power_done

    const-string v3, "power"

    invoke-interface {p0, v3}, Lorg/w3c/dom/Document;->createElement(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v3

    invoke-static {v4}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Lorg/w3c/dom/Element;->setTextContent(Ljava/lang/String;)V

    invoke-interface {v1, v3}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    :cond_power_done
    .line 188
    const-string v3, "gpxtpx:TrackPointExtension"

    invoke-interface {p0, v3}, Lorg/w3c/dom/Document;->createElement(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v2

    .line 189
    invoke-interface {v1, v2}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 191
    const-string v3, "gpxtpx:hr"

    invoke-interface {p0, v3}, Lorg/w3c/dom/Document;->createElement(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v3

    .line 192
    invoke-static {p4}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Lorg/w3c/dom/Element;->setTextContent(Ljava/lang/String;)V

    .line 193
    invoke-interface {v2, v3}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 194
    const-string v3, "gpxtpx:cad"

    invoke-interface {p0, v3}, Lorg/w3c/dom/Document;->createElement(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v3

    .line 195
    if-lez p5, :cond_cad_zero

    div-int/lit8 p5, p5, 0x2

    goto :cond_cad_done

    :cond_cad_zero
    const/4 p5, 0x0

    :cond_cad_done
    invoke-static {p5}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Lorg/w3c/dom/Element;->setTextContent(Ljava/lang/String;)V

    .line 196
    invoke-interface {v2, v3}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    return-void
.end method

.method public static exportGpsToGpx(Lcom/yc/pedometer/sports/entity/ExerciseData;Ljava/util/List;)Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/yc/pedometer/sports/entity/ExerciseData;",
            "Ljava/util/List<",
            "Lcom/yc/pedometer/sports/entity/GPSData;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    if-eqz p0, :cond_1

    if-eqz p1, :cond_1

    .line 52
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 55
    :cond_0
    new-instance v0, Lcom/yc/pedometer/utils/strava/gpxlib/GpsValueBean;

    invoke-direct {v0}, Lcom/yc/pedometer/utils/strava/gpxlib/GpsValueBean;-><init>()V

    .line 56
    invoke-static {v0, p0}, Lcom/yc/pedometer/utils/strava/gpxlib/GpsToGpxUtils;->switchSportBase(Lcom/yc/pedometer/utils/strava/gpxlib/GpsValueBean;Lcom/yc/pedometer/sports/entity/ExerciseData;)V

    .line 57
    invoke-virtual {v0, p1}, Lcom/yc/pedometer/utils/strava/gpxlib/GpsValueBean;->setGpsList(Ljava/util/List;)V

    .line 58
    invoke-static {p0, v0}, Lcom/yc/pedometer/utils/strava/gpxlib/GpsToGpxUtils;->exportGpx(Lcom/yc/pedometer/sports/entity/ExerciseData;Lcom/yc/pedometer/utils/strava/gpxlib/GpsValueBean;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_1
    :goto_0
    const/4 p0, 0x0

    return-object p0
.end method

.method private static exportGpx(Lcom/yc/pedometer/sports/entity/ExerciseData;Lcom/yc/pedometer/utils/strava/gpxlib/GpsValueBean;)Ljava/lang/String;
    .locals 12

    .line 62
    const-string v0, "StravaUploadUtils"

    const/4 v1, 0x0

    if-nez p1, :cond_0

    return-object v1

    .line 67
    :cond_0
    invoke-static {}, Ljavax/xml/parsers/DocumentBuilderFactory;->newInstance()Ljavax/xml/parsers/DocumentBuilderFactory;

    move-result-object v2

    .line 70
    :try_start_0
    invoke-virtual {v2}, Ljavax/xml/parsers/DocumentBuilderFactory;->newDocumentBuilder()Ljavax/xml/parsers/DocumentBuilder;

    move-result-object v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-object v2, v1

    :goto_0
    if-nez v2, :cond_1

    return-object v1

    .line 78
    :cond_1
    invoke-virtual {v2}, Ljavax/xml/parsers/DocumentBuilder;->newDocument()Lorg/w3c/dom/Document;

    move-result-object v2

    .line 81
    const-string v3, "gpx"

    invoke-interface {v2, v3}, Lorg/w3c/dom/Document;->createElement(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v3

    .line 82
    const-string v4, "version"

    const-string v5, "1.0"

    invoke-interface {v3, v4, v5}, Lorg/w3c/dom/Element;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V

    .line 83
    const-string v4, "creator"

    invoke-virtual {p1}, Lcom/yc/pedometer/utils/strava/gpxlib/GpsValueBean;->getCreator()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v3, v4, v5}, Lorg/w3c/dom/Element;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V

    .line 84
    const-string v4, "xmlns"

    const-string v5, "http://www.topografix.com/GPX/1/0"

    invoke-interface {v3, v4, v5}, Lorg/w3c/dom/Element;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V

    .line 85
    invoke-interface {v2, v3}, Lorg/w3c/dom/Document;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 88
    const-string v4, "metadata"

    invoke-interface {v2, v4}, Lorg/w3c/dom/Document;->createElement(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v4

    .line 89
    invoke-interface {v3, v4}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 91
    const-string v5, "time"

    invoke-interface {v2, v5}, Lorg/w3c/dom/Document;->createElement(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v5

    .line 92
    invoke-virtual {p1}, Lcom/yc/pedometer/utils/strava/gpxlib/GpsValueBean;->getMetaTime()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v5, v6}, Lorg/w3c/dom/Element;->setTextContent(Ljava/lang/String;)V

    .line 93
    invoke-interface {v4, v5}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 96
    const-string v4, "trk"

    invoke-interface {v2, v4}, Lorg/w3c/dom/Document;->createElement(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v4

    .line 97
    invoke-interface {v3, v4}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 100
    const-string v3, "type"

    invoke-interface {v2, v3}, Lorg/w3c/dom/Document;->createElement(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v3

    .line 101
    invoke-virtual {p1}, Lcom/yc/pedometer/utils/strava/gpxlib/GpsValueBean;->getType()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v3, v5}, Lorg/w3c/dom/Element;->setTextContent(Ljava/lang/String;)V

    .line 102
    invoke-interface {v4, v3}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 105
    const-string v3, "extensions"

    invoke-interface {v2, v3}, Lorg/w3c/dom/Document;->createElement(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v3

    .line 106
    invoke-interface {v4, v3}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 107
    const-string v5, "totalTime"

    invoke-interface {v2, v5}, Lorg/w3c/dom/Document;->createElement(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v5

    .line 108
    invoke-virtual {p1}, Lcom/yc/pedometer/utils/strava/gpxlib/GpsValueBean;->getTotalTime()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v5, v6}, Lorg/w3c/dom/Element;->setTextContent(Ljava/lang/String;)V

    .line 109
    invoke-interface {v3, v5}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 110
    const-string v5, "totalDistance"

    invoke-interface {v2, v5}, Lorg/w3c/dom/Document;->createElement(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v5

    .line 111
    invoke-virtual {p1}, Lcom/yc/pedometer/utils/strava/gpxlib/GpsValueBean;->getTotalDistance()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v5, v6}, Lorg/w3c/dom/Element;->setTextContent(Ljava/lang/String;)V

    .line 112
    invoke-interface {v3, v5}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 113
    const-string v5, "routeType"

    invoke-interface {v2, v5}, Lorg/w3c/dom/Document;->createElement(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v5

    .line 114
    invoke-virtual {p1}, Lcom/yc/pedometer/utils/strava/gpxlib/GpsValueBean;->getRouteType()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v5, v6}, Lorg/w3c/dom/Element;->setTextContent(Ljava/lang/String;)V

    .line 115
    invoke-interface {v3, v5}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 118
    const-string v3, "trkseg"

    invoke-interface {v2, v3}, Lorg/w3c/dom/Document;->createElement(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v9

    .line 119
    invoke-interface {v4, v9}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 122
    invoke-virtual {p1}, Lcom/yc/pedometer/utils/strava/gpxlib/GpsValueBean;->getGpsList()Ljava/util/List;

    move-result-object v10

    if-eqz v10, :cond_2

    const/4 v3, 0x0

    move v11, v3

    .line 124
    :goto_1
    invoke-interface {v10}, Ljava/util/List;->size()I

    move-result v3

    if-ge v11, v3, :cond_2

    .line 125
    invoke-interface {v10, v11}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    move-object v5, v3

    check-cast v5, Lcom/yc/pedometer/sports/entity/GPSData;

    .line 126
    invoke-virtual {p0}, Lcom/yc/pedometer/sports/entity/ExerciseData;->getStartDate()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0}, Lcom/yc/pedometer/sports/entity/ExerciseData;->getDuration()I

    move-result v4

    invoke-interface {v10}, Ljava/util/List;->size()I

    move-result v6

    invoke-static {v5, v3, v4, v6, v11}, Lcom/yc/pedometer/sports/util/StravaMapHelper;->formatGpsPointTime(Lcom/yc/pedometer/sports/entity/GPSData;Ljava/lang/String;III)Ljava/lang/String;

    move-result-object v6

    .line 127
    invoke-virtual {v5}, Lcom/yc/pedometer/sports/entity/GPSData;->getHeart()I

    move-result v7

    invoke-virtual {v5}, Lcom/yc/pedometer/sports/entity/GPSData;->getFrequency()I

    move-result v8

    invoke-static {v5, p0, v8}, Lcom/yc/pedometer/sports/util/StravaMapHelper;->formatPointCadence(Lcom/yc/pedometer/sports/entity/GPSData;Lcom/yc/pedometer/sports/entity/ExerciseData;I)I

    move-result v8

    move-object v3, v2

    move-object v4, v9

    invoke-static/range {v3 .. v8}, Lcom/yc/pedometer/utils/strava/gpxlib/GpsToGpxUtils;->createPoint(Lorg/w3c/dom/Document;Lorg/w3c/dom/Element;Lcom/yc/pedometer/sports/entity/GPSData;Ljava/lang/String;II)V

    add-int/lit8 v11, v11, 0x1

    goto :goto_1

    .line 132
    :cond_2
    :try_start_1
    invoke-static {}, Ljavax/xml/transform/TransformerFactory;->newInstance()Ljavax/xml/transform/TransformerFactory;

    move-result-object p0

    .line 133
    invoke-virtual {p0}, Ljavax/xml/transform/TransformerFactory;->newTransformer()Ljavax/xml/transform/Transformer;

    move-result-object p0

    .line 134
    const-string v3, "indent"

    const-string v4, "yes"

    invoke-virtual {p0, v3, v4}, Ljavax/xml/transform/Transformer;->setOutputProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 135
    new-instance v3, Ljavax/xml/transform/dom/DOMSource;

    invoke-direct {v3, v2}, Ljavax/xml/transform/dom/DOMSource;-><init>(Lorg/w3c/dom/Node;)V

    .line 136
    new-instance v2, Ljava/io/File;

    invoke-virtual {p1}, Lcom/yc/pedometer/utils/strava/gpxlib/GpsValueBean;->getFilePath()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 137
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v4

    if-eqz v4, :cond_3

    .line 138
    invoke-virtual {v2}, Ljava/io/File;->delete()Z

    .line 140
    :cond_3
    invoke-virtual {v2}, Ljava/io/File;->createNewFile()Z

    .line 141
    new-instance v4, Ljavax/xml/transform/stream/StreamResult;

    invoke-direct {v4, v2}, Ljavax/xml/transform/stream/StreamResult;-><init>(Ljava/io/File;)V

    .line 143
    invoke-virtual {p0, v3, v4}, Ljavax/xml/transform/Transformer;->transform(Ljavax/xml/transform/Source;Ljavax/xml/transform/Result;)V

    .line 144
    const-string p0, "Gps\u8f6cGpx \u6210\u529f "

    invoke-static {v0, p0}, Lcom/yc/pedometer/log/UteLog;->d(Ljava/lang/String;Ljava/lang/Object;)V

    .line 145
    invoke-virtual {p1}, Lcom/yc/pedometer/utils/strava/gpxlib/GpsValueBean;->getFilePath()Ljava/lang/String;

    move-result-object p0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    return-object p0

    :catch_1
    move-exception p0

    .line 148
    new-instance p1, Ljava/lang/StringBuilder;

    const-string v2, "Gps\u8f6cGpx \u5931\u8d25 "

    invoke-direct {p1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Lcom/yc/pedometer/log/UteLog;->e(Ljava/lang/String;Ljava/lang/Object;)V

    return-object v1
.end method

.method public static getFilePath(Lcom/yc/pedometer/sports/entity/ExerciseData;)Ljava/lang/String;
    .locals 2

    if-nez p0, :cond_0

    .line 38
    sget-object p0, Lcom/yc/pedometer/utils/strava/gpxlib/GpsToGpxUtils;->path:Ljava/lang/String;

    return-object p0

    .line 40
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/yc/pedometer/utils/strava/gpxlib/GpsToGpxUtils;->path:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/yc/pedometer/sports/entity/ExerciseData;->getStartDate()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v0, ".gpx"

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static getFormattedTime(Ljava/lang/String;)Ljava/lang/String;
    .locals 4

    .line 233
    invoke-static {p0}, Lcom/yc/pedometer/utils/strava/gpxlib/GpsToGpxUtils;->getTimeMillis(Ljava/lang/String;)J

    move-result-wide v0

    .line 234
    invoke-static {}, Lcom/yc/pedometer/utils/strava/gpxlib/TimeFormatUtils;->getTimeZone()F

    move-result p0

    const/high16 v2, 0x42700000    # 60.0f

    mul-float/2addr p0, v2

    mul-float/2addr p0, v2

    const/high16 v2, 0x447a0000    # 1000.0f

    mul-float/2addr p0, v2

    float-to-long v2, p0

    sub-long/2addr v0, v2

    .line 236
    new-instance p0, Ljava/text/SimpleDateFormat;

    const-string v2, "yyyy-MM-dd HH:mm:ss"

    invoke-direct {p0, v2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 237
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    new-instance v3, Ljava/util/Date;

    invoke-direct {v3, v0, v1}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {p0, v3}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object p0

    const-string v0, " "

    const-string v1, "T"

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v0, ".00Z"

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getGpsPointTime(Ljava/lang/String;III)Ljava/lang/String;
    .locals 4

    .line 201
    invoke-static {p0}, Lcom/yc/pedometer/utils/CalendarUtil;->dateToStamp(Ljava/lang/String;)J

    move-result-wide v0

    int-to-long p0, p1

    int-to-long v2, p3

    mul-long/2addr p0, v2

    add-int/lit8 p2, p2, -0x1

    int-to-long p2, p2

    .line 202
    div-long/2addr p0, p2

    const-wide/16 p2, 0x3e8

    mul-long/2addr p0, p2

    add-long/2addr v0, p0

    .line 203
    invoke-static {}, Lcom/yc/pedometer/utils/strava/gpxlib/TimeFormatUtils;->getTimeZone()F

    move-result p0

    const/high16 p1, 0x42700000    # 60.0f

    mul-float/2addr p0, p1

    mul-float/2addr p0, p1

    const/high16 p1, 0x447a0000    # 1000.0f

    mul-float/2addr p0, p1

    float-to-long p0, p0

    sub-long/2addr v0, p0

    .line 205
    new-instance p0, Ljava/text/SimpleDateFormat;

    const-string p1, "yyyy-MM-dd HH:mm:ss"

    invoke-direct {p0, p1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 206
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    new-instance p2, Ljava/util/Date;

    invoke-direct {p2, v0, v1}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {p0, p2}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object p0

    const-string p2, " "

    const-string p3, "T"

    invoke-virtual {p0, p2, p3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, ".00Z"

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static getTimeMillis(Ljava/lang/String;)J
    .locals 3

    .line 250
    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string v1, "yyyyMMddHHmmss"

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-direct {v0, v1, v2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 253
    :try_start_0
    invoke-virtual {v0, p0}, Ljava/text/SimpleDateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object p0

    .line 254
    invoke-virtual {p0}, Ljava/util/Date;->getTime()J

    move-result-wide v0
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    const-wide/16 v0, 0x0

    :goto_0
    return-wide v0
.end method

.method private static switchSportBase(Lcom/yc/pedometer/utils/strava/gpxlib/GpsValueBean;Lcom/yc/pedometer/sports/entity/ExerciseData;)V
    .locals 3

    if-eqz p0, :cond_2

    if-nez p1, :cond_0

    goto :goto_0

    .line 214
    :cond_0
    new-instance v0, Ljava/io/File;

    sget-object v1, Lcom/yc/pedometer/utils/strava/gpxlib/GpsToGpxUtils;->path:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 215
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v2

    if-nez v2, :cond_1

    .line 216
    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    .line 218
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Lcom/yc/pedometer/sports/entity/ExerciseData;->getStartDate()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ".gpx"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 219
    invoke-virtual {p0, v0}, Lcom/yc/pedometer/utils/strava/gpxlib/GpsValueBean;->setFilePath(Ljava/lang/String;)V

    .line 220
    const-string v0, "GloryFitPro"

    invoke-virtual {p0, v0}, Lcom/yc/pedometer/utils/strava/gpxlib/GpsValueBean;->setCreator(Ljava/lang/String;)V

    .line 221
    invoke-virtual {p1}, Lcom/yc/pedometer/sports/entity/ExerciseData;->getStartDate()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/yc/pedometer/utils/strava/gpxlib/GpsToGpxUtils;->getFormattedTime(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/yc/pedometer/utils/strava/gpxlib/GpsValueBean;->setMetaTime(Ljava/lang/String;)V

    .line 222
    invoke-virtual {p1}, Lcom/yc/pedometer/sports/entity/ExerciseData;->getSportsType()I

    move-result v0

    invoke-static {v0}, Lcom/yc/pedometer/sports/util/SportUtil;->getSportTypeName(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/yc/pedometer/utils/strava/gpxlib/GpsValueBean;->setType(Ljava/lang/String;)V

    .line 223
    invoke-virtual {p1}, Lcom/yc/pedometer/sports/entity/ExerciseData;->getDuration()I

    move-result v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/yc/pedometer/utils/strava/gpxlib/GpsValueBean;->setTotalTime(Ljava/lang/String;)V

    .line 224
    invoke-virtual {p1}, Lcom/yc/pedometer/sports/entity/ExerciseData;->getDistance()F

    move-result p1

    invoke-static {p1}, Ljava/lang/String;->valueOf(F)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/yc/pedometer/utils/strava/gpxlib/GpsValueBean;->setTotalDistance(Ljava/lang/String;)V

    .line 225
    const-string p1, "0"

    invoke-virtual {p0, p1}, Lcom/yc/pedometer/utils/strava/gpxlib/GpsValueBean;->setRouteType(Ljava/lang/String;)V

    :cond_2
    :goto_0
    return-void
.end method
