Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B7D737757C
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 14:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792075134; cv=none; b=a85bWlVe/5f7vQNzsFP5bNBl4300Ju4kgyRfnQ3gVEsm1kP4fmgT9XjR+ndhKz/jFrFFRPDQPQ3YjcOjjIGS7GoppHl8AHok36UO5bRVSaDOwBG4jPTP03xx1tWLNPFiKQmhals9P/iyOSVwis2oC6GUWzHy/RUnaS5CaUtxpXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792075134; c=relaxed/simple;
	bh=JMGu2iM1quSp3Cy+yK9EW1dG4GajR3ZNEWEAaIoU1f0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tRsOJVa+deVZNqUtEWwM3sLKCSCTOgo+OdY+hR81nZ1RMw1LO5/unRTGywdu2ewPHE/LSkYDOpQVyLd1vdAVdKj0LILskdxFKx0pMsk7nilNzjsiWEeElzuMxdsneK6Wf9IqgEhpYeYafhvrJucG++e9VrWUS5QvRRmJvgYADfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=AoDwUjKF; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="AoDwUjKF"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-9178510f3bdso68712686d6.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 07:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1792075132; x=1792679932; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=87ArKhOz4mXpsOQz0dSA1S5HtkiIocsYKLa7zjBJOG0=;
        b=AoDwUjKFNDMIuLAQpcS31VBM16iaveOUugmbll1thuhLqmTUcZBf2k0csqXga0+k2V
         y77VmHzT57KEJwzkDZC9ezq2aEkpn8cCsCo5vzMbaeFz7RgNxMpLD50irKxpjfdxRIiJ
         pAerW6P1W7PvMLaN7EcUfGmfmN1pcyH8hdKkCpjpfmhNBExaterzBUit5igk+GAWNKS8
         7wZOplvmRG1VipSLmbmQAhzCbWxoRUHKuuDVkQw6/jompkKefOFXM5s5UGgjGgiYDfYQ
         HxqaMyi0/7Xcvhv/Wv4zs8c6kHUkPuLKBNNnCwV1u4aKwxas7MKB57JvvLzvEke9HaLn
         BamA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792075132; x=1792679932;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=87ArKhOz4mXpsOQz0dSA1S5HtkiIocsYKLa7zjBJOG0=;
        b=WvYuA01EcslwRSGEWdjp47v8Xv8VJlv7OeqgZW8QMQbAF0nc+kZab4nluIaMwRoX04
         PKpZcMG4cEli0WyDjnqk0CjMyHPaycY8JSFKigSeENed388fMJHym4JAWqtIff5dU3DY
         Ql3bIblI4i8tVGBHD8u8hIhFdPG5/NHLmlRB5YZCXoKSxTTDPuB4ebPSEcYgiFr1rIxD
         jGsRhsxWSe5jY3P5h/38WlrhJWZtb7T8QYmLy3cW6k7zu5/uGO6u7xGyTvygYQJeAXOd
         wlcn0lQ2aVML4AxMV5OE/AsE5BgN99vh4yffI0wWio3k9yijdzYkhJlbh+OeWGcj5cfK
         Tu+g==
X-Forwarded-Encrypted: i=1; AKwUvBypX68WoSzX+M4P//aQyAtNUDkyLMHIIEh2z/tjwQGbZ+FxpNzYtHR9WJacuVpgb3HcUncCupNKvstjU70R@vger.kernel.org
X-Gm-Message-State: AFq9FYIHdZWsQR4089PWi56YfLCt4ORm64xTSD48S/n9dDXkLnjqaDdJ
	rVe4E8oAumTBza5Nk97lCsip5FqRxkCu4dNinxnaXRo+Dm3U/3Lauy0JVZ29f4tXzAY=
X-Gm-Gg: AYBFou3MKSLfPEcTQk3wMb+qZI+dJAAyLPyYrh9FOVfWTN8w7pM1mOdPuI/86Ua99Bh
	XkYxeWhebRmU0c4GkXP224noxidHDZBtJ1tQiyGrIBLrZws3cOy7X9CwoCvDB8yzcIDW0wBYHxi
	jox17Ih7ciPWFujRn17Dem9tn0yg4OFDWqO3s6e//+NH/vk1YjO/wFxy5lRBVngeeHzaFOcyGnM
	DDDikVDDBOfvVycRkT27+BDWPtZLPXfC3FXub4ezA9UkNI1WR9oCfnX055f2rNGglGT1XQs/GrH
	2UOJDaDYoaHuSXKBlpMWsZXu6mQjhgOaNfUFmdZufsdhrW1gwKUkVYJufEj23Trj1ukMuFginvd
	nKk7SplnHK+JADtgEJgtTcQkRIZZZFBhaHsan14hYKqBnKYpXMHPtp3QhJa4HcZ6jzF+uf/U925
	Qhvwpauzo5ULETr+jOsrdFDYIX9f7mIhvb80PJLzXWagHjC3k6ZG+T3XnXuDqzy8pS5gIeeujuG
	jg=
X-Received: by 2002:a05:6214:590a:b0:91b:9061:b808 with SMTP id 6a1803df08f44-91b9061ba50mr181091236d6.21.1792075132399;
        Thu, 15 Oct 2026 07:38:52 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b97bc6d42sm82581486d6.34.2026.10.15.07.38.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 07:38:52 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk
Cc: ansuelsmth@gmail.com,
	donggeunyoo.kernel@gmail.com,
	mohd.anwar@oss.qualcomm.com,
	lorenzo.bianconi@oss.qualcomm.com,
	daniel@riscstar.com,
	devicetree@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2 0/2] net: phy: qcom: add qca808x support
Date: Thu, 15 Oct 2026 09:38:45 -0500
Message-ID: <20261015143849.483339-1-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Qualcomm QCA8081 PHY (and compatible devices) has four power inputs
available.  Not all designs need to control them, and some might connect
multiple power inputs to the same rail.  This series makes it possible
to optionally specify these regulators.

Between version 1 and version 2:
- Add a devicetree binding update that was not provided in v1
- Remove #ifdef CONFIG_OF from the body of qca808x_power_on()

Version 1 is available here:
  https://lore.kernel.org/lkml/20261014172300.292324-1-elder@riscstar.com/

					-Alex

Daniel Thompson (2):
  dt-bindings: net: qca,qca808x: Add regulator properties
  net: phy: qcom: qca808x: Add regulator management

 .../devicetree/bindings/net/qca,qca808x.yaml  | 16 ++++++++++
 drivers/net/phy/qcom/qca808x.c                | 29 +++++++++++++++++++
 2 files changed, 45 insertions(+)


base-commit: 73022f605c447f31610b94ed4a983d2b4bf2c721
-- 
2.53.0

