Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1A714E2F17
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 12:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789646785; cv=none; b=pyn5QV96P44EOCR73JpULB0ezZ4xLWFqz2+OIwpvqAiTBqA1vRZHF+MTVt/qrVvWQWah/GtxZ6E0eHTQuyJXDSok36wPbzaol5OF3awTZZZy6TixaY+N4k2YmxuYuOMOazjHqszVwffnJx00nsqKUwygvlwMfHDj1oHcVnuYrHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789646785; c=relaxed/simple;
	bh=dRIORkLtErUy8tQv0r5xQE2yHwcn16W9lhrS1ITHzeE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ekZAeduToHoj2U9wNWLLeZVuIxMaBIBpmx/sKgpO8E8wxo9OHveEOGlHNGVV5g1Y84HnkhOjj+BXwbAa4JZBEZDcoft3huYa9sqILQiTZz33RWLA8q/URfyHt88aEiG9jsCWOAmZh0kpwM99iV0FkNgFkMIFknrsQJ/cgHc2eDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U7Uwg5eF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FzKI5Em3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U7Uwg5eF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FzKI5Em3"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9Zc4O1257860
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 12:06:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nP3wcx2p80nx+Tohacyx3IYJwpEKwRThxmKFCg9vGIo=; b=U7Uwg5eFG/pmFsnM
	xjn7dPDCxwjwcnMVZJ9pEha6boZUgOzeEhD0h0Jw+xbO+nHih2NI6K+0bwLOoREq
	AoIzbhQHSD+uRSNkJga4b3wv71i5fHxey2c2sr1/nF4Wh0KSFK1omFIkTI3FurZn
	oUsA2iw08xh80L1FV8YVvQ2azYF88oexBO6K9l/yZjBb90O0+7uLGGm5PJlswt5C
	LXxD5ghUGbpYy7NvyK5KAXltBWQVND9V7GdPiWfH6O/aohR69wQKIjkXsYLtMcYq
	iBkUKHrH5QXfU9M2+29tgnp2r5mAQsaVkAy+ozJr8NOxqI3sWsI72Vle4eTrOl6l
	iqCjdg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grdftgn4c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 12:06:15 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39b77130a7fso1450606a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 05:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789646775; x=1790251575; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nP3wcx2p80nx+Tohacyx3IYJwpEKwRThxmKFCg9vGIo=;
        b=FzKI5Em3ACbwlrSdfVBaBTqlCqdkwiOMpUVgiB45BUavS6wq1BaO8+jLg3tUsP7XjR
         Kxy3htgA8A7jGXsoYO8hl3+SkaKbLUC3Ok/no0JeyklQB6fCH3Too2zbx40Kudb+9F7P
         IzE1ZUQwpBvw7c4ER6+/RkoGSCMjM4MCwU93Kyw7vVk0SsqaWrJdOoaxXvbzsDBLE9C0
         Bj43miPut5uu51hbGofNg95102P68ItoOTw+l/6sgejYwaxN+7NWzlwo6X7E8OsLVgQ4
         H4WUqn2VgUmN8X3D6QyWXNaNc8Ye+0TMOD3CNQgbTG7+HgRxvKSz22bjTYHPMLIyQUEc
         NM2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789646775; x=1790251575;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nP3wcx2p80nx+Tohacyx3IYJwpEKwRThxmKFCg9vGIo=;
        b=jTTs2nDyMj3aMIdg4SEJadChuaFlFOmg+4HTf/+cz3MRsqvq7I4o1zMY6/tFpq6+26
         FkRiFp92YeitApzZySyPuqbxxBAaxgvQyG5sRknjAR8FXVsR1dVBoGTu0eQaqYzPasMy
         Vf9+ABEPkg1MNoLfIVP3GIEpg10nPFRK+V1pbGh9SsBiZwOyupjlmwnpGKh5Uti5BKdU
         a+VcS5ejAKZaPajfmIhLXsYvL/ZFM4BuDRG9o2ilYHwqhdbv7uQXhF5CdJ4ek+Lb5Wha
         mT0PKVdTMbjntmLSzNCKb7XXEQVYH4w1GK7Ax1qF65+1IGoB/Q2MlEsUYfQeQExL4LWI
         WUAA==
X-Gm-Message-State: AFuF++nTKCvNVF+XTPC8itdM9FC1qEZH2ov1oeCrKiZ8Wo49I4XH1t8A
	x2Bn5ldLN9CVlUz8p7D0Dw1RHJta3OxLrRVGAd+bmzoij+ZFRm70hStqiXzZrDhTvu5zNhnOOQP
	fBOYZXSBUIFgfcjLaKgGGlwrtWYZmesxBHzhuAYtDQSnv/uYqfEgWRC24Fy/V+CNWI1ag
X-Gm-Gg: AYBFou1gZgY9k+1h/broDlKAYXxw8GfRxLGayG8PSqO8XIQpk9Z7K2d/w07SGOOJghk
	WGQjyzMvxvxjDTqleOHM8YH86MWO2VWIk0xsgfLk4mqgQ4fqoxzUHPRFswHRqQwaDJIBVTxKmcW
	2We+7AIPmFtlQpHrlETWwkkmP3hhSNSw2evZFMFApXiLQL+BoeNmXTX3ssXICH9vhrkYLD+2eKE
	RmiaNX5lxmlKMt0dmy2yp5+PtzObeZG4O/0JHsYChB/Yjft3/e+x7WxkvFK7k8AaM4hTwTNgv83
	dovacYGhxKLVERcp2hWI0cdK5k0gObLsNkG635PwM6xSpnCycF6Pb8h/+RrqZDBq7SvZr9fzDgW
	cVqCnfJdUiOnWEr9Sx5muP7KmbloqvA==
X-Received: by 2002:a17:90b:4e88:b0:398:cb56:e92 with SMTP id 98e67ed59e1d1-39e1e30ba45mr15795509a91.11.1789646774864;
        Thu, 17 Sep 2026 05:06:14 -0700 (PDT)
X-Received: by 2002:a17:90b:4e88:b0:398:cb56:e92 with SMTP id 98e67ed59e1d1-39e1e30ba45mr15795404a91.11.1789646774273;
        Thu, 17 Sep 2026 05:06:14 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e35d9869csm5007612a91.4.2026.09.17.05.06.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 05:06:13 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 17:35:43 +0530
Subject: [PATCH v3 3/3] media: qcom: camss: Add Glymur compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-glymur_camss-v3-3-1d0e2d47ad2e@oss.qualcomm.com>
References: <20260917-glymur_camss-v3-0-1d0e2d47ad2e@oss.qualcomm.com>
In-Reply-To: <20260917-glymur_camss-v3-0-1d0e2d47ad2e@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789646750; l=1214;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=dRIORkLtErUy8tQv0r5xQE2yHwcn16W9lhrS1ITHzeE=;
 b=nxyrFl9h4+kkxs5v1Hz/1ajWuTIr1Gc8gWV7jz5BGt7loaxka1cQ5RhKwkSGqRpfQ/S++FVgB
 BxTRaBQ3SFkAdZaZdLczev5MWeJ67nyhFZkOh7hCbvax5qVUeDTvpig
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE2OSBTYWx0ZWRfX7ymtCjqtGfGD
 gbM0LxHmepMJpNeyrYrlM+76kyKSNghgMItATuc9BSP+5loWlRLMBox1oDbIEmzAdsT8Xss8p/R
 S1urL2xXrTqYzjCBe/0Ul2/xvBGL4FwphtpHa31SsG+gO8pyj7nm2mlGLLedFDVVNNQDgUeng5I
 ntoZhyDKMLZjv04PVYhts1OwXwUdEP9mywEpWOkBZGAdSEQp6Xm+e9Op5pt6Qaa5NdWwutNZAxg
 OCCvTIObQGRPyrGVLkY4d3Bg6uxAXwMzUb3GVadhvVwD4k9Fl7xX1/LbbDgF73UCkrisDr/axg/
 c9SeH11kVlDBmLQS8dzIKYnqtbtDBlnAb8uFRNJAgzruVkMqgxaxroP2E1s950hOhl0lUEuzfWS
 cmbHeGIGbyjCjC4UimZZVzsk2+Tm+sqS1nJqR+m5gK6lbyG9akSY8Kp8F3gdILfhw8VgSnELtGN
 rpV0FlhDq13J819zPzQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE2OSBTYWx0ZWRfX1P88rlo7rVfA
 QMYeMTgu9+tYXpN6bCHbCfhA6FN0mVl8azj3yUARqvJ2AWgGgpAoNJhzcjJ8fKX/DYEnofvOZyr
 JZ5SEgOJo32JhD6XtT1TKXWbTGBzJ0g=
X-Proofpoint-GUID: rrAIuPVFrOjtW4LheAJZ1E3b3Uekd1iD
X-Proofpoint-ORIG-GUID: rrAIuPVFrOjtW4LheAJZ1E3b3Uekd1iD
X-Authority-Analysis: v=2.4 cv=K+W3jCWI c=1 sm=1 tr=0 ts=6aabd7b7 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=xYyVevvQUQiUFKtwU9sA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 malwarescore=0 priorityscore=1501 suspectscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170169

Glymur's camera subsystem hardware is a functional subset of X1E80100.
TPG, CSID, VFE, CSID wrapper and ICC resources are shared; Glymur has
three CSIPHY instances versus X1E80100's four.

qcom,x1e80100-camss is not used as a fallback compatible since it is
already claimed by its own binding schema, causing a duplicate
compatible warning in the DT schema checker.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 2123f6388e3d7eafe669efd6b033e22d8eb5cf79..3585c63c45848793696fbdc3004ddc867a5f115c 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -5758,6 +5758,7 @@ static const struct of_device_id camss_dt_match[] = {
 	{ .compatible = "qcom,sm8550-camss", .data = &sm8550_resources },
 	{ .compatible = "qcom,sm8650-camss", .data = &sm8650_resources },
 	{ .compatible = "qcom,x1e80100-camss", .data = &x1e80100_resources },
+	{ .compatible = "qcom,glymur-camss", .data = &x1e80100_resources },
 	{ }
 };
 

-- 
2.34.1

