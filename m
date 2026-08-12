Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EAE8397347
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 06:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786516151; cv=none; b=Fv5mYLR81tdm+vDCKXMaAaWp9OoiBN/H5BI5WtY3ByXHtnZB7RFMmA7Wzlvv5I3wUOQsKKVezXLuQxW97kKboAOSKB0tXfjAIQp+NU1jz+y4Ewwhpd4aJOmUkQq/RfwbuKNxn48xIiu5IVj69aCQYe/wjWjkQfxT1SNVLre5wiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786516151; c=relaxed/simple;
	bh=6Xpc9tUfDhkh9Ouh3HijKZRXTblj9NYhm/wKtKd62Vs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z1uI+6jsV059kYAU5dOEp1HhuB4A2YLYJtJLw3wSRwBo6lC1H/ysBXc+nRXAKHl6qPJD2jTSFLW/qsioVlLzjHY6BgQ2s7m8vgPYTSKizVZJ2wgqy+h+xtlvO962i89w59WPKC+DloDsm2uJNf339knyQXsbkB5mQ+ZwEX77it4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KkjxHvBi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TtDDnCaY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KkjxHvBi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TtDDnCaY"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67C62WR62962369
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 06:29:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6+MEDRn+Jv0vEZVNpFF/P7ErAifeBvAfiRD4G2IiMWA=; b=KkjxHvBiscxduSAB
	8HOLKfwEGsAMdUi1fwsFaknsMb/TAQs8QqbQ0jn8g4lXaxQ5wM6HcZkdYDGcyGGQ
	omKvCihgrsfs5ig9IQOcG3oCD9AArTQEChy4CWKv9NRoJV6uamcQXeSVHTBA8mNt
	R24xwQl/Q7Dg76VSVZGdEk8zoYs5U6gOb9gZ1pkUnZv23/0Zfbfs01wDn/AtyR+E
	jP4CoOTh55mnybkr/dfaRG+lt2OetR0P+4a46U+NYzNkcljgERmKV/KI6DLgR9hV
	hOA8H6AOWxkNqz23R8LKjkMCT5LVk9PZBOq2UWOQxJKwBTpJdAA8G2I8cehiYce7
	dxHRUA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0jgrg8pg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 06:29:09 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e2f61c09dso893258a91.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 23:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786516148; x=1787120948; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6+MEDRn+Jv0vEZVNpFF/P7ErAifeBvAfiRD4G2IiMWA=;
        b=TtDDnCaYsVDKMy+F9KHxpU3NMoI6nZkozFmxEbe3HR/vPnBapUmcPZk7xFiXfdPvt0
         TSL0Yq+9+dB+sNQSCJ+Si2Dl7K42AA2NcYhJU9MaoZcajwgR6t3Fx6oKQjNzlT7XKvKl
         +xeKn+TDmAWDvkiowCp1HxfSI8G64iE2sbpe4nlwhj1wFVNsBwrk7irP3qrXE4JBwmJG
         KLJFrE2hBgz0QEl91Ej72lDl3ygY6mVKR3OTpMWA7uWCzqta7s6ipaCv8V5Y2hv0TuDt
         n/7d8/fOaw8D+Ng4EmNSKN5sm19+k4Tw0rgNmNRGOvGu5LltwXlId7amGQqToraEv1vC
         c0uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786516148; x=1787120948;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6+MEDRn+Jv0vEZVNpFF/P7ErAifeBvAfiRD4G2IiMWA=;
        b=DTXSA3dyAxKj0RWydZ7bSPs3lmN2+zxvBuyCWF15UQh5ompUw9nmYljBdor68yXkzr
         OaU7T03ZA+U/paBGB5v81UaoR7m3hhdaUWo4Oj9CDLxP3ie+XKyp5vf598WGsHTZH1J1
         zFBG/hr0hXhgzptub1i6+IETLAadDTm70j6M4LHp0TvgGsF1+w2EqoLik3Z606ruIg+2
         jhdRWm3YCVXkHO8Y+Y+Y7A2PaRimQykBsADQFpNz1chdVTKhq+lVyBwcoKuQtaMgwjHj
         y4gH3cgpM+9Pgwb44wOTnx2J99fxZnM+vVkI+a87QqzL0pDFWmPFjHIK1ELY9wqHk2iA
         iUYQ==
X-Gm-Message-State: AOJu0Yz8nO+AoH/zwNLUUz1Uw9EGG9bgUGRPS0J+IHtV7xqVl5OyjWgY
	vaEOnULdMSZb+NZR7XzJ+N2uMO7hc78zzFR96468ca/3/4b3ZnFqBNW0N3hNbct4j50xSDxJmZ+
	/O6ZEZWwAHxMmRTCmnI30b/3s+3Ktgm+hXeGg3u+Af07iboQG229zLU3LhitaNl3RwQFbUdYkbV
	TL
X-Gm-Gg: AR+sD10CRGL8Lp47r+AYL3VPslgGbOiGgYBWbUbSjL6J6+udguOzpBWcPjR83h96fxr
	AEXtAH9KZMl/JFStewwpgvyL6rweR3BJVd5rq1g8Mb9KADXlD6c5etDin2y5hgCGB46H1dbiMBB
	SIBfHw3SRMoX+u/Fu63CaUr8VmxMQaVTpz4kQupc64M9GspbpLJHYt19DRSEk7N2zfQghBSUze6
	YoPXcVrS1GMuNrCI158PxfGIv/mJ0ZaR8fFmPaHZ6YkweVz81At0B4As300ms2Om+gYYh7MaV1y
	zJzfTbnSUesWOKDrA52Thv+M6v6O0IFiuhdwP168pipXG+ueHjNCwxH7C/d2koAB/QF6C33GEzI
	q3K+6pWqRQih5w8lyL5t9OIo8jU3Fc6w=
X-Received: by 2002:a17:90b:384f:b0:37c:6130:7a5b with SMTP id 98e67ed59e1d1-39301244f91mr2559897a91.8.1786516148249;
        Tue, 11 Aug 2026 23:29:08 -0700 (PDT)
X-Received: by 2002:a17:90b:384f:b0:37c:6130:7a5b with SMTP id 98e67ed59e1d1-39301244f91mr2559859a91.8.1786516147830;
        Tue, 11 Aug 2026 23:29:07 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392fe5578basm549377a91.4.2026.08.11.23.29.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 23:29:07 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Wed, 12 Aug 2026 14:29:00 +0800
Subject: [PATCH 1/2] soc: qcom: ubwc: Add configuration for Hawi
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260812-ubwc_for_hawi_maili-v1-1-c29edecb3bd8@oss.qualcomm.com>
References: <20260812-ubwc_for_hawi_maili-v1-0-c29edecb3bd8@oss.qualcomm.com>
In-Reply-To: <20260812-ubwc_for_hawi_maili-v1-0-c29edecb3bd8@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786516142; l=2663;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=6Xpc9tUfDhkh9Ouh3HijKZRXTblj9NYhm/wKtKd62Vs=;
 b=fF9zY0gISyapxBIvlAKWNJE1M9EuK7oUTCQE83LGm5yAZUF/pt+y5gpphNjCPgQpm/2AC+pe4
 aVcvn3lEHjIBDm3hfTYQ7JXwX0X7Tv/RWHIkRAGV3TzgNd37iPdbfk0
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDA0OSBTYWx0ZWRfX17yLACmdJ0MB
 ReP9QTBh4945vL853yZiHi2rvyVGh3weErKhvoJx16t3bXhHD+s103J+gXu2IAYP0JPq77vBTlE
 /NSEqnp1ZvgTWxoIXg7xI7qf8KeXRuxMn6HSxMj+x+mVTjesiH8k+X9IDqv7kA/SDRoFViIdaT0
 quhpFbFxehFSaNV2g2VS/whQvZZoaI1a0S0mpDELFdTII7vZM0byQvizSs5NVXGdjE7YIqInxTA
 0Tas4lcekAHJSFASncDE422YvuaZFp5+QKLiEuweDn9GpaVjHK6bbTCT9o9fUbR3FdSyAPu61po
 HMTSTcj6KzjgwfZ6gTqgQczBBmzsB72C6bp8gDbg8qS4UsnuajafpcR4U7qGEAo8gSxxcDH/W0h
 O/hRheLTlGX5x6/A6shxYQsXdfIbrrpzrQxu8nUZJvxui8lkBRsDQy3DXCn9M75IfWKx/0O9T6O
 ogRC1//fKzC/bLxhc3w==
X-Proofpoint-ORIG-GUID: QSqVmeJM0nvMU9OV9lB9rDzDk4fw6nCZ
X-Authority-Analysis: v=2.4 cv=TNJ1jVla c=1 sm=1 tr=0 ts=6a7c12b5 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=RdfnELvck2oHw4MZQEoA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: QSqVmeJM0nvMU9OV9lB9rDzDk4fw6nCZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDA0OSBTYWx0ZWRfX9xn2c5yCEv2m
 7TPwnpPjbrTCXZAeHH3vOJPfv5NYN0qMJfoe24+Lv0ds/t28a7pH1hX0gEZmBIXAqp32d9FIyL8
 9luxvyXk4Xwq8ShRhd84PTz63BOB3RQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_02,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 phishscore=0 impostorscore=0 adultscore=0
 suspectscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120049

Add UBWC configuration data for the Hawi platform, which uses UBWC 7.0
and enables the required flags and highest bank bit settings.

This allows drivers to query the correct UBWC capabilities on Hawi.

Also add UBWC 7.0 support to the version tag helper so that
qcom_ubwc_version_tag() returns the correct tag for UBWC 7.0.

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 drivers/soc/qcom/ubwc_config.c | 8 ++++++++
 include/linux/soc/qcom/ubwc.h  | 3 +++
 2 files changed, 11 insertions(+)

diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
index 23901a4c51f7305d95ac65e2a651fc557863a4ac..428a3d1038c8e40e43144f2ec3a999e8c991d9d8 100644
--- a/drivers/soc/qcom/ubwc_config.c
+++ b/drivers/soc/qcom/ubwc_config.c
@@ -105,6 +105,13 @@ static const struct qcom_ubwc_cfg_data milos_data = {
 	.highest_bank_bit = 15,
 };
 
+static const struct qcom_ubwc_cfg_data ubwc_7_0_hbb16 = {
+	.ubwc_enc_version = UBWC_7_0,
+	.flags = UBWC_SWIZZLE_ENABLE_LVL2 |
+		 UBWC_SWIZZLE_ENABLE_LVL3,
+	.highest_bank_bit = 16,
+};
+
 static const struct of_device_id qcom_ubwc_configs[] __maybe_unused = {
 	{ .compatible = "qcom,apq8016", .data = &no_ubwc_data },
 	{ .compatible = "qcom,apq8026", .data = &no_ubwc_data },
@@ -112,6 +119,7 @@ static const struct of_device_id qcom_ubwc_configs[] __maybe_unused = {
 	{ .compatible = "qcom,apq8096", .data = &ubwc_1_0_hbb15 },
 	{ .compatible = "qcom,eliza", .data = &ubwc_5_0_hbb15 },
 	{ .compatible = "qcom,glymur", .data = &glymur_data},
+	{ .compatible = "qcom,hawi", .data = &ubwc_7_0_hbb16 },
 	{ .compatible = "qcom,kaanapali", .data = &ubwc_6_0_hbb16 },
 	{ .compatible = "qcom,mahua", .data = &glymur_data },
 	{ .compatible = "qcom,milos", .data = &milos_data },
diff --git a/include/linux/soc/qcom/ubwc.h b/include/linux/soc/qcom/ubwc.h
index a7372d9c25fbc5371605a10c0388b2e820ccacef..668bef7ba57169ef6889e2a0502d628103cafc9b 100644
--- a/include/linux/soc/qcom/ubwc.h
+++ b/include/linux/soc/qcom/ubwc.h
@@ -35,6 +35,7 @@ struct qcom_ubwc_cfg_data {
 #define UBWC_4_3 0x40030000
 #define UBWC_5_0 0x50000000
 #define UBWC_6_0 0x60000000
+#define UBWC_7_0 0x70000000
 
 #if IS_ENABLED(CONFIG_QCOM_UBWC_CONFIG)
 const struct qcom_ubwc_cfg_data *qcom_ubwc_config_get_data(void);
@@ -107,6 +108,8 @@ static inline u32 qcom_ubwc_swizzle(const struct qcom_ubwc_cfg_data *cfg)
 
 static inline u32 qcom_ubwc_version_tag(const struct qcom_ubwc_cfg_data *cfg)
 {
+	if (cfg->ubwc_enc_version >= UBWC_7_0)
+		return 6;
 	if (cfg->ubwc_enc_version >= UBWC_6_0)
 		return 5;
 	if (cfg->ubwc_enc_version >= UBWC_5_0)

-- 
2.43.0

