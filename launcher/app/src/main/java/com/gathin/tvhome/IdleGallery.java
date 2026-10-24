package com.gathin.tvhome;

import android.graphics.Color;
import android.view.Gravity;
import android.view.KeyEvent;
import android.view.View;
import android.view.animation.DecelerateInterpolator;
import android.widget.FrameLayout;
import android.widget.TextClock;

/** Home-only gallery: reuses the wallpaper already displayed; a navigation key restores focus. */
final class IdleGallery {
    private final View[] controls;
    private final float[] alphas;
    private final int[] visibility;
    private final TextClock clock;
    private final boolean animations;
    private final FrameLayout root;
    private View focused;
    private boolean shown;

    IdleGallery(FrameLayout root, boolean animations, View... controls) {
        this.root = root;
        this.animations = animations;
        this.controls = controls;
        alphas = new float[controls.length];
        visibility = new int[controls.length];
        clock = new TextClock(root.getContext());
        clock.setFormat24Hour("HH:mm");
        clock.setFormat12Hour("h:mm a");
        clock.setTextSize(24);
        clock.setTextColor(0xDDFFFFFF);
        clock.setShadowLayer(3, 0, 1, Color.BLACK);
        try { clock.setTypeface(UiFont.get(root.getContext(), R.string.font_light)); }
        catch (Exception ignored) { }
        clock.setFocusable(false);
        clock.setVisibility(View.GONE);
        float dp = root.getResources().getDisplayMetrics().density;
        FrameLayout.LayoutParams params = new FrameLayout.LayoutParams(-2, -2, Gravity.BOTTOM | Gravity.START);
        params.setMargins(Math.round(60 * dp), 0, 0, Math.round(35 * dp));
        root.addView(clock, params);
    }

    boolean isShown() { return shown; }

    static boolean isWakeKey(int key) {
        return key == KeyEvent.KEYCODE_DPAD_UP || key == KeyEvent.KEYCODE_DPAD_DOWN
                || key == KeyEvent.KEYCODE_DPAD_LEFT || key == KeyEvent.KEYCODE_DPAD_RIGHT
                || key == KeyEvent.KEYCODE_DPAD_CENTER || key == KeyEvent.KEYCODE_ENTER
                || key == KeyEvent.KEYCODE_BACK;
    }

    void show() {
        if (shown) return;
        shown = true;
        focused = root.findFocus();
        for (int i = 0; i < controls.length; i++) {
            View view = controls[i];
            view.animate().cancel();
            alphas[i] = view.getAlpha();
            visibility[i] = view.getVisibility();
            if (visibility[i] != View.VISIBLE) continue;
            if (animations) {
                android.view.ViewPropertyAnimator fade = view.animate().alpha(0).setDuration(350)
                        .setInterpolator(new DecelerateInterpolator())
                        .withEndAction(() -> { if (shown) view.setVisibility(View.INVISIBLE); });
                if (i == 0) fade.scaleX(.99f).scaleY(.99f);
                fade.start();
            } else view.setVisibility(View.INVISIBLE);
        }
        clock.setAlpha(animations ? 0 : 1);
        clock.setVisibility(View.VISIBLE);
        if (animations) clock.animate().alpha(1).setDuration(350).start();
    }

    void hide(boolean restoreFocus) {
        if (!shown) return;
        shown = false;
        clock.animate().cancel();
        clock.setVisibility(View.GONE);
        for (int i = 0; i < controls.length; i++) {
            View view = controls[i];
            view.animate().cancel();
            view.setVisibility(visibility[i]);
            view.setScaleX(1); view.setScaleY(1);
            view.setAlpha(alphas[i]);
        }
        if (restoreFocus && focused != null) focused.requestFocus();
    }
}
