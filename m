Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794184200;
	b=lgontYpHFM4F1ExNiEY2EHUneuH3QTSCBCnVdSlMnMaMvaF7oJ1/7fIcGPx3dq4rjyBO
	 uGzL4rHqM5OTlinY1sCdAEyIsK68PXZgViZKDk5b230IMxijSu4T7lbSCE1+936SzlF7r
	 bJn/1uOfZnLvlUxQBeAP8SSqsTvBIHp0iSbMgafwuDkt6jk8UAUiMk83AwidpIa6leXf0
	 sAkW7XG/DAy7roPR3oCWGtWEc0WUzSaUsxKzPX6ifrvJp7omto0a7JRWUD6X7A0p5Lui6
	 djuH1819uyOlCz3T5WQgf3b+AQTAnmrDq0ABeDoH69yl+oMpX+5C+cvQwHjVFaDLwUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794184200;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=3EKd0ikyZyrjPebrQ1IcrIhfAZXuC/dKRwkgcXP0o30=;
	b=yn1Q0UaeaXMOZsIijXBrSvvRskcL7vaDy2P2YiBqoxASgf94jIVAyV1ulrdqBdK1Gy9d
	 5S0OQENTWzBDocD4x1D/S0ijT940aPDPlXqvLlIyzFFdImPj9MnEvlvbs+xCh1HgmVCIC
	 gMLWYQ6Gh2yyw73KtwxqSrtzlU8FynHq8Yvk2aYS4gehyax7bzxFFoy3a8cc51tGdwi0X
	 BD/92bzSGpmdJ0gBtNBowDHuF6jRIeA2fqrj6ma9LM/4Lh6bUkSMuTDbC2zLBuE6Iu//R
	 dSwIt7isNVCXyu1iDJjjjyaKurw3PVn6EtHYL+z31B+JY3iCynFFHFxZxlw+/omYaXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ify8EiE5;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0B35606D819
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 00:29:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0B35606D819
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ify8EiE5
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48e4831c028so388785f8f.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Nov 2026 16:29:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794184198; x=1794788998; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3EKd0ikyZyrjPebrQ1IcrIhfAZXuC/dKRwkgcXP0o30=;
        b=ify8EiE5p+68P5QNKi+l3dMtkPP16GvbYO6rdEREedQp2Y9270NLejDTyHFsqU2gen
         7vTLOi3RvBgCiN8Mf9HuHJVOnuPBWHxNakhf/9Iu89b7iFMixvQ54a6T+s0nmCq9NoTB
         kRLzVRg1hSJ+jE+kmackVFXicz/DARG4u0+D2piKXAQ2ukbejN2x93kygJJQ8b8bKznV
         C4j5/4V51GG1dOawM1kfnCb3gADE8wbzZE1pn5BzgxeGtd8cbZhF2hsv4CoXz/f57CkJ
         K7tvV3a41LnN+CYcEDupNFekHD5GjCH17lZ+Jy5CrljHBxUOPn1CFS/eRagGFmkEAyIt
         MSsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794184198; x=1794788998;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3EKd0ikyZyrjPebrQ1IcrIhfAZXuC/dKRwkgcXP0o30=;
        b=gqGpAF6odouUWNxCQeDrzNYg72FFyLpNC8u0RgFwijjJ/Ek4NbJYCpl9XBdEre1JvT
         bttauvPcKuQDXknVFWt1Y6iHfHn0vKit1m4ZEyZIN9Xt3bL3Spzx9fmXTyl1zZ38MCej
         owMsnLGF8/o0oTJuzg/u6YWG4rfcRbz+j9ScOq0Svlw9OkFIzBYVyVESat0ECAIke9Qb
         9dqXzdjmtbyVWu+NJn0wZtxkS31AkEnehD0bkOooEl+roVnVpSc/eQbtJlSHk589TRe7
         aTQ3AYVEqqRdIJ7WfYMG1N+Jxn5n0OtQAP7ew2jL0rdPdlB/GfYl0oiSMNFJqQpl6tB9
         VkDA==
X-Forwarded-Encrypted: i=1; AL+hErExLMiAVZAf8RVCL6wF8ADv4p+Kca/Vt59WEaOoMcJEeJYPlUMoTZxXaaYlj90Y89814ytv8H/CId6Tl8tb@vger.kernel.org
X-Gm-Message-State: APuU4Z+zmDopdZBV4sF1vOStnablI1WdxRJ45euK+g3SYNcwRHCrWIaJ
	YVYx0IvPp21OB6FkTWSIoBgQHMd/Zh9YBKrsWXWfQk76hcvVnrlJHlxr
X-Gm-Gg: AYBFou2k36zjeTR5bN4aCGz/H/ABGo/6VRfx/zW3v/T8SkVbn8hgslUQEP0RwIPTmoL
	he7j0UkNQxr1UI1S2O0JymqwHXzgS+m08m0gn6UifuJ1plCHE4UaSSqqHJJCbbBc9qUsIQJvC0U
	XMnvB6NJORkyAjMjtHbmG2wVRgGdSzEIveF4rt2JEvXc9oC9uG0p+dByemlBXWai/m2qm/XN7XL
	ZgWLm4lLBPrOLVAl3uuIYynWV9sExkh/aXy/lOxaipKlIiVt5XH1Ts6X/8iJrEH1VUzfRFE8GSf
	mzCMPk0yBKQ1D+pjt6G7eGiHZs5/O9nzPYpVqh3Rdi9ptIAc2FKMsT0DVxLZm9G+YLKTjSpqMfp
	nKjTjwSg4L7XniKMrNZ4+jJJPo4FI/TcKHHqCk5rzo5TWaS2EGkUU6ZF1+/AOV7j3Hu2zyFJghn
	01gZjLR+WC8M4EvRRvj78qoCdZywCfdj0VASYANYzYJzdt20AWOF6D8aXHyFj41BDpSJBsg+HYG
	kJSLnPr6x4RoOgqvju+Vuag6cVe7+kadHxXVxENQmWEMI0SgFWHush5PyDG4NyGGGMzhh2HNEv/
	uW9y88OqQpHzccdfdUoxBIJMIBHBpHvX4sBC14hH
X-Received: by 2002:a05:6000:1a89:b0:48d:c186:dcc6 with SMTP id ffacd0b85a97d-49585f85ae7mr6393858f8f.57.1794184198082;
        Sun, 08 Nov 2026 16:29:58 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4967a70a35dsm3479742f8f.9.2026.11.08.16.29.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 16:29:57 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Subject: [PATCH 0/2] Add interconnect driver for Qualcomm Halliday
 (SXR2250P)
Date: Mon, 09 Nov 2026 00:29:52 +0000
Message-Id: <20261109-halliday-icc-v1-0-def7cf786f75@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAU8WoC/yXMQQ5AMBBA0avIrDXRppVyFbGodjAiSIsQcXfF8
 i3+vyCgJwxQJhd43CnQPEXwNAHbm6lDRi4aRCZyzjPNejOO5MzJyFqWK6OkFA1qVUBMFo8tHd+
 uqn+HrRnQru8D7vsBiUZdo3AAAAA=
X-Change-ID: 20261108-halliday-icc-65a5442be859
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Stanislav Aleksandrov <lightofmysoul@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794184195; l=1171;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=IRLmg/T4Ucg8fvDrl6bT8sXAYm2xObD8gKEFdhhsCHE=;
 b=lGzTTrqn4CIpaQ3yuUtw71gJGLHu95Xl3xghzfcX63IbzmYYaFNRze7fyq7lB969c/V+njIFx
 U3IaqwXIkvaD/gi7THqtoaOagrl45KEfyz/rxyv/2ExdFssL1eFvW9j
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document and add the interconnect driver for the Qualcomm Halliday SoC.
The display BCM voter is left out for now.

Halliday (SXR2250P / Snapdragon XR2+ Gen 2) is the SoC in the Samsung
Galaxy XR headset. The DT changes follow in a separate series.

This work was made together with Claude, ChatGPT and Gemini.
Reviewed and tested on my Galaxy XR.

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
Stanislav Aleksandrov (2):
      dt-bindings: interconnect: document the RPMh Network-On-Chip interconnect in Halliday SoC
      interconnect: qcom: Add Halliday interconnect provider driver

 .../bindings/interconnect/qcom,halliday-rpmh.yaml  |  131 ++
 drivers/interconnect/qcom/Kconfig                  |   13 +
 drivers/interconnect/qcom/Makefile                 |    2 +
 drivers/interconnect/qcom/halliday.c               | 1909 ++++++++++++++++++++
 .../dt-bindings/interconnect/qcom,halliday-rpmh.h  |  158 ++
 5 files changed, 2213 insertions(+)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261108-halliday-icc-65a5442be859

Best regards,
--  
Stanislav Aleksandrov <lightofmysoul@gmail.com>

