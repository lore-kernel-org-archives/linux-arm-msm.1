Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5690388E5A
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Aug 2026 05:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785994508; cv=none; b=srskadJBLdQZizpWWvsr1xmUz89FUrVnUK1pYsSvx4az4IpcYGakCKYGKQKNevyEUHiKRrXeou+rGBuAtrxbABm33gF7WD10R137bcFUwXvVqF+kT1ztOL/hmafEkyf2aDth+6N2eYxNJlBrfpcM8axwR6kl4iaW4nJ87ZK/N/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785994508; c=relaxed/simple;
	bh=j2WYAV1aNBU6qA06/lKr+zBb2ivHwzRVH7KmfeGLj8I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VCNOqi3C3XmCUVnZymgr4ahosdaZ3vHrw0Q48R5j+r6o3PIYbVcFD1xKv3gQ37dmpUL/OSxCVc3aZQ/KNRCNvXbposmvCVrCSHN1tXGFdfXp2YNSa09jREBz3KqwBiPggkK0sq5AAWL3Z9RT7HnLfvvMdTuSewex4yWtZ3fGR9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vhx6+YR1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NrcfDBdt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vhx6+YR1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NrcfDBdt"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 675NbTiT225991
	for <linux-arm-msm@vger.kernel.org>; Thu, 6 Aug 2026 05:35:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9qJ93ar8M4VFOq0DBtpdBUnHIbNQxTzt1c7fhgBAExc=; b=Vhx6+YR1Le9oiR76
	bEiYQpSqEWzBOBilE0TdmwAXLUIqc9V09KHVW0g+zijp6f0o9ZGOjZtxLG5hvR1K
	omcQBYB7tADtqrNlYKxbTv6ftbyNPtifc6zX7qESHkWd6OAN0nSL4u0el8Jyj90j
	to0vJWjC1ruYwpVXeUbsh4x+5oyK61Oq7OF67jIkVCfxheKh+1MQce81AmYO/KcM
	C0G7RwTfUMVDIhkLNO8H58LkYK9crxcnq/FP8TyrKy68DgnHGZ2cnfygV2nHCppa
	e0LtSNbj3WIC/FiZXGlObb5RAGAt2qG1g9/dJ/Fd1WWsXaihUaANk6twnZxRN7Y/
	icZyEw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fv2r64jsy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 06 Aug 2026 05:35:04 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ccd1958e8fso32062075ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Aug 2026 22:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785994504; x=1786599304; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9qJ93ar8M4VFOq0DBtpdBUnHIbNQxTzt1c7fhgBAExc=;
        b=NrcfDBdtwpgYtShXcj/PN9gRSAQVmbowHlrTiIZ2kxC7OPmHC+MZeWicyZ60WXSEdM
         31N8907ButrzxMb7MOkO2MvEOtaIOZC0R9ieRMopuLBsA1IL28I1XLsBLtwbPmFO+fHA
         CfXfDQqyGxk5HPpLIeWipQhjAEhMEyyJrvzVVompfUZqspj8F2P5fCTjj3gND7vJkyGx
         GmXLFfmRN2uksBEJTN8DX/mOgXb8V7jFNkGFMdJg1QJqv5ZypCsijP813qDZNRRwBxH6
         /ru5EfqgCHg3fOxJDE6No/yhCRbNe9HzpjcmrMG4HhHgF5tgMafcRGqdKPxNonOAYby3
         bL4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785994504; x=1786599304;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9qJ93ar8M4VFOq0DBtpdBUnHIbNQxTzt1c7fhgBAExc=;
        b=mqDdYlTBdkQWNLr7NG9PueZokqU2aO46H/Ku1OCzQRh7ChvQhpayHfjodGReNITXpe
         saEIdpS8RAVdcU2J6B8YnODBIMbQFb3Vrt/hx5+UPjlEKIEqTqwXh9TI1fEjHXFKoK4j
         W8rNtzWeghTlXB51Wfz6t4jmm1hgpyPAIUrPuzSkp5HPqUxDhQYNrkAFDI6L+DlhmJVJ
         TjwpIX7xNn8UEbzaFnEHjS0KP6nc++yd07Oo6BZ/ifVBa3LGB+FvE5VokzMP48V2+iK0
         BtQwDj2MMdVAoB6wdUyCs6JG6BLDWvNYfvh5mU+sG7t7Cwguek+JOXQk5XvgsxU94VID
         D5XQ==
X-Gm-Message-State: AOJu0YzQntrxit2Ibf54nkM/D5ekBJbPhmWz1okSZp4OxQ4tcCppZUIT
	7fa6V2WzNb0OqZWTu3mCgoRnk3C+PdTNyvuWvL/LFAhyypWL7p2+MWmJB3V9bKSSS9z1sGPulYw
	WoeVOgxSuQ+yzTsIV8FBU0i1D8O1fqtX8nYb5cTbw7Zaff2Ct2tYyjZDRkHTHsuEZeEDm
X-Gm-Gg: AR+sD13Fmq4Hd8CcpY0x31Ii8F2mPmhNXPlQXTCzz1ZZj379kBN7qGdGrXAx8S+1zh5
	wuGDePbDE9DJMq/y5pxxmvEbrCmXCk8yEMkpWlD6x9pw40WW0X2t+j66xReDC6LtxJIHE8Zfv0s
	fPekRMlpPOrAzSmMjk0GyAD/R6Oy8H81vFpz71vsDSS2R+SFFn282IM8LW/tKgyQ/Agib3NybG2
	1AW0Tmy5XmK2DHFZEk8w5tne5tKM7LY8MNXCF3vyNJwkPEq20NpRRJgeOVVbz6qaY5y8cHjCmFe
	9bUzcOjcSATF038w25YRQGCYfldUJH1EQSun9ypGC+ek07cfkql5/881P2Cg9iHvwgzd5HWPOql
	7HzIFyfKJJrg1jlBkqgjIX3cqiU7L2vB+IbUiBwq0rpZ+q58=
X-Received: by 2002:a17:903:2342:b0:2cf:bf32:b754 with SMTP id d9443c01a7336-2d0ca711fafmr133353005ad.8.1785994503562;
        Wed, 05 Aug 2026 22:35:03 -0700 (PDT)
X-Received: by 2002:a17:903:2342:b0:2cf:bf32:b754 with SMTP id d9443c01a7336-2d0ca711fafmr133352435ad.8.1785994503003;
        Wed, 05 Aug 2026 22:35:03 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d0a9f8fee7sm25780085ad.16.2026.08.05.22.35.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 22:35:02 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Wed, 05 Aug 2026 22:34:55 -0700
Subject: [PATCH v2 1/3] dt-bindings: clock: qcom: Move x1e80100 TCSR to own
 binding
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260805-hamoa_tcsr_qref_0805-v2-1-4f1cfb1fcab2@oss.qualcomm.com>
References: <20260805-hamoa_tcsr_qref_0805-v2-0-4f1cfb1fcab2@oss.qualcomm.com>
In-Reply-To: <20260805-hamoa_tcsr_qref_0805-v2-0-4f1cfb1fcab2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785994500; l=5156;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=j2WYAV1aNBU6qA06/lKr+zBb2ivHwzRVH7KmfeGLj8I=;
 b=Cx/poACnVd5oi/juwQuEm7uJELcE+QyD5Uxkd9ZCXv1ngeO8/RkLbnRI/aPPC0NzAya/jBxdM
 oiu4d+Sc/ERCp0GFfRLWZBsiFXhtIHKuIQCvdxOAqN2H8z8EJTCqOJ5
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Authority-Analysis: v=2.4 cv=WrIb99fv c=1 sm=1 tr=0 ts=6a741d08 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=Vu0f6eG494TTLRuRXOAA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: vRYXl6HMQ940kR_L9RYTcugHIPz9UPD9
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA0MCBTYWx0ZWRfX3+wTZ2gdqU5I
 MUfULNZXED1eFwH5nf0bYK187/X2QHoI2c+9zxens862yfx/UJFiHklCJRIoKTNTAQuZgoYlUby
 WxedGbnytmebVo9DFRQLjrS38RfvxXs=
X-Proofpoint-ORIG-GUID: vRYXl6HMQ940kR_L9RYTcugHIPz9UPD9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA0MCBTYWx0ZWRfX+jHZTmA7nJes
 KPfTyd2pzyAVN8dy2EjtBGlKk9/TFjDv5ati//7yaRMLTaDCJa/CzIAcRt0GQoS5VLbverBUERy
 ksTRzFSsd9Nn7L3wWb6SdcIs3wXVyVF0fnlILy89imA6K/60gxME10yf8ad0XLVpb3S+yhkU3uI
 VftLvK2Ax5LG37H/HcxzdTGHJrNs509Ch9NB+lNZUg3jpUV+NXIInfKJHbaCwRTC30hjLvmkslf
 YKC93DqCysVe6iW04mPbxzAIqTZ25Wal5qq7HFNbmi+uCqBVuEHkLv/J/wXH76nsbs852PuztK4
 QVbBBN/78yCH78b1w6Mp7ZQ4mgbCLuZY/vCYjENnEkSjGUHuPUwvHjfKN9J9sXcg1OqnvP71E1J
 98SaAPGvY8b3qkmfWRV+A7hBmqGEqBwZqIY28J6zbjawhMkEL0qLzf+daKx6opKvtoTH7XCKI84
 +FsSJF9wnkTZam/3HOA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060040

The QREF block supplies reference clocks to PCIe/USB/UFS PHYs and
requires dedicated LDO supplies to operate. The digital control
interface for QREF (clkref_en registers) resides in TCSR on x1e80100.
Since QREF has no dedicated DT node of its own, these supply
properties are placed in the TCSR node which acts as the control
interface for QREF.

These LDOs are required by QREF to provide a stable reference clock,
without which the USB/PCIe/eDP PHYs cannot work properly, so they are
marked required even though it breaks ABI.

Add a dedicated binding file for qcom,x1e80100-tcsr and document the
supply properties.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 .../bindings/clock/qcom,sm8550-tcsr.yaml           |   1 -
 .../bindings/clock/qcom,x1e80100-tcsr.yaml         | 118 +++++++++++++++++++++
 2 files changed, 118 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
index 1f3332275c17..f199655790da 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
@@ -36,7 +36,6 @@ properties:
               - qcom,sm8550-tcsr
               - qcom,sm8650-tcsr
               - qcom,sm8750-tcsr
-              - qcom,x1e80100-tcsr
           - const: syscon
       - items:
           - enum:
diff --git a/Documentation/devicetree/bindings/clock/qcom,x1e80100-tcsr.yaml b/Documentation/devicetree/bindings/clock/qcom,x1e80100-tcsr.yaml
new file mode 100644
index 000000000000..55182cf550e7
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,x1e80100-tcsr.yaml
@@ -0,0 +1,118 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,x1e80100-tcsr.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm TCSR Clock Controller on X1E80100
+
+maintainers:
+  - Bjorn Andersson <andersson@kernel.org>
+  - Taniya Das <taniya.das@oss.qualcomm.com>
+
+description: |
+  Qualcomm TCSR clock control module provides the clocks, resets and
+  power domains on X1E80100
+
+  See also:
+  - include/dt-bindings/clock/qcom,x1e80100-tcsr.h
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - qcom,x1e80100-tcsr
+      - const: syscon
+
+  clocks:
+    items:
+      - description: TCXO pad clock
+
+  reg:
+    maxItems: 1
+
+  '#clock-cells':
+    const: 1
+
+  '#reset-cells':
+    const: 1
+
+  vdda-qrefrpt0-0p9-supply: true
+  vdda-qrefrpt1-0p9-supply: true
+  vdda-qrefrpt2-0p9-supply: true
+  vdda-qrefrpt3-0p9-supply: true
+  vdda-qrefrpt4-0p9-supply: true
+  vdda-qrefrx0-0p9-supply: true
+  vdda-qrefrx1-0p9-supply: true
+  vdda-qrefrx2-0p9-supply: true
+  vdda-qrefrx3-0p9-supply: true
+  vdda-qrefrx4-0p9-supply: true
+  vdda-qreftx0-0p9-supply: true
+  vdda-qreftx0-1p2-supply: true
+  vdda-qreftx1-0p9-supply: true
+  vdda-qreftx1-1p2-supply: true
+  vdda-refgen0-0p9-supply: true
+  vdda-refgen0-1p2-supply: true
+  vdda-refgen2-0p9-supply: true
+  vdda-refgen2-1p2-supply: true
+
+required:
+  - compatible
+  - clocks
+  - vdda-qrefrpt0-0p9-supply
+  - vdda-qrefrpt1-0p9-supply
+  - vdda-qrefrpt2-0p9-supply
+  - vdda-qrefrpt3-0p9-supply
+  - vdda-qrefrpt4-0p9-supply
+  - vdda-qrefrx0-0p9-supply
+  - vdda-qrefrx1-0p9-supply
+  - vdda-qrefrx2-0p9-supply
+  - vdda-qrefrx3-0p9-supply
+  - vdda-qrefrx4-0p9-supply
+  - vdda-qreftx0-0p9-supply
+  - vdda-qreftx0-1p2-supply
+  - vdda-qreftx1-0p9-supply
+  - vdda-qreftx1-1p2-supply
+  - vdda-refgen0-0p9-supply
+  - vdda-refgen0-1p2-supply
+  - vdda-refgen2-0p9-supply
+  - vdda-refgen2-1p2-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,rpmh.h>
+
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      clock-controller@1fc0000 {
+        compatible = "qcom,x1e80100-tcsr", "syscon";
+        reg = <0x0 0x1fc0000 0x0 0x30000>;
+        clocks = <&rpmhcc RPMH_CXO_CLK>;
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+        vdda-qrefrpt0-0p9-supply = <&vreg_l1a>;
+        vdda-qrefrpt1-0p9-supply = <&vreg_l1a>;
+        vdda-qrefrpt2-0p9-supply = <&vreg_l1a>;
+        vdda-qrefrpt3-0p9-supply = <&vreg_l1a>;
+        vdda-qrefrpt4-0p9-supply = <&vreg_l1a>;
+        vdda-qrefrx0-0p9-supply = <&vreg_l1a>;
+        vdda-qrefrx1-0p9-supply = <&vreg_l1a>;
+        vdda-qrefrx2-0p9-supply = <&vreg_l1a>;
+        vdda-qrefrx3-0p9-supply = <&vreg_l1a>;
+        vdda-qrefrx4-0p9-supply = <&vreg_l1a>;
+        vdda-qreftx0-0p9-supply = <&vreg_l1a>;
+        vdda-qreftx0-1p2-supply = <&vreg_l2a>;
+        vdda-qreftx1-0p9-supply = <&vreg_l1a>;
+        vdda-qreftx1-1p2-supply = <&vreg_l2a>;
+        vdda-refgen0-0p9-supply = <&vreg_l1a>;
+        vdda-refgen0-1p2-supply = <&vreg_l2a>;
+        vdda-refgen2-0p9-supply = <&vreg_l1a>;
+        vdda-refgen2-1p2-supply = <&vreg_l2a>;
+      };
+    };
+
+...

-- 
2.34.1

