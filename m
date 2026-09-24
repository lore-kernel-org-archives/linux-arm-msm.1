Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D6DE47DD4B
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 12:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790251754; cv=none; b=oQEdhAnxELpBcVBUSazhXC0puy/u2XPaoj8VFbrsFiiy5deanndUSEbOIfZdjzD6z7zWgr6jXXZ9tZ8+UUd53C+COdOS4QxWvxT26CQA84eJGUOBhQh+AE4ijzre6PShzp7oUPJRqVkN0SgyEa5ANWuy5HGHM9AXXhikrNyTfR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790251754; c=relaxed/simple;
	bh=go23fVzIuD0WYJGICdaRrnZaMgZbehWOjW07vqTupvU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n9GXs7OOGHK6d7BI4FYul7mk6IvdpRxSn3bd8QezV2fS0LPn5AITfnlDdD8ucx5qqHjzMXq2xfjAGa61yEkrgWfHT1UVa4O/4Kw/6aQeU5UOevipWQMbI3N/lh6godaMUbpBmNIWu3xCLWvpjFADrB7YA37AukyNUjTY9nVMyuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tc1iqxhL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PIqI2D5l; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tc1iqxhL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PIqI2D5l"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OC4s9A1630757
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 12:09:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YyIrMqDjgclq6Z9+jyisqmAzAdaX1WE5GYxOifG6sPA=; b=Tc1iqxhL7bbEo6Tg
	Ww71+63N8u96AutJxODRG6neb6qhCKFmveCPPuSryri6r/VOAakaE1ZVvsNsahjY
	kLN9tKtnP4LBF/wWAKAFiuI/bCMfTwhezha9wEeJBUrsZJo7SMvDf55hSkymvW2F
	FIIrbpGo8smlrxzjvtpRInQ1ZSgSSm4JaDB2D6X0qljJUTAa0jOnXU93V6otMmfO
	iSxtpHgKrASIyWdyOIFkjMusxWaHywRVzKdHeApxMTfKtEVZ5daXTy/jpVD3AEK1
	xdK0AsqeypgoyYbdXiHPgHmskC1DwmZTa4Zhe4W57yp6pwaitOLC01YXneznodwC
	puXJ5g==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvr90axk0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 12:09:12 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-9806e283b0eso1469004241.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 05:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790251751; x=1790856551; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YyIrMqDjgclq6Z9+jyisqmAzAdaX1WE5GYxOifG6sPA=;
        b=PIqI2D5loHdkdCmJE9AT47FXCl3Qw1lOh1Xrq+8/pJFrfb2xlmlDnt6EtkdcuDikUU
         w1BKnhj0X7IQrmlCXSN6neL8JeWjsajg8VMIi5XruUZLni6rci35631VE/vxq4Wht+Cg
         IF2C/ydXZilRiED6qDCRN6IBH6Q4xPYDSK0UTK05AbNJUPJLaX1wvx3xK6Ukktya7xvj
         hVW1Sof9CZoo6Hy8JULWSx+U1MHH1v3OeuFPmrjiQ4XBLD6G+nq1oneTnRKeoQU9k/sU
         eEpvkTj34fRyHwYYLGEMhU7Ng2/Dftmn0lgQQwqMrcRXbgRLwlac4VSp1qEoASLj67La
         6rOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790251751; x=1790856551;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YyIrMqDjgclq6Z9+jyisqmAzAdaX1WE5GYxOifG6sPA=;
        b=oLFa9MR6vm8zuiDKIRcfs6lJ48SnZoMkzYANhsASbDMYz4G5oydUQYarqrqO1YTsNe
         7I6VOQBTzMzj6OsV1fQ/9pl5j1+aTF5KfXbCs3mz3Xx1Fya1HFes4MSEe9/gqUXKaXgZ
         P3DibNeiMrX/smRkidr+y+a6J1Pta795M6/b3NQx9M81avupYsTVS4ZefF3fqJ483DJo
         eu11xWdoe8Hoipvob2+wz2tgNqiVEP9UfGY1pyGAo9/IS+DYMdzodaRcrcp+xleX1q1z
         3zZ22AHctRk/JeNzGZAhHRk39Z0hhybWUh2vaeXnx9yyI1ZuZ3+RxzBUr0PoRLyE+ahg
         rVQQ==
X-Gm-Message-State: AFuF++kCM//ainJt6a7eG2YO7GbBAHF29NJy+yWCjzXcjYZXOzkuQpS0
	5WkAYnn9VCss3la6oQydgQ09Cef39iyQdURpLF5fjUW/C/5HpY7JbL0MnfA4HY/ovnEQf8K7TcM
	2nXfeiJHV8zGJxlGToCf4k+iNz31P5ATICs6ggDQt29RsnuXNKjWXiF5sYTPil0ECDts6
X-Gm-Gg: AYBFou2271/86B/JeLajlvz7d6yDpW3iZkXNLhlXHb8vrceeXEE0BW9NoTGyjCDowK1
	WU31TC7+S08dKmRV+3TTJ0wlUWP5oHe/XSuwJiItrtFkbJrrQ4YnCRpEHkxJognJNm4hSvi6Vf0
	MtwA9JaMrPKVh3BHConWGGhzg7Hqu6XThxP7BlcO+S5BQnMIjY9RMCtVCFoy9rCCxUFJwMszaKL
	YqnUXhmRhq3jg/bFL1+EjrpydpAya5sIuyIBMlo2Y34RVMun80/WFkg3dIt0673uan1p4jum4w5
	xwgjStyfRc6zw82b3izbvZuQKQ5MgbMNI4jpZS0BBsGHzLO0qurh6jA9cka2/683H9gPdqFoHa9
	d+T5y0mJ+
X-Received: by 2002:a05:6102:2927:b0:7a2:568f:815d with SMTP id ada2fe7eead31-7af1e6f7995mr1166707137.18.1790251751345;
        Thu, 24 Sep 2026 05:09:11 -0700 (PDT)
X-Received: by 2002:a05:6102:2927:b0:7a2:568f:815d with SMTP id ada2fe7eead31-7af1e6f7995mr1166690137.18.1790251750772;
        Thu, 24 Sep 2026 05:09:10 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe667ae2fsm61376605e9.13.2026.09.24.05.09.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 05:09:10 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 15:06:53 +0300
Subject: [PATCH v2 41/48] clk: qcom: gpucc-x1e80100: Use common probe
 handling for always-on clocks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-41-1479443ee016@oss.qualcomm.com>
References: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
In-Reply-To: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1750;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=go23fVzIuD0WYJGICdaRrnZaMgZbehWOjW07vqTupvU=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtRJpnfB8dfrJK7m9Gkr6VD0RdoQ6f1v8mKbu0
 3AUwXBX0WyJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarUSaQAKCRAbX0TJAJUV
 VtGsD/0fwn6mHHmCTTYAyLwWZ2WGae0TxPyeehWERo8g9Ersu7Eca0iTaVkCgZgi1By8fQGCkTf
 PFG8KU9J2t4GlnU2w9PpcsXoLN5TwIJp10qBmFrzvQPCuqwM0EywjZ9YMOSAJdDqDYYrYVoLGdw
 OcBswQkxoxt6IXXexbo4wVkih6ksNQeBKyEA/UFQCU9rYao8hAmAJFVizlYhhLjAeAYvZ7olLNL
 cTKtUkhePWQ3u1+gWTKWVcmSwg2++q/2CteGRsugGHdAPOTov9TzBytCS6IZuaMenY+d1RrUEtE
 CZJoPK2fCMpFTn8/OtNSKfeXg7IlOEpwhw1A9AZbbJCRwMSgx/zXfkU+T4BbllmaYtS3FBfyFVR
 jg9x4+jMFpKBzXAxxKwAe39W0bGcja1ECanF36quYKJbF2taA6iSUomg2VhPoDesLhZ2CB8M4Mb
 qghMklznvQknpSrkC/xbQ/LEeW8SeoPea53OddjdAHtezDpNq3DzE1JX3hGfNM2mSKv0KWen6Fh
 RXNVOFOY7n8lAsXfXtvPI1ps0LXAaYisB+I+WzNQc06/QyAHpAxnnq4IlKX7tGY3nY2+7rFTP0k
 eH8GvPSr8L9kxunYJNPQ7U8s5ktZm2+k0nAr6jo8cSErEry6xQvrKYSXK000qrYQHsC8zMSRtj5
 /Iqk1abvVT8S6HQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfX9dq0c0WqkA1X
 piLlgGdH+C4tfV4AjSakYIa0eacKLmeVMY6y8SOsWGVyPiP0K1NuOEFxLZ1QGBrVO71mDHaQQbC
 u3GJAbmd1D0+gz5PcFg1RRW8wbj/PTQ=
X-Proofpoint-GUID: nClr3IvOjth6ING-kN3-bNWNw33MMM9w
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfX09RDr89cLYIm
 tHzqOFSPN0XvNn/sF16vvyWtQiXyIBl6zhw/rOCyiNG/biUgwhWRSJziK+13grVnmw7RcGDgKAT
 PpUWfAaHd6cN35prm2oKZiur+pQbA4vbDK4ku39gEuBA8J/b6a0ZeQfdjOtcXhBPzCO5hq4ZEdm
 83ZauBthpEMnTOqAZodWpo3JWM/LUqlrznXEqgKj82208VgmvBsn7d7tSkbiOaaD339sr3zcA3N
 sQCjMaDamzYvVcEJNwQAdE1nPwXertZrECrLLBQ2kBLYjcWxDR4r3XJFp+iBc6k5n0j79n9sKzf
 FlTvK/PZpFcJgL1VX4QSuQMibEzs1yHUYsYOmA0+9RO8zNNEFeZUyLY2juPQMTrQ2aG3FiQX/n+
 zac9NUM3m8V0FolfRaT8n1+IsPuGdyOx8Sf22vZT5mhBQOcZesYtM/07UqdqHrblmrIVRK5GEOP
 ES/MOyuDnBjqcV5U0+A==
X-Proofpoint-ORIG-GUID: nClr3IvOjth6ING-kN3-bNWNw33MMM9w
X-Authority-Analysis: v=2.4 cv=fMusTpae c=1 sm=1 tr=0 ts=6ab512e8 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=Q3WM7qoV2j0wxbEI33wA:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240050

Describe the always-on branches in a critical_cbcrs array and reference
it through qcom_cc_driver_data. Let qcom_cc_really_probe() enable these
branches instead of programming them directly in the driver's probe.

Assisted-by: LLM
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gpucc-x1e80100.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/gpucc-x1e80100.c b/drivers/clk/qcom/gpucc-x1e80100.c
index f9161dbaedd7..10a0b11927e3 100644
--- a/drivers/clk/qcom/gpucc-x1e80100.c
+++ b/drivers/clk/qcom/gpucc-x1e80100.c
@@ -609,7 +609,17 @@ static const struct regmap_config gpu_cc_x1e80100_regmap_config = {
 	.fast_io = true,
 };
 
+static const u32 gpu_cc_x1e80100_critical_cbcrs[] = {
+	0x93a4, /* GPU_CC_CB_CLK */
+};
+
+static const struct qcom_cc_driver_data gpu_cc_x1e80100_driver_data = {
+	.clk_cbcrs = gpu_cc_x1e80100_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(gpu_cc_x1e80100_critical_cbcrs),
+};
+
 static const struct qcom_cc_desc gpu_cc_x1e80100_desc = {
+	.driver_data = &gpu_cc_x1e80100_driver_data,
 	.config = &gpu_cc_x1e80100_regmap_config,
 	.clks = gpu_cc_x1e80100_clocks,
 	.num_clks = ARRAY_SIZE(gpu_cc_x1e80100_clocks),
@@ -636,9 +646,6 @@ static int gpu_cc_x1e80100_probe(struct platform_device *pdev)
 	clk_zonda_pll_configure(&gpu_cc_pll0, regmap, &gpu_cc_pll0_config);
 	clk_lucid_evo_pll_configure(&gpu_cc_pll1, regmap, &gpu_cc_pll1_config);
 
-	/* Keep clocks always enabled */
-	qcom_branch_set_clk_en(regmap, 0x93a4); /* GPU_CC_CB_CLK */
-
 	return qcom_cc_really_probe(&pdev->dev, &gpu_cc_x1e80100_desc, regmap);
 }
 

-- 
2.54.0

