Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794919191;
	b=BrKwgE+lp9F0hpp8YNRRuhmr4qpx28yzL7JGbWX8K9GzVuwbBGULesJVYGQgvPza6j96
	 knCLbVzS4Sl7laOC+y7ZP8OclYXvSGEYGhSMVf1wApFc9TTlLoV42g0nV4zQAdms1vPf2
	 8bE6dAAE7U44Si7wKvrX+F85UTD0Gfx5F/wzhl+ua+xumNSLSSBaxKELURTMD5NrrwU43
	 1CxwGuXcBt/LG3+VdivpxCD9zvEB7LKutVjhkdOp1RZq0vz6/93EXOXMYQ6pqzSJfE9D7
	 mytiZuhnPFUI3HGBx3qvE8WEk6UBGjEW+u7P+3DP/pM4KGCFziUxIXdEcHTUief8SuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794919191;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=Yf/7M/nDCTW8ZFPsGSaUmFFI3kKEtiDdHsd3kIU7HVk=;
	b=1oj5A8Gl1/AGkGLL/5fKB/KAOChSFX0qyts2s8vRItaJK/tp19C8IfMbLypss8mCVvcb
	 vXezN8lRtMmCrpR8f0o+zQCtsltZdNwnLm25c8XeWkvxVJlZ6taqgwi+ZbdnsQNgTMn47
	 qAwToDb9iwZLiFF2nYmBpSFgwSEi56pUlXWuwmYF2WC3eutsxXhW3UGOoWxDWF8lessp6
	 /Vhgi8zVLFrSLqGIPBZ+0HD8ACOf9lOqH81MPsJp9Qdeo/Nyh0WGsQUkiBQMd6JfD0kpN
	 /vAJPlbpFTDBHUdESoPq8p+LjpFoLmYiYojN+6mp90NcoO4z+OVQK2uDINQNoq5pPJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Om4lJDcv;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0324606A331
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 12:39:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0324606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Om4lJDcv
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4bb5b8ef642so30377775e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 04:39:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794919189; x=1795523989; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Yf/7M/nDCTW8ZFPsGSaUmFFI3kKEtiDdHsd3kIU7HVk=;
        b=Om4lJDcvRTZnmDu3St2YFLuaMpP3U1G6F/IlFhPrRtbqeocCF/Dh82A8F0RIkcjYJS
         VssVIIFxYm+xPYX3l3RIOi0uY1st/9+ZuLWeF2mzpdQFkod6DqOs1aaIwvoq64K3fJhb
         B9iK/0Hvggz1k4FcxtggByjel1j0AdP/fe+JCj0N823NP1X4gwJRYMACpM4Dw+pdGQy1
         HwDFDYJobvjTO3alxk7xvANzObwpvs1r4SfbVuqshS2YOo5io4EZWa3Gy6wtWQhzpvpO
         3IBwikamk3jmLSdlOlub58OAvjN29ySqdaW2GtmUaNNT7TvPfUh8XFVftbNkpTVIYnW3
         FIvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794919189; x=1795523989;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yf/7M/nDCTW8ZFPsGSaUmFFI3kKEtiDdHsd3kIU7HVk=;
        b=FRluFwsz+exoinaZc6dCAxhjcIfaROCWwVdqcOC4U84lO/mf87wNYfi5jIX8bh7ytR
         TdG6EwYaaOGKtRD7Wed88qCdMmo6yjzfSOz+tlmZ/ZpnUVta4Y8ungRkv2W/mZZuy5x+
         ytsqpd6t86SB6AP5NpUkZTX18GHp4YpOj6LMcKOVKIvKJhH7VQDEP1nYU9dwMDsCCK4a
         2SrBFDiekt1IE49zdi3b61IUUnhgrGqUMJ+rKZ0HX+TuFnI4s7C6qwoiW3jPpm0kM4uk
         x4PPG//TdyQip7rCtZRxCfofjD2e9fYk0FNExp2P7EJKrvz2r+KXh+Om5ME/1S5RK+7T
         KnXQ==
X-Gm-Message-State: APuU4Z+tVKjA7orLlI/WbZJmstOe2h+cAMA1mQPv+hiYixShkUnxT1o/
	e9dgAEUPdd3O/5VFq1QChoL7Mr6hLGcvxQweNdVdQOrkhZhHyTcOsZAhLsnDXlsg5KijHw==
X-Gm-Gg: AYBFou1thQwPK3MSkU04oMmTPqzCwz3KR96YKVTW+WyvGKqBubKQZjo1sZ8pQpHxHKn
	eeYTA4DIXzc0y1KLbbBhreUNj3IUaW/F6EqyhVP1xDJrV1YKHU69FX5wfPKV82fxtZ523eDRfqe
	9GhWQgY2WhLkY+TVjly8bhxkiO3f7Y240Ym9H9us0AkdKCXAmSZhJ5+O37Zu3pfTztN6SlWc3ko
	byVGMjcBU2hEMXuo10tqJ96CXDR1D534f4Su42yvhKst3Mgq6ZSyaB5czo13p35iTnykEiNZCwi
	BkOYP5unNQpPtflPzQSYA+UO0TOAjh58ZW1uwis+YYQQ1bhj6dKIx4+dKeJy8w9LsqY5zhqICvo
	oQOuAu8DLk9JnL8pkxFadFv6pJ3yxpHngTN/djPId8BVKIBrH97i/0eW0XowyfzJjUdAeEF7Ba6
	yzcu72/E2r4QcbRfBEClTrXEoQriyOFUAs03b8gyDCT6Xcddd4mSfcSeXzjRC6+829huplgDsuJ
	Fy9vfx0ps/GLKsT+B27idYEjMehqL4M93qsgZHqk1/egloGYcg+zvAeuf4CyEFSxVn0eRKYToFJ
	pkjNOGf2OWyV1tv3+0hBdkude1PK6kN4t3EtWvYlR/nyOeLDRs/9Hb5F2lyF+EoVm2ueig==
X-Received: by 2002:a05:600c:1c0e:b0:4bb:6f45:2a79 with SMTP id 5b1f17b1804b1-4bb6f452d4fmr166096475e9.22.1794919188928;
        Tue, 17 Nov 2026 04:39:48 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (94-21-223-203.pool.digikabel.hu. [94.21.223.203])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb783f8154sm71474905e9.4.2026.11.17.04.39.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 04:39:47 -0800 (PST)
From: rofikkerneldev <rofikcoga@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	rofikkerneldev <rofikcoga@gmail.com>
Subject: [PATCH v1 00/11] arm64: qcom: Add initial support for LG V60 ThinQ 5G (timelm)
Date: Tue, 17 Nov 2026 13:39:35 +0100
Message-Id: <20261117123946.668557-1-rofikcoga@gmail.com>
X-Mailer: git-send-email 2.39.5
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

This series adds initial mainline support for the LG V60 ThinQ 5G (timelm),
an SM8250-based flagship smartphone released in 2020.

The series enables:
- DT binding and SoC board description for LG V60 ThinQ 5G (timelm)
- Memory reservations for bootloader and firmware log regions
- DRM panel driver and binding for the 1080x2460 SW43103 AMOLED display
- Touchscreen driver and binding for the Silicon Works SW42902 controller
- USB Type-C TCPM sink mode on PM8150B
- Bluetooth HCI on GENI UART6 with QCA6390 power sequencing
- Storage (UFS), SD card, volume keys, and thermal management
- Entries in MAINTAINERS for timelm platform, panel, and touchscreen

All patches pass checkpatch.pl --strict with 0 errors and 0 warnings,
and the device tree builds cleanly against Linux 7.4-rc3.

The series is also available on GitHub:
https://github.com/rofikkerneldev/linux_timelm/tree/timelm-v74-stage1

Signed-off-by: rofikkerneldev <rofikcoga@gmail.com>

rofikkerneldev (11):
  dt-bindings: arm: qcom: add LG V60 ThinQ 5G (timelm)
  arm64: dts: qcom: add LG V60 ThinQ 5G (timelm) support
  arm64: dts: qcom: sm8250-lge-timelm: add reserved memory regions
  dt-bindings: display: panel: add LG SW43103
  drm/panel: add LG SW43103 panel driver
  dt-bindings: input: touchscreen: add Silicon Works SW42902
  Input: touchscreen: add Silicon Works SW42902 support
  arm64: dts: qcom: sm8250-lge-timelm: enable SW43103 panel
  arm64: dts: qcom: sm8250-lge-timelm: add SW42902 touchscreen
  arm64: dts: qcom: sm8250-lge-timelm: enable USB Type-C
  arm64: dts: qcom: sm8250-lge-timelm: add QCA6390 Bluetooth

 .../devicetree/bindings/arm/qcom.yaml         |   1 +
 .../bindings/display/panel/lg,sw43103.yaml    |  70 ++
 .../input/touchscreen/lg,sw42902.yaml         |  74 ++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 MAINTAINERS                                   |  19 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../arm64/boot/dts/qcom/sm8250-lge-timelm.dts | 744 ++++++++++++++++++
 drivers/gpu/drm/panel/Kconfig                 |  13 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 drivers/gpu/drm/panel/panel-lg-sw43103.c      | 594 ++++++++++++++
 drivers/input/touchscreen/Kconfig             |  11 +
 drivers/input/touchscreen/Makefile            |   1 +
 drivers/input/touchscreen/sw42902.c           | 315 ++++++++
 13 files changed, 1846 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/lg,sw43103.yaml
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/lg,sw42902.yaml
 create mode 100644 arch/arm64/boot/dts/qcom/sm8250-lge-timelm.dts
 create mode 100644 drivers/gpu/drm/panel/panel-lg-sw43103.c
 create mode 100644 drivers/input/touchscreen/sw42902.c

-- 
2.39.5

