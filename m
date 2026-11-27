Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795808703;
	b=vykQ3hG/QH7E2rQG5b06YHLz+zN7acVUHv1/33fq9Y8xnzGd2s6eulrp3aEXznZ4+uvG
	 atj8ziMnzcO+F3LxeXGw4QmSJxb3QpNIaq/iiiK4exUHJAehdiPTaTHLKX8xNeCZhHk1z
	 Il2XhncqluOE/dUvNHiLlMUZ9R9II4w+D66aixWuGtFqh77O6vYLbUrXa6FbOX30fs5E0
	 gv/Kv/SjJgti7CIiWkAI3W+ctcVmEYEZW4RudanMIC94ByrjJvJ6ZdqAGGrgS2HsvMEYx
	 q1bENsig4liDvy8dR2vFsdntHK/+fTWhzhrU976co/Ijqh/SZwZvYcmEp4KD4najpdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795808703;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=vwHK2NwzJ1u3eOofNhjZ4qX/4NLFqQ4ZjqBKdqGu4XQ=;
	b=QJB3oVIl0NPaM3JFsmm5L6por2CMQyCJmLEaosYcKVh8HbJvO6nYzh/PL9JIT/aauWS8
	 QY4hDvcMdqTZSBSGTtMVSez+HAA6PUI1w+4nJiybU+FQlDsBtgbF5JuyJ2yhfmvm0cnxC
	 ja0bZtlUd+WyrQ6NV0Cg4ma/OkLVUECj45s9HE4fzvGvzgTifdj/rI+OsHVHRNnRXDK7Q
	 V/IvQpvILdK0m8p9eyWSkl8qu8qfpAKf4aJSjSvgA+EZgnfBNGQlwnYez+maS7R7c21Oy
	 MAfHZiVfJSVTvyHif/j4Q1ZZeVQKF0mu+6HkI5I/Hw9OEo2z89PEGb52nexNrphRmDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=diX0+uu9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gMEkN8sM;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7E9C606A329
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 19:45:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7E9C606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=diX0+uu9;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gMEkN8sM
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARJB0GC3134358
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 19:45:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vwHK2NwzJ1u3eOofNhjZ4qX/4NLFqQ4ZjqBKdqGu4XQ=; b=diX0+uu9fRpKMXzT
	2vLJ9MZrXIDr0iLqDb+gsJDZ5Y3XwqCl5tcJFAbZgkZ+ex5tx5c+zoTQNTkoqVmr
	0VkNX11TFqygWHT14kIsJ72XVLfwqSLJWpLGfkiW5OSSt8zr04lAbV2NPwHQETXa
	y8VklIAGI31pnoxcx1e6JReeCCDD1FGDFqnlAoEKQtnY4PDDJhhHwx5kiGdlk872
	hApluVY8fHRbA907fWywgO6ziwzl7m0WZ+2NTfb25+GSbE+Xrr8Qa3pfIFunIkaQ
	Az/ieJ9IbQRFin7VmL5QExfRpSoVqItm5/i9ULD+s2o8bWtslWibOTGxyXdL+gwV
	YG3x6g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j74gatrth-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 19:45:01 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-94967c6d4f4so943405385a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 11:45:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795808701; x=1796413501; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vwHK2NwzJ1u3eOofNhjZ4qX/4NLFqQ4ZjqBKdqGu4XQ=;
        b=gMEkN8sMqbIM9rA0QMTEE84kMAvO8fpPFy0HIFHT2Vj7YdheeglaDhjbG5a9KyCG6f
         P3YkJaJuPgRn1uB3ToBDuAGqSt0H9siiVvPxUALsVHZphNag9Ko6XN3sF/LK1aWZraRL
         2FgQZYutAYGnaoOP+phlrB0541dr6n7ErkP/wonxpE73DilwK6mdEeOaPKegAEVkdkYc
         +KxbqMtcp/ZMLIkTAPHx73CbTf1xbydazA9+Bxe0mbJC7YoN3PXMt8wnTvc+nAqb6nXs
         Oo04jglVvcF0kgSdPl7INR/AcSvfhWSvfnZoTZyfsD9iyCRraReowfI42+sJnVdaOrXU
         YL/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795808701; x=1796413501;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vwHK2NwzJ1u3eOofNhjZ4qX/4NLFqQ4ZjqBKdqGu4XQ=;
        b=1E1bhpPoUGSA3L2X46muD6woZ3r3pbILriEmJByC5/kkcZt/IYeXqRDuzrEDeegQEw
         X88UDKkapJqB280aD32GAPJts4wruUm/re5h/YrwPYVqMjD88edRCaW7/P4zqtISEzog
         5UFSPya4Q+eYkTzvoXarGktHtp1Yl/HYcEhPFSuFlt/cErFFbGLGccDZcurKoSVu8Ca2
         CRMz0tA846NfCCyaCMiseCioMNLDshuLN3vvwtwpxL+mvLfXFMu75HObfiX9yLxAyxMf
         kYWLdGPZYNvjEHcJDDBs9b8x14OvNpVNSqBUb+b2xHQ6SkiMsAQfoTJSaRrGceVVUsqX
         BF9Q==
X-Gm-Message-State: APuU4Z9yKFtv1EgSmINiCXMNv4pVJPAigxlr3L1t8Jd526olWrKE25Ib
	I3OxfzchpVR8ZNKnYLUuZwwnFABwEXc0iDVtbQXB+hlFHJ6kO66ZRaVLfazkPXrwW+HwNUacDgy
	8QGO0OKBUDpw00HNjQ47ayPsfz82+UreNGz/APEdRlm0+JdQ+27KVIY3q0oiOD+8uJd0b
X-Gm-Gg: AZFdTZcu83k0RYFWxccgu3ASYR0TwIFNnn3G5HcvKkR6EnNrMOjlm0YpQtbW6rhx3w+
	PDehAyrNLthdbRFogjQMqnUxDVLAJ/mjsdksYW9tnxNQcumr4uyRHh/r83zm1EOAYJlZoN5Q2N3
	zTHt6fIOxTTZ0xj1q/cd73OCylSsZfaRIkJY7R2IDae2jgsrKbI9nNiW0MeS+xVb3VgeRigGGOL
	BD0hksh0MW8ZYsQ/ZDEQAMCIDl4w00oFxnvDWcPWpH0e1GJd5fB16Q0Vi2FW0gtfkuUgSdFvIxL
	Z5tl79ZS2MAzhWH8eg5nVyKzVSK3PXiz/cWJIC1B/U0VVtwZJI8ebJsgKhVdGbIVqT4DYXyxcBJ
	z3KAnCOSpIYOmsksVL7fgd/Gkshv68IL5ZUELilL3KaKOChIgftpM8xfudr5xnfvuBsRhwklXx1
	VnlFW5SkTKJJn/pFcBsIPp+dnMjJrAUPT2x7UIakHyObqDHm6WvYSI48di7/5EeQ==
X-Received: by 2002:a05:620a:a294:b0:94a:8bf:19a8 with SMTP id af79cd13be357-94a08bf1c7amr1490675085a.53.1795808700816;
        Fri, 27 Nov 2026 11:45:00 -0800 (PST)
X-Received: by 2002:a05:620a:a294:b0:94a:8bf:19a8 with SMTP id af79cd13be357-94a08bf1c7amr1490669885a.53.1795808700239;
        Fri, 27 Nov 2026 11:45:00 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae805575b5sm59655571fa.34.2026.11.27.11.44.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 11:44:59 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 21:44:18 +0200
Subject: [PATCH v4 05/14] drm/msm: clean up after a failed msm_kms_init()
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
Message-Id: <20261127-msm-kms-destroy-fixes-v4-5-242b0a3f8e47@oss.qualcomm.com>
References: <20261127-msm-kms-destroy-fixes-v4-0-242b0a3f8e47@oss.qualcomm.com>
In-Reply-To: <20261127-msm-kms-destroy-fixes-v4-0-242b0a3f8e47@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Archit Taneja <architt@codeaurora.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Kalyan Thota <quic_kalyant@quicinc.com>,
        Vinod Polimera <quic_vpolimer@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2848;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=9LvocUvveUXjJ7V7mUbGxGyvjqVgLW4tn0dUlZYBOKg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBrCd2dA0wvEU9DrIrxbsaxbbCCnxVXZAzZ7DyXj
 aKvsL2ghKqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCawndnQAKCRCLPIo+Aiko
 1R9fB/9tiQx5NuirsjRk7yFIskmYugbCs2hiVZeHc5VjzeDtPFVOwYiL4iWj00kuHcJboF/sES8
 sxr4/E3ItLyH/Bt5vnvPhAxBzxf0UMveLrDfSXsWe3eGvCo+3pe6V46JYeC0iWkdwyQUg7Zv2u4
 Yt6lZLsjd1nQjz+C26yhnfXc3ir+YTv9va71u+ZR41mWVffeL5H2JLzTiuIZaj6VhLH6C9vwE3j
 GhHwCkclnDkUGBbCJdsuM0QylMLo9TCSI59j9OeeN78lm3XGabBZQ37zUQgap4Skki4pJAr2FYu
 d4CRCsuAVXCc+uqtFiwbSUYeyA+xBb9s0IPbsFUgpVlergJL
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: -h4efAc1iBME1HFLUniqjaD-as3rLl86
X-Proofpoint-GUID: -h4efAc1iBME1HFLUniqjaD-as3rLl86
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA3OCBTYWx0ZWRfX3O8GbCpKNNe4
 2Kgaj3xHVeE/zbsm4y4sbeewhABYLUX9WNsGnMeg6OP5vgtF6KimaK30NgOLe3iinKq+RGds6Zd
 En3Z7xdaismnm1ylaMTOf63TxjiaulAHrjG5v/longqM7aHCFrCKAAtvkc54Je8x4iPLDTsyzzR
 cTs1Ms9djKTDaAaLEAbsmk5AR4qCy7lhELMl3xwZqkgHyh28mkvDJfEkqts+5ev6dW/Hk7rInyA
 mxgR8dljeEYnxU6/mljuQtnRwCpaIc4Yvb/2+CXXmmYmOg5tGH5jfl+8/17jdAqTMovhuyFypPk
 d4uQRDq9fdN07O2fyNRtuP8qog9okMqR6Oo6IpFgPg8X1W9h6n4MxRf8MEnsgJHIIvHmIEVzf5J
 O9WImozzcCgoJFpZ+539WfQ9zg3slaUa8NJt5s+Xs4VE5Nztt2BK7XImAXMQ7UVFMEiHOE7MoHc
 cJGrCdQuZNJh33MOTYw==
X-Authority-Analysis: v=2.4 cv=I5bw19gg c=1 sm=1 tr=0 ts=6b09ddbd cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=MHPtEXvVaziToaNGM0QA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA3OCBTYWx0ZWRfX1lH3/o0mg/cO
 f4GhYUKF+fBI1oXOIfqB0RA7N5ZDS+IQZTQOjTA9wOBDvhHPqoublPIRvgv0k7NErMPW03vwYOt
 m5zMztuuWA3PoKAWPY8n3pM+VlgWeKs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_04,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270078

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
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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

