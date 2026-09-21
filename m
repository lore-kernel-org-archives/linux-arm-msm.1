Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7385E48167B
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 10:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789988321; cv=none; b=DZMMQ16s4BO+80RP8T+hzeyIR4so3tIuoWLFMvegKJDp0hsjASghzlgO2U6+UgHvULSL6bNA9ri3Fiv0IIP7chsXdJv3WnaO1wPuWN7Y+AVo9Vdsfore0UlZl71LVPCwp0X7r0QNQsCiw72eV64zasacbLlqvfsgGzGzf55lxbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789988321; c=relaxed/simple;
	bh=XqGrQUh0pQxlI5u9LP+UKJRIL43iT5tX45CHxhXgMCk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QY5zu/8MIpPfkHbgVyrNvy7/ldK2o1MoTq8gOlYlGqzDEt/vSenDlS0swetVhwVnTmJFd0CWcYx/PcRJ0x6lliCt8Ms9YQbw8oL0xS9UsJUEKI2ZQVNa1V8s9f0g87uGmmsTYNC0bxBVZHweUVtqero0JUZbzJPM4TutkHhjMzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oXVi0W9p; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Thde107m; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oXVi0W9p";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Thde107m"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LAeEb81219020
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 10:58:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vo3Y19h45VaNjy1xkCcVniHXb1WIEPxZlIG7JByPcWk=; b=oXVi0W9pQkk1wheu
	JS4xAcTjV0cGGIJqVfAmx0C09R24AVEkfafyG2JArUZAi+Y/dIdgB8jaIz64A8XK
	Pui+pNBWYCatVUNdnBTrD5bKoJILoWUn5/N/MRp4T2xvpU7IhrxTJfYujN2Au5ov
	k6XjE8JvzNOunP+yMLEJ9hzeQ78YDOT9Cngq2TFSkyfk1C+8ab4WRsjTt3Anddke
	wGRF4caUQhy/+nl+z5xlw2X2gYNHnd0xGHKDxO2Grg5k+Cfpv5NBJf08wyqPdYPm
	pBRnI//mq13zO4QmvLWOQROZm1D54eGljj7rCma6HZeVW/fpRQp9baNWBvrgl+Pu
	2vYE3w==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu0118vxa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 10:58:37 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39e3c10ac70so7309128a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 03:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789988316; x=1790593116; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vo3Y19h45VaNjy1xkCcVniHXb1WIEPxZlIG7JByPcWk=;
        b=Thde107mPQO173tlruX8708alTv6NVODPnJPDP+RtHAvHE/dFF/on2gUxE7IPKoqnk
         rnTAynnFlTlp5CQnz8RPPBlZwvMiAb/U7g4iuNJad6YjVrAd/y+ZA/EkZhFg2FPNr6fN
         cth7Jxf26yjPARGtcDvQzubNm/bxr5FnWo8QVA++B2xV5bRSBPHy42JHR+YEUWIm97im
         O79Afa48WOeXs0ebb1p6sWyVgrfVrlTofn+m/V0ocKhMouWpZpbIibfT4Q/WDhO4CZqO
         hhcKocANvnLKpG5QO6tD+PAIfIx2J3cIpS56TDE0fsjJ6qGIxdASOTvdsWqkY1kd72oK
         znvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789988316; x=1790593116;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vo3Y19h45VaNjy1xkCcVniHXb1WIEPxZlIG7JByPcWk=;
        b=xdF3laUmYWnlWu6sQ7GVkfvJAxgOX6i7ISOdDF60fATM/v9z/fx3gCkoPTYU+7449j
         30UvWMAbyYg+K6ukgUUxWzm9QW/OyP7R4/KkDHAx+nkHJ4u6+hdf8weUMWMl7XMscEPW
         mQb4JV3UYNdkjl3t4T045l7jh1ZturrN1kcOlXuObLlfao3DsEMF9flZ1MUtgILO42u2
         r9sCE0Jda1bahS//lWwMa05Wewcfv/X0lw2qEH/Dhj8UYEWAdTi7spks7wg1xRJl104u
         hz13JxGnLQRtoJ+rQElFfXYugvoh4GHrN1sbmuuV8HCMQq0Xtaz+eYdNCbALfPdetqZi
         Mhrg==
X-Gm-Message-State: AFuF++l9W7UkXdq8yla0VS7io5+RktFGBIzzAfALUrAoT43k0DvpGsHm
	66LbBu+tOM2pwfSOBB5mqfp09o5G5TaMyMwSqkaaDfqEU6w0Z4r0k1ST8YSKcahkfubQhRh2G32
	yTbh0WzParl0nbUNsieOfamz8Dcc1lIeUj6SO8EOhB6UuPjLFqMmKLhP5P6obsewT3PU1
X-Gm-Gg: AYBFou2zDBk8nQ3gLLgdaiPiK7MGY93hIxAMrpGFKi7rzk+7FZTbrqNlOL/K5kT6y6o
	7jxx6ZOclkJXeXUxzr7dZnrr712U8Pp86epZ1JVGyEMyouCisJsRvP8xWYsGdd/iz5uUfARq1C+
	VXyn8pctzeYzKe43P3+2YQMQsy3Z6X/BnEKZ6ztCEczaA+Q+Sc7XZBhnvc1KRHEkkmDx6u6bze0
	VPMOSgfeOoQaaP3hRqnGfwgEFnpbcyusg4hqhnzqHhcM6cJxHqGHhfrWWFT9W2ULfjxaCUUyP85
	B69s19Q8cT9bir9e1uZav6FZ8CSCHkd+Kt9N8mQPXVCTMjzK3u4fJ9YrqEpyXm3Yq7BdLVSzDpK
	moiz7PxwJzdeNOABL2xVWib7eljfbAU46+A==
X-Received: by 2002:a17:90a:e7c6:b0:39e:6a82:afd1 with SMTP id 98e67ed59e1d1-39e6a82bbf8mr10312556a91.35.1789988316519;
        Mon, 21 Sep 2026 03:58:36 -0700 (PDT)
X-Received: by 2002:a17:90a:e7c6:b0:39e:6a82:afd1 with SMTP id 98e67ed59e1d1-39e6a82bbf8mr10312527a91.35.1789988316117;
        Mon, 21 Sep 2026 03:58:36 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c331d55cfsm23544128eec.30.2026.09.21.03.58.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 03:58:35 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 16:28:12 +0530
Subject: [PATCH 1/6] dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Add
 qcs8300 16 GT/s PHY
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-monaco_ep-v1-1-63c5282fb0db@oss.qualcomm.com>
References: <20260921-monaco_ep-v1-0-63c5282fb0db@oss.qualcomm.com>
In-Reply-To: <20260921-monaco_ep-v1-0-63c5282fb0db@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789988304; l=4836;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=XqGrQUh0pQxlI5u9LP+UKJRIL43iT5tX45CHxhXgMCk=;
 b=TXphv9z96EcWO2ZpF3LQqu/44x8GLI5vZQ8CVlLbonzmTdfKTFy+PSBhIjHLrtx+XhdbWCe5q
 igdGK1BPtRsBJYvL+TnOeOmiitsQ/PzGJX6r69ZzUz9GaAJmz9leqpf
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: _gJf9vcgq_OgGMqGVnxBwu5QlUrRvdap
X-Authority-Analysis: v=2.4 cv=dPczC+Zb c=1 sm=1 tr=0 ts=6ab10ddd cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=VirKNbUofNnfAjYdglcA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE1NyBTYWx0ZWRfXwq7RjZ/g414w
 czIATuQLzh4Pf708R4xn1IHgTCtTI55Bqi4gtYchpM46kNd9o4GpMGCAbMryuXwhBkvDB0FvIPt
 jmY+uHGqeDS9Tv+XvNOhe3i0BrTLwxfKlUtWEKN5Bv6UcEpoUPHfnBJR5DnxQoJiC5G+gXE6i3Y
 4HvrO+rsYGuR5bC4470Kynu+v6XgK628hnK7NpJdjSCcGPESqPefZG7qIY4IkVnFboYKsysLxFa
 u7YM1brBSiSXkx1tIX0N486zsQVnsyLSz2DW5dtRdIKqnJbnoOb7w9jPOoEfuh/ZW4RhWAs8dyJ
 CydrIW2KtRkcj3lKBCoHcHE2pzwrU9deiNWq+f6cpx8ztX1FTlL/O1bGlsu/UWwVEGV54qFgReI
 6pGILEIpGvaYylgUamAZczFg7p5n6avdS5nKzPkEqSFpe/stQt6pdUVEiM/EKv+VcQ7dfu/DnK8
 XKxkPd45/bwecEbXUoA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE1NyBTYWx0ZWRfX3ofBD9m9zqDj
 92Tf/xi5shUeHvDEyV7ANA5CyAlGN01B+NzKbymNakkT4Ly5+OSqKtBjoOyusxh4uYHBu2oKgte
 n0bYF0t00MaWS+DQoEHiq72IrJEqOrA=
X-Proofpoint-ORIG-GUID: _gJf9vcgq_OgGMqGVnxBwu5QlUrRvdap
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210157

The QCS8300 16 GT/s x4 QMP PCIe PHY was previously described using only
the qcom,sa8775p-qmp-gen4x4-pcie-phy compatible, since no QCS8300-specific
compatible existed for this PHY. This was a mistake, as it left the PHY
undocumented as QCS8300 hardware and indistinguishable from SA8775P in
the binding.

Correct this by documenting a dedicated
"qcom,qcs8300-qmp-gen4x4-pcie-phy" compatible, with
"qcom,sa8775p-qmp-gen4x4-pcie-phy" listed as its fallback compatible.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 .../bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml   | 87 ++++++++++++----------
 1 file changed, 46 insertions(+), 41 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
index b353b7bfb839..34d3a714716b 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
@@ -15,47 +15,52 @@ description:
 
 properties:
   compatible:
-    enum:
-      - qcom,eliza-qmp-gen3x1-pcie-phy
-      - qcom,eliza-qmp-gen3x2-pcie-phy
-      - qcom,glymur-qmp-gen4x2-pcie-phy
-      - qcom,glymur-qmp-gen5x4-pcie-phy
-      - qcom,hawi-qmp-gen3x2-pcie-phy
-      - qcom,hawi-qmp-gen4x1-pcie-phy
-      - qcom,kaanapali-qmp-gen3x2-pcie-phy
-      - qcom,qcs615-qmp-gen3x1-pcie-phy
-      - qcom,qcs8300-qmp-gen4x2-pcie-phy
-      - qcom,sa8775p-qmp-gen4x2-pcie-phy
-      - qcom,sa8775p-qmp-gen4x4-pcie-phy
-      - qcom,sar2130p-qmp-gen3x2-pcie-phy
-      - qcom,sc8180x-qmp-pcie-phy
-      - qcom,sc8280xp-qmp-gen3x1-pcie-phy
-      - qcom,sc8280xp-qmp-gen3x2-pcie-phy
-      - qcom,sc8280xp-qmp-gen3x4-pcie-phy
-      - qcom,sdm845-qhp-pcie-phy
-      - qcom,sdm845-qmp-pcie-phy
-      - qcom,sdx55-qmp-pcie-phy
-      - qcom,sdx65-qmp-gen4x2-pcie-phy
-      - qcom,sm8150-qmp-gen3x1-pcie-phy
-      - qcom,sm8150-qmp-gen3x2-pcie-phy
-      - qcom,sm8250-qmp-gen3x1-pcie-phy
-      - qcom,sm8250-qmp-gen3x2-pcie-phy
-      - qcom,sm8250-qmp-modem-pcie-phy
-      - qcom,sm8350-qmp-gen3x1-pcie-phy
-      - qcom,sm8350-qmp-gen3x2-pcie-phy
-      - qcom,sm8450-qmp-gen3x1-pcie-phy
-      - qcom,sm8450-qmp-gen4x2-pcie-phy
-      - qcom,sm8475-qmp-gen3x1-pcie-phy
-      - qcom,sm8550-qmp-gen3x2-pcie-phy
-      - qcom,sm8550-qmp-gen4x2-pcie-phy
-      - qcom,sm8650-qmp-gen3x2-pcie-phy
-      - qcom,sm8650-qmp-gen4x2-pcie-phy
-      - qcom,sm8750-qmp-gen3x2-pcie-phy
-      - qcom,x1e80100-qmp-gen3x2-pcie-phy
-      - qcom,x1e80100-qmp-gen4x2-pcie-phy
-      - qcom,x1e80100-qmp-gen4x4-pcie-phy
-      - qcom,x1e80100-qmp-gen4x8-pcie-phy
-      - qcom,x1p42100-qmp-gen4x4-pcie-phy
+    oneOf:
+      - items:
+          - enum:
+              - qcom,qcs8300-qmp-gen4x4-pcie-phy
+          - const: qcom,sa8775p-qmp-gen4x4-pcie-phy
+      - enum:
+          - qcom,eliza-qmp-gen3x1-pcie-phy
+          - qcom,eliza-qmp-gen3x2-pcie-phy
+          - qcom,glymur-qmp-gen4x2-pcie-phy
+          - qcom,glymur-qmp-gen5x4-pcie-phy
+          - qcom,hawi-qmp-gen3x2-pcie-phy
+          - qcom,hawi-qmp-gen4x1-pcie-phy
+          - qcom,kaanapali-qmp-gen3x2-pcie-phy
+          - qcom,qcs615-qmp-gen3x1-pcie-phy
+          - qcom,qcs8300-qmp-gen4x2-pcie-phy
+          - qcom,sa8775p-qmp-gen4x2-pcie-phy
+          - qcom,sa8775p-qmp-gen4x4-pcie-phy
+          - qcom,sar2130p-qmp-gen3x2-pcie-phy
+          - qcom,sc8180x-qmp-pcie-phy
+          - qcom,sc8280xp-qmp-gen3x1-pcie-phy
+          - qcom,sc8280xp-qmp-gen3x2-pcie-phy
+          - qcom,sc8280xp-qmp-gen3x4-pcie-phy
+          - qcom,sdm845-qhp-pcie-phy
+          - qcom,sdm845-qmp-pcie-phy
+          - qcom,sdx55-qmp-pcie-phy
+          - qcom,sdx65-qmp-gen4x2-pcie-phy
+          - qcom,sm8150-qmp-gen3x1-pcie-phy
+          - qcom,sm8150-qmp-gen3x2-pcie-phy
+          - qcom,sm8250-qmp-gen3x1-pcie-phy
+          - qcom,sm8250-qmp-gen3x2-pcie-phy
+          - qcom,sm8250-qmp-modem-pcie-phy
+          - qcom,sm8350-qmp-gen3x1-pcie-phy
+          - qcom,sm8350-qmp-gen3x2-pcie-phy
+          - qcom,sm8450-qmp-gen3x1-pcie-phy
+          - qcom,sm8450-qmp-gen4x2-pcie-phy
+          - qcom,sm8475-qmp-gen3x1-pcie-phy
+          - qcom,sm8550-qmp-gen3x2-pcie-phy
+          - qcom,sm8550-qmp-gen4x2-pcie-phy
+          - qcom,sm8650-qmp-gen3x2-pcie-phy
+          - qcom,sm8650-qmp-gen4x2-pcie-phy
+          - qcom,sm8750-qmp-gen3x2-pcie-phy
+          - qcom,x1e80100-qmp-gen3x2-pcie-phy
+          - qcom,x1e80100-qmp-gen4x2-pcie-phy
+          - qcom,x1e80100-qmp-gen4x4-pcie-phy
+          - qcom,x1e80100-qmp-gen4x8-pcie-phy
+          - qcom,x1p42100-qmp-gen4x4-pcie-phy
 
   reg:
     minItems: 1

-- 
2.34.1

