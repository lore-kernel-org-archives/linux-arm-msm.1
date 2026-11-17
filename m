Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794956456;
	b=kELo+93dXA+x/+Sb4jn98Y510GCTOe+fV/BAymiK8nNij0KcMC1swJJVj2CNw0vSJRAI
	 QBnObkM92DUzsGkPLcpXw2MnG2tQnZRQMVHGbK400hlVA4vJw5x0CMAJUY7UeA2XVynaV
	 /7AGpm01Q2kEDUPc9fy8fhE7ZzAC2Ko04lzYBa7EIAFGkZi9G+ISyzNbPPWsK34/8Kuaj
	 HYBIEN1ALX12OqzcjF2GrNteaegDAAdL/SOCT5B3dUXGbVtjvPepmpFkAoDCPfGeBR10L
	 fHmFNDWu7L3lO8WIRafabIORVaRLSfzFaRu1k+maz5ZeOyYSknXL/kia06vgtaKJxdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794956456;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=tjPMvS6dNIgWnwxHq7t2pgQdKhhFdoLT9gKd8NpYaXs=;
	b=p3f/ZpHHQqIpLI+FcCjxl3aPsNndakVvwwcdlRf4OoRigmKI/ZWJ4EDaRT96hUDy/tTL
	 wrEdvxBbEhjgRxDQpqsrjABxy0IG3g0nh5wYlNtES+8lRVp2v+gXpz3/C/iY4+9TCbF0j
	 w2acSbU6DitkCu5dkqEjZ7BaEqArYN3ea7yZAQdIdF7eeC28bTebjXdQNzLX6bo0CZhis
	 Y3LUE18Kvz9BQwI0b3Fpz7LLzWIP6ha86K+6tjGzqccjb8lE6I6RcHB7mh2bWjxbECMwe
	 quM6ugUH5/dw24hVBhz5qXtQT3aQh4BbbO+q9nmYNNbuujOowlmJGLKDhXd5WEyLBag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g3iKEJDW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kRk2Maon;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 324AD606A334
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 23:00:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 324AD606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g3iKEJDW;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kRk2Maon
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHMeslH4172026
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 23:00:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tjPMvS6dNIgWnwxHq7t2pgQdKhhFdoLT9gKd8NpYaXs=; b=g3iKEJDW7pcwY9Tk
	3PkHwbi6tdb1uTlCZBxozCD6XYBTtFgBDgscb1reT0I2gVnqEidafeh4Oy/6HU7u
	g2zcy7qYmOOxZMVIkv9grByjJcGYFBoPQrKLuhNcBOUwEw+aq5P/sU23usM5OI0l
	94tlYEFv8CNwqinrXNxse2XsXSbW5r/dOn/w3lwt9MqBz+PX56EOnMaR8I3Z//64
	rxnfYWUnrYDaRUTXvk9uRNfm45wCSkJHsq/Gb7sieQGcC0Dp/Lm0sVVTddQZOAf+
	9sY/q/4dApYPuOv7BRBC+CqFhRq1um0ikoWaqteZ/uqPy//3SQYJdqcdU2Zc+gCg
	zDAN3Q==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv882rx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 23:00:55 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3821eb27024so61190eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 15:00:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794956454; x=1795561254; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tjPMvS6dNIgWnwxHq7t2pgQdKhhFdoLT9gKd8NpYaXs=;
        b=kRk2Maon/sG/r7pPgtgFQ8Z8mc3n0Ilp9nKDP9cHcrCtDsYCBBXivLU6zzopIFUPDF
         yXbAeLtRtwf+iMeWj3Cl4QtRyFyjMmuaAIs9I3tJSNpTBT6NO3wwoIHxmJyD9LYHTd4a
         4F3ZX+VYf6jSYeQfSPibZTHsAiHXLKx58zZERLPVoXfn3+4N8upZyKzqBYiTvcunRMV1
         dM9Kgx3S7aZdGG1mi+QCe+sYZXP59Y++1C6Ie4RzXnrORC5mJR2CnHZ69nSJ/2DdUkuy
         rMAam97nZr5wIq6xQmAJw7wNMznsmVQ4u5EZ3gsYUyeQkBMdIfBAySz/yQSAqT11WHZ6
         6emQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794956454; x=1795561254;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tjPMvS6dNIgWnwxHq7t2pgQdKhhFdoLT9gKd8NpYaXs=;
        b=paoFXYYYTOJskMXfmTJ0+oDF9t/EBAheqgJaF4mCJJXAshQqASQtIcPvRMInF3kChI
         BOfBHisorauJZkqgoc0Sh7WiOg6Snq+CKt25PwTkGOjcstpCUARSSt2rcfcubsiISpmP
         OR2qdnl1+ABsQ4aN1uzyJYTHaf2OaQ3fx8+gEEthunh9eteshLfsf0nT9LpboYYhKJEJ
         EDg2Hl2AWQAb1lc80TiJotC5gn0WJDadjBAHKOaQDUIRgAqFut86XXh5947GR/D1LZdp
         NMspK/txxzPob1GpHDEo1+qdnDqd90g6FIlpMCkbZrG5z+Q0WFJYtrZcywofED5OtOGi
         U8Gg==
X-Gm-Message-State: APuU4Z9pcLekST9IFifJErIMy/Cq2xeYEdvMtVaak1k//pp1wyLogvI0
	fvV9sC9doET0Iep4+7g9741JT5e53B+uWr1m/+QG9orZtq0C1+gM6YR7uWpEOACpPlfolFJXo9X
	X8nk/Ajj+uL4IdqK9YAGA5nme+VbH9AvrKbmejfxMfILSG1VLYEvN/o492n2Sxs59VCUQ
X-Gm-Gg: AYBFou24KMmHTToaX9LY9HJ7x7aoxG85O5y+GASKun0BbrZswqMJV99bjxJ5s/hv/gu
	zj62m6/ocIsHxBibQLlGpSmzP3cq4O/Pdo/H1U4kogwln8yHFtbMmaqygou54yDElCy/esJVD4J
	v4ZNFOvROiCbHgu33YbVs039A1U0MzhnpheTv3w9s7D481rgBbo4EAmJxL8/EosSe8of2whVLd/
	6bnqe7p6qiAJ2nPfuf82fb1XIjHSmwXT0OXDLtUdGofue/27mRC9UD0g2j9V0pDGd++8/CFnODY
	14nRg/mzZYTvCfnoFbgpBBUJ8nBjJHxKvuXJHlIOqlC9atpd5dWB3+Wi+odnV86Mgpba4ZZie5k
	KgG9wHdsXv25MeME+NJkIXZV285EJvj6v21FNstSuJ6nL8+Xs4BRenU5ca3wufBYEFzVbgLEDEQ
	==
X-Received: by 2002:a05:701a:8458:10b0:151:2e62:fe4b with SMTP id a92af1059eb24-1b543cdf789mr948012c88.23.1794956453966;
        Tue, 17 Nov 2026 15:00:53 -0800 (PST)
X-Received: by 2002:a05:701a:8458:10b0:151:2e62:fe4b with SMTP id a92af1059eb24-1b543cdf789mr947951c88.23.1794956453138;
        Tue, 17 Nov 2026 15:00:53 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5445eb29esm1380839c88.0.2026.11.17.15.00.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 15:00:52 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 04:30:06 +0530
Subject: [PATCH v2 3/5] arm64: dts: qcom: nord: Add GPU and GMU nodes
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-nord-gpu1-v2-3-8d6d9908b7c5@oss.qualcomm.com>
References: <20261118-nord-gpu1-v2-0-8d6d9908b7c5@oss.qualcomm.com>
In-Reply-To: <20261118-nord-gpu1-v2-0-8d6d9908b7c5@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Shivam Rawat <shivrawa@qti.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794956423; l=4762;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=xyYYgqzcHaqG6oN0uFpCZ3eFSIuUWGDcbZDkjY5Kcic=;
 b=5UxRY37gGgict8xRQRg+ixx8UaW6DFONQtSdqc6NcTDJvUa9OR3MHLVLYYFAcnS5GdS1TuycV
 fEobgq7L4YKC2N62k/Wh8HGLMHpWCdcDZflTH+YN7AEQNagWDkbr56q
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: r8a0HaO6rSUrvbrxKCMPJyh5d7cf10ji
X-Authority-Analysis: v=2.4 cv=N9u8hG9B c=1 sm=1 tr=0 ts=6afcdca7 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=FdsHoUj-PjsiTO6IAGgA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA5MSBTYWx0ZWRfXxVcnCf43OEhd
 bZY7fhgkfTYiRPhtrV85q6tiY1tCDavyi3JImrVyuHbPU7gh/mlp8iQc8rFsZAbUCmwt2raxq/A
 q7Z0Iu9LMsydg+5k7w3WVa4mNn3epgKQ7SIIUWB1RE/5RPtWpN2OzEaeu2UHXvGb1cxzIKfHEl0
 0ws30abMJs0Wk6ix0bJeuXLUsxLJEY2H+LKilNG4Rz7Cc25sJNG74ZLieYo563YbKKrWIYIePg2
 Qp5zAfcQU6DSvEuzJn6aEhtdh/jykJsqw6sXm1aYvx4SFbRETB06l5l3Xig5+Uk8fAXy94yuoo0
 S51x6velkTwdpnYzXhKjsE8zB8cZBfs7VLInOyMELROAS78ZdL/gkIxRHhFhfhF5VQD83lXZ5px
 CzIulKAy9qLKRrJ9pkgejPTAhmlOOcbpgcevzmN9PIfMprGE74EBXOd+FCojkbi0Nr23kTnUgM7
 3CTCmUqsgEqxdXdTejg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA5MSBTYWx0ZWRfX4O3sl9Fi+xrw
 93ON26ZKkYWaqKraFdAQhfgaVbDGEcOVUveJ2r8liiBiZ/6UKzhbcC3L8xtOBMDIjEMz+KNSkBT
 WUddXXb/cI1JVTRG9JzbYsBX+iV7Dv8=
X-Proofpoint-GUID: r8a0HaO6rSUrvbrxKCMPJyh5d7cf10ji
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_05,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170091

From: Shivam Rawat <shivrawa@qti.qualcomm.com>

Nord SoC integrates an Adreno 753 GPU as its primary GPU, belonging to
the A7xx Gen3 family, along with its Graphics Management Unit (GMU).

Add the GPU and GMU nodes together with their OPP tables. The GPU sits
behind adreno_smmu_0 and uses the gen71300 zap shader, while the GMU is
clocked and powered from GPUCC.

Following the existing Nord split, the SoC-invariant properties (reg,
interrupts, iommus, zap-shader) live in nord.dtsi with both nodes
disabled, while nord-embedded.dtsi adds the clocks, power domains,
interconnects and OPP tables that are only managed by the OS on the
Embedded (non-GearVM) variant.

Signed-off-by: Shivam Rawat <shivrawa@qti.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-embedded.dtsi | 79 +++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/nord.dtsi          | 43 ++++++++++++++++
 2 files changed, 122 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
index 5a1520e436c6..e9e830bb727a 100644
--- a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
@@ -76,6 +76,85 @@ &crypto {
 	status = "okay";
 };
 
+&gmu_0 {
+	clocks = <&gpucc GPU_CC_AHB_CLK>,
+		 <&gpucc GPU_CC_CX_GMU_CLK>,
+		 <&gpucc GPU_CC_CXO_CLK>,
+		 <&nwgcc NW_GCC_HSCNOC_GPU_AXI_CLK>,
+		 <&gpucc GPU_CC_MEMNOC_GFX_CLK>,
+		 <&gpucc GPU_CC_HUB_CX_INT_CLK>;
+	clock-names = "ahb",
+		      "gmu",
+		      "cxo",
+		      "axi",
+		      "memnoc",
+		      "hub";
+
+	power-domains = <&gpucc GPU_CC_CX_GDSC>,
+			<&gpucc GPU_CC_GX_GDSC>;
+	power-domain-names = "cx",
+			     "gx";
+
+	operating-points-v2 = <&gmu_opp_table_0>;
+
+	gmu_opp_table_0: opp-table {
+		compatible = "operating-points-v2";
+
+		opp-500000000 {
+			opp-hz = /bits/ 64 <500000000>;
+			opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
+		};
+
+		opp-625000000 {
+			opp-hz = /bits/ 64 <625000000>;
+			opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
+		};
+	};
+};
+
+&gpu_0 {
+	operating-points-v2 = <&gpu_opp_table_0>;
+
+	interconnects = <&hscnoc MASTER_GFX3D QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "gfx-mem";
+
+	gpu_opp_table_0: opp-table {
+		compatible = "operating-points-v2-adreno",
+			     "operating-points-v2";
+
+		opp-468000000 {
+			opp-hz = /bits/ 64 <468000000>;
+			opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
+			opp-peak-kBps = <781250>;
+		};
+
+		opp-625000000 {
+			opp-hz = /bits/ 64 <625000000>;
+			opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
+			opp-peak-kBps = <6075000>;
+		};
+
+		opp-735000000 {
+			opp-hz = /bits/ 64 <735000000>;
+			opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
+			opp-peak-kBps = <8175000>;
+		};
+
+		opp-854000000 {
+			opp-hz = /bits/ 64 <854000000>;
+			opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
+			opp-peak-kBps = <10687500>;
+		};
+
+		opp-1000000000 {
+			opp-hz = /bits/ 64 <1000000000>;
+			opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L1>;
+			opp-peak-kBps = <12450000>;
+		};
+	};
+};
+
 &i2c0 {
 	clocks = <&segcc SE_GCC_QUPV3_WRAP0_S0_CLK>;
 	clock-names = "se";
diff --git a/arch/arm64/boot/dts/qcom/nord.dtsi b/arch/arm64/boot/dts/qcom/nord.dtsi
index 617e5312f4c4..36a422db8ea6 100644
--- a/arch/arm64/boot/dts/qcom/nord.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord.dtsi
@@ -1712,6 +1712,49 @@ tcsr: syscon@1f60000 {
 			reg = <0x0 0x01f60000 0x0 0xa0000>;
 		};
 
+		gpu_0: gpu@3d00000 {
+			compatible = "qcom,adreno-43051701", "qcom,adreno";
+			reg = <0x0 0x03d00000 0x0 0x40000>,
+			      <0x0 0x03d9e000 0x0 0x2000>,
+			      <0x0 0x03d61000 0x0 0x800>;
+			reg-names = "kgsl_3d0_reg_memory",
+				    "cx_mem",
+				    "cx_dbgc";
+
+			interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
+
+			iommus = <&adreno_smmu_0 0 0x0>,
+				 <&adreno_smmu_0 1 0x0>;
+
+			qcom,gmu = <&gmu_0>;
+			#cooling-cells = <2>;
+
+			status = "disabled";
+
+			gpu_0_zap_shader: zap-shader {
+				memory-region = <&gpu_microcode_mem>;
+			};
+		};
+
+		gmu_0: gmu@3d6a000 {
+			compatible = "qcom,adreno-gmu-753.1", "qcom,adreno-gmu";
+			reg = <0x0 0x03d6a000 0x0 0x35000>,
+			      <0x0 0x03d50000 0x0 0x10000>,
+			      <0x0 0x0b2a0000 0x0 0x10000>;
+			reg-names = "gmu",
+				    "rscc",
+				    "gmu_pdc";
+
+			interrupts = <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "hfi",
+					  "gmu";
+
+			iommus = <&adreno_smmu_0 5 0x0>;
+
+			status = "disabled";
+		};
+
 		remoteproc_adsp: remoteproc@4c00000 {
 			compatible = "qcom,nord-adsp-pas";
 			reg = <0x0 0x04c00000 0x0 0x10000>;

-- 
2.55.0

