Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BBF13E49EC
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789369313; cv=none; b=KnIFVFv6nzZKDenaSslQ0zQNgTV4rxlmsFJvZh/khDqxMa+zu/y5va48mSSxTqxiuI09/eM1tKiVVXS326GDVBrslhg4I0RPCXp5TIcBl+6DEVE9/Mytuxh9Jag8PLE5+kYV+uGPvv9Bpvr6DSzjBIQ+B4GomnLPb8AJfaUGp1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789369313; c=relaxed/simple;
	bh=0ChFdrnXHniIZffyMMg9wPkrrgTJUcEhdYiSTyjce6k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s2RguDMcANFj0cZQVxbZFE84RRkid5IW5pg548km8cKJyyuLr38GJwLdWwYhc4bY64xGjkCELCOh5GHegg2j/rLCzspTj1JKGMcLU8n0lmuNObDBGPlu/pGJXR7aTxBp9chDuuioclMuIyIxwm9uObj0cVh0/AaWTKDs3q4q0Bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QpF1INwi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PN1EOVg/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QpF1INwi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PN1EOVg/"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5ilEx2627003
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:01:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v5poFASCQGmaTA8JRz0hlnh99JV/MkN0yzoUGlZxOoE=; b=QpF1INwig6KlnqY+
	NB9gzja1buvCDTq8VO2MlG6tBAve7QclfRBzAERNL/3OkKiKlzOcSd9fbwyeO31N
	+Fihe3x1RWhT1CjT76QWZWAERtjGwDmxvADzc2w2CbsYJyPvKu+ceBVmyxm0271S
	wpi1vio63L6sXb/0kZp4pk56+RkwCsEHMrxGLGlihg6bu4U8rLBEakSqBqXLCXVh
	grJqymZ6/HRawyhRDjjAr6jlJk6UcW4RAWwpV46yizSF0TwC1qkYjTdNlqvHDv+V
	z+zpSUa1x7a0vyW4Xwe6HCHDzaE7CHh89u32AmdB3ZRkcbzKDLqyCu0mKISDu7Op
	8XvM6Q==
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmywh59qg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:01:51 +0000 (GMT)
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-4574f1cac98so5509221fac.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 00:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789369310; x=1789974110; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v5poFASCQGmaTA8JRz0hlnh99JV/MkN0yzoUGlZxOoE=;
        b=PN1EOVg/CsQiW2F247PY7tWU0hbOt0S8Nxey2IsntCAuKvw/eaBoCcnodLFNlNLuc2
         qoeigGocpIRouN1MqU7M5f4GIf2wAJZ/h1/xH6Bj12YWIHPpBL+UyeeA40P7Wz5WZaS5
         FW1pt1w0DJOwAEPncCu3X6YlRDlVW5G7/WhaD9MGaeVzXgaLjc+iDNwdvf1b6WFdCpQq
         QTfWNq5352pDs9/z++oSFGdri/CI1yhKF32y6YLm9shvdDuZAUnCYiRzA0h37Z65/cc/
         Phgc2lExhJ5lpGqkMW3IMcwfbygf/471EoYdyYx6IoFNR24JdIv//EeIK2WMtyRD3gfd
         rxxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789369310; x=1789974110;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v5poFASCQGmaTA8JRz0hlnh99JV/MkN0yzoUGlZxOoE=;
        b=c9/TlWMDC6DXZ91f/ig3sBQxwFbmJnvij8aJ8zqV4HrsS4NzlxMDHh6v29kn5F/HOD
         67TGUNQJxWXr83kHZ0D0X7ezcLBS2vvxatEQ4Ln8d0mvAdXhYyex8MRHQOFaNlbGaTVj
         fc38t/VKCzY+xkg4Qw1vVUCkQWE3YUjjwTMJez52FQ76ViFEZhfK5W6D+JWajRzFM1c+
         iE8I1rWiviM4+1tXPZelEd0Cu4hhaCrnZJwv92NkvlCm6YHF6JPpC03uqzlCHqXOi58a
         b83vJ2pGHo3wSlF2Uqki75p781SdNNV0WPdzRoYCykaLADOTfxh9q07eT0SmTeBeh0/q
         6SPQ==
X-Gm-Message-State: AFuF++lLUm9dFHZY2YCRcuvG7jFvluelhdUCjOMz2h2L2wqblkGFT0YS
	lkhUo4WFDyc1dJii9vPDuBNwecUdsYR69f4/XWgLO3O3kIqLG3/L23pBmLa8YVC9STjqQHXGLod
	ngm62EGGz5kXyN3jViNiWh+Sokl3F+BTaI9VRGn98m4yd5bncQlL9E+6zO3FyeQdH1mE9
X-Gm-Gg: AYBFou20taqqejjzUrMx4gWWaTZCphTa4KLR2uMtuUekCo65lOKfyp+aenhzZRq0QiG
	tfRuo8vXjzibANb2gqOF02rVVMPkFsAuJP1wYsxRiHFdFxGRvTYLvoxfmsVS4sBXQz8WOVIl+EU
	svuwImNntUsRD6BTi4dNuYoBwwEHP2mZJXXbTQrMpWcFjOHmVv9t7Plqom/8f8A3+DWIA5GQM/Z
	g1W7oUZUWW/3+2MJVx8sRUOckKejUOj+xvswuf5IOioqwDRNb+GwzskoZE8qSWi0WPWez2cj4DS
	uTXDefJmqibdhWgkqBnHZVkuNgjDqC2KmpEEQ6zMsnl1mQFtXTGVqE0Skw6VvSM1/AM52ZU3b49
	rV0XIPShR2EfQ9jIQ9E8Tw/jQXmX6
X-Received: by 2002:a05:6870:6c17:b0:475:e066:7717 with SMTP id 586e51a60fabf-481f9c31929mr694749fac.30.1789369293817;
        Mon, 14 Sep 2026 00:01:33 -0700 (PDT)
X-Received: by 2002:a05:6870:6c17:b0:475:e066:7717 with SMTP id 586e51a60fabf-481f9c31929mr693908fac.30.1789369282581;
        Mon, 14 Sep 2026 00:01:22 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f55735sm25962177eec.24.2026.09.14.00.01.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:01:22 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 12:29:51 +0530
Subject: [PATCH 19/31] arm64: dts: qcom: eliza: Add domain idle state names
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-b4-idle-state-name-v1-19-660c31187819@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789369181; l=2186;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=0ChFdrnXHniIZffyMMg9wPkrrgTJUcEhdYiSTyjce6k=;
 b=zvcHRcEYw0cZksT+PdG0qtAj+DyDokBz2GYKk1ZXJ51Wmp2I/5j1vXP1AQejmJVklaqdMDipr
 Arel/M/HYg3D/PWcyCT26JdAJK9Mov3mT+tKdLsMGhMdb/MRHnlW35E
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-GUID: fCr93sw3b9Ax7jHswJJvFFvCHGm4jn7_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDA5OCBTYWx0ZWRfX3SU8nXAAT16l
 GmZS6cP+ZSaoV1naQcREQqYfkgLr4M1SALVsv3GYKXiWNpTOaeJBzssIOyabdJLGfTBYAGLRtCw
 +9A4/b2iciDbkWohX18nXFzc8w8dXd6DlT1WtWf0+IoHKHahvaSscHZ67FU2fPAr1tgc2DkWs71
 hQqKjLJGYZ3vuMieUqnN3BXy2ITpJ346l2GnoP6li+jQtoJJoy8X6Yko5QiqVWYSJ6EwSd8RTjb
 hPyblqYmaCL1fLDEHmHoRM7Xw6mfop9jmoogGeDJC3a0bvnxS6DTurPk/EvD0E0iMTf6oWkyC51
 cSrF7V9HXAuo0ha0UqhYKArbUckkhO+k1z6UEkQxzuEWh3dhNvwmOqAAoK7iA4fmLnYtPoOQgPv
 1+NV9S8MdCP9rehsn3bvzfihOy2fkC4C3bK8GGDB0S4K/aUIWZ5YF1uGh+Js1Sv3OYjRoudfLmU
 wYFasSK2X6Hr9NWE4sw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDA5OCBTYWx0ZWRfX0XHmGnLNBAbf
 yauO4XNyCWBc5Ae5EOPmwz3XHPLpOivhMOo/lnQ5j1RY0lnGo0EP1lWE5DFXcRWxniKXfO1oTfH
 CAPQE2kwoinoyY2nixwhlYh+C1lCIPc=
X-Proofpoint-ORIG-GUID: fCr93sw3b9Ax7jHswJJvFFvCHGm4jn7_
X-Authority-Analysis: v=2.4 cv=PsUG/AM3 c=1 sm=1 tr=0 ts=6aa79bdf cx=c_pps
 a=nSjmGuzVYOmhOUYzIAhsAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=jBt9j5u6eBwbyPT3BWQA:9 a=QEXdDO2ut3YA:10
 a=1zu1i0D7hVQfj8NKfPKu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140098

Add the idle-state-name property for the domain idle state so low power
modes are described consistently and its name is printed in pmdomain
debugfs.

While at it, update CPU idle state names to match the low power modes
they describe.

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index a8042291bd07..2b6bbdf3f28c 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -284,7 +284,7 @@ idle-states {
 
 			cluster0_c4: cpu-sleep-0 {
 				compatible = "arm,idle-state";
-				idle-state-name = "silver-rail-power-collapse";
+				idle-state-name = "silver-pll-pc";
 				arm,psci-suspend-param = <0x40000004>;
 				entry-latency-us = <550>;
 				exit-latency-us = <750>;
@@ -293,7 +293,7 @@ cluster0_c4: cpu-sleep-0 {
 
 			cluster1_c4: cpu-sleep-1 {
 				compatible = "arm,idle-state";
-				idle-state-name = "gold-rail-power-collapse";
+				idle-state-name = "gold-rail-pc";
 				arm,psci-suspend-param = <0x40000004>;
 				entry-latency-us = <550>;
 				exit-latency-us = <1050>;
@@ -302,7 +302,7 @@ cluster1_c4: cpu-sleep-1 {
 
 			cluster2_c4: cpu-sleep-2 {
 				compatible = "arm,idle-state";
-				idle-state-name = "gold-plus-rail-power-collapse";
+				idle-state-name = "goldplus-pll-rail-pc";
 				arm,psci-suspend-param = <0x40000004>;
 				entry-latency-us = <500>;
 				exit-latency-us = <1350>;
@@ -313,6 +313,7 @@ cluster2_c4: cpu-sleep-2 {
 		domain-idle-states {
 			cluster_sleep_0: cluster-sleep-0 {
 				compatible = "domain-idle-state";
+				idle-state-name = "l3-pc";
 				arm,psci-suspend-param = <0x41000044>;
 				entry-latency-us = <750>;
 				exit-latency-us = <2350>;
@@ -321,6 +322,7 @@ cluster_sleep_0: cluster-sleep-0 {
 
 			cluster_sleep_1: cluster-sleep-1 {
 				compatible = "domain-idle-state";
+				idle-state-name = "llcc-off";
 				arm,psci-suspend-param = <0x4100b344>;
 				entry-latency-us = <2800>;
 				exit-latency-us = <4400>;

-- 
2.43.0

