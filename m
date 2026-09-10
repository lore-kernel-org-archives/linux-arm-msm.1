Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E66F43BFAE7
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 08:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789030397; cv=none; b=jLc0vScJ2GiRulGKgvMFFawEScn3kEKRcGcL1O48G45QWCGnTM2+RjkJyPyR2n0iIO2PPOHwCLlnPBLG7iG/sOdKHWz0ZTgo3P9e2uLUgpHLDir/tLAyAf9xR8KdokmwUCg1F9xd4EsYETWxXFWQXeOiIVjtbyYomkJQ2g30Y+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789030397; c=relaxed/simple;
	bh=d8KDuRYWR1jjdlo/NJSCtDW6e8Mhy/fYII5dmeq+Dtg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=qjkI38rlRLy7lQTAROSi0/J3K7eEdPsm9uj+p822jUBpDbV0mIUjzYAAysmcIrg17hfQZde0JgU9fgp6xxGNKR7U1XsvHdT5CNETfZhT8tEmtAmmmid4L6F2l95kAVEv7k2pzAb8JDwmK1k1cGRIP2gCQOb031Oe66SemU/Bg+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gJ+ZaAks; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ViQrMuSp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gJ+ZaAks";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ViQrMuSp"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A8pkvo474849
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 08:53:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=+nC3lJJpzf1gMhzYC6kkJn
	e0t72nVkii43gBGN+DZdE=; b=gJ+ZaAksNLEAtj4Tr8Rs+AWGDdRzHWq/4tzwDt
	x5z41CwffQGcYzkDD0FBf8mogNLos4R6wkgeanPUpNv3+SmwfY9G9foJvr7/JICt
	X/XL+x9mcuQ7D+xTwoE/eeRtC0S7DTI5e6DquBevYwLsIJZHRxU4TenZ1tPg59vF
	xISNSKDXiNmW/FvlvzQeI4hxZFhjRDrPOrcHabpRJtfFHtu/C93Ojs4ApXaESwHv
	p67Wqd5WDCaZpn16+aWVakBMOa3ve48QIG8TmDFa6LlVornE00qa4JWcTS48xUka
	8KATAGc188UpuSXoeM64CPuwmUWTIGIa4/B2vuk4TMOp/6Fw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcygty8h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 08:53:09 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-855f662439aso5211927b3a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 01:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789030389; x=1789635189; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+nC3lJJpzf1gMhzYC6kkJne0t72nVkii43gBGN+DZdE=;
        b=ViQrMuSpI8iknkrLZJ06Dwuj9aUYxVnDLYvokAMks9c+m5Ojk/xxkKsUtBaow3lSL9
         jd3oJPgVlWFs+3b6Kz3kQUR/nKgE+c8pqE+qxOvUbMCSEhPywp+eyhqAyqlQy+o7PRJW
         LPu89tNwPg72t3FGGR75SqCUisEzAeNBmgor54UmlafEOv2hFrjhphdiPb9hwI7yVsvs
         aXOA/9WrZfB8jsccUbj9mM96A4HwKkvVzQQph1QyHQ9T48wZJrzK1mTm6ogSll5BDXH8
         x0763A2sDOmbwaMnRqkR85Bc9GB4fu1r/YY5Ro/REt5sXEoBXVrDEZUBUqIh4fIRhRry
         Fq2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789030389; x=1789635189;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+nC3lJJpzf1gMhzYC6kkJne0t72nVkii43gBGN+DZdE=;
        b=YyghL8gLF6ViKRwtC6eYA7Eo5BDui0SDs53wEewVOeXpeCW2KdV/RLG88Cpl+CKfWa
         DbJDlVv0QoCri/8JO48l3ZdwkWEz8CVsXiYjfnhsVdw7E0dhd+ogVhLexlfAxsTFPejJ
         1cD31jIVQh/71sWzyV3TzVQgyLilOWwzDMqwpsyJbe1FPixLrqGhzsk9ekkeIYyPMEI2
         H4RSw/HEzWBfzLbSTwDY0aXQMC7pK0zyDWW6ZGMnS/MVXTzMnNNO5OrtKbxLEqmWkzpX
         /LgRhRrFitcsfiUSPrvjuRl+yU549rQFYgDZzHBQ1Huv6xvq4uV0+dsq+s2STF8WF26A
         wYEQ==
X-Gm-Message-State: AFuF++lPCyJe0yeWmHJVQRq188FAlB0cGzx7NDgkqVUZtyx9Q4zBHycU
	StkUaWZbHFnI0pNoRQWRKmCZiNRsmLyGooyRzZTlnGJTCSOGPc3Cw/XWmPH722MCDSioKlxtVwS
	VGPSHgg8dS+Hoez/cqXNNki4kbFiNtHWR74UixXDVeDWN4lXKM+oKwYtSRJ15hkJcLk5D
X-Gm-Gg: AYBFou2UA0bxIHWUNrCZYQIPCKPnhR1GwnkkyP4uZY6ms+otRPIf0+t7hIsC2NMLsqv
	TU03x3qyuuTWFZeiqFhjwaaY6OdLqPKavBUcG/Ls5xYGnQzgSnfeQYE3rDwhnPfoX4L12aphUdD
	RK78UJxJzlT6hVW65rIZYUXm1KUttQ4yL4v2XbROb23fRE4FFMVo4Nxe3ffPDfOCFpTpGh++wSI
	NfAOBP2/rHbKJeg5fxMoy+GRw97foQ0HN+K5A/SFFbqT3YWu5deNU2ctEXRZqeSPS7nO3I3mCLa
	V0FkmJK31ciNh2o6pBIbHI0WkCOMYvQq7P6IkQn6JH3ucZlCcTUdhzBKepluJOmd4BVCExDrUbe
	vyKTCKxScv9HmtapdUVlyRCkLgmUf
X-Received: by 2002:a05:6a21:32a2:b0:3cd:3e77:1dcd with SMTP id adf61e73a8af0-3da39d18cd8mr61113407637.1.1789030388866;
        Thu, 10 Sep 2026 01:53:08 -0700 (PDT)
X-Received: by 2002:a05:6a21:32a2:b0:3cd:3e77:1dcd with SMTP id adf61e73a8af0-3da39d18cd8mr61113353637.1.1789030388391;
        Thu, 10 Sep 2026 01:53:08 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3397d6d1c16sm12398722eec.13.2026.09.10.01.53.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 01:53:07 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Subject: [PATCH 0/2] soc: qcom: rpmh-rsc: Updates for RPMh read requests
Date: Thu, 10 Sep 2026 14:23:00 +0530
Message-Id: <20260910-rsc_read-v1-0-c9b7fa3cdde2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOxvomoC/yXM3QpAQBCG4VvRHNtaK7+3IondwThAM0jJvVscP
 vV+3wWCTChQBhcwHiS0zB5RGIAd23lARc4bjDapLiKtWGzD2DplMpfmBcaZ7RLw+crY0/ldVfV
 v2bsJ7fbu4b4fSd/Fx2wAAAA=
X-Change-ID: 20260910-rsc_read-27d689e37cb5
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789030385; l=1718;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=d8KDuRYWR1jjdlo/NJSCtDW6e8Mhy/fYII5dmeq+Dtg=;
 b=JpGG5HBItxGPWyBRer1pe3J8PlRVAUFf7qJYx4FyJufbPOWYJABbJUXmCQ+SqbIP4AJmQa2sm
 DBHIE0OKNMlDxSAj5I9OESkFmvtZ2YxXyqQbOVEWt8C40s64z14SUdX
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDA5OSBTYWx0ZWRfX8PRhBxvLmZdn
 TD0i6lFk9HL7PcONFas6RP+P4hx8hBEORYZ5fLOWB9WXViPufxz+mVU2DoS9Owb4s9sDOpvu+ju
 Jaa80NtiyAYS0wVCgwZJDcLd9O/RCipHEYG/34HMfvtS4KtMGJmvDjhR6lbiNPIIt2y9qzAZeLa
 1xxAxbeOvSVktHukElbnoZWjtz4D7IBkGCEFMSf9SgdsWrx6/JRuHSmoYkWb2MiAfGNbRbh6ZBT
 3rkxlp+kAsqcNvbEZtAjK0u1E8GsCk1XJ06SOqGRiamtBneVrB9/upbKLeRMI4FC2EtB0HNpUUS
 raUwKZ8mzM860VMu1yXdUlJiYB7xbL9hZkBdlBQcIeFcV2JODumO09kZYJlopaQg8HlHsha3LoG
 F3G8It6rJB5EzPn1M/wGxHlIgV9/MOhV8vSl3c2Tr9dXeZpePdoMd9JbLH4pXkbOgr9sQXitct9
 mtwpY0fWzd2CMOBoeyA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDA5OSBTYWx0ZWRfX4dXH22mPsphL
 U0SgsspKctOfxKe2DRcfPw+KMrcPLCJ+tMUcNrusMmnVLZrZOt4aX74alNamX1tXi+6nTeHEfp/
 QJOFvBee9WH3HjfAjLMDschbfj2pOHY=
X-Proofpoint-ORIG-GUID: NBVHudMuR8H5nAjoHiPUimAcT__2fPI0
X-Authority-Analysis: v=2.4 cv=VONIDNPX c=1 sm=1 tr=0 ts=6aa26ff5 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ts3Mm_KoVmGOfMA9V3wA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: NBVHudMuR8H5nAjoHiPUimAcT__2fPI0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100099

This series carries two RPMh read request updates.

RSC v4.5 and newer expect read commands to use a 4-byte message payload,
while write commands continue to use 8 bytes. Update the message length
used for read requests on those controllers.

Some platforms either do not support RPMh read requests or AOSS does not
respond to them. Issuing a read there can occupy an ACTIVE TCS indefinitely
and block subsequent write requests. Skip read commands on sm8150 and
sc8180x [1] returning a zero resource level so callers avoid error handling
for an unsupported read path.

Patch-1 do not have any dependency. Fixes tag is not required as existing
SoCs on upstream are all lower than v4.5 version. Patch-1 can be applied as
preparation for Hawi SoC support.

Patch-2 of the series carries fixes tag. I do not have sm8150 or sc8180x
to verify patch-2. If there are reports like [1] of read requests not
working on past SoC the list can be expanded within newly added
rpmh_rsc_no_rpmh_read() API.

[1] https://lore.kernel.org/linux-arm-msm/0a73bc50-71f4-43f8-9d95-14a763d63c61@oss.qualcomm.com/

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
Maulik Shah (2):
      soc: qcom: rpmh-rsc: Update CMD_MSGID_LEN to 4 bytes for read request
      soc: qcom: rpmh-rsc: Skip read requests on unsupported platforms

 drivers/soc/qcom/rpmh-internal.h |  2 ++
 drivers/soc/qcom/rpmh-rsc.c      | 20 +++++++++++++++++---
 drivers/soc/qcom/rpmh.c          |  6 ++++++
 3 files changed, 25 insertions(+), 3 deletions(-)
---
base-commit: c68a982815dcce5464e3bf2a31ac94f5146c04ca
change-id: 20260910-rsc_read-27d689e37cb5

Best regards,
--  
Maulik Shah <maulik.shah@oss.qualcomm.com>

