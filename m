Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F0AB4B0CBB
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 10:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789554597; cv=none; b=gWEGiq/kKAcZxodD6u6MFeNrA9wXgLhsbRceRSnBOIqBKR51Y7cVdc452MM2YKN24xwvLgjMCmXND9sSzkW+xshChr/NPbrvCHuhDoePCmFr8or20A2Igoq59gYhbc9kQAVv0fNQPH/MVAZ9ej6I/nq+AdyH2j+WjY/+L/5jvRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789554597; c=relaxed/simple;
	bh=9l1yH/TyKTh0nUOs+WYEyPBm3fUdzP6RQ05SEUY8blc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oKai+W6IQQJAb7rGFk6xAN4K+ZQE606t/D7n889j6R6j3mO96M3CTXXXk9pynHunAL6tXBNwf56h/fipXE4RIeHM5U/GKbN2jVXHzEP1yZUAvB1Ppq7/Y3tpUeSnuAISczV/dIHMkNTOtmxI3wRxuj2bsJ2pUYs0ArxyVJknKMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=As8qx8wG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dDxiHwML; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="As8qx8wG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dDxiHwML"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G934rK2226555
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 10:29:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V8iVqh0BF8H+A5TE1wGLKJj3rQu75RTalRcZa+kjp0Y=; b=As8qx8wG8+S3Sb/3
	gPGLb5VJX2A4/Oj+P4fddEqQKyvh30zmEy6rmOrBsF0LbQVat96eIm3OLeohXxhf
	VpCoIReVHSCpx2TwrDFR1ihe97fDovm+Cs6loaEREXdMJ8VaqsmT0WIcA6PtNIbZ
	pOmum28gGREBxW82ivQLqnhZs3qm1UKixWxVPyv7JW8CZLgDadZ6eeI5u44qwXgB
	C4Dep6/hYRJCfgySnT3qdbf097D72V7JuQAqBaeP77jZl/Cs7nZ3wcLzwLSYo/Kq
	yEtGJIPfTx1ziTqDmgWxOoA2xqgLzY02svlS8GUKbGvWfk+G8azHp4BuRkCNrTt6
	4WHyFQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqah9usyf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 10:29:32 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-936e393061dso868031085a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 03:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789554572; x=1790159372; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V8iVqh0BF8H+A5TE1wGLKJj3rQu75RTalRcZa+kjp0Y=;
        b=dDxiHwMLz6yXFpZ8UVPG6N2D37Sfyr/JpYyH+QfvREZMa8Nm6N7gw8dgqwro/If+Jk
         LgF+mMWVAOQE7Lipx1M5xPhIqC4COvMmpXuKNkTdaM3cecvj6MaLKzNwlt9EqbjX6Klg
         7Q5mMik8yOofQbIW1TuhA92O1PLyjC+B0lEu3k8P6lIqxmFWfkpDPX8uGNLliQxA+XhT
         k/pt5gAfDzAuUbV4qJ+d4cU6uWJNgzjYarA7xg10tfxEbYhnUkmTZLKfBq76aHpuHk3O
         QpBGXpNiVhm+3X8Erpsx0flf5CA7jPE8f+WJLxZSVTelKexCthmS8lnA+i0QEzyCkxHu
         t2VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789554572; x=1790159372;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V8iVqh0BF8H+A5TE1wGLKJj3rQu75RTalRcZa+kjp0Y=;
        b=NhRDHRuLetkKqXeVQ4L2oJDp9NIcG9zvJdKPuzj45d5gHFpR/pvsvA4+8QB02YKQnJ
         SHFhwcD43a03nVD+sTUozYnhFSmXCB/6N1X05Qt7iCd9PBSsCMqoiUD7p0Gj8A21zrdl
         DTRcG2LbFI7eaZ5MobxGOMtTXksRpt0nGEowmJ577wgJC+mV9WI4aXJMDfWSDqyEav+s
         LQzzX4wjHE23nqLO9Mj1IHKc4BIy3UcDoobzz40qyFWec2eZi9CWIFxMrHQDR9B74u20
         W41ClEYdZgg71JKsnNuGjTvc+k/mxtmLv0XShcfNObma4LZKB82/zahU1e3xTdM8LU13
         gltA==
X-Gm-Message-State: AFuF++mydOgxq2WLIWQYSqHMY7rLh4jhSyScPQ8okuEphnV/D8eAlz+X
	NPz5CIOtjEsL6T7nCwzowmsLvWhqLriI8uBcqGlEwRDrgXUYsj+BwBoOHdbu72LzykJuZf1kVKc
	5GW7pTOWvPqUXhNE6fTrBX5Ck23PUcq3zwMgsHj0fHCAm1vGmjAUPLkN9k+qrCLRywRI4
X-Gm-Gg: AYBFou3QtjLGVl5/r5LpMemiiM+GB9sDLfuye2SMoHGHatRKUK5O3g/1DOIwIKETV2T
	T/ROsTW+tbYZPp0oY437szn/SMeDF0HskkHBmMZSMheel7+zemYD1amrl100P4wImGlk8lDVTDL
	4UVjTOCgBIoshTE/dFBlgwn1+iWxYDVAuVt7CbETw00XDzWu+IL0ZFSw/dXMaxJbbuQFFwDEN0j
	iQZkjKMkz1SfwwHOucKlz494Km8Kjj9Hl2pfxnBQt0PyDv/+sT3mMRmwqeF/ib6y1rYYHYBrlLu
	8KaUcfX4YnJPcD8v5qtoAp3UTD4GF4ZMqRjr+qvrfB06bg5S3yyW20jxCIVsAbqw5qcp47KLnsB
	Xffv4O1Q=
X-Received: by 2002:a05:620a:2809:b0:915:a953:4b9c with SMTP id af79cd13be357-93bb76e380cmr318183085a.3.1789554572041;
        Wed, 16 Sep 2026 03:29:32 -0700 (PDT)
X-Received: by 2002:a05:620a:2809:b0:915:a953:4b9c with SMTP id af79cd13be357-93bb76e380cmr318179385a.3.1789554571547;
        Wed, 16 Sep 2026 03:29:31 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83dbb0c1sm71633805e9.14.2026.09.16.03.29.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 03:29:30 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 13:28:24 +0300
Subject: [PATCH 08/48] clk: qcom: dispcc-sm6115: Use common probe handling
 for always-on clocks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-8-25a24e50f82a@oss.qualcomm.com>
References: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
In-Reply-To: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1674;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=9l1yH/TyKTh0nUOs+WYEyPBm3fUdzP6RQ05SEUY8blc=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqqm9S6BRQIIkNxjkcRFfOiKoohORO+HWCy340Z
 uuKMPWV1WmJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqpvUgAKCRAbX0TJAJUV
 VkDHD/9Z93CpqY6+tb/srAdImnb6HGdyc7Mmd3tZeHaweH1AJ4fTOVwDX5NA7FrotdT/mTHpCe7
 ZNNvPmkJW4T927L75GM4ShNmQV1CNEPaf8TxHRzj/h8UVrjAYA0DnE7W5GOuLU+ygqUZJkesB4V
 LFAHv+VqCWnEN93XFYIjJUQOiJMkF8YcqRmUa8j+Xx9pdXDdem6K1WARcIpl8utMIkHdykUAF9v
 u/rjpl/TAGW0KJ6c2vz54+onrdC92z9O5SFDPaHf74jhQnr7ncd9l7CEIv1OrK2YHqxn7Kj+PxE
 q1PFdnjtC82iOVd72clvFwZnt3bGKAd7J2jB/yEvN6UUzS7jlmcac9JUmADz2hJdzHsHg6huT3T
 1SSUVj/mcCG/YNHFdHUTp7x07vxEQxAG/Bm5yqJmqT+hCbssn080rnL7impqM2jOC9rlEU5reb8
 /MBOT3ECrmTdNNW1xlPdfBUxpnlKZ5VjjwSV3uadhhBJve3npcMCJzj4b3e7ntR98gQzT7kELka
 GkuH5hPrEBy+RSVxi/V/I95fsUJEY0/xEFgE2Nfgs3026HMGMaWWvwniTXmxTIb100uCyZ8hUd3
 JsizQ5CQ8GaheRudJpq+gdkYfC3fp2QCDyR8+t+V88hlA5tQCceOYW7m8zBP5/y3adxer2DWuZp
 whrpvzGU/Lx6tpg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=BtkIUoX5 c=1 sm=1 tr=0 ts=6aaa6f8c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=zyovT9EyBzSEY6lazxoA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: LXBpIlsU26tDxVOkutXf4-agt_bzpHu4
X-Proofpoint-GUID: LXBpIlsU26tDxVOkutXf4-agt_bzpHu4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfX0W1ihbjZpmm/
 giNIp3Ai46yr0jkb1T7U1WchxlvG6i/Sbqr5rrwSyypcZ6PMcmaqsFmQixP4H9bhlQ1xZKVqOC5
 GZbE6rquOAGDGuZNPOO1GBfN0hMrWgU+NPZMnw6LXBT4XQSPhShnR+72wJHd/xuJfEMgN0wE+Lg
 pfuf8UfN2KI9Bbm4xJ1XZPk3Drj0nGUqzUR3c/4QpwCr0bhXnUi86oCAYliqEuGmP4bP6TjYz5O
 aSxwp6QaMt67kjycH2vdNiuiOhFsIlsceXGIjZ+3itY+eT2qO3Da/27YqBjYnyZsu8XnhQSw0Rl
 1qWbtVPRm/EE+jQxS6HjI9LVIjNLHu6Q8lB/Kq8rQk4EQqCRLO4QkHmRJKNhobmiQlHxgCKQuzu
 y/Z2OdztANqm8V2rjKujHSorL5kxpvbpDuIOKKfvp9dgOwy3xTBi+ABr9eR3WitgSBvlLo8iShW
 aZHnNRkYcZXcip/KgFw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfXxdQS4cytJDoR
 SUhdDHGzQfDHyOCfdwRk7EYMJWUlubw6k33zSrwf1HuG4joe7LUG3m6RUKp74wg4rrN+VMGTrrE
 BDis9k5UgupLZ4AtwV/nCRMJdYo6P8E=
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
 drivers/clk/qcom/dispcc-sm6115.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-sm6115.c b/drivers/clk/qcom/dispcc-sm6115.c
index 9a7b8ad646ed..f6f5edf07f03 100644
--- a/drivers/clk/qcom/dispcc-sm6115.c
+++ b/drivers/clk/qcom/dispcc-sm6115.c
@@ -561,7 +561,17 @@ static const struct regmap_config disp_cc_sm6115_regmap_config = {
 	.fast_io = true,
 };
 
+static const u32 disp_cc_sm6115_critical_cbcrs[] = {
+	0x604c, /* DISP_CC_XO_CLK */
+};
+
+static const struct qcom_cc_driver_data disp_cc_sm6115_driver_data = {
+	.clk_cbcrs = disp_cc_sm6115_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(disp_cc_sm6115_critical_cbcrs),
+};
+
 static const struct qcom_cc_desc disp_cc_sm6115_desc = {
+	.driver_data = &disp_cc_sm6115_driver_data,
 	.config = &disp_cc_sm6115_regmap_config,
 	.clks = disp_cc_sm6115_clocks,
 	.num_clks = ARRAY_SIZE(disp_cc_sm6115_clocks),
@@ -588,9 +598,6 @@ static int disp_cc_sm6115_probe(struct platform_device *pdev)
 
 	clk_alpha_pll_configure(&disp_cc_pll0, regmap, &disp_cc_pll0_config);
 
-	/* Keep some clocks always-on */
-	qcom_branch_set_clk_en(regmap, 0x604c); /* DISP_CC_XO_CLK */
-
 	ret = qcom_cc_really_probe(&pdev->dev, &disp_cc_sm6115_desc, regmap);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to register DISP CC clocks\n");

-- 
2.54.0

