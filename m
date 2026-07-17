Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8116F42A158
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 14:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784298033; cv=none; b=VyTisWRrLi5EWmnDTMi9qiSzChheirQpDcGDuqMLvkGvXByKvnCgpSuaB4qGw9gO8Viu0jMdVQstQ9jiH87/CX9jsWxOg82nxrxOvj4jbLWYOqDTM51jJPXvPJOS9jiKadSGscjwu5c4fZ/AWgCPEY1cG/vHdx97IyY51MB+oxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784298033; c=relaxed/simple;
	bh=vggIaXAmA6Yss7kpMdyZh6DKjf4YMAva6nFLoLd4Bvk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FFxq/9c3otGQ2NeJ0F7dK0mK4vzwP+vcgsLYAh4Qp7ourYYpTKUTLJUCJqn+9mBEougByYeyAT4O0u8v47psfn1cOWbvJ/IQazYmJ7uof7/BkkktNoLUXru0ucul40Lb02hrjvLVvJM5sQh0XkqPvJdZUETH9uyYUqdHxQFYt6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CX8t7QQF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T/RQkfhm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CX8t7QQF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T/RQkfhm"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HE840A2123038
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 14:20:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	edfRtFYLwk8Fu9IUOWe8WQs2lIrGUdbWJQc9Z2N4zog=; b=CX8t7QQFjO9yCB64
	8P//mDiFQ6TottsEzHAcld7cEcF8HtYJSZ9Hc8cggJ7o8LWKm+Ml0dISEF7uqGXI
	qeOL+QHBMuz+UQTE2dG2A6vH+p6BgAiZtAk3sOSL3eJEpQAMaUGQyAxZyAZG+JoR
	EcPJ794toDlWZP6D2568l7Yh6GlwaWaNHQjwJg/cMoE98gsPyWDc3V8iWu097lCw
	27EthXCK97mLOMtIIFdsGw0O/2LuE+vJipWh181tbEmNUDxDA++0pm5YezFrIZK4
	C/NzSsXP+Pzhl4pRUHulYkgjUj8c5fKKzlm3rVYA0f4GiHT4FoRX7975vh6JtcXX
	RkRPEw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ffe0ut2ms-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 14:20:29 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c0ab07320so89902511cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 07:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784298029; x=1784902829; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=edfRtFYLwk8Fu9IUOWe8WQs2lIrGUdbWJQc9Z2N4zog=;
        b=T/RQkfhmJfsZenRxM06g6shgfuCEuWpy822Eim4I1bOk7Grsjc/OLcMIaA2agHL2Mc
         rpSLx3wgWz0eKydbWcRb/PVEtHk3fyvNPAy80Hpq+KVvSxPfGz7l8B1opOClBPgqvMVr
         pYkVVbOI8ydFOxHUWfxUKirhAhJ+QFQfmxG5Pwg/qfQHLbk4df+g+LxYqLSNd1iuasOq
         euZ0aqMGGb8vgPqOiR/LPq/Uxha44Eu3t6KucZewtstsJbRQHMkednMmf2zlyMsh2glb
         LV6QvQ7qaFzRhQcKd2XgsH48792p65b+tBQTAqFqNC8VMslzBndgK4sKJsOWsC4dilD2
         zHmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784298029; x=1784902829;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=edfRtFYLwk8Fu9IUOWe8WQs2lIrGUdbWJQc9Z2N4zog=;
        b=F0vZFDmX8QkeINdNdATuF7U+A3ojLiP+qyvEhMBFeoBm4u0dy26aoy6xK1UcCA+frx
         qFHw0x4mJD/w74fw2PWM2do6kDCMLnO3Gm/tiMtsXheAc8lG/VXD08lpAg1s81TBxcnk
         TOR3MLSBc2fuTC5HWreE3Rt+RzZPbdAH/oquu0+ETfGJcfb4/6nHahNrwlBJF14/69W5
         qjT3Llc3Q9ux46JeHzV9L0NhOhBhJcIsMrwD4YE7Jj0BxP3wt29SlX6a7XGEsnMtGkQa
         6YYhPA31rwSU/2UV0kQ2dtovGlv9lOpzJ3CTBOszLX8LN9FopV6uE7Mst9mTbvnkWNZ3
         oKMg==
X-Forwarded-Encrypted: i=1; AHgh+RrwRPW9FCt1V4svaqYxro2Hex6w2UagkhvqDaP5X+gQi8VQhH31uJe6W1dCuyfq2l2cqn3zlODvexN/Xhc2@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5HX7PoqCYSYxBJU2bHYBppvvaAn5m7mI0V5ouvXrBZEj/b3Tv
	xNhB8Dt90Ua3bo2wHAXSMGGccT/y8S1cskV//4l7ITTStRSA2CioLPxGdKHB2o9wI9ynpKcx7BI
	405giEJqCJ4gdSK0eSrQbosKxKfoN6Y0ujnkdWw68w06DxNBqmyZVIfgUdbqovF7cu2x3
X-Gm-Gg: AfdE7clxeitiUi11BNQylTcSv3B2CNK4IFiGmSobrQmAgtZAlwPKQzitV+SD6D10BXd
	X+pgOu3lC2uJjiATry4H02k0JhjRjtITC+C1RCJiYOGDiiq5zKps+PQruX580ZoAxc5x3CkxYXW
	y4/TT4e4C7TI1M3Dx9MKrvbNvP+hhLzswAmIFyZOWkFMJM+RBBPbumlSAYv8JnInErnmgh/YG8U
	YJzGV/u5tALMcgvNrnENfgotVsCf48u4ZI0m43Bhyd7tEV1bD3AiDo7BJdvJwcNye44xnVclOW4
	GstlUJ1TP0jk/hJ5uAzQPUlGQdroCkC/+AZnuJ1aFRRBxaC7xzxSQzq5CqN90BxKoxcuQoOg4oQ
	Y++MZDpCBXqLN8yNA/PIj6RqVVlnMsc7jEO28Cg9kd9tVwXcylCZE79L0T86W3CsLVLjw9dj7Ed
	GldohjJZS444CLB/szorlMbw8HI8S6Md4wrRR2TI50XH6uHgb56ZE=
X-Received: by 2002:a05:622a:154:b0:51a:8c9b:6496 with SMTP id d75a77b69052e-5213d0c181bmr26465011cf.58.1784298029178;
        Fri, 17 Jul 2026 07:20:29 -0700 (PDT)
X-Received: by 2002:a05:622a:154:b0:51a:8c9b:6496 with SMTP id d75a77b69052e-5213d0c181bmr26464401cf.58.1784298028607;
        Fri, 17 Jul 2026 07:20:28 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:751c:d61c:c91:60dd])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1740bf91bdsm79085966b.63.2026.07.17.07.20.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 07:20:27 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 16:20:22 +0200
Subject: [PATCH 3/4] media: qcom: camss: Drop top_ahb/ahb/axi from QCM2290
 subdevice clocks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-camss-version-v1-3-7ed71fea95e8@oss.qualcomm.com>
References: <20260717-camss-version-v1-0-7ed71fea95e8@oss.qualcomm.com>
In-Reply-To: <20260717-camss-version-v1-0-7ed71fea95e8@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=deWwG3Xe c=1 sm=1 tr=0 ts=6a5a3a2d cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=jcYsRx50IvbP8YDAZZQA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDE0NiBTYWx0ZWRfX2nuUqCHAgewa
 9fo3Gplnbryaa1xICR55FEnW1HvAR5Uj1hcyepPvoMzEc0XDTuuaV+K+Y6JWEUdyqOIXT0oJPiT
 tJXNfvmPzYQt0NGm4KgSZeMrs3Y0j7RvW/OTO0eDcBi4CvSG1v/jEfaDAHQBm0JLfQQVYEJh4dc
 q82KAHSIODR923lKTODWX8X64gBh+GQ+GWOiWi3Buk1KD6fhQUwqtmy2Qf6eCsRITkDUGXz36RA
 Xw7WNxk1lBsOGk047YvHa32sEco+KQGOTneZV1dKefNFjaz178mHVtixJTurNN72OalgFlPHkIV
 kFpnpz5Ug9jeio28aVQ6iWLaaDDvNiCWwagS+88e9ai04LrC0Z36zPx2C566wyp+ZT2rBhisZ2K
 sqjE59PeXj8rPGLWcE1U0bH9xspFbd80H+jaNfqw//r10GIEDe6O9hG0mAv21uCUNlG3V7ib0fT
 dhQzvx2UDEODFrPHKXg==
X-Proofpoint-ORIG-GUID: U-NrkUddH3wpt7xsHm8y7m3Fh7z_t14c
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDE0NiBTYWx0ZWRfX01bia4ZbqjPB
 6NAIEbJ5f+h0Y6jbFSEmjiXzeJEN/FGb+vfAUimutXUMp3ZkJytwPXUwcpY2OiCpyf6Tf1nvARM
 RU/jbctsbcp2Wl2ALTYy5xg3VU+D5EU=
X-Proofpoint-GUID: U-NrkUddH3wpt7xsHm8y7m3Fh7z_t14c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_04,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170146

Remove the top_ahb, ahb and axi clocks from QCM2290 subdevice clock
lists. These clocks are now handled centrally as global CAMSS PM clocks
and are automatically enabled when CAMSS is runtime resumed.

This avoids redundant clock references in individual subdevices and
ensures consistent clock management across the CAMSS pipeline.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 38 ++++++++++---------------------
 1 file changed, 12 insertions(+), 26 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 04b5601eb0b53110ce1b94248323dad1c08da9ca..1e97b0b7ec463f1fa2615704d09ce465a8964176 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -688,10 +688,8 @@ static const struct camss_subdev_resources csiphy_res_2290[] = {
 			{ .supply = "vdd-csiphy-1p2", .init_load_uA = 26700 },
 			{ .supply = "vdd-csiphy-1p8", .init_load_uA = 2600 }
 		},
-		.clock = { "top_ahb", "ahb", "csiphy0", "csiphy0_timer" },
-		.clock_rate = { { 0 },
-				{ 0 },
-				{ 240000000, 341330000, 384000000 },
+		.clock = { "csiphy0", "csiphy0_timer" },
+		.clock_rate = { { 240000000, 341330000, 384000000 },
 				{ 100000000, 200000000, 268800000 }  },
 		.reg = { "csiphy0" },
 		.interrupt = { "csiphy0" },
@@ -708,10 +706,8 @@ static const struct camss_subdev_resources csiphy_res_2290[] = {
 			{ .supply = "vdd-csiphy-1p2", .init_load_uA = 26700 },
 			{ .supply = "vdd-csiphy-1p8", .init_load_uA = 2600 }
 		},
-		.clock = { "top_ahb", "ahb", "csiphy1", "csiphy1_timer" },
-		.clock_rate = { { 0 },
-				{ 0 },
-				{ 240000000, 341330000, 384000000 },
+		.clock = { "csiphy1", "csiphy1_timer" },
+		.clock_rate = { { 240000000, 341330000, 384000000 },
 				{ 100000000, 200000000, 268800000 }  },
 		.reg = { "csiphy1" },
 		.interrupt = { "csiphy1" },
@@ -727,10 +723,8 @@ static const struct camss_subdev_resources csid_res_2290[] = {
 	/* CSID0 */
 	{
 		.regulators = {},
-		.clock = { "top_ahb", "ahb", "csi0", "vfe0_cphy_rx", "vfe0" },
-		.clock_rate = { { 0 },
-				{ 0 },
-				{ 192000000, 240000000, 384000000, 426400000 },
+		.clock = { "csi0", "vfe0_cphy_rx", "vfe0" },
+		.clock_rate = { { 192000000, 240000000, 384000000, 426400000 },
 				{ 0 },
 				{ 0 } },
 		.reg = { "csid0" },
@@ -745,10 +739,8 @@ static const struct camss_subdev_resources csid_res_2290[] = {
 	/* CSID1 */
 	{
 		.regulators = {},
-		.clock = { "top_ahb", "ahb", "csi1", "vfe1_cphy_rx", "vfe1" },
-		.clock_rate = { { 0 },
-				{ 0 },
-				{ 192000000, 240000000, 384000000, 426400000 },
+		.clock = { "csi1", "vfe1_cphy_rx", "vfe1" },
+		.clock_rate = { { 192000000, 240000000, 384000000, 426400000 },
 				{ 0 },
 				{ 0 } },
 		.reg = { "csid1" },
@@ -765,11 +757,8 @@ static const struct camss_subdev_resources vfe_res_2290[] = {
 	/* VFE0 */
 	{
 		.regulators = {},
-		.clock = { "top_ahb", "ahb", "axi", "vfe0", "camnoc_rt_axi", "camnoc_nrt_axi" },
-		.clock_rate = { { 0 },
-				{ 0 },
-				{ 0 },
-				{ 19200000, 153600000, 192000000, 256000000, 384000000, 460800000 },
+		.clock = { "vfe0", "camnoc_rt_axi", "camnoc_nrt_axi" },
+		.clock_rate = { { 19200000, 153600000, 192000000, 256000000, 384000000, 460800000 },
 				{ 0 },
 				{ 0 }, },
 		.reg = { "vfe0" },
@@ -785,11 +774,8 @@ static const struct camss_subdev_resources vfe_res_2290[] = {
 	/* VFE1 */
 	{
 		.regulators = {},
-		.clock = { "top_ahb", "ahb", "axi", "vfe1", "camnoc_rt_axi", "camnoc_nrt_axi" },
-		.clock_rate = { { 0 },
-				{ 0 },
-				{ 0 },
-				{ 19200000, 153600000, 192000000, 256000000, 384000000, 460800000 },
+		.clock = { "vfe1", "camnoc_rt_axi", "camnoc_nrt_axi" },
+		.clock_rate = { { 19200000, 153600000, 192000000, 256000000, 384000000, 460800000 },
 				{ 0 },
 				{ 0 }, },
 		.reg = { "vfe1" },

-- 
2.34.1

