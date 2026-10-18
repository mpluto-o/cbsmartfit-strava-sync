.class public Lcom/yc/pedometer/sports/util/StravaEndWorkoutListener;
.super Ljava/lang/Object;
.implements Landroid/content/DialogInterface$OnClickListener;

.field private mActivity:Landroid/app/Activity;
.field private mMode:I

.method public constructor <init>(Landroid/app/Activity;I)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/yc/pedometer/sports/util/StravaEndWorkoutListener;->mActivity:Landroid/app/Activity;

    iput p2, p0, Lcom/yc/pedometer/sports/util/StravaEndWorkoutListener;->mMode:I

    return-void
.end method

.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 3

    iget-object v0, p0, Lcom/yc/pedometer/sports/util/StravaEndWorkoutListener;->mActivity:Landroid/app/Activity;

    if-nez v0, :cond_check_mode

    return-void

    :cond_check_mode
    iget v1, p0, Lcom/yc/pedometer/sports/util/StravaEndWorkoutListener;->mMode:I

    if-nez v1, :cond_dump_confirm_mode

    if-nez p2, :cond_item_local

    instance-of v1, v0, Lcom/yc/pedometer/sports/activity/GoogleSportMapActivity;

    if-eqz v1, :cond_check_sport_map_0

    check-cast v0, Lcom/yc/pedometer/sports/activity/GoogleSportMapActivity;

    const/4 v1, 0x1

    invoke-virtual {v0, v1, p1}, Lcom/yc/pedometer/sports/activity/GoogleSportMapActivity;->completeWorkout(ZLandroid/content/DialogInterface;)V

    return-void

    :cond_check_sport_map_0
    instance-of v1, v0, Lcom/yc/pedometer/sports/activity/SportMapActivity;

    if-eqz v1, :cond_ret

    check-cast v0, Lcom/yc/pedometer/sports/activity/SportMapActivity;

    const/4 v1, 0x1

    invoke-virtual {v0, v1, p1}, Lcom/yc/pedometer/sports/activity/SportMapActivity;->completeWorkout(ZLandroid/content/DialogInterface;)V

    return-void

    :cond_item_local
    const/4 v1, 0x1

    if-ne p2, v1, :cond_item_dump

    instance-of v1, v0, Lcom/yc/pedometer/sports/activity/GoogleSportMapActivity;

    if-eqz v1, :cond_check_sport_map_1

    check-cast v0, Lcom/yc/pedometer/sports/activity/GoogleSportMapActivity;

    const/4 v1, 0x0

    invoke-virtual {v0, v1, p1}, Lcom/yc/pedometer/sports/activity/GoogleSportMapActivity;->completeWorkout(ZLandroid/content/DialogInterface;)V

    return-void

    :cond_check_sport_map_1
    instance-of v1, v0, Lcom/yc/pedometer/sports/activity/SportMapActivity;

    if-eqz v1, :cond_ret

    check-cast v0, Lcom/yc/pedometer/sports/activity/SportMapActivity;

    const/4 v1, 0x0

    invoke-virtual {v0, v1, p1}, Lcom/yc/pedometer/sports/activity/SportMapActivity;->completeWorkout(ZLandroid/content/DialogInterface;)V

    return-void

    :cond_item_dump
    const/4 v1, 0x2

    if-ne p2, v1, :cond_ret

    if-eqz p1, :cond_show_confirm

    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    :cond_show_confirm
    invoke-static {v0}, Lcom/yc/pedometer/sports/util/StravaMapHelper;->showDumpConfirmDialog(Landroid/app/Activity;)V

    return-void

    :cond_dump_confirm_mode
    const/4 v1, -0x1

    if-ne p2, v1, :cond_ret

    if-eqz p1, :cond_do_dump

    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    :cond_do_dump
    instance-of v1, v0, Lcom/yc/pedometer/sports/activity/GoogleSportMapActivity;

    if-eqz v1, :cond_check_sport_map_dump

    check-cast v0, Lcom/yc/pedometer/sports/activity/GoogleSportMapActivity;

    invoke-virtual {v0}, Lcom/yc/pedometer/sports/activity/GoogleSportMapActivity;->dumpWorkout()V

    return-void

    :cond_check_sport_map_dump
    instance-of v1, v0, Lcom/yc/pedometer/sports/activity/SportMapActivity;

    if-eqz v1, :cond_ret

    check-cast v0, Lcom/yc/pedometer/sports/activity/SportMapActivity;

    invoke-virtual {v0}, Lcom/yc/pedometer/sports/activity/SportMapActivity;->dumpWorkout()V

    :cond_ret
    return-void
.end method
