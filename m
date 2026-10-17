Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C68703D25AF
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 Oct 2026 03:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792207037; cv=none; b=ucEZIBlsiUdaKpmId94u9tfShrIvwl8TEkToogkN91CS5+CzF6U1fBl+VE2l55joQjyYyaAJ2U798M2T0On50C4g8euoIaq61mk3cThAPHePw43nOQ1pStklUhLfGWP3OjifPblaK/YGx8WkboDVdMmlga5qEuG992U4v5egjXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792207037; c=relaxed/simple;
	bh=OYQMZJ4au6gfmi6/P8LwCt3iAJONz/e2288HxNvI0U8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qBQFh4AxtJIQOMZiZJquVBRRm6/Q8k3DWmqfAB4zMZV/brOdwESmDBeBEACaWrmwVXbFf9yVrfvnSbmTOVukGLTNzY6WSdaMIVuK35Gdqq7fBzcuwSizMaSibK+fIJwJK9Rq8LY00w3pK6gcrYIp79gUYKE2XuxFvmtm3CXuOrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kE6FSi/f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OKUwOZK9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kE6FSi/f";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OKUwOZK9"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69H30b3Z942492
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 Oct 2026 03:17:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i8TdapB8D25ZNne6RzXRT88nnicJi6OUyrYWRSkLDSk=; b=kE6FSi/fvkSwtApF
	yw/BZbqCV8sE2jF7zviRCfSblQaNiODtOGclANl9MsgJ5jiqkfxx7Smy4nk0BhTV
	SWjd8a06En0o7a8EORDcuZTV1VhniONpeg0awDBPCv74VuV38Xb2z2q+AAqi+EuM
	9ry/LiczPe1u5/enT7IWROdFvf11u1GAwGnYRHIJj54fMcNvwCmOosF98FuP3u/f
	RlAkyjrpUslWwbMr9QivSe1mfdRiqi0MUceOeWvWbHlw7g3GeGxrpj5KbhgTGP4i
	GcvrMFJ7v7SK0fLkUZdSyjwxd14eXi3wRS0KzhBkfEXJvG1xhO+rqP0hcp6lW4/Y
	iTtEdg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbyys03nf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 Oct 2026 03:17:10 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-35c3c370b17so960756eec.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 20:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792207030; x=1792811830; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i8TdapB8D25ZNne6RzXRT88nnicJi6OUyrYWRSkLDSk=;
        b=OKUwOZK9nOcgnkSqWxmTxdB9um/+K1xxYVZjSzS3et20nfQiL0+H8WnD2/Udyyu2kh
         3hzi9RL/qc2nMix0vkRPBvU+vXTWzB4uo6s3R8j0AWgWYPXyLfC5j29pwhBXLaRlCLi2
         JJCAsoiRvQvJsdkYV1fTXRgYzlE598EZoCHqvgqt7dHdxqhR1W3tsIBcrAF5uWrSJazE
         PC5Y28Zug6hIs8pzJHfGrJggulet1bT94VPpnloAY+/RYC1gKZpeI3bwZK7bINbMrZyO
         RoEadFDy+EgHxsBeVQF7l9Kon2UACax+kS6d7mCFxbgJK7Qae1sZlkRgGA1AtUli0D19
         gSJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792207030; x=1792811830;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i8TdapB8D25ZNne6RzXRT88nnicJi6OUyrYWRSkLDSk=;
        b=yGFTCR4bxDSUXGVOxciH2ivm1nGPua6pRfH9VMF2NYhY1cXnioY57wZqJd4QTNR8U6
         nQ6bFaEnyLYzA0tc3cwirJOWNqczK8MgjcE6z4CzU864TPBcAAs+kKwF/P601OOcFuGc
         Y03RPb+SDbyrT1Gdjm0q0utpIhThBBTKZwqiwqLI+1D5PcOxjT53jdsurPcNUnULE8iK
         YmHQdHQDotd1vUklxJN1A7we1rIM+Ayqc/iMsgl+APsvgWb2gYKx0RkcMCjFPaiq4v1N
         X3h74COPZzvQ04GWCI1jByr5w2mBJ5sZiN3osfQwlCtRY4YRjlPR/dZmX6jWw7QsYqaz
         MDDQ==
X-Forwarded-Encrypted: i=1; AKwUvByuTx1rEXzk8VPZnWWBXaj46GCd3Uoz5m+PhI7Y9HV7I+A+YkkAmIxXvK0ckNKRuoIOohHMNsLvuFK1a9Bo@vger.kernel.org
X-Gm-Message-State: AFq9FYIKhLay1Gwso5e9nmPIYhcUwsFy9CnAnwOi4rLBNL/6/Ht8GKCa
	wDCYD5Zfgyvly/y819dBCKhrO355Ml8X5Z0ICDYu3yhBVS1NNfxM5sR5MwS6d+VJ0rCc5KUJXhN
	lZosvUEly3BTFYgbAzyIuwuCDm0QFSiduk2uQmwYfgHnwLza/vBikRCuXxf1rxHb474wv
X-Gm-Gg: AYBFou0b+RiYFzcgbSVzAwHQInDJVBYlIOlClttLB7a4N5v1twkwC4TxihuWw1aJwau
	PyV86miobV/y8lA/vMCtAAYXzEmgu1raiK4IBmtcINDkw0nnOyxzTlyx91Gb8/S5mUSBJJgRawF
	V2QBYM+ASvapPHRPNX0apJJ9jKstwXkehWHFd1rDuIvfyA6e/nddkxVZW+tZUfQtHMrjx9b1616
	viUPr+A5nWR9T7Rr1cIzZ4q5ahiMUtack5l+/JoYSy86IONOcX6aseedrpYopoRqQFtOukXbYPm
	RCKwVAehL5U7UoB95l7CeoXAtDpSgOvCaPfymfxlNunLnEVo/sKfwgXKqcPawBn82cpUiqldOjC
	C66FJrXvJFkxhOB/UgT0iYIS+bVoA61ugVg==
X-Received: by 2002:a05:7301:da84:b0:35d:3370:d8e7 with SMTP id 5a478bee46e88-3619ed12158mr2398655eec.2.1792207030122;
        Fri, 16 Oct 2026 20:17:10 -0700 (PDT)
X-Received: by 2002:a05:7301:da84:b0:35d:3370:d8e7 with SMTP id 5a478bee46e88-3619ed12158mr2398633eec.2.1792207029588;
        Fri, 16 Oct 2026 20:17:09 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3607ee0d391sm10969995eec.4.2026.10.16.20.17.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 20:17:09 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Sat, 17 Oct 2026 08:46:19 +0530
Subject: [PATCH 3/3] media: iris: Fix use-after-free on unbind with open
 sessions
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261017-iris-handle-unbind-v1-3-7809148eb90f@oss.qualcomm.com>
References: <20261017-iris-handle-unbind-v1-0-7809148eb90f@oss.qualcomm.com>
In-Reply-To: <20261017-iris-handle-unbind-v1-0-7809148eb90f@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Hungyu Lin <dennylin0707@gmail.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792207006; l=4471;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=OYQMZJ4au6gfmi6/P8LwCt3iAJONz/e2288HxNvI0U8=;
 b=usT2uUP0d7gwok/WPw+UQLdyzrCHrG4/odwM0HCXAZlkDANRWSNCZNXM8lQ5gES1wuZhoeEFq
 n2gshReHGz/BTMmBZQKZEtlXveNOxthJzpSBLUdY7iQJ9/0Xy3c4QFs
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDAxMiBTYWx0ZWRfX7PgFwLAccjer
 XY+599hx86C7LWg7oUUuXnxTNKk4CVNx09NauopRIg/Of9euvV+3XIUMABBN+cRTUH063TK3phm
 kPC7KY1dEE8VfPhkCHqVlTOTivK8U6O2jlHfT5F4t20tk1a43Bv1xRGsXHlGrS0AEN2vGKaQBvG
 KdeFXi//ezfXY2mUdFNQaXKSnIuC+ti7zIQ0ZcgC93uykuyLP6sDZDb3A6TMewXXMQZ2jX8AUNH
 i4nT1zh5TEnD8IwU5IFPLpINomp3sANiMRxlXvQrBchtS335Z8jHlfaBpFuD+ElYxfSZ1y6EIxu
 aiLahn+RGgvTjP4EJWA18Ari6/KTRhKSurkzM5dDXZb7AnXIsMAHqc2XTgpw2RYeGyhwBjGL75c
 hRHn2T4Jxip4z3HMmA4p87Jw34N35kqy//2sF1F/CMoo+OWJ9iLyswFg6+2dZVQb2W0cQTVHueW
 1gcd59ySusk0sszr8qQ==
X-Authority-Analysis: v=2.4 cv=W4WtxhWk c=1 sm=1 tr=0 ts=6ad2e8b6 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=wKmruQRo9p3JesIawloA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: mePXsc7zqw7PVQIL1G6cJqS0dcRKgOl2
X-Proofpoint-GUID: mePXsc7zqw7PVQIL1G6cJqS0dcRKgOl2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDAxMiBTYWx0ZWRfX4Yrm0pYvcdTR
 M1xkA4ewXRMI9lE8WpDerw3yrd3k+TfNUd8Sz/P0buZ3m1HWyHjQwmHc/ykw+ZgwlCbQ+0YzQyz
 ssXpAGtLhtn3aEqDpiIoWqVS/5An/ow=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-17_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 malwarescore=0 phishscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610170012

The driver unbind can be triggered through sysfs while a client has a
video session running. The devm resources will be freed when the unbind
completes. That leads to use after free for the running sessions.

Keep the memory of the core and its device allocated until the last
file descriptor is closed. Stop new sessions as soon as the removal
starts. Make sure the interrupt thread cannot run on the core after it
is freed.

Fixes: 38506cb7e8d2 ("media: iris: add platform driver for iris video device")
Cc: stable@vger.kernel.org
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_probe.c | 56 +++++++++++++++++++--------
 1 file changed, 40 insertions(+), 16 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index 4cb678bd56f0..25876957381b 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -243,6 +243,15 @@ static int iris_register_video_device(struct iris_core *core, enum domain_type t
 	return ret;
 }
 
+static void iris_core_release(struct v4l2_device *v4l2_dev)
+{
+	struct iris_core *core = container_of(v4l2_dev, struct iris_core, v4l2_dev);
+
+	mutex_destroy(&core->lock);
+	put_device(core->dev);
+	kfree(core);
+}
+
 static void iris_remove(struct platform_device *pdev)
 {
 	struct iris_core *core;
@@ -251,18 +260,20 @@ static void iris_remove(struct platform_device *pdev)
 	if (!core)
 		return;
 
+	video_unregister_device(core->vdev_dec);
+	video_unregister_device(core->vdev_enc);
+
 	disable_delayed_work_sync(&core->sys_error_handler);
 
 	iris_core_deinit(core);
 
-	video_unregister_device(core->vdev_dec);
-	video_unregister_device(core->vdev_enc);
+	devm_free_irq(core->dev, core->irq, core);
 
 	v4l2_device_unregister(&core->v4l2_dev);
 
 	iris_unreserve_iova_region(core->dev, core->iova_state);
 
-	mutex_destroy(&core->lock);
+	v4l2_device_put(&core->v4l2_dev);
 }
 
 static void iris_sys_error_handler(struct work_struct *work)
@@ -281,53 +292,64 @@ static int iris_probe(struct platform_device *pdev)
 	u64 dma_mask;
 	int ret;
 
-	core = devm_kzalloc(&pdev->dev, sizeof(*core), GFP_KERNEL);
+	core = kzalloc_obj(*core);
 	if (!core)
 		return -ENOMEM;
-	core->dev = dev;
+	core->dev = get_device(dev);
+
+	core->v4l2_dev.release = iris_core_release;
+	kref_init(&core->v4l2_dev.ref);
 
 	core->state = IRIS_CORE_DEINIT;
 	mutex_init(&core->lock);
 	init_completion(&core->core_init_done);
 
 	core->response_packet = devm_kzalloc(core->dev, IFACEQ_CORE_PKT_SIZE, GFP_KERNEL);
-	if (!core->response_packet)
-		return -ENOMEM;
+	if (!core->response_packet) {
+		ret = -ENOMEM;
+		goto err_put_core;
+	}
 
 	INIT_LIST_HEAD(&core->instances);
 	INIT_DELAYED_WORK(&core->sys_error_handler, iris_sys_error_handler);
 
 	core->reg_base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(core->reg_base))
-		return PTR_ERR(core->reg_base);
+	if (IS_ERR(core->reg_base)) {
+		ret = PTR_ERR(core->reg_base);
+		goto err_put_core;
+	}
 
 	core->irq = platform_get_irq(pdev, 0);
-	if (core->irq < 0)
-		return core->irq;
+	if (core->irq < 0) {
+		ret = core->irq;
+		goto err_put_core;
+	}
 
 	core->iris_platform_data = of_device_get_match_data(core->dev);
 
 	core->ubwc_cfg = qcom_ubwc_config_get_data();
-	if (IS_ERR(core->ubwc_cfg))
-		return PTR_ERR(core->ubwc_cfg);
+	if (IS_ERR(core->ubwc_cfg)) {
+		ret = PTR_ERR(core->ubwc_cfg);
+		goto err_put_core;
+	}
 
 	ret = devm_request_threaded_irq(core->dev, core->irq, iris_hfi_isr,
 					iris_hfi_isr_handler,
 					IRQF_TRIGGER_HIGH | IRQF_NO_AUTOEN,
 					"iris", core);
 	if (ret)
-		return ret;
+		goto err_put_core;
 
 	iris_init_ops(core);
 
 	ret = iris_init_resources(core);
 	if (ret)
-		return ret;
+		goto err_put_core;
 
 	ret = iris_reserve_iova_region(dev, &core->iova_state, IRIS_NP_RESERVE_IOVA_START,
 				       IRIS_NP_RESERVE_IOVA_SIZE);
 	if (ret)
-		return ret;
+		goto err_put_core;
 
 	ret = v4l2_device_register(dev, &core->v4l2_dev);
 	if (ret)
@@ -368,6 +390,8 @@ static int iris_probe(struct platform_device *pdev)
 	v4l2_device_unregister(&core->v4l2_dev);
 err_unresv_iova_region:
 	iris_unreserve_iova_region(dev, core->iova_state);
+err_put_core:
+	v4l2_device_put(&core->v4l2_dev);
 
 	return ret;
 }

-- 
2.34.1

