Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFB2C37FF4B
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 16:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784218736; cv=none; b=QclJZJ4mbNYOrFddWjpqLYQGK/iJh7eQy8PJn1pUTED+b/wsvNALEyrej81Qb/Iz1gmXxsSQNSH4ZiF0Ulr5JXH/qd6i5BVtXHE7dboLy+Ikg4yoSofywHdzBBOEhxZf0s3g4tbMRIIjNJVnyL4gVKGDIkllS1+aJikmQ3jVDU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784218736; c=relaxed/simple;
	bh=Zf1cAa5b0bNP3c/K70OfmcZ/HBkFtBvo/OVNOd6Dz4Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hNQRqJ77MEQ8XvmdLs81DJh4MFVxGyg6lVMEV2I8MIH2FGk3BPTgRnwpqg4ZIerM8UG111ykVnbUhbHirJwtpWYyFgCGZ6Oy/UaIQfdMf410FeIgm0m++YTxBvYS2ihRpWzrdWk7PHz7hzWy3Vn70Njpb6qq9BL7ZRUxY0ECbuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iMPASNCl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MLs1F5sA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iMPASNCl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MLs1F5sA"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GDJtId2972647
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 16:18:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+v6DYK+7R/PwBLwFZrKIBzxEvo+v4Yk8qTFPX7MFv5k=; b=iMPASNClIiwnBUs9
	TLeukO+yIb2e0ANhVibK7//YIYfas5syQgkyc7wnsJQIoTvpZuYEOeHWBJu5VeY6
	9yogaFGiAWNTzGIMIIezHR11yGsQeL0YgmV4H5AEiZSn0xPzwCfpa79pEc8vxDOm
	UM3B3mozqhtGxFH4trB9B/GYLX3AfqAbkhH274guXhQi1qBlML7CKztgKSocX+Tx
	Xp0bgnLDMnNLUKU0fuwGkEALmg3qiE9mew3+NbFjyghRnqQHK7CYzyuV0sndEKxg
	Xlp7gXtKJteK8Kbso8RPx1ZJBUev+l3SIc9ZjDrxmrrv/gmkWqj2tRSlZrx2DyHD
	2P85SQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feu10aa4u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 16:18:50 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8eb8914e651so66299756d6.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 09:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784218730; x=1784823530; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+v6DYK+7R/PwBLwFZrKIBzxEvo+v4Yk8qTFPX7MFv5k=;
        b=MLs1F5sAHKcriSWlp/x+WJuWMmih/wkFDJ4cFY2lJhsMFo5oyhrmcmqayG5nFgd8ve
         yr7GCMwpMdlOYsbPEpTsyw0nXc1Cs2EHVvPwDApaJEu/13kEsADCRQ7CS/9cjruc7rhS
         VvHAo54HOG/k6jS2Y3CL4SgymZ4+pLfSo2UrzKZZQzu7D+Ylyjnd4pGetKpOJ0uhpf+E
         hfAIrdeC+fdg2MEx0c1J3iQA9PKt8WDcAQj5AzTJy5hjOZtc1Nfci0RkLXyVdRL6/y9e
         sSokfaizZlB3l3dAqH2FsvS1HSEeRIsN3hl2Y44qGjzxI1iLfTRvXp7YuS7cR0pL/POQ
         HiQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784218730; x=1784823530;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+v6DYK+7R/PwBLwFZrKIBzxEvo+v4Yk8qTFPX7MFv5k=;
        b=kpPTwIC4meiiHO5M+tktSzQlOSp3+v7hjtqp8IBXhXMK9oe7hLZqICG+g3gsNrkNPo
         Zr6vO6/xmpbyuC2Y5wXAZL1E1j/z65sr4QpfRaNNwcReP5F2soIC4N1wucAD4ea457iu
         ya11xlZDPfW2qg+mEuzenEIz2ltf8nTD436XgRkEPYjQhQtWOX652ZXlFs9wM3auiBCs
         LOYUYJtP9NMXUT1sBoq1HfCwBCeymUi7ewKPV4Bn4iziQzRlleYf4LkBpDHQzOB4OI5V
         n47njFl9h1b3bqMO0PXq3id7j1vmJHFGp3n7REXWofHnETT+PlgUdrJQHVRUKSlTPf3S
         J4fQ==
X-Forwarded-Encrypted: i=1; AHgh+RpSVZ0pjsIca7+B0OgkwI7tXlkfhZ7yykPKXCEK+Ha4RRQQbMcySPKNoP8ynCoOWjp43Zo0fDCwyLA4XaWz@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1Lwn6sdA5jYw+Ff5XtDtN94J67imDm12v+4lLSv7lefPHjnmw
	lIPELRi4LxrB+CDwvdLOTOMdCkVxfM6ZldmC/jOVQsMQLIzCBX44qyzq8dw1dvekzkD+4kRTHco
	mL9L3w7cXgVMKs3BI7n0IgTymPg7ZTgpxkM1lVi6it4BVTHU9vbRQyYpfWJB1gSS3B4vf
X-Gm-Gg: AfdE7ckvS85vM6OcfZK6d94yXerfhVDajKs1k6H81fwQZbvATvfhnMuJkD1tRfva8i8
	OHyrasneC9XrsTUI59eMXOAbhK/obGF5pkemRMNm5TmX/1prVPU17CHrAGykvinqE2SJKmYlj/q
	nwXs/+LCoG1mgIaQmE6tEAPxQVCBPlbTXwP6nhim2Rdoq5OxyEvYFMqFarpj6ZOIc8y8hYxL9eS
	Zwg6Q2+ilMrYbw2HvR3mLyjr/CpVI7EbO3RZ/Zn9NemN0R4M/ulrg95MsZL9u+QyNObozNDkUcg
	6MYZzfBIFrMkkSPvCHeE4s+4vY+xxfX3WYnk7ICyp/sRlg9BESutZlOcCmjQnUaLQK8L0rAYxiL
	YLdzCpAr55kBs6jb/VoYMFEDQxGTW/G1B2waB31KVTZSqUB39/ZKAmmuCsFbLmSp2eY3hlkY2Hk
	SXhtpoVxyJvpXYE1+0g5pLVo4tYhbzKme68sLl4eK2YmUd7MfJUwg=
X-Received: by 2002:a05:622a:408:b0:51c:7b12:120b with SMTP id d75a77b69052e-520bf276cf2mr2130231cf.73.1784218729728;
        Thu, 16 Jul 2026 09:18:49 -0700 (PDT)
X-Received: by 2002:a05:622a:408:b0:51c:7b12:120b with SMTP id d75a77b69052e-520bf276cf2mr2129611cf.73.1784218728955;
        Thu, 16 Jul 2026 09:18:48 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:751c:d61c:c91:60dd])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c168744bdddsm257262866b.48.2026.07.16.09.18.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 09:18:48 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 18:18:27 +0200
Subject: [PATCH v4 10/11] power: sequencing: pcie-m2: Add QCA2066
 (QCNFA765) BT serdev ID
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260716-monza-wireless-v4-10-9b02e6f549d7@oss.qualcomm.com>
References: <20260716-monza-wireless-v4-0-9b02e6f549d7@oss.qualcomm.com>
In-Reply-To: <20260716-monza-wireless-v4-0-9b02e6f549d7@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: 14hF0pLYXeGyi6VXVteaWVv3MGvL-d-Y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDE2NyBTYWx0ZWRfXy4eaC904hmvh
 OfUe9Ged5qTOveA9V3e6L1V6Hbw+96KBrhXqsqEq6GIjGnc4hPLTypc9pukInOd3MjrkY13G1OE
 lVJ5NECSNPYFKK2Rzo+iXx2Fw0q6xUDlpxtI1DI3RZHpnzQwhQ3aPq5lgR5B4Oyr+2jTNZJqTPL
 GNCwYaiD5EsHe/vU2wWn864csqoQGy0UF5ZhUTVq5y8Z4uxqtlH5r12wyA0OuK9Ozxkk8+6Qu9n
 nAruKupahbB8r6wftmzRF19DFhu7vZGPKG9UlOJrEwF7QhgNi/fPctr1nLyYGzrx9bx0coXCqZt
 akdMqJqXAJrLE2EKVIhLulKAEQ1OdT5IQUr2LB1VXtLKtfr1VTVVt8nAMFEMDWGkpi6PudAisuR
 N9T15sp4c7P9nmO4Kmfqy6wR7ALOAnTkqi22GwACWx6GW03A4rJexJ4zJgB3tVO4cmEN1d1c6+1
 iEQpiRVqEsHAP7OiqLQ==
X-Proofpoint-GUID: 14hF0pLYXeGyi6VXVteaWVv3MGvL-d-Y
X-Authority-Analysis: v=2.4 cv=BPODalQG c=1 sm=1 tr=0 ts=6a59046a cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=hhiJJhbhXc7jC-Wm4KYA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDE2NyBTYWx0ZWRfXyr1PBQmVRv3O
 H66RQadsflWbuM0kenxHAFFlc6ZsNpkielwrk0TLjz1j+hYWIo+3ZKgk+tHw+hcacpHuZj7Iy+O
 Cb6BBrgwEON5IuTkgVfPxAlKT/vSJBE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_05,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 bulkscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160167

Add PCI IDs for Qualcomm QCA2066/QCNFA765 to the M.2 serdev ID table,
mapping it to the qcom,qca2066-bt compatible string.

The Subsystem Vendor ID (SVID) 0x0108 distinguishes the QCA2066 from
the WCN6855.

This allows the pwrseq-pcie-m2 driver to automatically create the
Bluetooth serdev device when a QCA2066-based M.2 card is enumerated.

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/power/sequencing/pwrseq-pcie-m2.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/power/sequencing/pwrseq-pcie-m2.c b/drivers/power/sequencing/pwrseq-pcie-m2.c
index 8e4cb778e31f66aa171ad9831d4213e17d2e6145..741bf593d1716d55494cae99d4452600555e53b3 100644
--- a/drivers/power/sequencing/pwrseq-pcie-m2.c
+++ b/drivers/power/sequencing/pwrseq-pcie-m2.c
@@ -216,6 +216,8 @@ static const struct pci_device_id pwrseq_m2_pci_ids[] = {
 	  .driver_data = (kernel_ulong_t)"nxp,88w8987-bt" },
 	{ PCI_DEVICE(PCI_VENDOR_ID_PHILIPS, 0x3003),
 	  .driver_data = (kernel_ulong_t)"nxp,88w8987-bt" },
+	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x1103, PCI_VENDOR_ID_QCOM, 0x0108),
+	  .driver_data = (kernel_ulong_t)"qcom,qca2066-bt" },
 	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x1103),
 	  .driver_data = (kernel_ulong_t)"qcom,wcn6855-bt" },
 	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x1107),

-- 
2.34.1

