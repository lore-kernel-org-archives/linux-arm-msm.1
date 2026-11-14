Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794621668;
	b=dLFOQlHPgfUgICLL9Gk7In3YicbHy6J5ZIOfCXxizYF11DkT/mQjkfLMnQ2Sm+HMQsZy
	 TF1AiuzrHpobBHoUSxhpzZRC8nTNIm5PdEMTu3ITaSh5eHz3UvhnufNgyJleMFou6+uYu
	 Ep5yyX38qPG4aA8ZDn+jfzOS87DRkCk71wKhZW287kptynQqce34aJ6WoHAizfDEcGMsy
	 rGpdev9L2VqQJ5jaoF3g96oJWymavN2JLpWyWLtSgog5zCWLYl9sD4jADPbEA5F320EmI
	 DRoJhBIadmvVWEg1qJ07fwT5ZlVmNGGFSZjtOZSbUQqL4kFwiFORJ4hB6UwL7b/MRnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794621668;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Sz+6Kcub7kDVCrdSqvP71/UKnkp6RLiDhWqxwmv1ciI=;
	b=E+qQMoFa2GAg3eFaw72u8W0wIocNdppoqylI119R1FAZC/oV8Ut1Ik+tT8jo80kz8/Nc
	 fI9cvj/9f07Q9DSRo19VnsgO7mjHWOTjanVe14UomCzl6W42IpuVCL5jaYJDVaffVZa0e
	 shKOheiD4wIT+o1xFZXfgbysm8k9/qaNuwQMp6Dfl3LvN50Wv0bhBRUVP/ZwMb+ZVK1t7
	 L/erO2TrjTa3/cnYNXZN90Rf7DogUUnE5LOiaPoi8RQtGYigOCQhtHwX9TbeQ9LM4bLmW
	 c2FhZvKdm5jywTpIJBcl2g04vM3BTBRspa4O2aSjLWFpesJKE+qmaHNc+HwJAKSt3xQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PzXSZHmP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VVJa9l79;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D367660A381C
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 02:01:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D367660A381C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PzXSZHmP;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VVJa9l79
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AE200VS2355356
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 02:01:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Sz+6Kcub7kDVCrdSqvP71/UKnkp6RLiDhWqxwmv1ciI=; b=PzXSZHmPbBPCB7HA
	hn/8sbYBAHxFIXL9DXDrrD54cbAkryq1Xgu/vJI4egw1ZbTwAcO8vuFcwGwoN0C+
	udDBEgvBbxsB9HVseaCKsV/MuFU4+HzQ5lrH2gLyY1CK0c4FeyjvLq2kdl7ToYK6
	Dlyq30+Bu8sBtaI/MIldw4ouJdrKmXrHAZnXI3Mn9bfrN4SWlAtMTCEY6B+C8zsi
	XiUD9y1FZx6EBq3S7lrAP+U3qfbERNld1fdnWvvNqzC2Uwh6Segwkg5pvab8PvT0
	pBaT131EtbaOtad0EGgHyWYeDpj3IH8h5XtLIhp0G8PESoz/03nIfE0DHYR0r8d/
	1ISApg==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxahj0rt9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 02:01:05 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-154e9d2d94fso4549372c88.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 18:01:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794621664; x=1795226464; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sz+6Kcub7kDVCrdSqvP71/UKnkp6RLiDhWqxwmv1ciI=;
        b=VVJa9l79VTTmOzGI4cTChHkwJxCRPBig1Ikq5zJAbsIIFql7ekbDPL+f3cGeK/5/LR
         maeKZ4JVHK0RPFtvJaekYGCyyxBCUE2wlr/3Cp7tC+FgA98zgtENhXsHTn7MLZxqQ99M
         S0BchRiUgDpHBspCXyLVQRCQ8pe8x6BWT8d3gQoX+Ib0k5p8X8e7AU8D3LbHIMH+0z3l
         xwetRePUlbrqiLQIH8QB1MZQZV5pR/kjVinbD8cxInOVEcHVSPQ5exJ1GdcnNTOE+94f
         Oqo0N++FHozwUKm5hh2bEakJac6943AzSUigaV6UM49a6758ck4J2TolGvbsdfmAJPrS
         92JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794621664; x=1795226464;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Sz+6Kcub7kDVCrdSqvP71/UKnkp6RLiDhWqxwmv1ciI=;
        b=w/D68ImEjcdHabCbb47ehkj1tWRXagQk0XJevCBzEuFUm6JjHzzAIrZmD2TiumV9uP
         CM0Q+iId9k1Au/MxRBp7MmMNKFcap1O6uPUqAuBn5kIa+2aEfA3ycnZ9R2jlc6bipPcg
         n7bbTRylNrEmJOjxBznh4JNX1uZcdsDqLysqZy7PFpLXv/tgsAwVr0XCiJWIEPBcSKie
         GD+8vAPQVuBWKRCvgWxM6V59QEEJtDqMzlWC44Z9wjKA3TiKgbbx/jKGrh3mgP1yNZEY
         REVbEa6QpmxWI3//X3CAx4BGtKfEQWyb3x/FlC1P0JiUQubyvd2hhGO6BA1TTrTQyOWD
         qt4w==
X-Forwarded-Encrypted: i=1; AL+hErGOnZTOp+iBUTqwDFnEDZvvWAmvDGXShOn5FiO7GiA7GiGkU7YQBTm1u+uHu6NAc12FLDUGE6fH9VrofAPf@vger.kernel.org
X-Gm-Message-State: APuU4Z+c/ufXg1cmWBb1Ng1bQz/Y4j6cLkFjQA5XaJKMp/I+idQ6I1UH
	bCWnKnRdWr4GQ8it/UNrriNb8huKmKDHleoqyNdIwNc1xgM6kIK94hzJcaiIfN1evcfdEQiMX2j
	pUwNlS/8ZdMRwftNU5/fbk5VYr8luN61upzj4/2jpLFjjBZw/48As+A8KupoJhpgt3p8V
X-Gm-Gg: AYBFou1Upiw6t9yPJ4SPpLkM34fNbREDCA+rOKmcCZEmOH44tZJ3IrXhOLPXtaSUNBM
	kuiQBvS1QdxVDhUWGWHE+FvVcqlbYOeXtSY9D4mhdFxWijGFvQD3c2qXk73WXRATL0sj7YlBzPl
	mPTuAaKSYlt5pLQSHdBRs3yHVThueGna0b02pUawOqQ5pCllthoWncsSl6+2Ms2tzO4fhyUFBe+
	lRAhgPswi3p1o/YJhPEtdEfuAkatiWYqcwBa5ESTgLvMAZCxVxFbOJFJSe2h5r/OD1/lbwQp25I
	wZuSXsnVGlSMhpniZysSaVbsbgaYMdRDgDWFyGwCBJsnqbzDci1BWmv3cUGFt/LoxV9IrHhwyHm
	XNue6V39MvG4o+06tTcDNW2VX0xLMYs9agfgLEvDqqVXzRxAlm0yEbhszsvkTPWH7MWf7fCBJJP
	lOibCrt8WG
X-Received: by 2002:a05:7022:3c84:b0:181:73fc:e53 with SMTP id a92af1059eb24-1b50311d31bmr3900136c88.29.1794621663979;
        Fri, 13 Nov 2026 18:01:03 -0800 (PST)
X-Received: by 2002:a05:7022:3c84:b0:181:73fc:e53 with SMTP id a92af1059eb24-1b50311d31bmr3900106c88.29.1794621663240;
        Fri, 13 Nov 2026 18:01:03 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50316d9c2sm9952742c88.7.2026.11.13.18.00.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 18:01:02 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Sat, 14 Nov 2026 07:30:51 +0530
Subject: [PATCH v9 1/4] PCI: host-common: Fix early bus-walk exit in
 d3cold_possible()
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
Message-Id: <20261114-shutdown-v9-1-5430c9f242ed@oss.qualcomm.com>
References: <20261114-shutdown-v9-0-5430c9f242ed@oss.qualcomm.com>
In-Reply-To: <20261114-shutdown-v9-0-5430c9f242ed@oss.qualcomm.com>
To: Jingoo Han <jingoohan1@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: konrad.dybcio@oss.qualcomm.com, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794621655; l=2329;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=Z62C1KjgkUfHo1yhmxjksV4K46Bz6P+GsVAjd37UQdg=;
 b=unbeud0Jbm/M4cKx5Xkse0KpMHXkBpv78tZUuAroN1MF04Ki6ksBln4irO3yheoIrEm77V0GM
 UuyDjQUAHpIBNmLj3pMFdBOLA7rsDjHXD0qg8M/i2zn3u0EVNpxyYtW
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDAwNyBTYWx0ZWRfXyZidla0J5414
 ta9+M++JNwloxAhxPKsGV+/630mgKHQgp87U0+o3lB+1LAT6RYoWw8Kux1SQPrDm5KlGNbvT8RD
 tAYzmvBaZ0zC64AGWtSz8dAJgqbCVTr6zBdVJdefwdNDEiESjow2vN43oJH7P6jyfhm2Jz28N5M
 yvsi7DvMbAIjvq9p9EVjAU3gQmUF8KFv6NOdy7wVmqXutc1JfbLGPL3ujP0Tlq/BwYmiZccEXbU
 vGYBIwSSTA1KrMO1J48mcyBvgfp9WQ82hK5//rmUZFppClIKDH4WeUCs5GzGog+jKjG8+KFSp++
 Ty0FP+7MhwQy19djY/HoDzvWIXgWPAadpteRCuY4Cvd4mD1QetWMOiR3Ky1mcfxXb0hN11zhs4U
 MK7PZr5Qfr1gUPD/1JNBZGMpFH2rCzYCVeSQ52EVuRYIfnZ6IR+547KDLzjV2xsv6abd/1Xae6o
 nTLoefhd3E9Jb9zKL2A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDAwNyBTYWx0ZWRfXwx7GM0xLvIUq
 3FHCb1HJhXR7Oc9sNx6qP3FGEmqB+7w78dtmx2XfOjEv4kNxrVhwZ7gVNSHT02cLix24lu5DBff
 YikjzHOQUjzH66zy1n+qEV63X3W2syw=
X-Proofpoint-ORIG-GUID: 9nYxlHWIlxdILbeCCIhBzvfMFf3qWZds
X-Authority-Analysis: v=2.4 cv=Kv/YSmWN c=1 sm=1 tr=0 ts=6af7c0e1 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=RIIKlrP-v3AzcS8hWasA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-GUID: 9nYxlHWIlxdILbeCCIhBzvfMFf3qWZds
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 adultscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140007

__pci_host_common_d3cold_possible() returns -EOPNOTSUPP for the first
downstream device it finds outside PCI_D3hot, and pci_walk_bus() aborts
the walk as soon as its callback returns nonzero. Any device enumerated
after the disqualifying one -- including a wakeup-enabled, PME-from-D3cold
capable endpoint -- is then never visited, so pme_capable can come back
false even though such a device exists on the bus.

Since pci_host_common_d3cold_possible() already returns false whenever
any device disqualifies D3cold, aborting the walk buys nothing for the
plain suspend path: the overall bool result is unaffected. But it
silently drops pme_capable detection for any device ordered after the
disqualifying one.

This matters for the upcoming shutdown path in particular: unlike plain
suspend, shutdown forces the link into L2/D3cold regardless of whether
pci_host_common_d3cold_possible() itself allows it (see the following
"force_d3cold" changes), so at shutdown time it's common for an
endpoint to still be in D0 and disqualify D3cold while a later,
PME-capable device is never visited. dw_pcie_suspend_noirq() still
uses "pme_capable" to set pci->pp.skip_pwrctrl_off, so an inaccurate
result here can cause Vaux/wakeup support to be dropped for a device
that actually supports PME from D3cold.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/controller/pci-host-common.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/pci/controller/pci-host-common.c b/drivers/pci/controller/pci-host-common.c
index a23907a875e5..c2c852c64aa8 100644
--- a/drivers/pci/controller/pci-host-common.c
+++ b/drivers/pci/controller/pci-host-common.c
@@ -275,21 +275,16 @@ static int __pci_host_common_d3cold_possible(struct pci_dev *pdev,
 		return 0;
 
 	if (pdev->current_state != PCI_D3hot)
-		goto exit;
+		*flags &= ~PCI_HOST_D3COLD_ALLOWED;
 
 	if (device_may_wakeup(&pdev->dev)) {
-		if (!pci_pme_capable(pdev, PCI_D3cold))
-			goto exit;
-		else
+		if (pci_pme_capable(pdev, PCI_D3cold))
 			*flags |= PCI_HOST_PME_D3COLD_CAPABLE;
+		else
+			*flags &= ~PCI_HOST_D3COLD_ALLOWED;
 	}
 
 	return 0;
-
-exit:
-	*flags &= ~PCI_HOST_D3COLD_ALLOWED;
-
-	return -EOPNOTSUPP;
 }
 
 /**

-- 
2.34.1

