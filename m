Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8CB639A067
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Oct 2026 06:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791529131; cv=none; b=Y97Ly4SafNUHL1gnQnr299pT9e9F457foH3vByw1cquo7vqk5EImXpuU9hSqVhz71hpwQqE8TlSHJglAu3i5EHsGsZQzQcjzDTITQjPiaI7vSWbcagkYcuCN+K/XJ7nswy/U5K9TG47ajL+/wZ5ZOROqthQLRJV1G9ewPjhnQ1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791529131; c=relaxed/simple;
	bh=eKy7aW5cGjwegx4nzL/W7tmnNG2iMKFhFizCpsDBd1w=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=QFfGEdc3M3oVXJzbqiwtbYIr4kMTrgT8HYluECqKa5/Q6oKGPe/izodAc0c9C+HpL3grdKCgoDnRauc7ZsSNYrYxYtczSpMuWuijsVoAqR9dnlaKQyHaFcTmvmRXP/KCPmpxqvmeS4/xFEr/ZY3uKgmK2X21YxiN7FbeCmJf874=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y30A0ZqY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iliolux5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y30A0ZqY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iliolux5"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6993HggF3323271
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 Oct 2026 06:58:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=4EYWCqhhTUL7OpT9NVgvbM
	UnffT1MdTryqJzCFDDtL8=; b=Y30A0ZqYdd/gkzx6Orn0/OWeJBI9y+DesxeSeq
	bsLFBcqYTUWPT3/XaUeKsCrxVnVefwJyYnEAYMDbt4g7KORXWfehhAI9S+a7epT5
	bFcDtNnQOs1IERAavPRKBxJj+vR2E5XBEdUPzqro/rZWcMeV3FLwwipP6qtKZUPt
	nMBgzgSABJINDa2W01ylJzuLrJEDADxXt6v+kNKnZd1553uyDmQUNCH2u7YSZwoG
	3j91sxK+LDC0xyiP3RbTb3+1kZO2dVQ2oaHNfjTkZGqO6ZoI/7gyM5nKEr/agXtI
	0s8KF6PeQ5b0hYfpviyS7VpqFqCbuHAYOlxs54SaPcOW/dhg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6ev5ambs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 Oct 2026 06:58:49 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc7e0321ec1so6535049a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2026 23:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791529129; x=1792133929; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4EYWCqhhTUL7OpT9NVgvbMUnffT1MdTryqJzCFDDtL8=;
        b=iliolux5QcY8/cwrtEcZC5dcsQiY3efXw2fBUdZhEbQhcK/dJOTVMwLq2XEqAiE17B
         4XlS4Ph0EbUxWzA6N8GkoU8sO+yoJpLJHohu75Ap5Pk0wlQw+OE+l7YQFB43uuFOJsRA
         2QDQpIe0TIsl7PB+FHBDh9Ynfmzmj1xmxr4nx3F7Y3sI2uBmquF1YZZfwqttgL7fa9vC
         qB+XpxVVJ4uStdzzs5FUtWYR/EKjVsLQh2sdxm8HfoItSaw6cSTJ8cxOO+jJD5AWwQt3
         pfKDRTPBWPOumlUizEoTAL1ZLO/9Nj4V5/ZTG6qb9k7xz5BYZN7LIQ3ckFWvBstKkD4/
         dmeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791529129; x=1792133929;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4EYWCqhhTUL7OpT9NVgvbMUnffT1MdTryqJzCFDDtL8=;
        b=StklBSgfzyRzc/i/R7RVVQtGRBvtZWLCc4ld53aChRGFKNnWwf8/1XAWANmqyJQHBL
         Kk862jDfSQ5VmDcBdlEImpPc4n5PPA24CmgsDNhLjK9D9nCTRiqNKtYooaYuH/mYfmb7
         69yMfzYSH0s6G7bj/jGhy/50r+0/d4Y10Y9kbawhqn4Ts3fLZdv7igw+LNxEh1LnBY8m
         zITniQJnrHgFri62bbUxSZO+djrHkLwY6EyqN1FcQdg3mQgD4psxY7KEWpnqgfT0MjdH
         hd81yw/Bygly6djnf3U6XHabMqaDV4p9idSse/aoakUn9qVKJL3M0CNHKIO7ei7DeTtE
         w+jg==
X-Gm-Message-State: AFuF++mh79EARpPb7a2FQT+iIMM6e35NJyhbWDEaFX9vgyitoCEJtmBH
	3ksPSXzObm/ppBHThniinfyfC5L1jjEvQ2t5ZrslLpoSSgNEwkDAWCHdLs84HD1Dh0NbeS88pby
	aytd+WN4gUzvhzr5leR1z6UH9YjL9cJyiCiWxqrXPI2cfbewveqKVkVmQZzwcjeSo6yBg
X-Gm-Gg: AYBFou3bROFUWPu0qWriDkk2Z6hiUMfr1Nue32sYYn8QUi/aTCjTqAwS6bYEaEfZeso
	/woDD24dl8Uaxzm/XMb5negbiya2FZlx1GskIfR52n9Zpzifvn2wBxFAKp6+KmIvz2RTP5BAhtw
	PQTULN7G3GfF9fzX5mh8bsl0XJo9VmihmNmNn1WV9451Dwn1y5UrpUxX6GkcTu9BUNBkrJUPP0B
	snuvdWigijlISPK6kxXK6lkBkbio8Vw7dkJNKAHyN5m40a1iQ+2KyF/eVqwVpvM3g9NyI+XsKp7
	HdmIhLz1nfdsGz/CFQznSMLQJFWnmj2rWAZ+azYHPzkhWOdT+bjUfj4brQBUOuIxA0zddoS5fHd
	TV+Gf3SIqvXr2Bu8NKGMk
X-Received: by 2002:a05:6300:2290:b0:3dd:a007:cb2d with SMTP id adf61e73a8af0-3e16be44435mr752872637.41.1791529129191;
        Thu, 08 Oct 2026 23:58:49 -0700 (PDT)
X-Received: by 2002:a05:6300:2290:b0:3dd:a007:cb2d with SMTP id adf61e73a8af0-3e16be44435mr752839637.41.1791529128689;
        Thu, 08 Oct 2026 23:58:48 -0700 (PDT)
Received: from [10.213.103.163] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3d9e088efsm499980a12.11.2026.10.08.23.58.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 23:58:48 -0700 (PDT)
From: Naresh Maramaina <naresh.maramaina@oss.qualcomm.com>
Subject: [PATCH 0/4] tty: serial: qcom_geni_serial: Add GPI DMA support
Date: Fri, 09 Oct 2026 12:27:52 +0530
Message-Id: <20261009-add-gpi-dma-support-for-uart-v1-0-c69e728df686@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHCQyGoC/yXMwQrCMAyA4VcZORvIOlaGryIe6pLOCK6lWUUYe
 3er3v7v8u9gUlQMzt0ORV5qmtaG/tTBfA/rIqjcDI6c74kmDMy4ZEV+BrSacyobxlSwhhbjEN1
 INPiJPbRFLhL1/dtfrn9bvT1k3r5POI4P6CsuDYAAAAA=
X-Change-ID: 20261008-add-gpi-dma-support-for-uart-53f2500368d6
To: konrad.dybcio@oss.qualcomm.com, Vinod Koul <vkoul@kernel.org>,
        Frank Li <Frank.Li@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Aniket Randive <aniket.randive@oss.qualcomm.com>,
        chandana.chiluveru@oss.qualcomm.com, jyothi.seerapu@oss.qualcomm.com,
        praveen.talari@oss.qualcomm.com,
        Naresh Maramaina <naresh.maramaina@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791529122; l=1956;
 i=naresh.maramaina@oss.qualcomm.com; s=20260316; h=from:subject:message-id;
 bh=eKy7aW5cGjwegx4nzL/W7tmnNG2iMKFhFizCpsDBd1w=;
 b=l5g/hTqngweTjeXJIqJaTcnNRfYdVfYBFtN7DqdkZc4UXHijLsdkAC3AjuumT3OhIdAiqJ6ZU
 Plx4SATFpBkD29JmeH6qNbeWpJrS/0Fvs3e5ThsUDEZhULKSLlwF3A1
X-Developer-Key: i=naresh.maramaina@oss.qualcomm.com; a=ed25519;
 pk=j7iST9yrLbsgWcWrqdlUNIOWl2WBl4wV1q35/n9SCkg=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAyNyBTYWx0ZWRfXyND0LGukPzN5
 PXORDmDPX3cOtAxZmiWLvXeAdIYZombkW3PpHjN5zkNRvgwJPRgfaAnFcBkto3eheexwPd3nXuE
 TqmetaYBLg8GYCBHO0h7TlPM2T0VvDA=
X-Authority-Analysis: v=2.4 cv=MMT1C8Zl c=1 sm=1 tr=0 ts=6ac890a9 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=CXWnIO0hCF0je_3tyHEA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: xgmgrCqbUdwiAJiHhOP0p2di0v3_48xU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAyNyBTYWx0ZWRfXxcmo3opPGoet
 6zE7XlRNzxoQLrRzQEhNZlyid2VOq1rxcEi1waQA0juXe/I0rj/5KNj+2s//iOqmqHoTywoGqnR
 i+Kj+hyDK49jUOd2q8I2DiT9ztRgqxPWHFVDBj0voZRwQTKgf3Ie7rnz9fsjSWIaCK3RuziTEiD
 c4Xv9BGma35Swps3bIBcMNHb6dJvfT389pceSK5KE79zRtCYCgKv9bPx/Vz2x9d7ocyA6TXl5kz
 NLWq7cJLrRDq0ZNakjFUubdO9FHkJ0VfxpNbIZ02ndpp/Brf5jKGMdkg91DWiv2KKsQ5YdVgTBa
 OcDVHfmYeKkru9EX9AXUPEOtjMnIPR/lN0MKYk5XCDP4hvVDsD5maOuWD3aDCM6AbX/48OlwWzz
 Un8HcDw30YhbjsODWx8GLwl4cPENy+TLNgKDtZ6IglmH5gpNiiFAVVXkDLQzyM15Hxr903baccw
 rhdxogQqS/D5/Lnj17Q==
X-Proofpoint-ORIG-GUID: xgmgrCqbUdwiAJiHhOP0p2di0v3_48xU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_02,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 clxscore=1011 spamscore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090027

QUP serial engines support FIFO, SE DMA and GPI DMA transfer modes.
The qcom_geni_serial driver currently supports FIFO and SE DMA modes.

Add support for serial engines configured to operate in GPI DMA mode.

The Qualcomm GPI DMA driver is extended with UART transfer support,
UART-specific TRE accounting and handling for transfer-completion
events generated during channel cancellation.

The qcom_geni_serial driver is updated to detect GPI DMA operation,
manage UART transfers through DMAengine and program UART parameters
through GPI peripheral configuration.

This series currently supports 2-wire UART operation (TX/RX) and has
been validated across multiple baud rates and transfer sizes.
4-wire UART operation with CTS/RTS flow control is not included in
this series. GPI DMA support for CTS/RTS will be added separately
after implementation and validation.

The series is organized as follows:

1. Add UART transfer support to the GPI DMA driver
2. Calculate UART TRE count per direction
3. Ignore cancelled transfer-completion events
4. Add GPI DMA support to qcom_geni_serial

Signed-off-by: Naresh Maramaina <naresh.maramaina@oss.qualcomm.com>
---
Naresh Maramaina (4):
      dmaengine: qcom: gpi: Add UART transfer support
      dmaengine: qcom: gpi: Calculate UART TRE count per direction
      dmaengine: qcom: gpi: Ignore cancelled transfer-completion events
      tty: serial: qcom_geni_serial: Add GPI DMA support

 drivers/dma/qcom/gpi.c                | 153 ++++++++-
 drivers/soc/qcom/qcom-geni-se.c       |   4 -
 drivers/tty/serial/qcom_geni_serial.c | 576 ++++++++++++++++++++++++++++++++--
 include/linux/dma/qcom-gpi-dma.h      |  33 ++
 4 files changed, 732 insertions(+), 34 deletions(-)
---
base-commit: aac26bee2287c88af5be5a5ff96d783b19a28790
change-id: 20261008-add-gpi-dma-support-for-uart-53f2500368d6

Best regards,
--  
Naresh Maramaina <naresh.maramaina@oss.qualcomm.com>

