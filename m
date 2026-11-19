Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795055368;
	b=BY0uRu3Z8p8mrrN6fJXVHGr6o5qbXr9Sovdq3X19dkexhUEXuAFuZaTfBlZxssN0yKmq
	 oYZ8SKVL5xB029NmNVWK9QULFWuzJ6vw4+lBF2THaiFNRJK9Rcv3l1hGmK0mU0NG+Z8z6
	 KUNl2mVywDGl5gMu4oqqB0TnZFnkr47LGgu6nHGNkAIcalvUDBmjIGKJNnZqJLh13H6hl
	 ftL+Grg4eEOPVle45PCbx9WJfWXRSBb6sQDlUSOb/kOuBtgp4lB3VsEXyFFD04bpuBgH/
	 9jBtoseU8agW7P3HJvlmB1KbwopN67u+JHNJ0st8roz2qh9YBFtjy8CbP/QqrvovJCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795055368;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=C3K0E2vNrzLhMfNcPaWTZ4EGNNKVe3QGEsiFAnE9hUA=;
	b=kCwMkP4jC1dyjriaTS7nDbksht9n1aPGLYZ1fcKZi2Zdw1rtWoYUQbhI2167hRdzMcOV
	 iIrju/mhlQt4gFzekycLkh9fC3flVVQ78kBO0j57zwDPDHNtZYzJRoPV+LJUOyfI3P4pp
	 NfNOS1xM276CTUh86PV5H9Wfi2A1/8IUUsh1K9ykRdZrOvuQCYNjkCSwRKhHbTjXLm4by
	 +kp2CzwPIfhdbOb4PfnDKBdUjX11IBNmL6q3lYBCu+H7OZWZiSsBAtjtKWHtSryO7221G
	 /nSAyKEvf+Ov/NBLp96hZkQAlR81DYC5ZVnlT34NPDYaDC64JKJ1SKzSpx/hB7ymapA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hfkO1mZZ;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 378DD606A32C
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 02:29:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 378DD606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hfkO1mZZ
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-380b40319bdso2588417eec.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 18:29:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795055366; x=1795660166; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C3K0E2vNrzLhMfNcPaWTZ4EGNNKVe3QGEsiFAnE9hUA=;
        b=hfkO1mZZ/vfSVEhMG8cg64y1lwb1AfkeHi11N20zxxDaPgnVnAFBH+n1Zsrt5HGnH5
         uYqCZ3hYtJITao6yK5H3aekaW1/42+V+jW+j6tXzKLWNFCKe6CVvEDgAy6yWH8BjFM4D
         BrYruSStdYXcpkFi+0Pr8Q76rmMGEv/8d75NiBbr6pL1rsJWdbYZJWqoNCe2/MHqt0xQ
         0MTAv0/9uY46bLu8qB4qLmwE0F92BhnhgkCYtXxXN4Db/rf9Ob0oGV5r/qqW0qOYCphC
         mOt8P3zA4lYfGO5hsFMumh7fsKBMcFn2eoLPawnH9XbBysyTI6wvLtAmnuKRVuNx3zvQ
         WBuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795055366; x=1795660166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=C3K0E2vNrzLhMfNcPaWTZ4EGNNKVe3QGEsiFAnE9hUA=;
        b=JB1iwz771xRm8GMUaDcnRaNLu45Xfk2F0smTMccgfLe9fP9vDHZKqUzG1FjAhSE+Tk
         kRsz4PWfWOpufjUzHHZV7qxxlbucsr9BiyJM7CAiTrqrK+Idr4O8RKKCi5xYZGGp1c6a
         zp1cbPnOdWvWsSfn+w6rbkLuMqA2zpD5EOpakUOEEG+bi9MWS2UvU9FmAt8tgd6n1Rve
         2Vu08NAupYKzB7NUX77i/Z4keczZNjUvWmDLCg3lug0zuZTBhPGeK3kUjeViWGp7v57f
         UmcE2ucS0AR4qHsTWT8M0dBXs9X9o8Hru1KUPGzkQ2iQSoCkTGyrrzPot7GbFPv+xXuD
         CbYw==
X-Forwarded-Encrypted: i=1; AL+hErHPspTCjNmP+Iog4VyuAO6YehZKb2kYsEiinjTVoWiZEd1QxYkg4QWS/YPTHX5WfbiN+z+H4HIQqeG6KID2@vger.kernel.org
X-Gm-Message-State: APuU4Z+Hf0qFLzjAfzOpV0IlwS/BlpYhiNI0tYWEVup6xxnl+iFj6a0g
	sGP86x85nVtHLlLQrFGCaXJVt2n4tCsYg5faIAl/bK6PHvFxYXMlpmi0
X-Gm-Gg: AZFdTZcuJh4op0FaBQEUE8wOqMoxDbzNcKzL5XyDR8+rnXLMMcVjK3x3BaZCc1M7u5T
	dl+ePdQuR6wcUvZeq0GC0dJwq8MLU/qPU6LbkXDLV2UznzaKhIu863Vr1DjEPua4vxJBUIe8qA7
	s5yFjEG8xLtbhwLfrGALIimqBIsbNkUEPVoE0XhnXJiOuV9+ACS2kRmtqMBJh+kmfVJ+9an0rBt
	xgIsh4lLQ27wd37djhhvjjPtAtmBKSmEIt1dwVflfI7CRu0nS6enG6axUEhgVINtMNZeEng59Hq
	8ijcmrls3gi2JTbFF8PMdGMNWThzm+wsbt+vP8Cb03KLnuh/myVppkC9nl0cwnugzWtRlOsusuR
	wn+ImMelVoQbcQZhzLPlr79dGiLTZpgFY8pdQxnOfkod2i+dZ9jDrLsXyB+qFHenmyoIe724mKn
	7GdRdXzQIDSSXmSuh6dMjm134ydloDgQeTejWH/u6mQrsERxs0qWeXjqmfOwVRgewPRC4EWza9b
	YGNLc0IZC0qdYj1u8xCY+6n5iQKRENt3q27qxlfiAGyMr0WQyRceixcrLT4NrKOxdlyXw8gpTDM
	UdpzXVuZWfNO360myVu8D7P0+m4oxpR2Ratu6p4cAItxYQaWr/CPGq0BGHzOd2PIIHWGtWpyTz7
	SnZ3ILyR2nOBvHw5IQ3eG6c+/yAEX4nNJy+wPj5JP
X-Received: by 2002:a05:7301:fd84:b0:384:7a8f:3bc1 with SMTP id 5a478bee46e88-3847a8f4f1cmr130310eec.17.1795055365946;
        Wed, 18 Nov 2026 18:29:25 -0800 (PST)
Received: from lwq-System-Product-Name.. ([2602:feda:30:cafe:ec49:38a8:0:f6])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a79c96b2sm13193964eec.24.2026.11.18.18.29.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 18:29:25 -0800 (PST)
From: Yaohan Li <shunsheng1218@gmail.com>
To: jeff.hugo@oss.qualcomm.com,
	ogabbay@kernel.org
Cc: carl.vanderlip@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	jacek.lawrynowicz@linux.intel.com
Subject: [PATCH v2] accel/qaic: drain the control workqueue before the device is freed
Date: Thu, 19 Nov 2026 10:29:19 +0800
Message-Id: <20261119022919.1493567-1-shunsheng1218@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261118072448.1259909-1-shunsheng1218@gmail.com>
References: <20261118072448.1259909-1-shunsheng1218@gmail.com>
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

qaic_pci_remove() tears the MHI controller down and destroys the DRM
device, but nothing drains qdev->cntl_wq.  qdev itself is allocated with
devm_kzalloc_flex() and is freed as soon as the PCI device is unbound,
while cntl_wq is a DRM-managed resource that survives until the last
open file drops its reference to the DRM device.

resp_work is queued from qaic_mhi_dl_xfer_cb() and resp_worker()
dereferences qdev, so a work item that is still queued, or still
running, when the driver instance goes away touches freed memory.

mhi_power_down() moves the controller to the shutdown state, disables
the interrupt and flushes the state worker that destroys the channel
devices, and mhi_unregister_controller() removes the controller, so no
data event can reach qaic_mhi_dl_xfer_cb() once
qaic_mhi_free_controller() has returned.  Flushing the workqueue after
it therefore covers every work item that can still be queued.

Fixes: 22ec9a3b73dd ("accel/qaic: Leverage DRM managed APIs to release resources")
Signed-off-by: Yaohan Li <shunsheng1218@gmail.com>

---
Prepared against v7.4-rc1-1969-g666539eecdf4.

Compile tested only: arm64, aarch64-linux-gnu-gcc 11.4, CONFIG_DRM_ACCEL=y and
CONFIG_DRM_ACCEL_QAIC=m.  No hardware was available, so the removal path was
not exercised and no race injection was run.

AI assistance: prepared with Claude (Anthropic) as a coding assistant; the
author reviewed the reasoning and takes responsibility for the content.

Changes in v2:
 - Correct Fixes: to 22ec9a3b73dd, the commit that moved the device release
   to DRM managed resources.  No code change.
---
 drivers/accel/qaic/qaic_drv.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/accel/qaic/qaic_drv.c b/drivers/accel/qaic/qaic_drv.c
index 90c0d31e414a..c4c3f450e67b 100644
--- a/drivers/accel/qaic/qaic_drv.c
+++ b/drivers/accel/qaic/qaic_drv.c
@@ -625,6 +625,15 @@ static void qaic_pci_remove(struct pci_dev *pdev)
 
 	qaic_dev_reset_clean_local_state(qdev);
 	qaic_mhi_free_controller(qdev->mhi_cntrl, link_up);
+
+	/*
+	 * The control channel is gone, so nothing can queue resp_work any
+	 * more.  Drain it before qdev is freed: the workqueue belongs to the
+	 * DRM device and may outlive this driver instance, and resp_worker()
+	 * dereferences qdev.
+	 */
+	flush_workqueue(qdev->cntl_wq);
+
 	qaic_destroy_drm_device(qdev, QAIC_NO_PARTITION);
 }
 
-- 
2.34.1

