Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92A4E47F3CD
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 15:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789398076; cv=none; b=pD0un4t2qE0JqP3TMMn4gQ+8RrDsN5mu+sHR57Tn3Th8BmUaYXJ37EpjAjmqRHZGlaKoieS/FNt581aHnhwS3EE9X9+QbFKsAyTdsWaQnWgtIRrOksNBeol7lO5p/lwTVllNYSw3npKUQt3AUS3XmvSzy/D9KhtlF+5qy/MqUfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789398076; c=relaxed/simple;
	bh=HciPNJeroVrXrUOsjAQZrtcE5R9UzHaUh1eqHckGx+o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Rb5E/LkriBR35dxEnvmDg91tBWcHfzG4U7SYJ+0s7th1WcCxwGVAn8WJHGocnZMijkBB3nI61E3/uMiMWxDIXtJPOCrofgYh/XCNMUDwKvd+nZ86Dp0puK9sUyteeWGPEM/Xz1cpjTmYKpHy/V9OQ1Xk15MwK/o9NYD1tuqtN94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lg1hMAq+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S65OrK0R; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lg1hMAq+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S65OrK0R"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ED0aLO4157654
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 15:01:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	btXV6KHGAw3+GaDmIGslj+LlIRfZXkr4tQ4AjomFcuM=; b=lg1hMAq+rA2JcRsl
	MaQMCeQKDQoXXDEuAkGPzCk9mfww45mYEak/SQD5rKAIFvZKvOB7KTq68eSwDSEk
	lrYhjOQfbmevxvH8RAqdt9Zi2YnB4Sdd3mza3C+v/8aK74qku9giZfPnF68s6bju
	lVvsMQ84PIu/2MkJqZACptjMjLl2vF637F8EmhZS5tAjWF30yMyhEpZvm3crVsNf
	G3Q16S1LjGNS8dp9Bzf6JYiOFOTZ5UbsJcexSlgf4Ndy/n6PKCs/Xw2ShAAZeT/C
	9O0wIa56inkE8gS5835wc2u7wto/QUeZA9Vci1hDCd3jKlgyqEG4ozRJtZn5KI51
	zuShIg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpd1f1jpd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 15:01:11 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d6df0a1e18so66925335ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 08:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789398071; x=1790002871; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=btXV6KHGAw3+GaDmIGslj+LlIRfZXkr4tQ4AjomFcuM=;
        b=S65OrK0RIQJqRpU4nPGuFe3HnPG91GaFoe4ie/uWzUDWpMC64yBI+eoNTEvqnUAE/c
         y84Bu4fXPr60pPTfLB0ph0imMZBGo+YHnz+isEdEOEdJQFNr4fbtnGA4X+xJsbbazDVH
         BvFcaPPvvCIqxIefxW4yDcUlwCbVeJa0eh3+HRNm45Ecb4uJ5KXyjkTuN00c/+R8kt09
         cdprq1FJKNet8SZyTHc6tylU1BxgTabfGCcFLEGfh/8REMbLakbYL5sjbI9x2NIDIgRi
         6/r8PdtjTjLOycIWI6dvM9jsPdQQLIOwRiYcchhmEYDzfSiS6IVqVOA1AVPmk5F0JALP
         vuLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789398071; x=1790002871;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=btXV6KHGAw3+GaDmIGslj+LlIRfZXkr4tQ4AjomFcuM=;
        b=mMRBGZ+4GNdBrI542sjktrR2/7sHXaoCvs4IFy3yegGS1AaEwgRUU4P5r0V7uORZHT
         at5x4QKbvrwGNLxsjd1tRYvb/2wDNJWc8YF9u71kRw63FOOllQ6TVkEZGSFGig83a03J
         PnQfnIgOiBYw128BE5fZre8FBi1ItOSkbsKfhWCv2iReZDe4nIJ2aZLHkRYunFGyMKqA
         N9JclkABtAx+zDsS8ngOU7NdhykJUhqI07Mig8W+wBHsDz9UdHvoZgjop4GnmF7VwsLP
         clPaG0OlLYRoBl1L/QhlPkzDmGxCTy+8Acol3AisixkcXtdZzNr/cNkAdeZD53HoJHPv
         QJaA==
X-Forwarded-Encrypted: i=1; AKwUvByBC7TB7pnzHradPGsJ5YJch2eJcaYFxG7yLxDNFt1keqNtZ0FQsLfrkqb3MzCapwGkERsiNdcWBb4sY69F@vger.kernel.org
X-Gm-Message-State: AFuF++kEoFrp7w2q+uSEiW2T5sNIztjbTMWqwpLdtVc1xh4hvlod92kH
	run6IkFOFhMaOB/4N3GMLllWxdNFoPEKpJBdAgqPanZ9DgWNjnycuWhNqm3ufJPHItRBkoLZJ92
	bYDVsAemsEbl6HaPeqWYW6/9tKzsruD7PoRxbF3StRSNc6WSuIOHfuBQbLdlb7iOoOGGv
X-Gm-Gg: AYBFou0Yr5cecRUZ6ClniL8qfc3awPFYTlEpRBLiuge7rqVkVQNFFRCjxTzvvvpXyBN
	t5/qJLBaKSQGuNZ4uGLhiPgTCvWwrsU6S1KJQk9aSECuJ3Oh7PdxBjFmIlTDGxmlzTfoujO+7rE
	1pq/zJykAkTQOc5gqnsahUjYEIO3FN86aUWnIvmJbe4wYp852TPoDC9WfCbSwND3E+9Mhv4DfxU
	ZQi8mXB/oxDwb0IsZBlm1U+5/fX0IoZHclLYmoJGZu9UxepfKfWeJDzcrdKbUqfLw+4tkGbX2pK
	oBdyLKANqk7zf+87NJoBXtFqBQds4h/OCCDXVFMB5C18NJkxJHCLTbZYt95Dw1tIaPdz9AcLz7D
	l+BKG8B71N3VUrTzOZ9Sl//Txei48WzhRUblD
X-Received: by 2002:a17:903:2281:b0:2d6:fd55:3a9d with SMTP id d9443c01a7336-2dd6c5c121bmr55028805ad.3.1789398070555;
        Mon, 14 Sep 2026 08:01:10 -0700 (PDT)
X-Received: by 2002:a17:903:2281:b0:2d6:fd55:3a9d with SMTP id d9443c01a7336-2dd6c5c121bmr55027765ad.3.1789398069890;
        Mon, 14 Sep 2026 08:01:09 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd4007bd4dsm42943345ad.4.2026.09.14.08.00.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 08:01:01 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 20:29:13 +0530
Subject: [PATCH v25 09/10] arm64: dts: qcom: Add psci reboot-modes for
 monaco boards
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-arm-psci-system_reset2-vendor-reboots-v25-9-4aaf5c09b5c2@oss.qualcomm.com>
References: <20260914-arm-psci-system_reset2-vendor-reboots-v25-0-4aaf5c09b5c2@oss.qualcomm.com>
In-Reply-To: <20260914-arm-psci-system_reset2-vendor-reboots-v25-0-4aaf5c09b5c2@oss.qualcomm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Andy Yan <andy.yan@rock-chips.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Lee Jones <lee@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>, Ulf Hansson <ulfh@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, mfd@lists.linux.dev,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789397948; l=2076;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=HciPNJeroVrXrUOsjAQZrtcE5R9UzHaUh1eqHckGx+o=;
 b=UfsY7hvxgla20/C84Iw/tfliv3ND94oAV4ltNhIsRBPYTiUf+dZTp14djxCjGxqCD1wyPym5h
 ja9i2LTf4ynAyKkvvXv59iyNjK7EUvPNRdV/B681ucGMj9XpztqZlP2
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=ssWsJFX3OM9pkdoe4+guOfGPaulHOFt0GVnVlB6on+s=
X-Proofpoint-ORIG-GUID: mXCRzXRjZqlGgX-iqxMcDETErSHJ5l-X
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDIxNSBTYWx0ZWRfX7jxq1COq7FQK
 5BkNYV+y3LCXeYLIB4HapObJUvAGhdEiX24wc88I75rDrN7FJC7WGFrZp9GZ4WBfXubhhwR3udP
 AhvpSw99T8iQyxncfhmTCx5QHPOfQ5k=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDIxNSBTYWx0ZWRfXx1wErkd+uSs3
 2+rEraMmHFlEKCOPLryMriiyLVtI1cXdxqikvP9ESv0ZKUGQyLx3zkEEF/ApIWqlhq0EO1c1+rx
 omBHOtv+L04AJS0pBASDRahGt1WnRS8BuT2LZRNXevYHaVELKWNa53E07naa8VY+an4S8hZ3YhB
 xdAKNgPm2SJlLbM99Wk2CMDMeLOkfvH/d/gG+d7WLHb0nFW+DkYt6M8NOP4kh+XFYodoqsWbWOi
 Ck4qPuXW07bzsrqPBU9DI28DCTDgv+GyhYz+3TCAzYtTvV8gfCzzzd1brDp1bWdia9xolwZThYs
 tjkTqSAT66EIQiBCMxG6YsHIk/RZumZn2uqZiDyTy4HntUCpJQGV2bruCSzu/xOB6eiY2gn/ESh
 4ucbob+lyJBe9CfRO0N1z0Rqu+nbigCV8PLZ8YUg0RzwUyN1Li4XGMe1PelyxplySW53Hc5+NDh
 GmZIHNgyQtu6zVaIl6g==
X-Authority-Analysis: v=2.4 cv=XKel2ghE c=1 sm=1 tr=0 ts=6aa80c37 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=t9IVmYW30V31rltyR78A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: mXCRzXRjZqlGgX-iqxMcDETErSHJ5l-X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 spamscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140215

Add PSCI SYSTEM_RESET2 reboot-modes for monaco-evk and
qcs8300-ride for use by the psci-reboot-mode driver.

The following modes are defined:
- bootloader: reboot into fastboot mode for fastboot flashing.
- edl: reboot into emergency download mode for image loading via
  the Firehose protocol.

Support for these modes is firmware dependent.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco-evk.dts   | 7 +++++++
 arch/arm64/boot/dts/qcom/monaco.dtsi      | 2 +-
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 7 +++++++
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/monaco-evk.dts b/arch/arm64/boot/dts/qcom/monaco-evk.dts
index 9d17ef7d2caf..df668dbf2bc6 100644
--- a/arch/arm64/boot/dts/qcom/monaco-evk.dts
+++ b/arch/arm64/boot/dts/qcom/monaco-evk.dts
@@ -661,6 +661,13 @@ usb2_id: usb2-id-state {
 	};
 };
 
+&psci {
+	reboot-mode {
+		mode-bootloader = <0x80010001 0x2>;
+		mode-edl = <0x80000000 0x1>;
+	};
+};
+
 &qup_i2c0_data_clk {
 	drive-strength = <2>;
 	bias-pull-up;
diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 395d32d36844..9f1ab59dee2d 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -654,7 +654,7 @@ pmu-a78 {
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
 	};
 
-	psci {
+	psci: psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
 
diff --git a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
index 1ff39530ea3d..aa95584b000d 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
@@ -678,6 +678,13 @@ &mdss_dsi0_out {
 	remote-endpoint = <&dsi2dp_bridge_in>;
 };
 
+&psci {
+	reboot-mode {
+		mode-bootloader = <0x80010001 0x2>;
+		mode-edl = <0x80000000 0x1>;
+	};
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };

-- 
2.34.1

