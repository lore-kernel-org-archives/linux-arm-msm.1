Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD474314D1A
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 09:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784886594; cv=none; b=cK+a5GJNWs7NqJfb5euolbSE4eSiPwAoMqyhIfNBTU7v+Mvb/t4UDvugm4CPa6gxrSVXuyeOhKYKFZ2TT2Cd+GIc6Bk/88k9SfUMQoZ0KUpg575LrRvnA0GOQLS83GYOU5i2zwmMzi4vboExitHGrL7eEXJiCLtfDQMLZnItHxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784886594; c=relaxed/simple;
	bh=9IiThhlgGdRoYecOf0KfCkM2THGZsvFJP9Gc9AfcUJI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ud4jmqObN9oj1WHll/7miVCGIujAN4W0KjtnDicIFHHqKdQtIy6ESHvWOmTizUcRqtI9NkPMOUYkTl56HhWpPNEjaMK7T8CU/x/tuABJ8VpS3FVoxUrjR4cMi/gQVGVUAeb99I/1m7TfPGHFRLBk6kMS5TilsBrZZI7pufRaouk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RB8xumex; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PQOQc2dn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RB8xumex";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PQOQc2dn"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66O4lDll2275974
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 09:49:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Gk+h7L/tgiz
	KZ6Qx/taVDubKl52Owvm0JVk34OyToC4=; b=RB8xumexS2vx8xzfgqCJcjI5mlf
	haAIYvF9Btp8PafJfOgm5bshC6kQJi3pN4sTxPFOGEwRG2zPzg0+/6qnXUeeKMAm
	ZAXW23oSXfu/q0zam+SyDdGePAb62bzLi+thyWc7U43+0CTBYDRATn2lShel5+iz
	jn9ITr6eX5hLva43isz6x1yqkG9Pi+0HH9i8AkEfIM9I3k0Es31v3WrLT3BR4xZT
	enVeKy7A09JEaIZFE39b7tHmwNXqyQcrtto1G3VRRE8V9AnNHKEmLsJTS2oU2BFU
	d21xLgruWiQecadox8X0ZepRwM0kP8R5NdO4k1pByuYi0VC/dZp9tV02TZw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkqa0b5m7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 09:49:51 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cb74d5db64eso309995a12.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 02:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784886591; x=1785491391; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gk+h7L/tgizKZ6Qx/taVDubKl52Owvm0JVk34OyToC4=;
        b=PQOQc2dnNaTSh0K1Ux7+TCdsm8XQYRr5ccv26dNZKZh9GyMzf4b8dLopsuWHVc5hbA
         EZ6Gd27PMqsJHjjvSM94gjQuNNJ25DyOwx6vnArcpVC8TSp5AiW8g20uiJx8ZgBxZLlr
         AIOGVbbFmARzDx+Btcf/UKHg/KVNYIkN2ps4d9XnJwV1wrIWUWNQWXLAcYIkqwnb+TH5
         ipN8/CuW5cRUru91BqVJ4IMxeACsmL872NUYc9kOqza7uU23PQLctJq4SBxxRcOSypId
         b8zWO1QA2YP7iVpS6rjWG8LfaLu84KLBdXEGf5Xek8UOyKw/ycoLqiDCXBoNzsA99Ph+
         HfdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784886591; x=1785491391;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Gk+h7L/tgizKZ6Qx/taVDubKl52Owvm0JVk34OyToC4=;
        b=kVWg/cSap9Fu9ciLojRQWBrXjFImUPJrmVYi9n27Mi/PHiTYvFNqock4IgVqJMYG5M
         t1eHj0TOoVpe+ehV84lNOgm0B86kDA+4tQgpWbtHGZjNI1E/QsMXm3zlOI9VcD7TOxLX
         GmzTOnypT/oirsY1smUkALHQ0ZdMhLq1ASrc0E4Lx2vmz05jmmo8T0wRu2GbJMAVTxhr
         k8JUEA0yiAZNSMHkc+myROXt761fUIPw5eCO+qD73nUmExXL/fdvDNPxpLKekIHM7/hk
         cd0TbYmUIqhs2rwrhHoLdIzd/2hZNKwx+i1XA3qsV5XcsH6lqk0WzwwOqovz+6omPsMn
         JFWQ==
X-Gm-Message-State: AOJu0Yz8VAdNHQ7KN+0YmGiLv306zbcVWMDLdsMKWXwMskN0ETZu7AcU
	v/BIwSwgMNGQuFB/mnp+Z/G5yv6V1EpLfklLbH2P3odUJ9I3Z6CqrgpPgHe+R+DJZu2mZtFT8oI
	8/A4FsPmszlH7ClOplogD8+q+natmKTE0MrbNRTNei1pEU6tpq21KI8C4l2NfY9vZ0Sa/
X-Gm-Gg: AR+sD12XDBxdfQViVZbhVvZcN85DoMNezQKlzCgc79CToxwVH/OnmYbrDMwVTnqUo9W
	aPvGY1Y+AzdP1PEPbftmNKVMiWyWeR4JzWEW5zHc/ahScZGLW/2R8o4DwGObGdrcClz0cFwWjrO
	WolcbTgofWXM5Jt4tAeXDfrNaU/sWFqE+D0Lf2MHUmxdRx5pwoanBRXNd2yCyIGzWfujpeoMEMF
	X/tKae9aHywRJLErHOfaMlZzFCwI3zAqv1RxEWntEvQ1tBHwfZS/HJSV11BxDHtOEJtZqaMupr/
	G3nNPcHCKSbS6TkMamRH2T+mHkoAdp4H2n7+C3tRfHJwa87Xp8QpBe8afcCszgWSD3zeB0mz5s7
	PAAzd4CjwwEOlEWfePzCItcYWgHE=
X-Received: by 2002:a05:6a21:6b0f:b0:3c3:875d:c538 with SMTP id adf61e73a8af0-3c44afb1a94mr8180690637.8.1784886590814;
        Fri, 24 Jul 2026 02:49:50 -0700 (PDT)
X-Received: by 2002:a05:6a21:6b0f:b0:3c3:875d:c538 with SMTP id adf61e73a8af0-3c44afb1a94mr8180672637.8.1784886590327;
        Fri, 24 Jul 2026 02:49:50 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbb8f1a8a7csm3961013a12.24.2026.07.24.02.49.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 02:49:50 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Elliot Berman <quic_eberman@quicinc.com>,
        Andrew Halaney <ahalaney@redhat.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v4 1/3] firmware: qcom: scm: Fix NULL dereference in IRQ handler before __scm is published
Date: Fri, 24 Jul 2026 15:19:37 +0530
Message-ID: <20260724094939.613844-2-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260724094939.613844-1-mukesh.ojha@oss.qualcomm.com>
References: <20260724094939.613844-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Jw7AKmCd1wa7gWlxYqzzN0L102FrOooN
X-Proofpoint-GUID: Jw7AKmCd1wa7gWlxYqzzN0L102FrOooN
X-Authority-Analysis: v=2.4 cv=e/k2j6p/ c=1 sm=1 tr=0 ts=6a63353f cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=oeUS87UVm4c7YcJ927QA:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA4OSBTYWx0ZWRfX+9EZ9lgekkOY
 8DhlHKCvMs6be1e9fuQb8xSFa9XmIKwnWeVImRiOD99XpYf+NeS0baa18XaHh8crmuB9OBtm2OZ
 SjORcnDL88+/LXo5MRM0rBK+8hjrkn5bqti8VDTuCecUGXivXu09NtIhpZqh5Sys5liZ0qiSU00
 W0vvkVSYWE2cJl+8l4SY4ZSpo7uFOUCon/TTZo9ATavIJComEI41In3COogcI5n+zcdAQNSO7FL
 bIHdkq40cSmd/mzRL+OSibL0G1VEJtYdEGxo9Zz83JXhSWl+iooFXNrrguDXsKbjRxZin1p4OrN
 O+E8GU5rGIHt1+k5+WmwPPmrYDgrBZou7FlzsnZN7FGpPM1qQmOLGpAoQH1hC2O/XC79p/vEQ9u
 +ccBe+/Jv64dU3mE0OkbwLyVOKhlgMnoIBs9xLiRkP4HwV4vH/USSt1xhRePRnxjYRLgyoUqCVb
 mnmWOOOti4FOYcU7/EA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA4OSBTYWx0ZWRfX3lMuTLxn9Tgv
 ejBRoI/mTkK8vwRnx9Viy6+MT2YUBgWT3IUoNiFF7jFpiJZkaIfqZ4sFdOeisoYgGAMDFSiI9QN
 AcBdGmxrshaJohBW+ZcxIoSSqPcf+Pk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607240089

In qcom_scm_probe(), devm_request_threaded_irq() is called before
smp_store_release(&__scm, scm). Two paths can dereference __scm before
it is published, both causing a NULL pointer dereference.

The IRQ handler receives scm via its data argument but passes only wq_ctx
to qcom_scm_waitq_wakeup() and qcom_scm_get_completion(), which then
dereference __scm directly. Thread scm through both functions so the IRQ
handler path never touches __scm.

Non-atomic SMC calls made during probe (e.g. from qcom_tzmem_init via
qcom_scm_shm_bridge_enable) can return WAITQ_SLEEP, causing
qcom_scm_wait_for_wq_completion() to run before __scm is published and
dereference it. Add platform_set_drvdata(pdev, scm) early in probe and
change qcom_scm_wait_for_wq_completion() to take the device pointer and
use dev_get_drvdata() to reach scm, removing any dependency on __scm.

Fixes: 6bf325992236 ("firmware: qcom: scm: Add wait-queue handling logic")
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm-smc.c |  2 +-
 drivers/firmware/qcom/qcom_scm.c     | 22 ++++++++++------------
 drivers/firmware/qcom/qcom_scm.h     |  2 +-
 3 files changed, 12 insertions(+), 14 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm-smc.c b/drivers/firmware/qcom/qcom_scm-smc.c
index 01999c22659c..127365ab11fc 100644
--- a/drivers/firmware/qcom/qcom_scm-smc.c
+++ b/drivers/firmware/qcom/qcom_scm-smc.c
@@ -111,7 +111,7 @@ static int __scm_smc_do_quirk_handle_waitq(struct device *dev, struct arm_smccc_
 			smc_call_ctx = res->a2;
 
 			trace_scm_waitq_sleep(wq_ctx, smc_call_ctx);
-			ret = qcom_scm_wait_for_wq_completion(wq_ctx);
+			ret = qcom_scm_wait_for_wq_completion(dev, wq_ctx);
 			if (ret)
 				return ret;
 
diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index f35f2ee39130..3b271948d326 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2644,23 +2644,20 @@ static int qcom_scm_get_waitq_irq(struct qcom_scm *scm)
 	return irq_create_fwspec_mapping(&fwspec);
 }
 
-static struct completion *qcom_scm_get_completion(u32 wq_ctx)
+static struct completion *qcom_scm_get_completion(struct qcom_scm *scm, u32 wq_ctx)
 {
-	struct completion *wq;
-
-	if (WARN_ON_ONCE(wq_ctx >= __scm->wq_cnt))
+	if (WARN_ON_ONCE(wq_ctx >= scm->wq_cnt))
 		return ERR_PTR(-EINVAL);
 
-	wq = &__scm->waitq_comps[wq_ctx];
-
-	return wq;
+	return &scm->waitq_comps[wq_ctx];
 }
 
-int qcom_scm_wait_for_wq_completion(u32 wq_ctx)
+int qcom_scm_wait_for_wq_completion(struct device *dev, u32 wq_ctx)
 {
+	struct qcom_scm *scm = dev_get_drvdata(dev);
 	struct completion *wq;
 
-	wq = qcom_scm_get_completion(wq_ctx);
+	wq = qcom_scm_get_completion(scm, wq_ctx);
 	if (IS_ERR(wq))
 		return PTR_ERR(wq);
 
@@ -2669,11 +2666,11 @@ int qcom_scm_wait_for_wq_completion(u32 wq_ctx)
 	return 0;
 }
 
-static int qcom_scm_waitq_wakeup(unsigned int wq_ctx)
+static int qcom_scm_waitq_wakeup(struct qcom_scm *scm, unsigned int wq_ctx)
 {
 	struct completion *wq;
 
-	wq = qcom_scm_get_completion(wq_ctx);
+	wq = qcom_scm_get_completion(scm, wq_ctx);
 	if (IS_ERR(wq))
 		return PTR_ERR(wq);
 
@@ -2700,7 +2697,7 @@ static irqreturn_t qcom_scm_irq_handler(int irq, void *data)
 			goto out;
 		}
 
-		ret = qcom_scm_waitq_wakeup(wq_ctx);
+		ret = qcom_scm_waitq_wakeup(scm, wq_ctx);
 		if (ret)
 			goto out;
 	} while (more_pending);
@@ -2804,6 +2801,7 @@ static int qcom_scm_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	scm->dev = &pdev->dev;
+	platform_set_drvdata(pdev, scm);
 	ret = qcom_scm_find_dload_address(&pdev->dev, &scm->dload_mode_addr);
 	if (ret < 0)
 		return dev_err_probe(&pdev->dev, ret,
diff --git a/drivers/firmware/qcom/qcom_scm.h b/drivers/firmware/qcom/qcom_scm.h
index caab80a73e17..cf90a565fdfb 100644
--- a/drivers/firmware/qcom/qcom_scm.h
+++ b/drivers/firmware/qcom/qcom_scm.h
@@ -66,7 +66,7 @@ struct qcom_scm_res {
 	u64 result[MAX_QCOM_SCM_RETS];
 };
 
-int qcom_scm_wait_for_wq_completion(u32 wq_ctx);
+int qcom_scm_wait_for_wq_completion(struct device *dev, u32 wq_ctx);
 int scm_get_wq_ctx(u32 *wq_ctx, u32 *flags, u32 *more_pending);
 
 #define SCM_SMC_FNID(s, c)	((((s) & 0xFF) << 8) | ((c) & 0xFF))
-- 
2.53.0

