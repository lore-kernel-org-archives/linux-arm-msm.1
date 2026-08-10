Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF551392837
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 17:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786384352; cv=none; b=YAGEHFTu7FDUqAz2piDk02NOYcN5E87i41mhAupvSpKiFbU4iwvRVBvjdRQhq6gdRCsvUOmtEsKtjBBFwb2jkNSWXffEdnqjlu5Kzzqc4zUvhRpVBgaJmaIdOfQ9iz8BHxuLuCrqQTurqZ1mjsR8XqI6vlzv2c4IGBiQNTxVjZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786384352; c=relaxed/simple;
	bh=aliK82T6KYQxw/3hpLsCQ6N/jchY1K7iXkz58Jt/q0Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=BJQZtIBi7yZ1kGCHWbgtbuTRCKzhiZxWWj1pWFmGgUGszlIHZu6DM8+oKpG2+DyslwVLrHOVGx8UVH/SJxbdxcdrOX/cORqbn4ZGbOC4+zO8G2vMX74qmAQPdpsLyRi4xbAiuiGHipn4H4VgashIcVLEDho+Rhkag5z4KHHb3Ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JSkrgMm2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WQ5HVq6V; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JSkrgMm2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WQ5HVq6V"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67AGsMqE2164623
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 17:52:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=i2fDcHme8fEGRpxzmxPzv/
	MbcSjAJj5X4PquEbrTLtw=; b=JSkrgMm2gUmRFXNFlT/VDPDlhX7yEXYIyqtIWd
	iXM9in/JtE0lQ3G1fiR876pg9fJiBcdtIlFvm/0ekIiek5kXXDess3uxE3iDixLS
	UkWUVXuHEbUHQJi+sj3R5myS6s8D6CvirU0xnA2dpXj8FJ6Sq4Kw/IJEPYnwmJIz
	7kWwEhZAB9CiQ0eBUmFZS53xKSt5NlO9MUBNvC+SqK8pJNg4bwIdcrkWQBDFF3V/
	uDkVwP1KWPeD4unz7A4JwoG30SR+hH86AsPIQuD+VRlJ4HOnevoEaUI7rOqbzFHQ
	+Q1do41S+jB7L09beyTfetXlMW0SJF8FKg8v0Kz4wpbMkktQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fyjjv08k5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 17:52:29 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ccb6823efcso21001945ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 10:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786384349; x=1786989149; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=i2fDcHme8fEGRpxzmxPzv/MbcSjAJj5X4PquEbrTLtw=;
        b=WQ5HVq6V+QerZmzfnEQHs9YWX5L8BEtAUWS+oBwNbCnLsl5Im9u8nvUH4cY1NIvub7
         67HBbQa59nCWIkdgwFdRKvNqBwEyifDrHq58MoCqV3NWLUchMkA7ewPzc8YWD/aYq5zm
         QdM7qAWuYIs67uyNJrZP2nlCcS0k1yHc25Z3O1CdfJ5VNvb0LmJikI2pC7qHKHtMenz1
         lqR3QxnKsOxCapj4pJp6q3gLrwk7rdL+vRQg4+n3kDBauMmW4GhbBRV2YG3aa5H+onI8
         cZXIEc3ACzwU55lH8ELRHjOkSnIsBrp7fCmJej3D9N3rX+vg17DYaq1l+s/fpuctJTb7
         1lUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786384349; x=1786989149;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=i2fDcHme8fEGRpxzmxPzv/MbcSjAJj5X4PquEbrTLtw=;
        b=EdezlwNsIJ5UiQU6Ns2VivSauaogYcFviwl8aG53QCR6stz3qIkiZDaF2Q6klRZeAO
         PZAJjCxL/ILN54pj63f1wdWTal8wUr0IhukkBsYiv1DUasO/Q2QgPngCGuG02RZFwfka
         bYz57Z9uMAcsYJeH9JNlCyhNwNGGKLUG8X6CbldNR7e3AHWo1uDczqc592uQpp1f4eRO
         rnksceFK35YNVcglY/QtFIHIRiOOaVqJ/v2m8VumMYoTYsbtm6jlGp5lEjbvnndrRpof
         kKZ4btaTf3bwUrJNgjBN1NWuFfHQqrqlQcAsTU3cgyLUe19aSP88hn2PZhDrCFe0sz/l
         lWEA==
X-Gm-Message-State: AOJu0YzGRyzyMSVQxJu/cN6DZohcT1rCdHms4xpaqBb/TJ4tekoi/qaI
	qwvVlF5itRJ1DORbLbfzbHBEnE7xGLTC1+ZTHVyOEYYLFtz841c3lRLL1F+mOJVSJ8X/2BWZnia
	U7Tgqj9I3UlNQZKOUVT1JUivKtB/w47E00rYz0oLPDKE6/PQLo2AtcKJCXAtoSUJdOP3s
X-Gm-Gg: AR+sD12/VLMCTLZFhIX2L1+n9O3///rHadM4FbPgcy+AQzIuy+VqoIY2AGL0nooV2+E
	jiu0WkKLjR/3ZAmAPYmPGOtfPQ7QQEUOpk9c2EO24kBXZyOiBiYgp7u5GlC0EcZgVUPcGQ+vmd6
	gIGUmkWGNliSZ1UwoMGP03RePTpgAhZfdGEkO78IfSbTc35ioSWKjYaaDq/T6zotTPpoWI4Co8d
	DyAcEueP1r50ZTAhwuRD3p5GsksAVKPzmY8rpsDFxhfqStXKxRWZbLHFKrvVJ9Xf2VEpO28ZL7Q
	2UWlJTQRcgDtgTwRPDVLpRQxVYmvAamzEr8VMmmPSwC0J+GKrdhs/zAwNWMAoexPEcCcv6NZJli
	KDTSQ3TRYmfIelMC+74uNkk3Mh515lNHEjSfU
X-Received: by 2002:a17:902:d985:b0:2cb:ea0b:9164 with SMTP id d9443c01a7336-2d2ffc5bd27mr41640145ad.6.1786384348528;
        Mon, 10 Aug 2026 10:52:28 -0700 (PDT)
X-Received: by 2002:a17:902:d985:b0:2cb:ea0b:9164 with SMTP id d9443c01a7336-2d2ffc5bd27mr41639385ad.6.1786384347982;
        Mon, 10 Aug 2026 10:52:27 -0700 (PDT)
Received: from hu-vdadhani-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d16c4a9f0fsm39661585ad.68.2026.08.10.10.52.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 10:52:27 -0700 (PDT)
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Date: Mon, 10 Aug 2026 23:22:19 +0530
Subject: [PATCH v2] slimbus: qcom-ngd-ctrl: Implement disable_stream
 callback
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260810-slim-disable-stream-support-v2-1-c2e8fcc3c99d@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIANIPemoC/yXMSw6CQAwA0KuQrm1Sh4/iVYiLAYrW8Jm0gzEh3
 N1Bl2/zNjBWYYNbtoHyW0yWOcGdMuiefn4wSp8MjlxFV8rRRpmwF/PtyGhR2U9oawiLRizysq4
 LOld0GSANQXmQz29v7n/b2r64i0cJ+/4FSuUpHn8AAAA=
X-Change-ID: 20260803-slim-disable-stream-support-43599401607f
To: Srinivas Kandagatla <srini@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786384345; l=5939;
 i=viken.dadhaniya@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=aliK82T6KYQxw/3hpLsCQ6N/jchY1K7iXkz58Jt/q0Q=;
 b=4ZMCst4nPrpwfjtlB9lAHMxF6N6ap7RDAup29GBOXw9/Wr3Q4zBmn1DsYX1lrDyJfD+z5zqt1
 wBCK0yAQo2hB4GI4XpS05xAthVteUc0uLOykrkISOcjpCGPQSKcdpqG
X-Developer-Key: i=viken.dadhaniya@oss.qualcomm.com; a=ed25519;
 pk=C39f+LOIGhh/02LQpT46TsUSXRvBn9qXC8Xb26KJ44Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDE1MyBTYWx0ZWRfX1y/VWe/CX2pu
 lPGlL7VjEFq5fD8lmhYKLck5zQ2hB72iX7obEZwrbeSStw4/Re60jO96IJifSkc+W3EXlYd84L9
 cj+UOcxJ+uSIIQFBJDu7p0rPCKYVClAJxIvpngKa88EdgpLK1wqnhO6f8RPYDS6btDBOCeTYykq
 vX1PjwYG8dWEk2oH+HlgfkFL3ZOmVcupO3u0cb9IYIKLh1TC6ebIZa6eEa5TmTBQL9r9LgTQXTk
 tJUU7+PHp1uVGtX0HjFcUMFKuyzkHNYv43cR0MZiVMN8lZTfotYSa75OcQB9mLyau53wx9d0Cjg
 spDov9pfIOdSQR84O6kee++4zUUU0Mjly9m8Nr6D06X9LVo2Q2hp1L/NDxDvJLtXEo7VhcUDZZ5
 y9Nf0kiB1isoWDy+7TwJMFJ+68iQ9nxzupPoV9fvWM5N8QHy8t+vXLRwWQVwhTeSLyIf7jLQKAN
 DS8g89+divA4kMVp5tg==
X-Proofpoint-ORIG-GUID: BjugUqzkwVfODs0mgogS3HW8l1gUgT6d
X-Authority-Analysis: v=2.4 cv=KLtqylFo c=1 sm=1 tr=0 ts=6a7a0fdd cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=kKA2uLVnAdZqmg0bn4kA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: BjugUqzkwVfODs0mgogS3HW8l1gUgT6d
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDE1MyBTYWx0ZWRfX/sc2IA5aOKfz
 ReTOiRoccYtDndDDgTNLaXL7INmkFYJdrFLXwNgWgLXRf6qmsHEmXR5eXcDgBu44+s75rg2Gg0g
 8dfvuABmxZMS/7y6TohSKOLUFuflUAc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_04,2026-08-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 adultscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100153

Switching a channel to a new frequency without first disabling the stream
causes the channel to be re-enabled without a clean shutdown, leading to a
crash on the DSP subsystem.

Implement qcom_slim_ngd_disable_stream() so clients can properly close a
channel before switching to a new frequency.

Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
---
Changes in v2:
- Rewrite commit description for clarity.
- Fix initializers: use { 0 } instead of {0} and {0,}.
- Use reverse christmas tree ordering for local variable declarations.
- Replace open-coded shift/mask with FIELD_PREP() and GENMASK-based defines.
- Add SLIM_MSG_HDR_LEN macro to replace magic number +4 in txn.rl assignments.
- Fix dev_err format strings: add spaces after colons and commas.
- Update enum slim_ch_control comment to kernel-doc format with @member tags.
- Link to v1: https://lore.kernel.org/linux-arm-msm/247e4ce7-1ba2-43b8-8a11-ec70f99a4fc1@linaro.org/T/#m3b50aa43a6493f8d3b607b1607b37bf14b199f69
---
 drivers/slimbus/qcom-ngd-ctrl.c | 82 ++++++++++++++++++++++++++++++++++++++++-
 drivers/slimbus/slimbus.h       | 13 +++++++
 2 files changed, 93 insertions(+), 2 deletions(-)

diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
index 934c44c5bc1a..30d6ac52072b 100644
--- a/drivers/slimbus/qcom-ngd-ctrl.c
+++ b/drivers/slimbus/qcom-ngd-ctrl.c
@@ -1,7 +1,11 @@
 // SPDX-License-Identifier: GPL-2.0
-// Copyright (c) 2011-2017, The Linux Foundation. All rights reserved.
-// Copyright (c) 2018, Linaro Limited
+/*
+ * Copyright (c) 2011-2017, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2018, Linaro Limited
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
 
+#include <linux/bitfield.h>
 #include <linux/irq.h>
 #include <linux/kernel.h>
 #include <linux/init.h>
@@ -86,6 +90,10 @@
 #define SLIM_ROOT_FREQ	24576000
 #define LADDR_RETRY	5
 
+#define SLIM_CHAN_CTRL_CMD		GENMASK(7, 6)
+#define SLIM_CHAN_CTRL_LADDR		GENMASK(4, 0)
+#define SLIM_MSG_HDR_LEN		4
+
 /* Per spec.max 40 bytes per received message */
 #define SLIM_MSGQ_BUF_LEN	40
 #define QCOM_SLIM_NGD_DESC_NUM	32
@@ -1085,6 +1093,75 @@ static int qcom_slim_ngd_enable_stream(struct slim_stream_runtime *rt)
 	return ret;
 }
 
+static int qcom_slim_ngd_disable_stream(struct slim_stream_runtime *rt)
+{
+	struct slim_device *sdev = rt->dev;
+	struct slim_controller *ctrl = sdev->ctrl;
+	struct slim_msg_txn txn = { 0 };
+	struct slim_val_inf msg = { 0 };
+	u8 wbuf[SLIM_MSGQ_BUF_LEN];
+	u8 rbuf[SLIM_MSGQ_BUF_LEN];
+	int i, ret;
+
+	txn.mt = SLIM_MSG_MT_DEST_REFERRED_USER;
+	txn.dt = SLIM_MSG_DEST_LOGICALADDR;
+	txn.la = SLIM_LA_MGR;
+	txn.ec = 0;
+	txn.msg = &msg;
+	txn.msg->num_bytes = 0;
+	txn.msg->wbuf = wbuf;
+	txn.msg->rbuf = rbuf;
+
+	for (i = 0; i < rt->num_ports; i++) {
+		struct slim_port *port = &rt->ports[i];
+
+		if (txn.msg->num_bytes == 0) {
+			wbuf[txn.msg->num_bytes++] =
+				FIELD_PREP(SLIM_CHAN_CTRL_CMD, SLIM_CH_REMOVE) |
+				FIELD_PREP(SLIM_CHAN_CTRL_LADDR, sdev->laddr);
+
+			ret = slim_alloc_txn_tid(ctrl, &txn);
+			if (ret) {
+				dev_err(&sdev->dev, "Fail to allocate TID ret:%d\n", ret);
+				return ret;
+			}
+			wbuf[txn.msg->num_bytes++] = txn.tid;
+		}
+		wbuf[txn.msg->num_bytes++] = port->ch.id;
+	}
+
+	txn.mc = SLIM_USR_MC_CHAN_CTRL;
+	txn.rl = txn.msg->num_bytes + SLIM_MSG_HDR_LEN;
+	ret = qcom_slim_ngd_xfer_msg_sync(ctrl, &txn);
+	if (ret) {
+		slim_free_txn_tid(ctrl, &txn);
+		dev_err(&sdev->dev, "TX timed out: MC: 0x%x, mt: 0x%x, laddr: 0x%x, ret: %d\n",
+			txn.mc, txn.mt, sdev->laddr, ret);
+		return ret;
+	}
+
+	txn.mc = SLIM_USR_MC_RECONFIG_NOW;
+	txn.msg->num_bytes = 2;
+	wbuf[1] = sdev->laddr;
+	txn.rl = txn.msg->num_bytes + SLIM_MSG_HDR_LEN;
+
+	ret = slim_alloc_txn_tid(ctrl, &txn);
+	if (ret) {
+		dev_err(&sdev->dev, "Fail to allocate TID ret:%d\n", ret);
+		return ret;
+	}
+
+	wbuf[0] = txn.tid;
+	ret = qcom_slim_ngd_xfer_msg_sync(ctrl, &txn);
+	if (ret) {
+		slim_free_txn_tid(ctrl, &txn);
+		dev_err(&sdev->dev, "TX timed out: MC: 0x%x, mt: 0x%x, laddr: 0x%x, ret: %d\n",
+			txn.mc, txn.mt, sdev->laddr, ret);
+	}
+
+	return ret;
+}
+
 static int qcom_slim_ngd_get_laddr(struct slim_controller *ctrl,
 				   struct slim_eaddr *ea, u8 *laddr)
 {
@@ -1624,6 +1701,7 @@ static int qcom_slim_ngd_ctrl_probe(struct platform_device *pdev)
 	ctrl->ctrl.clkgear = SLIM_MAX_CLK_GEAR;
 	ctrl->ctrl.get_laddr = qcom_slim_ngd_get_laddr;
 	ctrl->ctrl.enable_stream = qcom_slim_ngd_enable_stream;
+	ctrl->ctrl.disable_stream = qcom_slim_ngd_disable_stream;
 	ctrl->ctrl.xfer_msg = qcom_slim_ngd_xfer_msg;
 	ctrl->ctrl.wakeup = NULL;
 	ctrl->state = QCOM_SLIM_NGD_CTRL_DOWN;
diff --git a/drivers/slimbus/slimbus.h b/drivers/slimbus/slimbus.h
index 00a7f112574b..c1137e8aedf4 100644
--- a/drivers/slimbus/slimbus.h
+++ b/drivers/slimbus/slimbus.h
@@ -1,6 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 /*
  * Copyright (c) 2011-2017, The Linux Foundation
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #ifndef _DRIVERS_SLIMBUS_H
@@ -316,6 +317,18 @@ enum slim_transport_protocol {
 	SLIM_PROTO_EXT_HALF_DUP,
 };
 
+/**
+ * enum slim_ch_control: Channel control.
+ * @SLIM_CH_ACTIVATE: Schedules channel or group of channels in the TDM frame.
+ * @SLIM_CH_SUSPEND: Keeps the TDM schedule but halts data transfer.
+ * @SLIM_CH_REMOVE: Drops the channel or group from the TDM frame.
+ */
+enum slim_ch_control {
+	SLIM_CH_ACTIVATE,
+	SLIM_CH_SUSPEND,
+	SLIM_CH_REMOVE,
+};
+
 /**
  * struct slim_stream_runtime  - SLIMbus stream runtime instance
  *

---
base-commit: 415606a7be939835db9b0d6b711887586646346d
change-id: 20260803-slim-disable-stream-support-43599401607f

Best regards,
--  
Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>

