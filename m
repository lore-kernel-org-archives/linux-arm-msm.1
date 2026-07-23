Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4288B47A882
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 15:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784821597; cv=none; b=c+M02ZPKiPp7/YK2zD3QorHOEBmaj5TTDg/nvuzkhQ1gLejLtHr71hwHUuYiPZzqNdiAGfKFWsxfyizZH04o6+5sZ6jQ6Ly9q6EswAA9116u2NtaTO0qG4C1clI3XOoKY1piX8GhZ4FSaWRUoLFPiw+REDNhiuN8mO+hJymV0x8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784821597; c=relaxed/simple;
	bh=Lj4xwrzjhO1VDsmaGyHqoFbFhk83L/Zj8o9GcN8g5AU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VstFRbQ6ENf6eUjbv/f4t02u0B0yoSKk8H/zQGL5c4jbUDzoUnSJOrM0+U56ytp56J/t15nqhxoFh0LVUWMWSdDvfZCdAVCVqxoy65hbDMSYKl+iPBfQiudrktu7W24OtriXpA/VbPIr5sSc7JouJKRWck47W6kJWmAwhGGkZZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ougav5BW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K2BUxwNa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ougav5BW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K2BUxwNa"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66NCw5EA3605773
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 15:46:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ETmhb4fSMfqSjG+CRnB5cvktEsrUC+oPkuF61xzIYw4=; b=Ougav5BWNpk2hGag
	wjso7eS+7F76gaqxYYWMIufEFSSEwXZy6fVgT2UbcBp510gpl8oqvfPlA1QeglZu
	CaprEh0HKYG4j6KvjOV02oFn60DSppqiYvnqilSDMs0NS/CBvCGS9pZXHUE6W+0u
	hcwO92kIXS6xebq//jYA2wrQW/V+b+kIbJZMH2r/3pmIbEuQ0TsWeV7WbC+AjgAR
	z7cWAxW7OHaw0VjfebwhI5QJPDOeMZQTzgUK0zQTEyfTWLGq5aEvnzPGrIpfBcoC
	v1Y6gEDvsmFj4yLxS9Pe9uwFloTuUXjTWQB9G5hUlVjs2BsZSjPv5E/FL7XTFs6v
	61utWw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkeuqa37g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 15:46:29 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ccb6f6a3f4so9140085ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 08:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784821589; x=1785426389; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ETmhb4fSMfqSjG+CRnB5cvktEsrUC+oPkuF61xzIYw4=;
        b=K2BUxwNaiNSLRTQz4Gj+vLf/4pZzB6kPdXNJ+WihpAOu68oDpOSngQybPLwvuuDgqD
         R5FMlzhabMugkPDlcmn2o0rRXnzocQocgkTqSImEUhRyIj0P9srOFrpxRd4Pe3XTIjYm
         yeR4bTfTmeQu7prwDajpjuZGgZKckpEq2QoJuac66k9aiyNnyOb4dp4xPRNjFcaH/iXq
         3iMJGe6oE8iZmkucLVhAvI+isVofgoHr6j8pMlbcK0gQnOK7qKEkLAzHLy1NWDsKQBNa
         F7xTYZY4wgnWx8fpWltMtQBpmZdXuvHgXzB1RzvbeUGFh2Ry/p2pIotd0RHE1mJ763nW
         vuzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784821589; x=1785426389;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ETmhb4fSMfqSjG+CRnB5cvktEsrUC+oPkuF61xzIYw4=;
        b=eKWux05ZDcMWcHxXeceQxEP8kvFGLiCS0SEfuhNVBVlhViQenrARP5tBq882xhD3Ym
         NgGbVbUUPAI26fqTX6L090k/zExZK013zzmVe7aqTnXm/ep55xeuub99s1aEjL0WdE8X
         zNc64Fo3A6SMwrCtqLoCzdqyc19SNsJ4Uo44g6suaFs0tacHEZ5HOwkowCWIXfLhXIVT
         lWkQc3WTJYvfPL1llSWDi4NQAFFnULkNJiRnputsgH9YlcJ8rDGaUFu3JSmriobzoPCH
         ieWIxdJphpj/qmr4QDo61SOwZQo2E7wD3ND7uZnEuEYPNrmrUBcyRDhMw1tbKov4k+pH
         s0LA==
X-Forwarded-Encrypted: i=1; AHgh+RoP33OlXKMvVbaoJBvAEVPVAaMmrzkFd6Wcpexh08mgpgecDAojNTfcFv0cXWr0FjwTVjGdpTW7rJXYkGNh@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9gb0PQXfWmo3UnFDK45n/B6tpy0DD+GY9qDsJRgZiDRoYhQZH
	zTOPoyGm5omWEU3WWAWI1ZFijtNxJZT7jPxrluoVr5enFL2mJuj7KPFmvnhg0K9e/EVVCtUbfA6
	aa8qNI74fCW+EwWfOMzDwCc54xLReNTsSoyXD/brbel/eZ7NOg/1W/z21zd66J4BSfmdk
X-Gm-Gg: AR+sD10Y2DUBhGbnTpEAJy2jeG/uKrevPT4CsBW3hbQ4LIuWou9DXVYbruFHO0Gha85
	UpnFNOB26vIGutrBPIPfuZKbwjoVwGF9mt4/qX0gpTroP2q7R3ifWsUy8cuhn9rgWs/GQZV1uJe
	iJlGQ3JteSRCupKmisDsqNBbed6mg6hW/IX+iD1FIvCMmWg3Y2FvCoKBx6vtBRXXMknbI4xQF3g
	UAFHMjJJOpEIu5U+TwJnsziQ1Qd2fdLfMWsqqfggEaiBW4jSUXPYEyHdkQYJsIC4IvimBsAl3IA
	KT31Wng6bUUebFtCBoFxTwMsgZhoDzwvkAttZcljvWRbA7T1274hfRiY39cMkemJ00PDraIzCqs
	kCoGIRhhEohM8pKc9UoPLfW2Iz98jRFI=
X-Received: by 2002:a17:903:3c4d:b0:2c7:f5c6:c4a6 with SMTP id d9443c01a7336-2cfa947647fmr36538565ad.7.1784821588526;
        Thu, 23 Jul 2026 08:46:28 -0700 (PDT)
X-Received: by 2002:a17:903:3c4d:b0:2c7:f5c6:c4a6 with SMTP id d9443c01a7336-2cfa947647fmr36538195ad.7.1784821588047;
        Thu, 23 Jul 2026 08:46:28 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8efd7157sm36242625ad.18.2026.07.23.08.46.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 08:46:27 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 21:15:53 +0530
Subject: [PATCH v3 4/4] arm64: dts: qcom: shikra: Add support for
 AudioCoreCC and AudioCoreCSR nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-shikra-audiocorecc-v3-4-90b878ae0d4e@oss.qualcomm.com>
References: <20260723-shikra-audiocorecc-v3-0-90b878ae0d4e@oss.qualcomm.com>
In-Reply-To: <20260723-shikra-audiocorecc-v3-0-90b878ae0d4e@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDE1NSBTYWx0ZWRfX7P/VtABLnPZo
 gHpb8o45Xqz6nEGnsWqfN89LILgaPStPaoOJAS9O+yCup2SBx2mM+VrPniL1HUWDDQOCL0rJIRX
 7eRyX/crH9SQgikiGpKxx6PXEs1/+So=
X-Proofpoint-ORIG-GUID: f7lQbdxgUOW8oZbMlLebLVGItbnRNTse
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDE1NSBTYWx0ZWRfX+h4rQ9WQybOH
 6jtuETz6tNUGbMDku/69+IwcsoMqPuio8cqJG01T3QFD+kPcQ36iAisxghQaTJYH6QMbhsu841q
 iVsd3iGTKkfoATRq+CSQcq4n+sFD3XVhyM7yZNiA5BZPRDCqkYd3WVrLwCMVfrTUT3g478DHH9P
 NwP23sq7vDqRFqqyvYajjxluzq+FXJq/boucVN1gH76XtanEjtZz9wjsCySlkwchq6tnYuoiZKn
 azcWyhJn+FSk6PbC06rgYJM/BfxTPUaTDTDuE5TD2QNV0B2lDhg2385tce0bqMxYo17JaRJWJwk
 qOEk8Q6clTuQ8yPdiT1t7DSqlvYVF5/fqK7IZ9vF7NoTA/9LFIEIHo+xsd/MZ0sDmZdaWOmoQCo
 Uz06EkSgHAPyyD7N+a3OVSRphFso1T/14PfhDzH7sccw0kBxWolCPVLKsGC4EudQ/wIZo8OUr9t
 /P6v0ORS59awaaVzJSQ==
X-Authority-Analysis: v=2.4 cv=cPDQdFeN c=1 sm=1 tr=0 ts=6a623755 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=3-fpjux48RbdSrvt_gcA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: f7lQbdxgUOW8oZbMlLebLVGItbnRNTse
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_04,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230155

Add support for Audio Core Clock Controller (AudioCoreCC) and Audio Core
CSR nodes on Qualcomm Shikra SoC. The Audio Core Clocks and Resets support
differs across Shikra variants based on Audio subsystem enablement as
follows:
- CQM variant: The QAIF driver runs on HLOS, hence both clocks and resets
are required to be supported on HLOS.
- CQS variant: The QAIF driver runs on the Modem, and required clocks are
handled on Modem, so from HLOS only resets are needed.
- IQS variant: no soundwire codes, hence no clocks/resets are needed.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts |  4 ++++
 arch/arm64/boot/dts/qcom/shikra.dtsi        | 17 +++++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
index 0a52ab9b7a4c34d371f5ac23efe59d1c9d2723f4..0883c480bfbc80d7bead966b9ba932dee8a77bbf 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
@@ -23,6 +23,10 @@ chosen {
 	};
 };
 
+&audiocorecc {
+	status = "okay";
+};
+
 &sdhc_1 {
 	vmmc-supply = <&pm4125_l20>;
 	vqmmc-supply = <&pm4125_l14>;
diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 4e5bc9e17c8ed8914733ac9fdc9b69128b40216e..b744534572d63349c4274ffbe5cacbb8fdb4197d 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -4,6 +4,7 @@
  */
 
 #include <dt-bindings/clock/qcom,rpmcc.h>
+#include <dt-bindings/clock/qcom,shikra-audiocorecc.h>
 #include <dt-bindings/clock/qcom,shikra-gcc.h>
 #include <dt-bindings/interconnect/qcom,icc.h>
 #include <dt-bindings/interconnect/qcom,rpm-icc.h>
@@ -640,6 +641,22 @@ &clk_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
 			};
 		};
 
+		audiocorecc: clock-controller@a0a0000 {
+			compatible = "qcom,shikra-audiocorecc";
+			reg = <0x0 0x0a0a0000 0x0 0x10000>;
+			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
+				 <&sleep_clk>,
+				 <0>;
+			#clock-cells = <1>;
+			status = "reserved"; /* Owned by Modem firmware */
+		};
+
+		audiocore_csr: reset-controller@a0b4000 {
+			compatible = "qcom,shikra-audiocore-csr";
+			reg = <0x0 0x0a0b4000 0x0 0x1000>;
+			#reset-cells = <1>;
+		};
+
 		sram@c11e000 {
 			compatible = "qcom,shikra-imem", "mmio-sram";
 			reg = <0x0 0x0c11e000 0x0 0x1000>;

-- 
2.34.1

