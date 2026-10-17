Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35DDC3B8412
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 Oct 2026 17:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792257208; cv=none; b=rxeQUO82fWs4g4YUoArkUDR2vrQygQzDiZqUeYowLfeEuw48L84ANJCRIAQzYSFWvbZLrsG0ZUKHDshVu97RyOtnieUjqZOa0cLO5db7PKyHnOzh31969vXAya98kV5yAogXObPQSsXRpiWZgQaJo9JJn+xZYNGkV75pjYursuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792257208; c=relaxed/simple;
	bh=EGlPGF3Pi8rbBLjzAI8E4z/L6eRvj6YXti6ArMjCUkA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=vGa+MMjw9Yp8GWwzqnhvlb77urVZ1NWxV+ftJj2AU7RMG2nZJVia9z1EC960TRtNIZMyAd8oZYnYu51CEs/CL140in1K3rIED7XYNLWjcmkDTzPb0Q/mNDhGPoUTePwwks2Wvp+VdeaUgGaZmMvW07bHfW1EkFi3IecCSucYuRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iNuG6zQP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gzaaY7C2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iNuG6zQP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gzaaY7C2"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69HGBXbj1523442
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 Oct 2026 17:13:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=eED3OOUN/d2HGrSYhMIXf8
	FiWKrYIZfXpQW5QeQiOIw=; b=iNuG6zQP/EBgQeMt1n3z+TTY6EZu5tUBEpF7An
	nBwkuGzZfALv2mIchy+PQww6aq4MKhc2XuGnxHBA0XBdI7fNbqn8SWqmvlz0aId4
	bm1Z0IrEhDq2oNafoJaVpxxODvouIo7tAJuqPACawFmqLlMP9P+ABr0x0tMuPYMg
	ng9rZn2dscVYdQyBUxUfRwirL6kUcbu6trwOen/7k1WOk12alunBAQgMM1F2ljRf
	noejV5db9FCwBxuw5cG+jDnpgtz5fLIYBytNDkPg1CdJiv9btVbI8C1E8SkxhbGj
	/vvHOy04VAZQ5VB5UAAreBuUTShsllVwDniFV1hxrf2pErjg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc1839d3h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 Oct 2026 17:13:25 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-357e2bc3b1bso1403037eec.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 17 Oct 2026 10:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792257204; x=1792862004; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=eED3OOUN/d2HGrSYhMIXf8FiWKrYIZfXpQW5QeQiOIw=;
        b=gzaaY7C2tBeN1GXnTkYNEClqJ4NKLXNLxWHxTcIPnlL7kflIz26YRPYd5KJ8I6tdJ3
         YNJIaREr/iWHh6uYECoe+IXQLm4eSUjkwUGC2go8CK3myUyRV5b01q8O3UQy6CUkAaR0
         gx6L+KM5kxE7e1Zfc2mM+2Mu74JWqbpLbgwEe5x0UUIP2jFEyz1l/cnknkQzn+lnqYa9
         vUjt2er/2ePe9dqgb5ryH1kK1cLSo3ebKm1Fa4qaZn71fMTlYAWHRie0HraO7zonDlL8
         rQCyIqjpBOM2mirLS/AV/jGZbR/NX2Zo6ftfn6TFwJcIvnlW9ZzUakGEevQIOJ+XRSZn
         3idw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792257204; x=1792862004;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=eED3OOUN/d2HGrSYhMIXf8FiWKrYIZfXpQW5QeQiOIw=;
        b=2G7SpHThq2A1Odx3uPrh1nZztWWDi3McneJtV3QT8pNKJXXzscW+x38C8NAZcvEDMe
         NYaSy0L9uuvCEeBlE4btjZTAdnxRebDi0xYuuf46isjXvCIYHtw0p5ZO4QQqSwrge+mB
         yeiCaVDjm2yGN6ZbJwfT9U1A7Hf9Vn5BohRvf1voemUO6g0F9cBaKA3WQ5ZymQIXDkVF
         KRCn1crbGrrC/JjQwvpOjnp4+Na7MVxxrKamp3qbYP1N0Va1GKH7piSEDzr8JvoRxEXX
         DpJckHtwL1rREcqYhxeGaWV1GfvmXpZEXFF2wEn8NC+5ML4khUTIH5Bpzfc2at4RQKYK
         BQBw==
X-Forwarded-Encrypted: i=1; AKwUvBxMYraq5Pzu/ABfD8y4kusQWwTgHEcnOIaUV8CkbPza2AgkhjL5YTWgFvwivHRLv98Q524445xBtZdUrBwu@vger.kernel.org
X-Gm-Message-State: AFq9FYKZVIsFqPO9yQrGq2ge2yLEdHEFFifh8P9eVeej846ZLibwM5+E
	gIc2hX4VxUm+/4Kkd/oa2Ya0aKZoi6RYW9AWBy9O03hODW/qkvTs1IYul+liCBmZtIdVDE3+2RB
	r75bqtoCPib8g1H8zPkURd4z8bCTl7nK94e6kr5Fj4qELW3OKnyq8Dc5pD7/t0XJZb4lp
X-Gm-Gg: AYBFou0QIwEmmLpTDK6kFxtbMHxoCGS5isF0a/7DrRedyc2ZgUqVGqXsJVsNr+nJpsc
	wWyOmasLc7nBaWDNCN3uSGJGeosQJbagAaeu4jiWeu3Fzrokk9egB7IRr1ZvcNwsWhwmtoOvoDR
	INOxhwTwexq5vb1x+FohjgSrvuw7Oi1uOwN09KRKiaBJ0BcB429MZ+ckk9LagNrpqPRgZ6Rbjhn
	RuskmVu94PLc/Fi31HnILQIbxmrEC6Ft7zRWUHF5DjqIawOELtErRe2cNMtj03YtCFjb3FjWJ49
	vdz6GBxa2VaHxkQHe6yYDNLrJHINc/TVwdvKQWzjkorWSBm3czOtqHOF2ep/p/3wn7qLEhRGbH0
	BeKa6RgroUviOAcj3kUbhR4eEHRAGcQ==
X-Received: by 2002:a05:7301:2a9b:b0:360:51af:3146 with SMTP id 5a478bee46e88-361a1c4d654mr4244955eec.14.1792257204359;
        Sat, 17 Oct 2026 10:13:24 -0700 (PDT)
X-Received: by 2002:a05:7301:2a9b:b0:360:51af:3146 with SMTP id 5a478bee46e88-361a1c4d654mr4244932eec.14.1792257203884;
        Sat, 17 Oct 2026 10:13:23 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360813b6e33sm17893966eec.7.2026.10.17.10.13.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 10:13:23 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Subject: [PATCH RFC 0/6] phy/media: Add generic MIPI C-PHY support to CSI-2
 stack
Date: Sat, 17 Oct 2026 22:43:07 +0530
Message-Id: <20261017-cphy_support-v1-0-8b0e1237ce95@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKSs02oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDA0Nz3eSCjMr44tKCgvyiEl2j5FSTFDNTs1QzY0MloJaCotS0zAqwcdF
 KQW7OSrG1tQDpuFFNYwAAAA==
X-Change-ID: 20261017-cphy_support-2ce4d656e631
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792257198; l=3705;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=EGlPGF3Pi8rbBLjzAI8E4z/L6eRvj6YXti6ArMjCUkA=;
 b=QKv4CgH03RwSKzq+zy1XFoOOQlaprD/Ug4Hwv/5o9WANFQSfL/q/P0/EhlcgNlUjseGH+P/Sw
 9cRjx7P6TxpC9mz0ul+EMxgC073GRtl+uibup6JovHBZmnL6fujueOu
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDA2OCBTYWx0ZWRfX3JdMQrJqs03r
 AXXojrGdiqvfD3wqkWLYK1FxmPJBgbZexzDUEqnm+MWtZBuud8Xzg96p/nJzp08+R8gqfIm7VaF
 jTfZXHMvYFgkrZ8EnEkAnEgVBH8JRWs=
X-Proofpoint-GUID: fjFuS-QbMr-z8pl_7DiYP8AnKNAixkqx
X-Authority-Analysis: v=2.4 cv=Bu8IUoX5 c=1 sm=1 tr=0 ts=6ad3acb5 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=XJ1KF-jXdhw-DoQ8J3QA:9
 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDA2OCBTYWx0ZWRfX/ORo+yRd5f+l
 h08AkVgvWzWwfvAEPpoqfmubkd4gyKIYwC1z3792wpVBz/N1UGehhQjhf+KyWAQ51j4ZWwcAJkT
 aIgNf0XonBN6tNyFJwfl0EdbwZRdePq10K50k7MTm91w9rrt2tq0UoiYLEfDM0Xsh4X6BEu5ks8
 UCISvqOBCuSY/7/Ng3LLjuizwDIV5eQM/TfJFFl2Svj1YOG7uZ6z6Svx3bCl7DbpC0EspUU3Lci
 T1vhcgyv7ZYLQsAv1ANg0yKVuwmdZZRKinUKQvr/D2cynyRNQxG45Z5Ln6AFQtyxKSue3U5HwVB
 Do7rc8zubWqiaq5mRSaULU+wgi3bpl2iGTJQ5O2MUUdq9LZPUY6qrZgD+M/MPvCgmBaFqV0kNx1
 2DFNARUeyEg8ftJXo/8QRmPtd8mPCuD9nNEJm/HO3W1XBY5vL2GYhfE92mAppOw7J2x6T03zEF8
 06HLDYGcXQMF24FKeEA==
X-Proofpoint-ORIG-GUID: fjFuS-QbMr-z8pl_7DiYP8AnKNAixkqx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-17_05,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610170068

George posted a C-PHY series [1] which we are currently reviewing.
As discussed with Bryan, this series shares our independent
implementation so the approaches can be compared.

Two aspects covered here are not in [1]:

- Settle count calculation derived from sensor-reported T_PREPARE and
  T_PREAMBLE timing via get_mbus_config(). [1] left this as an open
  question.

- Data rate based register sequence selection using effective bit
  rate (link_freq * 32 / 7). [1] noted downstream does this but
  deferred it; this series implements it.

MIPI CSI-2 operates over two physical layer variants. D-PHY uses a
dedicated differential clock lane with up to four data lanes. C-PHY
encodes the clock within the data stream across up to three wire
trios, eliminating the dedicated clock lane.

Patch 1 extends the generic PHY framework with PHY_MODE_MIPI_CPHY
and struct phy_configure_opts_mipi_cphy.

Patch 2 adds t_prepare_ns and t_preamble_ns fields to the CSI-2
media bus configuration and extends CAMSS to forward them to the PHY
provider for settle count calculation. Sensor drivers must implement
get_mbus_config() and return non-zero values in nanoseconds; stream-on
returns -EINVAL otherwise. The strictness is deliberate: C-PHY settle
timing is symbol-rate-range specific and no safe value can be derived
from link frequency alone. A conservative fallback could be added if
reviewers prefer.

Patches 3-6 extend the Qualcomm CSIPHY driver: refactor D-PHY
register storage to accommodate C-PHY, accept C-PHY mode with
multiple data rate table selection, compute settle count, and add
lane power mask support for C-PHY trios.

C-PHY encodes 16 bits per 7 symbols, so the effective bit rate is:

  bit_rate = link_freq * 2 * 16 / 7 = link_freq * 32 / 7

where link_freq is symbol_rate / 2 as reported by the sensor via
get_mbus_config(). The rate-table entry whose bandwidth first meets
or exceeds bit_rate is selected.

The settle count defines how many timer clock cycles the CSIPHY
receiver waits before scanning for C-PHY sync. It is computed from
the sensor's T_PREPARE and T_PREAMBLE timing. The /3 factor reflects
that C-PHY distributes the preamble sequence across three trios:

  settle_cnt = (t_prepare_ns + t_preamble_ns / 3) * timer_clk_rate / 1e9

D-PHY settle count is unchanged from before this series.

[1] https://lore.kernel.org/all/20261016-x1e-cphy-rfc-v3-0-40a346a72153@gmail.com/

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
Nihal Kumar Gupta (6):
      phy: core: Add MIPI C-PHY configurations
      media: qcom: camss: Add C-PHY timing fields and get config from sensor
      phy: qcom: mipi-csi2: Split D-PHY register settings
      phy: qcom: mipi-csi2: Accept C-PHY mode and add register sequence
      phy: qcom: mipi-csi2: Add C-PHY settle calculation
      phy: qcom: mipi-csi2: Add lane mask calculation for C-PHY

 drivers/media/platform/qcom/camss/camss-csiphy.c   |  90 +++++++++---
 drivers/media/platform/qcom/camss/camss-csiphy.h   |   2 +
 drivers/media/platform/qcom/camss/camss.c          |   8 +-
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c | 159 +++++++++++++++++----
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c     |  51 +++++--
 drivers/phy/qualcomm/phy-qcom-mipi-csi2.h          |  25 +++-
 include/linux/phy/phy.h                            |  47 ++++++
 include/media/v4l2-mediabus.h                      |   2 +
 8 files changed, 315 insertions(+), 69 deletions(-)
---
base-commit: 2efb7a11f1aa4d2dc285fe2680cca22cb9f72f64
change-id: 20261017-cphy_support-2ce4d656e631

Best regards,
-- 
Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

