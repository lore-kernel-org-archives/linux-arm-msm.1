Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA2038B15E
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 06:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789369195; cv=none; b=WPhDhi+ss8aMYiAB6ZKM5xClKelROf1SvxeoC1zA27o7P6/VMF5gUvsQLns3XGGp2Z5GKXxO4K75VMF019/IeEGphLEo3Gmgc/9LaHPi9kAsCQuwoOWNW92I47rZaXHvjlodte4Ac5l5GLTFLTLQ8RmCcCxlFTVU04ctNw6xlMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789369195; c=relaxed/simple;
	bh=nOXnP/iY6bst/KJRTOQg5GrQmaZZBBNOB0W7mb26tik=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SzCUi9llBrNTAPeLgCTUMWs9EQmJO9EjodU8QQES4uR7haVS1LLpn6zrnD4No8XveCLDc4VVNJxm/7N3h5et2Lbv1iTyzkaMHdqgQNm1jOvJ6MijmavEg6bzSTBGhyAszn/0C0nyJorBL/oovmpTZF+LPJTY80NFx4AV+6Uuop0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KEr2VvsY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NgiSC9RN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KEr2VvsY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NgiSC9RN"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5jI9o3740650
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 06:59:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tH7K2OIsjroAHcXfCb8CrHS2nUB+Yko8u93m64FEdQQ=; b=KEr2VvsYBiXpCDNx
	ZLiL+4yUXXUda8Y+xovX8AWZFNCDXlbM5zV4/OCPIIlL9kJ4JtUPQ7iMCc51JKqW
	NC75WBI+oMVVy6PGg29q6QcLqGwEL4NsYYnxYejttwYrtBI2uaaTND65GOLRCbQa
	3ykdJJSUqkRCXtaF8S0A3xqmusQWiBr6fptkAPD5QKLOjdaFLkf11pNnJxvTCI1f
	cgMSu/uLNMny/3aUhfjWOUfj8f9vuJOjT0v46JfJLJsG9KSf7+hdvAvFuo0C5QRP
	eLjDD92Xz0einP+CUKkdz+LW41PjvSvWMML01c3Tzgfc2YOXpTcT/xESyuKCbo+9
	6CHfoA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9ddddb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 06:59:52 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cbedbd182f5so2330900a12.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2026 23:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789369191; x=1789973991; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tH7K2OIsjroAHcXfCb8CrHS2nUB+Yko8u93m64FEdQQ=;
        b=NgiSC9RN9r4bFoX2dEJvQPWb0HelDmtflLRoSEVFp7gbQJG4ArF9FY41fY1ClD/vOi
         wByl8UvkSQ4AOgeDuRKwpcO1liZ59PXtxaWCzjrG/YYRVt6U0+mhfBjSKgtiPrV9Evur
         jKycKPfLb34oMvLfjfMcqPtbd5T3NVe0owUIft/TquOIvZthoWGkEEIdpGmLUsSZmprs
         X8Fyngv+XnTbhL7BEO6PQpNt/TiwR+do+Dm2Z8QdQ6Lg9iRtVnGtPaAVDZNd0gt5xl0D
         l/t6/N45ZpuQAakWSshP4D7LwabnEGKK4jCA40GXms0mdtg/Fb6URSpyi54xHhoXjo0s
         FGuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789369191; x=1789973991;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tH7K2OIsjroAHcXfCb8CrHS2nUB+Yko8u93m64FEdQQ=;
        b=auXqvrRZI9YYnPHG41YuKzdzQsUPq4skEPtz4wuTJA+q4/4Wi8Yu1kwauEHFO4BLqD
         jVP4z3v7zU9tnT85vR2+Cj/gpB1c+ECiCGcxVx+JBxa/MFGUPMWLKmqG6G946Wb1oBZ9
         oiXr57ngJ86jT+JlwGSXNCgCrRXbbXXRqTJv3cXRjfrFMPnVhP2VDOKHvKwAWez6Hsu2
         VqprO4mLJjvLMTNn9C/spFHcN+vAbEHh5PmkwLO732eD4bn0vEWw3abXwIXnw9bCpP85
         lMG2CJeuesvX0boVEX4eXzqKcXVMHG0ITRxZfGe1hplBxeNNsr/OaSQkiz0oUZVK5p5h
         lKLA==
X-Gm-Message-State: AFuF++nJM0r8gzTiIWft1RR7NjDjL7o73rKjO0WX9VaqlIYtsthwvTG2
	yvppmmBU6nr/iw7IMHgLvC0OqomeJz96fX2JWH1Ub4J6UzqMR7uSlaFCvZoOM3IFk6krESkQSmV
	5d91M3EM3XVVDTHMiqhx1vuhJECdHp04AYhY4s9ih/KmGU9wKeFIxu9sglPhpDsTfNhVH
X-Gm-Gg: AYBFou18kbUpECVGhIdROl+tx1jOeHfZCYQ0MQaQpjbcfTInWdLlrxgmxknV4snDtxH
	ebhgeBDwWYaPW9AUUiDaT9TbaKM+kbqxXIKtgF+xnWXLsYTrrSGswdP9d4yNX2Aq10/Zt+vlzCK
	LDU/+kZJb/d4+DZnhdHAd0IpaA11i5n0gnGlDBIv+4IjYQqgk/HMUB0P84DPUyZAd1rlKs1MhRY
	8fm0aCvm9xhA5XFuKR569ykDX8sR3noHiO1m59J/fEg/iYgIl5vQMvGUjTFXThIY+XpVDHZ14d9
	l0VWq04Msau45J3VZjHZ3xYjB3aNw2RNfxObGUYBHH9oixYqZVYtVQnxHPs5JQ8/HgBGrIPO5v2
	nyKrcErN84OPyo5hOi8coOsAm5Cq9
X-Received: by 2002:a05:6a21:710c:b0:3d3:aed2:6f20 with SMTP id adf61e73a8af0-3db26f09602mr6871683637.20.1789369191198;
        Sun, 13 Sep 2026 23:59:51 -0700 (PDT)
X-Received: by 2002:a05:6a21:710c:b0:3d3:aed2:6f20 with SMTP id adf61e73a8af0-3db26f09602mr6871642637.20.1789369190765;
        Sun, 13 Sep 2026 23:59:50 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f55735sm25962177eec.24.2026.09.13.23.59.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 23:59:50 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 12:29:33 +0530
Subject: [PATCH 01/31] arm64: dts: qcom: milos: Add domain idle state names
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-b4-idle-state-name-v1-1-660c31187819@oss.qualcomm.com>
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
In-Reply-To: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789369181; l=5598;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=nOXnP/iY6bst/KJRTOQg5GrQmaZZBBNOB0W7mb26tik=;
 b=kAgE3Pk4zDlgeukeCZBkCV4JsiSU9Zg0h1UCLVQNi9+weLkMv7EAJFra7Ra0cRk4YXju5XZDz
 TWLHfvwCnrWA71djO3nSfDyUztTuliZ1sZ/qFl95BC5VyvTzz6MIxsQ
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDA5OCBTYWx0ZWRfX1O+jJKJhhWBW
 bUZ6ubiiar3B2NSIKx76zG3IWgFhuzHD5r/FC+zWZ09HK+Bu2jah/F04udWrN1yhBM8HlS3e+Y8
 GWzHvcalqCk7f/FOUbdlx7pgBlA9sw+NlaPBliBXzomsrM/w07evhilgBs8YhmvkfUcn0zw1AV0
 EofnIltmsBDwD1sMSdqKpUe5Zw2ubRX8h0yliunXcvQXRdNz96w5Ro1NE5g9pxdE1RPT8Y03FoG
 viAbmqhSC33bhWPS66GqsQP+sVRIFSZCZhjnLYQJZ4Bg9sHYPNdcISKXqh4oUFfoAqBpPISnr5+
 IS1o6gMLqCw0bnQL0pRhNho/Rj03dW1Y1WZmeR7e3/uraLca+J0YKaT+Hc3cyl0N5dMuWNn9vTy
 oWdLEV2FsmpHDOg3k1S2Du15aLjAxPkL1GF6S3S4y5gNgQoSabc3pZbE+IhhbJpLcYEZ1kG6USV
 NLk2soDdt4NNCCT0ZIQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDA5OCBTYWx0ZWRfX5mRS5eai0yFI
 r/cikaGOOIhYh/zXxTuNJ9FKnQVKx74H+Vivn20RGyf/pYOY0UnfNTG7fQGsfvszs3sH1OV4rLo
 cXu6JNMd1aWm9dPWl/mK0K+AU49ckZQ=
X-Proofpoint-GUID: BS3cLii9cNUQCSfzOOBxMFYTuFJ09sHR
X-Authority-Analysis: v=2.4 cv=OeUNnRTY c=1 sm=1 tr=0 ts=6aa79b68 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=cRs0z20fmAduSMiIlNYA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: BS3cLii9cNUQCSfzOOBxMFYTuFJ09sHR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140098

Add the idle-state-name property for the domain idle state so low power
modes are described consistently and its name is printed in pmdomain
debugfs.

While at it, fix the big CPU idle state name, which was described as
silver-power-collapse, and update CPU idle state names to match the CPU
type and low power mode they describe.

Use little, big, and prime CPU idle state labels for consistency with
other platforms using this CPU naming scheme.

Fixes: d9d59d105f98 ("arm64: dts: qcom: Add initial Milos dtsi")
Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/milos.dtsi | 38 +++++++++++++++++++------------------
 1 file changed, 20 insertions(+), 18 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qcom/milos.dtsi
index 87c9be29f973..68b3d06eec72 100644
--- a/arch/arm64/boot/dts/qcom/milos.dtsi
+++ b/arch/arm64/boot/dts/qcom/milos.dtsi
@@ -299,9 +299,9 @@ core0 {
 		idle-states {
 			entry-method = "psci";
 
-			silver_cpu_sleep_0: cpu-sleep-0-0 {
+			little_cpu_sleep_0: cpu-sleep-0-0 {
 				compatible = "arm,idle-state";
-				idle-state-name = "pc";
+				idle-state-name = "silver-pc";
 				arm,psci-suspend-param = <0x40000003>;
 				entry-latency-us = <250>;
 				exit-latency-us = <700>;
@@ -309,9 +309,9 @@ silver_cpu_sleep_0: cpu-sleep-0-0 {
 				local-timer-stop;
 			};
 
-			silver_cpu_sleep_1: cpu-sleep-0-1 {
+			little_cpu_sleep_1: cpu-sleep-0-1 {
 				compatible = "arm,idle-state";
-				idle-state-name = "silver-rail-power-collapse";
+				idle-state-name = "silver-pll-pc";
 				arm,psci-suspend-param = <0x40000004>;
 				entry-latency-us = <550>;
 				exit-latency-us = <750>;
@@ -319,9 +319,9 @@ silver_cpu_sleep_1: cpu-sleep-0-1 {
 				local-timer-stop;
 			};
 
-			gold_cpu_sleep_0: cpu-sleep-1-0 {
+			big_cpu_sleep_0: cpu-sleep-1-0 {
 				compatible = "arm,idle-state";
-				idle-state-name = "silver-power-collapse";
+				idle-state-name = "gold-pc";
 				arm,psci-suspend-param = <0x40000003>;
 				entry-latency-us = <400>;
 				exit-latency-us = <900>;
@@ -329,9 +329,9 @@ gold_cpu_sleep_0: cpu-sleep-1-0 {
 				local-timer-stop;
 			};
 
-			gold_cpu_sleep_1: cpu-sleep-1-1 {
+			big_cpu_sleep_1: cpu-sleep-1-1 {
 				compatible = "arm,idle-state";
-				idle-state-name = "gold-rail-power-collapse";
+				idle-state-name = "gold-pll-rail-pc";
 				arm,psci-suspend-param = <0x40000004>;
 				entry-latency-us = <600>;
 				exit-latency-us = <1300>;
@@ -339,9 +339,9 @@ gold_cpu_sleep_1: cpu-sleep-1-1 {
 				local-timer-stop;
 			};
 
-			gold_plus_cpu_sleep_0: cpu-sleep-2-0 {
+			prime_cpu_sleep_0: cpu-sleep-2-0 {
 				compatible = "arm,idle-state";
-				idle-state-name = "gold-plus-rail-power-collapse";
+				idle-state-name = "goldplus-pll-rail-pc";
 				arm,psci-suspend-param = <0x40000004>;
 				entry-latency-us = <600>;
 				exit-latency-us = <1500>;
@@ -353,6 +353,7 @@ gold_plus_cpu_sleep_0: cpu-sleep-2-0 {
 		domain-idle-states {
 			cluster_sleep_0: cluster-sleep-0 {
 				compatible = "domain-idle-state";
+				idle-state-name = "l3-pc";
 				arm,psci-suspend-param = <0x41000044>;
 				entry-latency-us = <750>;
 				exit-latency-us = <2350>;
@@ -361,6 +362,7 @@ cluster_sleep_0: cluster-sleep-0 {
 
 			cluster_sleep_1: cluster-sleep-1 {
 				compatible = "domain-idle-state";
+				idle-state-name = "cx-ret";
 				arm,psci-suspend-param = <0x41003344>;
 				entry-latency-us = <2800>;
 				exit-latency-us = <4400>;
@@ -411,49 +413,49 @@ psci {
 		cpu_pd0: power-domain-cpu0 {
 			#power-domain-cells = <0>;
 			power-domains = <&cluster_pd>;
-			domain-idle-states = <&silver_cpu_sleep_0>, <&silver_cpu_sleep_1>;
+			domain-idle-states = <&little_cpu_sleep_0>, <&little_cpu_sleep_1>;
 		};
 
 		cpu_pd1: power-domain-cpu1 {
 			#power-domain-cells = <0>;
 			power-domains = <&cluster_pd>;
-			domain-idle-states = <&silver_cpu_sleep_0>, <&silver_cpu_sleep_1>;
+			domain-idle-states = <&little_cpu_sleep_0>, <&little_cpu_sleep_1>;
 		};
 
 		cpu_pd2: power-domain-cpu2 {
 			#power-domain-cells = <0>;
 			power-domains = <&cluster_pd>;
-			domain-idle-states = <&silver_cpu_sleep_0>, <&silver_cpu_sleep_1>;
+			domain-idle-states = <&little_cpu_sleep_0>, <&little_cpu_sleep_1>;
 		};
 
 		cpu_pd3: power-domain-cpu3 {
 			#power-domain-cells = <0>;
 			power-domains = <&cluster_pd>;
-			domain-idle-states = <&silver_cpu_sleep_0>, <&silver_cpu_sleep_1>;
+			domain-idle-states = <&little_cpu_sleep_0>, <&little_cpu_sleep_1>;
 		};
 
 		cpu_pd4: power-domain-cpu4 {
 			#power-domain-cells = <0>;
 			power-domains = <&cluster_pd>;
-			domain-idle-states = <&gold_cpu_sleep_0>, <&gold_cpu_sleep_1>;
+			domain-idle-states = <&big_cpu_sleep_0>, <&big_cpu_sleep_1>;
 		};
 
 		cpu_pd5: power-domain-cpu5 {
 			#power-domain-cells = <0>;
 			power-domains = <&cluster_pd>;
-			domain-idle-states = <&gold_cpu_sleep_0>, <&gold_cpu_sleep_1>;
+			domain-idle-states = <&big_cpu_sleep_0>, <&big_cpu_sleep_1>;
 		};
 
 		cpu_pd6: power-domain-cpu6 {
 			#power-domain-cells = <0>;
 			power-domains = <&cluster_pd>;
-			domain-idle-states = <&gold_cpu_sleep_0>, <&gold_cpu_sleep_1>;
+			domain-idle-states = <&big_cpu_sleep_0>, <&big_cpu_sleep_1>;
 		};
 
 		cpu_pd7: power-domain-cpu7 {
 			#power-domain-cells = <0>;
 			power-domains = <&cluster_pd>;
-			domain-idle-states = <&gold_plus_cpu_sleep_0>;
+			domain-idle-states = <&prime_cpu_sleep_0>;
 		};
 
 		cluster_pd: power-domain-cluster {

-- 
2.43.0

