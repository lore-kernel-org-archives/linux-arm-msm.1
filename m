Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5123B4AF67A
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 10:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789554609; cv=none; b=gM47aN+3U9iQVKTXNpWdbMnqL8vau2mhcUTIuX6O0FTR5RCb9PU2tVVjp08+kJhjdpilMOr5WG0Fg+OX1I2b20dgSxERb1xr42NqBE0o4GQ6CayYdVIzlvm1R3Etg9hdR/+PdGV0Yagu1wfU1yQ8aEHoo5HRhz1YwwghpK3YmFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789554609; c=relaxed/simple;
	bh=J8ELAhoIpjnImVTW8DOoahvNct88sOBJ3fkgSfxEmuQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AYKaXvkCrF7yqg2ix2FdfxL8Y8bruw12wuGiq7hE4g6CrXBm/IIlL2xhKyJhbpmDrj/DFYzhQsYMmD4mimApkQVaV1Tz2xCZaYYiCvdgOomJNCzB+7pfhFQ20rIQ/fCm5QDBzM/wqOsSbYKdkdaiwiNtHG195MEShEJGB+pjmGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hjeDK2er; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ELGEEedg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hjeDK2er";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ELGEEedg"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G934IL2226506
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 10:29:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F9LDF97B2phcH9cg/WCxnzSZjo0ODbK2XBNEqzipB0g=; b=hjeDK2erWxCC6aYw
	gWqKX9PoHtlR9Y/2nkEW3nDa7H04kwUBrSjN6rDSFVo56h+v18biQIr90FYy8Xm4
	jT/eWhQWmVwzLmhy1dlMg8hnLx/kiVf6JTlIxwCgmDV/Q91F5D/veIXNX67KOhkZ
	dnJySJQk2NpXzuctX+KAcLL1UBOIh5dg1gn83QMBlK1lF7P0+/CC3HnR0Zt071IV
	jGZcBGfDvhlUZOO7K1uLpnRWzK+98W/IFu42X4vKwrXrs41uN7Vosx+Ljw0xTdLq
	Odo0rW8FdKNohZWGy8AY9D15YGYcNd7vRDxZgai06rCoPVSA5tsDURBaHY2Xv7Kn
	NaPuXA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqah9ut09-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 10:29:44 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9393ac4961fso658923285a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 03:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789554584; x=1790159384; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F9LDF97B2phcH9cg/WCxnzSZjo0ODbK2XBNEqzipB0g=;
        b=ELGEEedgugdcEijt/Z0YcBz6LeANepoNcC1z4aIaL/RuxX6VmPZ5+V9h63yzvhHpU6
         zui8NZ1Ob87/AZvQnRTJxVbZ3o6GAIXRVUjRBBt+3+LjrvajYU7TCkbqC9qM0O1AFzgV
         qY6OXvL/XnP7uG3pV0+YIvJmRhWi+dx9rNZ9AGvJQqFtyOQfdEtHqdqSF45sex4ih7e4
         PODkkzP1xLEDPlumrTnzn0G0TVEFJ2mnBDNi6EPYNAbd8w+7Qxq4hEXlPMOMemGrwcV1
         gV05GuosOpxB+EeKjJ0/jE4l14mT95beMNjLDCkRgeZydM+rH1DHEUfj7y0e57XIMYB7
         KBGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789554584; x=1790159384;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F9LDF97B2phcH9cg/WCxnzSZjo0ODbK2XBNEqzipB0g=;
        b=PGSN6gjFmSMNAjmuk/XxiyqSDzaHd8XEtl/DO8QJ/lSKGtBQydPB2o2ZBHGEspU0F4
         MO8Ib3nT9IYzoR0w5O/om8DOWi5dCBGVTjJ12vKZhFWgawVl/0hQCkcqcXdlBD+yrBVE
         7ncsKsXU85NJZ2z66RnYNE65Ohp/eSw1CTtRDzbv4GtBn3uE6f1RSCs+YC0Xft9HcSWT
         fWo6fl62a3amia+UO1Dx1UHXoe/ltVDShaX084A75vj6kCpp8pGvIRDD5ws2vmDT5MfS
         QFj8Zn7++OnzR+beYcvu4cgGD3s6CSYqUvIlZacthwz4H/3SfDx9BZNg0ExfoOSxATy0
         pybw==
X-Gm-Message-State: AFuF++mnp5nZgGF4BCD3oqXbZpMvdEoEiBg9MbMJU69h7FvZJRXl9Tqw
	6ES0jjJpFDdHqBUtfJXbXpML4jApduW+VN3O9apP8XrKLCa7a5LLPmzhKPwOnbUkc7fHeqfzddv
	6xfpvHwiIq0gMrBDLkFCMYCsWvtcaPtmC9BNcAQYYJsut7NBLgcS1xTISi6BVvtwevMVE
X-Gm-Gg: AYBFou0W1lQcKkMC+9tCzd9jJMrOlX8FtTdnxWhuQtZRpUilpxW549K8h+891f+nKSI
	PsJ219Ke8hdvalj/l14ux0FF4zjBd1Dr/FZGaxzkrnGbDQs4sygKKuyP7Jb1sbC8dNXRODEEmez
	L8OCmPSQp9Y/DA7Y1O+x+s8AIp4pRxEOvgtTub2ScqelEqegM6WKxr9lUJBp/IF791rnE562zt/
	T19zICqdpASwjtAszgXRv2kkFZwAYCueR+E0KnmymZEK5el6bFSzC9sxt/pIkyxa0FZK7e+g9zE
	WeVxBneBciDC1qbTARAEE5FncrIJ9t39cR7QXgYKqC5fUg9VhAh7hut/OuJoqSbujLN6LsFpxPi
	ZLP7IPpw=
X-Received: by 2002:a05:620a:172a:b0:93b:6113:21c with SMTP id af79cd13be357-93bb772b093mr287587685a.10.1789554583556;
        Wed, 16 Sep 2026 03:29:43 -0700 (PDT)
X-Received: by 2002:a05:620a:172a:b0:93b:6113:21c with SMTP id af79cd13be357-93bb772b093mr287584185a.10.1789554583028;
        Wed, 16 Sep 2026 03:29:43 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83dbb0c1sm71633805e9.14.2026.09.16.03.29.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 03:29:42 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 13:28:30 +0300
Subject: [PATCH 14/48] clk: qcom: dispcc0-sa8775p: Use common probe
 handling for always-on clocks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-14-25a24e50f82a@oss.qualcomm.com>
References: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
In-Reply-To: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1924;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=J8ELAhoIpjnImVTW8DOoahvNct88sOBJ3fkgSfxEmuQ=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqqm9YtvMIg/QuEFt4BcIAGXva9SUvsaeSRly0R
 HPZD9so9vaJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqpvWAAKCRAbX0TJAJUV
 VkndD/48DNEa4rYbbZQ/jhhA/k9SVne4CZDHVRHhBJ4tHSRJsblzuvducvphq2zFfyW0Or0Q++M
 QLw0RnOZn5Swv1mf29GTCxOxg3M8s+W6sUwtpJOBVRS0BypWUV/gGRlkhbV5/GyvawKSJ2x9qRO
 A6fOJCBeEJFzUVD3+8fAi3BlyphtKyMlgYIRgt6CrHfE+6qgPrHa4Lxn8OCGdph3Srd9+2hFQ2z
 azMlH8BHQjsHMxOs3gBmYUwCQhKCF/8swFCmXfWe6n2ynMSzJrxAiFqF/5xt7hQs2QZmmk2Ukxp
 qpfqQ5x4x9wvo80hsWxN8Q4t0+J0kSME8fTceyeRLJNAC1JyNinzKkPV81/+J5wKv9fPKZLKxst
 qBOJ5LqSjqEpPIi0c/wpalt+haYEWh6DbW+Qd0o35LksbgaAyLZN2HYgS6+MRyAiEe0+T67qUkY
 UcQBHoQ0NNGH+hPnHlgeVgqhZ7vvu8zsp5xh60AmhvhcdF0Uv+n5g86oIxLzeBV+Fn3Tx42fYfA
 JEfRqTc6Mwol1QFnPmH5Ighj0PeA4a3geNjoOmTscFL6qT1u8qxsy+rNk3C50Li2IgUc5U2d/Ht
 BwSvR41owPTYehMED3oZYXf6X87rPcWodPdQFGiIwMi5/JSckPZq+L8emRpwogYmCeCpI4VYpsy
 hh3CaByVp0YVRXg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=BtkIUoX5 c=1 sm=1 tr=0 ts=6aaa6f98 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=15gMRk_Tn8l8Lfg2mfgA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: Ki4EX8sSlOZdRyAHLvY6nPnz62JFZolZ
X-Proofpoint-GUID: Ki4EX8sSlOZdRyAHLvY6nPnz62JFZolZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfX78CxEGiX2D7Q
 v/L0two9w3LqZV2UudapKmnNtbs2EkkSynvEmVnl/8xPSA4+jAQk6S7KEdQE3Zye7J5965rlT4d
 ZKUyNctEBJme4LU7YUas6/DnvE3uOTTkI9k2QeZyVavmpuUxe/1aJVzv7fpMWvlNHYX4SCwUfkO
 G/cZ977BTJ3TEWBq5fVu4Wa9OZRyP4Oj6bAAATc8OSeb3kRJAz3/D7QPoLmsnWIW0nzDtwQ4ypg
 NMV089Ii8cShJJGmSgfqiVpannOGTuAxynrj/Cbqhdr4WSu6NkuBfb1LJDTrrh/aEi/wcofhmqN
 4OB+JjX/f/ANJOmz6AubcPeAWnXERXO67fT3M+7wVuu5srrk5YIdyIMyO3zi2UOjCTe6J4hVNmQ
 vcQDRxCsyhKK7BYOidhjnvB2a7zAUI4QN5XtO37jOEPGo3ItO0+RdJWH8I1gLyrXcy0RX1C8CzX
 O8ErX4onJ8K8IDxK9/A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfX5VtPWXguybos
 fyLeL0wKda0Z2lDPfcEY+7FFEAIo6OlqPGWYyE4j4XGksqJrKGg3VxWIdyXUDhc6h3hcT158SiO
 b9ct3xWoItkRQwt4Qw+aGG0xnvh41E8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 adultscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 clxscore=1015 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160137

Describe the always-on branches in a critical_cbcrs array and reference
it through qcom_cc_driver_data. Let qcom_cc_really_probe() enable these
branches instead of programming them directly in the driver's probe.

Assisted-by: LLM
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/dispcc0-sa8775p.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/qcom/dispcc0-sa8775p.c b/drivers/clk/qcom/dispcc0-sa8775p.c
index 0e976442834a..a1861cc8343e 100644
--- a/drivers/clk/qcom/dispcc0-sa8775p.c
+++ b/drivers/clk/qcom/dispcc0-sa8775p.c
@@ -1414,7 +1414,18 @@ static const struct regmap_config disp_cc_0_sa8775p_regmap_config = {
 	.fast_io = true,
 };
 
+static const u32 disp_cc_0_sa8775p_critical_cbcrs[] = {
+	0xc070, /* MDSS_0_DISP_CC_SLEEP_CLK */
+	0xc054, /* MDSS_0_DISP_CC_XO_CLK */
+};
+
+static const struct qcom_cc_driver_data disp_cc_0_sa8775p_driver_data = {
+	.clk_cbcrs = disp_cc_0_sa8775p_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(disp_cc_0_sa8775p_critical_cbcrs),
+};
+
 static const struct qcom_cc_desc disp_cc_0_sa8775p_desc = {
+	.driver_data = &disp_cc_0_sa8775p_driver_data,
 	.config = &disp_cc_0_sa8775p_regmap_config,
 	.clks = disp_cc_0_sa8775p_clocks,
 	.num_clks = ARRAY_SIZE(disp_cc_0_sa8775p_clocks),
@@ -1452,10 +1463,6 @@ static int disp_cc_0_sa8775p_probe(struct platform_device *pdev)
 	clk_lucid_evo_pll_configure(&mdss_0_disp_cc_pll0, regmap, &mdss_0_disp_cc_pll0_config);
 	clk_lucid_evo_pll_configure(&mdss_0_disp_cc_pll1, regmap, &mdss_0_disp_cc_pll1_config);
 
-	/* Keep some clocks always enabled */
-	qcom_branch_set_clk_en(regmap, 0xc070); /* MDSS_0_DISP_CC_SLEEP_CLK */
-	qcom_branch_set_clk_en(regmap, 0xc054); /* MDSS_0_DISP_CC_XO_CLK */
-
 	ret = qcom_cc_really_probe(&pdev->dev, &disp_cc_0_sa8775p_desc, regmap);
 
 	pm_runtime_put(&pdev->dev);

-- 
2.54.0

