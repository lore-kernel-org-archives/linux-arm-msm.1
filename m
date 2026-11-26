Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795674671;
	b=K5905NLnn0soTdRtnm1brwkB/dDa+bXWJm5yGnBmktmpQEik5jM79nddFE8grMmHJx8/
	 TEwXuElgjtmpB9eQDBLbR2kcRCA+O86DlmgzJce4GxXWb115gtsQASXN6jZXz6mp0RLrk
	 l+1s3qA9GXnXMI2WZ3cFchILAUP0gTpXoAF+tASyZuJB8PHS3JRXYojLyxx4lXm0nn5kg
	 Z9KwGELUTqisqahhb37ce3S3+HF7SVArWGZg8Ce/D1DMaJ8GLrIHDWH8GP6G0RcN0t428
	 nzrVzFh8SCIsFrGtNRCjzcyYp86tlsIzi8HIlMg4mp33GR2k0i5SAPHFQ3ntWoEZaGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795674671;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=E+IMOor8CoFQ3z7zL5CBrn2YjfbaXVNycgRbuyjfvZA=;
	b=aKSWgg1MelEeAF/rw/klrIcEPP9+rrMdfVQuVRKkpzN1Tu0r+ZOJi/Qc3UHHVnSXcpOP
	 YwDudJ2jhLV3+VmEphLA0w/s35jO5lR2zf0OpRrAhJmEZb8/zWbU+fMYD+QH23pkydJ3H
	 HWxiQFFXFfk4CPumt6Z7noJHtgV6Zg7ukHtFTd4kyrLUA6Kz7FxgQtEuMWr62RkgDxIHt
	 yiOW6yuMHIzmHbspwC+joNE/iOcEiuYDE9G0ak61DV2Y+c0oSiZ8yDSGc2K/ZXbNmX17g
	 5M5S5o1CFADka6vqZdrRqT/iutmd2b4NBFOILhLH97mulq1+mwjWVYU/BjzWumQ6Bow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C7OAy59f;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9647F606A31C
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 06:31:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9647F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C7OAy59f
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3b4166b78b7so731189a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 22:31:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795674670; x=1796279470; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=E+IMOor8CoFQ3z7zL5CBrn2YjfbaXVNycgRbuyjfvZA=;
        b=C7OAy59f1ty7XiouW110bdFWFbkk3pae3O7gZpmMawcFG4Cmt9AGDzwyyrCqbKBDZX
         Hk8HdjELwQy3kJUZREbpyls+3wRxEieE+LIWW96B9wMYU6piHH7r1yFsJgQh+ls6O73n
         tOeZFMj8nPH84IndNs22dWO1k95xM0Wa0HodCC0QXp+nziQJoCJ7ByZQiCf4BpMpZAjs
         9/T5L020ZQPEFlg2jmDgb40W+Q0qXFJGGcr202kRKaBLR6Bfqpq3x31s2E7NqCpuXs4G
         ooxXWjwHn+ZVNcEN7ESo037tXGpMXWXAzZaHvBGXQo7hd3xht8ej4vfHPgAYk7Dm2NKU
         Lk9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795674670; x=1796279470;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E+IMOor8CoFQ3z7zL5CBrn2YjfbaXVNycgRbuyjfvZA=;
        b=BoJnXGcUGqNFf0OQm35aJMD+XItUn4MMKIMRvJa0v6jZuVhKZ82o1VN7Hw2Hn4wF07
         RrTOzuUA80WtYMW5VRIgZHNudC8KkWVK76VEQfmOfGh3Hdq7DojNqtHiHtZd27TrulnS
         cdivj9HaqkbVG5vxbnAT3FcQGcGWAUKUP//qDJekNYO1hezCzXCl6EoFWBy1R+PeqnZ1
         P0wOjEZAQh4M3WkWJvdAHhtG81hH7ns2i5BBf2LANwM8+VyMTqUZSHTczCbP+bU8h/gI
         iE+mUabNSe3Pp9TdmAyxh6xC4Dj/WbW8tA4Xkynu9Ticw4Pt9RwJSsUtpijnbR3NcQZr
         sX8A==
X-Forwarded-Encrypted: i=1; AL+hErFoqLEP0PxfCebsuIUv0T5V92gET8Ajwgh5TF7XPS4JGXVevwDNR51HSV5Gxf5aIkRAy4YeqPCegW5L1cIj@vger.kernel.org
X-Gm-Message-State: APuU4Z/GOUpR+YJt6W0A3lroOpTr6q1Ffx0H0Ay7vncNffA6B9sNHVt7
	QYCA9svt2gr6pVrMM1ZzC4RnJu22cgjYbQYwxc0jBoy0dAninzEynkcZ
X-Gm-Gg: AZFdTZcGbwocOY+npqCwTL9dNIEeHOy3zGV2XhSN81MGy8mRK6q7+679dlW0RI7VhY7
	fTyFTrGwcYyhLKHhingYpo1nS9UomlcZxihX6uPyLvQvVX2DmgQ/ZaMgHWd0aB20bJuTXkMmhr0
	1z2dMkkQw9S9rq9jWOlhzEoXWSFoHCYiVxHml1zAw95zhV2CVtjlUhzbuc4dZ+vwrY37EZzn9ci
	+BA54f1gzsxxn98uz8YXiDNbVko2Llb+S6TOksgKoydv9wjXaP3gpmlxlxEocERveWkFSvitOCa
	GhD3gPPZaCQ6nQ5ujLh/vGr3+VBiVhi8XBGPdvIuyfdE5uLRuYkhRZPFufMBle6RhsECwWDxki3
	Jn/PtzqooBTFfJqy1K2jOz5DcGTLBXGAWbEWYAI3Knrwc3GiBbt264mF1kVT48TGsTgEsH2BVOO
	UK2qWAK655y1+fZ/FjN+Djuz5iojrRgluBJOHOFWhw+vuOnqkSNeHin6onGGdIPSIX7cqd8PN5T
	FZCrBIhLKMYLic/pBBE9UlQzKQsdAgs20aI7Fmy2MEbw39BDMX5ePKKrkFoXyRDVV3NfcpWI5wi
	E9mIz6bjmmNNcI1ZIcfR7GWHyFH0b374
X-Received: by 2002:a17:90b:3810:b0:3ac:a11a:7c88 with SMTP id 98e67ed59e1d1-3b41c8f3a38mr32043144a91.3.1795674669957;
        Wed, 25 Nov 2026 22:31:09 -0800 (PST)
Received: from localhost.localdomain ([240e:36d:b08:5b40::a60])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde7f91c6f5sm7906328a12.27.2026.11.25.22.31.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 22:31:09 -0800 (PST)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: devicetree@vger.kernel.org
Cc: Jianfeng Liu <liujianfeng1994@gmail.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v1 0/2] arm64: dts: qcom: Distinguish Xiaomi elish display panel variants
Date: Thu, 26 Nov 2026 14:30:32 +0800
Message-ID: <20261126063056.2276703-1-liujianfeng1994@gmail.com>
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


The Xiaomi Mi Pad 5 Pro (elish) ships with either a BOE or a CSOT display
panel. The two variants already have separate device trees, but their
root compatible lists are identical. Loaders such as Stubble cannot use
those lists to select the device tree for the detected panel.

Document a board compatible for each panel variant, then prepend it to
the corresponding device tree's root compatible list. Keep xiaomi,elish
and qcom,sm8250 as fallbacks, and continue to accept the existing generic
compatible list in the binding.

This series is based on next-20261125. The binding update precedes the
DTS changes.

Validation:
- Strict checkpatch: no errors or warnings.
- dt_binding_check with DT_SCHEMA_FILES=arm/qcom.yaml.
- Both Elish DTBs built and validated against arm/qcom.yaml.
- Existing generic-compatible Elish DTBs accepted by the updated schema.

On-device Stubble boot has been tested using U-Boot firmware.

AI assistance: OpenAI Codex helped adapt the existing downstream patch,
prepare the binding, commit messages and cover letter, and run the local
checks described above.


Jianfeng Liu (2):
  dt-bindings: arm: qcom: Document Xiaomi elish panel variants
  arm64: dts: qcom: sm8250-elish: Distinguish display panel variants

 Documentation/devicetree/bindings/arm/qcom.yaml       | 7 +++++++
 arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-boe.dts  | 2 +-
 arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-csot.dts | 2 +-
 3 files changed, 9 insertions(+), 2 deletions(-)

---
base-commit: 9437046953b2fb3bf55b36582450ea0267df82a7
branch: xiaomi-elish-panel-upstream

-- 
2.47.3

