Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 976FC3C278A
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 11:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786362176; cv=none; b=WUb+1SP/40hl/hnhoixu8VPKwrghVc2fr5XgyssZImentMjdDJ+a6vKX7eo1K6TFDaaZGxnyNV72BjdhKO/VXCT9xeeaHUedohmtQ5r/3lxc5NQDDLwMFG+y3c59ZvT3rXJQ+DcLZtNZj94I8c7yJcEe14LubGSmw2Ly5PgkCLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786362176; c=relaxed/simple;
	bh=4WgJSJySPv8ASAImfHhYPQplaHVZ3iENoiXcumJXZOE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ndFuJPi59Pd7p9aw00UuLF6Uzk4jxnMFkUhJRK3ioawCMjpU6yclxVbcuQ4cT4gMLHhdjIY8g3h7R/GoHjJUcFPjPK0NZ4KfG6eM4OO1QA4mF+Jw2KpGVVzAU+ol7cu7ieXEbd8wyYw9zSdS5v35M2AyMo6SAIc8G4LqxE6oEOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ApFrBIWv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i7+rbWB4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ApFrBIWv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i7+rbWB4"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67AA072u009830
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 11:42:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B1oqggu/tA/Od1b6ZAvOHjPKN93CH5F4d2o/jwM7LGE=; b=ApFrBIWvpx7x2c+y
	rgTMvHOmQHcLDQLJ/3RqrFEiYFhvDXq8gRzj5sK91G/LjVj+HdRZEQFPb9Cs4JG0
	1HelIm4KHwe7QfsvaTCGgjciWaZf545OpwjNMUmGzGPaM75RHQS/B5qn+A6PipzI
	UZvgApbtwLQ+jSGHMH93kcDNfnqSnMk+JeYQQv5BhGjnUPdWf0JU0140uUarSGYb
	SX4u6AWBC+HksQcwWusSFTad0Q1ckQOzWcukITb8imV3B6Ild579jwiZeoMH+GhS
	VW8RLiNrnXlahszEU7H1saXTC1bf8v4DDlvisecnaCJr2O2N5RUMbPre2uRuQwir
	yjuOPw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fycgerd3a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 11:42:53 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c20762d21so23681381cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 04:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786362172; x=1786966972; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B1oqggu/tA/Od1b6ZAvOHjPKN93CH5F4d2o/jwM7LGE=;
        b=i7+rbWB4oMz99mcL96Qe3Fpr7Wr9wCnCL3Jf5ToPTX9wmAqBm5fFrlUzgoWHLH1MHB
         DMkNAM7jlxm9p/6IbRAy/4eU9y5Vy54Ttn6rVf4QH0fuDNs5pchQEzKVTQmjXplECMBo
         2MplocjlSvQrRWA6iF/E1xu37aCBdRWH9/AAqQscb1JPR3rpe0MUYSvWWzGaVA+RbFAS
         csw9igz50Tdxsf3yVIcVipoYN2DiBT4LZ2JyagwA7JkwJ6CiUPppDfs2wbgcqo06D1nM
         tjyoVukOjT8xXMAqqYeAIUZDKHHfbwRuCxj+T+YMPRxjZ2WQtzxIkeE2IJMCDN1uo00G
         c/Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786362172; x=1786966972;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B1oqggu/tA/Od1b6ZAvOHjPKN93CH5F4d2o/jwM7LGE=;
        b=Va4CSrDmB34SRt6jwo2jTMSg9W2S/FLjdafxb5HwpXpa57N/iw6XVayWn4NU+eaqU7
         lxIWqy5guWEDeerXA4bGNGcYHaBOH/JYhoo9UerdKHySfSannbjiwIzAJ7LmG5RXzIE2
         v4zYc9FUxU+HTvixMQyEzMFGmDJ5LK1ksKt/C2ARIZzAl4nmIP1HdNUaFIe/hkBiNs5e
         bQV5q4+lRlr/7QjLewxU0vJAyvM2cus1s6Szp+xH/wxtTy3PNDn1cQ88oKE1X3Y3a4Ak
         DXzVBIfmoExKSiyq7vWOCu8ux/dysnZMUM99ETzqpWd1zQvV0QnXoNS1EmSaIYmXomAM
         hIEw==
X-Gm-Message-State: AOJu0YzFB4cVa7Ta0/LTJxRfT0YYKB8HQuH97PizTKPFu67JkHYkMUFR
	xxmyZudZ0BfuRtQdtcqZQp6Jc/dk9vszL58ArKGouRPqBZLGte+GJs7C1PoMrWJs/nBzbLl3oXD
	KuhtM2f1MHRv4UdMD2PmlgQ1dKBYviQgoSnO74wwYz/dL+oAN3fvyMnUmHwCWFRdfzzii
X-Gm-Gg: AR+sD11ddeNEpjtjt39Tb7gnrUU+pZiG7OI3rSjA0qc/O0M7XPWIOCilGSFZyDlKUR6
	cs1SpgGSsxUF3eiTkIn4j9c+gr065nfVs9itVEKrgc6jKntdXGQhCdFxz7W9O8PTe0WnJDJVtfF
	8e+3cIyawnd3f62rXKALd01/e0Hpw5fRyEjynBYOHzV71nZGJQpyodBeyjkGGCdhmXKSHjFe6Ee
	EQLRToy7n3AZscgrWpK3xQ0MfPrAXP7iFV6pcUyoMR68AKbXfdzM0Uy/gg+CdqIxs23wSPoz11u
	UcVRAFdbVVOECy7fn1q0QeSgGmwjsEheOOTyBlKS5oJ6tGJ3YYYlipBCsQV/vppDRIQi82fA9BG
	+WNXa5doA1Sv2P7Kk6odmRgq/i/dSjYC9Z6VfNFvdSHJ6R3T6Wp+vtuqxp92L4G7bSQYjDrYOi0
	5+Toqch8lXiwe0TQ==
X-Received: by 2002:a05:622a:5587:b0:519:8998:661b with SMTP id d75a77b69052e-52d18fd3460mr249242151cf.20.1786362172497;
        Mon, 10 Aug 2026 04:42:52 -0700 (PDT)
X-Received: by 2002:a05:622a:5587:b0:519:8998:661b with SMTP id d75a77b69052e-52d18fd3460mr249241541cf.20.1786362171879;
        Mon, 10 Aug 2026 04:42:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39fddd67ea8sm21201671fa.28.2026.08.10.04.42.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 04:42:50 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 10 Aug 2026 14:42:39 +0300
Subject: [PATCH 09/10] ARM: dts: qcom: msm8974: add the USB3 controller and
 its PHYs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260810-msm8974-usb3-v1-9-1a47e1185524@oss.qualcomm.com>
References: <20260810-msm8974-usb3-v1-0-1a47e1185524@oss.qualcomm.com>
In-Reply-To: <20260810-msm8974-usb3-v1-0-1a47e1185524@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Christian Marangi <ansuelsmth@gmail.com>,
        Andy Gross <agross@codeaurora.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3159;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=4WgJSJySPv8ASAImfHhYPQplaHVZ3iENoiXcumJXZOE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqebkqha+9rhhm1OkxHsuVf8HS0Sgqso2xvp6U2
 a4i5Yx4F7SJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCanm5KgAKCRCLPIo+Aiko
 1akPCACvs4LhWlHk8fjcjNAx+1WzO7mEwm4xBw2rHEmTMa4Yd6zvoyNJzqR27Bl+fsPJqwDJQqq
 aTr3zo4RCkz7eMS7l9GFZ6LjltlmcjMBRIMrMfDN8/f1XJOlmI7DZ0wAsWz2Q05KK+ewKEO107T
 dZBbpLp3n12hWTKydp1zv4ltBzITcLvuzu7sSBDodWO0L/ZkgXisIhCWq7oacUXJZhWjxLCaQAb
 3nyxhF0CYAGofcI8VT70hruT52N8BV9CmxIWd5WJMc503BKjqL6wiXtbmZxD2aZ3pPvLYnm39Bq
 pzBdSsBmFcXabrJ9qmqjZGCv9tVf9u2Q65E5albtOVA742Ow
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: -j2PWcl8egNVelBsNY4VWfkeHkScd_fV
X-Authority-Analysis: v=2.4 cv=R4cz39RX c=1 sm=1 tr=0 ts=6a79b93d cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=n7-vJ_S0t6EafDVEDUQA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: -j2PWcl8egNVelBsNY4VWfkeHkScd_fV
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDEwMiBTYWx0ZWRfX0FlZ5VahKbQu
 IAd1h5GuIlewn4AyLeHoLifMSRLtinEd6HZupcQMcvUSfv5RVtOEalurH2t+fCMREr17XO53mzl
 82QE/EhkYCiNlk40FJciQIZFYQD+4a0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDEwMiBTYWx0ZWRfX97aXG2PDnZZ+
 Na4zcGTNh6HElLsxu8TKHlJ7DlRnxnAUgNn046PasVcK8oFnYSc8I9ubQSz8tXM1YXWEe/z+Sjb
 p/3WYe87bst8gdB3YsCn+h49j43JpzPXHxhL5gKTRCsfpWCAwdrky/6iI29Y5dsMslZ3PsGyoXB
 MDZWp0IOGzKn9Vy+6mVUYbFydABncXpoiFQmmCzU9fu0JAQ/4nb2FqZ1+zeYUyvTeoEboVS1y61
 Zev0HdrYRLyj4GIemih/vBR1npaophbXFhEiQIMNV1HAJNR1OTCT95TzImrIekpavCYFzH5WS+r
 Wttt5HdgDFQxEuDdARl6qM3mRWYD+ghhLScnHX86otj/zDwdZJg++XGxW1NNT9CmpvlQIgvIpdD
 mG7DZyiVSB7S9cTi0DJnD2tutMKuEjdnSzahbu1jJVK3B/A1BuqJXV1c9XPEUqZrVVAF8vrjffO
 MVmS/GDHpufGZy8Vcxw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_02,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100102

The primary USB port of MSM8974 - a Synopsys DWC3 behind the standard
Qualcomm wrapper - is not described, so boards can only use the two
ChipIdea controllers.

Describe the wrapper and the DWC3 core together with both of its
QSCRATCH-controlled PHYs: the HS PHY at qscratch + 0x00 and the
SuperSpeed PHY at qscratch + 0x30 (compatible with the ipq806x SS PHY).
The HS PHY reference is the 60 MHz mock UTMI clock plus an RPM vote
keeping the XO alive; the SS PHY takes its reference from the pads,
driven by the PMIC differential XO buffer (diff_clk), matching the
ref_clk the vendor kernel hands to the DWC3 wrapper.

Both PHYs must be described and initialized even for high-speed-only
use: leaving the SS PHY dead does not just cap the speed, it confuses
the upstream-facing state machine of at least the TUSB8040A hub on the
APQ8074 dragonboard, which then connects but never answers enumeration
in any speed configuration.

Assisted-by: Claude:claude-fable-5
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi | 47 ++++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
index 06c0af0aa317..bac3c8772e0a 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
@@ -713,6 +713,53 @@ blsp2_i2c6: i2c@f9968000 {
 			#size-cells = <0>;
 		};
 
+		usb3: usb@f9200000 {
+			compatible = "qcom,msm8974-dwc3", "qcom,snps-dwc3";
+			reg = <0xf9200000 0xfc000>;
+			interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3", "pwr_event",
+					  "hs_phy_irq";
+			clocks = <&gcc GCC_SYS_NOC_USB3_AXI_CLK>,
+				 <&gcc GCC_USB30_MASTER_CLK>,
+				 <&gcc GCC_USB30_SLEEP_CLK>,
+				 <&gcc GCC_USB30_MOCK_UTMI_CLK>;
+			clock-names = "cfg_noc", "core", "sleep", "mock_utmi";
+			assigned-clocks = <&gcc GCC_USB30_MOCK_UTMI_CLK>,
+					  <&gcc GCC_USB30_MASTER_CLK>;
+			assigned-clock-rates = <60000000>, <125000000>;
+			resets = <&gcc GCC_USB_30_BCR>;
+			phys = <&usb3_hs_phy>, <&usb3_ss_phy>;
+			phy-names = "usb2-phy", "usb3-phy";
+			snps,dis_u2_susphy_quirk;
+			snps,dis_enblslpm_quirk;
+			status = "disabled";
+		};
+
+		usb3_hs_phy: phy@f92f8800 {
+			compatible = "qcom,msm8974-usb-phy-hs";
+			reg = <0xf92f8800 0x30>;
+			clocks = <&gcc GCC_USB30_MOCK_UTMI_CLK>,
+				 <&rpmcc RPM_SMD_XO_CLK_SRC>;
+			clock-names = "ref", "xo";
+			#phy-cells = <0>;
+			status = "disabled";
+		};
+
+		usb3_ss_phy: phy@f92f8830 {
+			compatible = "qcom,msm8974-usb-phy-ss",
+				     "qcom,ipq806x-usb-phy-ss";
+			reg = <0xf92f8830 0x30>;
+			clocks = <&gcc GCC_USB30_MASTER_CLK>,
+				 <&rpmcc RPM_SMD_DIFF_CLK>;
+			clock-names = "ref", "xo";
+			#phy-cells = <0>;
+			qcom,rx-eq = <3>;
+			qcom,tx-deamp-3_5db = <22>;
+			status = "disabled";
+		};
+
 		usb: usb@f9a55000 {
 			compatible = "qcom,ci-hdrc";
 			reg = <0xf9a55000 0x200>,

-- 
2.47.3

