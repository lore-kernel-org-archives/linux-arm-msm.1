Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794558553;
	b=RBfsP9Ke/Y2Ay0ohY2Rg3z6ElEWWFsBZA2F/m3V1OKEp6pEwGauUgioUGMOByEkXvIm4
	 ozzZzdzWOvut2EwWHiJ2CjyTMZ7LMNkOBDnROBhsse2HD/a7CtV997yMtPKtENPCnSrQm
	 AYQ51bT/Oe1KBsGioNXr34spuh5nyg6x81Wxj/HZDNK1mnKxD12AqzeQ7W/7g7RHPIAxV
	 I9R5EMh9VYpKbuIvictUXDVHa2O7fTU74rzvMCLuISiFydMlkU9T2AECsKY+o2bwtfkzb
	 iaaiEv9COPeO3gksM2/gCDMkX50PP7fuq8j55pOWqHpZDxBHohScikTrsdWzFErcEtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794558553;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=gdIKtbmtt6X34cnhTlk+wlpmiV3qhuoe2c6i221ujkM=;
	b=dBJtz3QGi7gR8OjKj9SbEw+sA8ywkpfJr0IND/eObSX3LN34UAgkBJVb3VBFKfqpcl6i
	 TdNb6SEH6o++GvEkWVoo72FqNUtNJnsiYUhFZYIb/K9B5voxbU0/OzIRru/h7sZRlxCa+
	 LXpqfb1CXgu4J8/b/sHr9fngjloGSNKAIp+s88Pv4YgZtL5DXuOmwyxNVMQ18Vn6z0Pq/
	 XCfGMi3mQQZd0Wn2fzMoXN/maP+hj9Wf/weykzAMK84Lzw/cB544Dnl7UFV91/7T/yYe9
	 2KtT/Zh+tNjDTc+DWc8YbOuPP6Di33dqU4lk/16qNdqX01yC229NkB0DiXIF71e7YJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DyEdU7f7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CdHbFpDU;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64CBC606A8A7
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 08:29:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64CBC606A8A7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DyEdU7f7;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CdHbFpDU
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD57CUn3119970
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 08:29:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gdIKtbmtt6X34cnhTlk+wlpmiV3qhuoe2c6i221ujkM=; b=DyEdU7f7GlyDYh+a
	O8BQtxysEHUEcsn2AqqSQ/xcpB93svGlwd62z8i4FLWJBIR5oyKOz0TCrtbbSkZk
	+nMtFrdTsE7t8cwCHuWOTe0b+R866kT6i0sHGXqEhjCHOhxJEtQqMOF7wH6slbGh
	Mo5g8XitnqdN15BugPpkkfYUFVyYnvtX6zp/185UIjeSvSfFvhbDjhm9WXnL/UAm
	fMYbF03B5wN8c2iZnFzBfSgyMqKkkQ1sO4Q3PA74Yw4iHJRdtL2Uxjege1mlvMho
	W2IB+nScQIgWCYsHKXadHiVcCdMfZUm6eIngWEkwA7l/nKa77w/ZnJ9IBQC9dV8S
	WenGWA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwkgwa6kt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 08:29:11 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-533928ef33aso7616471cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 00:29:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794558551; x=1795163351; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gdIKtbmtt6X34cnhTlk+wlpmiV3qhuoe2c6i221ujkM=;
        b=CdHbFpDUefAU3rX5ajXbLMXn1RgE+C6sF8RU82B6cEtTVBO5sUivOyEnWE3bBZe98p
         QzgfDrG36IYS0bMiul5GhLe+faUc8TvBm5xeumfi9C9Xz0jh1oiKPYrH0s43OqO2hNUX
         /LEnf2K3NKkd4jn2SwDMx12X55uMak8esZDpkvaRs0u2TR/yzBvoaxKQeYO0XXUyCu4M
         nzZ4jXl7tGl9iP2i6zFlqrVvAkgS3w0Tvt3rhDWQHt7j+VuhfN7Yo6J2aG/zOZAk5/pf
         71X9DFmfFMV+IeqM8gvfpyIaTJicD9vllgMUEFudtX2FqVUcgnC4EU7znS//NR0WQUoX
         jpbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794558551; x=1795163351;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gdIKtbmtt6X34cnhTlk+wlpmiV3qhuoe2c6i221ujkM=;
        b=Q6LiHg8p5CUUD37wAPNM1hyMSXbsIdrbQqvVSgrtdfQam6FMxZTzs3X2GAKfkTGq6B
         zyIsCaZQr2BZV96BXG3vF5JNwivTCpTm3YDEddGx0hcckl8Bfm5W5jqD8Meo8f+fcLi1
         BerqE0IWV2R1PeoanhqALiH7faq/r8hvym3HipRPE9llcVDnSQ1ZtvoCGcDRd3215+7+
         mR3FBarZzC/fHd7rQaQD7Xmw82Q/ba2UfSZtE3X3PNXjvCIvKGYXwsalG55n7FiAgvn2
         JX3Ok03wVBtHm7E5CDzWWPKM3YyvFlUlyzXTksq6kylyXHUmQhdvPIMm/TqIo+PWWbsZ
         fOAg==
X-Gm-Message-State: APuU4Z++pBsR94vLJMvwYk0Hz27JOLimmnTej9Ew8y6Urhcw2Lp871jr
	KskokabAHn/7pLfErJHeF2QA5XjFK0oI3nBH+/4cUq7eQHYMqaeH9wvy9GSAbR1qI05nLNnFAh8
	/DHBPPmJuIyu2F5eDAd3Jn+339jRK8HWqOpXVD7UM9tpR6shVPGV13FfyXG69ZPJnMjV9
X-Gm-Gg: AYBFou3T6EhdA8R9hT3sPnvl5LiOYjKG7e2170vPG0BWg3bJSvCrpQXVSi3JtFLehz0
	jkiktZpWu5KIyuMLafhJV1g1Z2t41empLQerPrwb3ZEKvoRVs0oDhdKLOG42rV3V324rj67+dCF
	SG8NhVdvscVHpL3VcHFck9OrPWva/n3Ljdrtl56tUYxa4CHMUgeKfLLqZdXoZpX3jrsqtRgvxkA
	PCyDIMJI9pEkReNbS9q6itbJ51jmuMkhG3DoGF2z/pAVz12uV98w9b7chXTbVXkMsBzlpsS6u0o
	vT3a7TMTfulxSta5ZLGRj4QtZ/GucqEbRfW/pSGj88L4bKkBIbqo1hqt4BG8k82iH1jc9MsFNaG
	iuz1m8gwWMmd6ytQGaBee+ekVaeD3ZqwKggKWIXnjQs/UrZJzhlGMt6WAAfXUs1518vz9g3u5cW
	7RH85nXqsWrHZ/jZ2uOY2NUdvoGRa7x4PaXQYe
X-Received: by 2002:ac8:5dcb:0:b0:535:b506:11e8 with SMTP id d75a77b69052e-55ac1331525mr31454451cf.0.1794558550537;
        Fri, 13 Nov 2026 00:29:10 -0800 (PST)
X-Received: by 2002:ac8:5dcb:0:b0:535:b506:11e8 with SMTP id d75a77b69052e-55ac1331525mr31454101cf.0.1794558550017;
        Fri, 13 Nov 2026 00:29:10 -0800 (PST)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55ad1b13917sm13524491cf.29.2026.11.13.00.29.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 00:29:09 -0800 (PST)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 16:28:51 +0800
Subject: [PATCH v6 1/3] dt-bindings: display: msm: Add INT2 GDSC to
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
Message-Id: <20261113-msm_gdsc2-v6-1-17adbce47220@oss.qualcomm.com>
References: <20261113-msm_gdsc2-v6-0-17adbce47220@oss.qualcomm.com>
In-Reply-To: <20261113-msm_gdsc2-v6-0-17adbce47220@oss.qualcomm.com>
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
        Konrad Dybcio <konradybcio@kernel.org>,
        Del Regno <angelogioacchino.delregno@somainline.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Danila Tikhonov <danila@mainlining.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794558532; l=9575;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=cyZkjCOBijSm7S/CvS/j8M3k40zS+ATYoCyKx4MzWdU=;
 b=jZE/XfoPpWsMgCJBUkQ+f0VREypGPXnvj4gU/SkNdUdDjefLxOw4uKGttbH5hqZKFBohRXRg/
 MLMqxt8Y19+ABQahskwTozUpXBmhOjfSbmpfwSsUnFwGXiWJq0wjltE
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Authority-Analysis: v=2.4 cv=DNgacCNb c=1 sm=1 tr=0 ts=6af6ca57 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=Ghaf3IcVr8FXk-v7bh4A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: NK-i8-qKZF4810NDpJT___l-XiFiYGKi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAzMyBTYWx0ZWRfX7RJQG8NVlAHz
 ZJBV0Q5RuOStFwuBSolWOOnqWwf+z5joSmD4AaAZe3+1xohUoG9mGOAHoQyUGju642E0vU7Uo0B
 fJOsmo4JdoaXa6nGeYBiOOwhsqjOubBHVKPg0NXY5nvsF6I3p5kkH40EzafAbkHcNLVSDyliSo7
 CWevERHREqV3zzBkLZ9oN8qE0HnXwQ/Mxj7k7sX0ceqnW/LfEU9xgBUuawydiNXFscoyK2F0SvV
 2VvFySMDQbqWuHMViXB/fEYEAi06n4jKDi5oKrCF5P8yNf5YQIRRkkdEMBcGzrxab1eNZefZGYU
 iQ9bGyoQ5iHkbYUHCcqOH3dmDYcJfwtv4DmgYnoClxpwzBz2xSOdFt2KfNwM4DFXfB1dO+Nay+H
 ajy1Onb4v1kDKeVdDEMR3UDdwLpc7Meig9r/dwrqAw0t7ODB/0tJGzLKgZliwUOqnBtp/GyIdz/
 z9jDS5PugMNfa+aKD0A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAzMyBTYWx0ZWRfX9z2QhU8xe2v1
 w/XLGLvswyTy246TzLhM0+opwvZKjAjTGLZqb40cWv8a+3I8HCaRcK0S0qGZNTKlPQgHzqer35h
 X6Nip1UNzdkwieAMjQoqkb2gAOOdY4o=
X-Proofpoint-GUID: NK-i8-qKZF4810NDpJT___l-XiFiYGKi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 clxscore=1015 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130033

Kaanapali (SM8850) has two display GDSCs. CORE_GDSC supplies shared
MDSS hardware and most of the DPU, while INT2 GDSC supplies the
VIG2/VIG3/DMA5 source pipes. Without INT2 GDSC, these source pipes
remain inaccessible.

Describe CORE and INT2 as power domains of the DPU device, matching
the hardware partitioning. INT2 only supplies DPU-local source pipes,
while CORE also remains attached to the parent MDSS device because it
supplies shared MDSS hardware. DPU performance-state votes on CORE are
propagated through the genpd hierarchy to its parent MMCX domain.

Keep the widest valid constraints in dpu-common.yaml, including the
power-domain-names definition, and narrow them in the platform-specific
bindings. Require two domains and their names for Kaanapali, while
retaining the existing single-domain constraint for all other DPU
platforms.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 .../bindings/display/msm/dpu-common.yaml           |  9 ++++++++-
 .../bindings/display/msm/qcom,kaanapali-mdss.yaml  |  4 +++-
 .../bindings/display/msm/qcom,msm8998-dpu.yaml     |  3 +++
 .../bindings/display/msm/qcom,qcm2290-dpu.yaml     |  3 +++
 .../bindings/display/msm/qcom,sc7180-dpu.yaml      |  3 +++
 .../bindings/display/msm/qcom,sc7280-dpu.yaml      |  3 +++
 .../bindings/display/msm/qcom,sc8180x-dpu.yaml     |  3 +++
 .../bindings/display/msm/qcom,sdm845-dpu.yaml      |  3 +++
 .../bindings/display/msm/qcom,sm6115-dpu.yaml      |  3 +++
 .../bindings/display/msm/qcom,sm6150-dpu.yaml      |  3 +++
 .../bindings/display/msm/qcom,sm7150-dpu.yaml      |  3 +++
 .../bindings/display/msm/qcom,sm8150-dpu.yaml      |  3 +++
 .../bindings/display/msm/qcom,sm8650-dpu.yaml      | 23 ++++++++++++++++++++++
 13 files changed, 64 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dpu-common.yaml b/Documentation/devicetree/bindings/display/msm/dpu-common.yaml
index 3f953aa5e6949..d2a2ffa043ed8 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu-common.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dpu-common.yaml
@@ -26,7 +26,14 @@ properties:
     maxItems: 1
 
   power-domains:
-    maxItems: 1
+    minItems: 1
+    maxItems: 2
+
+  power-domain-names:
+    minItems: 1
+    items:
+      - const: core
+      - const: int2
 
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
index aa0cf0ec5b93f..fc19bedfbc0af 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
@@ -61,6 +61,29 @@ required:
   - clocks
   - clock-names
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,kaanapali-dpu
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

