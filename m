Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E980A4A8A16
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 10:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789554586; cv=none; b=Me0i9umECezQM2Yab6oRIX6+OugvhIAmMYgxTZObEEOjOLlAD00q8wA/3/9HWmdYVo8Gt+1MEd1p0Tb/+B1Ylwe8K6bvkimQ2CfzEKgDH5Bt3D5/V89dg//IViL02p40MOEKgZgKOhtzP0ZibaZ+UCkV8S1QqAUGFgpPKiT/MrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789554586; c=relaxed/simple;
	bh=GnOuiy3DBg46aQA/28bQPDnc882/E7A730/MK6hlK3o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PsEul1NyVZEHH6PhlQMWBTtMoMJzUETyEw6qunAm5rDMCicE4d8kNr4PraOYvON0vAEc0LClHFqJgjpP3jAhtWa/nMCkeNjwwCf7viWBA7FA3mSdffsZRG/cuHJT1Qvzm75r629SIg84Te+aOLnBnPwFSdwEbZoUnCQDU/KaE8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NGPnTCsn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SLSVKCLj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NGPnTCsn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SLSVKCLj"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G92sR81552921
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 10:29:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WTuG3pY4eN3mdqgbofE9B7HAU0+EYKfzvYm+mvUVot8=; b=NGPnTCsnacx8rA3u
	x+7nkfIbrnRAcHL05PWb8wcNlCX4N4EI9Yva4NRo74uU6LgQ/9ZwUEU2FETw8prI
	uibMTH3Su2zBmP6bK58WyX7Mt+3XxjiUnWvAovrQbI28wL7yPtK5YuYujw4HUKQF
	7WhWgfSC309w3BsCHHhB0DUS8MNBpLPlF9FGrMX8DL3RxGUr+Z50zaTqQP1/XyKr
	rrdCfOxK5OYWneyeczipVA8XHUg+Dm2xghnM7vc3tNrLobzwPIQto6G3NBqTVtqW
	sDRMXiasJ0EGHQQBo8ri7VTPDZea6b4JppxOmCJAo2KH6q7l1sLhjPNfZO9ac2ty
	+TXJUw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq9n644x2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 10:29:23 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93a0050a554so1095026785a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 03:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789554563; x=1790159363; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WTuG3pY4eN3mdqgbofE9B7HAU0+EYKfzvYm+mvUVot8=;
        b=SLSVKCLjAuLgMkxKSoEXHJ5MjnW6OSUGRYUHrCOe1QevMdFvLswGXq+/b6VarHaE7M
         f8F2iJrXzvMh913vXQ9abQfxhWw228UnXJClgqnriECVQP7PzPLpYX12dBBr/nt9nx8d
         Dib6qww55D+YfD1Zv/T/sNAVN0CuAmNuSa61hR7788pSfheMKSSI8XXFJuPN2bJLRzJR
         1WvjmToTaCLTmOJgVMKZ0I1knXXO5k+yn5GiBzLmbibWV8+b4e8FKqclS3b50WgNP807
         RbCOvJpeLHj2qutjT2Qk/Zua4Eqgr9n3GPNtyQubUA65hOx4EzX/o0h0FmGB5ajv9YAA
         DnWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789554563; x=1790159363;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WTuG3pY4eN3mdqgbofE9B7HAU0+EYKfzvYm+mvUVot8=;
        b=i5e3TP6HDLPHStyO+xoPpPgej3L2m+hga5MOOPwJdizluv6N+vLjcuTk51kedcik9s
         fOeH0K1ZkhTFjVTYolURUrp75X4/OwQH5dbUJyUCD/2MRub5fbaiqQJRcCdc4/rVuQEU
         QrPIQUFug0kO6rlzQhjICJ4+1OijwfN3VVi3l7csCMvi1uFMN3iTv2xCwq83xxVkZmZj
         40uMroDO8EjY+uqKn/5c9Lae0rk38daapPlE4dFkBj+EZZ66EpeK4BUZDyKwVTyORU/u
         Lmh1ogthQcwjZCDYREtF6soLpEZ/Zn86NL07rTgZedx2NtjFb5DRlcWkCOffP99v3m/A
         apGw==
X-Gm-Message-State: AFuF++l38y8v8wRvktM3ev3bgZs3jJdvG0Y7Bh83ZzcXA8rghjNN76lN
	nk++qH5ifkWdBs17DMyGj2v72GQRCKRiVpVxb4J5JGm965gy3tm3dNcYca/IdZ7lB+lKb2aW/v4
	atxoxxNsBSmXd9pb91no0kBZpCrRZKgDDwFGq1vyPTkh/gntueScXTE0DDILDxBF6kJXvnld8KH
	Ot
X-Gm-Gg: AYBFou1TdjF+7OzjNg02owtrkRrwOhvMev955WoQvJQsKljZ4i2L5rQsRc9NqayC0hJ
	8RqIs7ZDNCx1SM3bq1hsAZSeu7ud87uDPN4C7b2ZMMmaoQnRkA4oNVo7WHaIVY938TDmxMzkuSA
	XyKKbKLLuMvsaWvwdpWhQ491whz7z16yiUh/o0SjJEosmQqfufVlIZmi23Jtykjje+BglV0tqtj
	IoCpbY4FHlJwP4Zv0sE9SjTwEDU4xPEKKoN6Jb/cd0suAlaD2uz08I/Um/TAj3YZHDhYnunYeNh
	CLTzHKYH9ju7FSh7qdcJIQY7jCT9h4XFPVi/oer6O38NR16Po87kZEoVS9Grfe+EhvIwCSk+PQX
	z70XfknI=
X-Received: by 2002:a05:620a:708d:b0:93a:3d71:c9ec with SMTP id af79cd13be357-93bb76e6cc3mr290702785a.7.1789554562297;
        Wed, 16 Sep 2026 03:29:22 -0700 (PDT)
X-Received: by 2002:a05:620a:708d:b0:93a:3d71:c9ec with SMTP id af79cd13be357-93bb76e6cc3mr290698585a.7.1789554561763;
        Wed, 16 Sep 2026 03:29:21 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83dbb0c1sm71633805e9.14.2026.09.16.03.29.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 03:29:20 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 13:28:19 +0300
Subject: [PATCH 03/48] clk: qcom: camcc-sm7150: Use common probe handling
 for always-on clocks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-3-25a24e50f82a@oss.qualcomm.com>
References: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
In-Reply-To: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1641;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=GnOuiy3DBg46aQA/28bQPDnc882/E7A730/MK6hlK3o=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqqm9NOMMChMCUL+DEcmWYx8QLJjA/Xw45MFbPe
 Vt5ixeZ/8yJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqpvTQAKCRAbX0TJAJUV
 ViieD/0VVLBypTiruuzx9m8YkiYfRBCUS20GSYFsmfTLNPyBgQXAYhlaXW9ep4s+VLki62pe0tb
 52FmCFo+j3/hZJ3o619hxWYp7TjFkjkqjZDkwncE9SZ4n4227ejH7XxmHg/EIJ1qKH2WZN9E+HC
 vnG7ioNemB9xfAv+bVjClRYhG0yDB2sg4/U+20nlLE6RRF5jwKm71Umi0GFyG4YqV69hqHlBOtK
 CE5UXzX5rbixnuC/TiPDy4zWRdynSlqoDKT5/vOB8y9X0XDvWcTmVhCLKmAlPlvztEfrfw/vxka
 F0UKkj1J1la/eGpjA3lE3C4BsfCZHVvWAxID/pI+lEFBpQeAFz6+ukSHvN9ZLvdSAgMiGXKKwKo
 BfwZ+fThfEW0g6DKURrnYgSCywXsF6u9MzL2xmOVIta09tltl19p6/TAZFm1J7dILVMtSpCdJlM
 ZljY1hPvtm818+rnNYS3+evoGLuZQVRkUMatZb6QydvFGi9MHcdShOhp+NnhLPBUz+u/AdrTeLH
 ndcCKJkkZgR27DkrtC2uXCnfNRAqCdI5WEobcbRr99lIyxm1QeF8tr8EGP7au23tun8OATtSu6o
 i8wJ9Kh1BPLKqLOXUOvaAiYtuG+K0OIqZ3PPIJ1zf/Z3S1H6yUhhye5pnaLRSUbsnQ9N7YsxYmm
 ePHAhpZvHIyFfZQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=BdVNQbt2 c=1 sm=1 tr=0 ts=6aaa6f83 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=bQTroZZgG8CJslzDRBIA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfX3Uk0mTNZ+50c
 kbZu7WPAX/j4fZmOehI2ENu5aPA4fVWScOZgWOHTOgJKW+7z2L9Af3a/ZGMZQ3gWB4fBxDXkSl0
 r9wYZenW8fqheYxnKbXyCe+KcMlxnOoOvyv960HcCRC4OrplIZMmeQ6ivHJS5lYHdh8claTMPLf
 1JnEeA7vT3t7C9sfTMR/KhQeVMRLyrDC5c/LTcmvpIMvbsmbmEd/TObPSD84QOYLTkQCFgLUNNX
 QktxCs2c6MTSd15FnXQCvnv4zzKzGRltdkLwSTTfSaoSKdyy/aJk/s13EulDgCPMo4jFACEn1XJ
 p9Tvsm/Cfs+CwyDxByiCPhQ6S28CPlueW9gJY5R6pJMHSnJ9Hd7fj+tajYn4y+iYWAjKKDcFdod
 bIAgBP6g9x4o3QROQQroTcQ9VmKHjw/80EJKAeDRCPr0PTwl+yI0o0QzrpJAWWJHFvc0e3A5rib
 mSKUnoMQhe8iukZFPJQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfX+UsRoFrZkXJh
 XRqngi7f0e44TDYL1LTGUcVNMct+Om7KgSwTO30l0M4LKqksxtcmYdiOgCutCUcKsZ3U6wBq7b0
 Q/tgdQyMHy97t0vkivvOgBe4wPCXcZM=
X-Proofpoint-GUID: 8cxcOQf-fFW3_OlqLIEleOmF6z02cFTY
X-Proofpoint-ORIG-GUID: 8cxcOQf-fFW3_OlqLIEleOmF6z02cFTY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0 clxscore=1015
 impostorscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160137

Describe the always-on branches in a critical_cbcrs array and reference
it through qcom_cc_driver_data. Let qcom_cc_really_probe() enable these
branches instead of programming them directly in the driver's probe.

Assisted-by: LLM
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/camcc-sm7150.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/camcc-sm7150.c b/drivers/clk/qcom/camcc-sm7150.c
index 6f75689e9847..d06258327ba7 100644
--- a/drivers/clk/qcom/camcc-sm7150.c
+++ b/drivers/clk/qcom/camcc-sm7150.c
@@ -2008,7 +2008,17 @@ static const struct regmap_config camcc_sm7150_regmap_config = {
 	.fast_io	= true,
 };
 
+static const u32 camcc_sm7150_critical_cbcrs[] = {
+	0xc1a0, /* CAMCC_GDSC_CLK */
+};
+
+static const struct qcom_cc_driver_data camcc_sm7150_driver_data = {
+	.clk_cbcrs = camcc_sm7150_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(camcc_sm7150_critical_cbcrs),
+};
+
 static const struct qcom_cc_desc camcc_sm7150_desc = {
+	.driver_data = &camcc_sm7150_driver_data,
 	.config = &camcc_sm7150_regmap_config,
 	.clk_hws = camcc_sm7150_hws,
 	.num_clk_hws = ARRAY_SIZE(camcc_sm7150_hws),
@@ -2038,9 +2048,6 @@ static int camcc_sm7150_probe(struct platform_device *pdev)
 	clk_fabia_pll_configure(&camcc_pll3, regmap, &camcc_pll3_config);
 	clk_fabia_pll_configure(&camcc_pll4, regmap, &camcc_pll3_config);
 
-	/* Keep some clocks always-on */
-	qcom_branch_set_clk_en(regmap, 0xc1a0); /* CAMCC_GDSC_CLK */
-
 	return qcom_cc_really_probe(&pdev->dev, &camcc_sm7150_desc, regmap);
 }
 

-- 
2.54.0

