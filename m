Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EC49411FA7
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 11:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787572499; cv=none; b=eKvkQgr/fHiAAQjO+88CVNreoy2fn8/XX9k17vbdkVVcwgNbrsQO8KbCeGt9PI0awbeZsttfPUoL6bvjtGxlOKW4WlidcRW031QZYJoPHMUGlINTxi3t9SfPFaZlRI76ZJC78qUgGHIupZp1n66aDx+JiYJYWFBgfxIesDJbX7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787572499; c=relaxed/simple;
	bh=REJZawy4aBEbtBGd3KEmnFuvi8s9k7aDbXSu0pw9loo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BJRddo7vEofjYnzogjWyzBlV+cSdIN06ZosGAIL+yzkiD2Z+j4TvvBngx7+Y24flAyc0n7OQMzq9RR6ixdBslZTjlWeHcRNlV+zmmjl+bYCwU+NvV8Wh6v7gnuH86IYZCq2pemgjeljkzDd0kuhcgI/4AO2ExoeDJEdfiksQ+l8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OvWpJJsX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TrD4Tkrr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OvWpJJsX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TrD4Tkrr"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OBMgJp2864710
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 11:54:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oxfa+FUs8WqJDbLPx7xq2/8KB0/M6FXPg5BITFA+MLE=; b=OvWpJJsXFM2eMFTu
	m6PwVHxir/fqaoNnGX8KnDRVZzUJ0CLAMvuuUhusZxVOHsZPG0lXBrZkE+64H69K
	CHolfOWG0CW3Bb2J3qjgp+DULvPIHfRMeaHQPVlhWLNGyglkw+jbuX/NeHUEVmAM
	TnsJ0Fzj1OopMkwLg7mq+UUjqZ++SnIHo1xVjvG1uPdCRhmENYCR+XXLjTuE/2BZ
	pqI58SjSGM/0bf/Tk9OEkup/wiyqXpr2sfp6Wgp7W75WotMFQruV33KQdo8KEUXT
	+NYETw+rtyOuUzs92RvWdVF2jpMPNLBDju4CJ7wUAZLGWRFIq+GZzQlSoOC0tdPy
	9/rkhw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8bdr29kb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 11:54:56 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8fc6b670b4bso29866616d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 04:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787572496; x=1788177296; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oxfa+FUs8WqJDbLPx7xq2/8KB0/M6FXPg5BITFA+MLE=;
        b=TrD4TkrrmDRXzAKuELDRDhIVRpmjuqUNwXK5QXD5BCPfnXzyi2GuZa+YuBVFv1pmCy
         d57zzU0GE/iMvEBDJbIGQBijOsZjkf4pxLk50exarUsIhOp76WPbgzk7d8edcbqyByLH
         x8jDqn0zw/IEQsGuc+2CBtqkKbmP5H9T3wbGjBV3As7jjaQMGcpNJCLyDRRoV3m0XFWt
         WLWMFz8ymLELuW+fSmSVYNK7UEfZBU441UZSQtkZtHtwpDFkTr0Ss63YhEsfH6fRsnkZ
         5Mnow/G30GmrgqFUDi50RsnI4Yofc9FKM16m1Ses4e4Sv91SMzN6fTyUuMIdsLCIOR7U
         iJpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787572496; x=1788177296;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oxfa+FUs8WqJDbLPx7xq2/8KB0/M6FXPg5BITFA+MLE=;
        b=hqqJ/toijjyZ1l83E2DpDpA4qnq7ZMOvDUFOCe/qiGXN8b3SmaHWZEmNq6m5Y8cJrf
         P86YMzxLzA/3qnnMI42NbdwgRplRjCFEQnYilvH6sdi36zf1R+A+cYt3WZD/S7PbdJDo
         30s07RMyp0hdVDKxmceKEIaGo7p8mguhe3ialE8pe+ep0QM2GlPluRrmohefVcXQsj0A
         /a521/i+OPD7gZVowsLta3NnjDjKkqWwWXQWlfWpymavFH8PlhV005gRCUd/UnP7cT1k
         05ZzHqxpz0n/ZdFYnbS/CNFPoX8dc1pBLVW04gQCZuZ1rfanp2pF/TyJ8WF5SvQ7/dbn
         K7pw==
X-Gm-Message-State: AFuF++my5o91uHO7apaVTOd0unaLn/jkJj/vOxBPf/Q2/gtrZvWWQdrr
	5AV+42492wdfudCoiSNpRNPnVGmGb+DTeNDvCc2J02n1Vtc2EAgO8MYy7eONmQnjfEJ5TRU9VcY
	JzDSFadfL8NwuhHxavLMqB0XUIQLIvP4YM9rRsk0SZBd4j/USVkTT3f20yZDLetcZwapS
X-Gm-Gg: AR+sD13Q/71RQ7LYnFW8KhIPcXO5GSwNjjoT9654E7BMeg4F4Xr4aAGWuOcFcjm/GS4
	c7ikdHPBSbW9RprNamZnBV9eQFEtu/jtFBRVsEj93MaGetLfjyRSN1pOph+6dH8xOIu5/Jaq2nH
	CrJW1pBvHPBvb7N8AUZPRfS3SWTTJxXSsMVHSyDPRuSqkNCDAM/BnJCy6QdEk+G6U6Uew6Y6GrF
	Bb2ASoqZvSOZlO15x3DPpbLlk3Px9dNN13vbEBFzvV51MwgxEm++ydKyk2BfUwgRJr1b4UHPNpX
	3HqQgqttsWYhgnq4+w6n9zCD4lM4T9Y5bXKnbhQgGmdF403KSkc+y7wFFS4ftWceqMX6gCBPNT/
	5E53BK3oq
X-Received: by 2002:a05:6214:46a0:b0:90c:4ddb:e298 with SMTP id 6a1803df08f44-90c80ca639fmr283314276d6.6.1787572495438;
        Mon, 24 Aug 2026 04:54:55 -0700 (PDT)
X-Received: by 2002:a05:6214:46a0:b0:90c:4ddb:e298 with SMTP id 6a1803df08f44-90c80ca639fmr283313186d6.6.1787572494900;
        Mon, 24 Aug 2026 04:54:54 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249629563dsm1259990366b.17.2026.08.24.04.54.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 04:54:53 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 14:53:50 +0300
Subject: [PATCH v3 03/47] dt-bindings: clock: qcom: gcc-sm8250: Add CX
 power domain
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-qcom-tie-cx-to-gcc-v3-3-f1205a92682b@oss.qualcomm.com>
References: <20260824-qcom-tie-cx-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com>
In-Reply-To: <20260824-qcom-tie-cx-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1731;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=REJZawy4aBEbtBGd3KEmnFuvi8s9k7aDbXSu0pw9loo=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqjDDYZBq2yLVBcLIMiiwwt1UrTp3pLhPT4ndQt
 RqgngtR1ZGJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaoww2AAKCRAbX0TJAJUV
 Vo17D/43SKJo6r4cFVkKNCPl3h2NTwc2tdxH249u4t3uSWKJGh6N3vDUe/CyhIkfeNKhF1TCKFt
 SbOFwKDBjHl21hpdBvt+g9wvg2rgGqnV1yWQAgRtdFWuVzUqMFXjM3K3ZWlmQLXlnNuO5JGxGBf
 /tn6cLI4FWCj5C24GcKICHKo0W1uPjlKqeHYe1sYFyHXA6sir0PcryYZ57ioGSVCuNsN7baxq4O
 GwwSJGK0K73HtYPcTUOdLfDgmfr9wh7rfn6QFy5jRaw278VmaIk7MtwNjWcnHidYMEk87XK9ee7
 Ky7AakniDMe4gZSWgGDZ945o2L2wvw/AeiNL44UJ7kFih944oGWoFZM4rv//xgj61oSgSCNs0G9
 vxFXK6P9/gaqfOxZXr7cSMs49fFsiu/FcxCHdVSHwIA1Kj2puImHoXeM13EK5nMfdCuIyGqIqQI
 e9j4o5g1aFCgaIbQOH2bmbRLbyyTln3w8wXfZ/RX8CrdV/1zQ2N3A2ytSgO8p94pqV0cDoN40MM
 nZmGpKTxwX6WqfDLM+3nQC5e+5XQF2/sZ11x+wqCoJ5TAjeiYRDYyAx1uxS3PJOAsdTa2UY6/Ru
 0RHO0XDNo+9NetQ/XMse6sMFqv6+F5gfiDIinMK9blEFNrzpPDI6+cmAvNgYnANjo3xOqfyE1Hm
 8eJsi5IcYnplDrA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA5OSBTYWx0ZWRfX7Sd2a69dViox
 kNjHPCzWA8yK1vDKj8I5eB6nfWdjDcF2nsNb1QALfKKh2qkoVPQyBAAHg9IrK4YI9Dcs+3i0MaI
 0ZYJ2P3YIOi7X0H6vc9JkpLIc5h4NynO9mldDr188dZlVLIInUCwDojan75bEhBfEyaXfqSX5H8
 JK3gruB7Q/YdV9FCiCCayvvlciR11voQw2N+E9COYkgdiMR5Gv3Dvc+iMZh022OsHjzSw9eWjkA
 lEr7JsTR3dCu6FLQoY+lor8h/jwVzssnmJBuYqhQR55GzyEjmsQLKsq3bxtIVjuSAkZAEv3sGpk
 Tpo41/zYiB4rCfzI7lhAj8/BGfTJomHXk5r8+MwMc26FIwx4ObfKdImMmjlbIeUoCZR8A/NwisA
 PX4Px2SrFNctvUgRrt7d+biiahi3S+ECWASrD57g6Qh7N6QCmRcvaMrtWLI/4QUdWgVkYfuamqK
 ZyMUgPzw/cSwlljIMkQ==
X-Proofpoint-GUID: ZZmi8kg_k_DPn5jL7lO3HGzB3Tbq3QjG
X-Proofpoint-ORIG-GUID: ZZmi8kg_k_DPn5jL7lO3HGzB3Tbq3QjG
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA5OSBTYWx0ZWRfX3IMwEb/Llbr3
 0B9Pi3MuIT4kacAXVysHRh6J4UgpHkpxzSUDsCBpuu0RPPWPUnLbQt9dBDp0LO5SG55b65aIs7+
 lNw0zpaxMqTfr1waqd9UChJpaCfkffI=
X-Authority-Analysis: v=2.4 cv=W8cIkxWk c=1 sm=1 tr=0 ts=6a8c3110 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=1VWmMwf-hiIXLgPH03YA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240099

The GDSCs provided by the SM8250 GCC are supplied by the RPMh CX power
domain. Model that parent domain in the GCC binding so the provider can
describe the dependency in devicetree.

Add a single CX power-domain entry to the binding and make it required,
matching the hardware description needed by the GCC node.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,gcc-sm8250.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sm8250.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sm8250.yaml
index f4cd5a509c60..7c0c3cc63281 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-sm8250.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sm8250.yaml
@@ -32,10 +32,16 @@ properties:
       - const: bi_tcxo_ao
       - const: sleep_clk
 
+  power-domains:
+    description:
+      A phandle and PM domain specifier for the CX power domain.
+    maxItems: 1
+
 required:
   - compatible
   - clocks
   - clock-names
+  - power-domains
   - '#power-domain-cells'
 
 allOf:
@@ -46,6 +52,7 @@ unevaluatedProperties: false
 examples:
   - |
     #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
     clock-controller@100000 {
       compatible = "qcom,gcc-sm8250";
       reg = <0x00100000 0x1f0000>;
@@ -53,6 +60,7 @@ examples:
                <&rpmhcc RPMH_CXO_CLK_A>,
                <&sleep_clk>;
       clock-names = "bi_tcxo", "bi_tcxo_ao", "sleep_clk";
+      power-domains = <&rpmhpd RPMHPD_CX>;
       #clock-cells = <1>;
       #reset-cells = <1>;
       #power-domain-cells = <1>;

-- 
2.54.0

