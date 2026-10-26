Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793014194;
	b=YmYjcHTVu4HvuDJh4tgqEbyQWE3UTB5Pvv69Cm/y4WFmeG7W8Vcq/hWnQ4MYieKbyoBl
	 BQGv+vpaBVx1bAbL6tLtnHq9otUg/5vfvV0yhqoCocijf0b25oTL4z2jGwLlujFFCI3ml
	 NZWletWAoa7dKma1H48xZ0MT1rdbC120DqPloiIj31LS+M6hhycm1/5ZI/psneGl8CioE
	 SfEcoCl4jmgQaAzoXc5RaXNBYGn18k0fgNKjLMtazjDczr93GOrKQoh8JzUfMgWCFh7vr
	 HE10IHt0fQohhDomZLpVqaczpxrtBQNCFhgy98Sifzu+28TRbNJL4B98FhMMIOmeHcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793014194;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=vHGot6Ifz03WRWLIdDpMj7x0/Veb34RvuCZUlzZRN3w=;
	b=J0koKnTsC1lzXGTmffUlEqxJzgr2FpIZXRm/XJknB+Ij6+yVVMFYsHO2awzYyJotdQr+
	 9ZlM4qPrWoePeJ9Enx76IoRMLlMuppaENgaKd2DGJPxuDd+kJTsAAT/cA2EQWZVKnttGk
	 nrb9Vksg0jBynhvMXUnXN5NXHOmhzUfVaBJP1m108ZN8OD3HElAGZIzIrdt5mVVSPP8ya
	 cxuKARKNI9Hql3yyuoPP5HCD9Z/FSp99tet9J1dL6LmT97uu9kq8YwA2xjQPqU9FakytG
	 E8d+e2oyclPDjSx68PxMZmPpY30q3CDA/XZA4AcnSlTZnNuYjl5EIQysOBwp/H3hfiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PSBdIJ14;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OsnPVI2x;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C040606A327
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 11:29:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C040606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PSBdIJ14;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OsnPVI2x
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAtMQZ2009935
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 11:29:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vHGot6Ifz03WRWLIdDpMj7x0/Veb34RvuCZUlzZRN3w=; b=PSBdIJ14bS1Hp1tg
	oDM+hArGNQohRg7tl2vF0jYsC9Cq/365NOI92DKiVjYD8RBCFn8G5K9Ri0w2elCc
	3mwZI7DSPuiiL9VTrWE8xioJTSrszzCuChF1MpqiIA+edH+UpPU88rRYG/3lpzP1
	ty4lkf4JS9cDm7COpQpi7xtEZ+kicKyyrsRQYVbLb03Yp6XCHfHqlM3/ryYh/LJS
	QmrDJa/9oIFnwz+I5zu3DjABE6I9L8jyoUcxbthihG8mm8XtaHqWFWhLXGvFRQex
	NEadaHtiTp3O9rR5mNt1CYVTTBhqhoDu2sZQRAJlgpWRwUJZQBVkAJHFVnAnxBY8
	TiamZg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgn27x4uj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 11:29:52 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ab27eb38d6so2696372a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 04:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793014191; x=1793618991; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vHGot6Ifz03WRWLIdDpMj7x0/Veb34RvuCZUlzZRN3w=;
        b=OsnPVI2xVUPa/As0N7Qs9373ZKgIXBga4Ronjgtr665nabD3URnkn+Dbl331GKAX2a
         GX9HEfiO/54xR+LtcnEpEhuuJBTEUlxgnmiT631KRG3mztOwx2/r//zXJeChmHGZYN1V
         ZxTBW3Q5rcJRaKoNiwQcEHQASo54yzhQombBGZR4Ra8PmgqQN2otQkop6lO91YBL2oh8
         0DvsWag/HjxGeI/ZRHcgMoDGXNg3lwhnAQpaMOFwXEPL6QEX9ohVqc6HFlXumbD7PpnE
         BrGMwrA2XVdw3PPowq86TZqoGm/hDDksPFZFah14JkKR2kl4WsJsycFdhBjKNMJXGrfe
         8e6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793014191; x=1793618991;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vHGot6Ifz03WRWLIdDpMj7x0/Veb34RvuCZUlzZRN3w=;
        b=iRIISewZJQrqJtYhvIBBAEJWTEgcvyxnHHSUL/f84TYPv9tGkSfoMswh9hAN6K5e5k
         HCumAoSJYFfVPiK3XJFpEIqbNAu+keIluC19mbv0NY+9L+5wuSb41AcdXMLxaKtu/BRc
         2tygIJX8Fnk76h63SvOA93jg5gHsaYpfaRgIELeVRVF2+bQ9yKHc2MhMJxlMdJg7GV6h
         xZABW3P7EHCwCkrcxLXPPG51/OhYvHKraSpw5om2CCvMnQ0YI0oYlOJfLbvKT2bkv18w
         yDv+PpWFQnbNe7rQVgudEy/BkHXkp6tFOah8PoDCZTwrnhcKdE8VnYieSi2Dn6Y2BH9a
         D3kg==
X-Forwarded-Encrypted: i=1; AKwUvBxSJ3IK2rFhagCAF4oH84jgrhO+XZI70oJxWwHZMSE/wvw1AfbC5ndTAjJoPiIUcZGk+/+yiIWQUPEWC7XV@vger.kernel.org
X-Gm-Message-State: AFq9FYKbDXS+QXcPxB04RkwLVNNs9eOdd1nq3kumzyr9+VsgR2SxIcqb
	+qLLua0RYolN4DGrLlkHXN985YwzWSrTQK1ExwQgX4nGav1deTMqi7MI0anvNJK8pi6qG+k1mez
	hTIg5jg8qf/RKIzh7nyKqFl9mxWcF4nbGuLLxu/oBxMFf+C/Y/gzO+f01ltnyx/mCdtoo
X-Gm-Gg: AYBFou0c7ts2t4eGbA8aIJio5nAK0/nAmKwWP+bpFaaX7MfiMBxQSijKbNj30U0DsrF
	V2av4+fTfSDb2OdqhFnBLuYRNR70nRzqZDMuJFwfG+/LpeenoT6/naZAX3krk6MQbDsv2h0IaO+
	YCHBNfkqj0DmJu0fZTREjFsFH3dmAK4WKNvWixOFssjGu6WxKZsnE9jGDmI+KSQVL3DnfTTkPeF
	A8Nv4LPYxnlge2cfc+qpa4ZMFiM+GnbGukkJBIxaEL/CIVv1bvCby57MJK4MrfPdkXYvo7eHGRB
	L/4tfo9RUIao9iuqAq5DmgphM8ZrrsbdOw4B8gyqoeVKyHlVUJTzBFR57Sgeq+EzjJ7rCvirjCS
	DlCIbOYU66lC56L3otIwyQ/M=
X-Received: by 2002:a17:90b:2888:b0:3ac:b44c:2d84 with SMTP id 98e67ed59e1d1-3adea8966dcmr5277128a91.13.1793014191352;
        Mon, 26 Oct 2026 04:29:51 -0700 (PDT)
X-Received: by 2002:a17:90b:2888:b0:3ac:b44c:2d84 with SMTP id 98e67ed59e1d1-3adea8966dcmr5277090a91.13.1793014190683;
        Mon, 26 Oct 2026 04:29:50 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adec0bcb0asm8020388a91.17.2026.10.26.04.29.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:29:50 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 16:59:27 +0530
Subject: [PATCH v2 01/12] dt-bindings: clock: qcom: Add bindings for PDM
 GP_MN clock divider
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
Message-Id: <20261026-b4-pdm_clk_gp_mnd_v2-v2-1-ff8e4bc8d567@oss.qualcomm.com>
References: <20261026-b4-pdm_clk_gp_mnd_v2-v2-0-ff8e4bc8d567@oss.qualcomm.com>
In-Reply-To: <20261026-b4-pdm_clk_gp_mnd_v2-v2-0-ff8e4bc8d567@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, netdev@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=G7GJgNk5 c=1 sm=1 tr=0 ts=6adf39b0 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=nhq6iwPr6d6TsRTX7tUA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: Ggd9U7bDCqMeL9ZcwJnPstpMMNjz_5YU
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0NSBTYWx0ZWRfX80agQMtPe08Q
 kdCfu6nPXb+aqBlohvHH1bWalOlNxcU2XO4mSjbffnvATNj2QoO07tjDxP/haezwG9vc1eEsQmr
 wwlkM0+/LIA3AqYNprjl3pto7CcrzpI=
X-Proofpoint-GUID: Ggd9U7bDCqMeL9ZcwJnPstpMMNjz_5YU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0NSBTYWx0ZWRfXxH+4AVHAPsZa
 Xg8dHIj4nGQCyjP4R95wiqsRqv745GoQTp8EAvfgYm9aC+C3uo9j701UQau4MZZFaCnrRGfUpIx
 xGtdYmWRPdwIICQClGKz2+YuHv7Rte/tmKVZhfvV4gYl41FulRCiDqcNie5CIe+9rfTLeQKFZ3E
 0yejQA+PC+ndy6vNWEQEude+mQmVW6K1h4ThbVR/gpdRBTCxavoDbn3LzTrz0W03pBAcZCfb3/u
 8vQ8PRNsLLFSAW1kNuiHlLCyv3WtmArRIKVHgFobG/5Ky38XEROI5ZOajuGdZ8ujFLnpIOgCYlm
 UUbLJS3NnwcSBviamUqq1/4CYNI4IkthFeecRJaDqPY07Y7AZHoNqXlAPa/ycUxkGJXSS0ilIZB
 zDIlFsh1X3p0v9Qa1o/DpYtyJlvp+FAyC/4PBkdCsMg+KP93FW8aA8jnXohHYQ0W8EI1YdbGTo0
 TgPqgssjmbOJ+IsiTrg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 phishscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260045

Add device tree bindings for the Qualcomm Peripheral Web's PDM GP_MN
clock divider. The hardware generates a fractional output frequency
from a fixed input clock (typically TCXO4) using the relation
Fout = Fin * (M / N), with duty cycle controlled by a separate D
register. The clock output is routed over a gpio controlled pin.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 .../devicetree/bindings/clock/qcom,clk-gp-mnd.yaml | 98 ++++++++++++++++++++++
 1 file changed, 98 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,clk-gp-mnd.yaml b/Documentation/devicetree/bindings/clock/qcom,clk-gp-mnd.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..8141f392c5d70acfc42cf1ff4b1722e1eff23afa
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,clk-gp-mnd.yaml
@@ -0,0 +1,98 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,clk-gp-mnd.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Peripheral Web's PDM GP_MN Clock Divider
+
+maintainers:
+  - Taniya Das <taniya.das@oss.qualcomm.com>
+
+description: |
+  The Peripheral Web's PDM GP_MN clock divider receives an input clock
+  (TCXO4) with frequency Fin and generates an output clock with
+  frequency Fout = Fin * (M / N) and a duty cycle controlled by D
+  and routed over a gpio pin.
+
+  The divider is configured using three registers:
+
+  - GP_MN_CLK_MDIV: holds the M value.
+  - GP_MN_CLK_NDIV: holds the ones complement of (N - M).
+  - GP_MN_CLK_DUTY: holds the D value.
+
+  For every N input clock cycles the GP_MN produces M output clock
+  cycles. D is the number of native clock cycles in which the GP_MN
+  output is low, counted over 2^13 native clock cycles.
+
+  Hardware constraints:
+
+    M <= 511
+    N <= 8191
+    N > 2 * M
+    M < D < (N - M)
+    M and N must be coprime (no common divisor)
+
+properties:
+  compatible:
+    oneOf:
+      - const: qcom,sc7280-gp-mnd
+      - items:
+          - enum:
+              - qcom,sa8775p-gp-mnd
+              - qcom,qcs8300-gp-mnd
+              - qcom,qcs615-gp-mnd
+          - const: qcom,sc7280-gp-mnd
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: PDM XO4 source clock
+      - description: PDM AHB bus clock for register access
+
+  clock-names:
+    items:
+      - const: pdm_clk
+      - const: ahb_clk
+
+  '#clock-cells':
+    const: 0
+
+  assigned-clocks:
+    maxItems: 1
+    description: Parent clock phandle used to set the input frequency.
+
+  assigned-clock-rates:
+    maxItems: 1
+    description: |
+      Rate for the parent clock in Hz.
+      Supported rates: 19200000, 9600000, 6400000, 4800000.
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - '#clock-cells'
+  - assigned-clocks
+  - assigned-clock-rates
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,gcc-sc7280.h>
+    gp_mn: clock-controller@88d3000 {
+        compatible = "qcom,sc7280-gp-mnd";
+        reg = <0x88d3000 0x1000>;
+        clocks = <&gcc GCC_PDM_XO4_CLK>,
+                 <&gcc GCC_PDM_AHB_CLK>;
+        clock-names = "pdm_clk", "ahb_clk";
+        pinctrl-0 = <&gp_mn_pin_active>;
+        pinctrl-names = "default";
+        assigned-clocks = <&gcc GCC_PDM_XO4_CLK>;
+        assigned-clock-rates = <4800000>;
+        #clock-cells = <0>;
+    };

-- 
2.34.1

