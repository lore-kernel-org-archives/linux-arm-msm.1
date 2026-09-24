Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E65E472777
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 10:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790246419; cv=none; b=DPb3SP11/OediF2wR/mN3ULawB0TDnZNA8Jpr4TGqLIyRV9VeWMHllTr0GhESk3jrd+zUD8A8q3AkboFn/QvhNS7ehypfVEwo9kkrqbTUK86lyIUoCS9CHVXuyUt6jnJIyOAOP/UhmEqdIo1bt3YLb54mC7mLWBZdK88K8NwTU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790246419; c=relaxed/simple;
	bh=nMD6xMrn6lL5iJ8IxikWl8h53ZFdj13HahcbJwWFnFg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BBSyS/GHGyCg0b0Xpm/XvHQRi1nbHmeiMmI7Cnm2cJ6U9UBx72H+8W/fOfcIex98ANfFpsCYLYrX3qQuusGJee2ct4xf+o0CaONv2ZYkeo1B7kCjsWqsgvN4APBBz515pDwYksU1m9KfsPR1EYwq7/VqdmY/N/C1UHhJelzmW0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VIgTYuOI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gj9zxYC8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VIgTYuOI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gj9zxYC8"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O9P90a1923773
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 10:40:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	blnAvdyz/oCP8BFz0wT9Q0/FqHtwsyu3g2gkST9t3vY=; b=VIgTYuOInlVmn0v5
	vWolzsXHUFJcM8DIsM3mHsWebas2M91suV5pqqp2d4wskUbqKjTKvzvWMHkI/6OY
	fJ/JHFIzAUtWVShfkg9lEDaycTDswi96RwBlXur/e1eTOO/Ji0e+xfXkVafG9l+g
	Cc9BcfNRnhTa0AI4xxFgWC6kaHJnYLq+4fyRiC+6VxuWwgfqqV9Cn5lJ8wcdL849
	JWt1A48I0pGjGA/HRmEzHhC8wuY8dJTpmMnGg1onovrN8N7frnqcr/RIMBEzTyWx
	Ia8m+kRh6ZBgGTQOLPysxTAoyj6RCnmg7jJzvzANy+28Ax0uTSvIfrQycV7bo5H3
	AOuT9g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvx8ah5gu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 10:40:12 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93a0b66ecd9so232591285a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 03:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790246412; x=1790851212; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=blnAvdyz/oCP8BFz0wT9Q0/FqHtwsyu3g2gkST9t3vY=;
        b=gj9zxYC8fToRU1Z9W5VKKve2npkJZP6jpkzTTUViUkbA59FmlyTfzL998/xROHc3zL
         Z6Ft8A8sm47LS0erPprnyw8zISVfOr5X7+5gt3xwqIkD25PJlM5hjfPztiNqsGBQpPJg
         7cD4sIcpje1aJxoAnzKlb0sx/49YDKDEg7bOS60YvsJv2SE1TFSXX6sXdnKhANdDP+fO
         qE/zLkgJb5Z93KwDlUAYYKDgIbd79U3KV71alixV0QCKj715rStFh1j5VAwE2KZM3hjt
         5uARLnFB7uWPFxvjziRlTYpVSlP1okmmGghvAaeCwma/qmlTp6KhpqGhV0jSJt3kxGuq
         3bqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790246412; x=1790851212;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=blnAvdyz/oCP8BFz0wT9Q0/FqHtwsyu3g2gkST9t3vY=;
        b=1GGSbXNMS/Kx1y1sqYmAxoVR4jqpQclvYjLEiNT+4a9by2b/vi//aCHOFVvqyBh/Y4
         pTJp2WJaN9I/CyxjnA6AmUVzzltsHGjCpZzmZI8y1kNELoeQzn+gu5wazpBAmGLtPdYi
         hl0ts3nLWL3X1Id0xyl6rsIZ8xLBIfrq2fg+sSvRqf+Nkci6MMAzjzS0EQNj9VTI001z
         HF8IrCWELolQ4u1INUvhmGTJP7f/TEEqXKzj8gWHvp/KcLFU0hxROGt4gwd2r6fI8eWc
         DCjwHFS2ZPM7S25xnrn88tTtflEcsr6U7Kd5aFyRlbg+oqxDZJda2PAs/8NRfK1qr6vK
         wCEA==
X-Gm-Message-State: AFuF++no1DwlEl7LzojeqUqM3vVE40x9V/YpVNQzQepNKzxMQzAxtzvL
	RWDDgmoXuOCKes5x+Ct2+OKeHoW8Wir9vDCDvKEKSAYD47ojIJ++Hvpgi7hRzcY2K+XGJfY/MfC
	HuyBI+LyRkwB5R36hvZLbpviZLOY5ZzGf0/Du0z/mc6D69KGZnn7pDglrCox3fc80RZZf
X-Gm-Gg: AYBFou2OP3FqMyeDQgRZ2CuUJ/+rW4KgIa/KWnoPhqV4m8G7mnk60aHQpP/ZIF41zQl
	1ELvCPmB+uYBEuSNfxSVlW90Vck6MO2ioCeZTRljrWOFNaZtg7SbL93FAolbQQdZlH7Mi9U4Zan
	4z4cSKfUAPGHUncCVAWzq37eMuSIKEU4UnFWxesUfOYcybHc0Zf2VR2QIGXq3KcUfvWYTbvIiiW
	xELnCEMxbSFf6B8fnneWafW+zgiE+am8gupW8KFj3eaUAJmFxDW8YVmV6Jp3dbrTEoYod1Qnc6X
	V2UuJH/VT+srEe3hk3JaeIa+ACO5YnoxhpFfdH3yKOrl5h31rTDldJanunCb9x4AM4Y4TIUX0bU
	G/YeaQqTX
X-Received: by 2002:a05:620a:7003:b0:93a:1264:7f46 with SMTP id af79cd13be357-93c36442915mr235563085a.46.1790246411652;
        Thu, 24 Sep 2026 03:40:11 -0700 (PDT)
X-Received: by 2002:a05:620a:7003:b0:93a:1264:7f46 with SMTP id af79cd13be357-93c36442915mr235557585a.46.1790246411058;
        Thu, 24 Sep 2026 03:40:11 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5dff204sm88239935e9.14.2026.09.24.03.40.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 03:40:09 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 13:39:17 +0300
Subject: [PATCH v5 01/42] dt-bindings: clock: qcom: gcc-sdm845: Require CX
 power domain
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-qcom-tie-cx-to-gcc-v5-1-38732033e5b5@oss.qualcomm.com>
References: <20260924-qcom-tie-cx-to-gcc-v5-0-38732033e5b5@oss.qualcomm.com>
In-Reply-To: <20260924-qcom-tie-cx-to-gcc-v5-0-38732033e5b5@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1542;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=nMD6xMrn6lL5iJ8IxikWl8h53ZFdj13HahcbJwWFnFg=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtP3b/+b7gJiKtrDdjdFve5kosHdjQ+34O3bxT
 AdYnfc3QSuJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarT92wAKCRAbX0TJAJUV
 Vq64D/0dSCCMNOo7QYQhn1N7bo1qPxyeX8nsejB0rbRoNBN3uo5tb+ma4SL7EhatXCvbMl4Jzs6
 BK48ttMnL1f8DnEwCJuZlQPofw+daMtRnR9GVIVo+6xlQ4Ya/kYTmq+8+Wzsrq/+CI/80h0ySRO
 N7hGyyM34lvh/QkMXGEEzxBH/v9IBKlzMz1Sj67aM6xl35NMYYYFfD6NezKgzw8h9GdCrHMA95J
 S5TBQ+JDGWtcfqwdvGqWuZBtfd+/vZWV1NaQuvymdBSIOsQ1IvARKpXvMVWzUMPoy+orBuImIeb
 oKo0+fesxKQ1HWoOi83SrMgGditQO1/RhAx1/SOcSxziwNfgONkurd86HhXmT6fv/SzbxpW6vri
 O1NEGW1IiELBKTinxKIiPWmupxopbpIOkljWRNdkTPiXHBMrPfCuNG6IRlprkT8Xkdqoyr8GKfD
 uLCCVCLtySpAkGOtQtVUMVuwTNCDT1RsHi7JsVH3ZZkB9RUpp1DNt26Zdyoah+qJ4pX8uTf6YXc
 a4bLi4/6/i8V9w56fdBAdED93DC6ZcWFqFfYTP48TdthJEYPnyF24JP257iNOTVikT4CB+FO2Te
 zCbLD7QGJNTj+lL+pMrkjMwG3EVXgpCuuJRP4C/a64uOYw1C07Q2VfatCYGRZFXTnnYoKJGAqWY
 f46ChGcOidCSW4g==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfXzo382V61CHas
 bQmPHF9cflIYt7nbRi/4K+ffeIgFmmelPWAc7HPS8l42rbRUv8nZslm2gqfnvvkrkg60y9cuA8t
 AFzH67XkihclTEsoMQq0BN+3hX+nRMk=
X-Proofpoint-ORIG-GUID: t4gYOTIg1ka7F-KwS4WiTuMeGT12-nsr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX2pyWjOR0EaoN
 yogE/je5sl1a884/MKJZZszY4kYqb8uSeKwWGk9et7R0p8omEV7lhvEsELt5sTBUIg57bllqMT+
 bH8Yr6osloqIs6Hphoo/qpm1xD9JB02FFx0r2mRQCCj9HqMqRXh8D1NB5dVj/VmIBtl97fAtmdi
 OUIU58dZeOQQWtOnqsvrf3u1mxRFU+QNzTUKB+svPjuejtUDT/TY5ccgRT2WpD4UfkEvCvBi0KN
 xdhFuIoHl6mw2Iyv65mfxXL7T3e/fmcOQxumLY0WcLOUGRlu48DDqYKTWKei0WzZwj1Olk77CMN
 szuy7oVv/K9DulA3y6m9ZEOkDPZrUk2YFlMgNLyJDrDeJmj6tsvSiC1P6DdsxJ/XcUWv+C9mlnz
 Ext35L9E1QSZWkjKWEWw0Ud9l+grHcdnHjBYeZ74EEoT1HYoML0ChCgYBEQ1Ju9JIrjONZbULhY
 D2CNMm3rjjvNYVl5f4w==
X-Authority-Analysis: v=2.4 cv=a6SlZkSF c=1 sm=1 tr=0 ts=6ab4fe0c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=ic6PIZLzPb63q0Q4sZMA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: t4gYOTIg1ka7F-KwS4WiTuMeGT12-nsr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 impostorscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240044

Require the CX power-domain dependency for SDM845 and SDM670 GCCs.

Without this dependency, GCC GDSC consumers cannot vote for CX and RPMh may
undervolt it.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,gcc-sdm845.yaml | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sdm845.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sdm845.yaml
index a7523a414341..41767eb11651 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-sdm845.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sdm845.yaml
@@ -31,11 +31,13 @@ properties:
     maxItems: 5
 
   power-domains:
-    maxItems: 1
+    items:
+      - description: CX power domain
 
 required:
   - compatible
   - '#power-domain-cells'
+  - power-domains
 
 allOf:
   - $ref: qcom,gcc.yaml#
@@ -85,6 +87,7 @@ examples:
   # Example for GCC for SDM845:
   - |
     #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
     clock-controller@100000 {
       compatible = "qcom,gcc-sdm845";
       reg = <0x100000 0x1f0000>;
@@ -94,6 +97,7 @@ examples:
                <&pcie0_lane>,
                <&pcie1_lane>;
       clock-names = "bi_tcxo", "bi_tcxo_ao", "sleep_clk", "pcie_0_pipe_clk", "pcie_1_pipe_clk";
+      power-domains = <&rpmhpd SDM845_CX>;
       #clock-cells = <1>;
       #reset-cells = <1>;
       #power-domain-cells = <1>;

-- 
2.54.0

