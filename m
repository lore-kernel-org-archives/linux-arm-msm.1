Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1B834446E8
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 13:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786455429; cv=none; b=Abasm949ubpL32ZbwW09kTIRKalF+VGioRffB7ELW1ynGATUQ600FYB4a/TnzApEA24fBJBnxZtthqr8K0FvXl6vu27lCpGGumK7QR9apRaWfrKI3pRIwKDLogf15RSIBqsclxJVtBL0DVAFTRCjlVfxbjp9aNODRnw9P1w1WMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786455429; c=relaxed/simple;
	bh=OgvA45S7BomJuZ3hzF0inRu2w7pfCRKQK7IzzZZMeCQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=fQ+xgW9YH+UEVIlTmoHOPa5dJoUMSzLcvkEphOTEttUpKrkkHJ83rbg6hpZdw3oVdrNKcFsjcEb3Y813Rv0C4/TYpnuX1m4zna+0MNkmpKlbdE0aPalttNaR5m9E8IBv6mcmwmAaxEjX4L9G13YQswX95QZ8wGr8kx8W+jd7rzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C7mTrf8a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ac3fwg9S; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C7mTrf8a";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ac3fwg9S"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BDWiTp453689
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 13:36:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=3ya0fc/RLUMD9nC+7jravg
	uqz6qEbiCZQ/UGzGzn22A=; b=C7mTrf8awMzzX5QtCkh3NGTihoCL6rdh5CAeLM
	Ry8VG8cdetXIUiOejlc2P3UzcCJ2U+fVRTcNFKNr0bAO81xA/FsVGojim1M5G80e
	a+DTShjajeVCk6kAaggKtl+OBWPw85gdY2bRsps5OFCH0E7NNAqLnMjcH5ORzXtk
	+LObsDcIlvEpcRiEC6CKDEadjTze2bpn5e6xP4FrRfwdnRs0KLpA7PFWXOCyyyI8
	tVALFuZNUdpMBiIBdFQXLhqJu3XoCZ/jTQ9aYf9MCr8ALnglgGPqmeAg/h1WgdO4
	PNgz+oDWFRqfM9/hdWTc0Kpy1hFjWft86hHp/iYWCzu3trIA==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g049kg5cy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 13:36:55 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7e9e54e9cf5so4860739a34.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 06:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786455415; x=1787060215; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3ya0fc/RLUMD9nC+7jravguqz6qEbiCZQ/UGzGzn22A=;
        b=Ac3fwg9S5WaB/8lR5wMjZztoinFXyVihPJfLNT472L9E2IUDd65d6HfxwHabrIQc6O
         ESz4zpcRptYGJvuldNguUxiGdp5iuO2AINy6W/hoyv6xLFOub+n1XD1f/3Yv+2mGwkYy
         zKOS4HWEyzYUMabuCuZtIEQPoE/8YFy2OF2QlpgfzAPKRSOihL3HgL4AivmCAdHO529y
         ozb9opEkGX6k5wL/eaFYch73ubFzgr0E6eo4s3Blmw9u7UMpKfxLY0W17Tls+HHG0cY/
         CrBjP2Nx8R4QfFLAU9lzO+iOEwUV+eHAQ2rNQYoWSgKAHWDz+kWxteo7zqH0g5mnQhnc
         8KOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786455415; x=1787060215;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=3ya0fc/RLUMD9nC+7jravguqz6qEbiCZQ/UGzGzn22A=;
        b=QD0BLSNKqUvozSAPrWeTvHqNcgoXKyOXycFL+a5b4UEGk6BWH3Vj8+mcqgPUH/tn0p
         /NCmcihHV693LvubKMrcQxKmPe5jRerfVkM7hwbnaBLblnJU7jlOuwGXC3XERsXALeEV
         RcplsyeAo+7hrKimWJZjL90zFjo0hXiuGNydg3hNEp44fc9KO3gEhiUyxNyi+v4sBJ72
         S9Qa6+cv9c/Ck8W3FIAgOlhs/xOnsJuF8pmPX4ZIyks8T42E6i545pR50QGhCGfFGBM6
         9naMwx95EsUxj0a2fgamDOnt8H63N7GbeSHILZRqfHvdDbg/+ensH2v1r6DRkOxTTjTt
         OgsQ==
X-Gm-Message-State: AOJu0YwucwFh8D9GBgja29pyyrIgbhE5poVx+9q/FxOj7swuPNhTIN0r
	kfBlzDpZUrRkmbLxcgE7wJ5NPrCi2JIUKCF5Pjna5+lwdPzj2ci7WtPRIP1s14Dl8NKLOR3N7XJ
	2TMJL9GA8jupU7zY11PTQdc7jgXxbFk08dWM3rxBB+McD1CjtQSjax70MmFma1j1N1Xht
X-Gm-Gg: AR+sD11XdekKZ75+2AfolmjRcKKGFVKcra3PpIQb/nsvNDD6xwnO7vFBBfhIh3NhI9e
	tnLGtigDkxSK6bcCcvByKBC3W06drkznwsVxSCHYKKXxDKsTD2ojtcCPLRx7ZrbFg5xVhJ1/VwE
	pF7aQN3OdptRS1gHIgSdVMDN625xrS18u1QPGwHIbGo+XJgsH7Wujk0A1Bhe2SYOwdYoVdsE59A
	9FM5hjQCA67t0mBgLWGQC3+gwJ8DSgaPZ+1T72+upJIgi0incz9xUdvHLqx7w86nkQTMZ6HhLIn
	tk1JTImu16DFGzmj8Dl737EaTjCpTdHpAv+59/SciIUJf8YtvlG8ah+XfQ7I2RxJCXMk15oHyto
	LOG/jG9FKYAVJ96gkkey5iu8TnW688s6wxo/R54FwbBg=
X-Received: by 2002:a4a:ee04:0:b0:6ae:a950:9fb4 with SMTP id 006d021491bc7-6b0a333cbf5mr1975455eaf.33.1786455414998;
        Tue, 11 Aug 2026 06:36:54 -0700 (PDT)
X-Received: by 2002:a4a:ee04:0:b0:6ae:a950:9fb4 with SMTP id 006d021491bc7-6b0a333cbf5mr1975413eaf.33.1786455414558;
        Tue, 11 Aug 2026 06:36:54 -0700 (PDT)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-45e1d99a553sm1187601fac.15.2026.08.11.06.36.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 06:36:54 -0700 (PDT)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Date: Tue, 11 Aug 2026 06:36:52 -0700
Subject: [PATCH] arm64: dts: qcom: ipq5018: Add pinctrl for MDIO bus
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260811-qcom_ipq5018_mdio_pinctrl-v1-1-14ae9dc62a3f@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAHMle2oC/yXMTQ6CMBBA4auQWdukxfBTr2JMI9MBx0hbWjQmh
 LtTYPkt3lsgUWRKcCsWiPTjxN5lqEsB+Hq6gQTbbChlWctWKTGhHw2HqZKqNaNlbwI7nONH9Jp
 qqUk3eLWQ+xCp5//xvj9Op2/3Jpz3IazrBsp8hN99AAAA
X-Change-ID: 20260811-qcom_ipq5018_mdio_pinctrl-f9e609e97c3d
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Luo Jie <jie.luo@oss.qualcomm.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786455413; l=1647;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=OgvA45S7BomJuZ3hzF0inRu2w7pfCRKQK7IzzZZMeCQ=;
 b=M2oEyqofV/Q+2PtVCFNN39XClIR82DB7MDyI5taRsNfJyUv8tpHqviswr484w8OY0cXiu1xHM
 o4k2ZXdFzKlADv+lXScNOPtKPbNSlAgjHlssF+Dri2v+s3S5Zrq1YXM
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Proofpoint-ORIG-GUID: 9DfI5mKoYAKmpcsP0zQjKdsVcCQ7lJiY
X-Authority-Analysis: v=2.4 cv=IO4yzAvG c=1 sm=1 tr=0 ts=6a7b2577 cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=etYmfIWrwypQtZQWCWAA:9 a=QEXdDO2ut3YA:10
 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDExNCBTYWx0ZWRfXyvQAO8QmFLSi
 tY8r5vGYVuFsypccjEczEX58yzxPxmLjtjbeSokuhxhZJUmh+HYwZ8zXng9LQDSy9yJr930Or2N
 LWlGMfbDP8WdfDiNJ0rjIBq0o6+9vrflJi8B8bOeChKsydv2Lre37HLoSJTv9ZIfRkuIRpFl5Ob
 jQtMEdO0LTfaZT8zyp6R8AwvQapmf6QXxQLWFzZpNPm6Y+lrQ39UpG3ifHZiW5Awq6JEkx9fuk+
 57m+D2RXPImxHKU4RMvMUMJ+IxWUdeCX5l7jOFinDCq0AWfzNtK/54W5YwEHmOQ/qIJAx3A3srp
 4Ucj1w8FczkmD4Sk1rjdE+qdOH0ipbarDoXClymSeZpEciBZvKgN4C7h0NW5tYh2EOKXT2kubSA
 9FhSVMqVC0s01Z4i9w5X1LOush8ydwheqTjACAGKRZMHyox+gLNfpvhIVULnUAIzdm3I5PLZumX
 FTZXGksFWs69OBLRmxQ==
X-Proofpoint-GUID: 9DfI5mKoYAKmpcsP0zQjKdsVcCQ7lJiY
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDExNCBTYWx0ZWRfXzD9h1VYWDl8R
 36bprSF0vlJ39vCKpcC0kUfL7OaWpk+78g+t7MQ7or4Go4fC8MeIGihjOmzkSQZbSOAHWCIQoi7
 XTxTy3u1S2FMU5ABdfdygPNqjrib2II=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_03,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110114

The external MDIO bus (mdio1) needs its MDC/MDIO lines configured via
TLMM pinctrl; without this the pins are left in their default state and
the bus does not function on boards that enable it.

Add a mdio_pins pinctrl state for gpio36 (mdc) and gpio37 (mdio) with
8mA drive strength and pull-up, and reference it from the mdio1 node
via pinctrl-0/pinctrl-names.

Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5018.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5018.dtsi b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
index 4fc627b47fe7..a8a89a9c8160 100644
--- a/arch/arm64/boot/dts/qcom/ipq5018.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
@@ -241,6 +241,8 @@ mdio1: mdio@90000 {
 			reg = <0x00090000 0x64>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+			pinctrl-0 = <&mdio_pins>;
+			pinctrl-names = "default";
 
 			clocks = <&gcc GCC_MDIO1_AHB_CLK>;
 			clock-names = "gcc_mdio_ahb_clk";
@@ -427,6 +429,22 @@ uart1_pins: uart1-state {
 				drive-strength = <8>;
 				bias-pull-down;
 			};
+
+			mdio_pins: mdio-state {
+				mdc-pins {
+					pins = "gpio36";
+					function = "mdc";
+					drive-strength = <8>;
+					bias-pull-up;
+				};
+
+				mdio-pins {
+					pins = "gpio37";
+					function = "mdio";
+					drive-strength = <8>;
+					bias-pull-up;
+				};
+			};
 		};
 
 		gcc: clock-controller@1800000 {

---
base-commit: 3d08ff75a47a3e7e2ab45a3bcab6723b4d906422
change-id: 20260811-qcom_ipq5018_mdio_pinctrl-f9e609e97c3d

Best regards,
--  
Luo Jie <jie.luo@oss.qualcomm.com>

