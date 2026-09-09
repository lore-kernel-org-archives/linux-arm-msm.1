Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3208A43E49A
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Sep 2026 07:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788938304; cv=none; b=YwQIm/ViAdbPv1EdcUkJNF0dvdd3JJNep/nInDqEPF18k624n90tlnRSsfD6ySV1ero4wnjb8yKrcgbmH7RAIg+GDnPLLbE0cUxAojqBHUxOI3q3GDt+6bJ9mtRRibp1Qtb3C10GqrZVcK/oZqwdCt+dzdddNBzrnTwfB4aIK6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788938304; c=relaxed/simple;
	bh=Z9pXeXRK71lbmOtAqQ6lI9hOJ2OhWhwmA6Q0ecc3L8A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cFmM9BIjHVXov6DiUKkVtusJpiYz1+TySqbui5JejIr2iUfPmGo0/o2+oNBX1pQRA5Hrs6mT1SD6XcOSALHcqV1Ma73JxEb/AWR5oH+PfnAhtJtSyaBAIuxBCMlxrj8u77ZXsaUikES7z4KubKODuCLS1HVhvjM5ci9o5jbL4Hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FpA1Wb/i; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ONqul44o; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FpA1Wb/i";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ONqul44o"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6896EtBE3818244
	for <linux-arm-msm@vger.kernel.org>; Wed, 9 Sep 2026 07:18:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KZ/X1RA6sssm3uzMAF4vcjz8LNFaNNi8btc44J6t3b4=; b=FpA1Wb/ibUsm0md3
	SrvGuKkU+Ji+5/pPVw0TwVI2e8M/uwWYiKKO45zz/5ZdY7k91fLNCCsv6aH2Scyn
	0YH7tMVp62/EguJrkm0wTayM2aU7S2/93BqCo+Iu8e7RXPiY1DM1QBUMhZ1iI6bz
	LmFvGElfO81WiLMaHZJ4PtNA7r5WKpXf60Xe8yRF8AL2dFwiIzH1wrbV/L/OzeTf
	+uabgx35qyXWP0oLQLJFQDmFD/fuYDbu6h0Y0Aluo/mPLsxsu+2Pm8GxL8kh8YGV
	3rEZqVqhaMVafnIqUwPPQueBbJzK7G+TvBAetvn6aza2LV13jFEWQXSTD1d6Rkjq
	DZLEig==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjstua02w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 07:18:22 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cf7dd9fd91so54353115ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 00:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788938301; x=1789543101; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KZ/X1RA6sssm3uzMAF4vcjz8LNFaNNi8btc44J6t3b4=;
        b=ONqul44oflsBqbjuJLW2yx5nnv9q42nuhDwr22vObGrOw1j7P+6V4wvKdQHv4yBa6k
         EKw6MtlODx5ySm/MYmT3cQ8a++K/cUC6F9xDwkdhDt9IPvzV604hn+z6C0Dbg9oGadxu
         hEUXcL3eiQ/hte+HlhgA/x0rRO5f9ocwE43U5vKVoLtWeZwH+KVyWdIjiK5TrMtgBeP8
         P/c9omX0ZsuwA29u8FZ/74b+P25ZShnn52O7WDGAsUh1fUHcB0l4sz9TjM5OqCNK73aY
         9/WmEPQtWkXLSyfZNw5dOZsds6nwR9J0qqJVhpsQmtmcXujc+xDQ+bVpK/JJcoaXRyJD
         l4xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788938301; x=1789543101;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KZ/X1RA6sssm3uzMAF4vcjz8LNFaNNi8btc44J6t3b4=;
        b=Wg5x8KPNhMGq2BLE7VAKyjYU0hfk2xd4L8V2KqnI9GWRWV1xvcBoFhpJXc+ZbXPucb
         ybjXzBH74uXPFyyOv+2r/p7QgkJrkKfridWxdUvBTrFtaxlLT9deIu9i4wPjFteSEBKB
         LgHbAOXlnQ9bxHwodIJQ+Zr+uy5Mgkliy2cE+bWFpbQvAUIyNXAWmJo7ep8Pz5ZA6xaH
         yhd1VmFrN0bfGcoyuN6/o+6qw8QSRCWvAAJbq0B05SFcl6KoL6ZPlWl+JI4isRo84w1Z
         VVB8cDfx4G3GnyxEaDcLBwO32QjT/fKmUNAFO7hUd6d+DDqGWoS9sY06Xre+4ROCa1bL
         Bkcg==
X-Forwarded-Encrypted: i=1; AKwUvBw+ynuVZa7Ws5OqWyOIoqyhirSaQbSjWnf3uhh//m3gF76aCd8L+Yog/D3sDmiQzjgTyaTzTKfANk0nHnSY@vger.kernel.org
X-Gm-Message-State: AFuF++kpf8DM0ipQzzbGw/LbmA+Ryunl3Praf5vq0eG6Iw8G4vDyQTbq
	gAAJhALecId8atjlcgHBUPBAZvJpcXw1/Z2ZBizF8Ilo6It2tmsnVnI4+YbBo2005Fk/WFceGcT
	WWsT0Pjla1yWDyg4i2D4EaiNS977Do91mcBf76c/3G4qGWEcDVTjy7tZ5bR6vx05FOkID
X-Gm-Gg: AYBFou203gfMyWxGOm34yAmJKYzWNmSCBwX6qImqmWWyYu33qYuiClV6xMFuVgieB0+
	PqqAFr/7FYggFyo3cS6hlTRirFCEkjQLUrSpMcHqGPxjMgxfUamDPy2kTUI6Uf/T6Yyb6F83T3f
	pUT+UGP72MtzwLVugC9uBafoDgf3bPutSBuE4+MgxIWvUQIv9KyMvVOzlo46HJeq7KCzX2kqlKP
	409pRelDVNiO/wyvaECtp5bG3ZG3FnT+/3zVboU+dTRISx7VGu9bWFv2fXAau2DtijpiRlOPjau
	PmEAzf4N/xTfHrURfUVkR0iqdcykt6wE7Cw+WSpD4fJUy1OOBolbBeR6M7iLlxc0UW+KWdvriFC
	M7jd4W18y+t/lWl26J1V7r+u8xIR1WmyJOet5IwcpK3BYH9KnQ/z0PXFEcOy25/C2
X-Received: by 2002:a17:903:4b4b:b0:2db:2376:6e8a with SMTP id d9443c01a7336-2db2376762bmr405414555ad.9.1788938301544;
        Wed, 09 Sep 2026 00:18:21 -0700 (PDT)
X-Received: by 2002:a17:903:4b4b:b0:2db:2376:6e8a with SMTP id d9443c01a7336-2db2376762bmr405414085ad.9.1788938301004;
        Wed, 09 Sep 2026 00:18:21 -0700 (PDT)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339a534df1sm48308536eec.7.2026.09.09.00.18.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 00:18:20 -0700 (PDT)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Date: Wed, 09 Sep 2026 00:18:15 -0700
Subject: [PATCH v7 2/5] arm64: dts: qcom: Add Kalambo SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-b4-kalambo-crd-v7-2-f5685804478a@oss.qualcomm.com>
References: <20260909-b4-kalambo-crd-v7-0-f5685804478a@oss.qualcomm.com>
In-Reply-To: <20260909-b4-kalambo-crd-v7-0-f5685804478a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788938297; l=4607;
 i=gopikrishna.garmidi@oss.qualcomm.com; s=20260102;
 h=from:subject:message-id; bh=Z9pXeXRK71lbmOtAqQ6lI9hOJ2OhWhwmA6Q0ecc3L8A=;
 b=fLo6KY8dDde41V/VCEH3FRDzBUD/ORTzGkyvWmQyfRd7sBhX9JPvkBuPf3sD7GBhDXPAE2ffV
 53m5Z1P66PrAYzIRAKP9x8oNZeBubaSy3qIJ1XphuLabkavYEN51wjT
X-Developer-Key: i=gopikrishna.garmidi@oss.qualcomm.com; a=ed25519;
 pk=TkSjNEhrfsj90i3wkABTZtAjLNr2cfYsujaTvyOIDsE=
X-Authority-Analysis: v=2.4 cv=ItAutr/g c=1 sm=1 tr=0 ts=6aa1083e cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=uk4ur7h3pE5DHNqPdj0A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDA4MSBTYWx0ZWRfX2ogkeWL/sldA
 ql+npauSRjB84J7lnQQp+ayvnAelJltGSoXxf3Dd/ERTIlFRWyOFuAE32Aa1bJ/HfvE5AwX2KQ5
 0NFWmH1MgNzMjRLtSY1a7K4ph42lGSQ=
X-Proofpoint-ORIG-GUID: blFQYAQMMHXStXWmVZgvejQ_957YC4Ss
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDA4MSBTYWx0ZWRfX1Ru6g4KVUTvR
 jCvZHVRz8ugPRwCLsJM/3Sc4453B71km3SZAOfHZCG+zAIQxLg0pCrwwCF4UYmaADUcBYTxvd9o
 pA5L3HJSCEMOOgywgd76IzvsutIOxdUUVVLPWje3cu7wVRQuxroCUd55GHnco9AtUGauMe1Hbe4
 hkuUeTG6S+5fZeACM8xVQby1Ja134+1My1A0shwu+VQWp/IwNvXKNDo+g9CwSXnQhB4zEfAHhO5
 yCl2SKJygmCuFHKthlHiaZNE6KP+nxEn0ksZTU8votrf1FtNv3w3qfYLY7irBhjR842Hh4G1CGd
 R4Z2OayYdeh1G9Q6RnQfuZK4vOpbCrVfHQgIy476nBnvL8/aJ2nXbZ8RPTnAKtJJc3K2uz007fh
 aSLhV4EIs7NeAaXTkzMxJ4IYFg6BVrVniLJaLPI0HYl+1Tim3RbaFRIBnsTWTlk5kydNiO/cMQX
 cMFXtD7+OdqhG+p9UuQ==
X-Proofpoint-GUID: blFQYAQMMHXStXWmVZgvejQ_957YC4Ss
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0 phishscore=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090081

Introduce support for the Qualcomm Kalambo SoC. It is derived from Mahua
with CPU cluster 0 (cpu0-cpu5) removed, leaving only cluster 1
(cpu6-cpu11). The surviving cluster is re-added in the cpu-map as
cluster0, since the kernel stops scanning at the first missing clusterN
index. cpu6-cpu11 are reassigned to SCMI performance domain 0, as domain
1 is no longer present.

Kalambo uses PDP1 for SCMI transport. The tx shmem (lpri1) sits at
offset 0x200 within imem, pushing the tx region end to 0x380, so the
imem size is overridden accordingly. The rx shmem (lpri0) remains at
offset 0x0. The PDP mailbox registers are overridden to match the
Kalambo SCP firmware.

Kalambo's PDC input mux differs from Glymur. Pins 109 and 110 carry
tsens6 and tsens7 alarms, which are absent on Kalambo, and pins 134,
138, 156, 158, 172, 181 and 202 carry gp_irq_hvm inputs with nothing
wired to them instead of wakeup GPIOs. Override the PDC ranges to
leave those pins unmapped.

Add labels to the cpus and cpu-map nodes in glymur.dtsi to allow derived
SoCs to delete and redefine the cpu-map entirely.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Co-developed-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi  |   4 +-
 arch/arm64/boot/dts/qcom/kalambo.dtsi | 119 ++++++++++++++++++++++++++++++++++
 2 files changed, 121 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 624a9edd602c..682c6f3d5769 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -36,7 +36,7 @@ / {
 	#address-cells = <2>;
 	#size-cells = <2>;
 
-	cpus {
+	cpus: cpus {
 		#address-cells = <2>;
 		#size-cells = <0>;
 
@@ -274,7 +274,7 @@ cpu17: cpu@20500 {
 			#cooling-cells = <2>;
 		};
 
-		cpu-map {
+		cpu_map: cpu-map {
 			cluster0 {
 				core0 {
 					cpu = <&cpu0>;
diff --git a/arch/arm64/boot/dts/qcom/kalambo.dtsi b/arch/arm64/boot/dts/qcom/kalambo.dtsi
new file mode 100644
index 000000000000..8e2077d9d0a8
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/kalambo.dtsi
@@ -0,0 +1,119 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include "mahua.dtsi"
+
+/delete-node/ &cluster0_pd;
+/delete-node/ &cpu_map;
+/delete-node/ &cpu0;
+/delete-node/ &cpu1;
+/delete-node/ &cpu2;
+/delete-node/ &cpu3;
+/delete-node/ &cpu4;
+/delete-node/ &cpu5;
+/delete-node/ &cpu_pd0;
+/delete-node/ &cpu_pd1;
+/delete-node/ &cpu_pd2;
+/delete-node/ &cpu_pd3;
+/delete-node/ &cpu_pd4;
+/delete-node/ &cpu_pd5;
+/delete-node/ &cpu_scp_lpri1;
+
+&cpu6 {
+	power-domains = <&cpu_pd6>, <&scmi_perf 0>;
+	power-domain-names = "psci", "perf";
+};
+
+&cpu7 {
+	power-domains = <&cpu_pd7>, <&scmi_perf 0>;
+	power-domain-names = "psci", "perf";
+};
+
+&cpu8 {
+	power-domains = <&cpu_pd8>, <&scmi_perf 0>;
+	power-domain-names = "psci", "perf";
+};
+
+&cpu9 {
+	power-domains = <&cpu_pd9>, <&scmi_perf 0>;
+	power-domain-names = "psci", "perf";
+};
+
+&cpu10 {
+	power-domains = <&cpu_pd10>, <&scmi_perf 0>;
+	power-domain-names = "psci", "perf";
+};
+
+&cpu11 {
+	power-domains = <&cpu_pd11>, <&scmi_perf 0>;
+	power-domain-names = "psci", "perf";
+};
+
+&cpus {
+	cpu-map {
+		cluster0 {
+			core0 {
+				cpu = <&cpu6>;
+			};
+
+			core1 {
+				cpu = <&cpu7>;
+			};
+
+			core2 {
+				cpu = <&cpu8>;
+			};
+
+			core3 {
+				cpu = <&cpu9>;
+			};
+
+			core4 {
+				cpu = <&cpu10>;
+			};
+
+			core5 {
+				cpu = <&cpu11>;
+			};
+		};
+	};
+};
+
+&imem {
+	reg = <0x0 0x81e08600 0x0 0x380>;
+	ranges = <0x0 0x0 0x81e08600 0x380>;
+
+	cpu_scp_lpri1: scp-sram-section@200 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x200 0x180>;
+	};
+};
+
+&pdc {
+	qcom,pdc-ranges = <0 745 38>,
+			  <40 785 11>,
+			  <51 527 4>,
+			  <57 533 10>,
+			  <70 546 4>,
+			  <75 551 18>,
+			  <108 619 1>,
+			  <111 622 19>,
+			  <130 717 4>,
+			  <135 722 3>,
+			  <139 726 3>,
+			  <142 251 5>,
+			  <147 796 9>,
+			  <157 806 1>,
+			  <159 808 4>,
+			  <171 4104 1>,
+			  <173 4106 8>,
+			  <182 4115 20>,
+			  <203 4136 4>;
+};
+
+&pdp0_mbox {
+	reg = <0x0 0x17610000 0x0 0x8000>,
+	      <0x0 0x1a980000 0x0 0x8000>;
+};

-- 
2.34.1

