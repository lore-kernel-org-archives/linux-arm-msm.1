Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792769515;
	b=MaMEEWM6wUBiHb6ilGjf+/oEci/OiFgdE/uuJp7omjcVbFjHFAS8EBpbOCCifWEVPAHm
	 XqUldhnfP0LyvMNdfiM71hWKgAez9AbhCPqmKWDm963gNjbTkBa00+d8OYGLvG/fdP7VG
	 IRaoOyGZovbjqUcYe61SyZAi3kkOc8Nd5qG/FtBGWLHVUwjQmSszNx1Eu+Od5dB17sRD4
	 7dJqvsDYXHPuIe/w0cmPbar9tv/0wgH3MRRBDWGljI6ILqzRzBJSA5flMUQwplwi5pdKb
	 ieECQ1Lfth2SdHQsCKu2nHOb1r8d6RQV7Ryo2ZewTed63Hl+V4YZEIzEoGthAO30Wuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792769515;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=AOmCgi0lHHtX/LZVSXe9KQ6W21nQTpASIrTek+rkrBY=;
	b=YumyCXMmIpeObDzWFjt5KZdLyclSBzSGDSLfs2IYMmZ36UZAGfimillO98KLRwOtcZgZ
	 oTZU4HOz+tDSOonQFnaJ8BRBOpukEUmejofARYqVYFuAOAqEsJvIXyDvJIzd704OUQEwc
	 CIWDQWtcnjRyzVxiofpOxb4zDZm4Nz65RVT6W/NQJIrflbWKE51MtVgVtgg0JcNjbgHpt
	 wp5HuEDc9VWKpcQyHfPziriEoQ8lFyOR4j4SJu2uC73uIAfYoQOEO3bf1ZNNHDux/BXjV
	 yB4BR9iZDdCpi991uucqHVU4juuWzvXV4B9sS6/PYR/KJiBCTf6eYU8GLUa3xu4OUxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ev+b26Ei;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IjZiZMlX;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 281AC60A2603
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 15:31:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 281AC60A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ev+b26Ei;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IjZiZMlX
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NE6D2T1955177
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 15:31:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AOmCgi0lHHtX/LZVSXe9KQ6W21nQTpASIrTek+rkrBY=; b=Ev+b26EisJVddRi7
	hEWpF7gdn6uWqq53CisKKZVna5nbZDDJyHhxiguJQkYdghEis/Njg/2ssnrfverJ
	VCCA1C2WOTMqbN9HbxwHCZL3NUPa9tP7kOCGihTlHp0nmcGTgSgO5jdr5tbrGIEN
	Oa8ip9QjZYC8XxF0saLSPVTiec3eoMBZ+AN2cJIuGTY0HazBssN2rLibcy7UXOVj
	HmGSq8WYdp15BpMilVYY8l6L1E3gHVtWOnvPHsLOmLHnNLJW7ZO7TEci+cNLY22k
	SD43i3HnZbSxYN0I2B/S2uz5M/7OQXb9WRu5GbKd0hILxpTk5GDm9Ldohugr0C1n
	7SyIsg==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmbmbv1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 15:31:54 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-9907539aff7so894122241.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 08:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792769513; x=1793374313; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AOmCgi0lHHtX/LZVSXe9KQ6W21nQTpASIrTek+rkrBY=;
        b=IjZiZMlXvlP0V4ONIHxJRFhyUpHDEQHJg7tXHdQj0Ot0wLNhI6337sAwaoAitmQwyw
         WmZv0+gc7x2BGa7FxYoJCRiHZFzadU3ACvU7w/6ou1JXrU+JPJ18CobiMKpIcAvD5G4o
         Ge/qfAKV9qHsNraOwBY8v7Y60DLnIXotx97LlPEQ838pBB7hPQgcH0b28Ksmm3pjl4zf
         X80ArnS5Fsyx3a6TP7zBtvGOwRxyY1jFqjDRKV9X8kHahTIyCfa7qeaksDdhK/cheKNB
         i7bmMibIU8t9HEmNljv905Lad8F4/oeKCGNGmrXQhCv0YV3Xn9jCOaN9GkBT9JweXgED
         L33g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792769513; x=1793374313;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AOmCgi0lHHtX/LZVSXe9KQ6W21nQTpASIrTek+rkrBY=;
        b=P3DUGjnDeMTLhu7JbHCvr0UA7adenGdiSnaFNqC1TKhlwibNxIF1wD+J83LAirlyoZ
         5CxFIv5l2Yg+jLSDbRi877azc6+wvj7PEhtw+jCnCpmP6A3tMHx5mH66Yt8XOB58FMfQ
         l9nEzViV+dAv7FgQBksYID2o8VomOio7eBpm9DJ76RA3dMtF1qihNPsXyCSHJqklp8tB
         xGxQv2mHvw6tZvWLK3jUZ7etgPaexKE6Plxi2OQtQmg3/0YArDMBIKt1swcXWmgO4ht4
         AGuincrUSPerJDu7QLVDcumPZamweg9kcYhKhzddzrkpsnbbsm0UcY70p7/2upP3wKf8
         sUFA==
X-Gm-Message-State: AFq9FYIYqGb61SHCf35mrAAfPOfb+hqFKeoCjT6IzzLJFhMlcpRLSS/A
	o9bSm3JqIhbdp2SVtpmXHwNh2O+o9COu0K5Uv4r//1Zgp0Gc93TPxZlxpH2P3A3GXjXUfBc0ZgO
	6GuOeyikp0rtPfJh+UarXHGMQmxvcwIDTH31JCtOJSboI61nQtcQmCNumYgFFVmBxvc4c
X-Gm-Gg: AYBFou1yf8ZEzQWCB+Cs+ZdgjajkvQhsEyKXIYl+J/l3fLMhW+b/wP3U2bzrjR+eB5j
	LRuUCjjaVU6EFznOJnZ7ZYbD8i4n7A6rUJcwDBFa3hqV75/jX4g+97WvPujMKtR0hHQq7fBHpyJ
	DsbER8txpCjsDfucmcDg0un9hHsSUoPTrEvCK5kconbKMV7T2MSsAIme6FGvPQTElLaiEZHYK/f
	zH/gmnvUY4eEP7I6IGvbTeQye9V1mGPnP9UrjitUcw62BvYQ+a+uuVgxkp5CQRNI6cwc/B/bYQ2
	uv0R2TgTedGiCrl3zStdFrgLDEHHqoSevE3i+c5IenUtZ5eXJFk5L/c3T5EWsWVxb2zgrhfhqAX
	HXbFdgma+XDJA1vo+U3WVDk/iRjlC+CnyXiv5RST8Yx3bnRNruh4b8N3GpO31u2/9R1TgLo1YtD
	XAhaJRy+jB+ud5
X-Received: by 2002:a05:6102:160c:b0:7cb:bc5e:7d9f with SMTP id ada2fe7eead31-7ccc31ef7e2mr1097930137.11.1792769513459;
        Fri, 23 Oct 2026 08:31:53 -0700 (PDT)
X-Received: by 2002:a05:6102:160c:b0:7cb:bc5e:7d9f with SMTP id ada2fe7eead31-7ccc31ef7e2mr1097893137.11.1792769512912;
        Fri, 23 Oct 2026 08:31:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb0288806sm478062e87.55.2026.10.23.08.31.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 08:31:51 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 18:31:20 +0300
Subject: [PATCH v2 05/14] drm/msm: clean up after a failed msm_kms_init()
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
Message-Id: <20261023-msm-kms-destroy-fixes-v2-5-83727c122de7@oss.qualcomm.com>
References: <20261023-msm-kms-destroy-fixes-v2-0-83727c122de7@oss.qualcomm.com>
In-Reply-To: <20261023-msm-kms-destroy-fixes-v2-0-83727c122de7@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2787;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=AzyBqQgyuR3fL1mDrTwzGfxEu1JDwGk4Yz8+Ubw/F28=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq233T94rZy6mVQWxm3EZ+NtsUq6L0GgOszA6bo
 tTTiXV5Gh6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatt90wAKCRCLPIo+Aiko
 1RU2CACYjmuPKFiNw4WivWJ1BYX+JPAv8JUi3fHmWkhOmoz9Zqmws6HtzGkKbS1Bnh1ET9i5csn
 SDrS567mfGvbF+m0np74+1CRUbhBDWfaAr9IOmvMgrNhnMdm0huZet+En2ZHrkYho9tLea1U3Mg
 emYAqEXV3+dsPNqtPbq5K59QBqjHuq7DTyIZbvE0gxBAjN/KYDIBKuUeaPE4q4v8NeRAjSZDRqp
 22Bh22MvoX6dPK/F6A7h8phVWKkOWGFBJq2XHEko6ARovPi+PyvogSPApH7hl1O/imSlNXgUbBj
 h/DGiKJ1Sh5K0D8hqakzDG8sQjz35ZOkJ+zqNe01gMeDps4s
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2MCBTYWx0ZWRfX+IeROBbHW7M6
 1kpAZFrtufkjpmBMZdgYbPf1FRMzQ0A90FWKwB6kgVGoBNNsqO0PMSi/AUrgh1E3OiiuTaIpX0u
 mx4b/cHcGGNNNnHpGFmL3sirQzpBvPI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2MCBTYWx0ZWRfXwltLAIRlM3Sw
 28bAqZnhlE4e0JAREwi8fO51xX1KGjh74EWMC9lI1oB48tiRQMfvCu6bJqL1tPiJtydnJdFjElW
 qRsdb5XP/hujpOltE3ykNOTjsuxgsQdI4tRNnmnCOnT0STgrPDEhxRrGLttjN73sDK+6CzzbLAU
 94adHfy4PbnWulGEieJkvsminj63Ow8wQPmKW0vdZAjc1erh2NcvHRb1IBboJiomJNgxnMNjjAV
 G1LNa8oQNKINPJaVz+RW3wS4GZc9TnLcFyxgveUi5ftCPWlC6aLPQId7dgsewRAIDl0Bbm0T6UT
 +n1cw8cpnNE5YQ2EST0RfajNe74NU2v1Q9m4ZlYGsme2y6onxG+O+XGqs0ta1MHtOjCd/R09lnJ
 sYjZ7/T/av0j6QJ0yM3ZTOKYOUnR7sWmUMOcL7rkZVxtUWi8K5DkyNnEToaTv0sdZkWt09DIHJp
 NYDSkoR4AF/TzbSTRXQ==
X-Proofpoint-ORIG-GUID: OApf5kNWI6jRDaqJnjOB_PnSknRok-Fr
X-Authority-Analysis: v=2.4 cv=Nt1E4MdJ c=1 sm=1 tr=0 ts=6adb7dea cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=MHPtEXvVaziToaNGM0QA:9 a=QEXdDO2ut3YA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-GUID: OApf5kNWI6jRDaqJnjOB_PnSknRok-Fr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230060

msm_kms_init() returns early when it fails to allocate its workqueue or
to create one of the pending timer workers, leaving behind whatever it
has already set up. The kms drivers' ->destroy() callbacks still run in
that case and reach msm_kms_destroy(), which passes a workqueue that was
never allocated straight to destroy_workqueue().

Tear down the timers and the workqueue created so far when
msm_kms_init() fails. Until every kms driver has stopped relying on
->destroy() to clean up a failed init, let msm_kms_destroy() skip what
has already been destroyed.

Fixes: a409b78fcdf7 ("drm/msm: move wq handling to KMS code")
Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_atomic.c |  1 +
 drivers/gpu/drm/msm/msm_kms.h    | 20 +++++++++++++++-----
 2 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_atomic.c b/drivers/gpu/drm/msm/msm_atomic.c
index a8babf1dbe0d..c26b0c7acdfa 100644
--- a/drivers/gpu/drm/msm/msm_atomic.c
+++ b/drivers/gpu/drm/msm/msm_atomic.c
@@ -134,6 +134,7 @@ void msm_atomic_destroy_pending_timer(struct msm_pending_timer *timer)
 {
 	if (timer->worker)
 		kthread_destroy_worker(timer->worker);
+	timer->worker = NULL;
 }
 
 static bool can_do_async(struct drm_atomic_commit *state,
diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
index f25b31e502d2..ee98393b9855 100644
--- a/drivers/gpu/drm/msm/msm_kms.h
+++ b/drivers/gpu/drm/msm/msm_kms.h
@@ -175,7 +175,8 @@ struct msm_kms {
 static inline int msm_kms_init(struct msm_kms *kms,
 		const struct msm_kms_funcs *funcs)
 {
-	unsigned i, ret;
+	unsigned int i;
+	int ret;
 
 	for (i = 0; i < ARRAY_SIZE(kms->commit_lock); i++)
 		mutex_init(&kms->commit_lock[i]);
@@ -188,12 +189,19 @@ static inline int msm_kms_init(struct msm_kms *kms,
 
 	for (i = 0; i < ARRAY_SIZE(kms->pending_timers); i++) {
 		ret = msm_atomic_init_pending_timer(&kms->pending_timers[i], kms, i);
-		if (ret) {
-			return ret;
-		}
+		if (ret)
+			goto err_destroy_timers;
 	}
 
 	return 0;
+
+err_destroy_timers:
+	while (i--)
+		msm_atomic_destroy_pending_timer(&kms->pending_timers[i]);
+	destroy_workqueue(kms->wq);
+	kms->wq = NULL;
+
+	return ret;
 }
 
 static inline void msm_kms_destroy(struct msm_kms *kms)
@@ -203,7 +211,9 @@ static inline void msm_kms_destroy(struct msm_kms *kms)
 	for (i = 0; i < ARRAY_SIZE(kms->pending_timers); i++)
 		msm_atomic_destroy_pending_timer(&kms->pending_timers[i]);
 
-	destroy_workqueue(kms->wq);
+	/* the kms drivers' ->destroy() also runs after a failed init */
+	if (kms->wq)
+		destroy_workqueue(kms->wq);
 }
 
 #define for_each_crtc_mask(dev, crtc, crtc_mask) \

-- 
2.47.3

