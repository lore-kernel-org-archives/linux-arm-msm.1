Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECBA1423EA7
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 11:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787572576; cv=none; b=bgNq8BqBiS3UQje728Bz71e+CI/bafzgxD8ovW+1F7sNanrRfVKdKcbuRPYfWtmPY3SM1B8zq+tLc0UUWjkA8R4kmrFc2nfM8goAE61urCMKVanjHSwe86Hvr6bbK5+u2N2UrRxTcyYl24j8Zi4iwxFMh0hbX/7nmx/nrnAqmIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787572576; c=relaxed/simple;
	bh=AlROMKCZCSBw0LrPqjpPt+gl3/weusw8zHmG9Ipml/I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kp3ucP7RFS5RsPcV/ibx/mm4CVkJM6HAKd3Jgl0fQ7OFNrbNZCPPcdTQN4FduJMlWcIGjkID5I/j2LAOKhJsigrjmGb/w15om1Eh+Bvo6DDEINTzidTjOLlCcUVvxLeyVnjMChfZnn9vXVPjNysMNvUSqhdwo353ZkBRbZ1Cjgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mUJ4gMPI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CCYOUIsp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mUJ4gMPI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CCYOUIsp"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OBMU9k2647975
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 11:56:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Lg045LPDNKpSrUjHCRymWZEs0+M/aH9KPTfKAyjSwnU=; b=mUJ4gMPIq6LoCOUS
	wwlTAdYcriSL4aCyIPVCKU2j1Tz1WjUutAVQvP8YVqNNSSTg7pRfld+GS4wsIFXu
	VVxuN7eLzTbdCjjpDs9ogj1emp/9eqQTL7nomTNwhF5Cw8Hi6LQFkC0TpjDtWW25
	U7FG5nQX+SS4QpuJP02KNZqTY5BJrkJ8UIO5hvyegginrP9V2XHCWw18yiH6NITI
	4joDUQHwPnNzfLnAJGCXLXKp1lnZL+qG4CfqBmcSv7B9KNjwgVWVQfdZVuLqRgxZ
	becU89qznf1E4RwsDeA2e22UnSlMNfvQMLpHKK7B6+nrGykqKmbPzPusaf/E78d0
	TuY/eQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8gqn9afk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 11:56:13 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52de05de414so38925291cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 04:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787572573; x=1788177373; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lg045LPDNKpSrUjHCRymWZEs0+M/aH9KPTfKAyjSwnU=;
        b=CCYOUIspxtCnj+LsijWZ5HLUdVN9xtjUds14o9aDzPsf+yS6JtjQY6yJ4pYLNwnZug
         3yd58SPyPNpX8AlohDb4+nwxNabmMNQotjzq8sGeeaehhHk1kv93gKVU3ngLzAh2OW/X
         fIEA/bRgG+4xBvK0npKUmCZqJ90idUHiPeWPNfAsRwAfzwot5s42lQsLNYx7N6AuRDBe
         W2rBEsQeqAsDJn2Aad9NHJKNtwqes4LiqSOUCpM/1aDkcbhhhWBtq3Dz9lYYpJ9EC4WU
         n3iNZjx0Dws33Aou8XYh6Xc5eBMxad/Aa2YOQTQjiHTqQq0tvL2PLiXTV8bNYEhpIMan
         JADg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787572573; x=1788177373;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lg045LPDNKpSrUjHCRymWZEs0+M/aH9KPTfKAyjSwnU=;
        b=SNXGSLD18tAwI0WKWtib4HZkIosgIK5Zjc+b/PxHw5+tFlegUZIMjHPPZm2jU/qTCX
         r91vRkR12Cpk88soYwwhZN9bDX2K38mAIyVRi1ZAh40lWehZC7qHTbvXJMhGMRtqfc4o
         wEX6kVNSMeSk4aFWOXvdvnUg8W/q6gekMqDa/qgDtmrVkrRaaXB+BK5dJABO9BWi7btk
         Rlcd7JADehx/Ukzv8LxLu0EnvwakQEuKUCg17x+A9yD8fncW9I7wGgqWoAexKEf9dVv8
         ebPYg+mrmEXWKeN9tlJVCxVQVL2IygbjegE1WRqHlr4aTsYARyRzISuZ3ea8NQ6SE/u3
         WKnw==
X-Gm-Message-State: AFuF++nbs+uOMG/xBe2pDpPyRY/iQ1YeJ8+1EVpt3h4zqZbl1mSDLPl0
	3yOkvAKtLd7vJUJBRFpZMDRkkT+cTp754s7tNvsS3n8w7cqT1m/lkLTIyR70MWEF14+veAv9IV6
	EFzdB8tdIlLumXsWyKYysCPnpIgOwkQXI7BrPxT2CIIzP0zpL+fFeTdCJPyrShatpg0Gh
X-Gm-Gg: AR+sD13sXfs5POIivvNTac18xbfLsC+sf7mZZCV9HNG4ZVC/LkBs3oTsZ9mWyWnrKRF
	f+dxuO6ittd/XmkOkZtS9A/Kqrkbgu4lxa3WvH784VUSxNg/0si/SWIoPC/JAgZonq7I6yXB+e1
	BX0IdjTue07KM1C/aQ5KSdbw+mRbb+t2xusd9NJSpgdyrlc+e3BCBC0kMNUEMrHHXSnCU7UbETr
	WbB/3IW/L8D6UcZYV/+CKTnGbaEZGXbGeARo3dmr+3xUpID8aTP+zIshOXpg8j2gOWxYsdEoNH3
	LLPXhA53Vbyy93oyn1u2Bb/HXYMxuxdFvCeLFHryPXbH7LMMwF2cXAgGBNe/tOb9Mfr0+HHEkhI
	rt5m4CGoD
X-Received: by 2002:a05:622a:e113:20b0:52e:2d19:b37c with SMTP id d75a77b69052e-52e2d19bad0mr2673891cf.2.1787572573391;
        Mon, 24 Aug 2026 04:56:13 -0700 (PDT)
X-Received: by 2002:a05:622a:e113:20b0:52e:2d19:b37c with SMTP id d75a77b69052e-52e2d19bad0mr2673701cf.2.1787572572916;
        Mon, 24 Aug 2026 04:56:12 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249629563dsm1259990366b.17.2026.08.24.04.56.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 04:56:11 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 14:54:17 +0300
Subject: [PATCH v3 30/47] clk: qcom: gcc-sm8750: Tie the CX power domain to
 controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-qcom-tie-cx-to-gcc-v3-30-f1205a92682b@oss.qualcomm.com>
References: <20260824-qcom-tie-cx-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com>
In-Reply-To: <20260824-qcom-tie-cx-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=794;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=AlROMKCZCSBw0LrPqjpPt+gl3/weusw8zHmG9Ipml/I=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqjDDyzorQHSVaUwTS178kXs6igzhKzwAXMR6pK
 YyqXAifyfOJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaoww8gAKCRAbX0TJAJUV
 VtC4D/4rLWzij3jM86UAE01OMHZ+k+bx2mUUhGGYQWgKqYmQZdipxEzh1b5HZajTlkf3cQfkLX6
 zXk2vRpHLk6UkC6LkM7aAIATZmHK7cSBiYbGeU6YIjZ7wf29FBa+0jDslUVA/HI7d0leKJprJEF
 jNZYgQ7eHCmQMdbPkz4royDxXXYF7bqS9wHyYhw7su8pW/ML0MqCvZOwPQBzccstD9QGq5GOuCJ
 JViqoeuZDHjSDTbItLKAvaERMIz1Ythb1pANdgU+qHy/KZsY+PZUSWS5RLU+vo5k7bbHFItZise
 KpLJhrypw9N9dAMH5GefPhQax5gkYzoH+TXECA02NJ5bwUB+atieCKe80cfoPUTdTSOdJGhCWP+
 wTtbv+WLu105c1JKJ7PcQvCTqIPIWYZapDuWOZFB2PesuIDyVzeu0PuOMZcc2oI/PAwkA7cQzw2
 HfK6ilvRLSNqUV+E0vFLtfQUAgVCsBrSksAtkACTjxHc4WQf7ZsWrJw8RcDWyaB2hjHSjIYSzRI
 fjxdQBsAHXpWBG88uMoFaXvCT+gI194n9/VNjB7OCos5mw91xhxbzMQ9/mUdRoT3Usia5RmKNJl
 GOsct3NXVCn7EpLiG+NViB709GXQGEk+lRSnYt9nq/zSJalxG45qdH0cUWL2bK4fzKtFfRZk8ok
 4ISCZHi2OupygjA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDEwMCBTYWx0ZWRfXw7kx7SVKbgha
 b0vRoeKS1s79QN7koJRjLt/9GhftTevt73nt24R24bSJax2gkpDiYJopWO/0uD/n/25JfXz9eUC
 yupjx5JDhUedlXZ18ywYOpZIgwLxM3Y=
X-Proofpoint-GUID: u3v0OqqdTAE4s1iyuEQ6rVmPoFub3fQA
X-Authority-Analysis: v=2.4 cv=fqXsol4f c=1 sm=1 tr=0 ts=6a8c315d cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=ESHVkgNwe3RMy11JppAA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDEwMCBTYWx0ZWRfX+u9QV8goyBrr
 O5Etjf+Uj+aX8PVkO/usosjYZf+JUuMk3QhlzSq9d6iKPB/4Vr9uc4BcJG4FYArg34lfyI9pmY6
 AXSuKwGKs0Aay048EDEA5By/+ncEtsoEHO8VEUdoj/pCiKh4Ro0FRy+RwgXmqRZTKIQhA1VfmcU
 j3dm6/2SrzRWUorXVzjHn90aYOSqkAhs6L00fpmb1a8vsG7HEx1gT2Y2dypRz5gnAS6LNvWFL3H
 9KiHTrXTexgjpqid6g1bId53x2VxBhJyMg3R1pn1VDiDXmpSElyDpo3kjMAWt6esJDosM7Kf260
 uiw3jn+UExEvFJqKc9u8JvpWozdnU6iRCIbPzQqS10BIEJXmjkz6prMdDsDvpMLsu3meKz0Ayc5
 gtsZgNrMmiNln6CVAaAVNzlOINvhzz5AaOWCfSNM11MV8+3YsvgAy92p1GgNOynqL1nhyOkdU7Y
 Fy2mA0zsxPE07vb1Qig==
X-Proofpoint-ORIG-GUID: u3v0OqqdTAE4s1iyuEQ6rVmPoFub3fQA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240100

Enable runtime PM for the controller, allowing CX to be powered down
once all GCC consumers have released their clocks and GDSCs.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sm8750.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-sm8750.c b/drivers/clk/qcom/gcc-sm8750.c
index 6cfe90122268..a4a3ece74f40 100644
--- a/drivers/clk/qcom/gcc-sm8750.c
+++ b/drivers/clk/qcom/gcc-sm8750.c
@@ -3195,6 +3195,7 @@ static const struct qcom_cc_desc gcc_sm8750_desc = {
 	.resets = gcc_sm8750_resets,
 	.num_resets = ARRAY_SIZE(gcc_sm8750_resets),
 	.gdscs = gcc_sm8750_gdscs,
+	.use_rpm = true,
 	.num_gdscs = ARRAY_SIZE(gcc_sm8750_gdscs),
 };
 

-- 
2.54.0

