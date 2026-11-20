Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795170955;
	b=WoObGDzMunKOTLk831NZSN4MfDsUINR3WH6woInoYv21cM76mycmICO+UuPw4MkgsAqC
	 41hSHqdj6UYUl8ClmlECHkgakC6M/hHtnpxyxYOmkN360lLIigXTF9uU5ESD95QMrgCnK
	 zI/5T/edcvCRh4DaHgkfgMuQfIRTsxJKvVTPfmtYzbDpShGwnMn+RmgLefthKq2dAYQ/l
	 6ZGm3CCTEl8MS5+0hZbsoKn4h5sJQTPUcBC+d6mCOl7aCk+E0Z4XhxEu+5tL4DGZWfC02
	 ZRUXx3odjy/jM30bw4/js2J9A0VnzF0FCTGchBEZlfJ+Px1tgc9hiCnUj2YTlmEM6UA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795170955;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Jja5CIRJx6p71jdLiDhzh91wfoRIZk+1zpGerhUQBKg=;
	b=I6mLKZb37uHgdi6L4UyQ21Qtv6Qms7htiL+ZAnkA0V7VKcYpSfB4kcZWCgIxyFLnMaKp
	 U96sI00pIO0g26EkN5JruujK+RhHn9I6KIn2GCGh/wqvtQ8viDaFl3IJz0skuZ+v7Vm+d
	 7NpsWT4JxOP3mr6tG4Ew7kcPj4FJUouL1xzuWoyC7N7VdKIzL1vJ3lpRik2V65Hfh1hlJ
	 kO06KkK/UkrSH2FYyKP7WhHb37QT2O6xxh3Nmzko41FZZbfuSQqYdf1lQIeN3xbB/uSyp
	 Kox7N8GGo4LdrZ5FeUAtlrmRHyOqpZk41wekr9wXyduNncBREM8DyCOcKnD6+cR8IWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=C+qR4cbO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="X/eUO/Qe";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35493606A326
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 10:35:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35493606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=C+qR4cbO;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X/eUO/Qe
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7f1Tj1048952
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 10:35:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Jja5CIRJx6p71jdLiDhzh91wfoRIZk+1zpGerhUQBKg=; b=C+qR4cbOm4AQtRHv
	WIj1hFUNtydcyAh4E1CrmnryhpUuL4AyJrq1xnJKCD2K62S4iyMHxToMBgBiF2VE
	cMKQyljlLBoe25qhVfiafS6dGtz/SQtxJWRGOjuUfWOKxQM3XHx3QiK9RysI2K3z
	QO9BprVVJg/N5c0uqMjnats955ePDVr0XgCwh3Y3P7W3WHRbNb9IcDQDR+bRtUVX
	BKTUChVxVby3MCDRP9D+MUatUAS3OeIS2weqGYVeDYo/UaU6DscWfhN7D5CAvqpQ
	FFhYETFkKQLF2oGFa6k6fl7NJPjptAbY3g4bILgNC+KKOQVlng+WbSE2cQxOI0Rh
	ccLXdw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2guah215-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 10:35:54 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33713e5e6daso1311037eec.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 02:35:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795170954; x=1795775754; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jja5CIRJx6p71jdLiDhzh91wfoRIZk+1zpGerhUQBKg=;
        b=X/eUO/Qe63RdSTPLS7pGhQz+I1mr8WKnLRiRP2FNn0/fQOgQnWvk547NiQf8ip2v+o
         2OWd+Blhx3F9qNZ7sve8BrQNpNEbsLU+DyKe26ts+FsTWVEu4jwwL2WYQJT3KD9HVoOK
         f/ss2L9p2l/M+L0mIFEb4RfN7Kywvan2zufDZSLgB6GEyH3ZKUcXafrllalHL/65V5TN
         qKaLaW7M07mhH21yT68Xdd7kveCx1kYdORScRUgt6eN8YbEfRA+fgNA1w8J/Z0EaPbXc
         IjQzvsjtFOa2EEiSxuo3Q2+F9UQNShiCv240I71l9ynm/kpja3yh7eRG8cLx81tkWVQg
         /mFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795170954; x=1795775754;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jja5CIRJx6p71jdLiDhzh91wfoRIZk+1zpGerhUQBKg=;
        b=Nrr8Z5SQilgFhwGxcxB1OSgypYlzY23s8Yi9QoH324aq88xSrQ7f6uX0THo6+e993x
         tXXVKdpzstHHM6ftaKCHdP7fF71hvkXsMuRNZxBBc6aftRhBAzWXULWWLqVFTmgCFc40
         Blc6uXDC07ug6YxK86kKBKpyW/qsEWJWvtnZAU0NpDLzNUm3ReMCrDKgeDcvtXPFRJUo
         Vvr/RQruJawhe8k73e0Joh7hUTESgo74WME8zqCB4HNgJyLQMo6dNf7KgNLigUeF5l3j
         VjvLY94/zMimvwUhv9UkRhrs7uCLY9RwXNtpmvTQxSVi/gMvaTv/vALmpVxiEHIQj3Hk
         F2lw==
X-Forwarded-Encrypted: i=1; AL+hErHgVntX6/bzgl4SwPvdnK4q1FMWXnLvzqMDd7K/YJZ6my/5g+4f0iyaYdOJkEV3gNE6lQ+UHihOcb1xBvmh@vger.kernel.org
X-Gm-Message-State: APuU4Z+BdPjA1Ra3+Q4OPvZZE1UAMvR1VRGzDPhkyQjIRBtOjRvSYcpY
	SsKv36nS8S9vMGS5DER/ruwy3i9h3aJbqewFU7HUEfnRG8JsuuAV8cEMTnrn95a+5vz51/NShGy
	RkhFFOZfc5W5uQPHDvmehTY+jlXE4VypFEH0UIiqQxC42L4yXmcYLDNfG+MeqCvothwO9
X-Gm-Gg: AYBFou1kY0CFhX432ph5eNDkln/rPdKUMonBfpa+wrdW/Y5Lc6JQDlROqC0A4x7QGT7
	w8EAHYI22eHMqqERFgf5F95gLFVXq2Z4yO9b1h34P0gowwGQ54Fyrs15m80irHF0nqxc6jxklkg
	sOU4Pw+kZ0b4GsouJxMfHBN9GBcvVHzlUxt6D3OzRpX0s/s3nnVMoiH3zlb3s3MC9Ha+OVjDlVv
	c7GeWwTIvzAwp4bAgH1SjXmaMdp269a79DEB2b3czo5YkcqS5nyacy+CMzM/CRiulLN6JbiRW8r
	MFgIPdxzCvakPZgfPoSopIgWuRSxhe5GZMLyUZ+dw8eQcgLLwM+u75JH3Z8Z/o/LMHaJtwjn+7t
	f/YO/WPuzaY6wwJe2Br0d20jFFTacwIolSWPpesTBQVOusvaZY8Sts0AZw5HqD2QqzV6Hw/wQc7
	35ybNVuUM0
X-Received: by 2002:a05:7022:f50f:b0:1ac:1022:b60c with SMTP id a92af1059eb24-1b5567b2091mr2086389c88.1.1795170953635;
        Fri, 20 Nov 2026 02:35:53 -0800 (PST)
X-Received: by 2002:a05:7022:f50f:b0:1ac:1022:b60c with SMTP id a92af1059eb24-1b5567b2091mr2086346c88.1.1795170953068;
        Fri, 20 Nov 2026 02:35:53 -0800 (PST)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567ffa8csm5751096c88.7.2026.11.20.02.35.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 02:35:52 -0800 (PST)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 16:05:13 +0530
Subject: [PATCH v8 1/4] iommu/dma: Keep reserved regions below the IOVA
 rbtree anchor
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
Message-Id: <20261120-add_iommu_ranges-v8-1-d90486973b73@oss.qualcomm.com>
References: <20261120-add_iommu_ranges-v8-0-d90486973b73@oss.qualcomm.com>
In-Reply-To: <20261120-add_iommu_ranges-v8-0-d90486973b73@oss.qualcomm.com>
To: "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Vasant Hegde <vasant.hegde@amd.com>,
        Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        David Woodhouse <dwmw2@infradead.org>,
        Lu Baolu <baolu.lu@linux.intel.com>,
        Jean-Philippe Brucker <jpb@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Tomasz Nowicki <tomasz.nowicki@caviumnetworks.com>,
        Eric Auger <eric.auger@redhat.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Joerg Roedel <jroedel@suse.de>,
        Srinath Mannam <srinath.mannam@broadcom.com>,
        Oza Pawandeep <quic_poza@quicinc.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Alex Williamson <alex@shazbot.org>
Cc: iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
        virtualization@lists.linux.dev, devicetree@vger.kernel.org,
        kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Sashiko <sashiko-bot@kernel.org>, stable@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795170934; l=4536;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=FYE2mL+pZ5Z1CfQkgLuaMoSmZ66ItGzwlfYFBujy6n8=;
 b=WLCvoXP/7Vfbh6awPjv6raAWHYawo4b5pLRUUX7uVPAlECWCVMKQvpoW6AEbF6Hm2zyCDu7DU
 LNluQNoNeBJAST7P4pA6j6rBPw0mJ/JExYQhkjltmeKvmyAlZrCtoro
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0MiBTYWx0ZWRfX3AQfGGovoFTm
 NHpX86PzUgNlUqHM49tsokeavBmShYRlJp+Nf/2mMvxtduygifbrsj+PNpscw/U66RttFojJPE7
 5rJt/HkwZ3cg3Mwlad8Z35B45RWcT6R1q86+fnLIX3zCnSg4hwVVBl+Z0FYfxvlAlr97iG2FsSZ
 S2bD5ktSr6zbvE5MNcqM5avnKFyJgu9lCqsbI/67uvFdQeGu45woG950eTQCZcoKKFgjDAoS+q1
 Xl7MMZIq5mIuXOqdWsKC0OsZxIgau8WuoXyBJQAMQ8gL+5+Z3A+Pq+ybSWAurrIp1QjEjtVwetB
 K6/OVZVCxsIE4rfkDh6yCQaaxUCuo03VZxJbJuq40RuTvKF3wgk2G7taO3flGAWxVBuErZ5jOdZ
 fF9gs5eFT3KdlI+aKmHzanRGB5bxYIYx95MADSdv/ngIfkz1uqC3/4I/2tc5a0kaYQP37tam5n5
 gNfhzY3Lhq+Awu7MNpQ==
X-Proofpoint-ORIG-GUID: VM8tP6RRwW_ktowQpAJO-I0T2mc6cuVh
X-Authority-Analysis: v=2.4 cv=BIYmP1QG c=1 sm=1 tr=0 ts=6b00228a cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=EEemQ_ogMLg0kHTv6E8A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: VM8tP6RRwW_ktowQpAJO-I0T2mc6cuVh
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0MiBTYWx0ZWRfX4KJSeZpZ79q9
 oUt8bRF48KO01HkwHef7GV+DUSWRoCRiOtRmUmD3sXh9f9Uq1n7EZdBRl9GE1sLfqJM9Bm2QGZ0
 xRI4Mt6DAW0iB4j/eYZ5uKOte8ldYi4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 adultscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200042

The IOVA allocator tracks address ranges by page frame number (PFN).
The highest node in its rbtree is a fixed anchor at PFN ~0UL, which is
embedded in the DMA cookie. dma-iommu converts reserved regions to PFNs
with iova_pfn(), which returns unsigned long. On x86-32 with PAE,
addresses are 64-bit but unsigned long is 32-bit, so the upper bits of
the PFN are lost.
A reserved region that ends at the top of the address space then gets
the anchor's PFN. reserve_iova() merges it into the anchor and lowers
the anchor's pfn_lo. At teardown, free_iova_mem() no longer recognises
the anchor and frees it to iova_cache, which corrupts the slab. PCI host
bridge windows above 16TiB and the reservation after the last PCI DMA
window hit the same problem.
Compute the PFNs in u64. Skip ranges that start above the PFN space and
clamp the end one PFN below the anchor. The allocator never hands out
those IOVAs, so nothing is lost. On 64-bit, PFNs never reach ~0UL, so
nothing changes there.

Fixes: fade1ec055dc ("iommu/dma: Avoid PCI host bridge windows")
Fixes: 7c1b058c8b5a ("iommu/dma: Handle IOMMU API reserved regions")
Fixes: aadad097cd46 ("iommu/dma: Reserve IOVA for PCIe inaccessible DMA address")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/sashiko-outbox-195658@kernel.org/
Cc: stable@vger.kernel.org
Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 drivers/iommu/dma-iommu.c | 32 ++++++++++++++++++++------------
 1 file changed, 20 insertions(+), 12 deletions(-)

diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index b66e83cfbc5f195a46d286d376068fcc13148611..2ee30df470730fd03b5dc46b46e3eaba2df130d6 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -505,21 +505,34 @@ static int iommu_dma_ranges_sort(void *priv, const struct list_head *a,
 	return res_a->res->start > res_b->res->start;
 }
 
+/*
+ * IOVA PFNs are unsigned long, and ~0UL is the rbtree anchor. On 32-bit
+ * with a 64-bit dma_addr_t, iova_pfn() would truncate the range. Compute
+ * the PFNs in u64 instead, skip a range that starts beyond the PFN space
+ * and clamp its end below the anchor. Such IOVAs cannot be allocated.
+ */
+static void iova_reserve_range(struct iova_domain *iovad, u64 start, u64 end)
+{
+	u64 lo = start >> iova_shift(iovad);
+	u64 hi = end >> iova_shift(iovad);
+
+	if (lo < ULONG_MAX)
+		reserve_iova(iovad, lo, min(hi, ULONG_MAX - 1));
+}
+
 static int iova_reserve_pci_windows(struct pci_dev *dev,
 		struct iova_domain *iovad)
 {
 	struct pci_host_bridge *bridge = pci_find_host_bridge(dev->bus);
 	struct resource_entry *window;
-	unsigned long lo, hi;
 	phys_addr_t start = 0, end;
 
 	resource_list_for_each_entry(window, &bridge->windows) {
 		if (resource_type(window->res) != IORESOURCE_MEM)
 			continue;
 
-		lo = iova_pfn(iovad, window->res->start - window->offset);
-		hi = iova_pfn(iovad, window->res->end - window->offset);
-		reserve_iova(iovad, lo, hi);
+		iova_reserve_range(iovad, window->res->start - window->offset,
+				   window->res->end - window->offset);
 	}
 
 	/* Get reserved DMA windows from host bridge */
@@ -528,9 +541,7 @@ static int iova_reserve_pci_windows(struct pci_dev *dev,
 		end = window->res->start - window->offset;
 resv_iova:
 		if (end > start) {
-			lo = iova_pfn(iovad, start);
-			hi = iova_pfn(iovad, end);
-			reserve_iova(iovad, lo, hi);
+			iova_reserve_range(iovad, start, end);
 		} else if (end < start) {
 			/* DMA ranges should be non-overlapping */
 			dev_err(&dev->dev,
@@ -568,15 +579,12 @@ static int iova_reserve_iommu_regions(struct device *dev,
 
 	iommu_get_resv_regions(dev, &resv_regions);
 	list_for_each_entry(region, &resv_regions, list) {
-		unsigned long lo, hi;
-
 		/* We ARE the software that manages these! */
 		if (region->type == IOMMU_RESV_SW_MSI)
 			continue;
 
-		lo = iova_pfn(iovad, region->start);
-		hi = iova_pfn(iovad, region->start + region->length - 1);
-		reserve_iova(iovad, lo, hi);
+		iova_reserve_range(iovad, region->start,
+				   region->start + region->length - 1);
 
 		if (region->type == IOMMU_RESV_MSI)
 			ret = cookie_init_hw_msi_region(cookie, region->start,

-- 
2.34.1

