Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B5DC3E274E
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 11:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784804557; cv=none; b=Wr/XZ5MCJJHiwvwZBCsgaPLP6LMZWLWvuTX4qftN25i301hsIsdpeMtfSzTATymrEnzem8AN8KmnyB2rFsSuf4Jk7SIvLtvdlPB/RqiZRQuv0Pzy3KdFurGPlk8N542S7XpDLhnzxvA6HRY7Fjmey2sGaWwdXIbN1IaP0hCoCdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784804557; c=relaxed/simple;
	bh=lY+JH9hWn1KDlSMkKaha7R0dkBbchodNMn4JgHPAPAY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=MrmKlkuBpuTVn2ZT8zmtWIVepQ21zXGFalVZsljD/xa5jBKksib76PVafNhgZljSMUh9SEVuAU8UwA0TlGLzjEB1j/waHaHhjQ5ItaDxeaReAfSol70J0bcaxalzTL0JoBouKGAt74gr1cPPS/BIalw4bJzlg1gHwUYD9EicCoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BjOYsmOG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O17BfjrZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BjOYsmOG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O17BfjrZ"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N8qXgU3648567
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 11:02:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=OsSJorsSg8qSR3NsOFSwBY
	0pzaKrT98ghwuHcUdyRfQ=; b=BjOYsmOGbPrG3QHkURs0VMUTL+ptSeoTY07xBE
	Jv3HAqOG5rHA48xEhs7IuiVrPHJrn9Rg3VEJBZi0NypUKPc3/xAx8n5I9/vferwk
	1i7LnSucwrDXUWjmoAxh95oWf+GuU5gf+leyU0fRcaBNc/UfNjBDi54flid6WCsA
	hxe4LnTfPUc72Jx1Wyd7rnDfjlWSpvG1zFgom4kody4ah3bst+3jJvdWG8rF7tjL
	8uLKM191L0pdU/Dtz1JqN+0uJlEwu5I8NzMxXZdxLJYJnouaEc+HJiHIPRDYsSw9
	UhkHm1kS6uZVGHfu5GoOV9bdNmS1qs33uQowTZ0Vq3oLBSpQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk6c7jn6j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 11:02:35 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cb5cc1e139bso398739a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 04:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784804555; x=1785409355; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OsSJorsSg8qSR3NsOFSwBY0pzaKrT98ghwuHcUdyRfQ=;
        b=O17BfjrZgxOFUpIR4YUwfIdC3l8830l35vI9stN0SACAb5E3Zi1Odmzf6wRidTLXtm
         NupWIo6a20vs09JXSCtxsd1nI4OBn2JWH4s3V/18/xLY/Jn05nDEh68GadHaQSPBTVV/
         tXkjqkf5CkKE4eicxSD0a8XJLsaHPE49lWWLExjUyIUqFmtEtgbt8sPoFgCbIMTWqobF
         Yv+KbIJR5esKx6rmexNH9SBZa2ciwCKiE1UNM0PoV14VnUExD4JGjtHw6K5Mox/LxCmV
         OSYEgVmIRgGOivwwaarbzvjwdP3hiW/IuWqt1qkjxYO+/GkDoCjDg2Mo0Q/TvAlzHUAa
         Sj9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784804555; x=1785409355;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OsSJorsSg8qSR3NsOFSwBY0pzaKrT98ghwuHcUdyRfQ=;
        b=ZRp8jJMQ7QTasmTmO/Diqv08ROQyGMeFYA1erl0/aC+Eg9XjLQGEO8k1paDrAT727M
         p+B9xSSxR/WWxKm+oIbCqSArBC1g7OfSC0sxTlHmuc2EvWWn7BQMRk0lnYkEHgk/pGZ7
         FQ9rgzt7OBGE7xapcQbWmJCuIsWG0MsjN24DW/lQ7nlWckSSAIhhZ6fiZJ5QstrdCFHH
         C3esPDA1cjtVwGjIB2cMXZUJzYkx74FyhyvvXb5hdgXl9XZjxrO+4CNgdo+nLxT6U1mF
         2GKSpyHmGVczsxvAnVuAiYzXb2zwOU7Fzm9ppu/u24LvTsPm6g+b1AZZD1ZtsacCkwge
         yH3g==
X-Gm-Message-State: AOJu0YxjL5Se0mnXUb85K2mrmJybEMd1Imnk6LU3b0Ig4Kotwt6vatpw
	MYnMEjNgMVC39jZFdvnPvLUNu0pEPDOUSNYEpwR9xXRf0oOE5PcRm6+6dhBseyIv524vNRdd/XR
	txG02ZZzNsE+0+911bvA5OXrb5CyyCO9acT8SYFYQd8Wlw0AfIYzqg6vv5KFCHyDX1k9F
X-Gm-Gg: AR+sD11E03T8BpR+PKnU2EnFfAO+npRRsTIVpDqCPv5pkTRiclzsikhA/LFt9tfatg1
	XzvxPAmO4SVqSMGSVokPN4IQzstsV7LMnKg+4aWgaK6wqU6BRoB0o6gJzfvkZo4DlyLld4Coc6j
	CXf2h1Q4dmZMszE/0T8OYAr8/tnBJjMMg7Jmla8mS5mnHF4fVchtF+tMovY8npWmR4IZd9TsuFo
	Ug4z1es+vFW1p1DWapQ6G+vfFF66Kbp+H9dFc4TS1hhIdDp0SKZM+MlP0CYZOCxyNpbsC17TuOc
	dgHJ6MgMTQ6k52Zc0RPtVSEGAX8MvcSSQhYB5NXW5gQfFvJwtmXf20HuLmL8NAtHEQfzvY2UQqp
	lONxlg10P2mnzDl/fyw==
X-Received: by 2002:a05:6a21:a395:b0:3c3:67e9:660d with SMTP id adf61e73a8af0-3c44b243feemr2447538637.60.1784804554891;
        Thu, 23 Jul 2026 04:02:34 -0700 (PDT)
X-Received: by 2002:a05:6a21:a395:b0:3c3:67e9:660d with SMTP id adf61e73a8af0-3c44b243feemr2447498637.60.1784804554449;
        Thu, 23 Jul 2026 04:02:34 -0700 (PDT)
Received: from localhost ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e0818e4sm18876115eec.22.2026.07.23.04.02.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 04:02:34 -0700 (PDT)
From: Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
To: andersson@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        bmasney@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
        perex@perex.cz, tiwai@suse.com, srinivas.kandagatla@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org
Subject: [PATCH v3 0/2] Add LPASS VA CSR HeartBeat pulse clock support
Date: Thu, 23 Jul 2026 16:32:29 +0530
Message-Id: <20260723110231.1586417-1-sarath.ganapathiraju@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: NxuXhnwVMf4GBg1cukfAOGOW4bgmbgvy
X-Proofpoint-ORIG-GUID: NxuXhnwVMf4GBg1cukfAOGOW4bgmbgvy
X-Authority-Analysis: v=2.4 cv=baZbluPB c=1 sm=1 tr=0 ts=6a61f4cb cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=EWEnZrRmfLhET7K6etEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDEwOCBTYWx0ZWRfX72CYSPwT8x42
 eLPFlP2vzGJUt95zlpNyXxPEs7U7wO2vD8KsE4HhyQriSnWSzUi0u3PonnYB696UYhmE+1oBH8B
 5ilkot3vwKINPsYsyTVIWXpWOBAsTMQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDEwOCBTYWx0ZWRfXyfdT92dkKo4F
 TfWlSxT4PuU0kPmaI0n+nlOl5slSbvpoNkJnnZOhNZsr3Crqecav+Mg2BLH1eo20Q8khyOo1DiB
 HSQV79/97V+rqjg4FgF40X0ZT75iMfuXLMUZCGR6cyKMYm2gTn9GEAqxoQd9m7BUQ0b9ohnFIl1
 b0M3QmF+etM8X0wXdigx1FC89tZisxWUJ69i8DFf1P6lUZVcbmOUr92QOYYNx8xsHlveFZxwRWK
 P9jQqPK4sFKKdV05yg5D7zZ8YVWN44Z0M5Mq+My7dnDX2jv+436J+RvOcqX6Xilogp1RekviV/m
 zfOO4hpouPA4Aa10NCP2hYGV4ENbpONxPecDqt+AXbkBCVW/EPIJ9lYKuBwMp2anPQirSa3qxXf
 4HXjAk9kfaiK73IYrTHsMHCuJOybMdQYC8LfSDpatKd61SdIFovXu8U60bPH8Wms6tdMkLEt3J9
 0116VL2jjUoDgRx4mCA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230108

The LPASS VA CSR block contains rate generator hardware that produces
a HeartBeat Pulse (also known as RateGen Pulse). This pulse
synchronizes the start of the DMAs and Codec Interfaces for the audio
usecases and can serve as a periodic wakeup source for the DSP.

This series adds the DT binding and driver support to model this
rate generator as a clock provider.

Patch 1 adds the YAML binding for the new qcom,hawi-lpass-va-csr
clock provider node under Documentation/devicetree/bindings/clock/.

Patch 2 adds the lpass-va-csr driver under drivers/clk/qcom that
registers the lpass_heartbeat_pulse clock and enables/disables the
rate generator via regmap when the clock consumer requests it.

Signed-off-by: Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
---
Changes in v3:
- Moved the qcom,lpass-va-csr binding from
  Documentation/devicetree/bindings/sound/ to
  Documentation/devicetree/bindings/clock/ since it is a pure clock
  provider with no ASoC dependency (Krzysztof).
- Moved the driver from sound/soc/codecs/ to drivers/clk/qcom/ for
  the same reason; sound/soc/codecs/Kconfig now selects
  QCOM_CLK_LPASS_VA_CSR instead of carrying the driver (Krzysztof).
- Rewrote the binding description to explain the hardware instead of
  duplicating schema text (Krzysztof).
- Dropped redundant reg and "#clock-cells" descriptions from the
  binding (Krzysztof).
- Switched from unevaluatedProperties to additionalProperties: false
  in the binding (Krzysztof).
- Renamed the example node to the generic clock-controller@7ee0000
  (Krzysztof).
- Dropped the qcom,lpass-va-macro binding extension patch — no
  in-tree user yet; will be resubmitted with the hawi DTSI changes.
- Link to v2: https://lore.kernel.org/linux-arm-msm/20260717-master-v2-0-ae200627ad62@oss.qualcomm.com/


Sarath Ganapathiraju (2):
  dt-bindings: clock: qcom: Add LPASS VA CSR HeartBeat pulse clock
  clk: qcom: Add LPASS VA CSR heartbeat pulse clock

 .../bindings/clock/qcom,lpass-va-csr.yaml     |  49 ++++++
 drivers/clk/qcom/Kconfig                      |  12 ++
 drivers/clk/qcom/Makefile                     |   1 +
 drivers/clk/qcom/lpass-va-csr.c               | 143 ++++++++++++++++++
 sound/soc/codecs/Kconfig                      |   1 +
 5 files changed, 206 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,lpass-va-csr.yaml
 create mode 100644 drivers/clk/qcom/lpass-va-csr.c

-- 
2.34.1

