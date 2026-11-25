Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795601971;
	b=Xq3Wgx/DenfMjo48TwLUd78l4p26MGcx6clLpaLScpNCsbRE9lPPsxq407UnLdmPIPnN
	 u8GIqsip/cT8xBxJXNZo+BWOxGMvNdsAfc+tEBTxeaBj4rUUPUmduoIF5jQ19ZX5R8QR7
	 vYci3U+TVlGcSmOzxUrQuHuSZIfQe5LR86lgQ2u252NLw4xzBELfrTjhja75VpJu42yxQ
	 Hpb0XtKP3/n0aPk6hQRLO6phxiyxrn5SySzeHp+Eu7Mfugb/A44t0GT2TTe342V6MEN6n
	 +uDFeHdxDEsBQs1mTVx0ZhEpDBVTfc2uH3dBQ2h2Xsifjrtn4fX+Thrn60YubVQLLXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795601971;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=WZGUso68U+c8DwdxktvXeeeB4ezc2TpH+kTAsRQbmiw=;
	b=m6MWt6pI/rCgP+mFH/kqXx9ivZLxA59p+tAgLjqoOrUuSQGldYrmuzMLuf810Lpbn3ol
	 PjdrN1lGe2msFshVpe1y3KJpcgqB6H/dzhpvwqWckZkthuuNi2Pi0iH+likAjui5CJw9x
	 w1o802OqOe6pDUPR3R/J0mJ+rZvS+0EjQg2oTnVQM5K1Zo0R8jVPi530kfWvxwVNMl0VZ
	 iKolQYFqhz0P9vefsMkPMPdW6Oks8Q7v+nUG+YB8y6K6n9nwC0mmD0ZANd9qPoPTTl0sl
	 wtW86psMsM0XW2HwDu2EwEf5vEPa51689x15spXnA025Is1KIHYfrjc8a5SwvPnKn0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="JdFiu/l/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YbVoxoX3;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B94F8606A321
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 10:19:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B94F8606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JdFiu/l/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YbVoxoX3
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mhvP3642160
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 10:19:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=WZGUso68U+c8DwdxktvXee
	eB4ezc2TpH+kTAsRQbmiw=; b=JdFiu/l/wCkJ7RgexJTeWZ6HIcQMnNCIlAbFAa
	ihXoBo8QxeG4xbygsKGBFY8CoZoN1mFtNxBYuEJ/6k/U6CvwwmvObwsoTUfdhYL8
	GxTNmLMCZg+g6gLc6mLUtOaJ7FP4gtG8VRAHD46n4tOYktjKO00kPLiAYzZPGVDE
	YX7fWB0eM7wf1mRKnmhZjupPakLJaOVnUFwH6g2/nvfQWld9o+qdzs2G/Lver0pz
	I0Vkd1/02NSkLvIC5j7srFNZ6lNcAXCM6kf0oKGSZOy6zDvJI4DEJxT2DfXEIdfE
	naWLmhSuCndVkJ4X5+lic+sc3XdBI5gpx4gxvmOuHHpTW7wg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5mc2ab1w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 10:19:29 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-94970ad532bso344416185a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 02:19:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795601969; x=1796206769; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WZGUso68U+c8DwdxktvXeeeB4ezc2TpH+kTAsRQbmiw=;
        b=YbVoxoX3ZTByEkHEh808rDrviK57//aPuLYLODimonB+pVvH8RvPKKMbOTPOOmeOzy
         R5OQt6Lb6UTJA7u8Jf54Yn4JSC+b6VX585Z1SNDUy6iwtQUvHlDKmsP9EoWI+D4FzSJM
         RKJ1PeI3MaWSCFvZtnMb/nWRNIQBJ0CMwuETHG33DcD6OlEGCACOqKPeCqEnDrsIJWaw
         EXRNr886q01r8cW3eNaJXcJDO5tG5Fd0JEg3kYZKSnuRYcByaX5tFvEay5rFJSn9FUko
         xFGyFfzWy7cR45rtfxiXp/dzyS+/WQXK5E7jA7EzwQdnloCRA0KBh5gSq1VxTkETctQB
         TleQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795601969; x=1796206769;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WZGUso68U+c8DwdxktvXeeeB4ezc2TpH+kTAsRQbmiw=;
        b=Z5aHfVoC7hnYeMNJoWanRFVBmet+K3YsNvjtxvxwKxSForAi2870fJU/S514Z+dXZY
         18L6wxQTszPrYXUdkTT8+ty5rClVPXeK6JFpFblJQKOTIEX/zsTQM6znVDwzsH6L2aRb
         U4gtUyL5L0fXMJZB7/nTJfZIak6jN/XV41MdAQovLdNFkYf4pTnxSuBPJsQOGewdk43o
         hNODZ+spmoh8ScM7cmI8TAjCr8a+kAaowCDaU6qoixopVVtC/bCbdvRcPZjHB0pRLfwU
         D5+L3MCl8TFxeMz71YSoY6nSWwCZKZ2UtZ7vfxQ1D6q775G5ThpQOvOhOZX1Qg3aRH9h
         z7yA==
X-Forwarded-Encrypted: i=1; AL+hErE62IqvFFgl00G665trJPCgyDN1v8Ie5lbcMyaHbmkNcGNoAKWuQ0rOk3Awfcgs6JDv9WbOXXMJRgu2GNaF@vger.kernel.org
X-Gm-Message-State: APuU4Z9MQRnsbap34YM8dmiNI3oQrvI+eG0D9TcIRA03XcussWY9Q1Fg
	BstLA6a4jVfJ3mS0zZvLu/3CiVD9Nmhg/qm/JO3lnUArJVIvsOIpSJxHH5eM+RemU4WCZHrkQnV
	70/N3zAW8OXRe3vYz1M2VH1wwE+dJ7CvcHqz1DcgT/4oWaSi0MQeouOOYyNkKzCF+DnecWfas6Y
	x6XNo=
X-Gm-Gg: AZFdTZeUqZ6W3I0SW+e30he/SN4sk/6ho63P+OutuNZb7+nuYSKMyAfuoTWLcoXKjkP
	GMtHwRrVBq3PAYXFxmrN6TNJf7aUCsQ+KGW8Obi8HHZAfk9oEznCYxi5zfN6DlXdoujl7jZnSIi
	tQHjI0fYtaXzIH/njnIZ62ccey9v32g/BXWR9NBmvv48uYYlgFwg8qKqZEM0goE1yrozqMWasZz
	3tMW7n7hpceq440medSB1iQ8vdBA3u8eo8ydmXk27ypPuu90DVTXeurITx5SLgCfwA7EK7vTi4l
	bft7rLwq/9uwuiJ6lZXcCN9fEZc77/ZyArT0mKGhijdKgm+89qenLD5QS5+77YD87crXT37LG6h
	HCDwvrTrz6ioWndBsLDX84L+xXks+QbRqCg436Uj4RDzyIwCOU03BDk8yoC5x3uQW9oEZfRxeXw
	OIvzczYHLrrV1V9kqcQ+zr1VOziUZH77ySDcu9s/cPlbxR7C7qjy+rEMhXt3XLkHWGrwIi+rivd
	NP/BDgAse+bd469fa4EeIjFmu4E
X-Received: by 2002:a05:620a:46a5:b0:949:7c8c:54dd with SMTP id af79cd13be357-949bab23d38mr3015219185a.59.1795601968639;
        Wed, 25 Nov 2026 02:19:28 -0800 (PST)
X-Received: by 2002:a05:620a:46a5:b0:949:7c8c:54dd with SMTP id af79cd13be357-949bab23d38mr3015216885a.59.1795601968109;
        Wed, 25 Nov 2026 02:19:28 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:6c6b:1e5a:79dd:a527])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4b70c05b9desm9342072f8f.54.2026.11.25.02.19.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 02:19:27 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v2 0/7] media: qcom: camss: Report the hardware SOF
 timestamp
Date: Wed, 25 Nov 2026 11:19:24 +0100
Message-Id: <20261125-camss-hw-ts-v2-0-24c955e43d75@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIACy2BmsC/22MwQ7CIBAFf6XZs9sAJjR48j9MDxRQSKQo26Km4
 d/Fnr28ZF4yswG5HBzBqdsguxIopLmBOHRgvJ5vDoNtDIIJybk4otGRCP0LF0LHhBq0naSyCpr
 xyO4a3nvtMjb2gZaUP3u88N/7v1M4MhwmKazV0g5anRNR/1z13aQY+zYw1lq/Mnw9ua0AAAA=
X-Change-ID: 20261123-camss-hw-ts-e0297adb69d9
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=aPJlOr9m c=1 sm=1 tr=0 ts=6b06b631 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=0dbMMC3Z-gWnjGpt8oMA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: meCbju2rndyWjum7NsunTl9LOa039lm4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0MCBTYWx0ZWRfXxNhPQNKhL6G6
 iMCFytN9BydpW8ha1W6JdySDXk/7bzLlgxgMPWnSwIfG5oidNUoVWLmfa5iJ5H/M5Tfjvvrsee6
 ASzn2TtqMz/od3FwUm0eE1iXFMj+RUH1maU4Byn5RDhFzbshKMekR1QL+p5nJIJXZK4mGliwylX
 xdwK0obnP9bTOqZiO+e4BgOZWgxAapElttkrJeYsBW2K0CRZRh9wMIgg1pxtdx05VgIOYuDaRPO
 8V9r/kmy6Hsvd61f50eP7w/ffNdJAiH1UNLNuWhg2grCHzYjYPL1W3aJ388m0y5F/Avu36AbkKE
 QWMnb0PhsdKMg7J2aKoLTeEkeBaJ36gjc7WRvCjzDMdav+yCN25Tp2XcoL9fYg0unl1hwOufmn8
 xlqxsei313D116BqnrwlT0OakMUjd1LJTy5fTmNk3AxVF4RbDdkFYS4ZiUwU8eACujsY93LeGMx
 8vHcuK0FUXgbpefls6w==
X-Proofpoint-ORIG-GUID: meCbju2rndyWjum7NsunTl9LOa039lm4
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0MCBTYWx0ZWRfXx90hCo7dJ4LN
 s+bpE/6QAmy0Z1IY9RT3NNdUobZBO3sHvEZyNeibfHXCOKveqbWgCxHHiRfe5Dwq+3Zr3XYdDGI
 OQH6AfX3ziy8XL85HRuukOVuzVig1Ds=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611250040

The CAMSS CSID latches the ARM architected counter on every start of
frame. This series exposes that time to userspace, both through the
V4L2_EVENT_FRAME_SYNC event and as the buffer timestamp.

Until now both were taken when the interrupt was handled, or worse, when
the frame had finished being written out to memory, which is about a
frame period late. The hardware value is free of interrupt latency and
is directly comparable with CLOCK_MONOTONIC, so it can be correlated
with other timestamped data such as IMU samples.

Patch 1 lets a driver fill in the timestamp of a V4L2 event instead of
having the core take it. Patch 2 adds a CSID operation for reading the
counter latched at SOF, converts it to CLOCK_MONOTONIC and puts it in
the event. Patches 3 to 5 implement that operation on csid-340 and
csid-gen2. Patch 6 uses the same time to stamp the captured buffers and
patch 7 reports the new source to userspace.

Patches 4 and 5 are picked from the timestamp support Bryan shared
earlier, with patch 5 adapted to the operation added in patch 2 rather
than doing its own conversion.

Tested on QCM2290 (Arduino UNO Q) with an IMX219 sensor.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
Changes in v2:
- Patch 2: read the latched counter through a new csid_hw_ops operation
  and do the conversion once in the CSID core, instead of passing the
  time into csid_sof_event() and open coding the register read in every
  CSI decoder (Bryan).
- New patch 7: report the timestamp source as V4L2_BUF_FLAG_TSTAMP_SRC_SOE
  on the SoCs that can track SOF, rather than leaving the queue
  advertising V4L2_BUF_FLAG_TSTAMP_SRC_EOF.
- Link to v1: https://lore.kernel.org/r/20261123-camss-hw-ts-v1-0-7b62dda6d7a9@oss.qualcomm.com

---
Bryan O'Donoghue (2):
      media: camss: Define timestamp registers for csid-gen2
      media: camss: csid-gen2: Report the hardware SOF timestamp

Loic Poulain (5):
      media: v4l2-event: Allow drivers to provide the event timestamp
      media: qcom: camss: csid: Add an operation to read the SOF timestamp
      media: qcom: camss: csid-340: Report the hardware SOF timestamp
      media: qcom: camss: Timestamp buffers at start of frame
      media: qcom: camss: Tell userspace we're using start-of-frame timestamps

 drivers/media/platform/qcom/camss/camss-csid-340.c | 37 ++++++++-
 .../media/platform/qcom/camss/camss-csid-gen2.c    | 31 +++++++
 drivers/media/platform/qcom/camss/camss-csid.c     | 94 +++++++++++++++++++++-
 drivers/media/platform/qcom/camss/camss-csid.h     | 19 +++++
 drivers/media/platform/qcom/camss/camss-vfe-17x.c  |  7 +-
 drivers/media/platform/qcom/camss/camss-vfe.c      |  8 +-
 drivers/media/platform/qcom/camss/camss-vfe.h      |  1 +
 drivers/media/platform/qcom/camss/camss-video.c    |  2 +
 drivers/media/platform/qcom/camss/camss.c          | 12 +++
 drivers/media/platform/qcom/camss/camss.h          |  1 +
 drivers/media/v4l2-core/v4l2-event.c               | 20 ++++-
 include/media/v4l2-event.h                         |  9 ++-
 12 files changed, 228 insertions(+), 13 deletions(-)
---
base-commit: 2ad58ca589da80990b7afbcff018777851577f89
change-id: 20261123-camss-hw-ts-e0297adb69d9

Best regards,
-- 
Loic Poulain <loic.poulain@oss.qualcomm.com>

