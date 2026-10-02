Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C03A450404
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 Oct 2026 09:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790934338; cv=none; b=qBDwdhNvniH23F5/b71liU03sF59imiKY/tq9qGDvIWazArKgUpD3PfOeGj2OwMucSJ1TJEBQvZ3Mf4alVHw6HhYRCJA5bwuVDC9CuNO2Du5MLCIqU8GMbs97rCoYoGUTWbbX8tmsUt8ffrjYtGX0Q6acQqh8oCZKOvXgrqU0ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790934338; c=relaxed/simple;
	bh=55BYKoYYSwy3bCN53a4FvbioXpDXA5/IUe+AN+5f4KU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=BiE89m56xS8u2AWADzQ0WCibmlE1QFN2b0hcc8iyAAnlmOon8M08bsFFQ6Ck5qjhJqRhfWbt9XAU/dWdIeN89t4br2G8/qAKoASTiocP2MLGN04Zx0LcVYJ0J9guYBZ5GQ4JpOOE24zDNH5c6xKmBLyzlzRfVq0JkEIfySmCI0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=d/arz8r3; arc=none smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="d/arz8r3"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48af9f88c95so1201361f8f.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Oct 2026 02:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790934335; x=1791539135; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4vlDO63aq9Dc8BRT5ULZafGgVo4ARHfMSrbb3S7Yx7Y=;
        b=d/arz8r3rWoHiNvZARzxTVa0btIO6dPQFba/bM5kLh/2nMlnFPE7QnoGn5+ncGiVmY
         sybUxnlU6fB1QVyIJ+qDA6RI2+uFra5jeZjfCgLdWyKDopce/ANmFXO8Q8Ng0sVRGEpP
         RUqFsOEDHCBBd0xtGbJK1PMuzZ1fl1lXxN7hWJhTN5bYIyg0VPHdi5vf9Jb5LahWlWT9
         qN3lM4S+k0WpBmVWVocVAdaqUnV9+86qb+mfxAarOaALq0s3+zNRnOf+rm7caUB/zMDz
         PVB+twMPu06CsYFibuOqpDMSh4k46ZH+m4ZnmQaIkpn7rMQs9+I4J8oK5FNGQ2WeXmQV
         CsaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790934335; x=1791539135;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4vlDO63aq9Dc8BRT5ULZafGgVo4ARHfMSrbb3S7Yx7Y=;
        b=jnDU4NacS0PRF0IHzR5AVqPjlWcHuALmJPg9e0vgZ35B5J0YmuE78GAr+2XWf6C9DD
         ZlI3c+rKTxG3NDjO/VNbpwd67f7b+jgkSKkgpKg/Xp8Hb8yQoUPxSXWdFUDAKXMkp2ZH
         zTEQs77T4y+LM9nE1TqrdPrM8a35xTmT44kGPDggQUaMupawoE/ehiZVNtiLMPA+fr8G
         nffD6KwBwORtdS/1gBBFpy1Mif9CHibKulZOz9l4ucQ3Y4txbeki+4l3l4j4SQnSJDBt
         wMqPYKvjtzc1p6ioP72cJEVzuiUVsCJwEktMvtig+uIDIW+rT0NwtuBomoxLfrW9QnXK
         ECnQ==
X-Gm-Message-State: AFuF++liA7boR+BiGX2Ukcw9yHoG4OqGnv1NekEUrjtHg5OuGSsfmsB8
	1v/akmBb+qzTAa4JHKqaUPWsJE99bPCPDfnWltsDffxKmwj7dvVCKF4YCkBB1u7wFEA=
X-Gm-Gg: AYBFou1poYLOcc450uNhY8W6FQ39UhrWbCFa75zZWaH+jBJHR+JAG968yRgNBIQhlHl
	HLQ+9+WvJb4T00jy+xOm+YbiGYiMBgfVU2LYXTTPQM5yXSCiagUaFOTtefOJ3z2HtQjCBsPFuKX
	t2HFM1nqzFdM5NQxhchhIuCDe+DD52suXGFA0b+5I0I2b0UMM/TvWE2y721HLIrOb79CDujnrZL
	JdWFvub5zsrpOR3b9GUbqx6UfQNIvSwFnRhwtFOebXbdb9bjUbwjnKnhtLD4hzwwc+0WcMYMZZ+
	2HpSlnMhuImucZvk9TrrK+Z+uc+LZquEuSKASUVnDgbiViJLB1vmLgdwxBve28uubzpO+PnsVEY
	YUaHAzU1T5r3QXjq6XsRTF7oCkhYBdjzRtNbP+u0gf5RXwcHhhrSYyJhPqrOwqzla/5uDn27pGX
	ysn3+tiB2DWpKfBV52lkRr2M7OdSzN8PUdLyCXjzEqQbqMHYPmmbyZlrqL9mJyhTdGIqR/5JgM+
	cCUrJ2wbJ4G7EC7qMk=
X-Received: by 2002:a05:600c:1e24:b0:49f:ffa2:1c72 with SMTP id 5b1f17b1804b1-4a0275507d7mr36036905e9.11.1790934334415;
        Fri, 02 Oct 2026 02:45:34 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0280c8bb0sm72705635e9.11.2026.10.02.02.45.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 02:45:33 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH 0/3] arm64: dts: qcom: sm8650-valve-deckard: Add watchdog
 support
Date: Fri, 02 Oct 2026 11:45:27 +0200
Message-Id: <20261002-topic-sm8650-deckard-watchdog-v1-0-7d7f7d71d88a@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADd9v2oC/yXMwQ6CMAwA0F8hPdtkFEHirxgPo+ugGhnZppIQ/
 t2px3d5GySJKgnO1QZRXpo0zAX1oQKe7DwKqisGMtTVxhDmsChjevRda9AJ3210+LaZJxdGPHn
 qmyNTS42HcixRvK6//3L9Oz2Hm3D+prDvHwPx47CBAAAA
X-Change-ID: 20261002-topic-sm8650-deckard-watchdog-7f2834c2523f
To: Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Rajendra Nayak <quic_rjendra@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=958;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=55BYKoYYSwy3bCN53a4FvbioXpDXA5/IUe+AN+5f4KU=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqv307ZhyTljFslPnOLKjXwAqzsLcS6c755ca19e71
 dDewOMeJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCar99OwAKCRB33NvayMhJ0QvyD/
 0YXCXjr5+/rzunnDbbBQiAWyZikxJgT6WkKCAdoJD2BGR9PEtC5z5PtthkQYC3xKcfcgWSzfzVWFeq
 y1xm6w05yJ2giOyZTzYcjho1HkUcafw2FTuTUn/eKeQpjl0BzRlXLkO7+ExNqMQZyee95O7F/oxmf7
 BpDHKRU9flpmmNzJIB9ajxStRZz0cN/fegPGMi5vDYgquZBiPmu1YFWKhz0p0XLq6h8bYts0N1WOLg
 pmomyqKY0o/t2rqX9JOP0hu8i1+yY5xhPCdrxFgD8ZfCQwAmQ4u9Nh4qLjqNqu+v1256Sf54QSdlHF
 U80lLGJVDY10PJxzC1FKM1kuaJFMUBbaa35FmrzufINqSOOu9uTcBj+YmovSYdQGc1tYaUoMV23G32
 K9v5jYijDaHh4Ca0TeEms5Mt2fWep/3j8We9WWV06vm8DwtmjzvTY/7JSkrluJhYNw3pyu9l2bd+WW
 aqwHSPXiQHIVIiO3ZMSDqZnq5R+yKcCDPWd8dCUSjFrcpW7MzSzXE1xYc8QuoRWJGhCFSC/wElOo1T
 7zAWGF6Ms1UAaWXgoSJ8xMUmdQp+5JE++SKYNnAn0guYlcdxsl3GEZfeqDpaTAdxzJo+ezYMYmzA0R
 1lj1i/T0LM134Q7jlM7UfEsLF6J2YW+rx+bZtmlN98Hbj0zzMLWPmjZ9dgog==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

This series adds Qualcomm SM8650 watchdog support for the Deckard
platform by updating both the binding and the SM8650 devicetree.

The watchdog is marked as reserved by default since most boards
uses the Gunhyah Hypervisor which owns the watchdog.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Neil Armstrong (3):
      dt-bindings: watchdog: qcom-wdt: Document SM8650 watchdog
      arm64: dts: qcom: sm8650: Add watchdog node
      arm64: dts: qcom: sm8650-valve-deckard: enable the watchdog

 Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml | 1 +
 arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dts        | 4 ++++
 arch/arm64/boot/dts/qcom/sm8650.dtsi                     | 8 ++++++++
 3 files changed, 13 insertions(+)
---
base-commit: 9f24d789f03b22941b905ded43cb5ff8eea9ce62
change-id: 20261002-topic-sm8650-deckard-watchdog-7f2834c2523f

Best regards,
--  
Neil Armstrong <neil.armstrong@linaro.org>

