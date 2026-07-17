Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2C6935AC34
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 20:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784321345; cv=none; b=fHN7b3ECBA15vlodKwkgXeFlPYShjZiUw810zZ1PEtkCCcLaiuO5Pv4JK+uJMP+87VrPhb9hETYzjKLEmMTYuTjU/HCZzoL7P7czWnLmqBFtaQq/LnnpJ7uVreHSbbjgKY0jyZR4xrAxaLB2CYcsJbqlVCFHAE5Ft+VWmVQM14c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784321345; c=relaxed/simple;
	bh=4N17iOoD/clJzRUe2kNuCYy7t9AE/P684XfMMFUwlW8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gGAyCnLFD9PkJ0TBTCHulr6yq5X24D84Qs57IjFV9nBDTfgdJvlPQeSux7Lns2QuV/0byqXlnI7E9lw41WnYn0MptTgBOqXII15mrcnNQkQJ2d4YSsBAgwgAux3PaZ4u5pn8VUZZ0N/7pyqpMhC83LAFbSlYyTorBY9x55HCQxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XwrqJAeF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K4XzZNqa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XwrqJAeF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K4XzZNqa"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HJtB2d2597230
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 20:49:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=DUl9fsdKYPz
	3kO0o4cBY5wSMLk2mQuvR/wBV0AkKLB4=; b=XwrqJAeFroKkT6DMCKHKZmRuDFK
	UXiApOwgHkJ5QUxGS1J0lUqaguEdg2T6EOyVpLg5pvAWyisgatvW39xTvN6o418D
	2CgFvqnaL0kMWTAGXV77TbEtSNNaTBj/iFsak+4pP3S0Lh9iPlSn6IgJvLZtli6H
	7LiNdEJi9CLrC4V3+k9vr05asYNfJSHJkY4gcnqmyKAN/isyTFYxSxWOtcr+O/6w
	cNyG4oMT3Yc6Xsx/HBOoNKVvdF+fTJWk7YZCnhelVK4NO2pYPqk9W7+wqjDIyyZG
	r7yL3M6xUiWuFzk7ra7yEIYGuoaCiUIlrM7KQjdiOJnt8MLaLLQwApVFcZA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ffrp8rsfq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 20:49:01 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84240683a82so2050706b3a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 13:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784321341; x=1784926141; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DUl9fsdKYPz3kO0o4cBY5wSMLk2mQuvR/wBV0AkKLB4=;
        b=K4XzZNqaprKbCVwwzMYWkCNdV67RxrldPCqezNhAOCpVSuoJtfQ1qbBcnd8zIWPfmx
         tQTboXFTqmlMegE4BewTzk4wAqUPGKrCQK6rgHbawAqEK+rZG6+raMimu2vTjHx0tv43
         vv4oWMFJyObuCVvx0+NvLV9AWKum8afTfS+NrbLw5Be+TnhdCn8Snh6JbKiKWPgjIQ4l
         CBWWyqrg2qYEfgacdBd5qZ7A9ZbAtNf/txXupYtGBladROtP0ehTDiYDJ+bNEo6j6DP1
         P/v+toY5njeo/8kdAFsU6ln4u3l6aF9j+2GJ9cbsr0vxV8WfaX2hkyXFoC6mtAujoaoE
         CLOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784321341; x=1784926141;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DUl9fsdKYPz3kO0o4cBY5wSMLk2mQuvR/wBV0AkKLB4=;
        b=q/nc4HpERR2R4+Ar7qGpOP/vddSeXSfH1OFRye1yBx7pPKVUgPSadl6nabCI5GYrGG
         cVew/0GDqQGHCK4RUASYtzuvYx/2E9c0kAA3o7TXHlacsAB4fJh9N2QfTnAGxBd9V2H2
         dXV7zJTtD29nozVNwixGXTa9tCjNwmnXbOkbnunbwJHdY80uA/mA5isn03vFsxLjrdTG
         oy93jp6HTTjim2W24y75HFU4nWhzk6nxCuSQIFfylMX9j3khM0Xyq1cbSfxGPLrcH0M3
         K2pp58WvJdX6ACDq4939KdoggKIZP/N+fIgaV9BeWK1vWHbwcAif9BWo+MyrimirRcmz
         pntg==
X-Gm-Message-State: AOJu0Ywi3VDbZXREj0xqxKWS/dmUHQJwlJQg1bsZzkJ2tNx4JVmvqepE
	PGGRdHbvA3Uxj85CaozvpOCKK+QtcIXipk93paz0gafL4YCJmmMTOIKF8AtMw17ZQLL7J3K1DgD
	ztzmPctArbIPa5t1jrOg/38QLGNg5RKJRaiIa1x4stXoJ7OAjcnHedcoF1np/4i7x4v9d
X-Gm-Gg: AfdE7cmJGI8WtGZfswG7UAhI1KqcRLdntIHjAzjxRxywPPSwmXEaVsazsW2JIYPpuBQ
	vIUugXG6zxXDfiKCMB3jux142JhfO0DC4B5rwyBMBDnKJqey5ypg2nrp6AnlGR4xwbrToo9CWQB
	Gqx2PLXL/63ousgoT8xpqvYDI+2YZxdpTYoGPnhVjC3fxJZU6W+wEY05l9xj7EbAuaek8n2/iCk
	3sfBAoKhiwjVS2eOSp1A8lyV4JLd3ApAuQbac9P990kY+sl8VZE+TTJYz3BubjMzSct1LsegYBa
	WsGPD8moD2cTa9XlhD1zWRJZUtZl7QVPjPj02eQwXLaoe3+f4xZtG2ECqvAZ6ZFLA1MDf36HxOY
	loyLp6gANJ1TPnH2A7SySPavhvC65mfnQKa4iiXzlrkGlu7o=
X-Received: by 2002:a05:6a00:2e0e:b0:847:9919:e772 with SMTP id d2e1a72fcca58-84c28aa67eemr4402592b3a.21.1784321341015;
        Fri, 17 Jul 2026 13:49:01 -0700 (PDT)
X-Received: by 2002:a05:6a00:2e0e:b0:847:9919:e772 with SMTP id d2e1a72fcca58-84c28aa67eemr4402571b3a.21.1784321340577;
        Fri, 17 Jul 2026 13:49:00 -0700 (PDT)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84c2adc3466sm1742806b3a.15.2026.07.17.13.48.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 13:48:59 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v6 07/16] drm/msm/a6xx: Access VM directly in submit path
Date: Fri, 17 Jul 2026 13:48:23 -0700
Message-ID: <20260717204841.26120-8-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDIxNCBTYWx0ZWRfX3xZOyB5Riwm4
 mVcfeXEEwaM9pNjud64jqgXBeOTlSsqcOYTOZrn6dLwWKHCKKZs4wX3rTyWHIPWlUdmgVQhHF7S
 nmGqb8vD1MkWoBczfqEUikd4ZBwDuik=
X-Proofpoint-ORIG-GUID: 5K4ZnM9I3zwI1Gm0-jBhSf_RMCNjIWUT
X-Proofpoint-GUID: 5K4ZnM9I3zwI1Gm0-jBhSf_RMCNjIWUT
X-Authority-Analysis: v=2.4 cv=fMYJG5ae c=1 sm=1 tr=0 ts=6a5a953d cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=19Wyn7e3V/0aNffMjNCMQw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=QS8Fz2UHHwPDOV3g--wA:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDIxNCBTYWx0ZWRfX0H/BkqaGbAJF
 Im7pMWZBo2drm0maThf22X/lBgTzUPu2sf2Yd5sa45nWoBC6aHkqvkHBnDC8rQu9cYZTkv/Br5y
 mYzUTFHT8rIojgivGb17tTUCNmNwk+dugZzLQ7wwDarTMYMZLadhL6QnQ8lRXfwdXFSQ3XbaH9b
 TEpdmZnaX3Zm6XEGmIlcq7RHFOLldFbVHDgjyfr0gaNTIgVXIPE3VHw5p5betXG5/QwBRfGXNQB
 c7LxXjXMRDzWHQQzPPmzEAIkxoK8pZUH5vN4P99E3PfYp6IEPOmla4Doi3OdOwJzzNMM5ThgdGr
 2yySN9kuccHZ5tQUDqjZdLhgBvVdhVKlayWgLPyM4fXwqJichrOCxNODsGGRp+E0vDeIhkIT2Pa
 fQGrmRhdtpn3DLR/Xt3KMzwnkK24OCzjWmonhdsDNcyLiosAcA8d9RCWiRtOupJKUkuqsn+9TZ3
 GZart7EDgeWTnaSQx2g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_06,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607170214

The GEM_SUBMIT ioctl has already ensured that the VM is created, so we
aren't expecting to lazily create the VM this deep into the ioctl.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 8b3bb2fd433b..7f1673163f67 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -229,7 +229,7 @@ static void a6xx_set_pagetable(struct a6xx_gpu *a6xx_gpu,
 {
 	bool sysprof = msm_gpu_sysprof_no_perfcntr_zap(&a6xx_gpu->base.base);
 	struct msm_context *ctx = submit->queue->ctx;
-	struct drm_gpuvm *vm = msm_context_vm(submit->dev, ctx);
+	struct drm_gpuvm *vm = ctx->vm;
 	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
 	phys_addr_t ttbr;
 	u32 asid;
-- 
2.55.0

