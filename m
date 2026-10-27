Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793078005;
	b=B64gqQj+ktc4rnXB4NDTAlVSGNoyWpjHX8na63uTYbWZn3rLF5fC76XxOy2VT7liaHuR
	 +/lkSfWZf3OvFUAxpypixfpXI8aYXdOip7Qic9BIDDUj4GJDJaMgu+gKWGBl700wbWH4R
	 3ObjGvaFca5V6bDZO5diPi1UKsI+T3YNTlAoJKIlOu4e3gCs6jXU4mpMoNJAHSfU4Owq5
	 mKd7kTjjbhZOhtGcT4IEy2rgh96qVpvfvUlXvZQy9oclPddZkjDpemLTAM7buF0sGq3EW
	 s72jUlIPWT+tVTx5m16B5IbIViGXSku0lFDO5YCNKyD2ZsV8yJ/XzacX3qGEupfVxNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793078005;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=MarEIKFbQwA9h6Hy1ZNcr17QnNWznQahW2ON7TrWhXM=;
	b=pdVHvlKAyeExVvBbSOt1NU8GpUuQOzIHiQHkGFfH5axc5bYFu3j90rXfc7+cWlTDdG8k
	 3qdb5H9kfAfSmaJ//y22c6Jz1cwo61L0njx2GpDtVHKKE0NMA3hkmdvP6ujfd783Wt4lA
	 rdQpW/8lCYJbmM0+3pA4hIl05Gf5n6vhWkEjmbG5F/3ufLRVDclFLOOiG+lQDc7d6LB/2
	 ZPOmBnEhqZ+lRtKvMIkal9zlW43ClIsaNay+lJKHbCepI6gBfe0GovaKTVq5XQeBLzCws
	 yFe23KtOOpqZYhL+hUByRNk02fYRv+2YhbQFCM6v4FTY2XKQ8gsacG19UrkgBCn40tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GXInQVsc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BVdbmptb;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93729606A31E
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 05:13:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93729606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GXInQVsc;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BVdbmptb
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69R2F1IV321997
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 05:13:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=MarEIKFbQwA9h6Hy1ZNcr1
	7QnNWznQahW2ON7TrWhXM=; b=GXInQVscNUjoLeyZ0knax1ZMh01UEqjcmjclZB
	Ij9qQYKae5YoeymMqN6TycwNwBxYeyrzGZ/GMnWWUvqYP6XKa/0yszUba8L1oHJ0
	6/NrtlWButpp82x9LDk2znEZu/XBISZBpQRsJ+PNA7iTMzOOM20WUkqQ2Z4eJ2HI
	Bg7TXGpoKe/0LFJZSo8LsgchSlshyUPPCJM98yiujHc33n7yowxCwP4OZ8absyh5
	hOeQ2bNP7MfAz3GiRF1howedSn3P0J8pBzjgs+6OTE/EtP7D8FrlAHCa8s8CPKu9
	twG8n2/7hejuuy6Nx/3G1kHJBAN7nF7Ep3j+zG65b+a0QxmQ==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjbmma0hu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 05:13:23 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1665200f4c2so4728320c88.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 22:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793078003; x=1793682803; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MarEIKFbQwA9h6Hy1ZNcr17QnNWznQahW2ON7TrWhXM=;
        b=BVdbmptbIDBnxzcw47989D+U/lURQvLS59KIqnf2H8b2uzBYJisXzn0oNXzBrUq+XV
         K3OMBULA5nd2yOS2gmYgaUh/y9way32ODsEPpWk0dqITij9AC10zsWW7psD+C3Fll0c0
         awpQC3W/D+IBfTlz76eE1h5DIijBLGJD0wicW7tRTM4reAEvljcr/DRYlw3/7ZSIeL8c
         p9c4Qk0CqUfeuQg40poJSpOox1gVitx7mbZBbgxDR3gQn1/8wgXCW9r3S+DMBcO2JlWq
         /yHNsWq3yp7SRWlVfGgCkgHsJ8za++iKjoBlt/sMZeY1Wy0aE7s5ENqtRry+5+xEAOJj
         HCmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793078003; x=1793682803;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MarEIKFbQwA9h6Hy1ZNcr17QnNWznQahW2ON7TrWhXM=;
        b=UUCRCquNitdj2MsatNSWg3zmCtTaqj9hUMfcY9BdipAZk8fJQNUV13YiY0vk6tr7jV
         47NWUHSQ7eVLFgJ247cyfGdfrddSljyIK0MlF6iKOlpUHCyQEYoZ3vXtGORWvo27ULhH
         a6RSK6FRe5sTwYcC8RmZaLUYzXCBo5TmguQCbG/bU1Ad9QHGHbwqesi9oehnfhST5Rfq
         YtshYwp+6jNSgLnwQdzeB7PXPmQoDyDI/RZUwTt6W8KkV9EMktHYwRI2Ih3/gJL9dChI
         MOa/2X/W8EYg1WI8WxYwh3qh2jybTbasZWxw0OJYLUQthOm92oagrh0rihj/WBf+yXxT
         3Gpg==
X-Forwarded-Encrypted: i=1; AKwUvBz065pCMUEkqqFWtAPv+AWNmrKES66pXHz2Gosoa7FuiA1TbBe/r9/6wQPMFNkkvi0CfOEmwLvNE4e8L1cK@vger.kernel.org
X-Gm-Message-State: AFq9FYIUy2bY5rv/npZ0004xIkNSzk6inSk9MPJiO2cqap5kLkTJFe/K
	EeD4A5p2WLFdffLm1h5gkbuTZQAJ+MoIXr9NyTF+RSm1SBgP+LqCrQS5YbpsMjrJ1XvUR5mTjEH
	afFS3rHAqmSucMC05mwafy/icv+4+GX/Fp30NAT4f4ug4gxNzAjaO09vsfhbdDw5qGyVD8TCLj7
	l1
X-Gm-Gg: AYBFou1Rak+9rwhaLxaHCqkUr1AIJvtGaTDVv0+bIl5C3OO2AD27IDpAfUoBIqQ8dH3
	d1XlbrFnIdrKGKZp0ky6If3IifXcc5FVyeTzelcAzqiGyl9hMn33m955Y/Uj/xXPvdrS14FbzUy
	/c7/XuvO0awOKD0uQJIjblg68r4T84e3Z6qL3QmYjoJTKZ3zA06CwseYt72I9m9pYs+qu9TByIc
	d54kn1lFZFDLH3xi1Vnq6VlngJMCHaXylefK3eTnM9KsYdvObZqcPRrtkSofVVDO6VZ1lCnq6cg
	sBpJ0cIX8hL5hOl8414cMQgJFOPYK2As9Inu0UgvPkU968ZiB5OAamIJAC+ddNpFtbziaYHSX2M
	WI8UbWasCe7uLjGuSkgnHlbw04hW1ScUvkQ==
X-Received: by 2002:a05:7022:b0d4:b0:14d:3c0c:79e8 with SMTP id a92af1059eb24-19934e7166bmr10591548c88.10.1793078002798;
        Mon, 26 Oct 2026 22:13:22 -0700 (PDT)
X-Received: by 2002:a05:7022:b0d4:b0:14d:3c0c:79e8 with SMTP id a92af1059eb24-19934e7166bmr10591519c88.10.1793078002146;
        Mon, 26 Oct 2026 22:13:22 -0700 (PDT)
Received: from hu-arandive-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a249c331sm62298866c88.17.2026.10.26.22.13.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 22:13:21 -0700 (PDT)
From: Aniket Randive <aniket.randive@oss.qualcomm.com>
Subject: [PATCH v3 0/3] i2c: qcom-geni: Add I2C bus recovery support
Date: Tue, 27 Oct 2026 10:43:14 +0530
Message-Id: <20261027-20260826_aniket_randive_oss_qualcomm_com-v3-0-7f2a6e572de9@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAOoy4GoC/42Owa7CIBBFf8WwFkOHFqur9x8vhrR00FFb3oOWa
 Ez/XdDoyoWbydzk5txzYwE9YWDbxY15jBTIDSnI5YKZQzPskVOXMgMBqhCi5vkRNSjdDHTCUft
 m6CiidiHo/6k5G9f3Oh1el7aylVRSQMcS7s+jpctj6nf3zGFqj2jGzM+NA4XR+evDJRa5x15rn
 MDodgrao3ER/ZXHgoskI61As1a2Ln+SweplsEqH5ZUIb04hQH6vHyHxN7JaQ1tWslP2A3+e5zt
 LuSdIQQEAAA==
X-Change-ID: 20261008-20260826_aniket_randive_oss_qualcomm_com-84f5f536302d
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: naresh.maramaina@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org,
        Aniket Randive <aniket.randive@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793077998; l=2681;
 i=aniket.randive@oss.qualcomm.com; s=20260325; h=from:subject:message-id;
 bh=o1kpDOqfPBPXbo5TDZm+ulJUUJzq8+gQRhql7a3zJW4=;
 b=HwCvHxL9FSP0kbvMu/177jOQ2MKmoI/8ttmgetmO2QYu+emxG4q/hH1eyBOB0jSuQTQ21OirI
 aoQ8v1Bwh5jBgHBZBdjeFfFFMNr+opJSzWtZ/oT7MYolW8o0tHQjtNO
X-Developer-Key: i=aniket.randive@oss.qualcomm.com; a=ed25519;
 pk=4o37X1ZqGbCO/T2SR8kq/HnWvq0yb1RUlFuNukovbQk=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDAyMCBTYWx0ZWRfXyprz67RycECT
 WGFJefxzsQGzgUSyOP6an+mRd/KzzBNJVRZ41L+PtLvKh/1hvKtzrH1eLv5Z67Lo5EsO3UAgXns
 9vrsXryFRF5+A6ujN8kj8izSnMknQOA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDAyMCBTYWx0ZWRfXz7hycKScwRgS
 14twIHRhu70wPWL+/8TXd3SjEA02tkV1E2w2hd5M46kDvoUSyRm4ekfvgu3BNRtYY6YFgVYu75V
 KgR52Jm/l0jNkcNtHXEcoOrA1+dCXxbFYnaF6yrUOk9qbAR2ecy58DCNTLuW6CcPC+3+0LrmT7z
 JhsevtpkAR6L8l/JUSf81nWl2cfiNY3Zm2HT2IjwbufezyRezIQsECUzfcQ5jI/rTgb1b+O3H6m
 PUmHVuF/mU7k8kF0B3SkQJqDyKz6A9tqT6g8OVG/NnD/SAT/Vg0eLHJXl9kbtU0q8g1KAssW3jE
 xMr883xmCeQzI8NKaSkZWre151okH0SsqA8etPea2PGnXcxDfPjur6pv60VsERBKPta9rwqF9Hh
 UKeoRp5PbgLxQ2/P6OT/5Drr+Z1F2G5NkkmfU7XxF7U+mmsRrtk9LqAs6FmbOO5kOfVpstxQcdk
 SzjTwJBxfdcTi9bq+MA==
X-Authority-Analysis: v=2.4 cv=PrkG/AM3 c=1 sm=1 tr=0 ts=6ae032f3 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=5qjwvz7LsgNgZhFB2CoA:9
 a=QEXdDO2ut3YA:10 a=vBUdepa8ALXHeOFLBtFW:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: H8zpHsyu90HndpCaaNNQsz9fIfskON3L
X-Proofpoint-GUID: H8zpHsyu90HndpCaaNNQsz9fIfskON3L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 impostorscore=0 clxscore=1015 adultscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270020

An interrupted I2C transaction can leave a target holding SDA low and
prevent subsequent transfers. Add recovery using the GENI I2C_BUS_CLEAR
and I2C_STOP_ON_BUS opcodes in both FIFO and GPI DMA modes.

The series adds zero-payload recovery opcode support to the GPI DMA
driver, registers an I2C bus recovery callback, and triggers recovery
following relevant transfer errors when the bus is not free. Recovery
checks both SDA and SCL and preserves the original transfer error.

---
Changes in v3:
- Use the adapter timeout from the FIFO recovery patch onward.
- Configure clocks and timing before recovery, with PM cleanup on failure.
- Remove unreachable GPI error checks.
- Log DMA termination failures during GPI recovery.
- Preserve GPI timeouts and stop further recovery commands.
- Link to v2: https://patch.msgid.link/20261023-20260826_aniket_randive_oss_qualcomm_com-v2-0-93572b453d6f@oss.qualcomm.com

Changes in v2:
- Rebase onto next-20261006.
- Move the recovery opcode macro removal into the DMA opcode patch.
- Check both SDA and SCL for bus idle and reject recovery with SCL low.
- Share the bus-state and recovery-trigger checks between both modes.
- Guard the current message pointer when checking data NACK status.
- Reuse the FIFO transfer abort helper for recovery command timeouts.
- Use the adapter timeout for FIFO and GPI recovery commands.
- Preserve the DMA configuration error code in GPI recovery.
- Link to v1: https://lore.kernel.org/r/20260826-i2c_bus_recovery-v1-0-203f0ec76f84@oss.qualcomm.com

To: Vinod Koul <vkoul@kernel.org>
To: Frank Li <Frank.Li@kernel.org>
To: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
To: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: naresh.maramaina@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org
Cc: dmaengine@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-i2c@vger.kernel.org
Signed-off-by: Aniket Randive <aniket.randive@oss.qualcomm.com>

---
Aniket Randive (3):
      dmaengine: qcom: gpi: Add I2C bus recovery opcode support
      i2c: qcom-geni: Add bus recovery support for FIFO mode
      i2c: qcom-geni: Add bus recovery support for GPI DMA mode

 drivers/dma/qcom/gpi.c             |  30 ++++++
 drivers/i2c/busses/i2c-qcom-geni.c | 210 ++++++++++++++++++++++++++++++++++++-
 include/linux/dma/qcom-gpi-dma.h   |   2 +
 3 files changed, 239 insertions(+), 3 deletions(-)
---
base-commit: eea3fef32a9cf36abcb5975a5a594e4135a6b026
change-id: 20261008-20260826_aniket_randive_oss_qualcomm_com-84f5f536302d

Best regards,
--  
Aniket Randive <aniket.randive@oss.qualcomm.com>

