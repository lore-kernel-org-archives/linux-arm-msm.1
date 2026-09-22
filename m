Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 633FB53B34A
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 11:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790076523; cv=none; b=N2M8dAMy+PumshfYdWox6KQfLCUhreRr1F88CWEBNZncn+J7JHV35LUm56Khl4QmgEctNZu/ERaa2JCGxzJy/GSD94OKzisXGOr49BeS/7xM68p2zc3QROCA3xQfuMnp7qX8jUhUjQKWKepXM88Vy2nyCoVRFhQI5voyji553Ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790076523; c=relaxed/simple;
	bh=fYGkUx/99Fm0c7kzSPNXjEgt5w0JRZzbxo1j3pn8PGc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DOxclmPUGhk4vSg8lLF9eQAX0RHnCFvrkHd8wSjE9m8yCSCf0NOTHU5C7n/tW2H19ikic0dIobL6ImaFYc7sJLr81/a4mTPBAWpCVnceJSETIF4YJ9ZUhSSTuuIfMhlLiaTqIRKhUZTxr7VzE371Yrr5FtgbnKLuHDraYe43AHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Hd9XwbVC; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Hd9XwbVC"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843cedd129so2495225f8f.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 04:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790076519; x=1790681319; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0ltBuBBWlL9mibt9d/tgEVpEn1LtaUIkxlCUSVJwzoc=;
        b=Hd9XwbVCvxiotOu5UhliwsmIRlESQLr/SNzX2cRnkBjpam97IRRs52mNXKMojjuEc4
         gwTKdmpEEs4L7zTiv1NCAS7yCw5Au5SDpwY69MLa9Mqv4zFmMc1EIbZzdo/bpKOnQOYF
         /NQmJcQWRFqsBFXfz/4ouSVf2DTuvuo6XctOB4s793HJunAb2gWnyM4tdr6wsbHXr1AT
         Huf+NX0mk0R1L27iFruUPnpp2emgN+6GI0kMyZIw2RWw7ybVD2Ixq987D8tsyfw9KJ27
         yS/wEt2t1z8u+FoPvU+ArBzLSqOdrpEEmDDEtHQ6PQ3rCO24YGsnfWdH3oLwLbBuryQu
         GlRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790076519; x=1790681319;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0ltBuBBWlL9mibt9d/tgEVpEn1LtaUIkxlCUSVJwzoc=;
        b=k2gqq9ffYaY/64LXb3DHRD0bDPrfkcTS3zW8uHRupf8j3uMTw8PfQW1SzTJoHZ4i5E
         9i1ObmKX6VLMqe6axlV+wJYHT4z7qMRUzZs0kl2ij8F19haYASk2pSU7qeD7opi0PSm7
         01wytzLv720C13jd17p3wvJ/I0mJcoF2+I82RxNPd2nFTrnS0SUEY2phK0HOcPMkIxz5
         Ht2IX1wjsFuYLTe0vS68TRVrNhl+uT+hZXW6ybIfcULPc88OR27lS6ILkxLfkQ05zzX+
         0hC19iIZUpLsXPJEhOcaV7/xE9SwFd1eRoBqdEYvhQeXhBjGB/4lPKBDyRPoFvHjsmks
         mMbA==
X-Gm-Message-State: AFuF++m9HYaihgXOVDtMXJR9K7FOPBC6EDhYWPig349ndoEW//PpVGsN
	sGh5TsnHgJ3lUzjMnI/fQ9X6bQTgNM6Iyp0DrEl7o5BhPRD8eU522fKd/Go9ZBXgWqg=
X-Gm-Gg: AYBFou0SYg2lkQZJSV/hHc4KkZsBqhUVj1T0fCCJpPfpMFrK3ApL6TB7Nf7kAAYjKGg
	hGa59rrG9FkXABayebs7zT4CEgiUMP/Wcs8lM31zXU04wrAAwHvoYJD7xwa9CsoRIS0vpJ/7dIM
	9OfhFH5raZE+K8k5UEojzpRoT1m8aQ2px3XP6QqESEJO3fP7TJw0SC9LBd7NYZFkCLG7H1QUUr2
	gOl93Kr5E6JICWE6AF+lCRqvKEMAiz5+RjK8zHZ2n5XK90SpQAxqOGhOlfXviJxADR1FIGIj+de
	C3HoeblPyklse6jS1Pe4h0QZg4p3Nj6OL7QYBRHGfq0/lrThDOnOABiBHTVs4UtCDIVnoy2TA61
	v95cP6zJA4mJyelmKn3OrteAZat6cFC3ZfG2indzMhxwLHjZB5MD6Ela2XAv4EfN5QDiM7IpbwO
	AF03S/a0tPwOL7ktZe5smlpIpePiu2T52+bzfimofZsjWKH2yf41JLTUrrQ2hulEeP7Z4VjLbkH
	Ha91UU58OK1xKhDKk4=
X-Received: by 2002:a05:600c:8b24:b0:49f:ce78:3563 with SMTP id 5b1f17b1804b1-49fce78360emr133909795e9.20.1790076518725;
        Tue, 22 Sep 2026 04:28:38 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fdab0e46fsm6687485e9.3.2026.09.22.04.28.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 04:28:38 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH 0/2] arm64: dts: qcom: sm8650: add support from Valve
 Deckard headset
Date: Tue, 22 Sep 2026 13:28:34 +0200
Message-Id: <20260922-topic-sm8650-deckard-initial-dt-v1-0-c25e7759d04a@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGJmsmoC/yXNTQrCMBBA4auUWTuQCTQYryIu0mSq409aMqkIp
 Xdv1OW3eW8F5SKscOpWKPwWlSk30KGDeAv5yiipGayxznhLWKdZIurr6HqDieMjlISSpUp4Yqp
 IPvSO3EDGB2iVufAon9/hfPlbl+HOsX6zsG07KgeYloMAAAA=
X-Change-ID: 20260921-topic-sm8650-deckard-initial-dt-19a5616b109a
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=948;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=fYGkUx/99Fm0c7kzSPNXjEgt5w0JRZzbxo1j3pn8PGc=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqsmZky9jGrp7XKVd0zocgiNoLsTguKCslSsazixqJ
 EzoINO2JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCarJmZAAKCRB33NvayMhJ0WUWEA
 CtAvsR9Std9hIOy6y1Wif/473bZqC7VF3mNpVeBQBl8ptcuzS43VcVfNRoeJIitsZmVgzw0YqmS35t
 n6GoK5ZpI7qYqZspbzXs2IJ523DfwhK02u9rpqYex6IgASd2j19h+i7KBHNut9DYYnM5QAZhw3vMtd
 Q7n2vjvTPja6wG+SCwFaStLW3Yq2WNtuph4R03sPypY83e8QSEVaoLSsJ9kIABsSN/f+YZC3/g5HlI
 EKZED9cmlmHmdjA9cXtn81rhkQHNWlNn3Pz2TrueXIM2tU8eJQ0FDvr82tf2XqC3b3s5azZHJcA3+x
 7U+iD89oZTRSSn+fnXqTyIj6X376SbXgk/sU74WSwRkoUxHtesvFKf8/5d62thuoKOxbo7ylpOz0fa
 OrTdNgkjxuBnQovs3u0GluAjSgOZEsL6B5JgdWwXbuUKdl1UqQBCcxd1V5pI04p944LXaRJ6NXiTaJ
 VAzkm9GHC8t5YNPcucuKM9FtWr4DvgA0DLX9M68egI8/6QZul1KXcLZYVOLKFDdxI83WIol4oPRpFQ
 6FuXGa+zDQwHSpb1JUoWnlOezEsCCA0nvLSLLBb9htLw92Cli25cLoxTA4VpAsMG24YxUtg7gADCGw
 hRPDCQm/nbRK+ZKtFWf43CkeMwesd991jSTOpxVc6UeNOY8xXF8V60159biQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Document and add initial DeviceTree for the Valve "Steam Frame"
codename Deckard. The Steam Frame is a virtual reality headset
based on the Qualcomm Snapdragon 8 Gen 3 SoC (SM8650).

Product Website: [1]

Dependencies: None

[1] https://store.steampowered.com/hardware/steamframe

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Neil Armstrong (2):
      dt-bindings: arm: qcom: document the Valve Deckard headset
      arm64: dts: qcom: sm8650: Add initial Valve Deckard devicetree

 Documentation/devicetree/bindings/arm/qcom.yaml   |    1 +
 arch/arm64/boot/dts/qcom/Makefile                 |    1 +
 arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dts | 1290 +++++++++++++++++++++
 3 files changed, 1292 insertions(+)
---
base-commit: 506632261e6aeb1aa05c3ebe4da0a9439153d746
change-id: 20260921-topic-sm8650-deckard-initial-dt-19a5616b109a

Best regards,
--  
Neil Armstrong <neil.armstrong@linaro.org>

