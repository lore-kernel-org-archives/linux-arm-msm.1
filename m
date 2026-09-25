Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76F8C3A7F78
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 16:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790355173; cv=none; b=FRl94c0ohXdRnmFfR5uD96RXW/Bl3pBmhmiPPSGnyWaMWb7umgVhDlCbomX6XgeTuYlYwgHDSjzSr3lBCY2ypeuqaJm28jjoS/fAAnrXI46hUB+V8h9XSsh8Tudls3DmSAbjeQemqps0hwZipT6Yl1VUZ6NIIuDlxRaKEfemR/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790355173; c=relaxed/simple;
	bh=XPMq30xEgQ8dtmDEF1xK65u+nuNkxIbYPl0WkEp5J+o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=E9BLHcgoFmaDnmPfj3hSvsRieAO4KFKr5G/B8S+SPQXiXotqaRwwqXEOO7+u9MOj+RTOrmVLvBcRS4irKCLf35l8QXGFL7fCERSAKqVgScl5CEZsOawWRxsaLsGFycsQB+8dORDiwp1Yvw7xV4NYTRysXmdQm4iBI3H4SxZ3tvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FH2OnJUc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fYeQ47XR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FH2OnJUc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fYeQ47XR"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PG1KEI796573
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 16:52:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=ZWQJkcD/kTQIRVekd9f8uBuFn6Kid1lHE+i
	kneyzsNs=; b=FH2OnJUcJKzR6etr06VCWY7F2vTLkk0/bC11smXGZVZ9kR1/lS8
	Vz1CBjPIbRv91wP8mNFKYKMXRBFsSQrFgnQEq3rou4vP5TFj4PgIiX5DtzXgDiU+
	hcIoYlY1ICPsvB6LGUvhsrR2YWpCnkA9s8YNSANAylVuLF56C/Y/7ea9RXu+jfjf
	uoV76KENCzuZXcnNkUbWyDlJCBrUX+ZHdnyCqK2rOA/4EHg52/ds1P1vtpq0/PzZ
	sJsUsl1wrnH/wavJLnLE205F0MyLobWfiTweoghpEbA7yNVxotrnskA082tfezop
	t9Lw1OjVb1p5gXpE6HG0ZckXBGxRpZ7Fw9A==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwjq3ab41-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 16:52:40 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-9143a95c6b9so11203806d6.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 09:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790355160; x=1790959960; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZWQJkcD/kTQIRVekd9f8uBuFn6Kid1lHE+ikneyzsNs=;
        b=fYeQ47XRsrQ5spF35+ULNLoMSbuw85OhIJ8JjCD+rTBjUo5r4vhBAaciM1junK6kEX
         n+u21KjESV7GrcUUl5+lHvnuvVuf6eluprouhoUHZqD/aXwkfY0x5eDbIJW7OUHuBRwK
         nJS1RBaOI3l+CY9nmGisCZyg4UsQapFJBCRnHR4zDR8J7n1EfyoLsAueEjpVGwenSfi1
         Jb2qMB0Sackd2NpSGxKzqct/Y+7lRbzbo0llG2/PX/46TTCaGm+uo1Rjv8kk3t/Na4FX
         RgIo9Z1A4Ud/yVMbxmEgh6p3BVdi31SmFjDroz5izlN9rtCpj1d1eJtKgsZcik8d7PMZ
         Ztig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790355160; x=1790959960;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZWQJkcD/kTQIRVekd9f8uBuFn6Kid1lHE+ikneyzsNs=;
        b=qCgIKTprArl7O1LCdrX8Iv/pOspX0Tq6bRgokTyVmN1gq5DUdHaVsbw9FoFeENEkRj
         u/kJ/rg0w2wnvuUSlsGFiTLyCQ1Y7KD+qaAHtbagefZ8BRxiASv3w7l0L88HOkDUuaLX
         RIZumHSA1B8OyW7SiWx7zc3/Ql/NRQgn2Lq6cKo9Al5YYrgPe+z9tlcHGmuq6KgIW459
         iMkhRg/mtHw5VQglo9fR30445FDpuVqhAKfGNbzsS+AHBId69QzEIIFgv3ggChBh+4ek
         aYg2qga68WyjcvakM9S0mVNUEBYgLvDjzaf+nybtDCQroO5qvf5JzcAdGeLR2ybsAMXz
         yk0Q==
X-Forwarded-Encrypted: i=1; AKwUvBzx2pwbEAwRYZEWiUp1kIrR85MybuFYs9WQJmEIam6v6mbBYRyPNHyLRNHi3n/0Xhm/ua3IBHA2OCvLZ2J4@vger.kernel.org
X-Gm-Message-State: AFuF++l/oq+4qQMX/Cw7JvuduY2yeJU8LvGRqZY1EfcFfw4vFbzOg2IL
	n3qgUuqKhCTz/M5NAM3AVaLEKjL5IdK84Pq+9Qi4EWoJ/zXAp3AohgqLXjG4vz7rBlFAJTqQoTl
	Jy9rsXzw09IenJHDNq/DBii4jSp6MrabvkDgQNIYEkT3kcMcFf/ZLm4WyGJPNplc73glF7/z7q7
	YX
X-Gm-Gg: AYBFou27DayqaBeyeKvd6tRv+9hve2zr8sOOJ7Vu9gLPbOFvhgZtZCsgZ+9ai0XIUCt
	M73z3VJyeDBO/ac+mBCYDoVRrX6nL8/K73dV1kPLYqEEjRuWNvwr3HekTX9Uiwv1HjnMqB3gUP7
	dVrPY42bceuQdDRiOUcENQUm4IuEwwPnMRRTSPDubslJz5nounUtovicSBIf887d/gXZwMMz/JL
	NfpgjRfF/AVC88ua4BpQTyKhjyf5BzED23u016eeUMl65UP49YNjlgqnvCvtIzPIp+XICYIPphF
	DGhyrOFnzWAdcytE//a4fYqEktnoWsX7ZecNP/WWWJ0Og25X0N1NfHinbIXPKHeOhICu9blbLAq
	dVcXM6lJO9HDCNbMVWZGDTQemKEc=
X-Received: by 2002:a05:6214:2b8c:b0:910:3453:fc0 with SMTP id 6a1803df08f44-9142f8fb8bdmr50170326d6.16.1790355159886;
        Fri, 25 Sep 2026 09:52:39 -0700 (PDT)
X-Received: by 2002:a05:6214:2b8c:b0:910:3453:fc0 with SMTP id 6a1803df08f44-9142f8fb8bdmr50169846d6.16.1790355159275;
        Fri, 25 Sep 2026 09:52:39 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91430da9123sm21023336d6.16.2026.09.25.09.52.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 09:52:38 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v8] firmware: qcom: pas: Make MDT buffer retention explicit
Date: Fri, 25 Sep 2026 22:22:31 +0530
Message-ID: <20260925165231.10722-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA2NyBTYWx0ZWRfXwKjTK3FmHxKv
 pQbgGq1Wc3faOMc8ytdtEmYMJ+13xTBIBtzUc/lBf6oveQPW+QGbkHaGFwTGeA1isd13v3Vxwuq
 yGHoVydFGthC475+DJ+xzeShFHkq1M0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA2NyBTYWx0ZWRfX3RT08hgCW1iX
 hehprOFDy2N47+dYns3tEg+85SW/9urMMIUerAC9M3BaafaxrGSUVsm9xN0K3U7y3veX7CytIGl
 irOOcdbL5wxMANIiow1XpchMkPj581p11ej9nd1wKN1JRboZZZAr7VCuyldwnvW39XUZZ/QF1k2
 4TnS1CsUsUgQZqJWKAvUPNga+7TbiIfNj637tlc66aLbFXM4aCMPVQxqXtar+NyaxHpLdIVEU4V
 PEJrBRugMFBgeFCc8Rz0gONCoqnW2YmJPRFbbyYlF0h3wLH2/Ip8lsQieX1z+V2w2E1iqWPQeWW
 E3ewy79u16zP5H7Isr/dNRrue1yC8vPKtQ1I7o9jEYDqwKogRmr6slSBR5UFMVtFfxt0z4qNgZA
 TpO5S5BySvoX02CYErcKtT+V+jUPC6sD/PhzgSwAXIV9/ofkp6Z6nAX39ATT87z3F3J1r+f9gTp
 6Dym/chm7pfvcJREyqg==
X-Authority-Analysis: v=2.4 cv=VuO2kO2n c=1 sm=1 tr=0 ts=6ab6a6d8 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=bTXooOE2z_dFbhIuKS0A:9 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: qE7XU87sbY-GaKL8OrMK4UwzAObxQlyU
X-Proofpoint-ORIG-GUID: qE7XU87sbY-GaKL8OrMK4UwzAObxQlyU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609250067

The PAS image initialization path retains metadata whenever a valid
qcom_pas_context is supplied, although callers may not need the metadata
after initialization. This leaves ownership implicit and causes unused
metadata buffers to remain allocated.

Add keep_mdt_buf to struct qcom_pas_context and have the generic PAS
wrapper release metadata unless the caller requests retention. This applies
uniformly to SCM and OP-TEE backends, while qcom_q6v5_pas keeps metadata
for subsequent PAS operations.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
Changes in v8:
 - Commit rephrased a bit.
 - Make the commit aware of all present backends(scm and tee).
 - Link to v7: https://lore.kernel.org/lkml/20260920074919.3338358-1-mukesh.ojha@oss.qualcomm.com/

Changes in v7:
- Since qcom_scm_pas_context is removed, v6 needs to be rebased removing
  the changes related to it.
- Link to v6: https://lore.kernel.org/lkml/20260805133759.2790755-1-mukesh.ojha@oss.qualcomm.com/

Changes in v6:
   - Other patches from the series is merged.
   - Removed dependency on below series by adding keep_mdt_buf
     into qcom_scm_pas_context structure as well.
     https://lore.kernel.org/lkml/20260702115835.167602-1-sumit.garg@kernel.org/
   - Addressed minor comment on the documentationi.
    - Link to v5: 6/6 of https://lore.kernel.org/lkml/20260724182858.1868271-7-mukesh.ojha@oss.qualcomm.com/



 drivers/firmware/qcom/qcom_pas.c       | 12 +++++++++---
 drivers/firmware/qcom/qcom_scm.c       |  2 +-
 drivers/remoteproc/qcom_q6v5_pas.c     |  3 +++
 include/linux/firmware/qcom/qcom_pas.h |  1 +
 4 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_pas.c b/drivers/firmware/qcom/qcom_pas.c
index 24485dd0fa10..93d78a5c1201 100644
--- a/drivers/firmware/qcom/qcom_pas.c
+++ b/drivers/firmware/qcom/qcom_pas.c
@@ -60,17 +60,23 @@ EXPORT_SYMBOL_GPL(devm_qcom_pas_context_alloc);
  *
  * Return: 0 on success.
  *
- * Upon successful return, the PAS metadata context (@ctx) will be used to
- * track the metadata allocation, this needs to be released by invoking
+ * If @ctx requests metadata retention, the PAS metadata context will track
+ * the allocation, which needs to be released by invoking
  * qcom_pas_metadata_release() by the caller.
  */
 int qcom_pas_init_image(u32 pas_id, const void *metadata, size_t size,
 			struct qcom_pas_context *ctx)
 {
+	int ret;
+
 	if (!ops_ptr)
 		return -ENODEV;
 
-	return ops_ptr->init_image(ops_ptr->dev, pas_id, metadata, size, ctx);
+	ret = ops_ptr->init_image(ops_ptr->dev, pas_id, metadata, size, ctx);
+	if (!ret && ctx && !ctx->keep_mdt_buf)
+		qcom_pas_metadata_release(ctx);
+
+	return ret;
 }
 EXPORT_SYMBOL_GPL(qcom_pas_init_image);
 
diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index df20773dd754..dc57c87870cf 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -666,7 +666,7 @@ static int qcom_scm_pas_init_image(struct device *dev, u32 pas_id,
 	ret = __qcom_scm_pas_init_image(dev, pas_id, mdata_phys, &res);
 	if (ret < 0 || !ctx) {
 		dma_free_coherent(dev, size, mdata_buf, mdata_phys);
-	} else if (ctx) {
+	} else {
 		ctx->ptr = mdata_buf;
 		ctx->phys = mdata_phys;
 		ctx->size = size;
diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 879c465c4a7a..ae93f693358c 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -733,6 +733,7 @@ static int qcom_pas_alloc_memory_region(struct qcom_pas *pas)
 	if (IS_ERR(pas->pas_ctx))
 		return PTR_ERR(pas->pas_ctx);
 
+	pas->pas_ctx->keep_mdt_buf = true;
 	if (!pas->dtb_pas_id)
 		return 0;
 
@@ -751,6 +752,8 @@ static int qcom_pas_alloc_memory_region(struct qcom_pas *pas)
 	if (IS_ERR(pas->dtb_pas_ctx))
 		return PTR_ERR(pas->dtb_pas_ctx);
 
+	pas->dtb_pas_ctx->keep_mdt_buf = true;
+
 	return 0;
 }
 
diff --git a/include/linux/firmware/qcom/qcom_pas.h b/include/linux/firmware/qcom/qcom_pas.h
index fb2ec3be6a16..1d132e89536e 100644
--- a/include/linux/firmware/qcom/qcom_pas.h
+++ b/include/linux/firmware/qcom/qcom_pas.h
@@ -22,6 +22,7 @@ struct qcom_pas_context {
 	dma_addr_t phys;
 	ssize_t size;
 	bool use_tzmem;
+	bool keep_mdt_buf;
 };
 
 static inline void __iomem *qcom_pas_ctx_map(struct qcom_pas_context *ctx)
-- 
2.55.0

