Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793470447;
	b=C7X9tneOjVgI56DVY6re2waKPz0kW5pDf7nN9yLrqLm4kbgFfz60mBMoIAZ6cojyLpwy
	 ZvY+A3pFfwCGU5L/+bPAdpDS44CsVoWFJA72MOpePo6kPYDklts2eKbO6CPo/AApQNQy9
	 SNkAoC1qpf2OUiBLrAGv6hKE/gADYehF/vQLVvDsW7NDZjrWw7EDfk+DYoSQYdvmwLlar
	 71o5P2r61FJoIt+R4MkyAzy6KSUd7v1xxTGG9g6LeCcmafJGduAldFbad22fOB6aQY2d8
	 us5UQEEJFwt/WPbCbrexIPvuufb0ISLZhR2yd8Akoe1JVZfcqffJ/n+GSS4zO787W5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793470447;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=HPgaghJrkhjhaTCDh5OHrX3iYY4k72sTTxon4CKmpQM=;
	b=48Fat5PQJg83QazX0PJhfWZpkEQfX2p9GSyKsJusE7hSZGowbHa/HJ3/Ux37xr/uFAnr
	 uT9LG0u7kSz/hkFpul04LhHn22Lr/Mg4nsBYcGdFRVItRihycQzUWxAXGG3bonh9rkfdT
	 DUSFzJRuFySQa4xmaODf8AwwmSLz1QExhcHUN03csr4cqcPcewNfSkH0X4Gx4UPpk/rH/
	 ZJ90I/61Y+PVttU+LHXqyqBak4jZ45dYh7Of9y5IaWriruYfLYvKVwfyWE5ObaIAsxMGg
	 nTFtL5kbZ7bh71BmsdeBFzf6Tc6BbLKbkrgnKF8V5xtWLI08IK5JNEU9Wj9CX46J/eA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pxk1CREa;
	arc=none smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5E99606A32E
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 18:14:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5E99606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pxk1CREa
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6b1ab2ad719so2369044a12.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 11:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793470445; x=1794075245; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HPgaghJrkhjhaTCDh5OHrX3iYY4k72sTTxon4CKmpQM=;
        b=pxk1CREaAn+Ydq1Xtzsw1IeQ76JrjXZKYdf/JV7eT7NFm06pzFepWt/TS3NETsD7W4
         elpHW1g0db2SadEnLX8R7cazDIjHb7JTHZmQSRToQjF193+QdJRj7tkG+reKNkDXlypq
         7Bvh3AhL9K2qbYLGn3RzwlECJHWfZQ6+yWf5hBr7Yj2Zi1UDTTMVVn5/OeBW+aWzB5Do
         TSD+QN/DZbeSHuu7haWKePj00P2Y7YAV/hIBHY+YaMsNEu/77AaYhzKFMDquGWNxnmb8
         JL3tHHCg8FVj/nQrKBtHYj2pIpMqap+NvkPo50j8fCMXRtStR6jQ1ovjYnmZt4YNQtUf
         jYUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793470445; x=1794075245;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HPgaghJrkhjhaTCDh5OHrX3iYY4k72sTTxon4CKmpQM=;
        b=qu99G6p4diz+S829bihLABgt1wI7N47ZFgczwtFwnEYPlzuNpAbAVA5nsG4fnmSuJl
         mLPG53iXQZM/Uiusirij48X95iFH3PNlZYSwwld9Xm4T497Rw5OeKko71K/0E3C5menG
         DxnJB0OWcESo/gbjQ2anI/W2CS7qDcHrPc2GZIWMRm55HIKy2LDtk7U6eTHruSp+VbVC
         oko9rEfzKyCAPx9tmP7+I6BAEfESRhH+2+cvQxZDTczkyS156vTSengoRYwTtG5FZVw7
         ORRlMq/M5x/ViDrYx3Za4t0SH5GE0GhaVltsfMRrKRr5qPvCCbf4G9m4HMTM4FuyT0J6
         6lzw==
X-Forwarded-Encrypted: i=1; AKwUvBxko/6jolWT0ffsyW9KpYXWDZO8w6AGrkTxyR4L74rgu9E85WW/lrjAqAz13wkvDBY9YbKxGvKXvs75hBae@vger.kernel.org
X-Gm-Message-State: AFq9FYKB+ejjR6NubLBZzhUcYebveue07o58ZxmSDHmzB9pX7GYmD5lh
	rvhmEyH6DmTDO3UGnNpsT43JRvI1vb0zUV6ik8XX62vjnsGp1/3OVxGKqqQZB+xyJS0=
X-Gm-Gg: AYBFou0eqi8BqS8MK8cFyv2mpze3pPX59UHYSfhFnX1SXPv4419Nx7dCZj2j21dfKaZ
	2onsbVxWlRNrJosFWEREBG3yKp11MCN+xjiuDNz/nc+FyNte+sAokjlgQX2GqfIoS9RdcfbfYOh
	QI11P03DY6Z0KlvsBCjc7ZNqnEc5VVMh/Ozy4wQzyKy+4fARXiBzj5o7PLIQRgyAkaKDB+g9km2
	CDM/BVUVp5eTyXaVUdEhbmiu47KrKszk48bvb5ByH3teMcKgHF2J/rNk53wT+lSlZ7DfWKg0mRX
	QsoNQKreguz9u0Ssyp42kVptupSvDwWmLLEjzX/ovRhLrltNOiAASLVNN89px5UhTqW1JwcWFq8
	w3hhOJgM7vUBD+uHtEZ3cSc9dN7fgdGMuy4zJzT164TD+oLNTuYzN+69ppb6U/UHWEeceGGNzL/
	gWDL4xSRH/iLeEIlgHpSxdt/+zGLIfxV/QoOsknT0Lf6uBBPGoxoxImN0xK5EktlOpth/pZVhdh
	7ozCGKtPIvxClzIielMgUM3fYUm7G/PefvgESXEUo+gVYZ9/AcTPsss0pxHm1nXIzlAqlIQWoF8
	1jplBrR7poFUnE0xH2g56nxWFlkRXTlrgVnJYoSL4boCyVyISaP+1q9raNGRv9o4odIayOredp6
	SmOFVoQl0RAXL4kbY
X-Received: by 2002:a05:6402:15:b0:6b3:a1ad:ef6d with SMTP id 4fb4d7f45d1cf-6b4d33c6910mr3217700a12.6.1793470445038;
        Sat, 31 Oct 2026 11:14:05 -0700 (PDT)
Received: from cachyos-x8664 (2a02-a44f-6bd8-0-365-d763-c748-da6c.fixed6.kpn.net. [2a02:a44f:6bd8:0:365:d763:c748:da6c])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4ec9eeb26sm1223499a12.9.2026.10.31.11.14.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 11:14:03 -0700 (PDT)
From: Senna <sennas1633@gmail.com>
X-Google-Original-From: Senna <Sennas1633@gmail.com>
To: mhi@lists.linux.dev
Cc: mani@kernel.org,
	linux-arm-msm@vger.kernel.org,
	sumit.kumar@oss.qualcomm.com,
	Senna <Sennas1633@gmail.com>
Subject: [PATCH v2] bus: mhi: ep: Complete multi-TRE DL transfers after all TREs finish
Date: Sat, 31 Oct 2026 19:12:08 +0100
Message-ID: <20261031181208.19403-1-Sennas1633@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A buffer that spans several host TREs is written once per TRE, and the
client callback runs from each completion. A client that frees the
buffer from the callback, like the loopback driver, frees it while
later TREs still reference it and frees it again on the next callback.

Check up front that the TREs queued by the host can hold the whole
buffer, so a transfer does not run out of TREs halfway. Then track the
outstanding TREs of each transfer with a refcount and call the client
callback once, after all accepted TREs have completed. This does not
depend on write_async() completions being in order.

The queue functions now return 0 once at least one TRE has been
accepted. A later submission failure is reported through
transaction_status in the callback. A negative return still means
nothing was accepted and no callback will be issued. The path is shared
by raw buffers and SKBs, so both get the same handling.

A partial submission can still leave the host with OVERFLOW events and
no closing EOT. Fixing that needs a write_async() op that takes all
TREs of a buffer at once.

Fixes: f9ff616f5747 ("bus: mhi: ep: Add mhi_ep_queue_buf() API for raw buffer queuing")
Suggested-by: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
Signed-off-by: Senna <Sennas1633@gmail.com>
---

Notes:
    Link to v1: https://lore.kernel.org/all/20261028175100.83406-1-Sennas1633@gmail.com/

    Changes in v2:
    - Check TRE room up front, as suggested by Sumit
    - Complete the client callback once after all accepted TREs finish, using a refcount, instead of relying on in-order completion
    - Report a later submission failure via transaction_status and document it
    - Also covers SKBs, since both share mhi_ep_queue()
    - Dropped the loopback.c error print from v1
    - Not tested on hardware; found by code inspection.

 drivers/bus/mhi/ep/main.c | 143 +++++++++++++++++++++++++++++++++-----
 include/linux/mhi_ep.h    |  30 ++++++--
 2 files changed, 147 insertions(+), 26 deletions(-)

diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c
index 4be20c368536..a4b0ef2fa4d9 100644
--- a/drivers/bus/mhi/ep/main.c
+++ b/drivers/bus/mhi/ep/main.c
@@ -14,6 +14,8 @@
 #include <linux/irq.h>
 #include <linux/mhi_ep.h>
 #include <linux/module.h>
+#include <linux/refcount.h>
+#include <linux/spinlock.h>
 #include "internal.h"
 
 #define M0_WAIT_DELAY_MS	100
@@ -504,7 +506,33 @@ static int mhi_ep_process_ch_ring(struct mhi_ep_ring *ring)
 	return 0;
 }
 
-static void mhi_ep_buf_completion(struct mhi_ep_buf_info *buf_info)
+struct mhi_ep_buf_tx {
+	struct mhi_ep_device *mhi_dev;
+	void *buf;
+	refcount_t pending;
+	spinlock_t lock; /* protects bytes_xferd and status */
+	size_t bytes_xferd;
+	int status;
+	bool queued;
+};
+
+/* Check that the TREs queued by the host can hold @len before queueing any */
+static bool mhi_ep_queue_has_room(struct mhi_ep_ring *ring,
+				  struct mhi_ep_chan *mhi_chan, size_t len)
+{
+	size_t rd = mhi_chan->rd_offset;
+
+	while (len && rd != ring->wr_offset) {
+		struct mhi_ring_element *el = &ring->ring_cache[rd];
+
+		len -= min_t(size_t, len, MHI_TRE_DATA_GET_LEN(el));
+		rd = (rd + 1) % ring->ring_size;
+	}
+
+	return !len;
+}
+
+static int mhi_ep_send_buf_completion(struct mhi_ep_buf_info *buf_info)
 {
 	struct mhi_ep_device *mhi_dev = buf_info->mhi_dev;
 	struct mhi_ep_cntrl *mhi_cntrl = mhi_dev->mhi_cntrl;
@@ -512,25 +540,55 @@ static void mhi_ep_buf_completion(struct mhi_ep_buf_info *buf_info)
 	struct mhi_ep_ring *ring = &mhi_cntrl->mhi_chan[mhi_chan->chan].ring;
 	struct mhi_ring_element *el = &ring->ring_cache[ring->rd_offset];
 	struct device *dev = &mhi_dev->dev;
-	struct mhi_result result = {};
 	int ret;
 
-	if (mhi_chan->xfer_cb) {
-		result.buf_addr = buf_info->cb_buf;
-		result.dir = mhi_chan->dir;
-		result.bytes_xferd = buf_info->size;
-
-		mhi_chan->xfer_cb(mhi_dev, &result);
-	}
-
 	ret = mhi_ep_send_completion_event(mhi_cntrl, ring, el, buf_info->size,
 					   buf_info->code);
 	if (ret) {
 		dev_err(dev, "Error sending transfer completion event\n");
-		return;
+		return ret;
 	}
 
 	mhi_ep_ring_inc_index(ring);
+
+	return 0;
+}
+
+static void mhi_ep_buf_tx_put(struct mhi_ep_buf_tx *tx, size_t bytes_xferd,
+			      int status)
+{
+	struct mhi_ep_chan *mhi_chan = tx->mhi_dev->dl_chan;
+	struct mhi_result result = {
+		.buf_addr = tx->buf,
+		.dir = mhi_chan->dir,
+	};
+	unsigned long flags;
+
+	spin_lock_irqsave(&tx->lock, flags);
+	tx->bytes_xferd += bytes_xferd;
+	if (status && !tx->status)
+		tx->status = status;
+	spin_unlock_irqrestore(&tx->lock, flags);
+
+	if (!refcount_dec_and_test(&tx->pending))
+		return;
+
+	if (tx->queued && mhi_chan->xfer_cb) {
+		result.bytes_xferd = tx->bytes_xferd;
+		result.transaction_status = tx->status;
+		mhi_chan->xfer_cb(tx->mhi_dev, &result);
+	}
+
+	kfree(tx);
+}
+
+static void mhi_ep_buf_completion(struct mhi_ep_buf_info *buf_info)
+{
+	struct mhi_ep_buf_tx *tx = buf_info->cb_buf;
+	int ret;
+
+	ret = mhi_ep_send_buf_completion(buf_info);
+	mhi_ep_buf_tx_put(tx, buf_info->size, ret);
 }
 
 /* TODO: Handle partially formed TDs */
@@ -541,11 +599,14 @@ static int mhi_ep_queue(struct mhi_ep_device *mhi_dev, void *buf, size_t len,
 	struct mhi_ep_chan *mhi_chan = mhi_dev->dl_chan;
 	struct device *dev = &mhi_chan->mhi_dev->dev;
 	struct mhi_ep_buf_info buf_info = {};
+	struct mhi_ep_buf_tx *tx;
 	struct mhi_ring_element *el;
 	size_t buf_left, read_offset;
 	struct mhi_ep_ring *ring;
 	size_t tr_len;
 	u32 tre_len;
+	bool queued = false;
+	unsigned long flags;
 	int ret;
 
 	buf_left = len;
@@ -553,14 +614,32 @@ static int mhi_ep_queue(struct mhi_ep_device *mhi_dev, void *buf, size_t len,
 
 	mutex_lock(&mhi_chan->lock);
 
-	do {
-		/* Don't process the transfer ring if the channel is not in RUNNING state */
-		if (mhi_chan->state != MHI_CH_STATE_RUNNING) {
-			dev_err(dev, "Channel not available\n");
-			ret = -ENODEV;
-			goto err_exit;
-		}
+	/* Don't process the transfer ring if the channel is not in RUNNING state */
+	if (mhi_chan->state != MHI_CH_STATE_RUNNING) {
+		dev_err(dev, "Channel not available\n");
+		ret = -ENODEV;
+		goto err_unlock;
+	}
+
+	/* Don't start the transfer if the host TREs can't hold the whole buffer */
+	if (!mhi_ep_queue_has_room(ring, mhi_chan, len)) {
+		dev_err(dev, "Not enough TREs available\n");
+		ret = -ENOSPC;
+		goto err_unlock;
+	}
 
+	tx = kzalloc_obj(*tx, GFP_KERNEL);
+	if (!tx) {
+		mutex_unlock(&mhi_chan->lock);
+		return -ENOMEM;
+	}
+
+	tx->mhi_dev = mhi_dev;
+	tx->buf = cb_buf;
+	refcount_set(&tx->pending, 1);
+	spin_lock_init(&tx->lock);
+
+	do {
 		if (mhi_ep_queue_is_empty(mhi_dev, DMA_FROM_DEVICE)) {
 			dev_err(dev, "TRE not available!\n");
 			ret = -ENOSPC;
@@ -576,8 +655,9 @@ static int mhi_ep_queue(struct mhi_ep_device *mhi_dev, void *buf, size_t len,
 		buf_info.dev_addr = buf + read_offset;
 		buf_info.host_addr = MHI_TRE_DATA_GET_PTR(el);
 		buf_info.size = tr_len;
+		refcount_inc(&tx->pending);
 		buf_info.cb = mhi_ep_buf_completion;
-		buf_info.cb_buf = cb_buf;
+		buf_info.cb_buf = tx;
 		buf_info.mhi_dev = mhi_dev;
 
 		/*
@@ -591,13 +671,19 @@ static int mhi_ep_queue(struct mhi_ep_device *mhi_dev, void *buf, size_t len,
 		else
 			buf_info.code = MHI_EV_CC_EOT;
 
+		/*
+		 * If a later write_async() fails, accepted TREs still reference
+		 * the buffer and the host may see OVERFLOW without a closing EOT.
+		 */
 		dev_dbg(dev, "Writing %zd bytes to channel (%u)\n", tr_len, ring->ch_id);
 		ret = mhi_cntrl->write_async(mhi_cntrl, &buf_info);
 		if (ret) {
 			dev_err(dev, "Error writing to the channel\n");
+			refcount_dec(&tx->pending);
 			goto err_exit;
 		}
 
+		queued = true;
 		buf_left -= tr_len;
 
 		/*
@@ -609,11 +695,30 @@ static int mhi_ep_queue(struct mhi_ep_device *mhi_dev, void *buf, size_t len,
 
 	mutex_unlock(&mhi_chan->lock);
 
+	tx->queued = true;
+	mhi_ep_buf_tx_put(tx, 0, 0);
+
 	return 0;
 
 err_exit:
 	mutex_unlock(&mhi_chan->lock);
 
+	if (queued) {
+		tx->queued = true;
+		spin_lock_irqsave(&tx->lock, flags);
+		if (!tx->status)
+			tx->status = ret;
+		spin_unlock_irqrestore(&tx->lock, flags);
+		ret = 0;
+	}
+
+	mhi_ep_buf_tx_put(tx, 0, 0);
+
+	return ret;
+
+err_unlock:
+	mutex_unlock(&mhi_chan->lock);
+
 	return ret;
 }
 
diff --git a/include/linux/mhi_ep.h b/include/linux/mhi_ep.h
index 852f331f03fd..76f77b35dfde 100644
--- a/include/linux/mhi_ep.h
+++ b/include/linux/mhi_ep.h
@@ -300,7 +300,16 @@ bool mhi_ep_queue_is_empty(struct mhi_ep_device *mhi_dev, enum dma_data_directio
  * @mhi_dev: Device associated with the DL channel
  * @skb: SKBs to be queued
  *
- * Return: 0 if the SKBs has been sent successfully, a negative error code otherwise.
+ * The DL transfer callback is invoked once after all accepted TREs for the
+ * SKB complete. If submitting a later TRE fails after at least one TRE was
+ * accepted, the callback reports the error through
+ * result->transaction_status.
+ *
+ * Return: 0 if one or more TREs were accepted. When the client callback is
+ * registered, it is invoked after all accepted TREs complete. If a later
+ * submission fails, check result->transaction_status in the callback. A
+ * negative error code is returned if no TRE was accepted and no callback will
+ * be issued.
  */
 int mhi_ep_queue_skb(struct mhi_ep_device *mhi_dev, struct sk_buff *skb);
 
@@ -309,14 +318,21 @@ int mhi_ep_queue_skb(struct mhi_ep_device *mhi_dev, struct sk_buff *skb);
  * @mhi_dev: Device associated with the DL channel
  * @buf: Buffer to be queued. On success, ownership passes to the MHI stack;
  *       the caller must not free @buf until the DL transfer callback fires
- *       with result->buf_addr equal to @buf. On failure, the caller retains
- *       ownership and must free @buf.
- *       Note: if @len spans multiple host DL TREs, the DL transfer callback
- *       fires once per TRE, each time with result->buf_addr equal to @buf.
+ *       with result->buf_addr equal to @buf. If no TRE is accepted, the
+ *       caller retains ownership and must free @buf.
  * @len: Size of the buffer
  *
- * Return: 0 if the buffer contents have been transferred successfully, a
- * negative error code otherwise.
+ * If @len spans multiple host DL TREs, the DL transfer callback fires once,
+ * after all accepted TREs complete. If write_async() fails on a later TRE
+ * after earlier TREs were queued, those transfers remain in flight and still
+ * reference @buf, and the host sees OVERFLOW events without a closing EOT.
+ * In this case, the callback reports the error through
+ * result->transaction_status.
+ *
+ * Return: 0 if one or more TREs were accepted. The client callback is invoked
+ * after all accepted TREs complete and reports a later submission failure
+ * through result->transaction_status. A negative error code is returned if no
+ * TRE was accepted and no callback will be issued.
  */
 int mhi_ep_queue_buf(struct mhi_ep_device *mhi_dev, void *buf, size_t len);
 
-- 
2.56.0

