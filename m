Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF098448CFD
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 17:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784913370; cv=none; b=qN4vLiohbCsxdThZ0Ky08VTmNef2R/+5jhiVz3FhxM/n93k/x+HzeJQ8woTv5nBMeLn5z4kbc/symckkbfFKBIjs2/TAubRkfVQ0KNFEd0flILgWHftkXCy8Q9zcnvhLof+GQIDwDK8hkr+vkeyvkjDmnlWRGG+bn4X0yEoCock=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784913370; c=relaxed/simple;
	bh=O7qiwaryPlXurWIjq/udwHQ+dZxQnDOzL079xltsr/s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lml3yvzCs5bZZkIBNuWxB1uEsqgbujmVXrBSLL4uknjzgdsbIUErpZ/TnRAtIlBG9p8UzpnyXAeImvZNMAbryTbLseM6DLuLVMulNZW0zsH9cILIHAQk3AOPcLAcglAhNhE0vyBQC7bE7GUu2DnsEv7z3A5tC7QWOQR8rWGFHxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KV/J8ps0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OPgUWEkq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KV/J8ps0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OPgUWEkq"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OGr8xr3157572
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 17:16:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tNmXDzaverxKdYg5q+nd9ERkwwkJAFG1IgfvwE1/7Us=; b=KV/J8ps0zO4pQmgP
	zk23a7TOxo7tmzkoDTg1/val0c7mix7xoUD2t7dn3h6YH1as4RTWYxw+zABJ4c16
	Vb6rBmEazzxVnylduC3Gx0bLGRdUitIcOcopvNrGTLNRl7utw84IdXwraZOShobq
	OJPAOAbTNxXCzIJLSQDQauuWwF622rN40JgcGP13XZGA6cIGbzuRNiD+YVZatl90
	lYZK0P1HiqL0QceF7+8MACeQnrSxJaqEuxlQ178Fjp2FZZkCK0Te+SkQdU2pq2Ck
	Sf+pGSvW3+Vw1pJCpyFA3rFQMeoe2iaGfEFJMDS/AOAZCyHHWVTABMllXmTNC5Lp
	QBKuSQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm8cggymh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 17:16:08 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3811279d51aso1017589a91.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 10:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784913367; x=1785518167; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tNmXDzaverxKdYg5q+nd9ERkwwkJAFG1IgfvwE1/7Us=;
        b=OPgUWEkqIHjDICY027Fb48LUZWVMp2W0+5hY+acB5nwekFvmDyyS3OnVVltpGAGwe9
         Zes6kSOME6TFl/DzRaRSfLxX0Z1aSJYw6GmKEBSj9qIwpZoATQPhMgN6Bp1eEffCPSQM
         qkg0iYfW5zGsWbB/S+sjlVIbaVZxMauf+QCbPw18PG9qNxSTggEObK+G9t++a9HbPsGF
         5R2RHtmZ8uYEaMd/x0jyRdCcpeC3Tu/TRl50ggejFRd7x+AVDPP05ohfiRCkcf0JeA/W
         v4FIGgKIA8wEiDdBBMb8hTNfhrX5lT2jUGLMwIyHh2OOL0HvnL1jugwlTJQbcipvS+t3
         Oc4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784913367; x=1785518167;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tNmXDzaverxKdYg5q+nd9ERkwwkJAFG1IgfvwE1/7Us=;
        b=mYFyuHGs3587YcAAynStsgN+fvvdGA/AKdqx5sZ4yp8v5MIKHK9h7DvBduea8Zxoi/
         Nydb1dnHQPja46D6ZmDdbIEa8MrKn5cyT2XMAc6dgifG97gpwEYL9Ig4qKIwqOk+F/zl
         hj0BTvZ7QXI+aGDnGOXT82Srrpdr4XXMvx181ajqr7zbPFsNmmBAP1m+yNMQBFCV1ma4
         YvKj6xqZiIaBMvxNoMgM6CtEFVvy/jKXupz9+Q+OAqB18Y5Ov75Mzb7bKaRr+mtu8tnf
         clQTgCnB+iZ6Mn11/HkUfk76XQPyU0BPkAfBRYum5k19vhMyCbUG1fNnDKHeU6YfU1O5
         YFkA==
X-Forwarded-Encrypted: i=1; AHgh+RpAosnHReCZEDVZq3ZNnGPqoqa0AuQmowU+nLXys0F8V/ADuTUlDP04BK725OnSKWa6ga9zLILTCfVqSfTs@vger.kernel.org
X-Gm-Message-State: AOJu0Yz44/R7wlUizaHYuxpW8k8mXevdzHEnGtBP/xWLwJm1GaXAyiPu
	S4gDggA/A8F2jp3pKyZ6hovF1wVm0fO4+jxFRLUGco5tzKjk5djaB4tW0io3KBrtOJXFQVcQ0dy
	5+K+XIu2pqcxBzaFyUh6AohJajVtp2zKMrCj5b8bw+IaadfDo7TsktjS9qSbR58Nsbnlmc8VJXm
	JB
X-Gm-Gg: AR+sD13wQ6XL1dowcsewTdPOYDzU+ANMNc+m+V7eVeFTrUioeG2b/SF0ULLu+HzF7F3
	gKBxJyv4gJMCmk6nN1G563PNZHYCLnRRZHF22XQzkIu6rs7vmo7PAJAZVN9MqYRDFimqLZIRGlC
	zamIvd7hPiXpiNE+iCloqcPiXRc5D0yi5mrl0PKpPBf6HklGWagCG5Q4Jrjq/l5btNc5yAqoSKj
	Qxyc5USjz0DgQuklME/w+/rVZkHVk+MhWbX46cE6ZdoUZI10JnyezQJ2P4ebj/wNld5AIxh/HeT
	tXkYnMdxeXLm1bEnoJ3N56SBJoXAtt2CH11vYW8XOjIEbSoWVppskMwurdRpJ+LP7fQEiAHJJXz
	GuYPeWKgtSBZCEbSoaeowaD0Bq3tlWug=
X-Received: by 2002:a17:90b:3f48:b0:38e:2fa0:491b with SMTP id 98e67ed59e1d1-38ec6877190mr8420943a91.31.1784913366952;
        Fri, 24 Jul 2026 10:16:06 -0700 (PDT)
X-Received: by 2002:a17:90b:3f48:b0:38e:2fa0:491b with SMTP id 98e67ed59e1d1-38ec6877190mr8420909a91.31.1784913366470;
        Fri, 24 Jul 2026 10:16:06 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d2eb01aa0sm8400892c88.3.2026.07.24.10.16.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 10:16:05 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 22:45:34 +0530
Subject: [PATCH v4 3/3] arm64: dts: qcom: shikra: Add support for
 AudioCoreCC and AudioCoreCSR nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-shikra-audiocorecc-v4-3-0a89bb13d817@oss.qualcomm.com>
References: <20260724-shikra-audiocorecc-v4-0-0a89bb13d817@oss.qualcomm.com>
In-Reply-To: <20260724-shikra-audiocorecc-v4-0-0a89bb13d817@oss.qualcomm.com>
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
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=JOMLdcKb c=1 sm=1 tr=0 ts=6a639dd8 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=3-fpjux48RbdSrvt_gcA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: _JJ8fb_Mj7Ebc5TZeDEry3FxHrP__OGh
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDE1NSBTYWx0ZWRfX/IhZLjaRzLMW
 bkPbjWgiw5p1mtyh76eAuY39bIdoRkM/EVNeRx2krH6n3kYwYqo/gSr/dkXuJKck43WbNDx/WY9
 EJTsyh3ety4zCn0UQS/KST01jArT4nU=
X-Proofpoint-GUID: _JJ8fb_Mj7Ebc5TZeDEry3FxHrP__OGh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDE1NSBTYWx0ZWRfX5V+oVmh5kzhT
 K260ttqMTh9tF9lpLCiPHLf3o/Tj1f9tFYV1AljcuLscZiGbckjx7DGo2KcGO2A5jHk2pf68Q89
 kQ5ySMJlw1R1gYM/1UtOULXap/Oy6QwxcBetgvketUxuDOg2IWONNU0XWAWnBILpI7oi3L15qbY
 Z2bvqO8UFjwlh1gv3KcaDY1QHmBTmFJwgePa9TvoulyDCO0G9s8qKqZgukWVpVdWBSgOc4jFX0S
 o9kyUX0JIF1AS7pDWNt4DHU0MBVbNgtYWpMYB3gxRIo5runBSpLxKSotWLbS57UJSmXggcC0zEV
 7Rw2NMwoaOZtCi1gEWTLEFHWj0AYyd5H7/4x8Yao1wcQ1S1KTIYOmyRGMpGVQaJsTmRAsk0AulB
 E9/M508QqblelFpOxlr8eAVJdUG4NzVYWAjjitWzKB3VXeLodBdWJpywbeJGtZnDAkXPy25xIBA
 Fq/g9L//Hy5Byb3uypg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 impostorscore=0 spamscore=0 bulkscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607240155

Add support for Audio Core Clock Controller (AudioCoreCC) and Audio Core
CSR nodes on Qualcomm Shikra SoC. The Audio Core Clocks and Resets support
differs across Shikra variants based on Audio subsystem enablement as
follows:
- CQM variant: The QAIF driver runs on HLOS, hence both clocks and resets
are required to be supported on HLOS.
- CQS variant: The QAIF driver runs on the Modem, and required clocks are
handled on Modem, so from HLOS only resets are needed.
- IQS variant: no soundwire codes, hence no clocks/resets are needed.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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

