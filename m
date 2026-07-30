Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D73EE3F9F22
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 09:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785404109; cv=none; b=N8NQ1+oUs0tJAwW+nu30FZMsbA1E/7tmwSYOA53UJBQzjYT5Y7C/yLz1MPemW7/0r5tG0NdwvtZsba1d8/olhcjCPLsnG3rXFsmH6SsyBu60WXKXhqFWwL1ub2GIH3CwMGfhY8UodVyBQROB1aZHGBU9N9lzd2xcrzGHJ+V2Auo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785404109; c=relaxed/simple;
	bh=vuwucA9vipnQ6DR1ZbZrDDrjcEvHXJZFOVBWKVa4tds=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CqGdWh2012E/ArDI/BI9MTE33BeerTrDIt6Ja7fe90fzqCXrsx0rHdDuPpTir5VlpTWKl1M8G9XBWuffauQWwK4R5Pn6DQ5u6A9Hs+o/JepibO+W28iSvhrrzQZOZa/oCRY59hxmTwLSVd7C5sQZ0SMh/KHvw+Cag5r7FTrN5aA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OJq67jNz; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OJq67jNz"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c1f7666a90bso267107566b.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 02:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785404106; x=1786008906; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LorXrpjvB9CH6Civ3yNIe2+RrIhqKWqCrvDhWx+glCc=;
        b=OJq67jNzp82vgB4CVKRXaMGpzqr5LOcQ+F85YYJf6h0iTH3RtFbW0NmM8Jz2ftc289
         ZiROiXTkzR86Q2rheVQN0LmIy//4otmwhibj0EOc7g/roeKzueK5k8bM1Z+J2Y8PHa3n
         ixDT9DalEC1aNW6m2kfBHDdWULd60wuHOYznKi+9QObqpdJw0S5HctwCkpJuq/kdtIY4
         txaDXvZFTDQSfLfvrHebm12I8Jn8xyhDsGATMkAn+DsToFha4oiPX8dbZbE7GXulMFm3
         h9Rm06lgHUF4sT+VhXQ19LImYNKr+DrmnohkeUjSBswdhh5q9CzpNr1OubeVO2s+Nq9c
         3dew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785404106; x=1786008906;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LorXrpjvB9CH6Civ3yNIe2+RrIhqKWqCrvDhWx+glCc=;
        b=QCr9b/q/lw63WBZHtNt9HalwEEwxrABitc3OvBO3zsjQq/k21QZTE+QfiWO/i1R2BZ
         Ot4mAEzpIspayjvRTu7TlChYdFeNt9qmV5g3au9Ps5I4rP3dDc49euWYdiedJLJtyRto
         TQZ+8oZjI3aT503QEDS/+RdCIsLtUdMX/xuHZI9yrfePKoTOjkIStL7CUqXiszaMGMPj
         YMTX6KKsDiKPwQf75gODvB06YtNhnK4PrTyTzz5ryKA7S74s5Jl5jhEJ44E7swC5bxot
         j86lMlXrW1H7+JJtqCpf+nCl8kO8YewT0zSseHMK7sPAr3iaEDp1t1wRmi2EZrMolfWq
         fmog==
X-Gm-Message-State: AOJu0Yyct2GaKe8S0BEPGiiLH4Olqm/2/pC8YnQ1cN1WuNzAEQsDWmkl
	4XjEua4rrtGFzgBLPS+swP8RqB/5NybSPoGPOm0XamRzswBEdu3nKFHC
X-Gm-Gg: AR+sD134cfTVDw+OPaSyLAwfs/ADAhQ6JU5PT+k/f6+PUZ3ZLSNKHikMQc6c1CzAUL0
	ZyE97Xw3bYoct0rZFiIBB8u4+qrCeQ1bmEiGeK5Jz2VheGbgubTPw+yUX4HIf8Qt6DXwum3xJaV
	mlK29y+dQ5C8lljqetYt14sIvoo5+ldxEVEXT1hVhICfHtrhYXo9HbFFdPa4MGbm1Jmv3mPzGtJ
	GQPz8enscozo6i1PV1MsKPcwEau4pdyV/HbN7wOfnoTD6jBOI/Ly5jw56VfysxBqQl5fjZOd/S3
	bqmFQBouzYoyURPcVmAxfqoJr3R/BNwa+e6eL74eJ6UeeT5OR1CV0XdNu9LzqiiKl4fSICmyvV7
	fH3EsATrxqFralmKc5vHr2N2dPsoFslgYV24kIrcGt8EMJtpqWSWeNc/ijQtBCxaYF5qdUz887i
	0cVoCwNDcHOTk29Nxacfr1CX39heA7wrUoooEszHAZvGKyQJuLFwQZFgj0TDq//hD8a62L2VTTY
	eIF8zbTSah5/LW8q3TEQQ==
X-Received: by 2002:a17:907:c08c:b0:c12:7934:52fd with SMTP id a640c23a62f3a-c1fa55ce082mr100963066b.32.1785404105894;
        Thu, 30 Jul 2026 02:35:05 -0700 (PDT)
Received: from workstation (161-53-210-87.ftth.glasoperator.nl. [87.210.53.161])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fa8577e78sm46733066b.20.2026.07.30.02.35.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 02:35:05 -0700 (PDT)
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
Subject: [RFC PATCH 0/3] Add Xiaomi 12 Lite 5G (taoyao) battery support
Date: Thu, 30 Jul 2026 11:34:59 +0200
Message-ID: <20260730093502.689505-1-zstaseg@gmail.com>
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

