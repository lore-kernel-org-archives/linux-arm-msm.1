Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2972E3B7763
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 09:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784886598; cv=none; b=QD54gj5XsyCX9u0f3djN78OvrQa++v//OLnJi6HwZPWL15mjWF4e1mU7JLHxgnM8958EHGym6GGcP/KXb7MrJVM2Zfc4SOvvOY/ct+KzOFD0/iURN1/cKHuuORAncd+JKHwFKr0rvr/Mp09G5EtuRHMzFW1s/KRQGIjRR5a6ZSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784886598; c=relaxed/simple;
	bh=FIoI34exXMWXi2BXg8YS9G6nrSeG6foZcfBsa8GyokU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iyDPIMTBecXV/TWFw6hWiFj87TSavkHYB79ijoL/CqTXAr29A6czTLphKDYfeq1iha6HongOIRDrYwBTALv8K93c7acXqLVJVFj/V5Mmx8d4s5FA7rU7VCsh0B5XvdBG4+/Hj0EUeIU9CiIV2Tuiy1+B0cLq3t2g53Ow99n3OGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XVeBdVp0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GnT3mVNF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XVeBdVp0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GnT3mVNF"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66O9MAML2754864
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 09:49:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=pSw6yqSgPEi
	F+OlTlwbrF8Jc4C48hR229uxsm1NP2ts=; b=XVeBdVp0gYVFyE90yx4iH8zHcF0
	SBbb9a3EOPfm9/dFQ62O1GuvyQyRy7mzyO619sjLWmybDdDFvSTCqoiCH+hgIIjI
	PwjdvQV4DkcmzuTIIUd6OtCEld1cnjxXyrvNgCAL0M9HYUYfVK5r8chenCRMJarG
	lkrILCySR99Cj+9w1UOnrrgOq+EIxwHQd2uvI6nBYrLbk5Mfepvs33CivIp/laUb
	sxsJhy3d8MC4lWZ7+kYTwl9+Ad9+7V5AoZ8HEF9bOTopwZWfFf3RhMJyp1lUNx+i
	lNSzP3B7lXOjLWDr5LyhhZGIyDoysRm+dpcnukP0wl3rMtqijlNQlguI6CA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm5byr3bc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 09:49:55 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84877b362f6so409088b3a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 02:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784886595; x=1785491395; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pSw6yqSgPEiF+OlTlwbrF8Jc4C48hR229uxsm1NP2ts=;
        b=GnT3mVNFhfCIE1zeNZq1Z2buR4x0RZKXlrrDvekDOr/8NWzUogU7rbsR4xSRSBnvZw
         Mxpf2z+ZNF6yBaobfRUSE1QRduKYA6ZHIKHP7SAccF9d2HYLTDjfhCHu8hIex71LTb+x
         k2S6v8VZuVXTighja3OAEMVodotbEjazUtQyfgDx8yGEd0ttyM/VldlVwdjbprRgsvFC
         G8xQ00I4rBAOWYVxBlrbQ3YD4NUsW0rhU+TPRMbigj3urMpNwAQV/XXLO0rG7BSKjllk
         NYaD2889AW+0GDUeGRSEh6B9x5OZphvQe+GeOmYGJl9w8QztEXLAwLwdq9EQoNogE7U4
         6zMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784886595; x=1785491395;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pSw6yqSgPEiF+OlTlwbrF8Jc4C48hR229uxsm1NP2ts=;
        b=XycumOzcMzRoJ+HZC/b85TWekk7IDfjub7Gj3tcSXAbFPMSfcmaY64FpxzzVBWzhXn
         GtpnuPMLkqNfwvr21RyPKUTUtH0INR7MaHM+dNtKv4fiKwR3GvyMT0UBsmgGwgxkEA8u
         GnxCn5pGYdsFWGl1jc4IpD89Yd7K1a0mHrs2k4MFEiouIKQixozTgit9qyFpRTkHo8Go
         IQqHA0x7L/SuqqGhVaR9bNtME1xMXdqk2l8hv+ItUd/xsnDCZFVYUNRl+MaDXe/tkv35
         e565ftqMj6aNnllWmFekGqcSm081p85jKU3KgEmd+0F94aouppWMfVEHtct6qMlpkXUW
         wF9g==
X-Gm-Message-State: AOJu0Yx37c31VdIwU7p7t91u6lmA0iL/kBG6zslhf6Cn3YXsUtmTPnTD
	h9nkcN3/JevZUJTT7tFV5M2VobsVh+wWj+s1z3gcnvQapedUTTe+/KYIdCDrs0juiYX1A95EnMX
	Jp5ge9VkfkCHwMcUFJy2+ortDyqL1bVkT0ecV0sHiabrrJ9c2A2xs6GoaQqcEMr53CznN
X-Gm-Gg: AR+sD13ZSJp6lxOYP3WPCmf1l42BJT4/KgWQs7iEI/TCyi1u/J4LzFIYCwNGxV3zu5U
	8LTSe4giy2LtcNwtqssJD+N26Q3W1fLYV6DIB6TeBFfk97LtG90qvO7Ir1QJmQQNAL8MKMQz8ra
	JQV2w461o3UQKplrVLNe7XSXKCrfNQ+rlx8B37mgE/ws6giQwuaVZIJmx6mysVLg9H24qx9/Zkb
	indlign26PSOe5kefo7PLhUFzj1DWCVY+BFIqorDnupU/wuSmpsggAdbkoTsIm78OSWe6/PmFTP
	d0N+5JUmy5dHiS0HDyJ5PxmU9FQsQn4JqAUneE7Pn2MG/AAhYGMs2kkGddBktnZgZjOGB1iWvZB
	jggcRSNM8PTtiqndyrqaIcD35U3g=
X-Received: by 2002:a05:6a00:180b:b0:837:e9cc:d474 with SMTP id d2e1a72fcca58-84e2bbece5bmr7258317b3a.2.1784886594799;
        Fri, 24 Jul 2026 02:49:54 -0700 (PDT)
X-Received: by 2002:a05:6a00:180b:b0:837:e9cc:d474 with SMTP id d2e1a72fcca58-84e2bbece5bmr7258289b3a.2.1784886594251;
        Fri, 24 Jul 2026 02:49:54 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbb8f1a8a7csm3961013a12.24.2026.07.24.02.49.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 02:49:54 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Elliot Berman <quic_eberman@quicinc.com>,
        Andrew Halaney <ahalaney@redhat.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v4 2/3] firmware: qcom: scm: Fix reserved memory cleanup on probe failure
Date: Fri, 24 Jul 2026 15:19:38 +0530
Message-ID: <20260724094939.613844-3-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260724094939.613844-1-mukesh.ojha@oss.qualcomm.com>
References: <20260724094939.613844-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: TFrKYP-eqmys4S-OdFUawSUDSXyjGoxg
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA4OSBTYWx0ZWRfXyfVRphRAObPz
 aqm8F6NVC70JsSuUaugC8GqKP052I6wx5cGpJlXiHjdM6QkhuAfik8cv/uOEzCoCnEC410zrSxR
 kQ1UXMpodMBR0c/bJJopyV75KY6J2nA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA4OSBTYWx0ZWRfX75OeE5Q/my4T
 GOP9y9+mHJS96c2ifv2YCA2piohQd39l76iuHSoAlsdLnRjOvVyCKoO58j/V1cKAtCGbU307/9C
 4Bj6uVozP81ykFs4q1eJPEKI6tsRFehu9H/MRwfU4R5SQjAz1MWumejFk7XJJ/w6N2pnTxixTh+
 IvJjCcGho6S9zMnBcP8UUD4Ym/S0o3qMxpErpxqtKIVFaZ/25Hb2T+UYHpy38rJOQiMYjgqAlkH
 UfThi+dFpmjWPMD84C1jdt/34uGUFTZ5N+gvw2PH7LtwEIbFzQt6xbRuLi1VD8YNLhkfoCdLE96
 10KNSWNmPtWNZt6i4WK/wi2vki9elfa6+m/ZbyX/zHAtdZ3+IvarE8HE8LYDzrR8dlByMKSHYgG
 rRzPmwsUau2fBvFfnoShMk3/52d7Cs1WbOwH45qUKyXTCcQDGGwPBIUsAHLga/w+s0qiub1zsvO
 hYV71I02q8A2eHq+QJA==
X-Proofpoint-GUID: TFrKYP-eqmys4S-OdFUawSUDSXyjGoxg
X-Authority-Analysis: v=2.4 cv=GMA41ONK c=1 sm=1 tr=0 ts=6a633543 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=mag7UKMDEwzM_1C7KTIA:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607240089

of_reserved_mem_device_init() adds an entry to a global list with no
devres counterpart. If qcom_scm_probe() fails after the call the
assignment is never cleaned up. A probe retry would add a duplicate
entry, leaking the original one permanently.

Add an err_rmem label that calls of_reserved_mem_device_release() and
route all error paths after of_reserved_mem_device_init() through it.
of_reserved_mem_device_release() is safe to call unconditionally as it
simply walks an empty list when nothing was assigned.

Fixes: a33b2579c8d3 ("firmware: qcom: scm: add support for SHM bridge memory carveout")
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 3b271948d326..9db55240609c 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2849,9 +2849,11 @@ static int qcom_scm_probe(struct platform_device *pdev)
 				     "Failed to setup the reserved memory region for TZ mem\n");
 
 	ret = qcom_tzmem_enable(scm->dev);
-	if (ret)
-		return dev_err_probe(scm->dev, ret,
-				     "Failed to enable the TrustZone memory allocator\n");
+	if (ret) {
+		ret = dev_err_probe(scm->dev, ret,
+				    "Failed to enable the TrustZone memory allocator\n");
+		goto err_rmem;
+	}
 
 	memset(&pool_config, 0, sizeof(pool_config));
 	pool_config.initial_size = 0;
@@ -2859,9 +2861,11 @@ static int qcom_scm_probe(struct platform_device *pdev)
 	pool_config.max_size = SZ_256K;
 
 	scm->mempool = devm_qcom_tzmem_pool_new(scm->dev, &pool_config);
-	if (IS_ERR(scm->mempool))
-		return dev_err_probe(scm->dev, PTR_ERR(scm->mempool),
-				     "Failed to create the SCM memory pool\n");
+	if (IS_ERR(scm->mempool)) {
+		ret = dev_err_probe(scm->dev, PTR_ERR(scm->mempool),
+				    "Failed to create the SCM memory pool\n");
+		goto err_rmem;
+	}
 
 	ret = qcom_scm_query_waitq_count(scm);
 	scm->wq_cnt = ret < 0 ? QCOM_SCM_DEFAULT_WAITQ_COUNT : ret;
@@ -2937,6 +2941,10 @@ static int qcom_scm_probe(struct platform_device *pdev)
 	qcom_scm_gunyah_wdt_init(scm);
 
 	return 0;
+
+err_rmem:
+	of_reserved_mem_device_release(scm->dev);
+	return ret;
 }
 
 static void qcom_scm_shutdown(struct platform_device *pdev)
-- 
2.53.0

