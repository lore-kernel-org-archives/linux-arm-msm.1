Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795684180;
	b=szkRnfeCe9ppjYwMjdPu4M63Zshcq4mBjsxwb/TVQShlbXyQ6VBsxH53JmdFRDHJpGDy
	 AAue4KcCxhCa2WAZi9jBsSRqByDJhdoKYV3w90B5fUiN7KLgENalCfchwlBJhpY14NIoY
	 tIclJ5qepywmcVrJTu+j2n0+cTnZU9QQjFgI7Y4DA6D1qP6yTglB9fCdcNqxZiLNtH2FJ
	 ixiAuUzUI9ZrHw/EF1CnnnBiCsByYusOTA9gyflgpxLZewXxmHD96iHWWgkWUT9wuVw+N
	 XkUAMErtnMRPbcWLG652YQPr2i4ysBYis78LAYCQTidSURyZYMNvtrk+2CJCMWc4hTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795684180;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=6j+nTtkEYU+rOhympPIn3n18jdsCRRFadJNhZJaK9Nw=;
	b=z1y1z3ZVjcgN431NCFXTHYcu36qNOS9aORPHepyjwP+n7wyAwb4znSqoPcsRgNpaUxXO
	 HZhf8G3sExrbP9qDy+uJp/SN424miSF+exh81zY907JZzpCkPLVY4s1rp91BaeaXoJ8uf
	 q1bC9AjyUj2r+MhZx4Xoe82nA74/jcYWyzlGPoMDfPJPhAzMFlke6/ZMGX5kuTg702D93
	 1YEKkuEiSqOAG+HkMZ4A03hNZ7dL2QmSJ6Nx3DyZKMXCzJKPfaNmZwa+akokYfxQLNKHN
	 uhwAIVaz4OK5zfb1wcX77bluKnVdLsn7/FvAyqLM2Ku+0UIvcA6FYn7ihuk60QddXgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c0ofdAHN;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A04D606A31C
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 09:09:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A04D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c0ofdAHN
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-386ab9ab619so8843610eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 01:09:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795684179; x=1796288979; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6j+nTtkEYU+rOhympPIn3n18jdsCRRFadJNhZJaK9Nw=;
        b=c0ofdAHNY6p0nzbi9Dd4vE0hr2HXmbCm+t/BaPPRiML3TtygeYvKsvz7coqZTaQw3A
         C8FKJbFMnncb0ucyGWpjtoBDkM5D/O6JRp/EA5oayMDp88hW/4kLu8UXec2L9L9j4ki2
         8LMVLFzq9EiG8IofVsgucdi4zooQ5tya4KzCd9b3GcdBWkAGuYMPMfiLVgiRoTwiLDzX
         m4ql+oxmeScoE96yqesSyiZSilZq7cflvrXk2ZeKypst+8CmcopPtrw4Bs3wmwVU5ro5
         QDjuV+fRpX0ol+8iydPMFK5kJtuUHTOV+M6rr9uYsn0uCSIPUs0QfswvegX5Tztl8iaG
         9oBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795684179; x=1796288979;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6j+nTtkEYU+rOhympPIn3n18jdsCRRFadJNhZJaK9Nw=;
        b=QhkLiF+bylg87CA2pxWTSk62WLqToFX9G3FbZck2jYCNGh6p2kq9bC86lnQgd9IfmR
         7m2UOFdEnNC3T+eynyOUKmME+iQPYScCk0gvPvX/9y6J8oqWiwcJsU9VEB8zOwYcw0T5
         hWTUOgo3xV6FkO/TIbt5KZML935+nGpC1fXTYh1d8mmQE4dJGK52mZyTzIg1+AvARcDz
         /lwHpdFfSCKIvoZRtFWVZbx22VQTVc5ZwYcB8o+hNcva7BFr+qkptPBDhfafLpDghbyQ
         H0iJu5G7uDUsBrtNbflZMtnhEat9EXVUHNwdKB3BPgKkdeVaOvSHee4FfR1YKsCxCp9D
         YZ/w==
X-Forwarded-Encrypted: i=1; AL+hErHG0EMS22AL0DQ4rs8JkJySAsCTARq2cfK/IBSpK6FY43JSFoXiQlxN7wyV/SdvTk7GhagIk/M8QPJdP9JR@vger.kernel.org
X-Gm-Message-State: APuU4Z94WG2hq9JEsy/2wneUNBQBt7wSxBeKz8GNTlroBqdd8wXQZQZa
	/sDmg2KuIxcp2vseqUc0kNQSQAqf/7f/Aao8AcS9SQF1IjnE6p1TI6cE
X-Gm-Gg: AZFdTZfdB6LKbCA7F20ZMTWLlcERZA9LQmqZPR3eYYyIPbIgZzppCLThtMAWBjHd3t5
	UbPPvkqmkGZquplreUys1628Bw+CfM9Xjc3gXgzM6hrtr3+XnT5kzSAuZ38hNqvQtIzn0bQMos0
	yqJGo6QYpdw32/KsfXM79K4SRiPb0+LHde5lkhxV2IvES8EVdaYUD59siR8SLFp9CZZZlNta6vR
	K/ESec4/kEgjBf+RxmTad7yb4u0pzo0NVMPVGYgyFkPY93pL3QXDG7rJJaZFA28uMmcF5ztm3IP
	prAYMS7hVsnD+XqpPYTH8n8zuw5vz9X8ngMJLGsCfay2OJgXHfXuUkdGIkA7OH+U/HDR7dhZZlv
	mPf3q0miPG4ZWEUxEMAZ9dK7gv5NKEcqohZ95hTVYaz10grRSzPu0/oG13tsiRBneKbs7Iw0xCE
	UjlmPaNmF930ZcW/C9SfYMgygZu6uDd2TilSKWkNdHvctsdG6XGc6kxq0ZlS0+mFl7+/DjgvGH1
	uSrnHIhuksCJ8aGECycLJRx8fhI7V1Whz2Cp9m/wxb2u/fh4nM/eodSs9GzE5CjOx35hkXNd4UZ
	UaPk2cBPXPhhtRwsDeFiBshvjhTsurIQxR8DI7cdwol6cbhTrcB8D8u7oD8eTfGl4yrZq+FLRA=
	=
X-Received: by 2002:a05:7300:d08a:b0:386:240c:19dd with SMTP id 5a478bee46e88-386241b6dc4mr18249807eec.9.1795684179444;
        Thu, 26 Nov 2026 01:09:39 -0800 (PST)
Received: from 192.168.1.36 ([2402:a00:163:2ce9:ad38:eaaf:b00d:c452])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm108374649eec.3.2026.11.26.01.09.34
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 26 Nov 2026 01:09:38 -0800 (PST)
From: Ajit Singh <blfizzyy@gmail.com>
To: andersson@kernel.org
Cc: konradybcio@kernel.org,
	abelvesa@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ajit Singh <blfizzyy@gmail.com>
Subject: [PATCH v3 0/1] arm64: dts: qcom: Add Vicharak Axon Pro
Date: Thu, 26 Nov 2026 14:39:27 +0530
Message-ID: <20261126090928.73637-1-blfizzyy@gmail.com>
X-Mailer: git-send-email 2.50.1
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

Add initial devicetree support for the Vicharak Axon Pro SBC based on
the Qualcomm QCS9075 platform.

The board description includes the debug UART, UFS, USB 2.0 host with
an onboard hub, PCIe1 (NVMe), GPIO LEDs, GPU and DSPs.

The compatible string was merged separately as a917cf9dc0e9
("dt-bindings: arm: qcom: Add Vicharak Axon Pro").

Changes in v3:
- Rebase on linux-next and include lemans-embedded.dtsi after the
  platform resource split in 1f90a2bab7f6.
- Drop the binding patch, which is already merged.

Link to v2: https://lore.kernel.org/r/20261030074404.33517-1-blfizzyy@gmail.com

Ajit Singh (1):
  arm64: dts: qcom: lemans: Add Vicharak Axon Pro

 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../dts/qcom/lemans-vicharak-axon-pro.dts     | 514 ++++++++++++++++++
 2 files changed, 515 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/lemans-vicharak-axon-pro.dts

-- 
2.50.1 (Apple Git-155)

