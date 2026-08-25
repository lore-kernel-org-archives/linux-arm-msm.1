Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95DBD37DAA2
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 18:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787683241; cv=none; b=DL743b8/5w6UzYQeGaZdPOa4wru9bVa7VvngXKItlvC6+1BD5/BaGFPkAcZx1CIhJ8RwrwWzQftQ3M0Rw5UZfIYty8ygy56EW3MtQIiojUcDj+CJwWZV9hirP/7jVlMK2XluKAWPmRZ+5Ukd7pyNXlh/S0Xy0ozroyyDb2wjpzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787683241; c=relaxed/simple;
	bh=U732/bKL9KOtGbZwCR05ZiwZPYRkE195T3YMcJBNrV4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=GuJRQafanLzsz9vZ04UTM8fmayyWhOFyXBg7/gG6AFsIfWX3ZEoB0gieHxDprwtU2XvCbN0JZ3hT0pglIA0uuj8kPThiE6iTmkk9+1iCk9Qu3+0Zb+zUpNUbPrtF62j4nRn1CuObtYwzBvxSV6YaRiyEkpP/bjpKVFhXAub+nQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hWR4NTuM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bGIr7aOh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hWR4NTuM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bGIr7aOh"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67PHdSqk1472567
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 18:40:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=I8q5u0Zl1OkC72vI6wr9C2
	8amLW/Wb386bz5otg5Lds=; b=hWR4NTuMQ7+WBPsx9ImRcVUTl1Xw2gMZx6mvnt
	jml5D2D7vg5ijcAPlKU19h0YQuPSBRNKDshmwL96jdeXBvRSwbeKUQR/EnPnOoXx
	UoYiX+IjURBvZ4qLzaV4Njf4c1yhAoDfXG1sWn49SJToFS/p6lzEQ3ORGsEs6sUK
	j8xXrHwutxCU/0jD4oGJB6q6VSTNES6eWruHT7kXshPI8MxXfFMXIaN8aDieA1pj
	yDPlIfeCoVZtV50X8nvQFARV2Bv18tM6XwsFFeLndmYl9BLgrafBUplB4nkskGiK
	gBL+fTAiTxHHCYMFxc756ju4854CrYa1V7PJcKhAOorfNubg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9f9urc55-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 18:40:38 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d63bad3d09so2176575ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 11:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787683237; x=1788288037; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=I8q5u0Zl1OkC72vI6wr9C28amLW/Wb386bz5otg5Lds=;
        b=bGIr7aOhmIsxCoC6fC3uNAvGGs7Km36Wy1jLacuEex3jgagr4gMm2oKqMVT8/d3pyL
         GT4qkRMo7no684vMqdVTVTJrH+6P27OcaEOsHNIMjGTMWlM84JCUE6XsOeE/x8kiP3PY
         i8996KEIRy8DvzCUsldyN2NLk5PpI2tA/Bo4cVn7txx7E5818OEuEbwwkvcX8gbQRaJ0
         XuoDdj/B6BfnrU1/gqnF6EQrofvBYrBCNtcnC4rNHq4tnO5JA4HqlBLblN2ZxKVoEhHN
         b/hHJLLiOBJfj0YlWs4D/YMq+/9YQlVnARtOyTKxnJVa8E8reTqniAumx6sBo70JoSQ5
         DokA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787683237; x=1788288037;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=I8q5u0Zl1OkC72vI6wr9C28amLW/Wb386bz5otg5Lds=;
        b=OfLIsP27XFY9qLMnKGgX7tel5m2wcoel3e0rIdfYqfBRmcY3ir0teqvsZVW8Y5re6B
         Eqg62y/qt3avT01XN1Y+z8cJyEGcapyASu8ZOrynPKydrf/6xvq7ZPrcgZHhF8PgkALw
         g51J1JsLBQ2wAV0AuhdtKHxJp+S+MDjT9IoweqjwiqzuFQDK/lxWYmH4bWNn8jcm32kb
         jCQRrg0txsOnBL0h77RPMYDsrncOiJyQuZU/QutMdQZI9YoCr/7YW7Me3AnA2Z4vk2eh
         D98hCh/r/owu5ipvnsEtz20OegA16OpyveXkd1pH8ExwhJuan+JCJ+EfNB/5dhtl7lOI
         kZGg==
X-Forwarded-Encrypted: i=1; AHgh+RqKGFjEf93nLWR5v+u8LHi2gkRzzRTcKRA9Gzlk+384Xc5csHuhacND+oc6JkYpGSWKAypmotVEAhqD89Uj@vger.kernel.org
X-Gm-Message-State: AFuF++mOFKkb7Qe5dUB30k23HE50vUtD2nV1vbA0H2eYMDlN+MVtTi7f
	IFjqXgLz0VaSMIbpmfpTXTNVQS5j8hGncmX+q4UDy8swd4VDpjjPGIYDzukCFRv456kDs+rmDPY
	w6KGgs1tt/z9CGf9vEmbZ3zkgPAAdVAJNk4S7ojY0J1gpRx7jMztKRKiL/p9rVTMd4nQB
X-Gm-Gg: AR+sD12AY1MBgVnISydWFXj9pJQU+hcCgTnpcQm/iUOmoToJBWkq0FtZ3o813A5n0H1
	aGPSQVbwt6MGoH3tnVTDHesBGebl4MNlcFppK3I2s97/DbnPHiDvdSnTRo/JM/Iy6J+vplXbmwD
	Lakwj2tefA5g+TKY4M+TNyT41rNzEYv29QqVU7+V9IxltIMRzR6O+q9BqV8ELPmU8z967j9kSzY
	n+wPSWNNDhfZ+LEQNh8pxRzUy/4aTr/uc+dA7mMkRKJ2BmaYwyDZnD7Xyznmtscg/S0YPgCcZRr
	YeepM5geLQ43iPbceSfdIo9Mj/YMDvzpCfinF0N4hwMpwr4Bx+bix8AYKLSPbpjjvBR4znrsYjT
	7nlgz35bwEuBthirFSPzn3IWUFeYm
X-Received: by 2002:a05:6a20:9f93:b0:3c4:3321:4fe9 with SMTP id adf61e73a8af0-3cf7810f7a6mr933979637.7.1787683237156;
        Tue, 25 Aug 2026 11:40:37 -0700 (PDT)
X-Received: by 2002:a05:6a20:9f93:b0:3c4:3321:4fe9 with SMTP id adf61e73a8af0-3cf7810f7a6mr933873637.7.1787683236623;
        Tue, 25 Aug 2026 11:40:36 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3283fa89e8fsm256117eec.8.2026.08.25.11.40.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 11:40:36 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Subject: [PATCH v2 0/3] ASoC: qcom: enable audio on stage-2 protected DSPs
 (mDSP)
Date: Wed, 26 Aug 2026 00:10:11 +0530
Message-Id: <20260826-a2a-shikra-vmid-v5-v2-0-c3dc62354eee@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIzhjWoC/yXMQQ6CQAxA0auQrmlCGorKVYyLClUqAcwUJiaEu
 zPI8i3+X8E1mDrU2QpBo7lNYwLlGTSdjG9Fa5OBCqqKKzEKCXpnfRCMg7UYGcvbhStiYS4FUvg
 N+rLff3p/nPbl+dFmPk6wbTsteZBydgAAAA==
X-Change-ID: 20260825-a2a-shikra-vmid-v5-4975625a554a
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        Mohit Sharma <mohit.sharma@oss.qualcomm.com>,
        Pratyush Meduri <mpratyus@qti.qualcomm.com>
X-Mailer: b4 0.15.0
X-Proofpoint-GUID: TvAn60J03m64uHwuQ6Nty-hVQflF1hyY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDE1OCBTYWx0ZWRfX7F/qE+Ko5B80
 xGs+7bjd17L3o9ZpyTfzm3aAYqsYPvwBcHr1BALExre7cmWMkWeBqB3xRJVe/epUg/QLxO6k7F1
 dWKGyK/7kEiKnyZPQDoe4EJD4bNw5o3RdP2RGiW28IIfmj0HUJGt02YxT74IS/T7i2yadybyqLG
 yxMGlZsBDl7ksEooMfuhay/xvpmtY+zuuPrCB137/9gdtmXQYdydfABqnAdGQQqgRKk1vbT9FHN
 6gwEbgRkh9zq5QPteS5EyVfiuS3jwzPkhMCulPEo6ACaZy3dhSX8yow587QgXzGPnUB9WOPizrH
 amhGnuukg47ggQccmLuhJpdg0Bh0jfITWD5hR/dPe0ouSsmcs/X7dKjvXyvBhQbTEeWhCa2SJZl
 FaryUo7Nd4vusB9LyOUbkxPMaeNy35x4M1Yn6Rz+hhNLaGo1gsFrNld4SjRC2/g6ti7QdZbJmYn
 W42nr/gBxH6deYZPEXw==
X-Authority-Analysis: v=2.4 cv=acNRWxot c=1 sm=1 tr=0 ts=6a8de1a6 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=qNABUOcEAAAA:8 a=1ord-j13h21rUb-LqoQA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22 a=Ytm653ucTKQjCvbzLygB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDE1OCBTYWx0ZWRfX6/FeJmO1FQ3l
 QUu3JgJm9o/iAUKnLWT0rTYysZkJt4a54KM2wuINp42Wa7IxM4kIA2NOqUIYfp54hSeUjWzvjh8
 1qW75EL+1k8TcreF5aeyVNiNxzDsbYk=
X-Proofpoint-ORIG-GUID: TvAn60J03m64uHwuQ6Nty-hVQflF1hyY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_05,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 phishscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608250158

On platforms such as Qualcomm Shikra, audio is served by the modem DSP
(mDSP) rather than the ADSP. The mDSP runs in a stage-2 protected context
and cannot use the SMMU, so the PCM buffers it consumes must live in
reserved-memory carveouts that are handed to the consumer VMIDs via a
hypervisor (SCM) memory assignment. This series adds that access model to
the q6apm DAI driver and its binding, alongside the existing stage-1/SMMU
(iommus) path, which is left untouched.

The two access models are mutually exclusive: a node carries either
iommus (stage-1) or qcom,vmids (stage-2), enforced in both the binding
(oneOf) and the driver.

This supersedes all prior postings. The v1 was sent as multiple
independent series (VMID binding + driver, memory-region binding + DTS,
and a standalone carveout patch). Per review feedback from Mark Brown [1]
and Srinivas Kandagatla [2][3] the binding and driver patches are now
consolidated into a single series so they can be reviewed and merged
together.

Prior versions:
v1 (VMID binding + driver + GPR domain):
  https://lore.kernel.org/all/20260609064038.492641-1-ajay.nandam@oss.qualcomm.com/
v1 (memory-region binding + DTS):
  https://lore.kernel.org/all/20260618113509.2025881-1-ajay.nandam@oss.qualcomm.com/
v2 (carveout SCM assignment, standalone):
  https://lore.kernel.org/all/20260624123748.502781-1-ajay.nandam@oss.qualcomm.com/

[1] https://lore.kernel.org/all/97cab297-ef92-48dd-8331-71aac0b51538@sirena.org.uk/
[2] https://lore.kernel.org/all/39e90d95-0bae-4eb8-96d4-6e39aae432b2@kernel.org/
[3] https://lore.kernel.org/all/02eee0a8-8c0f-4b0c-acc2-05dc436e5a85@kernel.org/

Changes since v1:
- Consolidate all three independent series (VMID binding + driver,
  memory-region binding, carveout assignment) into a single 3-patch
  series, as requested by Mark Brown [1] and Srinivas Kandagatla [2][3].
- binding: combine qcom,vmids property, memory-region, oneOf constraint,
  and dependentRequired into one binding patch since all changes go to
  the same YAML file.
- binding: rename DT property from qcom,vmid (singular) to qcom,vmids
  (plural) and expand the description to explain VMIDs, the hardware
  access model, and which platforms require this (Krzysztof [4][5],
  Srinivas [2]).
- binding: make iommus and qcom,vmids mutually exclusive via oneOf
  rather than keeping iommus unconditionally required (Krzysztof [4]).
- binding: correct the qcom,vmids description - SCM assignment replaces
  the buffer's owners with the supplied set, so the driver adds HLOS to
  the destination itself; reword to say so instead of "HLOS is always
  retained".
- binding: add uniqueItems to qcom,vmids.
- binding: add ranges to the reserved-memory example node.
- binding: fix qcom,vmids example from two separate cells to a single
  uint32 array.
- binding: make the qcom,vmids example self-contained by including the
  reserved-memory nodes the memory-region phandles point at.
- binding: document that all listed VMIDs and HLOS receive read-write
  access.
- driver (patch 2): merge SCM VMID assignment and carveout buffer
  allocation into a single bisect-safe patch. Move dest_domain stamping
  from every packet-allocation call site into the send helpers
  (q6apm_send_cmd_sync, audioreach_graph_send_cmd_sync,
  q6prm_send_cmd_sync) and the four async data-path sends. This
  centralizes domain routing at the send layer and avoids threading a
  dest_domain parameter through every alloc helper. Suggested by
  Srinivas Kandagatla.
- driver: rewrite commit messages to clearly state the problem, the
  platform, and why it fails without the fix (Srinivas [3]).
- driver: move SCM assign/unassign to probe/remove lifecycle matching
  upstream patterns (rmtfs_mem, qcom_q6v5_pas) instead of per-stream
  open/close.
- driver: guard the reserved-memory per-stream buffer size against
  size_t underflow when the pool is smaller than
  Q6APM_POOL_MAX_STREAMS * POS_BUFFER_BYTES.
- driver: bounds-check num_carveouts against Q6APM_MAX_CARVEOUTS before
  recording a runtime PCM carveout.
- driver: track SCM carveouts per-PCM and reclaim only the freed PCM's
  region in pcm_free, instead of unassigning every region; this also
  stops num_carveouts growing unbounded across new/free cycles.
- driver: log SCM unassign (reclaim-to-HLOS) failures and keep the
  region marked assigned so DSP-owned memory is never returned to the
  pool.
- driver: reject qcom,vmids and iommus present together at probe.
- driver: of_node_put() the iommus phandle args; checkpatch/style
  cleanups.
- driver: remove dead runtime->dma_bytes assignment in open() for
  managed-buffer path.

[4] https://lore.kernel.org/all/20260610-silver-pelican-of-agility-86fcbc@quoll/
[5] https://lore.kernel.org/all/20260622-whimsical-charming-seriema-dcec81@quoll/

---
Ajay Kumar Nandam (3):
      dt-bindings: sound: qcom,q6apm-dai: add stage-2 (SCM/VMID) access model
      ASoC: qcom: q6apm-dai: add VMID-based SCM assignment for mDSP buffers
      ASoC: qcom: qdsp6: generalize GPR service domain

 .../devicetree/bindings/sound/qcom,q6apm-dai.yaml  |  72 +++-
 sound/soc/qcom/Kconfig                             |   1 +
 sound/soc/qcom/qdsp6/audioreach.c                  |  12 +-
 sound/soc/qcom/qdsp6/audioreach.h                  |  22 +-
 sound/soc/qcom/qdsp6/q6apm-dai.c                   | 373 +++++++++++++++++++--
 sound/soc/qcom/qdsp6/q6apm.c                       |   8 +-
 sound/soc/qcom/qdsp6/q6apm.h                       |   2 +-
 sound/soc/qcom/qdsp6/q6prm.c                       |   2 +
 8 files changed, 455 insertions(+), 37 deletions(-)
---
base-commit: 3d5670d672ae08b8c534b7beed6f57c8b44e7b43
change-id: 20260825-a2a-shikra-vmid-v5-4975625a554a

Best regards,
--  
Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>

