Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 995F63E763E
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 07:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791961291; cv=none; b=Yv7eiuRkseEF+WkSj8dhxa0aNL06ZJlfyuDtq2h6baYTeK713NqXwQ10BX2rnFXHrMdJP5cTHxrLymWo9XYDTWX8C6iftvII+rG4eHX6fQT4tGcjQGHoi3iPzl+LQLd+WKK2/mp2SmV6ruowkbi1PoSwmCafZDnOvyG8mZetbGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791961291; c=relaxed/simple;
	bh=3vWOkcUbqG9vCsH47NKvAW/YkUVt+P7mpIwWyeSSXK4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pJc1yBa/GH2dT4361YAYLo4lfklfbqXUrn5DDJloJTbeuie22zw48AeScXLLkvl7T0Vih5z6ecdpPkKqZlTcNd71v58OshVve9M1ZwCvuDqWIuRAF3ix96Ru2xR3Cb1/r7ok9xg02HU7tXGXEowT5knzKg8PKPMIPjsk54c1QFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CWY5R57B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c4oLKYTn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CWY5R57B";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c4oLKYTn"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E1KTVv3018226
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 07:01:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=tyUA7QEAvMm
	55ogS9BkNCuz/w9UcxKy13H7UKICnJdM=; b=CWY5R57B57GoAC5ZuOAJr0I2k+A
	yS4Ar043Vnw3xymcZ6lZHqNN4s2e2+o/bn9ETRjn0YrfvGLkKOBawDSuDAwUiJXL
	e7OX2fe02S+M3OwbtdAKghwyHp5cv2VuuutKC2RQxWOTAgyu7vLiDZo3XaNSv4Zh
	WnyoMPz+SWVhshF3GKF7vIzdqSKv8pRZylwlScGEf7fr3NftQyHjywXgfPrArdR/
	9tlv4TdOqRAg0dc4BmZco7RqMQ2q9ij0XD3XazASOPSGRoCDKwTEWklcoAktnKCJ
	lRdow6wMRYHHP5s4ZJyvngDnYKrr3zlg0ojTyLRnHYVP64v/yP89w0HD8PA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9s2b2x43-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 07:01:29 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ab7f1efe5dso1170965a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 00:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791961287; x=1792566087; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tyUA7QEAvMm55ogS9BkNCuz/w9UcxKy13H7UKICnJdM=;
        b=c4oLKYTnEFmeWvehoI4rJVFQL2NpNzLcr306c3EeniGeGCZrcF6KoEX1v5zBHjDcPo
         wtcomgG7BHvTD+G3fMTahgrVJWmXibM7BN+RmBEhlxYG0VWrup5dlOsb8RyaxndLL5cT
         hCX7HtaSHPc6V14n8X5wjMICeXjz8tbcdFnikEMs6lnuCW8qDcPYipm7fOeAZ5Ebt75L
         gc4YPlWXJg5p/icKM9W/x0Hl0XvmJaCkGIQrf9sRKjrYjHG71n9W2lQiLD5qtPasNmjF
         1bR7PxNttd3wUVKjTXXC8qx6vVlqUDG71C0pAmsfGH+d4+X7tNuE6KKc/4LFY5KcB93L
         Qllw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791961287; x=1792566087;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tyUA7QEAvMm55ogS9BkNCuz/w9UcxKy13H7UKICnJdM=;
        b=s1b1NfdcD4Tjquq7kZpmevwpU3mUVqzCQNaFejNuy0FLmI8nji2cYIc8QYCBb+h+CH
         DLzhP2emsBs55Da68QVf1NgWBjySOsR8Zg4JwDUKDdnObieGTgy6VzQ7x+1G+a5gFnYt
         fsdon71+yYXyPwMFGvvvw6gtae98K58ZwsrR9FH2AVrqvCh4iy95tDNX84yuMvLE35+/
         qlzbexxC8NI8wagXYkvfPrGicDQTWSwd8pyjhOuajOosWTMY3abYmGyY3sjcPLjjUdn8
         TAgK2kLXF6dKbSGNw19cxnXgGcBcr4UByYjP9DhQCJYJmHpIC4MMdtNZsbzBuE9Wrfqd
         aJfA==
X-Forwarded-Encrypted: i=1; AKwUvBwTY/Aq9SWuJIz2lnZBSLUt/72m7tnqmrX2P0Hdo1oSIE25KmDj81Q0kr+h0aBmQSDNQ2y3urAuxZezkybi@vger.kernel.org
X-Gm-Message-State: AFq9FYK9CJF0QB7o0X+XZKM/GJVXWs9LkzMchqNWtmdWP0SrZx1XForx
	0bsNqxL+3SN957gSaOVgGpRp1q0jQFHXu6MYWNgnsIUmEySGYlDZ74H2WWny9QW+Q0Q4srK5hbr
	UakPBN2XcaW8x8hpkazFxSO+PUt4WQPMg4+nTxPNxCjpXyTZDvj9XsOgseiiYtMsA+G1B
X-Gm-Gg: AYBFou27x0LhsGZiulpuwC8GNAQwvcnm0QcAbQJ11YBbtz99fG8tBwmCk/AEHB5iGnh
	07BRKO+WWbLmkirV+aa/TbVtHbTpGU0z7actGkn/42KyYkCF/o1jDDq75hwxxdEJI1A/oU80YKI
	JF164TN9WXsF/oxMTOuMS4o3CXbpTfJqIyysfcriUJGwxohn3l7jnK7AzBcL1lnJ1pudhErvKq/
	qNxlYYafi5eD9PySWo/YGEwXIxvdPHMdsoOzZdhPU6TiYXiNWsqQYq207jkkoGFPUf0kSyD8cen
	hdZOY2tqYkL5O/t5jaB7zmJ0gPB1SXNFRTt9wrsKz7bRyAf0AYXAbgCc6eq8RJnBh2Ivst5doWV
	ZJQAfEHrAzll3m0IzI4pNmUB7Aj7+06xStptZ37MtmW5KKrM4AiWEkqIF8tA=
X-Received: by 2002:a17:90a:d2ce:b0:3a4:97ea:f0da with SMTP id 98e67ed59e1d1-3ab3a735fbcmr12025177a91.17.1791961286953;
        Wed, 14 Oct 2026 00:01:26 -0700 (PDT)
X-Received: by 2002:a17:90a:d2ce:b0:3a4:97ea:f0da with SMTP id 98e67ed59e1d1-3ab3a735fbcmr12025155a91.17.1791961286418;
        Wed, 14 Oct 2026 00:01:26 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac77441306sm444568a91.2.2026.10.14.00.01.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 00:01:21 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v3 1/2] remoteproc: qcom: pas: Decide early_boot attach at probe time
Date: Wed, 14 Oct 2026 15:00:37 +0800
Message-ID: <20261014070038.564879-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261014070038.564879-1-shengchao.guo@oss.qualcomm.com>
References: <20261014070038.564879-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=RPQmjIi+ c=1 sm=1 tr=0 ts=6acf28c9 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=WnWnooUoZOtDcxsU7t4A:9 a=mQ_c8vxmzFEMiUWkPHU9:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: Cm-98zFyDTrvC19kIzlY-t9huow6-UPk
X-Proofpoint-ORIG-GUID: Cm-98zFyDTrvC19kIzlY-t9huow6-UPk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAyNyBTYWx0ZWRfX3pak2486CpU+
 8ALkLhT3Ig89yuoXQ64swr/6jqJGazOidy7h7P3HMKZJm6QOKOLUKgbdBTztCHFesBXgCfFBYys
 pE3smtp6Gw8EVwdlA+mg7MPJlDNx1DSs4+8wVXl4psTRE9JW4U645++QVtxznqFpZl8IK2/i66y
 zXjEg1sb3S2XHTdBxwu/yPo/T5JEWwn34H/I1AndCrZbARB2EVkbAmbyGGQtvphNu+jk3Fo/3sk
 fsa+ktDs2A+1dn5uPFvD0EJx0MHkvxumARbHjlXy9sFBsMGQB30K9Z6k9z0jYrXepHcs5HU1dsv
 7AiAVnMlA32hswwq8qFiEw3AZsZMiVsjbks6AqFYPMh+qEhlx6jSvjLWuiGZFq/adKWg3OfVYCc
 f6RHd+bCm2ABZwgv/YoPlDAYxXSu/RfmLFsB9bSuS621mIWs91ORhneWHP7tIn8DZrg7P9hPiEP
 HbCTUI3CT9ThKeT1RNQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAyNyBTYWx0ZWRfXzg2+URYzsu2K
 vDDJEZZOFVmZhQ3TMw3nKLwg8LfZIA0rEJvw81d0WBX8fq6NT1E6+jGTKYShYd+hbpcjGleBO+V
 xU8P/v6q6jqC7yDDAXslGgPQihA66pY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140027

For early_boot subsystems, probe unconditionally marks the rproc
RPROC_DETACHED and qcom_pas_attach() discovers from SMP2P whether the
bootloader actually started the remote. If it did not, attach sets the
state back to RPROC_OFFLINE and fails, expecting the core to boot the
firmware instead. The core does not do that: rproc_boot() treats the
attach failure as fatal and the remote is never started.

This is hit on Nord with firmware where XBL no longer brings ADSP out
of reset. The remote never publishes its inbound SMP2P entries, so the
very first state read fails (debug print below) and the ADSP stays down:

  qcom_q6v5_pas 4c00000.remoteproc: Failed to get fatal_irq state: -19
  remoteproc remoteproc0: can't attach to rproc adsp: -19

The ready, stop-ack and sysmon shutdown-ack signals cannot change while
Linux has not yet interacted with the remote, so there is no reason to
defer the decision to attach time. Check them in probe and only mark
the rproc RPROC_DETACHED when the remote is up and has not been asked
to stop; otherwise leave it RPROC_OFFLINE so the regular firmware boot
path is taken. The ready state is read first so that a missing SMP2P
entry -ENODEV is treated as "not running" before sysmon is queried.

qcom_pas_attach() keeps only the fatal check, since that is the one
signal that has to be acted upon once the rproc is attached.

Assisted-by: LLM
Reviewed-by: Stephan Gerhold <stephan.gerhold@linaro.org>
Fixes: 16472c99f469 ("remoteproc: qcom: pas: Add late attach support for subsystems")
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 64 +++++++++++++++---------------
 1 file changed, 33 insertions(+), 31 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 2e1e39826ffa..89450cbdb1ee 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -550,9 +550,7 @@ static unsigned long qcom_pas_panic(struct rproc *rproc)
 static int qcom_pas_attach(struct rproc *rproc)
 {
 	struct qcom_pas *pas = rproc->priv;
-	bool ready_state;
 	bool crash_state;
-	bool stop_state;
 	int ret;
 
 	pas->q6v5.handover_issued = true;
@@ -570,42 +568,46 @@ static int qcom_pas_attach(struct rproc *rproc)
 		goto disable_running;
 	}
 
-	ret = irq_get_irqchip_state(pas->q6v5.stop_irq,
-				    IRQCHIP_STATE_LINE_LEVEL, &stop_state);
-	if (ret)
-		goto disable_running;
-
-	if (stop_state || qcom_sysmon_shutdown_irq_state(pas->sysmon)) {
-		dev_info(pas->dev, "Subsystem found stop state set. Falling back to start.\n");
-		goto unroll_attach;
-	}
-
-	ret = irq_get_irqchip_state(pas->q6v5.ready_irq,
-				    IRQCHIP_STATE_LINE_LEVEL, &ready_state);
-	if (ret)
-		goto disable_running;
-
-	if (unlikely(!ready_state)) {
-		/*
-		 * The bootloader may not support early boot, mark the state as
-		 * RPROC_OFFLINE so that the PAS driver can load the firmware and
-		 * start the remoteproc.
-		 */
-		dev_err(pas->dev, "Failed to get subsystem ready interrupt\n");
-		goto unroll_attach;
-	}
-
 	return 0;
 
-unroll_attach:
-	pas->rproc->state = RPROC_OFFLINE;
-	ret = -EINVAL;
 disable_running:
 	pas->q6v5.running = false;
 
 	return ret;
 }
 
+/*
+ * The bootloader may or may not have started the subsystem. Inspect the
+ * SMP2P state, which is static until Linux interacts with the remote, to
+ * decide whether to attach or to load and start the firmware.
+ */
+static bool qcom_pas_is_running(struct qcom_pas *pas)
+{
+	bool ready_state;
+	bool stop_state;
+	int ret;
+
+	/*
+	 * Check ready first: if the remote never published its SMP2P
+	 * entries the state read fails with -ENODEV.
+	 */
+	ret = irq_get_irqchip_state(pas->q6v5.ready_irq,
+				    IRQCHIP_STATE_LINE_LEVEL, &ready_state);
+	if (ret || !ready_state) {
+		dev_info(pas->dev, "Subsystem not running, not attaching\n");
+		return false;
+	}
+
+	ret = irq_get_irqchip_state(pas->q6v5.stop_irq,
+				    IRQCHIP_STATE_LINE_LEVEL, &stop_state);
+	if (ret || stop_state || qcom_sysmon_shutdown_irq_state(pas->sysmon)) {
+		dev_info(pas->dev, "Subsystem has stop state set, not attaching\n");
+		return false;
+	}
+
+	return true;
+}
+
 static void qcom_pas_coredump(struct rproc *rproc)
 {
 	struct qcom_pas *pas = rproc->priv;
@@ -1024,7 +1026,7 @@ static int qcom_pas_probe(struct platform_device *pdev)
 	if (pas->dtb_pas_id)
 		pas->dtb_pas_ctx->use_tzmem = desc->needs_tzmem || rproc->has_iommu;
 
-	if (desc->early_boot)
+	if (desc->early_boot && qcom_pas_is_running(pas))
 		pas->rproc->state = RPROC_DETACHED;
 
 	ret = qcom_pas_setup_tmd(pas, desc);
-- 
2.43.0

