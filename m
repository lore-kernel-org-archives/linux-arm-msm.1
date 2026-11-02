Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793628260;
	b=PTpBLa6xpPzp04/EN49HAW4CUWvdTMmryxsI1xnlHIAk5nS03M+3FsdgCovc/ASblIm7
	 RGHRjFPwy27j9YXcOEilWPRoG5pD0n03zWCoDj4SZCLSDwBCNDlHTDPF+sX3/bSq9rY69
	 yzBNM5mGtRld2nX8DYWSlQRtgZuO0JsAOzeoxhoqUVxOMUYmsRuYg7nsOdmK8Wc80Y8Oi
	 fVb/wM25YgVjzKz7nNbbHDlV1U1kdpViWQMiM5m6PG3yHrsGSs0Ka3OBLi7ZIjYH/5BuH
	 1ISNXBe5l8PCaPpuqX1IoIWF5GJlbithLVziVme10zyXVHgOnBPALvtet39JrYh792A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793628260;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Dag14m3h5gt5hwrihR8wyiBARY23IaTWQ9lhSc65Xxg=;
	b=T8AAtS2SaYQ1qgdzSnlRwGVInLQ1Vl3A4DgjkE2kv6ACZ/3I5Q/wFH0U6vWd7pA8CuB7
	 8sPSjNLqUV7FYwy/AN7ugDzZ/Z/dRBV/hGfB75TT+0ak3OWpKfluphtrCQ7oU/urXV3hV
	 fgHEy2epjJbAbZa+G1ObnuMoQsXwjE2p3YGZhXYp/9Kf1kXzCP5hNMx5aaLE6x5RbhVj6
	 8UeM15UNkNL8IEfNbWYsmx/Nnq05qjqICSgrD9gHasJcuwBc9ElsyYyYR0Nl6BkoZ8OuD
	 TbRr04bMxGJBldIRdl7RYezRtvULGMEM8FxtpK4XZ7Qq2GjX+fTLtmUVBxPl+HTEY2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=temperror header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AmGnfcRi;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=h5Fhq+O0;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE43E606A33F
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 14:04:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE43E606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AmGnfcRi;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=h5Fhq+O0
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DpLqo2991846
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 14:04:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Dag14m3h5gt5hwrihR8wyiBARY23IaTWQ9lhSc65Xxg=; b=AmGnfcRidw1WtTb2
	/QPiyYNMjZPVGchsRWQhON4B9Pv3fhbtVlN7nwekiFs5KCThHj8jidECAxqnQjnT
	rV/ttEOryTo4DSdlAnDPHqyk726P9FAYQShHoqpKV8w+zn1geS/zUCi0w8APOG0G
	EyapIi8V9k+WrPCSl3vvZjQe0qVL3oo1EQUsd6084zPRsiG/QJtBPj0Z8Tr6E1Tv
	nfyAcJpwV289YSFhWrxB6a9rYLLGIfW9YEC8TVmj7iacdc6IsZF8TlnfTggPEZXA
	trcPOQb9qn9gRRc7ma6ImIYjUHyeRpICYf6F6eA8BcZnod7jPwdkHwjnN2x3gwHS
	aJ2aLw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpsavgmrr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 14:04:13 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cd61bdc8683so1544288a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 06:04:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793628253; x=1794233053; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Dag14m3h5gt5hwrihR8wyiBARY23IaTWQ9lhSc65Xxg=;
        b=h5Fhq+O0nmVqsh8r49wrS+6DVjKb+A1/jVQjWgGoZ/kLEF6B2X/VcikKCxDGEfSiXS
         YmN8AbPqYpqI1FfQF0mwE0dz7g68kVtCMg2dsxok3mMsQpjOyYij8+LpQ2Q1w/yygR+S
         eCsti2l3fNXMG6DF9uK7Y//3Lx0AevpT/9vvcTuLvivTnhDCkj+V1rIKFAjQFn94ZODJ
         dGZntVGti9f8GdkaMXL17YNPW25rNC0JbPbXqFbqTdul54owUspqTU7ylekdoOydxanj
         107YrtNLAJKudksjxx5rTxBNtNI3VhUX2XfgcITwZoJ4VB0FwMIrm1CJp9zDtDdFYXSX
         aetA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793628253; x=1794233053;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dag14m3h5gt5hwrihR8wyiBARY23IaTWQ9lhSc65Xxg=;
        b=14+KlUJwX0jb1eA792VxCoVB/NWFvl/RHV7JPtTqjAPs4ydb8rOKCuiPAG+KPyJsAz
         0pRlaR83twlt4d4tS4ZDkvaXFma1dJ+3XnigMQiO/nZamOcgfI2Msy0l/tqGTtMc6FnJ
         DRctfGGhUL6J4TQ/s6HcpdA025bKa1lxPFyteg7rB49gLMv8qf2pNY4qGcGtyNbJc+28
         CO8Lmz56lLnHagG+/QxzuoZiyFsvbYD+rqLALQLDaTAbTSdVy0NhzuBTT+9xNNEwhsOs
         fjwurYSAYDHEEiOalD8uzEWgSuM4TC5F9Wa6L4F2ZEllNwL1BrAgoghMjstQbPTfdc6B
         mGvw==
X-Gm-Message-State: AFq9FYLL2/ZiUTgztQWu8dTLXJfIyqhc/CGg2pBfjjjteP3Ogg7jt23l
	LSEy7YvMeyCHOxt1FNFD7Qyy9GSbl5MS4wFlc9oNsA4crF8TtOcQs+0oo50zH9UfllnQRuGersx
	mB/8kD/atxVVtPf1kkO0oaNchITvNp/WwCD8woe1yy9iIm/rsLWnt91VYLw8V4qtk7K59ctkTZe
	np
X-Gm-Gg: AYBFou18/sm8H9WtgA8S/I/yb5lzZ+WhPdYKBor773kJXE8hGrDA6xTjoryZsqldKUu
	lYFU/gtwjmmj4LFDp8Tm1qADLpaeW52rbPT3qBQFb71QTvPa8ButdcH049S4RkTD4WQ2jFylCSG
	ZNGtm1NwdsJhUGck4+dWnKOhE91PoHrmTmqdUmhwxTtntdiQGqyjSiKMihfvwPexutaGUPMRWH8
	9bY95h/9LIhfCVeV1qfajzh5InFEmZGisrrQQOcYAOgJUhfLGoBi9SfdRk5UrgoE5PCYzh+88yP
	ge0RzUBpS4JkImDGNuiWol1hPk3JW++LAl9OakPuFSQB7XNfMYEDNNHAUHd1/yiZ3Bk8f9xljWK
	rYXlQ41IcpZyJJb62Y4q/Rre13syYC/EQrkOg5wFoRFrFPjIMnQ/3BKBI2AuqqXqu3c/i9skfK0
	U=
X-Received: by 2002:a05:6a21:496:b0:3e1:7249:e265 with SMTP id adf61e73a8af0-3e928d46829mr7631104637.27.1793628252660;
        Mon, 02 Nov 2026 06:04:12 -0800 (PST)
X-Received: by 2002:a05:6a21:496:b0:3e1:7249:e265 with SMTP id adf61e73a8af0-3e928d46829mr7631011637.27.1793628251158;
        Mon, 02 Nov 2026 06:04:11 -0800 (PST)
Received: from hu-ahari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8aad77fd956sm2286942b3a.3.2026.11.02.06.04.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 06:04:10 -0800 (PST)
From: Anjana Hari <anjana.hari@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 19:33:41 +0530
Subject: [PATCH 1/2] dt-bindings: mmc: sdhci-msm: Document bindings for
 Nord SDCC
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
Message-Id: <20261102-sdcc_scmi-v1-1-244dbd893051@oss.qualcomm.com>
References: <20261102-sdcc_scmi-v1-0-244dbd893051@oss.qualcomm.com>
In-Reply-To: <20261102-sdcc_scmi-v1-0-244dbd893051@oss.qualcomm.com>
To: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Anjana Hari <anjana.hari@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shazad Hussain <shazad.hussain@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Ram Gupta <ram.gupta@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1NSBTYWx0ZWRfX2Y+dXIRqEDd0
 qtIpKmbIMFJAKAc5ctrp8mCDLGmVYZJPRAH2BjxG8WYC/hOH+Mxyhv7eLi1U0JDW+xe2G5UXexU
 aGD42fZA+riGSWmaKI4GF91ZpF/ZhEH2/TNrRmN0/chrKAU+KjHyym1W1aYE8lEp/UgvbG2LUbI
 fB6Swt5EB2sRXKCjiItnecV5TxNIyc1Psbc3xoz7Aqb6VZJ7BxRcoupHPP9EVukRx7sDYIMI4uJ
 xEYsr3/+lEeVpaUj/zLcFq52l8mf74XmuqQUR2itRPoH528yHXrtwNszk21YwjO2VxNl0BKQmOe
 NCU6FQknT0EZFbUD2zQ5FDx3A7z+AM0WDalXpnvsvm6OIOh8rebMjAk7WHe+NKsNKMUYhEHyFrB
 ASYrdvw/3CJKf1+W1AQ4OTvmgRUKzm0p1vXK32aqLgpYVV27WCW/rEfqGzod76lsD16cKpkJA8U
 U2IHQxJYqn1IyM/ifxg==
X-Proofpoint-GUID: fnfZkhA_-TB-g8pstvNhsAkVFzmCuWKA
X-Authority-Analysis: v=2.4 cv=FZmiV5+6 c=1 sm=1 tr=0 ts=6ae8985d cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=o3jdfBYt8dMtDUvNEAUA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1NSBTYWx0ZWRfX1lHN0BLPrHEP
 TRvNEKlrRWzQ0uMGJbsoBQ6eto720hi5JjQ9nVQrpXQH3+DK2ZG0adU04EiQTdisqerpJStWmL7
 SU6utb1jZ+QjnVgAaV5UZ7FsAL50v/c=
X-Proofpoint-ORIG-GUID: fnfZkhA_-TB-g8pstvNhsAkVFzmCuWKA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1011 impostorscore=0 adultscore=0 phishscore=0
 malwarescore=0 spamscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020055

Add Device Tree binding for the Nord SDHCI variant of the Qualcomm
sdhci-msm controller, where platform resources are managed by firmware
through the SCMI power protocol rather than being directly accessible
to Linux.

Unlike existing sdhci-msm variants, this binding does not require
clock, interconnect, reset, or regulator properties. Instead, platform
resource control is abstracted behind two logical power domains:

  - "power": controls the SDCC rail power state. The kernel requests
    power-on and power-off transitions via the runtime PM framework;
    these are forwarded to firmware as SCMI power-state messages.

  - "perf": exposes the supported clock frequencies as OPPs populated
    dynamically by the SCMI perf domain driver at probe time via the
    SCMI performance protocol. The driver selects operating points via
    dev_pm_opp_find_freq_floor() and dev_pm_opp_set_opp().

Both domains must be listed under power-domains with their names
declared in power-domain-names.

The compatible string "qcom,nord-sdhci" selects this variant at probe
time and causes the driver to attach the two power domains via
dev_pm_domain_attach_list() with PD_FLAG_DEV_LINK_ON, ensuring correct
suspend/resume ordering between the SDCC controller and the firmware
power domain devices.

Signed-off-by: Anjana Hari <anjana.hari@oss.qualcomm.com>
---
 .../devicetree/bindings/mmc/qcom,nord-sdhci.yaml   | 89 ++++++++++++++++++++++
 1 file changed, 89 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/qcom,nord-sdhci.yaml b/Documentation/devicetree/bindings/mmc/qcom,nord-sdhci.yaml
new file mode 100644
index 000000000000..c512628617b0
--- /dev/null
+++ b/Documentation/devicetree/bindings/mmc/qcom,nord-sdhci.yaml
@@ -0,0 +1,89 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mmc/qcom,nord-sdhci.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Nord SDHCI Controller
+
+maintainers:
+  - Anjana Hari <anjana.hari@oss.qualcomm.com>
+
+description:
+  SDHCI (SD Host Controller Interface) present on Qualcomm Nord SoC.
+  Clock and power resources are managed by firmware through an SCMI
+  server, so no clock entries are required in the device tree node.
+
+properties:
+  compatible:
+    const: qcom,nord-sdhci
+
+  reg:
+    maxItems: 1
+
+  reg-names:
+    items:
+      - const: hc
+
+  interrupts:
+    maxItems: 2
+
+  interrupt-names:
+    items:
+      - const: hc_irq
+      - const: pwr_irq
+
+  iommus:
+    maxItems: 1
+    description: phandle to the apps SMMU node with SID mask.
+
+  dma-coherent: true
+
+  power-domains:
+    maxItems: 2
+
+  power-domain-names:
+    items:
+      - const: power
+      - const: perf
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - interrupt-names
+  - iommus
+  - dma-coherent
+  - power-domains
+  - power-domain-names
+
+allOf:
+  - $ref: sdhci-common.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    mmc@b84000 {
+        compatible = "qcom,nord-sdhci";
+        reg = <0x000b84000 0x1000>;
+        reg-names = "hc";
+
+        interrupts = <GIC_SPI 261 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 227 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "hc_irq", "pwr_irq";
+
+        bus-width = <4>;
+        no-sd;
+        no-mmc;
+        non-removable;
+
+        iommus = <&apps_smmu 0x1580 0x0>;
+        dma-coherent;
+
+        power-domains = <&scmi34_pd 0>, <&scmi34_dvfs 0>;
+        power-domain-names = "power", "perf";
+    };

-- 
2.34.1

