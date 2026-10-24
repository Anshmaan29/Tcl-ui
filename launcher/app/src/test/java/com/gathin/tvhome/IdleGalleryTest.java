package com.gathin.tvhome;
import org.junit.Test;
import static org.junit.Assert.*;
public class IdleGalleryTest {
    @Test public void wakingNavigationCannotLaunchAnAppAndVolumeStillPassesThrough() {
        for (int key : new int[]{19,20,21,22,23,66,4}) assertTrue(IdleGallery.isWakeKey(key));
        for (int key : new int[]{24,25,3,26,85}) assertFalse(IdleGallery.isWakeKey(key));
    }
}
