Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DABB3112C1
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 14:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785161508; cv=none; b=VI34xrDqMMMWPqIooSah2KnBTX//QjmMki2RVVGErV5WEkcQoH+zX2ZrIEg9opXJ0TBYz+IBv6IaFQVIelB+dsUZgYnSVyrtkAZs6v8mk0tvyAz2E9+XPEQlRbvBN2EjBkelAruSz3xWJM9cHPIzy5GmRKUwRKz3gzhRpkXyT6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785161508; c=relaxed/simple;
	bh=hMCvPgBPB3q9MAdNcGHYbIRCM3IAMI96J+Q0IZtiLy0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qOxg/1VYGZ/NoKtbmt4CS32N14NdFllvdURAeZoWZScRboG/JAthABdgFBxzrABkCgFiTiOS1nDn2uvZARMpJO4n/vsMZ2BVM35mw7ruUZA7+OA72bzQWdQVK/ci5SRhE976v6Dz1s0cO8jtL2Cr6qR7UiBQR9vx4EIU1bIj1U0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NuU61zqi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S5LPPuKD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NuU61zqi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S5LPPuKD"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RDlfKw033185
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 14:11:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x42XRV/b+7FIQ3y9QK+srSnj/CLDUIWtj9CDTSVpPG4=; b=NuU61zqiqq2V4LDG
	YqpwxlTM/ewh4kAkgGhQm4kIPOL27ilJaRl485OLGByUiBsF+SVUh+c4ZJVrNy93
	Znx7V1lnLEdeKLEyvdOPNuJXfK1c+s7W2y7r7GaZRLUj+P35RhaAhoiPHPAhWiV/
	c+kWdhvQVPRlmp62THn07X3NoU6wT4m07d8mKjSPv8uH4JCwzR9++VHxLtw4dX1J
	uGGnShy5Cr3vtNcTYHlezyYRPpgKM9TB1Kwhq7S8MfjHzl21VoNdTpE54bhSdNoV
	Bn4U2q5LJUwsuOFD9KOwdNH2p36hpxY7ATnO5Td/BT0QmtBPPywBYlaUgZmZnvmZ
	6kQ3dg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp4c615hy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 14:11:46 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb74d5db64eso3058582a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 07:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785161505; x=1785766305; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x42XRV/b+7FIQ3y9QK+srSnj/CLDUIWtj9CDTSVpPG4=;
        b=S5LPPuKDHiNNMeGyUvNOt09HG6/3jRZBVnnNQUPsK33l6+3YZ2dpGkirxaOuQAwJSY
         NCG46bntYviLWsoO6Ox4epkxALaGMO5j12pBMFdxC4lVWu4MAkXSOiwik1vWw7dvcgPi
         QnygolIIAbrxZrsy4fR5XtuZa24dGZss5OHFdNG+Gsm/vmuafFZYcnHoMWcp/OfpTOXM
         Tlr8uvEqnJqBVDLaSKAvJWEL8yWWqQnbo6w9PUbG+LdR2Hi5XvfVsaF4OLuUz/3x5cJc
         dO1SBXFuXLtHJKl8CVYFEox53vrqnbyLlekUwturr7JNmlOOjgA9NtFdbu0i4amLKG/6
         RiQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785161505; x=1785766305;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x42XRV/b+7FIQ3y9QK+srSnj/CLDUIWtj9CDTSVpPG4=;
        b=FZP/q2QDp0HDJWWvl7e4Rbv4H+88B93ZmM+Hs7PVUPu6u1ej8adEAyKztGumuaOKPl
         0KBjm2Wk2KYKqsak9qQH9eeZEXQrgf0qId62T7Y7QEeTSTTFdrwn1BVCiT/8Eop8B17+
         25f+QNYWnZqlkCN+QZaG7/fgInmnk0PLpsT2zw5WetYVO27xao8KOyvC3HBQNIviTGHg
         skA9LOa6oxGgfNsGrk3Dy2UBTWGWdgeeZDSvJhBMNGoISezYCC4PNo0BJkR62+gXItK7
         NKq5RMwgtlYqDnhGwXQj1eKoeLU01CERqZrbntagRP+EuSRxoPfoxU+sFYC1ozF68t4N
         b9Pg==
X-Forwarded-Encrypted: i=1; AHgh+Rqv9/ji++LrCJti/7oJpJbTCBlamYgLmD02kNmdqxjuv+wZSFUlpehscTFj7AaREbd3/n4k1zk2Ym8i06G6@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/c8EvqB54aaALDj1jmjtfd7j+HJnLIePXyg1MhOOsT5YxRxON
	WMER56D9Z21Qx4XYLuoj0jEQsopwomJVtR1oEKYF3fdmGh1OPWYrl7q5O1qaxmGmLWYE8euIErC
	rKZKjJDKA6r7pg/JvZZU/eNNlJzAxYfVdAJ1NtRS1HPSSe3xRABL9BiU5vZNq+xGmdl28LK4fWw
	qn
X-Gm-Gg: AR+sD11cuN7HyWSBKCDLJfErLOFhDzcwuMpqE79U/0SVdP1NUI9FGuLf6WXzafi/BLU
	n2BDvzblFca8/Y4ezotxZuCFX/ZO5mw4O2cxxmY8ENDk/FFVu6RspFjhok+hcScHL8+iKNoSF0s
	pNfwNgglK0NP+s8BUlitIRnCYO0RJxqmqwxWHQ02Z23ZGwNjSs6hgduVXhEgYAC1LGucLq3wkC4
	i6paPcBVtEGivqRbohtaELLhiFx3jNAMPoiUU+vD5Pqq2iL+kk1lVWPWTiLg1NZsVdyI5L0r9SD
	FmdeDEqCJjsyIDM8FFHsz+UjORB/ZOD/gMxw5veUXGhjSQxZHjAP+Xtb9LIRrhJjMm8TzBvtEUN
	5owH+jUIvKmzs1A3G4farvHSte1HFu9U=
X-Received: by 2002:a05:6a20:1602:b0:3c3:a140:9380 with SMTP id adf61e73a8af0-3c67da110cbmr7593824637.16.1785161505462;
        Mon, 27 Jul 2026 07:11:45 -0700 (PDT)
X-Received: by 2002:a05:6a20:1602:b0:3c3:a140:9380 with SMTP id adf61e73a8af0-3c67da110cbmr7593784637.16.1785161505023;
        Mon, 27 Jul 2026 07:11:45 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc44cb92sm53438677eec.13.2026.07.27.07.11.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 07:11:44 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 19:40:58 +0530
Subject: [PATCH 2/6] dt-bindings: ptp: Document TSCSS hardware on Qualcomm
 QDU1000 SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-tscss-v1-2-beed14e72510@oss.qualcomm.com>
References: <20260727-tscss-v1-0-beed14e72510@oss.qualcomm.com>
In-Reply-To: <20260727-tscss-v1-0-beed14e72510@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=eYQNubEH c=1 sm=1 tr=0 ts=6a676722 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=-YqWXAWF1hLJgJDcJRIA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDEzNSBTYWx0ZWRfXxzNteun2WKPJ
 ODMfdowMAyG/88W/RwC2ziNQdtR58Z8FPZXLBpKMH3zKP6jGNXmYIF0AkVrRLkMtMqOniBih/gk
 wiDtCFrukDbAUWx7ncwKzAQlP8Ypgbk=
X-Proofpoint-ORIG-GUID: ywy5SZfZE9-XAQJZiTeAKxDyUmcf33Zb
X-Proofpoint-GUID: ywy5SZfZE9-XAQJZiTeAKxDyUmcf33Zb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDEzNSBTYWx0ZWRfX3YWcXa6ooHO1
 eBj9WB3QM0lOi6QZQpIZJpMGZ0ly8JICAPPvpvxA8vdyHA6ifnvdq+3aMEDlFHt8fXKZq7lgSKx
 h4svOHu72Tb/GO/2XarW+XblXH548TGY/HyMlmKun8WMtkA2Eizw10ypfmKKDMoEhG5hXyf0Bdo
 E/nujquhu/lpcdlvGhinBfNu1MCpEknQtDdPaZ5DAPpH3VdU1cHHrdPQ9nMUMcYRJfz8ud7Oww9
 +UeGM6A8gm2A+2mjAy3wqp6sPcHytap9UPmBd4JJDmLDQuhU2FMLNuTXhgAdZKbuggr9biBTOaQ
 uDvEnuSpjoisMfbAHQ88I49PRXsTNQEgoGRooNkydO6G3m7hx2yJz25T1vGzg8pVW8OKsQDW5XZ
 5wCThmaNDqZsxVbUzT3VFe2bI2ayqALNUHhKT0th7cqbP0cEpRmlu2Jlh9ZXIFBsPrdbtB0Uq2r
 XnR4/u7gG90nJPWNRVA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 spamscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270135

Add Devicetree bindings for the Timestamp Counter Subsystem (TSCSS) found
on Qualcomm QDU1000 SoC.

TSCSS is a time synchronization subsystem composed of two main blocks:
Timestamp Counter (TSC) and Event Timestamp Unit (ETU). The TSC block
provides a continuously running counter used for timekeeping, while the
ETU captures timestamps for external hardware event triggers.

Co-developed-by: Taniya Das <taniya.das@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 .../bindings/ptp/qcom,qdu1000-tscss.yaml           | 187 +++++++++++++++++++++
 1 file changed, 187 insertions(+)

diff --git a/Documentation/devicetree/bindings/ptp/qcom,qdu1000-tscss.yaml b/Documentation/devicetree/bindings/ptp/qcom,qdu1000-tscss.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..39387614ef8939b7840df2f0d5640b9e142fb4e5
--- /dev/null
+++ b/Documentation/devicetree/bindings/ptp/qcom,qdu1000-tscss.yaml
@@ -0,0 +1,187 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/ptp/qcom,qdu1000-tscss.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Timestamp Counter Subsystem (TSCSS) on Qualcomm QDU1000 SoC
+
+maintainers:
+  - Imran Shaik <imran.shaik@oss.qualcomm.com>
+  - Taniya Das <taniya.das@oss.qualcomm.com>
+
+description: |
+  Qualcomm TSCSS is a time synchronization subsystem composed of two main
+  blocks - the Time Stamp Counter (TSC) and the Event Timestamp Unit (ETU).
+
+  The TSC block is a timestamp generator that maintains a running counter used
+  for system timekeeping, and is functional with just the AHB and counter
+  clocks.
+  The ETU block is optional and captures TSC timestamps for external
+  hardware events, each ETU slice binding a slice identifier to an external
+  event selector. Support for the ETU block requires the additional ETU
+  clock along with the per slice interrupt and slice subnodes.
+
+properties:
+  compatible:
+    const: qcom,qdu1000-tscss
+
+  reg:
+    maxItems: 1
+
+  reg-names:
+    items:
+      - const: tsc
+
+  clocks:
+    minItems: 2
+    items:
+      - description: TSC AHB configuration clock.
+      - description: TSC global counter clock.
+      - description: TSC ETU clock.
+
+  clock-names:
+    minItems: 2
+    items:
+      - const: ahb
+      - const: cntr
+      - const: etu
+
+  assigned-clocks: true
+  assigned-clock-rates: true
+
+  "#address-cells":
+    const: 2
+
+  "#size-cells":
+    const: 2
+
+  ranges: true
+
+patternProperties:
+  "^etu-slice@[0-9a-f]+$":
+    type: object
+    description: ETU slice configuration
+    properties:
+      reg:
+        maxItems: 1
+
+      pinctrl-0: true
+
+      pinctrl-names:
+        items:
+          - const: default
+
+      interrupts:
+        description: Per slice interrupt generated by ETU based on external event trigger.
+        maxItems: 1
+
+      qcom,etu-event-sel:
+        description: Event selection value for this slice.
+        $ref: /schemas/types.yaml#/definitions/uint32
+
+      qcom,etu-slice:
+        description: ETU slice identifier.
+        $ref: /schemas/types.yaml#/definitions/uint32
+
+    required:
+      - reg
+      - interrupts
+      - qcom,etu-event-sel
+      - qcom,etu-slice
+      - pinctrl-0
+      - pinctrl-names
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+
+allOf:
+  - if:
+      properties:
+        clock-names:
+          contains:
+            const: etu
+    then:
+      properties:
+        clocks:
+          minItems: 3
+        clock-names:
+          minItems: 3
+      required:
+        - "#address-cells"
+        - "#size-cells"
+        - ranges
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,qdu1000-gcc.h>
+
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      tscss@1da0000 {
+        compatible = "qcom,qdu1000-tscss";
+        reg = <0x0 0x01da0000 0x0 0x2000>;
+        reg-names = "tsc";
+
+        clocks = <&gcc GCC_TSC_CFG_AHB_CLK>,
+                 <&gcc GCC_TSC_CNTR_CLK>;
+        clock-names = "ahb", "cntr";
+        assigned-clocks = <&gcc GCC_TSC_CNTR_CLK>;
+        assigned-clock-rates = <500000000>;
+      };
+    };
+
+  - |
+    #include <dt-bindings/clock/qcom,qdu1000-gcc.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      tscss@1da0000 {
+        compatible = "qcom,qdu1000-tscss";
+        reg = <0x0 0x01da0000 0x0 0x2000>;
+        reg-names = "tsc";
+        #address-cells = <2>;
+        #size-cells = <2>;
+        ranges;
+
+        clocks = <&gcc GCC_TSC_CFG_AHB_CLK>,
+                 <&gcc GCC_TSC_CNTR_CLK>,
+                 <&gcc GCC_TSC_ETU_CLK>;
+        clock-names = "ahb", "cntr", "etu";
+
+        assigned-clocks = <&gcc GCC_TSC_CNTR_CLK>,
+                          <&gcc GCC_TSC_ETU_CLK>;
+        assigned-clock-rates = <500000000>, <500000000>;
+
+        etu-slice@1db1000 {
+          reg = <0x0 0x01db1000 0x0 0x1000>;
+          interrupts = <GIC_SPI 329 IRQ_TYPE_EDGE_RISING>;
+          pinctrl-0 = <&cci_timer0>;
+          pinctrl-names = "default";
+          qcom,etu-event-sel = <1>;
+          qcom,etu-slice = <1>;
+        };
+
+        etu-slice@1db2000 {
+          reg = <0x0 0x01db2000 0x0 0x1000>;
+          interrupts = <GIC_SPI 330 IRQ_TYPE_EDGE_RISING>;
+          pinctrl-0 = <&cci_timer1>;
+          pinctrl-names = "default";
+          qcom,etu-event-sel = <2>;
+          qcom,etu-slice = <2>;
+        };
+      };
+    };
+...

-- 
2.34.1

