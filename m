Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 783934A2E21
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Aug 2026 17:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785865909; cv=none; b=KgV+h5uifFKadnA9CK29gJOvIaH9+NpRcUJIKuFp0VnHMyUFI3eR7gNs12PXFXiR/IMgqMm53hiDduoLMc2qdhIfXoF5m/kibQzqJuWAgPdpqUrYeT9qY48BEtj6TYltvTRgvHlJYRawZgoQ9nhY0zWo5kIS6lMPzeV/rcjzJZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785865909; c=relaxed/simple;
	bh=s/tzFANLq92I/GWvtIBsPnHI/dgKrIdY84Xt2S+xBUM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=prv5AD0M3SgPy6nUSWnzNQNhFxmTIeWx1d0sMynubvgaOCRPiwRB4mafb4lSmwTR1xHk7RLW5UVkvott25JM5gVYtk5TQAndNsxdh5kNzsaR61sJBT9X59R7pPgMR+7RkaoEswXQvZ6aXhHA4nl90kBFcvpwONqAyuZ45rWTx2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hDICPmfb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cPx2gED9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hDICPmfb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cPx2gED9"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 674FfcPd369191
	for <linux-arm-msm@vger.kernel.org>; Tue, 4 Aug 2026 17:51:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZY/BPGUq3Ubcc1EeSRezLJsNPAz2hAnhtWpk8PGcHQc=; b=hDICPmfb85OQAWxJ
	HMas3ybpGQiq8vfHcD/9A9Zae+K3CRJhUqIzU6pCD4QIIJztFj9CHzS2htlCsjGC
	XBa0Zhf+BQW1I86xV1dFHvRJQ4tZDg1FrKre/0fRzdWvUvbEJ+FNihXD7USxLSJR
	idfkMFZJAJPZL83aPFPP/KcDrWVxD7oOsNQF4AoeafWisW02GSgWOCzMnNV63T/1
	DhjK6aYAEkDhHeGswc0yOq/uZrlw7zNV9/CIcaGwqSDMPB3qXUmtLdtznWqIezN/
	+EH9NntWAQ5XIa15JvuqUity6Tq1BLPLvAw237x+DQ8EgsFDUd82nrdTw6RdfrJ/
	GaevEQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fug659h7k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 04 Aug 2026 17:51:46 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cca3673560so2168715ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Aug 2026 10:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785865905; x=1786470705; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZY/BPGUq3Ubcc1EeSRezLJsNPAz2hAnhtWpk8PGcHQc=;
        b=cPx2gED9gd4YIgluclPSuTuvxXSzRBn+e/TtlYUjC/aUvIVW/3fqwTAWlOS+6lLmqd
         vqE6i4oLLgzNPXo+L7lN3d3/qAgsFeX5DXgqO1cHWYWIwLwR5i+LrwOiNWtPwuN3zMzi
         R+zcoQ9C68z5CxjY2FigNU6JOp2ArAk3qcgqR6K4w7VwvQSFuZ07LddVQ23mky5ZRCmW
         X9binY4G3hn8K/CRiExUlHog97ph21y6nEYFdz7Slw3wWFolvpTPqILqKsHEJ0JdaHOW
         7Er04AvaXx5gXzdg5nwIzr3HlMR15ro0jxVgqjOCOgdM1qZ1/diOSQV6ePBWTySCE0G1
         CJdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785865905; x=1786470705;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZY/BPGUq3Ubcc1EeSRezLJsNPAz2hAnhtWpk8PGcHQc=;
        b=SNLr9mHN7yfxOIDsVihsv3PxYeL7+d7+uR+aSMXf735/8KA3C8TJxonSjxLOtg1xE1
         eJzWUXhF7Dv/7rwQ7yMgjeEIwTtIohzEYyF6NKH5JGGwbCxzwmTneSpn0VjtheAIXvGY
         EhrpA9avcwwWOVEEOKCMaP0m22XJhNNaVVT4YVDYDxN1Bk1yhmWcPzrC7ZkzE8GIBZ+K
         5SQTNafQHZmoJ2FgLvmYjngQUDV8uDsJ+8rBV5m4k1wAFNTyR8xkJ6W5KTJQoGjkyVlt
         96ueRkDxkZ2zeHmlfBJt+DYn2olXCOjNu+wiOaDTkPdoNIgq30oNfF7bWr/GT0kgVh/g
         nCYQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrt+Yk1GH1hq2ZGh3jJ68p4hP2mXj9fYc3WFDM6SolEANDe0jEqxvTu5bq7VRI9aq0tus6hvr0ABZeRxtfC@vger.kernel.org
X-Gm-Message-State: AOJu0YwQsT8BtXJd51nQMOFraQ7FhNbKrhhyU7dloblxqBswqGmn1QDa
	TVO19V24tZHDU1sm97M99WGqC7/P1m3QpJa/Rw5ifHyo5APy8FpXDUxJcC4LgUVCY76spcg+s0/
	c/+YBKgfbC3yzTAp1MlddcAW5qv/iSIrH7kYJ3KRP4jS+q9Kii28VR1PTLA65UEo68bPl
X-Gm-Gg: AR+sD13p7HYqL9BT5mfreZvX3mXuVD6AjxjcnFEo3xyyJZ4K64vASJUn4aRtk15hOxb
	8dlvG60BvmA0mCmI89pCLFaAONxgRrRTw0xP3U2LgizqyuFgHVM6N6wV+HTP6u66WAPs0aHC+fR
	myW2nq6jZECN2aopQmPe5dA5dbuOgUNAR0Cc5MaB/vnapPSxN00HMcX1JyyPY1BCWgu1lKiWGQQ
	m1XNlNgkpx5XaZZmMnd5Ph1rEOGhQZnZk9FDO979s/CvT3GHAkIsRnS6DcvvNC+K871VtTzkhgY
	vLzDk9Qqbm5gRP8pB2k+XXAbfQ6Qon3wFZLolDqTB1uwU+q60/iqvwx6eVehDXzTwkibeYnxPfv
	KZWRA5m2lGMt5FnL2CPChD9Gu
X-Received: by 2002:a17:903:17c3:b0:2c9:e86e:aa0a with SMTP id d9443c01a7336-2d0ca165189mr6792705ad.0.1785865905244;
        Tue, 04 Aug 2026 10:51:45 -0700 (PDT)
X-Received: by 2002:a17:903:17c3:b0:2c9:e86e:aa0a with SMTP id d9443c01a7336-2d0ca165189mr6792025ad.0.1785865904794;
        Tue, 04 Aug 2026 10:51:44 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31586790e21sm7052108eec.24.2026.08.04.10.51.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 10:51:44 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 04 Aug 2026 23:20:23 +0530
Subject: [PATCH v9 10/10] arm64: dts: qcom: eliza: Add support for MM clock
 controllers
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-eliza-mm-cc-v9-v9-10-39067760dc3c@oss.qualcomm.com>
References: <20260804-eliza-mm-cc-v9-v9-0-39067760dc3c@oss.qualcomm.com>
In-Reply-To: <20260804-eliza-mm-cc-v9-v9-0-39067760dc3c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-ORIG-GUID: dMeGc22HeV8YkJFZQyiDquqDwgZqotkG
X-Authority-Analysis: v=2.4 cv=fcydDUQF c=1 sm=1 tr=0 ts=6a7226b2 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=nFpjIs4uCRy3fSY36ugA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDE0NCBTYWx0ZWRfX0r9L3acZdZh1
 nn55q0P23wZ9xibpXjY5aDOJVoVfgqQJT/uswTQ6zU4VQ8j2hPj4NzOp1lyfJ9DlBM4Db7AHLhz
 nzQ7AKKgmuMSP+AatMP8bI28MCKrP+Q=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDE0NCBTYWx0ZWRfX5qRuFVXyp3lo
 YqvtMXQn9ntiXd901iE/p8T5mScELmZImW0sbC2Vr92HT0C38ecJBPsPT0rKfJ8+ffGA/jQ9/ZR
 sPYVKvFyJhmYZx9KR5rWpY0mWhKYHTGniZ7I8T0QGqtqX8HxlrwhsSKpHMJ97f0iX3TyMNfrFrf
 /IbolnaVlOcOqXHgG/Ld16TE/L6siXY/qpVkozb12MOfR6F7U1wcAeAT1yhsH6ozCUNfaSHv7ZP
 5I6B3SDNd3oYewWDjHJO0PkQlQLZtUKtaaHF6h5XruwnuiBc4QxyN77kB3tZqzWYLi705d+0gPP
 QAqmh0pPDEELAB8e2xp4uIlPx73/DKx+iJvBI2YE+hPyY2hslsnKMxFxosYtld6eTBMMw7UfJwf
 l5JMWlafa3HIvKi/uVN07y32VmoBQlGmwntDIBPQUANY+ZbDpmyLC1cP48X94gjL4xy1ilbnmmp
 IVOpdDFg33wFQJGAV8g==
X-Proofpoint-GUID: dMeGc22HeV8YkJFZQyiDquqDwgZqotkG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_03,2026-08-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0 adultscore=0
 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608040144

Add the device nodes for the multimedia clock controllers (cambistmclkcc,
camcc, videocc, gpucc) for Qualcomm Eliza SoC.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 76 +++++++++++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index 66ea4aaafd73a37303c1875361b7c03f09d58432..e8ff212c295e89bc7d418519d142f1950fbe126d 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -4,9 +4,13 @@
  */
 
 #include <dt-bindings/clock/qcom,dsi-phy-28nm.h>
+#include <dt-bindings/clock/qcom,eliza-cambistmclkcc.h>
+#include <dt-bindings/clock/qcom,eliza-camcc.h>
 #include <dt-bindings/clock/qcom,eliza-dispcc.h>
 #include <dt-bindings/clock/qcom,eliza-gcc.h>
+#include <dt-bindings/clock/qcom,eliza-gpucc.h>
 #include <dt-bindings/clock/qcom,eliza-tcsr.h>
+#include <dt-bindings/clock/qcom,eliza-videocc.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/dma/qcom-gpi.h>
 #include <dt-bindings/gpio/gpio.h>
@@ -1787,6 +1791,24 @@ aggre2_noc: interconnect@1700000 {
 			#interconnect-cells = <2>;
 		};
 
+		cambistmclkcc: clock-controller@1760000 {
+			compatible = "qcom,eliza-cambistmclkcc";
+			reg = <0x0 0x01760000 0x0 0x6000>;
+
+			clocks = <&bi_tcxo_div2>,
+				 <&sleep_clk>,
+				 <&gcc GCC_CAM_BIST_MCLK_AHB_CLK>;
+
+			power-domains = <&rpmhpd RPMHPD_CX>,
+					<&rpmhpd RPMHPD_MX>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs>;
+
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		mmss_noc: interconnect@1780000 {
 			compatible = "qcom,eliza-mmss-noc";
 			reg = <0x0 0x01780000 0x0 0x7d800>;
@@ -2893,6 +2915,60 @@ mdss_dp0_out: endpoint {
 			};
 		};
 
+		gpucc: clock-controller@3d90000 {
+			compatible = "qcom,eliza-gpucc";
+			reg = <0x0 0x03d90000 0x0 0xa000>;
+
+			clocks = <&bi_tcxo_div2>,
+				 <&gcc GCC_GPU_GPLL0_CPH_CLK_SRC>,
+				 <&gcc GCC_GPU_GPLL0_DIV_CPH_CLK_SRC>;
+
+			power-domains = <&rpmhpd RPMHPD_MX>,
+					<&rpmhpd RPMHPD_CX>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
+		videocc: clock-controller@aaf0000 {
+			compatible = "qcom,eliza-videocc";
+			reg = <0x0 0xaaf0000 0x0 0x10000>;
+
+			clocks = <&bi_tcxo_div2>,
+				 <&bi_tcxo_ao_div2>,
+				 <&sleep_clk>,
+				 <&gcc GCC_VIDEO_AHB_CLK>;
+
+			power-domains = <&rpmhpd RPMHPD_CX>,
+					<&rpmhpd RPMHPD_MX>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs>;
+
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
+		camcc: clock-controller@ade0000 {
+			compatible = "qcom,eliza-camcc";
+			reg = <0x0 0x0ade0000 0x0 0x20000>;
+
+			clocks = <&bi_tcxo_div2>,
+				 <&sleep_clk>,
+				 <&gcc GCC_CAMERA_AHB_CLK>;
+
+			power-domains = <&rpmhpd RPMHPD_CX>,
+					<&rpmhpd RPMHPD_MX>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs>;
+
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		dispcc: clock-controller@af00000 {
 			compatible = "qcom,eliza-dispcc";
 			reg = <0x0 0x0af00000 0x0 0x20000>;

-- 
2.34.1

