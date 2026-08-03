Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B50937DEB5
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Aug 2026 10:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785753121; cv=none; b=f58rNuZw7LEJdYGUiOLoBByjHbDoRDNXxvn0shRT7AFLri/fpBO9ep+5FoDAqFfTGZboM1BhFVqsMHIr/cZ0Z1v+oA+pQvCpQP/YZwicdO6LYXhlq4aiIghy6VSojKZDMX+L9IZStOyGbX/k+aIsDKn1R1dquSXKiueKs1Yyseg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785753121; c=relaxed/simple;
	bh=BGCmXbHhxIgOfT5cff3VPGGTbFd1u5HedyxcoL2ElDM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=RnWy715uAxS4MUN8ZiHBj2kwN1jA+WOfV5IfVLD4iToedDCWxevgjcBk9akDLMjFXrStvfnyqclTeRTq2foI+sKyeMdb+08nM810FOm8awxsGaaQQqn1WKMJYTnHNlGHf8okY+gPPRAXvIAgKz5SYYYNtknl8v2bmusJDS4pu+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nTuA/tUk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H+1BqC04; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nTuA/tUk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H+1BqC04"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 673ALvFB3654820
	for <linux-arm-msm@vger.kernel.org>; Mon, 3 Aug 2026 10:31:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=zgHwwbNKVvtriJyQ8oychC
	OjzeAxXuw2oCV9B5T/Egc=; b=nTuA/tUkTv/kamyHndVR7iTTpjWBZxWkLVHFoZ
	+KxsEtDXGd1jMDB61ZqbkuBHl63GSMp7M+SHbgFC2f0kDYfjuzi4nkxDW5Ji3AQC
	Ew2qsZU914v1UgvGPBllhC+Q+Xrh7WdcME8CIqGGjDw3vm/tSlGUdqk3Ufr3O1Ku
	N5Dwq4+QLP/5LRPCTATe2OxUwAnZadmXoWQn2f7lGKBdIh3lS714pChEZA0U6VIz
	zK0B7hMljT3GYWQSYFd43T1VlACI02QzhZ9tHWzLwhmXlTfKHkrrXBpClqmUdPaU
	7BJ173iqDEvjMCDHu1g6jd1xQYVxPLTdSxyAj2BnOHeN8fAA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftnhb14be-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 03 Aug 2026 10:31:53 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-381250979d5so3128014a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Aug 2026 03:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785753113; x=1786357913; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zgHwwbNKVvtriJyQ8oychCOjzeAxXuw2oCV9B5T/Egc=;
        b=H+1BqC04MRAN/YMWwrafMztz2CWtFjlpy4iBM1Y0FixadJkbOqIjruhVIeWmUyPwZe
         J679FUP2YVRKXc/y4mDtRy7rgBFf7Kw6AqQVRnvkIjmqV+SLeRq2k/nJbz6Y12rJTO5F
         a3baE41KNOQ/K8obj8zioaRb7JklqN0RWO9OfanjLPlqVtksu1/yWeOCv/PgEr2NQ8iQ
         fNKOs5E+ttfKNzmmhYyNDvFEihuQCFb4CzyoLOQRefYrrk5MRoFNwtQ1RSswvwHHOTgn
         PJCnW09isLhedKSsoAQqTVKquoYuORKm6/K/2S7nMoFBKkn8fP64h3jF++qb5lLVPGDc
         oDsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785753113; x=1786357913;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zgHwwbNKVvtriJyQ8oychCOjzeAxXuw2oCV9B5T/Egc=;
        b=mFe5bFpoHN4O9T6AJlokHduZcTOL+U5NHQVrOaDJBRUaSvjyJG2QISWl60VUMC9Ioj
         ROPy/KKAPqhJBKqhMnrkb6S8LhIRZhhu9ioe1niYQf3NH9Op26p5mHAgGoOIXGhJG8Iw
         WAUduOXdbZ4ldxvFm+icDQMePxvi1J1sW69hzkHyJ8+jltEha5lWBSStrGbCQlPO/vR4
         jhyruTxX+rYfAKWl1GagWNperT4rKlN3jki6JjK+beZnj8c0Nz3xkBUn7H8Jkg1G5ygl
         eVCi994xKYUOc3dCJU6c41rseE225sXLZUwWmYwoSk2F/Ng1pMS9c1BVGuTw/9P7IUl/
         6ThA==
X-Forwarded-Encrypted: i=1; AHgh+RrtJXg1wCAJhJ81DyGKz/9pZ9YtrlrDdO+mLdHSmj9pWwie4EY4tk8rptmBI9yB8Iv4ThXdzUNWaxDF6taZ@vger.kernel.org
X-Gm-Message-State: AOJu0YwV3sufLLBMy2wPEBAnxfj/rGSOmWigrdwYqqDQaJnLxy+OQnw7
	5ymwnPbTKRrSWxdyqiRbMdsRExw7tywKpZHx+cy1qzLOxU98HbRqiY76yQV1ZW4/SmVgpHHNNkp
	LlEG49VKRUEpf1yfx7gkD/DpD2JvY3cXkl2er9sVOq13vxbV3eNvcKBzrPc5Op7M+c3yS
X-Gm-Gg: AR+sD11VnlXrW1bD/tiUybb28uBAjyk83EDpmj9RrGFOgCVhEDob5rUAZ7fuyle6t2b
	IiIxelWkDxzxjDv5eiVgBuoNd+tCZ/y0mzuzJumj4WCZ9RKU+cmPsXLq/lVFIgY+EPEfRXNWB5W
	qx2P+YgX2igO57yInBCDR5A8bKIzOCXgjitF5TbVseIOSsOaoB4w7XL9YAzv433TijcaAQIvTe6
	/N28DpEUhbphoWBvmEDrJ7nxlb2ffZtRciO2kQPYZmdHEsx6z7AUsEL5Cl2d7D4HUwoawZkKtOw
	G2RU6Mg3CNYOEJn41dZAkIZIxVLdBO7cnvDpDFtR17C2saHuy9zeAumU8uh3bN4aLppVg8zVr2K
	NkzApLtLGqpGihs9MfM3VElB27g==
X-Received: by 2002:a17:90a:e7c4:b0:38e:9279:468c with SMTP id 98e67ed59e1d1-38fbc4d976dmr9020472a91.25.1785753112671;
        Mon, 03 Aug 2026 03:31:52 -0700 (PDT)
X-Received: by 2002:a17:90a:e7c4:b0:38e:9279:468c with SMTP id 98e67ed59e1d1-38fbc4d976dmr9020430a91.25.1785753112056;
        Mon, 03 Aug 2026 03:31:52 -0700 (PDT)
Received: from hu-sumk-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fb2b1244bsm3693427a91.0.2026.08.03.03.31.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 03:31:51 -0700 (PDT)
From: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
Subject: [PATCH v2 0/5] dmaengine: Add batched scatter-gather DMA support
Date: Mon, 03 Aug 2026 16:01:42 +0530
Message-Id: <20260803-dma_multi_sg-v2-0-c12bb05e42d6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA5ucGoC/22NQQ6CMBBFr2K6tqQzFYquvIchpJQCTSjVFoiGc
 HcLroxuJnk/eW8WErQ3OpDLYSFezyYYN0TA44GoTg6tpqaOTJBhxoDltLaytFM/mjK0VCGILGV
 ccIUkKnevG/Pcc7cicmfC6Pxrr8+wrZ8QMv4dmoEyCies4hOtBTRXF0LymGSvnLVJPFt+dzn8c
 /NGVhWrQYr0/OsW67q+Aeq+ncDrAAAA
X-Change-ID: 20260108-dma_multi_sg-c217650373c2
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        Sumit Kumar <sumit.kumar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785753106; l=3409;
 i=sumit.kumar@oss.qualcomm.com; s=20250409; h=from:subject:message-id;
 bh=BGCmXbHhxIgOfT5cff3VPGGTbFd1u5HedyxcoL2ElDM=;
 b=3ePDXcG5W+TskRXsGjtBwRB+Q/3qztjHur37oK0opgOyU90+NOpk8t6FzjwxRCSn0ogr2u4Fb
 V7lOTbCJrx4A13InzkcAnsKJbnysxPWhWqpGWIrXoTb9iXUORuesWIL
X-Developer-Key: i=sumit.kumar@oss.qualcomm.com; a=ed25519;
 pk=3cys6srXqLACgA68n7n7KjDeM9JiMK1w6VxzMxr0dnM=
X-Proofpoint-ORIG-GUID: inttAH4Q2T8IeluwFc3PcbRfT6W8RcZU
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDA5NCBTYWx0ZWRfXxp8SlkhRvNUv
 WqZoxlIaVs2+s52544DeMNQH0jOT6cuxcuJhUykFpYwYbggJME6USK2cYsQsbVgJ4xHt5njDDDG
 JP/BW6t3Ud0mHCqjL198hV9E4npE4yk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDA5NCBTYWx0ZWRfX1OUBaVsBv+Jj
 E87L3wIJhAJi+ohljlW0/fysMQmzFPKK8CE0ax1tKyDRTz0xrEcV39gQ+EXOPv3tNXaHG12aQ+Q
 8FotOwJqwFbXP9VVb5paA0QUwzxjyzK+hnk7XXefHNsPFCEtS8Y56AS1OOf4X6Z6ei10BFNDfV4
 oTztpf6xANyb3zjT93k3VPD9l+jxExI5eYty11eYCUhT6AKuOYdVQXb1DbgxnunYt1rR/PFeVRs
 tEMwQHbMr241HokEHelJ3ZsHq6jehU1fI6ktw9wcYXdgSE9BMU+xO2idcf10VTPujXN21Hso5XA
 Gbs3IIw50/9xX9Nw8pryicu3gpTtLPb5AmdjeMbzLVWUoEaot/4Bm+q+RZ6Vp+LZj3ahCYwq/7B
 7gvim2Qde4uqfCjrajWQGndtpHqRn5f+QdhLxJahqFkn1UW3XmuF3t+bNPGA2X3McE62n8yry6w
 Kkp6BXfy/vK4bFo7TOQ==
X-Proofpoint-GUID: inttAH4Q2T8IeluwFc3PcbRfT6W8RcZU
X-Authority-Analysis: v=2.4 cv=bKEm5v+Z c=1 sm=1 tr=0 ts=6a706e19 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=mBxW1p0v9Tj6UMWjSKQA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0 adultscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030094

Synopsys DesignWare eDMA IP supports a linked-list (LL) mode where
each LL item carries independent source and destination addresses.
This allows multiple independent memory transfers to be described in
a single linked list and submitted to the hardware as one DMA
transaction, without any CPU intervention between items. The IP
processes LL items strictly in order, guaranteeing that
scatter-gather entries are never reordered.

The `DMA_SG` transaction type and `device_prep_dma_sg()` API were
previously removed from the dmaengine core in commit c678fa66341c
("dmaengine: remove DMA_SG as it is dead code in kernel") because
there were no in-tree users at the time.

This series reintroduces `DMA_SG` and `device_prep_dma_sg()`.

The reintroduced API takes separate source and destination
scatter-gather lists, where entry `i` of the source list is
transferred to entry `i` of the destination list. This enables the
eDMA hardware to process all pairs as a single transaction without
CPU intervention between transfers.

The primary use case is MHI endpoint ring caching. When an MHI ring
wraps around, data spans two non-contiguous memory regions (tail and
head portions). Previously this required two separate DMA
transactions with two interrupts. With this series, both regions are
submitted as a single batched transaction, reducing submission
overhead and interrupt count.

The series includes:
1. Core DMA engine API and DW eDMA driver implementation
2. PCI EPF MHI driver support for batched transfers
3. MHI endpoint ring caching optimization using batched reads

Expected benefits:
- Reduced DMA submission overhead for multiple transfers
- Better hardware utilization through batched operations
- Lower latency for ring wraparound scenarios

Signed-off-by: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
---
Changes in v2:
- Reintroduce `DMA_SG` and `device_prep_dma_sg()` instead of a new
  API. (Vinod)
- Use two parallel scatterlist arrays (src_sg/dst_sg) instead of
  extending struct scatterlist with a second DMA address. (Robin
  Murphy)
- Add explicit eDMA LL hardware description and ordering guarantee to
  cover letter. (Mani)
- Link to v1: https://lore.kernel.org/r/20260313-dma_multi_sg-v1-0-8fabb0d1a759@oss.qualcomm.com

---
Sumit Kumar (5):
      dmaengine: Add DMA_SG support for multi-buffer scatter-gather transfers
      dmaengine: dw-edma: Add DMA_SG support
      PCI: epf-mhi: Use a define for the DMA transfer timeout
      PCI: epf-mhi: Add batched DMA read support
      bus: mhi: ep: Use batched read for ring caching

 Documentation/driver-api/dmaengine/provider.rst |  21 +++
 drivers/bus/mhi/ep/main.c                       |   3 +-
 drivers/bus/mhi/ep/ring.c                       |  36 +++---
 drivers/dma/dmaengine.c                         |   1 +
 drivers/dma/dw-edma/dw-edma-core.c              |  87 ++++++++++++-
 drivers/dma/dw-edma/dw-edma-core.h              |  10 +-
 drivers/pci/endpoint/functions/pci-epf-mhi.c    | 165 +++++++++++++++++++++++-
 include/linux/dmaengine.h                       |  35 +++++
 include/linux/mhi_ep.h                          |   7 +
 9 files changed, 339 insertions(+), 26 deletions(-)
---
base-commit: b4515cf4156356e8f4fe6e0fdc17f59adab9772f
change-id: 20260108-dma_multi_sg-c217650373c2

Best regards,
-- 
Sumit Kumar <sumit.kumar@oss.qualcomm.com>

