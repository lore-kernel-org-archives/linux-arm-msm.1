Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795016274;
	b=nu/muCMV/1u5Djczc9W8pDyOy86dlLgQ03spBJIrRimKMOJYUJhhw7/1FVs4J0PC9sL4
	 r/PBvqSjKerAx21L60VF6S5UmoLgPdiJuue6d8JfHHC+2l8i20sywTK/OpNhduM0RvFrN
	 cga4HPC6ikCG25BYbcgHOmKDNwm+FE8jj6Dtjd7C0TWeIFS452jvWfeUax5FdEUrda8j7
	 9omuesYiAZtp67iHlOlM4HxFuHz4D1/nTksN8wazzRv2tKa4pOmcoBxMhe9j8WUA7lJrF
	 QiBX/PZMxavzXlHX+X/Prxj8uq76DiNHxKGDTg4NBW6VurWxyE+VOms8Y36diFiQEOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795016274;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=9yfAXI9ZHiGjOVlJPnrgg+c26E85mWDy6qSFoVi34c8=;
	b=i2t6GDL3wDV+joVNUt0rGEC7Qpv6hRfOswYAIcdoE9vm7H5JkPAWmq5i49ww1+okYi7v
	 FLba/rnVBaQlnyMyjuOrUMypa7640IRQGnA3lg3ZfjkxwktDnZRyxiZujvYKBubnWLs1R
	 ApJrdoGBXVGuy4/k9W9nOC6yN8/+hGgWHiumg7tDlXe0GdlQqjBnuqDT7EDDCOTtCPvs3
	 fStWAHBBSW3FcUJEeJcCk4CtY40/wAMM1EMOTGJddF8+k3xtcYm2qOutkcd193cMzKh4P
	 toVy3MFpSEwNYiJH0o3saKQIwtREAqn0cQfPpj9KY2OAArWc7CSkZmUC1MhLxA3OAkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TAlMXx8f;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QavD0EfJ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89B4160A3823
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 15:37:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89B4160A3823
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TAlMXx8f;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QavD0EfJ
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIEqKtg072352
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 15:37:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9yfAXI9ZHiGjOVlJPnrgg+c26E85mWDy6qSFoVi34c8=; b=TAlMXx8fyeUI8gcV
	Pkp2uEag+UVj8tS0925hu4ClpKuFeAe1vktEmX1FXnVSscjJDU1LtaQI9t6L0mst
	cgk7yOg9iasZD1EQBgogFzoPmDUMRP7vTDg59O3ddgqjR6fCytbXbCcjPLIa8FfJ
	t4QPLB5PqLU/qRJcPpTnIK/ufjlS9rVN8WqZSDAzdeToYCszHLocayhFC0xnq+kT
	wsoLdI6JNNAfFBheCsIDPonFyaojCRDZHN0+/yjXciGTiqgJ6/Ip1rkydo2aC10r
	OcdHltlegi3oJ9bP1pEKVBPawdSfyxtN8xjHYPFSHue1F/QHrXJYKVIUrwwM7tr+
	cxi6vw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1e5qr6r7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 15:37:50 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91ebb902eebso19228616d6.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 07:37:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795016270; x=1795621070; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9yfAXI9ZHiGjOVlJPnrgg+c26E85mWDy6qSFoVi34c8=;
        b=QavD0EfJ/QNzhJnspSBWpWzZ1h8zUqo3eViosPuRcvKxssjMu4qcFNWWUbLU02vXYB
         UslqEsQXXYchDJNVAI347QUtMEnwhOn5kCXZaZM1sNUaPsqGt4k7HKzHCsOGhOG/R5S3
         s3XWmRlU6RXzCOoJu8J4tTYcwQJhxtAr8k6JNwEo2nMBZxCuMzr4hA467u5rv5qPb1Oa
         G7LWCbrZDFj+rbGMkMyyHh1rQdiHx7+dxazVBRsl8cKBiuMZTymBOPrinH2diHhRRBm1
         DN0rb+MxvBCOo13xepgfZcbAHoFtHwgO53aFjLyHKSopPacFmJ2wDyGHE/sqHgDmygol
         RMbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795016270; x=1795621070;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9yfAXI9ZHiGjOVlJPnrgg+c26E85mWDy6qSFoVi34c8=;
        b=abAIi/0HPYZ/2DBT0jTalSGZi8fiOZbpo0yNDQGB6uWQ2MwzwEj7EPH4J2Y8+JGGeR
         WVMutF2crZoblgGyginy6LllMFjVQnjTN0NV6RK1bBnwvOc1ZCPNgVvT1OKH/WbovjtF
         4fPVetBAjSVsMswhkbl5Fc8npmj/m1383JILTNF6mIlsQNn5fFQ6JNOG8MGW3NrvDfx5
         YtR2TDBTzljxUbNkUwHY24zdH+Kjji+TPaVwOhOy2qrnwtNvU5orla6BkOTLF7cfBKtU
         hDMNQKe5zxcK5zaKmdI+En/NRFgxVbTb5T2wLt97vGl/kNZxHfEG7TMi3X+06siAphFA
         bTxg==
X-Gm-Message-State: APuU4Z+sZrnpdCrIkYky2mGZ6MAEWDMYSW6zDSS587M5x3aMO+PU1+qh
	B1MbdZqV5VQh6P37g/HakXZ3VDVzKuEexNbM0AfXZrUvpCa1S5sblDkCNjvH2FWzmj4TezVJEBZ
	dZXYOzCAcHtArfNofvzrBcuEgCkik/cYEYzscdWbDAGGy5L+0lvnz+h2ydwUZE7OuFpN0
X-Gm-Gg: AZFdTZcVXaySVEQ01xdymjMyn80/LDXgP1/yvOUDYSLdOqTOpMjsGCJK16I2vdNyvRn
	tRHnIttTZ6YPfDMtaCd0JNEycXlc7vUsg13twPbODS2f8DCZuupHFHW+13a850xW1e13HfpsYmw
	/8S449zVSFn3g7I/re3JE8wWt1/m4404aNvN7251R+J02l4z8BMJLbukg+OOgqUig4pKlv18m8/
	eTaFjbpv1+IqfbAnuBdbz6wMTHLPlZALN61pYcWsQcW743WJcxiLyELgJfw8sHpzg1fiunnQFPY
	0Bm+RA8gjQpXGSlSeEOwSszuT/Zjp/ZRs6t7Y66h0aBAV5toyn+V01AFW/lQG8dNeQupH7YUZRl
	PxXoMDCvCgWDEy6a/FZkk1Nb1jWIcW0C0YQPybeosQuR+8i/0caIXaAocXLJS1Rn7myZ+ZVhAqT
	5GS/ES9M6GJZ4epKljpVPT3D9XbwoikzldoOubctJTLWPku4uyRhpOEAyJpSsG
X-Received: by 2002:a05:6214:dad:b0:91c:9316:f4e8 with SMTP id 6a1803df08f44-92114fce29fmr47206006d6.54.1795016269553;
        Wed, 18 Nov 2026 07:37:49 -0800 (PST)
X-Received: by 2002:a05:6214:dad:b0:91c:9316:f4e8 with SMTP id 6a1803df08f44-92114fce29fmr47205496d6.54.1795016268991;
        Wed, 18 Nov 2026 07:37:48 -0800 (PST)
Received: from hu-ajainp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92114d0d879sm24569676d6.12.2026.11.18.07.37.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 07:37:48 -0800 (PST)
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 21:06:44 +0530
Subject: [PATCH v3 3/4] remoteproc: qcom: pas: Add coredump support for
 secondary processors
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-oob-support-glymur-v3-3-2cbdfe208d56@oss.qualcomm.com>
References: <20261118-oob-support-glymur-v3-0-2cbdfe208d56@oss.qualcomm.com>
In-Reply-To: <20261118-oob-support-glymur-v3-0-2cbdfe208d56@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jain P <anvesh.p@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795016249; l=4291;
 i=anvesh.p@oss.qualcomm.com; s=20260313; h=from:subject:message-id;
 bh=K7KpaJu8onPI/TVsGb12hZ6xHYnYsgIRaY8Y8Ezs6p0=;
 b=Y2HVqk9hjnAIIp2PJC7vBF5xlkdMjjbRN9pmbPPnesyzXOkWBr9bz8z/kloCXVFKy6KxVj3hL
 uaewGRPX2vOAkZrma/lyCcQpIBmVJKspyRTZNB73JZkL7B2uuArKRVv
X-Developer-Key: i=anvesh.p@oss.qualcomm.com; a=ed25519;
 pk=8o9EG7gkPe2Er9y9UVCx8MTdcFCwU8Pa54hBZPuduXE=
X-Proofpoint-ORIG-GUID: pGC0zXLefW_0EYeRNDzXmFGEK9n_-O9O
X-Authority-Analysis: v=2.4 cv=c5Q+0h9l c=1 sm=1 tr=0 ts=6afdc64e cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=0YpHyUaMQROqBQU0yscA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA2MiBTYWx0ZWRfX6XYveng9NCVA
 zFbwMVcngQuJCw5tf3XV71HIj2vW7fmeC3O+cEUAB26VMmqrqE7xWxs0IL8D+QmmIKgonAcjXPf
 vBgsWJd0tL511a7qajyDlfLpiex1bWs=
X-Proofpoint-GUID: pGC0zXLefW_0EYeRNDzXmFGEK9n_-O9O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA2MiBTYWx0ZWRfX++g2oFcenZ+q
 nH9gdBQGqxvw9DlvV33ON/x4edDc0EwD+eZk16lPrhOoE3hWy4ajrvpgT9Q9Vph+ciCDFZi2QjH
 8yhuw8dx23akcB7CffP5KT9pvh/IsGBwoQO+4M/rBM444+pP7CS18ebNto8R0wtp/wBOdo2z6r7
 7NZConckyFNGqjvWRvKakUulyChu0pb8ZElpxLce/dCnOq0arGu6Ho8rt9ryXaon8X1slT0EtS3
 Idzg5OfHC/WYbNDu797J9zpHvZey4UO7IdQYE5PhHEQ8OXM+OCt1cl/y60wzY3rXuYd9nLAfjr/
 6Ei46mskCB82Jf1U6pHeFlf/omEV3Ze8THhdwkv62SYvq22zSk3LuvGR05OXjK7aD36BRxs3Nst
 uGybiYJQes0HuaiVA2e//zrHXcwmkhqQXgrOJy8OoZYfNxwtJ/zKBhnFJlaUaYYl1xm/PkY5Om4
 m80VviDREALT4cTUKiA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180062

Add coredump support for PAS remoteproc instances with a secondary
processor by registering dump segments for both PAS firmware images and
temporarily mapping their carveouts during collection. This is for debug
dump collection and does not provide operational device recovery.

Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 67 +++++++++++++++++++++++++++++++++++---
 1 file changed, 62 insertions(+), 5 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 1c8c0c22c34d..a167bd6072c9 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -138,6 +138,7 @@ struct qcom_pas {
 	phys_addr_t region_assign_phys[MAX_ASSIGN_COUNT];
 
 	void __iomem *mem_region;
+	void __iomem *secondary_mem_region;
 
 	size_t mem_size;
 	size_t dtb_mem_size;
@@ -185,6 +186,11 @@ static void qcom_pas_segment_dump(struct rproc *rproc,
 	memcpy_fromio(dest, pas->mem_region + total_offset, size);
 }
 
+static bool qcom_pas_has_secondary(const struct qcom_pas *pas)
+{
+	return pas->secondary_pas_id && pas->secondary_dtb_pas_id;
+}
+
 static void qcom_pas_minidump(struct rproc *rproc)
 {
 	struct qcom_pas *pas = rproc->priv;
@@ -336,6 +342,17 @@ static int qcom_pas_load(struct rproc *rproc, const struct firmware *fw)
 		}
 	}
 
+	if (pas->secondary_pas_id) {
+		ret = qcom_register_dump_segments(rproc, pas->secondary_firmware);
+		if (ret) {
+			dev_err(pas->dev,
+				"failed to register secondary dump segments: %d\n", ret);
+			rproc_coredump_cleanup(rproc);
+			qcom_pas_release_firmware(pas);
+			return ret;
+		}
+	}
+
 	return 0;
 }
 
@@ -611,16 +628,38 @@ static int qcom_pas_stop(struct rproc *rproc)
 static void *qcom_pas_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *is_iomem)
 {
 	struct qcom_pas *pas = rproc->priv;
-	int offset;
+	phys_addr_t base;
+	void __iomem *region;
+
+	if (da >= pas->mem_reloc && len <= pas->mem_size &&
+	    da - pas->mem_reloc <= pas->mem_size - len) {
+		base = pas->mem_reloc;
+		region = pas->mem_region;
+	} else if (da >= pas->mem_phys && len <= pas->mem_size &&
+		   da - pas->mem_phys <= pas->mem_size - len) {
+		base = pas->mem_phys;
+		region = pas->mem_region;
+	} else if (da >= pas->secondary_mem_reloc &&
+		   len <= pas->secondary_mem_size &&
+		   da - pas->secondary_mem_reloc <= pas->secondary_mem_size - len) {
+		base = pas->secondary_mem_reloc;
+		region = pas->secondary_mem_region;
+	} else if (da >= pas->secondary_mem_phys &&
+		   len <= pas->secondary_mem_size &&
+		   da - pas->secondary_mem_phys <= pas->secondary_mem_size - len) {
+		base = pas->secondary_mem_phys;
+		region = pas->secondary_mem_region;
+	} else {
+		return NULL;
+	}
 
-	offset = da - pas->mem_reloc;
-	if (offset < 0 || offset + len > pas->mem_size)
+	if (!region)
 		return NULL;
 
 	if (is_iomem)
 		*is_iomem = true;
 
-	return (__force void *)pas->mem_region + offset;
+	return (__force void *)region + (da - base);
 }
 
 static int qcom_pas_parse_firmware(struct rproc *rproc, const struct firmware *fw)
@@ -748,11 +787,28 @@ static void qcom_pas_coredump(struct rproc *rproc)
 {
 	struct qcom_pas *pas = rproc->priv;
 
-	pas->mem_region = qcom_pas_ctx_map(pas->pas_ctx);
+	if (list_empty(&rproc->dump_segments))
+		return;
+
+	if (!pas->mem_region)
+		pas->mem_region = qcom_pas_ctx_map(pas->pas_ctx);
 	if (!pas->mem_region)
 		return;
 
+	if (qcom_pas_has_secondary(pas) && !pas->secondary_mem_region) {
+		pas->secondary_mem_region =
+			qcom_pas_ctx_map(pas->secondary_pas_ctx);
+		if (!pas->secondary_mem_region)
+			dev_err(pas->dev, "unable to map secondary memory for coredump\n");
+	}
+
 	rproc_coredump(rproc);
+
+	if (pas->secondary_mem_region) {
+		iounmap(pas->secondary_mem_region);
+		pas->secondary_mem_region = NULL;
+	}
+
 	iounmap(pas->mem_region);
 	pas->mem_region = NULL;
 }
@@ -1276,6 +1332,7 @@ static void qcom_pas_remove(struct platform_device *pdev)
 		of_platform_device_destroy(&pas->bam_dmux->dev, NULL);
 
 	rproc_del(pas->rproc);
+	rproc_coredump_cleanup(pas->rproc);
 
 	if (pas->tmd_inst)
 		qmi_tmd_exit(pas->tmd_inst);

-- 
2.34.1

