Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE4A14248A9
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 08:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789633544; cv=none; b=mu1yd0e0oDQzn3mnxC1vckX27kynbr2RRznt/NDO9p2jWCBJAflp+XnkoYx3jbEkAb7rEAxuxWyapJO3Q5fgAj0GSobXZ2QCuLzKF//7Lv3uHSGAkWws93EmrBRxoCIP2I9Bx5+fcLLcrCfj8ft+sq/EmQe1djrXEz+L8JtyqXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789633544; c=relaxed/simple;
	bh=FfHLIqVbUiDFb7PV/tcKm2OY5dbtW8PPcCi5ELgVdOA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=dtSRpUPcMs8AgKxV/5hD6/4B0OkZ9+C1+jgauyzkbIBJ7Ik6NQQfeKTDKhmjZOuAANK1abC0RzNyPXPJsOtKOS4q1zk8DRga1HW36IRMaTHjfFq9GWTRDdf2DJq7HAbJi+Nfl3BE7mdNIioUOGPgTDyJBLJzFa8fNMqrC24h7pU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=xVTLs+XZ; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="xVTLs+XZ"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c2953a01240so102113566b.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 01:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1789633526; x=1790238326; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pPKRfs0d0OIg8AedUsUxNykcUXne60lf5vpq99a5hjU=;
        b=xVTLs+XZdtDXLeSU/pAzejkZd68K1nUcGAKg+uBvlrRIUe0zu/EIzyNbGaFz9A+x/K
         lgiCRY9YoQbTgPwNYPgr2wYf9jk7E2ikCRtEZTIZsp74d80LI8NyeV+G91O89w6YlWhA
         abYlsgdKxUiFMwZMm4EddBz2rFutAf/89AnMUVEINT8hYvQ60oSQKUVBrW0+VT9yXJkY
         vM5KVQRU+mvANDCpSzk3wtwjYug2mWe0IzAZuLHWWEgoKobco/W0Zarf76aMxXUUAqlA
         pmzaZTqC5SvKseIwJht/2aVR4QvLBM0Pp8lCgrc6gdd6DCUf/mLrzCsJCU+kPGO0njoQ
         QgCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789633526; x=1790238326;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pPKRfs0d0OIg8AedUsUxNykcUXne60lf5vpq99a5hjU=;
        b=S4PTMDzgJgyy2FhcyZuNwR7Smly14Wl8/GTTXr3IHTdOyFraUvWj2eKZjKrQ2aTnKb
         shb1du4kJPccBODxrVtqAEkr1nhMgcqkfErwwP402yp8+nyBRZwKE+cbgGNMVD172Pv6
         WuOgTidkr2KeY/o5/7nop21LAxcjvAzFEFGg3VEhPYuyY3sEj//9pTmyG/uUcUNAgeJR
         bHBXLoT5/oaM7704ZnOHESKh1goIUuA9YoK6sCHjnA3BGwCzfHci50Rrp10cmx7CRPPi
         IjrR0rnnbfli/z654JQn71NAeEjLrm73DOVNHhlq7C6Xv1NU6b60FhqGrfoIVs/RbjYz
         YPYg==
X-Forwarded-Encrypted: i=1; AKwUvBw8C5CxMdNEuAUOZXSr/NJSVBtEkBqerMXO/fYFbVxtQ+3ksKkEISzBabMi861KkAR4MQ6Vm8ADRTQ/H/CT@vger.kernel.org
X-Gm-Message-State: AFuF++mRn2xcbZeHHo1jxut5qqBI//NJGn0Hv7ZTdcmn8tRJfEFtqu0k
	qSDlqrBlvOMw2Lftfhf13UctKCEZbIEFfWFoZH8iJLBJ7solyCMZlTNFWEnrb/viwk8=
X-Gm-Gg: AYBFou1lUfJ4MoQB2YIcxLQ0AcCZjJoGAa5p52wQaSbI9dDI498//4AHcYnwH4r/j+y
	nEbMOsHyydDmMRhcHGAyrOzXY2j/EZHSnwk7xCTGQqvMYM2/IcGND55uaLzyCTYZ+w1bfCm4Q0J
	ySL56//36EBIGrNF++7PKR8E1pCN77YxsJWzpSkVVa3CvAhsDAOWnRgHalb2aiqtwwvLHqM3847
	qytCxlsUrN83ghjpk1lHDLg7FEuPQwCaQk8zk5XD0Vbx/kLzZ1+9heO0y2cSndmEyfHi7AneB8i
	xvLoTm9HxTEjEiZmM3tqzs5AA4L+LPCOYJI/84YJWJXBRQQLLuTUl8nPDe/2fyMyYD8Et+EZxFY
	g/3jAWrWR8e57X76dck3Qbux7M79ln/PyuM+nQYH+vuyAYW8rkpPa2SATzMaECkxC5MeEnIKkpx
	QZhq6BxFHEGJVkqNQrrzofznT97emqf9cmdv0jhf3Bx3rQD6C12Qf08Mo4Qpi/ZCX0VvfFVbhmg
	zdHKHj4Xl6TGCpD/Rc2l6NbYZd+U1EkhAiTpZQYgDZfuqO4iWtw
X-Received: by 2002:a17:906:6296:b0:c21:450d:cd88 with SMTP id a640c23a62f3a-c29e51e1395mr396582466b.6.1789633525767;
        Thu, 17 Sep 2026 01:25:25 -0700 (PDT)
Received: from [172.16.220.101] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29de0851ebsm242943966b.4.2026.09.17.01.25.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 01:25:25 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH v2 0/3] ESWIN EPH8621 touchscreen support for Fairphone
 (Gen. 6)
Date: Thu, 17 Sep 2026 10:25:22 +0200
Message-Id: <20260917-eswin-eph8621-v2-0-f534080a6338@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WOyw6CMBREf4XctSVteSkr/8OwgHJrrwkUW0AN4
 d8t4NblSWbOzAIeHaGHMlrA4UyebB9AniJQpu7vyKgNDJLLnF+EYOhf1DMczDmXgmVt0hZ5jrL
 hCkJncKjpvftu1cF+ah6oxk3ySzh8TmFoPGLQ1B6Zsl1HYxnNRZwwpxLY2ob8aN1nPzeLPfznx
 ywYZ22TpoXWF0zT7KprcoOxPcZBDdW6rl89vPBt7AAAAA==
X-Change-ID: 20260911-eswin-eph8621-5d3d766e2b0c
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Henrik Rydberg <rydberg@bitmath.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789633524; l=1248;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=FfHLIqVbUiDFb7PV/tcKm2OY5dbtW8PPcCi5ELgVdOA=;
 b=w3Ev19vHK3OUPv1BqDmTac+9v85Z/m5S2Kr3BnLpY8/UYjszHo9WM3dST0c6SoNjgHp5jFixq
 NJk/4fvM+sLDmuX5CnQngsYOjugx/QNGsg6P6LW3yqyZR8IVzp0hZmO
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add dt-bindings, driver and dts additions to support the touchscreen on
Fairphone (Gen. 6).

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Changes in v2:
- dt-bindings: Move additionalProperties down just before the examples
- driver: Fix some memcpy undefined behavior, and various potential
  issues with malformed or malicious touchscreen response data
- Pick up tags
- Link to v1: https://patch.msgid.link/20260911-eswin-eph8621-v1-0-db447ff9e445@fairphone.com

---
Luca Weiss (3):
      dt-bindings: input: touchscreen: document ESWIN EPH8621
      Input: Add driver for ESWIN EPH8621 touchscreen IC
      arm64: dts: qcom: milos-fairphone-fp6: Add touchscreen

 .../bindings/input/touchscreen/eswin,eph8621.yaml  |  79 +++++
 arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts   |  29 +-
 drivers/input/touchscreen/Kconfig                  |  12 +
 drivers/input/touchscreen/Makefile                 |   1 +
 drivers/input/touchscreen/eswin_eph8621.c          | 333 +++++++++++++++++++++
 5 files changed, 453 insertions(+), 1 deletion(-)
---
base-commit: c2cd463d6ee7d55a3ec0719d93c49ff99022d58f
change-id: 20260911-eswin-eph8621-5d3d766e2b0c

Best regards,
--  
Luca Weiss <luca.weiss@fairphone.com>

