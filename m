Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793977318;
	b=QH7Y1yZBochVNaFmSnd2pR0XZA4VYdHQEKcYYe4eoP8yQuzekal5t2Dy9gX35a6KXwkN
	 AdcmygEZVClvh+/6D53xZveo12VNBQAfsMpQLQR6jgtFEgAUJfNZZtxl9+/G0T2dE2UzD
	 7kWBKvRnrrO+6JwCBRKAf9b8fTWvMjOB+MzNW6FqSNT8RmDi/GceyxTdn3eiXaysF+0pl
	 0m+BtzuLPfAA1+u/m48mUiMEjMk86N3gI/FOcoOupCLRdy91zZYRwM6MPXKCEwoboC1Qc
	 Z4E7pIfHLQ3WmKDxIsKe3XzzELemMLuBjwJc0w6HwTGRxrhPY9Bc4m6fdXgXPG/lWoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793977318;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=YlRX2h9r/M7y5/J/Ewe1L+KbEKnvM7owZqTGSJa2SZs=;
	b=43VWhgSzDcr+jvY/MzskEk3ITZrRPMkfkod04obYhVr5AzNeGknTq84X4LZxb/dV+G2/
	 vvF7OlJPzd5OVy40+7VjmhI+zJZI3kbBrQ5NiH3QKptpPvdD7LcuQZCWP0M+RZUGLkGec
	 i1mUegfESPPjg1xR4eueiFqwo1FmOJvCGvvfpA70UAKX/MZr2jqJmqvqsOj+2cxG7iDaV
	 lHHiVnf+61RSVoCckL8zkhxjB+c9xbOM/OgmxAI1kD3fd1HJTp9a/KW6GopBDQg2jIP8C
	 9oKXjEle85ofwFEVNABWPaYnC+UQp6agypIEiJd8TrIokUxr9bwiNWLc+QrDbpLjjuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IpPNuUns;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UH4mubwL;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FE8E606A335
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Nov 2026 15:01:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FE8E606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IpPNuUns;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UH4mubwL
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6ExxxK044166
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Nov 2026 15:01:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=YlRX2h9r/M7y5/J/Ewe1L+
	KbEKnvM7owZqTGSJa2SZs=; b=IpPNuUnsui2joIDxMx5HdCY8husIcj08vS9KY6
	ZUibYTbFfnKieTvHPHnTB7xwzC4mTuqLb+f+0Wekxqb0wCw/3r/RtUTlp6pcdxcK
	YRd+ReLYF8CywfaUnPAPe3kmLq3exlrCHcNESxBi8iUiWEYlJON+p0kLclKYF1yC
	heeq1p6JtLqNEPFyCR8MtS/2sHEwQMkMFQWfJGJnLEGaTpWj0CE6G8wQeTwB7F4X
	9mEUMZMcam2j6K7c69+HzuiwIF5u9GclPuAmQGXjh+TwcvIPsZ+OU650J/+3sEzH
	hF5s/DPr8+rR74xspjWIIbEmeI23CEkObHqqJF7WjLFi23aQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pa37u2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 15:01:57 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cdaf3f2a58aso1271034a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 07:01:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793977315; x=1794582115; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YlRX2h9r/M7y5/J/Ewe1L+KbEKnvM7owZqTGSJa2SZs=;
        b=UH4mubwLRNi+uA5+H3EJpU7sNt/MJXsY/PFrgk3BCGI271d3WKB9inw/qyxH8Nw4F6
         56pUKxYvZCM6neE4gsG2RyJTv+Jfb7efv6it/ddFK4I0ebn3pmL3Nmk5zF+QxJfW/LkV
         sE5d/w5FGMIMZmQgob6VGjoo0ekwhgCgamJxG9E/NDAtNKceCdRmPorR9xeeYDc9Dsp7
         rkoCS6ZqbUNKwWqZCOwrcKNnWx0jETy2ur34avWUW30J1geN+BjWtvvWM1roNJrnKpFL
         IU9e/OF6fx+v0/ThbwPA0d/d7RrotIRZ4E+jC6rKm/DTMo4mNxnOL75O/LtYXLqYblv8
         VxsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793977315; x=1794582115;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YlRX2h9r/M7y5/J/Ewe1L+KbEKnvM7owZqTGSJa2SZs=;
        b=JXrL6T7uopfxtsEh/10CM+cDnY9WLpcyANgrzrFofZ2H1tWMtmNjfGyr/is4SKCPQx
         mSg5vwhUCrxdy+osij2j3IsfCYhaXa6YwXILz9+3BQwKr9K8plgTaAuwfKrR4q33ZX0c
         HvL0tn8cnlmNxM8ZzB889rynJe94uALd1GNh9HFdMqBddCIjIZb+czWFwT8l0a/2b3gE
         hCkMXbpk0OI+PFRg+uFKnLbN7N7oz2Cn0tciEOXvsgiArHSRlBYJbfKoPi/wj8Bo1IgF
         8mDUksVywhQ+XrdnMRqDvYRFhHC9N8T1JHlzNf1119TbDxAuAHD+huQ8M9iGB01jFU1q
         XqNA==
X-Gm-Message-State: APuU4Z98egZiZD6AKQhn2Ih3wcUQryDwjrYDMRqFCF+znjLPOQrYlb1b
	jikTg3HUL6OI9c9fN526eE2V7+34dodK/4XMZ/0/jz1i0sLsLE+X1O1ptdTLQ2HdrnpKZpHgJ0o
	QReM/YBf2VcO7vi5/7p5KYmbHQxNKYvvdvQPZ13QbdTOZQ1Cq92oPH+8ksfaAwNx12yFcPBtxL7
	BZ
X-Gm-Gg: AYBFou0c3wXKGsx6ONRYry2EEIrn8/25yGxiYtrUVUN9J3XmrhdgefB4fVatzmXmQz6
	GZAFrqJCfrzqYOHbwI2A2KphYTwiffX/DOwVeV21h/KbHKSq+rnoe/9qgY2PnNQyYxyoyxKdSAe
	BhcknmjHfIh+edlhSY5hN14LPC0Pfzpe295HhYz31d7T7x3l43qT3ZtB74giljhlI40Tuxn1lqQ
	Ka205YBh6a/l8hsUAIYm+DE+BrVtsRbdFfheESiuQnaEsQGhKq1orzsSPlWFsHuW0pLaw9I25DN
	+3WN3rHbOpA7vCvdFpUHGWsysx+efuMKh7wSHLvXFWFRU4ce84w/mqBVULoRwGTZINz49QbrU8/
	jR4l+O3jIKOVpJilJpGGe1O72ppqW03dvAnGrml1JnK8g1zEYeSejLyL9IHY33SvLGnjgX+vbPy
	LaT4WZNChi
X-Received: by 2002:a17:90a:da86:b0:3a0:d7f2:5a58 with SMTP id 98e67ed59e1d1-3b0db60977cmr1689169a91.3.1793977315355;
        Fri, 06 Nov 2026 07:01:55 -0800 (PST)
X-Received: by 2002:a17:90a:da86:b0:3a0:d7f2:5a58 with SMTP id 98e67ed59e1d1-3b0db60977cmr1689128a91.3.1793977314752;
        Fri, 06 Nov 2026 07:01:54 -0800 (PST)
Received: from hu-jseerapu-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0fc1bc1e6sm100032a91.0.2026.11.06.07.01.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 07:01:54 -0800 (PST)
From: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
Subject: [PATCH 0/6] spi: qcom-geni: Add QSPI support over GPI DMA
Date: Fri, 06 Nov 2026 20:31:18 +0530
Message-Id: <20261106-qspi_upstream_series-v1-0-21f43042dd60@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAL/r7WoC/22NQQ6CMBREr0K6tqT9FgRX3sMQUvEjNZZCPxAN4
 e4WiDs3k7xkZt7MCL1BYudoZh4nQ8a1AeQhYlWj2wdycw/MQEAqBUjeU2fKsaPBo7blvuZZIkD
 lqI5QJyxMO4+1eW+312JnGm9PrIb1a200hgbnP5t3kmvvp4D/iklywbNanUBoBXmaXhxR3I/6V
 Tlr4xCsWJblC89vg5fRAAAA
X-Change-ID: 20261021-qspi_upstream_series-850249e432f5
To: Mark Brown <broonie@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Frank Li <Frank.Li@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793977309; l=2393;
 i=jyothi.seerapu@oss.qualcomm.com; h=from:subject:message-id;
 bh=sT9UgwhMsmzsH1VR9CYbGXTbSBlB1pzQsIePFqgsQYI=;
 b=C7A6XrHKQ4XQj59UI1RyunXvtophOtPfyUZ40INZlB0wVQ1WwavhDZi/XQdHdag/KPYoESnrp
 /DA2fyYU2OiCiJkgXkeSKhD9clZFrHFuhY4Ck116NuLNZOju5EM/9dr
X-Developer-Key: i=jyothi.seerapu@oss.qualcomm.com; a=ed25519;
 pk=9vafyYsia0OnBKWSEwhmWe3hPVQfI2T1xOs5dPaFvEo=
X-Authority-Analysis: v=2.4 cv=PLeaavqC c=1 sm=1 tr=0 ts=6aedebe5 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=Z6aUeMXpdRP9Q2--PI4A:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA1OSBTYWx0ZWRfX4E1w5/d6ISQd
 HEolFWaEYZMLs8YQgCvfuM8gcbPZkAD8KIw4O+tp+C+4Htlck4F1yfKfgKlKDJdtQqEuua9auQb
 5KDchFZrjGYLm58Y9gsXs9Lg4CZix/A=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA1OSBTYWx0ZWRfX/U3cjAgk5Tss
 t9UIBMNgdsfpuNWh0yBYOnH7lSqn/LgPHuCg2vzSKcrOm8o8LnpSWM+9g1T26+Dz+Ghn6lK/uqu
 9glRbWEcPTBXXFF6qRFtgQp2600cKzqi12zynWp9pBPPNIoH1ThuE5B17Mp0cdm9f9AV8Wh1wdg
 S9TixhdaIeUccSEoJFNHD8pVU3PU7iofGCWUwpt5ineSN3Dbh1LVDFCTqacFVo0h+EFtvMYcZ/T
 esgV5er0XKyJph9eIUsDJPov5rSAo4QwwEErUiyFBYg1K81Kq5qCbkCbpu4tJDWCcIfug/QgOUz
 mFyA4tNHpN+kloc0U3SNAjZp60o1gi2Bbg90+3UCkTRQB4jOht1DwmxbGhMaKDxr9R/ss9/X6hd
 epeP0P006dFI8aOJbZC7sBmmXNnxXluxNrsN4DKndpAbdYvnNhbqYIeUBj5MDZmALQW6fEQiA5u
 JH4LeykgNkbezj9x4WA==
X-Proofpoint-GUID: l4EjP6g94mQ5402iEWi-0gS-0GSQiuwb
X-Proofpoint-ORIG-GUID: l4EjP6g94mQ5402iEWi-0gS-0GSQiuwb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 spamscore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060059

This series adds QSPI support to the Qualcomm GENI SPI driver using
GPI DMA. It supports single, dual and quad SDR transfers in controller
mode.

GENI QSPI reads require a command/address TX phase, an optional dummy
phase and an RX data phase to execute as one hardware command. Add
driver-managed message sequencing to combine these SPI transfers
into a single SPI_TX_RX command.

The series is organized as follows:

1. Add transfer_one_message() support, including completion handling,
   GPIO chip-select sequencing, delays and DMA buffer synchronization.

2. Define QCOM_GPI_QSPI for identifying QSPI channels in GPI DMA
   specifiers.

3. Document the qcom,geni-qspi compatible.

4. Define GENI_SE_QSPI and update the firmware loader to accept the
   QSPI protocol.

5. Add QSPI CONFIG0 and GO TRE formatting to the GPI driver, including
   dummy cycles, transfer mode and the TX-then-RX command.

6. Add QSPI support to the SPI driver, combining read phases and
   accounting for them in message length, DMA synchronization and
   timeout calculations.

SPI and QSPI transfers have been tested using native GENI chip-select.
GPIO chip-select handling has not been tested on hardware.

Signed-off-by: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
---
Jyothi Kumar Seerapu (6):
      spi: spi-geni-qcom: Add transfer_one_message() support
      dt-bindings: dma: qcom-gpi: Add QSPI protocol identifier
      dt-bindings: spi: qcom,spi-geni-qcom: Document QSPI support
      soc: qcom: geni-se: Define the QSPI firmware protocol
      dmaengine: qcom: gpi: Add QSPI protocol support
      spi: spi-geni-qcom: Add QSPI support over GPI DMA

 .../bindings/spi/qcom,spi-geni-qcom.yaml           |   8 +-
 drivers/dma/qcom/gpi.c                             |  22 +-
 drivers/soc/qcom/qcom-geni-se.c                    |   7 +-
 drivers/spi/spi-geni-qcom.c                        | 455 ++++++++++++++++++---
 include/dt-bindings/dma/qcom-gpi.h                 |   1 +
 include/linux/dma/qcom-gpi-dma.h                   |   6 +
 include/linux/soc/qcom/geni-se.h                   |   1 +
 7 files changed, 446 insertions(+), 54 deletions(-)
---
base-commit: 7079a12d7506b07fb53b54a664bfad5fa9b16d70
change-id: 20261021-qspi_upstream_series-850249e432f5

Best regards,
--  
Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>

