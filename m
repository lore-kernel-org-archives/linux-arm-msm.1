Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794864268;
	b=l4xLM3GJ4+KMdrZ4EBx6mhkSpsnJzBEkTVv9S6LUXdMFRvkWaShggFgPOSoWKlgcOJtS
	 5upyyp1armdsUOMoJcdp7KpBYkhG7M6ZdYJunOV9JyqZNeovzzUchtBh+MN6hQ0o0zjdU
	 vQ0/uEOsArNpqKVN3hLYHHxP+U07XJgPF0MOKF+f3kWp3X35sO4Y86GUD2eZUu7lba1fp
	 N9WwoMGkdmuZqE9cXFlvA6gV7pQ5EXyvG1ChwYb4BCBdwW+rljm1IGq5b5rvSzCKloH/d
	 OB+C0GZ9qiJ1aenaSzOqzRkJ+dyVirrcC5wmoiq0D2Ga2iwl9GzoWEuO9rrv02bcTlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864268;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=SVbBJIE0UBMoZDDXFUbCowdBxaKmTm3xtl/vwOrYCpo=;
	b=2KZwCLjPzZA2qlIfM/sHHCtpAA8wVygHvbcB+CR/U7V4oOP6M4ftZsRO9Ri/IWNoZvFi
	 eGqf1+ST1mkyFAZL584AkLoc53lzGk4PXvs7hTGJP56kb1iKfzoYWK+XY0MJJPsOE4R6a
	 uMzAU5GXIck203KaSNf1WN/TrovxyDeSfJMzecIbjny0UCWgTHHZDtHS8bi32jkBp44dx
	 ++3eVLjpVeVxopyr8CerTWRf1JR3Dy0Tma/fpAXb4tNgjJ/ONlbZo9EVbIAG9+oMEVS0f
	 LOVbYvIMzyKJgOMK9Lb0tFhccXg4khZrQOf2uhISb3bw1tCOkQqrYfd1EYJP3Gy/ovg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=juy0Ini1;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86B0C606A32A
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 21:24:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86B0C606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=juy0Ini1
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4a358881793so193609f8f.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 13:24:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794864266; x=1795469066; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=SVbBJIE0UBMoZDDXFUbCowdBxaKmTm3xtl/vwOrYCpo=;
        b=juy0Ini1YCCl1DbqXHd9Am/uDxlGe4PFtG8GyDtQM8Yy9fqEcKuyZCICFaQv0iQXET
         MyHh/WhuPMcqOVXnKk6qJ5TVHBCO6xMMlTCnVGdITFJg/lS6vQxgH4lg4cUp4p1GlYVp
         ihdw0RrKSjzIDIyOO9eGusBtzL5aQg7+n5GXl8R2HMOHo2eK3o6Rv3NtsX0+QTf4q3Zf
         TAG6JVMp2Lv9ACtz5tf4kIQq88jSD5E/bAGRX+s4McU+XiYW8lBnBr11zLMsfD4SKCG+
         P8+tiYvPyyQZKtBEZMVxF+5ox7ZrVBsXl6rDYZMikOONvIAriDSdYHGbAeZmUTjk9vOf
         VeWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794864266; x=1795469066;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SVbBJIE0UBMoZDDXFUbCowdBxaKmTm3xtl/vwOrYCpo=;
        b=CJgkpHLBFjLHpB2xWsk9moMe9PP4bdhlWuQyIcZipvZcMlcFd22opy6FwPSzIx8jp7
         TXWi257eP0p5AqqEuDxrYZS603fwXF/iEvUMI2wxXQPEPXw02aABXe7LGVnCxYsNtujJ
         EsHO3+1W48KFuGFiSsXMxrDCD0F6dqkMAZ48xESglZ8vr1Ob1jXFlDpoVVyif+tceFin
         Asx9IssbrTU5hjXd27Y+em8R9+pELmPieGWMD6Ntd8aVJciQGhyo7FiKu03Nlt+BU28I
         cDPFAUNdzVaUaUByQIhu+fuG9nDL24PTaBXkuBynaxwjWQPAcbEQrZDljvhnDaboaqdh
         Onmg==
X-Forwarded-Encrypted: i=1; AL+hErHhphv0HIh0AjgEVrWSDLr9ABMnP+xoAwTI1ef7BTDIF8ue1YC7pYfvtou8tRsFiHP5rnS3OcfxrNxTafTn@vger.kernel.org
X-Gm-Message-State: APuU4Z/jiTCcfdSYBZXLNalWxoVFE7uuEJotnU/c2Tq7ivRp86WcCbtK
	zYpEHZ8jJTTHm2Ckq4MeC7XlYxAq6voxaa1fGOb2mqb3qrrf0HaMzJw3
X-Gm-Gg: AZFdTZftQoyhOhwyfSTa+EO2ZgbOLCruCEbA4lMPZRdydGWdcNJm0L4wtvZCklVKS3q
	9LImHruOhXa0B46a9Q7jheq/mus+eL4zHb3NDRQ/x5/W2kJkPPGdljqEZvwJXOhJJIiA4/+XyKi
	o4kOZqJBlCYJmzBaBBVhht38PkDPpA+4SMpVozuxsWYfciLlOv7RXE4r0E7350g8ezyapdiSpMd
	EU6ennpPHT0Xw+hz4JP5fL4QBjkAwOqLe+Q0djY3MT742hQlPoJKaXRuneLyFAEqTOxONwJYnXD
	GEhJnWBNma4bfH+dJrEurxaERfiXUnNFRarDx6GEUIqdKGaZg+jBSKf4es+XMLD8o06slKleCGG
	uODcJ1vFikZbtOByZG5tTivVJpFwdzBrXxMenNtSqG5rCTjJO2KC3WBKx6xKlsZpdgV+fC5n7Mb
	+z8n2oXljYPQa4RKW+JinSzg8809VmjQH8PQUkEQoVW/geaEuTI0y2NFijdBFlD4spfVi/WQ5J6
	Hmqf2CaWlvS41PoHQGldjntQ4zHj/a2baCxWBg4pDnzHLaMKzvYqzZ0RKwiIk0Hl/OV9yzgJTLz
	evOHJydSUC9gT3ergFbKiye9js1ajnhfjM2Hu10O
X-Received: by 2002:a05:6000:41d7:b0:492:b5d9:f627 with SMTP id ffacd0b85a97d-49c7353c794mr23553821f8f.46.1794864266042;
        Mon, 16 Nov 2026 13:24:26 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a2f61c0989sm2414728f8f.48.2026.11.16.13.24.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:24:24 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Subject: [PATCH v2 0/5] Add RPMh and global clock controller support for
 Qualcomm Halliday (SXR2250P)
Date: Mon, 16 Nov 2026 21:24:18 +0000
Message-Id: <20261116-halliday-clk-v2-0-28208928da36@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAIJ0+2oC/1WNyw6CMBBFf4XM2pq2KAFX/odh0ccAowVMi0RC+
 u8WjAuXJzn33BUCesIAl2wFjzMFGocE8pCB6dTQIiObGCSXhRC8ZJ1yjqxamHEPlhdSVLw5NWd
 rIU2eHht677lb/eXw0nc009bYjI7CNPpl/5vF5v3S1X96FowzyU2uVamRa3tte0XuaMYe6hjjB
 xff0P66AAAA
X-Change-ID: 20261108-halliday-clk-362190f4f5dd
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Qiang Yu <qiang.yu@oss.qualcomm.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Stanislav Aleksandrov <lightofmysoul@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794864262; l=2616;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=1wKNlxbUO05hN5xuomY/VWb202BKFBlZseityHzBS6g=;
 b=QLeMRLS3lJhKq/slwW2g7GS+lXLf7jP40aImaALzbPkpD1trwZ+XOVRhn6iAC4ieIOkTp5e6j
 v7kaITBUy8mAfz7eyrfabPUk1zp5iwyVBaDR5tE9u/x4K+DSeNrTXCG
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Add the RPMh clocks and the Global Clock Controller of the Qualcomm
Halliday SoC.

The GCC has the clkref_en gates on the outputs of the QREF block, whose
supplies are shared with the UFS PHY. Patch 4 lets drivers built on
qcom_cc_desc register clk_ref clocks next to their other clocks, so
that the GCC can vote for those supplies.

Halliday (SXR2250P / Snapdragon XR2+ Gen 2) is the SoC in the Samsung
Galaxy XR headset. The DT changes follow in a separate series.

The series is based on v7.4-rc1, like clk-for-7.5. Patch 4 conflicts
with commit 4dd10fbbeb9c ("treewide: Convert devm_kmalloc() family to
the devm_kmalloc_obj() family") in v7.4-rc2, which touches
qcom_clk_ref_register(): the resolution is to take that function from
this series.

This work was made together with Claude, ChatGPT and Gemini.
Reviewed and tested on my Galaxy XR.

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
Changes in v2:
- common: Return a NULL clock, not -EINVAL, for a protected clk_ref
  with an ID above the last regmap clock (Sashiko)
- common, clk-ref: Use devm_kzalloc_obj() and devm_kzalloc_objs() for
  the clk_ref allocations
- gcc-halliday: Reuse the wrap0 S0 frequency table for wrap1 S0/S1
  (Sashiko)
- Link to v1: https://patch.msgid.link/20261109-halliday-clk-v1-0-20c3ba8be0bd@gmail.com

---
Stanislav Aleksandrov (5):
      dt-bindings: clock: qcom: document the Halliday RPMh Clock Controller
      clk: qcom: rpmh: Add support for RPMh clocks on Halliday
      dt-bindings: clock: qcom: document the Halliday Global Clock Controller
      clk: qcom: common: Register clk_ref clocks from qcom_cc_desc
      clk: qcom: Add support for Global clock controller on Halliday

 .../bindings/clock/qcom,halliday-gcc.yaml          |   84 +
 .../devicetree/bindings/clock/qcom,rpmhcc.yaml     |    1 +
 drivers/clk/qcom/Kconfig                           |   11 +
 drivers/clk/qcom/Makefile                          |    1 +
 drivers/clk/qcom/clk-ref.c                         |   90 +-
 drivers/clk/qcom/clk-rpmh.c                        |   22 +
 drivers/clk/qcom/common.c                          |   68 +-
 drivers/clk/qcom/common.h                          |    9 +
 drivers/clk/qcom/gcc-halliday.c                    | 3533 ++++++++++++++++++++
 include/dt-bindings/clock/qcom,halliday-gcc.h      |  249 ++
 10 files changed, 4016 insertions(+), 52 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261108-halliday-clk-362190f4f5dd

Best regards,
--  
Stanislav Aleksandrov <lightofmysoul@gmail.com>

