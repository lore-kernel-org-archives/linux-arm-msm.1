Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5209443AAB
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 12:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787315838; cv=none; b=lAsCMxxEsvgm/lbHAYR6JCsdBKqmdOeIydEx9OFBb4dD1fqBcNH2KlaogRRMr9CU8SOMe2rn7vF93Jqeq/iBfI/DKqolDYno4qQhpMZCasvrjcpQllXPBvnH4SdDvXw8gBdKLue7ROVzaXuRJtAFpanpdlV7a+0tMC3h1U5Fx5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787315838; c=relaxed/simple;
	bh=PrDZgKJSfpx6nKGCbhXpOA4dPKRcANDQUxU89FDpCMk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gclBArzYnqoen/apn91akFtvwcgkvUbXbjVoGZwrkUqCK1MXgCbL+3xq2lU34qCur0hrq/OQfEoJKP4zM983yjBBJwxfvKCYhioMf+o5rNyzLnGQ3emXtTJXAyCy2PO/n/pUEQrFRanbqCLHN+XDZ5kuDMC0Fz85gdNOocpipr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=db8EK8wQ; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="db8EK8wQ"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c15d111ca99so111318266b.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 05:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787315835; x=1787920635; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jLIbMgirXqtcsU6FvNo6N5DXtJvpeFxGtxPN2x+Chyo=;
        b=db8EK8wQn2CVnbUXZAUXm7mwyCUneQggozOBpIo2iF9G0Dyoln7y440LFKkgod2/Hz
         1L53km5V0uYRcMbNhqrAacBhmEVp3Iqt+ERumCrNduV1rXv9AKyuTVimebF0cqZBsSvf
         8XpZfEin5Og9JDLf9B6Ni61ti5NYWnHI2g/brmvStIRdvfZY+peKoc/JDSqLyhBSBJWT
         FvVIFfGWzvWdwhdcWXLRI/F/A3siVavaZ5u6cnRRQJn2Uw2CMBb0NinytPLr2gVIBVGe
         05QXpPneN51oDxz3wOq4FuptuUtBvMyWuR+Ty8cKeHOpfDe3/d6XgK2DDYwRnmM0w7C0
         J7gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787315835; x=1787920635;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jLIbMgirXqtcsU6FvNo6N5DXtJvpeFxGtxPN2x+Chyo=;
        b=mtMAqXusKcfUG2XH5pQqHAjU28BgzAVuQZwqFLIvy7jsbwQ3eRfQxbshCfgaUS7zCe
         uDR1YzSAnLicgT2l3MXjcM3HGf9x3/yRKVbrU56visXlzsKbo6buObA1iBd9gRhBXQSg
         cV8G+GLac2FCB/Am0iLFasReiQTN4JbCI0rWrSvazA0uTb20sxDRbKKAdUls1tcJPAvM
         QeY6UXNDMZJfpabrPs72Vp5yE/jbMCPyyrSB5eqOUaviW/uP/Hbbn1dajVTok+AfBI/P
         8V32zBtsWDOBlogoUBC9GHJZ++tVpnrSQm/4JqwI3nQCEyuCCdhHxS0btRvFBw9ESAuh
         DSIA==
X-Gm-Message-State: AFuF++kytI2ocxixU2zM5XC+MW9a2BECbuOhHW/4GElhpNt8ZwKgAxnb
	J0i9Shp8IfYKnxNRR+U1pkKI+Cwqb9SH4FmfcwE9JbtNrwZ2amjS8i8O
X-Gm-Gg: AR+sD10bBfRqFPz9Tr1GMh3zKXxlLXrx2mBqRcq395A0qUEov6dhTHvWDORf5ZxKenZ
	smPCbojuFXaHRNxhfbE6hsdq8Fm/c6sJOYq4vxumRgq/n9NVJRTCrncirVsn2wMl+nTryLg/GDb
	wIjxo0w7YOCJs1+vm8tHcNZNdTPz1mGKOVO71hMVaDlcfyqc2EIaeGIJ6L5yuY2WPhyACjIb/ec
	zPLcwTZ33M/BOU3C17oAWa8tDpp3yZd8z34OMZALhnkEj02o3cbMrSUsVyGtGQuLngUUiQNwn6D
	g+xQC4FAsc1FK8ndQjiK72IEAYRwOFOgq1p+ofU5Nb4HWWrVgEX0gabMYPWY8nxqtjN3gWAvSXC
	71PhEKkBlF4JBFW6E6G9sDVnDrYumKGXwjQ8L/pUcrV63oWvhPhrG6vY8ns23sFuy6fLDBlAknC
	xPQF3Hp3fyZojThDxC5hbI7Zlr6YEGiT4UDb+vxaUJn33CjGfjPDcq9S9E9vndstHiCWLrkdQw8
	b4NwoAMo9E05GVSw5FwxmVK+F1JbKE1YQ==
X-Received: by 2002:a17:907:3e02:b0:c1f:8145:820c with SMTP id a640c23a62f3a-c246a4aca6amr616460266b.2.1787315834806;
        Fri, 21 Aug 2026 05:37:14 -0700 (PDT)
Received: from workstation (161-53-210-87.ftth.glasoperator.nl. [87.210.53.161])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24591e0397sm451194666b.53.2026.08.21.05.37.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 05:37:13 -0700 (PDT)
From: Stanislav Zaikin <zstaseg@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sebastian Reichel <sre@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Stanislav Zaikin <zstaseg@gmail.com>
Subject: [RFC PATCH v3 0/3] Add Xiaomi 12 Lite 5G (taoyao) battery support
Date: Fri, 21 Aug 2026 14:37:08 +0200
Message-ID: <20260821123711.1579539-1-zstaseg@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Xiaomi 12 Lite 5G (taoyao) has an additional property with ID 12 that
breaks the parsing in qcom_battmgr. Fix that by introducing separate
maps for lookups properties in both directions.

The other approach that I tried is manual shifting properties:

+	if (battmgr->variant == QCOM_BATTMGR_TAOYAO && prop > BATT_CHG_CTRL_LIM_MAX)
+		prop++;
...
+		if (battmgr->variant == QCOM_BATTMGR_TAOYAO && property > BATT_CHG_CTRL_LIM_MAX + 1)
+			property--;

But I found that more obscure.

Will be happy to switch if the maintainers prefer this one.

Changes in v3:
- Fix QCOM_BATTMGR_TAOYAO enum ordering (patch #2)
- Order in qcom_battmgr_of_variants[] is already right (no change)
- Revert the qcom,sm7325-pmic-glink SoC fallback (patch #1 and #3)
- Rephrased commit message (patch #3)
- Design question from v1/v2 still open: lookup tables vs. inline shift

Changes in v2:
- Keep the qcom,sm7325-pmic-glink SoC fallback in the compatible chain
  of the taoyao pmic-glink node (review feedback, patch #1 and #3)

Stanislav Zaikin (3):
  dt-bindings: soc: qcom: add xiaomi,taoyao-pmic-glink compatible
  power: supply: qcom_battmgr: add Xiaomi taoyao support
  arm64: dts: qcom: sm7325-xiaomi-taoyao: switch to device-specific
    pmic-glink compatible

 .../bindings/soc/qcom/qcom,pmic-glink.yaml    |  1 +
 .../boot/dts/qcom/sm7325-xiaomi-taoyao.dts    |  2 +-
 drivers/power/supply/qcom_battmgr.c           | 86 ++++++++++++++++++-
 3 files changed, 84 insertions(+), 5 deletions(-)

-- 
2.53.0

