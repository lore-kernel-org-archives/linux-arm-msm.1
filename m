Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9BA32D3727
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Sep 2026 05:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788933539; cv=none; b=tDsD+4DbB184canvMS+Kt2eijVqtcc8cV68c2s9uHNA/jnxYGj2yZsTB8WHty4FmeHfnm6SVMHkiXe+ylR1JdWMOk7HyVRw4MKU+DUtwQQniIHhtTXgL1nTYhia/ULNH/xgaJuuNAzjgIj+G5siTNEV2jYkwjv+nZuomReC+Fbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788933539; c=relaxed/simple;
	bh=j2/rpIMHlyvQBXpjp1UnZyA6EtxR2Hk238RofMuM6Xw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HrsjL1ebqpiawVmBmrQu2y8BTUSl3HeuWgo31k+gLHPLu8Ore6Cd5MHOOegv4Y7BjX6r7VsV0bw/Qnq3W7foyjKv/POu/e4a+R+o5eTI6EJO6CgVBA6B4gR6j3I0aGL/5LXTSBYrHLxYoaIgUshR6COXsns8TMcxLAmlQ0zw3hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org; spf=pass smtp.mailfrom=quora.org; dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b=OnXI7OVG; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quora.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b="OnXI7OVG"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-398c1101c1bso5207661a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 22:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quora.org; s=google; t=1788933538; x=1789538338; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2Yn17EsWeham9YF5uu/47qEPWL8ZeqKrd9IKLrIGf7Q=;
        b=OnXI7OVGQbhpEUM44aG8PSXmuYnpzluuIJl/fsDdBsTnML0AtWzJbw/aqty++I+bRT
         ufON8P2Sd+zRQbCBhUDHmynMWunDi4m2G8yg0DzT/SSV9cc0Kjwho1LWlTGIBbpMt0j4
         nBQORs+cW6Cxg4/9o8fDjGyEdF8ie+HRvTT+g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788933538; x=1789538338;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2Yn17EsWeham9YF5uu/47qEPWL8ZeqKrd9IKLrIGf7Q=;
        b=PBJsmEREjaxyaRDcUYNDqh5NG0wbknbhcXo9KA/LeIx1f/Rtrrw4cTxImzp397uYWC
         ef75mDgkrb3xzGgXUdcixMM8G7T+j51uXJnf0mja1pjZU0ACbtEMq3bwA22qUOAhcSiD
         OJ7Sv5T2GqXnRXIeWXFtFZhNuBqIi6BlFJXdrSHnWudWOZvHUQhUGqqyKPQ2Knj5FCTI
         C/vSlC7pUg+yVxp1FIrTK1l655SqaXi4YNIJeZNe6Bqa1swx/9wXnwwik/o8JkpGzfep
         LXaEqJsObOGCgrJ+KWFnXYQmy6W8JJicR9wt1aDlbGonrReqvBciSCAg9JneZgyp1j/l
         t7ZA==
X-Forwarded-Encrypted: i=1; AKwUvBweAWo+GQNitIAD7EDQuSyHQdmzSJmTDwzV3KXKrkHqotUeUDm+CxGipInaRtudJqBaecLyQngliv+fnf0E@vger.kernel.org
X-Gm-Message-State: AFuF++n58eKb3vdapQTmjzbRz3Y+KNTjLdIS4BPLlEwinAgXXLpN4nl9
	JxlbRaFvoDLwJNAuBOz+yN09C44UkcixRpIhPKxgB7DlQkFiTCxAWtwyON7XAYXp44k=
X-Gm-Gg: AYBFou2d1P1Tt2U3C8NfSXzAfdF6CXeFEfLc3L/ZKcxoXLVQtDRhWuuciIvAUvGZ44y
	Ox71H8o/lxRrSrZpO6SKIV916uXvAH/AV7j2/gd3rhjHJe3TX/xAmEeGBkXwQNLwkwji++5WcLs
	QN3xqzITs6n+Arr2RyInB26x5wSOV1soz9iKAVv4zNUuPBKdYN3DjPiAswbwJ1+2ZI53N7UWlWt
	HMK90883dXxIXUhZLfwbGwAClas8pMvhiq5BNyAxAIvCfE7koCKSN/1/RihhkfBVVkQZETqvgZA
	jlHTDXAFEvdjTKYvRJ10DTiOLQhXu2aJtOyxTcybm5PfGijDgDv1nulY5AVvum2LRkzGbWyJU+y
	262575GU2FD4sCyq5ri+/JePrIIox8FAJL/uOsBqPtCpcTKWUVtCa8av7vGRV383zeKCmAT0OK9
	G7fdqtb7Sra6cSgx2Kd0OSleeiol98CHbBOGNiZAuWqfciYUlYtM70mV+oMs1god1bg9SJSAkq8
	m+kzkx1liU9zkpoFsRpIYfndfDzsPNNqaZkny3hqdVHb8jE1+HkaOPPdgZhVhYCkbiPoU2xGPPF
	nyeMbYam8/Idt9xiCYQlSex8AtmVGsS3NmhVZdFSA14xd+YmHMNWdUJPHhlB5DV847dDdRGAL8a
	o3YVE2LnXnZ1adLDj0L2/zExwFntjMTBCqd5EkHKE
X-Received: by 2002:a17:90b:3809:b0:396:4dfb:5890 with SMTP id 98e67ed59e1d1-39b260d333amr51199234a91.2.1788933537932;
        Tue, 08 Sep 2026 22:58:57 -0700 (PDT)
Received: from aegis ([175.158.204.89])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d6538acc3sm1290927a91.6.2026.09.08.22.58.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 22:58:57 -0700 (PDT)
From: Daniel J Blueman <daniel@quora.org>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Chris Lew <christopher.lew@oss.qualcomm.com>,
	Pranav Mahesh Phansalkar <pranav.phansalkar@oss.qualcomm.com>,
	Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Daniel J Blueman <daniel@quora.org>
Subject: [PATCH] net: qrtr: resend HELLO on MHI resume
Date: Wed,  9 Sep 2026 13:58:44 +0800
Message-ID: <20260909055846.16539-1-daniel@quora.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since the MHI HELLO exchange was relocated, it is sent only at device
registration. During a suspend-resume cycle, the firmware in WiFi
cards such as WCN7850 indefinitely waits for another HELLO,
triggering:

  ath12k_wifi7_pci 0004:01:00.0: timeout while waiting for restart complete
  ath12k_wifi7_pci 0004:01:00.0: failed to resume core: -110

Fix this by triggering the handshake from resume_early in the MHI
transport.

Validated on Qualcomm X1E-801800 on Lenovo Slim 7x across 10
suspend-resume cycles.

Fixes: 544d85de4dc2 ("net: qrtr: Send HELLO message on endpoint register")
Signed-off-by: Daniel J Blueman <daniel@quora.org>
---
 net/qrtr/af_qrtr.c | 13 +++++++++++++
 net/qrtr/mhi.c     | 10 +++++++++-
 net/qrtr/qrtr.h    |  2 ++
 3 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/net/qrtr/af_qrtr.c b/net/qrtr/af_qrtr.c
index 78347c937af7..2ffcfc2fdb4a 100644
--- a/net/qrtr/af_qrtr.c
+++ b/net/qrtr/af_qrtr.c
@@ -623,6 +623,19 @@ static void qrtr_hello_work(struct work_struct *work)
 	qrtr_port_put(ctrl);
 }
 
+/* Trigger the HELLO handshake after the remote has been reset, eg on resume */
+void qrtr_endpoint_hello(struct qrtr_endpoint *ep)
+{
+	struct qrtr_node *node = ep->node;
+
+	mutex_lock(&node->ep_lock);
+	node->hello_sent = false;
+	mutex_unlock(&node->ep_lock);
+
+	schedule_delayed_work(&node->say_hello, 0);
+}
+EXPORT_SYMBOL_GPL(qrtr_endpoint_hello);
+
 /**
  * qrtr_endpoint_register() - register a new endpoint
  * @ep: endpoint to register
diff --git a/net/qrtr/mhi.c b/net/qrtr/mhi.c
index 3990da1a65dc..50326ffa3401 100644
--- a/net/qrtr/mhi.c
+++ b/net/qrtr/mhi.c
@@ -183,6 +183,7 @@ static int __maybe_unused qcom_mhi_qrtr_pm_suspend_late(struct device *dev)
 static int __maybe_unused qcom_mhi_qrtr_pm_resume_early(struct device *dev)
 {
 	struct mhi_device *mhi_dev = container_of(dev, struct mhi_device, dev);
+	struct qrtr_mhi_dev *qdev = dev_get_drvdata(dev);
 	enum mhi_state state;
 	int rc;
 
@@ -201,7 +201,13 @@ static int __maybe_unused qcom_mhi_qrtr_pm_resume_early(struct device *dev)
 		return rc;
 	}
 
-	return qcom_mhi_qrtr_queue_dl_buffers(mhi_dev);
+	rc = qcom_mhi_qrtr_queue_dl_buffers(mhi_dev);
+	if (rc)
+		return rc;
+
+	qrtr_endpoint_hello(&qdev->ep);
+
+	return 0;
 }
 
 static const struct dev_pm_ops qcom_mhi_qrtr_pm_ops = {
diff --git a/net/qrtr/qrtr.h b/net/qrtr/qrtr.h
index 3f2d28696062..de2de69a6199 100644
--- a/net/qrtr/qrtr.h
+++ b/net/qrtr/qrtr.h
@@ -27,6 +27,8 @@ int qrtr_endpoint_register(struct qrtr_endpoint *ep, unsigned int nid);
 
 void qrtr_endpoint_unregister(struct qrtr_endpoint *ep);
 
+void qrtr_endpoint_hello(struct qrtr_endpoint *ep);
+
 int qrtr_endpoint_post(struct qrtr_endpoint *ep, const void *data, size_t len);
 
 int qrtr_ns_init(void);
-- 
2.53.0

