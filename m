Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED553559C8A
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 15:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790089300; cv=none; b=rbqIpJKaTip9aLOJPsvp/YfYZiy5CzlvxKcQT3MejZcqurbflo08kkmjiiIgUmWJ61r/IcFN8xfMDJJGZbjs59OLpYyZtiJl9L6tNw7E8KtjpomqI58DUVuZvaCNrz8E7CZyy6ZcQavS8P5haXQsUv+uBOIJjMprw/5D1PeGyr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790089300; c=relaxed/simple;
	bh=hPrFzVPK/BjcJu5oG/9PFOEyy2TQ8frGgPMSuwO8KGU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W1vH/L3zUsqYPqsd0ePh+bvUzmc9907RBJ5tfo/Q7Ti+5yQ5pZeHQdbyq78/5NH30aeDQddTAUudJGBTVpMLHnx5+QB39/L8ckJWDxZ4+14CdKJkpjHKAqSNwzti/02fMjxdEK85sdlJsaQg5WgNAXD7OvFXdiHKlWaEzi2wTmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pADXC6zz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Arq6/55s; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pADXC6zz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Arq6/55s"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MEjMlj3307554
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 15:01:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YdMl/sg7htB3R2CVnvcuX8uX3p0eZiMOb9sM3fi7cn8=; b=pADXC6zztEp2Z0Fe
	S5mD7/hQBugVBCLIFOqHrDcKaYeq70yBkp7j23+ZQaTgcitYNlemVEiAxDcLFL6L
	3qcjrfu4D33ov07Aoja5lhoZiKewPJvPorlDb5wofhRPIFOgJDCp/BiXarFROkVa
	gBdQigWcdy1O+YazvX2ffBAjvSg0JQmrooU/j51GSvSNglMZxvV7uhwf8pM1CAEQ
	wbufJU+u4uZOGWsxgIvaK9vQAEYttX96+wPVsyr1RJdZMCWDpDseW3LNmMOqc20a
	Hgi4wngJfClCXYo+N7e6QlYagAfcvHD1/7xeO9iKtzeYGV4GXNVqVosJS7obfpKg
	2FtR/A==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guj112pks-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 15:01:36 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5c8323b8464so5004249e0c.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 08:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790089295; x=1790694095; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YdMl/sg7htB3R2CVnvcuX8uX3p0eZiMOb9sM3fi7cn8=;
        b=Arq6/55sYFMtBR6Befs5sLU2zilpHfVoo6hjhewGLXmd2tdQ7ZUesowt2TbdLqSntW
         iBc5hIQCtK1Df30jcVVvk/bCZl0/zCkylqQIVgnoVrkc+FWlWQmxWGUudx+T0l6inAov
         9ytOtY3DihqgECYeiBKtz/k+s3hFNXhGJJXPgfifHJsbd8RiwWhWxhgkhSC4jEZ67Xqc
         8kRJeVyOvVlFTh/K/QWSwU+tOwND8BlQbfzUyx5IMonWB/Rwm3tfrLvY2Fy5378M2heN
         KQX+KYhIcpB62OFN/xpjrv0xX0/tVCVmNK39ZQDshFi0TelxrR0bcYu/KUpZ7U4KA2B6
         eMRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790089295; x=1790694095;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YdMl/sg7htB3R2CVnvcuX8uX3p0eZiMOb9sM3fi7cn8=;
        b=lxlUxK+2BeUAn8TJw5hFp8pdJ9DTG8ifyGyRPEeu9b6ArllgpR1yn/5RNJpGyZJOai
         X7PjZRd9skkFUkwdrlVb8tMhKEudzeij8gnQhNj2iZPxlDph7ZMerfyetjDIUQrmMMFm
         g+m72zAx74vTUftfdv7woo5V9VCnnLPbAfiHAZi8kg//RJtKuyLLawneHlvccvJ16pRO
         XLZwPUZXjkqtBZNPAuehUrj1UzzE1EIrUgmsjIxerOZSNl37gWghpKQ72t/ZwkGV86gQ
         S9n3EFi5cfmc6c72Gw9RloMNTsma3xXD2zn6OlKwyoYAuBqdquZrNYSwJVi4UE3Qiu3U
         Nk/Q==
X-Gm-Message-State: AFuF++mRT48WHQXkxhHuvV+OyVn5VQzKG+jMwISuBn2th1XWTYP/9zbW
	hO7LtdTjd+lqsmt+RpR1aSFdwiXFbEPoMz+QOU+nx8epTvCW+yW2/wWVgbcW1kM52cMIAMpogJ2
	xPeouOOpKRb2UsHFcFr4JqYlpApSvqytESpOZa9Mglzof924CL/SwAz7k3uNCfi/+XpfZ
X-Gm-Gg: AYBFou0GTVBdzHt/OOAYYR0VgAj/Vyu/W8TqoUBhVVP2/8NYnOW7IfwfuSC4CC8QE92
	IceNNZOd0H+quN6DM6nP1u1txcb1EplB79n1ateG7WjLhl7iiQhznyZfBtJye6+0OYOfbmO9ePj
	/T38ciuvPiHFWlpj1X8KbGltcRS+mACXeeeWz3msxW5szuHsNdxrl0TyPVtJCrOR6cKR9CsdRVp
	Hz8bp0vbX1iTRMEeJc7BdWmp0HtsOYaUmLICka0fw5HvKIaap6qL1Bkejl5hhpWqgwyBEErlL5b
	KyXCEfXrmQ9ZTf+dODt80n3uzoSpXsvhIg9axtwsZRDDM2chF9a4J1RrXCONt2jpLCh/hWmpZG2
	BEc8NDdU2d4yB2X+/O0xR0ry0IXc=
X-Received: by 2002:a05:6122:54d:b0:5c9:c60e:3a47 with SMTP id 71dfb90a1353d-5c9c60e3d80mr6551029e0c.19.1790089295152;
        Tue, 22 Sep 2026 08:01:35 -0700 (PDT)
X-Received: by 2002:a05:6122:54d:b0:5c9:c60e:3a47 with SMTP id 71dfb90a1353d-5c9c60e3d80mr6550956e0c.19.1790089294601;
        Tue, 22 Sep 2026 08:01:34 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:5105:ff9:e148:c440])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-488627929a4sm4504298f8f.35.2026.09.22.08.01.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 08:01:33 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 17:01:10 +0200
Subject: [PATCH v2 4/4] arm64: dts: qcom: nord-ride-embedded: Enable USB
 ports
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-nord-usb-dwc-dts-v2-4-ba2b39f1a843@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=8689;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=bbmlZLV2p4zujkESD5KqrasikmmK6NMXRo1thUV72Qo=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqsphAwdKnet68XqJfKSwrWncoX1YVHjkrSnG2W
 PkOj5gXiYKJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCarKYQAAKCRAFnS7L/zaE
 w8stD/sHwFZh0rKv40lhSk8Yke9JV42YUpQF9VpfAcozk/6dohGG4CJBC54oVgJ/P3tT151Holm
 Ggl1/OjDLb5niJpVkDB6PKM7JGUzIpbE+UoLwiaFkKKJnvOzby5Dpt9rSx01IBvWLTNvmUfmxD5
 on/+d2N3PV1lJzdBixVUrIRdDS2jTvfLXnUb9N+xB8TWCtjq4SqEIoLStWYzEOiT/Ws4WGjndyj
 2NokG/JCeZDKTBw6GLZUWrEqHkwNTA5Ir3VYnMhqyrKILh+/XcHMr9tlZe/3UtUqX7m2jRm8/4u
 6HEJUB2jeMO69LOZQxOXodPlN8oIZDgqO64LadVPUXmXgyC8Gayvx7wPpJH89ZKxZP0461w7lxk
 Z+hM/4Ui0tA/e80HvM6sQAIUxShncv8tYuO3Mwx2wzaBqyqDxpszPMziAtTs5PhA8KJojtkEXdy
 5oXzbOKCN/DjSAgsO2VK7P4BnpiW5c2v0yvsghkcxbH0islWnQ59Bs56lJ0rT+H1fSAPlTK0NxQ
 EVm55QUH5+1CtuV4p4ylf+s/7IjPWYsz5eDWMLJLkwi6gbDEY2KNwOojV/U1Lj0uB1t2V13dmD9
 ssBCg+P5wAsd4ZBhPjS9mPLHJFFngfH5tZkgnDwFp86dDaMWUZSwTPdl06RJt6P0P5aNnliKUXs
 aPI/kp3wgZQMDVw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: UL-3wfBgmAKyQpM9Qr716RhUpX0Gf_9H
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDIxOSBTYWx0ZWRfX71Iq+XT2xtJY
 B+9HZvAawOGMI2CH5x7OnO9oJv6Sh0+0cmJc6MUAFoH0g3VAXtLvQvcPDpTOrEc0+XBcZh5x1IM
 dTGLuUFJ2FQghAa2ZNmKKeErGe99IjM=
X-Proofpoint-ORIG-GUID: UL-3wfBgmAKyQpM9Qr716RhUpX0Gf_9H
X-Authority-Analysis: v=2.4 cv=atQnmiZV c=1 sm=1 tr=0 ts=6ab29850 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=e3i5arzminRNzLjNAVYA:9 a=QEXdDO2ut3YA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDIxOSBTYWx0ZWRfX2OoZ2nSfqoDV
 8CnD6Mh4vRqxib0layAZfRM6+s02Y9Zpfeb9EfSxNANuZGHU+eTrFthQ8dfOvjxb+YilRYyD/PI
 /0mUJTD3yCGnGTfdX4OAgDSzlmlWmCOWoyFOtB03TN2lllbYB/t2gyEfv3eGBDhYKdTiY6VUJme
 NsUbxe+/jyVLx29DWqr4z+i9ap9gZEQ9choaGgfen1yYUUWFdwPHrQBak8ZXtEHczVzxrhpFiqp
 gxs5QCSrBWLDiNf9HTK5sXCyyhRl/U3tXA9Jb4Q8wNck4ZeYPZyH1+Z4lBl4L8DRjjDcxM8OcHk
 BpNQhFWO/opQF7lAJbes+emAl5laqiL8+vpuwJxy/Ps+dkZYsDHoHK7SUvmZWnkosZsgOdOg4bC
 cF6XSwtCyx8CABn28mZwAG7D7D0kgOIGcQ7W04c6zWv3OXa0Ed92l8mYpHcSf8P9McIJwWN1aEc
 QYdsV8J64jMVY10tCmQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 clxscore=1015 priorityscore=1501 adultscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220219

From: Shawn Guo <shengchao.guo@oss.qualcomm.com>

Wire up the board specific pieces for USB ports. Enable i2c9 and add the
three NXP PTN3222 eUSB2 repeaters (one per USB port) with their 1.8 V
supply and reset GPIOs on the PMIC GPIO expanders.

Add the onsemi FUSB15201 dual port Type-C controller at 0x50, with
its interrupt and pinctrl state on pmau0102_i gpio8. Both controller
ports are wired on this board, so describe two usb-c-connector
children and cross-link their HS and SS endpoints to the dwc3 HS
endpoint and the QMP combo PHY SS output of USB_0 and USB_1. Both
controllers therefore run in OTG mode with usb-role-switch.

USB_2 has no Type-C connector, so it is configured as a fixed host
port. Its VBUS is supplied by a fixed regulator gated by
pmau0102_h gpio3, kept always-on since nothing switches it at
runtime.

Assisted-by: LLM
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Co-developed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-ride-embedded.dts | 309 ++++++++++++++++++++++++
 1 file changed, 309 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
index 09ee525764ef9a65aa17648097038687e61a5122..ee1525b37b381120d80a76d7b8e20ab2edeca6c3 100644
--- a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
+++ b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
@@ -6,6 +6,7 @@
 /dts-v1/;
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 
 #include "nord-embedded.dtsi"
@@ -53,6 +54,124 @@ bi_tcxo_ao_div2: bi-tcxo-ao-div2-clk {
 			clock-div = <2>;
 		};
 	};
+
+	vreg_per_3p3: regulator-per-3p3 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_per_3p3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+	};
+
+	usb2_vbus: regulator-usb2-vbus {
+		compatible = "regulator-fixed";
+		regulator-name = "usb2_vbus";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&pmau0102_h_gpios 3 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-always-on;
+	};
+
+	usb2-connector {
+		compatible = "usb-a-connector";
+		label = "USB-2-Type-A";
+		power-role = "source";
+
+		vbus-supply = <&usb2_vbus>;
+
+		port {
+			usb2_con_hs: endpoint {
+				remote-endpoint = <&usb_2_dwc3_hs>;
+			};
+		};
+	};
+
+	vreg_wcn_3p3: regulator-wcn-3p3 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_wcn_3p3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&pmau0102_e_gpios 8 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	vreg_wcn_core_vl_0p95: regulator-wcn-core-vl-0p95 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_wcn_core_vl_0p95";
+		regulator-min-microvolt = <950000>;
+		regulator-max-microvolt = <950000>;
+		gpio = <&pmau0102_e_gpios 6 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	vreg_wcn_core_vm_1p35: regulator-wcn-core-vm-1p35 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_wcn_core_vm_1p35";
+		regulator-min-microvolt = <1350000>;
+		regulator-max-microvolt = <1350000>;
+		gpio = <&pmau0102_e_gpios 6 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	vreg_wcn_core_vh_1p95: regulator-wcn-core-vh-1p95 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_wcn_core_vh_1p95";
+		regulator-min-microvolt = <1950000>;
+		regulator-max-microvolt = <1950000>;
+		gpio = <&pmau0102_e_gpios 6 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	wcn7850-pmu {
+		compatible = "qcom,wcn7850-pmu";
+
+		wlan-enable-gpios = <&pmau0102_e_gpios 10 GPIO_ACTIVE_HIGH>;
+
+		vdd-supply = <&vreg_wcn_3p3>;
+		vddio-supply = <&vreg_s3a_1p8>;
+		vddaon-supply = <&vreg_wcn_core_vl_0p95>;
+		vdddig-supply = <&vreg_wcn_core_vl_0p95>;
+		vddrfa1p2-supply = <&vreg_wcn_core_vm_1p35>;
+		vddrfa1p8-supply = <&vreg_wcn_core_vh_1p95>;
+
+		regulators {
+			vreg_pmu_rfa_cmn: ldo0 {
+				regulator-name = "vreg_pmu_rfa_cmn";
+			};
+
+			vreg_pmu_aon_0p59: ldo1 {
+				regulator-name = "vreg_pmu_aon_0p59";
+			};
+
+			vreg_pmu_wlcx_0p8: ldo2 {
+				regulator-name = "vreg_pmu_wlcx_0p8";
+			};
+
+			vreg_pmu_wlmx_0p85: ldo3 {
+				regulator-name = "vreg_pmu_wlmx_0p85";
+			};
+
+			vreg_pmu_rfa_0p8: ldo5 {
+				regulator-name = "vreg_pmu_rfa_0p8";
+			};
+
+			vreg_pmu_rfa_1p2: ldo6 {
+				regulator-name = "vreg_pmu_rfa_1p2";
+			};
+
+			vreg_pmu_rfa_1p8: ldo7 {
+				regulator-name = "vreg_pmu_rfa_1p8";
+			};
+
+			vreg_pmu_pcie_0p9: ldo8 {
+				regulator-name = "vreg_pmu_pcie_0p9";
+			};
+
+			vreg_pmu_pcie_1p8: ldo9 {
+				regulator-name = "vreg_pmu_pcie_1p8";
+			};
+		};
+	};
 };
 
 &apps_rsc {
@@ -366,6 +485,121 @@ vreg_l3l_1p8: ldo3 {
 	};
 };
 
+&i2c9 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	usb0_repeater: redriver@43 {
+		compatible = "nxp,ptn3222";
+		reg = <0x43>;
+		#phy-cells = <0>;
+		vdd1v8-supply = <&vreg_l3l_1p8>;
+		vdd3v3-supply = <&vreg_per_3p3>;
+		reset-gpios = <&pmau0102_i_gpios 9 GPIO_ACTIVE_LOW>;
+	};
+
+	usb2_repeater: redriver@47 {
+		compatible = "nxp,ptn3222";
+		reg = <0x47>;
+		#phy-cells = <0>;
+		vdd1v8-supply = <&vreg_l3l_1p8>;
+		vdd3v3-supply = <&vreg_per_3p3>;
+		reset-gpios = <&pmau0102_l_gpios 3 GPIO_ACTIVE_LOW>;
+	};
+
+	usb1_repeater: redriver@4f {
+		compatible = "nxp,ptn3222";
+		reg = <0x4f>;
+		#phy-cells = <0>;
+		vdd1v8-supply = <&vreg_l3l_1p8>;
+		vdd3v3-supply = <&vreg_per_3p3>;
+		reset-gpios = <&pmau0102_i_gpios 10 GPIO_ACTIVE_LOW>;
+	};
+
+	typec@50 {
+		compatible = "onnn,fusb15201";
+		reg = <0x50>;
+		interrupts-extended = <&pmau0102_i_gpios 8 IRQ_TYPE_LEVEL_LOW>;
+
+		pinctrl-0 = <&usb_pd_int_default>;
+		pinctrl-names = "default";
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		connector@0 {
+			compatible = "usb-c-connector";
+			reg = <0>;
+			label = "USB-C0";
+			power-role = "dual";
+			data-role = "dual";
+			try-power-role = "sink";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					usb_0_con_hs: endpoint {
+						remote-endpoint = <&usb_0_dwc3_hs>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					usb_0_con_ss: endpoint {
+						remote-endpoint = <&usb_0_qmpphy_usb_ss_out>;
+					};
+				};
+			};
+		};
+
+		connector@1 {
+			compatible = "usb-c-connector";
+			reg = <1>;
+			label = "USB-C1";
+			power-role = "dual";
+			data-role = "dual";
+			try-power-role = "sink";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					usb_1_con_hs: endpoint {
+						remote-endpoint = <&usb_1_dwc3_hs>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					usb_1_con_ss: endpoint {
+						remote-endpoint = <&usb_1_qmpphy_usb_ss_out>;
+					};
+				};
+			};
+		};
+	};
+};
+
+&pmau0102_i_gpios {
+	usb_pd_int_default: usb-pd-int-state {
+		pins = "gpio8";
+		function = "normal";
+		input-enable;
+		bias-pull-up;
+		power-source = <0>;
+	};
+};
+
 &qupv3_0 {
 	firmware-name = "qcom/nord/qupv3fw.elf";
 
@@ -440,3 +674,78 @@ &ufs_mem_phy {
 
 	status = "okay";
 };
+
+&usb_0 {
+	status = "okay";
+};
+
+&usb_0_dwc3_hs {
+	remote-endpoint = <&usb_0_con_hs>;
+};
+
+&usb_0_hsphy {
+	vdd-supply = <&vreg_l1h_0p9>;
+	vdda12-supply = <&vreg_l2h_1p2>;
+
+	phys = <&usb0_repeater>;
+
+	status = "okay";
+};
+
+&usb_0_qmpphy {
+	vdda-phy-supply = <&vreg_l2k_0p9>;
+	vdda-pll-supply = <&vreg_l2h_1p2>;
+
+	status = "okay";
+};
+
+&usb_0_qmpphy_usb_ss_out {
+	remote-endpoint = <&usb_0_con_ss>;
+};
+
+&usb_1 {
+	status = "okay";
+};
+
+&usb_1_dwc3_hs {
+	remote-endpoint = <&usb_1_con_hs>;
+};
+
+&usb_1_hsphy {
+	vdd-supply = <&vreg_l1h_0p9>;
+	vdda12-supply = <&vreg_l2h_1p2>;
+
+	phys = <&usb1_repeater>;
+
+	status = "okay";
+};
+
+&usb_1_qmpphy {
+	vdda-phy-supply = <&vreg_l2k_0p9>;
+	vdda-pll-supply = <&vreg_l2h_1p2>;
+
+	status = "okay";
+};
+
+&usb_1_qmpphy_usb_ss_out {
+	remote-endpoint = <&usb_1_con_ss>;
+};
+
+&usb_2 {
+	dr_mode = "host";
+
+	status = "okay";
+};
+
+&usb_2_dwc3_hs {
+	remote-endpoint = <&usb2_con_hs>;
+};
+
+&usb_2_hsphy {
+	vdd-supply = <&vreg_l1h_0p9>;
+	vdda12-supply = <&vreg_l2h_1p2>;
+
+	phys = <&usb2_repeater>;
+
+	status = "okay";
+};

-- 
2.47.3

