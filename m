Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5966A471260
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 14:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787925949; cv=none; b=ggii62A56h34qWcCwXqYiMDMcFvLFsTtqQeU2hu02Z6wEZOZC59l2gqumXgH7PyYwc/MQx4qs43dBgd2EPT+iT5DPupTm2dAsFhHMZl6RXOA7BYpu5UDNVB3oHaTHs7oP0CR32xtkE0uRhqBYrCxh/5oI9/qWKOBugZqQPgm8mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787925949; c=relaxed/simple;
	bh=2ZoWKXh14IFtzY+jQ6vF0Zhx1BAkHO8mYs9EuOJq9ck=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Emx8ADzo5HUffifYzQDz4ogiLz2L0cMG2FphjVy7wZBjm5A7UoSyUF30ka3vzz6a7STGQUv/xmIi/rJyD9XUGHZoUyA7n3azETkngTQgVkgP9O3mXJIt49ZdlThM6fVAbOM7VqJtPFMU68YJNcwvLKhCwvkuLmk0c/8E05zlpOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y8nkxqiZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EA9wHJbD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y8nkxqiZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EA9wHJbD"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SDkgl73279883
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 14:05:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hMggueJrEfi9Ea0CXs0IW5lUopvMP6HZ3I3Pa5LDYY4=; b=Y8nkxqiZpP6cd/Zr
	D9evTg+nu14ILTepQu3MQa4ruXrjJUDhPeHJCg0zkK1FOgFv0Qgp1zr5nzvDt+iU
	3/9/JjcEZmq75vtQ2wuzVWhZ1AqS62b6p7t3Slql0K0pHBSnG6PruHDuw+ypmBuO
	I22wGZvElXpzB2wtKdlAWKwTP2xOY/L8fkkVtGbWmaRNTEIx3VizOam/cbIy9glj
	dM4OFkqzd5TlR5i8BE1G1Wp25jCE9CMRtWA+eo6IklF6LSLbulEtRrfkCO5/JNx+
	U48FB3As1OwhJ7roJzuSMGfMVuqzNiTyRoYjnFhSWm5z+HvJZBJMLov8ExTYtp6I
	Rf2Skw==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb62h1gkr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 14:05:44 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-97e3331c6fcso82950241.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 07:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787925943; x=1788530743; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hMggueJrEfi9Ea0CXs0IW5lUopvMP6HZ3I3Pa5LDYY4=;
        b=EA9wHJbDHPK7oGmdXuvfbKre3pteCwVoytsF/956ytGZjNOenL2FtCv9x93tea93od
         eLqqiXxriODU/Lon9EeuAwOkyCG31hs+SFRybsUnDU5iqqf2v+GC5qBb/4b2AnYU/HiX
         i6zlF7DIzS18FC6fxRlza2iddeHN8uyf69LmY718SyMVYBQSjrJCi1jhdxy4DE6457W+
         FCcG7aWbHgzrK6/hS6p6RvcAJ8+e1YzFM9LLMiaNEf9FfmPQQx8EX+EAPnBKizNCZu7c
         eud/rjj+AmLU8WZ0BCI4C22f7xThx4p99di5qwPP9y8/V1IaP/mAw5RjfZyu47Bg8T4g
         m5Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787925943; x=1788530743;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hMggueJrEfi9Ea0CXs0IW5lUopvMP6HZ3I3Pa5LDYY4=;
        b=AENmVcc3oKtyh0z2k8ubZtGIBs2402IeNEeC/+EuSXagp/BGa/ze5Q10skvGXvvUKL
         sdfO+JPfWQC95ev54GM6MuVnLFrzURxvZi8g5Ak6UhkLr+R70hHcI++Y2HM2Ge6ypYpe
         3tfFr1/UK95Mo9BwSCjhN4OfuqrlgeGKv5WN/glacJOb9TSxDNRHD9SgCjRt7qaGaKK9
         tddvuiPSpU3Lpn/FZcXy+ru7QXmGriuh6HW8R+o1vJqmRUgZoL/TjcYLG/kse65bDWK7
         6J4Bsup/xNms/R30+sl4ZEX9R5CO7gnhoaJN2r7Ylmg8d/mDClHK5wHONnQajjIfurc0
         nk1w==
X-Gm-Message-State: AFuF++mDd5VRf+BRAZ81pxTw9Ooni/Lfo/qrMkTjoijqfchSUESiw0/o
	udqThFM8t/bzUYodxoTsUcMWZF6NIXfRCgr2+vQVzJJ6bRo/d0+2CSWQa2kF1p3wh6x0mczY5xG
	/oDVOBB9oC3UVkFcvZKy6Btg7B6i4noCqoIqaRQpWNVR+/ZTmHqPvtXyOaShERJkIvXns
X-Gm-Gg: AR+sD10tb5YpKltIUT2yg8rh82RZ9gJBDKmKSTFzU9HVdmx5P6YfofaNMyR1fOeknMk
	eOKPvmLl8PY1bD9H3ctPRoL6F/bsPU2PVBPiERBYGeIL8LPoupPgq1Qg7AUHiL7pxeIfxEleIh/
	aPf4D3LvT7j5mu/y6wF4SRD8/QtNaBaIBIvWOltMdXoHYS7DSPJqEeZC994+2VxbZNayWYdevHY
	ybB89wHd0zgX2znVSnfTgWVHYJewWXg2zQsxAdVftUosAicn7wy+10Z3Atu7wxe3RqA0QUDsY2w
	AyaY+ZB1j9s/JXG3vPEqiaMYSDgJBOtZDDd+l//ks5zPT46tUVVZ1sWt2AHeRH4qYfuFZhDXubm
	Lo5oaZNUFcsbRTKuDBCg3GTU=
X-Received: by 2002:a05:6102:441b:b0:785:3211:f5e4 with SMTP id ada2fe7eead31-78596acadafmr1836546137.4.1787925943394;
        Fri, 28 Aug 2026 07:05:43 -0700 (PDT)
X-Received: by 2002:a05:6102:441b:b0:785:3211:f5e4 with SMTP id ada2fe7eead31-78596acadafmr1836517137.4.1787925942860;
        Fri, 28 Aug 2026 07:05:42 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbb20122sm3908633f8f.20.2026.08.28.07.05.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 07:05:41 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 28 Aug 2026 16:05:04 +0200
Subject: [PATCH RFC/DO NOT MERGE 06/12] dt-bindings: display/msm:
 eliza-hdmi-phy: Add Eliza HDMI PHY
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260828-drm-msm-hdmi-eliza-v1-6-67843277de17@oss.qualcomm.com>
References: <20260828-drm-msm-hdmi-eliza-v1-0-67843277de17@oss.qualcomm.com>
In-Reply-To: <20260828-drm-msm-hdmi-eliza-v1-0-67843277de17@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-phy@lists.infradead.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2303;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=2ZoWKXh14IFtzY+jQ6vF0Zhx1BAkHO8mYs9EuOJq9ck=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqkZWdh7HfytneGYVObjElDzO1HVTUQvEj7tn3D
 XQg6/WJeMmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCapGVnQAKCRDBN2bmhouD
 1wt+D/9VrlG2+yThOGo4fnvqiAFSf7vxedxD15XsiCrnglQiiclrvXuBJ3VNN8TrQJtLNGagih5
 dlXwCMTqnHie8c+pydAR5ohQsNXDyardZTgaAjUirpa+wZxFF76rfVBGKcu0/e2IjdltiQVr6yj
 i0XvsNaS4q0w50TEkK3dOJP5fDmBVBk6DDwMA8NiHU6jsxTuK+LQTnKCsR15L2BsGrosX/BrRd5
 zlzVIxnvLOZaqWeuL+Ky+gDjlHyidxGbz6JCzs5e/Z3g95iBRFC3B7UVcJCK9sR1TCjLdxHefnq
 kVqh+FgzvcbKHsZeSha0B4TwlDbbTZPmdbmGCnZuLNfCHlF/wpYauRTJ5uHTEHIATHixlEXerA5
 MWx3Br9x3dvPUIuFzKpKXmkaQlPH0zGkRQ/FdHxjk4NeSLjX4DGWCzbP+eKmzfA8e5WflT1sph+
 8+51rU4aTvygnPrSOZ9PwIrtNNmojcZZlHvAhGftM+81G9umoXMirbdZeXvorC3n+5UbADeFamF
 vft7Mdm584q+tmdVV8rc0qNKI1RGdgvB6swbSbCZByK8n74Vzo10dbCcZGE7e+JlZJdoSlZF7fQ
 CxtCIGKfM/IxK93srEX8Hn6ENL5br4AbNBG1dWR71NCSsjO3jMECbDGN6NscLiszcsQgElAMMNM
 R3/NufZ/7h4Pn+g==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDEyMiBTYWx0ZWRfX0CYjsinrJ5qN
 a7D364sIOr1keo4hU7a/JYlkbKwDC7Ouf2q5Z59G0mTdpIEJCd7WYcHneKcjPwTUpjYC0sWiK9U
 xlo1uQWbczClErZlGoxVJR95FW2oCfI=
X-Proofpoint-GUID: 2GXF_Cf9Tdj1nuB6EdjM1BSuMeoR9cvQ
X-Proofpoint-ORIG-GUID: 2GXF_Cf9Tdj1nuB6EdjM1BSuMeoR9cvQ
X-Authority-Analysis: v=2.4 cv=I5dVgtgg c=1 sm=1 tr=0 ts=6a9195b8 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=m4uPUOG36isBoBWOdqQA:9
 a=QEXdDO2ut3YA:10 a=TD8TdBvy0hsOASGTdmB-:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDEyMiBTYWx0ZWRfX7dbK6DMu3IUV
 qjUTOwZVuQTZMU/wpHOk4CzcIg3yM5iPsXF6eb9rMNahL/39baudRn4G606srXAKgDje16XJ9VS
 nB35JVkiyRj5W0EI3rXbz9URC9mcQTW6gEGc6uBD8YXEeAvrzfjraUkaMqPs9j8DwEojnhMJ1M7
 SFViBWfzQCDDrLiECtJu4NkiW7wGbTC5jh0++L1vp46tcyz+7kt/xTSi5YMgn4zd2Xt0bMoKeZq
 AV/r2i7ZkfGVUSMPiB3vHOAallNejC36f126yl2cEujzEufPahZZg0B5roVP997Qox/fqVBLHL9
 Rmb5gcQMz8T++4vIYgmOYQ7PaQjzhmVYYx7poEoHeWVQj8MCATKFL1DpjyGPDDg8mJc73GF0bc9
 k0ck5kviV7utk0XCITXLsaTjLT/wuFacU0TbkS4VlG9FhB7GWwj71mhfb4pXBrkeXmNZkmSGxxR
 D3NK6x0KEpaE+Jqom3w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_04,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 clxscore=1015 malwarescore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608280122

Qualcomm Eliza SoC comes with an Synopsys HDMI phy, unlike previous
variants with HDMI support, thus no compatibility is expressed.  There
is no documentation, except register list and register programming
sequence, and downstream sources do not point to any supplies.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/phy/qcom,eliza-hdmi-phy.yaml          | 71 ++++++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,eliza-hdmi-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,eliza-hdmi-phy.yaml
new file mode 100644
index 000000000000..764fec0ef29b
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/qcom,eliza-hdmi-phy.yaml
@@ -0,0 +1,71 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+
+$id: http://devicetree.org/schemas/phy/qcom,eliza-hdmi-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Eliza SoC HDMI phy (Synopsys)
+
+maintainers:
+  - Rob Clark <robdclark@gmail.com>
+  - Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
+
+properties:
+  compatible:
+    enum:
+      - qcom,eliza-hdmi-phy
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 3
+
+  clock-names:
+    items:
+      - const: iface
+      - const: ref
+      - const: xo
+
+  power-domains:
+    maxItems: 1
+
+  '#clock-cells':
+    const: 0
+
+  '#phy-cells':
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - '#clock-cells'
+  - '#phy-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,eliza-dispcc.h>
+    #include <dt-bindings/clock/qcom,eliza-tcsr.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+
+    hdmi-phy@9a0600 {
+        compatible = "qcom,eliza-hdmi-phy";
+        reg = <0x0aea1000 0x1000>;
+
+        clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+                 <&tcsr TCSR_HDMI_CLKREF_EN>,
+                 <&bi_tcxo_div2>;
+        clock-names = "iface",
+                      "ref",
+                      "xo";
+
+        #clock-cells = <0>;
+        #phy-cells = <0>;
+
+        power-domains = <&rpmhpd RPMHPD_CX>;
+    };

-- 
2.53.0

