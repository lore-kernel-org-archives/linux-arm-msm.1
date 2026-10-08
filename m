Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09A2748C8D9
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Oct 2026 09:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791450918; cv=none; b=HgUtjNmNlkh2/IDZ0Ab9sFUgCIdp/lyRxAqNAgq3EW3WTbhbwPBFuTHLsk7LcNQ/M0iZp/SjYRa276NVLgSk/oCEbOOfyo+KkDP0Z3VqUlS3aRsxnsSI5s0BQpvTYlNfNs+TzXBEBcQK8HlMl3ziqXgTMmMmCGr6+It+YctHWJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791450918; c=relaxed/simple;
	bh=vuyua48vGGvQ4MxAOjhCqLsnnDg3yPVH+Wq4eUpmj/8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qMx9VTTlyEuoovwgXJ2vEagYScOtMmRTLLd+uNtIvyLLmcteUBlPa/HodRW8ptPWFhATZJ7PjXB2qwa0eeU7nMZ8nN4ziYc7lJup+I6WZE1hi9s+TbXo8DgZfg4zNrNtdUn3wHc9JF7IKTdETglHrvDq4S71KCyVp2MjTbWDCv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BrVCE/vu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LD42Ul7k; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BrVCE/vu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LD42Ul7k"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6987KPAd1846159
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 Oct 2026 09:15:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JxDO2hqHzKm71Fhn9zcRRHeljUxVYTK9oflkaZT0noc=; b=BrVCE/vuoUZtV7JY
	8YKRQphQFIS4BQm66cEJ3g2ZemjYIc+ViEOJ6QiqmDC68hBwo7q1F87fIBG0cAOE
	r2gUTIhrYf+pmwTVBFlHpXE9z542k/OvKZ7Hmt/9dovkj2FXqO6nARcQQyMcQHTk
	yywEhYnBewsNXx5QZySZszKGVylYjgUdo5WvhoLMXA2Z9mcQPSukZ2zfy4tBLe5W
	/mrKYyx7Qm72r4pJTvfXZ9i2+1lJIAYNHu6jhgVKx01zB2CtoB06cR/F0BFN2zGC
	UxnwhM/JMPfvX7rRI+72tkGm2QPISFbY/tqozY8o4WRRIZ2kyChDvvF9LjQoXG9c
	qFpwmg==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe3j6vu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2026 09:15:08 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-139b62317d0so17671743c88.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2026 02:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791450907; x=1792055707; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JxDO2hqHzKm71Fhn9zcRRHeljUxVYTK9oflkaZT0noc=;
        b=LD42Ul7kqVTv41dreo2bQr5tlw0rEgtg82GJEwNm/9X0JuqfF2C2UdeXXN9Z9WIccR
         iuD+E9hSn59DgtDPL52NRI8FrSWXDly+HV0nbkrq/QyCWUHAX4oYAy+r/Dos9YW8NqnU
         h42upZuVyTwIm+/VKShB25De29qCOIEQ6npcTCTksvv7b6DuG9JkeW0vS4K0eyLw6DXD
         ZMYeXqvY9S3Tpz1AHzrBJ7VzRjF5HwOURQbYu03zf6LCFNSNuXbgqUGTC7PDUTXaemYJ
         7uzOzwzAfVljCbAQidhg3koLS8i5vxs7cz+qxa/wmK4GdxjlZ3arauOLa0U42M5oAJuJ
         Yhbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791450907; x=1792055707;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JxDO2hqHzKm71Fhn9zcRRHeljUxVYTK9oflkaZT0noc=;
        b=jwu7GCf3hmUW+NdFTuO/rhtTD1fyoDBDrtYzCIH1n50KTfVDW6Pnt3TD3huKR2eH4O
         i8vN1LZBw3afnkflWeI322yEQRJwjFaDXB9bowwHxx3RqD/HjhibOfihCGYDMtCaYRKx
         Hr1e9UWDY9HJeKLyvqxzpRt8T7utmthDGqVXxl/fadmgC0pruegK51vtn6vSWUhgYFX1
         0x4xQB4yxOtC9zb9vIkkmgRq5z8ZWBZTzbn3U/fWp/5hTuby+DY23suJ797U/ue/0OXW
         8JgzRNb6qihRfjyHYF6R9Dh1BJPS/UH3BwAA/C1sUIbXuSQn/p/3MX29fVlGrxxRuEkZ
         kfmw==
X-Gm-Message-State: AFuF++nk/Hkl3bQEm1bwhvnzlfiKQeAW/u5qtGNWZb7ipEWlOTVx0M7Y
	wXe6/rPAbH8nzmGjRIVAzv8LVgkcTpd9M2ziKpI/wxVXu6X8egDgV9WDwX+6zlkPCPkcHxefY6e
	3TrkyFz1ig19OFbETEZhaz1B99KfxI379St0dgXBn29A0SOoQ4BeP/OwGvxiq1TWGWUZj
X-Gm-Gg: AYBFou2Dra9Wnfl8W7bGoEri4lNjPFryCeIH0qLsgnRLzG4JLhFY9ql1kjhUOCPjKlu
	LIx1of0Wm9kwBilfkYykdIdv/h0jVmM3fNVx7L+yuc29JrS9N5YYxSMRHXvoKerccEeZKBrSwKW
	VWVI2G8ksumuPr7J5p35XHyiugLyTFRRAV2TMEtp51tiWrlVewo1ppoVTipcUQJSSD/m9X0x/4p
	cwP3FKuBgzMRB70l29Acf/CfCWVjwJRIUHNsHWtjnyYJq6FdlxbCmTvhAbvQqONtCuMBrA8+tbQ
	tlwezHZ3RMtrHlJYQYk/MBHilVnW89cwVANVnNMxidqtu7scJtZ0F7kAjNW+KOE2ITs6toz+oNd
	JkwcvYq4eTQDeU0u1rZUNFDinxSMrncFF66yF0w5Nurjl+kaD3O/fxSZTk++5craUaTGqDaWkBQ
	x2I0cu0Mc/3Z/yx/LnxNhAoccqftmA
X-Received: by 2002:a05:701b:450c:20b0:143:5266:48ee with SMTP id a92af1059eb24-16208be0162mr5607325c88.42.1791450907281;
        Thu, 08 Oct 2026 02:15:07 -0700 (PDT)
X-Received: by 2002:a05:701b:450c:20b0:143:5266:48ee with SMTP id a92af1059eb24-16208be0162mr5607168c88.42.1791450904210;
        Thu, 08 Oct 2026 02:15:04 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1615f1ac8c5sm24456045c88.2.2026.10.08.02.15.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 02:15:03 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 14:44:28 +0530
Subject: [PATCH v6 08/11] arm64: dts: qcom: ipq5210: Enable the PWM block
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-08-dts-v6-8-f9c4ec8664d8@oss.qualcomm.com>
References: <20261008-08-dts-v6-0-f9c4ec8664d8@oss.qualcomm.com>
In-Reply-To: <20261008-08-dts-v6-0-f9c4ec8664d8@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAzNiBTYWx0ZWRfX8ZBuGnoOIYsM
 4Ot5Mc6rpMizO82UgnIptYR8R1a5S6WnIcfLibYYIzld6ChfFVygW5wcmiZv7CoMFDpPz4+Ajzg
 loH8vR5ieUNdn3m+X9QuwHKiXfaLdHA=
X-Proofpoint-ORIG-GUID: 4-JMqZEh9J43sL6bwHM_IdMDor2BYeAH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAzNiBTYWx0ZWRfX9ytKKfHXD+Z8
 DOfF53J8fMAONufZqrsSZ8KC9tRgNbf2rQ9C8fk9VYt1R5VMEw6VkqXapUYZiNU28pjKfxhVDj+
 YWkVs0pn6XCQJA7S8/S4+Zf6xrp6uJZq3wx0TNoi9nX0NKrc4tXhbMimqwkHNTVpFOO/m8gA9a0
 q/pWGmN6c0sntAUrVIUDk/UGcBsWHtrSrWcWKdaiM3Ru8r1MtA7XnHMNsOJJoeQKFPjKxnnHfIv
 wFXX1V6tDSK9IEyHlSZ3YqPl6/wcjedNriurpJubk9bBpkDyGOdPZS+zjdRCdRReYmpgSTSCggn
 xWx/Ev16sLH9P1sxolR/vk85P5Fb/j/nFKwkDGkrV6oTcbwNKfWz0PmbCd85mcf5euWoAf+PKXn
 P25Kkl+xbeguJJH5ma0ma2cyW5LzpHe1yLCtO/p3XuKGIkroa09EyMFJLN/kWG6LKi9vC4AaIt8
 WBZbJlmB5JJqyhMlhNQ==
X-Authority-Analysis: v=2.4 cv=IIuXmQvG c=1 sm=1 tr=0 ts=6ac75f1c cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=Z1SsOzVGKYioKmY9djYA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-GUID: 4-JMqZEh9J43sL6bwHM_IdMDor2BYeAH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080036

Describe and enable the PWM block on IPQ5210.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi | 14 ++++++++++++++
 arch/arm64/boot/dts/qcom/ipq5210.dtsi               | 10 ++++++++++
 2 files changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi b/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
index 9f493561037c..eceb6e0ca6fe 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
@@ -89,6 +89,13 @@ &pcie1_port0 {
 	reset-gpios = <&tlmm 29 GPIO_ACTIVE_LOW>;
 };
 
+&pwm {
+	pinctrl-0 = <&pwm_default_state>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
 &qpic_bam {
 	status = "okay";
 };
@@ -158,6 +165,13 @@ pcie0_default_state: pcie0-default-state {
 		bias-pull-down;
 	};
 
+	pwm_default_state: pwm-default-state {
+		pins = "gpio11";
+		function = "pwm0";
+		drive-strength = <6>;
+		bias-pull-down;
+	};
+
 	qpic_snand_default_state: qpic-snand-default-state {
 		data-pins {
 			pins = "gpio0", "gpio1", "gpio2", "gpio3";
diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
index 9b6ebc9f59d3..6440853da8c3 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
@@ -398,6 +398,16 @@ tcsr: syscon@1937000 {
 			reg = <0x0 0x01937000 0x0 0x2b000>;
 		};
 
+		pwm: pwm@1941010 {
+			compatible = "qcom,ipq5210-pwm", "qcom,ipq6018-pwm";
+			reg = <0x0 0x01941010 0x0 0x20>;
+			clocks = <&gcc GCC_ADSS_PWM_CLK>;
+			assigned-clocks = <&gcc GCC_ADSS_PWM_CLK>;
+			assigned-clock-rates = <100000000>;
+			#pwm-cells = <3>;
+			status = "disabled";
+		};
+
 		qupv3: geniqup@1ac0000 {
 			compatible = "qcom,geni-se-qup";
 			reg = <0x0 0x01ac0000 0x0 0x2000>;

-- 
2.34.1

