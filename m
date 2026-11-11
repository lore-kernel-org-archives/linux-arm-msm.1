Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794402186;
	b=QsaiWW7AWhRuZRy7frA++XQkCp2OP7yHaKkC38Lpnr9rlySRsmljmxIAGGu2hAmjkWKd
	 IS/AOmOAvWwMMZusUQ0unZIf2RgkUSV7D4doe5sCRzOtr6rfJ9/ra90J1NVpRKExkTflx
	 4L04XXFAddVaClb86dXAZn8Y7R3fqiguPq9/ynL+yMlhJ8VZmsP2AHWS8wuS4l70X4wpe
	 qrMC+WQ6G1jDeIwIuXxjF7IhqFrdsPRYp9t5heeE+6YW6RedPSV0sCUT0nlLgniUsdcdF
	 OAwYLXzrpDxtiBsgcbSRxILEmTGPTPX7hUmt2CAyxIo0ehIwjvyKz1PX+VZu/Ts5JMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794402186;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=L8WR9+GG2EfUF3UrFaA4c5ksUoCcRyLK8GiwEhxkvFI=;
	b=IfrKlSI6Wibvr2oByhBoqAznGJ4Ys5vDnHx5NcjslaJGosW31lPQIlMe4vw2xngl3C5F
	 nYvQ1ZWl0z+vItT0GxX5f4SMrhpCuMHIoeccd4eqU5rON2L6dwyuBr08qPuCv594qiZj3
	 EapvKeRnYv4lccN8acVannxXTA2pvhzizuPOTdN/BWZs7VtzwA/XvsvlUp5iW5a6qRGuZ
	 SKvM+P/cYhB57XCmqiTH9FCkkcQ43DfWWIbv9ixCRvCNDTy8gHtOObOIeupPjRnDSfcC5
	 AiYmFpPIAr04GT5R7Wl1p2Z1tZ1YPOLFhfq8hZynSGZdrTjZ3xyejY5n/2K0Xb4wMYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PH9mWwXg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZjzR67P8;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9A78606A327
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 13:03:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9A78606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PH9mWwXg;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZjzR67P8
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABCYwBw1359124
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 13:03:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=L8WR9+GG2EfUF3UrFaA4c5ks
	UoCcRyLK8GiwEhxkvFI=; b=PH9mWwXgQ5gEnifkFQhZ3anQH+M6DXWxjaYRNBm4
	8z/pNaY5400bAsBEpQNm+vBW+Q+jfqxxN8HzrTI5OzBHGZzkIlvScO/QKa7SGl2a
	PcypMhUu/gBKUX5uX9oh04q9yOC77RcAXm6BOFLzWoUXUVzVzcsM5EsBVKTYRsaf
	ij+ZkoP+ccbshZD5IvbBTtE8sEoCZpbwWmu4e2y+FeoOw8o2qNPB3O+GvjrxE3+p
	AL5/WPO/FeuqH2XP24+LiL3cpFAdsvCWMFBzD9x9fNyI2UQVztZgs07w1ZKgjDrL
	0O5WFB1GTvFsJB+TEYBpy6tRV1lwTog6SnR/2XN3l1argg==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvk7psbgc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 13:03:04 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-998c9679e95so2142737241.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 05:03:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794402184; x=1795006984; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=L8WR9+GG2EfUF3UrFaA4c5ksUoCcRyLK8GiwEhxkvFI=;
        b=ZjzR67P8wqGqtdDTOZihJridX5Q+5MAT9lUERZhujk3OFRjnm/V3mV6hyZLHbMF+FB
         +byN0EVBtuZuuy7pVYmilcT+CwaRmYKUJUn1DS22CGwS191pyWZ2YqgC0M32PjG0nK7r
         fdUJ0Z32Nk3ThjHjex4z18y95JXPOjKkHBew2NeXNP42a6nE9fwxzlMoOUFCPeMLElUM
         u44kv3rU/ciITpwAdoXoXmblb0bND3+tK1Q4gU+gaSRSlNag+u0LRXnKMR+hpPZQyPwk
         wTgsrQqOEWHdoXmaZhouO421u7IYZzMWsXy53ZGchDt7r/u5x/cejS8bsSnALtMQugnt
         0rMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794402184; x=1795006984;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L8WR9+GG2EfUF3UrFaA4c5ksUoCcRyLK8GiwEhxkvFI=;
        b=MHwEVxX25cs5gE6yuxDV/ki1IsUBzBpKs3VBBWiu9qZLyUABYo6UxfEaRXJMqgRNuo
         DiemzdH+L6h8UVeStDlPI/25BuSITshTLCyWqXExDIuKG473CioBsGk435J6yP0aaobr
         1iOzIWJLfE+ki4hWclVDNPi3E56JesicwDXebwGyNL595M1hyNkex/JrR8Z9b7qedHzj
         LQZrsE2kFQtcb7AKwHdwjZgiRju0/Hoy+uL99pWnAGbJ8fLwRw9hNifT2aqBCp51bWAt
         Kj3FYqZfvxoOOHoq+w7c2R1C4QUrh/r9oqbN3ESw6SWlOU304l5LsAx/rMwJ1dJFwaAE
         dRWg==
X-Forwarded-Encrypted: i=1; AL+hErGUv+OITYN+4EJaF2XlOsd2vd3Fx2oGdWkLDBADAPAWAwBw2VYW1/8ObvPFxSnw7TXXGlI4zNYoedTRjiZ8@vger.kernel.org
X-Gm-Message-State: APuU4Z+KJBOzdrVCAYhAU7Qhi3YDYTzM1VfFApMsmXlEDho9Kcfx2ioU
	z+LQq3sKbqMeHGIzWqqj2ld/+curLFs6oWi9axT0Kdzo29o0OGD1jbGxnxDGLBru4K8ZwJXN+AA
	FT2N5MhWP8AS9fV0VFCKjpjU00wAw9Hpj9VZXbmJFYe8ml6YFTpU2YzUb6dwd4hzi5Gtq
X-Gm-Gg: AYBFou3+Na1ORrC9fsZTS/lvE/NKEDVfin5OYJno4kn78rgp9I/RA2ytnY1AXhbp21h
	Ie2Phvu3RJD+hLTkbWA6XZaMK0UM07NPQW8KNd1Ses+u9m0CFCPb/DLpMqLej+prqC69bp7tdyP
	NjATl1JpM+fpAhx2qfhoO11AgfG3r1KbiBhP+baxx1nAfP6T6awdGJI8jnFRXc3fZ4WD7a8iX3Y
	Til2qkohYXHcioxhqJZmMA+sJPvGtt96Mr50q8HkQHVUqM6kVKH8ATGvzYGTCeAAYq9/8ZJXJ1g
	MyUh7lY1y2OGRTjtk7wIe7kla3E3NrSjG15iPUzMUfJVsVE0Dr9nTsSK+Gz267hrp9B1lpY3+f7
	XovDOHZTIVLrmLkfpYigxfmpjnuijkBP2g7oOYI/AP/AFbsPBsTEjbfdujBd/nH0Pk6AKDDcIK2
	ru4IwEGaofsGOljSNH726C4QtWoOfm8EGUBSYH/6YYl56Ltp42ajdiJFcbaYC0yg==
X-Received: by 2002:a05:6122:1782:b0:5c9:a7af:8178 with SMTP id 71dfb90a1353d-5ee1c2b2435mr795024e0c.2.1794402183554;
        Wed, 11 Nov 2026 05:03:03 -0800 (PST)
X-Received: by 2002:a05:6122:1782:b0:5c9:a7af:8178 with SMTP id 71dfb90a1353d-5ee1c2b2435mr795003e0c.2.1794402183114;
        Wed, 11 Nov 2026 05:03:03 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c157bafba6sm959941e87.62.2026.11.11.05.03.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 05:03:02 -0800 (PST)
Date: Wed, 11 Nov 2026 15:03:00 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: "Joerg Roedel (AMD)" <joro@8bytes.org>,
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
        Alex Williamson <alex@shazbot.org>, iommu@lists.linux.dev,
        linux-kernel@vger.kernel.org, virtualization@lists.linux.dev,
        devicetree@vger.kernel.org, kvm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        Sashiko <sashiko-bot@kernel.org>, stable@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [PATCH v7 1/5] iommu/dma: Keep reserved regions below the IOVA
 rbtree anchor
Message-ID: <5pyhbuzlrk2pf3sct7zopoycvgliuvzzmd5qse65p3r63jarvo@g3clac2ao4xq>
References: <20261106-add_iommu_ranges-v7-0-5c0f72083e52@oss.qualcomm.com>
 <20261106-add_iommu_ranges-v7-1-5c0f72083e52@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261106-add_iommu_ranges-v7-1-5c0f72083e52@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA1MSBTYWx0ZWRfX1Qqt9jOQcK7P
 X32e/XzCUszYS6AHY4ZP2rFGCiUzFlR+VIDmmFsoAjC7ayOLD/t5oY9oO3bgFwr62Iu2INE/Sqk
 m3ai77AVL2elp6YULdvSgO7QaORXUe8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA1MSBTYWx0ZWRfX+joQ0n/s7NEk
 t+liW8q54WxndRnkTB5ZKZ3NaGmX4LX1Qi1+fGKAos8ONkJrSGPIBv5tvFHM8oI82b5ba5/BePi
 DnJGEEhISBpw0GcmuGFrowwkzf7rkhY9Ost8nf7Ev7PkZZNyT/V+pBW0b3JWSUJcBZ6GNzWiyBi
 OcliZL/Y88i8F+xT676/ZtrQzJuWwTA3lETJ059QAXt1O727TDwW1dWrbld6KfQdwrKKxwQRoEO
 ZzJzHkLN6kgOHuDTqMXIP4rpu3p/1olEgBmVl1kMQMlLvmf7svZEOcpkgcdvfjlTHJhBmCMkHea
 0Vmq88qHfosAU6QaL5D0bff12xVWPPkkl7DTZs4EBqEEgIUH4ALvqUqhtSL82L2YPyq6bKghVcg
 YQcoDqXpSMblMb2PtLeaVUFfFY7hmH5wq6PZf1DXFThPldZDxz4fcqWpBFdaFvpKPSVFXJ614J8
 u8DuXSKMO1IVtHvqj7w==
X-Proofpoint-GUID: yehIHs8m1aP85wZFgiUfFgSD8Oeqx6N6
X-Proofpoint-ORIG-GUID: yehIHs8m1aP85wZFgiUfFgSD8Oeqx6N6
X-Authority-Analysis: v=2.4 cv=BpcIUoX5 c=1 sm=1 tr=0 ts=6af46788 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=WA2_6xBGtpbLEjlkeFEA:9 a=CjuIK1q_8ugA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110051

On Fri, Nov 06, 2026 at 10:44:24PM +0530, Vikash Garodia wrote:
> The IOVA allocator tracks address ranges by page frame number (PFN).
> The highest node in its rbtree is a fixed anchor at PFN ~0UL, which is
> embedded in the DMA cookie. dma-iommu converts reserved regions to PFNs
> with iova_pfn(), which returns unsigned long. On x86-32 with PAE,
> addresses are 64-bit but unsigned long is 32-bit, so the upper bits of
> the PFN are lost.
> A reserved region that ends at the top of the address space then gets
> the anchor's PFN. reserve_iova() merges it into the anchor and lowers
> the anchor's pfn_lo. At teardown, free_iova_mem() no longer recognises
> the anchor and frees it to iova_cache, which corrupts the slab. PCI host
> bridge windows above 16TiB and the reservation after the last PCI DMA
> window hit the same problem.
> Compute the PFNs in u64. Skip ranges that start above the PFN space and
> clamp the end one PFN below the anchor. The allocator never hands out
> those IOVAs, so nothing is lost. On 64-bit, PFNs never reach ~0UL, so
> nothing changes there.
> 
> Fixes: fade1ec055dc ("iommu/dma: Avoid PCI host bridge windows")
> Fixes: 7c1b058c8b5a ("iommu/dma: Handle IOMMU API reserved regions")
> Fixes: aadad097cd46 ("iommu/dma: Reserve IOVA for PCIe inaccessible DMA address")
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/all/sashiko-outbox-195658@kernel.org/
> Cc: stable@vger.kernel.org
> Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> ---
>  drivers/iommu/dma-iommu.c | 32 ++++++++++++++++++++------------
>  1 file changed, 20 insertions(+), 12 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
