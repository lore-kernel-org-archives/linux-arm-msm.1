Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF0043A83B1
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789369281; cv=none; b=rXGQCc+6lbn+Da1c/FmbqxYNk7ruiOAfznWaW8KmmG6Ap3kDkaxv9261o5ok5kuZh0ZF5PL6k2IeUfRieus5gCZ74Z7YvX3ce0W5s5cpf5Fwoza6yOKkq+4eSpfJ6Hzx9ArYa3ExwJCr0NklSS1x7b6u+dNmsTZWe6jv2Gdhw/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789369281; c=relaxed/simple;
	bh=xgLpMCNINwFqqPVBT78gS2XsaLcIC4OX980DPAxnCFg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uJaOUxrq8tWYBkq5aTRvALi8Ex99Ph7ug645SGczQlfMz2Ma9BKdzP7w1bVkI5SQG5pFRp5sUHKLuXw2z8p21k5ypkUG2PxYJeX/J5M3AtVbkuPTyzC07LdY2Gr/7nA+f36ZgO24d8ZeztmdR8uA5UBnbbBBe23Fa2nNV1XPeH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EdGDxIi0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Tj5k5IBx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EdGDxIi0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Tj5k5IBx"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5jFXA3740626
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:01:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rJtJYXAa8GpV4/jiuEq7JbT9lR3WBQXuWifjshJ7Bw8=; b=EdGDxIi0aulxSqsU
	ApUj7Hg5Lgne3eiRdLi/eZDwoTjTh62U2xoAGzstDv3JgkKQmsxYqVUbQ7YcHEOs
	BiQbIKBOX0K22ElzxIObK6nkvNS0MgNz065QZOoe8Y0aOUhRQbuCe84aZW2xae/e
	5Iwns2O4a+4Ixgay3qkhvD35hrJ8xrzCUlQ4D3s8CrVaLeC3s/p623VJpsYd7aMy
	NCC13Xe4XX/HkLcy9dMmzuM8fL9oy6a9SvUe7FCIfnOtTTpNw+DDsvr0/lq7g185
	1AHsRSl1auOktFRWvZIppqPy5n5l9D34Je4Cd6zq/c5RfE8TwRFt4SLP+fufyVtx
	Bh6ukg==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9dddnj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:01:18 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4b26d8d2498so3761135b6e.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 00:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789369278; x=1789974078; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rJtJYXAa8GpV4/jiuEq7JbT9lR3WBQXuWifjshJ7Bw8=;
        b=Tj5k5IBxNGg3VINWl3i/N6jxw7yiKX8t88IDFz/zWVXNCzCUPMw2aC0+9cg5V+nGwA
         eIzq/oJsbHNT9pCe62vsU64NJ0DKTLP44yUN2MeBft/NJty4qTjyNqPA+KhuNY6uioBb
         FrT4t7bL6TRWWMrXmWLBtt+qym9mpI7JUGqnYPc5bICfQ4nK7e2wEZWp+SoNdKDpza+h
         u0ZQxxM5gHH69XjIoKjyyEqoXnfltpZHVmareLosgXdGZ0jyeasadTLezGSSiaJj/v0u
         rGad8aCgsMyN86UWhs2CFeKHt7HprRy4LrN3GCrLjpUNHrvHVsgqBceSfZxWjDjQLttN
         8UCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789369278; x=1789974078;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rJtJYXAa8GpV4/jiuEq7JbT9lR3WBQXuWifjshJ7Bw8=;
        b=nh10V0vZc4dUo+aCXYAEjf4wx89lKgWCBuoB+tIhydyZKq9nib4BQK3xsQMYpg57Py
         xWLj0xvL2V8vB5gUZym3PrhvqSpn63kqGFDFaLQJ2BL9ovsU4H6uxfDekHepC2WUTHfE
         JHp5wUpI+tO94q7hoSRAnREyKJHNUJWSVquMVZHEp6Xz1h+pBY3K/s9X9RBSiVh+LY2B
         e56teS3FwoZOrrd8l/PxESZ3Y/DBYCcAoTlYMXc5FaxoFZpFsibLzNkxraeeXPkAqfLo
         ckiC2XBbqBYwvAKeOtXZPxDE/sPYxmGo/12Qu3QtXva2l2nLnMvkUI9SZ31lhkp6CHT9
         WUFQ==
X-Gm-Message-State: AFuF++mfQhfh5mTyBUYrogl9BeY9tmrLXGhZI3Z2f4Ca5w4jlYIPzoof
	RuBe2rN+9a1bbS6z7uK7I/+6kVyK281GX2gDhN6NEsV3WBjPLuh5Is2DnwNjxNoU8eS/fOXZY3P
	1Py5TK9SQ76wlHW2FxLIrTISWVWIuN+sG00LfErkShFy4QGDKG9wTQHfd+QwC6XGI45MtSmlABo
	5K
X-Gm-Gg: AYBFou1cGBx6aYkZnrQuW7cx4B0njcL1/zWVQ33RzTxK+Br3QXbVezvA15XdpWgQ8Eu
	1MY47cj243ja/JFVI7lk/uC9BBLRX0G56L0U79ejabpiGP8j0ieRT+dEjPXB9+yi5ofVBFg3lJS
	ebpFZpcZ4CFsPM57kVqPsCYNg8Lrb01WC9tEddmya4z3/Cxe0xBVDq0mfUg2MABy9GCFGhNRJ3c
	E4xjS1LY59mp2hDThNcKNI7hdRs2L9y6KjP2VDHo/7YlehA55oAseOLheV4d4g3E1sGkjDLC11R
	fBimljcgm1CN0lySd0IYgtWpmehhdp14ClaJmkEnp6Jp1nwTMf58rMBwB+3NmIGMpzRzWODkefB
	dql/pRjJK91H+NqVJ08qnoNJGhB4O
X-Received: by 2002:a05:6808:4fd1:b0:4c5:cd9d:c6de with SMTP id 5614622812f47-4c7b42cbe28mr736177b6e.7.1789369277824;
        Mon, 14 Sep 2026 00:01:17 -0700 (PDT)
X-Received: by 2002:a05:6808:4fd1:b0:4c5:cd9d:c6de with SMTP id 5614622812f47-4c7b42cbe28mr736151b6e.7.1789369277398;
        Mon, 14 Sep 2026 00:01:17 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f55735sm25962177eec.24.2026.09.14.00.01.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:01:16 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 12:29:50 +0530
Subject: [PATCH 18/31] arm64: dts: qcom: sm8650: Add domain idle state
 names
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-b4-idle-state-name-v1-18-660c31187819@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789369181; l=4339;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=xgLpMCNINwFqqPVBT78gS2XsaLcIC4OX980DPAxnCFg=;
 b=uihvyWh2I1cuyZLm/JZbc0jORMQU5HLTCPrSUs9BVjOKwjeTMoBlXIiIJX2iRTwnWswqiyWk8
 3B6aenxKElvB2ivlbJkO7r+YFYyQmA/udETy+DfYki6op3hgLlGOl90
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDA5OCBTYWx0ZWRfXxTVs9dcgv/DV
 1vfV0AC+p3ekgGI4S7nXf606zy01hprZRq5wo4DR11MqqVb16i0VWo6OcJBoBoqIAoXB+C2vnse
 6zkDnr0pOrY/88RqXpxo3oV/W4sSl42XAGB+WQL5s+r49aUxwiDf1ruJgvOttgtWgp2H24L8F5n
 raSOLaDRCWR7lGHsIYYDOeb/l4oJkz0+bmZyHR7LmY4DcmfYkifXnEr/YXR25nzItg8PtT6P6L7
 lm6bDK+dntQDlJPjdKwqMwaa2HB5YUclsZNirz0kXa4bA4MInoQdPEU99DsGVe7f4SzuDhg6MYC
 nyh5EBDGRVgyve/9r38jvfJ4bcPXKezsQvN5y9/uXSuest+KAj++5vJmQtEzNhQbBpgsRJkoDft
 9d1yN4E0H2zAlDm9ainrN06xjDdAndig8ZweBypGOpckolmDv/wB5ttkldSmcCZNkODbpVCl9Pc
 WtCZC5eHDA2oJ70wQAA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDA5OCBTYWx0ZWRfX/IHjoFb+Fq+i
 XdogfAYH65zZJlu84cdbY+rAPpZGecD8C4Vd8x41VRvobmIggAu3qGN9UtqPgwiob+kFlPz6G9p
 HcSHQBGGlJNd0EDEwF8rmEz0SOSHme0=
X-Proofpoint-GUID: 3Ey_wZc2ZUTRMoBeEbISboebGaVFo0im
X-Authority-Analysis: v=2.4 cv=OeUNnRTY c=1 sm=1 tr=0 ts=6aa79bbe cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=rliMdntzdNrDum4ZpT4A:9 a=QEXdDO2ut3YA:10
 a=TPnrazJqx2CeVZ-ItzZ-:22
X-Proofpoint-ORIG-GUID: 3Ey_wZc2ZUTRMoBeEbISboebGaVFo0im
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

While at it, update CPU idle state names to match the low power modes
they describe.

Use little, big, and prime CPU idle state labels for consistency with
other platforms using this CPU naming scheme.

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 30 ++++++++++++++++--------------
 1 file changed, 16 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 99509305f970..11e491acb715 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -451,9 +451,9 @@ core7 {
 		idle-states {
 			entry-method = "psci";
 
-			silver_cpu_sleep_0: cpu-sleep-0-0 {
+			little_cpu_sleep_0: cpu-sleep-0-0 {
 				compatible = "arm,idle-state";
-				idle-state-name = "silver-rail-power-collapse";
+				idle-state-name = "silver-pll-pc";
 				arm,psci-suspend-param = <0x40000004>;
 				entry-latency-us = <550>;
 				exit-latency-us = <750>;
@@ -461,9 +461,9 @@ silver_cpu_sleep_0: cpu-sleep-0-0 {
 				local-timer-stop;
 			};
 
-			gold_cpu_sleep_0: cpu-sleep-1-0 {
+			big_cpu_sleep_0: cpu-sleep-1-0 {
 				compatible = "arm,idle-state";
-				idle-state-name = "gold-rail-power-collapse";
+				idle-state-name = "gold-pll-rail-pc";
 				arm,psci-suspend-param = <0x40000004>;
 				entry-latency-us = <600>;
 				exit-latency-us = <1300>;
@@ -471,9 +471,9 @@ gold_cpu_sleep_0: cpu-sleep-1-0 {
 				local-timer-stop;
 			};
 
-			gold_plus_cpu_sleep_0: cpu-sleep-2-0 {
+			prime_cpu_sleep_0: cpu-sleep-2-0 {
 				compatible = "arm,idle-state";
-				idle-state-name = "gold-plus-rail-power-collapse";
+				idle-state-name = "goldplus-pll-rail-pc";
 				arm,psci-suspend-param = <0x40000004>;
 				entry-latency-us = <500>;
 				exit-latency-us = <1350>;
@@ -485,6 +485,7 @@ gold_plus_cpu_sleep_0: cpu-sleep-2-0 {
 		domain-idle-states {
 			cluster_sleep_0: cluster-sleep-0 {
 				compatible = "domain-idle-state";
+				idle-state-name = "l3-pc";
 				arm,psci-suspend-param = <0x41000044>;
 				entry-latency-us = <750>;
 				exit-latency-us = <2350>;
@@ -493,6 +494,7 @@ cluster_sleep_0: cluster-sleep-0 {
 
 			cluster_sleep_1: cluster-sleep-1 {
 				compatible = "domain-idle-state";
+				idle-state-name = "llcc-off";
 				arm,psci-suspend-param = <0x4100c344>;
 				entry-latency-us = <2800>;
 				exit-latency-us = <4400>;
@@ -1659,49 +1661,49 @@ psci {
 		cpu_pd0: power-domain-cpu0 {
 			#power-domain-cells = <0>;
 			power-domains = <&cluster_pd>;
-			domain-idle-states = <&silver_cpu_sleep_0>;
+			domain-idle-states = <&little_cpu_sleep_0>;
 		};
 
 		cpu_pd1: power-domain-cpu1 {
 			#power-domain-cells = <0>;
 			power-domains = <&cluster_pd>;
-			domain-idle-states = <&silver_cpu_sleep_0>;
+			domain-idle-states = <&little_cpu_sleep_0>;
 		};
 
 		cpu_pd2: power-domain-cpu2 {
 			#power-domain-cells = <0>;
 			power-domains = <&cluster_pd>;
-			domain-idle-states = <&gold_cpu_sleep_0>;
+			domain-idle-states = <&big_cpu_sleep_0>;
 		};
 
 		cpu_pd3: power-domain-cpu3 {
 			#power-domain-cells = <0>;
 			power-domains = <&cluster_pd>;
-			domain-idle-states = <&gold_cpu_sleep_0>;
+			domain-idle-states = <&big_cpu_sleep_0>;
 		};
 
 		cpu_pd4: power-domain-cpu4 {
 			#power-domain-cells = <0>;
 			power-domains = <&cluster_pd>;
-			domain-idle-states = <&gold_cpu_sleep_0>;
+			domain-idle-states = <&big_cpu_sleep_0>;
 		};
 
 		cpu_pd5: power-domain-cpu5 {
 			#power-domain-cells = <0>;
 			power-domains = <&cluster_pd>;
-			domain-idle-states = <&gold_cpu_sleep_0>;
+			domain-idle-states = <&big_cpu_sleep_0>;
 		};
 
 		cpu_pd6: power-domain-cpu6 {
 			#power-domain-cells = <0>;
 			power-domains = <&cluster_pd>;
-			domain-idle-states = <&gold_cpu_sleep_0>;
+			domain-idle-states = <&big_cpu_sleep_0>;
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

