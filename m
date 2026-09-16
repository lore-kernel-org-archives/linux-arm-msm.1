Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E4A84E80A7
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 10:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789554592; cv=none; b=jLwinhmponqGkGZ0M2k+eqWieMeIXh3auCPx+bmx0sGZE+YxApO9RwZJbOT0o9jrcrOk0LO5OtHbbXOtHwfxKJARphwSK3A6cfoRzVsBhuUEUpn56ch5ET9eolvGIhRsSKpMzCZRmkvGhSzA7t1LmXg/e5qNigGsvu5fbnQYPAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789554592; c=relaxed/simple;
	bh=ypiCu47I4IEyPRo2zVhhtC5p2bQnKg6ynv1JvKvQ1gw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=atTeWZm8lmpIMroPyGt0SBGvvF0unztInK1lJfjoWL/Z2BJJoWBHrtjfLv+MoRqo96HtZLiFaVgRgosdCP1IowcEQlWxobdLGwEvNYsB5yak6zy/ejO437Z2tqOjdRlPzzaOi7mafBphLBulUV7nt76mh3SnLdyZ9Q/XjWUdABk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DOZbDpBP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IhieN8Df; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DOZbDpBP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IhieN8Df"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G92xf02822753
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 10:29:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zcnJqIehfozzPLFF0K4dR83d710JHr3Sb/hvkALSU+Y=; b=DOZbDpBPQtyKYM/1
	5Cbpp/h5e+0Wmk3SAbM2xvZspF48eIDYA25iPS/AEzdkAYAGxj2Ul8cKcUjbQJ/o
	Aa4X9Mka05C/7ZxakOq9lGRhAKMeZBO8pfccHK87EXEVO7csZKqW3ilcd24Vgg1N
	0gi8KsimCU8tI/B2Vkv1KFeco/FBcjW1eCN3pjmbFK6vicGYDnhhQNnXT10Ybhct
	jZyoMXW/qbG09vWZojzIVTUq6FLCugTkqisYjlnT9gkEJ+2Cc/SGtZcIwGAG9g86
	blhia/7kefuMZ+CyuACSYQidv5JZ8y0/1eJOt3igFiGBQjpy/HdGhUHWRuPg3jqC
	fY5UIA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqfvfjb8g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 10:29:34 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-934963b2bc0so1117218685a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 03:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789554574; x=1790159374; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zcnJqIehfozzPLFF0K4dR83d710JHr3Sb/hvkALSU+Y=;
        b=IhieN8DfjWHN5Zy4uZLOAywzMLE7DYXx/NVnEeZyES11z/EYr9Ua0H04eLOm/uGvws
         YCOXLwSaAPjxTVI72RrPSlOa+eB+2p11o7sQ5MUR2oPzBkbiZRIpKKl2v2dDyyDMyy0S
         oBNX2cMCKlndVTpXR+utVAmcmv9tnTio7vQFao1wIzGHah8gQ2jmYMOz3VACI2tKqrA9
         wBdoMNbOKDHbJ2TAfprYwoktBTsPcypCGP/ZKz6LRemqenY2B1aLZp7a9xZZDcGoPLr1
         TuFcCNeyfmlPruSD2yBb7PY23v7BDglG1IYlYE9H+eWgEhJjqxNz40uY7O3lWLvahKEh
         BeBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789554574; x=1790159374;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zcnJqIehfozzPLFF0K4dR83d710JHr3Sb/hvkALSU+Y=;
        b=ZDrPMzMLNRFAWljxBA0WYrAXWX4532CA+FxvBSS+YwMWVWfo7wl/oCFJTZd9r+JlY+
         hwXK8kx3IF9qgf1QXU/AxqXlTuerAX4stZA0615FnoZa2B32OvXSKzJT1oSmeUsbcTMQ
         n4KcOExbWZAthogiM4cy10ziaEy4QCTF4mMq1RpmVghKkZ5RTfaf2MnHG3fkdEbbqUon
         9yfkz+phuR3KlTpDknywXjHGOzncLtZDzsv6DYRJOq9JYoQTylgEfXKOsBbWm6Ss3IFE
         mw5YRhJPF1DLF6ovyNkGt1l6UN/J6tbiwB4mT7hN1g/JOe9jHCgViYktnhhP6zAk093y
         OlhQ==
X-Gm-Message-State: AFuF++l5Xsl8Ecja151Fl/iwDENeTP1xnlRSNG0aR6OfhoSxfyURipCb
	9MMx04G3zQRJnsWzynmodnTqK4k8SVEof8ZqoccXznHgHL/AtYG6WmtZNQ8E1OfqahUjsnMlAUe
	dG3YQ0sszAWVMFMnbFfbC2+Cv2lVI7sKZ73ha+SYBEswzRwdpaeTjTGdaVRBJzugE+e4h
X-Gm-Gg: AYBFou1IESe4Fey/EbmFLpxDWwtgIUHs7lTDVkbIscxxBDbAfkN1MpUdDygpnjQArJX
	9YZWVHjN4MYmY5z0XSutNo8egYDNEN5JdNLQ/nt8fVzruhj20b8Egn6I8KHpHX/mEmi2z0tzD9D
	jPOV650epOc0aLl/RfcVJQwiRoi7CYyZ08csDfJYWB0/vQWxT0nV/xAmWJIKLyod0vTaR2KQSHd
	QTmwvwXt8P+7fgaZJJNCQ89zMoeLbrTT//9M+hwUnqgsjv1i95fZwsF14IKdrCQ8SwDu4XMoiS4
	d8oUMj2rAzZJOuV5oefUGjqF/QjN1IfVbZ3LUIR9QbS4S346gYLWNDLXUF5MN4mSQo0B3gNoSr3
	eMjRKjCs=
X-Received: by 2002:a05:620a:438e:b0:93a:13aa:1b6 with SMTP id af79cd13be357-93bb79aac6dmr330888085a.51.1789554573920;
        Wed, 16 Sep 2026 03:29:33 -0700 (PDT)
X-Received: by 2002:a05:620a:438e:b0:93a:13aa:1b6 with SMTP id af79cd13be357-93bb79aac6dmr330883685a.51.1789554573411;
        Wed, 16 Sep 2026 03:29:33 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83dbb0c1sm71633805e9.14.2026.09.16.03.29.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 03:29:32 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 13:28:25 +0300
Subject: [PATCH 09/48] clk: qcom: dispcc-sm7150: Use common probe handling
 for always-on clocks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-9-25a24e50f82a@oss.qualcomm.com>
References: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
In-Reply-To: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1620;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=ypiCu47I4IEyPRo2zVhhtC5p2bQnKg6ynv1JvKvQ1gw=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqqm9T+dOeYunGe9n2O6GSv40uxFl0RgFA92++G
 crYJo3GzC2JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqpvUwAKCRAbX0TJAJUV
 VniIEADGc1GuTU5f/6jIFVUDSinnIFolHL/2aJBLhrlt5AQgqrqnG1sctjZMkJg5BTabnTfBytK
 OiR1GNfEhOv3Wtr1Z3nBBdSaUaGJT+iBE02k/09FVSVDz3Q/Mmv3JlintZqgE90K0VsSbLHMChY
 SlaxOCNyhM94HifpDuI/pLfO2bzWR9n9N2Tqy2nuuoa2ry0jSbrwUsv1iGIVTVzQk8KiqB2e8h6
 QIz/em9zCxIWSoVGCJjZPGUjgGy++2Ly0TCqfl3xXjF35VKNOjKimXstrcXv3nF0k8HKHhrxltN
 2iD9k7wWAy4XDlYJCUsPfxNU25ODBmTw30ULZ/4t69ZzaMU4ROVCLsBfu7NVeG0mBqMihSURovl
 7P87iavKv2YeM0RPlCq0MYgonoONJE7jesyh8U1JHkETK9CfVZCnP6oWOmrvsKiRBb/M6L/Urg/
 6HhoKZLiK2tE89u3wurzxE7hwmth1scxjDug7oxzcDGhZytE8BWEulQFPuXHoLz9pWIf39B4UnW
 ltS1aCETdR6M5Oppt39jxBDgCXvQGH2aKvUSfkpNmiTSeTjLr2Prndye2omOtboD5YX1vDdV8Lh
 yCFKVtR7cJjQQg9Nqn9bBoK2i26fDioNWx2luPt9swQj1OzaH7lZtAa2AnbokWO79lgSdvzgouc
 tckBs2vfJOZVYLw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=JYkpPkKV c=1 sm=1 tr=0 ts=6aaa6f8e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=6fVa3aOakVPtjiFSkAIA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfX35tkfcZsvhYn
 E8e7o0x4gETtM6gXAgUr6yrA+kbQqJZcWzCu4A3mBnF8EWgwEf6VbQPsRtkqWppXtKQdprrfNRw
 CADcx5aLg8RhT1Eu4i8JIxlNtlSr1gt1Eo9+Ms1wIV0O5rp6SSS06H1bTGvMZUcPR/xqvecx5Yt
 WVC1kc3QxWvNLiWwlsk5XzVALkHLX6Bp7LzuyTQZ/a0exS941zerpX0Kd2gNdb1puCUgdYUMBX6
 bHCu/3a95e/n5KEKZCzW2IezjtwXqDofstv05R37a7f9tLcIYzqDeeScAKnEIpH2C8IRr38b1P6
 CYrBlyHOhKGlzNrWKAQvbEtZjVCMSDpFBb7VKRw1seUYFOk3cYx+yb9kUVeczFkXoCiNx3Ja/bW
 We7fenGzhQPM1Fyjj4TGmTa8c2R2e3lE2B6/OBQR2+xjZC+IvMIWl5LheCnkQJD8eeTVrFI9us3
 E6NRdNuH8ukyBZNxCFg==
X-Proofpoint-GUID: 6Lw5RVgEpCTUYyS-TmFsHrASugsRJiO1
X-Proofpoint-ORIG-GUID: 6Lw5RVgEpCTUYyS-TmFsHrASugsRJiO1
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfX1k87bWkGjZJk
 f6CN7k05eZ/CUE74yhkmyVN4vVA5Ku+KtKGGFc4VtnuuWur3TN3glKRxl8G09hWJUFoBu4j1Fru
 bqyl11gFibbFn0SG4ofZKQa23+e8DBQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609160137

Describe the always-on branches in a critical_cbcrs array and reference
it through qcom_cc_driver_data. Let qcom_cc_really_probe() enable these
branches instead of programming them directly in the driver's probe.

Assisted-by: LLM
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/dispcc-sm7150.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-sm7150.c b/drivers/clk/qcom/dispcc-sm7150.c
index b9df6153e50f..da7610856e56 100644
--- a/drivers/clk/qcom/dispcc-sm7150.c
+++ b/drivers/clk/qcom/dispcc-sm7150.c
@@ -963,7 +963,17 @@ static const struct regmap_config dispcc_sm7150_regmap_config = {
 	.fast_io	= true,
 };
 
+static const u32 dispcc_sm7150_critical_cbcrs[] = {
+	0x605c, /* DISPCC_XO_CLK */
+};
+
+static const struct qcom_cc_driver_data dispcc_sm7150_driver_data = {
+	.clk_cbcrs = dispcc_sm7150_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(dispcc_sm7150_critical_cbcrs),
+};
+
 static const struct qcom_cc_desc dispcc_sm7150_desc = {
+	.driver_data = &dispcc_sm7150_driver_data,
 	.config = &dispcc_sm7150_regmap_config,
 	.clks = dispcc_sm7150_clocks,
 	.num_clks = ARRAY_SIZE(dispcc_sm7150_clocks),
@@ -991,9 +1001,6 @@ static int dispcc_sm7150_probe(struct platform_device *pdev)
 	/* Enable clock gating for DSI and MDP clocks */
 	regmap_update_bits(regmap, 0x8000, 0x7f0, 0x7f0);
 
-	/* Keep some clocks always-on */
-	qcom_branch_set_clk_en(regmap, 0x605c); /* DISPCC_XO_CLK */
-
 	return qcom_cc_really_probe(&pdev->dev, &dispcc_sm7150_desc, regmap);
 }
 

-- 
2.54.0

