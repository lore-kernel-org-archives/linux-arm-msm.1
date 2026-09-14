Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CECCD39E18E
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789369272; cv=none; b=SwmQy1b9Czb++n5vrsYSqpHTJBpfFOM6aqy3FTizklW2t5FCqhA9ho7L3UMqrwb2CRm0tZb/L/wUCUckwxg9vk6iAloCYbH3MT/Wt+/PLfdFgNfN0t8wjSYSfPenzk/A+Ab1JsrgpJcrpYOmlnxWcQWtEiNqrYzEMfoN38ADSzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789369272; c=relaxed/simple;
	bh=sUHQI2zKTTPFVkV4CpF0N4F68r4HNK5wcu8caMk3tl4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WerZ9Jg5e2fi2Frz4/Cj+ISjYl/CKFrKHxlhoj1mvyPVMJQxJ4gJ+cczR9xDtGGCFaMVPBEmEryvNyHoeqGcXtltb/3WaAc4EPNxj82ma6aXURsbzMKClCXXRhDaGwmsCJrPJQjDIw2su7IrHAQqjYweCwSlFcEViFuA0uyTJ6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AMqPFPzM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Im66bBS8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AMqPFPzM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Im66bBS8"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5iY8e3127218
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:01:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GAfPHYxaizBg/8qKTJcsfkCWOP2KxuaSQ4CoLbeE3RQ=; b=AMqPFPzMrSxySk1H
	bj1+xL/FvMbuoDzYZNh8iSqPNsZzQ/U3mQsNR+JRxsV8v4q0pwFhBRKwR7vWQJZc
	qG9iE0Zxu9GCVGsAHx7u0NjrWlhSqHF0VcCPDOhMw1UpZrnKXL9Lew5WXlAUoCnE
	2AHaioo4S5toSCq9qPAQKCAz2JHkfwIjmxqeHeMvKhjDvUqS6JFR/VCN02gapr5h
	jbBnTsaMcKfIqMgoyjpWPb5cZzH6na94A91aA1TibQl0O5UmV6NO9iiXcWpy9Zk6
	vr2sLJ8+HKWGlnzR5sYDeKxKvP1LKFsD//vGVCj+HgkT1r5Pe25Rec2qCaAbtRdF
	Rtn1Aw==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gn018n9bb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:01:08 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4a49f09233dso1627350b6e.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 00:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789369267; x=1789974067; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GAfPHYxaizBg/8qKTJcsfkCWOP2KxuaSQ4CoLbeE3RQ=;
        b=Im66bBS8pDN4l2/vBUji8NRorIzNmzwoRFUWF7IJmoGaSAjKhdsKVjuWcOJsRDpw/N
         9fPlCSAvk1Pij3AB7uW0g6tmy3afF95FuqxnjH2ka9xOU4skszTlyRn8K3mtstmkw20o
         LSRlsSrlzGWrGf6kNKCGmpKa4DMyVWHDrm0VVloB2C3nT29LCXSSzRaf+RGolr/46zQ+
         JHV8E1DBfxdQ8s7n6QHO34hkMpzLXjc232Erqdo/zGyFjPrDV3wS7u28zjquDMAXMAZj
         AnA4+FNDA7QTFmkd1ftokVhhrjI9T3iAcqw2Rs/4qJL5PQsYsi6rv8KDzXKdtJXK40pQ
         By6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789369267; x=1789974067;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GAfPHYxaizBg/8qKTJcsfkCWOP2KxuaSQ4CoLbeE3RQ=;
        b=c7Qw6g8B6IwoXIbE8gxHYWWJl9O8D0JZoQNm+cN98K1yUMX4/rj1wnxkXbw6T+MpgO
         PHDeWF3S/ASFrvkcFbtfX6bsbjSPRt8zzBUfWSEviEjfnMTrQl2Rvxs/ENPB9ygz3p1h
         6phJpVdRcXQtXobgOMfT2TJP5dhJE49Kv4qLuR00GDIRDSa1QC0ZbHxyX/dvILWnbX5O
         dUGsi1USHyTLbxvV/lwtCk9G8Lnnf9Wy0h/yml5Zrr4CPwe7t2JZJ6PjpHjbm6pT9aPq
         okmz1iEBzaVzaJEHNJYiQBoTm9r0GNMfr4qCBM0BSc6xex77PG9brokjpgqtVP3Pu8bl
         8mQg==
X-Gm-Message-State: AFuF++mb6+PipkArFSWTZsrKcebQ20DLrpWIgqG5yo4HhWSTLRpvBfMD
	7fRARIw9MM8huanDFdYlxfDPohYaVl5JmkBcMy0Sef99jTmkzBCj3qrnmclQHfatMV7iGcMzGqZ
	rbH/2d0VxjXAD3xZAyT4WBR7n6dB1b95WsijF2IRYP6Wl4F15Mdya41oI/MFadnt6kOP7
X-Gm-Gg: AYBFou0sOQEIvwrej1/PB1phuQKm4qI/1vZTI3rJpZ1tPq1K3Gnzwwrcwec0XhS6Gz9
	LrhFZUq4MVecA/yw8Jl84j1OwdGQ7I9LQPAY8qd/kmtSwAHuuAn3AFMpS+C2B6hu2K1hGi3gVTc
	pYXVzGhoXHoT4hgeeMP5n8w707pTmtEiqYUWCK+5UBAYFJZ1Q9CBEgtGB7OqpOgxl+qj3x+8BDQ
	1oMFbq1DFEr3qESvtF2EMmRjqkiCQY6zgfCksRU4k27nndBh0QEKGhvE9CpyyNv2izADGwI79KO
	Z8uA+kqHIr+5cTJY20DYBjZC3igWCQHsH8gFmMTQSjq6U2cMqF1k7lfbNhihbomnacJ8Jtzz4+B
	aCES3jDpH3bKoqLF8L17+VcMtlhvb
X-Received: by 2002:a05:6820:1849:b0:6c1:177:c7b1 with SMTP id 006d021491bc7-6c541b3ee39mr524796eaf.62.1789369267457;
        Mon, 14 Sep 2026 00:01:07 -0700 (PDT)
X-Received: by 2002:a05:6820:1849:b0:6c1:177:c7b1 with SMTP id 006d021491bc7-6c541b3ee39mr524774eaf.62.1789369267032;
        Mon, 14 Sep 2026 00:01:07 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f55735sm25962177eec.24.2026.09.14.00.01.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:01:06 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 12:29:48 +0530
Subject: [PATCH 16/31] arm64: dts: qcom: sm8450: Add domain idle state
 names
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-b4-idle-state-name-v1-16-660c31187819@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789369181; l=1890;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=sUHQI2zKTTPFVkV4CpF0N4F68r4HNK5wcu8caMk3tl4=;
 b=7/Cc3imxcSvIYE6NQ1XeJExbOL/jCu1vyA1Jlc2/5KBo0vJpsjPiXhaUIQGgbBP/heC4DNKT8
 VeN8KapbyNsA2br4C60HeB0txsuQvUpRmxb1lcX62LQLOHEqMpOVfgF
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Authority-Analysis: v=2.4 cv=c4g+0h9l c=1 sm=1 tr=0 ts=6aa79bb4 cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=OzLIKpLSOQ5DsbBBciYA:9 a=QEXdDO2ut3YA:10
 a=efpaJB4zofY2dbm2aIRb:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDA5OCBTYWx0ZWRfX43V1JXv/klDj
 ACfCPC0fMSNjo/FNrk7/5clYk9P8Wgrbe9KsLVI/I7f10FBPtVh3eki/A2/dzkoiyyQ/MDUyhHb
 m+RkGxUSU4HyYStoQdRYY6FepPuIKEg=
X-Proofpoint-GUID: f9ywcddcC6SRyBvuMn9ufEpeDE9wEboQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDA5OCBTYWx0ZWRfX3Vo/AhAVll8o
 sZboISdcgatXTA9UGB9C1FqPaxYwxO/iJ6uv9J7fmk4lDXhGJn5lVeU2SMHVQMqzSZFsEzM+pL+
 6C009xh0cSDU+0ZRl4CF5BVr9DV+uvuxgOJVkNSZfLREChq/NzYMLhOTByGF6kNWRg5V+2zsvAN
 Cj4SWW5AUvKJ6EeZ6m6ASXJZwBAvB75wO0nKkfzdY/+FT7XwHxVAOxDnyK5zEyBZl7lweUHRQ1Z
 j1/51AJgz1qfQXamm5ghZnYf82vTcu8qT8xRxAhpRTeeNhD6Hxj7R9tMEsRu7STl5PI7n7SqLuO
 9uKP2kKTZRPEgXX9Pk8EKrqeDF2j0tqG9gT5Gh2Xhj9d8jkytkJdYVyb5FhO736WIvNXg6GM2dW
 EOJuQ+z1Mj+uQr447CPOP718RpSo078nM0gozyYNsHjsi6BrAr58B7FM3PTDr9a2xlYRI/RaBVl
 TGZuNbsHbSZeYohJgHg==
X-Proofpoint-ORIG-GUID: f9ywcddcC6SRyBvuMn9ufEpeDE9wEboQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 phishscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140098

Add the idle-state-name property for the domain idle state so low power
modes are described consistently and its name is printed in pmdomain
debugfs.

While at it, update CPU idle state names to match the low power modes
they describe.

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 484ec8ec8c10..dbbdcbd4d4f3 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -249,7 +249,7 @@ idle-states {
 
 			little_cpu_sleep_0: cpu-sleep-0-0 {
 				compatible = "arm,idle-state";
-				idle-state-name = "silver-rail-power-collapse";
+				idle-state-name = "silver-pll-pc";
 				arm,psci-suspend-param = <0x40000004>;
 				entry-latency-us = <800>;
 				exit-latency-us = <750>;
@@ -259,7 +259,7 @@ little_cpu_sleep_0: cpu-sleep-0-0 {
 
 			big_cpu_sleep_0: cpu-sleep-1-0 {
 				compatible = "arm,idle-state";
-				idle-state-name = "gold-rail-power-collapse";
+				idle-state-name = "gold-pll-rail-pc";
 				arm,psci-suspend-param = <0x40000004>;
 				entry-latency-us = <600>;
 				exit-latency-us = <1550>;
@@ -271,6 +271,7 @@ big_cpu_sleep_0: cpu-sleep-1-0 {
 		domain-idle-states {
 			cluster_sleep_0: cluster-sleep-0 {
 				compatible = "domain-idle-state";
+				idle-state-name = "l3-pc";
 				arm,psci-suspend-param = <0x41000044>;
 				entry-latency-us = <1050>;
 				exit-latency-us = <2500>;
@@ -279,6 +280,7 @@ cluster_sleep_0: cluster-sleep-0 {
 
 			cluster_sleep_1: cluster-sleep-1 {
 				compatible = "domain-idle-state";
+				idle-state-name = "llcc-off";
 				arm,psci-suspend-param = <0x4100c344>;
 				entry-latency-us = <2700>;
 				exit-latency-us = <3500>;

-- 
2.43.0

