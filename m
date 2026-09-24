Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AB4549CF32
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 12:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790251765; cv=none; b=XOvzZQNe+VyGe994BHolgfVNaljCUIj3pO8OscnE9ObuLfV/wUIWvSMYoXkOIEMk8E9waYprEIH0LamTHOxMqzwYcI6ekvJSJcDMgvfIThSriLa7/sQY2uCRVyeYI8TTQ3ykimz5cfTdAUElabv18VPuhqlyswOK+b7cDyPzlKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790251765; c=relaxed/simple;
	bh=oz11M2wrwKFK3+vSAbicVJWmbq+jkXzbbamqOEjW/JU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aqJAj1wlzdkjpfv8sMZhlfbfDOBxO9ZkEHtVkpHuqXEUm/9TYzjv/0VwR8WMXQ265rj2pcVKGAnhWIeWebrBdRrH2IIZdPDABWvwlKsYhv9BKQeW2T7/EOPOKUs//N0rjuUJEphw3HgWE+MP/omUDOAzIygh9PfXbRtlHfSVz5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lVHTlYZp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gDoNBbDx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lVHTlYZp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gDoNBbDx"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OC4coA2133948
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 12:09:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qeKdsxYcHc+Ri00U0V0fl7QmJgNHnzJocuSoN1PXB/A=; b=lVHTlYZpYPwWBtg0
	h76lzVi8u5tNVaHgSMC8Ubi4CTuDCb2ZHmgxm6sxIr/y/cDwL6qD5MMg8Grvt+/Z
	yM3uE1OfEcJolt130av69aF0tN1e2R+XyECXiEvdMARSdr9O5sjZSGIke6bQWHoS
	nHMhoTYP+zJTOKwYzTz4yx4Dm+IqfH3OQUisxjLZK3OiXINIDM9qspcYCveMBKZv
	DKesEyPrjroMPwe59S403lfFkRshriXBf22fGj7MJWjJy0xmoI1Opv3yu1qJW1WV
	AwIdELsHVtroyKfCn65Y6DPcEmJpDwv7IxUx6JeW5OslXRENAXNz76Tf19dnUJzw
	u5eN8Q==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvhsb4bxu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 12:09:21 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5c683ca769dso783329e0c.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 05:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790251761; x=1790856561; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qeKdsxYcHc+Ri00U0V0fl7QmJgNHnzJocuSoN1PXB/A=;
        b=gDoNBbDxZMVLcgXE1opdkB1VBxxTsMvUm6LDIzscyWdA2URE5Nh4JgOM1LIgb/9EBI
         SrXCqmrUx2hYmnwuSXSC1dlO8gkJVJlkUGXkoaeMOj0lbTdSzBV97PbsQnWjnzVXQDaS
         Yf96MaZXtKh4M0kcvQLpm1N3z6o3T0FsHgxDlCxzwiZkWTMeWrLGaKIQPREQOeP7En0C
         c6FNATO/neYFBUbcWa6fq8k0z8GmAr8Cz37UuOfHE+LJ8qzUpjlf528iq7kzn5yTjC2t
         krEzwHWlgQjFQPBWkqNk7+ApdP/cal9w4yuhFDZr8+vmoOHf4HGx43sshtddFUGKNoQO
         /AeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790251761; x=1790856561;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qeKdsxYcHc+Ri00U0V0fl7QmJgNHnzJocuSoN1PXB/A=;
        b=YyHrVwVvVO0XgkytPExUWHgpt8HefD0t3UQmJi2IY2nSPQtwAvdVBpgrK014M6wDVr
         Xv+arv3hBasIru3I7fWgmujd3Nsptx/MNYduLOhNr7ZQxyy9UplhOdJjSWA15BOTXC67
         QqXyMwyqTx2byYVE22o2XG+20AgRtES/nVw7NF5uRLSaHakiBblS36YEgm638xsQv+m1
         EsAHn5swfOZpcl5MV9/r/QWUemvjeos/4rqszvAwev34f1bZKaKYAm5w7PLLBcA1zD/O
         EMrkE8w8pa0u5zNTHEUYkWXveDMVR7aXd0FXags1R0Fz0uJ/AzowE4vp9jhx+JNt//Y4
         Fjaw==
X-Gm-Message-State: AFuF++nM/xSWJQq+IOqeRGXAVY1KR8cGa76GhLniZIGi8nzG9MM94wk+
	GHvh6Ad0QYtfEP5tMWdyfsQCvMmGIL7jRLDKjmiBnvc/scSs0btYW6vz8CGg+8fOB3uv98QI9bk
	t9JgWLeHlKZoFBF9It1Y+lMb3WWwlEgNC6n+OiCOVxtXv58f44O9qP2hPiNAAPoSZ3spOVHggKa
	X6
X-Gm-Gg: AYBFou3oX3fODkPqmHnpDLYMC2Pq6yiGim4KoBjVHTR73REkmZLAg4AMPQR7kmuQnlE
	WDbOrq/ZRPYySabAmXWBu1Hwn63XpFCpysx2SfTYnTRxqtEn3U0DoETs5VFgRxiQ1knbQU1Zwi7
	GAnSz7q8JmE33xdPjk7asUrHrOd2MAe91oM/GOOu+gEQDbCrKnucfJySu0YaB2zM6rZtOovWUIk
	/zxck4Awx/ac78/Z0eT6THDwxNmPQ5hf4dh/AOMlkbcRMSXdXKrYwlDOn6vsX2T16YQHMhtMK15
	bzt4D1KCh3Rs+Z14OIBkLElyIJU3EH077T2x5i4ZOw4uby0LYLAWY2L7jIbmsZWynMwcz0m7Z3Y
	TAn6sOBRj
X-Received: by 2002:a05:6102:6882:b0:7a7:198a:c2c6 with SMTP id ada2fe7eead31-7af1f0ffd39mr942354137.36.1790251761024;
        Thu, 24 Sep 2026 05:09:21 -0700 (PDT)
X-Received: by 2002:a05:6102:6882:b0:7a7:198a:c2c6 with SMTP id ada2fe7eead31-7af1f0ffd39mr942343137.36.1790251760445;
        Thu, 24 Sep 2026 05:09:20 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe667ae2fsm61376605e9.13.2026.09.24.05.09.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 05:09:19 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 15:06:58 +0300
Subject: [PATCH v2 46/48] clk: qcom: videocc-sm7150: Use common probe
 handling for always-on clocks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-46-1479443ee016@oss.qualcomm.com>
References: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
In-Reply-To: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1668;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=oz11M2wrwKFK3+vSAbicVJWmbq+jkXzbbamqOEjW/JU=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtRJukCmS3zbBLKoTV3kwTEq7qEhAABav+F3To
 YgIGjKeUsWJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarUSbgAKCRAbX0TJAJUV
 Vn+pEAC461z1qg3HSY+7RlWo5efVcPefwo8A4fyzIsqLCxtNLjT4vNFliSiSMcz51z1etRa/+w3
 abWjdAWAuOn3uylyoYPRLRac/D9/FN++qTiNvkHAkpvIDxycYYdkhWJZa+iRmCwnq4PV8rpp3nC
 ERaDThmR8k17WLxLX5uTNu7D9VCQmhJ981HYsN4tYFufmBV8QkUE+Z1FYj2fvFtsJo1vwmhbxyi
 FyGXiJ9E4ihb1kCssBS8I0GbOObFCPM2OT51i8JVSsXcrybL53qJMzFKxqQ6H4iwkOXWjhTiWxR
 J5mcRhryrsb6v41bcprO+tWQdJbsK9XwkxPVsQHRzAks7XTtl2UpAgQGzl6V+aUixIm8VCnuldE
 PSA7eq+e+XltnRapoClAEcZpctJx5S7+WFk0p+H5LtJAGz30X2BwqrWRMBRfZm5Z/BIqTTOBsJw
 ffVmiZS1R+XTmhHdVM8JMm8uIAAbrdpT4uE8GAfVQgKWiKWR91K385ZO1wzHBgVZ9d2UHQ0aQmw
 LCXI9ZZoPsrIuSq9LfhwVevlWBG7dj3Lky04w6gR4SMu1rPfsMapkepJsrjnMfNI7sFCpcok+45
 enTqPPW3g6Ph0aPM1licjBwI0OyNQ9le1vdlymm3T75nS1YeZnmPMVYJcxjICt1lAxeUZAjkh1g
 011S6hRACCcYfwg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: zBCnpixlW-qP5Omi31sshpM5uXDn1PCU
X-Proofpoint-ORIG-GUID: zBCnpixlW-qP5Omi31sshpM5uXDn1PCU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfX5wQ0kdJEsGzD
 q9uWyI1pOr2FrZdx0fisQ3NGViSR1s2rcgGa2sdKL7V36R21jp6Pej53rRUv3buN62IIakhjVgV
 +RhNrvzodD18X8VEJ7/WBudDiFAtyfOuKYMwxmW5oDsrgfuDtsF3DdV8pzStSQC6SVuQ655YrXU
 3JDwhJA2xs0dxmpYzhJrxYwI0y5NbWI8ps/pYs21/kxw21ZjaCn1yq9WGnsfjyEYBHrX/EbSsyn
 7Cy0F2EvnCaNGyuIuH9TmOppt7aFynC7nhUDF7706VG/y3F90hb1hu7JQ0cZNixaa9Pd03BvOwP
 3VruVBrAbcNrOa8+ox6jg051uKWuSxQsTTyaUL23JLgqS6ZCSqStkw9Y7hJUMKeXtx37lKQrv5l
 ZBAI4WvoO/0AcSwb3U8EJZhF1nq7xCcR0gT7zDEItCrLC3xnE0WR6bQ7DMpsUTjmjwYsO4ADL+J
 Gq2pX4X+bASLA85CqgA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfX6chC9u3CshtW
 MYq4CqAxgJ82rAWeMBsqYqypFfuNOMwe0wncwKIv551kjTKJnvGV/Svmz2e7DAYntfs2JgerpJd
 eB9Yup7ACaGiJwwCMA7Vz6JydARtfTg=
X-Authority-Analysis: v=2.4 cv=f7vdl+yM c=1 sm=1 tr=0 ts=6ab512f1 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=sYFbF2zXfO1Ub-DH1h4A:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 bulkscore=0 impostorscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240050

Describe the always-on branches in a critical_cbcrs array and reference
it through qcom_cc_driver_data. Let qcom_cc_really_probe() enable these
branches instead of programming them directly in the driver's probe.

Assisted-by: LLM
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/videocc-sm7150.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/videocc-sm7150.c b/drivers/clk/qcom/videocc-sm7150.c
index 8d2e00799f96..32bad5e09056 100644
--- a/drivers/clk/qcom/videocc-sm7150.c
+++ b/drivers/clk/qcom/videocc-sm7150.c
@@ -313,7 +313,17 @@ static const struct regmap_config videocc_sm7150_regmap_config = {
 	.fast_io	= true,
 };
 
+static const u32 videocc_sm7150_critical_cbcrs[] = {
+	0x984, /* VIDEOCC_XO_CLK */
+};
+
+static const struct qcom_cc_driver_data videocc_sm7150_driver_data = {
+	.clk_cbcrs = videocc_sm7150_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(videocc_sm7150_critical_cbcrs),
+};
+
 static const struct qcom_cc_desc videocc_sm7150_desc = {
+	.driver_data = &videocc_sm7150_driver_data,
 	.config = &videocc_sm7150_regmap_config,
 	.clks = videocc_sm7150_clocks,
 	.num_clks = ARRAY_SIZE(videocc_sm7150_clocks),
@@ -337,9 +347,6 @@ static int videocc_sm7150_probe(struct platform_device *pdev)
 
 	clk_fabia_pll_configure(&videocc_pll0, regmap, &videocc_pll0_config);
 
-	/* Keep some clocks always-on */
-	qcom_branch_set_clk_en(regmap, 0x984); /* VIDEOCC_XO_CLK */
-
 	return qcom_cc_really_probe(&pdev->dev, &videocc_sm7150_desc, regmap);
 }
 

-- 
2.54.0

