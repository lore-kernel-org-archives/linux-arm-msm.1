Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E0A546984A
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 10:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789727984; cv=none; b=cD27joQ79welwwOJ39l9lRkSLDymdQpbbyk3f0QO5PntXn6RygeV7nikzpTTi7IypvY/zQt6NKLwvudDK3vX3EKi7xn9nPtQ7ZOnrWVT5z/yHZxrTPurX1alIUn7TPt9FRtYHKPjTwvACcvGc3VY4w8/eMtPURTTpQ3n5KhX4W8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789727984; c=relaxed/simple;
	bh=aIrQ2V0TT/6iRA5oVDp90eSuktg1iJaSHozlFmhrY04=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=OwdNcJMYDvQI4H5g46MDoUOXX8PTFWvUGYRGZlOW31uKAO5ew4H4Co42lg+ekvIEpx2fP9X2hYXAHp6GxWtceg2KrJ7cOhQqgvg0J3wjVdsNcwLZWlZwGdKNtTQB+YGvkNVCkrQVSElufZE0rpb0TOfYTSklEnARCc74k79EsQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JcAbxmxV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LRS0kPik; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JcAbxmxV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LRS0kPik"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I9dOco3746740
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 10:39:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=0bky6LxCR8ON3Ijq+kG1vs
	nKbZeqYDBJrMN60J1xEY4=; b=JcAbxmxV25krtkVOSn6jRlug/k5Jbe01f8Tn5G
	e41oQrHnqnaY5Kbl6Uoi8uxBQk0op1qj3lgCawdIDyTRdMvdXpzKW9KCRd/XYhLh
	pqQi2BRCP9LMuuPHlJf+d5tMPwUkto9rzVhTdBxR/SUWVRw6lokjQNizfPymFv1K
	aohn5jhj1Wvgxz8QdyNHMGY47rVCTDzyYmNqPob+McV7zsGFXx63td7Yse+kzYUm
	0G/qVv7X73iwsh8c/7/BfPdVk1dslKuqKTx0fEgbQn6uVjrOUL+Ko+Jw4iq6xZd+
	mC+orU2NIoMybPdK8Z5hYon3DIyDD7jDTR4aAuxrAgLGRSkA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grmv5kqqw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 10:39:40 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8633c0d7353so849644b3a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 03:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789727978; x=1790332778; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0bky6LxCR8ON3Ijq+kG1vsnKbZeqYDBJrMN60J1xEY4=;
        b=LRS0kPik4CCpXFIU8mIfQ0+CGi7isch1OoieyiWfzRBClHVbbeDprOF7PVV+6GFOhQ
         z5vhOKKj24Dr/mBgEEiPNIMFHrKluuaAlV5kSvX1HxrgpA50M9gsUEqCW6d5BQX64O2u
         3chVL+TWiWmzov8DFiA/tvHgZx96B0MkB3LqiTeF63LajgookkPRObx28yeiD+ikD3G8
         6RzYfXgIYs1sz3Frl0D+zKf2RyrzjcKLHPQe4VRx0YMlT+VoaJSV90Jq0q+V5oV1ufV6
         oXKL81ZzE40tsLzD0/3hCOrDmYdXfzRfrtkIEUOaRsF5jL+8U3y9zWKvUQxAim3Rd5vo
         RjNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789727978; x=1790332778;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0bky6LxCR8ON3Ijq+kG1vsnKbZeqYDBJrMN60J1xEY4=;
        b=khAQs0fZwAdjYOP8s6VI/CSxuSAjBauloN/rWlHbxMRFXq2UJ6KFDLl3g7PKitMuoG
         YkW8hWUdN5dOmC72wC3wEnLqyu8jtuC3uHI+4lgv/Sn1n5hg1KLqSQLM8Ae00GVciJh8
         NHoKgRa/p9p7YuHhhnBE8ClVDpGROH8V4Z43FM6HRVh3zl145fGxxIVhD7FGC9a+DXmL
         t0eqZV9NoTELZIphuc1tzB/wBygb43CRn11qSCNu0vVTxBur1VHQ9dFJQApyOAFJ4QhE
         jQ859JvXs3L1SbeYNk1Es+qMV6CHJWBwfRLMq4YeRY/Zw2mUdmAEcb6H0rvq5V7OVivL
         1mhA==
X-Gm-Message-State: AFuF++ni3XHwt0/tZ9hyfufVBp/m8SxYCcdmZvD0qFNHPm/HeEy6qalO
	/CEx4NEH23w1ssNPtK1IMH3GESoKEvaUAlp9KvgSwmLEM5sxB0ttMQhbVOOWh9iTA9E8knb29IV
	vbTfFz+J8YoOuQtxE17ODK+7+PIAw0O8vwykqEXRapW5WGAxXcK6s/F9vcdss64Kzv6Im
X-Gm-Gg: AYBFou2aCOy9tXDc/ckZ32Gm1aGLklAGMeWgNWL4/RUcTSLOM98ELBpUjcj9FT18scP
	Ips3K06zMyhHrW8nf0OuaLAx+tcMCRNbG6OQ2gx4lhu62IPW5QZ2z2z4nZcaaHjFPPNMUV6n89u
	OGN8M9RSHxInwtWMDPib0tdboKS22103YYEFATH4i2FfbyjtZQ3F0rLXbHnIacJtdmfLHz45Ah6
	VNQDaNwR4znqkSIPE6geP4djd8vjz3EP5tHZ2OaPj/gHcCmYg4coFf9AtDJe7IdikNvgy6hCAvi
	OhpYrpGTEtnFK5uoeqYbG+Rd3YYnjoV4X6WgMY8EYNFo0N/KJo4h/PR8VuHYrbfTevRtjU7aqVL
	u2zEPXx4I9ROeb+bnTFryzDDtlg==
X-Received: by 2002:a05:6300:278b:20b0:3da:bea4:621e with SMTP id adf61e73a8af0-3dd8c54c728mr3370682637.26.1789727978417;
        Fri, 18 Sep 2026 03:39:38 -0700 (PDT)
X-Received: by 2002:a05:6300:278b:20b0:3da:bea4:621e with SMTP id adf61e73a8af0-3dd8c54c728mr3370646637.26.1789727977918;
        Fri, 18 Sep 2026 03:39:37 -0700 (PDT)
Received: from [10.213.101.15] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c286d98e7sm4020702eec.9.2026.09.18.03.39.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 03:39:37 -0700 (PDT)
From: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
Subject: [PATCH v2 0/5] Add UFS support for Glymur Qualcomm SoC
Date: Fri, 18 Sep 2026 16:09:06 +0530
Message-Id: <20260918-glymur_ufs_qcb_enablement-v2-0-16619f7e36a6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMsUrWoC/42QzW6DMBCEXyXyuRvZiw01p75HFSHbLIlVfooNq
 FHEu9dA1PbYy2rH8sx82geLFDxFVp4eLNDiox/6JPDlxNzN9FcCXyfNkGPOtRBwbe/dHKq5idX
 obEW9sS111E8gFEojdaGQW5b8n4Ea/7Vnv18OHWicU8V0PP42pMI9n8tnPqR8cO0HHF8iKIW5J
 KVzyk25CPaX7+kufuggkYEgrNE6LbKmLpdsc1gTCdzQdX4qTw3axrpMKelMroWWr5JnvEAtUVp
 dE21bjZJt7DcfpyHc9zOl9g3+HxdZBHCwunGKkEhr8zbEeB5n024Q5zTYZV3Xb80asZ2FAQAA
X-Change-ID: 20260911-glymur_ufs_qcb_enablement-1524a497520b
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@sandisk.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        gopikrishna.garmidi@oss.qualcomm.com, jagadeesh.kona@oss.qualcomm.com,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, nitin.rawat@oss.qualcomm.com,
        sibi.sankar@oss.qualcomm.com, Taniya Das <taniya.das@oss.qualcomm.com>,
        Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789727970; l=2512;
 i=pradeep.pragallapati@oss.qualcomm.com; s=20260911;
 h=from:subject:message-id; bh=aIrQ2V0TT/6iRA5oVDp90eSuktg1iJaSHozlFmhrY04=;
 b=qVyth6QO2K9vr5ypFvkLN+h9wqExG799fDaZyUntYcFyRd0QWYFJj12krs8iItKMt5nQlykuo
 YHvTMqAUTjrCgaFGr3NCz5psIaUV3Damxncf4lPV882rQ0uXPYxXcLH
X-Developer-Key: i=pradeep.pragallapati@oss.qualcomm.com; a=ed25519;
 pk=uyRUsge8nQMwf3iW/e/o0U8z9nWLCMm1MGKxEftztic=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDE0OSBTYWx0ZWRfX0ZTVck4kwnZK
 NJ0piQJNQYExahm52SE7eQT2MBOLN8vNaJQ8DkeSAMaHU+WjqkyP47CKOOWwt5myITbAg7vLnZa
 F/HD4hB9bJ/sLIMZ6kQD+EqHqRgDc+TjCK0S5nWvToaZ8fUWJIZCt5r+ix9QfE3slyQQpr5Fj+f
 Tw0E3KbLL13qp3iUaoV3FdifBd6PWYOoWi6ha3Fvh3YodniW5QwCr5p58szFGZxgVT/Am0tFeJL
 CQT8xYTDoSTorEXL3RgnejohaTuLfHIuuK37/hgvqwQE2NywM/8FfZ1sCNtAB9KJPPaQY4DudHu
 onTI7bqyvW07unMe0CIfa19EJ1Aq7CFqiiZONEYadyGZViWa9x8bEg7nr44V2wLWtAhV2NaQMyU
 9uLo54ix6oLrL/H0FZh33PI5LI5O3tX/Ska1oBjo6DydxzRHYXAYtgMItLOuMdPtfHCJko/kv73
 yMKMdOFmeFBRpqC5ssA==
X-Authority-Analysis: v=2.4 cv=E+5YNqdl c=1 sm=1 tr=0 ts=6aad14ec cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=MjkSdyLvD0LHWdEy_1oA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: jgwRyLZ2WkQVp8kr7jvr7EPzuKEaA1o1
X-Proofpoint-GUID: jgwRyLZ2WkQVp8kr7jvr7EPzuKEaA1o1
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDE0OSBTYWx0ZWRfXz5vmJQjzgGwC
 Xyvv7+FtErskJQxBwubE6Ob6Tuocrk4nFJUKbRtZS0UR/3an+5ABm2EFQqkYTeeD5X5FkEjPk6+
 +0EiTcDHPMsdpuNAHQPzFqjmIiRIc4E=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 spamscore=0 phishscore=0 adultscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609180149

This series adds the DT bindings, device tree support for the UFS PHY
and UFS Host Controller, along with the required PHY driver updates to
enable UFS support on the Glymur Qualcomm platform.

This series depends on Glymur LNBB clocks[1] and Glymur QCB platform[2]
series.

[1]: https://lore.kernel.org/all/20260905-glymur-ufs-clk-changes-v1-0-cdff2c67a8c2@oss.qualcomm.com/
[2]: https://lore.kernel.org/all/20260908-glymur-qcb-v3-0-c194c0219218@oss.qualcomm.com/

Signed-off-by: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
---
Changes in v2:
- Added 201.5MHz OPP svs l1 entry [Konrad]
- Addressed minor cosmetic edits [Konrad]
- Sorted references label alphabetically [Konrad]
- Add RB-by for SoC dtsi & board dts [Abel]
- Add RB-by for phy driver changes [Abel]
- Add AB-by for phy driver changes [Konrad]
- Link to v1: https://lore.kernel.org/r/20260911-glymur_ufs_qcb_enablement-v1-0-b9fc5e2ee99a@oss.qualcomm.com

---
Pradeep P V K (5):
      dt-bindings: phy: qcom,sc8280xp-qmp-ufs-phy: Document Glymur QMP UFS PHY
      scsi: ufs: qcom: dt-bindings: Document Glymur UFS controller
      arm64: dts: qcom: glymur: Add UFS nodes
      arm64: dts: qcom: glymur-qcb: Enable UFS
      phy: qcom-qmp-ufs: Add Glymur support

 .../bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml    |   2 +
 .../devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml |   3 +
 arch/arm64/boot/dts/qcom/glymur-qcb.dts            |  18 +++
 arch/arm64/boot/dts/qcom/glymur.dtsi               | 125 ++++++++++++++++++++-
 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c            |  99 ++++++++++++++++
 5 files changed, 244 insertions(+), 3 deletions(-)
---
base-commit: f2bfbc3554ca6919484030729424b9dee2942d24
change-id: 20260911-glymur_ufs_qcb_enablement-1524a497520b
prerequisite-change-id: 20260904-glymur-ufs-clk-changes-55264e596e6a:v1
prerequisite-patch-id: 934a81749f6e977edb9214104fe2bbf4c7758663
prerequisite-patch-id: d4215d48878aac66f72ef5b6c74d81d1163a596e
prerequisite-patch-id: 28be2089f7836210401b8a68c7cc0ca90d63c375
prerequisite-patch-id: cdf227f5515ad8faec49bde5e0475755a961100f
prerequisite-change-id: 20260711-glymur-qcb-1e2d2bc913fd:v3
prerequisite-patch-id: 53dfb255c51efb63dd26fae3cb30307f0d175ac2
prerequisite-patch-id: 7fa1b965056eaf3b90ce81a537d28c5a2adc73fa
prerequisite-patch-id: 96b042ef08bba0e028c86ea2a473d996880ab38e
prerequisite-patch-id: d2f390b67a2ec320db1e725f4b84b500f1f0400c

Best regards,
-- 
Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>

