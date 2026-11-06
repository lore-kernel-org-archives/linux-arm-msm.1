Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793985331;
	b=vmnm1QHRHxs/KmwUbrBIwHzdFBNdmXdTRpW2PnB9R3R+a23AnQfgkIFqtxEfOeTiXSXP
	 kodyTc1X4TKXVa+XQa1M1ltaYK3SjL8tCBDrIRiP0XEEyj6wCXrlu0Yd/Nb6KTimSCLSa
	 0pSetjZnC3YYyKNA4oDWgNu7EddW8MuIISMlzZrpftAcWYhVwwf0KEhcMmPGbTjCsl1QG
	 g4u0Ei/YV/oDdHkVZuy026ibqwY0zorlQ4tCHZemS+lTmtT4PAcD0AyEIXQhyBWPF/m/k
	 eUdOPawOJhQ6v9CFrUAguFS9Tk1k4C2QtV3Z3D0QBL176jrnze/Zkn8giXhkN24X3Mw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793985331;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=zF/sv9c+NsXmkESm0mCjV6+WOZV3eXKN1t46mzLarEY=;
	b=0rXBC/t7VPf6TrAg40wVRoZaKbsOPc1cQW3VXf17pzbSm2H3oyMwmQ6KHuvxdTYgMQPh
	 0a4uACPG4YsziBdMjvJMlZbg+RqpQlPhZPU73TWyd6MGPblxbpMe9EJZ74d+ESkwOSm8J
	 SIwBTlOzyPcYbt7FySsGa/LyTQ4t5+RY4AtJK+HGV6W2qVvSJswsSAYV/9hv/LwrwU/ck
	 z8PCD0oUa7hJxuu6m4cnbbS5U0QonB45E/MhV70gSye86er0AhsviA4C/1Dfv2ohnOuIp
	 YDZGA/hw3Yxjv99O2W4h2keHA1FTfmYjlzm5ZwcZie9WNxAEr4PxlNtPptkwTTOuffg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P3vtkPAE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Xhy6mpYY;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55D4B606A332
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Nov 2026 17:15:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55D4B606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P3vtkPAE;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Xhy6mpYY
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6ExvYX3324808
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Nov 2026 17:15:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zF/sv9c+NsXmkESm0mCjV6+WOZV3eXKN1t46mzLarEY=; b=P3vtkPAEC2OU1b00
	o9yuEbq8a96oHz1CCQpEWhumD+JCXfrJVBaEIxKLCybmx//oe5RQ+4TB3R4RicYA
	x8TZSJGyfPSH1nDyG03f5E9JggRSUiS7uCxRXY7ILjVYOpxMvG4rRGUMLRaa5bP5
	UuDfaHXj9CtyeReUgmTt/+k92RDns0w8pGXjAknEiMN2jU1c9TcBu72fo9zzYHa0
	GzK/JZh+EJuGhzj/k7it8UPWJ1+AiDsiyf0DcvT3Rl8QRCcBVcoqnvnBA2awSEyR
	mzl5nimqZk+9pnEZH+xGfOExCks0/mVlm+SA7Bcirbuk6TlcOj5YWpvNTsTgUNHC
	60f7hA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p9bw2n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 17:15:30 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36f479b9819so1458173eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 09:15:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793985330; x=1794590130; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zF/sv9c+NsXmkESm0mCjV6+WOZV3eXKN1t46mzLarEY=;
        b=Xhy6mpYYH+FaV0vtIaet0pNDRikfJtbPr3n7+QvJHvxrEkGscfVKGVT9i+0iMeTZii
         eU/qTs7DtHPn0igoyprHP1e4e8Fwtwf/r69jOFHmRODxGKSlLTsWD0g4IW0FxYwZ97VQ
         E49P4oEG0RJho/jRZuP/tgOoFFE+7v95aH19AlpI3/BNSiV2oXop7htxwvUF7aZhLW5c
         LmkCRVShGVzrJi1ez7GmRR9G+6a5QMu2CQ7XS4hCUewk/3aKEmrYm+LWy2B5UonhwQAn
         3F+9CVAhloyYTZYkpcZrlbLxhMrJO6VzzBlfjJgqU0yvbLKmDmet1pas9Io/qF0YEGDI
         Rm9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793985330; x=1794590130;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zF/sv9c+NsXmkESm0mCjV6+WOZV3eXKN1t46mzLarEY=;
        b=iAetMAzk5Q3wHKWZkEw5gCvnIjeQjqGbRrYppY3FEohs0KFXuGC4ohWIpC/r583Q9D
         t5qcm6yegHltd2OaMF5xOq5q6rGAWY1vBw3BUne9TfrKQAyMTLfpT9vcWcJKLTFq0aJy
         wW3ezrztdc+HQFhc4tQG3ZFBXcay+C4WMUZWPa5z9WVt5HccY8NosL8UzYYX72H4TPuH
         9jqtr0zSZGeQbRmC1Pfx23wYwKgcWKu96gYLhPLbg4DoB/8WHOfCbZ1RvqHsCOfWJuvq
         cCY34saxwu7bh4P6Jdumezfect/0vRROnErcof8arHTKc3isxRQHqRKVdY2H0CR9OnWD
         J9Wg==
X-Forwarded-Encrypted: i=1; AL+hErGWSQpqKaBdJvWmONcF0UDjZj0iYBjb/2XYc3X+L9wp4HA+TGhBzXKriV4ozXDchjnZa9nrSZ5xdPx3x/u+@vger.kernel.org
X-Gm-Message-State: APuU4Z+nkIJiCwuCPiRsQPSfhZ11w7J3py5siVwAFhCBFBuhfnPsQUWJ
	xAO8BuFhkmV/Q5ueyIj0ZFtVxo7VJ3RlAOa4KI86rPzQy4jIKzKeL/z4lcjavl1XaYJBrJCYNPJ
	BHexl4WxpCWve/jyl6aOjePa+8l9sJxH8Jts6qNdQyzEiyu+dV+vpgAMC7uKkrKF/9Oal
X-Gm-Gg: AYBFou1a1hMzI/+maa+2JzphcoOtMn5qV8Q17vPoVRdSv6OplJzu6jr4fiKViE7uCOg
	gOTLb/FdMk5xU171+DxFiDGv7YycXG2Z12+HVKJZ6XsxYD7VekltM16FygyGZlVONwFmG+IbXyH
	mEITwU21pgb4K9a4PtrQjfwVCbDesmUr9D1nHHk0j40scTHFZgX39LQdWkHSsdZ5RYVGhdiuFAr
	zrpB6xN6ZmLMzs6q5W4+RlvFYoYusgE1l7jCNVIyZcBgiFUU8sh87y1axaoIxlkQXYMYSIk2eOc
	CmMnxj087GcnBWlbO6HtrYyzEtnD4ez3EVapDL3wSIvBH0dETRwtTskxijQfCiLWrdJYPgT46xH
	0luz3D+6AW2RiObAbCv8sMKWiPKESwY/TwNcr07B2KdUDptkzmlcN8xyF3n2RwXx4eZ/zmZFk9j
	+SNjE0D9J/
X-Received: by 2002:a05:693c:80c1:b0:36a:1732:1e7 with SMTP id 5a478bee46e88-36f76d0f26emr4000274eec.31.1793985330035;
        Fri, 06 Nov 2026 09:15:30 -0800 (PST)
X-Received: by 2002:a05:693c:80c1:b0:36a:1732:1e7 with SMTP id 5a478bee46e88-36f76d0f26emr4000223eec.31.1793985329467;
        Fri, 06 Nov 2026 09:15:29 -0800 (PST)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa9aea75fsm14693756eec.15.2026.11.06.09.15.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 09:15:29 -0800 (PST)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 22:44:26 +0530
Subject: [PATCH v7 3/5] iommu/of: Make OF_IOMMU depend on OF_ADDRESS
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
Message-Id: <20261106-add_iommu_ranges-v7-3-5c0f72083e52@oss.qualcomm.com>
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
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793985294; l=2273;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=NupkmvlL/dCPtTaOqaRQsl8ArnjGwSn52BAlgLqDvzE=;
 b=zmYLfThWfIv3sYXwDsJ6RflfKmCfmALOpmNPBUN8TCisKPeZCWDqMJUW2XSqMOPFsQD3BtSCT
 o8PihuvJzOpAYMe5W/ppgKgNz7pZ2PFLD8vYjYsYkLQ8uPypf6/trFV
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-ORIG-GUID: zQn71pED0HPeMC2rIA6iK-yuIam_jp7B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA2OCBTYWx0ZWRfXySQxwnb9xJul
 4WdH5yQzotO3A4PeUPXvEM6W4q15iPOcTa+YEiGx1b0pbJlWcsuB/xs6K5D8rHujwn8GTWYY8Gi
 Ce7QhGSHGFfEfZaHsdQUoYbYWtX26Od2WTEb+K9z2XjEwY+NMLoepv8Uj2sLHUPDoMMCU2fN77M
 lQne7+vQ67yAuKF4KA99hF14VhLLWWcBcmKGsOXvab6Tpq7c8RMg95tdy0LePONIW6MKpte21dX
 uzCBwI9/MhBpKZItJkWqZta65BE3tlv0pr/YymllnY0bpeqgIXdnENEFcIz0b5EWGkCp3gmLbYr
 YTb+LlOBAJQuzEyZwyE2xbdY1pSHOXBv1CKVAlPZOUSd7NJbjboJg/mgfcdJEILQXgcbWRlQSRF
 eAFKEtBRYmss0YRJZRIIbxX200NHd/XYEM9Rv8OIvy41TDoy1razefDAfZxO/cKbibC1GKgzmAq
 ZPySevKFP6snxq7J0VA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA2OCBTYWx0ZWRfXwinSfD1fDGqC
 J+FYQcz2mNzhsoK6aqIbxlj9DYGKNcy787a+C0pj34/LCe8acPcYwfJ5Lfz6Ovt60zmlUmAHYcK
 2L+eGiHmERh6Za9glJW3LKeYGXXFUK4=
X-Authority-Analysis: v=2.4 cv=WMzqzXsR c=1 sm=1 tr=0 ts=6aee0b32 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=fdurNWXONF6VWYIYtoQA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: zQn71pED0HPeMC2rIA6iK-yuIam_jp7B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060068

The OF_IOMMU code relies on OF address parsing helpers, but the
dependency on OF_ADDRESS is not expressed in Kconfig. As a result,
of_iommu.c contains CONFIG_OF_ADDRESS guards and a __maybe_unused
annotation to handle configurations where OF_ADDRESS is disabled.

Make OF_IOMMU depend on OF_ADDRESS and remove the now unnecessary
preprocessor guards and __maybe_unused annotation.

The only architecture supporting OF without OF_ADDRESS is SPARC, which
does not use OF_IOMMU, so no functional change is intended.

Suggested-by: Rob Herring <robh@kernel.org>
Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 drivers/iommu/Kconfig    | 2 +-
 drivers/iommu/of_iommu.c | 4 +---
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
index 85a8d7fdfa30b64e21b8db0db1d5bc268c04f24b..c1e97bd885f933cae45fb7806183477f2d64cd5d 100644
--- a/drivers/iommu/Kconfig
+++ b/drivers/iommu/Kconfig
@@ -147,7 +147,7 @@ endchoice
 
 config OF_IOMMU
 	def_bool y
-	depends on OF && IOMMU_API
+	depends on OF_ADDRESS && IOMMU_API
 
 # IOMMU-agnostic DMA-mapping layer
 config IOMMU_DMA
diff --git a/drivers/iommu/of_iommu.c b/drivers/iommu/of_iommu.c
index 5c266511db78910d6fd221af5437cecff4931c22..6675fc900e6c2d55b34c61dc9effaeb48e24f18f 100644
--- a/drivers/iommu/of_iommu.c
+++ b/drivers/iommu/of_iommu.c
@@ -167,7 +167,7 @@ int of_iommu_configure(struct device *dev, struct device_node *master_np,
 	return err;
 }
 
-static enum iommu_resv_type __maybe_unused
+static enum iommu_resv_type
 iommu_resv_region_get_type(struct device *dev,
 			   struct resource *phys,
 			   phys_addr_t start, resource_size_t length)
@@ -203,7 +203,6 @@ iommu_resv_region_get_type(struct device *dev,
  */
 void of_iommu_get_resv_regions(struct device *dev, struct list_head *list)
 {
-#if IS_ENABLED(CONFIG_OF_ADDRESS)
 	struct of_phandle_iterator it;
 	int err;
 
@@ -265,6 +264,5 @@ void of_iommu_get_resv_regions(struct device *dev, struct list_head *list)
 			}
 		}
 	}
-#endif
 }
 EXPORT_SYMBOL(of_iommu_get_resv_regions);

-- 
2.34.1

