Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 121E9392802
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 03:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790134111; cv=none; b=QnBePj2Y6AOAJyz/s1+GEP0hMT9TyWRrsc7KGGpzpqabMSlnq5pH1IJEJtLOYXOWKpVAXTSNLF094UPhNQeUSDDPKZIbQtKX5xzzNqsoUrWXLyi+Y/eyogFW2AjR2CXd8Hcp4OlT0BXOpnoaPRxHrqlCVrkBl0NmfIRpEh+FPCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790134111; c=relaxed/simple;
	bh=Xlbwl6Vx4+HGBNlzMqIIKgTeAZAgMjnSyrLdOon688A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VUYcDXNJnVvGV/69/k8MukgIr3BAj9X/RadY1PSAkV/xei8SSxcqVorGQub5CE7hvLrhxoxatVNMtHaWkvck++8YxqFaRD8QKwrze7DK6e9fo+94hoZTgjMSXtnrDr5tMMpqAg46nDqnB06nqH5Zo0FSUu+kiHUqJRjNggGc5GI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f59X0lWb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QAyKtu7U; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f59X0lWb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QAyKtu7U"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MJBm6P3897642
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 03:28:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m11kiYCAwMQ7W55vXcbMY21fBGFpt1wSVq3rfYTVbAI=; b=f59X0lWbtAMCILuf
	kCWvNsAj9GLXLTZImBXrbYDQtYNA26eK/XF6/MsYGRm0HEnWryP4f9R2VSCZhJMY
	KJC5z2anH3PxYD97u2ctTLUGQrSV9MIG7xJ/Nda/DhNHMTIrEOB5XrDRELzYpzpR
	Dgox8jfQP4LP2dg2mHl+3cEJ+BTRnkXPkzOVlQTajuzMYiJx6li+rmYanFHTKBo8
	t4koR8t2OCi64z5XRxS0oup/FEZNSYDVmYEqb6Qu+WCFcJUmJgLnrQ/Jw6NhmIDF
	sMI/ImvrjGMOZsH4BpavwtXvrUILmsmCS7ApdYZh9xjI4BdZlIZ9DkcihzFpHwpK
	RCwI2Q==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guyma1s45-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 03:28:29 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ccb687f82eso3225755ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 20:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790134109; x=1790738909; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m11kiYCAwMQ7W55vXcbMY21fBGFpt1wSVq3rfYTVbAI=;
        b=QAyKtu7ULgPrpEwM3tjqcIyxS4MzxTRUoi6GW04Wj+1jl9iQJscptBHdhVUMblKAZc
         kWKxk4MIp+HnDqdZ/gaxyQ4gVkhUKdsneBBzR60PFGOtWLb+8pfTiJt/4ekofqTn1vi7
         hok96bAbsefb65UEXSvmBaNLyUeAFr3x3MmWM0Q8fOHygmaDxFqShsfk2W0lhkMhohxg
         hVHuR/nBFNMKxweqYnHeP6ra0kFUJVxctN0W+/bsWH2zJVnGyl2HBdO0mQlQkgdGl/dU
         4f8Y+Z6V3vmpBLZyMTNTDc/8l3f+4m8vtbad0YAYvchDemBuNIJVHWsfcVb6aXuUDSiM
         b8pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790134109; x=1790738909;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m11kiYCAwMQ7W55vXcbMY21fBGFpt1wSVq3rfYTVbAI=;
        b=NzatuWrSMwU3jWxD1diHavVokvHr2qNXAfjBbS9iA9314KJSentNkdNpdphTIX4Ij3
         7ylW+gRvEb7TfFwcEh6LIwzgaj4hpxK2iD+rBtrwDjchqK9qFDqcLmwvkBKeX/4v9bvM
         2vQ3BwOz0hi9QCyTx+xMxYeWNXBqROTWvdGdqbaL5oX1z1/ZMDTsBm3AhVIYfWJEuFs9
         UAip47qZfzAX04nj3DqCIxjgUXsT+OK7ABlE+/7CVFZyctHNaolf3mkLUuvMXahI7rXy
         6kY0xOFZ6EpOrLhSr1lkE/eBtwn7VjRDzI57tJlnu8LSNTClf90oCfSus3mcI/qHZAwi
         V5ww==
X-Gm-Message-State: AFuF++m/taseE0ZdY7fZBGwvr6OoGiSgh7FbcwjCyCUvy/TW1W9pcRBI
	LGPw7yFu12nhgAvPM8NVlfibbalOp6ASY/TBtxqAh+AygF4z1aChrpLpETNgF+3XUPx2gclIaDl
	YOw7Qxl1+xADQPO20vljlZyM4Wdsx/Ja/q0pIKZIYPBTQ4nZnvchTM4ivwPof45iO4CTK37lfik
	uVjXI=
X-Gm-Gg: AYBFou3IkhMiLJFeV3OcvE10tzHpJ0hnVb4r5H5vHOYNgPxgi6W7GeBjV+dflqU8v6Y
	FhygfSadN2x+2h5zuQ5j8UA27TBLEAn7AdbvKm48qLvq5eMWRNAKONzm1gyyq356+PxGDE0mrki
	jBMmeIc0OMM0EDILlyZF6tPfjYoI+0t97A3L5Am5v2VzerMg/39MPkFDdlIuKvHReNlMVV+eB8/
	yOkHzSvx8xSgcStqYU2UJhQKXV8rvrx7/hrNMqM1FKZbffdSWKQ0Wxhdz68xPXDG74YhhCMggpR
	OfMs+InZNzZBLO6077vDNEUCIsa/XR9Udp/BH303uzai0J4WDGda6D480bKGiA33DjQz6Wkpyi2
	NU+/J8A2uJenZsh56d56kQ2x6YNcgR1AJ+fLw6UVLj9RAfzCLavjbo5eEXJ3IA2Tci0rgIvgFcQ
	==
X-Received: by 2002:a17:903:908:b0:2dd:c100:b2cc with SMTP id d9443c01a7336-2df69e1c3cfmr10374225ad.55.1790134108393;
        Tue, 22 Sep 2026 20:28:28 -0700 (PDT)
X-Received: by 2002:a17:903:908:b0:2dd:c100:b2cc with SMTP id d9443c01a7336-2df69e1c3cfmr10373955ad.55.1790134107861;
        Tue, 22 Sep 2026 20:28:27 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a5c3733sm3603525ad.41.2026.09.22.20.28.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 20:28:27 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 11:27:52 +0800
Subject: [PATCH v2 2/7] media: iris: move shared APV PM helpers to
 iris_vpu_common
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-add_iris_for_hawi-v2-2-016ec3d24b79@oss.qualcomm.com>
References: <20260923-add_iris_for_hawi-v2-0-016ec3d24b79@oss.qualcomm.com>
In-Reply-To: <20260923-add_iris_for_hawi-v2-0-016ec3d24b79@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790134092; l=12865;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=Xlbwl6Vx4+HGBNlzMqIIKgTeAZAgMjnSyrLdOon688A=;
 b=/DBn+w7lUN0YvQZsWrIa3iKaFhD6c0MhuVY/Qhz1Wv+DAvs1TmhAwQODqHkbhwcijAodvVt4Y
 ZYslWFCZaOiDXdzZFZsAm4LU+gJxm+3HiADlbPoi1MJTvITjucWkMgm
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-ORIG-GUID: BcQhtDEaZ-D-aPiku8aBkLx5WPCHLJhh
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAxMyBTYWx0ZWRfX4maff8so+eTW
 OYmDZQmOzXdP/78YsoEfdtAiwhID3rM+6qN8GwNOw4zo4g7Oq3xYgQyB8k4154nE10p5QmyhRQA
 AAv8Ox6spuXopBnyJ5IGUHf8eEBnYWo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAxMyBTYWx0ZWRfX/3lJSevOd3Gz
 0mt150HL5E7aMmndeAtJOThknpdcekGg9/4Vx7lauKh46Lz8HPWNHsikSFhdXfQv6Xm6r/Cel4W
 g1zeR77pE401VgWtVE6c0t3GxJ0IgjxyqWzS1DQ6A1LYgXnaGkXrt79OUZ1P+SmE0jj2KpRK62m
 zuJb6hY6HUIJ7knjnd+SxIW/MutlGdFk43Pl0U1ltaQzDr7mkpuVcpM7LLdaZaW/X8QYsb0G7kt
 GcOzzbPnb3qr2/GkVzRoSt1ex27WdSuk3SCx+8Nm1jPQii9YeZhKuEFGyQmp0TmV/+8U9A54fBo
 WSVVD57s1I/BJNTUy31R3KlMVFQN2ceWpeEa8b0IG5A2hpky3Bmm557E2mrZ7YwrCTeokCpBbzU
 E9JL96MnWBwgxFyWEsbYu2gYI7WL7V1EkzKtI6OZV0mVAA18x5Ude9XuB40Z7EeIBrVJoarlqvM
 DeMb7kqZILjAI4SMyyg==
X-Authority-Analysis: v=2.4 cv=N828hG9B c=1 sm=1 tr=0 ts=6ab3475d cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=jRDX25Ug_5KbIaVBG-EA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: BcQhtDEaZ-D-aPiku8aBkLx5WPCHLJhh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 impostorscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230013

The APV power on/off sequences and AHB bridge sync reset helpers are
currently local to iris_vpu4x.c. VPU5x uses the same sequences, so keeping
them in the VPU4x implementation would either prevent reuse or require
duplicating the code.

Move the helpers to iris_vpu_common.c and rename them with a vpu4x_vpu5x
prefix to reflect their shared usage.

Move the associated register constants, including APV_CLK_HALT, the efuse
control bits, CPU_CS_APV_BRIDGE_SYNC_RESET, WRAPPER_EFUSE_MONITOR, and
AON_WRAPPER_MVP_NOC_RESET_SYNCRST, to iris_vpu_register_defines.h so both
implementations can use them.

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vpu4x.c      | 105 +--------------------
 drivers/media/platform/qcom/iris/iris_vpu_common.c |  91 ++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_vpu_common.h |   4 +
 .../platform/qcom/iris/iris_vpu_register_defines.h |  10 ++
 4 files changed, 109 insertions(+), 101 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu4x.c b/drivers/media/platform/qcom/iris/iris_vpu4x.c
index 02e100a4045fced33d7a3545b632cc5f0955233f..93acbfa0f471fdec1cb75db732f37ef6c6ef5cbf 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu4x.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu4x.c
@@ -10,18 +10,11 @@
 #include "iris_vpu_common.h"
 #include "iris_vpu_register_defines.h"
 
-#define AON_WRAPPER_MVP_NOC_RESET_SYNCRST	(AON_MVP_NOC_RESET + 0x08)
-#define CPU_CS_APV_BRIDGE_SYNC_RESET		(CPU_BASE_OFFS + 0x174)
 #define MVP_NOC_RESET_REQ_MASK			0x70103
 #define VPU_IDLE_BITS				0x7103
-#define WRAPPER_EFUSE_MONITOR			(WRAPPER_BASE_OFFS + 0x08)
 
-#define APV_CLK_HALT		BIT(1)
 #define CORE_CLK_HALT		BIT(0)
 #define CORE_PWR_ON		BIT(1)
-#define DISABLE_VIDEO_APV_BIT	BIT(27)
-#define DISABLE_VIDEO_VPP1_BIT	BIT(28)
-#define DISABLE_VIDEO_VPP0_BIT	BIT(29)
 
 static int iris_vpu4x_genpd_set_hwmode(struct iris_core *core, bool hw_mode, u32 efuse_value)
 {
@@ -68,96 +61,6 @@ static int iris_vpu4x_genpd_set_hwmode(struct iris_core *core, bool hw_mode, u32
 	return ret;
 }
 
-static int iris_vpu4x_power_on_apv(struct iris_core *core)
-{
-	int ret;
-
-	ret = iris_enable_power_domains(core,
-					core->pmdomain_tbl->pd_devs[IRIS_APV_HW_POWER_DOMAIN]);
-	if (ret)
-		return ret;
-
-	ret = iris_prepare_enable_clock(core, IRIS_APV_HW_CLK);
-	if (ret)
-		goto disable_apv_hw_power_domain;
-
-	return 0;
-
-disable_apv_hw_power_domain:
-	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_APV_HW_POWER_DOMAIN]);
-
-	return ret;
-}
-
-static void iris_vpu4x_power_off_apv(struct iris_core *core)
-{
-	bool handshake_done, handshake_busy;
-	u32 value, count = 0;
-	int ret;
-
-	value = readl(core->reg_base + WRAPPER_CORE_CLOCK_CONFIG);
-
-	if (value & APV_CLK_HALT)
-		writel(0x0, core->reg_base + WRAPPER_CORE_CLOCK_CONFIG);
-
-	do {
-		writel(REQ_POWER_DOWN_PREP, core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
-		usleep_range(10, 20);
-		value = readl(core->reg_base + AON_WRAPPER_MVP_NOC_LPI_STATUS);
-
-		handshake_done = value & NOC_LPI_STATUS_DONE;
-		handshake_busy = value & (NOC_LPI_STATUS_DENY | NOC_LPI_STATUS_ACTIVE);
-
-		if (handshake_done || !handshake_busy)
-			break;
-
-		writel(0x0, core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
-		usleep_range(10, 20);
-
-	} while (++count < 1000);
-
-	if (!handshake_done && handshake_busy)
-		dev_err(core->dev, "LPI handshake timeout\n");
-
-	writel(0x080200, core->reg_base + AON_WRAPPER_MVP_NOC_RESET_REQ);
-	ret = readl_poll_timeout(core->reg_base + AON_WRAPPER_MVP_NOC_RESET_ACK,
-				 value, value & 0x080200, 200, 2000);
-	if (ret)
-		goto disable_clocks_and_power;
-
-	writel(0x0, core->reg_base + AON_WRAPPER_MVP_NOC_RESET_SYNCRST);
-	writel(0x0, core->reg_base + AON_WRAPPER_MVP_NOC_RESET_REQ);
-	ret = readl_poll_timeout(core->reg_base + AON_WRAPPER_MVP_NOC_RESET_ACK,
-				 value, value == 0x0, 200, 2000);
-	if (ret)
-		goto disable_clocks_and_power;
-
-	writel(CORE_BRIDGE_SW_RESET | CORE_BRIDGE_HW_RESET_DISABLE, core->reg_base +
-	       CPU_CS_APV_BRIDGE_SYNC_RESET);
-	writel(CORE_BRIDGE_HW_RESET_DISABLE, core->reg_base + CPU_CS_APV_BRIDGE_SYNC_RESET);
-	writel(0x0, core->reg_base + CPU_CS_APV_BRIDGE_SYNC_RESET);
-
-disable_clocks_and_power:
-	iris_disable_unprepare_clock(core, IRIS_APV_HW_CLK);
-	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_APV_HW_POWER_DOMAIN]);
-}
-
-static void iris_vpu4x_ahb_sync_reset_apv(struct iris_core *core)
-{
-	writel(CORE_BRIDGE_SW_RESET | CORE_BRIDGE_HW_RESET_DISABLE, core->reg_base +
-	       CPU_CS_APV_BRIDGE_SYNC_RESET);
-	writel(CORE_BRIDGE_HW_RESET_DISABLE, core->reg_base + CPU_CS_APV_BRIDGE_SYNC_RESET);
-	writel(0x0, core->reg_base + CPU_CS_APV_BRIDGE_SYNC_RESET);
-}
-
-static void iris_vpu4x_ahb_sync_reset_hardware(struct iris_core *core)
-{
-	writel(CORE_BRIDGE_SW_RESET | CORE_BRIDGE_HW_RESET_DISABLE, core->reg_base +
-	       CPU_CS_AHB_BRIDGE_SYNC_RESET);
-	writel(CORE_BRIDGE_HW_RESET_DISABLE, core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
-	writel(0x0, core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
-}
-
 static int iris_vpu4x_enable_hardware_clocks(struct iris_core *core, u32 efuse_value)
 {
 	int ret;
@@ -249,7 +152,7 @@ static int iris_vpu4x_power_on_hardware(struct iris_core *core)
 		goto disable_vpp1_power_domain;
 
 	if (!(efuse_value & DISABLE_VIDEO_APV_BIT)) {
-		ret = iris_vpu4x_power_on_apv(core);
+		ret = iris_vpu4x_vpu5x_power_on_apv(core);
 		if (ret)
 			goto disable_hw_clocks;
 	}
@@ -282,7 +185,7 @@ static void iris_vpu4x_power_off_hardware(struct iris_core *core)
 	iris_vpu4x_genpd_set_hwmode(core, false, efuse_value);
 
 	if (!(efuse_value & DISABLE_VIDEO_APV_BIT))
-		iris_vpu4x_power_off_apv(core);
+		iris_vpu4x_vpu5x_power_off_apv(core);
 
 	value = readl(core->reg_base + WRAPPER_CORE_POWER_STATUS);
 
@@ -353,9 +256,9 @@ static int iris_vpu4x_set_hwmode(struct iris_core *core)
 	u32 efuse_value = readl(core->reg_base + WRAPPER_EFUSE_MONITOR);
 
 	if (!(efuse_value & DISABLE_VIDEO_APV_BIT))
-		iris_vpu4x_ahb_sync_reset_apv(core);
+		iris_vpu4x_vpu5x_ahb_sync_reset_apv(core);
 
-	iris_vpu4x_ahb_sync_reset_hardware(core);
+	iris_vpu4x_vpu5x_ahb_sync_reset_hardware(core);
 
 	return iris_vpu4x_genpd_set_hwmode(core, true, efuse_value);
 }
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index e4847c1077097160cfc8324e807b4aabd9747812..a0129ed39cf2dfd0d56ecdc63d909f26f8acedf8 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -21,6 +21,7 @@
 #define CTRL_INIT_IDLE_MSG_BMSK			0x40000000
 #define CTRL_ERROR_STATUS__M			0xfe
 #define CTRL_STATUS_PC_READY			0x100
+#define NOC_RESET_APV				0x080200
 
 #define QTBL_INFO				(CPU_CS_BASE_OFFS + 0x50)
 #define QTBL_ENABLE				BIT(0)
@@ -501,6 +502,96 @@ int iris_vpu_power_on(struct iris_core *core)
 	return ret;
 }
 
+int iris_vpu4x_vpu5x_power_on_apv(struct iris_core *core)
+{
+	int ret;
+
+	ret = iris_enable_power_domains(core,
+					core->pmdomain_tbl->pd_devs[IRIS_APV_HW_POWER_DOMAIN]);
+	if (ret)
+		return ret;
+
+	ret = iris_prepare_enable_clock(core, IRIS_APV_HW_CLK);
+	if (ret)
+		goto disable_apv_hw_power_domain;
+
+	return 0;
+
+disable_apv_hw_power_domain:
+	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_APV_HW_POWER_DOMAIN]);
+
+	return ret;
+}
+
+void iris_vpu4x_vpu5x_power_off_apv(struct iris_core *core)
+{
+	bool handshake_done, handshake_busy;
+	u32 value, count = 0;
+	int ret;
+
+	value = readl(core->reg_base + WRAPPER_CORE_CLOCK_CONFIG);
+
+	if (value & APV_CLK_HALT)
+		writel(0x0, core->reg_base + WRAPPER_CORE_CLOCK_CONFIG);
+
+	do {
+		writel(REQ_POWER_DOWN_PREP, core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
+		usleep_range(10, 20);
+		value = readl(core->reg_base + AON_WRAPPER_MVP_NOC_LPI_STATUS);
+
+		handshake_done = value & NOC_LPI_STATUS_DONE;
+		handshake_busy = value & (NOC_LPI_STATUS_DENY | NOC_LPI_STATUS_ACTIVE);
+
+		if (handshake_done || !handshake_busy)
+			break;
+
+		writel(0x0, core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
+		usleep_range(10, 20);
+
+	} while (++count < 1000);
+
+	if (!handshake_done && handshake_busy)
+		dev_err(core->dev, "LPI handshake timeout\n");
+
+	writel(NOC_RESET_APV, core->reg_base + AON_WRAPPER_MVP_NOC_RESET_REQ);
+	ret = readl_poll_timeout(core->reg_base + AON_WRAPPER_MVP_NOC_RESET_ACK,
+				 value, value & NOC_RESET_APV, 200, 2000);
+	if (ret)
+		goto disable_clocks_and_power;
+
+	writel(0x0, core->reg_base + AON_WRAPPER_MVP_NOC_RESET_SYNCRST);
+	writel(0x0, core->reg_base + AON_WRAPPER_MVP_NOC_RESET_REQ);
+	ret = readl_poll_timeout(core->reg_base + AON_WRAPPER_MVP_NOC_RESET_ACK,
+				 value, value == 0x0, 200, 2000);
+	if (ret)
+		goto disable_clocks_and_power;
+
+	writel(CORE_BRIDGE_SW_RESET | CORE_BRIDGE_HW_RESET_DISABLE, core->reg_base +
+	       CPU_CS_APV_BRIDGE_SYNC_RESET);
+	writel(CORE_BRIDGE_HW_RESET_DISABLE, core->reg_base + CPU_CS_APV_BRIDGE_SYNC_RESET);
+	writel(0x0, core->reg_base + CPU_CS_APV_BRIDGE_SYNC_RESET);
+
+disable_clocks_and_power:
+	iris_disable_unprepare_clock(core, IRIS_APV_HW_CLK);
+	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_APV_HW_POWER_DOMAIN]);
+}
+
+void iris_vpu4x_vpu5x_ahb_sync_reset_apv(struct iris_core *core)
+{
+	writel(CORE_BRIDGE_SW_RESET | CORE_BRIDGE_HW_RESET_DISABLE, core->reg_base +
+	       CPU_CS_APV_BRIDGE_SYNC_RESET);
+	writel(CORE_BRIDGE_HW_RESET_DISABLE, core->reg_base + CPU_CS_APV_BRIDGE_SYNC_RESET);
+	writel(0x0, core->reg_base + CPU_CS_APV_BRIDGE_SYNC_RESET);
+}
+
+void iris_vpu4x_vpu5x_ahb_sync_reset_hardware(struct iris_core *core)
+{
+	writel(CORE_BRIDGE_SW_RESET | CORE_BRIDGE_HW_RESET_DISABLE, core->reg_base +
+	       CPU_CS_AHB_BRIDGE_SYNC_RESET);
+	writel(CORE_BRIDGE_HW_RESET_DISABLE, core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
+	writel(0x0, core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
+}
+
 void iris_vpu_set_preset_registers(struct iris_core *core)
 {
 	writel(0x0, core->reg_base + 0xb0088);
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.h b/drivers/media/platform/qcom/iris/iris_vpu_common.h
index 09799a375c1426d808ab5ea4fdfcac3a203e15b3..cc22c7459c4b77fdcb95b546fb8a55eea522bfb8 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.h
@@ -41,6 +41,10 @@ int iris_vpu35_vpu4x_power_off_controller(struct iris_core *core);
 int iris_vpu35_vpu4x_power_on_controller(struct iris_core *core);
 void iris_vpu35_vpu4x_program_bootup_registers(struct iris_core *core);
 u64 iris_vpu3x_vpu4x_calculate_frequency(struct iris_inst *inst, size_t data_size);
+int iris_vpu4x_vpu5x_power_on_apv(struct iris_core *core);
+void iris_vpu4x_vpu5x_power_off_apv(struct iris_core *core);
+void iris_vpu4x_vpu5x_ahb_sync_reset_apv(struct iris_core *core);
+void iris_vpu4x_vpu5x_ahb_sync_reset_hardware(struct iris_core *core);
 
 void iris_vpu_set_preset_registers(struct iris_core *core);
 
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h b/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
index 72168b9ffa7385d53d7190265d1c0922ee04a656..33f3d01cf79d763a62a2be9eac910a462bcd479b 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
@@ -19,6 +19,7 @@
 #define VIDEO_NOC_RESET_REQ			(BIT(0) | BIT(1))
 
 #define AON_WRAPPER_MVP_NOC_RESET_ACK		(AON_MVP_NOC_RESET + 0x004)
+#define AON_WRAPPER_MVP_NOC_RESET_SYNCRST	(AON_MVP_NOC_RESET + 0x08)
 
 #define CPU_CS_BASE_OFFS			(CPU_BASE_OFFS)
 #define CPU_IC_BASE_OFFS			(CPU_BASE_OFFS)
@@ -40,6 +41,14 @@
 #define MSK_SIGNAL_FROM_TENSILICA		BIT(0)
 #define MSK_CORE_POWER_ON			BIT(1)
 
+#define CPU_CS_APV_BRIDGE_SYNC_RESET		(CPU_CS_BASE_OFFS + 0x174)
+
+/* Efuse bits controlling optional hardware blocks */
+#define WRAPPER_EFUSE_MONITOR			(WRAPPER_BASE_OFFS + 0x08)
+#define DISABLE_VIDEO_APV_BIT			BIT(27)
+#define DISABLE_VIDEO_VPP1_BIT			BIT(28)
+#define DISABLE_VIDEO_VPP0_BIT			BIT(29)
+
 #define WRAPPER_INTR_STATUS			(WRAPPER_BASE_OFFS + 0x0C)
 #define WRAPPER_INTR_STATUS_A2HWD_BMSK		BIT(3)
 #define WRAPPER_INTR_STATUS_A2H_BMSK		BIT(2)
@@ -62,6 +71,7 @@
 #define WRAPPER_CORE_POWER_STATUS		(WRAPPER_BASE_OFFS + 0x80)
 #define WRAPPER_CORE_CLOCK_CONFIG		(WRAPPER_BASE_OFFS + 0x88)
 #define CORE_CLK_RUN				0x0
+#define APV_CLK_HALT				BIT(1)
 
 #define WRAPPER_TZ_CPU_STATUS			(WRAPPER_TZ_BASE_OFFS + 0x10)
 

-- 
2.43.0

