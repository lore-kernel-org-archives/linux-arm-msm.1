Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793815185;
	b=LM696kMNHNYpJZmGBd4V8zS9XfZ4BQDjHbjl7mpXMPEXkDwqtUwOi2FvjfJ+lIh/TWUx
	 Isk7P/RzPZ+ELDYkuwfyqFKwS/GiLtUe6fDqnHA7BHw66saXT+7YGpC3+STPP+2y+7Fw+
	 lH4AplbRzeb8+3klglIbveqscGAWZfQ+vGEZkZ5xsEMhbUBTWQdJpAPG/sXSn0EgKYT2Z
	 zuagdWDaXYjOdzaa0Y6fFhvTh74rZBArvP+6ZM+tUfaeyDuoS1yxB0afRr4uvWq0gvqbP
	 djCWqB11gNcINWWj3+r0ngR6PL2Z5hiYQqK4vCMpxZw8YGEYPEs4ME+adIoD91otn8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793815185;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Da7a6+qQq19Xl3Y3nz2zVJieAU0gyascrZ86Q+lA+L0=;
	b=2DkWTpM7nxuE8fgovdCyJfT0o4SuD/A0MkFkstK+mFAnDl06DD8vIO0mGA3fDGSZWB8R
	 U/+4mMGmPjrUqaBOM/ZeHbhLdbgqInwmkFR13eIgRjsXvmJNu9aazwyz0Zs8f3vaWNOSr
	 MTOh6pHjFGezi44gIE98SmirmvB8LavO0Ml8XY/cnz6uCAxAjyn+LsdfqgkVp7fkNOi9L
	 J+0uKLRCaGK8Luv2IbLjZFqRBH5TyQDv47Q/m1Guaeub7h1c5GpxWqBF8pH3w2NFZOKN1
	 b/6Jnsm6a3BSRy7/WbhMy66cpykfdNNjOHZfHBhODiI1RBO54A9oxg3U+OhKm1Q0oEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=L3hvFHTV;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dbdgv5GM;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E34186073F49
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Nov 2026 17:59:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E34186073F49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=L3hvFHTV;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dbdgv5GM
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4FipZX1292213
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Nov 2026 17:59:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Da7a6+qQq19
	Xl3Y3nz2zVJieAU0gyascrZ86Q+lA+L0=; b=L3hvFHTV7Tp7RMiSHKqliC3kzxy
	Z1WbFvYJhax5wxBWUWzUe2AKIopJxDC3MvtAmcYUXppFp7RsBr44KaYZ8Z18n3f5
	DPih+qVQQnxWZjm3zgORWreA0cpWykmlYSt9kziczI/Osn5XJ39GSj4qAtGvbsvx
	KWgZwg7cgb9sjeXIgoCzhv7HFmkErn1gW5ZXbLIWpC4pPYDGoPXxTKpqA5f6lcsU
	pIvwZ0mrRKft8tevilf6LKeZhPK3a/RbhMJMVKm+4IC1cEQA6IhA2x3a5j/3YypG
	YGG2rcoyU6/wVWknLy/AWEGFaMUEFSS6HSAJk7c26kED2XZvGdABg61k/HA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr163jaaj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 17:59:44 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cd0cf3b1c70so708053a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 09:59:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793815183; x=1794419983; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Da7a6+qQq19Xl3Y3nz2zVJieAU0gyascrZ86Q+lA+L0=;
        b=dbdgv5GMmkzkkqJTCyW53ZWkdmHT2eyRO7KbebWJOMyxLIZmRxYXN9L1I8zzWTkhHg
         G6Rjdr8pKdr8rmyo9mQxCMx2Do+wzeK608GnecfDor49ym1WYRZL2lWoL/LuU6zO6wuM
         cac0bM6jCohBzl2iCNQXnw1tidDLZ8MAD4KFGGXhZyJOMJNto7Frd3m3EfyuHBhn+iL3
         E8EjTdZzxLq15/vgU1mREHrJFsgeFx2xO2h2kQxYBmECEKbzU19brYEsgR6aZlGCls9U
         37O98DLBMzf9GCT2ee6ty7/jfki8R7BsUAAQiCTE9vjOQ85+lnPOOZzxlK1S8ZOjziz5
         BUwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793815183; x=1794419983;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Da7a6+qQq19Xl3Y3nz2zVJieAU0gyascrZ86Q+lA+L0=;
        b=gH1c0pfN8j8KEI2MmCLhEljGCMq/rf0cRIl8FvZ9HtUWGY/ywoGf1X5efi52tiHgcR
         QzWzvVf0h6kTl0Egfy8IJux5xloSKfWx/d3D+I3js3Q/8phsmtZEvPYJXlNUNgBd+xCu
         K2B2v2SfWX2T5RTyl1urIp9RgicEuIXPsVHN2m6xzQs5Ahplb0HwO3zc4XAMrpuiIoMJ
         esThJ+A1FAtBk2DaV7/zA+9nf6eWgvwGYUKc+aMe9c59xzTlsAUgZpDSjy/JYsp9P8t6
         SOzm0EeZaB0OkAN2lxBAlE62qWR0BophqfQSpc1wKZHAS8pmg4s4/Ghh5cMEBSsvm/cy
         ertg==
X-Gm-Message-State: APuU4Z9pVoQCUIbFVnZugoFKL+tqATFbZfX9YhDRQLOztC7X56qtZJlb
	dJN7bOfNS79gL2JqV524bYfmpH78JrrhqpisEQdOj5ub750ZMRvDFNcr/Gz8sx9iAf+Jw4tSmNR
	7d4l+tjX4EZ/nga81JgySdDd0YXQ6DDk2F1h9C53gT7UhQCvJzFWxU8sYNILjyK2tfosw
X-Gm-Gg: AYBFou2ie3JTELOveumThB3wM8HoPzDTzgNkRVYjNdhkL6VIieccD32GdZF4BifjRUb
	OlWMmYE8Qr6Id8b0dKPNGHgwH3dgwMc0qed0lF0+LErN1qBDvH9VLY9jHkG066Ty0JZtbTtv8T8
	3R3zZL9rfUPB8zK+x1imC0Rt7RSA+xUPTHwO19k0i0LrSl1lApHR0rp6xgj+lJ3GwLFZRYVbK3d
	EGN9YHaDu6/jYHtYt7OpP/fS6AD8jvfQH8dioP5CMlC57FHK3L+tMRyERgvT9gjulLCkwmpp1/O
	HXnqazApuhWnMM8E3n+3oB3ohc8I8I5pFLin/WIv3GyclXtgX7FStos/eQoDtbEzFF5NnyBsLA5
	aS/CRTNjLPTPQ1yIjb6RLZ0p/aSX2IfLGTKWP406pMvIah4FQcbro/DhNvKhao6FlpreLpwuc/t
	k0oqzCL36Hvnv7K8In9o0Y9sUiVBIptor9kSJkG/LqpYQK6wCNaWKC2+NB3Q==
X-Received: by 2002:a17:90b:570c:b0:3ab:e588:c288 with SMTP id 98e67ed59e1d1-3ae897ccb52mr14991772a91.11.1793815183540;
        Wed, 04 Nov 2026 09:59:43 -0800 (PST)
X-Received: by 2002:a17:90b:570c:b0:3ab:e588:c288 with SMTP id 98e67ed59e1d1-3ae897ccb52mr14991749a91.11.1793815183032;
        Wed, 04 Nov 2026 09:59:43 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b3163383sm48912a91.7.2026.11.04.09.59.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 09:59:42 -0800 (PST)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Anna Maniscalco <anna.maniscalco2000@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v5 5/6] drm/msm/debugfs: Use cleanup.h for gpu state dump
Date: Wed,  4 Nov 2026 09:59:25 -0800
Message-ID: <20261104175931.28475-6-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: XVfk2cwofNY_fgbvwoIT7QE7sJOcVowA
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA3MSBTYWx0ZWRfX0GBc350FYN2F
 kYcx6RFT4P+sXdba7IzWVK/+tzL3D0c3eMxXkbkGMa4YRMx+3ndg7SuJ3rLzTnZmt2osO83mHwP
 CGnYxErd22We641l4+NiDljHqLtAi38=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA3MSBTYWx0ZWRfXwjSoGOiAIyVj
 rhYXALoRD53DH0cYtl6dmlUi9nDonnq8mu8yoSepTCuMQJKIvC0lMSMphqeQm5gQ/5IlNBv75Nx
 CYNXbetGauE0wf0/F1GtZXYo3FSV82zM88dUgBaiWSDQh+Vo1sc86QObMHygZkYx+n1cm3Eu4cj
 ZbJafgkXBqTRWwEiuJqkQbAFG2ItTKGHm1CwbiiG9oZ5+3gO9ceznyu3T/zRHDL8n31J/ytC4Ui
 5o4VbCmNjrvik7TfkSufQpQi7qg5N+mn9lzlW3SPio/4XErTN67VVJ9Q75t0w0VJu+B4BCkoOFU
 1iF4XkyuTxQQY8i2Sao4dzimUE17Y7OgxN49iXfxQrcDzJyeuPIzU9e+kUChGUTRNWZWINdo6tg
 rm1TkRHnfKUxFyZjRGnT4piLinnAN81Mm2uXMMEP82vzAoSceBhKMydcnT6X+qga8bkJgYrzYwb
 0WTEBojrq65b0rEaLRw==
X-Proofpoint-GUID: XVfk2cwofNY_fgbvwoIT7QE7sJOcVowA
X-Authority-Analysis: v=2.4 cv=O5OsLx9W c=1 sm=1 tr=0 ts=6aeb7290 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=IYGNqqR_R4_3MQmAMmMA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040071

Use scoped_guard/etc to simplify the error paths.

Reviewed-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>

Reword, we are no longer reordering locking/runpm
---
 drivers/gpu/drm/msm/msm_debugfs.c | 31 ++++++++++++-------------------
 1 file changed, 12 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_debugfs.c b/drivers/gpu/drm/msm/msm_debugfs.c
index f12701e286ec..136029025b80 100644
--- a/drivers/gpu/drm/msm/msm_debugfs.c
+++ b/drivers/gpu/drm/msm/msm_debugfs.c
@@ -70,43 +70,36 @@ static int msm_gpu_open(struct inode *inode, struct file *file)
 	struct drm_device *dev = inode->i_private;
 	struct msm_drm_private *priv = dev->dev_private;
 	struct msm_gpu *gpu = priv->gpu;
-	struct msm_gpu_show_priv *show_priv;
 	int ret;
 
 	if (!gpu || !gpu->funcs->gpu_state_get)
 		return -ENODEV;
 
-	show_priv = kmalloc_obj(*show_priv);
+	struct msm_gpu_show_priv *show_priv __free(kfree)
+		= kmalloc_obj(*show_priv);
 	if (!show_priv)
 		return -ENOMEM;
 
-	ret = mutex_lock_interruptible(&gpu->lock);
-	if (ret)
-		goto free_priv;
-
-	pm_runtime_get_sync(&gpu->pdev->dev);
-	msm_gpu_hw_init(gpu);
-	show_priv->state = gpu->funcs->gpu_state_get(gpu);
-	pm_runtime_put_sync(&gpu->pdev->dev);
-
-	mutex_unlock(&gpu->lock);
+	scoped_cond_guard (mutex_intr, return -EINTR, &gpu->lock) {
+		scoped_guard (pm_runtime_active, &gpu->pdev->dev) {
+			msm_gpu_hw_init(gpu);
+			show_priv->state = gpu->funcs->gpu_state_get(gpu);
+		}
+	}
 
 	if (IS_ERR(show_priv->state)) {
-		ret = PTR_ERR(show_priv->state);
-		goto free_priv;
+		return PTR_ERR(show_priv->state);
 	}
 
 	show_priv->dev = dev;
 
 	ret = single_open(file, msm_gpu_show, show_priv);
 	if (ret)
-		goto free_priv;
+		return ret;
 
-	return 0;
+	retain_and_null_ptr(show_priv);
 
-free_priv:
-	kfree(show_priv);
-	return ret;
+	return 0;
 }
 
 static const struct file_operations msm_gpu_fops = {
-- 
2.56.0

