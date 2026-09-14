Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6096638F922
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789369243; cv=none; b=Y+gkw3c2l2YTtybv2BQyNDPmGtCsHlzXpP2XYofs5Zz7CfAbifurmGkKts5ikhxqV/3o1MzlbAp5KeaVD4p+0QG7eZMP7ANJlTuRjwtr1YnsfASNmp0Vqc7kgnT5wklucVfLniGe/WHV02g08+7FQURuzrchYZ977cQSMrybKc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789369243; c=relaxed/simple;
	bh=pOpkcJXJFl6Fh/+JLEA+pVmC+EXfTn+h51loP9+XOPA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DPAGCRpvlxBFA2tyYVvO7yImoUCdsjaH4WmHIM+SLB0FlNvyfsxtSz/JnqWn1RXTAjg+XKmksFo5eyNbhxJFkvsJ1OwnfQHBljzRfdRfR7wbbdxsfmgZe8CWdZxMyPb4KH1n28oLyHDQYzsy5XLgTDW3MqqhtzWDg0gTMijZy00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c2+qyDYL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b77NJCwB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c2+qyDYL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b77NJCwB"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5jHkR064030
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:00:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vgqfN7e2K3Ed1VO+TXhWmlnFQbJnqDdFUTDcZJR7DVQ=; b=c2+qyDYL1A0bW6q3
	vkMrlxA4+k97TzBvq62TeAxkNgN479ete4cCp8PXaLtjoCu77y202cdBarXq+9cT
	jqRSZcNyCzw6U9pVemZm05fy5LodaHFVEOULSiWkWYnHCeliiAkhhuiqzsro6s8n
	R0onbmA/2NPt54b7gi8lTxHqu5W61FnUkHKCI4BuwbkaWcoH4o0HAxOVFZn3pBo0
	FQIjH5jIUbYPfH2kQ/Qo+S5wIKLJPpYVAWqZxruGCYfhOPRZ8qPuzP1oyvxL8c4x
	UmMJiYz5Jvt7HS9DtxDiXk/ShJRkHmCUKI4Px3d2Szm6wB2a1wJmkNnw9loxUY2I
	Tacd9g==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9dnfk9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:00:34 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38f283baf1fso3490448a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 00:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789369234; x=1789974034; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vgqfN7e2K3Ed1VO+TXhWmlnFQbJnqDdFUTDcZJR7DVQ=;
        b=b77NJCwBP4xB4F52/Sjw6VwZ3JGmwNJeTzmyDNlyHg5v9WdWnAwdn3piyIqpLd188v
         Bas/gRel8gQArBkWr/eaCSfD0V1tgswjB6WnFeyEPtt4p7IjlscwWqBeZATwMGJ8PD4n
         jZgpAqoYUrWG3lxgUqcy2lQkBlYRO+xPdXUfKq+PevaogvdPioHi/W41MnK7W9g3KCvh
         h6UG33lhoVCYX+Gz0oyjclkMXF4GDnAiR5IEUve1+JLy/3CEaCY+IXQN7sDTeV+DPJJ5
         ni5Di1F/tj/t/O/MT9EUxbPyWEgRfLf7JZfwBCk+GDLxpIvq7zWuEhfkWxR2ZTGOH+ur
         UCaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789369234; x=1789974034;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vgqfN7e2K3Ed1VO+TXhWmlnFQbJnqDdFUTDcZJR7DVQ=;
        b=dqthAkgh60VsZeW/IgDnvzQzkoFves+IN/+Mve+7gSES9eo0YljrI93uKb5ODgFke+
         t7bhz7VN9hfIGAGns7taBqyV+pQmGs1db+qWf2B4flD33+EehyF8pSZ0Cbx530AwJyZi
         GmZS8CClqiRGKAa0O5ONU4dME2pSLcvyuTnt4H6zieE1cYai8wXs6mNkhJU88aatBenL
         0udKsC5H4hQgieCwpIUppdwnmUrOctr5F4yGw9mCpy4Ua3k0oOqXzCLBNwxpmZDUzOT8
         phgkqnh7C+HoclYeE0dHx3bvoE9Vn1IqNtC2Ueq8tMQhsZaTsas/LnRCvs1qL/j2z8nj
         gZBA==
X-Gm-Message-State: AFuF++mg8D5o2Wcd636jxz/NDtPHZNNqxjaRS9x7ysUQq+kPVTH+sgRf
	vI5P8d5KJSkOurEiETmWfOF87s0oxHualQEOZpXxl3BNBk4pUbECPW1T1Rey+3KYFQVymBKoWeq
	xTDPUVA+AbDvTue4+Plt3/ZGTDxPCUlLS1Qsqfn4AaBncwrejNwwbbwIRC7KICKZfqgTI
X-Gm-Gg: AYBFou3bmSUXzW9a2LNFXkcOhpnloOD2HOv6/1kYU/wlLDzsKKYIOVKGa7ydL+IkVNI
	/FsK7I+twdtd9UWRpnKkLMeKhLYej+3KbG7IIknwmT1Qaexre+U/ZxYn+RAho7FOL6snw0TtMsL
	n4AfgFJqEO5xw0kDwyUxZ+PgS/0IdEDXcnI+wKfY+TIU1ezOWwEopXTPceIRWnCABgvtD/uJsiJ
	rMjADUPqsRYyliil0QqM1Cr6uENVbggEpW+TBiMDSvoCiHdoKPi7X4xlYFQ6IZgBBCi4H2B/cY7
	c9oMUS5BGHYkhOs93PZ/hewCoesX/DrAX0Uz2T2pA7kIaaG0QHsXE0HTMBz/93QfFII8dLw33fL
	s9xBvfbjUeL7UgW+SXaWM9HJDwvOM
X-Received: by 2002:a17:90b:164f:b0:39d:b1bd:b384 with SMTP id 98e67ed59e1d1-39dec0b6344mr2990948a91.17.1789369222664;
        Mon, 14 Sep 2026 00:00:22 -0700 (PDT)
X-Received: by 2002:a17:90b:164f:b0:39d:b1bd:b384 with SMTP id 98e67ed59e1d1-39dec0b6344mr2989763a91.17.1789369215574;
        Mon, 14 Sep 2026 00:00:15 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f55735sm25962177eec.24.2026.09.14.00.00.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:00:14 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 12:29:38 +0530
Subject: [PATCH 06/31] arm64: dts: qcom: sdm845: Add domain idle state
 names
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-b4-idle-state-name-v1-6-660c31187819@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789369181; l=1618;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=pOpkcJXJFl6Fh/+JLEA+pVmC+EXfTn+h51loP9+XOPA=;
 b=l3rOe/mmoMDkkS10ViVeh6M6Z1ybGVclo+yj7g7zXFeL6+tvggJmajX24/u29RCdzVBw4QkFm
 AmBFG02gyM7CXAgwLsnxYSvkzq6YZ4K8vvSWFyHN2N4zaPgEoRRsZpT
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDA5OCBTYWx0ZWRfX77EjTE2KbEKT
 V3K2yX8GtjNOz4rp9CU6Yq+oJpbzfkkkYxNxbWlimno7/M3stkGA1UdbuOENPWu55ri7l1VJIAJ
 ZnCl7LEGMur9Ix/4ZxCkrWz6+u8kJ5rc83RKdozXW/9b7vinYya1MjeDwe+CemWTlCG3s8Jzon4
 xIElPRKk60v4tfwRfMftK2hSVlrhf2tiXvorobcc9kjUKM6zwtDGn7zU4jTg1s6M6HCXlTZqseU
 /Ft2ATybwKZvSoSFuIMr9x5CCRxMKZIuUqZ/5g8YlfHYjw1ZvcXplnRrG0UtODVR4Z/8OQCFceI
 MjEup/zgnUzzbX2StyKUSK+7mQwyl1Z+ocogz6++RHCfOdOOVf4uBme7gytl8clrSVrarTZ9FAD
 Ai4jK7yAURdk3R9JZR+z08GItwgvZ4ryDfSayqtw5QBeFuIsF2xVOhlLU03Qp4Ea1EFtvxBn9EA
 YMa+ttxCBgTgE02nISg==
X-Proofpoint-ORIG-GUID: gatPqQwZ4xjsQZH0F_oXiRCqlPuYEXEa
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDA5OCBTYWx0ZWRfX5Yv7z/fxNW3M
 /LTm625+CfktDVL7ht14kBbqIMqrvxtZZpTZjG2e7bTPfvUCCLFt0japcB97fCQzD6NZzz7ccjD
 P9yNqMh/hHisCNkkpGhsiYK62ys7h1Q=
X-Authority-Analysis: v=2.4 cv=Y6htIReN c=1 sm=1 tr=0 ts=6aa79b92 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=N-3nubrmD5AHxcc_kpcA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: gatPqQwZ4xjsQZH0F_oXiRCqlPuYEXEa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 impostorscore=0
 bulkscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140098

Add the idle-state-name property for the domain idle state so low power
modes are described consistently and its name is printed in pmdomain
debugfs.

While at it, update CPU idle state names to match the low power modes
they describe.

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index b1f6782a3ad9..a5693bc72636 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -330,7 +330,7 @@ cpu_idle_states: idle-states {
 
 			little_cpu_sleep_0: cpu-sleep-0-0 {
 				compatible = "arm,idle-state";
-				idle-state-name = "little-rail-power-collapse";
+				idle-state-name = "silver-pll-pc";
 				arm,psci-suspend-param = <0x40000004>;
 				entry-latency-us = <350>;
 				exit-latency-us = <461>;
@@ -340,7 +340,7 @@ little_cpu_sleep_0: cpu-sleep-0-0 {
 
 			big_cpu_sleep_0: cpu-sleep-1-0 {
 				compatible = "arm,idle-state";
-				idle-state-name = "big-rail-power-collapse";
+				idle-state-name = "gold-rail-pc";
 				arm,psci-suspend-param = <0x40000004>;
 				entry-latency-us = <264>;
 				exit-latency-us = <621>;
@@ -352,6 +352,7 @@ big_cpu_sleep_0: cpu-sleep-1-0 {
 		domain-idle-states {
 			cluster_sleep_0: cluster-sleep-0 {
 				compatible = "domain-idle-state";
+				idle-state-name = "llcc-off";
 				arm,psci-suspend-param = <0x4100c244>;
 				entry-latency-us = <3263>;
 				exit-latency-us = <6562>;

-- 
2.43.0

