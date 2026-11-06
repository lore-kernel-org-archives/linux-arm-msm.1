Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793985350;
	b=qEBUH44VbBhzIFgPKelKC9kj7XaTd9uW7IrV+8BjY7ykdR22rOJY2OBO9SQpKnxH8JA4
	 uhM1cJy6rTQ+B2fsaNdEeKz9AKT/waAPg06mWMJijjxcOtoTG5FhzUdw3JsInBaNNnH67
	 LKrmYdzmkT4vi+eVerFslaDkJm3M10vPHhH9eb61yE5Mt+pLjPdY19VxQyUBfvz70NWW7
	 778CKArY2Cll8HEftNvAyXjg9EjeupXmfqgzCvGy5qSiI9uRlm9CelzykmeJ9dZlu0Ppp
	 xSJh4t7weLri/51P/js1l+oJ/9bnVeb2KJZRcw+cVfn/ornieaOWdfMuNhj+nvu1bWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793985350;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=47JQnoGH/w4xWuL9FcqDdeP8e8K7V4oop5mGTZtNivY=;
	b=Adimb1/UPKcWVgCt87d6lIVSdpRgdzWNV6j6FvlSJbszlga0qQDbq8uX58FSLKesREZv
	 N4OVci66pbwMNPRKWKF7CFrTmdd1nAN7LUa2iHekJDdeV/LJA1RqA0K4B3npg9gHr0Tt6
	 XfUdJx1qFu7Jv2nAmBGTX61l/z1RaICVwscZbEZRCgjWQKUKY2PCIz51HeN6xDCa2AVV6
	 w2aXJ916Cv9w9SkeaCPSEPIIX94F0wP+4A5rYNEnQxigZIOIrkRJUyVkzvhbaWQcylFxS
	 AC16kGiZ+tbompGJzFJu5LFzqz/X/AxIwXah9LiHDD51cGAGICwjMHmpt8LTs4b3CXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lz5FhTah;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JIEC4sWN;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4590606A339
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Nov 2026 17:15:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4590606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lz5FhTah;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JIEC4sWN
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6HEEkV031458
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Nov 2026 17:15:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	47JQnoGH/w4xWuL9FcqDdeP8e8K7V4oop5mGTZtNivY=; b=lz5FhTah4B9BCc/s
	NQSQgeKsB7LOLEjFMeXdPGb4qtinRoVqnaqyN9T9p3Q7Hbf/IaresKX2B++yOuVc
	DpgjXJsUJCZMoBDC5iO5z0HtQBYG9ejZkF8Y3jDMLlq+YZ0gAixhbRvH9mWX5C2t
	72w2VYKvLs970D756X+8JzDCYl6SqPaEQRKH7yOL3XexGmHm+Dt9kFKH1dkdsbC3
	yVeWJsPtON2+9uQJO4Yrt6nXpIxVF50qVyYulkfEQoqtfiMO31bwwDXmAShFCPH8
	DvvYmylTIevfHotdELylpo3loI13hMsR4iRrnykzFVmotPcWwd4aoa0P+fQCyNdi
	KOldkg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsk48r074-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 17:15:48 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36fe0b57d91so833207eec.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 09:15:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793985348; x=1794590148; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=47JQnoGH/w4xWuL9FcqDdeP8e8K7V4oop5mGTZtNivY=;
        b=JIEC4sWNt1amtfOG+TVD+6OHvO1lE0gg4N+A6PphwSuwMJQFiQkfKx8b6kZm4jcjuk
         c9+cc4q9+nDVZuZ/qmIYwGGw7JB7aMt0lTjYIieU0y6DSp9H04BPbTX4w3i7tvjrSkdQ
         bmIPM6YPcT7oocXB7q0pRl8JoHXARmSCXxISnwMsxiBl9Smdbes/9+CHPEiJg36eNcn7
         VRV3JUi6bLCTHpyWrBl2KaauWATeCEaLy7CSL+bkH4ypFZsUTYWS4hBg+H6TdG+AZgjG
         isrY5iGd2SIdo/pJcTpABDc760TqqpdWmyKASr5Xi9vngXBKTPd7oniU8/9AnzZBtVfi
         Dm0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793985348; x=1794590148;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=47JQnoGH/w4xWuL9FcqDdeP8e8K7V4oop5mGTZtNivY=;
        b=K+g5SHDQLbdhSJs8rUzb6BNtzRI3/oTJhcQlFiscCl0rvINU/2y1PLECgMbhGooog0
         CCrRC5qZPD74/WQEQzw7GohA39MhaJ4hTjXIvpPJn0dnJtGDSQY3QWRAtcfOi8hk7NM0
         rKIeevOTmPD1NoHR0EhYoIiWoqP0MQmCbhIUsD4Rq/hOte33HAgAbXPcuVTEdtS4amkk
         UBjQRer1AiyeLiBBGAU5rqAM5WmqjTDLtkt0gHc3UtlciNeMziUOZrmr+T//us36n+t+
         p0KI+8AHG+sV7vkz0j2jPGxWPXJPaLpBp4vjpafdl8LoxyYHFeSj0SbuBmWntNGMHXmN
         7+ag==
X-Forwarded-Encrypted: i=1; AL+hErEC3nzj3pG3Zd79DCXh527l+jE6QSYpxxJeQnE/LhqC5uNIQFIgb0MzhHkwcJ8VmawTdw0UHBT6oSEOrORg@vger.kernel.org
X-Gm-Message-State: APuU4Z+njMTmtUSd8OEXNbDbzPStIzZ0zgfIt28aJ9bjDOzO2wqwwYtt
	rzVImYzgECzrt6G9vYGqu/oBvbKetMaqZ8F3SuHFzkoOYkexaoG3whZ14WC0AKDdVuRmrwiWjPB
	HUPgs5U6031268lyZjkRGXkgiwwKnCbNf9irFrJMe4dS4tkJR6lq4UcJk1jv14VwzX38S
X-Gm-Gg: AYBFou0d72jZCwhcs60jPR/Qo5kGxFYbr5V/BViyQJ6X7uDVdYYuTdc91PRzZQ8HGZ8
	XSWgOYlcHFW4yGq0h2uzOLnYYVXZgnl9FRAPs5OoXKY7Jd5nsDPkXPKGHWu778P/h3vFFeIbG83
	wpfABZ0rs18Z2h/Y8F9br+nf6ru1SdcVLlYi7Ro8T7umLwHKO4gFqSMHrlJR7bNuaYYcLm+ZsXC
	7Ane5PsWJBrcBBq0RRzBC/jHtOG+I0zsEfglGWFVZQPuVRKbO7o/gI60pMr/usEXveU5ALSaobv
	4/LTTyPaDJGZBIx3+rfloJj+uQJ+9kuANQzcEcAdHlxW4478Rt5PH837QCCxMYa39sxgur//gbd
	DZBdsOJR0UPNTtM2HhnJGn/I0gIWs5M3jCI67T5yzOM2d6iOxBZgrJt9X2IIADcGbBikrSswqdV
	KFmXTT6yI8
X-Received: by 2002:a05:7300:8248:b0:36c:ec0:23ef with SMTP id 5a478bee46e88-36f76d11c44mr3974037eec.16.1793985347364;
        Fri, 06 Nov 2026 09:15:47 -0800 (PST)
X-Received: by 2002:a05:7300:8248:b0:36c:ec0:23ef with SMTP id 5a478bee46e88-36f76d11c44mr3974004eec.16.1793985346688;
        Fri, 06 Nov 2026 09:15:46 -0800 (PST)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa9aea75fsm14693756eec.15.2026.11.06.09.15.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 09:15:46 -0800 (PST)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 22:44:28 +0530
Subject: [PATCH v7 5/5] iommu/of: Add support for "iommu-ranges" on a
 device node
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
Message-Id: <20261106-add_iommu_ranges-v7-5-5c0f72083e52@oss.qualcomm.com>
References: <20261106-add_iommu_ranges-v7-0-5c0f72083e52@oss.qualcomm.com>
In-Reply-To: <20261106-add_iommu_ranges-v7-0-5c0f72083e52@oss.qualcomm.com>
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
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793985294; l=4721;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=eRH33zHRlGkqD6JL6t9hWZjinm5AiyYB0srZIG0kiDM=;
 b=GGWfxUKY22AA92W9aIu377FRuudRQ0Bh3ofyR9ljR+TCb4fnvbIxUCC2bS4EZ+DmG7Ncs/AGM
 Wl5jawco4DNDe5QKZz1XypR9Ru5i5F/dgc3EaPFviVCPsXUNplf7UW2
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA2OCBTYWx0ZWRfX5+heg3k5Mgjp
 oLPzjEWK0WFHsUBQ0kTdMHGZqL15WTwGE+IXz6Es/z95U+NihfncHPu/8ntqIS2OajlmvwkE3+O
 +Io5o/gLSJBnaEyHNBcVYf8TS+cMEiLSDQkaiail/FD4oDGKnUUoSsO97cFKa5gonavwhIvzRQP
 8qycMYSFh1N/rx6tIsk/lPz4moT7o0r3of8dC2LcH1HmSvitFvNvsXW6xzsueXvyjxWOwuB1D3t
 aR7YdgDsXxTnw+AXYDOxitKvAj9HcQ0L9/UMO5BRO+sfOaaIwTj76cut+62/t/sokeGZexlHJem
 SfMBvr2btJlsb2mS7d8ssoNvWFoQ6OOY6l0+LNrlLc8hz5zFVL7uHHd1sCdDOd6PjW8yty5Ff/O
 zDOIxMGFm4Yjr2eMRJnryA0vvSD03eplJAqHZ0mS82mtmCvMCX9ijTYALaZaoyG9E6SVrhVx3kj
 Dku5YjJ/heVTsY6eQHQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA2OCBTYWx0ZWRfX0rSqNqcoxNOq
 1Ati3IbF7lto/6Z1fP3Wy3yPWzFfHqTLCzIYimZgmOKZFTniNu3Qg3StCgdqumal57Wjj4UHlxT
 tPIgXcdkPQx1wzLT2YhqSBJaTw+jYYo=
X-Proofpoint-ORIG-GUID: 67eN_nUXBER7BVTTIA517MR6S1fOw0r7
X-Authority-Analysis: v=2.4 cv=Gr3XaU1C c=1 sm=1 tr=0 ts=6aee0b44 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=NeORdnCe0LA2B_GC58cA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: 67eN_nUXBER7BVTTIA517MR6S1fOw0r7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 suspectscore=0 phishscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060068

Reserving an IOVA address using "iommu-addresses" requires it to be
placed in the reserved-memory node. But when "iommu-addresses" is the
only property being described and there is no backing "reg" (i.e. no
actual reserved system memory), it does not really belong under
/reserved-memory. A device IOVA range is specific to its own address
space, and does not describe the system physical memory to make it
qualify under reserved-memory. Given this, place "iommu-addresses"
inside reserved-memory only when it is paired with a "reg", otherwise,
define it within the device own node. It was discussed here:
https://lore.kernel.org/all/662f7093-fb0a-4564-9ca0-98e03e68ba9a@kernel.org

Existing "iommu-addresses" property expects a phandle, which does
not make sense when the property is defined within the device node.
"iommu-ranges" was introduced to specify the device specific IOVA ranges
when there is no backing "reg".

Suggested-by: Rob Herring <robh@kernel.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 drivers/iommu/of_iommu.c | 107 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 107 insertions(+)

diff --git a/drivers/iommu/of_iommu.c b/drivers/iommu/of_iommu.c
index 00b02c19f27e195fc36c4bc1d91253255147c9ab..e133d3b346feecac7e2bfaec44e4882060ee89ec 100644
--- a/drivers/iommu/of_iommu.c
+++ b/drivers/iommu/of_iommu.c
@@ -183,6 +183,111 @@ iommu_resv_region_get_type(struct device *dev,
 	return IOMMU_RESV_RESERVED;
 }
 
+/**
+ * of_iommu_derive_resv_regions - derive reserved regions which
+ *                                are outside of iommu-ranges
+ * @dev: device for which to get reserved regions
+ * @list: reserved region list
+ *
+ * A device can describe its own usable IOVA ranges directly on its node
+ * via "iommu-ranges". Everything not under those ranges is derived
+ * as a reserved region so the IOMMU allocator won't use it. Entries may
+ * appear in any order in the property.
+ */
+static void of_iommu_derive_resv_regions(struct device *dev, struct list_head *list)
+{
+	struct of_iommu_range {
+		struct list_head node;
+		phys_addr_t start;
+		phys_addr_t end;
+	} *pos, *new, *next_range;
+	int size, prot = IOMMU_READ | IOMMU_WRITE;
+	struct iommu_resv_region *region;
+	const __be32 *maps, *end;
+	struct list_head *prev;
+	phys_addr_t next = 0;
+	LIST_HEAD(ranges);
+
+	maps = of_get_property(dev->of_node, "iommu-ranges", &size);
+	if (!maps)
+		return;
+
+	end = maps + size / sizeof(__be32);
+
+	while (maps < end) {
+		phys_addr_t iova, iova_end;
+		resource_size_t length;
+
+		maps = of_translate_dma_region(dev->of_node, maps, &iova, &length);
+		if (!maps) {
+			dev_err(dev, "%pOF: failed to parse iommu-ranges\n",
+				dev->of_node);
+			goto exit;
+		}
+
+		if (!length)
+			continue;
+
+		iova_end = iova + length - 1;
+
+		if (iova_end < iova) {
+			dev_err(dev, "%pOF: iommu-ranges overflows address space\n",
+				dev->of_node);
+			goto exit;
+		}
+
+		prev = &ranges;
+		list_for_each_entry(pos, &ranges, node) {
+			if (pos->start > iova)
+				break;
+			prev = &pos->node;
+		}
+
+		new = kmalloc_obj(*new);
+		if (!new)
+			goto exit;
+
+		new->start = iova;
+		new->end = iova_end;
+		list_add(&new->node, prev);
+	}
+
+	if (list_empty(&ranges))
+		return;
+
+	if (of_dma_is_coherent(dev->of_node))
+		prot |= IOMMU_CACHE;
+
+	list_for_each_entry_safe(pos, next_range, &ranges, node) {
+		if (pos->start > next) {
+			region = iommu_alloc_resv_region(next, pos->start - next, prot,
+							 IOMMU_RESV_RESERVED, GFP_KERNEL);
+			if (region)
+				list_add_tail(&region->list, list);
+		}
+
+		if (pos->end >= PHYS_ADDR_MAX - 1)
+			goto exit;
+
+		if (pos->end >= next)
+			next = pos->end + 1;
+
+		list_del(&pos->node);
+		kfree(pos);
+	}
+
+	region = iommu_alloc_resv_region(next, PHYS_ADDR_MAX - next,
+					 prot, IOMMU_RESV_RESERVED, GFP_KERNEL);
+	if (region)
+		list_add_tail(&region->list, list);
+
+exit:
+	list_for_each_entry_safe(pos, next_range, &ranges, node) {
+		list_del(&pos->node);
+		kfree(pos);
+	}
+}
+
 /**
  * of_iommu_get_resv_regions - reserved region driver helper for device tree
  * @dev: device for which to get reserved regions
@@ -262,5 +367,7 @@ void of_iommu_get_resv_regions(struct device *dev, struct list_head *list)
 			}
 		}
 	}
+
+	of_iommu_derive_resv_regions(dev, list);
 }
 EXPORT_SYMBOL(of_iommu_get_resv_regions);

-- 
2.34.1

