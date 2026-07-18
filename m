Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 498013859FA
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Jul 2026 12:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784379436; cv=none; b=krQaqiNYVHRkhj3JOL2yGPzzap5lnoBJZxxV9RO0+Cc8yVW/wq1u/Rk0+yFZkY3ZGNML9Jujx0Ys9O4wrbY/4fMvqRVXo7C8hoQTmf2c1/5fpBo2eZsVfE1az7FCqwhLNhObfeIT9FLDPG6BjA7lsfJPMIMvNNbBFXcrXIjUyK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784379436; c=relaxed/simple;
	bh=/jTDJO9KspNxdxYq4mtRdVNu5us04CJIaEmoBmYE69E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UE9xnn6Kx/BvEil5yUCkM14l1nO0wwW6FYLwnJQDwh9Dl6jHSagSlQqRTYWlcMC++76BEcJpuziidJIZY3pOyXMOWm1nt5hIy9gBd1lnuHhM3qBsAo/uPwkuKY6KGZggAkbF31opUn3U2GkUfiR1t8jPXhdK2toJFYQ3wTXL96c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Csqhf6+r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XqWgW0lG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Csqhf6+r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XqWgW0lG"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66IAI42A476681
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Jul 2026 12:57:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y0KMHDR2aiF0aBEdbSdNagjZc6RJmwinGEkBwK7ConA=; b=Csqhf6+rZiEaiw7P
	kqeW7q9E47mFHVNmOCAxSUJrF7GnsudI60jnMM0cxQXzDzmAEiZXWQZu6kSKz+cc
	5TJ+BUpRsKr8/LTqLYjP19UESiOh04b8/CWq22N8KY5ssV2T1nv0YIlTacc9FbRg
	64VoeEBadMRa1YHqKI+SD9Snev8HeNW4g5Ejho+4biaK37imF6JY8U+Gpi4DlSGC
	bMnLBWf+b2AR5MpODFVGiVzACT90fgTQ5+AE8PUD/xe+joZWaCLQC6tHs/pwIzWY
	hlk17kwy1zcUHa01tR5o5kDrq97xCpgVgZaBWXzMJY35tYJkEGPHvAXVyqHpfbqI
	Bdl4Mw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2bngsq7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Jul 2026 12:57:14 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-381abcccbf4so5232699a91.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 18 Jul 2026 05:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784379434; x=1784984234; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y0KMHDR2aiF0aBEdbSdNagjZc6RJmwinGEkBwK7ConA=;
        b=XqWgW0lGjdm3eI8g8Gu9qQTKoyGaDqR7caDl7oCvGVVbJehE+W5PzpKSLtS7hDzKux
         3QJ9lbRt2BN/4WgfYMtdJFg9KGzKiYWunURCJSo9mbHA/7sBZFPoS8YQk6vlNFEt32Lm
         eNQGk4u7Itd830zmKpTrd9Phc931h0Re5OYzbpQbTQb9+ftRkw3SV00zwfexBLEI6OOT
         vbY2cVwywpI0L4MYiipGZWxryzf0fwc+Dir/zCClDT2xMgZGrIaZZUXYvSqy2B1JEejp
         E9DkTxhOL/eQurVvaiMw9wVAeZmSjqywPxwFksi5cd9APZTz4j5HegZHv9O5uLXDKWBp
         +r7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784379434; x=1784984234;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y0KMHDR2aiF0aBEdbSdNagjZc6RJmwinGEkBwK7ConA=;
        b=hDo6hPAxZUkWQmm/cT/yLizdJ9HsklHYcuvbTrCQR1c8gd3YiqLhZ8fx1vUEpXhGK5
         ytF0amIQwN/gf3NsU32rk25Yc04lyzyyr8E6Jw1M4Z9+3gKzhhe6pMsWx/0rJnRxd9vu
         0JHgCcOIfHm1G0rUveFx59t2XaEMuVVPh8gY+4sLW8L+qKpC/p1nfG+zCU2XjpMoW3hI
         gswUtpN9A5Ke1AT3Sx3cUazWqtaTgnw7v1JP8rJ4N+GgKnhOSlyd5ehw+iFtBjwDE4KI
         LUtHLTzdaYaSiv9Xn2YwWQWUAGpBatHjqpdlh2uwkZjPdySY/va0Q7aaMETEmCvs/Y/c
         W4wg==
X-Forwarded-Encrypted: i=1; AHgh+RqijcaN5eBr90t7Kf6jXlMgdxYebPI1e47wBshJjh8P1/se92TWzflNz4EgiCGs6q7kVdBGc9KY8zsXpa2b@vger.kernel.org
X-Gm-Message-State: AOJu0YycxuPLIjNnIiEW8j/uv1CZ0SxHdNAj+ydNGdZgFOtIE3WmGvnV
	Frfk7VNQeBpzh+DwzhLZ61tyObiXuQmeMABoxkL80lIzzuOfRmrvMsBCHMWt2BAJCHE7JCvhfrf
	G4lHN3AxZy5s0wCC1aATY/pvOdbL9Kll7GYeCBqXnYVmr2TPcMOOgeYb0qbtrtKRMjRXc
X-Gm-Gg: AfdE7cnP8axQvoqNELpW673QxF/v+tmkJDZKXUe1Oq8q73eC8By4mi8snlNsC29tc0f
	1RVM96KS8MPAvx+DQSmw7CfUaTfeiZpXuoykQooLvuE4rX6eLl+rwAl+0t9x6MHoIsbiWgfjyf8
	2YH586qYkTCZQT0G5v0EvIlljXVjMUJef6i7rdYHoqe3T4h2+uD0u7hYB6oMrj1WifLtxQEhmiA
	WKiEJZR+rsyQwMjr78begYT45cNG/bNF9XVyFR74YwtHaHam8OPo0aHZ6nYok/v2A8L7GRD9w7w
	gSdq5AUS+MNJJGsuudwPBImPXSu/srOzDepsqNEVQ3va1amxSaG5b88SduMmA6hqSgr49fBxU7m
	2IASr47sNeQh4GO211FnBA0I1VHkGhBg=
X-Received: by 2002:a17:90b:518e:b0:38e:6ba9:5203 with SMTP id 98e67ed59e1d1-38e6ba9529amr562492a91.22.1784379433554;
        Sat, 18 Jul 2026 05:57:13 -0700 (PDT)
X-Received: by 2002:a17:90b:518e:b0:38e:6ba9:5203 with SMTP id 98e67ed59e1d1-38e6ba9529amr562457a91.22.1784379433125;
        Sat, 18 Jul 2026 05:57:13 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce2a18a47sm14238910c88.8.2026.07.18.05.57.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 05:57:12 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Sat, 18 Jul 2026 18:26:15 +0530
Subject: [PATCH v6 08/16] clk: qcom: gpucc-qcm2290: Drop pm_clk handling
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260718-shikra-dispcc-gpucc-v6-8-62703e05ef0f@oss.qualcomm.com>
References: <20260718-shikra-dispcc-gpucc-v6-0-62703e05ef0f@oss.qualcomm.com>
In-Reply-To: <20260718-shikra-dispcc-gpucc-v6-0-62703e05ef0f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE4MDEzMyBTYWx0ZWRfX+4mz6cEdaocR
 J2tZsh97+GerB/gRXA91cv19HfuQkwI//QEOTwco7/rR/gSs2Wt9t+/BoydqcgUo3eZF2ULgoL3
 qCjs7I4oDjpEK2DJsIw5dWq1BHWwikzy0iaL1vAKQRroSRMzqtqKnvr7mBpWvg9HGgtSCV7hGsS
 Q+shu/Fl38NfG2hQTIoz88/uGggpdD6oqIXU9yDitcgphnmgWhBN+ynV9WgeouBaDwHZZzFAfnN
 w7Sk9hpxCSCofkT+DqJyS8hH3teGzMWoBgx9ClxzchZb0mlAc/HsL0FpEXxM9WgvLdHVTOTndmN
 DANuhSsgnmhMVUBaY6kfT6WLDj4Jyyd/1K1UVyHrpl/AsAjEHCrFTEaS85xp005IjSfAneUP1x9
 sTNOzXvEUSQpuWVMJNaMv3OBr6qMDmOBNUILBbbUvJscv6kM5Fcr3bNNJHK31XNymm8YWGR8pmM
 zHfoTlxomeSKl9IsBuw==
X-Proofpoint-ORIG-GUID: SwZmDCudQ_3tO3v_1Eu9Vk9IOTspF1Vn
X-Proofpoint-GUID: SwZmDCudQ_3tO3v_1Eu9Vk9IOTspF1Vn
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE4MDEzMyBTYWx0ZWRfX+SadAGuRAzY0
 xCol1QnTmEALArS0nmFhbTtkkGWlLLyYZeHn3TXY3wt0oDxRPgnVzEtC2wfO6gkjwNlTZBo4kij
 hMbYHSpDIP1IZ4F+15/yz7Q4R25Hak8=
X-Authority-Analysis: v=2.4 cv=deOwG3Xe c=1 sm=1 tr=0 ts=6a5b782a cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=au4WXa36JUhwBKN8UdYA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-18_03,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 malwarescore=0 clxscore=1015 phishscore=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607180133

Drop the pm_clk handling from QCM2290 GPUCC driver as the required GCC AHB
clocks are kept always enabled by the GCC driver during probe.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 drivers/clk/qcom/gpucc-qcm2290.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/clk/qcom/gpucc-qcm2290.c b/drivers/clk/qcom/gpucc-qcm2290.c
index 4e97a02d942ad23af561ec6ce1ba0a6f61bf5a69..f14b4620090efea139316ad833e034536caa5199 100644
--- a/drivers/clk/qcom/gpucc-qcm2290.c
+++ b/drivers/clk/qcom/gpucc-qcm2290.c
@@ -7,7 +7,6 @@
 #include <linux/clk-provider.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
-#include <linux/pm_clock.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 
@@ -385,16 +384,6 @@ static int gpu_cc_qcm2290_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ret = devm_pm_clk_create(&pdev->dev);
-	if (ret)
-		return ret;
-
-	ret = pm_clk_add(&pdev->dev, NULL);
-	if (ret < 0) {
-		dev_err(&pdev->dev, "failed to acquire ahb clock\n");
-		return ret;
-	}
-
 	ret = pm_runtime_resume_and_get(&pdev->dev);
 	if (ret)
 		return ret;

-- 
2.34.1

