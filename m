Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4A4E30674C
	for <linux-arm-msm@vger.kernel.org>; Sun,  9 Aug 2026 14:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786284518; cv=none; b=Ac7eIvIvbQXKipISCwyZQtCEqz0JThM5wvacKF79LrVde9GpqTf3ksn6qfUubyXw6AZUARxZer1WqMlst23FZ1M+mNb4IY27GTk8dWD7+nawShatNYIfJqrcp6dqWZlmFIfQyxKA5VpDvEoPdMRgl0DHxmT+zx/8HIv2iR/EzI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786284518; c=relaxed/simple;
	bh=/DJHFjQX9E7YuVUkj+y3FsDcwplriep3EvTUWoqaWbs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j7NSf+mEYN5mLOnaRfPcGhsOLYT6tl7eyG9BAofkgOUBtgrG6atpCusDgdEsKwaxiv140DPX/dy4D0WY86mAIriqRMtJgnN5SVDjzU1jT4GOIxTSI7HWfzXT54iwpLBVXn/rQqJLb/UAC3LkvxdroN1qwvBtHPxd/JkBB9zfvto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pEIxCPYa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Di9Q2xVK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pEIxCPYa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Di9Q2xVK"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 679C1akB2328304
	for <linux-arm-msm@vger.kernel.org>; Sun, 9 Aug 2026 14:08:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hJ/wgRkqUotp3CoWz8XocYAAOlaQBPuzP2rQrqZWNXo=; b=pEIxCPYasCc3guee
	aK1GFvLGgaxcdWnAHqmpAOOIiIyUhOQ+uVw1taejPHF5t8R2n0ZmRYA5yvDeJr62
	nWKU/LTNJBfqDA4JCRKE4pDY8zIjTHPH0Y62P0nSKxBID2VrLKVPj6Hj66fYJA9q
	LHu03Gu+aFNOIOEh22PQ3bagW/d7+zUxClchH4GSwyoxHhzRX6tTfVdv4dwuY7Mt
	cMDsqKS7R3ksRPgsc1ss4jrBIo9UOC8p4cx3q7uj0CtCJOo89lYiy2kPB9gytBcx
	vWBCAcF7C8vl83PHd9nxx66j8FX/Fp1Hy+yZSMAnxe+fjobdMLDC6ASjy7BpkaQj
	pDj+uA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwwr9jus4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 09 Aug 2026 14:08:36 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d02df2bf09so17133895ad.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 09 Aug 2026 07:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786284515; x=1786889315; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hJ/wgRkqUotp3CoWz8XocYAAOlaQBPuzP2rQrqZWNXo=;
        b=Di9Q2xVKTIzRGa0Itn7FS9aXJtSGclA8Kt0NagG/MNUyeH5eH1UtdjVF0zbCKdyBFG
         KG9Y7MWVmA6oQEgw0/xEyh/xh4/E40xsUTLSAivl32xmSx/77//EYJ1RJ9b5Nw1urzKf
         nRyWWSxodAqR1c8wnsono7dUxpCgp6irKmKAQJ8zZXEaPITH5ZlMtU7g+y8kBw2Mn7O8
         yU6/2H07TA85OO562wKzj62krZJuKpCKEKm92Q+VoJAjL/z/MhZ3JSjs5b5ZsykAxzzW
         8qyMvSHt2MF7rEDny+LNQFNigT7TSWIhpyFKVHpV7GamRuGQg0YAIw/o75SMwcKIvlTH
         1YZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786284515; x=1786889315;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hJ/wgRkqUotp3CoWz8XocYAAOlaQBPuzP2rQrqZWNXo=;
        b=nE5PVmICD4GCItOjzTISRVSULJWAp2N7agchAqv7ccD0tzsFls2IOIOUdSKiBZUFNn
         9yw6Yj/NORXh+j5r1OtHJT8CYsHwfzfxknCEj3fKuyU66euYSw+RoP1YVOMNAGWnb34H
         b3pKq4KIvIzol5qq8G3xS2ui/PmhNTfN+zRLrNQtD4g4PdYZ8keVjlCREGghVMaxdvjd
         dQcUlIVy+RrgaGQhszH4wm4Ab8a/so3HHk0g+czDu3vqEfzFEmVBqJXnKlYeg1d8AJCn
         tDBJvg5nh7QLqS1T2w4c8Zo7ofN5KL+qm8gMMjOOyVec+Q8rSM9cmXRiUEVtku6j3PqP
         rghw==
X-Gm-Message-State: AOJu0Yw2bCRWBoT7Aajabw0b3e3mPpABg5qQBeVsmySFsG7jbtuyQq6s
	lVeMTXKdDrU8XCZOHhNute8e6z6kmSY5WGk7RkWULNMktv90lqFDImfxVPXPEoThtUwxlN9KtXd
	hP8C3Xr3BFdUYIEKNWH/juV6XY06BZgwA1butZJrp4UX7VfhY1B+aCW1q28fu/5z0eGMY
X-Gm-Gg: AR+sD13POKuj07aj109uWo06driPvg0Vopjf9VF3wj5uCh5l763SEXhzdC0pAAX+Vn6
	MffxsaMuqTXaNAzfLWOqMnhQFYQR2rrjmCgAhlHe3uR5AToObLd9wZBWMr3oppAY5X2ls9AaEHL
	gG5/4i6lDJHpeM9sIIGgUrZI0yxtXvUYs0IlT/xRKY6gxWUbiFFgMlOo6gyOxuVnzcz3+GkQ/C0
	sNAPg2qgyaXVqgzHUbDXBu8GI6W/Uyj6Wc+aq6CjtFzUeqr+LUbJf2ZMMLZcJyiOW8AyX9i9HU2
	XgarveojT2cq3fqsiNETh1qL8MWARpFRBorBQ4UXFTXJLEHKWUDR0VwlKDeIfA7G+Jbp3uG9NES
	5k8qhTEBzPiB338PKUzc=
X-Received: by 2002:a17:90b:3985:b0:37c:18e0:90dc with SMTP id 98e67ed59e1d1-3903c5f41ccmr29019952a91.16.1786284515349;
        Sun, 09 Aug 2026 07:08:35 -0700 (PDT)
X-Received: by 2002:a17:90b:3985:b0:37c:18e0:90dc with SMTP id 98e67ed59e1d1-3903c5f41ccmr29019907a91.16.1786284514923;
        Sun, 09 Aug 2026 07:08:34 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141019b4eabsm25489437c88.6.2026.08.09.07.08.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 07:08:33 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Sun, 09 Aug 2026 19:37:52 +0530
Subject: [PATCH v5 2/4] arm64: dts: qcom: pm8005: Add temp alarm node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260809-shikra_adc_support-v5-2-bf6882d18bad@oss.qualcomm.com>
References: <20260809-shikra_adc_support-v5-0-bf6882d18bad@oss.qualcomm.com>
In-Reply-To: <20260809-shikra_adc_support-v5-0-bf6882d18bad@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786284499; l=1771;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=/DJHFjQX9E7YuVUkj+y3FsDcwplriep3EvTUWoqaWbs=;
 b=qSPfi9rkXoT1yMPkJOGQoTjJ6dUUn7dZibbXdNPIFv1bdDkPXeCzrcLQcCyoIZFAzR/xaGysd
 YKzqiOxREJeD9PZrxmxRenZCz4o1y6JvXCXLXf4kIl9SDh0HR9D+Voq
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Authority-Analysis: v=2.4 cv=d73FDxjE c=1 sm=1 tr=0 ts=6a7889e4 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=1cSftZPrRki1B16PJQgA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: f45icMuIhAvFQauPPjU7uyzJm5pIjUyt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA5MDEyNSBTYWx0ZWRfXxvIL2iNUvFKG
 uTASLlnbSKSdIWil1D1m285jmkISev0UY6zS4A7VucII8E9rVPjzlPVJRrw1TRmhtvOpjSvKcZU
 Am/7R9MWh7PwwZvoNtaukYzojiSbHZOXX3UwbWLLUKeAiUF2iaF2/Lzlhk3FvKeSSVVOaSrVDUB
 D3FgwgWmTYE0oQ+AkjPZKgvgkFA+o/vIBBKGxwM+a24N4S36pqrR6OVysn5QI+sNL3iP6OA5OU8
 dQ7fe0kkCm7Pul4rHqWOjTHyU/5Q8v2mG0hWBt336wkuxk/nRjPkXhCkRiJngOpr2BHRMxNB+KW
 /I7MxDvGbae77Ssu8IfcjQuB3RfQabBTe4mByrKCyD1kWJ9U2hZQBR7W5Bk4InzakKNEYSCz0SY
 xBUbWKD1hcHnUKzmi0xNX78zDdqyT+jvosYYPZ6eeEiLT+nAnPeNPlfWBYM8bPvTct3g4gCQM4j
 u3XEl6Cw0647MZxrcDA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA5MDEyNSBTYWx0ZWRfX46fEhM0FwXxZ
 EPGtFHGiQ9fTnQV013xlBpQz4qZe2UjUXPk10d8KX/KEILCxKveSfj5hZJym91VSRbqqsnnZL6r
 BIGwTOIlOJV7PDVZnWw5DU65brkvoTk=
X-Proofpoint-GUID: f45icMuIhAvFQauPPjU7uyzJm5pIjUyt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-09_04,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 adultscore=0 malwarescore=0
 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608090125

Add temperature alarm node along with thermal zone used
for PMIC thermal mitigation.

Co-developed-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pm8005.dtsi | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm8005.dtsi b/arch/arm64/boot/dts/qcom/pm8005.dtsi
index 0f0ab2da8305..ce31a8545020 100644
--- a/arch/arm64/boot/dts/qcom/pm8005.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8005.dtsi
@@ -4,6 +4,34 @@
 #include <dt-bindings/spmi/spmi.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 
+/ {
+	thermal-zones {
+		pm8005-thermal {
+			thermal-sensors = <&pm8005_tz>;
+
+			trips {
+				pm8005_trip0: trip0 {
+					temperature = <105000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				pm8005_trip1: trip1 {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "hot";
+				};
+
+				pm8005_trip2: trip2 {
+					temperature = <145000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+	};
+};
+
 &spmi_bus {
 	pm8005_lsid0: pmic@4 {
 		compatible = "qcom,pm8005", "qcom,spmi-pmic";
@@ -11,6 +39,13 @@ pm8005_lsid0: pmic@4 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
+		pm8005_tz: temp-alarm@2400 {
+			compatible = "qcom,spmi-temp-alarm";
+			reg = <0x2400>;
+			interrupts = <0x4 0x24 0x0 IRQ_TYPE_EDGE_BOTH>;
+			#thermal-sensor-cells = <0>;
+		};
+
 		pm8005_gpios: gpio@c000 {
 			compatible = "qcom,pm8005-gpio", "qcom,spmi-gpio";
 			reg = <0xc000>;

-- 
2.43.0

