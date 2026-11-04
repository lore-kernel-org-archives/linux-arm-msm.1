Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793815184;
	b=wjF7+mOq2y8OwamQxAyPlnzG6DS2GkgObTQpzVOOgdBtRx92wb3osW3XCrqIjR0GMknz
	 dBqLsJvexP8FNcqVzPnKLSJasnDN4prESy42p3lzbXZh5wjesS4zjg00cmPbQbI2XYRSR
	 Gst7Q3nrLH4WhEZTGMb5vFf5rz8f+XY2BcwxhUiXEdBRQGSX5QoURYZD1aRCXRAgWTmkn
	 YsIGNSxKLjVaw1ZnPUiwlwS404+TP7uOkwSWRAkoacMsO2RQjtK57xkPAFOXlo2YMWqsz
	 /NhxQJBBUybqksOBnjbAxOfcWmgr5SaQIseGE7kpnIJAROkgGIlDH+jwuXOrjMr1Hkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793815184;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=0kJtna4wcqEgrqLio7JSNBMwkN8kE/YoYszBIkhjqHQ=;
	b=07e+qNcKgUm5hgoBzD03GyvJYmIxyEW6OWEXgnAnUlN8rMsgk2pqYnzhizkkvMOmHDgI
	 U5q3e3Idlhk8fhD5y8JympahvibXN9puvobpOXbKnEM3aFIIuFCilBkgh2L/VHz2y/n5X
	 /eGFJj6g1FphLm3MdRCO7CmwZ84EwSIR+RLL3J5M0fDZivjE9wV9MiOgHExb95nkuLNMR
	 svVmYb14d8M6Ugn9nwYI+meH3eqCiMZgWQQD7bskhfhV5IrYL27G2EaQXO2Z8796K4rO1
	 BHSM/LS67B3+/jJmwKMisJZzlXIVn81Fx5pFmgO+Dr6OXwk4tTix1VAwrAFPEmuMMgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=C77WedBR;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ieJYXeMu;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D09C606B21C
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Nov 2026 17:59:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D09C606B21C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=C77WedBR;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ieJYXeMu
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4GUYi7763877
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Nov 2026 17:59:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=0kJtna4wcqE
	grqLio7JSNBMwkN8kE/YoYszBIkhjqHQ=; b=C77WedBR525RLOfK76SBeQoQLYt
	RhDUArQRz36WE7CR6PRA0L5hu++WCgbceSaEA8JQ3Nm+chcxSm6W5o5q02h+msJh
	k976oYHHOYxm5ahJdee2WQyXbj6ln6CLDZK9BMy1wCS6DQ3galw/Q1eSmwOyjJMc
	RpFfo2SVuOYW67qdCS1MQnY6PaybtzxvwKblM7ZoqyzApW/NZ+iMUuDnWpJXgCAT
	eiQeZQwYwwRaqE8GyEqxfG8j8fHUKy3ds3K8j0we7ikmNC61lqvc3hwLMy/2Wfhq
	AHzmTsdX43Sr3l3CfBJCtKVtdeWK1Z5uKcpyZZb7u/apWcbzZwLu6sNdj0w==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr89srd59-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 17:59:42 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ade5b3ae97so772575a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 09:59:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793815182; x=1794419982; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0kJtna4wcqEgrqLio7JSNBMwkN8kE/YoYszBIkhjqHQ=;
        b=ieJYXeMu5k5w4i+/+IovJ+RK442QS3ip9LI4BjYRN58u19qjVl4b8X6qKk4JKlw1To
         dBfni/56N+qLArLNV58ffZt0RQXAY1ohtu3XfePC4ePc3vmAaVQ/t+3pIrydZCYShVx/
         5dt4Fo6nkqIkKaiTFUdOewEJaecl6JD1nrSh15fVfmDYqe++hdHHFaXv5kW/3h4PdPmQ
         UUHK/zbJQhZNkTo7C0lCkLMgY0U87MjiQb6+3P+9u48O5lZNp8eQGQgE3L3kpHtzeC1J
         +v29jwBEUjgpaFSxiYz/F76D2uMmrt+M9X8JhAk5sN4Japu50VFQ/09a2HW6WOyVs402
         wghw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793815182; x=1794419982;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0kJtna4wcqEgrqLio7JSNBMwkN8kE/YoYszBIkhjqHQ=;
        b=oDIWgBv7AZrA0D8fUgrmxa9I4GVs3uRs/kDnaEGcHhu2jhnzPP7SgGQ3Z1NawhS4ur
         HQsQ8SVc8eN8Hd9AttcsKT4kV49OFR7RviKf6NiP+DKMszlnAwBd7SF/XKZbGvzlk/iQ
         AweN3SBEX44V7Flc+w1etsxOb2ee4jVs/1H2lLdCIOqJF/S83afTeaErOagpQ2UOp98t
         PPL5SMe2AslWR/Z51UCSU6FiNUKIxSehNaigvg1SoitQpNbw1isoGltIlN4I4+ihCstI
         Z7UKhjrUugx2T6lEbAgFNw306F02KiAIDxC9x3pXvjLRHGtwTqZusqTfJy7SdMwkNsMj
         vypw==
X-Gm-Message-State: APuU4Z8riy9rD1UuWLUqGfzc/Eop8vJVgeQmPBSKxy+1tDZbOnVK4xeM
	/bsWHxTJ3sDqc7zLb5oyj7/tqlg2soDlzjCh94Ht71+Clak81A/VH39V+21fdybdN0f8bG3qT+r
	i4CjRQMvyUfU5/4Ufy4jT79GqD66XuXqIIuKRUg5BgKzORdsFq7+PpA0WkOHA4b9FniY7
X-Gm-Gg: AYBFou0OplOh7YpsUTWHt/kVsXUbSWIueoNDHWuDGefGu2iz4e1UYw7tnqDOfzKJ2Ec
	RBPcgMostJiS/DjXu1gjV1BAeaoRxpUpHTlyFC9w42+nBHQCCxyGh7Ka1N8Xcla0uRqfEacIYn1
	VgelGDUXT/d6i9hrZ+ikD6qO341PpflaaQ81e+wNl7j4AC2HR3m6/0lqPs+VPYlpnnYYy+cVnFL
	cApRyEh62+AE0cEIemA4SDNCuRzrep+7uXjMT1CIAzD0eRfgs9IC0CgvPw7M5qlyXPMRenE+TJw
	6uJCeoeh1FermSUlTiaONE1bHFqliX7C7gGqOwozBDqspPFr4AQSikTjetfO/SWDzQEwTOzEXKR
	BMLtkMl2xUbTNH6lHXEWFNzJg74dd4aXg1+ix2ZzkP6Kz3Iw/xtkvrEWwe+SM/jUJ781vRlcIfh
	wIuNBUiQE0rtQxNey2Rwepsqf/HEaDSfkjDyy4MKaz/Y7BmffTAdP0eF6u4Q==
X-Received: by 2002:a17:90a:d884:b0:3a7:96d:feaf with SMTP id 98e67ed59e1d1-3b0afc2932cmr100928a91.16.1793815181979;
        Wed, 04 Nov 2026 09:59:41 -0800 (PST)
X-Received: by 2002:a17:90a:d884:b0:3a7:96d:feaf with SMTP id 98e67ed59e1d1-3b0afc2932cmr100917a91.16.1793815181490;
        Wed, 04 Nov 2026 09:59:41 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b31638fdsm46607a91.8.2026.11.04.09.59.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 09:59:40 -0800 (PST)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Anna Maniscalco <anna.maniscalco2000@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v5 4/6] drm/msm: Add cleanup help for disabling IFPC
Date: Wed,  4 Nov 2026 09:59:24 -0800
Message-ID: <20261104175931.28475-5-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261104175931.28475-1-robin.clark@oss.qualcomm.com>
References: <20261104175931.28475-1-robin.clark@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 5OB_Ab5yJfjr1MudBP0Vg3W5zPgOg13i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA3MSBTYWx0ZWRfXxqoPzum8kbS0
 6oxxLd8+kTgLMqBVJf4LO6LvUZSqbzHB8SiJmAdJD11bLfoDLtdCM3MKHgCNBecXFeX2bHL3o0/
 YbyprDuFk6q5P3iLN2uu1aGLzO8QAcgSnPWlYoNwHX0nUgL+uMzE8W+V82MdGmzW0mkAtGFGe8s
 07X8immYdQUCGrVfE8cUdTHVsT7iqiQ5h1UGrQgmzjCVeOpJiCbMqqIPnxJTUii402tayyCC04b
 A5XS9YtIjEjKnKyF15bb60xBoMjtLKJhq6DycDr+R0DvaNCo+s29l/TqD387l3znDPAdUxa8ELf
 FppgtWYfSWxgkyOpCDX/AXkGD6IqkwZ5jDWF7guQQnzeTuUOd28uf4gLdShL8eXncuwAu1X92yX
 hOqMRBNnvPnFAb+cPbj78lU5JoUDbgqWow5Vq9q038cr6nF/uR3apqBHu0JsFQi6GImqBWu8eGR
 Evj/EV2Fphy8f9yI0jg==
X-Authority-Analysis: v=2.4 cv=N628hG9B c=1 sm=1 tr=0 ts=6aeb728e cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=pGLkceISAAAA:8 a=6dFaWfunYbwioYd2EdAA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: 5OB_Ab5yJfjr1MudBP0Vg3W5zPgOg13i
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA3MSBTYWx0ZWRfX47cmymaYrFP+
 4Mh1ZtQERIK9gPgAF9tWNnFAQYaz6cy0otaqexluWtfm0YiLgI3bY8uNS8nebazWDy7L2FZfpzd
 3mBrnQtmSlz09P1jBvHYI4/3vKNp0iQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1015
 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040071

Simplify error path cleanup for IFPC-disable critical sections.

Note that this moves where we re-enable IFPC until after the
wake_up_all(), but that is harmless.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gpu.h      | 4 ++++
 drivers/gpu/drm/msm/msm_perfcntr.c | 5 +----
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 0334a0f604ac..e7912d2180a5 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -399,6 +399,10 @@ msm_gpu_disable_ifpc_put(struct msm_gpu *gpu)
 		gpu->funcs->ifpc_update(gpu);
 }
 
+DEFINE_GUARD(ifpc_disable, struct msm_gpu *,
+	     msm_gpu_disable_ifpc_get(_T),
+	     msm_gpu_disable_ifpc_put(_T))
+
 /*
  * The number of priority levels provided by drm gpu scheduler.  The
  * DRM_SCHED_PRIORITY_KERNEL priority level is treated specially in some
diff --git a/drivers/gpu/drm/msm/msm_perfcntr.c b/drivers/gpu/drm/msm/msm_perfcntr.c
index 8c2454627a8d..65d202e12bf3 100644
--- a/drivers/gpu/drm/msm/msm_perfcntr.c
+++ b/drivers/gpu/drm/msm/msm_perfcntr.c
@@ -266,7 +266,7 @@ sample_worker(struct kthread_work *work)
 	}
 
 	/* Inhibit IFPC while accessing registers: */
-	msm_gpu_disable_ifpc_get(gpu);
+	guard(ifpc_disable)(gpu);
 
 	if (gpu->funcs->perfcntr_flush)
 		gpu->funcs->perfcntr_flush(gpu);
@@ -302,9 +302,6 @@ sample_worker(struct kthread_work *work)
 		}
 	}
 
-	/* Re-enable IFPC: */
-	msm_gpu_disable_ifpc_put(gpu);
-
 	smp_store_release(&stream->fifo.head, head);
 	wake_up_all(&stream->poll_wq);
 }
-- 
2.56.0

