Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A55F340416
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 02:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785466684; cv=none; b=SYy/smVsr1gHvwFCdA8txqFNB9UwwubMfNmI1BirjQ3sC8LX3V6N+SlTtm4YCn0y5Cw0HVPama5q9cPe9pfz83AXLjeJoaVZhhrBugxBUc1Mzw5Mxwf2c/+zazi4ynQVwcXeM+06lOljmv4G+FsD9rlmAD6LFV330nElNJaq9E4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785466684; c=relaxed/simple;
	bh=1HHCXQe0C3d+iNiV0NrY9YBbMRp/LYW6A+MfF4P77BI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lFu9YD39bgmb5QhmKuxpCbn3f0OPxbonOmK+hzLnXuPZNc0FgBXprGnQaJjaVOiMioy3YOV/Obxsy5EZTcr7XfojaMQfGkCcgaFKdemCQzdXtl1AdO1PkueEhu71d7j2uGozs06t7o11T6dV9ag8PIzX4AVStLrzRgX/MmVpXiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bb9anXoK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z2FEctM7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bb9anXoK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z2FEctM7"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66V2LDrE2645626
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 02:58:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=8Noa/PSXBZI
	kBi6Z2fWL+n39a3H2u8qSgQfPCHK8uOo=; b=bb9anXoKVS0p8aY4c738TEPrPa8
	V6Gn5vrFi67BJggz2qyEEAjZlTLRfVTAHoZlWUXjcAD15yJWua24tOeGY2nhrUfa
	wG3Cx3f0wr2iIW5GPA6NnNHrYO11hcZWmfa8jNML+AdhBsSgYdCyMq3zeex9HFi/
	BMMwYqFaRQbZEpkKELxh3QHK6mZH/9NUlREAiJeSalFkIaKtibLBVIwGJsLoQQA7
	avj2xkxPxmUWT+fI5zZtVV28g5n4eo4hKqlQVh3L5cjEMa5xCI7vPOG8dZkNtQ/X
	QgEUmmcjo0z2uPHond130oiYFe9x94FuIehjZRZBvVwbXI0MhH3pVciDvfw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frjuk83cn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 02:57:59 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38edd45cbc4so522612a91.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 19:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785466637; x=1786071437; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8Noa/PSXBZIkBi6Z2fWL+n39a3H2u8qSgQfPCHK8uOo=;
        b=Z2FEctM7WNnIFbk5r54xkxxdd/gdT5BtQ5s5dCqtdbPk0RZUabBaiTSjosQaX6lU26
         /F+BjDtrkUDj0MfjKJnom53cYqGgK1AThnVxoI+YeCORAVeaqOd24ceyLBzjhQTpGYqA
         cIlWiPV0V41Z/ROa219cceLfXIVm08aBs6aaCH3/GLPXsKtHWrJeTJQRUC2veYrmoxfH
         9R2bDYw9yffiuYnmzNG3cnikTJlx5L4uYiCU4ZCaEUg9FYno87CT23QHy9C1aRF1syVJ
         jhRgLxXJSaHyca+TZujQi0ut5A2z3bIZSgBIm55AUg/tGc+QipoXMyBAqwv4rB1lTZN+
         cgbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785466637; x=1786071437;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8Noa/PSXBZIkBi6Z2fWL+n39a3H2u8qSgQfPCHK8uOo=;
        b=JUi/uft1JaEu6OZf0m1mWpeGOUThp+nEyC5enNxNQkJF6TaKFNxiPhWUSjffjYUiPV
         7L2JIkZWP2cCx1X2oEyRl0Ufl/fKn4r8VHJ0g2C8ARFL7MhnUDcf7Urr3Batag+OEwKW
         60CStrEA/EnlOfEWgB54OY6W1NIxX3f83XMS8x/mtZ/1dwobWsin8gKvYq/n12tW9f43
         Zj5HgTXf4eTCeHfc4vSbQis9bus+4w1qm+TDmIqe9Vk+L4OrFpKFdDzmwVUb+/SCWjCN
         ToLVVXzGAdneu+IIvrZTFPnPg7ZjdtC++pvygTTSpoTTpWwDGadxt1GECGzToWMFNwli
         RLFQ==
X-Forwarded-Encrypted: i=1; AHgh+RoHStpss+8qMKoJPU9KMs4V6v2vgjfNSMkh3LEv8k9fo3YNXaJzw4bQKBsesG8eZv88TH0A8aI4f3bRHbcn@vger.kernel.org
X-Gm-Message-State: AOJu0YzKfXh55cUQSU+Gdrittmi0lQxi5sXszPe4OgeVgvxR3OwV43ry
	nBoCBca/7XYxr6LQ3svTIyHejLU5NLBRW7T83KFsgkoMawofhUY6qyZnxau3wFUOd8Hf9eJViSk
	8Hp6kHNuO35Wz/L+mBDpXElmIeDSGn9slJgCtpKZriRfyYf9Mg+fYzVP5GNz3+KuqA6PPeTptc4
	2L
X-Gm-Gg: AR+sD11KT9LvJlptLlbO+/LurGdylvjdW1PPPdzd7kWzuHyb9VVcQuh+lj/dfjW+4Fr
	RvJI7KRP1y04ON/4zaHkJc2u1TP8L4Nyou1X5W4jB4lWQ/qpqcBLr5j1osxFBRvNiVdA0Edk3Et
	q1oWv4zyci7gWXBG80k5upyyl/Yr+LSeu2GjSD3OpQNXQM8Z16yU/3SSzBSKw265c8+PUQvMVSz
	HwXsELDNUdUY4Y65NWz5ZisboYjVvjMa6OrVmgIZMm7CndJEaoFIf4vFFXKQ1FmXOyVjao57liD
	U66KihHek1oTr1BrgcFO2MaHNR8DFZGqTaSmD2uPdt/gGTjjqQIq1CPoPYkbEiOumlj4hZ6OQ0n
	luVFxUppV0pKCNkg+0fm1eCkxnAwPgKXuVQA9+j82QePAw3b9goxATia6HSUg
X-Received: by 2002:a17:90b:2ec8:b0:37f:fda5:8d9a with SMTP id 98e67ed59e1d1-38fb1392505mr296205a91.25.1785466636559;
        Thu, 30 Jul 2026 19:57:16 -0700 (PDT)
X-Received: by 2002:a17:90b:2ec8:b0:37f:fda5:8d9a with SMTP id 98e67ed59e1d1-38fb1392505mr296187a91.25.1785466636037;
        Thu, 30 Jul 2026 19:57:16 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fa748fbc6sm558519c88.8.2026.07.30.19.57.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 19:57:15 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 1/2] remoteproc: qcom: q6v5_pas: Fix unbalanced handover IRQ enable on attach
Date: Fri, 31 Jul 2026 10:56:53 +0800
Message-ID: <20260731025655.2642860-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260731025655.2642860-1-shengchao.guo@oss.qualcomm.com>
References: <20260731025655.2642860-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDAxNiBTYWx0ZWRfX6xFBTyQFW+0k
 JzKvCM0U2TTWcTTEwSxpTS64SAeiXlH9SKIkF9EMJwOkprGq8QYxiAnYAN4XuipZvRykgMcug22
 O3OYocA+bmLHpBwW3PvM7QB4ylEiThs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDAxNiBTYWx0ZWRfX7SWR5G9cmwWJ
 MJTuscOptQASDeYnFB2UE70UQMDmAf7R3FCxF/HeQFBjwGBzwdUSlFfx0sDO11P+QerR8WA8dfu
 ZSdn7Z/OzDn3Fr85Kd4svEkVNucULMGHqoGV86gn/XyNJ0lFm9IfxAsTQFGSX+GdEaNhV2f2h6M
 R7yAhyw8N7fGE7PiJ0vggTmz9PMLT5Mi9LWoVpKTlmCGG1AK6K7Rx/JEnyhc19HiC3nOOQguI4E
 mM9XM5k8V/9Z9mRTfTmkCFsWqNZ8Bo/ISq9KXcBEp+izdC1jHGR+jIE/Wau14Pj6vhpxrcfoikx
 BLv46gX+cMTy9ebvt7TwlEFfutuMSDLjbN24+Q2ok4avST0/k8wN+kO5+Sr16C8EZoMrLTG8+yD
 vHt6nz4TPplHlQ9fTs2/jQhqjgXPJchIkb1TINE6xJBgdbolOKU05JhQVwPApFHP9oIRsGa7uh6
 MZ/3ZUhOViDDA6lvY7A==
X-Proofpoint-GUID: SDedIx3cz_uC7ZMtrkwwylSJcugMHzlD
X-Proofpoint-ORIG-GUID: SDedIx3cz_uC7ZMtrkwwylSJcugMHzlD
X-Authority-Analysis: v=2.4 cv=bbRbluPB c=1 sm=1 tr=0 ts=6a6c0f38 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=VxEfS49kFKWyPJpONhUA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_01,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 impostorscore=0 suspectscore=0 clxscore=1015
 spamscore=0 adultscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310016

commit bb7c5d6f5b41 ("remoteproc: qcom: q6v5: Make handover IRQ
one-shot") introduced tracked, idempotent enable/disable helpers for
the handover IRQ, gated on a new q6v5->handover_irq_enabled flag. It
converted qcom_q6v5_prepare()/unprepare() and the handover ISR to use
these helpers, but missed qcom_pas_attach(), which still toggles the
IRQ directly via enable_irq()/disable_irq() without updating the
tracked state.

This desyncs the real IRQ enable depth from handover_irq_enabled for
any remoteproc that boots up already attached (e.g. ADSP started by
the bootloader). qcom_pas_attach()'s raw enable_irq() leaves the IRQ
enabled while handover_irq_enabled stays false, so a subsequent
stop's qcom_q6v5_unprepare() sees the flag as false and skips
disabling the IRQ. The next start's qcom_q6v5_prepare() then calls
enable_irq() on an IRQ that was never disabled, producing:

  WARNING: Unbalanced enable for IRQ ...

Additionally, any handover interrupt latched by hardware before probe
and delivered once qcom_pas_attach() unmasks it is no longer
suppressed (the ISR's early-return-if-already-issued guard was
replaced by irq disable-after-first-fire), so it runs the handover
callback and disables proxy power-domains/clocks that attach() never
enabled, causing genpd runtime PM usage-count underflow warnings.

Route qcom_pas_attach()'s IRQ handling through the same
qcom_q6v5_handover_irq_enable()/qcom_q6v5_handover_irq_disable()
helpers (now exported) used elsewhere, keeping handover_irq_enabled
in sync with the real IRQ state.

Fixes: bb7c5d6f5b41 ("remoteproc: qcom: q6v5: Make handover IRQ one-shot")
Assisted-by: Claude:claude-sonnet-5
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5.c     | 21 ++++++++++++++++-----
 drivers/remoteproc/qcom_q6v5.h     |  2 ++
 drivers/remoteproc/qcom_q6v5_pas.c |  4 ++--
 3 files changed, 20 insertions(+), 7 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5.c b/drivers/remoteproc/qcom_q6v5.c
index fe148b4b3775..10fa38f264c8 100644
--- a/drivers/remoteproc/qcom_q6v5.c
+++ b/drivers/remoteproc/qcom_q6v5.c
@@ -36,7 +36,11 @@ static int q6v5_load_state_toggle(struct qcom_q6v5 *q6v5, bool enable)
 	return ret;
 }
 
-static void q6v5_handover_irq_enable(struct qcom_q6v5 *q6v5)
+/**
+ * qcom_q6v5_handover_irq_enable() - idempotently enable the handover IRQ
+ * @q6v5:	reference to qcom_q6v5 context
+ */
+void qcom_q6v5_handover_irq_enable(struct qcom_q6v5 *q6v5)
 {
 	unsigned long flags;
 	bool enable = false;
@@ -51,8 +55,14 @@ static void q6v5_handover_irq_enable(struct qcom_q6v5 *q6v5)
 	if (enable)
 		enable_irq(q6v5->handover_irq);
 }
+EXPORT_SYMBOL_GPL(qcom_q6v5_handover_irq_enable);
 
-static void q6v5_handover_irq_disable(struct qcom_q6v5 *q6v5, bool sync)
+/**
+ * qcom_q6v5_handover_irq_disable() - idempotently disable the handover IRQ
+ * @q6v5:	reference to qcom_q6v5 context
+ * @sync:	whether to synchronize against an in-flight handler
+ */
+void qcom_q6v5_handover_irq_disable(struct qcom_q6v5 *q6v5, bool sync)
 {
 	unsigned long flags;
 	bool disable = false;
@@ -69,6 +79,7 @@ static void q6v5_handover_irq_disable(struct qcom_q6v5 *q6v5, bool sync)
 	if (sync)
 		synchronize_irq(q6v5->handover_irq);
 }
+EXPORT_SYMBOL_GPL(qcom_q6v5_handover_irq_disable);
 
 /**
  * qcom_q6v5_prepare() - reinitialize the qcom_q6v5 context before start
@@ -98,7 +109,7 @@ int qcom_q6v5_prepare(struct qcom_q6v5 *q6v5)
 	q6v5->running = true;
 	q6v5->handover_issued = false;
 
-	q6v5_handover_irq_enable(q6v5);
+	qcom_q6v5_handover_irq_enable(q6v5);
 
 	return 0;
 }
@@ -112,7 +123,7 @@ EXPORT_SYMBOL_GPL(qcom_q6v5_prepare);
  */
 int qcom_q6v5_unprepare(struct qcom_q6v5 *q6v5)
 {
-	q6v5_handover_irq_disable(q6v5, true);
+	qcom_q6v5_handover_irq_disable(q6v5, true);
 
 	q6v5_load_state_toggle(q6v5, false);
 
@@ -201,7 +212,7 @@ static irqreturn_t q6v5_handover_interrupt(int irq, void *data)
 
 	q6v5->handover_issued = true;
 
-	q6v5_handover_irq_disable(q6v5, false);
+	qcom_q6v5_handover_irq_disable(q6v5, false);
 
 	if (q6v5->handover)
 		q6v5->handover(q6v5);
diff --git a/drivers/remoteproc/qcom_q6v5.h b/drivers/remoteproc/qcom_q6v5.h
index 8991ff090579..24263cb514ab 100644
--- a/drivers/remoteproc/qcom_q6v5.h
+++ b/drivers/remoteproc/qcom_q6v5.h
@@ -53,6 +53,8 @@ void qcom_q6v5_deinit(struct qcom_q6v5 *q6v5);
 
 int qcom_q6v5_prepare(struct qcom_q6v5 *q6v5);
 int qcom_q6v5_unprepare(struct qcom_q6v5 *q6v5);
+void qcom_q6v5_handover_irq_enable(struct qcom_q6v5 *q6v5);
+void qcom_q6v5_handover_irq_disable(struct qcom_q6v5 *q6v5, bool sync);
 int qcom_q6v5_request_stop(struct qcom_q6v5 *q6v5, struct qcom_sysmon *sysmon);
 int qcom_q6v5_wait_for_start(struct qcom_q6v5 *q6v5, int timeout);
 unsigned long qcom_q6v5_panic(struct qcom_q6v5 *q6v5);
diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index a4b233d92efb..0f1ffd4b6182 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -521,7 +521,7 @@ static int qcom_pas_attach(struct rproc *rproc)
 	int ret;
 
 	pas->q6v5.handover_issued = true;
-	enable_irq(pas->q6v5.handover_irq);
+	qcom_q6v5_handover_irq_enable(&pas->q6v5);
 
 	pas->q6v5.running = true;
 	ret = irq_get_irqchip_state(pas->q6v5.fatal_irq,
@@ -567,7 +567,7 @@ static int qcom_pas_attach(struct rproc *rproc)
 	pas->rproc->state = RPROC_OFFLINE;
 	ret = -EINVAL;
 disable_running:
-	disable_irq(pas->q6v5.handover_irq);
+	qcom_q6v5_handover_irq_disable(&pas->q6v5, true);
 	pas->q6v5.running = false;
 
 	return ret;
-- 
2.43.0

