Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795678713;
	b=2H+XI9UkAritnu6mTBxJPuaExvyASAV6/6rtFdPDMZdWMU0xtowMwGjhItUQAGdw5bHP
	 2L9xnVnx7+ME1e8yoowk3DS7tMC68oA9WKCjMYANuatqicLFH9sHgRkZjSsiH/iqh9/WN
	 U/6PxKLX3TzVTGPN7GZTH+r/CKftZTLlg+OfEJCvKFPz/wknhi+HLx3pHWdo19gs3Bw3P
	 qP9l29bAYWYQHRLEA4fkxCz7AZVRzyMIFJ58m5DPRDH0XYsKdWTv5zDzl9QJzksXAoqY0
	 rlxB5ruYxaG50nKQxu/EUmTeerahCs/v+COzMYE/SmpIi0dWu/hFomN3OuKJqpHbxyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795678713;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=mVqQxQXEXomZHCo7mm5e2Ybezj1JFqDpCQoDTyjnpIo=;
	b=OzpA+tfL543VE6EYDsNo0cWDE1bY+LuaI32Yunkb+f0BvaOpkQ8QTtS9qmBtqA3vixt0
	 eKR7TI5BfkUORgnR3SlWxwX/hg0P/7otQ8IC+Q9v4Et8NlTeIxHhhr1kblVYgVAm8gSrg
	 3XeVYPkwjYQ2ArIik6eWKEbTbpDqndlkYUiTobzu9rLGRhlI0uxkSrvG/bzgffc7bNIul
	 JYkNKLDMUQ6WfVgcwR+eGo7HSbbGqXT4WUxGUVpfZOqQGujkUhyjlwdPvJDAO1MjdxKK5
	 8DK1wBD57mgAHDAZ9/WoKd05cnrcUCNEyt5jFEmump8g2cJNUk94IPqOB7appldXbYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LjHQkcEG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A2sjQcIW;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E29E0606A331
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 07:38:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E29E0606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LjHQkcEG;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A2sjQcIW
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7B24W2175756
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 07:38:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mVqQxQXEXomZHCo7mm5e2Ybezj1JFqDpCQoDTyjnpIo=; b=LjHQkcEG01IcPZ3C
	UUJKtR3+stuZtRSrMvw8Kuo09aZtwZVsKW9Zwg3oVvcPy7OeJsTt1RBOZRb8Zuf0
	vJ2m+KVf3C9cajM5ESbCMhU1T2vcQGcpA0MH1dhb92GJLkOlEAKCyGEKo6v9/Mkt
	9CPPQZ3dOEmR9tNJyzO6FO3m+7AYDssLe4G/IKkE2IVbrKO7sE2cRiaNmLI11jRA
	Oyy1IlvaibjQWiPihmnGTWxopmpF1NhXzY6MSawVzL/vYfEvSAaI4BDrUBLybiYz
	pE1QZIPnc3K8yHhEGVsMQfu8u/+bDOv7J1t5AOfbk/4CWk0BgknjKQAFtpQB/vGD
	h544qQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j61ahuaby-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 07:38:32 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cd66551e02cso6128270a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 23:38:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795678712; x=1796283512; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mVqQxQXEXomZHCo7mm5e2Ybezj1JFqDpCQoDTyjnpIo=;
        b=A2sjQcIW6ifcSbYuG+NjW7ciWP2/x7Y7QLUJNKhYUA6KHyAWJTqJelRarMk68uPrrK
         LQB61i5d8QGCZ/AjaGcJO0uNDr7DpPEykdUIaApaE12y2AYU98r2ONC/0jBDWb9Bwv97
         849pUUp8hnxerxsITX0Gb+LrK8dVdz69jutCxTlowO+ZkaQBR1MRpPQvNuyqzJo8l7RB
         Zgd1Inmxfj05rNMLKsOdmZ5Wx1g1iVULuGoU4HUaRUN3ZiwaBfmtUChdB/QbwPYO4HDC
         LOqp8OyUz7bbtSvF2OchecyxGERsDJu/7+6zNlK29p95gptlRzpu/PsN107fOYzHfsVa
         k0ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795678712; x=1796283512;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mVqQxQXEXomZHCo7mm5e2Ybezj1JFqDpCQoDTyjnpIo=;
        b=mXoR1k/LMVDRPDF9wfhkdnaNxBm8UpGjHM5nsuKB2Fj7gE8LtMpPXT8th+r/obMvJJ
         pMfl6AHEgZF8f7CdC8LGbG0yMegbqT9erXDd8RYzNP2PXa2xOIjHCApJIxNCAnns3dc1
         jMiz672GI3koJsdw8Kx5CPjCwHvVjxwg3tvKUYCsaJrPbZtIbW0Xf2YSM2RbVxCPyhJK
         gFpmSjuVIVA4KrgcRvlnS8PUkSpOeGDoy/R1u7+xL4YmOPaJ7jjgqQbc958Ky6cq3EKS
         CjbxqG4jw4tOgU/hr8y/jhx3ihapDVOG6YkGTJJiCO3Y6+XgtihTTLVi0+D/MlAz6rk1
         uueg==
X-Forwarded-Encrypted: i=1; AL+hErGfv+AStolRIKhEYq4XdUmEf0dNoqjHvvD5EyiVtcRJzEql48vW6xr3TPsdSljPK23cm2xymoPKunE9HRzx@vger.kernel.org
X-Gm-Message-State: APuU4Z8Z3m9my5UZS4+DCFoLMDW6zaks/GzO5EYLGEb285QpHQWlcEh2
	V43o9z/gML9YtailYzKxGU5qEvEz3XBkomAZYRml2yEYIGEzmQ5FRYDFxMbY+GZzkzW9wLXXtaC
	KMKSKGwPyCfgB5hu0aOLnbwIkBgMkML3k/7k00A9HIm8FOqoRU8XL+Xn8U2OFaGncresB
X-Gm-Gg: AZFdTZcg8tRMEEntfZQjOGYEWjmnin0mcz3unu5Gzo9SEnpnHmmwt7PcAR+tTfmwki4
	lPfXMx0sJndGEveubwVXaqA8KeWRLmRBBEQ8oC7vkXRvs4QbotMS9dA+uFn4APZmWvOx/BxrLL3
	aLSkCst2foQD9DI68Aqkr5k+O7CSir5hITMo2LTf1jik5cYM6Sa/9FkNjI39Z3BftSHhdNPPJDw
	ecff+g39Ta835GD3GuEzB9vbw0DQHJV1v9cbAe24tsjkB6vAdvaF+KcixTGlQt7cK+CmsSdL2gK
	42xloHCva6SDB9DxX/wMBBMeEpm2YY42hHPNKa62SOJfy6pTobVmlt1IKKl8rcYD3a3Z6pE4sjb
	Wc0F8o7ln9eUVW/PEaWUstyzCUuMFjj+BzJmpRZPMdnP66rd85eu7TMKxbWdnke6j9DC9V2nKeI
	Ug2VLB87du
X-Received: by 2002:a05:6300:218b:b0:3fb:2d3e:e60c with SMTP id adf61e73a8af0-4014cc4808cmr22074397637.58.1795678711282;
        Wed, 25 Nov 2026 23:38:31 -0800 (PST)
X-Received: by 2002:a05:6300:218b:b0:3fb:2d3e:e60c with SMTP id adf61e73a8af0-4014cc4808cmr22074368637.58.1795678710800;
        Wed, 25 Nov 2026 23:38:30 -0800 (PST)
Received: from hu-jshekhar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde9bb05981sm5042987a12.26.2026.11.25.23.38.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 23:38:30 -0800 (PST)
From: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 13:08:18 +0530
Subject: [PATCH RESEND 2/2] arm64: dts: qcom: maili: Add DCP support
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261126-b4-jshekhar-maili-dcp-enable-v1-2-3d65c89bfe7c@oss.qualcomm.com>
References: <20261126-b4-jshekhar-maili-dcp-enable-v1-0-3d65c89bfe7c@oss.qualcomm.com>
In-Reply-To: <20261126-b4-jshekhar-maili-dcp-enable-v1-0-3d65c89bfe7c@oss.qualcomm.com>
To: conor+dt@kernel.org, robh@kernel.org, andersson@kernel.org,
        krzk+dt@kernel.org, konradybcio@kernel.org, abelvesa@kernel.org
Cc: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795678699; l=5732;
 i=jayant.shekhar@oss.qualcomm.com; s=20260925; h=from:subject:message-id;
 bh=EZNCWd+IPa2VewynBqtiq9wefiypaznTLL75zOozo+w=;
 b=BtepCKZQ/JqcxkhGlWTjUVV34M59ZI5B654vhYz7p55hChK2OzY8q9gZvMYAsiLXhf62mw0Sf
 rg66Amii9c9D/DBYsGayUvouoJOotVl+1lXuu5cEEePHsbREV+6fyMs
X-Developer-Key: i=jayant.shekhar@oss.qualcomm.com; a=ed25519;
 pk=saYTwtCCpug4b0Hz0jHFoATgDtdhFVicwMzDJo2z5ZE=
X-Proofpoint-GUID: hx4FThCWleAYDU3qLXrfSdlvrAJBEB8P
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAyOSBTYWx0ZWRfX1HH0ZQbqh9Bg
 F0ZquBgbyN6fLd5gL3YyMhoMJQZ1fAPZqaXOxkqP0Vwz2xBgGh/nG4o9gl5pn93ztOLyohrttfz
 cKcQDoFJkKYw4GHUUzT1lq6lPbZWdAE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAyOSBTYWx0ZWRfXxZ/xHP1dihXg
 W002dUyLvwCPjYvdINO39dVbhPom8J+pQBzpOAu52+8Vu02y/FMQxQqbzK9QOUjA+W39NSSonmN
 fnF0ze7L+2ATcSiuDmcafuJh7WH5O86aJ+fHtMfDeHYupBsMBLO/vn7f2rp99rNc44KaI+I9+Gj
 A1eUvwfmjSuHVERNAHCNfoHIaPW8qIlcELbpYGdCoVPvxfZ/utHfJ+6+Eui+fOCTFIxxLaiPz2U
 gGEC+227Xmz4ttLg14WF3lOF1x3P6bd9/cBd3eGv6hXz+4X8GeRR6VpClfi+FJd+2ynuiqWKIu6
 GWFjJ9yQQw4K3cHhbQwoElSr+4L/YyxtaDsaBmH60qmda6H23NmNipFXITnbc5dX5nPOFONpEp3
 h2oTO2ForR/AF+DyTlgbwhbB54ihmbF7KGF83dNjRmk3w00OjyPnFdYc7YerCaZL6TIGXuIN5AJ
 ASj1/CEH9gYd538Kakw==
X-Proofpoint-ORIG-GUID: hx4FThCWleAYDU3qLXrfSdlvrAJBEB8P
X-Authority-Analysis: v=2.4 cv=BbxNQbt2 c=1 sm=1 tr=0 ts=6b07e1f8 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=cp69EZODLtjo7xmYzNYA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260029

Maili display hardware is owned by DCP firmware, so the platform device
tree must describe the Qualcomm transport wrapper, firmware display
subsystem, power-notify channel, IOMMU contexts, and display graph used by
the MSM DRM driver.

Describe the Qualcomm DCP transport and its VirtIO-MMIO child, the IPCC
power-notify channel, IOMMU assignments, firmware-visible IOVA range, and
DSI display endpoints on Maili. Add the Novatek NT37802 panel, panel
regulator, and display pinctrl states on the Maili MTP platform.

Assisted-by: LLM
Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/maili-mtp.dts | 130 +++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/maili.dtsi    |  45 ++++++++++++
 2 files changed, 175 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/maili-mtp.dts b/arch/arm64/boot/dts/qcom/maili-mtp.dts
index 5409d0a7ec2e..3bae0a124514 100644
--- a/arch/arm64/boot/dts/qcom/maili-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/maili-mtp.dts
@@ -34,6 +34,19 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	display_panel_vdd: regulator-display-panel-vdd {
+		compatible = "regulator-fixed";
+		regulator-name = "display-panel-vdd";
+		regulator-min-microvolt = <1100000>;
+		regulator-max-microvolt = <1100000>;
+		startup-delay-us = <233>;
+		gpio = <&pmd8028_e1_gpios 2 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-boot-on;
+		pinctrl-0 = <&sde_disp0_vdd_active>;
+		pinctrl-names = "default";
+	};
+
 	clocks {
 		bi_tcxo_ao_div2: bi-tcxo-ao-div2-clk {
 			compatible = "fixed-factor-clock";
@@ -958,3 +971,120 @@ &usb_hsphy {
 
 	status = "okay";
 };
+
+&dcp_dsi0 {
+	panel@0 {
+		compatible = "novatek,nt37802";
+		reg = <0>;
+
+		pinctrl-0 = <&sde_dsi_active &sde_te_active &sde_esync0_suspend
+			     &sde_mdp_vsync_p_1p2_active &sde_mdp_vsync_p_1p8_active
+			     &sde_disp0_rst_1p2_active &sde_disp0_rst_1p8_active>;
+		pinctrl-1 = <&sde_dsi_suspend &sde_te_suspend &sde_esync0_suspend
+			     &sde_mdp_vsync_p_1p2_active &sde_mdp_vsync_p_1p8_active
+			     &sde_disp0_rst_1p2_active &sde_disp0_rst_1p8_active>;
+		pinctrl-names = "default", "sleep";
+
+		vddio-supply = <&vreg_l12b_1p8>;
+		vdd-supply = <&vreg_l11b_1p2>;
+		vci-supply = <&vreg_l13b_3p0>;
+		exvdd-supply = <&display_panel_vdd>;
+
+		reset-gpios = <&tlmm 210 GPIO_ACTIVE_LOW>;
+
+		port {
+			panel_dcp_in: endpoint {
+				remote-endpoint = <&dcp_intf1_out>;
+			};
+		};
+	};
+};
+
+&dcp_intf1_out {
+	remote-endpoint = <&panel_dcp_in>;
+};
+
+&pmd8028_e1_gpios {
+	sde_disp0_vdd_active: sde-disp0-vdd-active-state {
+		pins = "gpio2";
+		function = "normal";
+		input-disable;
+		output-enable;
+		bias-disable;
+		power-source = <2>;
+		qcom,drive-strength = <2>;
+	};
+};
+
+&pmh0110_d_e0_gpios {
+	sde_mdp_vsync_p_1p2_active: sde-mdp-vsync-p-1p2-active-state {
+		pins = "gpio9";
+		function = "paired";
+		input-disable;
+		output-enable;
+		power-source = <2>; /* 1.2v */
+	};
+
+	sde_mdp_vsync_p_1p8_active: sde-mdp-vsync-p-1p8-active-state {
+		pins = "gpio10";
+		function = "paired";
+		input-enable;
+		output-disable;
+		power-source = <1>; /* 1.8v */
+	};
+};
+
+&pmh0110_f_e0_gpios {
+	sde_disp0_rst_1p2_active: sde-disp0-rst-1p2-active-state {
+		pins = "gpio9";
+		function = "paired";
+		input-enable;
+		output-disable;
+		power-source = <2>; /* 1.2v */
+	};
+
+	sde_disp0_rst_1p8_active: sde-disp0-rst-1p8-active-state {
+		pins = "gpio10";
+		function = "paired";
+		input-disable;
+		output-enable;
+		power-source = <1>; /* 1.8v */
+	};
+};
+
+&tlmm {
+	sde_te_active: sde-te-active-state {
+		pins = "gpio86";
+		function = "mdp_vsync";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	sde_te_suspend: sde-te-suspend-state {
+		pins = "gpio86";
+		function = "mdp_vsync";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	sde_esync0_suspend: sde-esync0-suspend-state {
+		pins = "gpio88";
+		function = "mdp_esync0";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	sde_dsi_active: sde-dsi-active-state {
+		pins = "gpio210", "gpio209";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	sde_dsi_suspend: sde-dsi-suspend-state {
+		pins = "gpio210", "gpio209";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/maili.dtsi b/arch/arm64/boot/dts/qcom/maili.dtsi
index 0aa5bd4ea21c..16bc0ba2e13c 100644
--- a/arch/arm64/boot/dts/qcom/maili.dtsi
+++ b/arch/arm64/boot/dts/qcom/maili.dtsi
@@ -6927,4 +6927,49 @@ timer {
 			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
 			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
 	};
+
+	dcp: virtio@9be8000 {
+		compatible = "qcom,dcp-virtio";
+		reg = <0x0 0x09be8000 0x0 0x1000>;
+		interrupts-extended = <&intc GIC_ESPI 956 IRQ_TYPE_LEVEL_HIGH>,
+				      <&ipcc IPCC_MPROC_DCP 5 IRQ_TYPE_EDGE_RISING>;
+		iommus = <&apps_smmu 0x15a3 0x0>;
+		iommu-ranges = <0x0 0x84000000 0x0 0x04000000>;
+		dma-coherent;
+		mboxes = <&ipcc IPCC_MPROC_DCP 5>;
+		mbox-names = "dcp-power-tx";
+
+		display-subsystem {
+			compatible = "virtio,device34";
+
+			iommus = <&apps_smmu 0x400 0x2>;
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@1 {
+					reg = <1>;
+
+					dcp_intf1_out: endpoint {
+					};
+				};
+			};
+
+			interface@1 {
+				reg = <1>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				dcp_dsi0: dsi@0 {
+					reg = <0>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+				};
+			};
+		};
+	};
 };

-- 
2.43.0

