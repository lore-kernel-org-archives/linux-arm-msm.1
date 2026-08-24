Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BD773EC808
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 07:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787555166; cv=none; b=kjD6DSHJz2vEqdX2ks/+nzXSYDXqBAmeYjkA7gSMg1dqT7IwNk1JPpbIJ4eAUIMekkfpm9HnSuXYXjxW5fjDOn1DBfqniXUS04jQiAdu7OiaCJcxZa+acwSS3/2436yBjpBGg5k3JWGYVQVYN//k8tVFgKMKNuvp8X9mRDdu2RM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787555166; c=relaxed/simple;
	bh=7GMn7+pY4NrOqBGNfEhN/wEFhTlvXdgKNBf0GUDbwNM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FQ2vwwbuZqTi9+pq7de5jCMiZYw7ePXpyreZZYe6oLl7VI5yXAOkAL6ZA7SWN9CypVzNHrPQ/v+aADUSGzuZjSAkAa2XMCHOorvnUZCespsIw+hjUftRFbfoqMrEsrHrwMImU7hJBJR1+MdK5QVPFHCKAsU2UaeBf2rcc8BtNmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AI5PdXYX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LkFcXQAJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AI5PdXYX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LkFcXQAJ"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O5REl32602034
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 07:06:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tAcnAbP32S5gpYPX5Og5xiDNjJ/HxZkg1tijhne6rng=; b=AI5PdXYXjFQBmbMn
	+St0RY6BMbHSllvHlm+jhhTXTySQsNKlDltcXL0lR+wPfOw+6BhA8BhIIYzGNNbR
	gkQdHxHpjasuBbVnbbMiDh918rOdEZGUKE1gyIYKNB/X8Zr4IH1DylMTp23FShQo
	GDusAIW0kKXn3PsMnROxPhprmpdG3GtKu5mOQuREkffUZmMyL2KP20tt4X0MAvXD
	LrFBmQLXzwMQxbZoiC0RaVg1AONhNxU4cKyYVXQMI1tMT5QKdSmCnydhzGylSQnF
	QWqFWSU+P1YHWMTxH3dONpzfuhFrFlKX/nUA7ljH3QM5AYAXzJINdPKD4NsXdv7V
	LHjpNQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g744wwnjw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 07:06:03 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84e4ef9a74aso2027126b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 00:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787555162; x=1788159962; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tAcnAbP32S5gpYPX5Og5xiDNjJ/HxZkg1tijhne6rng=;
        b=LkFcXQAJIsY4xZDLWFIV/MfAbF29gAB5U0dYhI/8WKMGHijJFnFNfDEt1lccrdWJW7
         65yeX+qPZNE0pA5rLo4019pfvD3yxxfGGaXVNkZZIcnREZl4alYmtKbCdlTbFrZZlU5M
         NqK1yol4iVq5kZt15eyXr/ybJZk8FPLWOPnpLmjnOb/flAWJr/F+LbUxICdmF7FuDBx1
         eYImbdAx4x92H/ivmtHH9IWLzdvv0hDDaU69pdYy4tGvGjgD3kD9ut2pJG9yehv+XH9o
         FhtdepSTStjK8LlBCeW83o8I2g0S+eova5BzjiPcj9UEzHtLrERVdbK1fn0jHNId8/Qa
         rXKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787555162; x=1788159962;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tAcnAbP32S5gpYPX5Og5xiDNjJ/HxZkg1tijhne6rng=;
        b=j3cX+1wWfEvgrsc/IYa9vs+cyZENIk0m0ev9tp6ufAyHYniWlymiRFdOYnToZAwGHG
         6QHlOSNL+toq61dxul0+W4yHF1oUBth9yiuVRYsJfZyKsS2ojTUTiRgY7BBi0cJtDlN8
         QdJHx8VbxZnsCTVpActhnRzooOBBvK4EMScBB1BLyDCMbxsfd2AWnR3l1H7IQtNlAhKF
         /UEbjKEy5g8rSPIrvV8qO+fLuaTbP+nXPUzu2nK0Z9oftY9HEPTTIpL/QEQZg2qfZ6/f
         KpcaLr2NJy9/sWwHaQUEnzyBqMEOYRkLhNJL/PeKX36R5MLMpjgA3Wl63r67+54Z9nMy
         MALQ==
X-Forwarded-Encrypted: i=1; AHgh+RpfLzhaQ9v/FWqx9JaLACw+pncCYrqBOn2/UYBxsgXen7P7WZ1ZyUIJgdmxsJXOBLcXifvlOpcG+Oc7dncz@vger.kernel.org
X-Gm-Message-State: AFuF++kjmCItxGfdfRDnKnL0zmDJo61FpSZlarYjJY7ErFKKANlEluZE
	JQGGWlVRuEV/wTl9fZThlHbUX6vhl8v61OJrDDnuzDd7dh+XyDW0AkFCst4fgEgt3XQf7EsiP/6
	LNkg1o2u6H42CeqdaV1AidIpjAKhsgBodM45c4PFbiG4mVxXkmrXv2j8+2cQM+UNrwczK
X-Gm-Gg: AR+sD12HcT+8vHYNcawON+MeSFzj8obF51rHumv8xRpAa6lZexeQuUXM2Pbch3I/+ur
	Y75bqU+tFkWj8vL37nS9laYy2MjBoQR41fsCVlK+VBPnANSpWu3DLvWjJMVvesqOFgK6OpW6oCL
	/qklESXV4Wwk+PRKFa1vWOWIbXhReznYFY9p67BBXWQ/Max0jGiYO39sopdctyMkEYDGgYPDk2O
	PkVC2i5xEtYuFtz9LyFVZDlPMXxmkqsbhiC1QTpyik/V9EKoXS8ACRb1W+kj8FoPDhK+DLccae8
	grEdlmLfygDamstv+1k0yuW0nCRs7yFCLb14v/+CjQFfLUhw4U1VCHomJ/2wDZMmKLTDvyWopAU
	zXdZRcsnzOwcHw+9lQG432yrSkfJPku/nBDcy4awSeXsXRgxFOF8lZSc=
X-Received: by 2002:a05:6a00:ba8d:b0:82f:50cd:e586 with SMTP id d2e1a72fcca58-851fa018939mr42280445b3a.13.1787555162119;
        Mon, 24 Aug 2026 00:06:02 -0700 (PDT)
X-Received: by 2002:a05:6a00:ba8d:b0:82f:50cd:e586 with SMTP id d2e1a72fcca58-851fa018939mr42280353b3a.13.1787555161644;
        Mon, 24 Aug 2026 00:06:01 -0700 (PDT)
Received: from hu-chunkaid-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8520f149ef3sm1642178b3a.41.2026.08.24.00.05.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 00:06:00 -0700 (PDT)
From: Chunkai Deng <chunkai.deng@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 00:05:53 -0700
Subject: [PATCH v2 1/2] rpmsg: glink: Split protocol start out of
 native_probe
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-rpmsg-glink-split-protocol-start-v2-1-362d7c233f66@oss.qualcomm.com>
References: <20260824-rpmsg-glink-split-protocol-start-v2-0-362d7c233f66@oss.qualcomm.com>
In-Reply-To: <20260824-rpmsg-glink-split-protocol-start-v2-0-362d7c233f66@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, chris.lew@oss.qualcomm.com,
        tony.truong@oss.qualcomm.com, tao.zhang1@oss.qualcomm.com,
        peter.chen@oss.qualcomm.com,
        Chunkai Deng <chunkai.deng@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787555157; l=4229;
 i=chunkai.deng@oss.qualcomm.com; s=20260604; h=from:subject:message-id;
 bh=7GMn7+pY4NrOqBGNfEhN/wEFhTlvXdgKNBf0GUDbwNM=;
 b=TdL9EzepQjh26r3EHeZ4Ev45MZucLOUINRa9RkYJJo/ADsyjONx8PJKx5zc/9EHN0Y5WZQaz8
 /pZ/mLtlGN0BrsvqTSuPOrpaYdVtiIMgi/jcGoPku6LCL1ZIb3trsly
X-Developer-Key: i=chunkai.deng@oss.qualcomm.com; a=ed25519;
 pk=wWxCpsJRKQeVRzpZ8GLRnUX6ozLMowqE3hiz/j+j9O8=
X-Proofpoint-ORIG-GUID: Kz6L3RvO-lNHwJI6Tgj8QViPVQLmcsJT
X-Proofpoint-GUID: Kz6L3RvO-lNHwJI6Tgj8QViPVQLmcsJT
X-Authority-Analysis: v=2.4 cv=KuF9H2WN c=1 sm=1 tr=0 ts=6a8bed5c cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=DdSiwBDnyMY8Rz7v4E0A:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA2MCBTYWx0ZWRfXytAZUKzQuSOp
 nAnRQRW+6gOJVaYDm+xEytDhhm8xFyOuRXscgRC1quGI0twKQyB1vyJqgUCAxpPLQZClJQF/O/d
 Ui5VUzTuHSSzdlIJDCaDT6A8wD3amis+Cs3Hg7j9DhTmDvg/veSD46EEMfZE3/jaLQdeIlVfVUp
 0dWMHeSDB9hwXOduJC5oQ/EHC36S45x5rqn35uE7Vmrb5eyrfAyVbq/hMWWaJBi9FMeFsBI8Z7j
 L/+RZtFks8K82n7fsRqnF5eO6fpcBK4rWDwDoCIHeAsPs4/824ev95lyR06NbPKwnFKB16LlAZs
 1WOOZ9g+pWr7ghvvqWwEXhwx2r1raO8BHlu2UUaNCMHsgkIm5m+KZDEUFQ28XpheKISCgOQSsKS
 fslXFMGk9dEgk/4nrcGz7X818dbBnCMcvuecDd87rHyaZ3W0MU6tE8qERnOOYi8ecFLk+Iyo2Q8
 7C6MdtZZ1ndISlPnkbg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA2MCBTYWx0ZWRfX9cXQ/cSh5+U3
 hEaCzH3b5JZVe3B1DGDLLMPdD8TW1QQgEUzsh2J4DMG+ey7VKgWIRuJTNsI0RIDR/E+PtAFF8c3
 Z88uQBoj24Skq7PJ8TlCr/nvePUs71w=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240060

The SMEM and RPM transports request their receive interrupt with
IRQF_NO_AUTOEN and enable it only once qcom_glink_native_probe() has
returned. But native_probe() sends the version command, so on a fast
remote the version ACK can land while the interrupt is still masked. The
ACK is dropped and the handshake never completes.

Move the version command and the chrdev registration into a new
qcom_glink_native_start(), leaving native_probe() to set up the glink
instance. Both transports enable their interrupt before calling
native_start().

Signed-off-by: Chunkai Deng <chunkai.deng@oss.qualcomm.com>
Assisted-by: Claude:claude-opus-5
---
 drivers/rpmsg/qcom_glink_native.c | 32 ++++++++++++++++++++++++++++----
 drivers/rpmsg/qcom_glink_native.h |  1 +
 drivers/rpmsg/qcom_glink_rpm.c    |  8 ++++++++
 drivers/rpmsg/qcom_glink_smem.c   |  8 ++++++++
 4 files changed, 45 insertions(+), 4 deletions(-)

diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
index d9d4468e4cbd..2a284b22a037 100644
--- a/drivers/rpmsg/qcom_glink_native.c
+++ b/drivers/rpmsg/qcom_glink_native.c
@@ -1928,17 +1928,41 @@ struct qcom_glink *qcom_glink_native_probe(struct device *dev,
 	if (ret)
 		dev_err(dev, "failed to add groups\n");
 
+	return glink;
+}
+EXPORT_SYMBOL_GPL(qcom_glink_native_probe);
+
+/**
+ * qcom_glink_native_start() - start the GLINK protocol handshake
+ * @glink:	glink handle returned by qcom_glink_native_probe()
+ *
+ * Send the initial version command and register the chrdev. This is split
+ * out from qcom_glink_native_probe() so that a transport can enable its
+ * receive interrupt before the version handshake is initiated, ensuring the
+ * version ACK from the remote is not missed.
+ *
+ * Failure to register the chrdev is not fatal and only logged, matching the
+ * previous behaviour of qcom_glink_native_probe().
+ *
+ * Return: 0 on success, negative errno if sending the version command failed.
+ */
+int qcom_glink_native_start(struct qcom_glink *glink)
+{
+	int ret;
+
 	ret = qcom_glink_send_version(glink);
-	if (ret)
-		return ERR_PTR(ret);
+	if (ret) {
+		dev_err(glink->dev, "failed to send version: %d\n", ret);
+		return ret;
+	}
 
 	ret = qcom_glink_create_chrdev(glink);
 	if (ret)
 		dev_err(glink->dev, "failed to register chrdev\n");
 
-	return glink;
+	return 0;
 }
-EXPORT_SYMBOL_GPL(qcom_glink_native_probe);
+EXPORT_SYMBOL_GPL(qcom_glink_native_start);
 
 static int qcom_glink_remove_device(struct device *dev, void *data)
 {
diff --git a/drivers/rpmsg/qcom_glink_native.h b/drivers/rpmsg/qcom_glink_native.h
index 8dbec24de23e..783209980c3a 100644
--- a/drivers/rpmsg/qcom_glink_native.h
+++ b/drivers/rpmsg/qcom_glink_native.h
@@ -35,6 +35,7 @@ struct qcom_glink *qcom_glink_native_probe(struct device *dev,
 					   struct qcom_glink_pipe *rx,
 					   struct qcom_glink_pipe *tx,
 					   bool intentless);
+int qcom_glink_native_start(struct qcom_glink *glink);
 void qcom_glink_native_remove(struct qcom_glink *glink);
 void qcom_glink_native_rx(struct qcom_glink *glink);
 
diff --git a/drivers/rpmsg/qcom_glink_rpm.c b/drivers/rpmsg/qcom_glink_rpm.c
index e3ba2c63a5fc..34f18c3e58c8 100644
--- a/drivers/rpmsg/qcom_glink_rpm.c
+++ b/drivers/rpmsg/qcom_glink_rpm.c
@@ -358,6 +358,14 @@ static int glink_rpm_probe(struct platform_device *pdev)
 
 	enable_irq(rpm->irq);
 
+	ret = qcom_glink_native_start(glink);
+	if (ret) {
+		disable_irq(rpm->irq);
+		qcom_glink_native_remove(glink);
+		mbox_free_channel(rpm->mbox_chan);
+		return ret;
+	}
+
 	return 0;
 }
 
diff --git a/drivers/rpmsg/qcom_glink_smem.c b/drivers/rpmsg/qcom_glink_smem.c
index 62adc4db2317..28f6cfda6352 100644
--- a/drivers/rpmsg/qcom_glink_smem.c
+++ b/drivers/rpmsg/qcom_glink_smem.c
@@ -348,8 +348,16 @@ struct qcom_glink_smem *qcom_glink_smem_register(struct device *parent,
 
 	enable_irq(smem->irq);
 
+	ret = qcom_glink_native_start(glink);
+	if (ret)
+		goto err_disable_irq;
+
 	return smem;
 
+err_disable_irq:
+	disable_irq(smem->irq);
+	qcom_glink_native_remove(glink);
+
 err_free_mbox:
 	mbox_free_channel(smem->mbox_chan);
 

-- 
2.43.0

