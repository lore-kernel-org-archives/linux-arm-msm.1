Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793183909;
	b=JaC0Sfsa5eneU1BhOLHUi2o5tzA/fRl13oO4leXKrmRPuUu9g3Oe5bIvA/0hdmlCrPux
	 I6UXycy4xQYJYceEVgNOWsvHKWiOd5k3YBClc1VbmTz84qxIP3gl8FesjvGhzVJ+tYdH9
	 d4Emv3FnBHNqIImLZmje1QzymtgFlK4wK5V7T6+y61t5NLH6WUVdZTUE403YWCWjftBuf
	 qtTvqBuBULSPvLVAxViPiAW2jOq9eA8HF6N3PW+5FAsfAtgBUOxiUXqihXBAudgGVwpTa
	 LJX7Ebca41QeSzHApwFxbE2TKaklvAVv9RCDGzel7h1AVHRSoGiypOBuQGf2rmbnOaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793183909;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=J2bm/qDTgSxReYWyWffqNNipT6wXNIBYCGlOnXmCCs0=;
	b=2HaDThd3vlnd6W/2BSR6OpA3mCFTxvN46Ev82GvR7qv95ZktD6TCCtUGWsQQ4e57nwkZ
	 zMlHz6TuBW1XzXBh64Is7f5ToBTjvn9En6X8Rc2NdiQgFkfQi5hQZs8NrtRzTTntNS1Ta
	 W6ZiHOtwy0R9GYK1Hmb73QS5bau7Scq8v3RAlHNz0E8cXyivNIyf8s28+Qfvr4AtBllUQ
	 PMqCUXVNChOjja/P0LoLWodNu66QWkEdt8/4Z4U2unSivPG3hsuEzq3AihgycPwSN8FZX
	 legXaeprcVnagHOZG1PMlzWuecTk33s+MuEdfLiQRIB49aSJKg+Ut7CmLYxvRsYOPkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=T2Z68TzA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HFoSepn6;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F28CC606A31C
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 10:38:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F28CC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=T2Z68TzA;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HFoSepn6
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S8K5Xx3892809
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 10:38:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=J2bm/qDTgSxReYWyWffqNN
	ipT6wXNIBYCGlOnXmCCs0=; b=T2Z68TzA72krlfPT0XfUS1avcntHxaGz2peDSr
	1Dw625Kvaf2KY0N4Ya4yBlQaYIH+iRwwUWsXk/7P+IiPLejLV2d4KP4+OFKdEteq
	ifD5mK/OE+/d38vpYi6aHcTyyldqkXYS9OidOe6Jecxsvuv+CKnRtTAwkNBRPGU+
	7E3aDDmN6RCfreeTrJstDMpQa6QtHSL3PHj/bZ0pQQSq3cEgf95Pcouw22zQNJ9q
	SgsNIkPx7g+4AhjHR/aCaQ0D11tEmV7xHIB3r8lmWlOqSH+2jXhp1esD2zZKMX1Q
	C/T0WnMA4DvWBHyVWgBWjMKIn3IB66+hKVaowRt33WLV/+9Q==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk6f9202x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 10:38:28 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1665200f4c2so1496353c88.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 03:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793183907; x=1793788707; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=J2bm/qDTgSxReYWyWffqNNipT6wXNIBYCGlOnXmCCs0=;
        b=HFoSepn6Lfggkdj6YRqMqTaTqQkZIs5t5HzSSuDzAz3UIo08VcwJZxAwpvNhQoSLvD
         3NxDXafjcvx4UCyocfXdFXb1aULf07oAIW8oPzZdVhajgOkDxAYybok5I96GAL40R4W5
         9M4wy8MM33GRlliEoQTtd5jcFGS0BceczF7c7OSnM4Q3HT7hNPXx+KWvUvC9YsMAhJ15
         TKPMGYTZc50A+TUDcKI31dBrwAID+iiCUDGFDtU5k9YLZfmosgeFQXAyHqQAd6niPEji
         e1kdIFTuiv4wvSpc1zaIfVbPiNvLNqKk1FlyePqq7vIwh4923OvNh5OT5AAMT9Yd5+cX
         +Q7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793183907; x=1793788707;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=J2bm/qDTgSxReYWyWffqNNipT6wXNIBYCGlOnXmCCs0=;
        b=u08W7oKgaWEyr94HjgY8RjiVcI99GkQzu0ts2ifDWw+OMBysGUYJU/njILGYG3DiH4
         RaQH/CLUpbAVUafJW4IS9QsrwiNT6vjGThUCK4LZYAcJi8RGQFXD17sOFBvmm+uhCLw6
         dCps9NuF4JH7pMvhtrJA+9p5BPGVopwIKC1OvdW42h4SeaF4V1bIJ7PtniycYOwHy4YR
         1q0elEkLno5g+a2Wo03bniyhEDICkqSs79MGhHRKH7d7easjIx2yldGf1FH1iAE18hIT
         NHi7YYcJXFOySuSd03QJpd5O/YMX4Q/lNgIw2cSh/z8suMnZXOVKWLyA8d5Ukym/PBN6
         fW5Q==
X-Gm-Message-State: AFq9FYJYcfXqUCFQeg7quPLaruzY4Vhbez1AN+qVDX3uz4xU9D00PhJj
	q9nPThPUT3egs06FnwE56GFD+jbyAwo8PEHa2IVDdJ8aYhXJyqOR84DlhUL9hmqYFaow3fxJOJd
	r23rA/r9iGlLrec5zmyDirmehw9dNM+w/7007pttGjssZwRI4kYDNcZA0AxJiX3a9Uw07
X-Gm-Gg: AYBFou3hpLSCBTibz1GmxM3EQolEIyqvLBUJWTUSdfiG147uFeKXtPMHduAXGySspAB
	gz/+11NhGTi4i/7Ky0BuoWkLdy7ioRUSBJ/4s8UdkdEIaHd+TBUILGnbt+3+oGFvhkXYyKO1owJ
	T9xtJM6n/Tiq+jTkD9UHH4I26Tia2ZcuNlmq5AFuncW58189u959JeYQWJnESHqqW/ENqhduBac
	wGbEAgGntqoICbUMgMceysbyQ30O4GHsuqzBTGXrlXfXq9lBcoAFz8LItI3NZzLLBKXPU/kDDMU
	Qz/fTo2vNQdgs/comZ5ozdLn7DJXQGOqCXw2UUraujtpYjGNVBRfwi7BEV90zi3OlmeSumHXAE9
	dTeWptM1xBsbWmQyy+w3p+4SwwQxcOfpuFcEfzeoQzQFtjiTnN+9V/7PmxCWDcxz4RtERjr3ncs
	o=
X-Received: by 2002:a05:7022:2204:b0:144:ddf7:2570 with SMTP id a92af1059eb24-1a6d00cf3e4mr3833776c88.39.1793183906815;
        Wed, 28 Oct 2026 03:38:26 -0700 (PDT)
X-Received: by 2002:a05:7022:2204:b0:144:ddf7:2570 with SMTP id a92af1059eb24-1a6d00cf3e4mr3833697c88.39.1793183906147;
        Wed, 28 Oct 2026 03:38:26 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a75e5c6d4fsm8340186c88.14.2026.10.28.03.38.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 03:38:25 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Subject: [PATCH v6 00/11] phy: qualcomm: qmp-combo: update DP PHY PLL
 programming on Glymur
Date: Wed, 28 Oct 2026 16:07:56 +0530
Message-Id: <20261028-glymur-phy-v3-v6-0-1f1d2e565a66@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAITQ4WoC/23O3YrCMBAF4FeRXDuSJs1P92rfY/GijRMbsY2bt
 MEiffdNXBYXFYbAgck350YiBoeRfGxuJGBy0fkxB7ndENO34xHBHXImjDJJNavheF6GOcClXyB
 x6KQytaLsYDtG8p9LQOuud+9r/5vj3J3QTAUpGzb4AaY+YPtwFav+u8aPFlIFFSijG9oIwYzAT
 x/j7ntuz8YPwy4/RetdnHxY7vUTL1f/muqnpnkoaFTcYK4suXz1SuFUP5CGviB1RqxlDEUlqOD
 6DbKu6w+066Z2VgEAAA==
X-Change-ID: 20260824-glymur-phy-v3-b67c4702dfb2
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Bjorn Andersson <quic_bjorande@quicinc.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Jeff Roach <jeff.roach0@gmail.com>, Luke Macken <luke@phorex.org>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793183900; l=6120;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=HmDH/BkWANBmegqO8kQ9LRJWbpkyKSCUhTt+cMKlvF4=;
 b=IMbJj7kB+cQoRMNzuDUqSaD85srLMsW7ginF6ueevCn2+B7wfDW4ZaOjLiZqo7PwfdbD66AYC
 tGtwKYtO2A7DafmpwxRRruKzayb9OWmMMmvF6TeAbDn6qysgIxr19Au
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Authority-Analysis: v=2.4 cv=frhJ914f c=1 sm=1 tr=0 ts=6ae1d0a4 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=xD6p01Tg4BUkAB7hO_sA:9
 a=QEXdDO2ut3YA:10 a=Kq8ClHjjuc5pcCNDwlU0:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA0MiBTYWx0ZWRfX0D1BoeE22mxi
 xqfS9aalMbz+bWUP+BOJVgGUX7XENyembtDDf4dWnLVHK6U8Yp+/mL+YmRu/q5imZVQvxYznrmq
 5XJGhDrE33ZhYpYDkTkGJ0SmJlfdCMw=
X-Proofpoint-GUID: 0n2IMVJR6ucM37eugsHMff3fUu4heQQx
X-Proofpoint-ORIG-GUID: 0n2IMVJR6ucM37eugsHMff3fUu4heQQx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA0MiBTYWx0ZWRfXz++e6PHKzBdt
 tNzBipch8DDniWQBSNesERWuWY37HgmuprqNcgsdUP1JC0Jd1aFuuAXG1cySg4ivBW4dKZbJ052
 xJcHX3oHHdZ55sKQGaaNL1Vk2XLRKDukA0BLwOpjrmUr61g5uW9btskQ3idzweM80/xUdSBX/UK
 Rn2MThsT7hlQpIgij+hubRi13SaLCI8uCIflF/5EFk80Tw/lGUDMsrLSIG3HDJAE7j4MZKyHxOG
 CDyGQlkPMrgMYHbyCvd8Wtx9IG4BLO/8kmxHho41L/oRTumCMMEA8ZaIqczde7taEeALp+jsKeW
 KDUmyjkK3qY9u72QTVj0EK3Q0ss93+MEyKu2A/bECANhPS4iB8pthVZPgg87h3BLBGPOZ79Etgz
 wZnjMgR09d01IANLyFw+n3herjJ+x1WyvSw0ot4LXquf81Qf4IBU/AlgTwDBVAzXq035Yki3t+o
 gjcDQUxlE5IigGDF3dQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280042

The existing DP PHY PLL and AUX configuration for the Glymur platform
does not fully follow the Hardware Programming Guide requirements for
DP over Type-C, which results in DP link bring-up failures.

[   38.158644] [drm:msm_dp_ctrl_link_train_1_2 [msm]] *ERROR* link
training #2 on phy 1 failed. ret=-110
[   38.160656] [drm:msm_dp_ctrl_setup_main_link [msm]] *ERROR* link
training of LTTPR(s) failed. ret=-110
[   38.167330] [drm:msm_dp_aux_isr [msm]] *ERROR* Unexpected DP AUX IRQ
0x01000000 when not busy

Update the DP PHY programming sequence and PLL-related register
settings to align with the latest HPG recommendations. With this
change, DP link training completes successfully on Glymur-based
platforms.

Fixes: d10736db98d2 ("phy: qualcomm: qmp-combo: Add DP offsets and
settings for Glymur platforms")
Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>

Changes in v5:
- split two patches into more logical chunks.(Mani)
- Add proper Fixes and improve the commit message with rational for
  the change.(Mani)
- Fix the 2-lane DP that was broken in v4.(Oleg)
- Link to v4:
  https://lore.kernel.org/all/20260908-glymur-phy-v3-v4-0-ff22e5150538@oss.qualcomm.com/

Changes in v2:
- Use the DP-specific v8 COM status register definitions
  (DP_QSERDES_V8_COM_C_READY_STATUS and DP_QSERDES_V8_COM_CMN_STATUS)
  instead of adding new N3 USB/DP variants.(Konrad)
- Drop the qmp_v8_combo_configure_dp_mode() implementation and
  reuse the common qmp_combo_configure_dp_mode() helper, restoring
  orientation-specific DP_PHY_MODE programming (0x4c/0x5c) and addressing
  review comments regarding DP_PHY_MODE handling.
- Include phy-qcom-qmp-dp-qserdes-com-v8.h for the DP COM register
  definitions.
- Update patch author to Ritesh Kumar.(Konrad)
- Link to v1:
  https://lore.kernel.org/all/20260419-glymur_dp-v1-1-ad1067a8e8ae@oss.qualcomm.com/

Changes in v3:
- Split the monolithic patch into a logical 4-patch series (Dmitry):
  - Patch 1: Add DP COM v8 header and fix register layout
  - Patch 2: Update DP PHY common init tables
  - Patch 3: Update link rate specific DP PHY tables
  - Patch 4: Rework DP PHY runtime configuration
- Improved commit messages with detailed explanations for each change
- Better separation of concerns: header additions, table updates, and
  runtime logic changes are now in separate patches for easier review
- Link to v2:
  https://lore.kernel.org/all/20260721-glymur-phy-conf-v1-1-7c8909552c5e@oss.qualcomm.com/

Changes in v4:
- Split patch 4 ("Rework DP PHY runtime configuration") into 4 separate
  patches to address review feedback (Mani)
- Add named constants QSERDES_DP_PHY_CFG1_V456 (0x0f) and
  QSERDES_DP_PHY_CFG1_V8 (0x2f) for the DP_PHY_CFG_1 magic values;
  use them via a new dp_phy_cfg1 field in qmp_phy_cfg (Mani)
- Set QSERDES_DP_PHY_CFG_1 to 0x2f on Glymur instead of 0x0f (Konrad)
- Update qmp_combo_configure_dp_mode() to ignore TypeC reverse state
  on Glymur via a new dp_mode_ignore_reverse flag in qmp_phy_cfg (Konrad)
- Fix ignored return value of cfg->configure_dp_phy() in
  qmp_combo_dp_power_on() (Konrad)
- Make AUXLESS_SETUP_CYC, AUXLESS_SILENCE_CYC and LFPS_PERIOD writes
  in qmp_v8_configure_dp_clocks() rate-dependent (Konrad)
- Remove duplicated LFPS_PERIOD write in qmp_v8_configure_dp_clocks()
  (Konrad)
- Make LN0/LN1_DRV_LVL writes swing/pre-emphasis level dependent via
  new qmp_dp_v8_ln_drv_lvl_hbr_rbr and qmp_dp_v8_ln_drv_lvl_hbr3_hbr2
  tables
- Make 2-lane drvr0_en/drvr1_en values in qmp_v8_configure_dp_phy()
  depend on the reverse state (Konrad)
- Patches 1-3 are unchanged from v3
- Link to v3:
  https://patch.msgid.link/20260828-glymur-phy-v3-v3-0-8e73ce7c4636@oss.qualcomm.com

Changes in v5:
- split two patches into more logical chunks.(Mani)
- Add proper Fixes and improve the commit message with rational for
  the change.(Mani)
- Fix the 2-lane DP that was broken in v4.(Oleg)
- Link to v4:
  https://lore.kernel.org/all/20260908-glymur-phy-v3-v4-0-ff22e5150538@oss.qualcomm.com/

Changes in v6:
- Drop inline unncessary comments (konrad)
- Fix QSERDES_V8_LALB_CLKBUF_ENABLE value for dp_tx lane from 0x87 to
  0x8f in qmp_v8_configure_dp_phy(). (Konrad)
- Simplify qmp_v8_configure_dp_phy() poll sequence: drop the redundant
  intermediate error check and the second readl_poll_timeout() on
  QPHY_COM_CMN_STATUS; return the single poll result directly. (konrad)
- Replace mutex_lock/unlock pair in qmp_combo_dp_power_on() with
  guard(mutex) and drop the goto out_unlock label; use early return on
  configure_dp_phy() failure instead. (Konrad)
- Link to v5: https://lore.kernel.org/all/20261001-glymur-phy-v3-v5-0-3848c2615d5a@oss.qualcomm.com/

---
Nabige Aala (1):
      phy: qualcomm: qmp-combo: Fix error propagation in qmp_combo_dp_power_on()

Ritesh Kumar (10):
      phy: qualcomm: qmp-combo: Add DP COM v8 header and fix register layout
      phy: qualcomm: qmp-combo: Update DP PHY common init tables
      phy: qualcomm: qmp-combo: Update link rate specific DP PHY tables
      phy: qualcomm: qmp-combo: Ignore Type-C orientation for Glymur DP mode
      phy: qualcomm: qmp-combo: Add hardware-specific dp_aux_cfg2 and dp_phy_cfg1 fields
      phy: qualcomm: qmp-combo: Add v8 PCS-level drive level tables for Glymur
      phy: qualcomm: qmp-combo: Extract common DP PHY init sequence
      phy: qualcomm: qmp-combo: Remove VCO_DIV programming from qmp_v8_configure_dp_clocks()
      phy: qualcomm: qmp-combo: Add per-link-rate auxless/LFPS and drive level for Glymur
      phy: qualcomm: qmp-combo: Fix Glymur v8 DP PHY init and configure sequences

 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 352 ++++++++++++++++++++----------
 1 file changed, 241 insertions(+), 111 deletions(-)
---
base-commit: 20a33c6b6cbe7e4805dfb6cd68816937443aa148
change-id: 20260824-glymur-phy-v3-b67c4702dfb2

Best regards,
--  
Nabige Aala <nabige.aala@oss.qualcomm.com>

