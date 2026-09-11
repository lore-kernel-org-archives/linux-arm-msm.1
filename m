Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EF5D468C23
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 09:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789117716; cv=none; b=oJNdzYamXJ35YKYS4+XRSmXHdqc+8//seYUA64nsP+BhUptVRSnoqFLMw70sL/pqB/Ms8EzAQsteL+ztmQnSH84F22I10Hfy/tWOOU8fRj2CwxtuqyOVSQM+71ABzmGyH3EZwcr1Yd0mbMRfZ54hHx2YFMW8dKIqR3J/nYeaxZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789117716; c=relaxed/simple;
	bh=RLnxW65ivjishoxMlttpjv9dgI6w10qF4H70h00weMM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=lDjROs/riBf7rzIuMkoxTlBZruom43mYpB3WuzG0DCLhTU1MoPskXp3jSTGGEBumUQ/UvntoVn6umtRKhAAGP/wORN5oPjEi291UcQKLp8Hd1Iwokq46TV+wS9ojrpbtingpqqnthSh5eTlDOeWbqQN7S58vY8QBjZcYuJuN/lQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QSdaSJZJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jxeK/+vJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QSdaSJZJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jxeK/+vJ"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B7l5HS3017652
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 09:08:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=2TEKpFgj0NQRB3u88e14uT
	Iv7Vzw39LaDFD0hVsSQu0=; b=QSdaSJZJXkcKy5AAAdCt3aPyj7KRZrJql7WtGn
	+D+ZA0fMOmIwwcPH3wUXQUsZGBAhLv+AbbG1Pdup6q3/OA9jYNal0rdxiq9xRo34
	kykVSBShqDoWU2jhtaZfzzsaG2ipIxRrdAOZDOi7nTFsBqxtqXBSC1RR31whc4on
	rn4GqFBhjWFHCITC/T43KmiGSwDDkr8s0qNfdFr9olIkLKIYJetenJYj9Bnsb2XG
	piMCv8DT1MB+cPJAU4yrXFwswArzgX/S1pBgxbCsNCqK0zPZgguJEsAHxJjN9Mqt
	O5ynEL70Mfckhx58eAJBKqFHS0Q+Xmq+5lgZnMDMAX286PTg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkwvx4cyy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 09:08:33 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39b77130a7fso1227869a91.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 02:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789117713; x=1789722513; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2TEKpFgj0NQRB3u88e14uTIv7Vzw39LaDFD0hVsSQu0=;
        b=jxeK/+vJOdO1zZYWsAoQiuGNNS7IeVo1APywm6NXY2uVC59Znw5CERCumvrZxhXWrj
         mGqc43ts+qEGTnk0qQKbNqkx9+q1PWNylcs6vDiyyOCtn50iGlATUPWeZXKWNBzDw6z7
         vZYcr5oW60CoeWeOTWJFNu/hXHWqgTEpoQs2An/M2swAzBWhi2qSm5RADrMATyj/y3CE
         mTE44sVai8vcc45vYBXH1+Gp7polrhe8WO9PyY9iSNjZGdijfoS+SzJEh0/QCvEt7igX
         lenDjYyUlRbPuI9qDjHeh/F1mI5xM1gvemmLqD1s2OO+KiiRyLrTqrnwkUlF5xsQWLM2
         4Utg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789117713; x=1789722513;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2TEKpFgj0NQRB3u88e14uTIv7Vzw39LaDFD0hVsSQu0=;
        b=XCE+FMFab7qljc2nYGAIA4USSLvgdF8XTKudz5rwYV0XS5ca7Hp+ga/201NKlls4cF
         PljpIWn7klSP4Crk1p2hZ2ga+XeocpnwA6mJAt6biLiOriu+zk0knoV68tEePchCMZQ0
         ccceMMRdxlu/zAmgvb9TBUrSAIJ2drvJlJkpYPqw9e9+sSLWhFGGYQwCq2sMrBTXPO6m
         /phoTM43l2ZdkCd8LGryAI/jV5hhFQvw75ujGGcsJtdPbY2CgDcNvnbkQL4Yr3WKSuv2
         lzse3BTvzkZE0LUHrzqVmbopYVHZigRe4JiHaPVJ46u+T2nwRLTYTvglvnNMSZl4Bf82
         2c9A==
X-Gm-Message-State: AFuF++mQgLHNQg1XgWqQ+lIaK+zMswpRfsNPrbTaXoSab03JA8e4ktSk
	Blw4moZ0k3pdVjdFVtIU+3Rf519CGxRVblM1Mv//r1tC4bwY/358AzkasiIbaIYA42W+00ISjjG
	KyyrVaVgcptt+G5Ygv5EzVxpCrghDpC3jcypApXK16kMKgh9tKqExeoCmK+nhgp+/qz1b
X-Gm-Gg: AYBFou319OXcPI2HLzSuOKVF9dKwret83Kv66xS5jH6tOxRkAdXfQMhGwMPTBg4d0IS
	hZA9ASAjwLx6qGBML9VnESiS9mqu6848wH/ErFSFiSWqTQxJt4dn+a6tR2yy1a70zVy7dSphvSo
	Yes9h0zckiD+91GoRx/8zJhTPXhoc9u0km97qee6bWrpPyGGvVSRKqzSOO3whGI5E8tEc8YQATB
	uJLoIsh4B6hnN9OQmSVmqbkRzkTkdgRjIf+OL0qlxlkKyMBnKdd57e/GwSQKpskPcGAHHcMg8WQ
	TG0Fuza5Hz9QfS9H1FTTWtB3ypYUO6l8N7jSPAZbvuRV3LvK51Fqzlqty0ColNI1Be5YmICKkvv
	Q5dInXWVy+phP0JxRAJKWCtYPsU/E
X-Received: by 2002:a17:90b:51c3:b0:398:9bd5:490c with SMTP id 98e67ed59e1d1-39d9c2276fdmr6226503a91.19.1789117712761;
        Fri, 11 Sep 2026 02:08:32 -0700 (PDT)
X-Received: by 2002:a17:90b:51c3:b0:398:9bd5:490c with SMTP id 98e67ed59e1d1-39d9c2276fdmr6226452a91.19.1789117712329;
        Fri, 11 Sep 2026 02:08:32 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f82c69sm5040447eec.27.2026.09.11.02.08.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 02:08:31 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Subject: [PATCH v2 0/2] soc: qcom: rpmh-rsc: Updates for RPMh read requests
Date: Fri, 11 Sep 2026 14:38:12 +0530
Message-Id: <20260911-rsc_read-v2-0-98675c248278@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAP3Eo2oC/22NwQ6CMBBEf4Xs2ZJSIogn/sMQU7aL1AjVLhAN6
 b9b8Oplkpe8mVmByVtiOCcreFosWzdGUIcEsNfjjYQ1kUFJVcgqk8IzXj1pI1RpilNFeYntEaL
 +9NTZ9z51aX7Mc3snnLb+ZvSWJ+c/+9eSbd6f2SUTUmDVlp3O0RhStWNOX7N+oBuGNAY0IYQvC
 gVZF7kAAAA=
X-Change-ID: 20260910-rsc_read-27d689e37cb5
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789117708; l=2406;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=RLnxW65ivjishoxMlttpjv9dgI6w10qF4H70h00weMM=;
 b=jvEzWanianNehZipJW0i7ikBe7US2iDblPilhWr3jVa28sLUMGDY20R1kxj4pJt26MIQyhMby
 e5gS1OXv2bpAPpTYr1MYrzzo9aWPbjFvHUwqrEEFGllIUR+yHH85m6R
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDEyNyBTYWx0ZWRfX7V4GU2qwQ7v3
 +WR02K4Ke1+aMTeDc9GzHbnU0y+R0VScHu0+Y/y0n5jRdB4gU7JLHRV2oUuwb+e+d7jLF6OxutS
 g78r+STo/fuk9MD2N2YdpWzc9qIUmrI50T3R/tX/SDU5U+EP7DH05BYhcLCTs9uPOr0wtW3u95Z
 SG9tHkdaKNZH+ZH+G36sBsaPpTdbhWCHsMYMuqmQC+NkvaWiAvHqYOw0KBEjEuJBnZ/YfLmy8oY
 vnDQI7MIFKh7AJ5qKXXyeWu1GlwhmOidSEvINcCLwV1Dm3603j8peRvGEPk/hoTXPOJLW4KDMET
 dgmt2rROQJc4ilPho/luBkFqOVs+0ipZCVmgvZZDilzm6es2UrkUnvrWlbNdtRSXFUjU8DP3aNG
 TTbNBCQpHW9owUUiKxj1KLC2h8EhYn9np0UcRBYL4cpnNu/u5qmyd1KARwuGk1tpiEnh7nT1/ag
 LR2mT5wROUOU0UXg3UA==
X-Proofpoint-ORIG-GUID: IXPJte0Ef6dsXg73rOpifoG_MDts98jz
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDEyNyBTYWx0ZWRfXxg7YXiziDgOI
 Ejh2JeevdxdBgiIZYA7ol/JGtuauCV68QVWa/x+YMURdnP0ZjXUyCnK9ibhxOY5OhcahQaqIBd+
 nHBbgLczZssudl6hxqLfjc3Kt2VI5Dk=
X-Authority-Analysis: v=2.4 cv=AdkkjHXG c=1 sm=1 tr=0 ts=6aa3c511 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=4iiegGfdhm7NJzgoUiUA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: IXPJte0Ef6dsXg73rOpifoG_MDts98jz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110127

This series carries two RPMh read request updates.

RSC v4.5 and newer expect read commands to use a 4-byte message payload,
while write commands continue to use 8 bytes. Update the message length
used for read requests on those controllers.

Some platforms either do not support RPMh read requests or AOSS does not
respond to them. Issuing a read there can occupy an ACTIVE TCS indefinitely
and block subsequent write requests. Skip read commands on sm8150 and
sc8180x [1] returning a zero resource level so callers avoid error handling
for an unsupported read path.

Patch 1 has no dependency. A Fixes tag is not required because existing
upstream SoCs use RSC versions older than v4.5. Patch 1 can be applied as
preparation for Hawi SoC support.

Patch 2 carries a Fixes tag. I do not have sm8150 or sc8180x hardware to
verify patch 2. If there are reports like [1] of read requests not working
on past SoCs, the list can be expanded in rpmh_rsc_no_rpmh_read().

[1] https://lore.kernel.org/linux-arm-msm/0a73bc50-71f4-43f8-9d95-14a763d63c61@oss.qualcomm.com/

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
Changes in v2:
- Define CMD_MSGID_LEN as a field and use FIELD_PREP() for lengths.
- Keep the read length selection explicit for RSC v4.5 and newer.
- Keep Tested-by for patch-1.
- No changes to patch-2.
- Link to v1: https://patch.msgid.link/20260910-rsc_read-v1-0-c9b7fa3cdde2@oss.qualcomm.com

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>
To: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

---
Maulik Shah (2):
      soc: qcom: rpmh-rsc: Update CMD_MSGID_LEN to 4 bytes for read request
      soc: qcom: rpmh-rsc: Skip read requests on unsupported platforms

 drivers/soc/qcom/rpmh-internal.h |  2 ++
 drivers/soc/qcom/rpmh-rsc.c      | 21 ++++++++++++++++++---
 drivers/soc/qcom/rpmh.c          |  6 ++++++
 3 files changed, 26 insertions(+), 3 deletions(-)
---
base-commit: c68a982815dcce5464e3bf2a31ac94f5146c04ca
change-id: 20260910-rsc_read-27d689e37cb5

Best regards,
--  
Maulik Shah <maulik.shah@oss.qualcomm.com>

