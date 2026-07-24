Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFCBC36B90C
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 18:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784917772; cv=none; b=PC9ETWzRrni6HCk0a4F+/+VyJFpRhKdGZlQuJRS6pgUKNfVEC8xasbhYGzGeYoZ8j+f5KDCoWcIUexideu8KUDa+r08Tu4kjArlbGj2q6Pw59TjjgS6ka9ES5UZLhHNMJRoaHGp6asFznd5eXL4CyKCsNdqeWslzlkMVznrJI8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784917772; c=relaxed/simple;
	bh=Rd08ZYH+g7lm0KkA458fZcsV5EcdJIBQIovcvHvcM20=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tkes5dRJa4p2sSMSCWW3M7fW6CcHHiVH6K1/2DceQJj8Bb2oKq/VlQYU+nq676hClGR+sdlrNQpNwh7hbfGgiGpjMSb5QYJLvHRpc1pa98Zhky6nxIJaijtinLbqABS6Wlcevxno9phIbI2cyqqu3c0vYEIJjsGcOgvyeStHqIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H6/g7qHn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E1h8wtVm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H6/g7qHn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E1h8wtVm"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OGqbMS3537458
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 18:29:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Fa5SBdOmTAH
	7sHy3pw/Dk2Y3Rqwllq27Y/6IQIjOoqg=; b=H6/g7qHnTzKsMDWWrH+TbVECPoM
	C05ZqF+Y7DKu8pvuHwHLXJDlkT5j/WRqtQIBvLwsAhy7CJ0KQUjMZCjvvW8vLzeA
	uK+gbHVJ3KopYSGRs+KasFKhZK6xSjZkyfY123LvNnudfVDacEavanjO/qKVPIXh
	ZzlU27Cgqhkc9yPt2ybmeVdHGsH65CxQHGWi0yku77UStshovgRJDqskhY7cK3qK
	BHjI3ayFDQZT53KSQEtUBD7x/7AzeM3JVgAUbISd0yItB90AqUm2nhVUrOM3C9KB
	jOjL5k0ZaJNBsRLk3+O86vY8IUFnoLyK1cf4A5yITDTJ6TDpjSBd0+uYNcg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm8cgh7fc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 18:29:30 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cf7dd9fd91so7719265ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 11:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784917769; x=1785522569; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fa5SBdOmTAH7sHy3pw/Dk2Y3Rqwllq27Y/6IQIjOoqg=;
        b=E1h8wtVmuUE1XnUThh9dIYiQxia9rKP6afe5fdIqCy2jcQYsCPWD2dzXDJwLhEDLFg
         2/AcgyFJKv52vFIzkcw5dhj6BIsJtRGeHVflnO6RMqoMEDwQE9lp5v+eJlfvNxnsdTau
         lvXkFqURlbno5Yvq9t53fgmJpwdM6DSC8rDAiQ1YGkJj3qXBR4ezdTa5BLIG9c484qw7
         TOuQQchQ6V98fntDHDKC4A4qIaXCthgxo7yvteraEkLfXWfjSNrcXYuIyDnX8vwDfdmE
         rXjcNJn+AwgVYE5Dw5DWbwMRN8gd6+IusntPTMW3xWsYzK7PPcCDDDr4ijyZvJDsZQXi
         8b2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784917769; x=1785522569;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Fa5SBdOmTAH7sHy3pw/Dk2Y3Rqwllq27Y/6IQIjOoqg=;
        b=k2PuCzh6vuqkCvvdV2VOCjE8Oa2VSbCEQYl/QdiTFzIFXhcjXAyNotAex0ezqpzXkv
         fs3bk2tNPuTTobR2+I4DGiBPrsqkX6pKw+m3Ve2f1RvYWhDA23cNT7U5KRPVQ9nvuDQ/
         y1RMv4nY6BZd8Ua0AbA8ReA5XO1Cvn8tARYpcKgn7vCIbsIRQUFttzunuxFs3zVAN8Hn
         jpSGP9897JYY+nDRkH9E5//MH3pWa5WSEffdmk6fu8IvH8LV7q21mg38gBVBAy9AzZQC
         RwvFG9T5axQyGbkKK4tAT0acgjtA/IAqx1KJUu6FMF8b9ppgvbfpu+RapO22oAmNN9h8
         amsQ==
X-Gm-Message-State: AOJu0YwVCfm+e2f0bHV/Y3bNgQROV2gmXPwH+xakeqKvWzkYiBxlW/Q3
	Clhjxv6xjRRWbfKkLXl916LiTxM5fuqZxl+ZpZFzOannnkMZa1VSdktt0iZ0Hs5sn/pAigyv0WB
	9E4wJ2RNDMDGV78t2utjfonYEDK5jzIyM0LBYQOFQoMDxamnSLh0arDT1pV3k1YR0yeCR
X-Gm-Gg: AR+sD10Sz7AZTGjjvhC4751KCvMX8dCRyUCYdOFgB+SDZC/6PIZs08S8tfuJRBnWrBd
	lUG7gBQtZ0mMm29T74Z1tfp1ULW6S3f+EjXa0eAgPXG14AC5fSMQn7+iE3yzI+HEOtUsTNNUytL
	mVmIJKK34c2/w9//1XA2hPXp9qnpq58Pv1vuFK3hkDZwBpmssW2q4/ijxnNrU6oYi0+FT3e85zY
	Oz9rOTnx/aSW8MdRfZ+t2TVGa+9SfUGPVThGzkNafZA5X8KW/OKngLDHS6EElsUiaUehwkOkUSR
	qT+2ZwPeIOHThF2uyGH9TYdUQ/IXTLylBBGxQxO5MgjgCeq4jc4qfVaD1bjgXHYA62t4pvARw13
	U7WSSf4sLQrgd9T6AA7fkOGA+UQM=
X-Received: by 2002:a17:902:f642:b0:2c9:c517:d078 with SMTP id d9443c01a7336-2cfa6c7884bmr95900425ad.36.1784917769467;
        Fri, 24 Jul 2026 11:29:29 -0700 (PDT)
X-Received: by 2002:a17:902:f642:b0:2c9:c517:d078 with SMTP id d9443c01a7336-2cfa6c7884bmr95900235ad.36.1784917769035;
        Fri, 24 Jul 2026 11:29:29 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc5c53f3sm1341510eec.30.2026.07.24.11.29.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 11:29:28 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v5 5/6] remoteproc: qcom: pas: Drop unused dtb_mem_region field
Date: Fri, 24 Jul 2026 23:58:57 +0530
Message-ID: <20260724182858.1868271-6-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260724182858.1868271-1-mukesh.ojha@oss.qualcomm.com>
References: <20260724182858.1868271-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDE2NiBTYWx0ZWRfX/4gwD4ut8Ztq
 v3bgqIR1Qsq8tjutFDFHfy2CWDdkFfYAIyOgiVTh1NhDC0BxEmJrXyS+d5sgX47ueiFcbjM/TBt
 0ufeCXLjPvyyDZrVOoQc85IllbVzRQTSldkgDFedb3D9ntFOYvtfaqnUbTkILYxNT+y/NEMsPVQ
 /0lJzZwHuqwJmprnwGij79ZYouLL4++jla6J1bvranhQMnDKDWhb4NWUZPVTiCGp0gfkQGSeSAe
 npUItZo5kY4/MDxWffTuCUivojbbPqY1+zaQlavTbPsKMFGRt2Jq3dWVtwviWYmA8zTpyXQ52OV
 mQ1lFludM+1U6DGyBRho59SUCAPqFghA2lWCTz0uH96ue4H2OaPUw/KdR9aq4UMvbzL50pL9Cj6
 FVrxGyquoKQ0d2g8GEichuiO1thWpXTZpVr/lQwBaQXtLkHVR/Svq5inedjO+HxbTqff1O6iUQe
 k2Rl2MQIcuf+m5qhbag==
X-Proofpoint-GUID: 1PnPM2nGS7Ig-WXu-pA9i5hUYop-mrw6
X-Proofpoint-ORIG-GUID: 1PnPM2nGS7Ig-WXu-pA9i5hUYop-mrw6
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDE2NiBTYWx0ZWRfX7e1FhvWM7qmX
 bzAjt39GFtGdmJbp1hl52I6qGqHdvMYsoiSa05HRanPQSDR3QFcXa4HVU0GZROtSQO4IPBHsWV5
 TGZYyxM25kzXLt6ueBPu8deRsY7PYa4=
X-Authority-Analysis: v=2.4 cv=P9sKQCAu c=1 sm=1 tr=0 ts=6a63af0a cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=Lqr_36QtIFBVL_bOULEA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 priorityscore=1501 phishscore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240166

dtb_mem_region is no longer referenced after the ioremap was moved
to respective places where mapping is required. Remove it from
struct qcom_pas.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 5cd34086ccac..0391e30f42ba 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -101,8 +101,9 @@ struct qcom_pas {
 	phys_addr_t mem_reloc;
 	phys_addr_t dtb_mem_reloc;
 	phys_addr_t region_assign_phys[MAX_ASSIGN_COUNT];
+
 	void __iomem *mem_region;
-	void __iomem *dtb_mem_region;
+
 	size_t mem_size;
 	size_t dtb_mem_size;
 	size_t region_assign_size[MAX_ASSIGN_COUNT];
-- 
2.53.0

