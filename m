Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792797604;
	b=Bgj5yKF0p1spJ+OBxdPMcWoV6cLNsHJsxalOUQcawV36PVdRJVa5sGeLcEJBXcqabPVI
	 nPizMSFhAqWAD3zscZ+RKqk7jmaTArqT1Lbtw7+BuoVG2tWifNAGlnfZjj/PpJZE/q7rY
	 7zi1TH7QDDbIg9tMdUHnx/acjJUA5/7nxPzWpZ+d0IRlgQzR+5DrBlxpbFGpZSe+xd+uL
	 Z4To3n5wSfTpSTiXzKWdO7W9HRmTQYycwDHxABYbCQWG6FcOcKdYPyLsZmEN1vd7ZRfNV
	 Q0Pew3m4C6RW3Pu6TTjwHILy1zgeA0NZbFFM4rO4zIs2W6BDSi6P8PoVMQb2JG+CzHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792797604;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=PImYCQgikueColtwmltOpJlwc8bGmhUG6ZJmVEsXAFg=;
	b=C05apXuipmOrepEc7cCIl8hUPkHKdUjzUnwCZIg4XgYM9+9Hwo5F7dzOqu+ef6MwxAEC
	 tHltrCnwautbBpJnDBvMfwgHBQpkX2XfLzvc8zKuc5sufogS/XoEFWTxs7LKyVwihjD9L
	 fiEwQ0I21hJg1HAI2oH6SPyQSsogb8+yj2CI7sG216T/ULOlwNEAn2zeT2ozp8pGfbn86
	 fwf2x0QMF2X1iwz/FcSjVzY5lwRmETWAKRnRUZr6elm4HIIlit9LGMFYphlJfkwBvSsou
	 SF3iJO33CXC+rWYFC+SlX0pqwne+tohIS2r2UQ14To7A+x2jG3isbr42uoxHHoZ90Cw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mKdNy2wH;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EIqNp72P;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EE32606A31E
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 23:20:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6EE32606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mKdNy2wH;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EIqNp72P
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NLvcSq3471173
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 23:20:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PImYCQgikueColtwmltOpJlwc8bGmhUG6ZJmVEsXAFg=; b=mKdNy2wH/sX7FwLS
	kKycPfqt4xGo39A76y/IZ0v8++1UOO+34LiPvMnmhjWa1C6P+7ksRu8YoIKrPRw/
	nIIwyhaLO9FEc/kI2+bQKpywHTVcr9G+rTsg93ybF3frNl8sx/28mD5QUZ2qTW/2
	4jABJFCUrqP/BsJp7BBiB1B6/y9bWUtRYCoc2w15sBgMzoGZ9CDiKjGnlQTH1mcd
	HA13RJDC7wDU+GmrmfEaT8OtTmQ1LYjfIhFNK4rypjqIHPSg0Q1rnku8LRMQn9fq
	ifLN9Ji71Pckd1c4KdLqdJuxqnnOpwToaDLI2k5CnZcS2lDmB7zdVb9vmC6TtlG0
	8SJK8w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgcrugukn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 23:20:03 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cb7f9bb86so266359485a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 16:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792797603; x=1793402403; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PImYCQgikueColtwmltOpJlwc8bGmhUG6ZJmVEsXAFg=;
        b=EIqNp72PwNDvzjmDguTjkN4pDkbz9wCvyoX6NrBnOPzJ3DBLsE8klDYjRKrjYvBwDe
         g8pbuYF2nJJa1drbeXpX/Z8bbCoQtQnCvLXns9XfeDtf3R93M0aHjF35r8jKG6Zgdy2Q
         WEaafugjrU+SZNL1npYkUy6L7bQn1x6S50/aR+mZz4PtggmVTElxvMdcv6sSrCvdRPu3
         OIUDlVYltCyKUGUMVBQ0hUWy0fBeHGHgmiLIMzxJzsXS9n5kGKeDpqGkswhT/VL10evh
         /q1Eni6KCmKfSA03C58xbSBbyv1dSgr5+KHeyzZaJYG8N7sp6WH66fxOY5P5s2EBXmnB
         m+xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792797603; x=1793402403;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PImYCQgikueColtwmltOpJlwc8bGmhUG6ZJmVEsXAFg=;
        b=sLdZAH4/HSB7jLfeI+iC6JFgF4Y/R+w69iQ4axleFMNciZexXf/Li46jyPIe4d9PBW
         KXSbdETQVfLl8Fxh4atxWjXDhnwnjJQdGHPEGWiUnMjPjGcvFayJnrO+ZY8CY4dFn5wp
         de66vSzcJlgyO563hWw+sUJBcM1AZeUyRClOLksRI0A/ja1AG98762lmUTPJJk2KTUF1
         G1yHXIn/CQR3DiiomI5QklNgR1inKZ4CHMsDDqcHaYxaOIrv8iNarFjlaQtrlfjbsia6
         pFgXORPmvcKoLy6UWB6N25inAZ+5lfL/hsMtI318XKCJgS7HAjIW9c8393SgDd/FRfR7
         lFKg==
X-Gm-Message-State: AFq9FYJxuthddtU4MFGqrR+obZPFRVnP+brE1NYNF6Qd0c7TtMSQ8O1d
	3vROZByI/hVnVwW0kGCTkN/QRtIdbuQKiZxYU6oPRzbrno2Tz2O4P1U7yyJdF3ndI04RqsycsCs
	wWu5qC6xgmSKLIfJyX4U8BiUHiKD9hLoK6icWXzebCQlotiBbZqdAjw8dgFgiB5bwiIvr
X-Gm-Gg: AYBFou3xyo52RdVk72jVRY8TP6xDHLM3ALOEV8wiFG1JnEdaM4jU5R2N4CNj6nH30Eb
	77gzA5LLGWItM3g6f42vS61XF9fS7deJ+0D1dc/5J1eXiXy5iryJD1DJ8fgoAQNfhxy+FI9R5vL
	9ghvcE+5LNmOIu5+a69ksR50wlVRNBwPZDeaoHJwZMsRuMyIkxAbEsQZ7YnRaVhiYMD84GPhUQr
	QqYT6EU5vN+Bs7iqaPiD4iLJdPBME8o9J+eNWxmlCFZffUSnqZ05ws1s2gFxsrXT5Qqv7PX7ibU
	fMJUxxJFIULnvKBoaEf/uUIt751CwS94Ns9S3Xv9PsYLiqAlq2w6LnahX2RN2nQ/XS/K0064/51
	qAtYHgJOaTc+DkGuUEVrN2dwC+PvTeH70UbYkkkzT7/gKIG/oWCHSltaKfmSS1CD4gUaOfKf+6s
	nfsasxEYR466tf
X-Received: by 2002:a05:620a:468d:b0:93e:920c:c00e with SMTP id af79cd13be357-940ef8fd21bmr96414785a.21.1792797602785;
        Fri, 23 Oct 2026 16:20:02 -0700 (PDT)
X-Received: by 2002:a05:620a:468d:b0:93e:920c:c00e with SMTP id af79cd13be357-940ef8fd21bmr96409285a.21.1792797602192;
        Fri, 23 Oct 2026 16:20:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac709f3a58sm863811fa.24.2026.10.23.16.19.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 16:19:59 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 24 Oct 2026 02:19:35 +0300
Subject: [PATCH v3 02/14] drm/msm/mdp5: forget the hardware blocks of a
 previous bind
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261024-msm-kms-destroy-fixes-v3-2-66a30120a5ea@oss.qualcomm.com>
References: <20261024-msm-kms-destroy-fixes-v3-0-66a30120a5ea@oss.qualcomm.com>
In-Reply-To: <20261024-msm-kms-destroy-fixes-v3-0-66a30120a5ea@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1687;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=8zzii9JdhRdB7nBZfP+Qff9ThpfwQO2kWqv8U5qv/u0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq2+uO+QiUAi8caeeJrs1U5ahmbNpXVYKhX02Xv
 hohVY3UYMWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatvrjgAKCRCLPIo+Aiko
 1ZhUB/9FCfpp6kqbpXO1FdSNPOOBOdObQF4s4CoMcDGnbhssHsdSzjl/fZhMtOXIHxXOigdjEJq
 Y1EQldjBwSpggJYu5aHSRglselo8o7y3l/DtPyoUaHSijACh1TdH2VbJmL1F86SASURTSkWhv77
 M40b+aGboElMBGcXCYfp+vAhcLss7R85o1T5gzzHGKkTml6JMEOiFfeW5kp6YDQQ7i+e8oQLaxv
 shMMhIp7aZ1YLBAAo6um0L7wfAgc1KQNNVAQOmjqxjL6XaDEorktGjIW74fBEt+yUF4ZrQfD/fT
 QDe1ShH6DIht3O6nh/Pjz+vMS/fHCllSTWn/MUl7IWqZaH40
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA5MiBTYWx0ZWRfXzVCVWT6/iUc/
 ES8K/Xtqk88WaiRmPXv06vR3o8A2VznLacoFcs5xI7BqjGO0ngEgnY3kwE8epaVK8OBh6wTKn5a
 3yyWyVZOj+07nR3OuMmFi3bxx/5KjKY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA5MiBTYWx0ZWRfX9DP+u+Exssbn
 xQH2WY9cbl9ZqhEpLH+ZMJD3DhXqF8e5HzUpvH1dcqariiYv/kaoNmoBpfYBhrA4IdoQCmXAN97
 CQccKX2FQE5t2XMMrx4tRahjo9q+RSJ7jUFwg56AbmnbVKbt3Mc9Nl9Yt8miPp88Nlf7BZxrX+f
 vbacAr3wAZ1AV5uV8gQCcqgB//nKZtq+J/lSrqbex/Jjn5GUo/u4XY2epqVM/h8/VrMIvgiOYci
 KHgHb71xVy+R/qFHGyd8RIetqOzcspdY4S7DeAZFrr5LGVMyTb6yD5OYE3prnOUNEbq1kTFzdsI
 ElWk/D1OvY6GITBn9K5SQtpjFbV54TMlen9drHnjIpfZ6rhhHGl3Ko9Ov7LAAh6KXjiGOHE+ZdH
 M2ktje/krEH/o8yRUT1C56zjTDNYNOjmHSYB40LMwZAp0xtAYMXPoV22UW7++NPrnPuOZqTDlMn
 0wqTQwelHj0SSq825yQ==
X-Authority-Analysis: v=2.4 cv=Ju5kP84C c=1 sm=1 tr=0 ts=6adbeba3 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=X8-H6Saci9yJdrauny8A:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 7uVcIHqmDNm8CDb022iaEafne_DOl0T1
X-Proofpoint-ORIG-GUID: 7uVcIHqmDNm8CDb022iaEafne_DOl0T1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230092

Binding the MDP5 driver again, after an unbind or after a failed bind,
corrupts struct mdp5_kms. On DB820c, binding it after a failed bind
oopses in hwmixer_init():

  Unable to handle kernel paging request at virtual address ffff0004d411f9d8
  pc : mdp5_kms_init+0x264/0x7f8

Since mdp5_kms is allocated in mdp5_dev_probe(), it outlives the bind,
but hwpipe_init(), hwmixer_init() and interface_init() still run on
each bind and append to the hwpipes[], hwmixers[] and intfs[] arrays
without resetting their counts. The second bind writes past the end of
hwpipes[] into the fields which follow it.

Reset the counts when the hardware blocks are torn down. The blocks
themselves are devm-allocated on the MDP5 device on each bind and are
only freed when it is unbound; that leak is left for a separate change.

Fixes: 1f50db2f3e1e ("drm/msm/mdp5: move resource allocation to the _probe function")
Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index 3934cd060b27..085c23820f46 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -570,6 +570,10 @@ static void mdp5_destroy(struct mdp5_kms *mdp5_kms)
 		pm_runtime_disable(&mdp5_kms->pdev->dev);
 
 	drm_atomic_private_obj_fini(&mdp5_kms->glob_state);
+
+	mdp5_kms->num_hwpipes = 0;
+	mdp5_kms->num_hwmixers = 0;
+	mdp5_kms->num_intfs = 0;
 }
 
 static int construct_pipes(struct mdp5_kms *mdp5_kms, int cnt,

-- 
2.47.3

