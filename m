Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F19348095E
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789390149; cv=none; b=VIw6fnoY6uH+5MvQvGAUm5awqM069nsU448KRD3RGAzkWO+RzSL+fxRB5CmN661TcOT2n45la3PisflzeViFUKgDv8pHP6t+sc7wodmu8i7Ic8bE3OI+tg6gzZsJXUNixGOm62pN0hAkeLSQmdd82CoK4H8Ykvmmx59Bb2RzX20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789390149; c=relaxed/simple;
	bh=lRVKUqTPpCGIoNz5KBJv8zuvxjlzgnhVsGKzfTzKUPs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H+y78zaj8Vp+V78W1NGOPNTcP+x/wgFH5OQJc41hPQ/DT9uVxK/k2pnfLDbPqf0n+YHsKwHhDquUQHYrv86k6JO2jTlJKMFrXOtRHVWDcto9VqAjpf6Uy1TxoTkdj8SYv+6UiqS+zUT6LyLmUqin2EdCOG4ciff+NaXLK2tW0hA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S3Q1IMy/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QVAysSw1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S3Q1IMy/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QVAysSw1"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAm7lj3291532
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:49:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/1engMRsfjHWG34qUdnnA7Naj9ZgncmLB5UQD0m4jII=; b=S3Q1IMy/25GZTXyJ
	Khg2OIyCTBkT7RpWjK9nniQgauofC/8R7I+bVBP2q88xosE7oMymJQcgbvUA1ILm
	IvYgyH6I3ao7gKj6sRH+6PXHRUNfWRAE84W+0L69o8J3vc27R89irttWvPX+g0Rc
	iJweiTKkqU35Uo+uHJqzCkfoylryJjnKaUyPrg/uyOuEewDmheAsWUQOa0QZ935Y
	ZRr33/ZD0abog/ZvxX+JPmvWxQTfpvzUxnK+WmaUHhpi09g+Uugx3DLj4YauGVSf
	N5aRQEwmLw8Y9qpVaT6S9HWZHkMKP+ON/N8UF3uZs8s12BAWgPYO7/nPJhiLwv7b
	zd2cpw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gperg8nh9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:49:07 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-934963b2bc0so675436885a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 05:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789390146; x=1789994946; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/1engMRsfjHWG34qUdnnA7Naj9ZgncmLB5UQD0m4jII=;
        b=QVAysSw1VAAda+Ybj8cwrd8sKkV44TDw5u7/S0Y12gu9x7AGWUYQBq+STZ435dpKkC
         gnJIM8GXzm9YdKqNHfPSHhaHreVjih6xlVywP8VB5xa9HgLO8BMYpehD5MY9JI05Kp+8
         Cms5tyI++oLN5FimRb9v3OMIB4m0HoK3kEqF4rtH5lczI9k/VSbtT51IlSvDBhb/tV3x
         4Nck4UX+66CXWbeml9yx+9f43X344isjxPv/e2fPLg9zCzc53WcXCsP1bvcFS0AZnRbo
         gjy2jLzBNjmfZrKLPZoChxzvsYj7J1g37p1xPpUcXKS/qWIZ2p+w3BX3T//lXNdfHAgz
         x/sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789390146; x=1789994946;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/1engMRsfjHWG34qUdnnA7Naj9ZgncmLB5UQD0m4jII=;
        b=lE5Uw9WyeQwryquq4XnYzGDK2M2aqvqQ6QDD3pLCX7BPjDmGAffw8lmcoY1UWJ+LDF
         v6jEYAjl9iFQ0uUo0RmR5cTHWTw7bAm1Xl6hEGTykPWV2zngX4N4xVuEwD69fHNGSQwM
         oSigvCeikJn7Usdmnx+qqQG83b8knKy2jOotQCj0u3LEWfbed7R+0XPXlXyhAAGcSV8r
         Yzv0mGJMCkgHVsT4qLRMEPvS8yz7XcxyN3RZdwPRqxFqY8CxpnbQORfC5GoQiXDH65t5
         Kpfn3SuTS1EzO01MyHlvo0ks0YyJou5ddcfsOqx5cm8u3xxRbTQJEK6FjOd0Xkw/K3LU
         2KzA==
X-Gm-Message-State: AFuF++mr4YSUnybarB1YU6RWB+LSkXiwU0/0kr8/k2xrMvCr67CGuFs2
	PfmicvEbH750jv4iJH7vr7wcr1UztERB6NlrN9qy6KFMxr0MquRwP5iXmm5dKvF9Jatvjm1+cAK
	ghHWiCPEIizaNpss5pb2JxVHDPcgAZJq7ARF+1PwSXLgTSsZPnqbWNDioqxPv2xzC1IHZiqaRZx
	ue
X-Gm-Gg: AYBFou39/SWtktpV/9HdpDz1HxJbq4HQkuRuEEHS23NJhWgQpOog8mBV5MkD4rMWD/p
	hexzjbphGPqh9FZvIaoBSxPsTMFgfvaM8ZTXd/kiv3j+mU6GMIk5dMnStPnbV5KwqCKJ0UKMCZq
	W6d6wgY8CCt6fesVj/fNpCByyT8qeMPDZ+SNpFJTdHLJ3mEN4x4R1euQAW0zke0ZmRRWOBrbiiJ
	GH4H2Uj25Q9Ekgg2mOxge+icTjoUm0w+qPng0gkgIjRXVJTBSPhFyhGiiq+pAEUtUxOqdkYSna/
	are1LI7kfKm6ahLfRnqjuHeM5dihbHmnax1r2hNln5HT4/PsLbopj/wIJzvvR58n4bDLM+NesHi
	FGUdV0Uei
X-Received: by 2002:a05:620a:2b9c:b0:939:7f14:ebc6 with SMTP id af79cd13be357-93a297789a1mr366575385a.3.1789390146395;
        Mon, 14 Sep 2026 05:49:06 -0700 (PDT)
X-Received: by 2002:a05:620a:2b9c:b0:939:7f14:ebc6 with SMTP id af79cd13be357-93a297789a1mr366568885a.3.1789390145832;
        Mon, 14 Sep 2026 05:49:05 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6c566bdbsm242387555e9.11.2026.09.14.05.49.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 05:49:04 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 15:47:23 +0300
Subject: [PATCH v4 24/52] clk: qcom: gcc-sdm670: Tie the CX power domain to
 controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-qcom-tie-cx-to-gcc-v4-24-9d5a606ada33@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=756;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=lRVKUqTPpCGIoNz5KBJv8zuvxjlzgnhVsGKzfTzKUPs=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqp+zin5sMmIPvYFetkJDogycudVGKmwzzxlUwu
 4DDdMjh97eJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqfs4gAKCRAbX0TJAJUV
 Vv21EAC9qnQ+FejkTlXkYadBnw7N3oZ63onmXs6Yro3n9LNM/D2aTj+Ae4AJhDa2EvEZe6xh9+d
 dg2Fab1BQwslpOj6yMBXXC8+7H05tSKkYCTT0L5MXB5aj79riTf76x5OIxiU2XBH289Ti0dTnan
 ILX8mKt6+jCdZRAj3Xq4EsRzoHX8qdBXk4d04bURGBWXO7oABZnKs791u81NvDpYPPa03zQOyCZ
 9jRxOsct44llgXVtbMfVMGGYAWOZDPtSPL+YJ8oGwOSifLizQ9RCfIPsft7gr78BaRe0fJc+HIY
 Oo7KUqpnz4QzLloOraGbBslqYSK8y4MVrJJHRm4TrkweYxLz7afNwj/gjrTTN9Xu9vMt4XwlOKG
 Le3Y0zqLQYg8FKM5LOI/4fywUep1ceavIy9pdQdNzOOdwCGSbnEDirQ1touD7aCHssOGPx+Ky/N
 3RdxKx5RzsdrIgMwM6ARIeatjKa/cNH2ZKgZPLulbe8P+CsyEllJdPRoyjxly+sbxe+Ztub7PNz
 UZxWx/mToBJYQNvW8Ad0omdTwxNF2FRBjuZEFECVPhyRy4PvcxT7OOLC3xG1FJg+yhdi199ExWG
 VHf3A4CsmMJXEEG4FhmqcJlY5arcBaeVIlMNYk3qAxTJT1hQEgCF8Ne503jbdZ6ly9HHKl3o2GI
 FNJ2+xfBEQTLJnA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=QK/91QLL c=1 sm=1 tr=0 ts=6aa7ed43 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=j9QDv7RGPiaZsbg0A-cA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: ZcpFJiYbDhpJ2YGO-pkJ_78M1ZxfDUtR
X-Proofpoint-ORIG-GUID: ZcpFJiYbDhpJ2YGO-pkJ_78M1ZxfDUtR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE4MyBTYWx0ZWRfX2ACxCdbP4RjW
 uX5lzTD3UA9V0z+Rx/0WJ4u0989K1bAKZDo13ZffVId5+J43v3XJfNShybLAqrEYv8pGjubbbKq
 N6baC4+MgKnzPncjlO1qeo+9B+Le8+C15s2627bkisu9VjY4pNoS5auXvcBMDP76tPhu3LxoXjj
 Iq6bVAhMbtHsw/vuuyv/ZgkEP3YFAXEG1n7jBcj/9nD/cY2zTRJuWJOtTbZG1VCMiCjGlLLodbD
 j0Hyzm6sdpswDsg1bN4Z4UTfHAkYew5kdxhB/Pym9Yn5AHwM0IZv+K5Kh5DvO9trx2+6rOEUJmb
 Sn9jdJyIwva/rXFgT9sXGZfyOG2IdrAtAu7dnegjP2kisoENvMPhEvXSdxaWUm8CS7c3LNpUOCC
 m1xdXouL1Hf+gjHA475+34PIakf+JX9CNfmjiN0mFqFnXnV0Wdv7rrHg3PkWtC9jQGlwRq8tL2D
 wJmbJ5r8NHwABElNwBw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE4MyBTYWx0ZWRfX2/3QPkHvzVco
 9duuzGnxL5Lc/9yc3iLUn4IzSHJwiLhWs1zoxwt5RimkLeF4erSrSzd6+hOjZLQppTaPpdoYkkU
 wkoKB6CBsonC639c38MPushbuyem5x8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 adultscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140183

Enable runtime PM for the controller, allowing CX to be powered down
once all GCC consumers have released their clocks and GDSCs.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sdm845.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-sdm845.c b/drivers/clk/qcom/gcc-sdm845.c
index 6d0f9cede5cf..57d54b45fa52 100644
--- a/drivers/clk/qcom/gcc-sdm845.c
+++ b/drivers/clk/qcom/gcc-sdm845.c
@@ -3948,6 +3948,7 @@ static const struct qcom_cc_desc gcc_sdm670_desc = {
 	.num_resets = ARRAY_SIZE(gcc_sdm845_resets),
 	.gdscs = gcc_sdm670_gdscs,
 	.num_gdscs = ARRAY_SIZE(gcc_sdm670_gdscs),
+	.use_rpm = true,
 };
 
 static const struct qcom_cc_desc gcc_sdm845_desc = {

-- 
2.54.0

