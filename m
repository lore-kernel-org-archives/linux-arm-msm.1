Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795170965;
	b=q3Gq5epLIcy34o2Db4FNCCafejku5LfGOqb3zZeVfm9ePvIVpux9Sj0KunZrhoPRlpJk
	 iKZz+IlLHf7IKAh+aruZx24gTE+kQPnRusk/UNy/GvQDZorQwp3ypQaDe5LzKZklnWMqf
	 fLytY81K+ItCXeMxXwVGHJ8ueOjp08YvpsYPrskWXsW6NdgUPX2XdOATc4X47eROpfGL/
	 T2ci/yjJVzziubdl8llIjWp4QRtUOAbar1A/14QHqoaJ99nMp2EylNfoVgmOFm5Lw4vzK
	 g1LVxOFMmxToqO69PBP2YkR9CkAt9axi+RzaWK6CSTQ8NQ/2XZKvqKUM9zPIHxrVP8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795170965;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=YY/D6NwXvAt8GUNLURk0RoyGVkXYLPKr3FA7NvSrM04=;
	b=agX/AcDKRAZk6kTKunsG/MMksmCmAFHqjAmYuJuYYpZ4r3HsXPJzIw7Nblt2/Yo8UfT5
	 /dsybvBBf3Tq3VuwrZ6or92x09vIuVEWGfn5XaTGUOcUZx/itA+2ZSKA1NkKdo84QGmu0
	 PE3zhwz8wx4GHKNlOpBfXHFF0LHNuaT8Mr01cR3b4bdVUav53ldlt2skDNKWVA1ZtRxYs
	 f9+tHHxOg8l7xyc0/5i8AKv0GphrrXHaEW7utwWfKO+rvvfw+BAEjnZtqW/vk31xzphm5
	 wKRu1tjzQYAuVQosLQPqSXPquCv+WXwmUU0EeGKIge57PsWHoXvrct4eFcyRl7jJoew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=h4uKSajK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R9WjRqJ4;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 617AC606A32A
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 10:36:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 617AC606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=h4uKSajK;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R9WjRqJ4
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7et9q2019501
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 10:36:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YY/D6NwXvAt8GUNLURk0RoyGVkXYLPKr3FA7NvSrM04=; b=h4uKSajKK5dVxUFf
	JIxAtAPjf2a8Sk1VwgoXr6oWF1E7rgxFGbWDsHbolwgPQ9loa26Bwcj3UMHTC1Ou
	MdmwEHJVyune52IBCrXOUA+9xdZyjB3+dTAXrraukG1HHFhee5GMKUhbyl75rwv/
	czornfm6BbkQND6CWWP4Ae9d+uzDHRnTiFGmXQzQ/SxbV/+ck92gR6CXwU42aoJH
	wlurXDUamkqlBbPwXTN7QG5BDAPNKK8k/dkr3RmpnlulIpx8+p7WVZM1il0IeKBl
	Z2Dnlw6AqiHZU8YL94QxIY475V9vUTd/Tayuls2D36bS74pR3XgjjZrNL5B9h8si
	Y5aDOw==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2fjj9b8q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 10:36:03 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-139b62317d0so2087645c88.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 02:36:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795170963; x=1795775763; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YY/D6NwXvAt8GUNLURk0RoyGVkXYLPKr3FA7NvSrM04=;
        b=R9WjRqJ4QQWUeQL4yX5jyUOWIQDkm6G3uIiGearW9gr8ecGN1WZD/p8JQ6lnocq1gV
         lbYRZQr063YsKMPANGEqreoHgH9fAg6mwa1NeDtzFwZGfNpYLdNZDOMmoILp0rSCtoaX
         Yp0Uiusbg/2XCDScQQOXOTldX8b+jNUijVHlARegY7GkNqOl47G5gcG0m81MdWyIqnNU
         OJbrPgHFxRXRsxI1ixJF4GRXXTa03wZqwPU2g+HQT8DvaS0DJuXjJ8bCvjrBV9suPfNm
         gtH2NfN/HAyf2IIWiB76H6BRaMOyFuxfQDzW2hk8/r6KXwiiMhW5bySKVT3xdKk91GTT
         m8CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795170963; x=1795775763;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YY/D6NwXvAt8GUNLURk0RoyGVkXYLPKr3FA7NvSrM04=;
        b=ygl5ozOLIcUYQQwXS7ExZzzyPPt1UQdqG9xsR/d2amkTvi9V5gKSC3Qw/KQW8Pl8V5
         4U9HCAk6I3mv1JXfx0JYhcGVnPdBcrGAeAg8slvC/tca3GlKjHGsqv3LFJh6/jNIFljV
         WqXrwLRVBkZTyfvZGjqxof1CPLTk2ylvqyAxvGYQU7qp5mvoREzKgrM6wljv1uenQHL7
         MoxceU+x+Jic8M4g1SpHN4efmHySVTxg/g9plSIbMAaCw3hzhhj0EbgUpmJluMEPtc2u
         8KoO9G7OkT21gU4vEnpeUTKR7s9BA3NMH6cTum97AHXXr+oTkdcncePXSPdUbifWCCJh
         bj/Q==
X-Forwarded-Encrypted: i=1; AL+hErHgZSpglAE3S+noRSwe6G+GJBvfB7/vcImskXZD7Mq4k+rZdv5/GA5xsIGl2y7mZ9uVY5miY92mZFa3+VhH@vger.kernel.org
X-Gm-Message-State: APuU4Z+b10CJbrvNGZY+NMFWXpCwBBdUmUWaYJD8kKtZ4EVtmPGgRmR1
	5zs76CWcSz2RBkUtIst6uuacIUGgmQ8tn2RmsQEBy7kDOzNNHt4t4sKBWheE2UL47ByCbBnr76A
	oXDD0K5d4Ir6qIukLBjjpd6UNs119mOKa8r5yVQFO85mld1im1ChTjrgoW2v0czTqz3Fc0ROwie
	ok
X-Gm-Gg: AYBFou129qBACmlJVecAaoTsLdLpLo2GnwaAEOslAct62aYrc0Zrg4nKjdAE3anH0Jr
	edgOKXMELWNjz9CvUPbq3r9sIor8aINBpu5pY6m/kExoR3fjcSgOjEsyCv2cx4VL7YZ34M2HYHY
	+bUIQJK8Xq8sQD3m3sY6ltxeWygvhfdzwN24tVpA///okJ+shP+tGP4voU8kTXz/A6T/QAUoaX9
	d2J9Ek5i6Nsn6gAa5hBwJDJzNWaNH9imSEe4Ty8/E0S82RFfHSTvKuNjkhTg4AQHcmKmztQfzSh
	DaV9HfaJkCG3u2Wqv4oweBW1HjQIZ5P0Y1CTPlNOLYesXQJOdIcONR58EfTx9KGQC5DR+b1cTjc
	xug+X9H1tn9wKEbq48jZ4SRv1BiKue0tBSq8NPjiNULsuWMB6GTBGCKSyEH357UajB9M3qCTOSs
	h4XwZ5aHcU
X-Received: by 2002:a05:7022:4181:b0:1b0:4272:4282 with SMTP id a92af1059eb24-1b5568ba440mr3940268c88.17.1795170962897;
        Fri, 20 Nov 2026 02:36:02 -0800 (PST)
X-Received: by 2002:a05:7022:4181:b0:1b0:4272:4282 with SMTP id a92af1059eb24-1b5568ba440mr3940229c88.17.1795170962392;
        Fri, 20 Nov 2026 02:36:02 -0800 (PST)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567ffa8csm5751096c88.7.2026.11.20.02.35.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 02:36:02 -0800 (PST)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 16:05:14 +0530
Subject: [PATCH v8 2/4] iommu: Use resource_size_t for reserved region
 length
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
Message-Id: <20261120-add_iommu_ranges-v8-2-d90486973b73@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795170934; l=7401;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=lAW81bYzUUhgYHNWMgCQPymvHpXLoor0T9PhGuMwfWc=;
 b=Qco8yvhIVGKE/Rsm7ltl1KXI+gWCZ1vE8QgCc0KLZOIIaad+e1dvDgpsf+st8GRL1OECvOF3G
 nRfsYY0CeClCxBmfzYu2/g4tblcfgkbodiEsV7YMppTP1Q5PbkrcJK4
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Authority-Analysis: v=2.4 cv=FJaOVOos c=1 sm=1 tr=0 ts=6b002293 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=OYu7oO-Aqzh5uGTkRJkA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0MiBTYWx0ZWRfX/AJyzWEdJgsW
 klPO9KN0CevSux8OqKOtBXlXIBCFzyXefJj67/qCj2mC3znILy7GXfZedloctL7LjhIUV1mi2T0
 JT42tpLc4bCJpGV2xgXSLihG2yf/yPw=
X-Proofpoint-ORIG-GUID: XzCHOmEz9pepmWMdiQLx-glp0cLp1wOY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0MiBTYWx0ZWRfX7oCjj7IsSB52
 9xB3roHLg/2K0zr2zqrHzKuXq0fAUDtyXEytH3plAhUVaaDun/FlRhXIIFlkwlUmj2d7AH1TdsZ
 zV1s3BICWefQmVw7AKOkjWTXhlGQ5vzysh7/wRGVDytGR2+6/9Pi76jQM2QRYHaI3BtmbehnWcr
 jCAyGh6pOXlSDfQe7otzrO/7BnVJrmwqCcCdy8Ra2cUpQrAWJV66TsKGQ7DogSJlVlhlM8W1Dwi
 ExLqLl4lPTDfcJYAeN7rU7OWzJtpMeu7NbZhVr8VhVB80aX0+nb++HQodpsdsrcCSmuQtNCylcw
 u9DaBqil4AO603FZR0bHvTDQLwfQHwTYpLCQOhGynOL6YHsFjkpwuLVyyrBLgXXbwXJmOr6lQ5X
 XXv8qKprI1oyJJg08vdxacCo2KRZK18SA6IMjxQHAQ31PEujmY2MRR0yj9uJ7gs9p5+dYVUxWJ3
 DuHGO//2RBlZqtVAtOw==
X-Proofpoint-GUID: XzCHOmEz9pepmWMdiQLx-glp0cLp1wOY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 phishscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200042

On 32-bit systems with LPAE, physical addresses are 64-bit. A reserved
region can be larger than 4GiB, but its length is stored as size_t,
which is only 32-bit there. The length gets truncated.
Use resource_size_t for the length so it matches the width of
phys_addr_t and holds the full size of the region.

Fixes: 2b20cbba3390 ("iommu: iommu_alloc_resv_region")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/d223ee9f-b262-408a-a201-8b16d310bbe0@oss.qualcomm.com
Cc: stable@vger.kernel.org
Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 drivers/iommu/amd/iommu.c       | 2 +-
 drivers/iommu/intel/iommu.c     | 2 +-
 drivers/iommu/iommu.c           | 2 +-
 drivers/iommu/of_iommu.c        | 4 ++--
 drivers/iommu/virtio-iommu.c    | 2 +-
 drivers/of/address.c            | 2 +-
 drivers/vfio/vfio_iommu_type1.c | 2 +-
 include/linux/iommu.h           | 4 ++--
 include/linux/of_address.h      | 2 +-
 9 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/iommu/amd/iommu.c b/drivers/iommu/amd/iommu.c
index 41ee4ad1dcf826cc765c6f198d487620be60281d..f9f8ef919236a28c6514609d2710b7801a67834f 100644
--- a/drivers/iommu/amd/iommu.c
+++ b/drivers/iommu/amd/iommu.c
@@ -3146,7 +3146,7 @@ static void amd_iommu_get_resv_regions(struct device *dev,
 
 	list_for_each_entry(entry, &pci_seg->unity_map, list) {
 		int type, prot = 0;
-		size_t length;
+		resource_size_t length;
 
 		if (devid < entry->devid_start || devid > entry->devid_end)
 			continue;
diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
index 5a2e705a2f2e025245d4b42c4a9f765c67d708d4..70e210ca085ff52519376358a3e3b7a01619d7a8 100644
--- a/drivers/iommu/intel/iommu.c
+++ b/drivers/iommu/intel/iommu.c
@@ -3535,7 +3535,7 @@ static void intel_iommu_get_resv_regions(struct device *device,
 					  i, i_dev) {
 			struct iommu_resv_region *resv;
 			enum iommu_resv_type type;
-			size_t length;
+			resource_size_t length;
 
 			if (i_dev != device &&
 			    !is_downstream_to_pci_bridge(device, i_dev))
diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 8da858154949e849ef6bc1d303271883fa4762fc..4412dc39a5e87900f3a22e824a99babdcc9f695f 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -3010,7 +3010,7 @@ void iommu_put_resv_regions(struct device *dev, struct list_head *list)
 EXPORT_SYMBOL(iommu_put_resv_regions);
 
 struct iommu_resv_region *iommu_alloc_resv_region(phys_addr_t start,
-						  size_t length, int prot,
+						  resource_size_t length, int prot,
 						  enum iommu_resv_type type,
 						  gfp_t gfp)
 {
diff --git a/drivers/iommu/of_iommu.c b/drivers/iommu/of_iommu.c
index a18bb60f6f3dfdba853b6e16dd2a8616f6a731c7..5c266511db78910d6fd221af5437cecff4931c22 100644
--- a/drivers/iommu/of_iommu.c
+++ b/drivers/iommu/of_iommu.c
@@ -170,7 +170,7 @@ int of_iommu_configure(struct device *dev, struct device_node *master_np,
 static enum iommu_resv_type __maybe_unused
 iommu_resv_region_get_type(struct device *dev,
 			   struct resource *phys,
-			   phys_addr_t start, size_t length)
+			   phys_addr_t start, resource_size_t length)
 {
 	phys_addr_t end = start + length - 1;
 
@@ -246,7 +246,7 @@ void of_iommu_get_resv_regions(struct device *dev, struct list_head *list)
 				struct iommu_resv_region *region;
 				enum iommu_resv_type type;
 				phys_addr_t iova;
-				size_t length;
+				resource_size_t length;
 
 				if (of_dma_is_coherent(dev->of_node))
 					prot |= IOMMU_CACHE;
diff --git a/drivers/iommu/virtio-iommu.c b/drivers/iommu/virtio-iommu.c
index 7fde3ddf231af7fcb6571e3daeaf227552eb17bc..37c48d05c73bf9bab85ed134eac6c6998191405c 100644
--- a/drivers/iommu/virtio-iommu.c
+++ b/drivers/iommu/virtio-iommu.c
@@ -483,7 +483,7 @@ static int viommu_add_resv_mem(struct viommu_endpoint *vdev,
 			       struct virtio_iommu_probe_resv_mem *mem,
 			       size_t len)
 {
-	size_t size;
+	resource_size_t size;
 	u64 start64, end64;
 	phys_addr_t start, end;
 	struct iommu_resv_region *region = NULL, *next;
diff --git a/drivers/of/address.c b/drivers/of/address.c
index 499d37ceae210ac844eef853aeecbfabaaa5e138..f665432638a6d1cc1ebfc0d2356b813c8c584910 100644
--- a/drivers/of/address.c
+++ b/drivers/of/address.c
@@ -655,7 +655,7 @@ EXPORT_SYMBOL(of_translate_dma_address);
  * Returns a pointer to the cell immediately following the translated DMA region.
  */
 const __be32 *of_translate_dma_region(struct device_node *dev, const __be32 *prop,
-				      phys_addr_t *start, size_t *length)
+				      phys_addr_t *start, resource_size_t *length)
 {
 	struct device_node *parent __free(device_node) = __of_get_dma_parent(dev);
 	u64 address, size;
diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
index f7addfbe1aab4f6fb662b8b2fa66bc02d98b5f03..9f508143505ad9e603af1730e811c30bd5edce16 100644
--- a/drivers/vfio/vfio_iommu_type1.c
+++ b/drivers/vfio/vfio_iommu_type1.c
@@ -164,7 +164,7 @@ vfio_iommu_find_iommu_group(struct vfio_iommu *iommu,
  */
 
 static struct vfio_dma *vfio_find_dma(struct vfio_iommu *iommu,
-				      dma_addr_t start, size_t size)
+				      dma_addr_t start, resource_size_t size)
 {
 	struct rb_node *node = iommu->dma_list.rb_node;
 
diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index ef5043752a3651419679316c5a20cdf049efeaba..1d8f9381a358ec2309503bfe2866f08a1f236b2b 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -306,7 +306,7 @@ enum iommu_resv_type {
 struct iommu_resv_region {
 	struct list_head	list;
 	phys_addr_t		start;
-	size_t			length;
+	resource_size_t		length;
 	int			prot;
 	enum iommu_resv_type	type;
 	void (*free)(struct device *dev, struct iommu_resv_region *region);
@@ -968,7 +968,7 @@ extern void iommu_set_default_passthrough(bool cmd_line);
 extern void iommu_set_default_translated(bool cmd_line);
 extern bool iommu_default_passthrough(void);
 extern struct iommu_resv_region *
-iommu_alloc_resv_region(phys_addr_t start, size_t length, int prot,
+iommu_alloc_resv_region(phys_addr_t start, resource_size_t length, int prot,
 			enum iommu_resv_type type, gfp_t gfp);
 extern int iommu_get_group_resv_regions(struct iommu_group *group,
 					struct list_head *head);
diff --git a/include/linux/of_address.h b/include/linux/of_address.h
index 0cff9036539168b0cf2826ee34417738a4836ace..ae6d96c8c110adad966f2c1bad2cbefaf55e5c57 100644
--- a/include/linux/of_address.h
+++ b/include/linux/of_address.h
@@ -56,7 +56,7 @@ static inline int of_range_count(const struct of_range_parser *parser)
 extern u64 of_translate_dma_address(struct device_node *dev,
 				    const __be32 *in_addr);
 extern const __be32 *of_translate_dma_region(struct device_node *dev, const __be32 *addr,
-					     phys_addr_t *start, size_t *length);
+					     phys_addr_t *start, resource_size_t *length);
 
 #ifdef CONFIG_OF_ADDRESS
 extern u64 of_translate_address(struct device_node *np, const __be32 *addr);

-- 
2.34.1

