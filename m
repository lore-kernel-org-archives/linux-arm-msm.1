Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792834833;
	b=VXiQGorR4h4wVc8OBz6kTDu5wLOQjHHsMDG9ug1t11cPzEmprXMWzsPuU8ZjZvAviwl6
	 7dqA5wHO6b1qnSPTGcR0FeWfgLfZOBl7wT9WSG1P58tyuVJkJ23LwNKkR8o5goGlJtuGp
	 WqRl0Uw8yVnphlDOCJd58oUltY0eG6J5aMMRQdUviubUpzjw7dX/bJLzb6bYdsngzmsOv
	 RqtR6NUU7znORtBbnFWkW8CaXF5gyxNW90eJ9u7ZHJtOR6PpIBqA/Zk3fYBPNAV2awGlO
	 cmeP/xWsJWXW+3qq1MT1FRY3v3KNPkq1NLP6YiHUdFq02MG115vaewI+bXb4Tv01tvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792834833;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=uEG4u2CQ/9TFubC4sZQG5u8ciiNwJ/m/8ij1aKFIvPc=;
	b=CTQyTP9znpwnpJg1ygr98GDSIqjuz5rqsynXrUm2wpb0CQim5ge1mL1NJPiNQ/X7pfYW
	 xytwZ5pPKFaQCyuR83G9F5whaACY1xF7F4DMbcH8vlrWMSnsyki6syfT+e5z/T0H2bH7n
	 /Q9GOOYK84knC4OLHyvLkUid6aubVERIpBFWOSw7A6EEl7fCKGSrRLd0kLV1K6yvm6m3C
	 gEL4cPWXY2RPBpfG37RXb7inbee9PnR0agLgY2g6Ha3Y62W/2fnSpm40r91m61i3VmdAU
	 ZGD+y5O2iiX2ktexuhGBc2J5HwJkpYIubxA2K2XYZowx7n5hqwaW8XSjIG+7TreKeeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JvUqOVOu;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d1Kmasu0;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 560AA606A31A
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 09:40:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 560AA606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JvUqOVOu;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d1Kmasu0
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69O8o36O1166345
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 09:40:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=uEG4u2CQ/9TFubC4sZQG5u8ciiNwJ/m/8ij
	1aKFIvPc=; b=JvUqOVOu/49jZEeWR1P07NNxL71LuO9fN3xAUlAdO4W2RL42UkL
	o8wQ1XSlTR6xs3K0KJk5NahJHJ6AzgyYulK99Ga8GTt0TQagQtoFGjZUAYtdDPHh
	C0by9lvDKN+j/7nB/1Ep7Yud78Uw7Jf8q6pLmgeRb4WZAL3hSx7qgnpxMw/VK35U
	UuRKBuiXGwNjhybLhmv3Jk80Imxc9g9ff8dNpTNbKAYIt2s9dvLqtgl57kLtdU2K
	Djtwq294uhMCmjqh9bLnYjTYJtw/e6pa353KEE+EEoZUJuZ0oh49qwa4OtlRu3y8
	AvDmUPgKdaLTjnPSOnurg7i2AfJhBwYeLgw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgmw3gmsx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 09:40:31 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-536347602faso34371261cf.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 02:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792834830; x=1793439630; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uEG4u2CQ/9TFubC4sZQG5u8ciiNwJ/m/8ij1aKFIvPc=;
        b=d1Kmasu0XvWAaC0vPtyBnUMIKMfdBwQIzRMdj/dk58X4ZJVZjgvepjF14Io+do2+LQ
         SGsPlKtZ4JtdgTSsNnb9fqbqu9sDoZz6G+MP1RO5GnR+hUCDUGEnGGy0JRVCwBZz/CxZ
         JMq65Tm1CJdZFCsQ0rhsUtT/vtrgELT742vj+ZgbTo7bO/9zCTzy/8Le/0GWev8nKYMJ
         0TFsxoTrt1sBtNgUwkxbZlKdbGKbZUhc32XwNWNkfn9bWEArocp42DTtniMblgZ73sVL
         q7HU5pmtldugGHw2Q5zafhf/+9I14JvPShRTdbpKjXfts3cfNgS0s2yDSO+8Emurf8iV
         2kPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792834830; x=1793439630;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uEG4u2CQ/9TFubC4sZQG5u8ciiNwJ/m/8ij1aKFIvPc=;
        b=1QsTz7z9a/yjjEe5jWX/KKKhx1CtjjeklhUZy/pKr5WkEaL954sZj+YabF2iD9A/PN
         LcB3E53IzKcA7PT6aWwIue9T0KkJ0h6LFjg0Up7lrCrsq73c3Kg3pmxMu+PZrWqxZaMB
         /AzQSWvQoSDwgOnRXP1c1ESOzD/yTFrHxih9+5rZptnHLD3Odbs7ZS1FGpspdsofl+0B
         IxWpoyAaLBXY4jQcSw0fy5JyvI0lkh6ObMiWhhhlvMvu1/VGOPE/zYtB1Ik07K7g8ehF
         6bvI6DzENYGR+yVzxlIBeNvJ0OBNFZtvHa6ApSxTYZHkpLnvNr2nvVOe6oGJjnxnWNJy
         6lnw==
X-Forwarded-Encrypted: i=1; AKwUvBwlnpE5qPITkMr3RY8J0QLUIzuncUidKNLtXeR92hUCf6Yo80Feankd7DkUFVJBOqC+FgtJ+RinywFncvYM@vger.kernel.org
X-Gm-Message-State: AFq9FYKQZTO7yV8vH1y6AjKJ/pDfZd+Hj6Ksh19KSzWua706UJNMvdS8
	K6xXq3bWfhT5yKLw8ncu4yiTA4J4ufURDjOjj2xTi2FVT2TiRj0+5uFjdKFBQWf/9C1akqVvUgG
	YIoPj6YHu2lJxJ5q03XvodU9KUHKr5k9HBVBRtekO+7fuUiQ+ZfkP0pfj6/QO9zNdebVk
X-Gm-Gg: AYBFou0pF2/ocUEpqnmwJvh1LOxLF9+SM5alyGSAUg5jCV1bW50MyvUejWjiz8jvYH8
	xSYDMtaKfephnLMS5s0A8FarQrqaQt+WBo8lFr6jbIlEGwuHVJ5fozPvIUXoctYwjOAWJSsQ5sk
	5Fdf0tC0GoTIdRDvGUOMQ/GFxNuuwrHM2dbkxL/ZUytpuR8MjyYzIY5aO2bqoJV9cVR/HpAePS0
	Hu6NAvYXtu/juqdCk/RN+KM1c+2oO8FatnSD9qOk+ZT41xZxSp51MvtIY5lEVy47SaviACTpjPT
	m89WZPKq9YecPVmwR1xmXS0d/UKGfOhKfmfteugh9CtIbU6mhkw0UWqD2mERBoIGTaqnsSvY5cd
	fkIV8JnYeULDfDd7zatdGehIW
X-Received: by 2002:a05:622a:4e88:b0:535:a5fb:645d with SMTP id d75a77b69052e-5383b6b7b1cmr15587401cf.72.1792834830375;
        Sat, 24 Oct 2026 02:40:30 -0700 (PDT)
X-Received: by 2002:a05:622a:4e88:b0:535:a5fb:645d with SMTP id d75a77b69052e-5383b6b7b1cmr15587221cf.72.1792834829901;
        Sat, 24 Oct 2026 02:40:29 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3bcdsm2857166f8f.13.2026.10.24.02.40.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 02:40:28 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: atanas.filipov@oss.qualcomm.com,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/6] media: qcom: camss: share VFE clock sources on SM8250
Date: Sat, 24 Oct 2026 12:40:21 +0300
Message-Id: <20261024094027.3095475-1-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: tlV5378YlIRBIT1K7q6zehmSsGulfGh6
X-Proofpoint-ORIG-GUID: tlV5378YlIRBIT1K7q6zehmSsGulfGh6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI0MDAzOCBTYWx0ZWRfX1DiHaLznA/D0
 bbw7ktPjSA1C+fv1szRXDUMG5JDRUhmmFF3/YUhoANTlPwaGsXF7O1hJ+eoDXwsXipFTNCvC9pX
 c6lvJCC9nLJhHRM+ul08/olz3rK3p8g=
X-Authority-Analysis: v=2.4 cv=HqHjiETS c=1 sm=1 tr=0 ts=6adc7d0f cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=dmj4VTlxVhTCmNQHaQYA:9
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI0MDAzOCBTYWx0ZWRfX0s2o9hQGBSCr
 qUSCdzHHwXf73xeWxGnD84J1ECxlKC+brkb8n8VJwc7vv3BpBfC7sSDy60bV4vJALL4RxHce1ti
 RQpa9ehNtGY8BNQB7OU0sT2D6zz3XGnnJ3NdUIFMa43PwI1rSBX8Sk7kmIJEO9EjJJEZnv+ZIGw
 42NMYgtRItOJbh5HLhSzvnCmzj3Z3SUbpflgmVN+dyVnBiQzYXuUAfBc9GFHLkADRnFmnYcm2yG
 erk9eIwPU83xoMKSKuPFOn3+pnxjT/olwlylZrjMchL0yH14Sm+ddwB0zlRtlrmEKH3ZCtSmhBk
 zQwMi3CCsrb2MZOqfHlea8akSDt0DiLreg2FGkFf9hHLejmiom828BLxqO0CBZRZNFINkZIhcWs
 CG6pANTU1EU/z+sLgIAssgOr2mvg5Z62RVEz2prt7l72ucWXNqq8YFFw7p0nQz8RU4gd/G5hV3g
 BohadulYO88ZS4XZUOQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-24_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610240038

On SM8250 several VFE clocks are fed by one clock source: the AREG
clocks of the two full VFEs share the fast AHB source, the two VFE Lite
share one core clock source, and all four VFEs share the camera NoC AXI
source. Each VFE sets such a source to its own rate, so the last VFE to
power on wins and can lower the rate under a VFE that is still running.
The CSID also sets the VFE core clocks to their lowest level when it
powers on after the VFE, and nothing sets the camera NoC AXI rate, so
the camera NoC runs from XO and two concurrent streams stall.

Two examples on RB5 (QRB5165):

- VFE0 streams the CSID test pattern and VFE1 then starts an imx577
  stream. Nothing sets the camera NoC AXI rate, so the camera NoC stays
  at XO (19.2 MHz) and one of the two streams stalls. With the series
  the VFEs set it to 300 or 400 MHz and both streams complete.

- VFE Lite 0 streams the CSID test pattern at 480 MHz and VFE Lite 1
  then starts an imx577 stream that needs 400 MHz. The two share one
  core clock source, so VFE Lite 1 lowers it to 400 MHz under the
  running VFE Lite 0. With the series the source stays at 480 MHz until
  VFE Lite 0 stops.

This series lets the VFE own its clock rates and aggregates the shared
sources within CAMSS:

- Patch 1 moves the minimum rate computation out of the VFE clock
  loops, with no functional change.
- Patch 2 clamps each VFE clock to its highest listed rate instead of
  failing, as the VFE clock rate tables need not have the same number
  of levels.
- Patch 3 stops the CSID from setting the VFE core clock rates.
- Patch 4 groups the VFE clocks by clock source, so that a shared
  source runs at the highest rate requested by the running VFEs. It is
  enabled per SoC, so far only on SM8250.
- Patch 5 lets the VFE set the AREG clock rate.
- Patch 6 drops the unused camera NoC AXI RCG from the VFE clocks and
  lets the VFE set the camera NoC AXI rate.

The camera NoC AXI clock is also used by drivers outside CAMSS, and how
to aggregate their requests with the CAMSS one is still being discussed
on the CAMNOC interconnect series. Patch 6 does not depend on that
choice: it only aggregates the CAMSS VFEs, which share one source, and
fixes the concurrent stall today. Once the shared camera NoC clock is
represented, the VFE will request its rate through that interface
instead of setting the clock directly.

Tested on RB5 (QRB5165) with imx577 and ov9282 sensors and the CSID test
pattern generator, on single, concurrent test pattern plus sensor, and
concurrent dual sensor RDI captures on all four VFEs: all streams
complete, the shared sources stay at the highest requested rate while
another VFE runs, dedicated clocks drop to XO on power off, and the
camera NoC AXI clock runs at 300 or 400 MHz while streaming, without
the concurrent capture stalls seen before the series.

Changes in v2:
- Split the minimum rate computation out of the clock loops into its
  own patch (Loic Poulain)
- Add the Fixes tag to the CSID patch (Bryan O'Donoghue)
- Split the clock grouping from the AREG clock change and add an
  example to the grouping commit message (Bryan O'Donoghue)
- Rename the per-clock entries of a clock domain from user to vote
  (Bryan O'Donoghue)

Atanas Filipov (6):
  media: qcom: camss: factor out the VFE minimum clock rate
  media: qcom: camss: clamp VFE clock rates to the highest level
  media: qcom: camss: sm8250: do not set VFE core clock rates from CSID
  media: qcom: camss: share VFE clock sources by the highest rate
  media: qcom: camss: sm8250: set the VFE AREG clock rate from the VFE
  media: qcom: camss: sm8250: set the camera NoC AXI rate from the VFE

 drivers/media/platform/qcom/camss/camss-vfe.c | 138 ++++++-----
 drivers/media/platform/qcom/camss/camss.c     | 215 ++++++++++++++++--
 drivers/media/platform/qcom/camss/camss.h     |  13 ++
 3 files changed, 272 insertions(+), 94 deletions(-)


base-commit: bd1ecbb61afefc6a8b876ccbc31e9228b44e9eab
-- 
2.34.1

