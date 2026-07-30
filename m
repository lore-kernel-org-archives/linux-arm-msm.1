Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CD90437866
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 13:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785418184; cv=none; b=YvEdCY7fCZMueOQ28fTVFBqTb+y3cwFo7OUJWiEwZ8h4IZu3/WhSZtmOY4KWWGsohDxSkwl2vWMTuUh5MPt/rSAJoCH2wIRSua6blLuL3UkQgyd2UfFOzhOajamCAk3TksAUBxJzGiS0h/ZG57+XPm9fxdT+7eksODqWH96ncIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785418184; c=relaxed/simple;
	bh=zQmiJpPoZNGhjY+XUsKBhhVoMysorcpbs/s+cw3ZEFM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ikSChBg2mpUXyHpwZ7ff1ct2ohNZvcb47gmSUM/Cgs0qUfTqRZL2nGGRxYzQJhrZR6jO9HZRyBzgdnxZVktBXPoMfI3GgRL0QtPPxZLeyTK5uv+eDeVzwUxt534U/GMEynsSf78fVGTeMxuzqsWT4iX9w8ahQpDOViwNFBXVg0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OGPuxWrR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kPgUw6oT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OGPuxWrR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kPgUw6oT"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UDDKBU2094137
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 13:29:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oKomwFAwUezzDTIBZ3q145K36werjmHbPF4H/yZ/x6Q=; b=OGPuxWrRMmU2PzD/
	mKwmrbMpkX6jKvRyejXSJfhrzmADzBmBvV5C2lfN93sWUAVbNLw5HonQDm8+kVU8
	IdCnxNP9mvNbUxwyUyStUqoBIY48bISG2zPPa4AN5h7YZmmeRvrlq8r8TDTF8Ru7
	Zmwb0opGC0dJ+N0lcbJPgOsuqfR5vE2TzyKeknewcTjfYj6YyYs6+X03D0qCtP7l
	TaQ21vRB2MLrY/5iRQE3dDMGDxcEMwP28PkkdI6ezrUkYmZo2K5IMGRfRz4dSSR2
	BIp9ni7Xg37VIyT+0IROuSJKa78ynVAKJo0PscQHHPWudnb7JKWGrp5xzc7VuRRK
	nhVbqw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr6ky893w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 13:29:40 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-526da7e3c9dso21706041cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 06:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785418180; x=1786022980; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oKomwFAwUezzDTIBZ3q145K36werjmHbPF4H/yZ/x6Q=;
        b=kPgUw6oTr6eTsGZhcCeJtVB5uLzN0ajq2Ec1LJ6FZqPBmpW8b/gFE5BasCKZyNbbzF
         2Yto40jFcSNypx9lLqZG95beBRMvgS5cQb7XGmwy3zIIhYw7FHncgamQnyo/4JjFUhjk
         PipIsaYHBDVzEjlQzM8gjckhuY+A2qDUPjSbUti5FwFXF8c5bOoGydORAXeEko42chDR
         9m5Ndy73eujCjAYgrpizWW63zhH03Tqq+hRVI8Qjc6cN+n3gXRP6j389XZ6HuLWHoILX
         XzrD6VVETo1GNNjveJnZlyUIsaAVBZUy48Qrvopan9fcW8LcxUWPzmK+NhEMkExMH+y3
         rwcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785418180; x=1786022980;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oKomwFAwUezzDTIBZ3q145K36werjmHbPF4H/yZ/x6Q=;
        b=eFIXHMjdpoeR0UMbX5SgvAKGVC74uDeF4uoVSYQ2yy4UxpVqkM1gMJFQLvEp06wKhs
         TQDlXgxltbXRc2Q6ynym52JHj4DseS/2mYexDgKXoL/IX6nUreCOhs5e/4gDXYEchO7q
         knPozkSbhBrSXAbJcYLpisl22x4Xlbpqg/1dnFARvpFnr2phb6iglh3j04hF7I9P3xYa
         WlzGd16bHaOARn6BDCuwvq4iRZ1na8ZRip7FHqmsyEbX9MMPfh4TotT/0bXw9Zo9yu17
         dLBRimXmwD9UwD9O1Sd1WctS4UqHv4u7sa9sdynq7k7/sMMwh5uvKBUNyG0VSXQb/OxO
         RYOA==
X-Gm-Message-State: AOJu0YyvgbhBanciwvVyjtjTkj6n8zRoACRMowTUqjpehjRIl8EVW/Iy
	Ln8/OZDqFah7YLl0GYLbhMZ1Ikz818w5Zj9OEnKhU6YBJs9GbVmRNhhxwkaCE6Afr7fWHzoheUe
	LBbHm4YsPoKtpvi9vRk4Fbuypyty9I4trnufS1iomdOTy4NTO36+ajdsX5XMavVZu+stU4BJ/jS
	w7rIc=
X-Gm-Gg: AR+sD12FgQEPLIcdrnrAUyCymxpdbBQohRCzsiMwO3+OkDxCGAxKOdlbU1LJEd51LtA
	B4hAogIeCifHwzoUc0V74hvUeAJxDXz2kVWpwC67SWSKuHB25N1CmdAhvYk7Y1G5EzN4UwpgorI
	ariJUDmowC/L7ZJbnsRzWQLQN3tU5ZvTwFoN6EBDLPWHyD5ZMbiLv4PkkZaXrOo02ZNGyYCYYvD
	BmFdzSuHuU6fA+ohW8w1yIfYoAXXEUiroZ0Xn7nSLsWEkZLPnrFtAvSPFWvxPbG0pBuPW18G5SL
	sVIA9fpF+LJ77Ge3FY7mZGlmyAR6KmJ1OwBrRqP7+mb29IPGtwWyIrVSbKW2GW4u27o5p/kWdpA
	gV1wpvAQI3q+FVo4JtXxio3+a7ZATF1Ri16JXWNSr+MlEjWpv/2vSDVM4TfCeknw8xVCdxLqfyj
	vMwZWm3bR1SaLjAg==
X-Received: by 2002:ac8:5801:0:b0:51c:7b12:5fff with SMTP id d75a77b69052e-52b386ddf71mr27986711cf.75.1785418179759;
        Thu, 30 Jul 2026 06:29:39 -0700 (PDT)
X-Received: by 2002:ac8:5801:0:b0:51c:7b12:5fff with SMTP id d75a77b69052e-52b386ddf71mr27985881cf.75.1785418178960;
        Thu, 30 Jul 2026 06:29:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39f6acaa009sm2976631fa.34.2026.07.30.06.29.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 06:29:37 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 16:29:32 +0300
Subject: [PATCH 2/3] ARM: dma-mapping: reset DMA ops before detaching from
 the IOMMU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-fix-qcom-smmu-v1-2-b12fa067804e@oss.qualcomm.com>
References: <20260730-fix-qcom-smmu-v1-0-b12fa067804e@oss.qualcomm.com>
In-Reply-To: <20260730-fix-qcom-smmu-v1-0-b12fa067804e@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Sricharan Ramabadhran <quic_srichara@quicinc.com>,
        Joerg Roedel <jroedel@suse.de>, Russell King <linux@armlinux.org.uk>,
        Lu Baolu <baolu.lu@linux.intel.com>,
        Jerry Snitselaar <jsnitsel@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Heiko Stuebner <heiko@sntech.de>
Cc: linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-rockchip@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2474;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=zQmiJpPoZNGhjY+XUsKBhhVoMysorcpbs/s+cw3ZEFM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqa1G8zRjknHYqUBI8o2MzKUGuZ4oF+rXCx4jn2
 zhq+XjJrpuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCamtRvAAKCRCLPIo+Aiko
 1fYcB/wO3cMw7FHxc1VUZwOfY2Tooa/OXl2aPOMopt0xCYxUwpZ5yVYjRHgrQrzKG+mUO93tFGw
 H7pbYScFoKJ2AzsMoN+uN+v8t9Mh3yY1Ud49mcH5NE2zMD9zQK5bM/IksKMNuLWYdtNdkG42CTs
 9j/x4WTPKOrGL7zpcDM76Vfl8slVplqaRrhvGpQmLi8AL9I7jsQWL3Ryyn3uTFjVCXITZAkaSUi
 wdo2aKOX5IdqnZGhap8RWpPU8rPCMTFsvAtExWsnqhoMBkUAwDyw52qu50f9mo0kDdv0RWMzrto
 KRpI9flM9iK+ZUsRzNJxJiOFKou5u7H5EKzCnbAAVDlwcIEf
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDEwMiBTYWx0ZWRfX9tRBH0vCcZLN
 RtSc0J/A+cgPcBL167n5fGV4kuLcGA++VHe8YwweMKbxdRM3vr/teFro1e4qP3TBNVvV49BL5Mh
 n3DA31JSkKN7t92x+qc0B+gKBLdEPDtLiyvKesFWtaWAxu2RYK44lMXrS7YBy4hIzZLyd9+5Mpd
 w/AHybKhj6ZPUT87fPVVk8KhmfiXWUwOWrlEVVvT2ua6utbfaLnFd54B95rYnnLr3vIAJhe69HP
 n6pamD18nuX3Bt4MIr4zkcNBY6iyfCDzC8olNi8JLmpZ3OzBE8qL6ipiE87pSBvQ3f1xri1Mgya
 MV8YtK2yaez5o6CFwil/LbasF3flGeCCMU6u3EzCd5rVlNioGDNJ6LtDtk2v0VphacwwTKmS5Ro
 958CVNXO3plvPdZ8Es4F6PE2/8YE4Cesz2SyMCPxUfoylpX6KEG06O9SvUb7V3IV73q3Z8Rkwfe
 2HFfghQpUf4clutqHtQ==
X-Proofpoint-GUID: xf3E3UpmfFczLT8DWEVleWpLQAoJEwlv
X-Authority-Analysis: v=2.4 cv=ctOrVV4i c=1 sm=1 tr=0 ts=6a6b51c4 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=Js9RLbieTBECFtt6-0oA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: xf3E3UpmfFczLT8DWEVleWpLQAoJEwlv
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDEwMiBTYWx0ZWRfX49gQcH1YpluD
 UxmdV5qvhSfxtPpHvOPLRwjDikgyVix+9kLD82bZNjikdqyCM5z83U6jAi7LCkQ9trRw9z8TBsQ
 krgzxC7JffsbFPg1AZyC0thzqL/EPX4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_04,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 bulkscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300102

arm_iommu_attach_device() installs the IOMMU-aware dma_map_ops only
after iommu_attach_device() has run, so a driver that builds its page
tables during attach (msm_iommu via io-pgtable) maps them while the
device still has the direct DMA ops: the resulting dma_handle equals the
physical address.

arm_iommu_detach_device() does the reverse in the wrong order. It calls
iommu_detach_device() first and clears the DMA ops afterwards. When
detaching frees those page tables (msm_iommu_identity_attach() ->
free_io_pgtable_ops()), the freeing dma_unmap now goes through the still
installed IOMMU ops, which treat the stored physical address as an IOVA.
iommu_unmap() warns "region not mapped" and __free_iova() indexes an
unallocated bitmap extension, dereferencing NULL:

  __bitmap_clear from arm_iommu_unmap_phys
  arm_iommu_unmap_phys from dma_unmap_phys
  dma_unmap_phys from __arm_v7s_free_table
  __arm_v7s_free_table from arm_v7s_free_pgtable
  arm_v7s_free_pgtable from msm_iommu_identity_attach
  msm_iommu_identity_attach from __iommu_attach_device
  __iommu_attach_device from iommu_detach_device
  iommu_detach_device from arm_iommu_detach_device
  arm_iommu_detach_device from arch_teardown_dma_ops
  arch_teardown_dma_ops from device_unbind_cleanup

This is reached on apq8064 (ifc6410) when the adreno GPU probe fails and
its DMA ops are torn down.

Reset the DMA ops before iommu_detach_device() so page-table teardown
runs with the same direct ops that mapped them at attach time.

Fixes: 78fc30b4bb35 ("iommu/msm: Implement an IDENTITY domain")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Assisted-by: Claude:claude-opus-5
---
 arch/arm/mm/dma-mapping.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mm/dma-mapping.c b/arch/arm/mm/dma-mapping.c
index f9bc53b60f99..a467e0d01a5b 100644
--- a/arch/arm/mm/dma-mapping.c
+++ b/arch/arm/mm/dma-mapping.c
@@ -1642,10 +1642,13 @@ void arm_iommu_detach_device(struct device *dev)
 		return;
 	}
 
+	/* Reset DMA ops before detach so page-table teardown uses the same
+	 * direct ops that mapped them at attach time.
+	 */
+	set_dma_ops(dev, NULL);
 	iommu_detach_device(mapping->domain, dev);
 	kref_put(&mapping->kref, release_iommu_mapping);
 	to_dma_iommu_mapping(dev) = NULL;
-	set_dma_ops(dev, NULL);
 
 	pr_debug("Detached IOMMU controller from %s device.\n", dev_name(dev));
 }

-- 
2.47.3

