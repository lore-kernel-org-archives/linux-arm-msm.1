Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FB1F468C12
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789390206; cv=none; b=OaOjm6ztN1gKWBJpHPA9z8wMCAhW0Z3xIUDxaXSxHxmW+rjfY76FM96T6zON1QJtwXLnfRX24e0ubvhJIbUSizzTPAMmpzyP30LeXfmNWgqQL5w9gvVS7spUcOUzUKDFSFLOPA5+wIF+7LLtljdINYCGTmbWrtjAwUG/tPmSu78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789390206; c=relaxed/simple;
	bh=F80H9I0DjUCTxp9n76OgxJurzIJXm534S5e9STO9TtI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WeOAutIuAPqDDpQX940K+OeZHbOzhJ/vRFUwwK7JQKc/sMISaF/zXkJXGia+f4XrWoisuoG8XeZvs1lXtP6rjYpc8TLhuecDOCtZLbhm5PitDwb0KLfDwE8TqTuqCowzQeV+zGAiwKz6d0pVN/WQLmeJ3HzhVZOw4sGLQmAnzLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o0Ocopqi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I1+qBJnq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o0Ocopqi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I1+qBJnq"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAm9AM377811
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:50:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CKmhlTgx1VIL08aqjbOIr72fw3Tnkf2jNo721b3IBJA=; b=o0OcopqinWuPjMCu
	PSIDgVyD2b7/zp7XO3eRDHHtmAqGk7yZlJP+YgLwPBUVGCFXKk+aVYobqdYcOrHx
	Tqkq8mq9lDS/3JpUowWpxkBd9X5uWnKuLUuH7triqusXwd6q1J8saecHeoFT+c3r
	rGZk1l1vXp430mA5uoSUkt1oEEiIiwrICz3aWA+v8N1fcI3qogooz1cG6hCq7JHB
	nq8M25BG3ZoiLG4VRJuU0ZbTSHCwVwqUFRboFZVfx5Of+5Tpsvd9v7G45ch1wv+R
	DeSCugRq4Yee/2YD14ADXeELQ9E65iF0LISlDkoiKkKtrA2/vKaNkF0Wdc3lD/xe
	hdfFfw==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpecs8qjf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:50:03 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-97e8be2221eso434323241.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 05:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789390202; x=1789995002; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CKmhlTgx1VIL08aqjbOIr72fw3Tnkf2jNo721b3IBJA=;
        b=I1+qBJnqWDyROPv19OfVzunUjW8XCBLKPhzOcOFKNJTbUABf6pynIEf8OgiUNlKODD
         CtSobUXgNiTUC714fJPIyui0iKX1TZj9Ws5FpLi+r+CUNOKw9yzUUIW+gzmogcAg8LP7
         gUGvxYBOsnfgEpeIsCzJN618+A01hKy2BOSjJcoetlhjcBcdxoKdMcXbk3MLY6/6Paol
         B/voeSAyiInZBpHS2HrA14FuWgS4Z2w6ITU4fhz/k5q0ZD/79CDttWsDjM0GZ6blOpg4
         xghjoM+AAiCFHODbq/OGEIgfAemL6lOBKYr401I4JruUf1w6ktOtVZxtTRXgm3S+QWtY
         RKnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789390202; x=1789995002;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CKmhlTgx1VIL08aqjbOIr72fw3Tnkf2jNo721b3IBJA=;
        b=ixPoWCoKGeIMGTVSx/U0weVZl9x30AigxTdiL5zgMI1j1vq6GSEjq/T9L+Rfal44It
         NuthQ1V58dbBSpHNNr4qxaGGFz7/51pORbuke+r6Lyfy8yVQHT9NhtPD44bvlk6C7sYw
         j0qTUUd6gy3caAq1VPXjijOgItvopcJB+DeDDDLjxERQY6dpNn9T/VzcOaV+4z81X/js
         NIQ9rA/gyQxoP/tAdZlt1fxBYxNHdRFTxGO8kxbfJQfaeyTx74RjFAdLx+9/mucG6QB0
         2ECAjDF2XCHsTv+4OM9QABVUH+UFKzHudDXuKLbiEPuVrR2lFeIlz3dHVtwnXLVDDDr1
         A1AQ==
X-Gm-Message-State: AFuF++nrhUUy5oVEdqwILf/m+vOjocQZ6+6FSGAUGeaxl+oQ5FKS+1ce
	/8LU0s3M1RbhX2ea6XtS1CWHRo+330dttAbBOULx6iXd+J5ChMCGLv59eGTWZFmF2P3wGrt7Yqu
	hWfa5fB7bdZfAbMNo6lF84pf6SVePaU5/0FEQ6MJxML5VnkZlNHUkLoJszNLQhBm7t06F
X-Gm-Gg: AYBFou3xuiJShKfG9ucNrqlgFL37ShDfzVM93NSkHl3e3bE4fLxowqvabgPzA/JZPV/
	7BQ+wN8zwF797uwgIBo3I6ebCTnkhcESe2O7AiLZSt/aO8ogFySlvSwurY7mqs23h8xo2nXJti+
	/dzbeho8KSjVfHqVRj4hCfgcWPaPj0eJRMwWSnA/k0PRhpo3Y3piEO4YDuzBUJkd4t1qg9ijdMg
	lso5glfWAnR5X5gaCb004kAsujxC520+0cDjoKiLZQdpwkuYgkKvU9TlBg1KFCGgO3QYgJ862l8
	MQOI7jcvUGqPsd0xZ2BqcVmqrhbmgw90n9c2XNFzWuqv3IYZfcVzeewroD6TyrE86Sw7oW2UZrg
	qfUF+4Eth
X-Received: by 2002:a05:6102:511f:b0:785:d308:cc0a with SMTP id ada2fe7eead31-79b5b2909fbmr1191181137.9.1789390202058;
        Mon, 14 Sep 2026 05:50:02 -0700 (PDT)
X-Received: by 2002:a05:6102:511f:b0:785:d308:cc0a with SMTP id ada2fe7eead31-79b5b2909fbmr1191142137.9.1789390201576;
        Mon, 14 Sep 2026 05:50:01 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6c566bdbsm242387555e9.11.2026.09.14.05.49.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 05:50:00 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 15:47:44 +0300
Subject: [PATCH v4 45/52] arm64: dts: qcom: sm8150: Add GCC CX power domain
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-qcom-tie-cx-to-gcc-v4-45-9d5a606ada33@oss.qualcomm.com>
References: <20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com>
In-Reply-To: <20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=932;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=F80H9I0DjUCTxp9n76OgxJurzIJXm534S5e9STO9TtI=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqp+z3elpHIph3aGwtkFU2GPTI5uNMv30x5e8kO
 tcNu6SoVHSJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqfs9wAKCRAbX0TJAJUV
 VsekD/0RYUseKEoxSiROvcS17R6+RML8qwyeFu/EBlf+XFSbnb5a2MBYUoM0jcufqy8ISBnSZjf
 ObcwCz7F2BGq7NzmbJicvfNMI6dC0dCgncYoXuSe75ZOqxGv1H5hhKVNrveHet1IryTD3PsxuNa
 eBsGIX8WmZmxoXKIgvtzDAmUHPazCGN5j1qMyXINXzLH0/6SOAYp4DNQyM56Y+bKmBzLoFd8WC7
 26h6ilRJ994+GZ3Iw1q0HT2DHLZGp3c//9Mwwvc5OK5akMgIx0S+bTySTK7Hj9Fxkkit6/UXS5/
 IC4gY1LDqrGMhJ3i1jAue4TQjk2k0eByXsKo7Qk9X8oX5/AQyeq9Wv+bTPR/vdowrbkR8E0gH09
 M9V44gq1r8UwhiHNmvqzxjF7LfCeCJCcM9Uj3wtdwEze3VVr64ATmJO0fRzk3vs86gGsK6vAN93
 XmIJBPc2p+NFbJSDr9UxlJ1OfOfaPKWOXaYQ8LghyKbWCCLBQJ0DNv+D/PZfT2tDsla7wHFaJIu
 9REmeHQhHsFBROV1vNsqeQj475p0H4iY5lZkIlYLp4y032fIR8KNukhTdxe9dJ+p/2GaZJCtcOT
 f0vzXv3Z9v8qwyrbv1w7Ei/OdoABWY6sWQAfErNNDDgP2gw9AFq8ojV5+B7vSJllQMKg+8ALS9S
 CCz0BRW4imGoi5Q==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE4MyBTYWx0ZWRfX4uHG8aj7FQSv
 m8fhzeWoUCMWNe7fPTvMgTjqbVEUXZluQAhpaI+ONsN+cxLSad9nqiglrRB/D8mlym733OhqKBa
 lSU0R5zme4jSFD4Jl9H7v/3IY8nPFGs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE4MyBTYWx0ZWRfX6RgggDQq0Rmn
 a2gfPNWHKZUveKJsuV9cnu8ig0HP+a7rJyDI+M7SHeHm7Z021qXzYv1S49rEAkUZlu5BWYugBIk
 vKZlzsRKA3MMepek2hrU8HtVOtZFtSXpFKVq5e8oNu8JE/3JgNwxf0UqCt2oJbLlFfAzKmS8lVj
 77wLXXghoDlim2+CZWC+TJq8zroVv2YFRXnNifqVXtV1BBGe9CF6W/ophRrpEa3W9ZhZqFX9PPe
 rwzbZgqiQBJfgSzfdQyzUwOWxcQUBXcWU9SFKlJn1U0MREqufeDqVYQ6LtouZ9tR7jD73xPOFuJ
 X7U3nAO6p8zAE7BJEmvjcmxF1HP5KdEAEL9i/sKmnT9lTxG7UUpodPUvuXeX7lMsLTRQE8tRm9D
 YYutir6NYC85j1ZfLbCQQ6dh703GNoLArm/5Tua206WrH7fPdv5V37G+QoaWxDyz1MTUUGqwQuw
 E24fviEvExqrzJfTHbQ==
X-Proofpoint-GUID: KT7U58TKmF4d1wJ1CiNZeXE7vouHhRTf
X-Authority-Analysis: v=2.4 cv=b/cncdGx c=1 sm=1 tr=0 ts=6aa7ed7b cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=S9gNOWPKAuR5AUhlrlYA:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-ORIG-GUID: KT7U58TKmF4d1wJ1CiNZeXE7vouHhRTf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140183

The GCC GDSCs on SM8150 are backed by the RPMh CX power domain. Without
describing that parent domain, consumers of GCC-provided GDSCs can enable
their local domain without causing the required CX vote to be held.

Add the CX power-domain reference to the GCC node so votes from GCC GDSC
consumers can propagate to RPMh CX.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index 94a3b02cb289..397c0142ea57 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -913,6 +913,7 @@ gcc: clock-controller@100000 {
 				      "sleep_clk";
 			clocks = <&rpmhcc RPMH_CXO_CLK>,
 				 <&sleep_clk>;
+			power-domains = <&rpmhpd SM8150_CX>;
 		};
 
 		gpi_dma0: dma-controller@800000 {

-- 
2.54.0

