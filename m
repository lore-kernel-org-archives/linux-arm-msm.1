Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794548046;
	b=QXUKEqtL2RZC/ek5tr446CSO/3L86UEqEB9/Fw5kEnJ1yFE7IA/NLu2orIV5jGpEzxjh
	 LxHY50pEfM1kJEuwTgRyyNNegjMkyzQJ53VjXxUwGG7GLB7b/J2aOWDvXma5uZF4se3db
	 r7VtAPOoanZoCH2QkpuNuINGYRxbGbhi68Z/d3cxrvYV/cK7iiGjGP9hlbAC/jggS7JFl
	 X1cNKT4teJd1lHLN1uEnnZUd7UjfgZlWGzCjqopWlXUzO5eYHvrYsrq2C0QmMufDdU0ie
	 R4cm9QUf2GR0DftucL0xdDAs3xTChW25eTSbNjfThQSyCOCb8MDjWcuSR9I5kZpOqUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794548046;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=cn4iBg+xzn7OmHstqqp/y2jUxX7t+xPFAar8TrRHGe4=;
	b=jhFUxookX9zXXekIn7TgLT1OMRlfNBbmYtjhi5bLrpPogQs+8q9xYjwVPII3rjiFkWw1
	 Q4IdTI8302KfC7ce1orbvdmfIA2t9gABc5DWFEJ9bXg3WWPBo8kXl1wm4730J4Nt47dew
	 vYj8SyVO322quSuXynOjw+6CvSG3VwTbf5a8fq1W/PnjsSsN7WJeFa/HytUHknbNUdbUK
	 Pguv+ijKDJC5ToIF6AKnQNrNWK1sx8TRITpos5eruviClb/K8jk2g684D0yWtmlY7CS7x
	 DwIkEyCl5x1rNWjRTUgmV8ROwguCAXn1yXyfQWFOzmR5PtO/jaXdmTKpcfFa+tOENfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DvMdUW1v;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GvL6EeLH;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B6960A3802
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 05:34:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3B6960A3802
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DvMdUW1v;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GvL6EeLH
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD576gR073405
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 05:34:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cn4iBg+xzn7OmHstqqp/y2jUxX7t+xPFAar8TrRHGe4=; b=DvMdUW1vL2dhHhmK
	2tL8p4UKkOG0pF9EqlhZXhVJndrHZzYb3MnuUXo3EiYTIbCwmrgR5z8l1QUNjskP
	wIuiXc8Dyi38PNq0ntwMVG6rm28WjNo0Jy/URvWqB2qHNkq29/OfPl84TUI/wXdq
	KoUD4xQxHOnHJR5fSazF56zWrOp1Yby8EMKS4wNtQhbkPVKX3q2miI+T+wa643Z/
	hHG7yYCHNOh2NmkdCnwNspkmB6OgFb93HLUkjXGIORWh95mKmr8COdRqYg7uewph
	mj0JIh5R9zq0P+OClfB3mcQxIOehoqfB1gwNtKPLqWwrHw0lfDSGAUhXNrYQuWiE
	Hxe16w==
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwbs03mdu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 05:34:04 +0000 (GMT)
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-47cfa971c9eso2032445fac.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 21:34:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794548044; x=1795152844; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cn4iBg+xzn7OmHstqqp/y2jUxX7t+xPFAar8TrRHGe4=;
        b=GvL6EeLHV8hFNBTO+fp/MQt/VdCg4JOHMdH1oeNYV5mjC6pC/XU0cxk+Z+6LjiMcOU
         IY5pZNNFKCO9U6l1OHD66uPNq24qWfg9zzrGNKANzcwLO6vIJkyf5bUIFrEZvEQLvR5P
         quHrN6VccfkRwZWQbdyzycgIhckJ3g+lL2fHfn0LIaCMaHu29xziNyGKtp6BqOddnd0c
         wu0o1dCZPW2PVrLAD/cC/IkZb2u97CZrMgLPI3JqxEZJ8EEakgDIjXmqASTJe1loAkqM
         kCXhA03Xlg+xpIuMzCYCrkczBk0RgSmMm1LLjd1P+3KP73fSbs4PfoVtQKSuXyJWhy4Z
         vabA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794548044; x=1795152844;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cn4iBg+xzn7OmHstqqp/y2jUxX7t+xPFAar8TrRHGe4=;
        b=ApwhFg9DIkhQl5k2XgIyG1VRgOdHUzaE8RH6HYmWW35gYvalOzbZIb+YiNvewhQEa7
         kLuMZK54bOVNAml7ojtb2oEvy2ymssmCQQ2ONEMgh+6U6uAy2hadkR4RkPMUR5d4R5Lk
         ztGOVtZFKKctxMbjVTj7RxN0c3+jSy547eKVh0GaAd6sJ9l2jWjmbfeK1iJRh+KSUmIl
         U3t5yjQoSSvWQy5AK2GD3YnVxQnpSmL5DWcz6uib7S8DLN118retprEEcbWQV0bxhkwO
         WfoxLr896GoB4ROLnInxbynDeIvg6xKSDhmAiOnfVjWNThN4998zql/qIAOSvtm2iWRK
         f11g==
X-Forwarded-Encrypted: i=1; AL+hErEHwRY3ipY0MmRWGygxAGDBJPBY2/Ajt1gJDpU/XlbnUJELZpCnv8DqH3cYTAQHvBFueNDICrjyTEV6oLH5@vger.kernel.org
X-Gm-Message-State: APuU4Z+KAtdaFyfNZ8sLdaVaqqE3nBehHSmN4k36FN/pKcf/Y+t9nc7x
	aBQ8yLydDWhRd8FN1wf9Q5yuOLEiZwEkHu1IzbAIm4/dcFpoDwTKv5z510hJyyX16CSGCkFUGJU
	GsFb3x0my/aB/37KPOczEqd4Xawoy1r2fz/t2CFTkR1oss4BiicoIe2bXPUpG1FlqmFju
X-Gm-Gg: AYBFou1W3na21M9JdH31/pXewiMSwBqSG69ChFsUXd075vwlGIGTEg7F8+txemhVJnv
	9f+W5jAdgwE1PxJvRfZdzJKdPQoFI0R3DyWveooeWUjt+975Va+jzkXV3k3LJGru9q6N6yUtkHr
	bnj/ei9P3b+4NXiJWyzCxqp+8v/4WwoYuyVtQiYJJBI++L7jDoxxKmi4f3A9L1BHvSXLlZTy7KD
	OX2zcdpoUIl5gMm7AxHlDbWH0mfJrbgXd9uOVv4N5kLAf7Vrue7Uw3fmlKFWr+Zth2BACf9Y9on
	G+D4VjIBSjZgKTV1GhhwtFQ14Q6ZH0PG/hc2eN55Aqqq3lw+SIJWmDpwGK7eutmPyYstKLbDzEp
	jmlszBDJNthQySsQ9plbXteYc2alAGoSfj1uBm721t8ZK5DvmvtzaB3wEdsSm7yQ80dE2efhmwJ
	TCAa9KfnCikwhMPTk+/jZ73pvsJAX0MSzlXnWa5DgH1O8JaTWU/pQTssw8NAie
X-Received: by 2002:a05:6870:8289:b0:494:9395:751a with SMTP id 586e51a60fabf-4ae63f779dfmr2504480fac.10.1794548043724;
        Thu, 12 Nov 2026 21:34:03 -0800 (PST)
X-Received: by 2002:a05:6870:8289:b0:494:9395:751a with SMTP id 586e51a60fabf-4ae63f779dfmr2504467fac.10.1794548043152;
        Thu, 12 Nov 2026 21:34:03 -0800 (PST)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4afe22576bfsm803252fac.7.2026.11.12.21.34.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 21:34:02 -0800 (PST)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 21:33:37 -0800
Subject: [PATCH v25 05/15] media: dt-bindings: Add CAMSS device for
 Kaanapali
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
Message-Id: <20261112-kaanapali-camss-v25-5-1d709f57f370@oss.qualcomm.com>
References: <20261112-kaanapali-camss-v25-0-1d709f57f370@oss.qualcomm.com>
In-Reply-To: <20261112-kaanapali-camss-v25-0-1d709f57f370@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.16.1-dev-17221
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAyMSBTYWx0ZWRfX7R/ea3Gg01Vx
 KHSYacoJdI4+BwbkI5xTNNhG++mxgEhcd2CV3TEbHiVhdj6o0KKFvq1+2DVr3nMf6/n2f6QoHs3
 HVv1JwpmXX3+E7wwt4dF6xYn1RumffMP9KhCmSi1WnpY+qbkU354XUVgJU1b3ZY5kFwkpKAsrUD
 k6fVTloLrI5GD6dpPXtvzLDQ/f6ZlM5YpGgvB8+F1UahSJBxYajKgof4a42wHFV+RCiVb5s4cLV
 hUVoIg6Jd7bGXVq6/SlxLoabJqzi+MzRJ1BF7UPbdap1JqWkAzf2MuQVrEviLxL0o/TYpeEgjZh
 faK1iQvDpJZUhggqmjUfZO+upLSfE7elw7kkYucmLBRmn29cSQKV+mHveWkNueXnl2liOCzh3bq
 u2/8z7F4rjhohYMA4MkRUpUd4+R/qihfP1waUXeStvtlNh0TqHcghnS0/gAgPoi0eKF1SFkD576
 OyWC0jNF4djmejw8oLw==
X-Authority-Analysis: v=2.4 cv=AsF7T+9P c=1 sm=1 tr=0 ts=6af6a14c cx=c_pps
 a=Z3eh007fzM5o9awBa1HkYQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=gEfo2CItAAAA:8 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=yzr0uxE_ijXmPgLYsrIA:9 a=QEXdDO2ut3YA:10 a=eBU8X_Hb5SQ8N-bgNfv4:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAyMSBTYWx0ZWRfX+HWFOheVPF3o
 4k9M1ar0WIWttJtL1F8Hj+Mwkgu5SjCbytpASlFvvZXcuMcjDVG2QriGyDUWBp/wFWN7RrkN/uQ
 D1O6hjeZFZLMe7xIqTiyPwWU+vl2UZY=
X-Proofpoint-GUID: OG_9PTVpdLNH8yZwYTONpofr2tfwS30E
X-Proofpoint-ORIG-GUID: OG_9PTVpdLNH8yZwYTONpofr2tfwS30E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130021

Add bindings for Camera Subsystem (CAMSS) on the Qualcomm Kaanapali
platform.

The Kaanapali platform provides:
- 6 x CSIPHY (CSI Physical Layer)
- 3 x TPG (Test Pattern Generator)
- 3 x CSID (CSI Decoder)
- 2 x CSID Lite
- 3 x VFE (Video Front End), 5 RDI per VFE
- 2 x VFE Lite, 4 RDI per VFE Lite

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 .../bindings/media/qcom,kaanapali-camss.yaml       | 303 +++++++++++++++++++++
 1 file changed, 303 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,kaanapali-camss.yaml b/Documentation/devicetree/bindings/media/qcom,kaanapali-camss.yaml
new file mode 100644
index 000000000000..f64eb925b641
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,kaanapali-camss.yaml
@@ -0,0 +1,303 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,kaanapali-camss.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Kaanapali Camera Subsystem (CAMSS)
+
+maintainers:
+  - Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
+
+description:
+  The CAMSS IP is a CSI decoder and ISP present on Qualcomm platforms.
+
+properties:
+  compatible:
+    const: qcom,kaanapali-camss
+
+  reg:
+    maxItems: 14
+
+  reg-names:
+    items:
+      - const: top
+      - const: csid0
+      - const: csid1
+      - const: csid2
+      - const: csid_lite0
+      - const: csid_lite1
+      - const: tpg0
+      - const: tpg1
+      - const: tpg2
+      - const: vfe0
+      - const: vfe1
+      - const: vfe2
+      - const: vfe_lite0
+      - const: vfe_lite1
+
+  clocks:
+    maxItems: 22
+
+  clock-names:
+    items:
+      - const: camnoc_nrt_axi
+      - const: camnoc_rt_axi
+      - const: cpas_ahb
+      - const: cpas_fast_ahb
+      - const: cpas_vfe0
+      - const: cpas_vfe1
+      - const: cpas_vfe2
+      - const: cpas_vfe_lite
+      - const: csid
+      - const: csiphy_rx
+      - const: gcc_axi_hf
+      - const: vfe0
+      - const: vfe0_fast_ahb
+      - const: vfe1
+      - const: vfe1_fast_ahb
+      - const: vfe2
+      - const: vfe2_fast_ahb
+      - const: vfe_lite
+      - const: vfe_lite_ahb
+      - const: vfe_lite_cphy_rx
+      - const: vfe_lite_csid
+      - const: qdss_debug_xo
+
+  interrupts:
+    maxItems: 10
+
+  interrupt-names:
+    items:
+      - const: csid0
+      - const: csid1
+      - const: csid2
+      - const: csid_lite0
+      - const: csid_lite1
+      - const: vfe0
+      - const: vfe1
+      - const: vfe2
+      - const: vfe_lite0
+      - const: vfe_lite1
+
+  interconnects:
+    maxItems: 2
+
+  interconnect-names:
+    items:
+      - const: ahb
+      - const: hf_mnoc
+
+  iommus:
+    items:
+      - description: S1 HLOS IFE non-protected stream
+
+  power-domains:
+    items:
+      - description: IFE0 GDSC - Global Distributed Switch Controller for IFE0.
+      - description: IFE1 GDSC - Global Distributed Switch Controller for IFE1.
+      - description: IFE2 GDSC - Global Distributed Switch Controller for IFE2.
+      - description: Titan Top GDSC - Titan ISP Block, Global Distributed Switch Controller.
+
+  power-domain-names:
+    items:
+      - const: ife0
+      - const: ife1
+      - const: ife2
+      - const: top
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    description:
+      CSI input ports. Each port receives the CSI data
+      decoded by the matching CSIPHY.
+
+    patternProperties:
+      "^port@[0-5]$":
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description:
+          Input port for receiving CSI data from CSIPHY 0-5.
+
+        properties:
+          endpoint:
+            $ref: video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              data-lanes:
+                minItems: 1
+                maxItems: 4
+
+              bus-type:
+                enum:
+                  - 1 # MEDIA_BUS_TYPE_CSI2_CPHY
+                  - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
+
+            required:
+              - data-lanes
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+  - interrupts
+  - interrupt-names
+  - interconnects
+  - interconnect-names
+  - iommus
+  - power-domains
+  - power-domain-names
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,kaanapali-gcc.h>
+    #include <dt-bindings/clock/qcom,kaanapali-camcc.h>
+    #include <dt-bindings/interconnect/qcom,icc.h>
+    #include <dt-bindings/interconnect/qcom,kaanapali-rpmh.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        isp@900b000 {
+            compatible = "qcom,kaanapali-camss";
+
+            reg = <0x0 0x0900b000 0x0 0x1000>,
+                  <0x0 0x09253000 0x0 0x5e80>,
+                  <0x0 0x09263000 0x0 0x5e80>,
+                  <0x0 0x09273000 0x0 0x5e80>,
+                  <0x0 0x092d3000 0x0 0x3880>,
+                  <0x0 0x092e7000 0x0 0x3880>,
+                  <0x0 0x093fd000 0x0 0x400>,
+                  <0x0 0x093fe000 0x0 0x400>,
+                  <0x0 0x093ff000 0x0 0x400>,
+                  <0x0 0x09151000 0x0 0x20000>,
+                  <0x0 0x09171000 0x0 0x20000>,
+                  <0x0 0x09191000 0x0 0x20000>,
+                  <0x0 0x092dc000 0x0 0x1300>,
+                  <0x0 0x092f0000 0x0 0x1300>;
+
+            reg-names = "top",
+                        "csid0",
+                        "csid1",
+                        "csid2",
+                        "csid_lite0",
+                        "csid_lite1",
+                        "tpg0",
+                        "tpg1",
+                        "tpg2",
+                        "vfe0",
+                        "vfe1",
+                        "vfe2",
+                        "vfe_lite0",
+                        "vfe_lite1";
+
+            clocks = <&camcc CAM_CC_CAMNOC_NRT_AXI_CLK>,
+                     <&camcc CAM_CC_CAMNOC_RT_AXI_CLK>,
+                     <&camcc CAM_CC_CAM_TOP_AHB_CLK>,
+                     <&camcc CAM_CC_CAM_TOP_FAST_AHB_CLK>,
+                     <&camcc CAM_CC_CAMNOC_RT_TFE_0_MAIN_CLK>,
+                     <&camcc CAM_CC_CAMNOC_RT_TFE_1_MAIN_CLK>,
+                     <&camcc CAM_CC_CAMNOC_RT_TFE_2_MAIN_CLK>,
+                     <&camcc CAM_CC_CAMNOC_RT_IFE_LITE_CLK>,
+                     <&camcc CAM_CC_CSID_CLK>,
+                     <&camcc CAM_CC_CSID_CSIPHY_RX_CLK>,
+                     <&gcc GCC_CAMERA_HF_AXI_CLK>,
+                     <&camcc CAM_CC_TFE_0_MAIN_CLK>,
+                     <&camcc CAM_CC_TFE_0_MAIN_FAST_AHB_CLK>,
+                     <&camcc CAM_CC_TFE_1_MAIN_CLK>,
+                     <&camcc CAM_CC_TFE_1_MAIN_FAST_AHB_CLK>,
+                     <&camcc CAM_CC_TFE_2_MAIN_CLK>,
+                     <&camcc CAM_CC_TFE_2_MAIN_FAST_AHB_CLK>,
+                     <&camcc CAM_CC_IFE_LITE_CLK>,
+                     <&camcc CAM_CC_IFE_LITE_AHB_CLK>,
+                     <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
+                     <&camcc CAM_CC_IFE_LITE_CSID_CLK>,
+                     <&camcc CAM_CC_QDSS_DEBUG_XO_CLK>;
+
+            clock-names = "camnoc_nrt_axi",
+                          "camnoc_rt_axi",
+                          "cpas_ahb",
+                          "cpas_fast_ahb",
+                          "cpas_vfe0",
+                          "cpas_vfe1",
+                          "cpas_vfe2",
+                          "cpas_vfe_lite",
+                          "csid",
+                          "csiphy_rx",
+                          "gcc_axi_hf",
+                          "vfe0",
+                          "vfe0_fast_ahb",
+                          "vfe1",
+                          "vfe1_fast_ahb",
+                          "vfe2",
+                          "vfe2_fast_ahb",
+                          "vfe_lite",
+                          "vfe_lite_ahb",
+                          "vfe_lite_cphy_rx",
+                          "vfe_lite_csid",
+                          "qdss_debug_xo";
+
+            interrupts = <GIC_SPI 601 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 603 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 431 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 605 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 376 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 433 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 436 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 457 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 606 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 377 IRQ_TYPE_EDGE_RISING>;
+
+            interrupt-names = "csid0",
+                              "csid1",
+                              "csid2",
+                              "csid_lite0",
+                              "csid_lite1",
+                              "vfe0",
+                              "vfe1",
+                              "vfe2",
+                              "vfe_lite0",
+                              "vfe_lite1";
+
+            interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+                             &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+                            <&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
+                             &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+            interconnect-names = "ahb",
+                                 "hf_mnoc";
+
+            iommus = <&apps_smmu 0x1c00 0x00>;
+
+            power-domains = <&camcc CAM_CC_TFE_0_GDSC>,
+                            <&camcc CAM_CC_TFE_1_GDSC>,
+                            <&camcc CAM_CC_TFE_2_GDSC>,
+                            <&camcc CAM_CC_TITAN_TOP_GDSC>;
+            power-domain-names = "ife0",
+                                 "ife1",
+                                 "ife2",
+                                 "top";
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    camss_csiphy0_ep: endpoint {
+                        data-lanes = <1 2 3 4>;
+                        remote-endpoint = <&csiphy0_out>;
+                    };
+                };
+            };
+        };
+    };

-- 
2.34.1

