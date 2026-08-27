Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7E823DAADE
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2026 23:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787872400; cv=none; b=e44pea15TTrRZeSot71W+J52xZFRxBAachviS/Q2hoeomC0SbEEvEQFzsbxqrEzLFquB3unLML6DN6oOkiGVpfcPOXL3C3Q4P5nJu9Vqamte8jPj6R1rRic5lRh/thSGVm654cr6+Ofws4+SnNXseeiF1CVak8bxuuCdr9iuroI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787872400; c=relaxed/simple;
	bh=h4R+ZpPIgW1F2JqTClcK8P+aNB8FKkfZNhNfzSGejNg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=mb/U8U14STdDYg2IfV+3Y8TmnjJQm4mkNpZu2kCig5E+2iF/R4SOMOpBX231fq4UHf+AFTGmYGlA9ZWoI/Uqc5X+htUIU1WDgHzmvzjmKUFd1U8TfkR+b0qbH4zDdl99qy0X2I/aIT2nSUEmRG02ZhEnWADWKiF4Cdlf54y2uRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZcYWa6a0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DTApqidM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZcYWa6a0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DTApqidM"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67RMdU5O2226306
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2026 23:13:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=33E8rQb2qz9pdouy7xP1qO
	TUfmQulAHsDkpXs6kmzjI=; b=ZcYWa6a0IF4i2QVR2NiAImmaJ+BpzQA+V5ewBc
	QaZkgxqMK4woDmHmkrajT99bXyIztuWKhgyvTPZvPNodlbi6p+SjBWsQMSbUE4FQ
	IfTEyuy4Ul2iXhXkhb3R0WDzl80yzVzXe+gx/l+oMv5gCpkkp5z1DeXzs6ssI6R9
	APFpgQ0+HFzEjSCvVGszXvBWjvu2wFZebHfZYbl1yJhCpmBGAnoF4bdFhSwdO5L7
	q/3PeCej/mqxq8G1tBzObX0wKRVlshrhVa/yhbhmcJbGQWlZJJEFb7qFo4VvLKN4
	GKiBL8nsRikliYJO3kyciIoaIXu4A3KVB/fdU3X68oOVYUVg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gatfxh28s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2026 23:13:17 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-90cddf4f59eso5198706d6.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2026 16:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787872397; x=1788477197; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=33E8rQb2qz9pdouy7xP1qOTUfmQulAHsDkpXs6kmzjI=;
        b=DTApqidMVzq0pmHdLt2Ww/cpWO94z6cCvf7+5W4bzIdYKGjrbf1lSEskMHxaiz2WVL
         rHnk4UYH2BDu8m3YALu5kwSE6B9dUT5zz2eQ7ya0hbdkYPvyFhtWQi7mNcreEjQ8hDIf
         hWT/wjuo0l8k8CPd089gIW4Si9lhJ8Kdxw+AadryobJT5E5VXJW51hh1LzfkPNvPSRaj
         gHy4SdoQl91Nqs6QYd7OxZSCEMXddrq9qSXShXphhR8qT0cThPvjkqieLRk4Br1fdYGo
         QRaVqk45O93LpSzDgKRDZr8cIVm2KE3pfA0VF9w1JLsLckXGQiqFyXjkQpOm1u1lUkCo
         so3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787872397; x=1788477197;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=33E8rQb2qz9pdouy7xP1qOTUfmQulAHsDkpXs6kmzjI=;
        b=hXbJGJXOQkvQojM/vrcQ7aOGT2yNS4k8QbUjgExU7J5Q4jY+ompcEy4VEtOEv2Qxu+
         P9AxiL0Bs4OB52tuNfrBEbj4yaurMlrr/tMlycWRo4CkmSekw2V0yhI09OkY3/TOjatH
         O30Nq1Lw/HJytZWSpVlKP1xDKjpLYd1t5pPJ3Mrx5Rrq8ahv4yMqNx3mNRjPAtfKsj04
         3FjNujv9BAs5cGRIyYKNjtyuwPf8gNFWY2CGGYmcl8jvcbqpUNme2AeXpNcSz4G6sdTE
         JfxsPtxq8fzRpyiYysYYSGogDo1+lM/HA9hWQyptWaKxsmajoZxYnnp8k9DvUuQk59XU
         pPgA==
X-Gm-Message-State: AFuF++mWLI4NJtdI44tdDSqDNy4d5GoDcWTIjXRrfUG+HuxwZ2KILlp5
	lUPd6MRvrBnjNleae/WCo/0znbrB+xbMSD7ZBAATVODAJ/kvZhvB1cOQ20qOCtiGTGleXKl9eL3
	w/JbK6bz2iE/xstHIch7Ml01w0rHaTAmG0RSLddqdA4dyq2npLMzRJEAJqJf/6y6KMaUS
X-Gm-Gg: AR+sD10sEPrU6v4cTd/5cbzYdKoqfe+UQkPzRScNpF7Cn3b3NVJqkx9Yq4TRdcxgWW0
	O2TBfll3tKwd/So3pe+wRt5PI96qnmE7+TiVTbPu19Y67dfunBnt8jscCwuEqlAtizZhGjlRJCm
	0g12qdYS3Etc7odM0ujly+/pFoJA2PW82Y6v2q9kUoxr3X55ZxY8P4dzVTpMWG4bcZZsaqMiad3
	N93wWzwSxOuUlG3Oj+bk0Fx8isOJu6vCPbsw6A/xjPCHO7frHz/IC2adxXHEFI2WmqVo/XMeV5m
	QcdhIyu6dr42Spxb8+5W3X9EnGKDIGJczADUHHMysQk/UQjP+hVGCjqL9x63yIbwnXwDh2Dh6TW
	X1aAtsyvcP+UQNgn1oJ4dl61mecP4Ats1BfZ344ozctjNwClU4TMlKL8eHpWbTBNkFZt38tVps2
	cXKaBZP+0i7yVf
X-Received: by 2002:a05:622a:1789:b0:51c:6b6:9d0b with SMTP id d75a77b69052e-52fb9459c8dmr35900841cf.2.1787872396729;
        Thu, 27 Aug 2026 16:13:16 -0700 (PDT)
X-Received: by 2002:a05:622a:1789:b0:51c:6b6:9d0b with SMTP id d75a77b69052e-52fb9459c8dmr35895411cf.2.1787872392413;
        Thu, 27 Aug 2026 16:13:12 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b5e8a0ce6fsm12281e87.61.2026.08.27.16.13.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 16:13:10 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 28 Aug 2026 02:13:08 +0300
Subject: [PATCH] drm/msm/adreno: keep the GPU timestamp monotonic across
 power collapse
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260828-b4-adreno-timestamp-v1-1-273525da144c@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAIPEkGoC/yXMQQqDMBBA0avIrB3QGDT2KtJFEkedglEyqRTEu
 zety7f4/wShyCTwKE6IdLDwFjLqsgC/2DAT8pgNqlJtZZRBp9GOkcKGiVeSZNcdJ+2Nbpu+dn0
 HudwjTfz5X4fnbXm7F/n0W8F1fQHmDVh0dwAAAA==
X-Change-ID: 20260828-b4-adreno-timestamp-f4c846391b97
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5091;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=h4R+ZpPIgW1F2JqTClcK8P+aNB8FKkfZNhNfzSGejNg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqkMSEl+lL1R/y/qyJedG8OzQi7/ysAH4qNRQzL
 Ua4JrIBrmSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCapDEhAAKCRCLPIo+Aiko
 1QxDB/wNtEpO694f+0xH1+PcmXn88IC/VmZJzwln0Lb2qlJyrRNnKKddBdM9tkNWnH6/BXZ5JMf
 FHm/yIdZx8A6CnGAjDPEPbOHjAW3oogTpWFWIuDuoGgnw4tJ3KHVOParuIPUKHRT3ppwqGLFAIM
 SFf3ZmWZTeEC7EhJPnmnRYcEPq+maG4cW3MAjVRnZDJQrdACCAZZzO0xztd1UDiofvKd6zqb3dQ
 F2RIIspdDaigjOLAiJvv+RF1JbrIWUZLAIlEVC7lVtJMyR6YOchf1DCRD2SH3sKoeKmmDDAaMxz
 iNk4beZIHPNunEYXGOBXmVjv9vuGALa3trmrtB3m4kqE27QI
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=UKLt2ify c=1 sm=1 tr=0 ts=6a90c48d cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=ShAjJNOzEIEqusN_WzUA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: S5RwPtjGJKvAEFVYGcOazAwtLl_RRHuv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDE5NyBTYWx0ZWRfX7eYw35Gxpsls
 xMEt7FIvO633CJq659s3vhuoZ40i4wuayctroteT3SoBEmA7W1+jHZLDT6gRJx88Bri3jPWJvht
 R7Fyl07MjBq6fO/J60Dierfw3yeNZMV77zPd+PxrBzz4dlUWgCpwtl7HGTtLf1MsDeWHmKyeh9B
 Uli1UYDeMskYQbB9ZeVAh4A0PRWLjsr5mBsUirTmQ/ppZaZbuIqqhRqZZOBNoQfqFaJL78uXO0r
 ZxID5EPnEdCps6GcDWbNZbC9jKlr6VGvzpbu2+mlN3/RX4bz1AEfQeeFNMPdKQ25I/oDymzgXwD
 9qLncMGWTq959VMFB/L9LeToku1TF1r5qyPAeeZrd+qA8Ilu1V43z7CJJVS0zB4UB+v3XyK/eDu
 OFWQpO43bVb1k/hVvnxSjG0jPwj+B2Be+8DxbBr/KriwOSiIKLwCYa8td9GYJX8nsIH5Mqf35Wz
 FOM6U9ntTLuat8IKpxg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDE5NyBTYWx0ZWRfXwXBDcn2+8Dkw
 Z+gP4HCqnoewl9ZHJmrANtSl+4I5OtmbwiwNwfRVFMc+tk/5OLasEYYNyjNJ1XDqeTppEOBY731
 BV69rEPtQoWrej+lWWnmI9hV+NsYU3o=
X-Proofpoint-ORIG-GUID: S5RwPtjGJKvAEFVYGcOazAwtLl_RRHuv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_09,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 phishscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270197

The always-on counter behind MSM_PARAM_TIMESTAMP sits in the GPU power
domain on a4xx, a5xx and the GMU-less a6xx parts, so it restarts from
zero whenever the GPU is powered up again and the timestamp reported to
userspace jumps backwards. On an a702 six reads three seconds apart all
land in the 500..1200 tick range, stepping backwards twice, and on an
a530 the OpenCL device timer conformance test fails because
clGetDeviceAndHostTimer() returns an end time below the start time.

Save the counter in the suspend path of the affected generations, while
the GPU is still powered, and add the accumulated ticks to the value
reported to userspace.

Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
The always-on counter behind MSM_PARAM_TIMESTAMP sits in the GPU power
domain on a4xx, a5xx and the GMU-less a6xx parts, so it restarts from zero
whenever the GPU is powered up again and the timestamp userspace reads
jumps backwards.  Accumulate what the counter reached before each suspend
and add it to what is reported afterwards.

Measured on an a530 and an a702; the GMU parts keep their own counter alive
and are left alone.
---
 drivers/gpu/drm/msm/adreno/a4xx_gpu.c   |  2 ++
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c   |  2 ++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   |  3 +++
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 10 +++++++++-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h |  3 +++
 5 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c b/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
index 6392126f48f2..7d9dd9460f5b 100644
--- a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
@@ -593,6 +593,8 @@ static int a4xx_pm_suspend(struct msm_gpu *gpu) {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	int ret;
 
+	adreno_save_timestamp(gpu);
+
 	ret = msm_gpu_pm_suspend(gpu);
 	if (ret)
 		return ret;
diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index f1df2514c613..c5552f1085e0 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -1423,6 +1423,8 @@ static int a5xx_pm_suspend(struct msm_gpu *gpu)
 		gpu_write(gpu, REG_A5XX_RBBM_BLOCK_SW_RESET_CMD, 0x00000000);
 	}
 
+	adreno_save_timestamp(gpu);
+
 	ret = msm_gpu_pm_suspend(gpu);
 	if (ret)
 		return ret;
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index f9de9329dee3..106cc2ac55ff 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2252,6 +2252,9 @@ static int a6xx_pm_suspend(struct msm_gpu *gpu)
 
 	trace_msm_gpu_suspend(0);
 
+	/* only the GMU-less parts come here, and their counter is in the GPU */
+	adreno_save_timestamp(gpu);
+
 	a6xx_llc_deactivate(a6xx_gpu);
 
 	msm_devfreq_suspend(gpu);
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 3370cd44382f..f83960b31901 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -226,6 +226,13 @@ adreno_iommu_create_vm(struct msm_gpu *gpu,
 	return vm;
 }
 
+void adreno_save_timestamp(struct msm_gpu *gpu)
+{
+	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+
+	adreno_gpu->timestamp_offset += adreno_gpu->funcs->get_timestamp(gpu);
+}
+
 u64 adreno_private_vm_size(struct msm_gpu *gpu)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
@@ -398,7 +405,8 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_context *ctx,
 	case MSM_PARAM_TIMESTAMP:
 		if (adreno_gpu->funcs->get_timestamp) {
 			pm_runtime_get_sync(&gpu->pdev->dev);
-			*value = adreno_gpu->funcs->get_timestamp(gpu);
+			*value = adreno_gpu->timestamp_offset +
+				 adreno_gpu->funcs->get_timestamp(gpu);
 			pm_runtime_put_autosuspend(&gpu->pdev->dev);
 
 			return 0;
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 114a40f79ef3..db080a6d515c 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -207,6 +207,8 @@ struct adreno_gpu {
 	uint16_t speedbin;
 	const struct adreno_gpu_funcs *funcs;
 
+	u64 timestamp_offset;
+
 	struct completion fault_coredump_done;
 
 	/* interesting register offsets to dump: */
@@ -610,6 +612,7 @@ static inline int adreno_is_a840(struct adreno_gpu *gpu)
 /* Put vm_start above 32b to catch issues with not setting xyz_BASE_HI */
 #define ADRENO_VM_START 0x100000000ULL
 u64 adreno_private_vm_size(struct msm_gpu *gpu);
+void adreno_save_timestamp(struct msm_gpu *gpu);
 int adreno_get_param(struct msm_gpu *gpu, struct msm_context *ctx,
 		     uint32_t param, uint64_t *value, uint32_t *len);
 int adreno_set_param(struct msm_gpu *gpu, struct msm_context *ctx,

---
base-commit: 140b13475302601368c0cf4e193e66126a49feb3
change-id: 20260828-b4-adreno-timestamp-f4c846391b97

Best regards,
--  
With best wishes
Dmitry

