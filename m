Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1132420485
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Aug 2026 08:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786006613; cv=none; b=T3c7ivZ4gMWjCjMiIWglgzeejs4wrzJ+jAQDK1PfbNVxV4ix3LH5n4zXhSvi24P3gvGNn/dYpz8zaIyAmkSd5srg9m+KTiv8HiKvJ9T0ZC+v/S5re3xQXlSdECxJGI1um9mU524710lvlAb9LfsqBxzW/Un+W0V8a8a/othxCow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786006613; c=relaxed/simple;
	bh=TprHX5IL8YrcrUWqFt02NpGVXmRlVfThrNPCvDkcGUE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z6FRDXLWOqygICTanAbvVeMhLAGqTxXMnAoNHeoBViEwNjGuJDwJ3dHycU3rqqSRwUB2yxVdPkdoSfmCMRPnLBeteiC6bY69R+gwp0Z8fWvd8N1Hfqu/0ylcrmtsHan/x8RDmV3HgvZiJVsX9PBFLn6aCfY6C7ia+Q59Q7JGBCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jOI4xGpC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iPnFkeMn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jOI4xGpC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iPnFkeMn"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6763wloi1070540
	for <linux-arm-msm@vger.kernel.org>; Thu, 6 Aug 2026 08:56:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4sx/jJIYr0KVKmz4oHyzboJa+2zVeJWkX3RGTVkh0po=; b=jOI4xGpC7iIWEHGf
	vjgAeUaYCkSsNZmmNbjDmb9p3vPZzU+0bkpmrJ5rAMm0xaJzLcUKaZ/yeUgKUG16
	EYJY16PqF/BuBzBI/dzx5fd2i0SLtVi3lKlhDMHrXmsgdcDZZ8AO6Pd6z1KTxecH
	DrsPI3tMpGD3PJcxjwhA1SBj1n3O7Y6Nrt14N+Gj6UNCOg4zysXkgsgU5jNPFTv3
	53fNqqq4dEp6XpzeGWj2IIXRB505TS0wQiHuwMIU+U2LfL3rYFGERSd4K1MLiVO3
	UJ0R8AVZxKY7a8ew0D8y3ZCixe4YL627uwce8iu1+tbfPeyV2mkA9iRVc4pHXnTR
	lEsxdA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvjud14qw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 06 Aug 2026 08:56:49 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84857446424so3385624b3a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Aug 2026 01:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786006609; x=1786611409; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4sx/jJIYr0KVKmz4oHyzboJa+2zVeJWkX3RGTVkh0po=;
        b=iPnFkeMnymfYubwCwzbwyJijQPnUw4xXJgh9ItW1aaYgpLFLgj4vNLHzX9FlgbA1ET
         tSEMj5P5IJNsq/Y3qLuNV+GN3k5xGQD6bP5OlzWfJVhguDOGXXZQ3OpG+cqPIeL3vAfS
         mXMhJQXnIliI/dLPkhITXaviu5FsllbhVRIpaC6XUKaCRxrwTXXJwPlsT3wqbZnvEAVj
         +ewFnLgccmxhL2RMAXj0jfLdcC1tGy20w5u96znvXULHZwkDsNnikHeZ06q9KpnOwf/K
         fwCXjHlnyxrn6VjclAAflA9JUU2bqzLkKtaael0PgnVHWBHcP/1lP3edQruexbbcYiYN
         xftQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786006609; x=1786611409;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4sx/jJIYr0KVKmz4oHyzboJa+2zVeJWkX3RGTVkh0po=;
        b=jTThw57eh2SK0eULjOXnHzgMVnSLSSKah9GcEX/v7sSO/sY13g9LOuPumryGmP1yK7
         uPeTqBO8zqy2QD6gPwt++09Mx+bb8tHSBpNEBbz3n6HUiTjrW2vdfQMkYhy+LzQEjWkY
         0hDWgpqa6aMxfNklP1w0tjdDdV2a3X8IzsIp8e2qX6/6Qg4uY/6Uc6IamXhRzR23Y00a
         5jPysyO2Pu9qia0W22nJUf8oD+eoznGHzadaRLzPr1HkRJcaM+2pud51yHCKyC58QeR4
         jvBpBZguuOn4n7065E8QFzCbaeDdHUtnXkOQG/L3NxND/fsbv+bi9JKPy2vfcSw+r2IL
         y0FA==
X-Gm-Message-State: AOJu0YwI+JOYEwCPydxGg7dCVRgYbB0yMbtaFdTGfeJxC1lkkaK6mSVc
	BRK5onIoIPB35LDFUClKKwRMBwAmgOX94MwFc31cP57oTsvMI/PusvgMIMexmm4LzB5FjdYFcSa
	mLBg5DVyqDgG40UEnOD2ZtemTzF3mQjxUhhNJAWNCWdWQVsxAwdJl63GMVfSKgrXR0JkQ
X-Gm-Gg: AR+sD12Ca9crH3PjwUSrv0VLRZoOGy8h/X+nFEoDSnVmQdwwn/1D+pHMkVhXkZmvE+c
	Segx9KRS3iEnad7qOmoLo75mtMsw5p0s5NpmKjNFPjtO+31USTsXkE9uJd5tilnE7krwIIYt85n
	9CXGYeBElUTG0fNScyz59YxpOP2FMagxbxpD+xLGBW28xi+qTZ3Umg57oCg/N1PTDKA/91zBDpm
	29EczDhWuPqdeOs0FQK8qid3/3NmVMs/qjXhAB/iraWHLGux7fpr5ZLkuYAwJqFd8K2+YN2goCo
	A8ceEaMsh4o4wLsk2sXdEYCI64PyN5gpW/lBRsMkLnj9KBID0KGY7Ndg1h0hyrw7uqarQNcqgfA
	SKcgehEd+2jJATPDKGgT1DBCUZynV
X-Received: by 2002:a05:6a00:4488:b0:848:56ff:6ce4 with SMTP id d2e1a72fcca58-84f2dfc533fmr15894445b3a.5.1786006608919;
        Thu, 06 Aug 2026 01:56:48 -0700 (PDT)
X-Received: by 2002:a05:6a00:4488:b0:848:56ff:6ce4 with SMTP id d2e1a72fcca58-84f2dfc533fmr15894394b3a.5.1786006608354;
        Thu, 06 Aug 2026 01:56:48 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f456b7368sm953876b3a.37.2026.08.06.01.56.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 01:56:48 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Thu, 06 Aug 2026 14:26:28 +0530
Subject: [PATCH v4 2/3] irqchip/qcom-pdc: Add purwa compatible for PDC
 secondary mode
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260806-purwa-pdc-v4-2-62467f4b4ddc@oss.qualcomm.com>
References: <20260806-purwa-pdc-v4-0-62467f4b4ddc@oss.qualcomm.com>
In-Reply-To: <20260806-purwa-pdc-v4-0-62467f4b4ddc@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Radu Rendec <radu@rendec.net>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786006595; l=1014;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=TprHX5IL8YrcrUWqFt02NpGVXmRlVfThrNPCvDkcGUE=;
 b=tf7xixIqMQmLd8i75hjGynYpDaTb5OQY1CrUH4aWllEfjFbstqSY3guA2w8sAz2Ip43I208by
 iZtEsOxKSh6BIqgZgI71hdPerY1aduAuYutfa1/pc3kSRaheUG/+clz
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA2OSBTYWx0ZWRfX4kx/DlXOdJLX
 cPFsw9+F++QevCgx+4JN81EndRRHl02bcmF/v1uS4yP6rkElqMkDt3+qPtxmfDwgCL2ZdkCvRc+
 3miVGdX2Ef0aZsXl8/NjEaFiftkOzqALE7ZQiCWq2M7vgfW9oPQa2+eEksQaBXZr8kmxq9Q0QAK
 ghnfiwC2MrwJYkKvtPOF0qEk2BHvqJnFiOEfi6BqScgC/8m9O7tOuSKPEEijwJimAz323Yp8w7O
 p6Huojn4M+dCIaD6gKpavg0pyZK7WPH6lRI6yM+7GKCJ6Uq6mkFj6KCRly5sIAXSKP7pi/qp1YA
 Ga/Ym7ohjzoyd4JRStWqSNO3QmOutJj3FCdxMj05jGDvEN+yv4UDafHtPPgD0ebWdJIwCzEdjG/
 26dkqNT+uMw2b2EgKiezJV24a0ogebyo+kLXqPymypJhtZoWcCFknA3SOkJL/jVdOB9+eeO4GMb
 5+El/kmmvsxz5faVkfQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA2OSBTYWx0ZWRfX46O4Iq7U2DOE
 4K42wSj/d3jcJ8IR7QMByPCEe5wkOkdOvBqAncuQogFo3LUCXMAF6BeQAdVs5HNmsy/dWVqtrwv
 EiymgZg2obCgs9q7ixfw7fKpOVAqNiM=
X-Proofpoint-GUID: FML5eKf7kMbcWjHzuRHF6ViraI7vSAuA
X-Proofpoint-ORIG-GUID: FML5eKf7kMbcWjHzuRHF6ViraI7vSAuA
X-Authority-Analysis: v=2.4 cv=DeInbPtW c=1 sm=1 tr=0 ts=6a744c51 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=PsF74K0pJtfrG51pEAYA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060069

X1P42100 (Purwa) and X1E80100 (Hamoa) shares the same PDC and windows
firmware sets the PDC to secondary mode for X1P42100 too. Add support
to reset the PDC to pass through mode using qcom_scm_io_writel() similar
to X1E80100.

Make sure x1e_quirk to workaround a hardware bug is set only for X1E80100
as X1P42100 have this fixed in silicon.

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 drivers/irqchip/qcom-pdc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/irqchip/qcom-pdc.c b/drivers/irqchip/qcom-pdc.c
index ce6d80c7f17a..29025a212ece 100644
--- a/drivers/irqchip/qcom-pdc.c
+++ b/drivers/irqchip/qcom-pdc.c
@@ -715,7 +715,10 @@ static int qcom_pdc_probe(struct platform_device *pdev, struct device_node *pare
 		}
 
 		pdc->x1e_quirk = true;
+	}
 
+	if (of_device_is_compatible(node, "qcom,x1e80100-pdc") ||
+	    of_device_is_compatible(node, "qcom,x1p42100-pdc")) {
 		if (!qcom_scm_is_available())
 			return -EPROBE_DEFER;
 

-- 
2.43.0

