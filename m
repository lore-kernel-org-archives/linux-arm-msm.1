Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794328757;
	b=GAMX7lUcX670Np4zI0P6khelgNx0rb8We4pt4wo6B3u/mw8+d+/J4uL6t51xOT9qaY80
	 e8N7bzTCApDIclj7lQQzwo2LG1TYc3bJcNWUD90It9ykzsZ4CLCiuFKTQT+Xs4x/27npE
	 7iuqK1aphk5KZVMPe4UAhVdJ/rABnR+z+MtTcvl7sXxVvjuL4POkc/SDYHwZiVhFX+100
	 JnK97aOfWog4H3onfeZwOTFdT9UEvhFlwUepKru0aDiBJU1ZKx37aNmcKfcuUi3G1IPFS
	 7S9RH6C630mRmvIiHIi/KsSK1Y1P7jncj2q1o1ftvq9mJaHRGDWapSf4AI0sfit6Bcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794328757;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=OTjfUEF9zyB1Q8Kt5+iO1eJKEqpeo7nin/wiuk4q+7Q=;
	b=CEHcfs2AVnth+ivHJDTaDQiihvh5BYMCa5VkfpgUsI8+8MMSLeV+LqHm2sPujCQmXUem
	 cdxDspnWWNcCwZ53x9crkC3Aqa5z82izffymMSogqCOYr8LWvUyDiFPStpnPadkgNJrYs
	 B28GgbsrGkmR/JIjJaWK9Nw1XUpiAI0tWdutgM0m7wMNbKCipL+YMOCUeIrCCN6TXKetV
	 Cv7VnmHSNILsUUNvAOvCHyYp1m7O2YYso1M9K0AI0gGIp2TREqKZEDgu6b5dv14VPgFbs
	 zo65qWurNWOyDzeAEoZz2BP0JVU6IrYniv5Btw2M5uaquuzR7sSVAHZxDYRO3zuQvlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LdG1wONl;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bDOzzW3Y;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CBAC606A230
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 16:39:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0CBAC606A230
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LdG1wONl;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bDOzzW3Y
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAF0XJQ3725834
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 16:39:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=OTjfUEF9zyB
	1Q8Kt5+iO1eJKEqpeo7nin/wiuk4q+7Q=; b=LdG1wONloFJ3yDPFOfHzrDhmiPP
	x0mOVAulupDhxkhMim1C2ueTSZbASbj/7Z3AA3U/yBMK3iXJexUVhDE2PBEM/YUg
	32lKZzziSPzUQldzoy0lwtdjkSbdgFH4sdKzVDZIwiyIqYuyob3uGJbGaMns5iyQ
	lzyhScHJJrOPB6ahoE9rXIMwJfULZbXT5dMqd5YtfjognIA4f/vCUqznq4pjKdMm
	vwNHlKKXJsnG7x91hL8TzZWSqV5rCwwWiAVnVBOCczH/HJDWyCp6AZTgXOPCsyg3
	fmdaM8SVEg+DYr7ViUgTVfCPil8AyaMAfVlQetFZ8vw97KceSNK6KgEfMwA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huy5d9xvr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 16:39:16 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7d2dd8c5aeeso423072137.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 08:39:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794328755; x=1794933555; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OTjfUEF9zyB1Q8Kt5+iO1eJKEqpeo7nin/wiuk4q+7Q=;
        b=bDOzzW3YqodKZb/51Nn8mDdDpIP0CRjEYSKscVJZ/HrnPlMWqSfzRxGgBP0beIDHki
         ZmV79PNBx6twmC15MsuX54brrVBA/3c/mdlN2TZnjK9AQaf8vSCc6rzt2ldxs9UiJjjv
         9a0d3GUZ/ciUutk/7tJZyUEK5LLaHTTDCa72MTBKUp1ZGOVeKUOTPyNJWFSYDjJLSh3u
         tdBVjbBfkhbt6A7Qg7RUhYpjru4YTZZJ8vivZmzadf5sSjBQVjaQRS8uWHCtJH9JtAHk
         idQcRuSqla2nhiQVHOGGOB6lhRKCvPb+r544zXG8sDUA4GUD+EQ0bj/+rj9GF1274vAp
         65Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794328755; x=1794933555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OTjfUEF9zyB1Q8Kt5+iO1eJKEqpeo7nin/wiuk4q+7Q=;
        b=dCLPFOIn7z4Gmvg1/FcUtPmFo4PE6MJ9ZFBSzA7o00LaGw36Ju5TNTCM6rPZZrBCwW
         gVnhmvFhn5jGZzOw7PQuRbZtyGf2tPeMGsm7R4priqIHkwfMH+zejnuszSjW90Yex+FU
         Ep3gskprF5dpXNFDkpBV2rwbPT2mECADSkATn+eRO+Nrd9vj90MPBwM+LOcSx1Gahimi
         l54m43fGFaBHdlbE/W4oPZCv5nk8ybxIPnOtiyrZuO5JNzWTRNQ3m9YTAIhZtprA8BSm
         XypGs3iXVLJCwvS40+hfA1oMl1IWb8V1NZct8eGjeGtnk8fWt7ZS/WwATM90Pi5FpSfN
         3kug==
X-Forwarded-Encrypted: i=1; AL+hErEhF7bF50A+7qZSAUI1zCEqgpjibMX7SWzFwl9GS1MMjYJCEiRgm/dIwRfmiiLj+PC3zMS2C27K5KkaDZ0v@vger.kernel.org
X-Gm-Message-State: APuU4Z/FnmfS7q1VxXdMyP61yge96qAnYbdpJ1PZNsnaiLPfRSu/0v29
	HtEEapXDGQY0weN0nZ62O6w0fG7cIPxktzSNCEvmrdBFebRkHSv+BcqZLC1LsdYs5i7jr7eGJvI
	UEed/AKJkXPllZdb6wLBwKQUpACwjhyh4wfbrmjvTECIZCnTqo8BOKY0squi2YJkcC1dt
X-Gm-Gg: AYBFou0R0uI20o/nPubu/ZFREpF7uu7cn14WcxAydNQchpfp+2w2j+CFeikiaBpU/A+
	zXGTIJUsBGafeMUe/kuj8JMfuhq6AN+d0NDgToiQFBkDVZfh4iheDj+jTKpQ9rjJRA6bWpSiCbR
	f1cpEb/gFBkeveUlJWz15PiGhn70To1NuJEkS/oeldodQEolpSF4uGOD19aG0fhpoJBLf+OE/8M
	jlLFXxSz86SlL7zSTjtL7d9JU/6I1JGU83jzdHCrOglFw8XZsBxyKYkPVHcEbheh3/1xVm86fUI
	cwjqEfmvbDdY2j21fD9T/gbgbbyhZI/ZphAxO2rzxQEuR9qYG+7zMEmOkLlyJUZl8Ch+MxtsRvj
	IvBntm76u1u06NUvbaJVKUB4PVRKVCyEQKqk8k/wUj3y+uB1+GCGehnlq5Q35sZgnsRmb7QfrYA
	==
X-Received: by 2002:a05:6102:6ce:b0:7d0:9587:1b99 with SMTP id ada2fe7eead31-7d301974dfbmr1202049137.0.1794328754801;
        Tue, 10 Nov 2026 08:39:14 -0800 (PST)
X-Received: by 2002:a05:6102:6ce:b0:7d0:9587:1b99 with SMTP id ada2fe7eead31-7d301974dfbmr1202039137.0.1794328754273;
        Tue, 10 Nov 2026 08:39:14 -0800 (PST)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01ff3428sm85130395e9.15.2026.11.10.08.39.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 08:39:13 -0800 (PST)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: linux-media@vger.kernel.org
Cc: bod@kernel.org, mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        loic.poulain@linaro.org, dmitry.baryshkov@oss.qualcomm.com,
        gjorgji.rosikopulos@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        atanas.filipov@oss.qualcomm.com
Subject: [PATCH v8 1/8] dt-bindings: media: qcom: Add JPEG encoder binding
Date: Tue, 10 Nov 2026 18:39:02 +0200
Message-Id: <20261110163909.78085-2-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261110163909.78085-1-atanas.filipov@oss.qualcomm.com>
References: <20261110163909.78085-1-atanas.filipov@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Hz862Ol_R39cYLZ2P2Qg2SJswqJ0dA02
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA2NiBTYWx0ZWRfX6HbgRhYMMkUQ
 k5CG2uBmp1P87EFM8VnQEbB/pH9K26KJUfnUb05gdZtXlmDXmB1wvt9HXBj9/xL6l0VdLBNWABT
 huY63lyWHtVgJ2p9Xp+A0FiQoHX8iIo=
X-Authority-Analysis: v=2.4 cv=d+9gWhjE c=1 sm=1 tr=0 ts=6af348b4 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=2iIih-OIPD95PTVVQyMA:9 a=-aSRE8QhW-JAV6biHavz:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: Hz862Ol_R39cYLZ2P2Qg2SJswqJ0dA02
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA2NiBTYWx0ZWRfX+SPU3T0Zb3gq
 ChH18q0LTB8iZdPgtgyXgap0+UIewwChiEGordK08n6CYpgy2yb4vk1AbltE3/eE1a/QJXQOMBY
 w84idgKckT4TeXZmsj4g77kB+0TWj9bmLp8i7VfoEM1bNpRIgSkQ37mh8V8GzoyNNSs29rkGoti
 P+uP5SUeBRRFFtDZ93Ik/sUqpCDXZ0HtyQXQok1KJg0zDB7UgQQ9h8oKPgAsizyGtHNWKh2zTtn
 KZcMPC7C4uWgdVCbYjJlPmnaf2MT4d5FUzQivVFwMYnzuyjSRaPYHu7LT/PnyakU1bxnEG3pFu1
 E5B3z4Jzv3uanLDSXkVVbTljkZu0y3Mk3mx+RwdiTCd0H9WwSSLDHYKY/FhcmrDTwDmoqnPZriP
 D8GSkFVdDxGGTg98SpoHbUIXQt8vzGkkhPtUHgr37lk5nKBYQd/AaPTFXaAOQIqa2wqdV6fZKP6
 cMhhi2j/gSgsMFB4nVg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100066

Add device-tree binding for the Qualcomm JPEG encoder hardware block
present in SM8250 (Kona) and SC7280 (Kodiak) SoCs.

The JPEG encoder is a standalone hardware IP within the camera subsystem
that performs JPEG compression in memory-to-memory fashion.  It is
separate from the CAMSS ISP pipeline and has its own register space,
interrupt, clocks, power domains, IOMMU stream, and interconnect path.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 .../bindings/media/qcom,sm8250-jpeg-enc.yaml  | 190 ++++++++++++++++++
 1 file changed, 190 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,sm8250-jpeg-enc.yaml

diff --git a/Documentation/devicetree/bindings/media/qcom,sm8250-jpeg-enc.yaml b/Documentation/devicetree/bindings/media/qcom,sm8250-jpeg-enc.yaml
new file mode 100644
index 0000000000000..112580f3df10b
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,sm8250-jpeg-enc.yaml
@@ -0,0 +1,190 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,sm8250-jpeg-enc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm JPEG Encoder
+
+maintainers:
+  - Atanas Filipov <atanas.filipov@oss.qualcomm.com>
+
+description:
+  Qualcomm JPEG Encoder is the JPEG encode hardware present in Qualcomm SoCs.
+  The encoder is a standalone hardware IP within the camera subsystem that
+  performs JPEG compression in memory-to-memory fashion.
+
+properties:
+  compatible:
+    enum:
+      - qcom,sc7280-jpeg-enc
+      - qcom,sm8250-jpeg-enc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 5
+
+  clock-names:
+    items:
+      - const: core
+      - const: bus
+      - const: config
+      - const: cpas
+      - const: camnoc_axi
+
+  power-domains:
+    minItems: 2
+    maxItems: 3
+
+  power-domain-names:
+    minItems: 2
+    maxItems: 3
+
+  interconnects:
+    maxItems: 1
+
+  interconnect-names:
+    items:
+      - const: camnoc
+
+  iommus:
+    description:
+      SMMU stream ID for the JPEG hardware.
+    maxItems: 1
+
+  operating-points-v2: true
+
+  opp-table:
+    type: object
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+  - power-domains
+  - power-domain-names
+  - interconnects
+  - interconnect-names
+  - iommus
+  - operating-points-v2
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,sc7280-jpeg-enc
+    then:
+      properties:
+        power-domains:
+          items:
+            - description: Titan top GDSC
+            - description: CX power domain
+        power-domain-names:
+          items:
+            - const: titan_top
+            - const: cx
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,sm8250-jpeg-enc
+    then:
+      properties:
+        power-domains:
+          items:
+            - description: Titan top GDSC
+            - description: MX power domain
+            - description: MMCX power domain
+        power-domain-names:
+          items:
+            - const: titan_top
+            - const: mx
+            - const: mmcx
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,camcc-sm8250.h>
+    #include <dt-bindings/clock/qcom,gcc-sm8250.h>
+    #include <dt-bindings/interconnect/qcom,sm8250.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+
+    jpeg-encoder@ac53000 {
+        compatible = "qcom,sm8250-jpeg-enc";
+        reg = <0x0ac53000 0x1000>;
+
+        interrupts = <GIC_SPI 474 IRQ_TYPE_EDGE_RISING>;
+
+        power-domains = <&camcc TITAN_TOP_GDSC>,
+                        <&rpmhpd RPMHPD_MX>,
+                        <&rpmhpd RPMHPD_MMCX>;
+        power-domain-names = "titan_top", "mx", "mmcx";
+
+        clocks = <&camcc CAM_CC_JPEG_CLK>,
+                 <&gcc GCC_CAMERA_SF_AXI_CLK>,
+                 <&camcc CAM_CC_CORE_AHB_CLK>,
+                 <&camcc CAM_CC_CPAS_AHB_CLK>,
+                 <&camcc CAM_CC_CAMNOC_AXI_CLK>;
+        clock-names = "core",
+                      "bus",
+                      "config",
+                      "cpas",
+                      "camnoc_axi";
+
+        interconnects = <&mmss_noc MASTER_CAMNOC_SF 0 &mc_virt SLAVE_EBI_CH0 0>;
+        interconnect-names = "camnoc";
+
+        iommus = <&apps_smmu 0x2040 0x400>;
+
+        operating-points-v2 = <&jpeg_opp_table>;
+
+        jpeg_opp_table: opp-table {
+            compatible = "operating-points-v2";
+
+            opp-100000000 {
+                opp-hz = /bits/ 64 <100000000>;
+                opp-peak-kBps = <262560>;
+                required-opps = <&rpmhpd_opp_svs_l1>,
+                                <&rpmhpd_opp_low_svs>;
+            };
+
+            opp-200000000 {
+                opp-hz = /bits/ 64 <200000000>;
+                opp-peak-kBps = <524760>;
+                required-opps = <&rpmhpd_opp_svs_l1>,
+                                <&rpmhpd_opp_svs>;
+            };
+
+            opp-400000000 {
+                opp-hz = /bits/ 64 <400000000>;
+                opp-peak-kBps = <978600>;
+                required-opps = <&rpmhpd_opp_svs_l1>,
+                                <&rpmhpd_opp_svs_l1>;
+            };
+
+            opp-480000000 {
+                opp-hz = /bits/ 64 <480000000>;
+                opp-peak-kBps = <1095600>;
+                required-opps = <&rpmhpd_opp_svs_l1>,
+                                <&rpmhpd_opp_nom>;
+            };
+
+            opp-600000000 {
+                opp-hz = /bits/ 64 <600000000>;
+                opp-peak-kBps = <1095600>;
+                required-opps = <&rpmhpd_opp_svs_l1>,
+                                <&rpmhpd_opp_turbo>;
+            };
+        };
+    };
-- 
2.34.1

