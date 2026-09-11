Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 898C1415B9D
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 15:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789141034; cv=none; b=YGp2m2oXx/dH37FlIgIAP5rTv/OybTDBxzV/9jN7BljIEnQ8reQfoEG8I7RofeyRhacDyeoAhQ2+Eals3BVhY5eqax78uMkbMBD+zHap6xLmROh4ZI1DvoPJPzwZ5WWBJCWrDJQzwFwpuJdEAR+YYn67jLO0gNJdZp3sWxW673E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789141034; c=relaxed/simple;
	bh=/ZCWN7jaJIDf8ZoNDtqLZ5hsZviVoJaGvIJdWT84aoQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A3d69fy/YugRxYBLZmqBFbU4Y2TGOyvjW7Yj4vNBbJhbzAh2kXaaGZE5kgV4kJgfjfh07shA4/vSN5xlP5lxH6sgVTYHCjSCRU/DkcadiEOASMWpyaDaOIMF4Trl633PLcQgU3Ia00JjKrrvywgfCce3iFuz9PaF77FKJ4imZq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kzixV0Ah; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aHowh7MQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kzixV0Ah";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aHowh7MQ"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BEm78P1090772
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 15:37:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+MBlKbsG25BxrzRCEnnBfFH5TzYzNSnlE4rjXRK1RBA=; b=kzixV0AhX+mqDzjS
	foSMA0MkL4iSWAe5cx4SOS9hje/AEsOEPwuJvVonLmBT8IZipOtRVrVvOsvU+FqF
	GJe1vKaUA+WnBUuYvs/h+7ziKu1qWK8CHu3LsZXVZ08jTQeZE6dH0MYdkVahS0Ky
	VQS8xllGhZPteDtR2xcKqpOufjYUdGYjWGmLWrzEWzWTQA4wdd4O7Gkp1Pzm2p+s
	IArgoIH8fQRx3B+NnNh3C7/jelYXAwWGMCgL5Nq3A0DX35uf1IW7XM2OfuzLnS38
	nekA//XJA+cW5UvH2HUEJM1abSSwqvM4Udr06h2S30Hf8INWvoxV4WdDhTejeZ5t
	KpswzA==
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmbd3ajsp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 15:37:12 +0000 (GMT)
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-448d51840c4so908248fac.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 08:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789141032; x=1789745832; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+MBlKbsG25BxrzRCEnnBfFH5TzYzNSnlE4rjXRK1RBA=;
        b=aHowh7MQAuIovNiUoHTCzJ4gfzFILiMaOyx6o/hkvC8XIIe+jGBIGaxpE9RpZcHYpb
         eBdQ7miOBHtqoSOgASgV80maTxbxb8MZl4ZcVu7Tqc2lf7/jl78ApjYguCx6bRIpN+Z/
         8BJx75ye/AXRFy2fChIsAekHx/8MVZLMb+O7hdZORv5olVZZRBivQNZzOIUqgGH9vHeJ
         jgdXTQ3qGyGD8LHcw9m6SvmUGufTnQBIAQ1AM51QYFxxypmVxqJdb50kW0lnhPuCYM1O
         zfo9ySHJszRtfdJqaEiFO9l1e9MBrMwqKlIaNrGWivbnCRoPzYdBV5Sh5zIUOlP+Pqvh
         N2LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789141032; x=1789745832;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+MBlKbsG25BxrzRCEnnBfFH5TzYzNSnlE4rjXRK1RBA=;
        b=hGnfuCd9lhZixKi18XIi9ZkZcpGiggEzyJb9vg+85R+TvAEH94uBF/kZR3JpHDqL21
         pTEPmJAiTF06f9LFOYh+60EEcBHcT1kyrbw9nJV04FI+AjkDukS3KLVpXct1Oeq90Uu6
         H61Nepfy80RO3xTJ4VocMrTa3rKk3jE0jn9LtpDfjkos5BEpwuB1RVXAxJAYMN8swJ7Q
         wrd7+zQzW0YKC9/XET8PvAK09MU1vFwOdQrArdU8aH+p4nODJSwD2CF/rB7HZ8YAEUgq
         Op6njLisaGE4yoQRIdYVH3kBE/uJhdhr1VXporqskNHrDwzw2QeOn+LX8ZyUzxn0pym/
         wfOg==
X-Gm-Message-State: AFuF++mK4fmCnlfa3AIvjT2Q/Jw739GzvRwdt6r4EmFy8gxhYh5er6yI
	m8CE/ZZrTJnP6Dof0iq2OmQy8LBre90qqS7HXHTH0VyJf1GEgPbmmN9fcojpdIO5ZRaEhewgiVJ
	wo9oL0x1cbvzJP38Rl1sEK8L+u/B+LrLfGv428/IBasvQS5xQ+RCPn/mZttu/jEB4HyLT
X-Gm-Gg: AYBFou0pqv6AeY6Qq3mQxjOu86wPVHNc5Gr4IUVXxxkuYCDJTPQcQdFwwn+/9v1QmkZ
	iUwbvdBxRqPqtwz+8i5SKJAPqSqoHMLZg0XgkRlkn6KEFreuopy5jWl8dCzvac0KTTHav0kBrhz
	e3V4CLO5fSwW+BU0e1i1B+/PxaaZzRC42985X6tRZlqf8Pihg/V3dfq1eaLSRXzLdhhhw6fNcwg
	9kE7AbcuqH7mqwc/oXcRXP7K3zuByofRccTwUMetgLx1F/UWn4+mSir13jNYJbgrbeDfUfl7UcU
	ZJoO64bnSSeM0CWUmsh9349KbUS6nwSIamdK/hEi/cNIE8hfxLfHvljYHPE4oWdSAhjrqavnjT/
	vgfjA1UiYpG0WZjHyLoQn3fRWcg0=
X-Received: by 2002:a05:6870:326a:b0:45e:f698:e310 with SMTP id 586e51a60fabf-47de79362bbmr3717054fac.11.1789141031974;
        Fri, 11 Sep 2026 08:37:11 -0700 (PDT)
X-Received: by 2002:a05:6870:326a:b0:45e:f698:e310 with SMTP id 586e51a60fabf-47de79362bbmr3717007fac.11.1789141031526;
        Fri, 11 Sep 2026 08:37:11 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-47df90ff148sm1882160fac.14.2026.09.11.08.37.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 08:37:11 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 21:06:32 +0530
Subject: [PATCH 01/17] dt-bindings: phy: qcom,edp-phy: Document Nord eDP
 PHY
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-nord-drv-dt-v1-1-e25c073cf1b6@oss.qualcomm.com>
References: <20260911-nord-drv-dt-v1-0-e25c073cf1b6@oss.qualcomm.com>
In-Reply-To: <20260911-nord-drv-dt-v1-0-e25c073cf1b6@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789141012; l=830;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=LG7yAm5EJ/K5hHiVQ9TOdhV/Qy+L/cR5svbIcTlXH+k=;
 b=HLVsBQTXbJClkf2ZEB8enXlHxfJqVSe1ahjDE+AFNK+5sflhib0OqP/ovtlGUgwOhusywMf00
 /9a3NVJqljGDjeLWuBGki1k0cXRknONchqtEa9u0DabP5wsZJWSi+4G
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Authority-Analysis: v=2.4 cv=Bv8IUoX5 c=1 sm=1 tr=0 ts=6aa42028 cx=c_pps
 a=CWtnpBpaoqyeOyNyJ5EW7Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=lCWEfuFUYIIHy-HYLagA:9 a=QEXdDO2ut3YA:10
 a=vh23qwtRXIYOdz9xvnmn:22
X-Proofpoint-GUID: S0hrGPu8DRu6aF368yBK3A7AHuANi9Xi
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDIxOCBTYWx0ZWRfX+AowtG9I8QU/
 T2csmbJiUChU3SoTMb6MB7LuYvzN1GAvvdf6pma+WoIlMAxC686e8YSn/fAObxARPX1ZB2pw0i8
 rr17yhpNNfjdmH89i6PQpPR8w1AQS4w=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDIxOCBTYWx0ZWRfXw8FIyWG/hevp
 bGCRK+Nzd9cH1QjW/qa8lKdE1X1Fj+JALi5xoqNmghjVHX3UzJ6iOgGu+RwVwrGlwUZ93vIrI8a
 Xt9IxR2sM3YTUcqeUypG8yVMS1tHhWB5qlRf2sVjwx7ldktdGsAu7D5THKtahmRRCRSq0hIudtm
 v+kNImLYxaRed3CA2NU/S29An47hUv3VAfPJInY1kJzfJ3uVqF1d9nAKl2iBVJTOrWZZ2i2LhNA
 hgc6vDF0TEs79WhSx+khDI0cH8YKn+3kMgAvQPS8ZUz2avW3Yd4xbq5cqZPes/nRyioXJmOszH3
 zP+PYO3266f4a5W/k8V0pLsm68DRvnBWLPyWTTKzcAL3cI+pGHPCqfT/dGFAOoAJ+GFcAAuCS1U
 +KlCIOenGRjO8L3KSiMHKVtYGmq3Gff+mSybM9u0MLiz9yKIjkHphUS+kxrOiAXKUl4DoJovh0p
 VagB1AjP6DWrif8FmYg==
X-Proofpoint-ORIG-GUID: S0hrGPu8DRu6aF368yBK3A7AHuANi9Xi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 adultscore=0 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110218

From: Mahadevan P <mahadevan.p@oss.qualcomm.com>

Add the compatible for the eDP PHY found on the Qualcomm Nord SoC.

Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
index 0bf8bf4f66ac..91d7a5c8e19a 100644
--- a/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
@@ -19,6 +19,7 @@ properties:
     oneOf:
       - enum:
           - qcom,glymur-dp-phy
+          - qcom,nord-dp-phy
           - qcom,sa8775p-edp-phy
           - qcom,sc7280-edp-phy
           - qcom,sc8180x-edp-phy

-- 
2.34.1

