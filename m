Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC6023FD96B
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 12:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785156714; cv=none; b=Up7Sghu9VdqssaCh4ZWr/MD3dT8IvjhVtpvidu6x7ctK/Gz1ZZj9W1wrfFN/zUGdlwJQvZtkOyOE4RWKHDHB28NaGfk9qOU477y59+nIqrWYBwDfUVCfEaDizVsdj1LNKcUhVOeUThatYXW1rvhKTivngy9LuQtFSyh6AkGcDvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785156714; c=relaxed/simple;
	bh=Zigf5R7b2I5cUKEjbnROS3f+gam6GdHTVSDXmFq9vqQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A8tgMLGg4psrA/UUPyISbTiqwdv+1vgBMJ63hXOi13F3GDD5U0NjjzLmvGqC9I7TK+fku3eu7VdXt8o2cvai9Hyi8Qtkfde0C+lwSBDKgNiZ1HhMnmwkKB2yRUhwLKUQtGv1pISFrqBGpb7/O1hl91ZtRyH81ZjHw9ypb5irAfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CQk6EGUY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fnJFcMfi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CQk6EGUY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fnJFcMfi"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RAM3SE392062
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 12:51:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wQ7CfWL7VjqzSliEjgE5Vwzz64hVTC8NxStAlihdF2c=; b=CQk6EGUYi+fjVe9N
	uKqEb8C0IfFTsd1DU4PN9n9omhhKHndoNkhho8yEv716PuJAtddDtBd7ZLVmhAmM
	/ar+eKLo8edn0LdGNF4aN700iZ8aLbQ+rYd6+/jUaOxM5tjVoN+UbWNjTl5TYeuh
	gMlbGNoQq9MJRhC+sFGcOb1yVhnu/5e+h+ViZDyZGVA2ai2uYFSc3ev4pQ6kV5aN
	Vk5EAwmxUdIkmgeQ5SCUQwD9zQNXcSr22C6rZ9vj7MKj+rwSdzaqkaUVLtuD+/CJ
	lMYfdDdA8jqJKNqRdZB6voWJtdWADHd2skPFBbg1J0GFUXpowaBRNYjIC6XE2NKU
	uHUaig==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fny9wj0eg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 12:51:51 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-ca8aee88725so4064842a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 05:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785156711; x=1785761511; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wQ7CfWL7VjqzSliEjgE5Vwzz64hVTC8NxStAlihdF2c=;
        b=fnJFcMfi2mcDYwLDUazOHpWkl4KjZkUfIaSD0Q0NH35hpZcssEr3LpIXv/oq75GDio
         pLzApZIvSFjNWfWI+u3vZgmYrYrWw6Jv1jApJfeVfsVYG0supXAiZDjRJ81M6ig3FUjc
         r9ZIDzue3QkhIb4SX1qG2Zl7LSPzMO8g64xJXqQs8hOxn1eDjPQFDVY0a8DXPSvssFog
         cW4vJwg9gej5Wi1Zq4NGcvBULbd4mZNAg9nV0s2wFztyU/E8iXiDQMjhP38x8C1jvbCA
         Dr3CzBVQPJDuuts1bx/0VYvPThL6PnSQEXKsqHKAzlFiVpdVPRVtZ1xBzap2R6OO2e23
         wU3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785156711; x=1785761511;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wQ7CfWL7VjqzSliEjgE5Vwzz64hVTC8NxStAlihdF2c=;
        b=NeFyVzbCDuf7kO2yqExv1soU3hWyJ8mPsY0vujZcJ6CEKyYLqnhKn5n0I5eVOxm1R4
         LsUXD7Ul4/Ak/KXtivMt/p6MPeARJUpVNhu2bRgvXef2pfpspfvBy+8aWkepnlaf8s45
         F1k0WhGhPP0koUFOeB1wi8gR74rT5c/Fxfjm98SDKeDJF2g3hq/NAhNZpYQRE66QKC9M
         rMyOBrcDy+AXOXPFdiuX18/lyWJQ6g0ZiW3jX6TtL3MBaXx6VP20hdLDPm5JGFI4c4DQ
         lItCNRgshiouZLlaAwJyKF9R/+hgam3y+ssMBkO006pNCiNJ46N6Efq59Y0KtqJle/KB
         uAIA==
X-Forwarded-Encrypted: i=1; AHgh+RpVw9fiADKGSJ5aV+yOJCAx5hx3YD9GnuKX2qVt6iYe3Q4pg1RZ8UlERS8DaymYidIp0D+m0NVTZXRhdPmR@vger.kernel.org
X-Gm-Message-State: AOJu0YyjsPgIKNfrt6LLrlpAPOHUGJSPHrkFKbokT0kgWRBBlEVj5NCK
	W6oUlj1sjlEqilHccoaoJqcv21sH0DZ1fo5BA/xtpx8dhsczEsxr6OIPhVGYUP3g6UN0zz/q1k0
	TQ5eepoKsVyHkAhJg2f0hteaCrO7ynsWM0vj7nOJqFNX9aSibk2MJXWi3zdyN5ZvqNw5Q
X-Gm-Gg: AR+sD11B4FxMx78ONWUiTS04Wdj5hv82K2AXyMr/GZ6uwexDnDH4CNXvQizfdlNqEIC
	sadaEfZ6tdUD7ex5e/QzUOQjve+D4ZFskZUSKdPL8IwF5vUipc2bO4yMToEvW1AjrqS1nVArEbu
	z7ka+GXLkcgJ68B5dltRPsM3xPpXoI1bHMtjgxXJrmOeCt4DKjXKPIV3zbNS+DFKMp+WueF5Hix
	Fdiv6+c8pnr0RCJDXhTwPBHp/9d1HfmeO8mCT09PxYlFk4POnxS+AREsMr7YZf2sr56Z20sQzXP
	L1yYScEaQz6rJ0xRTEzTe4rCBJOpVi+PaxigjYQr8SXR/ScFExv/Ua6FjKqC2Rsuw3GcTeE7Ign
	nu0r7HFfrFRhn9UxdY3q44ZF22e8L033rCuz5YtbODeAIvQOdmTmEo7a96XzixcE7
X-Received: by 2002:a05:6a20:a10d:b0:3bf:d1f9:b1df with SMTP id adf61e73a8af0-3c6c26d1db7mr522064637.54.1785156711347;
        Mon, 27 Jul 2026 05:51:51 -0700 (PDT)
X-Received: by 2002:a05:6a20:a10d:b0:3bf:d1f9:b1df with SMTP id adf61e73a8af0-3c6c26d1db7mr522034637.54.1785156710905;
        Mon, 27 Jul 2026 05:51:50 -0700 (PDT)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc3e878esm32263425eec.3.2026.07.27.05.51.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 05:51:50 -0700 (PDT)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 05:51:39 -0700
Subject: [PATCH v3 2/5] arm64: dts: qcom: Add Kalambo SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-b4-kalambo-crd-v3-2-25280faceece@oss.qualcomm.com>
References: <20260727-b4-kalambo-crd-v3-0-25280faceece@oss.qualcomm.com>
In-Reply-To: <20260727-b4-kalambo-crd-v3-0-25280faceece@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785156707; l=3763;
 i=gopikrishna.garmidi@oss.qualcomm.com; s=20260102;
 h=from:subject:message-id; bh=Zigf5R7b2I5cUKEjbnROS3f+gam6GdHTVSDXmFq9vqQ=;
 b=fNPXw/xmSh4ExOLLgPQtn7kP3w1ueZajVeAcxssU8AXY2kbseJUKT8b202eFVdEb8Q5mQBp1m
 2ZWjzd4q9SrDKcevk7ski9weS+juEHBNzXCV2M6twO25anKyhlXATMF
X-Developer-Key: i=gopikrishna.garmidi@oss.qualcomm.com; a=ed25519;
 pk=TkSjNEhrfsj90i3wkABTZtAjLNr2cfYsujaTvyOIDsE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDEyNSBTYWx0ZWRfXybinUwHAPKgv
 cLvDmCyYbk2jP0IMqm3CWcVKN3RFrrD+pZUOCZiEJV3Po/j3b8sGBQhpV2virESSaBXOv2NHj59
 y0AqCG+sKazb1ucK5PP9xatuz0EYvU3XVS9f7onnVUZSlW49L+Hqgmx9hm+/SkTaz3rWx9K1oS9
 6ufwCXYlc/cPUHtqsFheV681DgW4RzK3eJ3/G93gsozEcnpK0R0by1Ts8gw6PJkPntgBRl4bKlL
 EA4GS0qm4NT1t+73ZBdZpKmbD9Q6DhtBcuvfLEcWYbkZoDKU4cgx94Zc0IGsqmEmVojwQWG1M7G
 Y58ZVDoD6JcNuD8ofdbCJEwnMOekY7wJDNWlpqUgE73a1AI8gsqtSmcuG2MXu8G9mjU/bRgFRmT
 IHfj99RStXYOQxd4pGk3f1wwQv707j27RixCXeiMop2/ITfXHVUfAp5hV+p4PYhtgV3Un6ApKs8
 WxxbXDiuaA0n79p3GCw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDEyNSBTYWx0ZWRfX4cbCB/uP0gdc
 yFTx89JiFCPBwipgExkszqNgEvO2+2NR1wtsUGEAkoaP09eECrFPj28Uwcb45+z+j9L8xTlohK2
 w6AXGSWKQh6kob6tZdrEvfoekOYEAmY=
X-Proofpoint-ORIG-GUID: y8yToH_mR1NhC42nEr0_axXj3Lr0E9Xp
X-Authority-Analysis: v=2.4 cv=E4b9Y6dl c=1 sm=1 tr=0 ts=6a675468 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=DvfzKPj9uRxjIkiPLEYA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: y8yToH_mR1NhC42nEr0_axXj3Lr0E9Xp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_03,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270125

Introduce support for the Qualcomm Kalambo SoC. It is derived from Mahua
with CPU cluster 0 removed, leaving it with just cluster 1 (cpu6-cpu11).

The surviving cluster is re-added to the cpu-map as cluster0, since the
kernel stops scanning at the first missing clusterN index. cpu6-cpu11
are reassigned to SCMI performance domain 0, as domain 1 is no longer
present.

Kalambo uses PDP1 whose tx shmem (lpri1) sits at offset 0x200 within
imem, vs 0x180 on Glymur (PDP0). This pushes the tx region end to
0x380, requiring an imem size override. The rx shmem (lpri0) stays at
offset 0x0. The PDP mailbox addresses are overridden to match the
Kalambo SCP firmware.

Add labels to the cpus and cpu-map nodes in Glymur to allow derived
SoCs to delete and redefine the cpu-map entirely.

Co-developed-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi  |  4 +-
 arch/arm64/boot/dts/qcom/kalambo.dtsi | 97 +++++++++++++++++++++++++++++++++++
 2 files changed, 99 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index f32af66a3f1c..6094e741ff34 100644
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
index 000000000000..4a68115a4286
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/kalambo.dtsi
@@ -0,0 +1,97 @@
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
+&pdp0_mbox {
+	reg = <0x0 0x17610000 0x0 0x8000>,
+	      <0x0 0x1a980000 0x0 0x8000>;
+};

-- 
2.34.1

