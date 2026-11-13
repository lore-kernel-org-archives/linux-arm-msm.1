Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794572673;
	b=jstaZAx1m2Wntu6dK6cmdgAPpn/IUkc0l7sW8CpC1Lp6zvMESVyUdg/ZDhmORVDxpGu6
	 x/ob/ho4tcquBzKQaowha74gqAasSnJoql0EnxXzKTLnTt6YIjb2U9h1c3/Qblhl1IbDI
	 m4CFk0PqCVPVrB5hNymxY5jje5uljLaZ09fUIkLko+XWuQrv7wcgNf3rJzpWO8TRmbeCZ
	 S1xSH5etZGSwJ3hvAvqTGnNyMXrgPkcYDdFgLNktDPoU+FNCEk1pQOHWntS2oW1K5q5/F
	 kjJlZEir8SuY7BzzMbh+HWLjhMa3P1TjF2rjysYMn2+L2MEGE+u8XHwSYplBdMmB7rw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794572673;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=khMeO+3hnF7JoerFAErBwOXNznfce9mQZqJj+KNKRoI=;
	b=gI4KZULOlDQwMKmhGhXtKSy/E9w/lcVOoGJKBinF3lNAVYt5LFE5sDrWR6DEIKqHzcH4
	 eFMkTHB0NXUNJVc8KCTGL+JkokPgTLURyDSxdajn95frMVR093yjUKNzXCMhLWWyjqkjM
	 L045N35FfLFCuEHt3AYDsITCESvJXnwKcorhwWo3wsLBbDe06wuKPk56gPr9xLwYPSB80
	 NSoHHVmT5fOiWKTlgIuU3ZIKK9QIs4SsyURiHd2XWozbOYMnwCAHQKib6Ql+f5kfWTaUM
	 W63Ssuv4ZA0j3Mjjk2fRwwqVkdINoDQmhFl+qssWDPRZd5neI9nmVWz2Ya8xrxRYJsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XdAJQ7ZE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YgL6kuDy;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 234AD60A5BC7
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 12:24:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 234AD60A5BC7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XdAJQ7ZE;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YgL6kuDy
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADCJcqG688926
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 12:24:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	khMeO+3hnF7JoerFAErBwOXNznfce9mQZqJj+KNKRoI=; b=XdAJQ7ZEB6hhne+5
	/pCCL7npKvj8RGv+PwJjKr7VU9qQY2fWTJwG9CHWFuH89U6rVQKU4ddNFjiFOXFQ
	Qdtox4KbX/hJ3nXgpPYcmrzOXphDGJj3Z7jJsn0CeckyKHObkeRpfx5YozepbIo9
	LIOrMUz0g8jH8+Xeap//DF0ZYl+/54FAfpYqDl/AGtOkAl9VWXcN2fBNvbi3Jtad
	cUAxIExr70TlsPneA7k+E6MJcjJqgMoWVWDmupOvkLynm6DCf3Lo0l/ffRuvDXEP
	iBi/pD5tGtw1pbS6mL0y+zi3ZoS5ULgOu2K3yXe4rk7FCt0HCkuWfpMu5rbwlNxP
	qwUscg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwqufj9ut-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 12:24:32 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b18165dc53so1342803a91.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 04:24:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794572672; x=1795177472; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=khMeO+3hnF7JoerFAErBwOXNznfce9mQZqJj+KNKRoI=;
        b=YgL6kuDykoD08hcibAhygAoL5g+A6v51+ViOGL8WsM7r8kSMFhDqcddR7x3ELFdJ3+
         jYkp+N5Ni3C4kNsqjKArz2j57x3AivV/FWLl3e3wx0yhiodfCwMRPzUmGiRvUcSWjI6q
         cJxJ43rX7MhXQFHp/VP2k8G6pawj4qQTYLUU1VVaeSi++GoGMVNNu7YL5dnjDYyNF5IO
         1A18iLd8Wp25El94tuK1K1oVcybiuscQjSoZEL/9VxqTdAp0gWA0hJp1/59S9xeZbhaZ
         ytwip7ir1C6gBd300mvTRBUPahILnfg0G0iwyflVWg+4FaI+vOQd54M8361UjEqaJZ8F
         yAHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794572672; x=1795177472;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=khMeO+3hnF7JoerFAErBwOXNznfce9mQZqJj+KNKRoI=;
        b=DmQyj9AaspObdK1hAJ4RrgSC9b1UnTj4rD8sA131DdnjnOM7AMnWP6G4hugVVrLnN0
         Fb+uUchVvxYPrHYpptujNW+RkYHiujJfqOSXwQWU+7BnEJa7kQloENKcDTrrk79vsBa6
         AHV1TsXW49JYw4vBEtTNJBVN40hO/FOsdggHBya5MUDLe48gaZRenDRY4wGjBixnqiGi
         N8+xKhGSuAWBYlYfyrQii9HOAAFbsbAbyXc1mrziLLl7tSRr3PtE32KPxeCXuBgfy4Re
         SgGDB6jacAJUX6XkdMYJlphB9cSnUixtsvWqRx6YD4hkWXXmx1/c4ZsXdCqBAic/hABS
         ONnQ==
X-Gm-Message-State: APuU4Z/8hfWNgHSsuYKIWWYJruV5LJmvoWC/KTY1TopdLNgzdPHYTg+c
	t0YoZAxfJqvzORg1+W/BMRzdDZYjRZPDaEmOOrw/KHL3BeofLaktCRbyKyZ63aUDQE6mbZ+ySzE
	IN04mM9IAhOX/1PyAgMPIxdrjuVwL1M+6bcxOWzCk25lx0ksJWc4SN5ksTD06Z0Qapmiw
X-Gm-Gg: AYBFou22oFd9XrE8bxsYgqbzGunY7W7MXS3ROMQQIgGjW1XordA9EIQQHyaJZjb+GO/
	q3bgpx0Nt7ncw0vwgDoNx/NrhLVAo2vYFYno30ZoKY1JW03kKehovI+EMOEQHED1EdPTH1nP2+Q
	DH+1kWUzZ9g5YjNCUC6rmsjNptWPzwMTqqkvTdOj0KRDOj0oUnK0bk+NraWu2nmuhKs49ujVGUy
	0UTO28FY5mDfGCzreO2yEjeIjr6Zn4cMtrZUIOfUZzW66VGKbPbtOTRiXbSWDrYfOGTxypuH9at
	WOFNalWO/heWy8trJDYHowTAgWcepyTuDvAXkqa1Q9X5lr3mylPE9cXiJ3tX2f/0Ox44EhshhFk
	Zco00jXnUlvRbVy8e/MNi4JcrlJke2xN7GKKwwcQRUV1IHRC8h+dORqidEQ/+SfIE+vJeuQh1sL
	/CTRuTDYWg3g==
X-Received: by 2002:a17:90b:1b12:b0:3b0:a3eb:759e with SMTP id 98e67ed59e1d1-3b1b09e5cb0mr1897983a91.17.1794572671698;
        Fri, 13 Nov 2026 04:24:31 -0800 (PST)
X-Received: by 2002:a17:90b:1b12:b0:3b0:a3eb:759e with SMTP id 98e67ed59e1d1-3b1b09e5cb0mr1897965a91.17.1794572671169;
        Fri, 13 Nov 2026 04:24:31 -0800 (PST)
Received: from hu-apateriy-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc1870ce8sm1098025a12.9.2026.11.13.04.24.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 04:24:30 -0800 (PST)
From: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 17:54:13 +0530
Subject: [PATCH RFC 2/2] remoteproc: qcom_q6v5_pas: map SOCCP carveout
 privileged-only
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
Message-Id: <20261113-nord_embedded_el2-v1-2-48f717e97066@oss.qualcomm.com>
References: <20261113-nord_embedded_el2-v1-0-48f717e97066@oss.qualcomm.com>
In-Reply-To: <20261113-nord_embedded_el2-v1-0-48f717e97066@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-GUID: Pm4-rfilj3Sha9tv_pNKHRbp7IyKuGhF
X-Proofpoint-ORIG-GUID: Pm4-rfilj3Sha9tv_pNKHRbp7IyKuGhF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA0OCBTYWx0ZWRfX0bLrPZofDbbP
 g3xm9NCkJP/l4d2e7Sn5G/dImIaWCTLX0NF1wjmsEpMdP5NVdBjlpm2x1ck2XFYVLUuiL90XE9K
 f+vK6sa0a5i5DrSl1x9xv1rwyFI2+KPL5IXc2b2P2vk2f9D4OkG8v0+7F8KnJp7iHa9zFaRxw6E
 jtXU5JJCxS5vQmgLOmEru0pizrgc/bS7uH8Moe10v5YCsgvgAWVM4qTk9YISxNmny20whNe8kQA
 SWa52/0Eu+syZCoSYZsVGEubKeEjecbRWJxwWWGGqPiwVN/JZ8sio2HLqKbfn2luYrsQWGwuIus
 3pJ9sB2jG7/VhVxjAumWLXXdmr3SQxR3NMutpCcpXcoyNkOI2Ro8yxX9D5HHn6QdIUxbW1wxdO7
 Eejxn45VN4JLo0PDgNX5Q/Y9pP9AiXOKB393p/HvpOEFtB7UeqQEaWEETHBcb+/jMdEahj+AVRN
 aYn2Y8nCF89ruFVci9w==
X-Authority-Analysis: v=2.4 cv=XZocX455 c=1 sm=1 tr=0 ts=6af70180 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=BpH2AGw4GZKVZVB5wQUA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA0OCBTYWx0ZWRfXwZ643HFSBG8e
 t92yLe2CjKSOD9vmhPG4vuK1tB5mgKXg3Mf08GccsoLThjND6eda5JwKUNv9QMNLmT8wNo3yihw
 6TLxCgEL1yqgr73thSbRJ+9Kv85fwhg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130048

From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

SOCCP is a RISC-V core whose instruction fetches go through the
SMMU in privilege mode

The memory region is mapped with IOMMU_READ | IOMMU_WRITE, which results
in permission fault when SOCCP fetches instruction, append IOMMU_PRIV to
mapping to allow it to fetch instructions.

Other PIL subsystems (e.g. Hexagon Q6) are not affected as their
instruction fetches do not go through the SMMU in privileged mode.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index dfe67f32e537..43218039e3d5 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -84,6 +84,12 @@ struct qcom_pas_data {
 	int region_assign_vmid;
 	bool early_boot;
 	bool needs_tzmem;
+	/*
+	 * flag to map the carveout as privileged-only. Required for
+	 * subsystems such as SOCCP whose instruction fetches go through
+	 * the SMMU in privilege mode.
+	 */
+	bool iommu_priv;
 };
 
 struct qcom_pas {
@@ -112,6 +118,7 @@ struct qcom_pas {
 	int crash_reason_smem;
 	unsigned int smem_host_id;
 	bool decrypt_shutdown;
+	bool iommu_priv;
 	const char *info_name;
 
 	const struct firmware *firmware;
@@ -297,11 +304,16 @@ static void qcom_pas_unmap_carveout(struct rproc *rproc, phys_addr_t mem_phys, s
 
 static int qcom_pas_map_carveout(struct rproc *rproc, phys_addr_t mem_phys, size_t size)
 {
+	struct qcom_pas *pas = rproc->priv;
+	int prot = IOMMU_READ | IOMMU_WRITE;
 	int ret = 0;
 
+	if (pas->iommu_priv)
+		prot |= IOMMU_PRIV;
+
 	if (rproc->has_iommu)
 		ret = iommu_map(rproc->domain, mem_phys, mem_phys, size,
-				IOMMU_READ | IOMMU_WRITE, GFP_KERNEL);
+				prot, GFP_KERNEL);
 	return ret;
 }
 
@@ -961,6 +973,7 @@ static int qcom_pas_probe(struct platform_device *pdev)
 	pas->info_name = desc->sysmon_name;
 	pas->smem_host_id = desc->smem_host_id;
 	pas->decrypt_shutdown = desc->decrypt_shutdown;
+	pas->iommu_priv = desc->iommu_priv;
 	pas->proxy_pd_performance_states = desc->proxy_pd_performance_states;
 	pas->region_assign_idx = desc->region_assign_idx;
 	pas->region_assign_count = min_t(int, MAX_ASSIGN_COUNT, desc->region_assign_count);
@@ -1708,6 +1721,7 @@ static const struct qcom_pas_data nord_soccp_resource = {
 	.ssr_name = "soccp",
 	.sysmon_name = "soccp",
 	.auto_boot = true,
+	.iommu_priv = true,
 };
 
 static const struct qcom_pas_data sm8450_mpss_resource = {

-- 
2.43.0

