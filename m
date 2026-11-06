Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793973331;
	b=h+odecTY9iV4UrJSKbEz2/MSAkoLB2QubLmbfjS4ylXHswJxwdzYFELVlpWkWL+EB+va
	 02KxK3LYRgYx/6eLWYIElvbdXw31QJvHs7LmhWuyh4LKUFqoq46wRe13R9ngAirtubtmm
	 s3tCEqYjV4Tad0Tna9XfGyi/BlM6pdbftcvZlX/HHhtsbxlnqy6v6LJn6am3Fc1EUaQj0
	 am5jSCBdSju3+Etol53D8I2M8JRWhA+CZhAcveE6E6vPdgNf5SMv/fUxsaOADep3RhpZA
	 vcq22WpvB0LEjJ/j5agQEeUN7UmPCSt3glv7EYtwQMTHFYPdgl2AKbn5h7eABb16Sxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793973331;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=yQgJsfAJIwc1P3YmgjY5JtZQxBkIW43VtHK4ofExmak=;
	b=IsqO3ydsYeQCAdfetGbY7OhpnMa+gLZi95VEzzUxDdYRkkj+pQhElvpoNcDfrKqdQLHi
	 fNJ1yUUGJocHeMhH0PjxzUbtlub1UmXsLsR3/UfBNUrG5poFAjpxBcLPzxf4OcVfayL8E
	 GGCsbiQPA7pNGFaJCGJbXiBIMoVgEMizqI8qbGKWdE11Z7m9djV/7cLNgbJ2vtKyDo8Vu
	 JHJ1Lp2OQ762R6OKthEVKDNN5x2DW7nx+FzgmpFiDex1//eL0PzPUThHMOVPIId6Sn/Z8
	 Kz68qAql5ySaNnC/XDh1XeThZQOxp9/tJ1zfRGw6/dua8XGbkkyoKg/4YEkXAazz7gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="TyR/YEPk";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kGFcS52A;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CB36606D831
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Nov 2026 13:55:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CB36606D831
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TyR/YEPk;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kGFcS52A
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6Do4P03173606
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Nov 2026 13:55:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yQgJsfAJIwc1P3YmgjY5JtZQxBkIW43VtHK4ofExmak=; b=TyR/YEPkABFsBr+u
	aYp+YS+zHOEzOqBrFp4xlfFnX26NdZV+QDRcY37O8XhvmSWSvl7PVp2ZkCHkvFFA
	dTG6galMukQhos82vKXl9KscbZWvr9hrXXE624QMJGBzIYzvWQYQp3929hI7xrdX
	78UKsZmSx6o5uL6km85urCeQpnUPMp21inEyNP9cWyzDmMICwADxPoE4rMz3dPZC
	Z5qeJBuZwA04kdC+PDte4Nd7QJmMcmTEwt2w1nyUvDSMZ9HUcxFv2OY6Ra7TuTgS
	Dp5o5RiukhKvhBU0GIVp0bo0J7gWhBSU2cDMbf8LzXrSaG6fnB0xpU3ydHkdkccN
	1gWkKg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p9b36e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 13:55:30 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7cc06b9ca9eso165556137.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 05:55:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793973330; x=1794578130; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yQgJsfAJIwc1P3YmgjY5JtZQxBkIW43VtHK4ofExmak=;
        b=kGFcS52A5/ZURsI0i1bYzDCWqq4AB6l03GptD0yz7HdiSAT+ejj86XUGdePOUM8MGt
         FGXQaYAro48+EwmTPhb2Fci1TAsc7/5VO9YKiQFngfIlcS8Ldf1bV6P0p4xadEb2rwQm
         nqi4rqE1SBz0ncUnUSw2TK4KEKhrev9LiSyHOinbr41dwq0lpIfdjaAPsoxhx7J3z/9x
         yIAXxQl9lDRo6g+liZHmi1XMUoa9TArcQiMy99E/rUn6X16O1qlCejSSdCo+t9JGw6U/
         sRWklFCoFT1MFK0QmiFSyXWL9MHK8kMdxD/qschYlPF8t7E85wExaxPyBHSmEtnSMUgb
         EcSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793973330; x=1794578130;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yQgJsfAJIwc1P3YmgjY5JtZQxBkIW43VtHK4ofExmak=;
        b=UD/17rVUIeKYF48T0ummlo8faXmTQmAyofruN7B0sdqZI4jY5iJ/XILF3Nb7+BJ6DT
         NNlIrw532aw8ZK6svUKfJal8gG4La/vTcG0Vw1MLBQTlCXSPAn/fHiBxUYJWO4TPUu2f
         DOUujzyRXksamczaOYiWPTLZTCzErbkqUh6ELemB8G8ign79mmmj5k0RKlvZLPIp1/3y
         sFyZdmG+jRhqZk+S6xngQVMgxB8KJPkiHqITb4vfLkJw2963Uh66HRtPO/QZm6e9LXbg
         mawGJwJ0wK4FZjpTJmy2HbZkGdNzEvdOkEqTOghkRJNY2k+wwiCdKqEGo/G1XcCBS3QQ
         EUtw==
X-Forwarded-Encrypted: i=1; AKwUvBwy/usbQyKIUCB6xCignD7dNt6ee38NI6cDj7LEc6npHRBk9fkk/nybwOKNXv6+cx2M4moCf3K00MdcIq5Z@vger.kernel.org
X-Gm-Message-State: APuU4Z8gqz4KPTEQo/AKEKAY/IVl6uMtwWcstZyJ0g5sZBVGtN26RF85
	H+waxp2bz/twU1zoGf2rm5n71q/3pW1eajZ+UD3F2QmT6qa3hDEvZwxJQx0TqL6E60rV3lVvQ6s
	aC7BJfz4Z6j7WWd+t4vr73ix6av8djK74O2osooqO7/c/4jLpG/Asd5EnFL7PEBc6fZ/D
X-Gm-Gg: AYBFou0wrfX14JAAgZ8xyTrbpp57b3agRGrVQ3hVnaxIcQcjm3zPoNhL3GMtb9NJ6iq
	nplDnLAJaIj0RXtQ0K4skIpUeDLlcLoJ/GPuJmXU0YmIKMXcg7FV79hiEsDO0zsbfjw1bth65pi
	B4qB8jkLMECFDly4ZF2ArMDopEDGsdbfmG9zBK0TCg1akbOhSXCk3UgBBTfD9vOrs4H0rhv+1Kl
	CuosFs7Cpl3dWEaUq4+NOjfwRp1BugOnsDb1XR95vMkAoI/dYizMZSzO/gHMI15IAbkdFNZ3gXA
	358GZnXQgEgOsmHeHtHMIo3txMZXrTsgQYsIRBOj0mQDcjwbqXm2nNNid6x2emA59OKYzPW8/9o
	foqH0AsIA1zoG70QsdSD6+g6oPyeDknnDul3/ja2gI5VFosu7twN3wSHSOSfGW+eYcc6qGIO4vF
	9RCQkGR+mVAUfWFEF55Hsm7Phnzr4KHg0ouehYV28csLnLMfZaSlTen2skFwJZFYQHJTxUi18Qy
	k7UvECOw/3+xvZy68JPiLDQGYM9
X-Received: by 2002:a05:6102:390e:b0:7d2:7dcd:7c99 with SMTP id ada2fe7eead31-7d2a152a24cmr1200749137.7.1793973329577;
        Fri, 06 Nov 2026 05:55:29 -0800 (PST)
X-Received: by 2002:a05:6102:390e:b0:7d2:7dcd:7c99 with SMTP id ada2fe7eead31-7d2a152a24cmr1200734137.7.1793973329028;
        Fri, 06 Nov 2026 05:55:29 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:f048:3e89:c517:10cd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d809df2dsm3963256f8f.51.2026.11.06.05.55.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 05:55:27 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 14:55:18 +0100
Subject: [PATCH v14 2/9] dt-bindings: media: qcom: Add CAMSS Offline
 Processing Engine (OPE)
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
Message-Id: <20261106-camss-isp-ope-v14-2-49c426cd2715@oss.qualcomm.com>
References: <20261106-camss-isp-ope-v14-0-49c426cd2715@oss.qualcomm.com>
In-Reply-To: <20261106-camss-isp-ope-v14-0-49c426cd2715@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: BrqMwebL3IQvQxAbOHDMR4F7flyYcPJW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA1NSBTYWx0ZWRfXxts9kAiKlxTQ
 Zn02ziLcmhLhPqHTKVIyaanPJFD9vCkYAWH9v5ILRimzwCNma4EMD61Ip3n2Udj+2IJMaKImVgR
 5oHkw3gtbfSw3mXMURDLq/YOqYef4fs/y8neRowM/P4m0VGCk/NuKFM+szaiHJVOIUSYA667Te2
 hIXpk2jE4kF18dX0Zs7k+bRSKskN78ID+St/7xl5xNdSFrUYvR1zeD3xABjKhcp8XE4Ckr9nbv7
 eygomc+aWTfwo2bWprAE2LJaRf6068lLOeNLlFH2NnUBqV7vEJMBi5VRkI1vsJ/fkwhjqtbBvOM
 /TurKYLXzENDUx/IZvhlUF4bmBDOWwlhYnX1RU7jRPyL/EJ3up1wqNmxpd4TTeT/4rehdVIoP+w
 r7d3LPGH/13tZlaNe1Yzj/XJoLZcaXTW7jg0f19oLhmceCfEpn6oIYmmzn/haRaqG65qBbko1q2
 VLQTl55lix9dH/Xb4Fw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA1NSBTYWx0ZWRfX4yDHKKAORA2Y
 ZkIeLF7Caz0gm8zmWq+9UK3lbRXOk5J2ZqIbXi9RtgQNfWu/dDmbVWDQafE3iQYZhSA6KqGQXDa
 iZAnbfNLhHV/dTuWMHRDC823gogj7oA=
X-Authority-Analysis: v=2.4 cv=WMzqzXsR c=1 sm=1 tr=0 ts=6aeddc52 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=l64rWm3OqFMOLA4dSg0A:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: BrqMwebL3IQvQxAbOHDMR4F7flyYcPJW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060055

Add Devicetree binding documentation for the Qualcomm Camera Subsystem
Offline Processing Engine (OPE) found on platforms such as Agatti.
The OPE is a memory-to-memory image processing block which operates
on frames read from and written back to system memory.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 .../bindings/media/qcom,qcm2290-camss-ope.yaml     | 151 +++++++++++++++++++++
 1 file changed, 151 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..f9c31bc88e94b028c241060bbd8e56e0bdc49af5
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml
@@ -0,0 +1,151 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,qcm2290-camss-ope.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Camera Subsystem Offline Processing Engine
+
+maintainers:
+  - Loic Poulain <loic.poulain@oss.qualcomm.com>
+
+description:
+  The Qualcomm Camera Subsystem (CAMSS) Offline Processing Engine (OPE)
+  is a memory-to-memory image processing block. It supports a range of
+  pixel-processing operations such as scaling, cropping, gain adjustments,
+  white-balancing, and various format conversions. The OPE does not
+  interface directly with image sensors, instead, it processes frames
+  sourced from and written back to system memory.
+
+properties:
+  compatible:
+    const: qcom,qcm2290-camss-ope
+
+  reg:
+    maxItems: 6
+
+  reg-names:
+    items:
+      - const: cdm
+      - const: top
+      - const: qos
+      - const: pipeline
+      - const: bus_read
+      - const: bus_write
+
+  clocks:
+    maxItems: 5
+
+  clock-names:
+    items:
+      - const: axi
+      - const: core
+      - const: iface
+      - const: nrt
+      - const: top
+
+  interrupts:
+    maxItems: 1
+
+  interconnects:
+    maxItems: 2
+
+  interconnect-names:
+    items:
+      - const: config
+      - const: data
+
+  iommus:
+    items:
+      - description: OPE CDM (Configuration DMA) port.
+      - description: OPE read (fetch engine) port.
+      - description: OPE write (write engine) port.
+
+  operating-points-v2: true
+
+  opp-table:
+    type: object
+
+  power-domains:
+    items:
+      - description: GDSC CAMSS Block, Global Distributed Switch Controller.
+      - description: CX power domain.
+
+  power-domain-names:
+    items:
+      - const: camss
+      - const: cx
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+  - interrupts
+  - interconnects
+  - interconnect-names
+  - iommus
+  - power-domains
+  - power-domain-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,gcc-qcm2290.h>
+    #include <dt-bindings/interconnect/qcom,qcm2290.h>
+    #include <dt-bindings/interconnect/qcom,rpm-icc.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+
+    camss_ope: isp@5c42000 {
+        compatible = "qcom,qcm2290-camss-ope";
+
+        reg = <0x5c42000 0x400>,
+              <0x5c42400 0x200>,
+              <0x5c42600 0x200>,
+              <0x5c42800 0x4400>,
+              <0x5c46c00 0x190>,
+              <0x5c46d90 0xa00>;
+        reg-names = "cdm", "top", "qos", "pipeline",
+                    "bus_read", "bus_write";
+
+        clocks = <&gcc GCC_CAMSS_AXI_CLK>,
+                 <&gcc GCC_CAMSS_OPE_CLK>,
+                 <&gcc GCC_CAMSS_OPE_AHB_CLK>,
+                 <&gcc GCC_CAMSS_NRT_AXI_CLK>,
+                 <&gcc GCC_CAMSS_TOP_AHB_CLK>;
+        clock-names = "axi", "core", "iface", "nrt", "top";
+
+        interrupts = <GIC_SPI 209 IRQ_TYPE_EDGE_RISING>;
+
+        interconnects = <&bimc MASTER_APPSS_PROC RPM_ACTIVE_TAG
+                         &config_noc SLAVE_CAMERA_CFG RPM_ACTIVE_TAG>,
+                        <&mmnrt_virt MASTER_CAMNOC_SF RPM_ALWAYS_TAG
+                         &bimc SLAVE_EBI1 RPM_ALWAYS_TAG>;
+        interconnect-names = "config", "data";
+
+        iommus = <&apps_smmu 0x800 0x0>,
+                 <&apps_smmu 0x820 0x0>,
+                 <&apps_smmu 0x840 0x0>;
+
+        operating-points-v2 = <&ope_opp_table>;
+        power-domains = <&gcc GCC_CAMSS_TOP_GDSC>,
+                         <&rpmpd QCM2290_VDDCX>;
+        power-domain-names = "camss", "cx";
+
+        ope_opp_table: opp-table {
+            compatible = "operating-points-v2";
+
+            opp-200000000 {
+                opp-hz = /bits/ 64 <200000000>;
+                required-opps = <&rpmpd_opp_svs>;
+            };
+
+            opp-465000000 {
+                opp-hz = /bits/ 64 <465000000>;
+                required-opps = <&rpmpd_opp_nom>;
+            };
+        };
+    };

-- 
2.34.1

