Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793555232;
	b=sz2+F+mjcvl0BL67SYgG3CYiVjLzhFks5sR7X3he1PU0l247JWbZrN7pSkyYVj9EdVbT
	 6ox6ULUILj1orTKNo1yydsJ2JA0YZVXzMT/tE4+U/WKOHReO29mNj9o1kNYk0B42ezygU
	 luIBphiJpFnDnR6WOietCWwIwSWw4D/mTe/NnGhqZHaVWxnbjCdvtSOkIx3OatjTSUXt4
	 IRIPYDkqzlgKvZnAU5lihSL2DlZukd0berlbONvfLXB1vrQvqFGd1dKI101X5nozw5PZ3
	 PH3I8HlfBQR6UDSap/Pq8dJcWsWydaNxCP70+gxpYZBAlRSoQku+pPqE19wrRrFRmUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793555232;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Y/GyDAzpwZImWFuqQSsjq6uv+RPz8GtxfDN21Tjamqw=;
	b=fI7gKH8TdJ6e0DhoEdzD20t7DGw2r9+1yZrFUPsZaLPoT8556vPvvFyMXyLBpdBDUHuB
	 oXCTO+A7h0IR905dxMMsBQgLsqVNSMmbXZQam+WSFRm6eDACendow6EX3ni4CcKFl6t4x
	 fMZ6k8vfFzilj1cfpqdQZaFnWGypXewWQLNzor4Ek1ARGMmSv83jjne5PpGBuoO35hFDR
	 76drNHpcORwn8FHfHYc9pICk8xefIIvamSlVJLkWZOcnr6gBHL7EA/MvdGKt5a/CCQ1Yp
	 4EUMOI+G86ttAtQhFrz7IOVXCTJzFhnKOmomBwjKUbZQkDjbke8AJjJkb9tWEPV8aaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HWjjGqhU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XiFqojQh;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C809606A33B
	for <linux-arm-msm@vger.kernel.org>; Sun,  1 Nov 2026 17:46:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C809606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HWjjGqhU;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XiFqojQh
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A1HQF8D479225
	for <linux-arm-msm@vger.kernel.org>; Sun, 1 Nov 2026 17:46:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Y/GyDAzpwZI
	mWFuqQSsjq6uv+RPz8GtxfDN21Tjamqw=; b=HWjjGqhU/tdTaoFLQJoSOgX7VfN
	eOPHX2/z5V2QOy+Hoye0D+/QRqBhxKc0+/tsKNlP2yrnhDt+7jzvxMCNdGYDwq14
	1lRXL93op2SBIOBnkJf+mqR7YC9ovWPThnvgap+JoZ3IbMEaRJtfhWtNeYYFaehe
	ewsYSiCLNUZbtuM6iQRwi55ZcEKWvjN1lFrDTM9DW+Y3+gT6A87waOslZDN31qvK
	zY3jS7AZL+5WBhJyfKzAkl9zPWJmaOfzG/ToUoRDOP63n8wyQ+dSHvDQyhMAWlhv
	t0PYs9aAtjiv5GCwGGJQtgnT68uoJN14ivbLTwSDGasBQi2QEt9zLXGjdlg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn9m9bp3x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 01 Nov 2026 17:46:58 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3abb4c24125so1864044a91.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Nov 2026 09:46:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793555218; x=1794160018; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y/GyDAzpwZImWFuqQSsjq6uv+RPz8GtxfDN21Tjamqw=;
        b=XiFqojQhgD7SantUsy0Q63K8B6m2uyA7/ZYiQCRJIwot4Dy9+6NrFov7axpiDatu/y
         9NI5nbfatSMKHnH+Q57s9VOYVxY8ogqf90pg6LDycYUBeA6IPWd9+O1VFihijzAhSxMP
         YSzgKr9HAoawJIE7+Mn3wsdWlFwAqElzwXs5nbSZNuLnEXDToOWJpnwX3LSsiyviL/w/
         0W8tGyXPZK+8+Tf2vZLAQe8+1GjJranGLPx7Z+rhlD/LbjoqFm3K0KdAXkCdb6yJOQLO
         FKM15Oy37RLPA/nidwgDbO3E1xcsDuKebfyFMPZfUwRoEBbzPkXG2p0s5lHVrxPDQxf4
         bmiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793555218; x=1794160018;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y/GyDAzpwZImWFuqQSsjq6uv+RPz8GtxfDN21Tjamqw=;
        b=ADo7KkET3bXDaT3hRwLqaOvseK3KlTcBFYgmYiYvIH34n7X+wrZAcZtTLl3+ietlop
         XDQ89esUNEMj/MvaCCDxXeQiNQIr8X6H6DqatlGAYtBqrYvByxLpVMIX31MLzyYznnbi
         hy5ai1enjUkGfBErW45tuP0nk/JiSnrFHOMNz4lGwbq9obvZFzzWEN6GMKam7G36z6d1
         J0XXf6uR3/Ggti2Mq68SZDKTTL4Kvzs4R496TXw8+pCEKBF5htiWNV/jsGHLjqz0AWTG
         1DEFd7+GlHJbfa7Liewi/jSB1bFIEVr3yFR9PR7r+dI/6IXkqsvehYCUiCIDSum7UAzG
         1CUQ==
X-Gm-Message-State: APuU4Z89Hg2D7kxHfOBdQEiB2Bnt92lEdB6YvER1WKqA7VzN/9I49FOK
	IElMjCGK8lWzPLwArzh9Diq27s8ol5EulB5Yel1lVbZjjp8lbPn2cDS14FQ3g89tM6fsRIDzZ8S
	79XnJr5iqzZN1jLf8hqWitZz84cq6316A98RsfohnwhxLbIdbZaHuuLPRf63Bq2RsnQfa
X-Gm-Gg: AYBFou0VMMKL2BB/jOcu9W5vF1cltQoJQ90ej0BUl3QW08xD7b6eVmu/8oEfOKxDMVc
	p8JClY3MYxamPpTyg2Q6v/hMWfSV91z5Ce5pWoAdE16PY9+tZhzFJWms5oMKYUiD+O0iMQJJQiZ
	suz35AKP6jUhubkqEGEMMiCnxNab5Mg8N2QZcuGBao2Eedt6cOMP5KEdi6UIAQ11yNZVcoy2fuP
	9cLlGDEXimMZONlRZE37cVvt8/vZhMWM4QrMdx9n1Nmh/+ppSt4hCyDuP6JS0VbCu73pG2RQdnh
	VYxzjnvuZ8nJoCANb1HpK+ZHHq4xhZlDpRH+9AhEerpCXbt5iO8XPQcf0ooX1r1EeAJs/iMlSFh
	etIUzUpsVX4Zb2H2M2dTTVYDBJb0/CwMxuNdNO6Q3F8jHpL5FQorvTDSFNXXTBXWayElUIT3l7n
	5WlKxWd1maSi92q0rsj1uWjw==
X-Received: by 2002:a17:90b:3882:b0:3ad:6090:a17b with SMTP id 98e67ed59e1d1-3ae89776869mr5880108a91.17.1793555217966;
        Sun, 01 Nov 2026 09:46:57 -0800 (PST)
X-Received: by 2002:a17:90b:3882:b0:3ad:6090:a17b with SMTP id 98e67ed59e1d1-3ae89776869mr5880092a91.17.1793555217545;
        Sun, 01 Nov 2026 09:46:57 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e9db612sm15164277a91.17.2026.11.01.09.46.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 09:46:56 -0800 (PST)
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
Subject: [PATCH 3/4] drm/msm/debugfs: Use cleanup.h for gpu state dump
Date: Sun,  1 Nov 2026 09:46:27 -0800
Message-ID: <20261101174631.23637-4-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261101174631.23637-1-robin.clark@oss.qualcomm.com>
References: <20261101174631.23637-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: qPPk_Z-O3Wnk3x25Im88D9JDPP_Y5KbL
X-Proofpoint-GUID: qPPk_Z-O3Wnk3x25Im88D9JDPP_Y5KbL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAxMDA3MCBTYWx0ZWRfX/6QNVvPHCRM8
 jIuTvuarJXBdWcqFLROYm2k9ir3LKl9wc+e8H/FQ+ODdPOIk99yYI3lCE9JbDz2YCnJAosJUai5
 yIfUvWoEDrJXZQ3qIXz+/7QIZcTJbia4L4Q+ESRF6QhYuf40A6pdCqME6j4oBbjzljECJ5qTFb8
 MRRlkeGe6hEYqbmAgFL8cXgM3fvM+XknxC/xz9OWgmxiHEOT18KnE0K+THq7XqiMyVlT77S/7Ps
 A+N52eB/F9GRYRMWrXOHhIVvfWHKexHEWTVKJ9MreyEOC2qR9WwKCjkGfxbUCexZEd5AM3TC3EZ
 tIFUfRvhuwOMb1PX9ylUctAvDrUTaajmk32DZnRKyIaDyVJSM+NbD6RDUCS5ee5KEryYdYR9835
 Xy32/AzZVUvAvzPhU+rHlt7eST8900mj/xjIIDYryrPBqSGNaokHX7my+9nVKisV0ym83WrIeJG
 18iNvI4uS4MN5HWhEnQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAxMDA3MCBTYWx0ZWRfX2D/qPRfjknfY
 ikqB4siQt51+u5vrMM8zWCMJuxh0BQoTpeyR1SKLHJUIQ5uHh3vVw6VcjQUYHY9U6ziuxZYXSaE
 dJi7qtCgENrTCPYsEk8Qjek2wbSzDRk=
X-Authority-Analysis: v=2.4 cv=cfVHPXDM c=1 sm=1 tr=0 ts=6ae77b12 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=isCY8TonHXl0-fnU9HAA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-01_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611010070

We need to move the gpu lock around a bit for the next patch.  Use
scoped_guard/etc so we don't have to make the error path handling more
complicated.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_debugfs.c | 31 ++++++++++++-------------------
 1 file changed, 12 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_debugfs.c b/drivers/gpu/drm/msm/msm_debugfs.c
index f12701e286ec..b0ddc02f67b5 100644
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
+	scoped_guard (pm_runtime_active, &gpu->pdev->dev) {
+		scoped_cond_guard (mutex_intr, return PTR_ERR(scope.lock), &gpu->lock) {
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

