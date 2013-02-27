#include <gst/gst.h>
#include <glib.h>

static gboolean bus_call(GstBus *bus,
        GstMessage *msg,
        gpointer data) {
    GMainLoop *loop = (GMainLoop *)data;
}
