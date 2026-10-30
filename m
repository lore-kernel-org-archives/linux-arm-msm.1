Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793397922;
	b=S3APNzd12tD9H6jea/02/8O6LGjDyheLUgbFeBR1pLcP7EgHgErrLrCnIuM1hTseyA2C
	 xkMuebN9tvvMwUYCoo4tcmj3S8o9T6xFdIn/kXJUEWJ3jppaODrvStpKcI1bMjtmTaRTt
	 Kq741QQXsT3uT3p5vmc2kcBY1oCSEh5ASS606Z5AMplk8z3SA/5lFyq1IKxvOrVvNCzlg
	 fap5SDqbU91cl84GNC8ZYH8OB1/C+2jB39jt81Rw3hrTvcxTL52dWqL0snuqzXNrDRJ1u
	 6nUqmuDMRdSbLhdHCXl8eBxdL0dNjosB1Ps87To/d9ESFcW51kAlzLMTzaXUFDwlNHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793397922;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=z+fyA1uTF8l0hawKrmxS3cSFozenWUmVe0swEtjJgBo=;
	b=x8u6S6W9y7xrGBv0qchmUXVXkM3iSDySnapGV93Gp9bkHE8GTfOC06og10oI1+UvKlkD
	 Ld6MXYXlmjHyDRX+HtGXfxBe0wAGu1cxf58YWkZDwy/CBAiFQPJ6JG3UVtMswhekViu8B
	 136OiIc8KJr58u9C5S+8FHMWnDcjxxBvTLggIN4DJkmWRg0iT2yE+ZC5W/RJi6VSNQUjA
	 0v4Hhs9ayZ2IvmdAiI31WLQaEt/lAn1Ww3oQz/3Zyn/H74ZoJJ93e6yidg5KVtaKpeggo
	 UXWGFKLmqxoKYMgl/8cwwpw8vRN8946G/UmhCstWOvQKZeOwnkEBAkml4rgTcmxJ/Zw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="URwG/Yit";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XLYOdy4y;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62645606A31C
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 22:05:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62645606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=URwG/Yit;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XLYOdy4y
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69ULtPoQ3463643
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 22:05:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=z+fyA1uTF8l0hawKrmxS3c
	SFozenWUmVe0swEtjJgBo=; b=URwG/YitOWgw2Cd6X9piaQbXrbCLMbwGRR0imJ
	OMUFop06EP8Tr1TFLK9Ow/SkKwFxSWAp6u2OvFYTkxN5b7LtBG6W4XS8gIEOnoe1
	VxR3uJOm4VTHaq5OwyqwyNs8hUZJRNcfNlo8n1s4u9PC5PmKWlwuykgKksDM0i2O
	C59D5vgj3j9dyXEEuhg6Lm+xPBy5djdkicnCelV34LifVJyN5Z/dxHgttePHzGp7
	/ejqtDku2znvofM/fDQvPS3HZ8OKG9E7k0DiBC9aa/vyPkBgA0qyQmrqcfWlS4FJ
	/9VWFOGVx0Li+482EvV4+BQJvxftsWrxwZd6BRO9xpgnllOw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn2x0852g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 22:05:19 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f26dd2165so309969485a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 15:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793397919; x=1794002719; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=z+fyA1uTF8l0hawKrmxS3cSFozenWUmVe0swEtjJgBo=;
        b=XLYOdy4y7UTYYf7elO6ILRR0r8Pwx1UtOxVQ8VYJ1ayPeBLVGYMQpokBubjrCeJCG3
         NCY8s8L5hmAjI/3b3TsCNiKjJ+y3Vx/XC2OymeW1ymt7dYdjmU9muJ8ic7bwrOsSeacp
         krT9qeIcSqDhf6GGch7zvHHMcXB+okwJAz44p2xOID/TGEFbZ9X9/wC6roKlatu5H/4i
         ixjDgwKOSz416eMNqRSQOxMaQGZ/yI1agWg3uyFy7heOznXJ1aIZ83X3s6J9rfC/cJ9G
         rPjM5etL+fLzmouCaHlKRsangBBsoRwzcWnahd4Gwy/qqRnw8pDB4GOR1t+8aOxOuODi
         woqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793397919; x=1794002719;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=z+fyA1uTF8l0hawKrmxS3cSFozenWUmVe0swEtjJgBo=;
        b=NaG8/r8mVT+sk9Uk51OKSnTbXTmt9tXXHUdgl7CfH2+gLTxOk5xVvAO86Ur2QrtNoh
         WIdHCidox4t/jOtfsf7kah8RvrCIFnjLIutQMtKAW573AOERnhC/DK/hrQCZllopJfNi
         v6LpP5ls6ERY2nFhBVHUAA+hfs6UeELOo7SIYh4/kXVaDiEOnPW4aCxCvK8IRtONg+Vk
         YnBxpiz0qrPBAU1GjJOc1+UYpcszM0shEGr1h5hKNI24Cc8Z4SUJbAeMN0PD0krEIljD
         jO0AnpIZt3aWZluoxHh/Vj8EDFn/dbEce7Bbj8D96xCOguHe1UlYy+sNhO7QHWg0T4Zv
         fdTQ==
X-Forwarded-Encrypted: i=1; AKwUvBwNvT4sqfT10ZnsVQIbKlz1EuP8SMg/X7yEil9LcViNBrg4FMiF0L6QK67xuOrpkOg3vhju6ENIeKNYylHC@vger.kernel.org
X-Gm-Message-State: AFq9FYINNiTmIF/XpkEDEgo4wmjYstLKDGXraMEa2uRPjNEVZaqcfr1s
	z04ih0qsG/znmZx1408wSs0WTZc0lcP6cLNQout5+MG5E8/nBI34ZMlySXjB6Peybf4tVgRseZ4
	4sg9vaUkwUDxhgO0yQwO1FhPUDXbqSJ5rb4Q1MXeokbwSvX7GPc1B39U8rPSAsJBEkG07b5TWOO
	+W
X-Gm-Gg: AYBFou0EdJ+a1IebD1CpvWVAtIqAf5QF3pbGx+HoY4d02bQ1KI6Ay+IZGCuY/x1dNEV
	GiWoocS7dH95daimorovOtwntV00MhU93GJy9baC4AlzgpC/rtyRK+iTv03EFSNIdnuXf46cZSj
	Ik7mR8yknEFVOXZhY9QFT3PVG0GaeGOOHcjAYhwmDBL9tA2XcVHkDMvo6aavyvnqGEtn5A1zAmG
	qN6xFzSyG+46/nyMx3tJ9/k5+YCAHOgOnB/cHckQuC6/KpGr5MQTc4Q2JHRiBppBG2hr/2NWnBG
	AnbEyl0OgfS9MEBhCzXtQ0+lbps++QrmRVy9c7KNLuX9H7ipFx69o5oTA4+9RE5iOC4orj1OQZR
	Q7y9JfY2mAc5i8NdsIdxA+OawV3hemvtXiq9iGI8NQiXIRIQLj7aNmq9gVL9jZOgkyRXCXhHcUc
	oahNLdkb2kxz3op7XWJT/9IevkCYLl7Kyp7xzSSsmuJ/HDsZw/7I/IOt+5NfqNVw==
X-Received: by 2002:a05:620a:458b:b0:93f:22c4:e92f with SMTP id af79cd13be357-944216ecc93mr652555985a.54.1793397919324;
        Fri, 30 Oct 2026 15:05:19 -0700 (PDT)
X-Received: by 2002:a05:620a:458b:b0:93f:22c4:e92f with SMTP id af79cd13be357-944216ecc93mr652550985a.54.1793397918641;
        Fri, 30 Oct 2026 15:05:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe04edd7dsm243930e87.6.2026.10.30.15.05.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 15:05:17 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 0/3] iommu: qcom: Fix the MSM GPU and display with
 DMA-address based mappings
Date: Sat, 31 Oct 2026 00:04:56 +0200
Message-Id: <20261031-msm-smmu-identity-v1-0-a2a70580eebd@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAIgU5WoC/yXMQQ5AMBCF4avIrDWpTmLhKmKBDkbSkk4JEXdXL
 L+XvP8CocAkUGUXBNpZePEJRZ5BP7V+JMU2GYw2ZaFRKydOiXNb2slHjqcqB9siGtQGO0i/NdD
 Ax9esm9+ydTP18Q3BfT9N7o4edQAAAA==
X-Change-ID: 20261030-msm-smmu-identity-6fda3323023b
To: Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1640;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=yRLg7HFVIyBpDR1OudfdDaicEhcnc5ii023H/+Rvg+M=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq5RSLiBe70SPTpeJOfW582KU9YTC3tfcH16yAM
 9Ay3jDbaS6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCauUUiwAKCRCLPIo+Aiko
 1XNmB/48FlBo5pNt8rsh2B3HNo35GC7dxYk/u+vNhivR7uRs0eE3PGoU8MvUBLnezpGw9Z6ygne
 8gQCqmsIfSQdJT8aYPoDBbYEvPTQXRlYfC3okuKkr8nrfLFiBrRg1ZvzzqQUdXZHpqfKysS3v28
 QYfEX8y72T16sW3zqsBkm7A9YUzGsdHuj8DKrilgsp3VKj8dS2ZpAt1KMbEomG+aewszvZTp1ig
 mtx6JrKjdo2Hy3DWCN+bAI0d08E2KISyzSM3dUrOG0VslIJVePvGyou7qbhflh6iSkQc0fdwVTn
 K7qHqaBr9vv+X3H4G2q5zC3gYc01ZT6XOSphcu6+nESFJZtj
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: Hvc2v6UqDxjg2gg6qw1gOzTLy3XclVYn
X-Proofpoint-GUID: Hvc2v6UqDxjg2gg6qw1gOzTLy3XclVYn
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA4OCBTYWx0ZWRfXzF3NzxAaxlOG
 OXHgdS/0ssk7v6E/X9Cqb83B+uI6awwPvI5oclE/3rHlbjjBF5aPApVUISbjvez8Nx2J5y27hj7
 9JLVQSbh7Zl9BLpgejTiE0Cr90kWo5w=
X-Authority-Analysis: v=2.4 cv=WfKZ+EhX c=1 sm=1 tr=0 ts=6ae514a0 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=rHzMYdhUTImRmf5BPDcA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA4OCBTYWx0ZWRfX1NA+22F3ksZE
 WwoWDy9C35BUtEqzMoODXGzkURThiSFpFFwNFiUnrSRfE0GF68uyShKBzWpCok40r3/CieW3cIL
 auoU4jDMWlclvtBoT3Sh/ji8h9nSCeHUZC9wTknLk68xYOdcdh9FB/cH1WlIuuPaKl9g0jIHmFs
 Ve1Ru1Hudv3FMUyVYXwMheLT0dZ3gL3c1UFXtM4OrOTA6koq8dQG+G0k1V8OBVG4paPzG9L5HB4
 Nu0kLz72quAFQi4eCUycv1pZGtdrcB68B9M++7CfxYoZo9rWDLnmr7zr9vt6AGoaVaLZnkhWMjH
 Ze+Mwgg5aJ4X6khiHWqjxPJWxNSzaQFMTc4/vkkkshnqSfuqi95JTCYqpNk7gR+XlDQTAIWj4nF
 aEKeAWJDQ4SZdS3Tlx6GtmFW6VcQwBFX6w4na5zmFYSwvPptSlQQbslq4YtLvyUFH/nTXg9Y8qq
 F5q4nxk2IZZGDUloUoQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_07,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610300088

Rob's drm/msm series [1] writes the addresses dma_map_sgtable() returns
for the DRM device into the GPU and display page tables, so they have to
be physical addresses, i.e. the device must not use iommu-dma. On DPU
platforms that holds, the DRM device has no iommus of its own. On MDP5
platforms it is the MDP5 device, which ends up with iommu-dma: the GPU
then fails to start on db410c and sda660 and resets db820c. The last
two patches give it an identity default domain in qcom_iommu and
arm-smmu-qcom.

The first patch fixes qcom_iommu's flush_iotlb_all, which never
invalidated the TLB. Nothing relies on it today, but the series above
does, hence no Fixes tag.

The patches are independent of [1] and a no-op for the current drm/msm,
but have to land before it. Tested on top of [1] on db410c, db820c and
IFC6560 with and without these patches, and on Open-Q 835 (DPU) as a
control.

[1] https://lore.kernel.org/r/20261027230452.130031-1-robin.clark@oss.qualcomm.com

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Dmitry Baryshkov (3):
      iommu/qcom: Invalidate the TLB in flush_iotlb_all
      iommu/qcom: Use identity default domains for the MSM GPU and display
      iommu/arm-smmu-qcom: Use identity default domains for MDP5

 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c |  7 ++++++-
 drivers/iommu/arm/arm-smmu/qcom_iommu.c    | 26 ++++++++++++++++++++++++--
 2 files changed, 30 insertions(+), 3 deletions(-)
---
base-commit: f1ac44c32cba88ad65dcecd4a279661d14e93651
change-id: 20261030-msm-smmu-identity-6fda3323023b

Best regards,
--  
With best wishes
Dmitry

