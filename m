Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794184126;
	b=NCSud4+/uBURgjM47HEW+p+g2p3htYi/SEzCAY7CaQKSCgRyEJjuBi6drv9e/Z3muzDC
	 6Qvg4V+dT+cTO3LBFxEmT36kpyJsT7TgpH8rTYX2i1O24DeOdG5JezKliY5iZakTcRR2l
	 ZVZNikvXMmCnsRsYnmMZu0eBo6jkju22NnwbaTUtT/p39C1Wq/M9gWFuAvnhMMkn5c419
	 +YMpPgrLxhI61Gi4hQp64VQi4GrLpy5nu6apjrfsYzRMSpSpVhVa3Lux735rJ1tm1yn+W
	 /dT0+G86ye6U107Vf6fGJUBs9kcSWKeJU28r+pX6Axcl2mz9Jt0vOO5Wq86kSK2P8zw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794184126;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=QW2ef/pirA2PTk8MffTe4SexcZzxaH9iewQRAz0ZFis=;
	b=FJWeM9GBYJxi7lQ+vpnnEIepquUilJL8liTmqe7y3N/wnKpqPRpewcX85xDUe4PlBtCV
	 yHMtESc97P1hePAPo/3ryTeH9j8mZy5kIry8T23I6V+gA+TC4CPhb5OwZzjiiMpUil6YH
	 UNpH3afEynuXR4iNP1GlmHMqAyocQG8bP24KqnyWhC2+iSFNm/LbdQMfVDkq+/VSS0p15
	 WL6zwQ33uG1xFdPJRRnNQelSFWkFzERjlPsRQIqxpxwmGS3jjzS2zT8nO+Xsf1nU253KN
	 2OD1xC9xPu7TCHbDVX9+UPOwOed+kk19zq4Yo3zeLqoT5MBgBnobopcMjnJrc/M4Ysw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Hl9YKQ3L;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F73E606A332
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 00:28:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F73E606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Hl9YKQ3L
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-490c3ae81d3so186505f8f.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Nov 2026 16:28:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794184124; x=1794788924; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=QW2ef/pirA2PTk8MffTe4SexcZzxaH9iewQRAz0ZFis=;
        b=Hl9YKQ3LPiAC1ak3hn+x4wYzGK7CwQBDypqxM0waL3/tJ/CPZdBZMZ/dNnSpy4WV8O
         HwxFkxDdSfjNtTEn94py7bp0bjENVagTy/CNktLzJUV3VO4/OPdT9IVuX7cxL2ZkiT0r
         xZE+FUalw7uaXwXwQSPXf5MdzMB8wU8lSEa7hP5SCUF/B7+mZ/DE1XXs4eSXQG+wbXaM
         p8Oxx3gp3UCpY9o5A1muMPhR08MBwbPnAc2XsmjrrafUr8GtYNvWz0uAecM41tBVlYDb
         EY5m6RWqkH1NarycP0gRkVZ+z0cSbYw2XWg+H5oIiJH4q3JOnmM7aa5sHDikgms+Arm7
         OJAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794184124; x=1794788924;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QW2ef/pirA2PTk8MffTe4SexcZzxaH9iewQRAz0ZFis=;
        b=JDUgG1387wiarA+WeA64tLx6A9rhT+p4zpITUh4y3KKTi49fFAXXTGzcb0TfGqRcvy
         RWKMA1BjAnwjhH8c2ux2hhUuJflIo/0HQEvffPCXn1iidxYMzEB2Lcc3k8A3eVs3aC38
         9ctBrZZ6K/oyJZLmR663oV2DxHlcSKTFeIA0g8VDb3DR81SQBfSCpk4LG6rbRLd4Dj+d
         kUTX7TXkmOgAMRF3TCYsGrA1tavIB3gd+C8KiH0sdZ98v354rIygmGRTbjv6GFABEbbI
         0DwAaBoE6r4BD/Y02roK5OJLfNFaH0PfwaPA7k0NOL3yVr3xnOb5H1vkH3Qx6chGvT5p
         P3yA==
X-Forwarded-Encrypted: i=1; AL+hErGByft5gnzDjcc7DRJdtXpSqZmzmdqq8aS5RffqwDHRqQH29N/NZqEKEzeIslWKBC7wM/LqMF8DTxgcDkMZ@vger.kernel.org
X-Gm-Message-State: APuU4Z+twhGa2cyDzXKmRcT2ni+JrvHPw5Q8GneuKgTfDMS86Kud3/MG
	hffG16bHjXyfrNp7tBna2jlLmjhUgyYU1ajEYeLUb1cBk0x2Q2Wa9cjm
X-Gm-Gg: AYBFou2QGejK4JsFlBLeTvSIJrNfLIscIzBxoCDv+yB/CjxFMMYU/Q3AZvOgpR5esvb
	o2w9vaeCcnnmd8wzkRQJsFzC7QpDvH1V65GheJiEdMPLntgZ4+uSjCF+EDrALQuPvQBU8BaM+db
	SbO0uhHh8V5fBA2Ja+uR8vyfgX5ZFMtlGXt09U72OruBuF4TwSAYdnJ0LttHsLUSqbykh9I2ApX
	SiXBEgBq/SrH3yL/iWRx/gf/lzLQMS86L3yy1oyP6ijFjA4Fb+ElgjDwxiPIh0ppabunhlpFmY7
	3fT3IRJ3dAqwr+rejufRn44KY0sizEiI6DqIdNFWubWoqEUkiFuqDDVtj+Zzg/14YfdKI6pUgD3
	4EowdlmB6o3MIWbuYcHQ/+anhFMVPi/AYrbLewmLteVMuUWFpLMkPhlyu+CwtqYn+KcNCN2hJsD
	sT8EywtDrZj1mC7/FKrMuARDK8Lmhima0MRnuTaaU1K+iCDkT/zMt4dWlTFd+v+mY1pDrZDtSfg
	uq/0joxQnOSvH6mWE8xOUHXskOY/upp+LaYf5q8kBa0yNpmAL44gBHCTvTImycCx5jxuXKM10iT
	mTa3TyVlyazHmelEQPoUoDdnbAtGbNYA4BvtUCKsDYfPkBp/y3e+CK++YnWbUA==
X-Received: by 2002:a5d:5f51:0:b0:48f:bcdf:6f68 with SMTP id ffacd0b85a97d-49589867ad3mr4694876f8f.37.1794184124022;
        Sun, 08 Nov 2026 16:28:44 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49673b94dc1sm2688388f8f.16.2026.11.08.16.28.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 16:28:42 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Subject: [PATCH 0/2] Add pinctrl driver for Qualcomm Halliday (SXR2250P)
Date: Mon, 09 Nov 2026 00:28:36 +0000
Message-Id: <20261109-halliday-tlmm-v1-0-a181d54214cd@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIALQT8WoC/yXMyw5AMBCF4VeRWWvS1jVeRSyKwUhd0pYQ8e6K5
 ZeT819g0RBaKIILDO5kaZk9RBhAM6i5R0atN0guUyF4zgalNbXqZE5PE+tkwqMs9gty8J/VYEf
 H1yur33arR2zcG4H7fgCD5MbGcQAAAA==
X-Change-ID: 20261108-halliday-tlmm-f250374110e0
To: Bartosz Golaszewski <brgl@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Stanislav Aleksandrov <lightofmysoul@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794184120; l=1085;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=Sh78VNHMNROB3r4emRNABR7lWHBZToMwYlli1bwKY4I=;
 b=/DV44UnGt8sgl2eNOLqbZMptCZUi5sxdpNvdt6ndlPLFxWToXTFFFhDVgnkngnv9IdEOvTtlV
 ERnbOCYssFTBDf/BTxvGxy9MTa5fGhdJG9Uq3vUsddO1tW0ylQq+5WU
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

This series adds the devicetree bindings and pinctrl/GPIO driver for the
Top-Level Mode Multiplexer (TLMM) on the Qualcomm Halliday (SXR2250P /
Snapdragon XR2+ Gen 2) SoC.

This is part of the initial bring-up effort for Qualcomm Halliday
and Samsung Galaxy XR.

This work was made together with Claude, ChatGPT and Gemini.
Reviewed and tested on my Galaxy XR.

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
Stanislav Aleksandrov (2):
      dt-bindings: pinctrl: document the Halliday Top Level Mode Multiplexer
      pinctrl: qcom: Add Halliday pinctrl driver

 .../bindings/pinctrl/qcom,halliday-tlmm.yaml       |  146 ++
 drivers/pinctrl/qcom/Kconfig.msm                   |   10 +
 drivers/pinctrl/qcom/Makefile                      |    1 +
 drivers/pinctrl/qcom/pinctrl-halliday.c            | 1825 ++++++++++++++++++++
 4 files changed, 1982 insertions(+)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261108-halliday-tlmm-f250374110e0

Best regards,
--  
Stanislav Aleksandrov <lightofmysoul@gmail.com>

