Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCA434AEBC2
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Sep 2026 19:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788378011; cv=none; b=h9fkoecjd4EKXgImdNSMXQaLzTR71f8Banl748ZNjU5SrLZGzjyH+12CMqj0iOJaBRyQSjv1ELqODS5NoG4hc5LioPQg4VZquwxZ7ewnQ1ecitmK0fgFtav5BdgXx0N6TbA5iODHjrSW0CVJt7fPCBJJAYM1fDOqQ2Hp+s5VRUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788378011; c=relaxed/simple;
	bh=eWEnh3sITCDLcXnpg5vDD53TJlmRpLxQxP0NJ4pSGJA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZJOPDzNcr82pMU1NeQAXfmSJZ3dAOvhaNsQpvp7E5i37lD4212yiHM1RtlXds4c8x64l+TduUpPfZO1JNHjJpG28du8p70HorpMYRMZfmH+VId197K6w6GBV5kUoqByKBSvcu2rkZ6EIotIF7gByyGMXMpCo8Cxnm+Q5kHwOU2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aGHu3lrI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=an5c1u2G; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aGHu3lrI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="an5c1u2G"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682Hr9fn2105110
	for <linux-arm-msm@vger.kernel.org>; Wed, 2 Sep 2026 19:39:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=XNQxEG3zzxofyaZfwBRiQvttvPUbCdqoUXf
	aSnqUlIU=; b=aGHu3lrI0giv7SYC6vttPxcfRcE/O5LDlFlrO7br2dCh15SRE+N
	ya4PTT5DXANIhR20nKJTiWzaywSVtwgFQhP1zb9kB1xHA0gsLMe4aNM04MLlQTGR
	RnCErdZjd5qgp+ykTn/nhpJ8BTZ528FaXSqnJOgCYBQQOdDhCdQOCwntigwseU+j
	lzdgMfBEVW9yJUAhUmyvngN6hebNvMruBdmKy25lfbWDDlQabYwEph0Fh27nKeQ/
	M7Gl0map4BYcJCw+8vh89RjAxIB6N45jHYrE/mxCjRQOa0SGDx6X2eARGk732WyK
	WMoxhtfqqOgQaPj2ViZAS5GFMUYt3jGjOlg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4genrdsamw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2026 19:39:56 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cfe48ca1efso18503315ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2026 12:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788377996; x=1788982796; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XNQxEG3zzxofyaZfwBRiQvttvPUbCdqoUXfaSnqUlIU=;
        b=an5c1u2Gr9XM3tsYjtQ2wonJWy6fPvcSfDyB69BzeHBC3jrFmXMbJbnd+yPp2/MiBB
         ifUJuOEI9jy8S7GPJnWP+7PzQibp9GOkBlSPU66iRKBlaxsKKhWFck+QqVhaUCEPXXuw
         tLGqocjZ2KlOG7xvsd4le4dUIpw9n+heZTl4vSXscp9d0utTdmhimPnQdaS/0DtDl0g1
         MSJIZ9jrAcTLJuqxFQC33oLDNKC08BuA+6qdRTFIJ3IEmphvCBRyfbVeesaEzei8mNSF
         0xKfh+Z1aofVlX+QpUuCxOcsLM4JiMgkXNd/hweznsRsrFPt6PeNfH5S6x6xX88MalgP
         6SdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788377996; x=1788982796;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XNQxEG3zzxofyaZfwBRiQvttvPUbCdqoUXfaSnqUlIU=;
        b=AU1OdZwL1NPhKdrVmtGb6KTLiP5hSfSZ45p+/ERy1geQFgnNANxkhuPPUhXfHqdpwH
         z/irgoOCfq/AKLawarWlDJxP4iasP1KAxvsGIOIc3UnXhlBRZLq/yw8AJIwQidpNaNOW
         bTbTUMPEJ7WhBRFDvOlhvp1wdeMfsBAJiBLlBnHLRIjtC0PdaU4u+tOa6SZN+ThS7yL9
         zQcPVjBTG5slTmWFd/KadFWWXaqfqpoqxZ5y4XB/lypyaG4RCOKmFOpTC9o9ZGZMgEPw
         mAePhq+10w64tUuPDPd1JIfxj/+d1geVQeyf633JDWu4jeeALhNPSEMAP/JZWSGhv/a+
         YYwA==
X-Gm-Message-State: AFuF++l8a8WoGJ/7vYS2QHtGEnfGqVAQDpBdP/BztcFztE8mQA9wTG7c
	vDmantyoBMwyUYwWNUzlpuegb2XTpeLQ80LVDeMNoRAoRbmkjgqt4OIZvXi0Kqp1N8yUVQ2jB2X
	uoLDLsrn331NJymSo69hRo7Khp/b4X5QaJKd33D+nFVf3s9WqZHVqIA5IrNUTba1jlpGdl1kIgq
	hx
X-Gm-Gg: AYBFou0GWpNhFRZOHk1rKDxxAypu/forFVntASwramqZaSVA1OWYjN8BP9INF/5EYp4
	D0d5bPaYyLeaWyiuojOn6VkcOp0UYkIpxFq6PBBjqffd/N5XFMPic6tysmpfTe40h2SkNEF8JOf
	n46MOqU0t+VShPs3ig627LJZAEyXk6A7Dum3X771ub0HjWMM1JxQyYV3xY5K2VppcWL2JDtM+5m
	tjyIy+gfrXEnDoS82QKQICEWqaEOWZH+rnCKqTfJ60ivr2P7J0nXV8NXl92c3bm/txyI7hqJyL7
	SnxVEQ14Xyi20tgPSAwZ6XheWW5x6i9MQyDLn1M1kdMWp694dbSnou/423GmaHkilvIbkl8Rfg5
	ENN86Oc2SgStwMemYM/ugE6u9FAo=
X-Received: by 2002:a17:90b:498c:b0:38e:659b:f366 with SMTP id 98e67ed59e1d1-39aedce7b13mr11371136a91.0.1788377995599;
        Wed, 02 Sep 2026 12:39:55 -0700 (PDT)
X-Received: by 2002:a17:90b:498c:b0:38e:659b:f366 with SMTP id 98e67ed59e1d1-39aedce7b13mr11371067a91.0.1788377994879;
        Wed, 02 Sep 2026 12:39:54 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-332501e5447sm556005eec.0.2026.09.02.12.39.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 12:39:54 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v2] firmware: qcom: scm: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:09:48 +0530
Message-ID: <20260902193948.1999595-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=H4/rBeYi c=1 sm=1 tr=0 ts=6a987b8c cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=-SVse2xkFbf2KMwQCVkA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: QaU60J4lAZYrfDy8xTzWh1Hlm-xVgchi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3MyBTYWx0ZWRfX0obQMTHZLvnG
 65+xhkbCp7IKg3utdXEX5zj3vQxxzTzvDoBzMP+s8B9OyiJIBhHHeyFzSZEuGlyawzHCsfw/wWn
 Mv4uwy6WzThV8yGYfXWUnR9ArfC0R7qQwNdmAqX4Pj0BgRneqPgRFP2qxbW6wrRwei7gRT8JKuH
 Ia3NRFip3/s77zXN9qQ4VO/+FVhT8j9txpdLyLpAe5KN+MFYtUtjhop09t9NJoDoy0rKnhLKBj5
 lTHUUjzCOAcyGeYxWmhTONvQCnMts/0a5SBxVwfzCUyR3BU2i1SRhjvXmcJPOmUz8TYfbs5mlMc
 OAHODQq4QoSLTdClxDqE5Cy7rmTI1JXXuZRxOfisdQhqVY1CHW6xrSa6PYCa0IMVWLlzjEes7xi
 u7NGP07CzNFZC3U5h1wwarRQT5MJWhark9bBl3pddvbHBzShcGBMG6wcxlEdTv22tqC3kLk2LRE
 dN53SPEqQYYd8Rm5weg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3MyBTYWx0ZWRfX1NCfbXaLpJq3
 SUjCQG06Hyp2yorBsVDeh810FOrKXkBwyg2TZZSFAJOAb0jNEd+UimS8Dja+yPDk5k3pFOQsJk7
 m+V6jtSL7iOA9B/WnXG9k1Nxs0EH76E=
X-Proofpoint-ORIG-GUID: QaU60J4lAZYrfDy8xTzWh1Hlm-xVgchi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020173

Switch from of_reserved_mem_device_init() to the new resource managed
devm_of_reserved_mem_device_init() so that the reserved memory region
is released automatically on probe failure or device unbind. This
eliminates the err_rmem cleanup label and the need to call
of_reserved_mem_device_release() explicitly on error paths.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
Changes since v1: https://lore.kernel.org/lkml/20260703193855.110619-2-mukesh.ojha@oss.qualcomm.com/
 - Carried Reviewed-by tag.
 - rebased it.

 drivers/firmware/qcom/qcom_scm.c | 22 +++++++---------------
 1 file changed, 7 insertions(+), 15 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 80a51ae644e2..882d1865f3a4 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2760,17 +2760,15 @@ static int qcom_scm_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ret = of_reserved_mem_device_init(scm->dev);
+	ret = devm_of_reserved_mem_device_init(scm->dev);
 	if (ret && ret != -ENODEV)
 		return dev_err_probe(scm->dev, ret,
 				     "Failed to setup the reserved memory region for TZ mem\n");
 
 	ret = qcom_tzmem_enable(scm->dev);
-	if (ret) {
-		ret = dev_err_probe(scm->dev, ret,
-				    "Failed to enable the TrustZone memory allocator\n");
-		goto err_rmem;
-	}
+	if (ret)
+		return dev_err_probe(scm->dev, ret,
+				     "Failed to enable the TrustZone memory allocator\n");
 
 	memset(&pool_config, 0, sizeof(pool_config));
 	pool_config.initial_size = 0;
@@ -2778,11 +2776,9 @@ static int qcom_scm_probe(struct platform_device *pdev)
 	pool_config.max_size = SZ_256K;
 
 	scm->mempool = devm_qcom_tzmem_pool_new(scm->dev, &pool_config);
-	if (IS_ERR(scm->mempool)) {
-		ret = dev_err_probe(scm->dev, PTR_ERR(scm->mempool),
-				    "Failed to create the SCM memory pool\n");
-		goto err_rmem;
-	}
+	if (IS_ERR(scm->mempool))
+		return dev_err_probe(scm->dev, PTR_ERR(scm->mempool),
+				     "Failed to create the SCM memory pool\n");
 
 	ret = qcom_scm_query_waitq_count(scm);
 	scm->wq_cnt = ret < 0 ? QCOM_SCM_DEFAULT_WAITQ_COUNT : ret;
@@ -2858,10 +2854,6 @@ static int qcom_scm_probe(struct platform_device *pdev)
 	qcom_scm_gunyah_wdt_init(scm);
 
 	return 0;
-
-err_rmem:
-	of_reserved_mem_device_release(scm->dev);
-	return ret;
 }
 
 static void qcom_scm_shutdown(struct platform_device *pdev)
-- 
2.55.0

