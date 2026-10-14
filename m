Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 833EF4D9911
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 09:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791969234; cv=none; b=CXFHsZ5yAhAdr0ZMNBOyKzzwkoWQoCax4/IjYTM9JfTw0cnCRQ2is6dzh2j0UCUq+ZsVS8d8PPI4dYvS8Tft9lujaWcjHzgCmpIaB9IlpLNtfQypdR8+k+u9hctJv2hfKVuNxgbQ3xlnh6nSt5Ma+kP6O9d+XcR3k9XGuguP2bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791969234; c=relaxed/simple;
	bh=WxCivatIRPVzBZsQisoxpngzgdeJTocrTsujIWS0mVs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=eRAVAG98F37Mp+HbcojL2iQbvZ97SAILzTnS4rdds8cBq59eDfXpPow1AsEJ3DPIJhJJ9utW6S+mzc6phMRVD3Wr2R68GXnRXg2dOSPhTvY6+Uz7oGmY8kxZlTnDbSAxNqJjALqTC8XwSXw+L0D4E/wMvYaQPuVSFDuElHjaDQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XZO6bDki; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iuBT4sNn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XZO6bDki";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iuBT4sNn"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E67u1d2686042
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 09:13:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=hdVOyqMh7r1r1h93ssUJyh
	PR+EVkqKi7lHq6bNk3+XM=; b=XZO6bDkikaQmGHRkP5HDtfXvV4C7MJR5zGknWG
	dbrAXogQLr8L6+6Qyd1is8/2dZwcSFPHVbmPTueA/RADDSmyouAuhwGyU9mU9q9t
	HVv5aYJnpg8m3wxBgxfE05DFOUTrnJDwPYNDQ76fDY1FeMOSg7dghve3ZRz1cDtn
	VGdB5ot2tny00K1ShsRmbzua93gc+gyD7AI8nLXI97OxM/3wTQQdBVrvzT87PnOO
	wlQXAbShDhMORcNhfRQj9DlepZexIp1tspaUDDBkvfznFGVsxDr9FWOtMcMcPgh8
	9S0EaVH7zIHbbwM0rZlp41Dy9NM+nkfBJ3O+3NtVLVj1Pspg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha46u0rfy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 09:13:50 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e93f67358eso4351185ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 02:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791969230; x=1792574030; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hdVOyqMh7r1r1h93ssUJyhPR+EVkqKi7lHq6bNk3+XM=;
        b=iuBT4sNnuYJSL/Uqcx6vkq+YE+Gcfhep8Jyxy0Hj6NJ7LHoMWD8Cb4jbJX1CKofAhC
         x+lMXWK2fgXNGcArQbZtjxRFLZ2UEtPRRJY/WtF4ziDCWyORR2jJS95wRvQr2dtyMB8J
         R2/vP4P0x1RffNfUkJNciWsDn5g8xjlUfoIX1A53asjO2yZ7FHkcNjSsPcrxBwNWDWXB
         oSIzpF3ZFYzBRCorShRG/Tmz5FNV3sOgk+PY9CSTHlpX2ndHC03SgBPo3NCIikUwtj9P
         0p0rqsqnpr1k6H5iAsBFktUlj6yW/xn5LxU61Nmt5a2ZYWKmwLlfwh4MJMe81iR4/QTD
         gNAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791969230; x=1792574030;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hdVOyqMh7r1r1h93ssUJyhPR+EVkqKi7lHq6bNk3+XM=;
        b=sdE5wp1kPL5vQXRfXcyvw5Kx262lnMjy5N56dtUcxbjLVt6sXSgDp6UhhbdG83vy6F
         xpiEDoSb/+m4yjEqzpNzhmZInrf755t5tleKRw8eAM8hxHeU+RcUsVnIWGo2qE7YJgxS
         wQ62z4BoWnaeVn0ZyNO2AmAc4/V05071TLi1xEF80oVPRndmTLKeuPaKyrZJuVzpFZMq
         f+obfu0rplzxm9MhvK0PywH4nmfwS3ym7E2JI5d62h8oq3ft/bsfvQ3+v3r3e6v8VVRJ
         OLB0f1YFbCf91NGhQspq4TAiGcwshY58cI25JHotK1fKhNKAJYMOrU3P+SDQL/0fP4NH
         UzIQ==
X-Forwarded-Encrypted: i=1; AKwUvBz9dWda6X1KHdIMLk7SZ0WVUNM/iBoPBTLl5bFQGIOFgROQPcRs/HO1gk1HnsPnVf3i0hL4SrIEQKV9ap4w@vger.kernel.org
X-Gm-Message-State: AFq9FYL3qIdwa6382Kso2bXRIueg8bWjbsMUMNkfk27bnLwX8rccQQmV
	Lusip5lTp3I1QtjIiisDytOk4KP4k9Q5CKdvScpRHueMgAclxjr8ziCTDhkgj4V2FAoxSvawOX5
	30ZOQ/lOTbpFZjdQCyKlSLaea7gOr4C4t49nCjURBnHj4IzcY+Egci/nbF1A/yHA++/3C
X-Gm-Gg: AYBFou0p80uRS+v2P1EL29gtnOdQh/dye2AQluHABf3TfNWv7hfFPglEGrn2pWxf1if
	izpDGAyUzAHeFhaTkwrhbtLDN2eoVR3VQrVRbLaDZGrYFJxndxCdGgl7TJbb1x32Y8qN4L5hriJ
	vSFVt3iy2rg+3uc+Ph9ohdMDKrELcdaCZ0LzxsNJcOiWidQVQP4pP5rRskFCwnPt4eD5S01fJpO
	knK93xg5RNkpjQBt8NewFF66lK2fdaJ6j1e4vCM9vria4Ccd1Zm/4yCMA5tNrm7psbLICBBSEev
	n2zMDKSJNlsbOELVApZSvy+yx3eB6c0owLAmdTv8viNAcaQANxsyGHoU5EAho+iboGGUI+eW9p9
	TKAKZdlQeEwbvc0k7MqwkJ85vWNxanvdRncY=
X-Received: by 2002:a17:903:950:b0:2e6:136e:f264 with SMTP id d9443c01a7336-2e842dfd193mr126549835ad.50.1791969229508;
        Wed, 14 Oct 2026 02:13:49 -0700 (PDT)
X-Received: by 2002:a17:903:950:b0:2e6:136e:f264 with SMTP id d9443c01a7336-2e842dfd193mr126549645ad.50.1791969228964;
        Wed, 14 Oct 2026 02:13:48 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8421b16b3sm67088595ad.30.2026.10.14.02.13.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 02:13:47 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Subject: [PATCH v5 0/9] ASoC: qcom: Add shikra and Hawi LPASS macro support
Date: Wed, 14 Oct 2026 14:42:46 +0530
Message-Id: <20261014-add_shikra_support_v5-v5-0-fb9f0667e613@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAI5Hz2oC/yXMQQqDMBBA0avIrBvQ0NjYqxQJ02RapwUNMyoF8
 e5N7fIt/t9ASZgUrtUGQisrT2OBO1UQBxyfZDgVg61t29TN2WBKQQd+CwZdcp5kDqszl4idtc5
 77DyUNgs9+HN8b/3futxfFOffDPb9C5pDfhN5AAAA
X-Change-ID: 20261014-add_shikra_support_v5-7ca922588a98
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791969222; l=6390;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=WxCivatIRPVzBZsQisoxpngzgdeJTocrTsujIWS0mVs=;
 b=izd+QbqLx5AWNxLauoGe/kuX0Z9gXFAGCvaE6CKgIjJGqFAwxBc0+wsa6aivYm4Y51XmhZfOV
 /5q/ioSUQMwC5iTlWaSC3qw0FF8GBHiwd9EQTszuQdrPF/sxtR514/J
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAzNiBTYWx0ZWRfX3lPm3ouOs2Eq
 qEqmljsJV/Y9CkyaHnXS5CBPvZ2o4ZdLCfPPailSwZvsHWJ/hqore14wttGkE2AL1b1z2CdQmJQ
 NfgIzwcuvIDbzkGDt52lWuZsbzFTnpA=
X-Proofpoint-GUID: 8P2lE3_r5lqDrt2FYLLkvwH9Gkln3ezU
X-Authority-Analysis: v=2.4 cv=Y6ttIReN c=1 sm=1 tr=0 ts=6acf47ce cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=pGLkceISAAAA:8
 a=iox4zFpeAAAA:8 a=sKXgnk-ZSZCjcCUwTa4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=FO4_E8m0qiDe52t0p3_H:22 a=WzC6qhA0u3u7Ye7llzcV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAzNiBTYWx0ZWRfX8yThVT4gGzir
 o/CQqaHoU7kBQRmyMDtjv0M3LKjNj194gyRtbYp12r5wsC8s967O5SarjdhadeNpgDrY3IWDkER
 SJ9k5L+caGqaOtxYnbHlp3Qzh3O/ggKmXKIPa5I9TtqLrGpUmaC42us8mdHN4No5BmGTgbx7DaC
 Lh+r0rVoEpHnTGf56mErLoI92FvULzdTHaXGT53Arah97uOFISZ8ZfriF4KHgOoMga/DswG7O0V
 /yBiw+Jr/alSLzyZqbWGdsSrzc1Qy+gvcXz68tqbEvOVWrSNRHd58QKkUwik2Hs9eN0IXTC4TWC
 HpX8VNv3NbIr6Ow+HMlHUZOSlhsBqGgwInBRqWo4NlV/l57hpZaijf4nOyIZ74cvhD0J9Jzmvj3
 9/w3h3lCEFHYtF5VHEAm0M20oCBoPQQMQF65zwkXLv9Ht5UPAM39KhUIOhPEcrQ8b22lB42f2hG
 4jf0CpsDhOr7ky+YyAg==
X-Proofpoint-ORIG-GUID: 8P2lE3_r5lqDrt2FYLLkvwH9Gkln3ezU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 suspectscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140036

This series adds audio support for two Qualcomm SoC platforms — Shikra
and Hawi — by extending the LPASS codec macro drivers for version 4.1
and 4.0 respectively, and by adding SoundWire microphone capture support
to the VA macro.

Shikra (LPASS codec v4.1)
--------------------------
The first part of the series targets the Shikra platform, which
integrates LPASS codec version 4.1. This is not backwards-compatible
with previously described compatibles, so new DT bindings and
standalone compatibles are introduced for the RX and VA macros.

Driver changes include version detection enhancements (including a fix
for the missing v2.9 version string in the common helper), FS counter
bypass programming required before the codec is enabled, and a v4.1
specific regmap configuration covering the additional adaptive filter
(ADPT) blocks at 0x0800..0x09a4.

SoundWire microphone support (VA macro)
----------------------------------------
The VA decimators previously only supported DMIC inputs. A new patch
extends them to accept SoundWire microphone (SMIC) sources as well,
updating the ADC_DMIC_SEL mux programming to be resolved at decimator
enable time rather than at mixer write time, ensuring correct operation
regardless of the order in which userspace restores controls. DMIC-
specific HPF programming is skipped when an SMIC source is active.

Hawi (LPASS codec v4.0)
------------------------
The final three patches, add support for the Hawi (and Maili) platform
which integrates LPASS codec v4.0.

While v4.0 shares the same RX and VA macro register layout as the
existing v2.5+ path and reuses those helpers, the TX macro is based on
Bolero v4.0 — an extension of the v9.x TX macro that adds a port-select
stage in the SWR microphone input path and an adaptive filter (ADPT)
block. The ADPT block must be disabled before a decimator is enabled;
this is gated on a new has_adpt flag in match data since the register
does not exist on earlier versions.

New DT bindings document the RX, TX and VA macro compatibles for Hawi,
noting the clock differences: the RX macro uses the 'lpr' clock rather
than 'macro', and the VA macro takes an additional 'heartbeatpulse'
clock sourced from the LPASS VA CSR rate generator.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
Changes in v5:
- dt-bindings: rx-macro: drop the redundant clocks "minItems" from the shikra
  conditional, it is already set at the top level suggested by Krzysztof.
- va-macro: shikra: do not hardcode the codec version in match data, read it
  back from the hardware and cross check it against the register layout
  selected by the compatible, reported by Ajay, Sashiko.
- va-macro: SoundWire mic: do not let a write to the DMIC/SMIC mux that is not
  part of the active path reprogram the shared ADC_DMIC_SEL bit of a running
  capture, reported by Sashiko.
- va-macro: SoundWire mic: clarify that only the HPF zero gate assertion is
  specific to the DMIC path, in both the commit message and the code as
  suggested by Ajay.
- Add device tree bindings for Maili.
- Prevent duplicate registration of TX DECn MUX controls as suggested by
  Mark.
- Add v4.0-specific regmap_config and default register table.
- Link to v4: https://lore.kernel.org/all/20260922-add_shikra_support-v1-0-6c6cb6444caf@oss.qualcomm.com/ 

Changes in v4:
- Added three new patches for Hawi / LPASS codec v4.0 support (DT bindings,
  TX macro Bolero v4.0, RX/VA macro v4.0)
- Fixed all issues reported by Sashiko in v3.
- Link to v3: https://lore.kernel.org/all/20260917-add_shikra_support-v3-0-fc0e79c341aa@oss.qualcomm.com/

Changes in v3:
- Added Shikra-specific clock constraints for RX and VA Macro DT bindings.
- Restricted clock and clock-names properties to align with Shikra hardware requirements.
- Removed dead code from patch 3 of v2, as suggested by Krzysztof.
- Replaced open-coded checks with a flag-based conditional for LPASS
  codec v4.1 specific configurations.
- Reused existing SoundWire microphone widgets, as suggested by Srinivas.
- Switched the regmap cache type to REGCACHE_MAPLE.
- Link to v2: https://patch.msgid.link/20260910-add_shikra_support-v2-0-fdd2129c696c@oss.qualcomm.com

Changes in v2:
- Updated FS CONTROL and ADPT only for version 4.1, as suggested by Krzysztof.
- Addressed Konrad's review comments from v1 by replacing magic numbers and
  lower hex reg values where appropriate.
- Link to v1: https://patch.msgid.link/20260608172023.2965292-1-mohammad.rafi.shaik@oss.qualcomm.com

To: Srinivas Kandagatla <srini@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>
To: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>
To: Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-sound@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Mohammad Rafi Shaik (5):
      ASoC: dt-bindings: qcom: Add Shikra RX and VA macro codecs
      ASoC: qcom: lpass-macro-common: Add missing v2.9 version string
      ASoC: qcom: lpass-rx-macro: Add shikra compatible
      ASoC: qcom: lpass-va-macro: Add shikra compatible
      ASoC: qcom: lpass-va-macro: Add SoundWire microphone support

Prasad Kumpatla (4):
      ASoC: dt-bindings: qcom: Add Hawi LPASS macro codecs
      ASoC: dt-bindings: qcom: Add Maili LPASS macro codecs
      ASoC: qcom: lpass-tx-macro: Add support for Bolero v4.0
      ASoC: qcom: lpass: Add support for LPASS codec v4.0

 .../bindings/sound/qcom,lpass-rx-macro.yaml        |  39 ++
 .../bindings/sound/qcom,lpass-tx-macro.yaml        |  23 +
 .../bindings/sound/qcom,lpass-va-macro.yaml        |  40 ++
 sound/soc/codecs/lpass-macro-common.h              |   9 +
 sound/soc/codecs/lpass-rx-macro.c                  |  19 +
 sound/soc/codecs/lpass-tx-macro.c                  | 576 ++++++++++++++++++++-
 sound/soc/codecs/lpass-va-macro.c                  | 442 +++++++++++++++-
 7 files changed, 1122 insertions(+), 26 deletions(-)
---
base-commit: 631a161db2c5168dd836242571724baba3561a1f
change-id: 20261014-add_shikra_support_v5-7ca922588a98

Best regards,
--  
Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

