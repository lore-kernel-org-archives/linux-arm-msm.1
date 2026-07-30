Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9D0E41167E
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 09:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785403460; cv=none; b=B1GQRc+AHcwvKSUoN842gGWvc0DfDEXI1VzXUMZtc8knZtk1n1w9mQzROA5qSztJJq44goUU4nASpHqYHX799Z7lohJs05efbYkuWKqN9IxmxdU9NZrA8TwheNOqnVcon3I7J7a7tJa+Rn8ovCArx2hPbMqqJIZd1oIGror/DNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785403460; c=relaxed/simple;
	bh=dMQuuMF13jlkNE3LLv4DTmki07zvQOlpD+SevEtzyLI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Pcg/mqOBbVp5fLsVq+kJ8DXyz4cj6d2qy/vXUZyIK8cmFUgjwOvFSui7m8JTayCmtYWaYdm1dxKdPLn+ih4gpVIGVAdAI3/SVgmRByD6F9420ozqiUuG6fC424nqNB1Zl8LC//2R/0W8ba4Ad1owSeCBJRto+fqPsbuupxFqfWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GkCz17Yd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CI/h55C+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GkCz17Yd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CI/h55C+"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66U8sX5Q1504572
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 09:24:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S+eui17j8M9KyyJwBM7yXqtZFr9R2dq4YhRTKIrsqiM=; b=GkCz17YdylkTLSDR
	lAJYAaMi10VPjGf3PgCGlKcE9wHQu2JZKUJ6KTlFKYdSvQaqQde12cGTG5ynbJL5
	i3FXmEiD8LZjGyuMOpRFoXpgNkMeiQIDVwqz4QXdy0/6iY3ADcbuQjRRlZ78iHlq
	8X6IKa2/HAGw5NTtd+LaTx9++5yB+R/DjgNselAtZFfczXWa/ie7De7/lJ/FLSYE
	+BjzHcVAESwxHxq/c5U1bUbvsp/x4iVCxuDDg3UB1/m6TWZHEpjeYTV02s8usvKW
	BoegRgEDfzwqbzAguJXhkt8cciXIry/ZWlF3tDkmY0BC+eW+TC9fJDiczmhdFbij
	L83JOQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr3h1r4wk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 09:24:16 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51bec738909so15814551cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 02:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785403455; x=1786008255; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S+eui17j8M9KyyJwBM7yXqtZFr9R2dq4YhRTKIrsqiM=;
        b=CI/h55C+dH/95XMfIHCSYVkVZKOQy2xuEj033E7quJclpmXA0ABSc+OJq6iXT9QmLq
         IAFF3fCBhtBOxEcut/mIqrCZSH43B4jmGXfl08yrzxIasro24s5C0i/UlRtMpR88iXLg
         HORYFTR+mk5fH9Xajj3ye7XDyXiAMep399gbQsVWkMNufwAiEZqwA+UzLSMeK13jNMUk
         tCAiY716Qa0nKGDs6rZ60cfJWYe0rDUMdlvG+myKqChOjrUxy88jlXN0uQhBXDm7JhPr
         NaZQos532oUPOfv6QvsRXhrkYoL/2lBlryHIxty++P5hF8PaMoW7oq00OlPH0Kez33xg
         rDdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785403455; x=1786008255;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S+eui17j8M9KyyJwBM7yXqtZFr9R2dq4YhRTKIrsqiM=;
        b=X4nu9BijDWvCxCP3iMFPsmAy6xhb/atFa+L3z+5RTNt7q/zv4S06p+2W25v/S4LTNX
         N2Fdta7UEbUCgNV7WWksiIFjsXy4k29cEyQkieuULvtYUT56tV5oyP2h+yV2Bp9OEXlB
         bnCoCN44jsJ8zZ1EPMZtM30dRhEN0wkXT5XM48p4nTSy8ZdDAKA9bkZQEvbuUHOQx2H3
         v+vRAc35b5KZO7fyz887RGzk11V9EcsbG3O+QP1o3xtxJDlgo7lx/hF2Jjfqm76HfYVg
         xorB1bHwkzYG43CC3ZfOucN52W2qPftaYj/bUrzTlEfqEfDSNlbn1+ucBIgFHYCg8eS0
         rSyg==
X-Forwarded-Encrypted: i=1; AHgh+RqvVKN6KcLhUK1ewLUqtRrbLwQcNzc5jAFZHTtdH0xGTFYcMvpt8UkkkWL1W2yHBoV3I741LUo/WX+v1MFX@vger.kernel.org
X-Gm-Message-State: AOJu0YwRUsLBozmXpGy44J10U1nhVGHsSlSYUaBod3kjoLGUzuOTKEr9
	tltNBew/16IX2P9EDyCkxK/PugypkB0QtwSikTZSmk4RCcbVATBwhZWrnV4tLXvsKwIk82M455T
	B+9jJih5a1QjbqNXYce0YZRaj76racSMV+NG/M6FjErKXvauD4UsVdQvz0Ez+6wE82lUE
X-Gm-Gg: AR+sD12tFlzQJiazCe9qpZDHzEdDOwS+Zloh3ZASQroCGP4uvls+73dq37g7F9QqySo
	OuehGXCVmdnWmPZz7GB7lv5n40Dte8BLx+dMC0W7c8EFccT1+WOlgklBcs3un+OkojWSkTfjFQ9
	U35RgIUfipT85tXEDCppfPtMEs8Dma9S3ulkyLFXZuuiWXB3vK8EooDJe+AduTxEgdJflkZFDZC
	Z+IDcUj4nM9yh1CrUbFGMcNtqe1sYyRiZ6nSSmYpBVx8X5ZlqQeh9JxVvc696OVUAXRC+NoG4w/
	+Gx8jJRZVFBiN/MHE8tgO7e8JOETUVksqDwY23rTP1DMGf4ctK2b7CxLBn+9dM4QLbHlrBNS/oA
	h/0Aye0VI2rg+a93YylewuMlUhz8deISImK6dzPzsL9/efTO1U4yPAxzId1m56dv+Yni1/eEVNK
	tagASmH+15d3ACVjXZMEizsfaK4QZnRGvaHSoGDtCqzPJvWSRxa2rO
X-Received: by 2002:a05:622a:60c:b0:51c:1529:2c0 with SMTP id d75a77b69052e-52b3866e5a5mr18894611cf.43.1785403455593;
        Thu, 30 Jul 2026 02:24:15 -0700 (PDT)
X-Received: by 2002:a05:622a:60c:b0:51c:1529:2c0 with SMTP id d75a77b69052e-52b3866e5a5mr18894441cf.43.1785403455166;
        Thu, 30 Jul 2026 02:24:15 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:61cd:dcd3:c61a:ac3c])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a07d3831basm411483a12.15.2026.07.30.02.24.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 02:24:14 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 11:24:10 +0200
Subject: [PATCH v3 2/4] media: qcom: camss: Add PM clock definitions for
 QCM2290
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-camss-version-v3-2-74a87302dd9f@oss.qualcomm.com>
References: <20260730-camss-version-v3-0-74a87302dd9f@oss.qualcomm.com>
In-Reply-To: <20260730-camss-version-v3-0-74a87302dd9f@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: ircFXG8mRulwf59QIUJ1JfR85CQDKZuf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDA2OSBTYWx0ZWRfX64AYVfooa9lr
 8jLT/YGHeCKVCsyubii23R0DHt7Ag/G4nMN4jslZQxkCy9jhFlNbYGC8FE7w0m9F1g57yMHLUml
 xDQUyc2HMV5ZIE3iLwmgXYJ53z/t5WPbO15q56CN10iJ+bHVfxPdAASHw4OZqD1AIj3t7mapA8g
 hJFlHHMAIS6vMpjuiXiF8cDZBwPPn/euYl4mq+7LPHIw0updMHsoXPO9Nh8PjFE2jXMetn9pjQ+
 TahE27EQKusTz03HAnXK3xaqTLihIVa9n2mOOYF5+7hjFgI44/lo77vnbZ/xJgCbqvcSoTGwP8s
 apUpPMrxzvq5PZLjXqhruuMV6aj/2wJe6N0d1kHTXQS/r1/acDt2JK62q+kPEUVUIslSRAY7Wpj
 5N4RwK+9axsuizhlH6b4WecYkZqXL2WFqjqBxaXbnIxLq92DK4/fz39yUWYi4LCKhygozQ/76XP
 pwGeuoicf9Tr4m5GFJA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDA2OSBTYWx0ZWRfXwXlJ+i6iP81f
 AXo11MrcyjRXSSajZD4J6VQVtjGCr3GlGE8UfwrkFGBvLg2ORCVIIG8WAMmCMfoSeQn5pOkJABk
 tdbF5fECOdVmfCPadO79yoyeb6EE1aw=
X-Proofpoint-GUID: ircFXG8mRulwf59QIUJ1JfR85CQDKZuf
X-Authority-Analysis: v=2.4 cv=K/QS2SWI c=1 sm=1 tr=0 ts=6a6b1840 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=KKAkSRfTAAAA:8
 a=8AirrxEcAAAA:8 a=EUspDBNiAAAA:8 a=AlTZOvFHHOWiQJBrp14A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_02,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 impostorscore=0 phishscore=0 adultscore=0
 bulkscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300069

Provide the required CAMSS PM clock descriptors for the QCM2290
platform. Register the top_ahb, ahb and axi clocks so they can be
managed automatically through the PM clock framework (they are part
of the camss-top group).

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 36534f5b496cf30f02464cf2268f0cba5896501f..7e755184b3c67573752c9d6f21d4436143b3701c 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -5591,6 +5591,7 @@ static const struct camss_resources msm8996_resources = {
 
 static const struct camss_resources qcm2290_resources = {
 	.version = CAMSS_2290,
+	.pm_clks = { "top_ahb", "ahb", "axi" },
 	.csiphy_res = csiphy_res_2290,
 	.csid_res = csid_res_2290,
 	.vfe_res = vfe_res_2290,

-- 
2.34.1

