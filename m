Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A26F5397339
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 06:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786516153; cv=none; b=oLp4/k1LaCSWmJP5zQ/b2znViB1E+dBwCGZGD3vaRNfj0aOvDOpudYcV3A8yuUBJ0GxII2SSGpQeZie2/pvw8xMxRFDMFlLMogXLdz/hjAxeNPAlyLPigtE2R6sSFHWhkM6MLCxYEtiKxJuC0QMaMmOpxyJSNqwO4wShjQoHS7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786516153; c=relaxed/simple;
	bh=RZHAZW4aoFVgLZvrOewP/X3lbvvIMEtTT7yCYQkPd30=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RI9KBGWCcbBZc9Nj4MMHz0hdmVArpmAFbY8J36qjAM8jZrmur6rf0n6jH5hC/X1tM0pTPNeVgBMp7oao6tUtKdqHmbMjGhwCsftHRRuV/fAOyeJj9kid9upzV/zAi+RZ8Dflcl0/pvRmoPySEqye3ylvB1rQ03FK81C1rc+0r4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OfSEk/oO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fnCLVfeS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OfSEk/oO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fnCLVfeS"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67C62cXe2190396
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 06:29:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZSR2RGIs6PUKCgGeLqoEkgFW/1q3qtkJmKEJEMtaxb4=; b=OfSEk/oOYuywuoT9
	CZ2xlXSL6SkoeiGATHuxu55FZBs0x3sJPgvBMvA+kASaA3YLHhdaHq5qSP9EmCU/
	dKapOfgOMvB7bJtWONSvFWMFWCNKN8P1ZQOJwq+Z7mv+RX/rfrhWdEgqoCuD4b1Q
	4dxYGu323/Pfz/9IvUmQeXxQS2Ygjy4p5TehWmtW7wMa0Jb0xVMutxgCHJ/mVuG0
	qN6+/5XURiWnGegn5ZRGnd+vtoTEh0LUUPnH65zeIkoGUx1YSxra5E2moTjsZQPE
	B57KudRwC6GRmt9qBRRjV8K/LZI8jRLx5HMz9aCndWFuS0q4RBpDEVUvGsbuTrjy
	p1O6Fw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g049g3sym-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 06:29:11 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38dd87656d3so817445a91.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 23:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786516151; x=1787120951; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZSR2RGIs6PUKCgGeLqoEkgFW/1q3qtkJmKEJEMtaxb4=;
        b=fnCLVfeSoRqMqgAUbGBB15Kzb72IAzksBaNMoSWK6d6cu9cmPUqtAvgddiibdZxJI6
         L99drP0vtGLmgrDnMXqi7GsYJV7/3LSrjSrH1Rc2uK51KifdzGnkgaZMQqZTsVxpDkeF
         pkyOPt5aDq/vAz3ZA7b9xvtjzywcs6rRyBxkLOnbZaSv9z3jPldkYS7vWolIoJFOX45A
         IVLxqP0eRW9PxLjS/r8pUM5w+yPL9RG3gE/0d9q4A0nKCfBw3n1AlK5NP+kM3T34UVaI
         t3WBTBWux++HKPKVVjIH4WcjV1g6mHNMxkZ0vJ3UIUXROOaAyYnzUhVBYouqpp/CdZxm
         ID5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786516151; x=1787120951;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZSR2RGIs6PUKCgGeLqoEkgFW/1q3qtkJmKEJEMtaxb4=;
        b=AZHE7oC21d9McQl0dTIk76UNr9Dac7AZo5br1NzI8UM5sChVjdkyxr0u+aIXcyQRlm
         QXjYXfa/JgMOfWRVj14xT7ZW7Jw511VVyw5uzB89KkLJ+/gUbvjTMFapbsVzt82qTwrz
         KGgfeMlMK2DVBzIUtwe6o1Nm0OfNI70lVbdMXfC3no3DTy09NIABAvGIf5ffLMgdDali
         09Z+CsyQH48yv514a1wM+bwdNz3YubyLh5KLSznIvL6pJyTLlIOhmaWbdyRkATi37g9V
         hIK4ZMnl+FYG3Gq3/38Y46EzZu9XHJ6gAEreK0yus8H3M6BlEA2aHMZmATMFGkGCHdpf
         TD7A==
X-Gm-Message-State: AOJu0YzhBH08OREsAGjN+NQBM1Hs2gh7aFkyx3kR5zzzrlIib6z7MSxa
	hf3k4Ot1GZZF6p0M4GDzOON6wOJJoqBD87+bCEReJRCqX/03iM/09hZxHEALlwfSeRjrXLnCTnq
	SF3aVY3ZbFCcZotkyE5IdYN+8QLNF/fa0ufDOI0zUId9EHVvaFyqqnw1OdK0SX6vhniFn
X-Gm-Gg: AR+sD10W5akoPkW1lF04Bw3dFoR7bBKSRUuEtRIaH7M1jxYQXutYJMTonfUz5QA2qYL
	WPIvfAh8d58eRiJY6P18lo+Gsb1XLUv8xFW7yP7e56f0omRHDPZZJSryNzBuPWCBtD8DHka+D8b
	+ecLLlMjd70vOjHtjO1d/eNxNQKfZAzhWYWmg2WtlaP/kzPwJC29tKqz0ZKYxVLko/ecQUm4pPa
	b6JPTXoQfN5txUZxpxfm1vneadxTkGipnpQLO95TAe/XMViIrVzoh9AJs74CE9FPEhlGWLv4X0C
	C8VnLtFkFkhbNK01+OZrh941wpCroe0KHetPkh70kx4vxczllVwIB4hIiYLNHXsTSbgF0zzbGUF
	HFuPZ5F1apGMv3GP0qakTz5gkXkZtR1k=
X-Received: by 2002:a17:90b:3b81:b0:38d:dfd1:7a8 with SMTP id 98e67ed59e1d1-39301285deamr2518669a91.2.1786516151044;
        Tue, 11 Aug 2026 23:29:11 -0700 (PDT)
X-Received: by 2002:a17:90b:3b81:b0:38d:dfd1:7a8 with SMTP id 98e67ed59e1d1-39301285deamr2518633a91.2.1786516150550;
        Tue, 11 Aug 2026 23:29:10 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392fe5578basm549377a91.4.2026.08.11.23.29.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 23:29:10 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Wed, 12 Aug 2026 14:29:01 +0800
Subject: [PATCH 2/2] soc: qcom: ubwc: Add configuration for Maili
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260812-ubwc_for_hawi_maili-v1-2-c29edecb3bd8@oss.qualcomm.com>
References: <20260812-ubwc_for_hawi_maili-v1-0-c29edecb3bd8@oss.qualcomm.com>
In-Reply-To: <20260812-ubwc_for_hawi_maili-v1-0-c29edecb3bd8@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786516142; l=1050;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=RZHAZW4aoFVgLZvrOewP/X3lbvvIMEtTT7yCYQkPd30=;
 b=SSmZBw7vcj1hAQ6zNqKnB6huz5IV8ijc137gqls0orAia4nKBopdsQTgHszQ2TZ64HkaZ5Yrv
 skN6UEH56OmDwpMlIOYTKCGtQK37OJsM2kzkCDv7QffZ9QAc6c1N2HG
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-GUID: zX970pNLtNt7metIEORTMA5acJUPhAUM
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDA0OSBTYWx0ZWRfX73QEIDfgNwgJ
 XH8Sm/InG6jppwk8movINQ6ShAUnEuqyGcuos6KyTABrrQk2UOf463LDK2+HhP+CMOStWF31Hu4
 eqXJedHQgppQRGBfrnnbcZEQW+xaB/A=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDA0OSBTYWx0ZWRfX03dWHvql1KnZ
 BK7jJwTeiaBo/a9QMoMdi+qFfYnqk8R676n20H65Awin5anVtwXJSOBxroxpGJRqhkZrFzQMBbk
 tKmiTnv9nZnAb7KW3AlWUcRgLv5PkWCpU+vbsur4oeGZQK2o1t2Psz6q7igiXE22KUVBjUNLpws
 7AfzKAR/JA66o5pleobkJM7YAoDjf8bxnNRAVDZaz0lDvnRCZqJBPbMsDfXSXanCYAPIsHUPNie
 1AybpfaK8axjHUV4bkmUmURK31WhzHBe+RDZC7JiSXcRt06YQfa3J1AsuRdb0ZZqqHmrSypdHkd
 pKLBr9CYNTzpyquzyjM1ysXfTLb6cPazKaT7zCTn0viPKpy/ShXlLfKksxdtIvmzzDLeuutjkHN
 s77Ff/+YI2k9AwC06g244L1GSUnoiyBWY+BeLpHgGtucoNvexd6n+QCBAXGhsRUNTIugL5+jmnX
 8qeqlNPQ/2CCHqXiO5Q==
X-Proofpoint-ORIG-GUID: zX970pNLtNt7metIEORTMA5acJUPhAUM
X-Authority-Analysis: v=2.4 cv=LIRWhpW9 c=1 sm=1 tr=0 ts=6a7c12b7 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=O3Cipk300Xu0WHn4ICQA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_02,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120049

Describe the Universal Bandwidth Compression (UBWC) configuration
for the Maili platform. Maili reuses the hawi UBWC configuration.

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 drivers/soc/qcom/ubwc_config.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
index 428a3d1038c8e40e43144f2ec3a999e8c991d9d8..e593386920edfa7ad5ca40796755be5cea6320a9 100644
--- a/drivers/soc/qcom/ubwc_config.c
+++ b/drivers/soc/qcom/ubwc_config.c
@@ -122,6 +122,7 @@ static const struct of_device_id qcom_ubwc_configs[] __maybe_unused = {
 	{ .compatible = "qcom,hawi", .data = &ubwc_7_0_hbb16 },
 	{ .compatible = "qcom,kaanapali", .data = &ubwc_6_0_hbb16 },
 	{ .compatible = "qcom,mahua", .data = &glymur_data },
+	{ .compatible = "qcom,maili", .data = &ubwc_7_0_hbb16, },
 	{ .compatible = "qcom,milos", .data = &milos_data },
 	{ .compatible = "qcom,msm8226", .data = &no_ubwc_data },
 	{ .compatible = "qcom,msm8916", .data = &no_ubwc_data },

-- 
2.43.0

