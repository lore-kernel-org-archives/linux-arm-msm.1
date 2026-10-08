Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71D1C3BFAEE
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Oct 2026 06:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791440654; cv=none; b=Xb5ipUmZ86WUWxGDVWeC5MWOEuXFF//KqpKS5EsvoYJYr6wnRaP0lSF2LfXkb9jkUhsjzUc9EVZWjVoJbQk3QkbCcW1HR9iQEdhHzcCS2FteY+w4wnzPzKccW5v1Razvtz1cgazIvsWPJtmwnB38WuitP/EJDppMflMdwC50B6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791440654; c=relaxed/simple;
	bh=28E7Vcxz/zL/tJvNl4R7cGAC0IOtuHloTBJjNXp+ts8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=utcXdLtuNwW+5rS2ZagKk7PV9X1mHBqa2MbR278pTQ8g4eLetJ8MxfmDQzGD48mh6xH6EdQH96jL+nQ62bvB5SW1He073FUkuoUIPgr7HxTRLQUupCeCeJX5je2TQMZxuDDdhDg5ueZGiEgXvJ+y3WGbkTrL3E5epQquVNtN0/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OU685rw6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=icJYnVci; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OU685rw6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="icJYnVci"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6984BrQt314479
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 Oct 2026 06:24:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W899JKnFZJ6i4LZoCOiJODPDV7JFYUGw4LZ0YibnRaI=; b=OU685rw6hPxYPEPk
	s8+bq+l2xE1m0YhHwaIRD6H2ONRR48I5+rNUOBals0eBuWPEzmJA3iFikdJSvfx7
	+XTF0kay671PCt4pOoK5jiDNOQTs5G+8SHtnXpCpNNbZZbqOJ9ZFxMY9bpgTQnd4
	kbQZeVkdVisYFFH20WzFJAmQ6XWZ/NSeTDXcmEtq4Mn4giI4wrVA4tWMcpV01tTU
	Yihnw6xyVrsTsDFpsx4lccgljMFY5jp1dawI1cPWUEELznFASTz9ZubX6kH5monF
	NuFMEbjOi1JvNVGWxXJ3uVsPSIV09x9c4zf6VRj+Ka9xllcnToshgcPRt1iG4Ym5
	QyvW3Q==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe31d74-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2026 06:24:10 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39de4e72b33so7101619a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 23:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791440650; x=1792045450; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W899JKnFZJ6i4LZoCOiJODPDV7JFYUGw4LZ0YibnRaI=;
        b=icJYnVci4OeEnQkXUVvynYa9ySp8YiZpXmrvZyjg1iJkGglgU6ZCbSIsmthNIsEhBs
         Ui7DNzjnPPTPmtGKFyownKpgxKOxa1g5cFLVjIBqy2a44xImBVrSPMgT7QHqaGDphrR8
         qlo4Cc8b0ObPQZ+++iJQJoEn/IPN+wa+4p1h9ENjcKfRqJshdeovwYnwDqXykpJW1K4f
         dB6W7aGCpTnE7BKYt7OZiMpCi1/YcWtus8toH2d9ev/qj9tgB5kjDYe5pPCF20bOOcdL
         r6fKr4hM+0cxVPISA9ja2YOdHnxUxStM9IWhUiOaAF8vZejdwVqrK0T3djuvO+tJhuqE
         +goQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791440650; x=1792045450;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W899JKnFZJ6i4LZoCOiJODPDV7JFYUGw4LZ0YibnRaI=;
        b=13jlnjPVmupoEFeT4G28C4f/yAXeVfyKCLfCCzlES6q8faMzqcIxtLDp2BOdJpa7Ra
         eYifbWkn05KL+39rghtbj36+qLeoJNAX1+WNT0lPvER4kygIrNjPvAJs6ghozRnm3xO9
         ivtg+KGwDWZbixwizyxER8QfJDB+MSIBbVMMmND51eRJC20pifCDY/tG3Vj5eXxNiUHr
         nrHpu6q1LUUzibokOAZQbUv7lbH+Kt8v33brS4iv05Ng3X3JNrOhBkRpq49cC2qI9QsV
         UF/dqAWxATQ2AlSiJnlizWzEalcGZBVzy9/bDpaA5LHJsDTVBymr5J3iM+5gy6sZqkns
         YpMA==
X-Forwarded-Encrypted: i=1; AKwUvBwEWZsMygqogXPDjrOo9jHLv5oMD9ALbxQTIKPUsIF5ygXKBnUsiLfOFk1MSgTYB2d9zH5iDcxhpKLNpGH9@vger.kernel.org
X-Gm-Message-State: AFq9FYIMko7lQO4EOObKA7xYzcbQ9EhF17qn1UfhumIE8Inec/4SsdYD
	4ALJ3Zpi0x9Aocpqhz43uA65Nbw+2aDUkcm3KJ3Tpv88kSx7HH3QEDQP864z5oolyMyUHk4eqcA
	mRZ7kiRsREHn4Y7X1pVqpCe46jpEf6zG/cKvmdnvVLj+bDiOBfzJYixGIY+0zgbxuAdcF
X-Gm-Gg: AYBFou0kgv+U6J5BlNWBix/aRUIuq1BxV9GZ+bQ6lzk5k02BD7jcE43qxJE1k2+Bd9y
	XtsZFnd8a2H3lID27kg9GLnL1qnzxC7yZuOv8KhAalyjS5V7xUeg5jYzT/rZxyJtVE4avaBIhfk
	z8XsJ4hYj0pHsl3G7R81urtB9MWlaifAVOqveandJ9Qo11EjqqSTAZfBLDykBmWXkzA4z0h6tbu
	eVjmx2nZtMZh930WiKRDQxPVR77gVvAHU4EOY0fOxDDEkrY/qxsuza0hLGEavW5TN7DrjJmVoAw
	YtRgFNr9WTaYAfBCHdE+ghgn10l4av7u4V1gKCHMPUK2/kHAojr7wtFY3+avo68raBV/ucQ4nyA
	NFKluxgHRCHqmkT/IW5rivzoRxox5
X-Received: by 2002:a17:90b:4fc5:b0:3a0:345a:3646 with SMTP id 98e67ed59e1d1-3a8a0f410a7mr4068203a91.45.1791440649589;
        Wed, 07 Oct 2026 23:24:09 -0700 (PDT)
X-Received: by 2002:a17:90b:4fc5:b0:3a0:345a:3646 with SMTP id 98e67ed59e1d1-3a8a0f410a7mr4068182a91.45.1791440649069;
        Wed, 07 Oct 2026 23:24:09 -0700 (PDT)
Received: from hu-batta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a9ff7ab034sm2767618a91.4.2026.10.07.23.24.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 23:24:08 -0700 (PDT)
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 11:53:47 +0530
Subject: [PATCH v7 3/7] bus: mhi: Centralize Sahara firmware image table
 selection at probe time
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-sahara_protocol_new_v2-v7-3-90d278bd7414@oss.qualcomm.com>
References: <20261008-sahara_protocol_new_v2-v7-0-90d278bd7414@oss.qualcomm.com>
In-Reply-To: <20261008-sahara_protocol_new_v2-v7-0-90d278bd7414@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev, Kishore Batta <kishore.batta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791440631; l=8668;
 i=kishore.batta@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=28E7Vcxz/zL/tJvNl4R7cGAC0IOtuHloTBJjNXp+ts8=;
 b=8TU9NN097K1wBcAAgiPFzJxK3MKvMqFA3vOWfLGarLJ9ZQKsw+7EDLm573ZAqbA7xrNil5scY
 +ZG4bnw+N/MDeLnZpu5/MuGgePPXucEVhbYzoqEukrVKoEeP+VnJc+r
X-Developer-Key: i=kishore.batta@oss.qualcomm.com; a=ed25519;
 pk=vJo8RvTf+HZpRLK2oOIljmbn9l3zFkibCGh+blaqZCw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAyNSBTYWx0ZWRfX8ea5oNFeJRQJ
 fWvJKJxZ4m+CfyL0xt3lpuStLTMdO6kwsNEReDemlH6GnGP0dcSnVso5IgjJ4tvfMzND/VTOgXw
 iREpkJmaLTjY9cbxwCuhXwBAP5cIiqf3Tlzi/0f7yqq7FiMG7cACY9AgV0iAHhuhkPdzEQzJo2I
 eNbaTNMcU101Z+uiFj/faYs9t1qJGzd+po4ZMj7o8QkA79VXyUXi2I9pzJo6GM0ZJ6DHBSd3Cwg
 tdPRuER3PH4+PmgdLLidMI9vY1A9a5ZWXDb1ygZvV59BjBQR+HHrOHdr7GG2b2hRwcIhdj57kbW
 2w9AX/U4F6GYbpLE26ZSQSAEEvvjovNh+QkR/A/CxMjpxTcMvsGUNwBhF6fIf0Wm/ti46N9xBL4
 13xRaMtZtNwa+cumh8ckdv70CjpLxD0Yq8Ki1zOTWy7tjxh3CqvcHGoWCokOtWkieMjPlXsq2qV
 UT4k3c5vELSE2gLppQA==
X-Proofpoint-ORIG-GUID: WF99wHeWfnndZlSKjqAOHZe-vYSBuQ6j
X-Proofpoint-GUID: WF99wHeWfnndZlSKjqAOHZe-vYSBuQ6j
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAyNSBTYWx0ZWRfX7r3bzgCuw/Ne
 VvMJy4wnRnMImJGvyH3sa2QzmHDq+nQF2F7Ac1M1ydNO5jusNVtoEM7fixtwj8VRJpIOq39/Q0u
 EjwOB51kTFPOv4kZIcoZMFbOZXO6zu8=
X-Authority-Analysis: v=2.4 cv=KcdHIgYD c=1 sm=1 tr=0 ts=6ac7370a cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=FaWmrOfgj8M-bvBoqZ0A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_02,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080025

The Sahara driver currently selects firmware image tables using scattered,
device specific conditionals in the probe path. This makes the logic harder
to follow, harder to extend for new devices, and spreads device knowledge
across multiple code paths.

Refactor firmware image table selection into a single, explicit probe time
mechanism by introducing a controller provided firmware mapping table that
captures device matching, Sahara image tables, firmware folder names, and
streaming behaviour in one place.

This centralizes device specific decisions in the controller driver,
simplifies the Sahara probe logic, and removes ad-hoc conditionals while
preserving existing behavior for all supported AIC devices. This is in
preparation for adding QDU100 support.

Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
---
 drivers/accel/qaic/mhi_controller.c          | 61 ++++++++++++++++++++++++++++
 drivers/bus/mhi/host/clients/sahara/sahara.c | 60 +++++----------------------
 include/linux/mhi.h                          | 17 ++++++++
 3 files changed, 88 insertions(+), 50 deletions(-)

diff --git a/drivers/accel/qaic/mhi_controller.c b/drivers/accel/qaic/mhi_controller.c
index 4d787f77ce419fcd2b250f9cabaec9c26f2da8dc..1f9ef871421b976c35cfad59aed715da96c1813b 100644
--- a/drivers/accel/qaic/mhi_controller.c
+++ b/drivers/accel/qaic/mhi_controller.c
@@ -20,6 +20,62 @@ static unsigned int mhi_timeout_ms = 2000; /* 2 sec default */
 module_param(mhi_timeout_ms, uint, 0600);
 MODULE_PARM_DESC(mhi_timeout_ms, "MHI controller timeout value");
 
+static const char * const aic100_image_table[] = {
+	[1]  = "qcom/aic100/fw1.bin",
+	[2]  = "qcom/aic100/fw2.bin",
+	[4]  = "qcom/aic100/fw4.bin",
+	[5]  = "qcom/aic100/fw5.bin",
+	[6]  = "qcom/aic100/fw6.bin",
+	[8]  = "qcom/aic100/fw8.bin",
+	[9]  = "qcom/aic100/fw9.bin",
+	[10] = "qcom/aic100/fw10.bin",
+};
+
+static const char * const aic200_image_table[] = {
+	[5]  = "qcom/aic200/uefi.elf",
+	[12] = "qcom/aic200/aic200-nsp.bin",
+	[23] = "qcom/aic200/aop.mbn",
+	[32] = "qcom/aic200/tz.mbn",
+	[33] = "qcom/aic200/hypvm.mbn",
+	[38] = "qcom/aic200/xbl_config.elf",
+	[39] = "qcom/aic200/aic200_abl.elf",
+	[40] = "qcom/aic200/apdp.mbn",
+	[41] = "qcom/aic200/devcfg.mbn",
+	[42] = "qcom/aic200/sec.elf",
+	[43] = "qcom/aic200/aic200-hlos.elf",
+	[49] = "qcom/aic200/shrm.elf",
+	[50] = "qcom/aic200/cpucp.elf",
+	[51] = "qcom/aic200/aop_devcfg.mbn",
+	[54] = "qcom/aic200/qupv3fw.elf",
+	[57] = "qcom/aic200/cpucp_dtbs.elf",
+	[62] = "qcom/aic200/uefi_dtbs.elf",
+	[63] = "qcom/aic200/xbl_ac_config.mbn",
+	[64] = "qcom/aic200/tz_ac_config.mbn",
+	[65] = "qcom/aic200/hyp_ac_config.mbn",
+	[66] = "qcom/aic200/pdp.elf",
+	[67] = "qcom/aic200/pdp_cdb.elf",
+	[68] = "qcom/aic200/sdi.mbn",
+	[69] = "qcom/aic200/dcd.mbn",
+	[73] = "qcom/aic200/gearvm.mbn",
+	[74] = "qcom/aic200/sti.bin",
+	[76] = "qcom/aic200/tz_qti_config.mbn",
+	[78] = "qcom/aic200/pvs.bin",
+};
+
+static const struct mhi_sahara_fw_table aic100_sahara_fw = {
+	.image_table = aic100_image_table,
+	.table_size = ARRAY_SIZE(aic100_image_table),
+	.fw_folder = "aic100",
+	.non_streaming = true,
+};
+
+static const struct mhi_sahara_fw_table aic200_sahara_fw = {
+	.image_table = aic200_image_table,
+	.table_size = ARRAY_SIZE(aic200_image_table),
+	.fw_folder = "aic200",
+	.non_streaming = false,
+};
+
 static const char *fw_image_paths[FAMILY_MAX] = {
 	[FAMILY_AIC100] = "qcom/aic100/sbl.bin",
 	[FAMILY_AIC200] = "qcom/aic200/sbl.bin",
@@ -871,6 +927,11 @@ struct mhi_controller *qaic_mhi_register_controller(struct pci_dev *pci_dev, voi
 		mhi_cntrl->name = "AIC100";
 	}
 
+	if (mhi_cntrl->name && !strcmp(mhi_cntrl->name, "AIC100"))
+		mhi_cntrl->sahara_fw = &aic100_sahara_fw;
+	else if (mhi_cntrl->name && !strcmp(mhi_cntrl->name, "AIC200"))
+		mhi_cntrl->sahara_fw = &aic200_sahara_fw;
+
 	/* use latest configured timeout */
 	mhi_config.timeout_ms = mhi_timeout_ms;
 	ret = mhi_register_controller(mhi_cntrl, &mhi_config);
diff --git a/drivers/bus/mhi/host/clients/sahara/sahara.c b/drivers/bus/mhi/host/clients/sahara/sahara.c
index 858dc5bc39c1ad42922cabef3b1abcd43bc4f0f4..e339c67e236af271645ca81cc517efd9eead87e4 100644
--- a/drivers/bus/mhi/host/clients/sahara/sahara.c
+++ b/drivers/bus/mhi/host/clients/sahara/sahara.c
@@ -179,48 +179,7 @@ struct sahara_context {
 	u32				read_data_length;
 	bool				is_mem_dump_mode;
 	bool				non_streaming;
-};
-
-static const char * const aic100_image_table[] = {
-	[1]  = "qcom/aic100/fw1.bin",
-	[2]  = "qcom/aic100/fw2.bin",
-	[4]  = "qcom/aic100/fw4.bin",
-	[5]  = "qcom/aic100/fw5.bin",
-	[6]  = "qcom/aic100/fw6.bin",
-	[8]  = "qcom/aic100/fw8.bin",
-	[9]  = "qcom/aic100/fw9.bin",
-	[10] = "qcom/aic100/fw10.bin",
-};
-
-static const char * const aic200_image_table[] = {
-	[5]  = "qcom/aic200/uefi.elf",
-	[12] = "qcom/aic200/aic200-nsp.bin",
-	[23] = "qcom/aic200/aop.mbn",
-	[32] = "qcom/aic200/tz.mbn",
-	[33] = "qcom/aic200/hypvm.mbn",
-	[38] = "qcom/aic200/xbl_config.elf",
-	[39] = "qcom/aic200/aic200_abl.elf",
-	[40] = "qcom/aic200/apdp.mbn",
-	[41] = "qcom/aic200/devcfg.mbn",
-	[42] = "qcom/aic200/sec.elf",
-	[43] = "qcom/aic200/aic200-hlos.elf",
-	[49] = "qcom/aic200/shrm.elf",
-	[50] = "qcom/aic200/cpucp.elf",
-	[51] = "qcom/aic200/aop_devcfg.mbn",
-	[54] = "qcom/aic200/qupv3fw.elf",
-	[57] = "qcom/aic200/cpucp_dtbs.elf",
-	[62] = "qcom/aic200/uefi_dtbs.elf",
-	[63] = "qcom/aic200/xbl_ac_config.mbn",
-	[64] = "qcom/aic200/tz_ac_config.mbn",
-	[65] = "qcom/aic200/hyp_ac_config.mbn",
-	[66] = "qcom/aic200/pdp.elf",
-	[67] = "qcom/aic200/pdp_cdb.elf",
-	[68] = "qcom/aic200/sdi.mbn",
-	[69] = "qcom/aic200/dcd.mbn",
-	[73] = "qcom/aic200/gearvm.mbn",
-	[74] = "qcom/aic200/sti.bin",
-	[76] = "qcom/aic200/tz_qti_config.mbn",
-	[78] = "qcom/aic200/pvs.bin",
+	const char			*fw_folder;
 };
 
 static bool is_streaming(struct sahara_context *context)
@@ -796,6 +755,7 @@ static void sahara_read_data_processing(struct work_struct *work)
 
 static int sahara_mhi_probe(struct mhi_device *mhi_dev, const struct mhi_device_id *id)
 {
+	const struct mhi_sahara_fw_table *sahara_fw;
 	struct sahara_context *context;
 	int ret;
 	int i;
@@ -808,14 +768,14 @@ static int sahara_mhi_probe(struct mhi_device *mhi_dev, const struct mhi_device_
 	if (!context->rx)
 		return -ENOMEM;
 
-	if (!strcmp(mhi_dev->mhi_cntrl->name, "AIC200")) {
-		context->image_table = aic200_image_table;
-		context->table_size = ARRAY_SIZE(aic200_image_table);
-	} else {
-		context->image_table = aic100_image_table;
-		context->table_size = ARRAY_SIZE(aic100_image_table);
-		context->non_streaming = true;
-	}
+	sahara_fw = mhi_dev->mhi_cntrl->sahara_fw;
+	if (!sahara_fw || !sahara_fw->image_table || !sahara_fw->table_size)
+		return -ENODEV;
+
+	context->image_table = sahara_fw->image_table;
+	context->table_size = sahara_fw->table_size;
+	context->non_streaming = sahara_fw->non_streaming;
+	context->fw_folder = sahara_fw->fw_folder;
 
 	/*
 	 * There are two firmware implementations for READ_DATA handling.
diff --git a/include/linux/mhi.h b/include/linux/mhi.h
index 88ccb3e14f481d6b85c2a314eb74ba960c2d4c81..060dafffac67c5c920adc1562a61a7233e8d583f 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -234,6 +234,21 @@ struct mhi_channel_config {
 	bool wake_capable;
 };
 
+/**
+ * struct mhi_sahara_fw_table - Controller provided sahara firmware mapping
+ * @image_table: Sparse array indexed by Sahara image ID
+ * @table_size: Size of @image_table
+ * @fw_folder: Firmware folder name.
+ * @non_streaming: Streaming feature support (optional)
+ *
+ */
+struct mhi_sahara_fw_table {
+	const char *const *image_table;
+	u32 table_size;
+	const char *fw_folder;
+	bool non_streaming;
+};
+
 /**
  * struct mhi_event_config - Event ring configuration structure for controller
  * @num_elements: The number of elements that can be queued to this ring
@@ -360,6 +375,7 @@ struct mhi_controller_config {
  * @wake_set: Device wakeup set flag
  * @irq_flags: irq flags passed to request_irq (optional)
  * @mru: the default MRU for the MHI device
+ * @sahara_fw: Sahara firmware mapping
  *
  * Fields marked as (required) need to be populated by the controller driver
  * before calling mhi_register_controller(). For the fields marked as (optional)
@@ -445,6 +461,7 @@ struct mhi_controller {
 	bool wake_set;
 	unsigned long irq_flags;
 	u32 mru;
+	const struct mhi_sahara_fw_table *sahara_fw;
 };
 
 /**

-- 
2.34.1

