Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEBA04968F6
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Aug 2026 17:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785865853; cv=none; b=Cf9nNRLVhyxzQlrMuud4W9OuxOYT3uviweYtpz3bz75ZBQnHBkuX3Ojr0GsRlqNvGwzgXVDUFm/kSbMqG/Uoe4EKY+AhDh8+0YmtvkfZGuY4bgbM2bT4Vd/DPvBaZMn0GwLnOALgrKNoDL9FqN6ETIvAGq8i4je3T6/as62URyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785865853; c=relaxed/simple;
	bh=YGVvXMXUYLnOZMf8Ms5rV1I/iooKVaJYiXlCUiVTNGY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VE5EyLbsSQ72zpvA6T+iFj6fHtzjyKFinj0h+XTXGnDx/edQu4114pOMHySm0nBW7aduz9PanrvliFB9rCFkgul43LUNEM5UWGKovwAm78lke1k+16ZEQAOD24RjUO22fHYcOgQzgQ59Sv5Uvfkl6WEEocG82v5cqADkpezbGmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DHxsLfqd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iGevgd7K; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DHxsLfqd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iGevgd7K"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 674FfXJY369160
	for <linux-arm-msm@vger.kernel.org>; Tue, 4 Aug 2026 17:50:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NqweWc75LJ4nKbvr/g9yL9BCMMlm273gZ+lOwmdhkaw=; b=DHxsLfqdjvdMgVXa
	YmK4jdlhDcrc0L+8Q+HtCEOSh19NqDnTdQF0mPeunZtdn7bNW+g5/u8iM+yROZkx
	ZvQiu/0Et/0fZwmJnAEkbtowVB7WTX0ZoNR8yyD2KbofrcGy2CFg/tZ2mdfp0O92
	QPSuwOWHucgUF20Hov9wL3vAcITh1PLrNN9NWulKm4TrL5obijdn0H2IAtXSXS07
	qVS/0aII1AKut+2+jEsUhIXzPL1pDaJe1mPH5janKzWJ72M58Co9IJ4z3l0f2mVB
	7rkd4eEXyhvgKcJxk2HZFWZEPp9S8qu7XGx06GbS9Wq2g93oa3m3EzK7umIxDPcO
	mGK2PA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fug659h19-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 04 Aug 2026 17:50:47 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cb4cdf95b5aso68636a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Aug 2026 10:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785865846; x=1786470646; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NqweWc75LJ4nKbvr/g9yL9BCMMlm273gZ+lOwmdhkaw=;
        b=iGevgd7K8noINI0G99ITcpM16/uQEuCuaSb97j/H0mEIjD+O0UInJtO8xt+phLQz/7
         xtAaSO4/ItQryz7X4FwH1QRj3Mmk60mrd26SPWqGXp9H2SaRM8dylt2ZvcsDxbKcyrkB
         nvu4FVbzm4bGqb8h8Dyj0QtV++tPlIC54OJqqSAk8MwYo6OIZgv6LyO80FxOotrknK12
         l+uhVsORQqfaMsnh9wO+ngzJiEwn58mziq7RF0V1tZ2ZFC03Y/sUuPpIvm2TOZKxheTW
         iSQALG4YG/Rrfnsd3V6hxzTXjoZvIeOMtsj9tHzTDm7QjytGQ832GsBAlsBkw1KzgybH
         /y2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785865846; x=1786470646;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NqweWc75LJ4nKbvr/g9yL9BCMMlm273gZ+lOwmdhkaw=;
        b=fFnL5djZBanwLdqfN+NPYuEnjE925cgaypKkYwTkKeG7nlVDM51tWXIXrm6LKjJTqe
         GOM7K3Q6Kt6NUw2roU90RkFogi/CQciTz/kJH7KcL98vCllKfx8kMeHZmNWPmBx4q7hu
         lzVJes4/5aNhVIRy58gfSomXEmhDQ2BySLum/veOm2S308XJq0E+Wb8BF8nIhknLr5Q6
         /zuQ1SkMDzExmt1ISYXoE46aOatzMyRBj3Ox66WqKvyTXAB7OFmcaxHEIYPH65M4zDuc
         zHh9uJzNH9WA2fU412JdZRkRNGErEDoZYRgvi0/7hEcGA7CfjAeG+xkrqo1axqZdHUqN
         +UkQ==
X-Forwarded-Encrypted: i=1; AHgh+RqKZg7u5HcY2KGIGbSgiZsTAumgonzwxofempV7OXIz6AVPG60vOBde4tVouaVd0HtP7h5km8kDs2stK6e1@vger.kernel.org
X-Gm-Message-State: AOJu0YyvwcJSo5+RoRrgquwin/iOe6UkGZlMs4tD0HaIiLC/rkuQDCzu
	gmy/Sd8a5yj1WT0y4pxqqhXSNnyrDf+D/NBpsOff8/xsp3GCgCFfARpXuax8jU+VP3+o66liF4U
	xN2Nd27E7Yiapkdaa4DaorSkGb9xVQWjpx8e25qVO8i9pFrsIFwqW2wUINiCAI8jtUt/n
X-Gm-Gg: AR+sD12O2Tdd1qpLOuQ2E+w6xAl0jC+6dwoUvFRaa5Dt4LeA6IJiu6EF1BWADB6UNDZ
	YlM3TAMEwtYw6CjZ+ToISvM98RiG3Byq6EmpGWO9cKG6niq0FHAQ+y2TkfmFyOGMfsIjLOjlhAN
	A/FMHbNT0YjBrp0vqujFFqDRz1FAZy4zNS6BCvlMPKAxX+S0946IjBt9JmxXnLWzVY5S/sbDsQl
	gLegvthtPafJxhPSVTXrcg1ruXbmbMAFTAYDUErZgSEZvcD/UOmcDbTE6Fe59JOV1LlzZeYnZNr
	U3X9UY2ReWRv0tJ8sIwOzCnNcYxucyHEQvpodFBMFjF4p7xcpfhEngZ4GdEVe0XsOcJXk3bbJqk
	lOArWxzNqokWAd0PLjS1E+TAF
X-Received: by 2002:a05:6a20:7488:b0:3c4:2eb6:c3a0 with SMTP id adf61e73a8af0-3cb85eb5c82mr580073637.30.1785865846406;
        Tue, 04 Aug 2026 10:50:46 -0700 (PDT)
X-Received: by 2002:a05:6a20:7488:b0:3c4:2eb6:c3a0 with SMTP id adf61e73a8af0-3cb85eb5c82mr579974637.30.1785865845105;
        Tue, 04 Aug 2026 10:50:45 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31586790e21sm7052108eec.24.2026.08.04.10.50.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 10:50:44 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 04 Aug 2026 23:20:15 +0530
Subject: [PATCH v9 02/10] dt-bindings: clock: qcom,milos-videocc: Add
 missing power-domains support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-eliza-mm-cc-v9-v9-2-39067760dc3c@oss.qualcomm.com>
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
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-ORIG-GUID: sQkTWPCOZgSgoDW-hE5-gqTwS3D2daUA
X-Authority-Analysis: v=2.4 cv=fcydDUQF c=1 sm=1 tr=0 ts=6a722677 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=PEPMgF9El5tgKvQp_-EA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDE0NCBTYWx0ZWRfX2aNIrcZJRvZV
 BAdJ15gpAN9aey4RlA7glPdlQwUnM569JUKzOIuaTrY03Dxyw2VaLAIhiK5RIQ39Lcp+K8UMK5m
 Smyhj07umvkJj2NoSmZK86lNERKFE8s=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDE0NCBTYWx0ZWRfX42Ed+xncZPn+
 2jnQdAwEFxfE8ZFLXGlHPowt8cKClwHjwCpE/7fP1y1GclEG0ZIDhriTXyPawvlzAg/U1cd0zoW
 Qt4v2Z39v8s62n2D6vmCaRjI144kPC64XRmoBC88SCxJV1TIgOWYJEK0tO+p9WXGBuAV4zm5gsY
 C/cOtw2Tym+is6W82WwzucE9unCTIUKNhTn33/aDmK4ojNhdVZixa8ejIQ2yGNS4XlO00fppvUR
 clwPnACExXl4kg3nNBXZwBLNNYk7C+clkgFgUidWvt+J97HeVB6wsQ8HFSgAKDYWgEet2uD29if
 wTlCYQSSxXAf71DfbYl8t3iqIyVhYudaKN2002pFraQCvKL97ZMZbgIx1kPH83p37Txm58x4ZqU
 WKvafvrL2nU/YcO/f9uBsg+dO18sUJfgcPBxhGT10IxMZRSXFAB2zo4kIY3xvjVcYzRPEw9zFs2
 6D5umfXm6lvg+/HFiSg==
X-Proofpoint-GUID: sQkTWPCOZgSgoDW-hE5-gqTwS3D2daUA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_03,2026-08-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0 adultscore=0
 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608040144

The Milos video clock controller requires the CX and MX power
domains, along with their performance state votes, to be enabled
before the clock controller can be accessed.

Document the 'power-domains' and 'required-opps' properties and add
them to the required properties list and example. Since these
properties become required for the already-documented
qcom,milos-videocc compatible, this is an ABI break for any devicetree
using this binding without specifying them.

Fixes: a4937e974186 ("dt-bindings: clock: qcom: document the Milos Video Clock Controller")
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 .../devicetree/bindings/clock/qcom,milos-videocc.yaml | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,milos-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,milos-videocc.yaml
index 14c31efe1308aadbea61eb7be7e56039a923aec5..4d8d109cd304ef0f5afc5c3fc7961a6156003d4b 100644
--- a/Documentation/devicetree/bindings/clock/qcom,milos-videocc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,milos-videocc.yaml
@@ -26,9 +26,21 @@ properties:
       - description: Sleep clock source
       - description: Video AHB clock from GCC
 
+  power-domains:
+    items:
+      - description: CX power domain
+      - description: MX power domain
+
+  required-opps:
+    items:
+      - description: CX performance point
+      - description: MX performance point
+
 required:
   - compatible
   - clocks
+  - power-domains
+  - required-opps
 
 allOf:
   - $ref: qcom,gcc.yaml#
@@ -38,6 +50,7 @@ unevaluatedProperties: false
 examples:
   - |
     #include <dt-bindings/clock/qcom,milos-gcc.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
     clock-controller@aaf0000 {
         compatible = "qcom,milos-videocc";
         reg = <0x0aaf0000 0x10000>;
@@ -45,6 +58,12 @@ examples:
                  <&bi_tcxo_ao_div2>,
                  <&sleep_clk>,
                  <&gcc GCC_VIDEO_AHB_CLK>;
+
+        power-domains = <&rpmhpd RPMHPD_CX>,
+                        <&rpmhpd RPMHPD_MX>;
+        required-opps = <&rpmhpd_opp_low_svs>,
+                        <&rpmhpd_opp_low_svs>;
+
         #clock-cells = <1>;
         #reset-cells = <1>;
         #power-domain-cells = <1>;

-- 
2.34.1

