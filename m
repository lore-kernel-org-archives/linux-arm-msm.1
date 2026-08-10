Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 447883A9639
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 08:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786352086; cv=none; b=MCD4XV7yXCDo6/wpECgZnwfAhmQtPZXlJ2Y/yP4NukPDWv8GU3ksH9AX5BcMnxi/YXMo+yggwXJ8+3EmqyirLOWhHxBECx/nSFU8a4fN1kj5RF4b+jq7ZQqRCZGIVHhuFgsP7xwhvIhDonYrGWYhhiAEGZ3o/V4Si8FhrdhFpNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786352086; c=relaxed/simple;
	bh=Tg/K+cg6BJjJH5ymV7zVbsjUQUFaIbEZ14TAFCX93fg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XgXN1QsyXKPi6CJVz0ya8Wuq3yi2W37J//frp6FrfKByNBc4wAA6KoLWYxhv4OQwgnwJFnBPX2QohtEG22r0jQVCk5/bBWscJtBTKM43WJkk4JB6YdBf9R1kOPOw/hpX++K0/nAiVQO04EcNOxQWKYhKpdoXl2/CIQUlyingGJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VDVUid2J; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eIn9CRzL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VDVUid2J";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eIn9CRzL"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67A5pWrq1240654
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 08:54:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UgCm9OScu1LsfJhBZjjul7L7EwySmfOkDDKAvpBvh2U=; b=VDVUid2JSEN9bE9x
	D//rfhp6je6JsVewjkrd4L/wZu7sNI1jWFV3C5dEL1aF2v6T8ZXhMWZRlYv32fmH
	UIOvTLvszbjM0aQHF3dZxq3LmWh0a4tNX4Izbj3e7YYD914X1WA1yY8YJxBCovNt
	ScxT8N0Zc+rHVrZxEalaxpFw5BK24yYgUm21jqPxIFOybUaVsLmiCleE16SxalVf
	zddqt0Q0WmN09bu12ut7KvX0E8D/NjtPxzEcx9enr/PNdMPkAZ3v00BKdXK+6mke
	TraTwb21SWoRly5v2vYYxfuLRF2jhXxjfHnp35EN6W/B+N0oyV8x7AW7Ia61Natn
	60KoCA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fy8v3rj6k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 08:54:44 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cb5bdd8450dso1255276a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 01:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786352084; x=1786956884; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UgCm9OScu1LsfJhBZjjul7L7EwySmfOkDDKAvpBvh2U=;
        b=eIn9CRzLGwfZSkZwkU6bwV2eQr9AHyUwB2XAO1+oZbAe3Z8FJyCLNMYXqBHysjCugz
         OLosaacKhEfPL7lRIvPsi2n3z7nbE9fVCp32qkQtI4DzEY37nP6s7LCKM84KqXCu1AY9
         bTFVBuVlvcfIIcuJEjJXx4dRVUKWj5192QpazuLxOkV/6NvIyilj1DCekel/WGCvlHpe
         d7MFsmSVHWgQsikxq/1LYNk9ylB+CVTs0Fwb5QW64hyVxWnKwDYjHh6+iV7G/nAHmD1m
         C4HmCHBKFOiysX+o+Km6SwgHCxft2kbIPkmGuPtnKKED4DquOWhklAHKnyXD+Ru+zB79
         cOig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786352084; x=1786956884;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UgCm9OScu1LsfJhBZjjul7L7EwySmfOkDDKAvpBvh2U=;
        b=LdjePXb0p/QjBAhoL82/itCH9dLY2fKZk1iuggspzMbepmt33KplfqIeGL7vZpmLn4
         8tGUg3TJzzoOAV9S/mjTda18aWIGm8QP+bFDpiF/YcYul6g3bbzXUhn/WlUpoHuCl3Xg
         AJgdNVPp3o3i6aGh5JqjI2vQEVbys7fMVYENAIwJAGLjz+HQTdVS8BIKJfvCZiRxh24d
         dsJglqUoJAvThgmsDYxyxPJ2S/InEyv3nhxk9Blq4vlR9BkDA0a2U3UYVKxXYb0xqIiy
         xiJ55WqOAsQZoHHOUrO83IFTtXA4jodWZkivnhpsrQJ6nrX+LSeOOzoc6nhTL1oPM+0z
         xj7A==
X-Forwarded-Encrypted: i=1; AHgh+Rp08uFVLWHc4Z4LwjjC1Lhyz57w+qWoE/JRYOy5Xbowm2InbY3G9DD2egQNPPKifNnvQYRJGeGC+MTdjyvb@vger.kernel.org
X-Gm-Message-State: AOJu0YwlGRTU6szdNdFGGLZelygnwVRGo7SAAsBH2aj6O8J8VJs6nwhH
	Lo7I/Iow0cl1tq99lxZhAvyQKX4Q3sY2b+sW1bEgKaZCWwWpV7hozFjhRfTu6/ru1HHDeiP6MWK
	fxkTCkFhQOGWhQM4CqjiaAH6FSggvpgmw1cte69gPF/zwppvvx/dPxQmCSWvUk//WCv65UYqdxK
	BjdlY=
X-Gm-Gg: AR+sD10jalcF0GTEDlfJBBu2RauhDOP9rKoKQt9/zNLu5L7W+LZn/HH/CEQkruKxuPH
	64TuqS8BPxeWqZ7aMJs2PVItFSztZGkTcwtKWx1Xvgg+E+0O+QFnvmSpHKJi1NjFQ7+Ch4Jwdke
	BomLUZSxrDpAp3s0N8Y2Zoh0KK7njLqgT7+p7DFnUdL1v4m/i4PnuLsqlfaqZYNlwvdsUYBkyyX
	Xq1IxgMmc/6Qt4f9ChVwqGArk1tBbHsg66fYRk7cm0xybkiU4WnXVcpeMJQyorCOy8t++NeKJJK
	T+Jxp6E33vZ2qls2M7D1my41rjzeDRuoIMG+6HhRdLVMGdU6yYfMSVJOVhlc1P1m7lO2b2uyAqP
	DsmhMEFaK0cG2fS4k6zS2YW+vrQBNMU80uFlarTIx/u+JjhIM0yMzlO8VbwdQubRd
X-Received: by 2002:a17:90b:590e:b0:38e:6a44:671b with SMTP id 98e67ed59e1d1-3909d301d9cmr28807714a91.0.1786352083640;
        Mon, 10 Aug 2026 01:54:43 -0700 (PDT)
X-Received: by 2002:a17:90b:590e:b0:38e:6a44:671b with SMTP id 98e67ed59e1d1-3909d301d9cmr28807662a91.0.1786352083139;
        Mon, 10 Aug 2026 01:54:43 -0700 (PDT)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3925ff69eabsm11840085a91.15.2026.08.10.01.54.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 01:54:42 -0700 (PDT)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Date: Mon, 10 Aug 2026 01:54:33 -0700
Subject: [PATCH v6 2/5] arm64: dts: qcom: Add Kalambo SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260810-b4-kalambo-crd-v6-2-744e8ad1dae9@oss.qualcomm.com>
References: <20260810-b4-kalambo-crd-v6-0-744e8ad1dae9@oss.qualcomm.com>
In-Reply-To: <20260810-b4-kalambo-crd-v6-0-744e8ad1dae9@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786352079; l=4546;
 i=gopikrishna.garmidi@oss.qualcomm.com; s=20260102;
 h=from:subject:message-id; bh=Tg/K+cg6BJjJH5ymV7zVbsjUQUFaIbEZ14TAFCX93fg=;
 b=ioVx5QLIw1yk6zK0rNKh6nLb2WZpFi3+b++dI8wkF1UndwE6BhoSc4oqmYELqXBghWMvxYQhh
 9mVzouNXf4gDB8ph697l49FwUeWRMSi/FMvu7kjEAL27Fi9Wt+nIppW
X-Developer-Key: i=gopikrishna.garmidi@oss.qualcomm.com; a=ed25519;
 pk=TkSjNEhrfsj90i3wkABTZtAjLNr2cfYsujaTvyOIDsE=
X-Proofpoint-ORIG-GUID: E6qMWNVWLoDP2CiTjr34J_fSNd_0ACmt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDA3NiBTYWx0ZWRfXymLL02O9ejod
 yYcraDtM6epigJX14Zu4CeLxeZ0sMB1hAywYzbdp2jve26js4MJRbMfG73CI+Z5bVmife9CXNnK
 FErf8bTqO23Zp894wuDfVIM7FkCalFWsqLjMmcQgvi/G9j39yXkedGCkT3QEC0QQIe/B5UOyKaf
 lzNoWJlbErSQiYJkPimFYtrizwbX1NsYxFnWyQfebfu7soj2K1YOtC7n42DHmvDEe6WtmSMgNrX
 iH7hZLjbOfHEtVjO/t06CTUOji4om1fH/6wM4qESfIixhBsRTIpBFjh60cD+uHp26ODDC+APZ/u
 E5nuxyDVsS4YtkYf7WvNbYz0LNv2NaGShbgUW3zxS9mAuXJpsuSyHBJDrgqU4+SJLwQI+7VC9qy
 0/vfmuYokUZF+9vRBzJ0IBJo4k6vLnV32Mtwvp12tLIpRshiPB+JZuUrM6hpGvl8aLcYJeiDX6y
 tgtgS0KwSX6FfLsE3kw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDA3NiBTYWx0ZWRfX0QuZF7rXFgkW
 eJ3YQrvb6L5UVNRhbTaAKMlFIl16VfUiVh6y/xlYYZWuqV3dxlPB9QLoUn27GzdifNoPUv2pLS9
 qBYr2S7u5b4bVKHXrY6kmDVKgXg9yKg=
X-Proofpoint-GUID: E6qMWNVWLoDP2CiTjr34J_fSNd_0ACmt
X-Authority-Analysis: v=2.4 cv=c+mbhx9l c=1 sm=1 tr=0 ts=6a7991d4 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=uk4ur7h3pE5DHNqPdj0A:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_01,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100076

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

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Co-developed-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi  |   4 +-
 arch/arm64/boot/dts/qcom/kalambo.dtsi | 119 ++++++++++++++++++++++++++++++++++
 2 files changed, 121 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index f04058d2e089..11f20751e7b4 100644
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

