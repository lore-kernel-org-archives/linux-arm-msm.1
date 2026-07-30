Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34FFB433040
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 14:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785420513; cv=none; b=OWWX2ISVhF7vNPd/L+O6vcUOkyVJhz88q3Hxs8cd4b+SRo+BXBadHC5B6RFFD9GoDhDne7NweudICsdqJHZWwz6hOj/7g1iCFnN+Eq1zwy5M2YXuUFo0afiCu7RDiuZz998Xv5izk3Zj9LqvrwaDj9LcSxmtYCdyX+F32DAmFYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785420513; c=relaxed/simple;
	bh=N4WUaW0leau09Qm1oQFxmQwqNNLNe9bIvm5O3TptXw8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=qe1RpFuuZy34o3tCEAYpLB+GRWVJZT8TDEHk2jzXCj4OLRa65Okr/phzEK7nfPdYPa7RQ0DacrifEDMKakpzQxBs717p5rOwQXdC07expWIEPIHcOt5ZYF6Y8+bJXMxms/uo4VLA+AAat+7XoeB3X1aPGwzY9MQgZ6L6LKrDf78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JubaFR1J; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qw7tqfmW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JubaFR1J";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qw7tqfmW"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UE2HhY1482631
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 14:08:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=FzXKQunnkcffcLROuRV/KifhCS2DYueWrZV
	+2KKnAtY=; b=JubaFR1Jvq0WHLxxQUFChlcsmtmUOT7yF9xeMo/mazjpRXIw61o
	Krj0eqIYo38mrcYtTFZLhbBtwRh0/AiIkzF3Bp/FG/j1LbbKsJaKAFq9iFMPA+ye
	U8QpXGhCWUhVvo4Idgnu5DOuRCISLnJSLG27rHj46jC0RPugv5U6i0ViFtYhjUzt
	pHg961vxh9goIuEIdoIxqp8nlqQo7Nox8BeKIKDYcNpJRBrfQoAF2vN32VgsoUeL
	PH4gECK5WN5qgfIqMlCBGv8QPp0L1oa/kGNKcns5+GrFjczDrMeqmi5/3IuTaAsV
	S7ylC0uyPasTLZxIP+gx/5h7KIOIpIkNZew==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr815819u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 14:08:31 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-9083b049f73so1351406d6.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 07:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785420510; x=1786025310; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FzXKQunnkcffcLROuRV/KifhCS2DYueWrZV+2KKnAtY=;
        b=Qw7tqfmW4ZCRc0Lc84NbSCMIXFzfoCfbFTXkEjZk7gMwDLPXoCOtLxIyyK24HadF19
         p+9z2bDzLG4WiEPHrywfxqQhxXCKdbyz4JN7M0b5iQAa/mPWBmDcqt4w/YxXA4LS7h3v
         Xybswju4coxb99cgxQDG51LsKmxQdu+yESWf7ZOJz4CW5x9CKQAJLUdAM6vlbAB6nGlM
         NRPfveH0wtgPE0P5lAA6ZmIVPgIZBMxOgpD0sRh3NPqRxfkGtmpJ2R+WF8rh58va3Ofk
         yZ5gJar7bHHooNhYKHk9JoMOCfz9eHydBVPJIXmhMMvKwPxHLCfpVm1iemUQFmGCKUYH
         h2AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785420510; x=1786025310;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FzXKQunnkcffcLROuRV/KifhCS2DYueWrZV+2KKnAtY=;
        b=m3AC0MNUp7huFWgyJfF0p4r3+ovHGug7UoMbBkQtWWxR4QSfClWsqILzzGFTg0MzQS
         ik1cAlfNoq7vgc3BF2sJmOSnvUUyC50w2eGe9VjIojmr+bscad6ybWPIA2vft+pXAd/U
         Jfx729y1la8hEGwSar/wJR2sm8SCJFkXW30BLAXRV0icF+FvwH57CGx4yOIVmfZzqX0u
         8caH5irtc4ftSk42iT2cBJTviVnb1VJsMjpL8iDdKJPX30ZPrw/QGLrXLq3UrTakjr4R
         OEN/PdLnq7aE0fmdrrbn4m4lhjOkEeHPE0UARfkrEZNg+c7R3tRkxCvyrY0qYJFvk8KH
         eGow==
X-Forwarded-Encrypted: i=1; AHgh+RofyZI01K/72MYCeCmvqDqgiMRIGuOKnuItHeWM7++HPBTg2u3KcZ0TzC7RpWcby+lh0rRW+z91fVXIa71k@vger.kernel.org
X-Gm-Message-State: AOJu0YyYssFCbjwKLlfwW6u+48KXwWy+XjjJrw1f+/Og2GnpxDtcY0Kb
	3iAgdOjVmxl5nqGCFLo5czqFTuVJUfwtdxN/BNBCWabJkdzl0GuHnq7BlycLWnFP0KXr8RZMrEo
	ldMA8a2ojCJ/z6mC46+VSxs0xcEyO3j4ZH8BeWdaMwp35vOKeKcSri+W2OEmVNQXx3H/ewiBVWA
	GY
X-Gm-Gg: AR+sD10fXYC41Iuafm8rpKvbSd/7v1jrVbEy2zti0dUiNlqmufMighfssTep9gOTeyx
	e/6f02V4FsQcZFN+e3+pFJ/YOGs7aG7//8YVkAHvGypHvS8B9D6To4N81srouWSPBibtjDFNL+k
	oC9UFeP8PysA513AAjNFM/2gfcG8yRrIShiwoYSK4cGdMlxXqLgqVHB+xAFbahl8ndDE0Ixr6rO
	Q6iLFCt86XDPjh3z5NXGfjlkI5eBzKJ238Vlu6ToiBSoC0rWioapfp2Qe/sOitsCrucI0HfavLu
	dqN1zayvHPDo4VkCLsY39iVuwB1ddskeBy9romD4W7TQGRJ15GalmgGSubWdFKl53wp8TUwQLOu
	nxeggyBRQmJLEqshiRyi9KblTU5LCjrA=
X-Received: by 2002:a05:6214:2b81:b0:907:6919:27c3 with SMTP id 6a1803df08f44-908347dbedamr24575106d6.53.1785420510193;
        Thu, 30 Jul 2026 07:08:30 -0700 (PDT)
X-Received: by 2002:a05:6214:2b81:b0:907:6919:27c3 with SMTP id 6a1803df08f44-908347dbedamr24574656d6.53.1785420509703;
        Thu, 30 Jul 2026 07:08:29 -0700 (PDT)
Received: from hu-neersoni-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-908325186b7sm18465826d6.43.2026.07.30.07.08.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 07:08:29 -0700 (PDT)
From: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
To: ebiggers@kernel.org, ulf.hansson@linaro.org, adrian.hunter@intel.com
Cc: quic_dmukhopa@quicinc.com, quic_rampraka@quicinc.com,
        quic_nitirawa@quicinc.com, quic_sachgupt@quicinc.com,
        quic_bhaskarv@quicinc.com, quic_gaurkash@quicinc.com,
        quic_sartgarg@quicinc.com, ram.gupta@oss.qualcomm.com,
        linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, neeraj.soni@oss.qualcomm.com
Subject: [PATCH v5 0/4] mmc: Avoid reprogram all keys to Inline Crypto Engine for MMC runtime suspend resume
Date: Thu, 30 Jul 2026 19:38:18 +0530
Message-Id: <20260730140822.1976635-1-neeraj.soni@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDEwNyBTYWx0ZWRfXxjltYihfw9aw
 48nsSgQSziWO1xcrKGvLXFfpDbsRf7lrXzUBPV0fTUD+vsJEKKe8VR0TRiZhtixjNW7nFeWd0c6
 dWDiWIdkuyf0/L17p0s767Tq2p+rqz5idBE5RVS2MvlSBb//ciFWPWBtqm1r8kNCnfsCY3nUi63
 aJbWP2UiMnxK7TfCrLsvlXG2kbSuHBStRFUXHJWx3QlXeEYK5aHABzhtNbKiW7m9HoezR6fFiJc
 Xl2d461wLVQHSZcJGdcLqsgGx9w/W15QCjJRtpRh56mM08F5jMRcJ4MmDQVEs1mBzcPFEXcfhLi
 RW6Gfuz2YOk7CaSWC98+hVsAllzkE1dCOxUcerF7bxY87X9KtdmV0yR7BiKX+LIfcsSqWuvzYU1
 JD5iHsJr/1b0UF2UMs2VNijTukIofcPW6H0t5SqsATnSW7B8WcU2U9Pxe0gqH3jhda1LwmLCqxs
 r2r6GCYHKsn7HROQvFg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDEwNyBTYWx0ZWRfXxC7O/VcDmyO2
 vXzPiN1S/R1hNh5bWCFLFIw8Fe1hd1b3bOgbrkfGLM3FLq6YS2wrGCGWbvGHGQJ2ae0tPgYt7Xb
 pxXg38ixx8nQiiI4dZJWjCR63+Z26T0=
X-Proofpoint-GUID: B7wiUE4ufuQlkl0GJ9CxTas7-R92MyD7
X-Authority-Analysis: v=2.4 cv=GN441ONK c=1 sm=1 tr=0 ts=6a6b5adf cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=1XWaLZrsAAAA:8 a=str9zr5dfIM3A4MzCcAA:9
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: B7wiUE4ufuQlkl0GJ9CxTas7-R92MyD7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_04,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607300107

Crypto reprogram all keys is called for each MMC runtime suspend/resume in
current upstream design. If this is implemented as a non-interruptible
call to TEE for security, the cpu core is blocked for execution while this
call executes although the crypto engine already has the keys.
For example, glitches in audio/video streaming applications have been
observed due to this.

Fix this by allowing host driver to control when to re-program the
crypto keys along with some fix up around usage of CONFIG_MMC_CRYPTO.

---
- Split the v4 patch https://lore.kernel.org/linux-mmc/20260529092612.1749752-1-neeraj.soni@oss.qualcomm.com/
as suggested here https://lore.kernel.org/all/CAPx+jO8rUwYV6q1-RrA4aZ9XnomSf82fgf8Jh2fUC0fE03RFPw@mail.gmail.com/
into 2 logical patches [PATCH v5 1/4] and [PATCH v5 2/4].
- Introduced [PATCH v5 3/4] to specifically restore crypto keys during
hibernation exit.
- Introduced [PATCH v5 4/4] to fix crypto capability usage in mtk-sd as
suggested here https://lore.kernel.org/all/20260723230104.GA662946@google.com/.
- Dropped "Acked-by:" tag from v4 due to the split and introduction of
new changes.

Neeraj Soni (3):
  mmc: Allow host driver to control the re-programming of Crypto keys
  mmc: sdhci-msm: Reprogram crypto keys during host hardware
    initialization
  mmc: mtk-sd: Protect crypto capability with crypto config

Ram Prakash Gupta (1):
  mmc: sdhci-msm: Use pm ops instead of macro to restore crypto keys

 drivers/mmc/core/crypto.c    |  2 +-
 drivers/mmc/host/mtk-sd.c    |  4 ++++
 drivers/mmc/host/sdhci-msm.c | 22 +++++++++++++++++++++-
 include/linux/mmc/host.h     |  5 +----
 4 files changed, 27 insertions(+), 6 deletions(-)

--
2.34.1

