Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 890394EE865
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 11:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791891306; cv=none; b=RWI9ltKbJZQdX+9jWTRZ4F78JKccmxwrGEFRLaZ2NKfyp9eOS29cvdQkwVGJV0sce7ht61BSa0+jvY6xPBjOv4qkJtv2r7ztATG1iW33feoUaHhutWmBTl9FZ39utLGbZj/sD5EDjSS2yS1NcyYk7OO3jY5c0EyiyjR5W7xEJrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791891306; c=relaxed/simple;
	bh=wXEpr0E/ZADUpMzapSCoGmr31TeZ8wJZbHVzgiT+TFY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LtCT25YS3QklmHI+uHJ+rXACBxQ2CyvVr2enPKHGUc6NRpMXEBJAILHG0TsUdXuTdMfCh+7C6+jhBoc4RPPqoOPmZJ7tH6w9fmvmJ4Dc3tcAt0o130jBUD+ey8DMmpaxA2/CEVkiy3f3R4p+X2rZkXkXqfQo7S596fPlDlFkpOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hhkJh8Xv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b9B2kq/x; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hhkJh8Xv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b9B2kq/x"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69DBEaKi949419
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 11:35:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lQ6SyZ3slo2Rd9RGgl4De7TPW/h/sfltRoVPoZDISKY=; b=hhkJh8Xv6jFODcWI
	X+2PIsGkJQy48cn6RujLkY2Hpi4phwn7BOhGGDWCIRbu0/DlOl0027+Wu6kjUok5
	bgNbljBDALSZA1xS0p4IxkAmD34H5xFhRi6p+XqvCBQSN1pPxtHOJKCPcGEoxgWa
	6phZlDWvSmQ8m9sv161wiT5Cxx3tsX0c4yan3yr8GVjKnamwFIzdYn2EyzqEjfGe
	MBupvMmGwXAVJLu9ZQlTFSbEzT0ExXv9Mzksh2mszp4cNeX/MuPDM/kBqAi9z/P4
	HI5OPrHOYgbJczVbTvkRuWqC83kosxIilthASQ/yH/HAkBqvBXHPmzXMt0djoG8Z
	vumsGQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9f629bge-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 11:35:04 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93e834ff4d0so808691885a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 04:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791891304; x=1792496104; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lQ6SyZ3slo2Rd9RGgl4De7TPW/h/sfltRoVPoZDISKY=;
        b=b9B2kq/xw4I267kG4Pz7LuK/RMnLnvFMMeUKuexPVUzpm8nos2To+pxUFdHre/EKnB
         nFQHrogC87UYyqQSELYDLLUQPAQnzaUydiV/amF7S26hpjokdnvzvZEoxjvrFC3dr04r
         57FVFJQmpbZVcdBjurdlV6VYUGEvP38cLyb3LNsUiCEo6k3W13LRTK8ttdaE0jCRdjTX
         M2I5T9tATLvgkwRcZGtQ0pyh4LiGMgMPsk6DnzQ3LUmnlNqipWpeiRWyq/gmIu4S55YX
         x6OAhkFpOixB88Yo2c30VAXUVjmyhDvLmgkUfn+aSGCtrBmpuVAvJPw5bWqoT25ncqCj
         g6JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791891304; x=1792496104;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lQ6SyZ3slo2Rd9RGgl4De7TPW/h/sfltRoVPoZDISKY=;
        b=rk+M2XW5CvIIUVg4aJimAtVL4IYackMI6nj+JY9XfawRNc7W5sif8x0v9p7wZV566y
         73yk3zdbLAwyYPZusGB/0AQIzir1kbgs0Li1lgyyEBpSKSGhJOuhCLu6iY3D8AelE8VG
         M4jk8Ao9zOtgYsHp+sZzEktJK+/Jwa04ECk/q8ASv/DV4FFfrWNr9tjCDja+iscKpNvb
         K0w9WNnPmERZ/amz01h0Hk3Fj/WvK8h6ffhPtUR9euK9x1fybjt48CYBmngwy0cD/2Sb
         5BpoEgnlJpvLa/hwP6HRq8Ox2K01lLcmx+1F2tF2/fMzH3tSm/nVcJUIJnGlOTiA1lTK
         7SlQ==
X-Gm-Message-State: AFq9FYI7bKRxiuXiMycpW/0zYla9dNxE7xG0zb/e2lvCsWBu2t7MVFfH
	iRs6ZcRfJEHsvEcMN0g+iTdWx2ySt1gcU7KwVGRYuQre/Dxug0hYbSHUF6pxh5xFlxw5vtCwHUL
	mcn2VYH3b7DPrjMWvaM9PhKgkYg6ZY9HaIIDviVnFYhUoL3AiDvXnFXwLVlL9Pe4psYbstWzrAH
	bw
X-Gm-Gg: AYBFou2mirDS5u3pvOp856Ma4s32cjojb6WUm/a8HvpfgZ2+fM8jV81bzZHxmtta92P
	+vtcy4BRkqNpH/vH08fKZHDamuWdLrJOysNcqB6KjIVJ5BTqrDJO5Y7SqrOpHdIElK5YRtCMtbH
	qJ3ILzmSlUWGwdESOqRk3RXiTzH6ZFxTR3R9piNjEyozDia5Gt8eVJtM0i0gn5gWpr2uWkO8lnc
	yaPKTogT4U1KGY7WpqDAOZGbT5rol/e2BAqKkLh9noA3o8AceWsdDmAgJNooaZIFLEBOIeM9Le/
	HGKgVjEwruPlvCHa3jtC0ALvb9ny2Muaw+WKtyJjgSOeSox8+q/jAvr39jVCJSwG72BWqv3IkC8
	7wzGkfaUofgUt+G+zvcZ6FQKdn1NH
X-Received: by 2002:a05:620a:28c9:b0:93c:b721:b10d with SMTP id af79cd13be357-93ebd0bf9edmr2024667485a.8.1791891303628;
        Tue, 13 Oct 2026 04:35:03 -0700 (PDT)
X-Received: by 2002:a05:620a:28c9:b0:93c:b721:b10d with SMTP id af79cd13be357-93ebd0bf9edmr2024662385a.8.1791891303195;
        Tue, 13 Oct 2026 04:35:03 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf2343asm654407215e9.9.2026.10.13.04.35.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 04:35:02 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 13:34:46 +0200
Subject: [PATCH v3 1/4] arm64: dts: qcom: nord: Add the USB controller
 nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-nord-usb-dwc-dts-v3-1-bcaaf3faae24@oss.qualcomm.com>
References: <20261013-nord-usb-dwc-dts-v3-0-bcaaf3faae24@oss.qualcomm.com>
In-Reply-To: <20261013-nord-usb-dwc-dts-v3-0-bcaaf3faae24@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>, brgl@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3920;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=wXEpr0E/ZADUpMzapSCoGmr31TeZ8wJZbHVzgiT+TFY=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqzhdeH2qq40XWo35hO7kKqImV9/rAgXXmPu3nu
 OFNPVvCJ2+JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCas4XXgAKCRAFnS7L/zaE
 w5jZEAC5+sjDg7dDivILvBSKePn9cxRQkOGEwn0OhstXAE0Jswbn82qDafKi2SwRGgTjg3f/sT2
 EDT/JD+zeuHIgl5GGAjBuFVckBsW+QgAG/yRne+5IOIrDW3ZMnp+GZwtwwslhCBfbqO5CR1BGEH
 MO+6nMUt2G0IeKGOIgP4iahtCN9xxvsnSbdzBCz8uCcAb/kg6pyzR1pxZXIQx8Rfflo0Rurlcq1
 EYZJGTunLr2i4GXfbEX6uhoUPDlBX0DCeeyu5nbhxnVUC5LPFn9mYBg8mBSGAx31F2grLMOkmGA
 IF28FXXZhwpEjfObZUXjDmf/fEsu/H5ZdzgqX34j00kUkbNBQgIf9EybOIudqycz9MkvsgabYrc
 eeT9/NJ5H9g2RleUXc2+W1/hw1/tZ82CM1pg+r5fXtd/2nQUXvhi8xOm3qqZFKnGdJvLX3sA/s5
 VUB2CpxXCF/G2eONJtc6nVl7Q/lJZgE3gBfXyjiIQr2MEBIxAxl0qk286InZFSDE+TJHMFKBuE2
 SkZDA0X7n4HcKx4D2M5X/6JjkM3OW4v69RexCpUFN9CYuAnbhpNNKxqnoxrItMR8dtsNF7WjpJI
 /AyRkq5XPRKaTdHVhpAXMA0+Qm7TssSwQKzYmX0w9NGGCut1EatB9Mag1JOfJTqrpADtOd9e4oj
 4Td8+KSylkm2thw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=FOKOVOos c=1 sm=1 tr=0 ts=6ace1768 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=P8P6MxEz3gILoQB_aS8A:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA0NiBTYWx0ZWRfXxS6ClocV5U1n
 IdqcAK4ydUWR5N69kNq+ubFZY8s1bZXgbf1hW2tSd4xquePNq42bdy+dRZgNolYyXKGb6ejINPf
 LgzFj2r/VX7x8lpSHNNFKehVmcNO8ro=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA0NiBTYWx0ZWRfX9NjndDb2XQ5B
 4ZBaX3xsCSSzSVxf5f1GlwKwftDMW59AKIGgcXgjSsi/8SqqkD5Kb0WGzaartt8eWuwo8xak9pB
 h2OZfuuiTIAsm1ezXYIRbEAfm4waLjfmtSVNb0iB6n41eO7ENA+sEbTY/th8XtCPMh+5EE6h26y
 efhANPAstjv85FC6rGq2nWkd4sElsx8JtKgEwbg+on9L43DfjFig6J+gIZwfb/YrvPtZkOfu3My
 FtgFptIZgRwdQg4hMaSS9pqxH0kaqAGxh8aybdEjwskDRlOHkRIor8GSwWIBseuI4YAuTTQpgVE
 XklmUD1+mocgC7RfJijdcvJ5iP4OGv6Rw+JTTG+zXLq3jnf/3wTZyiJDHunnEjLnlCESm861X7S
 l4rznPrO9oDyZDPvaYTAfKcqg7SFYhSk2pWOnjqRbjAs0ZFvDPhAUA8SGb5iJz50w5F6sXGrznE
 Eo1sqHQrsEnl4R56+oA==
X-Proofpoint-GUID: GMKGQ9nt61Rp8x9NQHg8yUE-LQmGQhAG
X-Proofpoint-ORIG-GUID: GMKGQ9nt61Rp8x9NQHg8yUE-LQmGQhAG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130046

Add the base nodes for the three DWC3 USB controllers. These carry only
the SoC-invariant properties and are disabled by default. The extension
for the embedded Nord variant and relevant board files will add the
platform resources and enable them.

USB_2 has no SuperSpeed PHY and no 'ss_phy_irq' on this SoC, so it is
capped to high-speed and told to use UTMI as its pipe clock.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord.dtsi | 100 +++++++++++++++++++++++++++++++++++++
 1 file changed, 100 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord.dtsi b/arch/arm64/boot/dts/qcom/nord.dtsi
index aa52238adb98046ec36a88c7f277dde34582aeb0..4f1908f765cb026602203b473142317008738606 100644
--- a/arch/arm64/boot/dts/qcom/nord.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord.dtsi
@@ -1742,6 +1742,106 @@ ipcc0: mailbox@9007000 {
 			#mbox-cells = <2>;
 		};
 
+		usb_2: usb@a200000 {
+			compatible = "qcom,nord-dwc3",
+				     "qcom,snps-dwc3";
+			reg = <0x0 0x0a200000 0x0 0xfc100>;
+
+			interrupts-extended = <&intc GIC_SPI 910 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 907 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 908 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 8 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 7 IRQ_TYPE_EDGE_BOTH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "hs_phy_irq",
+					  "dp_hs_phy_irq",
+					  "dm_hs_phy_irq";
+
+			iommus = <&apps_smmu_0 0x14e0 0x0>;
+
+			dma-coherent;
+			wakeup-source;
+			usb-role-switch;
+
+			snps,dis-u1-entry-quirk;
+			snps,dis-u2-entry-quirk;
+			snps,dis_u2_susphy_quirk;
+			snps,dis_u3_susphy_quirk;
+			snps,dis_enblslpm_quirk;
+			qcom,select-utmi-as-pipe-clk;
+
+			maximum-speed = "high-speed";
+
+			status = "disabled";
+		};
+
+		usb_1: usb@a400000 {
+			compatible = "qcom,nord-dwc3",
+				     "qcom,snps-dwc3";
+			reg = <0x0 0x0a400000 0x0 0xfc100>;
+
+			interrupts-extended = <&intc GIC_SPI 917 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 918 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 919 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 13 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 12 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 41 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "hs_phy_irq",
+					  "dp_hs_phy_irq",
+					  "dm_hs_phy_irq",
+					  "ss_phy_irq";
+
+			iommus = <&apps_smmu_0 0x15c0 0x0>;
+
+			dma-coherent;
+			wakeup-source;
+			usb-role-switch;
+
+			snps,dis-u1-entry-quirk;
+			snps,dis-u2-entry-quirk;
+			snps,dis_u2_susphy_quirk;
+			snps,dis_u3_susphy_quirk;
+			snps,dis_enblslpm_quirk;
+
+			status = "disabled";
+		};
+
+		usb_0: usb@a600000 {
+			compatible = "qcom,nord-dwc3",
+				     "qcom,snps-dwc3";
+			reg = <0x0 0x0a600000 0x0 0xfc100>;
+
+			interrupts-extended = <&intc GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 14 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 15 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 17 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "hs_phy_irq",
+					  "dp_hs_phy_irq",
+					  "dm_hs_phy_irq",
+					  "ss_phy_irq";
+
+			iommus = <&apps_smmu_0 0x1500 0x0>;
+
+			dma-coherent;
+			wakeup-source;
+			usb-role-switch;
+
+			snps,dis-u1-entry-quirk;
+			snps,dis-u2-entry-quirk;
+			snps,dis_u2_susphy_quirk;
+			snps,dis_u3_susphy_quirk;
+			snps,dis_enblslpm_quirk;
+
+			status = "disabled";
+		};
+
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,nord-pdc",
 				     "qcom,pdc";

-- 
2.47.3

