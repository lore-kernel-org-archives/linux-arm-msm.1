Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72D5B31F998
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 03:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787197926; cv=none; b=OwItnArngOv2T9rVYtlmvhBVIgHzT+RCvjG4GQzt2JkywomYfDYMbdRCWEGPXPEIEqHWn857DfuwtJCodrkMmlWEsVUCWPMsDx64Bm2wBKnwSb5hONINmfw905OCvsBo+vn7pBHXkVKB5+e0Qx9A2YRvc037wzjuREIGB3b1PRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787197926; c=relaxed/simple;
	bh=ZE0OJci76iEQ1GXLsuLZQWBaeAjM+OZJDtn91PyfsX0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UTSfWfI/4Tw5hkak0NGaD9WLgvDybDnxU6OcObDTpklURe+CN7dlTyBl7X9KXNrcUFr0nfEX5N4GcEOf5ZUSkMqbOrbspldFGJeh1Zht5JHChSNoJZcDT8Wz0L8uWmC0av68X7myeFKFRM+QK/egXC9UutJEcmoEFZCQRhFirW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ntek0JOI; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ntek0JOI"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-38f0f132f56so360355a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 20:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787197925; x=1787802725; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KA+AUIbVaWxQpOluVrHrv+vKLDBCDRYBbSYFdOolEgE=;
        b=Ntek0JOIhZq+I+cYgYLATNmTebwbJjCnRKpjMdtXCzU5joDUh1luljF7zNCsEj0nRq
         9qFFohzuolEpMXin0KdVnTCBgeD/m/ZtIj93fwyt4oq9Qgt66fnhTyBRA5IROnVKMhIk
         OW9cgGmOZHFVjjybPUxzogXHBtTS7pq+D5lZuw38I74ZerPM2W5E8PXsDZASgeLoPeYM
         hLl++1zAmvRfd+xrl4biPhUEeHJfmn++owzHZhR3OihnUxcWHJMcu+exje72OKp8aghZ
         kgtK3AB6XnW6l+QD4DyLQLZLpU6brVryYPZA/5hgxB71basjXGuIyNJwQd3lfFlqLZlH
         xcDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787197925; x=1787802725;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KA+AUIbVaWxQpOluVrHrv+vKLDBCDRYBbSYFdOolEgE=;
        b=GAOV3IJunGsr+Ci0Cdq9sqD28TUrtYZeYqz4/n3kj8psKcQ5Me2Te70wbBcvufUgHp
         GGZDTMH8QD0h5lZY2cSFvToj4apNPHTyWPLGwCBoaRgi1u07gSVBV7IISf9bREWzCFmR
         JH8wGtQqRDjFBQnXSLEgceHmdjn7czx1Y1xnLY4G/3oNMT9BPzlMPvpcbBR7utMD11mH
         PB/XUMbOcBSnLd+BnRCdUGoFl+FYEmY5Bs9zziV3W2XCp8oNqGYvsDozEJ1PX/nOYwPf
         bwnzFLWyfg3taAaMKbbFbtmCJ9cUpKKPZ/T1R569wU+OQNk3zJFFpL571hoMz5w6rl/I
         VNsg==
X-Forwarded-Encrypted: i=1; AHgh+Rr/FdnQB7RI9JHYPX8MLJrJS8HhYE/WTykM6pl6dYarkkta3SXBYEPZuyG1jZLSWMPEaA89hIasSJnpeiv9@vger.kernel.org
X-Gm-Message-State: AFuF++lSJEhtD4N0dGcVmTH+XoaX6qvIpwO5Z8q6hLoR+Jtq166KREun
	5OtVC1Li13zRYFjZgByfDcZja/4n02rwWrf9HvThXaiam3lmGft9t53/
X-Gm-Gg: AR+sD11zJ+Z6gB4craISzCAoYREL6oDKicQTX6dHRUuQFm8MDVdh8q+FNYK73u7OZ2Y
	F8wcwfaRs95yx9lPn2hP3FAXhC3c+EKC/nw+wSh+pE97DgstlnVqBdkrF4oRCTE5ICMsmyTgVeW
	NpqwBSbHj6dZtqBS33Ze/JB133OKRc31wK+pmhBCDQ6t+FQjFIm0st7GiJnWy6HM00x1uU3Jlwj
	GKgBU6QwMRh7S+VTN8VPzjE2S0xIWEsmZIR3dHRvqhCXewCiEcq0TqrfQdl+DKL+vNOAXB5Pqw6
	UJabYQ8EHd5CdPQY0CHhfCDORMiU1EKVaMZ/R4Q4jApUALWceidjONaTwrGoy5v8QEesoJZQEuH
	mz7ywjpPfSfl+TdAwrR/FMDBB8WBKyQUgdN+3A3dWsd8mMJ4n0AmQkRvmy0jCfz/SiG7KhQnk37
	Aw0xTIFrjHwkM2mQOL6fhU+ulgw0VCJF7HR87MiS4LHeWURSQ27o8SoZf9Z1YJ
X-Received: by 2002:a17:90b:394f:b0:38e:9ca8:e99 with SMTP id 98e67ed59e1d1-395a05f2a2fmr3825195a91.5.1787197924735;
        Wed, 19 Aug 2026 20:52:04 -0700 (PDT)
Received: from kdev.. ([108.180.130.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3957f9ad013sm4853843a91.7.2026.08.19.20.52.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 20:52:04 -0700 (PDT)
From: Babanpreet Singh <bbnpreetsingh@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Vinod Koul <vkoul@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Babanpreet Singh <bbnpreetsingh@gmail.com>
Subject: [PATCH] slimbus: qcom-ngd-ctrl: Release the TX descriptor on error paths
Date: Thu, 20 Aug 2026 03:52:03 +0000
Message-ID: <20260820035203.7-1-bbnpreetsingh@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

qcom_slim_ngd_xfer_msg() leaks the claimed TX descriptor on two error
paths; QCOM_SLIM_NGD_DESC_NUM such failures fill the ring for good and
every later transfer fails with -ENOMEM. Give the descriptor back.

Fixes: 917809e2280b ("slimbus: ngd: Add qcom SLIMBus NGD driver")
Fixes: 52490169cddf ("slimbus: ngd: add stream support")
Assisted-by: claude-opus-5
Signed-off-by: Babanpreet Singh <bbnpreetsingh@gmail.com>
---
 drivers/slimbus/qcom-ngd-ctrl.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
index 3071e46d03bea..697811b2c1e97 100644
--- a/drivers/slimbus/qcom-ngd-ctrl.c
+++ b/drivers/slimbus/qcom-ngd-ctrl.c
@@ -546,6 +546,25 @@ static u32 *qcom_slim_ngd_tx_msg_get(struct qcom_slim_ngd_ctrl *ctrl, int len,
 	return desc->base;
 }
 
+/*
+ * Give back a descriptor obtained from qcom_slim_ngd_tx_msg_get() that will
+ * not be submitted to the DMA engine.
+ *
+ * The ring is accounted by count rather than by index: tx_tail counts the
+ * descriptors handed out and tx_head the ones the controller is finished
+ * with, and qcom_slim_ngd_tx_msg_dma_cb() is the only other place that
+ * advances tx_head. A descriptor that is never posted therefore has to
+ * advance it here, or the ring loses that slot for good.
+ */
+static void qcom_slim_ngd_tx_msg_put(struct qcom_slim_ngd_ctrl *ctrl)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&ctrl->tx_buf_lock, flags);
+	ctrl->tx_head = (ctrl->tx_head + 1) % QCOM_SLIM_NGD_DESC_NUM;
+	spin_unlock_irqrestore(&ctrl->tx_buf_lock, flags);
+}
+
 static void qcom_slim_ngd_tx_msg_dma_cb(void *args)
 {
 	struct qcom_slim_ngd_dma_desc *desc = args;
@@ -848,6 +867,7 @@ static int qcom_slim_ngd_xfer_msg(struct slim_controller *sctrl,
 		ret = slim_alloc_txn_tid(sctrl, txn);
 		if (ret) {
 			dev_err(ctrl->dev, "Unable to allocate TID\n");
+			qcom_slim_ngd_tx_msg_put(ctrl);
 			return ret;
 		}
 
@@ -887,6 +907,7 @@ static int qcom_slim_ngd_xfer_msg(struct slim_controller *sctrl,
 	mutex_lock(&ctrl->tx_lock);
 	ret = qcom_slim_ngd_tx_msg_post(ctrl, pbuf, txn->rl);
 	if (ret) {
+		qcom_slim_ngd_tx_msg_put(ctrl);
 		mutex_unlock(&ctrl->tx_lock);
 		return ret;
 	}
-- 
2.43.0

