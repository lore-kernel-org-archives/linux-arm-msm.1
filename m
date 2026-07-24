Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B95044A71D
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 18:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784917768; cv=none; b=MD4StavVlhOFdsv6AOnFvzroIX1vwHyuo+HAbZdORoW6vchVhG3IMgW2aKz3o1+HJJ4z3EoVJpwZeDw8BRZQ6UMveax6T6WibTG2deTvWJ88pq6rOA4GvqpEyXX4RRFMWc59jaD6UPY//LvBNshOjxKoHKN7gvgQT9vKAM/P1oU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784917768; c=relaxed/simple;
	bh=milOFmWGURAJNSSi4R2QpUG8T/VDU+8+DlqPQR/oqk8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mfiCp8tV7xz5xxIKkdjMxCltJ8+RPEp985ef6kS5q/dD2UuzCMHyGvrJJOj2CVgvLBKR0E7q3QZ8AEHvMsuMDCblrT1G61hUoYg3oCfWOG/UXwskULEPl7oL+mk91AMNcdxZ3Uz2Guf7sce02NeVdgMaA7QlJv13sp454gs/88I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OGBZbYcH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i7lqY0VF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OGBZbYcH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i7lqY0VF"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OGqQP4594616
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 18:29:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=5O12LMg4XAF
	mIxgX1qOeWfAhbvIHdzCMm5DeiKIJXow=; b=OGBZbYcHfIlDVgzt9FrXE8zANJk
	Y9nDv6CwrOOgyRT8PayxXMlUGQGAIRKn+RKYx7iG23LuaUuMvv5N+6+hV+b42R9Q
	KLlpFT4rLC9MBj+fKqRi/6lJ7y9CziknZUsqLFawANUhD7ts6taqocQkwJ57Rc8G
	HS6998287LILUeH0MMce4/dgU74G/8a0PEb3zqQ3gD75wBH6BFVexKVpZbEVSWKK
	8gVgtWZlMfgL9XX4cghl1p30geKX8DIy8SUDgvYd7kEeCg2Si3jnlE3hXZ1sxiEX
	C9SIymDgVSdgRXWW18G+xh7gPgqxKLNX4jRgoYdBaz01PF4LwcT9cRGfJBQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm8ck96nh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 18:29:26 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cb6dd278512so475037a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 11:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784917766; x=1785522566; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5O12LMg4XAFmIxgX1qOeWfAhbvIHdzCMm5DeiKIJXow=;
        b=i7lqY0VFGGQbxv96w8jzRPOl+BXD5/Tt7JTupwrYDdsE8t225JZF3NIH2piFqzgZzv
         NAwjTBvkUzh5d16g9JH47Eo5FP9Ffja0h1pPNBtE0Tme689SJSMOl6hiuKazFJK6dnhK
         5g7CiGniV3JJVQsR2SdX2/PUsEdYdIpJCpMzD2NDy35PiYnvaG1nF0UAQFoP5l/u0DMj
         VT3MY3ndwS2pGVqTxqXa3WEs1do30Is5c/HLLU+woZjaKFGimmqb4kqj/mO4qVF/UouY
         NkC8Ul4ZZi6UFjCxwD5OrCk7HjptMhYeNsodRvG0mMXQLkJ667s87AY/va6TaXJzfILk
         H07A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784917766; x=1785522566;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5O12LMg4XAFmIxgX1qOeWfAhbvIHdzCMm5DeiKIJXow=;
        b=KWZaXXWHppgG5PRdwt5x7Vr0+ztHVCepgPpgKGuEtIkhnNISC4m+D4Z2yCKnXA+nIf
         470pkK+waWt4NtWm7wDcdW/IvMjaJC9MDTLTVcTZjxH7UF5B/405lLPVFu9f++CBoEkE
         sHmkugqIdGA0RJ3WAykgPbavc4qDBo51vaLlZsZ41Ng7vSiqd4VPdBQbo0n0zLEIFFD5
         r+GDg4CBEW99y4yf3bMZ2DwdeV5k8yFdphfqT/LFaLrtp9zGJY30UcF7dP5qkd/S/8xX
         7/EgbaH1u40ijR6jjiQCfVZerERnGuTA+A1zQ0k7atnoJbjql7bLp9pC5vU3B8dtg6pM
         jYMA==
X-Gm-Message-State: AOJu0YwFoMPSdCgRnUIOj8Hu4fmsi7tCnQAnl9+7tqpv9atDux8slQqm
	l9jjOoa7bAmRYtc+nNCKsyW3gQgXpSU3yOATH2gvR/FXRYsm9e/72yJsC4ywidxnbmM2le8Z0HR
	VMi8FiABAtFflhqYjPTXWn2TNF0INlrdUtrq4vti5urj0b03vSjabxigxwma3cxjzdJIg
X-Gm-Gg: AR+sD13mgSm6uRPFZ8wxrOn3kbVRQ/SiNnwY+RYUU1rDdyrCPqrqw1hOvlxkoMElD59
	sHoElBZT2Z2XnVy1z1gFGyWrV7MlDMQE/FM1xYidYXAAywx1gVp4Inhd6S2YM8i70wJhU0aQsmq
	K/CsXy1HkzkkEoZ6sCp+0conVBQNKV6R9riB3GRG0oMgKERBxUEKRcJPkbv4MVxnKhxsOpgLJDp
	ku5tCMSzmgLaDQ43A1Sblg5uuQ41hBBODrGa221vZ6a4+487Xrt0cXz5nTnn3E2dqaVpTSzNhTb
	mobBeMvr13j1BTGyhZtXSV02NdqrheCd51XoOFo60sJ6fyBkaQ1uQ0qmSejKDoeiN3a7dNJyny5
	tnQJkHjOqYQobHy6NoZXenjpnQTY=
X-Received: by 2002:a05:6a21:748e:b0:3bf:9e25:1a18 with SMTP id adf61e73a8af0-3c44b2440b1mr9523940637.52.1784917765425;
        Fri, 24 Jul 2026 11:29:25 -0700 (PDT)
X-Received: by 2002:a05:6a21:748e:b0:3bf:9e25:1a18 with SMTP id adf61e73a8af0-3c44b2440b1mr9523896637.52.1784917764831;
        Fri, 24 Jul 2026 11:29:24 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc5c53f3sm1341510eec.30.2026.07.24.11.29.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 11:29:24 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v5 4/6] remoteproc: qcom: pas: Map/unmap subsystem region before auth_and_reset
Date: Fri, 24 Jul 2026 23:58:56 +0530
Message-ID: <20260724182858.1868271-5-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260724182858.1868271-1-mukesh.ojha@oss.qualcomm.com>
References: <20260724182858.1868271-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDE2NiBTYWx0ZWRfX+JR7awiqekRx
 b38VYkZcR9TN/eJdFmjo3UftQnhEbyVsW14QmLdNKAM+IVdqhjjdBVKhH/Cot53U2CSTQg6cRkH
 T/EI34GWSzkoKh0y6niUeHTm3GIAzkd2Ex9pSGnXD2hEPm3t3zuMKr+JCMr9OA6FI3Id4FNjqTt
 1d/sdKmrvI6opj3AeRhQc1fj8xBZ/0yXZ16neFqYoIt8Mr1loQI0gIVBKIt0ns4KOnht3ljUWlE
 4ZFEU1+KCe2SOyJhbvRsDKa4GrKHgZUC7n8QzXxoBJp/Pv1QME6XlFp3vJ7GKWXN6nrLAUUAIET
 rXe1O/IqSq7MifXlQbNWjD9ca3ZyqNk9zul7zRfIr8Xe9CUJ1w3c68VzdYKBzz2hoqDrR/mBHgm
 Yp5vmKKG2G06EPst8jPhUvoiiU+O+PcrEQcdU6tNxWVe5Kjn1pS2fIYSUl06Qpb88Hms48ySHkS
 Pl212CnHEJ22rnBoJZg==
X-Proofpoint-GUID: delhaXYPpFbmKht0jZNHKPgFJqylfw-H
X-Proofpoint-ORIG-GUID: delhaXYPpFbmKht0jZNHKPgFJqylfw-H
X-Authority-Analysis: v=2.4 cv=F79nsKhN c=1 sm=1 tr=0 ts=6a63af06 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=TfPgvF6n5GBQfkPxsSAA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDE2NiBTYWx0ZWRfX9yKRkU8NAqaQ
 vxDN+r6GO3DOntVmgNhIW/jPuQSLuAWd6fKy/OvZW7UQVMJQSL53m35nB6VTvUiurFMkkGI6Nqq
 8CEbbu5yrG5VXnsIji//LEHPTJLua88=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 suspectscore=0 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240166

Qualcomm remoteproc drivers such as qcom_q6v5_mss, which do not use the
Peripheral Authentication Service (PAS), always map the MBA region before
use and unmap it once the usage is complete. This behavior was introduced
to avoid issues seen in the past where speculative accesses from the
application processor to the MBA region after it was assigned to the remote
Q6 led to an XPU violation. The issue was mitigated by unmapping the region
before handing control to the remote Q6.

Currently, most Qualcomm SoCs using the PAS driver run either with a
standalone QHEE or the Gunyah hypervisor. In these environments, the
hypervisor unmaps the Q6 memory from HLOS Stage-2 and remaps it into the
Q6 Stage-2 page table. As a result, speculative accesses from HLOS cannot
reach the region even if it remains mapped in HLOS Stage-1; therefore, XPU
violations cannot occur.

However, when the same SoC runs Linux at EL2, Linux itself must perform the
unmapping to avoid such issues. It is still correct to apply this mapping/
unmapping sequence even for SoCs that run under Gunyah, so this behavior
should not be conditional.

Introduce qcom_pas_ctx_map() in qcom_pas.h to centralise the ioremap_wc
pattern used by both qcom_q6v5_pas and qcom_mdt_pas_load, and use it in
both places.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c     | 35 ++++++++++++++++----------
 drivers/soc/qcom/mdt_loader.c          | 15 ++++++++---
 include/linux/firmware/qcom/qcom_pas.h | 12 +++++++++
 include/linux/soc/qcom/mdt_loader.h    |  4 +--
 4 files changed, 47 insertions(+), 19 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 997b3a7ce672..5cd34086ccac 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -150,7 +150,13 @@ static void qcom_pas_minidump(struct rproc *rproc)
 	if (rproc->dump_conf == RPROC_COREDUMP_DISABLED)
 		return;
 
+	pas->mem_region = qcom_pas_ctx_map(pas->pas_ctx);
+	if (!pas->mem_region)
+		return;
+
 	qcom_minidump(rproc, pas->minidump_id, qcom_pas_segment_dump);
+	iounmap(pas->mem_region);
+	pas->mem_region = NULL;
 }
 
 static int qcom_pas_pds_enable(struct qcom_pas *pas, struct device **pds,
@@ -243,8 +249,7 @@ static int qcom_pas_load(struct rproc *rproc, const struct firmware *fw)
 		}
 
 		ret = qcom_mdt_pas_load(pas->dtb_pas_ctx, pas->dtb_firmware,
-					pas->dtb_firmware_name, (__force void *)pas->dtb_mem_region,
-					&pas->dtb_mem_reloc);
+					pas->dtb_firmware_name, &pas->dtb_mem_reloc);
 		if (ret) {
 			qcom_pas_metadata_release(pas->dtb_pas_ctx);
 			release_firmware(pas->dtb_firmware);
@@ -318,7 +323,7 @@ static int qcom_pas_start(struct rproc *rproc)
 	}
 
 	ret = qcom_mdt_pas_load(pas->pas_ctx, pas->firmware, rproc->firmware,
-				(__force void *)pas->mem_region, &pas->mem_reloc);
+				&pas->mem_reloc);
 	if (ret)
 		goto release_pas_metadata;
 
@@ -570,6 +575,19 @@ static int qcom_pas_attach(struct rproc *rproc)
 	return ret;
 }
 
+static void qcom_pas_coredump(struct rproc *rproc)
+{
+	struct qcom_pas *pas = rproc->priv;
+
+	pas->mem_region = qcom_pas_ctx_map(pas->pas_ctx);
+	if (!pas->mem_region)
+		return;
+
+	rproc_coredump(rproc);
+	iounmap(pas->mem_region);
+	pas->mem_region = NULL;
+}
+
 static const struct rproc_ops qcom_pas_ops = {
 	.unprepare = qcom_pas_unprepare,
 	.start = qcom_pas_start,
@@ -579,6 +597,7 @@ static const struct rproc_ops qcom_pas_ops = {
 	.load = qcom_pas_load,
 	.panic = qcom_pas_panic,
 	.attach = qcom_pas_attach,
+	.coredump = qcom_pas_coredump,
 };
 
 static const struct rproc_ops qcom_pas_minidump_ops = {
@@ -696,11 +715,6 @@ static int qcom_pas_alloc_memory_region(struct qcom_pas *pas)
 
 	pas->mem_phys = pas->mem_reloc = res.start;
 	pas->mem_size = resource_size(&res);
-	pas->mem_region = devm_ioremap_resource_wc(pas->dev, &res);
-	if (IS_ERR(pas->mem_region)) {
-		dev_err(pas->dev, "unable to map memory region: %pR\n", &res);
-		return PTR_ERR(pas->mem_region);
-	}
 
 	pas->pas_ctx = devm_qcom_pas_context_alloc(pas->dev, pas->pas_id,
 						   pas->mem_phys, pas->mem_size);
@@ -718,11 +732,6 @@ static int qcom_pas_alloc_memory_region(struct qcom_pas *pas)
 
 	pas->dtb_mem_phys = pas->dtb_mem_reloc = res.start;
 	pas->dtb_mem_size = resource_size(&res);
-	pas->dtb_mem_region = devm_ioremap_resource_wc(pas->dev, &res);
-	if (IS_ERR(pas->dtb_mem_region)) {
-		dev_err(pas->dev, "unable to map dtb memory region: %pR\n", &res);
-		return PTR_ERR(pas->dtb_mem_region);
-	}
 
 	pas->dtb_pas_ctx = devm_qcom_pas_context_alloc(pas->dev, pas->dtb_pas_id,
 						       pas->dtb_mem_phys,
diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
index 137992456b71..002100fe2d32 100644
--- a/drivers/soc/qcom/mdt_loader.c
+++ b/drivers/soc/qcom/mdt_loader.c
@@ -11,6 +11,7 @@
 #include <linux/device.h>
 #include <linux/elf.h>
 #include <linux/firmware.h>
+#include <linux/io.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/firmware/qcom/qcom_pas.h>
@@ -478,22 +479,28 @@ EXPORT_SYMBOL_GPL(qcom_mdt_load);
  * @ctx:        Pointer to the PAS (Peripheral Authentication Service) context
  * @fw:         Firmware object representing the .mdt file
  * @firmware:   Name of the firmware used to construct segment file names
- * @mem_region: Memory region allocated for loading the firmware
  * @reloc_base: Physical address adjusted after relocation
  *
  * Return: 0 on success or a negative error code on failure.
  */
 int qcom_mdt_pas_load(struct qcom_pas_context *ctx, const struct firmware *fw,
-		      const char *firmware, void *mem_region, phys_addr_t *reloc_base)
+		      const char *firmware, phys_addr_t *reloc_base)
 {
+	void __iomem *mem_region;
 	int ret;
 
 	ret = __qcom_mdt_pas_init(ctx->dev, fw, firmware, ctx->pas_id, ctx->mem_phys, ctx);
 	if (ret)
 		return ret;
 
-	return qcom_mdt_load_no_init(ctx->dev, fw, firmware, mem_region, ctx->mem_phys,
-				     ctx->mem_size, reloc_base);
+	mem_region = qcom_pas_ctx_map(ctx);
+	if (!mem_region)
+		return -ENOMEM;
+
+	ret = qcom_mdt_load_no_init(ctx->dev, fw, firmware, (__force void *)mem_region,
+				    ctx->mem_phys, ctx->mem_size, reloc_base);
+	iounmap(mem_region);
+	return ret;
 }
 EXPORT_SYMBOL_GPL(qcom_mdt_pas_load);
 
diff --git a/include/linux/firmware/qcom/qcom_pas.h b/include/linux/firmware/qcom/qcom_pas.h
index 65b1c9564458..fb2ec3be6a16 100644
--- a/include/linux/firmware/qcom/qcom_pas.h
+++ b/include/linux/firmware/qcom/qcom_pas.h
@@ -8,7 +8,9 @@
 #ifndef __QCOM_PAS_H
 #define __QCOM_PAS_H
 
+#include <linux/device.h>
 #include <linux/err.h>
+#include <linux/io.h>
 #include <linux/types.h>
 
 struct qcom_pas_context {
@@ -22,6 +24,16 @@ struct qcom_pas_context {
 	bool use_tzmem;
 };
 
+static inline void __iomem *qcom_pas_ctx_map(struct qcom_pas_context *ctx)
+{
+	void __iomem *ptr = ioremap_wc(ctx->mem_phys, ctx->mem_size);
+
+	if (!ptr)
+		dev_err(ctx->dev, "unable to map memory region: %pa+%zx\n",
+			&ctx->mem_phys, ctx->mem_size);
+	return ptr;
+}
+
 bool qcom_pas_is_available(void);
 struct qcom_pas_context *devm_qcom_pas_context_alloc(struct device *dev,
 						     u32 pas_id,
diff --git a/include/linux/soc/qcom/mdt_loader.h b/include/linux/soc/qcom/mdt_loader.h
index 142409555425..74886f772d46 100644
--- a/include/linux/soc/qcom/mdt_loader.h
+++ b/include/linux/soc/qcom/mdt_loader.h
@@ -21,7 +21,7 @@ int qcom_mdt_load(struct device *dev, const struct firmware *fw,
 		  phys_addr_t *reloc_base);
 
 int qcom_mdt_pas_load(struct qcom_pas_context *ctx, const struct firmware *fw,
-		      const char *firmware, void *mem_region, phys_addr_t *reloc_base);
+		      const char *firmware, phys_addr_t *reloc_base);
 
 int qcom_mdt_load_no_init(struct device *dev, const struct firmware *fw,
 			  const char *fw_name, void *mem_region,
@@ -47,7 +47,7 @@ static inline int qcom_mdt_load(struct device *dev, const struct firmware *fw,
 
 static inline int qcom_mdt_pas_load(struct qcom_pas_context *ctx,
 				    const struct firmware *fw, const char *firmware,
-				    void *mem_region, phys_addr_t *reloc_base)
+				    phys_addr_t *reloc_base)
 {
 	return -ENODEV;
 }
-- 
2.53.0

