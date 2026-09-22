Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3BF255292C
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 15:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790089296; cv=none; b=LOQ/mnNFkf7qsbvcy457W0TOajeD/tvmHJJVYMZjPjSICw3rX150GSSl0vpKT2NidCPPHe3G9iqmp5nM/zqpGA+AaxKfJfGefDtZWX0h0UA42p2tvUc1N8mB+qztn0wXAyEuy0PL2zhwMubFgr1yrkD+HVsEdIE+RgMRbYVPQUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790089296; c=relaxed/simple;
	bh=/g92+mFYnO+YPa5p9KHtV5grO9TXBTzmegVOly0cRNI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PWQumyJv2/efWfY4qaoTaJP7L9LTvVPS3hBRBD32TRBdC7H+OUAP4Lc0mDnBkxSn4eQG71VEvK4z1plfofY1UTMm5toQxDzEYBUaHBoWQgilWZ0yZQwJeVHSiPAlONvFzY8RxXvDFrZNsQJK1Kh8T0Lp/aFyXSQQ3npoyuc8dt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a7xr8OJk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fsbA5mTD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a7xr8OJk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fsbA5mTD"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MEj36K1423097
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 15:01:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LjPaDZwT2uvy0mTTIjDzFd6v4BDGkXxsUBcSFWcCloE=; b=a7xr8OJkJvpOQC5y
	FI38WQJvUgpInX1dOWUe/TkCsVfKiDSwSErfgLy9As60QgYZNDY/TrWyud8qUcuo
	zakywkPW1gHOzCZWFV1wa+wSZ1Fk7l1H/ywL/mvvkCVQEbsepzivRYT2VmRJvQ0h
	/K85mHVZo43gUWC6P+CeyZJpZBttERr65SuCJT/TD9BG10PURrcet4klEtUPjb/z
	BtlWL2a8fg+2ZfCUwO22GoaucaPToIfuSvZWTvmbxp1IpCTBeoNh5wnUc3uoT0ga
	I17Zn78zYR2TDkhm8XRiw50O6tM2L3dEM5Nr06Pll36ZRUNIEGvWmZbJTMTaJFWj
	aHoavQ==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guqk4s92f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 15:01:28 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5c7d2076f8aso1047146e0c.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 08:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790089287; x=1790694087; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LjPaDZwT2uvy0mTTIjDzFd6v4BDGkXxsUBcSFWcCloE=;
        b=fsbA5mTDP8T/VTafFbKzJoz74l2A+yrJSxwmwYFlQ+6CT3pAwTJYgaNw2jGpiXv7NU
         QdMaXTVmX7DAo9ii/YX0J6l+84hqz4ZTL5VLK4pGNOeMspLOhdkyxbxjAqc1Pm/RfAD2
         +msUkrqzQrRnOnXHgrBOBqoMstyU44Tn947J0ia7k84ALNmkrqMxjl2CyjMeEfXqfvBn
         zg6wvV5gsSspXXtTeHZPmkHPXgmUuZdS7N0BzJQmWDuq3yLaML7QdsDIq3GYfqXf0lq2
         G72avnK079HCB+GRFqaIyrp56K+irh/ir1M57ALachyozizlph+fGUwKliTBAnq7PC7z
         Kz6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790089287; x=1790694087;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LjPaDZwT2uvy0mTTIjDzFd6v4BDGkXxsUBcSFWcCloE=;
        b=rrKgvYS05QKHyLUXT/VqOP3C/eUDc4FUBao8+Iu0hPhSD9G+Rhs/9eD73KpTwSk7A8
         YsNO+DgrtDCdmEiwqnEE8BFlK5ZG2etn2gzomH7w/nHT5Bm+pO0ym0aC6bVB2wMDJ4nu
         H4JZ5aRx86cHhnaBmaPfowYov6rF1HhtSztU1uEv0Q+2khz7NLBx08meLXXMo+6QR4bX
         pVy2N+BEDg3NgOfTwd4DhCFcTh5zW4IFxj4dNrOjDJUa4H7J16xzaNTpDonvjszxihPo
         zGrdMYiC768QYpwuZy/JQqv7kQl+NxhIRsaRmzXB8BLFK2+Yf2KLPBxFZ++F5HfQhz5s
         rLjg==
X-Gm-Message-State: AFuF++kbgjZUJtPBSWNZWFOYjJ3MCAu6rakEDYsUkdf4SQTkEEIvjmOy
	k407v2+LOucFcCVYyZhXHsjHVOYRmPX7gF+LC9f7pb6fJ6pu4v/6XqjdH2mqdaLvnqZPblHlxDE
	tTnLeD1mgm9vky2MBZpqiM2fjEZKREQmBjpsLKK5O4Q/6XQoLx/EEBDFkjDIlXX3hdgeT
X-Gm-Gg: AYBFou1G4yTCdI+DzlAUPTxB4IVo1vn4wqsfyWx9xQJc7SLn9N4P+Perjaqx56BR3zQ
	ynCInGdm6nOx+Sg4uiT5kzT9OWOwE8i3CVmiwJgIi5YlebvlTXp3Jxq2k5fdQmXhwNQMt7IRcuZ
	Nlr7X/LkaqQOExuYPljMUn7n2EFigTJhHllwyzRhGa7le5uPL8Wm3kd/UY1pKSuZ71km09djisE
	uQNe6QA3L2LbApFYtV0BJfUh2E0UGqdGpF3lqPfW4tJybOFHEB9OgrdsGHuAd0e0R0y6MswDiyE
	kJo3viqLWS5eTCqHkmN/NPrcqHWYyMS4v4/0PzVo3mmVqSoyDXRmLyQuzTyPoT5sR7XeFNd0KXp
	LEGG76AIKjRSMp2XUo8k5fU/35KU=
X-Received: by 2002:a05:6122:3c4a:b0:5c4:4ec2:971c with SMTP id 71dfb90a1353d-5c9e3615b6dmr3037016e0c.10.1790089287308;
        Tue, 22 Sep 2026 08:01:27 -0700 (PDT)
X-Received: by 2002:a05:6122:3c4a:b0:5c4:4ec2:971c with SMTP id 71dfb90a1353d-5c9e3615b6dmr3036951e0c.10.1790089286765;
        Tue, 22 Sep 2026 08:01:26 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:5105:ff9:e148:c440])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-488627929a4sm4504298f8f.35.2026.09.22.08.01.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 08:01:25 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 17:01:07 +0200
Subject: [PATCH v2 1/4] arm64: dts: qcom: nord: Add the USB controller
 nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-nord-usb-dwc-dts-v2-1-ba2b39f1a843@oss.qualcomm.com>
References: <20260922-nord-usb-dwc-dts-v2-0-ba2b39f1a843@oss.qualcomm.com>
In-Reply-To: <20260922-nord-usb-dwc-dts-v2-0-ba2b39f1a843@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>, brgl@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3859;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=/g92+mFYnO+YPa5p9KHtV5grO9TXBTzmegVOly0cRNI=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqspg9XpvDIZIVqeLEMZlLeWzFJGdGXoryQqrzt
 K/H6RUQnvCJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCarKYPQAKCRAFnS7L/zaE
 w5mED/sFZI+Q6HSCmNWWXJrSrLVBHTFKsuRwj8JL7iChb++pm2TcKsBShu6BTcGi4qRvdl2H0Yo
 aRSg5COKKerd4/L32IXfq9TMmD4Qrppbbl8qiksOhzmm8kCAr4NwSr4t07+9dCLqy1WhPqmkA8X
 Thnkz1h9OOvI/F8D0kpMCbGl4YcSUD5aLZUyImTz1Jiq+2a3M7POEGhWNdXB4I8oa9D7jJH9LEv
 zDRGVhUEo79b3n/33poPYGT32zwzW+ZV3tVJ7foONuETFZZnNaySP4I4WQVvSNHtCkl2mr/3y1m
 XhwqGcKSfyxzr5zuhr5rqj8U24pVPeMKAcnnTK94puTpMYj8VHbEBGWsT7a90pMHGXvW6YY6+PF
 DLVgj5MEF/vxIgD6JivodjHIFMs8tT/+xDbUAmAaSHfSqj3wywFtnWymTt5nU8zfmPzvxzybWA6
 VGtDxSh0V5LnIwVasJiVsGjLj87Wec+vJtEaGuucoozhgCxMHPMFZnSSc1KqvRL7t7i3sC3pxYh
 J9NyP3EAhqfpBVZh4PBxztCAcoXKtu73Oc21KI9bYkS5xDZU77EDKNig9pPCaOBZm3tHa3sjQJ1
 CW27TDR07hFSVI2D2mZaO6xW5P6EiDHxFP3uKo1syIyx4KQL68kRb6481/GvwAN8sk6RuucIdVi
 AaO3r3lYb4yrrhg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDIxOSBTYWx0ZWRfXxO+dOMBeuyB4
 QDSgxYwfr7mx6HoUrzVguU3k/HMij65A5tvdhwGW5kl/Z86t3GN8xP4KIr3CUaUtHDbjF8FIS6Z
 e32neH+3WCWStq8UrnoFYfKpucVGAG+Mrki3kVsu/L3Ybi72p+VBR2gE2nUBLSGgVsS8OjJObRs
 dXOYzpLSl5WNwhx+Dvk/wU33I4RYys+09burldKjL6qrnYbCMEvP06/KlT+bhvBCzq+9H6RkWIu
 UnRn/HGetg4CYGFxFw8u4a1KqRZx+ajgRx8w/EUqDnp3DEx10h3AgIIXpbXt7wMipYfNozTq9Dm
 vrR1kMrBtXxrNjBbfwP1LuTZi6FJjoKmCpOwnKtZPFU6AbuM6CEXoqWLOzIbqaz/rC40ny79QHg
 ne1o2NCU7e6RQtU4jxEDhCiA+vWpkQ==
X-Proofpoint-GUID: oeRWGZo9YvAB_C4GtpZFxAP8Em1HVs3k
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDIxOSBTYWx0ZWRfX6SFW4jR/YG+a
 3oR3hY6n8vjjv7jZzGp+hqKwerwgZckexRltAOTrEOI5EvlDFusTa5CB9SV/WfrfCXx5+ojPApU
 4QvgtyCRq7A07ALqMPtprFy3qseFkKw=
X-Proofpoint-ORIG-GUID: oeRWGZo9YvAB_C4GtpZFxAP8Em1HVs3k
X-Authority-Analysis: v=2.4 cv=XrVvqlF9 c=1 sm=1 tr=0 ts=6ab29848 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=P8P6MxEz3gILoQB_aS8A:9 a=QEXdDO2ut3YA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 bulkscore=0 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609220219

Add the base nodes for the three DWC3 USB controllers. These carry only
the SoC-invariant properties and are disabled by default. The extension
for the embedded Nord variant and relevant board files will add the
platform resources and enable them.

USB_2 has no SuperSpeed PHY and no 'ss_phy_irq' on this SoC, so it is
capped to high-speed and told to use UTMI as its pipe clock.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord.dtsi | 100 +++++++++++++++++++++++++++++++++++++
 1 file changed, 100 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord.dtsi b/arch/arm64/boot/dts/qcom/nord.dtsi
index 926ccf3bbe4e4d27ac37873245c3871e4a290d65..4375284c59e649312a5e814239e5f91d49f9ec45 100644
--- a/arch/arm64/boot/dts/qcom/nord.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord.dtsi
@@ -1737,6 +1737,106 @@ ipcc0: mailbox@9007000 {
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

