Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97E342DC350
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 01:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784769876; cv=none; b=OMvDlDFuYQYkzwdj+nSr/J6fm0Qk5fUg55/Z9o3fZ5uswU9A3F8P/B8WeS5Zg2p6pVpspmkIUJTEqv50x7OvaaxL+h8CbtNZZ5dLN0JT3yyd+GpvTGilU8Z7lBSggt2hSmJzXKhN3aT1PqY4QSgqnUFzZVypvkJ1mu7w2i1PI48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784769876; c=relaxed/simple;
	bh=69rklTuc32Cd4OSZABo7R/EXNle708vAHcroEFr2Ywo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=auNJY+qRq1BNYlRorZPZL+ZsRrANi78oRx3pcpfw8ItOHCYekuces4N0HPxtqgVTHjD0xKBWlElVfoO4yVEeeDfq6JEvzxCLTy0cWbUkyH6v6I1o5kRYIFpGeQFysgujQXPeCjqWJuBkntZXlTT6tobCAv30Al9pq4hgcldr96k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iCQiTLEn; arc=none smtp.client-ip=74.125.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iCQiTLEn"
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-66804667af2so38301d50.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 18:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784769874; x=1785374674; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jklj4blgO9oStgR2TCQBRvz085wQbqkbiQnhj+Po55U=;
        b=iCQiTLEnTzs3NS+NnqOhu+x227F7RTcdH3qX3DSn4RSMhQuWZ2Ybh8VqUqEV50FeeR
         7brB+ov4GVcvY2wuJCpPWn0+EJ4HWBC2rOshoUY/C3uUFGBktVZc7x7UcdZNUirRLfrw
         jpCZMqz3aeT/rug1xcqjrMtJGC1WsLenbyzOr25dapuRQNLeCQkIK5NLar3fHaogrOxx
         QwJYQEI3kXh3ZZWmwDMApmil7SJ5XEWtpj4FjDJNHV2BAYHFDhy8K+t8eGINIMU+0reb
         lG/9Qgmj1dSs9hqP5pVyqz4GPYnav1jbNYhuhuFyD1b2YdebpEZ6nO2E6mlgmTrKqqqf
         TKzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784769874; x=1785374674;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jklj4blgO9oStgR2TCQBRvz085wQbqkbiQnhj+Po55U=;
        b=T3M5RzOq2kaJxO3Sh6eUDwQd7oXOv33aTl7J23KlOJwhaXy1VHWPPljbjHnqsmfGXF
         cELOKvbCrQiDARrMcrpfW9n3EAOg3M7jid8qGRj8x7yMeW/6lg2MTvFbGuY7v9TNL2PB
         ygkKoaVRr/ilJ9biXCrRJh3xa9FO45+1QlIjcq7LLvB9+h+tURwpjqilReG3AC52pEM0
         /8YLPtIm7MnEVkkmtfw+NTYWQVOh7m7JupSwlLlR9TvvMGxmF8vcS6M73JFxSmvHUlMk
         ZUkhRjMmiQyewIPnBHNt9PVkaBudbKUTjW/SzPgtkh81JxtmEgTSpaF67hDdCla2W6Rb
         PHGA==
X-Forwarded-Encrypted: i=1; AHgh+Rpv0LZmnxiCTs7kr3Ush/2H6BHs1dk43fVJ2R5r1WXwXUeJNJTZ2a7qOwAlks/nMD7v5sKNzHpdWMHck71+@vger.kernel.org
X-Gm-Message-State: AOJu0YzntIhj+BvS+zRpBIt/+lq/ZtJoBuEgC0grbm8E5a/foBWIzT1i
	/ekHpSfHA0+/rOp20rjHgN7DBSHaIJnk0+pKqQMPIWDX7C/gOkn/Y/MV
X-Gm-Gg: AR+sD11o3a7VG2ZWhCoLjZ/RN0KCCYA/Xe0kkBKQSzvwrITfIksnbq8Ku2SJfFoUm3W
	wvfak1BOK7U9YhCGs3c8BRKQOMEE2WmRICJhhLRiBCJDpcQ0s7qH7d0DzVa6gBrmBBCY/bBKrmW
	4/yLvQCv+YB/tKydjcK0wGMqqZeIY+UNULXrpKEveSIVYbQVJldrx7g7w+TWiNW7wyPn1YBqyfJ
	T4AgngtQzddA1KYKoN2Rfg5kN6eIJgMAvPav2IG9O1XaqNXNFgGMBE8HMqjJnkGS0ROw5FGnpCk
	EYwS0sB8yYSOqE/xUQ9Cjdbizj16LKG5jrRJdKSHc2cq76y2pFPE9PChxvaL8kwlAZCBgheASPK
	hf8V3FfUDm6U0MyvdpMYvDL17GEL/5Hl88sOszy30Civ9rwuwEkl8DYgB0ljJPm5tVWRHMYoBzo
	3oeVFBN8CEEU2Wl9n/7l0dYm1x9jvI
X-Received: by 2002:a53:a7cc:0:b0:668:43a3:1290 with SMTP id 956f58d0204a3-668a5028887mr176486d50.97.1784769874607;
        Wed, 22 Jul 2026 18:24:34 -0700 (PDT)
Received: from karli.attlocal.net ([2600:1700:7270:4eb0::19])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66890521188sm2310775d50.1.2026.07.22.18.24.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 18:24:34 -0700 (PDT)
From: Aneesh Pradhan <aneeshpradhan2004@gmail.com>
X-Google-Original-From: Aneesh Pradhan <aneeshpradhan@acm.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Catherine Frederick <serenity@floorchan.org>,
	linux-clk@vger.kernel.org,
	Aneesh Pradhan <aneeshpradhan@acm.org>
Subject: [PATCH 0/3] arm64: dts: qcom: initial MSM8920 and Motorola Moto E4 (perry)
Date: Wed, 22 Jul 2026 18:24:28 -0700
Message-ID: <20260723012431.48499-1-aneeshpradhan@acm.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260723012415.48288-1-aneeshpradhan@acm.org>
References: <20260723012415.48288-1-aneeshpradhan@acm.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Initial upstream support for MSM8920 and the Motorola Moto E4 (perry).

Depends on the separate qcom,rpmcc-msm8920 clk series (binding +
clk-smd-rpm) for the MSM8920 rpmcc compatible used by msm8920.dtsi.

This is a trimmed mainline-first subset of msm89x7-mainline/linux#48,
rewritten so every phandle exists on qcom/for-next's msm8917 / pm8937 /
pmi8950 (the fork DT assumed richer SoC/PMIC nodes that are not
upstream yet).

Included: regulators, eMMC/SD, USB OTG (gpio-id extcon), keys, RMI4
touch + reset-gpios, BMA253 (i2c-gpio), WCNSS (wcn3660b), PMI8950 WLED.
Deferred follow-ups: DSI panel, IPA, QDSP6 audio, FG/smbcharger, modem.

DTB build verified: msm8917-motorola-perry.dtb + msm8920-motorola-perry.dtb.

Catherine Frederick (coolguy) (3):
  dt-bindings: arm: qcom: add MSM8920 and Motorola Moto E4 (perry)
  arm64: dts: qcom: add initial MSM8920 device tree
  arm64: dts: qcom: add initial Motorola Moto E4 (perry) support

 .../devicetree/bindings/arm/qcom.yaml         |   7 +
 arch/arm64/boot/dts/qcom/Makefile             |   2 +
 .../qcom/msm8917-motorola-perry-common.dtsi   | 412 ++++++++++++++++++
 .../boot/dts/qcom/msm8917-motorola-perry.dts  |  20 +
 .../boot/dts/qcom/msm8920-motorola-perry.dts  |  20 +
 arch/arm64/boot/dts/qcom/msm8920.dtsi         |  12 +
 6 files changed, 473 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/msm8917-motorola-perry-common.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/msm8917-motorola-perry.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8920-motorola-perry.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8920.dtsi


base-commit: a27464b0b99874d22b04a92186ab7ea9252c3847
-- 
2.53.0

