Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793134359;
	b=bafyouqGggZCZd8JF+d7L+UQ4XrFiHXtlA1w1fpQ3sfP5WFMdxX6Zhk5ihdfoJSf+c19
	 H28gHLIB/T27UwPv2RlcF3wXMTaymQ/luJiIR930lSZEcFmsVXEj6xUSXzkeo79sb8ngl
	 ep1FNW/PJk45RErq83gdk/JOgQTIGAjAJB3G8jdv3xOzSUCmK080OydNHnPNNsOvXcII0
	 epILyZ8lBFK69ReRIfAkhUe/jJPSTIWUssYPGuF83d11FM+srLYLyAf/PCyWggBKVADhG
	 Knqxt+9XdzjoiOFQlgYpVxPgMNZ2p/rUkDtNLfxrQpnMMKm5ZSIOiHrha1HMk3uJmXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793134359;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=JAPuSSjBy2HiV0XHwgEt3aaV8Ughg4BjhBgy8A9BioY=;
	b=COCsMq2EXK521qw0DVVV5rUT9cVIViU1Q/CbeIfXQ7HHBQb+twFCBCriKIWXHhunxSMO
	 gOtH++Bywunz1XRBAJEuedC3Y1Zly9KKFKtWVBTfS7IfVkJWod+hJYxAtN819F/3K3uPV
	 yuzJVyhNoV1tVm9egVWkl0zHbBbsWo8DVDxpWc8er/3nEzWb2cw2i5cW9SpUbJEGs3dEd
	 vMN2U62AvmEI7PZTo91sOWAUI9mtTvhQc0CDwFU2W98izyFGgB5ikoLT+xI8DnSf64ehP
	 txk+tcqeoiB3K6PhRoru3bWahOU1gKc/ZWR7kh6eLF4XRqxbsAZwJPhiWC2V2ffEt2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o8+uIxak;
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 957F3606A321
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 20:52:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 957F3606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o8+uIxak
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3ae0852df46so255391a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 13:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793134359; x=1793739159; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JAPuSSjBy2HiV0XHwgEt3aaV8Ughg4BjhBgy8A9BioY=;
        b=o8+uIxakmfDagDkZCK7+K6/vRP/IVouu2zhyMfMqSNNIX8uO4j7UOSdKzAnJG10Qgg
         TcZ0qI6eEWtQfCuXaxmrArt6DgXQAISp1+BzCg4MmL3coNG2Oa081uRLgqaSMIiS4GiY
         hOjBeH/qnW9dN5trvA9hGcQKE1N51RrJGgVg5nGhH1aMJTlPtf4NG9qZukH5OylYQPkh
         4nWMF2UckyXkbGyijuyO761Z7iu51tD0qaP9PyluGQbBM3+qZOpULIXkqZAs6XsUCn2p
         7MZ77ZoeliWVVsTIgmRDtzJCJrKJ+mOLIZRFOEfFmco7vZDadczAUbT/floDWB0ZAqqK
         YTDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793134359; x=1793739159;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JAPuSSjBy2HiV0XHwgEt3aaV8Ughg4BjhBgy8A9BioY=;
        b=mchS6S7d14qbDbhcgRVfcDagEDcqT9Z+yzaS9ehYfnNo7cFeDa0G+z5P2nD+P8h1yf
         apQThjQVw/c5Oi3toM7WKCCRPDYOrXWciP5IGOAJ2s3i50TIWrWMf89rnGEqytzgVgVW
         3eF4nqfIY5RTYA24ERxcoAYGuseI9WhV1qY8v+mfrZczFjtv6prfn+VZjM3RRxaOvUqL
         FZ6ouh1z+MHhVWYUetCwTemU0NkySXvSuNdxqP3QSTCVHStElh5gwAcy5RX+/Vf+GOZ1
         NzIJ0osjCgl7jSBN+z0g4ph5zytBnDCaRALeM315nAYRG6hqqqbE2afLQ3Mny8wRHCms
         vkvA==
X-Forwarded-Encrypted: i=1; AKwUvBxY2tvWWAWB6YdF+P/QcFypTn0G4WTV6TTnWyEXLvd244ugwMded1dg1Zg65DZiThjcxK8vV9NTGqLLfvhK@vger.kernel.org
X-Gm-Message-State: AFq9FYLyeneA6yqyC9tVgH1R7x1bg91jNl1dXVVE8NJP2buBiTqaQ/Og
	pwT5iNrWQ9J2OACN8d88TbZ2iBGY0kcrgvQKDNl2JzT+OV7bf2U1Dt+a
X-Gm-Gg: AYBFou3ZxD65yZYJ23EvwD3DqBezNxavFI0Iaf44E2oGyHOnzUyAXRjhIjg/TEPvccP
	R6sH/6jrpgDumx0AksYPJ2CwZ4vouYSqQVU3bm5UR707QXVw7hE9t0jQfUIr19O8Cogaaa5Lpv2
	r0e5l2Q+LncoVo3ECHxDdxTTb2Gt98V4u0ke+Cn2KeNGmwLYbU+fBKZJWKdOFBZNL6tUA2+QAg1
	UOuSwNU6RMzDT9+vcDppiuBa0nLkE58LP29Vd9rKzyTgRAhkYW2qt9XMWh7FDPu0oieditPzALT
	E4ZvIUawcozTk/zQEnQ7i6Og9t+WsbHU6/IiTkgtBp8kKTMKG30lkK3HcZlG21ZL2p1YCEb27TZ
	rlnwBx7T4wj8kc8azIF6ZownAQGGEeBtiTn3pjmeqGU+Y+T/th2AROs+20QPm3yaccRcc/x0OKZ
	EfB0jLn7CzvEE9NIVL5rn8AbN23YiAo3uHZKN2LdGh0JqD/w5y5l2XD/kqqb66tZ5/orPaCvL3K
	ad2HahjVsXdlJDOQuVVFSQAp0Jn79tXyAb3kLnMP46gH9zlkdYRuE3+bifQYIzum22sxlgG2ULg
	f+0ADsEZnT5NE7D27GG5YZG1bKVDeufs
X-Received: by 2002:a17:90b:1c0a:b0:3ae:3b3d:c617 with SMTP id 98e67ed59e1d1-3ae5812dd39mr123478a91.29.1793134358980;
        Tue, 27 Oct 2026 13:52:38 -0700 (PDT)
Received: from debian.lan ([121.101.131.247])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae57bc67bbsm372192a91.3.2026.10.27.13.52.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 13:52:38 -0700 (PDT)
From: Amir Hanip <killdeath104@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Amir Hanip <killdeath104@gmail.com>
Subject: [PATCH v2 0/2] arm64: dts: qcom: Add Xiaomi Poco M3 (citrus)
Date: Wed, 28 Oct 2026 03:51:44 +0700
Message-ID: <20261027205146.16384-1-killdeath104@gmail.com>
X-Mailer: git-send-email 2.47.3
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

This series adds initial support for the Xiaomi Poco M3 (codename
citrus), a smartphone based on the Qualcomm Snapdragon 662 (SM6115).

Currently working:
- UFS and microSD
- USB host (OTG), limited to high-speed (SuperSpeed is untested)
- WiFi
- Bluetooth
- Remoteprocs (ADSP, CDSP and modem)

The memory map for the ADSP, CDSP, IPA and GPU regions differs from
the SM6115 defaults and follows the layout of the stock firmware.

Not included yet: the display panel, touchscreen and the GPU display
pipeline, which depend on drivers that are not upstream. Until then
the display is only available through simple-framebuffer. Audio is
not included either.

Firmware and userspace: WiFi, Bluetooth and the remoteprocs need
device-specific firmware which is not part of this series. WiFi
additionally needs qrtr, tqftpserv and rmtfs running in userspace,
and the Bluetooth controller needs its BD address set from userspace.

Tested on a Poco M3 booted from microSD with a v7.2-based kernel.
The series is based on qcom/for-next, builds without new warnings
with W=1 and passes CHECK_DTBS=y for
qcom/sm6115-xiaomi-citrus.dtb. The existing dsi@5e94000 warning
comes from sm6115.dtsi.

Changes in v2:
- Unrolled the wcn3950-pmu regulator scopes, used lowercase hex and
  kept a blank line before 'status' (Konrad)
- gpio-reserved-ranges: dropped <0 4>, the device boots fine without
  it. Kept <14 4> (SE5 SPI), without it the device bootloops. Added
  a comment (Konrad)
- Kept citrus separate from lemon: reserved-memory, PM6125 regulators
  and the wifi/bluetooth bits differ, and I can't test lemon (Konrad)
- Patch 1/2: no changes

Link to v1:
https://lore.kernel.org/all/20261027075116.41673-1-killdeath104@gmail.com/

Amir Hanip (2):
  dt-bindings: arm: qcom: Document Xiaomi Poco M3
  arm64: dts: qcom: Add Xiaomi Poco M3

 .../devicetree/bindings/arm/qcom.yaml         |   1 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../boot/dts/qcom/sm6115-xiaomi-citrus.dts    | 538 ++++++++++++++++++
 3 files changed, 540 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sm6115-xiaomi-citrus.dts

-- 
2.47.3
