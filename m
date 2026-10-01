Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 855274E80CC
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 Oct 2026 11:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790852603; cv=none; b=UqJVesU4FweDLksHRoRJTtRQWmtWt6GiKTC1opWPHl5F9hW2ePNl9+nWY7nDzTMBNUBpF+uKPWKYWeEyXAQ7OXIakAwq2mFzKiV6r8K49zyU8so0j3ls++lzguNsfBEXQmTUtlOFn/Up2XsjD8/hRdoaL2iLajRdZ5Q64ccDB/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790852603; c=relaxed/simple;
	bh=JHVm623HXtSRzOgayEFKW9DRNqWXKZ0z7370+BQe0u0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AfEFTuAasIo6agZScHM/O+VwRfYnobx6nfDjUd+GfXh5WvEjqb5SbT9y6OD74GckI6cZZThoCYjNLzP5J2VGjqBzm9two8SCBheebDVy2X441c+38b2tWX0rO0p7Wx9ktluPnexqmZ9iCvb4oEYy/PCfeyUYa8MP234EULWdjTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FfaECUiL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jpsgALw+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FfaECUiL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jpsgALw+"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6916xRwi1289112
	for <linux-arm-msm@vger.kernel.org>; Thu, 1 Oct 2026 11:03:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XntUQam23skZGKH+QyQl8/V6moXnOa0k73qHOQ/KFB8=; b=FfaECUiLmYJxBeZ+
	2dvWRusiauQsQAdthZ9XymEiPk1UBeJ7Or9v0fs7x57jjJ0Y76kh2NwoHwcaK9CD
	m+kyZPXQRX5lLCsMX+Vrk8JZScBtpHLGBP2+zSFPekTlKJRk3EhkSKbH2fXc4+d7
	I7TCiGy3Cd+j/iZYbHx7pSbyUfjqWR4X1VD1iDewtOxKiQRzfwRhK3m5kLQs29Bp
	WZLHmKgu7gGVSPyt/vPVBF9+q/HOcAbnxYHyeeamIwDmrnY9Bsrku0V27v0I1Eza
	vQ0mDLqv3W9za49ZRqAQ7PUUP2a1waHrRcO3vVmE6XehvdUCFpoAmPopeTDqyBD7
	wAfcAA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h17pjbmeq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2026 11:03:13 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3a4b70941efso2105739a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2026 04:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790852591; x=1791457391; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XntUQam23skZGKH+QyQl8/V6moXnOa0k73qHOQ/KFB8=;
        b=jpsgALw+AccUTiQ5sLwPN7hqI/Gg8kou/pSBvHdZH3noMUlZPPbLoF69CbDO0ZrsvF
         beA7ungKBuL/5DLL0eVvVVqqQmjkoCjlWJ0pI2ufiJI2Kn2LMF3eKPMwFSPgJzqpPTL/
         U84CxXrKNNE20+RIbalVCIvjn7cbBn/Fy1ylJIOCDWbfmGSWSHIUxKv/aUZY2l/qEKW7
         lSfy8H43sP/+Fw4MX2ULjOFT/LfAMwz7tQU4p8qi8O98QuLl/cS/VTtBHBrP5pR/zR11
         AHPHLu3i432upUqz6i8N+4dYtzT5eR7eYayqHad4tCN1Y20vXXmuPxnrfwPc8pLvR+hZ
         mJyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790852591; x=1791457391;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XntUQam23skZGKH+QyQl8/V6moXnOa0k73qHOQ/KFB8=;
        b=A3PYwuAN5rA1qMM9qU8rKFkEuWQYgcN/BosKVdMz0+DomawMmauV4IEd6e7hq6hbRo
         CQS5Fg1qeey5qg/nTfBq1VAVn5/0pMXntKNbOII5zqcfIOz9fJj5Ahe4qoN0UEccmWuW
         Z27VUamwunT65Rt650uzeSDIIblypM1j6Y6qdxkZJb6tl8nyVPUbp71msYLyr3ErXmHR
         RhvXEkeHBI8+oOcJQkBtwg1DTOmf3WPhTDDaClz0eZxlA6n1hZ5JutqgY3Y9U4sKLxph
         FzwffXLrllpq45Si8GTYY58h+pUMfF6Bq61Alk+LgJZ8hVmQ/VoIBYgSR/dDKIUiPA4B
         hdzQ==
X-Forwarded-Encrypted: i=1; AKwUvBzzuXdi4i31eEetUiwEgGwB6HlRlxn/CDaSrbTJ7jsXB5bzU6P+CPHHrgLth2PWyDRcUHdPc06/DvlOFzU9@vger.kernel.org
X-Gm-Message-State: AFq9FYK0A7y0K2SvGrwPcXePLlzsMY95hOhgB0VJj7DX/Y6T3zzQrgaP
	EBRdrlmF9Qe89fU87yCMhhESBMKn6U//SGzTAYvRe3pVwVkkW27IjnrXI451r0A+YjiHxyhONS/
	ROVkVlaXCQL25DSg0NN7+1JRsFULCNbimOO4sFXmM0N5lQDCPZanWUDValPzZxhoB4Yut
X-Gm-Gg: AYBFou3avFDs6LHrd/7K2vieesXZPI1qtDUoTfOrWepyXeyFe09NgNn/WOiESlTB3B+
	3EaIdApuslUGilCgXLbubvYSLi2QLz//TyINs+NjhZBYO7vC1LXkGBhXwRzyqaI/OHcY2Fh2avT
	J7dCpjcCPYvlRbW77jc4OhhK1cjb9kiZPeXZi0yoHnIddwwoGK4hhvn3OP2CYHQgFF2qdhfLuBV
	Vw/Vd7R/7AWmjjiGejC84Gx22AMlBHMNebqehAQxPnw9q8AOuszw8kpv+6CfACEsRdXHp09PaHP
	YpprbckSvGbJvf3Cdg306KuoBkotoXGBnTmTpQYWkZfS7/n29El04rn09wPrK7koJ4oDfmlFbKe
	ANWbotELWqLbkd2M7KYG6zp5CCg==
X-Received: by 2002:a17:90b:5112:b0:398:e96a:8999 with SMTP id 98e67ed59e1d1-3a4d197a4e4mr3168759a91.16.1790852590814;
        Thu, 01 Oct 2026 04:03:10 -0700 (PDT)
X-Received: by 2002:a17:90b:5112:b0:398:e96a:8999 with SMTP id 98e67ed59e1d1-3a4d197a4e4mr3168713a91.16.1790852590239;
        Thu, 01 Oct 2026 04:03:10 -0700 (PDT)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4f4371383sm4076810a91.2.2026.10.01.04.03.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 04:03:08 -0700 (PDT)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Date: Thu, 01 Oct 2026 16:32:34 +0530
Subject: [PATCH v3 2/6] tee: Add kernel client object invoke helper
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-qcom_uefisecapp_migrate_qcomtee-v3-2-13df5c20c2e3@oss.qualcomm.com>
References: <20261001-qcom_uefisecapp_migrate_qcomtee-v3-0-13df5c20c2e3@oss.qualcomm.com>
In-Reply-To: <20261001-qcom_uefisecapp_migrate_qcomtee-v3-0-13df5c20c2e3@oss.qualcomm.com>
To: Jens Wiklander <jens.wiklander@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@kernel.org>,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Basant Kumar <basantk@qti.qualcomm.com>,
        Apurupa Pattapu <apurupa@qti.qualcomm.com>,
        Arun Kumar Neelakantam <aneelaka@qti.qualcomm.com>,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Harshal Dev <harshal.dev@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790852574; l=2583;
 i=harshal.dev@oss.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=WCJlW5OePMWJUaw3c5FA+6JIuIBWmd2hlhsoPKjjx2A=;
 b=29hTYULmYXIKZGnWBOmfStG6tcxeab8zHD7YP5bg9KyClELhOujE7U89txdks5qD7a1XRa+9O
 heiHfJjra82DtbGzkDjfNhMwCE36TCGvcjEOI5wHKClC7T55UuN8GL8
X-Developer-Key: i=harshal.dev@oss.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Authority-Analysis: v=2.4 cv=eqpKXYpX c=1 sm=1 tr=0 ts=6abe3df1 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=kr-ihz5DC76VLKRVsLUA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: pyui6O52jXSi22krHt2knf5iRm7-yW13
X-Proofpoint-ORIG-GUID: pyui6O52jXSi22krHt2knf5iRm7-yW13
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA0MyBTYWx0ZWRfXzKc5NvM4Q5tB
 +Xlp7h29/fesCNHO8q6y8roMw1mTovv3yQ7G62FI0dWy9bSA/FaGla8gbIhO4dhASXnWI6aPY+Z
 OUmUDocKQ48PGw/Hjcxlhr+57y6zd7Q=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA0MyBTYWx0ZWRfX38X1ieaApssx
 UwPt7XRl4O9c7CEj81oj0X0Lb5rfI93jjfP65s+RTV0UsxdgZ1kdumCv7u5TyE0n2XpeDcWFmkG
 hfhgIXXsugJgkwx5R3sQltCR9ueyImX1pXgbWqZgTR6RjDLJgO3OjZ19wj6J+VAwHWa0OOyWZKA
 B9hZ+RDRBS7VHat/MAvZJZQfjgr4oHghswKfd4gHQM8+e8oZhk+UQM+FVRSK0ik8cy3kVR3Ouf0
 9ji1hHHplut5iuIQQhN16gO+VKYoMjLppG9WX0Af2AwuJQomasTy8onZqXsK0ZJAG36LrZkN6Os
 /WzMhcAHaYQRmQ3bn9VuvN6MEzixV0494SuDbwxC3a5qUECxyvukWF9f1ftfoUGxVJKs3oONvkM
 XIM62VEdSmU1HpENVsokFy4AsosGZGrGQU6iUOcud7TyOILDennS8/mWgyaj5L4TrdIiDy+AZae
 qywc9XlziG2pvs9y8GQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 malwarescore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010043

From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>

Kernel clients can open a TEE context and invoke regular TA commands
through tee_client_invoke_func(). However, there is currently no
equivalent helper for invoking TEE objects.

Add tee_client_object_invoke_func() as a kernel client API for issuing
object invocation requests. The helper checks that the backend provides
object_invoke_func() before forwarding the request by setting the origin
as TEE_OBJECT_INVOKE_KERNEL. This allows TEE backends to support
privileged object-based calls from the kernel-space.

Co-developed-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 drivers/tee/tee_core.c  | 12 ++++++++++++
 include/linux/tee_drv.h | 13 +++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
index 30901390149c..a03a3d645dd1 100644
--- a/drivers/tee/tee_core.c
+++ b/drivers/tee/tee_core.c
@@ -1404,6 +1404,18 @@ int tee_client_invoke_func(struct tee_context *ctx,
 }
 EXPORT_SYMBOL_GPL(tee_client_invoke_func);
 
+int tee_client_object_invoke_func(struct tee_context *ctx,
+				  struct tee_ioctl_object_invoke_arg *arg,
+				  struct tee_param *param)
+{
+	if (!ctx->teedev->desc->ops->object_invoke_func)
+		return -EINVAL;
+
+	return ctx->teedev->desc->ops->object_invoke_func(ctx, arg, param,
+							  TEE_OBJECT_INVOKE_KERNEL);
+}
+EXPORT_SYMBOL_GPL(tee_client_object_invoke_func);
+
 int tee_client_cancel_req(struct tee_context *ctx,
 			  struct tee_ioctl_cancel_arg *arg)
 {
diff --git a/include/linux/tee_drv.h b/include/linux/tee_drv.h
index f3c5e106d853..369c87ad0205 100644
--- a/include/linux/tee_drv.h
+++ b/include/linux/tee_drv.h
@@ -283,6 +283,19 @@ int tee_client_invoke_func(struct tee_context *ctx,
 			   struct tee_ioctl_invoke_arg *arg,
 			   struct tee_param *param);
 
+/**
+ * tee_client_object_invoke_func() - Invoke a TEE object from kernel space
+ * @ctx:    TEE Context
+ * @arg:    Invoke arguments, see description of
+ *          struct tee_ioctl_object_invoke_arg
+ * @param:  Parameters for the object invocation
+ *
+ * Return: On success, returns 0; on failure, returns < 0.
+ */
+int tee_client_object_invoke_func(struct tee_context *ctx,
+				  struct tee_ioctl_object_invoke_arg *arg,
+				  struct tee_param *param);
+
 /**
  * tee_client_cancel_req() - Request cancellation of the previous open-session
  * or invoke-command operations in a Trusted Application

-- 
2.34.1

