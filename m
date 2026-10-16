Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A6F046D096
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 10:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792146632; cv=none; b=lsanou9npKiV8Ef6qtiRwtMjzTv+2kdtwzKqJtyiHAjzJDIngvwVRn6p3LDVEePZ9/Hf1DkeHfWmrBbIV6kARuf6d5YTJsYeeqI+bayWfWs7WQW5eDID1G8FkYGToC2qynvcEYaj5n4e6p/UZMFHdjqq9RgeI0r5IklIwOg/eBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792146632; c=relaxed/simple;
	bh=GoRKEl1QcpxUJ0V7hnwRGMwCfAGRHFP+5vl1D/LSwSI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z92ijC3TRpmLVuPVHXrlPAazFWPzExyyDas/cr0z6mIHETUuy6WPnR2e56VIFCd8i5X9y18wNgocPjCytqM0fXdcsFC8KsZiLKau4W+dR3CTATLKpa/HN5ykri4q2AN0r5hpd353nm4cXlN0VfXu99adntMua/L0GvrMGp6DSo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JnyabWDE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d/9qyQiu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JnyabWDE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d/9qyQiu"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GAAPer488768
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 10:30:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2PxnHNXSS4gZGAJvTsPj+nkZKsvN53cfpYDLY/XuHE0=; b=JnyabWDEdNuBHWMg
	vSIQb8/tbfY1GMWYAk24toRxNyO8Jo5MLKxwhqXQH064sz/ymJpUVbFkADUhSr10
	/se+ywRmm5EXrCuDry5NKDRGkidvOmbIij4dRmDEwuAQfJHV/hJSLKK8Y87cOdO4
	zdoP1IlyiZDmrZHrP3JoJfhpkdNfVFgs97TO9boRxOZmrjX33F8OmbPGnZnxwI0m
	BgJ0sXq/W801qDM6ewr7EbSqg9j0JrONBDMRWEGVodyA9mqtM5sdNA0TSS6fzP6a
	lsB+ZlTw/K1kW/i1CVcC8mV/nan0PR7GdNAZFZX/0VS46wqwzCttyT1USjVOL1/5
	hB9tEA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbcjt9dh1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 10:30:30 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3a4a0017549so10110377a91.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 03:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792146630; x=1792751430; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2PxnHNXSS4gZGAJvTsPj+nkZKsvN53cfpYDLY/XuHE0=;
        b=d/9qyQiuLj2DhISDnKpHqNRm4SkVZQNYViIxau4abnV/INZNt4pYBffNOcxV5WNwXH
         6MGixsExWTExhhi97uoZ4sMFpgB3WdonIBxJZHHilvKXR4+ooq1Eo1CZvbcsoZMLK7Ff
         jXqJJw7Iybv6apgd+KXf4Qw0mtmSgPXK3T+aNcfFs8iHhEJeqa6ySgQog9VhIUHldBHv
         JBlEnOF3rVcalb8RhwCXNlfF0HCljj+Mv739KukYuEesuZ4IOM6+W/am+jzys/YSXByw
         K0+mU6rvudK5mVCy8IvuZam2xGHv8EXmxAagPDQAcqqN4gXmKGCYUD070ttkRurQZjWU
         ZWXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792146630; x=1792751430;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2PxnHNXSS4gZGAJvTsPj+nkZKsvN53cfpYDLY/XuHE0=;
        b=T77zTmeMGMdTb9Wfd3TPwbKTt6gYyKUXyHMg91+iDE+QSVDK9TtvZZa/DpVs9uBw8p
         HglZJASxv+uURKnH1MdtRCkvpgkbSfnynMLR6bmh2O8u5uhVLTKdSXVr+4ARK18tqX00
         S3BIgABeVmrZQMKmRdyJ1zCrexkjCUylXYJ9XhuL78sxrUJcR7k/Kj9U3gXdpc9PivVJ
         yvnCQ58BX8zRFxujvHmQt5zejCR+wrP/NLKFDud2heTf3Bn562jgnqTVtvOdkaAaHtVe
         iZg4MpPX1HciHADa0V7PFoVIReGGdfraC19z8v0wo4eGzP6jiUyfN0tMlVrprdaCNWd9
         rDiw==
X-Forwarded-Encrypted: i=1; AKwUvByT74L93+O0garzH5knrkmBKVKQ0WeUBbwjGg3LnsYgXl9+ppIuuC2rI8vCsYrCcGuNSpoq2VbEb22DZ+8H@vger.kernel.org
X-Gm-Message-State: AFq9FYLuYBCHKpkcdK3rz9QbYpBm7L0DWdGf/DrPlSFfw/jXlE9zJApF
	3J90/cV7hXA9MXLiKED0Um7MZohhIc7mdMtKMVpee7hiF78kBdIgPFAJZEceAfyjhs45ltCmebg
	ywk1Sl58MUWYGnGXLOV6o5S+iBcF/ZCXBfg+6lnmu6zHRhqMbamSzlGQzmN2hCfdDdeNn
X-Gm-Gg: AYBFou3+Wvn86GvU5FaDmvvSKkIeuYKPxrRY8+RggzMSn8Svt9JRUF+42rtaY3fWHGl
	i29Y4IQFxf8z4hQjaKduPc+vlfIxZBEa6o84P4a47PFxXmeTbUz4G73h75blH0l4gBVKgrF18iA
	j/KaGQK9u1OArwaCgewEB7+Nmzwavt8cSJjlcq80sJpzdVK2xgZb8K1s+mEkhiY09/aiHXKlyV9
	Kbgr6Qt5gRgyyzXXNViweZHjn3O50qbOAXNRUQUHpY6UyJk0NHUzBCrMMnuCc43UjcSP7Ru9DYd
	7zYqCXr9T8x5/JNG6RvQsqjD2ThSlaRXaaDYbFgAJ0UEhpUI4BOPrsC4wfY41ONNjOW+m90hKzx
	GjanH850mnEGLkcZRBVuSpokG5KIUIegHPgB+6Et0XpXf/Z6Pa4LaXZSUJNeQdQY=
X-Received: by 2002:a17:90a:1601:b0:3ab:884b:65b7 with SMTP id 98e67ed59e1d1-3ab884b6b8cmr10257779a91.25.1792146629797;
        Fri, 16 Oct 2026 03:30:29 -0700 (PDT)
X-Received: by 2002:a17:90a:1601:b0:3ab:884b:65b7 with SMTP id 98e67ed59e1d1-3ab884b6b8cmr10257759a91.25.1792146629272;
        Fri, 16 Oct 2026 03:30:29 -0700 (PDT)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acd403c212sm961696a91.4.2026.10.16.03.30.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 03:30:28 -0700 (PDT)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 03:30:22 -0700
Subject: [PATCH v9 1/2] arm64: dts: qcom: Add Kalambo SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-b4-kalambo-crd-v9-1-11e6a40b68e2@oss.qualcomm.com>
References: <20261016-b4-kalambo-crd-v9-0-11e6a40b68e2@oss.qualcomm.com>
In-Reply-To: <20261016-b4-kalambo-crd-v9-0-11e6a40b68e2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792146626; l=4824;
 i=gopikrishna.garmidi@oss.qualcomm.com; s=20260102;
 h=from:subject:message-id; bh=GoRKEl1QcpxUJ0V7hnwRGMwCfAGRHFP+5vl1D/LSwSI=;
 b=4eqGjy2UXK3dZqiPSP4uMz0z5yFZtSB6ZZKXYmfd+O4k9mfknUGYcKGbZCG+vICM4PDVkPoaE
 4NbTI0GCxx1BGey9jmR1d4RGLcK8bAcpC6o0G5STMfZt1PXP3JelIss
X-Developer-Key: i=gopikrishna.garmidi@oss.qualcomm.com; a=ed25519;
 pk=TkSjNEhrfsj90i3wkABTZtAjLNr2cfYsujaTvyOIDsE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA0MSBTYWx0ZWRfX5GZl7RzXEgpz
 La7KJCXhTqtxkJykbXjHFKUlRMrTzOgNAVZfG9bA1Fwbbehd6jjn4Up8c3rF34v9MnjYtGHGGCR
 bGJbvxwnnz2WSSiVa2/bTTvvCqJwEWGfz5tuG+A+8Y+h8mG3sBFs1tulw7xlg5kbEX7ZAcRGb6X
 w1oqqFyXTRJkN0HiD0WjCWmD8qKDYSc/QJCnEN6OjdqIBWPSICTvV9M0deV+m68xrKJXvC1N41C
 86zNzg5Uesmjr630XCLdTkm6ITJrV+4ZhHbZVMHwYk4bqGn3+glNOaJo3x5I0ITZ6UdSXZbCanN
 cHy86epacWsPlFA55IVtcoGBAC3luUTFG1eA3ooZ8uDjGYVFnHkfsBtvJj4wvM4ftA1UJM7sAxI
 DBEoYJqvzl2DTaJXjSxg6+rYKZ0/DAKt+l9CB9yRtzRxqGhj8PQZWG5orBbA5b/B/qFlURWsdYM
 c3dmMIPmp+HpbEMDTeA==
X-Proofpoint-ORIG-GUID: Bx3B3F9g5faCFL48NBgvh-0_W0Hlg2bN
X-Proofpoint-GUID: Bx3B3F9g5faCFL48NBgvh-0_W0Hlg2bN
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA0MSBTYWx0ZWRfX0wg8V1OgGW6R
 QtTsBML7SM6bH39Qt/AhKbdNr0t9Nsmo4wKHuUZjERIMoBecFPOHPVgZ1m8Xb0av5yJ9IFX6vTm
 PfenR5EsHjH2Aourl/SPVJ+QARXqr9g=
X-Authority-Analysis: v=2.4 cv=VpS2kO2n c=1 sm=1 tr=0 ts=6ad1fcc6 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=uk4ur7h3pE5DHNqPdj0A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 phishscore=0 clxscore=1015
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610160041

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

Since Kalambo does not use CPU cluster0, disable bwmon_cluster0 to avoid
unnecessary traffic while retaining its shared cpu_bwmon_opp_table for
bwmon_cluster1.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Co-developed-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi  |   4 +-
 arch/arm64/boot/dts/qcom/kalambo.dtsi | 123 ++++++++++++++++++++++++++++++++++
 2 files changed, 125 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 65a398c0a992..c88215d0b265 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -35,7 +35,7 @@ / {
 	#address-cells = <2>;
 	#size-cells = <2>;
 
-	cpus {
+	cpus: cpus {
 		#address-cells = <2>;
 		#size-cells = <0>;
 
@@ -273,7 +273,7 @@ cpu17: cpu@20500 {
 			#cooling-cells = <2>;
 		};
 
-		cpu-map {
+		cpu_map: cpu-map {
 			cluster0 {
 				core0 {
 					cpu = <&cpu0>;
diff --git a/arch/arm64/boot/dts/qcom/kalambo.dtsi b/arch/arm64/boot/dts/qcom/kalambo.dtsi
new file mode 100644
index 000000000000..868b924c4734
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/kalambo.dtsi
@@ -0,0 +1,123 @@
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
+&bwmon_cluster0 {
+	status = "disabled";
+};
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

