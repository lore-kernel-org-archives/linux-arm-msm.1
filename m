Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8912361976
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789369242; cv=none; b=sAEGCwSqrd2Mu9CEvFbgKUncLkNqwLZHCXOReWFxO8qzc9z8ykHCTPozRp9l5Qsi2spuyYWCU4QzUdPFKLpwQ/0IDku69hYmOiC2Tj6+zAp61UA+oXDrHTtMeFqcK1KPVVDozwi+Du7oy2zHsO9mTVgqUrJp1V6vBBoZLsltLz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789369242; c=relaxed/simple;
	bh=va6xF6vr7UsAt+0AMfDPEagkDJP5CNMoR/tre/z2rzM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hlLJqFSbJsE44MiaGizWSQre4AqzYr6tCOSiEcGk6NdLZSf9UmZJ+4VyT/mIWvon+03850YB4frg7ON+8UQGGM+wWmMgzpZ93ADXA6wycuQs/jZR+E1oIbHgdojpxoLzCs0WUMV2r3spxXC6wp2TCm+tbAZTsTBzLzfWZ6fBaUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dFQd7xiP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UPW00T7z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dFQd7xiP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UPW00T7z"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5jc8A794986
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:00:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8Rb6LBoC22FXoSxAF7j8XDfO7U+rTfI0Cxwnb4No8SA=; b=dFQd7xiPTvNfzrx1
	+qo95GhpWZFZR0I+9Abxep9MCdIq1wo+lmRRzuA+XfkQJeMgyr+2WPLWfBIy6V3d
	YWJDRwIrGtdEza2WSo97RhReHmMQErpOFtq8MrGM6Bne4tKFnYyAYrjQwG0WK7R1
	jKYPyU8c7rAdjP1MSA5+LK4or+v1kdjCPDJ0dq2dbH2D56vI4HpzHlyJ4CZTMW/S
	SbVergDLW4SyFUODfOrYUphCfx6Ns93aKxhOlNT2VOw4wHzYQwUWbkg+pDkHubCg
	y9cBuI/WpT7IxTkwXEoLx+QWfdDdq6vKp9eVdYcsQhtUp66fl2CuQcvhRTNMnJ9y
	z0Lt/w==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9cncwp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:00:33 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-86b70a52946so4554511b3a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 00:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789369232; x=1789974032; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8Rb6LBoC22FXoSxAF7j8XDfO7U+rTfI0Cxwnb4No8SA=;
        b=UPW00T7zEueQPA7hI4WriLBXnwmFjYB+Fk8n7uUDOgkMuAnPj3xzFs6Nc9xq6qlkPQ
         AUWCtMvj2vSOzA83qm9u1cjMQDooTsTK1XYPYBaN01YhvoE2YbJlt3lansaTbG8faVc3
         kAMMrytJxCNbQLiCmTAK/sWzPojMtbw1O6Te9U6GY59uJCpuQOuShpOxzCIosUkI/93w
         8qEilG9dlLf/fBq1yJjVz6p0X+GuwmJ8fwuT/dWZQxZCS12X9GMplEvjyEqjIwUiAWZ2
         yWKzv3HMmlKJ2pcGw4gOtA+jDaUbbizYBxXk8fc1guTbutIpES+gilmke07xA0uopOwb
         Y7+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789369232; x=1789974032;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8Rb6LBoC22FXoSxAF7j8XDfO7U+rTfI0Cxwnb4No8SA=;
        b=pt2vQR8VGMUmazJbvXpq895avfc8pyX1wwL9+OB9hQX4z2vVDGnf4qRztgClMvM7Lm
         xQu8qmFeQkfLzZfdEPGxGKOeFYjoBX8QTr9japf+WuERdRfvSn3wCcYSdgU+RzsXSIkk
         kdGi7cezk8Ukh+leRL2VY8PNBB9PgGDNBpVYmV6lyBnETky8SskdeInv30tDNaKFmZoa
         3aJRWIJGrVepsKQulDhJ12NMwehWRXO9vNh3kfLQQafuzNf1XKC+b9cabDw9TIatWiVM
         VUu7I+c5wUKCOg5eq0cr+2wiDuK4W+8IPxyVw1dBdDB1B5ZOLkqXIqq3ZwAnK7w22EWE
         bWfA==
X-Gm-Message-State: AFuF++kMAwUkaYMWDvgTio/9HC6XOx2WjXjejdDZO8t+J12EB1/hBuSr
	ZFVz9s4aV4NFVXCER8WNn9C58hTXk0pzUaAmXQJyAUMBpqJVKfrVxEA6vBpdD14R3cpqq8tNbSb
	5DpjI1GCVupzfpTiNAbCKJe6Wl01X5mvm9sG2gZbriz0sm245Ri2KXWWWIfepzZBWXDrZ
X-Gm-Gg: AYBFou1xOc7icU7g0cbAC805+scC7lqMxaJIknNTQrprzASXo1N6YoOhSwSJ4nZcVGv
	HeTFXgeW36g2nb9CNjUvQ1GI/wMLFU9sJq0zGM6ESEe44QgH5ZFtnGWR1ZvoKP/B1wQabZoUL3i
	iGQfbg1eMFW1Cl4YvdASzerW/tC5QXHYpcnurV3/ieGJ7xHvh8fqCeH+EYwYAEU42/76IbNgCWa
	Qjs4SWKK2DG24Zdw+4XLsi2mDTE8gdbWBsM5pGDnDAhLibR0MUqQeabUbBwCTcguaFMlpbCDPlA
	lYHYWGefdwFpgBh610b50l0LvmhftYA6kCQWvnnjp2D7kvoLeqzpm2+4gKCpQdjiUWimcQdAxmu
	5bzWGcU8b3aOH6yDdSRJy0DB2NtCM
X-Received: by 2002:a05:6a21:113:b0:3da:9f19:bf2 with SMTP id adf61e73a8af0-3db4064eb93mr2783063637.18.1789369230956;
        Mon, 14 Sep 2026 00:00:30 -0700 (PDT)
X-Received: by 2002:a05:6a21:113:b0:3da:9f19:bf2 with SMTP id adf61e73a8af0-3db4064eb93mr2782968637.18.1789369230469;
        Mon, 14 Sep 2026 00:00:30 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f55735sm25962177eec.24.2026.09.14.00.00.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:00:29 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 12:29:41 +0530
Subject: [PATCH 09/31] arm64: dts: qcom: sm6115: Add domain idle state
 names
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-b4-idle-state-name-v1-9-660c31187819@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789369181; l=2637;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=va6xF6vr7UsAt+0AMfDPEagkDJP5CNMoR/tre/z2rzM=;
 b=6WOoHZceESG2EM5WDiZaE4GzIdxna278JZQ2Sjv3y1aHrtRXmPk+tlhgXxOdaU3bcaEiVgbmx
 oQ9utQ73qggCkPNGFvql6BqLCoE+DcrWFZJka7RM+2GmaKyB6fhJdIZ
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDA5OCBTYWx0ZWRfX3VOcuifTPUjC
 mTK0+7HB0nZl6gUvUhJSTzf+y0Tu15Skg35f1LV6i/QCNzT7GAwC3oOn0jas5P6MNqZ6Eom0/vO
 uN1Kv3DZutykHWB3WhcGnuT7kRfHTIoS3cz5AEM8lQ7q/CH/boVLJcmpAgRxWlLCNdvZ46NvtnL
 GKgX+T108U7l1i0mMC8B7H+B76/COpBMJBFDrha88PK/0bQzF3EJ5CJGLXyVzzoUSRkEp93lx13
 f3OntRjexXLtJoxi3K1ura709Rz/2yrSEppsz7aolYWQQ/y5c0lnNWbp2TwwlbpDaQrMd7qAtkD
 pOJ6rBrQ33wvca6E4gm5EhwkVXBqLIooQ10YVRjYArTAPE6rt+uhb4cBsGuZVzLIHmciQwQLxuJ
 pQrOBxy8oTa+unue1cb5zVvhX8Im9un+GdxA1hG4S9PW0LdUCNOCcFjOwnTWsDpn4j0Y4Q+fOYt
 bsR++vQ57jTtCJIE3Wg==
X-Authority-Analysis: v=2.4 cv=EMyTQFZC c=1 sm=1 tr=0 ts=6aa79b91 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=jBt9j5u6eBwbyPT3BWQA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDA5OCBTYWx0ZWRfX/yKKkbOfZt09
 x3BPlpe5QIKef0W1QNrvCgd4QotjCp42tdouuRQ5jyh61Km+PU0PmTgrMrWOQv8OV08hbmgH+Qj
 6yBLKJAyZb3X6fXgD7AyMzVXoW8fRy0=
X-Proofpoint-GUID: rZdzMb_EQHtheQO8ugmtfcCyJR3eqIKA
X-Proofpoint-ORIG-GUID: rZdzMb_EQHtheQO8ugmtfcCyJR3eqIKA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 bulkscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140098

Add the idle-state-name property for the domain idle state so low power
modes are described consistently and its name is printed in pmdomain
debugfs.

While at it, update CPU idle state names to match the low power modes
they describe.

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm6115.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
index 3520802d1fed..27b5ee48637b 100644
--- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
@@ -209,7 +209,7 @@ idle-states {
 
 			little_cpu_sleep_0: cpu-sleep-0-0 {
 				compatible = "arm,idle-state";
-				idle-state-name = "silver-rail-power-collapse";
+				idle-state-name = "silver-pll-pc";
 				arm,psci-suspend-param = <0x40000003>;
 				entry-latency-us = <290>;
 				exit-latency-us = <376>;
@@ -219,7 +219,7 @@ little_cpu_sleep_0: cpu-sleep-0-0 {
 
 			big_cpu_sleep_0: cpu-sleep-1-0 {
 				compatible = "arm,idle-state";
-				idle-state-name = "gold-rail-power-collapse";
+				idle-state-name = "gold-pll-pc";
 				arm,psci-suspend-param = <0x40000003>;
 				entry-latency-us = <297>;
 				exit-latency-us = <324>;
@@ -230,8 +230,8 @@ big_cpu_sleep_0: cpu-sleep-1-0 {
 
 		domain-idle-states {
 			cluster_0_sleep_0: cluster-sleep-0-0 {
-				/* GDHS */
 				compatible = "domain-idle-state";
+				idle-state-name = "silver-cluster-gdhs";
 				arm,psci-suspend-param = <0x40000022>;
 				entry-latency-us = <360>;
 				exit-latency-us = <421>;
@@ -239,8 +239,8 @@ cluster_0_sleep_0: cluster-sleep-0-0 {
 			};
 
 			cluster_0_sleep_1: cluster-sleep-0-1 {
-				/* Power Collapse */
 				compatible = "domain-idle-state";
+				idle-state-name = "silver-cluster-pc";
 				arm,psci-suspend-param = <0x41000044>;
 				entry-latency-us = <800>;
 				exit-latency-us = <2118>;
@@ -248,8 +248,8 @@ cluster_0_sleep_1: cluster-sleep-0-1 {
 			};
 
 			cluster_1_sleep_0: cluster-sleep-1-0 {
-				/* GDHS */
 				compatible = "domain-idle-state";
+				idle-state-name = "gold-cluster-gdhs";
 				arm,psci-suspend-param = <0x40000042>;
 				entry-latency-us = <314>;
 				exit-latency-us = <345>;
@@ -257,8 +257,8 @@ cluster_1_sleep_0: cluster-sleep-1-0 {
 			};
 
 			cluster_1_sleep_1: cluster-sleep-1-1 {
-				/* Power Collapse */
 				compatible = "domain-idle-state";
+				idle-state-name = "gold-cluster-pc";
 				arm,psci-suspend-param = <0x41000044>;
 				entry-latency-us = <640>;
 				exit-latency-us = <1654>;

-- 
2.43.0

