Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793209874;
	b=rta/CkUUwSegq7yduyczXD447o3edY+r0vdGEzS4j2GMREolTZHwWJNTkX89R4nRnIKW
	 3cFH1yq99HFHPTE72F5IP3228RINnpjUHCaJZ3o+bSwD/OduTJNUBpWcrj+Jjj8UOD1EG
	 zEYB6QwKowho/8BYetU8ilAdhoh/zohv+PanSPMTY7ZWJwGaHFSabD/poUCRkbKJzNGvj
	 Z9Ud00BpRp/2RAsmeG6QFHQizOKSGlrHOWDh2pjxwDNDt9KxIg8bucSGC48ItXJpVNelz
	 DKzw3LGz2dmdCKI9asRtQ51/q6BDV3F/I5T+TRUNiP/Sz3dzTwCGmmY68/8HhaLlVMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793209874;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=v43fYjL5X0v05WZ0mlxoCxASofy9eK+d0SvMy+pQcbs=;
	b=qktZ2tjbjcfL0Z0T5J5Jjoj2sLx6l8pYwuIfQM6tohSCE0gK2dY5re1ozZGbEePSHZEN
	 oIVC7pusOEmJjaPcqABqXjREs1IYRgpSEarqEsFsYNspiVhlGRU0Q5V+7Gl/dz61US888
	 VDM4E20jH/uysb444jW/xLj3nM0axGK9UgnHrD62+bifnBn9g8CTTvXxuhoNerKgcozXT
	 MDaEMbvaTYwgi5c0pd/Ma5ZZaIIIXTGfzyFZl7GHABSO17FTPhRx4Qf2aAX19UtMIhzYd
	 7NGuwU8bFNGVI5JDzUNmJfzIh5xyiJZrBJQFYbmWO+cZh7qTvjjW9v1Jlg0gA100y3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qhU6RbdQ;
	arc=none smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF4A9606A31C
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 17:51:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF4A9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qhU6RbdQ
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c38ac26cc5dso198129266b.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 10:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793209872; x=1793814672; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=v43fYjL5X0v05WZ0mlxoCxASofy9eK+d0SvMy+pQcbs=;
        b=qhU6RbdQJAKZPYeaKCVijSIJGr9OuX/EQ0LJd6gSPl4nqmSzwKLostYWUbNFO0Xe2z
         tMBsjg6I1v2SZwHy0QWmmfmlYZ+sEaHwJzcAS3/e67krUJbK5K+QWJakBQ4DhXb4CYuh
         iPkRz872v6VXDIoDRZMVkmK0IgZQy5u+jgsC5kDPWdqKbdbHuBqI8AyZ3oevfOJsalSJ
         6xEB5Pe1apDN8IklvF9Td2mTFGx40/ZQFYc0grt+s3HF0rLtqFb2c8i+TwHiU9GQw6px
         iLXz+ssw38/M7jHsGfUvDzxNIoiO8Xse/6mk65QPO7YwLMV3H3XD0ivjYjua1h3Z1cU4
         oJOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793209872; x=1793814672;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v43fYjL5X0v05WZ0mlxoCxASofy9eK+d0SvMy+pQcbs=;
        b=sJvtctIu/y1aLs7pLDGGbPbzx6iJGdaD+TINSPW57Nt50OiY4QNiC0cjQ2bYpXYw1W
         scZAr91YaoujCEdrbMwEeCz72hFOvZrh308EYgDFs51kCJTjS7hVD3dbWi5ivTro8s4q
         WU+C2SAH2tcIgEFGfRdksJOo5TIpuYY9KthGzs8M+EcKlOQsU91d0GajA/DjVo9oxh4x
         mmrTNOYw/74Ce1hgrTaY39dZqMFFrlQodzcEMWDad5kZcJKhZ+99McAYZGC0JblGUZIi
         WNxiyraBLi7zk5PyelpCO05hDE8Ok/ubpl0eW8IKVBCayamhUM7eWuPRyYOUWEE82vwZ
         AX+A==
X-Forwarded-Encrypted: i=1; AKwUvBwZu/kL4SeEAWcfP5s32hfr1xkwVfBAlVZ03sCsfrC3VFXSYOg+IcAMORkm0i9RvEGkuAdsz/O5Hnh/Vn+u@vger.kernel.org
X-Gm-Message-State: AFq9FYIa4NwpjeELt1Hvqg+IHl3ZxV4OyDpowENcHcuN5u3Uq1XLHQN+
	e3l+kmlwZQ3XuxuoZNAzMnSFBj8gxqQf4GEZ01AHD6cZpOo9WjhuoG5/VTMt0FGO
X-Gm-Gg: AYBFou2LSwfivQMKzyPOkRdBOfehcu3nhKy4vrUSrEJ6HsA0XlmxntkUKlEmOiAChe+
	pSjulvkj+CurlLkRzoiyRQaBQmXjfU8hVTsTLAAzabpCA9Uxp5U85TBymIK4TO2ImL1F4A8mTK2
	+l7t8fy+1S1n3qtAygdBw9VC4RbkcmEgL7fGsMiNAKCQ6txsEWMkTFESjjFdm69b6XQiSktm1LM
	Vzf6U72UqxHKVfw+fZxOSljiRRs0bgIsKr1zxYeEanVcPZtz4hcUMvH5Ednj7I7AvVWEbnJQUTe
	z9VM6BViSHga+QB6tY3uP+iFbG6M5I5igIHgCwdGTUndcUitFd4Q2iLB1YdfNHw2lhVuXEBacG+
	D4trlucmvenSwj5yCx3oZqdaYkR427t07PUDhqeIp6N24OzqxQIsmhL/cb2Dt78dVSIgTzb4H4c
	J2ST69EMq2GLczYMPSjkFjtafiOBEZgrnb7eH69ZKZ8clX6JrPnsqM0yAc6fvWqig1jOF6LAH9P
	BRM7zTkN7v5Rskh5o/keuuaaBe10xu0kn9Ot9WY43td/lcEHlIJWxvq9mEBuzSNo0w3cTZXnsA2
	/Hn+SVejhPchS0RNeu+9xFnovctLJGkhlL60YOcPHofRBeNC2MXB1LfnpC7CLjHDc0yIKgfqBs1
	HBseRYWrR7H/slg==
X-Received: by 2002:a17:907:d516:b0:c25:2688:8212 with SMTP id a640c23a62f3a-c49bd9ce44dmr320000866b.0.1793209871794;
        Wed, 28 Oct 2026 10:51:11 -0700 (PDT)
Received: from cachyos-x8664 (2a02-a44f-6bd8-0-365-d763-c748-da6c.fixed6.kpn.net. [2a02:a44f:6bd8:0:365:d763:c748:da6c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd4e9995sm629906566b.15.2026.10.28.10.51.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 10:51:11 -0700 (PDT)
From: Senna <sennas1633@gmail.com>
X-Google-Original-From: Senna <Sennas1633@gmail.com>
To: mhi@lists.linux.dev
Cc: mani@kernel.org,
	linux-arm-msm@vger.kernel.org,
	Senna <Sennas1633@gmail.com>
Subject: [PATCH] bus: mhi: ep: aggregate raw buffer completions
Date: Wed, 28 Oct 2026 18:51:00 +0100
Message-ID: <20261028175100.83406-1-Sennas1633@gmail.com>
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

Aggregate raw-buffer completions in the endpoint core and invoke the
client callback once after all accepted TREs complete. This prevents
the loopback worker from freeing a buffer still referenced by an earlier
asynchronous submission.

Fixes: 0b1883ca75c0 ("bus: mhi: ep: clients: Add loopback driver for data path testing")
Signed-off-by: Senna <Sennas1633@gmail.com>
---
 drivers/bus/mhi/ep/clients/loopback.c |   4 +
 drivers/bus/mhi/ep/main.c             | 131 ++++++++++++++++++++++----
 include/linux/mhi_ep.h                |  19 ++--
 3 files changed, 130 insertions(+), 24 deletions(-)

diff --git a/drivers/bus/mhi/ep/clients/loopback.c b/drivers/bus/mhi/ep/clients/loopback.c
index c7452428d0b7..6f6a1b5a51c4 100644
--- a/drivers/bus/mhi/ep/clients/loopback.c
+++ b/drivers/bus/mhi/ep/clients/loopback.c
@@ -71,6 +71,10 @@ static void mhi_ep_loopback_ul_callback(struct mhi_ep_device *mhi_dev,
 static void mhi_ep_loopback_dl_callback(struct mhi_ep_device *mhi_dev,
 					struct mhi_result *mhi_res)
 {
+	if (mhi_res->transaction_status)
+		dev_err(&mhi_dev->dev, "Downlink transfer failed: %d\n",
+			mhi_res->transaction_status);
+
 	kfree(mhi_res->buf_addr);
 }
 
diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c
index 4be20c368536..ec3f5cca66e7 100644
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
@@ -504,7 +506,17 @@ static int mhi_ep_process_ch_ring(struct mhi_ep_ring *ring)
 	return 0;
 }
 
-static void mhi_ep_buf_completion(struct mhi_ep_buf_info *buf_info)
+struct mhi_ep_buf_tx {
+	struct mhi_ep_device *mhi_dev;
+	void *buf;
+	refcount_t pending;
+	spinlock_t lock;
+	size_t bytes_xferd;
+	int status;
+	bool queued;
+};
+
+static int mhi_ep_send_buf_completion(struct mhi_ep_buf_info *buf_info)
 {
 	struct mhi_ep_device *mhi_dev = buf_info->mhi_dev;
 	struct mhi_ep_cntrl *mhi_cntrl = mhi_dev->mhi_cntrl;
@@ -512,42 +524,101 @@ static void mhi_ep_buf_completion(struct mhi_ep_buf_info *buf_info)
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
+}
+
+static void mhi_ep_skb_completion(struct mhi_ep_buf_info *buf_info)
+{
+	struct mhi_ep_device *mhi_dev = buf_info->mhi_dev;
+	struct mhi_ep_chan *mhi_chan = mhi_dev->dl_chan;
+	struct mhi_result result = {
+		.buf_addr = buf_info->cb_buf,
+		.bytes_xferd = buf_info->size,
+		.dir = mhi_chan->dir,
+	};
+
+	if (mhi_chan->xfer_cb)
+		mhi_chan->xfer_cb(mhi_dev, &result);
+
+	mhi_ep_send_buf_completion(buf_info);
 }
 
 /* TODO: Handle partially formed TDs */
 static int mhi_ep_queue(struct mhi_ep_device *mhi_dev, void *buf, size_t len,
-			void *cb_buf)
+			void *cb_buf, bool aggregate)
 {
 	struct mhi_ep_cntrl *mhi_cntrl = mhi_dev->mhi_cntrl;
 	struct mhi_ep_chan *mhi_chan = mhi_dev->dl_chan;
 	struct device *dev = &mhi_chan->mhi_dev->dev;
 	struct mhi_ep_buf_info buf_info = {};
+	struct mhi_ep_buf_tx *tx = NULL;
 	struct mhi_ring_element *el;
 	size_t buf_left, read_offset;
 	struct mhi_ep_ring *ring;
 	size_t tr_len;
 	u32 tre_len;
+	bool queued = false;
 	int ret;
 
+	if (aggregate) {
+		tx = kzalloc_obj(*tx, GFP_KERNEL);
+		if (!tx)
+			return -ENOMEM;
+
+		tx->mhi_dev = mhi_dev;
+		tx->buf = cb_buf;
+		refcount_set(&tx->pending, 1);
+		spin_lock_init(&tx->lock);
+	}
+
 	buf_left = len;
 	ring = &mhi_cntrl->mhi_chan[mhi_chan->chan].ring;
 
@@ -576,8 +647,14 @@ static int mhi_ep_queue(struct mhi_ep_device *mhi_dev, void *buf, size_t len,
 		buf_info.dev_addr = buf + read_offset;
 		buf_info.host_addr = MHI_TRE_DATA_GET_PTR(el);
 		buf_info.size = tr_len;
-		buf_info.cb = mhi_ep_buf_completion;
-		buf_info.cb_buf = cb_buf;
+		if (tx) {
+			refcount_inc(&tx->pending);
+			buf_info.cb = mhi_ep_buf_completion;
+			buf_info.cb_buf = tx;
+		} else {
+			buf_info.cb = mhi_ep_skb_completion;
+			buf_info.cb_buf = cb_buf;
+		}
 		buf_info.mhi_dev = mhi_dev;
 
 		/*
@@ -595,9 +672,12 @@ static int mhi_ep_queue(struct mhi_ep_device *mhi_dev, void *buf, size_t len,
 		ret = mhi_cntrl->write_async(mhi_cntrl, &buf_info);
 		if (ret) {
 			dev_err(dev, "Error writing to the channel\n");
+			if (tx)
+				refcount_dec(&tx->pending);
 			goto err_exit;
 		}
 
+		queued = true;
 		buf_left -= tr_len;
 
 		/*
@@ -609,23 +689,42 @@ static int mhi_ep_queue(struct mhi_ep_device *mhi_dev, void *buf, size_t len,
 
 	mutex_unlock(&mhi_chan->lock);
 
+	if (tx) {
+		tx->queued = true;
+		mhi_ep_buf_tx_put(tx, 0, 0);
+	}
+
 	return 0;
 
 err_exit:
 	mutex_unlock(&mhi_chan->lock);
 
+	if (tx) {
+		if (queued) {
+			unsigned long flags;
+
+			spin_lock_irqsave(&tx->lock, flags);
+			tx->queued = true;
+			tx->status = ret;
+			spin_unlock_irqrestore(&tx->lock, flags);
+			ret = 0;
+		}
+
+		mhi_ep_buf_tx_put(tx, 0, 0);
+	}
+
 	return ret;
 }
 
 int mhi_ep_queue_skb(struct mhi_ep_device *mhi_dev, struct sk_buff *skb)
 {
-	return mhi_ep_queue(mhi_dev, skb->data, skb->len, skb);
+	return mhi_ep_queue(mhi_dev, skb->data, skb->len, skb, false);
 }
 EXPORT_SYMBOL_GPL(mhi_ep_queue_skb);
 
 int mhi_ep_queue_buf(struct mhi_ep_device *mhi_dev, void *buf, size_t len)
 {
-	return mhi_ep_queue(mhi_dev, buf, len, buf);
+	return mhi_ep_queue(mhi_dev, buf, len, buf, true);
 }
 EXPORT_SYMBOL_GPL(mhi_ep_queue_buf);
 
diff --git a/include/linux/mhi_ep.h b/include/linux/mhi_ep.h
index 852f331f03fd..ac4f484373ee 100644
--- a/include/linux/mhi_ep.h
+++ b/include/linux/mhi_ep.h
@@ -307,16 +307,19 @@ int mhi_ep_queue_skb(struct mhi_ep_device *mhi_dev, struct sk_buff *skb);
 /**
  * mhi_ep_queue_buf - Transfer buffer contents to host over MHI Endpoint
  * @mhi_dev: Device associated with the DL channel
- * @buf: Buffer to be queued. On success, ownership passes to the MHI stack;
- *       the caller must not free @buf until the DL transfer callback fires
- *       with result->buf_addr equal to @buf. On failure, the caller retains
- *       ownership and must free @buf.
- *       Note: if @len spans multiple host DL TREs, the DL transfer callback
- *       fires once per TRE, each time with result->buf_addr equal to @buf.
+ * @buf: Buffer to be queued. If at least one TRE is queued, ownership passes
+ *       to the MHI stack and the DL transfer callback fires once after all
+ *       queued TREs complete, with result->buf_addr equal to @buf and
+ *       result->bytes_xferd equal to the total completed bytes. If queuing
+ *       fails before any TRE is accepted, the caller retains ownership.
+ *       A failure after a TRE has been accepted is reported through
+ *       result->transaction_status in the callback.
  * @len: Size of the buffer
  *
- * Return: 0 if the buffer contents have been transferred successfully, a
- * negative error code otherwise.
+ * Return: 0 if one or more TREs were accepted, including when a later TRE
+ * submission fails. In that case, the callback reports the error after all
+ * accepted TREs complete. A negative error code is returned if no TRE was
+ * accepted and no callback will be issued.
  */
 int mhi_ep_queue_buf(struct mhi_ep_device *mhi_dev, void *buf, size_t len);
 
-- 
2.56.0

