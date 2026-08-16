Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BD922D8391
	for <linux-arm-msm@vger.kernel.org>; Sun, 16 Aug 2026 16:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786897106; cv=none; b=pqoPwz7aQA09CIPwH1cEIl1gxM98ip5kXX9GI6U4/Ws4tYXDe7sTc6lVzoi9yg+nLrg0f21dYQbvf66KE1uBeTWoV6dKyRaE6Roj96Suz08DZRLAQA8Z4SATK/8jLzh0uVcrDlFpGRqDhXx1M5OAPPnAEWV0/oJ85+zn5y34UhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786897106; c=relaxed/simple;
	bh=m4D3uG1yxZU27uoHhenULzJWFMswDjF6+99jhg7rkvg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gdFCzrSezSAAGYC/vVaNiXtuCnxKcPQEUuZJO8bG0vZ+GDFVTESEVFOJ2q9cnxUZuXFBmcLYvPuvajG35ZP5tQcPzLlYm4ij8HgN+h5/s382N2v2I+l1YDYse0xIpS65lS3TDy9LeKLmmNdmdd7fKc/QHMOaEIHEbQqOwEJSP78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rZ7Kv6ab; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rZ7Kv6ab"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2d032846c95so38024265ad.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Aug 2026 09:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786897105; x=1787501905; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ol8hwDPzI85A+yMe6OB7GvosChQst72myTI3oKPR5Iw=;
        b=rZ7Kv6abMaP7Gqm64LgAywsp0VsQfJbSmkD6Oo8u28aiU4I5nUoQhZ5IG0anqtgNrB
         TRPgJZCAgPm0peClP04M4zAaToJDJtOA/aHMN2JqdXNVAONNae9ygwN7u5EUPiP80zFw
         5yqobuF/6YRNgkBjAKkvX/DuwpWFTB28PTg90nlYGpSd7X8kI3D5QsA77B+qEYa4w9Zn
         E8xw/wZWyCjBfIjcTOpsEY4l+fzLfNK9xY+DYb4TzyYrtA4jfqCnIQPOe5xN9J3JM2uz
         UOWMV/xGY1PmiS8fLtsdClQ5Nl9xGwSghJOL/7wTbk21tXVou7hAK4V39HjdQi6z7Auw
         XlQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786897105; x=1787501905;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ol8hwDPzI85A+yMe6OB7GvosChQst72myTI3oKPR5Iw=;
        b=MUaf+6kB28RJM0q81fh2V/GfDcsQPbXyfcYqmd0HD5dkp2rORTq2JgPp4AGudHe3Uk
         EpRSA3wHuyezeGp+BYGyysqxt5Aq6GDPe/ev1RyiNH3yuizbFxe5oJKa5CynjcHVFevW
         Twr8PJ+VOlwP8HxWdN5yGeN5afCuHcwCxDpvNjwpJzdLtBxI18FLxJ4nBDUYNMjzXiFb
         ztedtpjJl1GtcVCQNPnz1XYUX1fOX6NNDmVX3GTuZ4wThLA02RWdYal+j+e6EAQyhpFg
         hxN3tQe/r/Ot/AGWuNvKjMQ02FsuvY4aCkMGWI21fcYTceczDMtNkmKOQQn8AiI9LHqr
         6ZQw==
X-Forwarded-Encrypted: i=1; AHgh+RpFx4u30xsngVr12lRpL/jtYXJeTAs9CrFxieOvrx6czNqvGMnpb2hTQ4/gwHSRNEYI1g+5YxN+whLUH9R+@vger.kernel.org
X-Gm-Message-State: AOJu0YwTEts3gWefBWoCkUNMoFGWaTkXb0ZFtVsArfrxnYULqNXhQoaT
	WWbhqCJBLrPEgpLG1ncIwuNOTSnuiMmOlY9yF0WpqsH0d7sI3TFeZIoy
X-Gm-Gg: AR+sD12fnj/oKTOmPw9R1YUJV1nUAitTl401dUXC+OgIqNcT938MmOyO9WtJtNt1Z3p
	6F6w8lLxYa00FR2HN5UlFo17UXb3FYGTUgs8lp2nWqeHtJLCqUpZh4+RgTFdh+4a1oqxM51jdFw
	IjTDuW1pKJ+efQjcEquzFS4UAXKyWShhPx05l3xFlYA6MmBaQtu6h4zQxMsuOhVM+lb4AjvBXTX
	x/wjASHF8UNZcFsxreIugLX5lE1A5O2+j/5i1OYSngUkeUAt4mIMcRpXgZ8QrlGDxyyACP5W9VX
	dXtQBaGEmS6uhnXjy0XdpVqXeMio/9gWha18WDUspZkLruD4zA7FSZZVd4FTMg4n+GYXNjbvZXs
	2QvioPh8cXA1Z0UodEwmwCcDk1nyhehTXFShMrn4NSD8puV6wLWLhuL9zzB6mu8I63HWqkJHQjn
	JOpfGJLR4gfsnlre5qLXwH5q+HKKwqhVES0uLIwjq1uXE1okeOLT9djbsr9ZclPc9yNzaGbTVSe
	nyqKc0qMGL1
X-Received: by 2002:a05:6a21:e8b:b0:3cb:eb06:ce09 with SMTP id adf61e73a8af0-3cc71de3b98mr21322781637.25.1786897104544;
        Sun, 16 Aug 2026 09:18:24 -0700 (PDT)
Received: from localhost.localdomain ([157.51.221.131])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320d5bd9679sm28969988eec.3.2026.08.16.09.18.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 09:18:23 -0700 (PDT)
From: Sreeshankar K <sreeshankar0910@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org,
	tglx@kernel.org
Cc: lpieralisi@kernel.org,
	robimarko@gmail.com,
	linux@gurudas.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Sreeshankar K <sreeshankar0910@gmail.com>
Subject: [PATCH v2 0/5] Add SM7250 base dts file
Date: Sun, 16 Aug 2026 16:18:03 +0000
Message-ID: <20260816161808.12419-1-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Qualcomm SM7250 is known as lito.

This patchset add base devicetree file for SM7250 SoC and
SM7250 MTP platform. This file adds the basic nodes like cpu,
psci and other required configuration for booting up to the
serial console.

v2 - Fixes/Changes:
#1 [Fix] The `timer@17c20000` node incorrectly configures `#address-cells` and `#size-cells`, leading to broken memory mappings.
#2 [Fix] The `spmi@c440000` bus node incorrectly sets `#address-cells` and `#size-cells`, breaking SPMI device enumeration.
#3 [Fix] Missing mandatory properties `cache-level` and `cache-unified` in L2 and L3 cache nodes.
#4 [Fix] The CPU topology `cpu-map` is entirely missing, breaking cluster-awareness and Energy Aware Scheduling.
#5 [Fix] The SPMI node name `qcom,spmi@c440000` violates the standard generic node naming requirements.
#6 [Fix] The memory-mapped `tcsr_mutex` is placed at the root of the device tree rather than within the `soc` simple-bus node.

Sreeshankar K (5):
  arm64: dts: qcom: Add SM7250 base dts file
  dt-bindings: arm: cpus: Document Kryo 475 CPUs
  dt-bindings: arm: qcom: Document SM7250 SoC and boards
  dt-bindings: firmware: qcom,scm: Document SM7250 SCM
  dt-bindings: interrupt-controller: qcom,pdc: Document SM7250 PDC

 .../devicetree/bindings/arm/cpus.yaml         |   1 +
 .../devicetree/bindings/arm/qcom.yaml         |   6 +
 .../bindings/firmware/qcom,scm.yaml           |   1 +
 .../interrupt-controller/qcom,pdc.yaml        |   1 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 arch/arm64/boot/dts/qcom/sm7250-mtp.dts       |  30 ++
 arch/arm64/boot/dts/qcom/sm7250.dtsi          | 499 ++++++++++++++++++
 7 files changed, 539 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sm7250-mtp.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sm7250.dtsi

-- 
2.43.0

