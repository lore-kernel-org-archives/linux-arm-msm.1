Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793985341;
	b=PYL/HfS/wTZxII0hD7Vkgc7s2VO5u/BkjOywB9cV2NRe/3lIcslmd24pgict1Shnu0wX
	 cFh7nVdeE1pilY2J7+I3vN/nuQe3Qloeyp4W+qcvQMrPoe39op2ChflmjvCvW3lnXMfbZ
	 proEXiz+6AYDOIBSL3OYlgBW+Zfw8CyulYI49DZFhQgwrA6JJNJa/11en4nHGET76p9Ja
	 4Q+bVmbk+lLbDNoHpKNJj/g6X/6/uPHfsqjlz1xZ4w/9VVoURMmYiOllZBzxmVj9QiAqF
	 A1YLbpo3iolnxD/vHZm+zBB1NXMydJ1VRJy+50BaEeojjslG3TYnAw4OiEnPCtZZQWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793985341;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ktnp8h8HYMjSZRjDLlt4pPs82/7KOH2Yv0rLDfthZeI=;
	b=5oNdiIPQV/0YoEp2FcErABvvqebVz0vlW0RHYLZO8KCsgkkoZg+/pkcnTE9yYbNnXmMb
	 YZ/ehC6JynZA/v/WhTZIGZH1CcTN2usOCMmQUY5GvfALevYKdwuSmBwRWQTYqB2v6Z6Tr
	 0VC5j4edomFMEsSUpHFXhXsAOYrP8zodDqwYY56goLqoan8yTeiHjOBZiXK37M1T3+Xo+
	 zhpDImEcpHpE/OAfUSTtaeDV1mPS5L/p7d91Kv6KfPx1dwBIH6Ip8ozX3FdgxaS3dcm4H
	 OFHJTR/pVF78UtcrpF/r9FXTQ0eV04wb+PG/f/f1Dp+19EPgnlAbgnG3tocNCcd5p5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PxynK2so;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=buoJxTlb;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F25AA606A33B
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Nov 2026 17:15:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F25AA606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PxynK2so;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=buoJxTlb
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6ExuS8101987
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Nov 2026 17:15:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ktnp8h8HYMjSZRjDLlt4pPs82/7KOH2Yv0rLDfthZeI=; b=PxynK2soVuo53JjN
	5aj46e3rVH7kXRVGRgHizLTk7r1efV79/U0yrirlZ7/QvmE9lWyP1ixbn046WYHW
	mRNkgaEaaU5spk5b068thk09RJAnom8M5OiVBPi47dlSmBWBNLB8ncWTx78AAh7p
	jhzXb/yblbck7Ox/MlVS8y+fvGb/gylJcl6EgNx+NlJ/9KmmI9gZjdwjFDv3oZYX
	ZDE+4oTOJNA6cPFKwCcls9o+Dp7zL00pMeN6/9V06JMNLlCrP4ae9Xy4jH1E9HOI
	bLaYdwKm+bI35HThXY48Od99Ofdf7AebqtXjmLlDrhKozB/bTqxzNqKmWqfkJLuy
	dkCcwQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pa3v0c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 17:15:39 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36f1e7d9d4dso1730537eec.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 09:15:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793985339; x=1794590139; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ktnp8h8HYMjSZRjDLlt4pPs82/7KOH2Yv0rLDfthZeI=;
        b=buoJxTlbXc0+IbRZZQJBqPREtjlrOLASWu0PAprRuh3GthtMrqHrY+k8UJ1Zksdc76
         hMBF8nUYG59zfXGEYwroyKhfriPZiEy0AvpY7TqN1r05V+P1tNFBNy3icX1qRlbwBeFp
         2Bid6gfxbqTxQUwhVB8Tb8PVhVgVISKhFos59uIQRwQ0D1YceQKeUUqV5XJ0QohrvS4l
         MzwICVeuRZ3nflcewWYQHmYaZCU3QUHdThGPfMuY/7QhNurirLBqmbvyaZaJfiEg68tB
         +HMs9A6tZUu+qZ7+mVQAVe6wEHFtx3ATvaU7FwVzsC3LTCQ+DFL1OJuaDfGbI9PzLz6o
         vz7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793985339; x=1794590139;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ktnp8h8HYMjSZRjDLlt4pPs82/7KOH2Yv0rLDfthZeI=;
        b=fLDYaxJ+iVtEHdYOcQQd4rhlDJjvCUhAqHFEYq2muAqHUswzJZlOmk9DnzkvZg69li
         mdSodJtjd7zQqDxtp+rcSKC6XLKkIZT/rbn7n3VM2CRTsv7jKSkSUd36iIV8ir4mkxIQ
         LSNAugMdwdqbDkzuJ7jsjVlxmK8XkIR/z8Xisb5cj0Hxvjt8Vg5eB9lymn1NnEGnp38b
         NQVPlM7JJydY+XaDsTjx0ICgU/BoGoZ9cjGQFSap7xoFvtsKlXSgrmllBXkGlNM3ZuWu
         mXxKN+k1QvsjARZdhqmuAOX4KKguXPLfnVQAEMx/68wNNMsVI+t1b+yfjYHmTG4CdRd0
         cgMA==
X-Forwarded-Encrypted: i=1; AL+hErGe4Q0d5OGaiak5TJ57QwgyisS9z6NpYDQ81Sje+n+0jj6gbn2m7TTMa9Bs64WQpyDLQdnvb4Hlztt0aXSj@vger.kernel.org
X-Gm-Message-State: APuU4Z/K+Ifdjlz5HsbFr6oTH/aainRKYvjQcI0LQTnQPXWBMx7+vA+o
	t8P1HNRxvdCDvZ9LSJbO+8gAA62SDEHX+EtHGE8hdldC0yUmXdNs/YueiiBT4a3p18rEQ5taz+v
	NZXCTJs1j1tusTkez0+QjSFTfLrl8zNm7V78/R/rVvlN92yNGMhMqCotndV1XSw3bnNrb
X-Gm-Gg: AYBFou0rleVvJ0ki78ylplYDyd7RKdAn2FQJc84ON9JLU3nHyeHD9eNuQ1GyEdC9NZf
	uJqNOKaBuN6xV+DpeqViFfQeIOuQ0ULkXs2LICOaNwbrkh2IsvCg97jk6CyADe7EaJ7uycEg0xD
	nF/QOLLT6gsSCXAOpklo6oVCyZCt57PAf50+JUVg2K6CnBKhh9vZugw39yMNJtxCfv4LQ9yT5y5
	h7uSKYW8iMTeFdL+37xOP1zji1VUQxFc38qqfzwPsogewt/eJhCb5RwHf4uovYuHPawOPJLH9+b
	8vLyEbJZYQrLpS8MAi43+VlY1NVtplOc40UkV/wWhPJeIIC37uo0CnzXpWDboqk1D4yCyxzDoKw
	YP3ffNjM3HtBde/LbyjvxwOXUQNaCYpI+jD16NpcLydiQxYamBNzibwTpxHlBYbgO5nZsVDwCxi
	gejgZqAPai
X-Received: by 2002:a05:693c:839a:20b0:36e:371:8255 with SMTP id 5a478bee46e88-36f6fb7f6b0mr4460528eec.0.1793985338766;
        Fri, 06 Nov 2026 09:15:38 -0800 (PST)
X-Received: by 2002:a05:693c:839a:20b0:36e:371:8255 with SMTP id 5a478bee46e88-36f6fb7f6b0mr4460485eec.0.1793985338092;
        Fri, 06 Nov 2026 09:15:38 -0800 (PST)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa9aea75fsm14693756eec.15.2026.11.06.09.15.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 09:15:37 -0800 (PST)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 22:44:27 +0530
Subject: [PATCH v7 4/5] iommu/of: Require reg for iommu-addresses
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
Message-Id: <20261106-add_iommu_ranges-v7-4-5c0f72083e52@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793985294; l=3341;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=eqYY4N+b5bBNKlPSwJkXdHdjtL4HfBKjpUYn+IsXKkA=;
 b=GBQVa8RApuiz6ercB/DdrPne5hpMvwbz+39mcf5Gak8TM+/DOIR+JsQkatd14qD1YxOVp3Bni
 be5cEvNi0vbASIajgNIko9PHVXfje8oKBQGQwGiGrYCVoXQBWE0ZAFZ
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA2OCBTYWx0ZWRfX5ElQMb3Cj3w0
 pAMEC4IoM1pWGzE5vLGP0NNO4oR0pqH0sFy7SsInwFwdyLgQ7NnbaouyJgqZFWG7VEicH6Kvuzg
 Xh4Y7HuY758sYq1jAMS8Cog3rPDs8vbWe4ezGnGRH+VqI/4pHdojDnofBjAWMh94ndRTw/Hp1wQ
 S9bYTshwEBiJfQsC3b7d3ic12wemJwCz1kvzlfRND6KEwjZhyYTet0bV8KoJnrRgR32wU+zr2OJ
 6WVnl927FPUtYwNwz3dwEptZjA+LlJKRhntE1Z9j+e17U+PeIPOQ1zZT1s3ojQAEe/omH+0idOw
 FRlknAL7Cyy8EwCvxlmqtzek9BcXLiL9Wc6qgelJNp3YyOi8sfMa27wMjtgXGU3EIvSQhLIt9UR
 yN2cGMf0pD6BwiSqN8UbfvKEmDdZ8wRpER3cIu8CsZKwOn/5RTvHOhOoP2sYefGA2gyK8hW8rCy
 m7qc6t43jQB2rKvRFIA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA2OCBTYWx0ZWRfX/7M2OtXDWkfs
 We3sT7f+w1BW42FC/qwkExOYvkkGfjozSnIyEYYUhNimYEOqYccvOyqX8GfeJTGui1mKtMZQ0dP
 bL8qCsoyTPyaFc8Fjzw89zdrcrgMHm4=
X-Proofpoint-ORIG-GUID: Yp0h00bL0D7YbbWcik51FxvoHYBUWx3O
X-Authority-Analysis: v=2.4 cv=GpzXaU1C c=1 sm=1 tr=0 ts=6aee0b3b cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=S4w_zJ8MM8sBhC3S0vwA:9
 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: Yp0h00bL0D7YbbWcik51FxvoHYBUWx3O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060068

The "iommu-addresses" property describes an identity 1:1 mapping between
an IOVA range and the physical memory specified by "reg" in the same
reserved-memory node. Without "reg", there is no physical memory to map.

The DT schema now requires "reg" whenever "iommu-addresses" is present.
Align the kernel implementation with this requirement.
https://github.com/devicetree-org/dt-schema/pull/207

An identity mapping requires matching IOVA and "reg" ranges. Reject
mismatched ranges and report an error.

Suggested-by: Rob Herring <robh@kernel.org>
Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 drivers/iommu/of_iommu.c | 32 +++++++++++++++-----------------
 1 file changed, 15 insertions(+), 17 deletions(-)

diff --git a/drivers/iommu/of_iommu.c b/drivers/iommu/of_iommu.c
index 6675fc900e6c2d55b34c61dc9effaeb48e24f18f..00b02c19f27e195fc36c4bc1d91253255147c9ab 100644
--- a/drivers/iommu/of_iommu.c
+++ b/drivers/iommu/of_iommu.c
@@ -174,19 +174,12 @@ iommu_resv_region_get_type(struct device *dev,
 {
 	phys_addr_t end = start + length - 1;
 
-	/*
-	 * IOMMU regions without an associated physical region cannot be
-	 * mapped and are simply reservations.
-	 */
-	if (phys->start >= phys->end)
-		return IOMMU_RESV_RESERVED;
-
 	/* may be IOMMU_RESV_DIRECT_RELAXABLE for certain cases */
 	if (start == phys->start && end == phys->end)
 		return IOMMU_RESV_DIRECT;
 
-	dev_warn(dev, "treating non-direct mapping [%pr] -> [%pap-%pap] as reservation\n", phys,
-		 &start, &end);
+	dev_err(dev, "non-direct mapping [%pr] -> [%pap-%pap] is not supported\n", phys,
+		&start, &end);
 	return IOMMU_RESV_RESERVED;
 }
 
@@ -211,12 +204,14 @@ void of_iommu_get_resv_regions(struct device *dev, struct list_head *list)
 		struct resource phys;
 		int size;
 
-		memset(&phys, 0, sizeof(phys));
+		maps = of_get_property(it.node, "iommu-addresses", &size);
+		if (!maps)
+			continue;
 
 		/*
-		 * The "reg" property is optional and can be omitted by reserved-memory regions
-		 * that represent reservations in the IOVA space, which are regions that should
-		 * not be mapped.
+		 * "iommu-addresses" must be used in combination with a "reg" that provides
+		 * the physical address and size of this memory region, for an identity 1:1
+		 * IOVA mapping to that physical memory.
 		 */
 		if (of_property_present(it.node, "reg")) {
 			err = of_address_to_resource(it.node, 0, &phys);
@@ -225,11 +220,11 @@ void of_iommu_get_resv_regions(struct device *dev, struct list_head *list)
 					it.node, err);
 				continue;
 			}
-		}
-
-		maps = of_get_property(it.node, "iommu-addresses", &size);
-		if (!maps)
+		} else {
+			dev_err(dev, "%pOF: iommu-addresses requires a reg property\n",
+				it.node);
 			continue;
+		}
 
 		end = maps + size / sizeof(__be32);
 
@@ -257,6 +252,9 @@ void of_iommu_get_resv_regions(struct device *dev, struct list_head *list)
 				}
 				type = iommu_resv_region_get_type(dev, &phys, iova, length);
 
+				if (type != IOMMU_RESV_DIRECT)
+					continue;
+
 				region = iommu_alloc_resv_region(iova, length, prot, type,
 								 GFP_KERNEL);
 				if (region)

-- 
2.34.1

