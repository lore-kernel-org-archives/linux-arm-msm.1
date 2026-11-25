Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795641207;
	b=RHffbm4o47WCTgYnz2kVHMTRgxclT/jdXWlAzBIVrbjGBsM8qeJ45lGoEksdelYKvtUf
	 sJ6lNdra6klWS2j8QmdhkY5bsxYvS0rYh2JdywdwvdgM54B+uC/ucGjwIDeUtC0VKMPTD
	 vQXI3k6UznHQLuRyJe6BSISn6GU6qHbaQ7OlfhrWb3OB6sBQ8ezjSzuCM5oIxnKScgDiK
	 wENRW0jWQYX/ZV73/4yEZB5HvYGuLK4L7b6NAtB3pi2CoDbMVETsoB6P1TkSZH0QsB1jR
	 +NU9GXSF9tHYme3/mMlfy/EDMx5l6+5YC+Dc9dkhUC6waYLwvY3EelmDyjYAsM65rYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795641207;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=2ZPnXp869759nD9qUU8K6OF/gReKUZ4P8rSxhVRhgSs=;
	b=EsJu58iyZJyYx0tTTtFZnUXFz5rLkhzzhvD1eXr8fdEjlkKZhOGlboJ2qC9k238Url9K
	 T60GtozCYiptZuG6OGbLHbgj+LDPX/g7D1AQrk3jIKUkwSt31LGT+qWm0n6R9p6pQsoow
	 4tIal0YN2OSHL8JsUiV5WW7PeekUNj8pzV1ovc9Wd2JQ32TDL/6/cSx9vWw1649De0cTB
	 7/Ex4aKWGHhiNNx987T0yYatbrt0a5YwDvuk5wBMWFfebvFgKYRCgUZ2YfjMbgVnno/wh
	 RvoD8XVJuwnO+O13Tp2FV4kxaL5yEWedYEBm5GUGrkEj5gmzMUcKWKYn3wCOYd66log==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=L2zdPTfq;
	arc=none smtp.remote-ip=209.85.167.44
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA415606A321
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 21:13:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA415606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=L2zdPTfq
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5c0ea47f5b8so636559e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 13:13:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795641205; x=1796246005; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2ZPnXp869759nD9qUU8K6OF/gReKUZ4P8rSxhVRhgSs=;
        b=L2zdPTfqoSObnTFRGwwxfihUs5uAymtKnHujaNxLs+/umlxVQkzFrkU4McW4wx7hsc
         P3GKPhoIKT85YGwVs7VxliFCW4+s8X0v++Xf2FOy4xk8nhKMJGWSfX7Ok4K7cGVjuZUb
         1IBrexh+aYlkP1L9QfyHdYglwBVJGhEJSw4r5+dkzFggsPQiblWK6mBGjN4IPHa+w26/
         LMVWaZXJcq223xwrNiU0Zqv02IZgTAOZ58D2dkzksslgr19k9I0fN9ih87HNLL9uKrqj
         9zcyRAQ0cMHHLcZmpasxquyk/CqE3zXYTqifhwFUUwr7cP9uI2QJIFFo6djXeJvxgv2h
         mH6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795641205; x=1796246005;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2ZPnXp869759nD9qUU8K6OF/gReKUZ4P8rSxhVRhgSs=;
        b=e813Ubb30pwj57RIs/7oQHaGaPPpjpFP3qT8hQ/MP9l4pJ6RC8WeZS6TtjVOD3djpP
         pUWy8DtusIJPZrRkug2KW63pyTewMgTWZq1t456fbm8IY/oDnj4LZY5EGWEvzW/gMWTB
         g/GHVgF4w1HVWKQSSIiSzUoWYrlBRiwVSt3eY+T8a4cTbwOLk+ZT206niyKG57OFXZAh
         5nHoxh5itFTDgK7KBaETEwPs9VneFDRoEcrzFAYB/f3jFJBuTu/rNEpOeoYOsiug10Hg
         qk2qyfOD9+Vo2dfFfms/SjIM3YYST95ogqpVZG3ZrjPE/tEJzxw23ldzuuiiq27zFY/W
         JyBA==
X-Forwarded-Encrypted: i=1; AL+hErEvHxiHq9Z04bUo730eN+56dkpV2ldM+xIt7b3pDI/2Zq+dZUaGTL5hflyUOOf0rHt4ItmhAiWlNSmjleEC@vger.kernel.org
X-Gm-Message-State: APuU4Z+XYk4cEgwOsOgHn7/etg0ysidQCq5K5iPeyK+MxJ/Ni8usDJIp
	qagPkkZivIsv+a0OaN+FEVtYPpH0LlQWA6m+dFCr8JY5qH6CNHnLbxFO1KZknUJBdqI=
X-Gm-Gg: AZFdTZdBVbd6l7z//jEVOu9JS73Qs23FXbF8gWVuvMx33iNqHp45udPCTEw82DqvQk5
	LgmRlKmiAvI+d+7fFNL07ZOwS9Dkk7mE3rpIXV50Qv1l5lgdPKHaIgP39XmJSlaIQHVMIN/Gpge
	FuDHXDJZC48F7I1BZVInQY6v9KWqfzZ5NM2039bCSOiakV/+YkQrk+yZrGoqCMcD1RjGefMa9ai
	2blJGyooCf1oWq5war2fKV+ObXmPOjDXxXHGcriRgkOLTfhefUF6vmgf5EWDnreJ7L6YbUujdTq
	cTnbPlZQXEwHNHIJlHrCyGGFGyRx/OkHwmrl8zCVb9Am+nKJWkxg0R65ZNFnqKbocBjnIHZh1B+
	j6TXtf9KPtuHTB7NdjZq5XFoRCzX4EgeHHczWUwl/JNsl87BBG8rpzX7V4e/+RC7+15Ma59SGSB
	SCU8O9o+O2HDS9T9sktpaLvzeja5btKK7UyeuALNyI9eKRztVTReKR8UdWdmeysTKqT3Kjatlh4
	MuKikiyssPjHSiLQmPfPl1eKHrHqYmFlmNuDukMPHk0xftJouLDH/ltTZL0FGqDnYjZOkU/zoay
	O8f2eGTxLjaJ0XBv/ETnkmEQtgtfZJqwWar7aHp5S7Nl6myDxxTEWzGt2wuYfRFz5UZ8vtuLboe
	MnaBzwrZarRXsqzU=
X-Received: by 2002:a05:6512:b88:b0:5c1:5488:f57d with SMTP id 2adb3069b0e04-5c1bc85b735mr7140505e87.4.1795641205025;
        Wed, 25 Nov 2026 13:13:25 -0800 (PST)
Received: from thyme (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bcff993csm4858972e87.23.2026.11.25.13.13.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 13:13:24 -0800 (PST)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 0/2] clk: qcom: Configure Lucid 5LPE PLLs properly
Date: Wed, 25 Nov 2026 23:13:13 +0200
Message-ID: <20261125211315.1437946-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.53.0
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

SC8280XP and SM8350 clock controllers configure their Lucid 5LPE PLLs
by clk_lucid_pll_configure(), i.e. as Trion PLLs, which sets
PLL_UPDATE_BYPASS bit. Use clk_lucid_5lpe_pll_configure() instead,
and describe the PLLs by the Lucid 5LPE PLL type.

Note, the series depends on CLK_ALPHA_PLL_TYPE_LUCID_5LPE from:
* https://lore.kernel.org/all/20261107173621.3538964-1-vz@kernel.org/

Vladimir Zapolskiy (2):
  clk: qcom: Configure SC8280XP Lucid 5LPE PLLs properly
  clk: qcom: Configure SM8350 Lucid 5LPE PLLs properly

 drivers/clk/qcom/camcc-sc8280xp.c  | 46 +++++++++++++++---------------
 drivers/clk/qcom/dispcc-sc8280xp.c | 25 +++++++++-------
 drivers/clk/qcom/gpucc-sc8280xp.c  |  8 +++---
 drivers/clk/qcom/gpucc-sm8350.c    |  8 +++---
 drivers/clk/qcom/videocc-sm8350.c  |  8 +++---
 5 files changed, 49 insertions(+), 46 deletions(-)

-- 
2.53.0

