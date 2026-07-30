Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA2EE410D3D
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 23:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785455331; cv=none; b=tBupqqoSZvv307f0xinBSbiHIDV+X0Io6XGNRD+aU5pbNxRi8Vkf0Rp5zTBg1btCt2vrH/Kp5wTk/qvMXPEXqG1dokJVa9aqt0tSakS40lFoIT0+6uwYL8D8UmXuV95kSKuDPdRSNO4clI9/WD+BSdU5OFdve4vBthA85WqmtMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785455331; c=relaxed/simple;
	bh=waXKDNxXFFDGJZwXXUOyEjCtu46GMLF2lKLnyW56kTE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cV5zBgmhhLaz52ijMj5m5ZPhtRyY0hGkyatSMJMGv+O/hf2i4erAPjWdXVX6VNFmZlsYSRFj9JkyDz14gJHS7yuTXxIC91dLt086DKa4nHaWseVaWVrJp+O12WE5J/XJw/R3qRkYQjOm/vdZr1EIdQrSkE2xiUioXqWEryr6jDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C41A6yk/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f/qkaiTl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C41A6yk/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f/qkaiTl"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UMxk7m2683587
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 23:48:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3A70gNGbqmKpi+ELn3nL+yw7ZT7umZ8GcDY+U0kOmdM=; b=C41A6yk/0dHgDtuG
	xiANdNSQkQ7EQGSEKM8HSxup9zWalhZucJmP4jSdfgAYjWOnFmsjpXVF47UYm4e+
	9CT6HgKjkyO64Drzx5wIvvFyycvn9hNnFOI8guxuq8iKns+4ICwftm6qwTX/fO23
	RQVHXnupDjW0hgu3DcxrepWpxcjg8spiCAS6Y7Z+hKAUr2RAwQNZzQRNxss1k2hn
	C7kOvcSXF4RfpASbhAir1byEMdExurWtDr3DxjbVs5An7LtyiAuAOfi3AB2c1aEG
	MoWqNyV5I5frY+zWdI8pgUUlPUI2qEp9UVHZretvSxX2FXAwrSodtxt4XPQmUBZN
	fWUPjA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frfw5r47g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 23:48:48 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c083f1818so3772181cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 16:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785455328; x=1786060128; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3A70gNGbqmKpi+ELn3nL+yw7ZT7umZ8GcDY+U0kOmdM=;
        b=f/qkaiTlf/TFQkoSh8R/6/+WHiOGSRY2Lb+GjGRmvWr9vn3dsM221snJs7gQ0iF6zs
         VLl/4QCuruUWJmOt/xVtHoHGOW50gJYmz/fQT+JJGX/mg4JRLSpzgcNdGpnweEMJqvGM
         aPFsgVTqByinZoavqQHI3s3B6woTzy90XZxpavv+bfbmDNuri6uMPUl3UpMCJao4nKaV
         kA2Ae8nDO+V9z9NqxFfTa6a1uN4JVXF5Gm4q/OpApsCkcYeO4rz+bGf2fV/8LCsk24BJ
         bMDAnuKip+lmAQhGP8FfGUQ5J4o9Xb2CjrQamVE0C/Z0FHTN0Mnyjw3JZBHtEd3l92WC
         zM4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785455328; x=1786060128;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3A70gNGbqmKpi+ELn3nL+yw7ZT7umZ8GcDY+U0kOmdM=;
        b=BSJF1lebWxemZCsNow0pC+yrb4UUImtjetewzpRs/QNAxGViVJUqlA5m36Ud7vS2Xe
         /rtD+SeIV4Hems+m7wkE8eGYv1/U5ZyB6N0VgCI7JL7LF8s+++U6ubaAWJT2Wmr07pmI
         o33lV1Ir3eQ4dpBDtkivpvtJqTCKVjzPyzg5DI5JxpSaIIY5TLiIzOIUTJ2HdfmmCFBu
         g6TufauMxonvLMrYeLUXdkhcLYXexogS5fZLmWVz8EBjDetP+Q+QP98xGVtoeC1bh19E
         LxhVDXrvk43djo/t9DKUmkpHiCD2JXsRxaACpviHHKxloZ53scVF2si2AGHYk0iM42II
         iD2Q==
X-Forwarded-Encrypted: i=1; AHgh+RrNiB+a9ct6TXUflfmHaMDtQeFL/PS1O7suDzJTXYF/BVozhINiFplAnKwi3TWAefiPOlx+yf/2RCxxhKE5@vger.kernel.org
X-Gm-Message-State: AOJu0YxJAYcScB9QPdIkejr1aEjOJw0wF78ei0bOKIJqRXNcT8u2HZly
	W6FpCCImkgYNQELWI0eTYONm/YxksZgVWaiY/h5LcxtsruU3n69zIoolw4li1k4Bw2wm081k4aE
	3Bb1BjmdQ1NCTr6wtMi3Ya4opvmdapNcuSErV9ugjCXB5L3VJ51wgRq9+UbAAZD/cyce4
X-Gm-Gg: AR+sD13AljneXxHdhTpy2n8ywP+QqLtWTu82OgFOhkTyWZYK7SlynqTRM3Jyheb5B0O
	o+GucqQ+zNLHRyYLyg2Ttmb/xJBTuUfSezHKSE+vqel8TB4YN05uCRAFBVwCGv8X/zOWO8wXeqf
	PbxsHo/51209nm6XBichULniPPSK/Vzyi04NL14zp3Y3Cunvofp7f2X+vAZzUoIUAs3T0nEHcg0
	CgDyGKnPST9d4UC1SwWkHPftiER+sujjiwmIytPMntEQo3Jdr+q/84mnsD43PVbANvq2MPwoVEG
	Vu3SvqSNT/bOHhFolEj0u1RYKqm9MsDU3GJRCNGVBjHaeDxWN5dNXy5V0dQbK5Ur0S8iRpWrE1t
	KVvFKVGv3etFw1FJNIo7ngt8St/aFtJMTwzmhahwiBJEQkOh0uhWsiSxZf+8xgClFUmMntLLdDF
	WvLmcTMGmSHZovRw==
X-Received: by 2002:ac8:7c48:0:b0:51c:7b12:5ffa with SMTP id d75a77b69052e-52b387c930dmr49322891cf.86.1785455327805;
        Thu, 30 Jul 2026 16:48:47 -0700 (PDT)
X-Received: by 2002:ac8:7c48:0:b0:51c:7b12:5ffa with SMTP id d75a77b69052e-52b387c930dmr49322661cf.86.1785455327333;
        Thu, 30 Jul 2026 16:48:47 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2db9ba724sm634487e87.45.2026.07.30.16.48.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 16:48:46 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 02:48:29 +0300
Subject: [PATCH v9 08/19] media: iris: add vpu op hook to disable ARP
 buffer
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-iris-ar50lt-v9-8-d71a782001c0@oss.qualcomm.com>
References: <20260731-iris-ar50lt-v9-0-d71a782001c0@oss.qualcomm.com>
In-Reply-To: <20260731-iris-ar50lt-v9-0-d71a782001c0@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3062;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=gAZGcXI5Qu3MHvApOhouY0oNKw2Obip0DwkWx+cqYbI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqa+LKNZ11zB2ttARj3jPxQLU7BZ5dMCpNncZVg
 PKZKhEgpa+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCamviygAKCRCLPIo+Aiko
 1Xz1B/9MuLT0/hm9RarxnBl5aAraBXkRIIVjRtp19mSM/saiFZOg0Zihwqt3sfSVj92soTjz0kL
 89SWQbensvVTaEbt1p0e93WKkkhr14nR84FstN7jYhQWSoZY/Y8RWjiBo4Kwg5Y4CaDVTEvatoI
 XZDTY/zGfTjBk4q2k0Ygwcj1dJyOcmk9YN1y6n764acvo/+I8eCb72UznkWkowNul7PgibZQARe
 Dn9auSuMJlq2QLVJb33xKSkUAZotb+Vnd8CbPrlhq/lz3xjtDAIAW5v0qTCBnAD8M86qHwhqbEP
 if18mnSuQBKQmUXKKnytF+TMaUUBkjKJph1ZHyomXMNfKYkB
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: SScHw5rFNqK2yaTRahgaAvnKejgVwmgt
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDE2OCBTYWx0ZWRfX+Z5ojVyuz7W2
 MOb1ogPRJoypug7Tw9sOSvb2v+ToAENJewSd9m7MZAozEkBBEB3bk2Xmw4aFYdKeZWluaithZIU
 kVq3cC95WDX8z6kH0QC7euyFVWQnii0=
X-Proofpoint-ORIG-GUID: SScHw5rFNqK2yaTRahgaAvnKejgVwmgt
X-Authority-Analysis: v=2.4 cv=DconbPtW c=1 sm=1 tr=0 ts=6a6be2e1 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=vdBeo_PM3xCM7oyOFJQA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDE2OCBTYWx0ZWRfX5JVe5iM1KJnd
 BESpK1cbPjwLqJDtvnfWNDDxAoMsc9RfM4oPpgT0TYRS5wY9wR3iBZNxiGbksCQcrPSh3+p7wos
 3YXzcjBSULRqJ9LeT7cMre9FpKI7ohMkgdBdeHh6WjJ2ovPggsoDODldO1H37XXC9QJn7Ze6XND
 rD+O2C4NyErR/ULV7cb4Azo/nEcEuaVb1TxPpM+Um4l6omoWoO4g5cWfuAmNOE0V8uPFRu2zPla
 CEqNPt+FTkQrTD6xAMpn5N/SeKpysFQZKJjF+OsRNkspwkLONkVIX4XloQIbyNlGCx7wDy23Hmh
 sthI7UY0mKapdpfDvuNxT44oek9PI96hCWEQ06lz3YISNY0JBveJQ8XP0qbyu+iIOO0zBLZTab8
 oY6odGSrOKZqxB/Qk88hyepBVsgegLBLssCfTN+mEXWB5Hs1IZVcuvCm7hXBiVJF6L5wn9J30av
 4G4SpUaRW7b19NvO3FA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_07,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300168

From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

On AR50LT platforms AbsolutelyPerfectRouting (ARP) needs to be disabled
so firmware can configure the ARP internal buffer as non-secure for
encoder usage. In preparation of adding support for AR50LT platforms,
add an optional disable_arp callback to the VPU ops and invoke it from
core init and resume paths.

No functional change for existing platforms.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_core.c       | 4 ++++
 drivers/media/platform/qcom/iris/iris_hfi_common.c | 4 ++++
 drivers/media/platform/qcom/iris/iris_vpu_common.h | 1 +
 3 files changed, 9 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_core.c b/drivers/media/platform/qcom/iris/iris_core.c
index 676baa8087a8..d558475986ff 100644
--- a/drivers/media/platform/qcom/iris/iris_core.c
+++ b/drivers/media/platform/qcom/iris/iris_core.c
@@ -52,6 +52,7 @@ static int iris_wait_for_system_response(struct iris_core *core)
 
 int iris_core_init(struct iris_core *core)
 {
+	const struct vpu_ops *vpu_ops = core->iris_platform_data->vpu_ops;
 	int ret;
 
 	mutex_lock(&core->lock);
@@ -85,6 +86,9 @@ int iris_core_init(struct iris_core *core)
 	if (ret)
 		goto error_unload_fw;
 
+	if (vpu_ops->disable_arp)
+		vpu_ops->disable_arp(core);
+
 	core->iris_firmware_data->init_hfi_ops(core);
 	iris_session_init_caps(core);
 
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_common.c b/drivers/media/platform/qcom/iris/iris_hfi_common.c
index 8769ec61f117..8f04f3793d9a 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_common.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_common.c
@@ -144,6 +144,7 @@ int iris_hfi_pm_suspend(struct iris_core *core)
 
 int iris_hfi_pm_resume(struct iris_core *core)
 {
+	const struct vpu_ops *vpu_ops = core->iris_platform_data->vpu_ops;
 	const struct iris_hfi_sys_ops *ops = core->hfi_sys_ops;
 	int ret;
 
@@ -163,6 +164,9 @@ int iris_hfi_pm_resume(struct iris_core *core)
 	if (ret)
 		goto err_suspend_hw;
 
+	if (vpu_ops->disable_arp)
+		vpu_ops->disable_arp(core);
+
 	ret = ops->sys_interframe_powercollapse(core);
 	if (ret)
 		goto err_suspend_hw;
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.h b/drivers/media/platform/qcom/iris/iris_vpu_common.h
index 9151545065cd..71d96921ed37 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.h
@@ -24,6 +24,7 @@ struct vpu_ops {
 	int (*set_hwmode)(struct iris_core *core);
 	void (*set_preset_registers)(struct iris_core *core);
 	void (*interrupt_init)(struct iris_core *core);
+	void (*disable_arp)(struct iris_core *core);
 };
 
 int iris_vpu_boot_firmware(struct iris_core *core);

-- 
2.47.3

