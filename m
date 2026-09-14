Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C459A46A600
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789390166; cv=none; b=Ne9lIq+bqr1yZXkeW4rhHvU/YHNMpc9OpskVTmNQu1VY883mJ72Q/Y3cSoNuyKlvgPJuvozapxDjqatoDGulGpX+0rxfrJudyH+mvUilRNyvOqaNXknqrZpAmlCQMqTc2vC3nFW8J1MhHumqvCJgUfXlp+pZQe6CX9vIWngbmPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789390166; c=relaxed/simple;
	bh=wjUHiB/Fb0vvpnlD884yzywLf/3FV7pA3GwZbrdjsds=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jofTTeo5Arc44parxYh5vDTgYrnO6+4rIhDjAGoZs9XmNrGWKMx01ZhRLBsxQrmANIaeB93Is1/ZGRRrn/cF4avhRr/Si+KR3Hev2EOoVOZJLMAShC2H9z4sah/KKtTKh2My0g2bzFCOiZFjriIFvqTTB3Dl4V0YkoJEA2pBOjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gazYWWqM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZwOiNDYS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gazYWWqM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZwOiNDYS"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAmB4b3793437
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:49:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hSosOcHkZaTwqa9u1d4bkCQ8v4iMfRbD9GCeLmqFfN4=; b=gazYWWqMB3jM7Cyg
	BgRDvVDWrRlB9Ctg3KjE9g3227lk5qnb9t+5LB33ZcAK6ySjsnin1kNDoJep4d7s
	mPR2VP0d6yHiP1etoqMu7dJjCrK2tEFh2k9K4NgUzy/8w2g9I/RV/bVL03w55/U+
	aT8CwMKXxiQR0aBS8lx3MqlJzJNDSUcoEMVnskRMkkMMaqFCoYYHhbd9TjQmV9Fa
	jRh2uObIRF4oduz9GQHphg2QRZx6OSGBMneF+1AU5+nCQKjPNC1xpDi5xTcShALz
	ADInA6L1br3N3NNsMmGooW4qyNdg5ltrxIAzyF+z5AYhag0DCTxx3CFXss6QGbyf
	8wpJAQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpcjg15y4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:49:23 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-790de8f0cecso637464137.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 05:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789390163; x=1789994963; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hSosOcHkZaTwqa9u1d4bkCQ8v4iMfRbD9GCeLmqFfN4=;
        b=ZwOiNDYSpE7n2scVrLYOeBoGU4Vx51RtEcI/QyTUYOrfkGs7OPTulcWNFpi+4p25Gl
         9zNSIzo8FyfszsS+eoM5kYeENk2MmD+GwRdgLTL1ryAIfahgepkFgzLj8Z7/je1KG8OQ
         AL4FmvfC/iVKvLyJQ2rVRWmRE75ezA1K5TU5W8Mkz+HatOMIL3cEpGwh2wEMj1SOE5NF
         267rlqTBQVcg1qLcIfH4GTfDzaTtvtol4tDn+O5Hgl0FpB+Hf6b4p+tpfZel5F6VTuNt
         rl4eWruG23AekdsAmmOYYCaoZrk98cqp1HPfjfu7ZEojWzniEmi///UKYdpLLtsqAjZE
         SCIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789390163; x=1789994963;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hSosOcHkZaTwqa9u1d4bkCQ8v4iMfRbD9GCeLmqFfN4=;
        b=IIRoDdVp5WrRi8xD4PCADjxN8D76EcGRBUGPfb9/9dur4yu891CT8xuG2Nh3jVWXNh
         VLtJyWn7/aik9asPwuVofFV2G24dzw+tTIUDEoGqtIerk2DPbkKcSNZXxZNUALvIXLYB
         B0SFRE83/vR8sVhT3gOtDHb6zJQJ5/vgQzI8gbF2MZQIzp9g0Nn8ttEIe0N0iNRfiBYF
         DdAbC6WfPw53D8sKX7PPs4CaLHmDSDg2KIznAzW6SzL9szEfsVvTCzmnR5J2/myzOglR
         Ws4mrcUjgsF6j6umTyxE+Wjpgl+k0iDkzmej4BOoBu+qN8Bmqdr2UmAHQP83lhCoy9OJ
         03Cw==
X-Gm-Message-State: AFuF++nMC3hkhjZ5yes+pPj+PncqCo0dNTSUzmmIgqQ5op/gGKv9IfFq
	IZz6izYaUoD3GGr4sUnCnkdR01INDQz+j9BzgS7uyZard0l0ulKf2y/UQ8MiqgH+ZXiZPruyryF
	p99QmP0ZbJ+WTgN7MwN0PqadaqhckrZXUdowqmh6snfDdBdVwDBH6KK8Ih1lUVlqjosvD
X-Gm-Gg: AYBFou3ZVa0iihb5aFngTR9zitarG6xj6L9sfVII8mjLKXHR7+MltLSknGnRjuGhv0G
	DSJWFnj8hlx0/5TGqFVSYgSGUHggu+25VdZjcU7H5OCkdBG72vrEQmwSIEuupG13WxqCoYiORW3
	ZZpPbd+SVINWUcEqMJ6ELSlu3x2sKVhHuqRv1KXab8ABfqK3J73PkCPNsSoByin/p8u6oyEp0X4
	g9VZplZ6NTthqN75ehJlXQF3n7ksk8nwDCD53F1ynEfjxYLRDgW50ao50B1QHhOZZVnfZDdZbIe
	0NTdQShTbWPWGtZKF0fugJFx7qa8psolKWDuE2DJhdRngfuaXvvwA3yz5fJg6DyzyFe/hgMm6j0
	V4DWHygnl
X-Received: by 2002:a05:6102:d88:b0:79b:163b:d5a6 with SMTP id ada2fe7eead31-79b57ea2c98mr1201210137.5.1789390162473;
        Mon, 14 Sep 2026 05:49:22 -0700 (PDT)
X-Received: by 2002:a05:6102:d88:b0:79b:163b:d5a6 with SMTP id ada2fe7eead31-79b57ea2c98mr1201195137.5.1789390161958;
        Mon, 14 Sep 2026 05:49:21 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6c566bdbsm242387555e9.11.2026.09.14.05.49.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 05:49:20 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 15:47:29 +0300
Subject: [PATCH v4 30/52] clk: qcom: gcc-sm8250: Tie the CX power domain to
 controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-qcom-tie-cx-to-gcc-v4-30-9d5a606ada33@oss.qualcomm.com>
References: <20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com>
In-Reply-To: <20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=893;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=wjUHiB/Fb0vvpnlD884yzywLf/3FV7pA3GwZbrdjsds=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqp+zoQML6Rd0z8rn0uEZfd9jYuz1DNhT+R+iEW
 ACrFhiU8TOJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqfs6AAKCRAbX0TJAJUV
 VqDBEADHU2OIiSSk7Gbv12nKDJb71Vws6gFi9nZtC1MSbBkju8az2AYVACfLb9SZ4/hVBjESicE
 2vYNabV2Jopjx6VSK8oLkzJ8tybK81CEGhqWPM7U4quUU/lh/u0x9fn3h32XgflYlsiZjo7z6c2
 S/8yI97BqOXrP5LJXVPSN2DhZwpnmXf4TyAKHJb/wr4SYMV6yLaXbGFO35BWXYmRndK07BFYs6J
 SIMIP0oNKi9ojAtbjARxHGybQoEJ14vyCqOSAxENfIeMg6xgwiTxF/LMK+Qbd5DBI8XJGJ6BixO
 jFUEn8cvSW0WM4n0AFWHp//ixN2enNY7h/dF9qcEifWcx5LVztbzWn/VhhtP4y8MkqgmThiGXjr
 0w7t3PJz/RAgfZx15QfZ23SIuCTvc42i1l7tK3/ec6yJ2D5PE6Ux7kvBz8Nl4sMbte7Ef3boOjI
 v+G1gIBAk+GPQVePmQzNI3J2a0m0r71YxDwh24nMb/IP0duBalsbZfUllHR5sPNvm8gLXz3q9P7
 vWCZSQWOansnb9hqkaE1FvAMjvkFCsclWvD9ImpUBf9M2+kSIuMcFgGN50IBjCWHLy6Hjl9Kf/1
 G5UVRo+R+BX1M7vvvZElCUEheYT7E/ffH9nmTOSZ0g7ZRTakjgaaNENUWhmxQJu6TFrSFI4AKJ/
 LD3ZTg+ipp4pCXg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=CKa/zhrD c=1 sm=1 tr=0 ts=6aa7ed53 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=ESHVkgNwe3RMy11JppAA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: -2W84o6KVIgSOZ4Rs4iUlX7NqT9GndG0
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE4MyBTYWx0ZWRfX6F5EQzbYH35V
 bvnTMF/eKiqoJvS9+SWkRuxLzFR5FQbrDtigmBBW6vJX84XOpVBaVL5zvTbBG8v3uCY/OyUdd93
 BioI+7tzq9MAhCGriDnzPyxylKEVaew=
X-Proofpoint-GUID: -2W84o6KVIgSOZ4Rs4iUlX7NqT9GndG0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE4MyBTYWx0ZWRfX08+8Ed+YE0la
 E9FTc5ZJfoNxvawd7KSFW7tdc/j38IK00pd5ZLWKQ3BS/HBC/9B3MMLv706HrbdbA8e48GDhX2O
 SWJL17qvx2Kp91Cuche8D/CsMRmR2pLP8y0V9ytuDlL9JSA1po95jybwD5ECs5EhyjR5JRy47A2
 K8hMpwzGFePJS5Z8P60OUuynhUTWO5ZnENUmrPrE5sZO52twLdlp3ggUxoEBVAX6ykCtgNzqVSe
 EcRTx07K68TnRIAbLuc5w8yikakhUO2pRcUSrcyRnatbJ1OK6WLrp1elSVOwsioHmxrFBBdtmVP
 XPMxMYJBRuiMqCDB6yUh26UIG8a0DcDC96A13avKikcGNVYS8kBGDqiClxxAb7xyrKw4YoThPHe
 o6CrDPul68zRUjpF09GTBKRb9A2KWL8Yg3tIzbTOOCgTCVbWe98TccWTYoT6OY208K3orVMnaMy
 chtNegR0WSpjfq2nx6Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140183

Enable runtime PM for the controller, allowing CX to be powered down
once all GCC consumers have released their clocks and GDSCs.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sm8250.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-sm8250.c b/drivers/clk/qcom/gcc-sm8250.c
index 1c59d70e0f96..44f6e197433e 100644
--- a/drivers/clk/qcom/gcc-sm8250.c
+++ b/drivers/clk/qcom/gcc-sm8250.c
@@ -3619,6 +3619,7 @@ static const struct qcom_cc_desc gcc_sm8250_desc = {
 	.num_resets = ARRAY_SIZE(gcc_sm8250_resets),
 	.gdscs = gcc_sm8250_gdscs,
 	.num_gdscs = ARRAY_SIZE(gcc_sm8250_gdscs),
+	.use_rpm = true,
 };
 
 static const struct of_device_id gcc_sm8250_match_table[] = {

-- 
2.54.0

