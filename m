Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35E113C73EC
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Oct 2026 06:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791440658; cv=none; b=UGhdloXXFPgsMkqfSsvWTRE1Lt0M3lTS0PWINYPg+YJHrArgrntED/pJJB0oNGZmapgqNUOhnhnmBsUaUUaL57zEOJ7YsdzkZDVcxuv3xgkHedM4R609IoaPe/10IlUbUsTDdcZtApePzNeTg4kIf3sbCygCiHMW9ZRU9LVw98o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791440658; c=relaxed/simple;
	bh=ZaqDfyw09JWl1bCHSkMhDsGYhH9DzyYO3h9kvzfqJ9s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dKrrj6iXBDdM+xPr3ycNoAvaOquInqEzLp+2LnRpzTwjSIQUuxsIu91c6iM0Q5wHocCDnSxHOgxDb00Y4byxrV7anubSzbV/YxBtKxgxJ62vMfh11b/l7+PX5Hrgd1MLMNJre2+1re0tDLMYZmy/a3nTeGEcqxPlSSffhVgyQm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GB7hGEJL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HItSmZqv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GB7hGEJL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HItSmZqv"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6984CGhD2147319
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 Oct 2026 06:24:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M10+H3mdfMfIIvSdDU1YuzpojPnarWy7fgHcTZ+8/Ms=; b=GB7hGEJLkusTnjJa
	j+tnf0TwsyDF8uraBMAHXJNUdSAj/nPGbWhkIC13vxpgQGzCyPuTH4cDHcJnBFYW
	0DiplTwRgOlhJTl8sb/bT1tj3hOpg+V2LQo95NynNVhmb+g5Pyrk8x3oGakmOZI4
	B98+JIxsDnmOayQtFEDg0JJLhH3X/iKkPJCOxHtBv5Df/sHQEIli30uWGnRAtLwe
	dPppwx0wLgqK8SGp+m7U1ctOVqZyZ4OHKs10Xr6XrrtW9MwVmy+n1h0aatlKx2k1
	Q/AEnFa8Kez/5x0uCpl7d2h7XHb2lcihsOEEg4fWfHJC4qww44YDgUzmpmaLIyNR
	OL2tHQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe81dbt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2026 06:24:14 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2dfb24dfedfso45213305ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 23:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791440654; x=1792045454; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M10+H3mdfMfIIvSdDU1YuzpojPnarWy7fgHcTZ+8/Ms=;
        b=HItSmZqvVx5dCbOKl8uRCtw9JFFx6xqn2iTImXuqMthFp3PlS+JT6wqWlQsX6wvMBf
         x9qAYwTQIy+b1gqzNMZqWttH2S5zUQo3wVvkjmDcRRQdtZ9UiDggwGKibmLxtoOXiZq6
         JGKOs6EbhyCeNvs+gf5BvImJ8/64FmZwt2Coggx+8F2h0tY7KRQ8wFcVPHhD5x/MfqVj
         2ELn3P7BQXOGym33EXV/isHtLoFnPk1Aw1Wcyjvq7+itHj9QL8qlGD5Ll8AuTQGqLUs8
         1NH2Sbysw0YCD9+llb+/xSf+yBy1KigQTkXU5egN+eKCCyu+Z4SM76nNSV2kIioSRLR+
         83XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791440654; x=1792045454;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M10+H3mdfMfIIvSdDU1YuzpojPnarWy7fgHcTZ+8/Ms=;
        b=Y9b8gFfG059ckMcCF0XOSJxyzu6x9uS7S0xn5nWm6bu8pqAtN6ippoRs3WrZkouQrP
         NHCGHonsRZFImpa2PvQ7wnpYKDlHzo6mGrHNhs7/iFNXDg1pFymIcF7WDIdNzINnJ/0C
         L+bqFIKCsLNAd5c3bIMLJHu84a/vCymmHEXtv+To8GncJ5NXZgbuDSs8rlqg7BM07qYl
         rxAwJ32Wn4aQOj+rlj0F/VfXrucmm8QcRBES97kodLgTHBCsjxclyJsQuY54dojjDNOX
         I6hLGV7KTf50lttJQTlq7lW2OeGUbpJSbOMAinKKLH23YZCvHEtC6MrSVXPrsh/jtkqK
         NXng==
X-Forwarded-Encrypted: i=1; AKwUvBzSbdNLgNjfze+5NOugItMzdk3nkAGJjBJTpn9p5MtKsK3PlatDgE/E2WFvqKmVtTWXpg6GKUlYFqRP5Phn@vger.kernel.org
X-Gm-Message-State: AFq9FYLZ3HpTXqoHEaVRTYcSnCiCCCiuw+OYxNzutW0n/RFLibaoQJ/g
	CSsCDlVIA7JwSIrLw5zoUpkG7BQamjupbkQE1KfGt1iQGp4BtEVYTAWl3hmLHdwzjZki9THSvh2
	ICNdTqU+ohON9yGuXX2gRKu2klshKLdd5HJSIVZYXPFLggPTCXiTvu4t4Ol0wjhm4dnlg
X-Gm-Gg: AYBFou2jjvKPZxse6NqgnSw69oCKjxTKr/Pz6S1/wpzmqoUtu1hlJJAGP0SPtPZVnpA
	Tl5E83jI73QK8Y1xXaGyq7cZKlBQfcT7jdrWahrXmJLVXvWXd9maql72RLHx1eAq1YZGLrlJDzS
	HNcxofcXrCBFWkW7rniWbSfNz5ZMpztQusmospneuX+ar8ror1Zez2d6IIM/511r3TDOn75A4N5
	H4t9LH4ovhSL/TsSNFqDy/rPxN3ljzY2BF5JoytXwCjTQgGcOr6GNXbsPDBw4VXeg0WLGoPb8lV
	CFOKtBj3rEj8kbqZW9DDPDG5iUIG14Y6AROQZbjcpAOmyBTAfi4meNE/VqJUlzS6CBRc+vEIvGI
	mQdBmoOzsA0N2EGAwtRnsjjm5petG
X-Received: by 2002:a17:90b:2e46:b0:3a4:b8dd:1447 with SMTP id 98e67ed59e1d1-3a8a1aeebfamr3335957a91.34.1791440653934;
        Wed, 07 Oct 2026 23:24:13 -0700 (PDT)
X-Received: by 2002:a17:90b:2e46:b0:3a4:b8dd:1447 with SMTP id 98e67ed59e1d1-3a8a1aeebfamr3335948a91.34.1791440653451;
        Wed, 07 Oct 2026 23:24:13 -0700 (PDT)
Received: from hu-batta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a9ff7ab034sm2767618a91.4.2026.10.07.23.24.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 23:24:13 -0700 (PDT)
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 11:53:48 +0530
Subject: [PATCH v7 4/7] bus: mhi: Add QDU100 Sahara variant and firmware
 fallback
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-sahara_protocol_new_v2-v7-4-90d278bd7414@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791440631; l=5713;
 i=kishore.batta@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=ZaqDfyw09JWl1bCHSkMhDsGYhH9DzyYO3h9kvzfqJ9s=;
 b=LxkYNz96eXwqjouBL1LaEkPJaxPXcu9+uugL3BStFlS2Sc2cgjoHWimGZMm8CP+u2d+p9RWVh
 FHTG1ZeH1ahCQMdi3R5OftUF5E1g48WmwUw9dTXxad8pk6uBJZbNFVl
X-Developer-Key: i=kishore.batta@oss.qualcomm.com; a=ed25519;
 pk=vJo8RvTf+HZpRLK2oOIljmbn9l3zFkibCGh+blaqZCw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAyNSBTYWx0ZWRfX4GMfernDSI08
 zF0A3oMNgUk8zxMulRp1fcrlHgA1SDF+YRht+A2ACCsYub+niSPXBZbQzw2OQvBBvA3EwJXB6LO
 8lNH9lEn+5I4/U3FVpsLf5CSw2bE/UHzznYLGONzidvyDZug2zDiZVZmMKYI91Pki7m2Hkrq68L
 SZ4IRsG546xIYGQrS3CVsKXjoMNvZ0+G540IQ8+7JYqDrBh+7hhGmU1wK/Ka2PR5YZQACpk60OR
 wp8FXqoWMk5pHx/is06IIuJNmB9mtrJoVELAOnMM/3XOB8EF/lyXheuZhbehlYdauw6LuypMXCx
 fgPnzNPbbHXEl7ST4kPRNVrGFm27v1gkQB2I0DkPIvaJsE80DwMpq12lxg0eimMBCUWZBorvsy+
 AXOnRTBIe5m3htOgbNv1HXKZcS/HG4Nn6dYxvkaBLtFd2w6tzX22tGO+pqSEWTj53/7v59YatUu
 YHxVMCJoRoNrXw/HWog==
X-Proofpoint-GUID: 451jvmWoQz_YJIPCgA2RJsPohBaVR4oW
X-Proofpoint-ORIG-GUID: 451jvmWoQz_YJIPCgA2RJsPohBaVR4oW
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAyNSBTYWx0ZWRfX+clNZaYBP53c
 0Vqkpcwp1mv2WOkS+DoZuAdIu7m8QZ5C1QkaUscwLEgjT0rzR80DW/M5EBvEFyodFCjt8ANqapS
 nfGyvmTZ2+61sTr8I0OWunVUOKt1GbE=
X-Authority-Analysis: v=2.4 cv=MPT1C8Zl c=1 sm=1 tr=0 ts=6ac7370f cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=3TBL8zyTcm-CCHetwZgA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_02,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080025

The Sahara driver currently selects a firmware image table based on the
attached device, but it does not recognize QDU100 devices that expose the
protocol on the SAHARA MHI channel. As a result, the host cannot associate
QDU100 devices with the correct firmware namespace during image transfer.

Extend the probe time variant selection to match the SAHARA MHI channel and
associate it with the QDU100 firmware folder. Add a firmware lookup
fallback for cases where an image does not have an explicit entry in the
device's firmware table. This allows required images to be provisioned by
the platform.

This change only affects devices matched on the SAHARA MHI channel and
does not change behavior for existing AIC100 and AIC200 devices.

Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
---
 drivers/bus/mhi/host/clients/sahara/sahara.c | 27 ++++++++++++++++--
 drivers/bus/mhi/host/pci_generic.c           | 41 ++++++++++++++++++++++++++++
 2 files changed, 66 insertions(+), 2 deletions(-)

diff --git a/drivers/bus/mhi/host/clients/sahara/sahara.c b/drivers/bus/mhi/host/clients/sahara/sahara.c
index e339c67e236af271645ca81cc517efd9eead87e4..7fe5158c17e9814f50b2065202a629eb10a742a8 100644
--- a/drivers/bus/mhi/host/clients/sahara/sahara.c
+++ b/drivers/bus/mhi/host/clients/sahara/sahara.c
@@ -189,6 +189,7 @@ static bool is_streaming(struct sahara_context *context)
 
 static int sahara_find_image(struct sahara_context *context, u32 image_id)
 {
+	char *fw_path;
 	int ret;
 
 	if (image_id == context->active_image_id)
@@ -201,8 +202,28 @@ static int sahara_find_image(struct sahara_context *context, u32 image_id)
 	}
 
 	if (image_id >= context->table_size || !context->image_table[image_id]) {
-		dev_err(&context->mhi_dev->dev, "request for unknown image: %d\n", image_id);
-		return -EINVAL;
+		if (!context->fw_folder) {
+			dev_err(&context->mhi_dev->dev,
+				"Request for unknown image: %u (no fw folder)\n", image_id);
+			return -EINVAL;
+		}
+
+		fw_path = kasprintf(GFP_KERNEL, "qcom/%s/%u",
+				    context->fw_folder, image_id);
+		if (!fw_path)
+			return -ENOMEM;
+
+		ret = firmware_request_nowarn(&context->firmware,
+					      fw_path,
+					      &context->mhi_dev->dev);
+		kfree(fw_path);
+		if (ret) {
+			dev_err(&context->mhi_dev->dev,
+				"request for unknown image: %d\n", image_id);
+			return -EINVAL;
+		}
+		context->active_image_id = image_id;
+		return 0;
 	}
 
 	/*
@@ -870,8 +891,10 @@ static void sahara_mhi_dl_xfer_cb(struct mhi_device *mhi_dev, struct mhi_result
 
 static const struct mhi_device_id sahara_mhi_match_table[] = {
 	{ .chan = "QAIC_SAHARA", },
+	{ .chan = "SAHARA", },
 	{},
 };
+MODULE_DEVICE_TABLE(mhi, sahara_mhi_match_table);
 
 static struct mhi_driver sahara_mhi_driver = {
 	.id_table = sahara_mhi_match_table,
diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index 391ab146f501c6ce1c81f6138f7c491a49c2f264..3f8a01ea2f7d52331c4db0f2c0b8658650e2eab6 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -47,10 +47,12 @@
  *		   of inband wake support (such as sdx24)
  * @no_m3: M3 not supported
  * @reset_on_remove: Set true for devices that require SoC during driver removal
+ * @sahara_fw: Sahara firmware mapping
  */
 struct mhi_pci_dev_info {
 	const struct mhi_controller_config *config;
 	const struct mhi_controller_config *vf_config;
+	const struct mhi_sahara_fw_table *sahara_fw;
 	const char *name;
 	const char *fw;
 	const char *edl;
@@ -287,11 +289,49 @@ static const struct mhi_controller_config mhi_qcom_qdu100_config = {
 	.event_cfg = mhi_qcom_qdu100_events,
 };
 
+static const char * const qdu100_image_table[] = {
+	[5] = "qcom/qdu100/uefi.elf",
+	[8] = "qcom/qdu100/qdsp6sw.mbn",
+	[16] = "qcom/qdu100/efs1.bin",
+	[17] = "qcom/qdu100/efs2.bin",
+	[20] = "qcom/qdu100/efs3.bin",
+	[23] = "qcom/qdu100/aop.mbn",
+	[25] = "qcom/qdu100/tz.mbn",
+	[29] = "qcom/qdu100/zeros_1sector.bin",
+	[33] = "qcom/qdu100/hypvm.mbn",
+	[34] = "qcom/qdu100/mdmddr.mbn",
+	[36] = "qcom/qdu100/multi_image_qti.mbn",
+	[37] = "qcom/qdu100/multi_image.mbn",
+	[38] = "qcom/qdu100/xbl_config.elf",
+	[39] = "qcom/qdu100/abl_userdebug.elf",
+	[40] = "qcom/qdu100/zeros_1sector.bin",
+	[41] = "qcom/qdu100/devcfg.mbn",
+	[42] = "qcom/qdu100/zeros_1sector.bin",
+	[45] = "qcom/qdu100/tools_l.elf",
+	[46] = "qcom/qdu100/Quantum.elf",
+	[47] = "qcom/qdu100/quest.elf",
+	[48] = "qcom/qdu100/xbl_ramdump.elf",
+	[49] = "qcom/qdu100/shrm.elf",
+	[50] = "qcom/qdu100/cpucp.elf",
+	[51] = "qcom/qdu100/aop_devcfg.mbn",
+	[52] = "qcom/qdu100/fw_csm_gsi_3.0.elf",
+	[53] = "qcom/qdu100/qdsp6sw_dtbs.elf",
+	[54] = "qcom/qdu100/qupv3fw.elf",
+};
+
+static const struct mhi_sahara_fw_table qdu100_sahara_fw = {
+	.image_table = qdu100_image_table,
+	.table_size = ARRAY_SIZE(qdu100_image_table),
+	.fw_folder = "qdu100",
+	.non_streaming = false,
+};
+
 static const struct mhi_pci_dev_info mhi_qcom_qdu100_info = {
 	.name = "qcom-qdu100",
 	.fw = "qcom/qdu100/xbl_s.melf",
 	.edl_trigger = true,
 	.config = &mhi_qcom_qdu100_config,
+	.sahara_fw = &qdu100_sahara_fw,
 	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
 	.dma_data_width = 32,
 	.vf_dma_data_width = 40,
@@ -1376,6 +1416,7 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	mhi_cntrl->runtime_put = mhi_pci_runtime_put;
 	mhi_cntrl->mru = info->mru_default;
 	mhi_cntrl->name = info->name;
+	mhi_cntrl->sahara_fw = info->sahara_fw;
 
 	if (pdev->is_physfn)
 		mhi_pdev->reset_on_remove = info->reset_on_remove;

-- 
2.34.1

