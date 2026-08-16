Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1ED63DB658
	for <linux-arm-msm@vger.kernel.org>; Sun, 16 Aug 2026 09:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786871269; cv=none; b=BW6CPPyqkQY4LcXGD0xnY/dMsUi4yc9XE2/o2fDkC9AkhAw5yvIbenmYTP8q8LywqBGR5q04IDUbz3r/ngR1viG7/7tb/nkrTknIhmWGUOje2eFP/B/cw7rwCc1LbZ4YrVS/ZVO0KQIzOyZMMVMuBfFvpktRvMmphKuOokC4mAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786871269; c=relaxed/simple;
	bh=vVVV/m13IjNChM/ZjwQGj3Jq/cViqlU0kkgLRzO556M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tN3SisONm/2/SO+Sc1u2xaQaRwA4hCxQZidgL6GaW3tKEvS1kkYeDo7nz+1f36REJW1PiSFgSSpD5Hhx05VycGgpRwZfJsEqR9b6vAzxUWzM58/o4uSaaEbIJ1mXt+wDQi7XZndexn7TkyXcIgwgorGsZIjDpQ1sGwesGfCzUA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RG+f63Ay; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RG+f63Ay"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2cc97653887so40718645ad.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Aug 2026 02:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786871266; x=1787476066; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GygFTkQxU74dE0opi3EUfTc1t7fZqz9y0D7YCf1CsrI=;
        b=RG+f63AyzJ+ZwPAZrwdZSRvW9pQ4+IFzBmTyJgeQDuT5lZpQzuu8KU0Z5hRtQ7i0NS
         avO5P5LUb4jDhAGcBndWeYi8aUa/Ur0htMQv1rS89zTFPBiZ88pDwbxX6yBglL2IsbI7
         sBxlIRoseqgtdssEwfI75gk1VgLrIjTm95fgv7PYI5YJgdjbKjM1c11Twvjl3d55QYO/
         EV67xvuyJN7hEC79gD2PHUFw//KfF+uin1e45Z1sknuOEoP6/CMsHfUqkENXBuJRzxeG
         umaOox6m0xroBOLkmVogZnTPyxQbl323CAOX/AVUoEmIjvOp7HkUNPIc7iC+i89kMs1y
         QgRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786871266; x=1787476066;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GygFTkQxU74dE0opi3EUfTc1t7fZqz9y0D7YCf1CsrI=;
        b=A7XdCD/tFTosaVSUhUOpwGfJK8hMuitAUfAtoglRa9c200fIcgFn/8rIWPq9iImpVI
         MC7JaObZqTpsEeVMW+75CcJ4JtNXcMLjMoQ9+/sDB6vgcEd01tBXAGVRPQGOGCnUuxzM
         /ave+iLSSnVFvMB5mtZgR/vFHgMp5WagEIJl2g7QT6AU9GnRqzCZh0gb7IpozEm/aFGG
         tq84H2ZyN2U6ZqMuYqcFlVfRI2B+WkXFfMZh7yR2/tCLkoKGO5lqJ5oatoaIL6Onkg6Z
         QlcUeOdrzh+4Hkyu/wh8jK53OS3dw4Y+xNkO6SenCdhlPmM2b/blyuEoo1ni8vw8KNp+
         0uiA==
X-Forwarded-Encrypted: i=1; AHgh+Ro+Gv259aMbnv1ObQkI9biq40cQGIdAlQC6EEC+NoN440xKlVVbtUWBbOjXCggyJMcQlkjKPD7yE+yS8NaY@vger.kernel.org
X-Gm-Message-State: AOJu0YwhDyydiji7mZXAwW0YMpElTu267wVd87FidVIzfLf4CSYYUQ4Y
	Tt2bW1nklEtMZZq5V/NjN8NgT1YVMm6cZaqYMb4I8djVW83CY9LXJyYZ
X-Gm-Gg: AR+sD13wYDCPzHc1kPO83NIYPJhmDpEnHnQDZIr/iu1BGT+bxrRlabZ8FZ4nSoYdarL
	zxEDkWAxOPSVBeea+oxzmlWPUMvyaUtOdF2GHTLcs3EpzVB8bW39tS0Jetvz2kpn0VgrO68Vfz/
	+r0DuubApQiJ0HFy7Woz9Urd39tNeBQrRfTib2muZRvKweY7ccDkTp0z15MLv6gRsNcQR5Ig/qX
	vw5COQM5L74cr72UYku+f87OwVia87fX8HwAMSvlcf8Ij+bLBOuG7fbOBtKvcO8OUyWyf2+/n+f
	FfkBm3sTQ8kNv5oY5cAYevcf5s/fNA46dZhrajGlcPCXdaYfmbyd2oINfAnjCpqxarsTA6fiNth
	dQXEIBFSlKE31jU3dsykRfUS+pNZGlrC7uVWuMU5EeS0vj/WJu0vJCkSMuoKR8BXPNAT8jW4y0Q
	uzkrv+VQ34mPyt896+uJWLM33/V64AwqrtOOX3Cj4wfEyK2ziIS/xNZxxM2psU6OuKVEK7SiRMO
	la/qoKWb+0WsiXQ93n0hgDv
X-Received: by 2002:a05:6a21:3204:b0:3c3:9a7f:7309 with SMTP id adf61e73a8af0-3cc71f19334mr19822766637.26.1786871265824;
        Sun, 16 Aug 2026 02:07:45 -0700 (PDT)
Received: from localhost.localdomain ([152.58.201.186])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3218d3f398dsm26085321eec.22.2026.08.16.02.07.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 02:07:45 -0700 (PDT)
From: Sreeshankar K <sreeshankar0910@gmail.com>
To: andersson@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: bmasney@redhat.com,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sreeshankar K <sreeshankar0910@gmail.com>
Subject: v2 [PATCH 0/2] Add Global Clock Controller (GCC) driver for SM7250
Date: Sun, 16 Aug 2026 09:07:17 +0000
Message-ID: <20260816090719.892-1-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patchset adds support for the global clock controller found
on SM7250 based devices. This should allow most non-multimedia
device drivers to probe and control their clocks.

Sreeshankar K (2):
  clk: qcom: Add Global Clock Controller (GCC) driver for SM7250
  dt-bindings: clock: Add GCC clock bindings for SM7250

 .../bindings/clock/qcom,gcc-sm7250.yaml       |   60 +
 drivers/clk/qcom/Kconfig                      |    9 +
 drivers/clk/qcom/Makefile                     |    1 +
 drivers/clk/qcom/gcc-sm7250.c                 | 2347 +++++++++++++++++
 include/dt-bindings/clock/qcom,gcc-sm7250.h   |  163 ++
 5 files changed, 2580 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-sm7250.yaml
 create mode 100644 drivers/clk/qcom/gcc-sm7250.c
 create mode 100644 include/dt-bindings/clock/qcom,gcc-sm7250.h

-- 
2.43.0

