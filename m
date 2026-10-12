Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE8BF3168E6
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 13:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791810205; cv=none; b=ZLngCOYhJrunF+axOZlSFR/M/Ag862JD0rzN3m7OWoEVgCXGa40W8lZWoMqsuawg19wXXFgsjnN6+2iyYVpkbjM2quNTupg+Gw0hTcIzsubgrf6YLkvp1w6QsoouUZjnHBGfEXBCTNLTeVphkLW4vmncooRsBYsDU6pa6x3d6s4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791810205; c=relaxed/simple;
	bh=JspSAmg2h5s7/0NVQMAr3BatjKhkiwjv9OkJ2Opmc0A=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=rHweVnVe+bvXTLMSO5hkU+nX7Bd/MPwnezPtFsfXOCn0fRcdyAS0smgQdhIQi+kB5Vxjo50DVOTG51kE7Ez8jGmcIYOWs/CvYJ3xfceLA09zRuGuOyAQ0GtGQaK9DPXunQA/XQiGTAk9xxE7x8Eaix/07YqloKoCgxCALGVsvxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com; spf=pass smtp.mailfrom=imd-tec.com; dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b=UOoBGhzr; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b="UOoBGhzr"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4998b5a63e2so19342845e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 06:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=imd-tec.com; s=google; t=1791810201; x=1792415001; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=AYpBwd7jtueYD/5N70HOFcX5OQ+BSChXVXn/2tIlCDg=;
        b=UOoBGhzrGEw+HGMlx7IVUpVUgc6bCcBcbBTvnjFs5bsnFlmWxp135zoU9ec5H5RZ3E
         JeqJmDJVbIoj3hOkIo3a7Nw2KxdaEIVXYRKO3AWwjKkgxHecxe8fhrJmloZYa9/B8oT0
         YqFJ6rGp2XLbmfLoq0cSJULmvuYmPEwjqc4AF3CnSrzLmglJJKnIM2Spt4vTNvZi56eH
         8iQ/ETQlVN7cVbAsZZEyiE4TxabozgFxYJJaFSLm8jEhVQ7z0QQKuvT1vzcZyTOkX1nR
         7rwYpHJUaKn8V3o19LTo9s/0vX+tfdMvfWrjKl0ZoP2K4TW+OYEsqEsXa0yp43e4ov2N
         BAcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791810201; x=1792415001;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AYpBwd7jtueYD/5N70HOFcX5OQ+BSChXVXn/2tIlCDg=;
        b=awjXGjuf4AZIr6MXyfPp6D6Ton4V0qmKczZQ7xBkfrAHrVFYQbqYP9Owi1atYIrfBZ
         Bxs7Xd+dS2T6QmF2gez2gONVwyFD1iIMkPNJS6whu2y2Xih8wfjRolFFlsC12Q1zLEbv
         j3arC7BR0JWBPvZj6iTWYBMw+wgZE243RtSZRD34uHWQtJWqJLM1fKaJqJKsxp8nUi02
         i+Y/E17l9Y5ZhWsscl5iu0xloriG324dAHzchdkQBAz32kMbAQgBoEvfmnEv3QXqubAL
         OuE74jmkxPrlkHZWqlQWRNPjM/jhULPksiX++JWZCfgvQ58xObMksZW5SifoDHuN7O8V
         fG6Q==
X-Forwarded-Encrypted: i=1; AKwUvByCfbZDtR/ZW+f6JfayYI+gUv2FK8HwGHie806NlnAG0XCVULfBWUvUu+SA5L/gysNgh8+SsDFnFxCf1pLY@vger.kernel.org
X-Gm-Message-State: AFq9FYLHVcJiTtoKVuWQ5oYVSIqSEuT/oo8d4LU3wjFxHFs+8JZp0M2N
	CzBVbf8G/ouwjNPGn3HsLvFRlHLI78MXW+20S/OHgcvdqCBv3Ir+JKw84TW34ffOgIs=
X-Gm-Gg: AYBFou3IKclLkFcxOsDhgDuPO9ZkVxUDY2UueUFroGrK/glDjWhpqbjJ6okOFZNFYk0
	tkhTgIlR/lwMAr3GrR+//JrwkWXtFMKU0KpLeVIQRLdeUaeFDasdW9JEFqS2lLIfBizCSuLRl0T
	C+ONuYTQHVQZqIM3BRngy5vzMHW3mZnBPYG/kSKFCTdFNgKeAPHvXsQKe9FVU2jqZL8bohQ6qaD
	SAklrR0qd1rC8jmHAbVkig2fiHtyg/myYJw12UpMQOvQenuQQ7/0jBfT+IiBNYFs8QzKDzUFdN9
	wXdRyIYUfpe0d7IRyH5UKZuUZeQJA1sbqftnVUWEbAKRfvCjGy+Ox69TdbyBnI465QX43nygmaI
	aRMYlMsyXp/IZPtITxnVsAypZQ3oIjp1jhpmX1Pj5aMwVXKXqfQp9VqZbACN7KLpfJ01+4aBXr9
	YC+ZqF13lWqdJH7RZUdJGMG68Xm0onQ9ApaJCCmw+95EitOT7ckyOgop4i+sncipKpGtJwV9M6V
	cvLjbXbVIzjwSFW+6QDzJLRlDLbM4H/1RA9OA+vGSGnL5QSbN9RS/UFkZQ0yfBsa/UuW4FTk3oc
	NEGYFUdBpBiOr0wQXUBvhg==
X-Received: by 2002:a05:600c:8b09:b0:4a1:6f78:842f with SMTP id 5b1f17b1804b1-4a18e4987b8mr186087765e9.11.1791810200910;
        Mon, 12 Oct 2026 06:03:20 -0700 (PDT)
Received: from [127.0.1.1] ([82.71.135.85])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9abdaa5sm20088782f8f.35.2026.10.12.06.03.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 06:03:20 -0700 (PDT)
From: William Bright <william.bright@imd-tec.com>
Subject: [PATCH 0/3] media: qcom: camss: Add the SM8550 CSI TPGs
Date: Mon, 12 Oct 2026 14:03:02 +0100
Message-Id: <20261012-sm8550-camss-tpg-v1-0-620ab6f151dd@imd-tec.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIbazGoC/yXMQQ7CIBBA0as0s3YSQCHiVUwXLYx1TIoN05omh
 LsXdfkW/xcQykwCt65Apg8Lv1ODPnUQnkOaCDk2g1HGaaUNyny1VmEYZhFclwndGJX3+nI2wUP
 LlkwP3n/Le/+3bOOLwvr9QK0HidmYMnQAAAA=
X-Change-ID: 20261012-sm8550-camss-tpg-6bd0991432c9
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Depeng Shao <quic_depengs@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 William Bright <william.bright@imd-tec.com>
X-Mailer: b4 0.15.2

SM8550 has three CSI test pattern generators next to the CSIPHYs. They
report hardware version 2.1.0, the same as the x1e80100 TPGs, so the
existing gen1 TPG ops drive them unchanged.

Describe their register regions in the binding and in sm8550.dtsi and
add them to the SM8550 camss resources.

Signed-off-by: William Bright <william.bright@imd-tec.com>
---
William Bright (3):
      dt-bindings: media: qcom,sm8550-camss: Add the CSI TPG regions
      media: qcom: camss: Add the SM8550 CSI TPGs
      arm64: dts: qcom: sm8550: Add the CSI TPG regions to camss

 .../bindings/media/qcom,sm8550-camss.yaml          |  7 ++-
 arch/arm64/boot/dts/qcom/sm8550.dtsi               | 10 ++++-
 drivers/media/platform/qcom/camss/camss.c          | 50 ++++++++++++++++++++++
 3 files changed, 64 insertions(+), 3 deletions(-)
---
base-commit: ba86f67908354f41f269ca1d64b22e4624766dcf
change-id: 20261012-sm8550-camss-tpg-6bd0991432c9

Best regards,
--  
William Bright <william.bright@imd-tec.com>

