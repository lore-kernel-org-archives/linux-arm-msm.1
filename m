Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCDC34E06CD
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 12:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789647954; cv=none; b=eXOpMPD4HURQnVCrFzlo9fW5SQCMcPVqmTP/BhLEJMOgixakMuv3hY4VPkplyt+HrCi/7Qw+RT0Lsd6hMXZn52mL5fNTUholR0qlpN1kxeBh8RwPXN5Dn9gRPLu/jICXLcz1GbE1kzCW7ovG+sh37bA/nVSnopT1zsl8ACOkLjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789647954; c=relaxed/simple;
	bh=1JSqxF+AmXWQj5K/f8A9Up5MHdnKGjesk6meCnOwOvQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=db2UL4WQ35KQGm1tYW2367aUkagl5k1WEdZnFQYSb5yvkpLMNlSx4RDB5WdJ0HA7VnRMlNWP4GWaz6u7h0Mto/rC2CG+CUiMJuRMs9Oin2zI0GlsLdZt0kCDUiUyXwcojdxIvHupyF3r54k+xVNvUYAcslwGeWrd2gnNNUH8C0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KAciQeVu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RWiUxRhR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KAciQeVu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RWiUxRhR"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9Zs1R4186752
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 12:25:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Rq6ylCfjSDcy9+JaaSrgoK/MUYuEh2flsK8K8oiubNw=; b=KAciQeVu8j41vZIw
	QPVl+TNdgDPNJAH/v0hegAHZq+ntI1xhfqrQc72HCAoVDNWS6XRnuhQXyw2ia3Mj
	IF9SsJTbFk1tCeh4zHqoacyEwVJLyrra86Utz1O5wQT+yq8XkMq31PUq1sG1Bc/r
	v+nrb3U7h4mpZ5RS2idLjxEoGLgYx9/hqSlms925XLESi2qDxu0vQUUahRSNudDE
	hSuiU3/2ipdl948aZfwDRG7Ha+ScGYgR8zf2sgQ4dfKSxx3D0/dpmSZYGWhq1Bt9
	eNVt8cqZRAlAb2dwKDSTBILcbPbV/iTHoD6Ftc6hiE8ANcWnF/YXyAyeyg7U1Rgo
	A1rjMw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gr7uca59m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 12:25:39 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc18ced1a5aso1354746a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 05:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789647938; x=1790252738; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rq6ylCfjSDcy9+JaaSrgoK/MUYuEh2flsK8K8oiubNw=;
        b=RWiUxRhRe6maoO/jUJ+yA64QHeSkq+S8+JueaRQmf+pzHm4PX3oPoifnbphRiy8AxR
         Z9RTMv67o/oRyGNQRZ02gPeL0RZgAzR2f/dXEgJl6MpJzejpsxpnndenoTDuO2PZABAx
         Ehh64cHqUCaEBtjVWUcKUPipYuWA1/2IH17hIH/RGcq5MkY1wY7jNzPeSISeUsa7KqyK
         UkLGwfhGAQ2yIjspy1IJmOqZxTtmwbvruomlAWf0HqU0RbpEPHrKqj81r3Ir9vs0RsTv
         dXMxYHm71OMoJQIaecxgqa3U0pUQthHVh3UX92jXDmFOW3NCepx7m1+89l63wlq/zMQR
         wMpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789647938; x=1790252738;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rq6ylCfjSDcy9+JaaSrgoK/MUYuEh2flsK8K8oiubNw=;
        b=20JLyotGShLl0f4kZkUidJRRF9EIyrTFo9lNJyeU56/USzmxHCRnqttjMhyJdRnA7r
         N6unq36SIbazaKu0U8Tk0xbQbmA3NwXiIcsEpQD+dpLwU5+7qFEI9UxIhK/Ybkk/fvY9
         NW56stVnIAZ6dXG7rFwFX0ytW4s68E1r06MvgTSQQC58MW5aeIKbybL31Z8mYLcGIIDJ
         QJDTgwZxTFmjSq4YQOlyuPu/lpvnKSgFY6bwUkuDnAM1T/mlPbov68vPIm/f0tZZywZc
         t97lU5WH8ZFaApZU9PmC9iku77a+qPsNr4CsI3En2S7u1apYdAEZdaASwl82nNbBPLMA
         TS9A==
X-Gm-Message-State: AFuF++ncBnIO6+USZnbD1/aNnWELpwsrbbpLNzj+FCaAgGDniJg78sLh
	euQqZCNGKM+WqYnz0Gt0YznNx/KaraBQFWKlttPxdiHAw7LHAAWbqOiNyP4YQJgTpC8QqiScyFR
	vtoxZvSA82iq/Yi4Bk4uUeWcpgMSwkt2rZg1fap58eITw1bu8GOyWwJ72HO45ByLI5AG9
X-Gm-Gg: AYBFou1H9swr58GELusgFsPJFg7oISFe4r5E5cCSzMxFEPunuy0g7/xEWAAgDOrOIqu
	P8HxhjIhwz32uzwC1OWwNJIPxIy0i3YJocRzTEfJLBXFYI5LbCuny4+hytAfwG4U4Kpz45wvwgg
	r8rlochYfIsiMAX9byb0+pxzF2s4AGJz04hLRRgg0v4xkwX9d4oVnBDG7fjjgX5p2crWfhBs+jv
	keZzPOYHwqdKOk/+rcA6768tnL5icSfp5dvbCHWkAd1Biq67/poH0CxSqHarmvrqxd3riLvNZac
	JWzHBF5ayPR1t/WkdpR5LIMrwq4VaCy2H58nimJUCRBATm9iRq+Q2z5ttAANEKpxv7UYVRXHj5e
	6b+icvlAJo+XVM8pD6PASQvt9DCc5HKJ+1BE=
X-Received: by 2002:a05:6a21:6803:b0:3da:e1b5:2baa with SMTP id adf61e73a8af0-3dd5f4041a7mr16925789637.2.1789647938391;
        Thu, 17 Sep 2026 05:25:38 -0700 (PDT)
X-Received: by 2002:a05:6a21:6803:b0:3da:e1b5:2baa with SMTP id adf61e73a8af0-3dd5f4041a7mr16925725637.2.1789647937838;
        Thu, 17 Sep 2026 05:25:37 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5a6a175sm16380968eec.9.2026.09.17.05.25.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 05:25:37 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 17:55:15 +0530
Subject: [PATCH v2 01/15] arm64: dts: qcom: qcs6490-vicharak-axon-mini:
 Move PCIe phy and GPIOs to root port node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-root_port_v2-v2-1-6272b7caae9a@oss.qualcomm.com>
References: <20260917-root_port_v2-v2-0-6272b7caae9a@oss.qualcomm.com>
In-Reply-To: <20260917-root_port_v2-v2-0-6272b7caae9a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789647930; l=1791;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=1JSqxF+AmXWQj5K/f8A9Up5MHdnKGjesk6meCnOwOvQ=;
 b=mWl0rflsNEp/u6JHJhQ0ExsUp87moBhvCU0vcey5i/b6cCsBtOYoRbgy+aBX9WlnpTXkSmUm5
 bZn6ALSCuzoDPI+pNhv6VdKf7cGUF47y9V8klZITJRI3dwqRWSivCHK
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE3NCBTYWx0ZWRfX917sk6p0PN+t
 FdoPgWoqZYK+zcrERV6dzl1QK1qyfudFGuLFKKxE/t6f1CIaq8KnUqTdYn0IUb1XYjG/6b8v9jE
 f+VZt37zgOvozOScoXh8RvqrFl1JUbd7qCu0W5i/Iqvcpa7a5SYNomePkaEvZ8Jw8ginab9ga0i
 Ronnouc+NJcnkvAbeTTWAdt1JtidGccmxWVeSSppWPEkCb0kE4RNwjWJdpYSRDY3hyFliA4bMww
 pjyiBLfaM8GBqvpEdGXOMSw3Frok/HGg6hNTjHDQNw9Lzr/yfDUpuqq8gTmrvIiCaHvfk1HGrBP
 MOx2vlISd0BDCghct9VeQXNOIow7BIxnBMyYKsoGUCN7U0Rbpr9fMvcQz6LfSSfHDn/tHhpc9j5
 jT/IHLfrFFBSI9vsci3OBoP9kabLXSqckZkrd5+RZvFJ2gR1q6FE7D+pp97PhuU9MBWZiaVrs+a
 q62MEUX1D/wAoiznBtA==
X-Proofpoint-GUID: TL9dsu8e5R4KVk2uGwwF7JKMPhRq4wJu
X-Proofpoint-ORIG-GUID: TL9dsu8e5R4KVk2uGwwF7JKMPhRq4wJu
X-Authority-Analysis: v=2.4 cv=F9zC5ahN c=1 sm=1 tr=0 ts=6aabdc43 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=_k9ig2nQFDp-gxZIyLcA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE3NCBTYWx0ZWRfX69Fo78H/9S2k
 a6H5iUIiWsqbXYq1k2mlrF08ASSk06+1lGDUURFIDiNyd7B5LvazH5fCcyRl3DsBKQxkhUZTfnv
 JlgAOSqAaqQvmBx0voJULcWLXuT5Ti0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170174

The perst/wake GPIO properties are per root port and belong in the
root port node, not in the RC controller node. Move perst-gpios/
wake-gpios from the &pcie0/&pcie1 controller overrides to the
respective &pcie0_port/&pcie1_port0 nodes, renaming perst-gpios to
reset-gpios to match the binding used in the root port context.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs6490-vicharak-axon-mini.dts | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-vicharak-axon-mini.dts b/arch/arm64/boot/dts/qcom/qcs6490-vicharak-axon-mini.dts
index 141d263e6566..496b7583e4a2 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-vicharak-axon-mini.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-vicharak-axon-mini.dts
@@ -652,9 +652,6 @@ &ice {
 };
 
 &pcie0 {
-	perst-gpios = <&tlmm 87 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 89 GPIO_ACTIVE_LOW>;
-
 	pinctrl-0 = <&pcie0_clkreq_n>, <&pcie0_reset_n>, <&pcie0_wake_n>;
 	pinctrl-names = "default";
 
@@ -668,10 +665,12 @@ &pcie0_phy {
 	status = "okay";
 };
 
-&pcie1 {
-	perst-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 3 GPIO_ACTIVE_LOW>;
+&pcie0_port {
+	reset-gpios = <&tlmm 87 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 89 GPIO_ACTIVE_LOW>;
+};
 
+&pcie1 {
 	pinctrl-0 = <&pcie1_reset_n>, <&pcie1_wake_n>, <&pcie1_clkreq_n>;
 	pinctrl-names = "default";
 
@@ -685,6 +684,11 @@ &pcie1_phy {
 	status = "okay";
 };
 
+&pcie1_port0 {
+	reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 3 GPIO_ACTIVE_LOW>;
+};
+
 &pm7250b_adc {
 	channel@4d {
 		reg = <ADC5_AMUX_THM1_100K_PU>;

-- 
2.34.1

