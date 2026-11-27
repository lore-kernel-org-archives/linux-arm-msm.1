Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795770478;
	b=XA4Ofk2RtLWuqLv99skc0+mfudZbeALED4VbimXTi4nzk9x3nH9iuywLaLr5aLj+9/Gj
	 HBk1mCnOpOyXmXUnqidDbCATP/s861WBGv5TR+6bYAMzO28VVi4QCr72QmG2D8k6eglk0
	 V9ZCtBcsJERZFR1HdjPoRAvA7vw6UBAqIpIYC8LE5TNNlORehJ/dzp07Whq+IcDYsLlQ4
	 h//OARMxbK7fGWU4gsw3hTrq4O5avuZ5bt+mscK9ziB8q29o5pfrfyOrXya/Lg5g3YCRk
	 M+bmrc3g2iaLcvSiIkeuDypS5ZPul3Pxv4fmAaEAmx2siSQgjKUNqRBrKeRklR5pdow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795770478;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=R5TPuNKCZQoB/rH+DJ1mz+PJVWJcEoh0teKtyWwe6lE=;
	b=ZaDwf/rWFeKGpKpcEUfKjqkEvxypIqPDIXDQOu/Fp1ee5dd7IVkQqOIaZhHa1QvY1zOr
	 TxbbwpB5Px1YimZKOGMMYHOyqzt02uOVEyMX8rr2lH0TadEYcFPlC8NoegbzCsPg49KpC
	 Z8v0d1n0EHkMCUvhes7691QYtS4hLBLnmFaNCWLuQ3xxIRew0pBOz7HbffGPhX1xSr/KJ
	 MC2R/gOpZ7AoDihD/0muB0/BqVnVExS6iCsFvajeCNflTkpHoZba/wnHrrH7SEhSKzK8a
	 9Ryaz2mghhDxpC72jdMF4hvIdGrX+RSZLdz9164cQrj+Jb9gM/5q6HGTk4UY5B2Z9ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=APiwDKTy;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WLGTNqxe;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B276D606A33D
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 09:07:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B276D606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=APiwDKTy;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WLGTNqxe
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR7Gd7D1564751
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 09:07:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=R5TPuNKCZQoB/rH+DJ1mz+PJVWJcEoh0teK
	tyWwe6lE=; b=APiwDKTyGpBd55kf8Ukx4CI4JUP7ql9EzkmRQ/UTdXmVXTiWp8v
	hY2Ez7Wh6MOW9R942mYNf+A2Wr1GjYA5ip0v0GqAlDbWcddakp/y2HWAInQGuggs
	cloTvldFE0KB43C/xJLLSn2u1GnoHpSxmq3svOzwVj9hY2ENWu4F94eN1/XdNR4q
	8Wpt8ULJtXR3kWVUU/uuoud8lqzDlGPJ3xGDBuJQQekaH2Pa+zS5XQ1zsr61832V
	1fCOX0RCqwW+Bu9uwQ2ufgYDsetMOR2lFJJLcGqclS1y72nnVoDXFtJqaUBWq9Ov
	KP1JR/Y91apcSYlO/BAPeeFFjUyoh7kQJTw==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j74garn0x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 09:07:56 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6dd94f8fa25so5572788eaf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 01:07:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795770476; x=1796375276; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=R5TPuNKCZQoB/rH+DJ1mz+PJVWJcEoh0teKtyWwe6lE=;
        b=WLGTNqxemrDEWXREmLqzWg3KHMtiNqWXVBy/5zYYSq3pVMkmrhUzAn6/3qdY11XmJe
         mFrCmP1gaDF3sbimC+TwfpryZ5V94lSd3Lr544OE8jltOegUpaJn3Oj5owGQeRd1kerQ
         O8HKrnL5Do9HnxaEHPiHYAKN/yQN3h7nKpBwnJFnfdeDtcA6uP++ERA4eoq2mR27V99n
         mDfvfWtMz3GjNs3R4eVF2dhN6ZH1xiWMDl0vHaV/LjDN/WTwbqs/8gC9eTSn8hoVEXWr
         Ujmc+REW9bJe3no/F6W6xXCF0Gf0HpEi3p4Ixi/kZqGZopgIwM6L19lmcf2XFJ/yy4c0
         3hEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795770476; x=1796375276;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R5TPuNKCZQoB/rH+DJ1mz+PJVWJcEoh0teKtyWwe6lE=;
        b=Or7IZujY0Nkr98FM2jCAlurhJ2PtZdiaVEZmCd3QpwJvGplPlUbqAzcVojwABWlnP4
         pFA+Z0cXRijmnOE9NInRneO40+alHNHSz4httz7VsZy3QkfE5Kv7D7YN+UC+3LTQebcf
         9oOhAqkuA1eIQAUtCAmTnvxkx2gxHQoANQkrZCyM5kg+Yz/cElIpbGgRP8C6CnVqG0xI
         TRXVQOBujZCIiJVcf+ij6c2HvDkaxsQBc9PbdqxbMCO/bZIvJSK3q61Iu6iPS3b1kADf
         NKSislX1HOqxoKsb2dgwnUGWniIJagYr5voIf9myA0CXABKb085rb0BpeZaBXV2z2PSY
         0Nhg==
X-Forwarded-Encrypted: i=1; AL+hErErLiKSVbaFy6VOKagi2y/vv0C2RqCyxi5lOSXj+lh0UniXmkoLTB8imkA4CtAdgutlJgcTT02PJ1MxRu8v@vger.kernel.org
X-Gm-Message-State: APuU4Z/fcw2vc8qTtX2Aakc9CAjaSoOtJXFYY9/ckK5deBfBP4kPd2/J
	YNlBqjptNui+0AWs8JML+5EehpFQCCGC6cZ74eOm9OYyp4jrHnf4p0TdjIfOiXRuBjtcdeiZo0N
	/DTw8ol0vkBNxUQ+i1vYVC6BFEfcY+WUMq4N9o13jXuPBebEm77OmwXslyTUXibtxpckJ
X-Gm-Gg: AZFdTZcYXR9EdbrtGR+AHTPeYaMzcVCC+JT5DJDruFqrRGG5nWL899QFXln6y6/eB7r
	eK0uOQC99hiLgASWnpCg/ZgECONucuCQyuHcVYiSHUxeXnpgXLTJ9rqntUkzmwdFATIiZljukPx
	RjAQU4tOKu3SPyYP9AI+/7c6cyLJm9rAmbKDPeytZSv+Or30mlYJ0nBQt0kRdE97AjWvUuNYp6/
	yUO2I7BINGxTlow9oFwAKit3UHWDoqfHaVOFBsU/2Jz16yTjnCcbpfwK4WUyrBXakTNCt680BDI
	zhxXRE9lhIU8UUhk//VQxaL9mOJyr3ObCfGazhj5HWETL4RHte196/3rBm9534Rn8vmb9jrqim6
	2P1M4Wz7rGHdfbdxhj1I5HgtT74sJnxJl23Y6VKw0Kyom9g+qmKtezkKOa7rkzvaYgjYwlSOBg5
	4doeMmKFfSwG6gbBwzK6vt6X80re6IqtWpLjZHhQ==
X-Received: by 2002:a05:6820:f025:b0:6f6:b13f:5d2d with SMTP id 006d021491bc7-71b392612c6mr20395026eaf.12.1795770475837;
        Fri, 27 Nov 2026 01:07:55 -0800 (PST)
X-Received: by 2002:a05:6820:f025:b0:6f6:b13f:5d2d with SMTP id 006d021491bc7-71b392612c6mr20394998eaf.12.1795770475381;
        Fri, 27 Nov 2026 01:07:55 -0800 (PST)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8631690f53dsm15719276a34.19.2026.11.27.01.07.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 01:07:54 -0800 (PST)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
To: andersson@kernel.org, mathieu.poirier@linaro.org,
        konrad.dybcio@oss.qualcomm.com, abelvesa@kernel.org
Cc: niklas.cassel@linaro.org, rohitkr@codeaurora.org,
        sibi.sankar@oss.qualcomm.com, robh@kernel.org,
        quic_srichara@quicinc.com, konradybcio@kernel.org,
        rajendra.nayak@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Subject: [PATCH] remoteproc: qcom: Fix da_to_va() offset truncation
Date: Fri, 27 Nov 2026 01:07:50 -0800
Message-Id: <20261127090750.2059755-1-gopikrishna.garmidi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
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
X-Proofpoint-ORIG-GUID: KHVkN7ifa-AdR4BhAz3m9ZiP1D9YQls_
X-Proofpoint-GUID: KHVkN7ifa-AdR4BhAz3m9ZiP1D9YQls_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAzNiBTYWx0ZWRfX8mxhySHyHXOD
 go6u7nsEY/wA+kElupl6D4emhjnmO+ff5DHXHGJLP8DiPQX1b6zJ3Q773TIFcMRHWGaQ/AaRdmC
 WPxEQHb1jFoupiGry0+CkEuYRg8dGn6BNtHgsWYedtfKptWppIlqqoDZm36o+0nNU7KOK0wkSZN
 5+shS88CVeMf9bTvSHszErb8KYHz8bOT8Q8WbF/GT6ABUEQXttD9mleGnI+4k4NX0Yxk6Rgw+bS
 s+S93hFHI4L4LkifPpuiWmM2+rEyqR8e1xwmI8mQT6WKWgoFtmYG+RS+Zp6aTWIXBqGJh6DjJ9e
 VdWiVeHNFkq/2HBA0LIiQEGC38UAR+whhEusYEwhcRneeChf4kJWyHZVRL9HiYBFgKVy42AICbg
 cU6qGe6YapgJCzyspheH9D/6T/20iBPgma7fd2ni6tdoTDkXv7/CR6kJeyA1SRFgjV5jF/1Zb6W
 OOE3cKMG2yQAnp0CG6A==
X-Authority-Analysis: v=2.4 cv=I5bw19gg c=1 sm=1 tr=0 ts=6b09486c cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=TkQF8GsBrQEj9MWfvNYA:9 a=k4UEASGLJojhI9HsvVT1:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAzNiBTYWx0ZWRfXxIE84h4mLKRI
 HtLxkzst6W1ALHmU4J1NmaaZuVIRYOAlYWADH4mE4M5cEBmcI2wdn8oDR0LLUVeBPyifLZWy2Fu
 4vtHkTuBDctLC27vKGcyI5gzfwDukpA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_01,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270036

The da_to_va() callbacks compute the offset into the carveout as an int
from a u64 device address. An address such as mem_reloc + 0x100000010
truncates to 0x10, passes the bounds check and gets mapped to the wrong
place. The check "offset + len > mem_size" can also overflow.

The device address comes from ELF program headers and the resource table
of the firmware image, which are parsed before the image is
authenticated.

Use a u64 offset, reject addresses below the carveout base and compare
without risking overflow. Apply the same change to the pas, adsp, wcss
and wcnss drivers, which all share this pattern.

Fixes: 9e004f97161d ("remoteproc: qcom: Rename Hexagon v5 PAS driver")
Fixes: dc160e449122 ("remoteproc: qcom: Introduce Non-PAS ADSP PIL driver")
Fixes: 3a3d4163e0bf ("remoteproc: qcom: Introduce Hexagon V5 based WCSS driver")
Fixes: aed361adca9f ("remoteproc: qcom: Introduce WCNSS peripheral image loader")
Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Assisted-by: LLM
---
 drivers/remoteproc/qcom_q6v5_adsp.c | 7 +++++--
 drivers/remoteproc/qcom_q6v5_pas.c  | 7 +++++--
 drivers/remoteproc/qcom_q6v5_wcss.c | 7 +++++--
 drivers/remoteproc/qcom_wcnss.c     | 7 +++++--
 4 files changed, 20 insertions(+), 8 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_adsp.c b/drivers/remoteproc/qcom_q6v5_adsp.c
index 23fabf4ce84d..d9d12f67ee25 100644
--- a/drivers/remoteproc/qcom_q6v5_adsp.c
+++ b/drivers/remoteproc/qcom_q6v5_adsp.c
@@ -486,10 +486,13 @@ static int adsp_stop(struct rproc *rproc)
 static void *adsp_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *is_iomem)
 {
 	struct qcom_adsp *adsp = rproc->priv;
-	int offset;
+	u64 offset;
+
+	if (da < adsp->mem_reloc)
+		return NULL;
 
 	offset = da - adsp->mem_reloc;
-	if (offset < 0 || offset + len > adsp->mem_size)
+	if (offset > adsp->mem_size || len > adsp->mem_size - offset)
 		return NULL;
 
 	return (__force void *)adsp->mem_region + offset;
diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index ff2483529d73..232bf9b349cf 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -473,10 +473,13 @@ static int qcom_pas_stop(struct rproc *rproc)
 static void *qcom_pas_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *is_iomem)
 {
 	struct qcom_pas *pas = rproc->priv;
-	int offset;
+	u64 offset;
+
+	if (da < pas->mem_reloc)
+		return NULL;
 
 	offset = da - pas->mem_reloc;
-	if (offset < 0 || offset + len > pas->mem_size)
+	if (offset > pas->mem_size || len > pas->mem_size - offset)
 		return NULL;
 
 	if (is_iomem)
diff --git a/drivers/remoteproc/qcom_q6v5_wcss.c b/drivers/remoteproc/qcom_q6v5_wcss.c
index b391724cfd08..52d9b5174e8a 100644
--- a/drivers/remoteproc/qcom_q6v5_wcss.c
+++ b/drivers/remoteproc/qcom_q6v5_wcss.c
@@ -740,10 +740,13 @@ static int q6v5_wcss_stop(struct rproc *rproc)
 static void *q6v5_wcss_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *is_iomem)
 {
 	struct q6v5_wcss *wcss = rproc->priv;
-	int offset;
+	u64 offset;
+
+	if (da < wcss->mem_reloc)
+		return NULL;
 
 	offset = da - wcss->mem_reloc;
-	if (offset < 0 || offset + len > wcss->mem_size)
+	if (offset > wcss->mem_size || len > wcss->mem_size - offset)
 		return NULL;
 
 	return wcss->mem_region + offset;
diff --git a/drivers/remoteproc/qcom_wcnss.c b/drivers/remoteproc/qcom_wcnss.c
index 02f38fe29f20..cf8d1aa8f38f 100644
--- a/drivers/remoteproc/qcom_wcnss.c
+++ b/drivers/remoteproc/qcom_wcnss.c
@@ -321,10 +321,13 @@ static int wcnss_stop(struct rproc *rproc)
 static void *wcnss_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *is_iomem)
 {
 	struct qcom_wcnss *wcnss = rproc->priv;
-	int offset;
+	u64 offset;
+
+	if (da < wcnss->mem_reloc)
+		return NULL;
 
 	offset = da - wcnss->mem_reloc;
-	if (offset < 0 || offset + len > wcnss->mem_size)
+	if (offset > wcnss->mem_size || len > wcnss->mem_size - offset)
 		return NULL;
 
 	return (__force void *)wcnss->mem_region + offset;
-- 
2.34.1

