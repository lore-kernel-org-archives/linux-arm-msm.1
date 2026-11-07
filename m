Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794018308;
	b=IHCxamMBsfaX4/U2qiLF51c4a7nxhdcecRGySMTdpFeVLMGuo3accNstJNAudKDaL/X6
	 8KvW/NF4JA2qvFJR7izxooQBlZKaght7kjbu6Pn7vrg7rr3NcmHwmk2MbQTyZuP4FjHgE
	 9vRq7tj413T6+bybvrhlkj3GSYczKnxiJoJ9z+2aCXBWDMaCd5vGcGrDJRaW7fWnk4YI5
	 j2ejqgXxRjqIMpfdUb06ZXPJoHazuEtEBvY7KPpxh0ViYdqK/vASbfLp4xs2alE++aHuz
	 8uYh2JUKVv+ocpmJdDSyXimY5dEnUTQSYH/gW1fQsCvHCdZg9hw8DMtgrrppYUhrmsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794018308;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=di1VRLm1UqWBNtntlKfBC2I8DVMPkZ+84nIHrlZ9/j4=;
	b=X2bkQVQmnPsdCB0MBcJAyR+GU6jMKJspeV0nquJoem1qLs8NuxJIK9aAcdslkkgGF00m
	 0xVFlDGAHJM26LBol06u6tYmKB/T+moOsI/LRhT1yOeMcMA+Z5ZzPzCtEN/ctEoSgv/xD
	 3m8EXxZ0rEE1V2FY1LwHkE5STPqAN5LK6ozWQWLevLL0a+6jZT9U2+mS89m+/TfHwAoIr
	 85HavcHtPKTFWqlpEs45wCtubSFQ6KOw5vKSEsHU6205zrEj/EdMOpkwyNdx1tGvCe4/r
	 wrNAMPR/tg5aPyJS0Ea1ZQf3Ug0TCgwUpn3+II5HoG6n9fOHq00uhMHkxc9QuatL5oA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GBM5NYlb;
	arc=none smtp.remote-ip=209.85.217.51
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EEC6606A32E
	for <linux-arm-msm@vger.kernel.org>; Sat,  7 Nov 2026 02:25:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3EEC6606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GBM5NYlb
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-7d2b25fadaaso463976137.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 18:25:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794018306; x=1794623106; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=di1VRLm1UqWBNtntlKfBC2I8DVMPkZ+84nIHrlZ9/j4=;
        b=GBM5NYlb/2KYIN4+6oMVOLhLKYe1LYH8PoQfIrk8eZ6FQAl7UVf+/C81j/j7XppFWG
         z/T8GEY3WGp8Vwq0ODHSkuO69L+H4C7HtJSSmeI/KAuWS7TTiWEyAww+ReZbMh8CFCig
         moUIluGJDFdTlUnZA5r5NwsxOJ0n5zVtuL/1AaRv3KtSxvKKEndg/SWSVhBkrWmljX5R
         eY30JI4smany7tVNErBkmoacVJ1goZyGnHKqBH8k+bP7GHHsI7Av5XSBG73zILOL2Ytu
         r7+tAt2NrDpSJXsMr+w6ZBiJtwAFkrbTQ5If9mCUy0VKqh2DreVuukW2Cy//e9bb3INR
         Az5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794018306; x=1794623106;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=di1VRLm1UqWBNtntlKfBC2I8DVMPkZ+84nIHrlZ9/j4=;
        b=gYqeH6zHhfWNZLrafEZ8micKYPe0HDQ/KjWS3pPppf01MT8NjQC2wtsAPMdEXB2Lpd
         wiERAEBYV2nNAZOQglnAF8ScGaEBBkYz19NMQ4Q+vid3s83K9N0HwMX7jL39f/GouszW
         sm6Og3luGzjzMWI/UvBrVFVG8Y/7IjSmO4gWa4BOvrzbU6uYzEMIscU4dCTCf9dNMO4w
         /F2YvMYWTICBHX9EsdwPPrYnto+J8YPcaCBZw48Ql389SeYG99xuvaqY/hzglcZ6EtqL
         3GE5bzx9r8rHw+WU9eujuFi8qXkeNKzilXXpUu8GyEfduYy0xCWPM1hXKk5NDFFO9CbG
         9mGQ==
X-Forwarded-Encrypted: i=1; AL+hErEjIohznTkLaKkwS9LqCfEoWTOQ772e+nA5JuTIj33yaGcU1GxC2Sf7cAfJOotIT8d0eS8edHueJYUrXaDo@vger.kernel.org
X-Gm-Message-State: APuU4Z8drJwCD52xitRTYBxdQsT0kKoAmqpp0lVJiYDvM8NEXNmFQE7Z
	/Ls2YPwGnEqY5cS23p1PMLhzIPVBu4m+GrXgJEh753lsXsPE3Hxbofn0
X-Gm-Gg: AYBFou3RDylz4qd8ItytR0HUUl0Sb7op7EseXoqZFi+BbL3LSHNP0v6YzJmXqGYgz0I
	yJlfK5DV//FFgRPutXNk2GY3rGgzahG0vuySaMN4sF3GaprRsGlwAd4Cm6QwHsIRHB/n2zNuJdh
	fEBwnTfVd+8zFss3xxs8EhlU+Fm+mrf+zd4NY4RZsF9lgpMt3e/Uo4F1qMvFzopyrw0OG/8oMDB
	kblFzqhII503ehfryUXMP9lgvqrqZzV1S/FbZclKCkm+jBto8Whi8hDrpTHoE4YCKhp+gAlJpub
	MEKC+72RhTUrkcwsNNcJhCg6FKFHx/GyHlHYjGhQC57cRr64xHycXeRQVCHe9IedlZIYBYBQUKt
	K9gkNMWArQI2dd+INmKxWMok9sUsD7c9D+8ampYdMh+IwWx78vfsvhHEvRj9HvcVW155kmTH0Bd
	s0SJab2S0Cgx6rNbYtYsVeqzCi4zkXDfTmC5f12sUUhq7YLNDwJ0eg/CxWWWqbQvDpy2aWdHrp8
	4/bMDSobH4lTeP05L+7cBaZM+uwIlepAiMQjvrnEbwTHb1C4gH1zzjfBS0x5tD/t0KD/zd+iZly
	4qE3BCSz092EctWZ1jJhJLhkZs5c
X-Received: by 2002:a05:6102:32d4:b0:7cc:3eb0:6ece with SMTP id ada2fe7eead31-7d2a166319amr2396569137.33.1794018306156;
        Fri, 06 Nov 2026 18:25:06 -0800 (PST)
Received: from localhost ([174.93.36.89])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d2a89412besm2641941137.3.2026.11.06.18.25.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 18:25:05 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Andy Gross <agross@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v3 0/9] ADSP for SDM670 and sound on Google Pixel 3a
Date: Fri,  6 Nov 2026 21:24:44 -0500
Message-ID: <20261107022453.159341-1-mailingradian@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds a user for the SDM660 sound support code [1]. It also
adds the ADSP remoteproc for SDM670.

[1] https://lore.kernel.org/r/20260730174353.108023-1-mailingradian@gmail.com

Changes since v2 (https://lore.kernel.org/r/20261003175659.23536-1-mailingradian@gmail.com):
- stop using fallback compatible and add lcx power domain (3-5/9)
- move lpass codec bclk from sdm670-google-common.dtsi to sdm670.dtsi
  (5/9, 9/9)
- reformat q6dsp dts (5/9)
- set flags for codec interrupts (7/9)
- move "qcom,..." properties to board dtsi (7/9, 9/9)
- add review tags (6/9)

Changes since v1 (https://lore.kernel.org/r/20260922015801.32373-1-mailingradian@gmail.com):
- squashed sound card and device-specific codec config (11/11)
- converted to fallback compatible (4/11)
- added compatible for WCD digital codec (5/11, 10/11)
- removed sleepstate comment (7/11)
- sorted subnodes of dai link (11/11)
- add review tags (1-3/11)

Richard Acayan (9):
  dt-bindings: soc: qcom,smp2p: add sleepstate support
  dt-bindings: soc: qcom: aoss: Add compatible for SDM670
  dt-bindings: remoteproc: qcom: adsp: Add SDM670 ADSP compatible
  remoteproc: qcom: pas: Add SDM670 ADSP support
  arm64: dts: qcom: sdm670: add adsp
  arm64: dts: qcom: sdm670-google: enable adsp
  arm64: dts: qcom: pm660l: add analog audio codec
  arm64: dts: qcom: sdm670: add digital audio codec
  arm64: dts: qcom: sdm670-google: add sound card

 .../bindings/remoteproc/qcom,adsp.yaml        |  15 ++
 .../bindings/soc/qcom/qcom,aoss-qmp.yaml      |   1 +
 .../bindings/soc/qcom/qcom,smp2p.yaml         |   2 +-
 arch/arm64/boot/dts/qcom/pm660l.dtsi          |  37 ++++
 .../boot/dts/qcom/sdm670-google-common.dtsi   | 142 +++++++++++++
 arch/arm64/boot/dts/qcom/sdm670.dtsi          | 199 ++++++++++++++++++
 drivers/remoteproc/qcom_q6v5_pas.c            |  16 ++
 7 files changed, 411 insertions(+), 1 deletion(-)

-- 
2.56.0

