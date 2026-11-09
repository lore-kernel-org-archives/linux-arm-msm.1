Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794213417;
	b=1oVhbkzncXRkIGDit4vxlkhjhd4QUJ3oNo/5UVlYU26kInvgUKbFrhX0xz62ZpWPHb55
	 8/QXpNGLuAfa3tlUAxsNQ5f11p96ms7NjNJOjrPQxpJO9iO0HZyxXT/IFnoOcwmXNVfxy
	 MftZyMi7SpHTVU7TqxQHYvkEeMDxi7UWHzTgPEnBuN0GNsE3NEesA6S8N65BqpfT2GlIQ
	 6+8jWZ5MFoVrIpKjcsQGRLEymjYvcoGsQdX1aeMnsX0ixiY0HcsahCzESgtE9FcanY2iN
	 N0SST+I3f0IUsEM1tkHK4Lw4R5AWc/wrqoGBig0KbiGZrPmazuju41fcjQIN9m1/O0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794213417;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=QlQZJAxO1Sv3Et4pFgTum0IApIio5YpzXsMhTuabOKQ=;
	b=hQX1fQ2U0hPuZ9MuFgXslkJB6XX1dmcsofIPLYpoI44KRhKRVYsKPV1hBfd6YvIZolWn
	 RaP8sUFFpoqqJI1JgIcG8g8tEDRYLHvczl0Z6YkVOpQ7k1X0EHNTYhCEWdTEThhLnDl5v
	 OSqFApcGqqXppM82ZBBU+j0cbAIMDVF2LWaua4lrts6iYyTjRv8RDw3szGwfYOydHV9dO
	 mvhz7d9Wi9NYk9r/HIhQSJINiWc8dXvGRv2e77C+wNfqogk+r5/s2FWB8rjWDpvf/dL41
	 Vt2TN8g6TsP1/BuWdihJ+Yv1/FmDPaEde4NLv+M9wXUzFn5dTNXWxVX8kGemuPDph3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=N3Y7bnYm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dzKYvDTv;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E590E606A322
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 08:36:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E590E606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=N3Y7bnYm;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dzKYvDTv
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A969wkP2668052
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Nov 2026 08:36:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QlQZJAxO1Sv3Et4pFgTum0IApIio5YpzXsMhTuabOKQ=; b=N3Y7bnYmtQ3Oupim
	X6wMIAQC9ZhmqQ2Vgg5pOkd9Ue88q1gu7WSF27cAZn6es+NQy1F1zq1MoI0glqm6
	zomiTk0bctP63LVEttJtm8q+FUGy/U5qfkcUYU3NxRYP6S1oVF0202kabQNf4fAd
	YsrUPypXSYSVBMuRvQRDHOM96J6GcRsT+D0rzS94mlqp3CSkMhf+45DDML5fuPE+
	xDANDXOpZ5TwzJLj2kMhExBY5tJr3axj3FhY+kjaNjuBeCcudopOoHM7Yq7hkIdf
	hmgcsOf7417/oBluY/Fav5uV10xKaKcuv1z5prJR3TMZkLzHIsoA/plVdh1umch1
	blEqhg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsw99n8fh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 08:36:56 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-946038e22f5so162394685a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 00:36:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794213415; x=1794818215; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QlQZJAxO1Sv3Et4pFgTum0IApIio5YpzXsMhTuabOKQ=;
        b=dzKYvDTvzH5BbbohQ1WOqpQevESHKYur/8kK0ccAUP3R2f03k8cvLYTEtxkGv7+Rm1
         s1x/uzSEVkFLmDayYRRe7J3VbQUp/mJ/LuOWy/fq0OYfuLXg1uzxSdPxMu5Let5sumVW
         qEeJcjWvkVeb6l4S3bEjbV2JF9dUd72NRO1wh4tGLxUffLsQT7qT7ADfXnaTCI6+6kpE
         f8WHkX+GDD/0BzTrSJ/W1XO4t/ZYwSv9FCtHRvHzvr87QZTEuqXz1rwLDgu6O7WBjW22
         vrYM2jDhZDmvDoTbfaPhysy/Uzlm6sDvXBPlwCqH9cpuYIva/o3MvE8nWwzvOdQwrAJI
         5TiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794213415; x=1794818215;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QlQZJAxO1Sv3Et4pFgTum0IApIio5YpzXsMhTuabOKQ=;
        b=pyO2gRvbY2yrtIlmrSN3wOUuG+IWO9SOAkk5FZutwCfk0DWVIqr4kXynRWJgy/0J3Y
         vtIrfLZPRAbB6zjq302hpXi4mUng9adj2AESBDOkC9o8w70SNqRJxbHRPru77nhOotKM
         /xWsvAGk54M9mmgfkWBsU2f3uIDtszmm0sM2yWKoCihJHG+2HNuSXQh3ePvgZfTGrhvS
         93IGSMqE6+D0Se77g321CM6ZkADHNwrR5a3prqaLdmAzDqnPZB8llY0WIVj4EOR/9PiE
         W3GzFYb3OsD036xz3uQ9CoAN0zuORt7QHffDRGOA/stNjbk944LD//UBQAtJ8jN23LmZ
         dUdQ==
X-Gm-Message-State: APuU4Z+6RPRWQ+ngdzGaMRq6TbpapvJEWLC/uq89uiWJ3dl+sJynmZty
	UxCInPHHveC73ocTZu7D0f4upjt2QWNX2jlS9FvRkpsmUrXyNgFbkBwBId8ODHCLfaaPv3/mAsi
	/VOv09lW68r45s87emaZPrIvSmt7hk5nLKOoRR4SNlzy+xiF8vIlK2x6YysEB8lUW4E9posCkEs
	JZHhc=
X-Gm-Gg: AYBFou2Fg6yCMsYQUj2l2vCS5kMeBmbcLiAXwPtzRENL1rrHQjGP+wSu8mYEuve78zQ
	/LOpKOFnFhFGmg4qxoxW12ktcVJr92t2CQ5POGH6Nlc6pR+Tj+Tzq1CHDRPO0W+YZJxyUGLx37Q
	EAWT4/EEMHlish8Ipy/QIVkMOooy5zZFcKmgxzjmmFVeqtYHMVIm5B7r70+kS537RIpH8TdBOsC
	nadRIVQEVaXWKHJswKE/ojf7XWRWrdt0CoVIVRsjP/Ln3RsN/PTbYOgZ72ry8ng9zjBYRtU/pUz
	rEE/qLwNHgUoF1NEg3+szug7oa1ZeMuuAS18gSFQKD32+pSLs0dVVUYer2uF/21EEha7AVmwLgZ
	4bQYrD2EChWISffWWp1ge632Oy3hWe96lUoMC51GwcY/y4mzRf0P8gdCIwwN0kpPR5sv91y6bV/
	qaS53p+tiIN52IrFM3mI0rvKzH+L/wj1y9meI=
X-Received: by 2002:a05:620a:1a0b:b0:92e:8310:7369 with SMTP id af79cd13be357-9478421ae5amr531299085a.37.1794213415043;
        Mon, 09 Nov 2026 00:36:55 -0800 (PST)
X-Received: by 2002:a05:620a:1a0b:b0:92e:8310:7369 with SMTP id af79cd13be357-9478421ae5amr531297785a.37.1794213414549;
        Mon, 09 Nov 2026 00:36:54 -0800 (PST)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-94782dc37e5sm418223385a.34.2026.11.09.00.36.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 00:36:54 -0800 (PST)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 09 Nov 2026 16:36:35 +0800
Subject: [PATCH v5 1/3] dt-bindings: display: msm: Add INT2 GDSC to
 Kaanapali DPU
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261109-msm_gdsc2-v5-1-4a3159b5e4b8@oss.qualcomm.com>
References: <20261109-msm_gdsc2-v5-0-4a3159b5e4b8@oss.qualcomm.com>
In-Reply-To: <20261109-msm_gdsc2-v5-0-4a3159b5e4b8@oss.qualcomm.com>
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
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Joonhoe Kim <26rote@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794213397; l=9906;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=KfdZuvSWZwaiZF24JN3cwwsiGYbigawCngmZ1N3bIwk=;
 b=Nc95XLCZD9zVCjX6yjrNsRLKMzLVQWzGQwcdEVklh2PVV1dWQE8tkYFqLsBiLYffuqy+eBoiO
 Qo574qgDzc6B/8E5IZSJmNZtpreMEgDZ0XeroWGSRmFsou/725vVma2
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-ORIG-GUID: xA9Ypf77OullsdufqYwU1G5PAUCpLmWB
X-Proofpoint-GUID: xA9Ypf77OullsdufqYwU1G5PAUCpLmWB
X-Authority-Analysis: v=2.4 cv=CMq/zhrD c=1 sm=1 tr=0 ts=6af18628 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=3e6MG95HUu93SJj1PsAA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAzNCBTYWx0ZWRfX6C/bAp00wTaR
 bITD56O8w9sapKjDAYx43rEafeWbW8shXjGp0TrwgMl3BFSHI1Y32GjD+KmFmsvR7A/mrjYG/k8
 tTFhVPiC122y5IQ+EYYL5Croe4QWSnfWocuLIHd5WA2eXqgegIVFM47EaJqo4KO15nmhsgUCbJ4
 DLqoU6nllzMX4cwnRcaqK3uyVYzjEG2IrUV2sg7vNJc+IVV4L1O35+9KtPTpkpQKAENLFMCNOKt
 HG6Fc9tcUfhcTOUAf/rA9JcFYidyb+GvT0BuPokq8mP58nbIFWPWPupZST2UpiIhxd1fRaAab6a
 BTTQdJHe5GAtu2SuJBGS5N3dEY8F0kNJXRGb5JmNpM+yTn/mQi0BVIaeHcfJ2HTv8OuelTK7P+P
 8Cx9r11v3FwjuTMAP9dVYTnwb8cA7Y0NDUpH1jwwqwwdATi7WsFEroL7OGVgw5C9him0XS1fJL2
 BexlhlYEF/UgKRw8BTA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAzNCBTYWx0ZWRfX2cyCyQH77UsI
 uY/Ehbf2konWvCUfLDyM+IebZFQwi2/XN1nf9d5+zmtCO0nniadqXaJC0LSIalg1+1hm1SR0EYt
 Q3eabwfLBcEAgAUYXj/kCD5UZoZo1eY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 adultscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090034

Kaanapali (SM8850) has two display GDSCs. CORE_GDSC supplies shared
MDSS hardware and most of the DPU, while INT2 GDSC supplies the
VIG2/VIG3/DMA5 source pipes. Without INT2 GDSC, these source pipes
remain inaccessible.

Describe CORE and INT2 as power domains of the DPU device, matching
the hardware partitioning. INT2 only supplies DPU-local source pipes,
while CORE also remains attached to the parent MDSS device because it
supplies shared MDSS hardware. DPU performance-state votes on CORE are
propagated through the genpd hierarchy to its parent MMCX domain.

Keep the widest valid power-domain constraint in dpu-common.yaml and
narrow it in each platform-specific binding. Require two domains and
their names for Kaanapali, while retaining the existing single-domain
constraint for all other DPU platforms.

Repeat power-domains in qcom,sm8650-dpu.yaml because dtschema requires
power-domain-names to have a power-domains sibling in the same file.

Tested-by: Joonhoe Kim <26rote@gmail.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 .../bindings/display/msm/dpu-common.yaml           |  3 +-
 .../bindings/display/msm/qcom,kaanapali-mdss.yaml  |  4 ++-
 .../bindings/display/msm/qcom,msm8998-dpu.yaml     |  3 ++
 .../bindings/display/msm/qcom,qcm2290-dpu.yaml     |  3 ++
 .../bindings/display/msm/qcom,sc7180-dpu.yaml      |  3 ++
 .../bindings/display/msm/qcom,sc7280-dpu.yaml      |  3 ++
 .../bindings/display/msm/qcom,sc8180x-dpu.yaml     |  3 ++
 .../bindings/display/msm/qcom,sdm845-dpu.yaml      |  3 ++
 .../bindings/display/msm/qcom,sm6115-dpu.yaml      |  3 ++
 .../bindings/display/msm/qcom,sm6150-dpu.yaml      |  3 ++
 .../bindings/display/msm/qcom,sm7150-dpu.yaml      |  3 ++
 .../bindings/display/msm/qcom,sm8150-dpu.yaml      |  3 ++
 .../bindings/display/msm/qcom,sm8650-dpu.yaml      | 34 ++++++++++++++++++++++
 13 files changed, 69 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dpu-common.yaml b/Documentation/devicetree/bindings/display/msm/dpu-common.yaml
index 3f953aa5e6949..c67199011f263 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu-common.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dpu-common.yaml
@@ -26,7 +26,8 @@ properties:
     maxItems: 1
 
   power-domains:
-    maxItems: 1
+    minItems: 1
+    maxItems: 2
 
   operating-points-v2: true
   opp-table:
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,kaanapali-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,kaanapali-mdss.yaml
index 9f935defd6b12..6d6391970d6b6 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,kaanapali-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,kaanapali-mdss.yaml
@@ -125,7 +125,9 @@ examples:
 
             operating-points-v2 = <&mdp_opp_table>;
 
-            power-domains = <&rpmhpd RPMHPD_MMCX>;
+            power-domains = <&mdss_gdsc>,
+                            <&mdss_int2_gdsc>;
+            power-domain-names = "core", "int2";
 
             ports {
                 #address-cells = <1>;
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,msm8998-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,msm8998-dpu.yaml
index d5a64c8a921f1..bded43a34b87d 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,msm8998-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,msm8998-dpu.yaml
@@ -15,6 +15,9 @@ properties:
   compatible:
     const: qcom,msm8998-dpu
 
+  power-domains:
+    maxItems: 1
+
   reg:
     items:
       - description: Address offset and size for mdp register set
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-dpu.yaml
index 034d3df8d2470..6c1476a0faaf5 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-dpu.yaml
@@ -19,6 +19,9 @@ properties:
           - const: qcom,shikra-dpu
           - const: qcom,qcm2290-dpu
 
+  power-domains:
+    maxItems: 1
+
   reg:
     items:
       - description: Address offset and size for mdp register set
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sc7180-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sc7180-dpu.yaml
index 8137618237ce7..3fa0f02f44892 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sc7180-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sc7180-dpu.yaml
@@ -19,6 +19,9 @@ properties:
       - qcom,sm6350-dpu
       - qcom,sm6375-dpu
 
+  power-domains:
+    maxItems: 1
+
   reg:
     items:
       - description: Address offset and size for mdp register set
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sc7280-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sc7280-dpu.yaml
index df9ec15ad6c3c..7703d9b017cfc 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sc7280-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sc7280-dpu.yaml
@@ -24,6 +24,9 @@ properties:
       - qcom,sm8450-dpu
       - qcom,sm8550-dpu
 
+  power-domains:
+    maxItems: 1
+
   reg:
     items:
       - description: Address offset and size for mdp register set
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sc8180x-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sc8180x-dpu.yaml
index a411126708b80..8e10f9e0d1769 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sc8180x-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sc8180x-dpu.yaml
@@ -15,6 +15,9 @@ properties:
   compatible:
     const: qcom,sc8180x-dpu
 
+  power-domains:
+    maxItems: 1
+
   reg:
     items:
       - description: Address offset and size for mdp register set
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sdm845-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sdm845-dpu.yaml
index dc11fd421a27f..9dafe1d827e13 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sdm845-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sdm845-dpu.yaml
@@ -17,6 +17,9 @@ properties:
       - qcom,sdm670-dpu
       - qcom,sdm845-dpu
 
+  power-domains:
+    maxItems: 1
+
   reg:
     items:
       - description: Address offset and size for mdp register set
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm6115-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm6115-dpu.yaml
index 510eb6c193649..173c2f034241c 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm6115-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm6115-dpu.yaml
@@ -15,6 +15,9 @@ properties:
   compatible:
     const: qcom,sm6115-dpu
 
+  power-domains:
+    maxItems: 1
+
   reg:
     items:
       - description: MDP register set
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm6150-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm6150-dpu.yaml
index 8cbf99f9fcba5..b8344ff8895ac 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm6150-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm6150-dpu.yaml
@@ -16,6 +16,9 @@ properties:
   compatible:
     const: qcom,sm6150-dpu
 
+  power-domains:
+    maxItems: 1
+
   reg:
     items:
       - description: Address offset and size for mdp register set
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm7150-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm7150-dpu.yaml
index c79b2d4428003..8e50942f3e1f2 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm7150-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm7150-dpu.yaml
@@ -15,6 +15,9 @@ properties:
   compatible:
     const: qcom,sm7150-dpu
 
+  power-domains:
+    maxItems: 1
+
   reg:
     items:
       - description: Address offset and size for mdp register set
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8150-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8150-dpu.yaml
index a88d22f30a602..b407bc3994620 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8150-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8150-dpu.yaml
@@ -17,6 +17,9 @@ properties:
       - qcom,sm8150-dpu
       - qcom,sm8250-dpu
 
+  power-domains:
+    maxItems: 1
+
   reg:
     items:
       - description: Address offset and size for mdp register set
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
index aa0cf0ec5b93f..c3bf4e7ca1ffe 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
@@ -54,6 +54,15 @@ properties:
       - const: core
       - const: vsync
 
+  power-domains:
+    minItems: 1
+    maxItems: 2
+
+  power-domain-names:
+    items:
+      - const: core
+      - const: int2
+
 required:
   - compatible
   - reg
@@ -61,6 +70,31 @@ required:
   - clocks
   - clock-names
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,kaanapali-dpu
+      required:
+        - compatible
+    then:
+      properties:
+        power-domains:
+          minItems: 2
+
+        power-domain-names:
+          minItems: 2
+
+      required:
+        - power-domain-names
+    else:
+      properties:
+        power-domains:
+          maxItems: 1
+
+        power-domain-names: false
+
 unevaluatedProperties: false
 
 examples:

-- 
2.43.0

