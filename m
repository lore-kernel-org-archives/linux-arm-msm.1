Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795463514;
	b=tAeXmJ4d+MQVgGsfjEqNnRq0tC/9IzjFMgz84y9lYkwIgLcxIjIEpg2bn1NbY29KvIEa
	 daQl7UMe8UD+vkcd4gZUJuSrgrLgAUPg8WqqLR6govKyVom34Cb0nrDMXFBShUcSUUGqi
	 VT7NJFSuqudRQyF3/jgCXYvtIiQ3TWN3NR6U6TAO1tViGVgR+/36q2sw84OnHif3XGxPq
	 u2Tw+kaAHCuhZ5iLVEqlg5UxGuK72IdcCE0b3k1a4u3nSIvF/s1w1GeljdvV/FmKH6VtL
	 1+h9krghyscoVTC97+HAQlnpRpvImjlMmM+53Ffa5K836a14SdopxpQ54lbbivHjhbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795463514;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=4o890wySDiYpLD1MpksrkjM0MlrXqxwa0AJcHngD92Q=;
	b=syQ//P47WmdfLGilFNl8PCdA8lFvz6xUMnDGIj7kLEfIn+GgyTwte/kbWEvk+MZkEEYL
	 xrMMO3cl9A4BSQ5kPKLQ6jY1Hdmn6tX4gjMuCCfCwKEKbRQIVDPRy/h1IHw1LCrF/9qGI
	 WNbkBczsuYBq+z/ndSBBj9LaL7b9pfg+sZoUUrPVGVNUdjSE5MLrcQb3H2kEoigKwCn7Y
	 mVBRaa6/9IurpmsxUyd832fMvelqLXptLDF+ODNHj7cGFBw2+KK6iU6rpMc8fc0vkSyKQ
	 estuFJzoURsSWtLP+WFw5Bpkz3Fn4F5TUsaCoLwI2vX1wQeEgSlL6nxFEy3Z9veTnFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ldjygAZV;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B+Pju7+5;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E1A2606A32A
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 19:51:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E1A2606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ldjygAZV;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B+Pju7+5
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGGxrP2377203
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 19:51:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4o890wySDiYpLD1MpksrkjM0MlrXqxwa0AJcHngD92Q=; b=ldjygAZVjoaJIO6l
	Pj9FQlPlZK+MQHQ5WIvAp5lEGd34j5yXImG0EVV/lBFvQb8XTlHhve7qihg6MFKl
	mmC8wBuHegfJImDQYbzvZzhBbGPPPBPoMKDpqH71DOJxmwtHZjyojXLbD/wTCPsU
	BkFHhVrxup6jROy1QCckwDcmFtks4GX4VUwPOPfHXAGyheLPlXHDQ7OeTsUd39P8
	vR8yB9Yg3zzy+DADR2Klm/jX+DtgkIfTvMS5Tgen5+RopPHLjDmS6/pINpTpW3mA
	O7Y8v+TLL0ZOp1hjdIohAI59NjrE5cUrYnzpJ0KrQ7SymlXKG5zlHJfLQnN7FJwn
	TdxvLA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4m7ut5rp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 19:51:53 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-384c78aa0dbso5164087eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 11:51:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795463512; x=1796068312; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4o890wySDiYpLD1MpksrkjM0MlrXqxwa0AJcHngD92Q=;
        b=B+Pju7+5iG2yB7Gd/O+tkt2ycQff37Qs+miV6J+2bjmE+9t/JgR58KRHlu7huxeaXL
         v71bTsLdq4g43DtUdqxF199HKwsoTfy9e+nfzysp0k7xnq9vVgGBNlUXEiRFEC5ap9Ba
         vj3/2wGgcSInKOIgxLacGa9i3WfngV6M0DD5fgw/M29eN8GBm4HnmLJk+N7opPQStxZd
         C60zEBDcdOMtTq14koTnHqR3BqYfVxRDEmF5/BeOqxUniBjUX+VbCSwRclMn4yRKGx3/
         IxGOgMSHCBf4cI5SLtRcD1I9uQHBnjm39z/BIITF2og3UFHNHszbjW1KO+5x0vbDxZUK
         qMmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795463512; x=1796068312;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4o890wySDiYpLD1MpksrkjM0MlrXqxwa0AJcHngD92Q=;
        b=CS1BHGcGBzG8qBn6X0xTHz1mMd7cWsL2EOoZjQGuKkHpumO+HJ3vaSVPL0iFHZsfyY
         g/2M0iAzhto2a8gfM1zDQiPk0Q6GxaF+/otKNIsZNNCkwXDCmuugymNMJ/368ytnHQp2
         IVJoh2z9XtjVHChwWkbB5T3AHLcT7WwwZ4hWYYGLkLPHU/CNqMC8lUDGfVnAKqzsruPg
         XpfwWuM9cN8PkxZwf/xerzFjAvkcN+VMFRvA8xHPQU+1932xVghvmZUYJtcKbnjyLzzc
         R/PXvUDywSD+TrljHjPjg8B5j0MsE4KGQ7+Vpz3hyhGlgkV9z+BL3Rf3UrlQNp4kh6/e
         /YOg==
X-Forwarded-Encrypted: i=1; AL+hErF3En2znFr+4uWaJwc3RSnYBgeTMn59KwaLOz9mERuIPenqfQMyEi0EqB1HAPFr00rymtWo8tQrEa3j+OnU@vger.kernel.org
X-Gm-Message-State: APuU4Z/erdf1yFn9+ZfdIsIPR2xBq21sh/kbaN61LDkkDOOcYeCiN3g5
	BM5f0WdwMOIsSzkIWgWwb0Ey39eZvWzD3ZECeapVWhQQAeuSRrzEr/Lrj/16A2PTqiThBhE5ysu
	l5cCFcfyCNurYoLgsjlr5kkVxCPjPpgpG4gn74OPFn1ihjl6m7549+vb7fIiCIeaexRNH
X-Gm-Gg: AZFdTZd1+TSeSoTRXqtg2PjoLUCbOit/qfKCHkLeOG5uAQ3vK9bRdVEDDk4A5iswZ+4
	e4vZvbRxh0gv353b7R6DGSD/qYgJCYqQo5ROwWrBMZXaGPKMfDvhereQTn0lAL4iTeYH7naxdvv
	duSPnIhL4qhID4igmTfqwiMeFqOscEUw+dKuCvhu++iNF+UAnyif1Q3B9U4hMACjGPpcwmhuivt
	33c8m3hSoUYt0IgK6QSSyxVviHmGwhfr+pFHN4gGqKeiGChSe6AUtFkeMUn8HwOBX6Ze3yiCvL9
	tuR8bbXADzCxHfxHPFyrgvg4iQOZ5EfqRd8If7Nwz2cg8WzgoJ2t7bNM5ZGVSGoZvX3qLUnjJFp
	D5qBlpTgNRzRB+uDs9Je1dtlrIH4XcAbAjuGGVlGhaUD8u+MC2HeNzD+OlFsi1V1AwBIwPiM40w
	==
X-Received: by 2002:a05:7300:2202:b0:36a:1e9e:ae61 with SMTP id 5a478bee46e88-3857170afa1mr18653997eec.38.1795463512122;
        Mon, 23 Nov 2026 11:51:52 -0800 (PST)
X-Received: by 2002:a05:7300:2202:b0:36a:1e9e:ae61 with SMTP id 5a478bee46e88-3857170afa1mr18653956eec.38.1795463511427;
        Mon, 23 Nov 2026 11:51:51 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e96bdsm36363123eec.7.2026.11.23.11.51.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:51:51 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 01:21:32 +0530
Subject: [PATCH v3 01/10] dt-bindings: clock: qcom: Add bindings for PDM
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
Message-Id: <20261124-b4-pdm_clk_gp_mnd_v2-v3-1-98db26a87500@oss.qualcomm.com>
References: <20261124-b4-pdm_clk_gp_mnd_v2-v3-0-98db26a87500@oss.qualcomm.com>
In-Reply-To: <20261124-b4-pdm_clk_gp_mnd_v2-v3-0-98db26a87500@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: vctWRugL_V34qKzx0ubXJ-4RsJ6JRXP1
X-Authority-Analysis: v=2.4 cv=KurYSmWN c=1 sm=1 tr=0 ts=6b049959 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=nhq6iwPr6d6TsRTX7tUA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: vctWRugL_V34qKzx0ubXJ-4RsJ6JRXP1
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3OSBTYWx0ZWRfX10G/AOdMLP9p
 mESIxDH5Chtz2hUSp+aDRhJiUPG2o4noE6lKc2xfC6Iw8N0SXzKSZEKmz25qu9UmbzM/+PO2DWJ
 58DwR6YDTUeNnRnYD+wyvOGRMJxV7hE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3OSBTYWx0ZWRfX17+s8JEUje7S
 h48yqm0fxe3l6sZsVrCIy/XaPGftZ1zm3vb5H0YtFH45iSYGIRy3DAjCEV3SL5q3EznoEjfs9/X
 6y53MLIP41PIMXK4IUHN8Ww1KGy8uSS0z3BSKgSYqrjoTH7DYaaLek+mnN9a05MjIpVw8Njg3+o
 +FP/GkvXCXwpo8jB000QMoyUPjtggs5VIIvlfb+yc1kqmhtrLdX1YV95WStfZFKgwVb/eWhZxW6
 qo9KZzIT+cgJEtvI2a63rCpPJju9axrePFJdmc/SgyTLqrPnH7p+b9cr8/maHgdM1qv1biELbvX
 RywYtTQn5HDF4BVnSv6zY0dS/lhDE1lZ2Hcl+Jd6DsRn6P86wDXkusmjd4DHiqIykiUcHJmL9QX
 pXbEaexHbcAqhdr6BxAdMYbrszwzsSn5xWVcgFRCcwdUJkVzSbOk1QKrAgO9YEgSWOsxFP2A906
 OpL7Gj/kWlOOUySJ5mQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0 spamscore=0
 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230079

Add device tree bindings for the Qualcomm Peripheral Web's PDM GP_MN
clock divider. The hardware generates a fractional output frequency
from a fixed input clock (typically TCXO4) using the relation
Fout = Fin * (M / N), with duty cycle controlled by a separate D
register. The clock output is routed over a gpio controlled pin.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 .../bindings/clock/qcom,sc7280-gp-mnd.yaml         | 92 ++++++++++++++++++++++
 1 file changed, 92 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sc7280-gp-mnd.yaml b/Documentation/devicetree/bindings/clock/qcom,sc7280-gp-mnd.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..76fecc6f7cb376770bfec06f3e1fcafcd480286a
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,sc7280-gp-mnd.yaml
@@ -0,0 +1,92 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,sc7280-gp-mnd.yaml#
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
+              - qcom,qcs615-gp-mnd
+              - qcom,qcs8300-gp-mnd
+              - qcom,sa8775p-gp-mnd
+              - qcom,shikra-gp-mnd
+              - qcom,sm8750-gp-mnd
+          - const: qcom,sc7280-gp-mnd
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: |
+          PDM XO4 source clock. It is derived from the 19.2 MHz TCXO by an
+          integer divider of 1 to 16 programmed on the parent clock (for
+          example via assigned-clock-rates), giving supported input rates
+          from 19200000 Hz (divide by 1) down to 1200000 Hz (divide by 16).
+      - description: PDM AHB bus clock for register access
+
+  clock-names:
+    items:
+      - const: pdm
+      - const: ahb
+
+  '#clock-cells':
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - '#clock-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,gcc-sc7280.h>
+    clock-controller@88d3000 {
+        compatible = "qcom,sc7280-gp-mnd";
+        reg = <0x88d3000 0x1000>;
+        clocks = <&gcc GCC_PDM_XO4_CLK>,
+                 <&gcc GCC_PDM_AHB_CLK>;
+        clock-names = "pdm", "ahb";
+        pinctrl-0 = <&gp_mn_pin_active>;
+        pinctrl-names = "default";
+        assigned-clocks = <&gcc GCC_PDM_XO4_CLK>;
+        assigned-clock-rates = <4800000>;
+        #clock-cells = <0>;
+    };

-- 
2.34.1

