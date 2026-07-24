Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E9FE44C646
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 18:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784917756; cv=none; b=aTAKy2WT86qSeH9m10vJrFtgNoXkdlNY5QhDR+Zohn187m7wJ9PAzRO2FWPI0UPuq6ilqcqvyoOI/gPzUH5j/ZPDg9OoACKoUG3fFbqBk9HEoNvvK/kAusUTsC29nRkzddagWdS6bANb+EYnNMfBdLCii/wADWp3P9t5T065s4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784917756; c=relaxed/simple;
	bh=ajG7LgiJ5p3r9yao4QqzF9RmZZWT6brpGmFfsQNfxWw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ft+63LVGYzXm9cZ0ZKWc1PSIrkpl2vXNVRbeyT43Wns4QhND85ARg0MjoelEwcqEQzHsMND3Qtr439YG7eSwWMVv6w8EDmYCBN2dpPlvlPEKy6xbUX4DASvo+621rom6xz4qQyPFi1X2Q6YBpSrebIN+mP9BeBnao5FHIV9cw74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BOTE5QyC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ix1VgX+4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BOTE5QyC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ix1VgX+4"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OGqOTM3377634
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 18:29:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=hOd800wfgL3
	J2dUjIr9lnlGMjGoYy/8xteok0hcXWEE=; b=BOTE5QyCBoeUppA9+TKtky1YGW6
	+KfYL+yaF8Qp9QXl9Sq4fNBf8P351K+bFyt+GRGRVNGIkkn/3xZQOu3utgnb1l+0
	7KoX9eDhW8B+582evm5rznDNiyMcELPL2aNyucgzYs/1u3OAb+yBPmchJbW8hyBX
	h9Obf7OGSHNEl1fLrpr+5HP1CqCovXtsRbczeu31K4Q63cTITqWAudP2ezsrHCzS
	lLH/9PKP+2Z90ozOCSu1Zk2WInWHZreG7OJKD3dN+MisFBApKvclpm/G8EWXNtBv
	MJzZW6z6taLjLjzkUGvyuEkvV5oCZt4brvk21nwmz3eCbuDAvJ0Y8Yh5uWw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm8cj97d0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 18:29:13 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cab041eced3so991069a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 11:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784917752; x=1785522552; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hOd800wfgL3J2dUjIr9lnlGMjGoYy/8xteok0hcXWEE=;
        b=ix1VgX+4EYJ2nKGmGuiHooOJbL5RxuLLGyhgo2ttamezeQbUpFsn0hYj6J9RJhbi1C
         qPyD1GadpTaPAiR8B3T2uxMG7+6v9d/LTDHRtfunkEQCyl/G2Pd8Jo2eBUbNHJ/L8uNW
         M2XIJmYWmO64ELkv+wF5/w9cWIJBzWr75mNYmxFxF5WayyThrUus1CC15w/7SYa4J+h4
         8+1CL7un7xd8aR4al8ofbSQv5tuqS9b8vCAXLUOPO35GZe+ObOoHP9wjo7WizcmPwUKt
         kRd0Yiov7RJ7AlLEGDWYsbZirCKkwjr79L24ETIOyhiFvKHrtxlQy6MIZBlE7UrSZrvG
         v3/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784917752; x=1785522552;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hOd800wfgL3J2dUjIr9lnlGMjGoYy/8xteok0hcXWEE=;
        b=hUGIHs/arCLv34DMM9fEsg5cKucQPtbElXUBd4gP6XPrviG6uWy1oXe2XYfsJp217r
         bZmA+8Mb6hvQkEY3sL7924JdLSWGIQnJAtl7yGun4zrcyfXg3TMj3oe0Bbzi2/CioLz7
         Q1f25Rs2CgJOOiPlRe26FVD/GrKlKKoACmwWyXFtVjKrD7H6e1+yesUO3Fy3PVUyAECS
         S8DcpN/IANOrhjlRRs9Cvjt5at7Dz7krJA7R4/3kSgVw/NqPUvMHYAtoSSdeWP41eTRd
         9EekfjcLkt90Ym9re3qXpWUZ+FqyfEZhXLakvmNAsf4o+QS0bhriSIYpBXvfwiQQnBo7
         Wygg==
X-Gm-Message-State: AOJu0YwzKhnd/n5NTkHVWRHYvWJCRXYN4DverZ2PuJAtrOlpd9Jc4esx
	PCTNJb/L/b3R9f+xy7LJpQI5rJ5CEKWH+BQMzcwk5s6uAtLRDD1bzX9g4Pj+3D3rC+beBIvfeCD
	DmbENzTRaqYbBEt8odSz+rbGgSaHUcuAnrUouVwtpd53qQlzH9k1k1qrDiG2GPwXhNoUT
X-Gm-Gg: AR+sD11iPRGf+5P+DqKMwlCWrcW9lURCETufIS2q9ezhUxpvK1xBpOlMGB5I9qERV97
	u6v2Laf3xccUugWqH9KEzWPAUjU0fqw+3mi3AQGq4QUnevL55kG319feDpCDmhT6hNghGYixt19
	gA6F3aVqAIsDVoA9IUEPh4moSXFgXoT1vXrz91DQFD4UMKMRUq8/LGvBL0VuQ0tWlB9JWAmWzzK
	yMRS7kwO9JbG8kvrsg+Zyz/EP3pp1EMWHq5Va931xJLR09yO+wdUALDYMwF+E6z/bnLvPCeG+EX
	m+296WgGc5dqRfzJopzv633g5ZO29x/y78+vczcrO+q++suzNuK1UCsdXUI2cE5fs41zmHIa17x
	NHi0Fp610RakccRyXwMzR12fMOzs=
X-Received: by 2002:a05:6a21:1405:b0:3c3:a08d:5b44 with SMTP id adf61e73a8af0-3c44affc62dmr9515487637.23.1784917752336;
        Fri, 24 Jul 2026 11:29:12 -0700 (PDT)
X-Received: by 2002:a05:6a21:1405:b0:3c3:a08d:5b44 with SMTP id adf61e73a8af0-3c44affc62dmr9515460637.23.1784917751862;
        Fri, 24 Jul 2026 11:29:11 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc5c53f3sm1341510eec.30.2026.07.24.11.29.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 11:29:11 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v5 1/6] remoteproc: qcom: annotate mem_region fields with __iomem
Date: Fri, 24 Jul 2026 23:58:53 +0530
Message-ID: <20260724182858.1868271-2-mukesh.ojha@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=GJE41ONK c=1 sm=1 tr=0 ts=6a63aef9 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=ctNy7iMIxOgxZ4Gl-TwA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDE2NiBTYWx0ZWRfX0RsUrESMvGBQ
 TmtcaXkzOls8iKoP5L1tyD7pOonQphXK+Df7W4SqH6MAVASooD/+T5T98nJfS9zXFZrHCoA54ya
 VWq5RD917ZlR1UU30RV9D2QnbW0lXBJ983cQq+zLWrBLBuUoj/E+gIz2kvOGLTUoFVmqiKMaYnr
 1h34+J/A7VyKs061E7LgvWTvG4ajr5C9wuVQDqYcCLnis+lQ77LwTF4JtGzXVhxRn/K6E9WYqWz
 rEr0BfhD3T6cxzSYschGJSD69jEF4E8QZmce11wU+7M/9PEqrgjXIuvE387rCVkELjPveXNZNA9
 uoaJ8E8Px2Qhrp67QmOPYl55K6yhoLwO5LuZ1Undq09vHDze+WeZTe3/IUfPuBQmaSsOdLhSmAS
 FCjExR4GiJM32jgLV9cB2aRaZKE0uzGjRyqG4wBeXsB2aVhNnvDNfzh/Kb+pEt2pfP2IF9BeW3u
 taR8SgHpO1/FKt33SZg==
X-Proofpoint-ORIG-GUID: OULMfNk-6-SsqFOLvEj1LauGRh1B-5af
X-Proofpoint-GUID: OULMfNk-6-SsqFOLvEj1LauGRh1B-5af
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDE2NiBTYWx0ZWRfX5MfFYVsWKHFF
 hv0ayKykIV1njC4dDn4jnkUaId0Fks1CUxT5q82M7o076LnMMC2UJC56X+MagHdoVdz26bjNU+Z
 GZSRCBWbqr6xFW3D50jSG8PiR2A9Wvk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240166

The firmware memory regions in qcom_adsp, qcom_pas and qcom_wcnss are
mapped using devm_ioremap_wc() / devm_ioremap_resource_wc(), which
return void __iomem *. However, the mem_region (and dtb_mem_region)
fields in the respective driver structs were declared as plain void *,
causing sparse to flag address space mismatches:

qcom_q6v5_adsp.c:639:26: warning: incorrect type in assignment (different address spaces)
qcom_q6v5_adsp.c:639:26:    expected void *mem_region
qcom_q6v5_adsp.c:639:26:    got void [noderef] __iomem *
qcom_q6v5_pas.c:141:45: warning: incorrect type in argument 2 (different address spaces)
qcom_q6v5_pas.c:141:45:    expected void const volatile [noderef] __iomem *src
qcom_q6v5_pas.c:141:45:    got void *
qcom_q6v5_pas.c:637:25: warning: incorrect type in assignment (different address spaces)
qcom_q6v5_pas.c:637:25:    expected void *mem_region
qcom_q6v5_pas.c:637:25:    got void [noderef] __iomem *
qcom_q6v5_pas.c:654:29: warning: incorrect type in assignment (different address spaces)
qcom_q6v5_pas.c:654:29:    expected void *dtb_mem_region
qcom_q6v5_pas.c:654:29:    got void [noderef] __iomem *
qcom_wcnss.c:540:27: warning: incorrect type in assignment (different address spaces)
qcom_wcnss.c:540:27:    expected void *mem_region
qcom_wcnss.c:540:27:    got void [noderef] __iomem *

Fix this by annotating the struct fields with __iomem to correctly
reflect the address space of the underlying mapping.

These regions are subsequently passed to qcom_mdt_load(),
qcom_mdt_load_no_init() and qcom_mdt_pas_load(), all of which take
void * and use plain memcpy()/memset() internally to write firmware
segments into the region. This is intentional and safe: the mappings
are write-combining (WC), which on arm64 permits bulk CPU stores
without requiring the memcpy_toio()/memset_io() accessors. Changing
the MDT loader API to accept void __iomem * would be a more invasive
change and would affect callers.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_adsp.c |  6 +++---
 drivers/remoteproc/qcom_q6v5_pas.c  | 10 +++++-----
 drivers/remoteproc/qcom_wcnss.c     |  6 +++---
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_adsp.c b/drivers/remoteproc/qcom_q6v5_adsp.c
index c81e6c33c747..39654206781d 100644
--- a/drivers/remoteproc/qcom_q6v5_adsp.c
+++ b/drivers/remoteproc/qcom_q6v5_adsp.c
@@ -105,7 +105,7 @@ struct qcom_adsp {
 
 	phys_addr_t mem_phys;
 	phys_addr_t mem_reloc;
-	void *mem_region;
+	void __iomem *mem_region;
 	size_t mem_size;
 	bool has_iommu;
 
@@ -318,7 +318,7 @@ static int adsp_load(struct rproc *rproc, const struct firmware *fw)
 	int ret;
 
 	ret = qcom_mdt_load_no_init(adsp->dev, fw, rproc->firmware,
-				    adsp->mem_region, adsp->mem_phys,
+				    (__force void *)adsp->mem_region, adsp->mem_phys,
 				    adsp->mem_size, &adsp->mem_reloc);
 	if (ret)
 		return ret;
@@ -492,7 +492,7 @@ static void *adsp_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *is_iom
 	if (offset < 0 || offset + len > adsp->mem_size)
 		return NULL;
 
-	return adsp->mem_region + offset;
+	return (__force void *)adsp->mem_region + offset;
 }
 
 static int adsp_parse_firmware(struct rproc *rproc, const struct firmware *fw)
diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 25599d728208..9076c82ac878 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -101,8 +101,8 @@ struct qcom_pas {
 	phys_addr_t mem_reloc;
 	phys_addr_t dtb_mem_reloc;
 	phys_addr_t region_assign_phys[MAX_ASSIGN_COUNT];
-	void *mem_region;
-	void *dtb_mem_region;
+	void __iomem *mem_region;
+	void __iomem *dtb_mem_region;
 	size_t mem_size;
 	size_t dtb_mem_size;
 	size_t region_assign_size[MAX_ASSIGN_COUNT];
@@ -243,7 +243,7 @@ static int qcom_pas_load(struct rproc *rproc, const struct firmware *fw)
 		}
 
 		ret = qcom_mdt_pas_load(pas->dtb_pas_ctx, pas->dtb_firmware,
-					pas->dtb_firmware_name, pas->dtb_mem_region,
+					pas->dtb_firmware_name, (__force void *)pas->dtb_mem_region,
 					&pas->dtb_mem_reloc);
 		if (ret)
 			goto release_dtb_metadata;
@@ -321,7 +321,7 @@ static int qcom_pas_start(struct rproc *rproc)
 	}
 
 	ret = qcom_mdt_pas_load(pas->pas_ctx, pas->firmware, rproc->firmware,
-				pas->mem_region, &pas->mem_reloc);
+				(__force void *)pas->mem_region, &pas->mem_reloc);
 	if (ret)
 		goto release_pas_metadata;
 
@@ -447,7 +447,7 @@ static void *qcom_pas_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *is
 	if (is_iomem)
 		*is_iomem = true;
 
-	return pas->mem_region + offset;
+	return (__force void *)pas->mem_region + offset;
 }
 
 static int qcom_pas_parse_firmware(struct rproc *rproc, const struct firmware *fw)
diff --git a/drivers/remoteproc/qcom_wcnss.c b/drivers/remoteproc/qcom_wcnss.c
index e9a00efe97f6..c856a92af43c 100644
--- a/drivers/remoteproc/qcom_wcnss.c
+++ b/drivers/remoteproc/qcom_wcnss.c
@@ -94,7 +94,7 @@ struct qcom_wcnss {
 
 	phys_addr_t mem_phys;
 	phys_addr_t mem_reloc;
-	void *mem_region;
+	void __iomem *mem_region;
 	size_t mem_size;
 
 	struct qcom_rproc_subdev smd_subdev;
@@ -158,7 +158,7 @@ static int wcnss_load(struct rproc *rproc, const struct firmware *fw)
 	int ret;
 
 	ret = qcom_mdt_load(wcnss->dev, fw, rproc->firmware, WCNSS_PAS_ID,
-			    wcnss->mem_region, wcnss->mem_phys,
+			    (__force void *)wcnss->mem_region, wcnss->mem_phys,
 			    wcnss->mem_size, &wcnss->mem_reloc);
 	if (ret)
 		return ret;
@@ -327,7 +327,7 @@ static void *wcnss_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *is_io
 	if (offset < 0 || offset + len > wcnss->mem_size)
 		return NULL;
 
-	return wcnss->mem_region + offset;
+	return (__force void *)wcnss->mem_region + offset;
 }
 
 static const struct rproc_ops wcnss_ops = {
-- 
2.53.0

