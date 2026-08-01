Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5557336D50D
	for <linux-arm-msm@vger.kernel.org>; Sat,  1 Aug 2026 07:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785569882; cv=none; b=glUXOAJ13uSSpN8Rv+4yCDLk+YyXGo7k8voTOKiSAg5L1au7LJIhTdcZk4H19gaHZEKt1LjZElxFLj7mns2uhKcUW/YIip7bP7/JJbDcHWD2tN72AbxtRbbksZZ2i6m7LvRLU83k/Emm1ZvRWbTtKQHSM/itbZjQkr3LFzD+9Xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785569882; c=relaxed/simple;
	bh=ZfKQ52KqzJLJ3KvWJDTuyUgE1zM9KzUtjKE6mxAiqTc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ZOSyRWc744VDHBI2BejeoWZSb/zDQNByRwWF44MzrZMq+hFEXzaTnvFB3R3fFUcAQLqf7DMaRgeJIkvthmsVmjtig+IeZUQO69FHvvOILADqAWzw7R1s+zpEjZU8j+53+6HRyB3MGG8n+sQRcDKx0rRaJr8D704m/z6bGOL6cAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pHJ60p0m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EXZzZLAD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pHJ60p0m";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EXZzZLAD"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6713M7tF2061133
	for <linux-arm-msm@vger.kernel.org>; Sat, 1 Aug 2026 07:38:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=r/s/3BWf0q6O+MpMO/q9G3
	MuFcK9Jj78tJcmwnZssXY=; b=pHJ60p0mgOCwA9oLFnOTnouLL+FmysOgO8lP09
	zOgFtaMP3bEQeK9S2QRLdASV4eGYokCp8vwTQs5UfKgWCjoz+N9Ltw7vkqUhVevs
	7G7CADskdax70LbjDXVRrBHJ0Io8zMHDNgotAb2OXqlDlAIFwJyUkuo15ZdN6eEi
	Q2cdxoarQJFkAH+lhTRMTcIX8kaFWaguTQAQHGXOw1/W6MG5Q9P+WjcBMupWBubJ
	AtOvDFHe8Ox8RUzZeEB6YAXhkNpCioXSexp9vDaCnwZwZvgAOd728SqFPqgPvzVb
	XVkuGK53B04tnd0FTYnhvHWpQxy0JX+2NFUboEhvdmcGTbMQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs8tx0fn5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 01 Aug 2026 07:37:59 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84a251c2e3eso3432349b3a.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 01 Aug 2026 00:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785569879; x=1786174679; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=r/s/3BWf0q6O+MpMO/q9G3MuFcK9Jj78tJcmwnZssXY=;
        b=EXZzZLADi+yK8W40y2XSLJ5cdS9VDjlE0/zF0dnkZ0tslp76t/wux/bEcT0zDXbDzs
         gs0FQBFYQkf9qm8XaY+p0EeD/r6jqBGTPiTTOQQVGEyZ6sablBp/2iQxBMNM7dEpRXVS
         TGNy4LEKqeCs/OaJMzr2l7Z11lgTXNLRPiqpVTZ3y5C6CaXplu74jhGlFajjDhfxqXg/
         RnKcAi+iQW2HyvNpubvzMJ/Gp/TPKr0y8joJJ/1p6hw6KJdkJ9i5tI+CsnXTw4F4co2D
         i+46xejBvSIpaYlJURLwVNqYnJ4LTHZYwmzVNUMK7BR4rPPdi1Jks7JYUYuFbjFptCqq
         rk4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785569879; x=1786174679;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=r/s/3BWf0q6O+MpMO/q9G3MuFcK9Jj78tJcmwnZssXY=;
        b=EeyjDiL+ltD5tYHUHfRbTK1LPdz8K+IRc50HkgebM2jV8ViBx6bxJ7J5WEYtkXjlp2
         2kI03xFoXYdhkY41AbY37xZbN/3OoHTylYRNUpZ6kxggS/ME/5xt4zbEZwnJKuzpjMZv
         JJ2rqTSIlqoMUQVA5CUNcNRS0MP8CVKjClL4J9L7/YReHRgqWcer/7RChEJYYUTrqMyM
         rNXBaoft7zwRCo+IkeUgjz0dDypcr6U6UGARr+X8g4supcolortMwSFuNazbzpnQaWL0
         sd5MHnsTXb/atQ2kl+6wNAQNMxUM7VRoh8YtZLRjbRe3MeqIJuCFA/2X4n9vEDHnXzyy
         50BQ==
X-Forwarded-Encrypted: i=1; AHgh+RrmsEeLqRNo4tcw6t7oaUkLHcI0prMBYvas6KA1uGlHx2PBXVO0seuPevXp2/yzrrM315lF5AgRWfW0U8g5@vger.kernel.org
X-Gm-Message-State: AOJu0YwjN2GT+u+2fkY7oUCcl7nghpCK67UCol/IvyRCGaiIECJUIy5r
	8z2BMGpZJfHYMoFtAIQjxdk9+MmSpSTMFq2DOKfnUCuFBrxjzbslArwEm0WlzqtnZEGoejGneMi
	WIac10VnQj0Cy3dHKv+LUVMEZ357W2EjaiN2SKEnQykWiruqGuodFGD/nTzy56M87QDa5
X-Gm-Gg: AR+sD125O2xT2kJzAvBBBlY8FxPcUmcJNJ4+jikuFWfB/o27lVGuq3Rlm52mMSN2nH4
	76Myb6wbxqy1HOr3Rgs9/O6LyaVvUrRhUpUE2fneWyFY0zqWQEVA/AGYK2waz6UqJbGZlpPHIFt
	pRkCrA+QwOZUg7EY+jq+jswzPwca+4S9oJw+oRhNrX5/XNRPolxK1aIXJ2/abrwtRBaUxvzelQk
	w1PVRUv8KEEsRaxYdZnQwMOXNTnGwx6UD/bsjWULLHzqBKXcCojIZa39/0sd638FjCdUBC+jZVD
	LCKt3tqRSSpVxUpuCFu4iNFxf+k6wiedqMuxPYimlfejSkALm8Gh4WeFpypRsKUIIYOtqumghuB
	mOjrML30t+feb+MWMpJq1X8/UT0csEzRrnA==
X-Received: by 2002:a05:6a20:7f85:b0:3b4:6af4:bdd5 with SMTP id adf61e73a8af0-3c91a7ad9f8mr5394115637.15.1785569878920;
        Sat, 01 Aug 2026 00:37:58 -0700 (PDT)
X-Received: by 2002:a05:6a20:7f85:b0:3b4:6af4:bdd5 with SMTP id adf61e73a8af0-3c91a7ad9f8mr5394088637.15.1785569878472;
        Sat, 01 Aug 2026 00:37:58 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e045016sm20729985eec.19.2026.08.01.00.37.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 00:37:58 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: [PATCH 0/4] media: iris: Fix DMA coherency, power-off ordering,
 and frame interval issues
Date: Sat, 01 Aug 2026 13:07:26 +0530
Message-Id: <20260801-iris-fixes-dma-pseq-fint-v1-0-aba0cb22f6ab@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADaibWoC/yXM0QqCQBCF4VeRuW5gXU2lVwkv1D3lBG22oyKI7
 95Ulx+c/+ykSAKlS7ZTwioqr2jITxkNYxfvYAlm8s5XrnE5SxLlm2xQDs+OJ8XbGGduivLc+1D
 VKAJZPiX8ZlZf27916R8Y5u8fHccHc/Pe4nwAAAA=
X-Change-ID: 20260801-iris-fixes-dma-pseq-fint-8345b2d67e3d
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Mansur Alisha Shaik <mansur@codeaurora.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785569872; l=2005;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=ZfKQ52KqzJLJ3KvWJDTuyUgE1zM9KzUtjKE6mxAiqTc=;
 b=dbCqDP8H3Z3h+gS8su1ndd3JSKYIsmZOtE7J8QzhaUfq8htsl1gD7D7P5KvOO1rIksUTVgZmU
 B1YmRnzUhIzBDfMgP+qe6SMoyPFYaLWoWKvPIRGuDA49tv7kGs32wjs
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAxMDA1MyBTYWx0ZWRfX89touXBI4QA+
 2ROtvXUOC69OwNOZiXjy4mPwlVuau8MK++/FbmikPtUE9U37B91mTyvG4u3jSPfpDSrCLzsllVA
 0BpyH/EfNRP5wUsIfGBP+ULZbKoCx4LqXjW0QGYnXBdBD8tIEgMKXzMfHwteZOjyFkzAL4zy3a6
 rWF9oJC7TTJ6ILAij1+DGsoua0E0VYlXI7mV6uhXR0WGzkDfaTC7DsRbDok3VZhEYdJqoyTWD3c
 bUme1Fsom5umLF+NakbDkQR7LRkJWPcp+4j/mrJJCqtf7INgSX30bRcD20gfFw5DIaWE0MlBRnh
 ScOPuGYp/93VKyJxWEB1HhDAk14PMRJfHBTqBBYCsSiwYhV+87tRwDAtQF6Anx0yruJl3gxwf98
 5yu0oRhxPS3hW8Ptk6jV2N0swjwuL9FzcMDRMzQd3FXKienPGns28+DyWAg2AxTjLB4ghqY9FmK
 XRh4rukS1Y6OONC0bVQ==
X-Proofpoint-GUID: rHzwfDZrW3BJIsO6rZHs4tzPO8_WyGj8
X-Authority-Analysis: v=2.4 cv=T9C8ifKQ c=1 sm=1 tr=0 ts=6a6da257 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=-gD5yWuuSdaRjr57sJYA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAxMDA1MyBTYWx0ZWRfX3lfz5YeeRsER
 ipsxNECZAh/UUah4jNzSA7jNPMHZGSGzMDBg3D93uX42yCit3imGoZMhMpbwyy7AcMFYDhZVmSm
 fbPmubwr31MQmEGpMfUYaS6fd+ERq1w=
X-Proofpoint-ORIG-GUID: rHzwfDZrW3BJIsO6rZHs4tzPO8_WyGj8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_07,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 spamscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608010053

This series fixes a set of issues found in the Qualcomm iris video
driver and the venus/kodiak devicetree bindings:

- The venus devicetree nodes for sc7280-based bindings and the kodiak
  platform do not declare dma-coherent, which allows the CPU and the
  video hardware/controller to see stale or inconsistent data in DMA
  buffers they share. This causes hardware faults on input and
  corruption of captured output when the client dumps it, observed
  while testing with some higher resolution clips.

- iris_vpu_power_off_hw() disables the power domain before disabling
  the associated clocks, reversing the correct power-down order and
  risking clock-controller access after its power domain is already
  removed.

- iris_enum_frameintervals() advertised frame intervals as
  V4L2_FRMIVAL_TYPE_STEPWISE with a fixed step derived from the
  maximum FPS, which excluded valid framerates that aren't exact
  divisors of the maximum and broke GStreamer caps negotiation for
  those framerates. Switching to V4L2_FRMIVAL_TYPE_CONTINUOUS fixes
  this.

Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
Vishnu Reddy (4):
      dt-bindings: media: qcom,sc7280-venus: Add dma-coherent property
      arm64: dts: qcom: sc7280: Add dma-coherent property into venus node
      media: iris: Fix power-off ordering to disable power domain after clocks
      media: iris: Fix frame interval enumeration for non-divisor framerates

 Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml | 5 +++++
 arch/arm64/boot/dts/qcom/kodiak.dtsi                           | 2 ++
 drivers/media/platform/qcom/iris/iris_vidc.c                   | 4 ++--
 drivers/media/platform/qcom/iris/iris_vpu_common.c             | 2 +-
 4 files changed, 10 insertions(+), 3 deletions(-)
---
base-commit: 415606a7be939835db9b0d6b711887586646346d
change-id: 20260801-iris-fixes-dma-pseq-fint-8345b2d67e3d

Best regards,
--  
Vishnu Reddy <busanna.reddy@oss.qualcomm.com>

