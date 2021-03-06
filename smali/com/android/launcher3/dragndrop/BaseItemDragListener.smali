.class public abstract Lcom/android/launcher3/dragndrop/BaseItemDragListener;
.super Lcom/android/launcher3/states/InternalStateHandler;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnDragListener;
.implements Lcom/android/launcher3/DragSource;
.implements Lcom/android/launcher3/dragndrop/DragOptions$PreDragCondition;


# instance fields
.field private mDragController:Lcom/android/launcher3/dragndrop/DragController;

.field private mDragStartTime:J

.field private final mId:Ljava/lang/String;

.field public mLauncher:Lcom/android/launcher3/Launcher;

.field private final mPreviewBitmapWidth:I

.field private final mPreviewRect:Landroid/graphics/Rect;

.field private final mPreviewViewWidth:I


# direct methods
.method public constructor <init>(Landroid/graphics/Rect;II)V
    .locals 0

    .line 66
    invoke-direct {p0}, Lcom/android/launcher3/states/InternalStateHandler;-><init>()V

    .line 67
    iput-object p1, p0, Lcom/android/launcher3/dragndrop/BaseItemDragListener;->mPreviewRect:Landroid/graphics/Rect;

    .line 68
    iput p2, p0, Lcom/android/launcher3/dragndrop/BaseItemDragListener;->mPreviewBitmapWidth:I

    .line 69
    iput p3, p0, Lcom/android/launcher3/dragndrop/BaseItemDragListener;->mPreviewViewWidth:I

    .line 70
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object p1

    invoke-virtual {p1}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/android/launcher3/dragndrop/BaseItemDragListener;->mId:Ljava/lang/String;

    .line 71
    return-void
.end method

.method private postCleanup()V
    .locals 2

    .line 160
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/BaseItemDragListener;->mLauncher:Lcom/android/launcher3/Launcher;

    if-eqz v0, :cond_0

    .line 162
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lcom/android/launcher3/dragndrop/BaseItemDragListener;->mLauncher:Lcom/android/launcher3/Launcher;

    invoke-virtual {v1}, Lcom/android/launcher3/Launcher;->getIntent()Landroid/content/Intent;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Intent;)V

    .line 163
    const-string v1, "pin_item_drag_listener"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->removeExtra(Ljava/lang/String;)V

    .line 164
    iget-object v1, p0, Lcom/android/launcher3/dragndrop/BaseItemDragListener;->mLauncher:Lcom/android/launcher3/Launcher;

    invoke-virtual {v1, v0}, Lcom/android/launcher3/Launcher;->setIntent(Landroid/content/Intent;)V

    .line 167
    :cond_0
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v1, Lcom/android/launcher3/dragndrop/BaseItemDragListener$1;

    invoke-direct {v1, p0}, Lcom/android/launcher3/dragndrop/BaseItemDragListener$1;-><init>(Lcom/android/launcher3/dragndrop/BaseItemDragListener;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 173
    return-void
.end method


# virtual methods
.method public abstract createDragHelper()Lcom/android/launcher3/widget/PendingItemDragHelper;
.end method

.method public final getMimeType()Ljava/lang/String;
    .locals 2

    .line 74
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "com.android.launcher3.drag_and_drop/"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/android/launcher3/dragndrop/BaseItemDragListener;->mId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final init(Lcom/android/launcher3/Launcher;Z)Z
    .locals 2

    .line 79
    invoke-static {p1, p2}, Lcom/android/launcher3/AbstractFloatingView;->closeAllOpenViews(Lcom/android/launcher3/Launcher;Z)V

    .line 80
    iget-object v0, p1, Lcom/android/launcher3/Launcher;->mStateManager:Lcom/android/launcher3/LauncherStateManager;

    sget-object v1, Lcom/android/launcher3/LauncherState;->NORMAL:Lcom/android/launcher3/LauncherState;

    invoke-virtual {v0, v1, p2}, Lcom/android/launcher3/LauncherStateManager;->goToState(Lcom/android/launcher3/LauncherState;Z)V

    .line 81
    iget-object p2, p1, Lcom/android/launcher3/Launcher;->mDragLayer:Lcom/android/launcher3/dragndrop/DragLayer;

    invoke-virtual {p2, p0}, Lcom/android/launcher3/dragndrop/DragLayer;->setOnDragListener(Landroid/view/View$OnDragListener;)V

    .line 83
    iput-object p1, p0, Lcom/android/launcher3/dragndrop/BaseItemDragListener;->mLauncher:Lcom/android/launcher3/Launcher;

    .line 84
    iget-object p1, p1, Lcom/android/launcher3/Launcher;->mDragController:Lcom/android/launcher3/dragndrop/DragController;

    iput-object p1, p0, Lcom/android/launcher3/dragndrop/BaseItemDragListener;->mDragController:Lcom/android/launcher3/dragndrop/DragController;

    .line 85
    const/4 p1, 0x0

    return p1
.end method

.method public onDrag(Landroid/view/View;Landroid/view/DragEvent;)Z
    .locals 11

    .line 90
    iget-object p1, p0, Lcom/android/launcher3/dragndrop/BaseItemDragListener;->mLauncher:Lcom/android/launcher3/Launcher;

    const/4 v0, 0x0

    if-eqz p1, :cond_5

    iget-object p1, p0, Lcom/android/launcher3/dragndrop/BaseItemDragListener;->mDragController:Lcom/android/launcher3/dragndrop/DragController;

    if-nez p1, :cond_0

    goto :goto_2

    .line 94
    :cond_0
    invoke-virtual {p2}, Landroid/view/DragEvent;->getAction()I

    move-result p1

    const/4 v1, 0x1

    if-ne p1, v1, :cond_2

    .line 95
    invoke-virtual {p0, p2}, Lcom/android/launcher3/dragndrop/BaseItemDragListener;->onDragStart(Landroid/view/DragEvent;)Z

    move-result p1

    if-eqz p1, :cond_1

    .line 96
    return v1

    .line 98
    :cond_1
    invoke-direct {p0}, Lcom/android/launcher3/dragndrop/BaseItemDragListener;->postCleanup()V

    .line 99
    return v0

    .line 102
    :cond_2
    iget-object p1, p0, Lcom/android/launcher3/dragndrop/BaseItemDragListener;->mDragController:Lcom/android/launcher3/dragndrop/DragController;

    iget-wide v2, p0, Lcom/android/launcher3/dragndrop/BaseItemDragListener;->mDragStartTime:J

    iget-object v10, p1, Lcom/android/launcher3/dragndrop/DragController;->mFlingToDeleteHelper:Lcom/android/launcher3/dragndrop/FlingToDeleteHelper;

    invoke-virtual {p2}, Landroid/view/DragEvent;->getAction()I

    move-result v4

    const/4 v5, 0x4

    if-eq v4, v5, :cond_3

    packed-switch v4, :pswitch_data_0

    goto :goto_1

    :pswitch_0
    const/4 v4, 0x2

    move v6, v4

    goto :goto_0

    :pswitch_1
    move v6, v0

    goto :goto_0

    :cond_3
    move v6, v1

    :goto_0
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v4

    invoke-virtual {p2}, Landroid/view/DragEvent;->getX()F

    move-result v7

    invoke-virtual {p2}, Landroid/view/DragEvent;->getY()F

    move-result v8

    const/4 v9, 0x0

    invoke-static/range {v2 .. v9}, Landroid/view/MotionEvent;->obtain(JJIFFI)Landroid/view/MotionEvent;

    move-result-object v2

    invoke-virtual {v10, v2}, Lcom/android/launcher3/dragndrop/FlingToDeleteHelper;->recordMotionEvent(Landroid/view/MotionEvent;)V

    invoke-virtual {v2}, Landroid/view/MotionEvent;->recycle()V

    :goto_1
    iget-object v2, p1, Lcom/android/launcher3/dragndrop/DragController;->mDragDriver:Lcom/android/launcher3/dragndrop/DragDriver;

    if-eqz v2, :cond_4

    iget-object p1, p1, Lcom/android/launcher3/dragndrop/DragController;->mDragDriver:Lcom/android/launcher3/dragndrop/DragDriver;

    invoke-virtual {p1, p2}, Lcom/android/launcher3/dragndrop/DragDriver;->onDragEvent(Landroid/view/DragEvent;)Z

    move-result p1

    if-eqz p1, :cond_4

    return v1

    :cond_4
    return v0

    .line 91
    :cond_5
    :goto_2
    invoke-direct {p0}, Lcom/android/launcher3/dragndrop/BaseItemDragListener;->postCleanup()V

    .line 92
    return v0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method protected onDragStart(Landroid/view/DragEvent;)Z
    .locals 8

    .line 106
    invoke-virtual {p1}, Landroid/view/DragEvent;->getClipDescription()Landroid/content/ClipDescription;

    move-result-object v0

    .line 107
    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lcom/android/launcher3/dragndrop/BaseItemDragListener;->getMimeType()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/ClipDescription;->hasMimeType(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 112
    :cond_0
    new-instance v5, Landroid/graphics/Point;

    invoke-virtual {p1}, Landroid/view/DragEvent;->getX()F

    move-result v0

    float-to-int v0, v0

    invoke-virtual {p1}, Landroid/view/DragEvent;->getY()F

    move-result p1

    float-to-int p1, p1

    invoke-direct {v5, v0, p1}, Landroid/graphics/Point;-><init>(II)V

    .line 113
    new-instance v7, Lcom/android/launcher3/dragndrop/DragOptions;

    invoke-direct {v7}, Lcom/android/launcher3/dragndrop/DragOptions;-><init>()V

    .line 114
    iput-object v5, v7, Lcom/android/launcher3/dragndrop/DragOptions;->systemDndStartPoint:Landroid/graphics/Point;

    .line 115
    iput-object p0, v7, Lcom/android/launcher3/dragndrop/DragOptions;->preDragCondition:Lcom/android/launcher3/dragndrop/DragOptions$PreDragCondition;

    .line 122
    invoke-virtual {p0}, Lcom/android/launcher3/dragndrop/BaseItemDragListener;->createDragHelper()Lcom/android/launcher3/widget/PendingItemDragHelper;

    move-result-object v1

    new-instance v2, Landroid/graphics/Rect;

    iget-object p1, p0, Lcom/android/launcher3/dragndrop/BaseItemDragListener;->mPreviewRect:Landroid/graphics/Rect;

    invoke-direct {v2, p1}, Landroid/graphics/Rect;-><init>(Landroid/graphics/Rect;)V

    iget v3, p0, Lcom/android/launcher3/dragndrop/BaseItemDragListener;->mPreviewBitmapWidth:I

    iget v4, p0, Lcom/android/launcher3/dragndrop/BaseItemDragListener;->mPreviewViewWidth:I

    move-object v6, p0

    invoke-virtual/range {v1 .. v7}, Lcom/android/launcher3/widget/PendingItemDragHelper;->startDrag(Landroid/graphics/Rect;IILandroid/graphics/Point;Lcom/android/launcher3/DragSource;Lcom/android/launcher3/dragndrop/DragOptions;)V

    .line 124
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/android/launcher3/dragndrop/BaseItemDragListener;->mDragStartTime:J

    .line 125
    const/4 p1, 0x1

    return p1

    .line 108
    :cond_1
    :goto_0
    const-string p1, "BaseItemDragListener"

    const-string v0, "Someone started a dragAndDrop before us."

    invoke-static {p1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 109
    const/4 p1, 0x0

    return p1
.end method

.method public final onDropCompleted(Landroid/view/View;Lcom/android/launcher3/DropTarget$DragObject;Z)V
    .locals 0

    .line 156
    invoke-direct {p0}, Lcom/android/launcher3/dragndrop/BaseItemDragListener;->postCleanup()V

    .line 157
    return-void
.end method

.method public final onPreDragEnd(Lcom/android/launcher3/DropTarget$DragObject;Z)V
    .locals 0

    .line 149
    if-eqz p2, :cond_0

    .line 150
    iget-object p1, p1, Lcom/android/launcher3/DropTarget$DragObject;->dragView:Lcom/android/launcher3/dragndrop/DragView;

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Lcom/android/launcher3/dragndrop/DragView;->setColor(I)V

    .line 152
    :cond_0
    return-void
.end method

.method public final onPreDragStart(Lcom/android/launcher3/DropTarget$DragObject;)V
    .locals 2

    .line 141
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/BaseItemDragListener;->mLauncher:Lcom/android/launcher3/Launcher;

    iget-object v0, v0, Lcom/android/launcher3/Launcher;->mDragLayer:Lcom/android/launcher3/dragndrop/DragLayer;

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {v0, v1}, Lcom/android/launcher3/dragndrop/DragLayer;->setAlpha(F)V

    .line 143
    iget-object p1, p1, Lcom/android/launcher3/DropTarget$DragObject;->dragView:Lcom/android/launcher3/dragndrop/DragView;

    iget-object v0, p0, Lcom/android/launcher3/dragndrop/BaseItemDragListener;->mLauncher:Lcom/android/launcher3/Launcher;

    .line 144
    invoke-virtual {v0}, Lcom/android/launcher3/Launcher;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0a000e

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    .line 143
    invoke-virtual {p1, v0}, Lcom/android/launcher3/dragndrop/DragView;->setColor(I)V

    .line 145
    return-void
.end method

.method public final shouldStartDrag(D)Z
    .locals 0

    .line 133
    iget-object p1, p0, Lcom/android/launcher3/dragndrop/BaseItemDragListener;->mLauncher:Lcom/android/launcher3/Launcher;

    invoke-virtual {p1}, Lcom/android/launcher3/Launcher;->isWorkspaceLocked()Z

    move-result p1

    if-nez p1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method
