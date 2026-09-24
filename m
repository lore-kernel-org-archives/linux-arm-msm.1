Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65FDE484234
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 12:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790251668; cv=none; b=tAxnfRPmUYhuCqASoK4XurwmIENyQaonU3Z5jc8Bi81CxQxiI0OgAS5ir/j8VwofA/PGl7vVgw+y3sLdYvdPmImxNSnQvTV6WlXuPxaK2VvK6l6CfFAMzxzCDljqQRiq6RikZJdnHEdZ5Obn00KsN6RV8AizDkQWqe86MM4eZdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790251668; c=relaxed/simple;
	bh=ln36Hj6KcOVQga3cV2n/3n0DleS9IFTsnosLmwz6Jqg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b9JalMh2e2il7YaK85TuqV2Sft8s3KYZ1aJUOdkL8XkC/P1bV9Zva35ED1/cvzkrR1w0VCc2W6yiQxvIfVZkFWcjrwFSYqpt8DOUNixgdXBb4WFR9mqTRDieNAEBwYYEf+M8DeF5mCB/3qEvjy/X0pr4yymfKy1Acunp8lp1QvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nT3jWqwD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B/veWwHn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nT3jWqwD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B/veWwHn"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OC51Tk2134825
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 12:07:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bUQ9oqq8ZI+JLx2cOtLyDRh8oQaGB19xWAL4U2iaC10=; b=nT3jWqwDwqgNYNeI
	ZOz3zhBi1ZIeG0YTPU/hmpSifZ7cCxak9O0lVWzmoDVJV0cxEg1SIqrQaFJso9km
	cuzML/J1V/nT6fRda3QHTE8eXtSfo2wSrfY0sSegruPi/nFBxOKJuJ1VevWg0Sxh
	//7Q8RnegI/tPcn6JwUcJb/JkDuG+SPJvYR4E+izpwht5wedZwt0HKVcOxITcKfu
	wYguIR87fZkGxkplDWyodaMEH8gutdMWWGhgarsloRVJqCOK2qITj3HL1HxfVnA1
	akgzYwrbDmMBBh2/ROym9ACK6Vv9yZqAd7GCW3ABcp5lIS6y8kobdHGB31gH7dI+
	ld6Gyw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvhsb4btq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 12:07:43 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7961a79fcd8so595576137.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 05:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790251662; x=1790856462; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bUQ9oqq8ZI+JLx2cOtLyDRh8oQaGB19xWAL4U2iaC10=;
        b=B/veWwHnOQ5TsapPpVh4CDz8egjGmRUm4a19BGth0LBUtiRgXlqd0Bx4IqXNXoRdRs
         pHNvq2n5NTdWVPcDWo8wIiqLFs9TlpUp9hmnuzbFZ513IqrGFZSlUI+YSAVadjHHuZhu
         1r+NhTVEJWiZt1eeBSOTXWvrGoThkoBGdg4xeIWOallnzJcM70Cid8QjFE8b/2BrcQLT
         HDkgGEBrPJ/72u2vKd4WZgxsZZSuMQLqfyfqKeW3CEkWyFoIy3NVgdbCDzx4qLOhvVfp
         6tGAKw1J25Kb5+3WvkLEmeO6VZbIqj+28uhrUJwgC6EPEdOVTXM8DDAi3cKVr+UR0+j2
         DBng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790251662; x=1790856462;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bUQ9oqq8ZI+JLx2cOtLyDRh8oQaGB19xWAL4U2iaC10=;
        b=LrDt4XfEI/o9hqeZyZG6aak2ZY1YDdlgwIE0eybZm6TjML6zQ+oHdJ2zOOoLNycGPo
         Kor/v9aMMZ4mA2SThQS8ubmOb7hAugk0VPAHj7qEKwmkTUN4W2udfApizawbYDh//TQw
         VDLMM6y1ln9odvBsbniabIN8gG2LtuWkyCIMtGMXmmvAsfd5P0lYD7yyYOD5lYkDudnj
         45iLjBnz4oMyWpdTCaN0z72T27Biy5k4uX5BsFVW2rchgNj+Iui3dGTFVfrLcVx/+6lo
         KfOGxQ1D88VGlQqgZp20utXWFtIarw/4gE3CBNOBwd4TL/HTg9D7EPtWhTuFu6dvcL5v
         OqIQ==
X-Gm-Message-State: AFuF++mMQ2Fr0aXeoLbVM+jQFhn7evS0pyeHXwnjBChHeD7qQsNMHuU6
	Nda/mRwck2V5afU+yWp7DgUP05tSJhwQVkf/ngKoHKezOOomM7VSOVkUXMB238OMawtImi9xn5n
	Ju+4A4v1fHaORCCYSQbEyS2zYfLrA38yvFQUruXPHsmprUVdO+y5w3wUYzYHyTZWPXot1
X-Gm-Gg: AYBFou0SOFobPTrlu6NSjUX5Fz2BwR7FWv8ELUh4kUkuWPXUKt1Vl5ps5tlO8GqGkSz
	Iewl3obfIBUwF3UMojWaa0XNn6bGqCAYXyAaWV2I56tlN4VptsMTfscXqjnxnRIoLVN+GbSeCbG
	mi3Gt7KDfTjvjs+LmzaBP4liwhWvktFk95paECjTWvYzVIoXaWqO6jMBa/4ZFj/3OloCTiKCMkK
	3+SZAhMc5bSNWX29ZWWEracVqwj/KjLNOec77h3M951UD16ZKC75M4lVek7lZrzudcuSgyFXQyl
	BQ/Fg4XLlOhIqdflU7PvpcmMepKq7RuTqJY2S1Yyvz/Hgnw1ZkCqfytOP5AF7Q7CCCsH9zIsbwy
	kLtHA5Uvn
X-Received: by 2002:a05:6102:41a1:b0:7a7:19aa:f0d0 with SMTP id ada2fe7eead31-7af1eff6b23mr934959137.29.1790251662261;
        Thu, 24 Sep 2026 05:07:42 -0700 (PDT)
X-Received: by 2002:a05:6102:41a1:b0:7a7:19aa:f0d0 with SMTP id ada2fe7eead31-7af1eff6b23mr934949137.29.1790251661569;
        Thu, 24 Sep 2026 05:07:41 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe667ae2fsm61376605e9.13.2026.09.24.05.07.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 05:07:40 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 15:06:22 +0300
Subject: [PATCH v2 10/48] clk: qcom: dispcc-sm8250: Use common probe
 handling for always-on clocks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-10-1479443ee016@oss.qualcomm.com>
References: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
In-Reply-To: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1714;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=ln36Hj6KcOVQga3cV2n/3n0DleS9IFTsnosLmwz6Jqg=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtRJLIVtMpp8ji+hnjq9GuAgLPArky/drRg5zU
 zqnXT3OO62JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarUSSwAKCRAbX0TJAJUV
 Vg02EACkoGt2bk39d5RHtziiYzGD5M8v77Z0nyqV3u+0+Y8aQ1JloklKYDAe2GJJATprH5kbaNY
 4T+LQw/Hhw2hvVFdOAjkLEJ0tD82aqxyqAdFe3RHM7JLhSo8xn3hD1858q8wzvZ7aIZFsVbcvWE
 Etkxo9bubwUzoT1/YWD4q1U6VLXcM6hrhfYL8SQq7vzCJBucM9jMgKfvFdHPLj6Os9nYfWRtUHp
 ifQ61wEicbQT/b3RhKshoS1mK9Ds4xRuY8fUWBB1HRi+1kt3tegXxuw96c2b5Cq+5EONO2I2FBc
 1IiqQE+9gqTVLX+8shczZXgqTpzDz3iFvRVUoSHar61vT/nNT9kS9TgII4qwVnyEwZXxUHfPx5/
 3O1NI/mzi3GQzjQpeWTsAkvuvwprMlHjdTcqGZFXnh19WjoKf4v6MDOJFlu29cpm0ELregO1yuJ
 XN0XGiaCs0XM3N97sjgkbcIDZl1Y0wx2HS2EGnQr28sBbU+ek7uyVs78PvUTNkk8A6uIDgQRe6N
 +jmVPmbzMW+uNebAxR1VfsJW83Zl+6+qTFiwZIKdq1TWIN+4ViZgSvJ3fhKTa+c7I2YtBHfi9WB
 IebtV3QoeBMoswEkFPgP/whsUjt/XIofuNC8IS2PcgZbkrSxJQ30aRvAiiBYQmb0aHEz6R8GN/K
 2D+S/K/0MN4EJhQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: n5zvieEY9Jq-PwO2j75jBxVr_tb-bV_a
X-Proofpoint-ORIG-GUID: n5zvieEY9Jq-PwO2j75jBxVr_tb-bV_a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfXxJn7i7xIZoYY
 jo7JLIzOgpoDF3a7y686rYrgu7RY2CFS3FVVcFUTY+dO9olbYChNpvcRMRF9AOPMrqqRB33iNld
 BBMjpzKnqTGC4lyHw84bi5vBHlUJd+EYASxMCuEBJi0ChD1uPWPWqe6Oxf7xf++YNybJ/8wnJe2
 q9Q0JDLwhOFYdLaNTtkjhKPJvj6YWWBlMJ6QxzGMsq4s1cFwtDSyweruc5j6xzqdRcwIvdJtSYY
 3D6Yeh1Wi9VNZHpryoUhQrv4alrzjy+vDg50l/W1dZ5AitKEzKS2h3jPCxS4iYC08lgMPvhhD0G
 c82/HN8UtNaiDlHD/nilSbhHe1/x0Ljz88jSJECLx+iK5Zd26peretyAQ988OLF/4eZb0seEMrD
 LEyxT8DxCMBovacyK7GfcN0ta6DgzKX2zoTAHWvFa1oHl9zkpDZrsxZsMEp9/BZMswBUL2TiTL/
 bFE3dIBe9Mb78Ar2JoQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfX2z1kDLjvn6DK
 O+yHZQtcWXF23bniElZK0wNJ1WDbVoQ2OFSIlk5S+0blnu6Mtk3766DZQqKWgRFpsfA6RdJ2lWr
 jETGAEs2QAjN9yKtHvqkOZPVT9Un2Pk=
X-Authority-Analysis: v=2.4 cv=f7vdl+yM c=1 sm=1 tr=0 ts=6ab5128f cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=6NcTdUUM2wu3ikSZIO0A:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
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
 drivers/clk/qcom/dispcc-sm8250.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-sm8250.c b/drivers/clk/qcom/dispcc-sm8250.c
index fdc07323f298..dc62eb18deed 100644
--- a/drivers/clk/qcom/dispcc-sm8250.c
+++ b/drivers/clk/qcom/dispcc-sm8250.c
@@ -1232,7 +1232,17 @@ static const struct regmap_config disp_cc_sm8250_regmap_config = {
 	.fast_io	= true,
 };
 
+static const u32 disp_cc_sm8250_critical_cbcrs[] = {
+	0x605c, /* DISP_CC_XO_CLK */
+};
+
+static const struct qcom_cc_driver_data disp_cc_sm8250_driver_data = {
+	.clk_cbcrs = disp_cc_sm8250_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(disp_cc_sm8250_critical_cbcrs),
+};
+
 static const struct qcom_cc_desc disp_cc_sm8250_desc = {
+	.driver_data = &disp_cc_sm8250_driver_data,
 	.config = &disp_cc_sm8250_regmap_config,
 	.clks = disp_cc_sm8250_clocks,
 	.num_clks = ARRAY_SIZE(disp_cc_sm8250_clocks),
@@ -1370,9 +1380,6 @@ static int disp_cc_sm8250_probe(struct platform_device *pdev)
 	/* Enable clock gating for MDP clocks */
 	regmap_update_bits(regmap, 0x8000, 0x10, 0x10);
 
-	/* Keep some clocks always-on */
-	qcom_branch_set_clk_en(regmap, 0x605c); /* DISP_CC_XO_CLK */
-
 	ret = qcom_cc_really_probe(&pdev->dev, &disp_cc_sm8250_desc, regmap);
 
 	pm_runtime_put(&pdev->dev);

-- 
2.54.0

