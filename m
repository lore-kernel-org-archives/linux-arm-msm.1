Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C72543C81AD
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 13:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791813135; cv=none; b=rlG07j3moZg7WijqL1yb3aftdWcRhDyT9S4lfMd5C9RjtowpzLTN2+8nhRb2YzebpVPYyx4EmhjoxSSWZPeGfvI2X6aOyJf2XeTiNfmbXcsgVwQeLDwaB0WBbs5UfuKGOEkEb8v8PBtIt2ZvnjbPwlXbvjPixQL0MekUpKMaLko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791813135; c=relaxed/simple;
	bh=XW1djT0Vdpsbvd9ni2r7C9RCQFJQ6pGumgwaGDmtYY0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=utI7lSlM1VLHVKhHtToVVyDARM3Kkko1odYLteMB1bnTDPMXec59qPUIYb/qJVWgm9SE7lDebRC+MwCv7wIurFDaTn/iHfgPIQQ11mZj6yVUlB5nJ4/4zZ2K1PWgi79g6Ilkk8V9C+cGhDehJXYmx5IqNeG/D//BXWQjDsTSbfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com; spf=pass smtp.mailfrom=imd-tec.com; dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b=SQ5ruEkY; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b="SQ5ruEkY"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48afcfc4bf5so1804587f8f.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 06:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=imd-tec.com; s=google; t=1791813131; x=1792417931; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=09LAm3CRdRMlY+AjcF4iVhhVeJyo0GxMWk2sX+iS7gg=;
        b=SQ5ruEkY6qbh9w1Rl7hr7BEzBStb15CQw0+rvVEfHJodvgLk99/5YPeJxBmR2JO/yv
         0MVoM1kTeWQiRXmfEdK4Cqu/394ZU70HaPlw0g3cyXHQaEbrTRrbNn0LULPt84GTS0OA
         Vf8CMY7miG0i9rB0/FrzD4SKWUQZxJTdbOF+lS//8P8zdKnhq8GCbSZokOUt+AV689ed
         Sbxpw/tUrESR8K/ADXAQlOJOtUbj1CFgfO55EbZ/Nl2KKrsY8orNDqWOSJRuMl3GWfbo
         qDzTkpsP5VhGmfSJ8EBjOWE8NcDLukD7KBrWIblHKzxSJKrz2MNoDNNI6W02S9GkdaRk
         lfDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791813131; x=1792417931;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=09LAm3CRdRMlY+AjcF4iVhhVeJyo0GxMWk2sX+iS7gg=;
        b=fYGk8dIxAwC4scHi/VODRw9Q8azX2ILOwPevhGhlPjIdkiDzWRiVgtYsMLmfGA3vOQ
         3nfzuECPdPH21m2iRr3JOqJw7Cwq9I6WWyR9OXTP3kNxS4x2SWJFV3xryDKqfKVNyrW6
         +OLMtgXDKGqLYz0rKXZERi6Bok6wS5RkGRcODHGymbbgShpKWMyjU4T96KPpnpn6SCgZ
         bs1v7pQixmZ9qx2XpmfgOLkvRqNWo1P8qVVf5AePr+6FpVXzwQQA846xhCwMVu9vzELx
         WO+LW/MAGFw0SO6BC6omID7+1v+TWelOW7hWePNrEoYvM3dgq89hg7e/D1dMD73dYjtA
         EXow==
X-Forwarded-Encrypted: i=1; AKwUvBxdqICNNnKb/iu111Ovs0iljCEN0p+SQqy6ykJg9ZUudGtp2lcX4dq78P54P5lVyqgE+MUSvRZhYapI0FcD@vger.kernel.org
X-Gm-Message-State: AFq9FYKCRXISjIV/kEl/XoODAFt7qwcefoj7pBQnETQVawsF7lVX8uaK
	03yrbq9rEUBls72Fgl/yngFOb0o1gcRl6JlzucbEHOtqfEZRxluy3iYZua5xO0Rt8VTnCc9FrK2
	wNO/Rj5nl2+QM7UA=
X-Gm-Gg: AYBFou18va/3vUHEYyfi5suI3O2SUl+F7/SL7rpltcKv+PpqNBGRDp6NNK3XRfoi1o8
	c708pX41EPhBZbR64oET8zHD6lFzfwBKP6OvBoyZ2PY74ifOed5UOkWdXBdJtDmF6mxrnsQDQS7
	MOfZ/dnOqYXZ+fUdcquEd/vQoNNGNyJCwHL4lDLD+egz5nOsK74eF4QbZGdrCq4Kv5Y66QQHJSz
	lpisO1mHoGwum2WxHGS4kYkavX7IGlzznLI5dWVOiPaQA4hm5YC2K4ksp6BuquGk0ephuNvNhrv
	WSwc/tWDCOwy+8IM1D0cJoQnFj2hLTTlIlzi5L3Eyfi/qUD9NzTppcWLMlvxksJFU5OIj/X7SDX
	itk6xEy9TnUXG/BgvNMYIp7WxAEiZrij3iWK9oRsogy296vX2HbbZRmRDeZHEUb/0gFx9D3PGF8
	DKr1wMSorJKjNXAkF04r6YD6+YhgGCB2RUgW9WxVOCyonoxAhgGK3Oltq6hGFjgH6W4dJJQropd
	AroiJ8c0OHLt0mf4507OSzWDuHteCS9zI8J5WmGFwOAG/mjgoISqxBDyDVnE5M9qVn4TKMWkNQt
	41gFMnLXLLd4ALxiF9hliTCt5B6EpRko
X-Received: by 2002:a05:6000:4313:b0:48c:5358:f999 with SMTP id ffacd0b85a97d-48dbaaf07d4mr17559870f8f.37.1791813129855;
        Mon, 12 Oct 2026 06:52:09 -0700 (PDT)
Received: from [127.0.1.1] ([82.71.135.85])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db94e3519sm21355523f8f.16.2026.10.12.06.52.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 06:52:09 -0700 (PDT)
From: William Bright <william.bright@imd-tec.com>
Subject: [PATCH v2 0/3] media: qcom: camss: Add the SM8550 CSI TPGs
Date: Mon, 12 Oct 2026 14:51:59 +0100
Message-Id: <20261012-sm8550-camss-tpg-v2-0-06dbbe36ecd2@imd-tec.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAP/lzGoC/32NQQ6CMBBFr0Jm7ZhOlUZccQ/DAtoCY1IgnUo0h
 LsLuHf5kvffX0B8ZC9wzxaIfmbhcdhAnzKwfT10HtltDFppQ4o0SrjluUJbBxFMU4emcaoo6Hr
 RtoBtNkXf8vtIPqofy6t5epv2zm70LGmMn+Nzpt37k58JFRqt6sa0lJNzJQeHyduzHQNU67p+A
 dWGy7vEAAAA
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
Changes in v2:
- Added commit message to patch 3
- Link to v1: https://patch.msgid.link/20261012-sm8550-camss-tpg-v1-0-620ab6f151dd@imd-tec.com

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

