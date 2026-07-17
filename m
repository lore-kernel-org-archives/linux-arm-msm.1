Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 624F13A75A3
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 20:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784321362; cv=none; b=ZZ7UaQ1Rb95u/VtnTR97n6F6nffVYszDy4GmIgCImqax/xg8oi7Y3ShZS9mEOFgUzn+WDLdeAhdNuELTK2fZ3tSw43112X/UrVUCb/SqDZj85Sqaa0iMbMF1KD035WdMxISR3jAY7lOFT0Mge0qiQ/x648idt7rCOAWhHBs0rUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784321362; c=relaxed/simple;
	bh=+8OgFO6VNJ8TsixnL3Bkmbua4zl1BlZxa3GBrY+qUZE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jDmwbBkHsPibAjGbVOSMO2ycZ3aaF8jxuhTUvjnLI9cCw1BOxHvYRQUIyTmGyOQ7bmz0fzfByYAfvMEol4ylX7gF+6WOKxEgFMzlRoT6zOBwSM6rpt1inD/lJRIIrFHjJ/P4v6NCBgI7WJb3G6dz5ht5UG7Sp7MeE2zRiULf9u4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CkuhYW2M; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IRVBzcHz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CkuhYW2M";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IRVBzcHz"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HJtlO82883782
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 20:49:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=rc/ljxoshAi
	Nv4QJKXYpPgimbLWzx8XhYbA7LeAuwfE=; b=CkuhYW2MFx6PieJDfPOg1vAxRMi
	lQuODqYGR6MgKww/4cqAPa2xFIYsjXOu839fbOctmFjK2ZxudHzue/81/jeT+wTn
	Ok9nU/YlgDQtFksVD+75JqrGn0bau1dUV8bMZv+IdsfkmQ5Us405JfWpWSsIoPjm
	ttYRpFT4hkXOw1ppDCawJjuIJj2KZP/0uOHdjhieY6FUwBQRv00MHu03ma5fEPhl
	KvR3ouJDXaNEXpIqemY1Gy5JRofm0vNdNIyBDjU4Nq62CGtVwC+TzVwf7Sj50pQ9
	nlEAP+maVneTbZtghXN0tpiCcrHnfC0VMn8e7AXxW4FGzM+uq1FRROtT3ng==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ffrqd8ry7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 20:49:15 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c354050c34so130020155ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 13:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784321355; x=1784926155; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rc/ljxoshAiNv4QJKXYpPgimbLWzx8XhYbA7LeAuwfE=;
        b=IRVBzcHz71x9koy3S32eCMdQrtN5HuU+rck41SEkLA5hxHb8wOnJR74gfyrqsb056O
         l6mkjcimnR/ZQZ+wPvRuEo8oI7H1XE2KAu2zzNy+NSnTlruyhuV6z80Maunhq3q8bToN
         d++jUyO++5PxFeS14nSSTxpXp6V1OAH//+E0DASfSdCGSpjuuXgS7B8n0uAierUDGhz5
         JPgQB5rWd7p55uiu9OJmaGDwHgmGS4s8nmQpgCZW9yEGaSYejJovgWQhjkoCaIDusDPY
         1gSRLK0OkbsR/Ui/JVr/ifTAanW01GhkiC9ZpL4bgFcjGLwBvf/tHBOnX0xOGqO+V2V9
         dXVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784321355; x=1784926155;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rc/ljxoshAiNv4QJKXYpPgimbLWzx8XhYbA7LeAuwfE=;
        b=jsHmjEO6ZcJimbbaf9QixUXmAPsO1+A04fxzhiMQy0UZe3CxuPV2Gde1hn6RVSWoOV
         3RTeqc8bYajOfJEKwxnBHaUJ8hBSkFGytdMNgLcvOPxQLAf4EbCRCclzBuuLhKOt/UqJ
         /PN+ayBPGVuAtPc7xLrjwpkEkY3SUkucgv0/5xiR1iKdoFkwXpHMk/FI8dLMrEE7gHly
         nAZjEO9ymLE2Sd/UT51YPQo3HU3h7HhOiLS4hMOY1FDMMejvNpSmynfoYaR1pLSwitYO
         8crtrHAYHQHiolC7/ObNxv9fz8hpgP2wwgcNkrYu8Ek7NRa1asjowJYP2fgDcxToXWRy
         9YUw==
X-Gm-Message-State: AOJu0Yy3/rk4nk7k/1Ug22cyQ2zwHNz8UP8nzd+UBuVURgxLUSIe9gIz
	peveGSknkR0Nxem31++LJfdG4+vnnIJjzbOvqIXZPlmVAZkELb0AtCwFRkUIUQaZsaVpyHN3hDv
	SIGegRgd9Az8a1yHvtRILgKG0IYIq+XWxM8BkieIXdplOqP9eNgc0ylZMlZG2hrvpGrC3WHI3x9
	cC
X-Gm-Gg: AfdE7ck+Oo7n/f7RDGOOY3uemJcXFOXkDikbDphGZRtgOz4+moqiyknrRe7wOWOooyt
	Wt/8ZmEWy79RO4MrKLafwEP1ZDd9rFyiGHSxfWZTbb6y09RF1W6L2uVUDFkl29CFfS0hTp4M4Rc
	sray2zFucUtNmaiEbLN2ZGheEj+piApdfN6MEK2FdlvSpBtLlDLXUzE/L5OXbxzyR2F+gZbuAC7
	aHZ3PHz0W7YOAkUnT3WJwzGS02hAHlQGm/Y3oh9ce/0Pjzd8YSbreYcTRbEgiXvot+D3zl1Kg7u
	E/mkzer8fA0T0eSyGcTCRpF77OvCwo4eQK1WRYXtY45WMSEl1ZDX0Q0eaXN9bXy5tar032EKxSr
	PQjvwjx6+5EI45HxmIXRM7zMeMQQ2fKLJBCiwhFyMBtAOOtE=
X-Received: by 2002:a17:903:1b6f:b0:2c6:a172:55a6 with SMTP id d9443c01a7336-2cf3481df5bmr48572745ad.9.1784321354909;
        Fri, 17 Jul 2026 13:49:14 -0700 (PDT)
X-Received: by 2002:a17:903:1b6f:b0:2c6:a172:55a6 with SMTP id d9443c01a7336-2cf3481df5bmr48572335ad.9.1784321354470;
        Fri, 17 Jul 2026 13:49:14 -0700 (PDT)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf347165b1sm16750405ad.60.2026.07.17.13.49.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 13:49:13 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Sashiko <sashiko-bot@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v6 16/16] drm/msm: Fixup invalid overflow check
Date: Fri, 17 Jul 2026 13:48:32 -0700
Message-ID: <20260717204841.26120-17-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260717204841.26120-1-robin.clark@oss.qualcomm.com>
References: <20260717204841.26120-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: SOYpsbmEjyJRWm0wFhD7FNHd2V3wX1Ju
X-Authority-Analysis: v=2.4 cv=DbYnbPtW c=1 sm=1 tr=0 ts=6a5a954b cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=19Wyn7e3V/0aNffMjNCMQw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=uVkA5J_fsNn9jy38BCIA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: SOYpsbmEjyJRWm0wFhD7FNHd2V3wX1Ju
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDIxNCBTYWx0ZWRfX/0U5AaziRypo
 ZGA8glWbEgvxkT1H7dJ1porIP+/5HRpnQdNvoX2OhpSZTYrNWe7SsaB5CFwrfWtnceJPjKTAuwh
 AuiogYglGy9nBj54kpNu7vqtmc/kBPg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDIxNCBTYWx0ZWRfX4MnQ79p5e9nm
 TfFkxHPU9vE+GzRUjY4PB46aFVWDYl7aN5VNFoc9UKNDmP5I6dcnVubsqH98vg/ODrYxjWlQERq
 +JHlO8pak12X0It+lnaOtlW/e1NFMLdeUQNZfYqtBRiWgE9NQUIw+4hYT9d2b8AuDRetmQYZA8s
 G7PBn5Ii+Fo7q6BsI9QzEHIDWWIT3D3g66WR+ExB/utsKqiBBi83ICYlAQYLHMBTQvD8YAMdEiW
 Q6Mn8YC2O/gePuphar6s9NSIoHjYyin9oTApf4EdAbCc/F5lA5ln17ESjPLKmSxmjAgDyBMTqsX
 T5y0GsLoKUMzJn+EzizRQZveNUWdEqijXqfYkKFGWAfpnAJNzZWs9ppEpbI8MNvoD8H0tEg2M7t
 ojTwKXIZR+X6mDqAbaSyiyKNGhtaKRBmq5iAQ9iEJbKf+J7sLYzgWCeera2++cwN/a462dA/eXj
 M0vpaCPZDhyOsKChGQg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_06,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170214

On overflow struct_size() would return SIZE_MAX.  But kzalloc() (and
friends) check this already, so we can just remove the check.

On the other hand, we should be using the overflow helpers to calculate
the cmd array size.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem_submit.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 6b0bee6c39bc..5862db05297a 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -36,14 +36,11 @@ static struct msm_gem_submit *submit_create(struct drm_device *dev,
 {
 	static atomic_t ident = ATOMIC_INIT(0);
 	struct msm_gem_submit *submit;
-	uint64_t sz;
+	size_t sz;
 	int ret;
 
-	sz = struct_size(submit, bos, nr_bos) +
-			((u64)nr_cmds * sizeof(submit->cmd[0]));
-
-	if (sz > SIZE_MAX)
-		return ERR_PTR(-ENOMEM);
+	sz = size_add(struct_size(submit, bos, nr_bos),
+		      array_size(sizeof(submit->cmd[0]), nr_cmds));
 
 	submit = kzalloc(sz, GFP_KERNEL | __GFP_NOWARN);
 	if (!submit)
-- 
2.55.0

