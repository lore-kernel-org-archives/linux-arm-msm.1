Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D46B34FC8D2
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 12:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789648006; cv=none; b=kYF50BM05eQYKndEGfQpd66YwMzjmBxksg5gNHY4xJG0ZeY+9WPS+TiKA7DfaWA4GcqbRz+SnApqVYt8N1E3wk55wCLQILmwx6KkSnj3r+esT7GkJWjLdu56KwCEwxq9c6fU2qWEc+iRBjiHEfIr8punG0XEVVPP2xj3a5T2EG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789648006; c=relaxed/simple;
	bh=s0flBkiVgOHNpTfj2FYo9dSLBFYGhTFMSZ3MyIhPhvw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sAjZb/G8WRtsrE8d4VO4xH1uCI8r7LPMgpFUWOj4rwUpqpXAwlElEIly3ErO5t2W512UIk0L/8B3+mLWyvp9WpCATqOrvP1DcpYt14z1K+5qZG2ZY2Rh9A8N9Vtw134fQStGB+/4+jKgqwbZEd0yudtWwzajECeEwo/vfZek110=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EB8OaabC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VzgosAjv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EB8OaabC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VzgosAjv"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9ZWnY1257756
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 12:26:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GgztVjlEbNTbFa64c/dvYzyTdY90V5eFRhqBFdnL9n8=; b=EB8OaabCZ0I2psom
	XTV9H8U+7cNXO3Pyb7tdXj2CD/yK+oNdSRY9YXPGcIPzjTOHPgmsfIj5i6SNlW5C
	oSPVGxa1cgbD+QDSn/9DvDUFkfJF8sMHq5FraEWfNb1ehN8g7tQRNzcfy6jyWrdp
	gpm2plBC9OzkG/p/wOl2s23Gv8n3CmrbCiiuGf7iBZ3ymO7D3CeAU4xsmJOcAsfS
	xlAJGRQIGMI3QXzJEcf0P5jfcnr3/l1FLSMIyfjJt5k8pSf4LRONDG+JWjukZKr3
	qazZuTbdmBUeld0X62VE+D1GJehPPT5uwwAm8VV3cYt4kS9VbhO40JXE/mug/lZu
	NgDeeQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grdftgqbb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 12:26:16 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39de1f85cb2so1105157a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 05:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789647975; x=1790252775; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GgztVjlEbNTbFa64c/dvYzyTdY90V5eFRhqBFdnL9n8=;
        b=VzgosAjvLfVnMF9Ukcahkunk7THh3LIrVcU6xAtUAGvcD8UTjzczwpLv3NOsLxNEq2
         uBRYiy5trzviEoJZoRiI8veK8Rq/Z3/gCnQ66MAqkCGVhTijAxfy07j4/UhZklRaObbe
         L7dD5rkKvdB75qwmOcYa5vSrIvIDlboCOfFEkVdUTVv8qRtbvKL2t4XC/PDVk/176SJP
         HF28xhLyfmU5+YxdNeHOv8ZJZlmEISqFWiBkabs5coCTe/3C/fYVoRXG3IkdJ/y31ZT0
         C4qq38LGR1mll0hon0Cduwfke/GAs8L8+O2DZ0C9B+v9zcZ4aFUJbNkxRT+ag+nauUfM
         jtag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789647975; x=1790252775;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GgztVjlEbNTbFa64c/dvYzyTdY90V5eFRhqBFdnL9n8=;
        b=VK6KmLKvvZVQyvcRLiglY20DW0jQ65D2mhXAXcpPlExlxafUEGckqlZWhfwKuJArF6
         ny0RC2aB2KthWmm+hYeO2nTH51lG2LjufW2bTHQ+IyaPTbjL3JFcsODIOugugPteEpgN
         b7YQqX7mfF3eBvyCeOwjzhKkfnUi0pnstHfK6IH9q++wHVRad1n11biSZY5/beLGhubS
         WrLnJVoJ5AiOaW4aJaVc3TV12Oxk4C4+fMfFzxYSfPTdesdpbhuOyD5f9xAMTXypFviA
         W4vMWzMuUPGuT1Y54V76TUVz6+gfk4NOolYZxyEwSm5MoQ4hlxKC8/JeqQNgqlYF+tzC
         DpCg==
X-Gm-Message-State: AFuF++k0C4hVxR/Q523uHb5whSjjX2fzer4uKp7kEUsmcmwa4uF1MPWk
	mCNG406jbOlNLn4LDa1GG64wOnCADYZZ8/9GpFhknBhvkd28BaPgPcc/VTbm90EjUWNISzByeuH
	JyZO0ZvYE1ymwOIpuzfBsLQfbkLD8PSlXLhAQCzk08p11bu92uWin/GWz4b4sz7ilvxt2
X-Gm-Gg: AYBFou3woMcu8ZCj4IxfNbNcco4S6wG/pdDgtk0dMk8bgpF7w6XT2B+7mn5olPX62Jg
	KrbV6TOaLdp6abRVPbeTo7EGpWXSNy898d/afZDYb3HPq5M8GH53UV4zEehgKEjPhKOFczScDpt
	sT0Jb5fniPJRHudzrRC213K6MJFmELEHN4ZvEYRJAHBtmnHWHNgGOMKsFYvynCwTcIIJDgurpOQ
	75F5fUE9OPUGpbnWuuA7yoADat7xMZczy55VWYNpSGGKs5A9vH1aaYo8XIkDDJ2iyddQ6abLAD2
	DWiWqciHHTq54Yr5QvR6akmXC+QI2is3niGIHyeqU6kKPkUtEmvDA4BERsgyRl9QK/AkWMkMLJo
	5ax1Gdfryd/I+V2KigAVSDwyuTp2C2SHUCjk=
X-Received: by 2002:a17:902:f690:b0:2d7:2edd:d140 with SMTP id d9443c01a7336-2dd8dc03870mr140392345ad.3.1789647975314;
        Thu, 17 Sep 2026 05:26:15 -0700 (PDT)
X-Received: by 2002:a17:902:f690:b0:2d7:2edd:d140 with SMTP id d9443c01a7336-2dd8dc03870mr140391465ad.3.1789647974417;
        Thu, 17 Sep 2026 05:26:14 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5a6a175sm16380968eec.9.2026.09.17.05.26.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 05:26:14 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 17:55:25 +0530
Subject: [PATCH v2 11/15] arm64: dts: qcom: talos: Move PCIe phy and GPIOs
 to root port node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-root_port_v2-v2-11-6272b7caae9a@oss.qualcomm.com>
References: <20260917-root_port_v2-v2-0-6272b7caae9a@oss.qualcomm.com>
In-Reply-To: <20260917-root_port_v2-v2-0-6272b7caae9a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789647930; l=2872;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=s0flBkiVgOHNpTfj2FYo9dSLBFYGhTFMSZ3MyIhPhvw=;
 b=cF9I/hWsExkAiVbbV7/osNokxs5yvv51z0xwLwPgIRfvgP6gbsnI1/lgRPjLFIJGCus2wlWde
 B51WrGA7n/HC2rQuBVRdkGrHlsrvylK2617RcpGptw+etC+rmEFLDGZ
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE3NCBTYWx0ZWRfXyARRePidzTu6
 ALxXOqvaQKqbc/bwSti0r/emU3rsreuYZ3re629Phpn1/U+Csep2lhZNiWnyfUQJZmFUXVG/ryp
 SJryCOgEzl9Bpfa5z90riot8puJkdEdYFJLv9iiM3h4cyID4AQtthaYqRXFO6H8gPl9xGBKctAq
 tmdf+1hSMfYokN2DYbJZDasTpmQ6N2KTLcHntAkK29tYLjPA67ucLf+wR2UJVGtA1bTwhHmipKb
 yVJnsNSkMJPcMYU0YFfblDv/X2JWW6uFFuWAOJSRIwyHbK0D9TgwD1axtAU/DxVX4a/g+M2x9ib
 /kRomjqY3sA7afi8gO7Pe2k4oaSmAG1IBX4ocm/L0SaJtAiYp32dmVrDI6Z/iiCdDAGBLx10LSv
 bzhfMhWlnwpxmwP8Y4SfNpjPFmpckJCp/pBf6z9fQo65y7GZwyaCXSn1LIeYmsWAWoyQr2EDbMM
 o4TiBdqMpnriftvDo6Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE3NCBTYWx0ZWRfX3I8PJ8pn0VJG
 2RhkVKROkxTPTFG5hsIlmUvfx+HMST8UpJPRDxGvpVsa3OsJByTQ0rXeRNOK/Gzj7BQYaJOf0DD
 si2Yzw5KmawB/VlASKbGhDNXRaByngs=
X-Proofpoint-GUID: g7c5xNnlz0qVJyHcUs7dxoJhpBjnEhTm
X-Proofpoint-ORIG-GUID: g7c5xNnlz0qVJyHcUs7dxoJhpBjnEhTm
X-Authority-Analysis: v=2.4 cv=K+W3jCWI c=1 sm=1 tr=0 ts=6aabdc68 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=bvY3E1ByFFb03tV5gjAA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 malwarescore=0 priorityscore=1501 suspectscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170174

The PCIe phy reference and the perst/wake GPIO properties are
per root port and belong in the root port node (pcie@0), not in the
RC controller node. Move phys from the controller to pcie_port0, and
move perst-gpios/wake-gpios from the &pcie controller overrides to the
&pcie_port0 node in the board files, renaming perst-gpios to reset-gpios
to match the binding used in the root port context.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs615-ride.dts    | 5 ++---
 arch/arm64/boot/dts/qcom/talos-evk-som.dtsi | 5 ++---
 arch/arm64/boot/dts/qcom/talos.dtsi         | 8 ++++----
 3 files changed, 8 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
index 43f110ba3a7c..142dafb04324 100644
--- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
@@ -444,9 +444,6 @@ &mdss_dsi0_phy {
 };
 
 &pcie {
-	perst-gpios = <&tlmm 101 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 100 GPIO_ACTIVE_LOW>;
-
 	pinctrl-0 = <&pcie_default_state>;
 	pinctrl-names = "default";
 
@@ -461,6 +458,8 @@ &pcie_phy {
 };
 
 &pcie_port0 {
+	reset-gpios = <&tlmm 101 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 100 GPIO_ACTIVE_LOW>;
 	wifi@0 {
 		compatible = "pci17cb,1103";
 		reg = <0x10000 0x0 0x0 0x0 0x0>;
diff --git a/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi b/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
index 198f656bddf1..aa2d9532d37f 100644
--- a/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
@@ -366,9 +366,6 @@ &mdss_dsi0_phy {
 };
 
 &pcie {
-	perst-gpios = <&tlmm 89 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 100 GPIO_ACTIVE_LOW>;
-
 	pinctrl-0 = <&pcie_default_state>;
 	pinctrl-names = "default";
 
@@ -383,6 +380,8 @@ &pcie_phy {
 };
 
 &pcie_port0 {
+	reset-gpios = <&tlmm 89 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 100 GPIO_ACTIVE_LOW>;
 	wifi@0 {
 		compatible = "pci17cb,1103";
 		reg = <0x10000 0x0 0x0 0x0 0x0>;
diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index eedfdce3c479..a22f78f5a5de 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -1367,9 +1367,6 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 
 			power-domains = <&gcc PCIE_0_GDSC>;
 
-			phys = <&pcie_phy>;
-			phy-names = "pciephy";
-
 			max-link-speed = <2>;
 
 			operating-points-v2 = <&pcie_opp_table>;
@@ -1397,10 +1394,13 @@ opp-5000000 {
 			pcie_port0: pcie@0 {
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
+				bus-range = <0x01 0xff>;
+
+				phys = <&pcie_phy>;
+
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
-				bus-range = <0x01 0xff>;
 			};
 		};
 

-- 
2.34.1

