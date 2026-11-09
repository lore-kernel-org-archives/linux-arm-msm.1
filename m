Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794197115;
	b=Z1aBUWZz3oSs6zBrk2+C1j30sm9f96brgvDvgJjVJcDLT83xKrl5FcmyuN03xKBeS7t3
	 UnkK3C1nmK8C3EuyzgmWRWA+fyORRjy+p/KSO8RosgDoToerK71ECh90Yi107dEafngYD
	 7s64Wk9Ev3S9sXPDcv20ySEveHwe2fRh1g4r9s4o5KoJMWiPrNW6/MLhfnBN41f6cjVNS
	 njN9kSsxd1Xj7/kvow1Bi3IbzrP1I/nuqAgSdoDKar9GEqtageT4MYlBt1GPaNHxSRcl4
	 SgMPoq3mZlKhjyNZKclGWino1l76k5g4wLsT/MmEwrtlhJ0zj1SBdh/ab/otI9eRylg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794197115;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=65HrNvLn4XwWDPvHQ3wW36EvDAN7JOrAPcPbiqPvX1Q=;
	b=29KSa6jZBqOUYN4invfh663QJ9kwfeVkQcpC1UIWy63WWB8yKAucfcNj1EW7cppdyfM9
	 voOiJBrAh59gsHaz8yFhRt9cMhZZJ0y7KdFrkBJ6ahXowefKNa1oyNz5vj85HcpQMiyQ8
	 W56St+DGsiRkUmww9nfWWVjVP+iuadH9oO/pdjnqCecLjqms2RgjUBX8mtSZr+5Z6Ka4m
	 b1wcENULUChDKGeRTFzWyTECIvB7y3JYR1KoYzO5iGcirN9LPa4zsR01IcSAqQsbyX+Pw
	 aHDDWatBHG9fpWGlNY1llXGSRAon3pfthIfAy+tugX05RMQfKQTZwGFs2E8z+BvkOXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I9l0qa+b;
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A912C606A31C
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 04:05:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A912C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I9l0qa+b
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3b08cf16decso228756a91.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Nov 2026 20:05:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794197114; x=1794801914; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=65HrNvLn4XwWDPvHQ3wW36EvDAN7JOrAPcPbiqPvX1Q=;
        b=I9l0qa+b9zPWr/JhhKeEAAKwqjuR+kYr7IAGO2ddJ05JnT9iVMmY6vOnAhTP5z2ebP
         gCIBOLyz4X4ksd81vXqG8oZmHVV/ESLDgyC+kIw3bYvWihaWClE0qRuawnmmCeEUkacT
         UFuBNut7NmyP1l5w08zLHHJTgOnaA9UtQien7YA+3vvJDQwJdSYaTPOx7ea9IL+CFMGP
         xuLPlh2Zm2RPZaCzdL4kFoT4dv3TT1tAIFgdVUN2NyL3DrdIiLMyOzPbM+g6PlefWAsZ
         mcs8mjT6cRzh00gHHZoBHw+vC0d44q/+5QkBF4UfrZedZmcg8hp6ePfOk46UGNZwS5lw
         53mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794197114; x=1794801914;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=65HrNvLn4XwWDPvHQ3wW36EvDAN7JOrAPcPbiqPvX1Q=;
        b=lpT8dhBF7ig2sGV0IVPiopcEGk//AAAj1uSDomngvqbYR9JAiW6eeSqNRyub4BV1Y+
         UtjhQMbVrimBRY6rNTspfzMMEp6DCmfP+6xzw7M+X3W8yCXbiELc3n3pFooLuOCu8ZPt
         kdZIyp6nhI4ZLyfHOPv2briJmK0kXzIb3SUPqOoHg83RlkPhz9eMsrBvcy5Vkz8ZZH/8
         85ysuhtvbprwhx+tb2Kg02YjZCU9BVXenx7BmreS0Smrd+i0xz/lov9jEPYtBDzfVgHW
         s5+3uCVedOO801zi/9sezKQyYwxGce8/1/uFOonh7wRsOmpNADaqG5nee1dcJM8dqI8w
         5cqw==
X-Forwarded-Encrypted: i=1; AL+hErH6owwbmF8jo+HCKhrhEtwLnRpakyphxZsfn+q3sdFRxNM8uoWgEDPzANsB8A4pA5vCDNvVe8KwBUNJADlY@vger.kernel.org
X-Gm-Message-State: APuU4Z9Rn00rVh+yaRI0FjtF7qpNTLL9MESEJ2sKzIux1VuD9OYvWMac
	K322JrF6OFTfJY4+mkP2t54Q2jjKJH+JKh3II4+nNXT5BPQRsepyGDXn
X-Gm-Gg: AYBFou2GiPgnew5FDXWrJq0aWH7E/oAJcoeUxg5UTkijt12VWFazi5PLUT8ASi2x/A2
	lNriLvIgdK4Lx+YC4uAWeosCVWD8EIp344TSerMmVljztUZnDJop81RfSBpyt/nhLOtlvA/N9Oh
	CoP/j1dmXxKAUluJdjuW0SQcx82Ht1muISbFWIoFtriz7hll3GXny8jtyuM1rpKCa4gi7GJx9oa
	6nIuM7ZMCSWksF/C1CLIANUr5qQMd/2X0fTR5RBfWuauvOH8whtQEM0B2dW/HUQOwiX2rjQQZig
	FJgd3zgXIdBC2BqeX+F1PQQ8RPFuYaN+aQp9THoWWw9tcuhWrWb0lAko92in1wxaBvWb2BR2/ha
	oTQTj9YFQ5+6oJzvf8uCcOkmjqpAXwvtLxvW1d69NVvqT09QOUb1g6A35pjS4hN9WPHmHJEJURE
	Y0phj7FoAElPMcxOoOfaH/EK966kuWjm6rwT8KmwjnBFznZm5MUQqp0nbaTVDq1aRUrAOdf7byF
	PNorvoGe0Ci9BvVBwUYOKu+QRfV8jngML3swerUbUu1dOQAwsr/H2NM/6zy+2SQ6h/BCo0wFP3v
	y6no7F30HRoYu2g8BgBksHecyvbviiTijbbU9qrPpzeSXgwxHT7L76H2Gxq9466zeZX0yh1FriU
	3H/+rTlq4OCEe+o29hM6KexBSwvCfiPoXK3jwR6+VHmzPDlEy8JhnZNDJ4A9OYDqmepM76osivZ
	vY6A==
X-Received: by 2002:a17:90b:3b50:b0:3b0:9fbf:8951 with SMTP id 98e67ed59e1d1-3b12d0dee33mr2874760a91.5.1794197113782;
        Sun, 08 Nov 2026 20:05:13 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b127891fa4sm5116170a91.4.2026.11.08.20.05.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 20:05:13 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Alban Bedel <albeu@free.fr>,
	Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 0/2] phy: ath79-usb: support the AR934x+ analog reset
Date: Sun,  8 Nov 2026 20:04:49 -0800
Message-ID: <20261109040451.114135-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
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

From AR934x on, the analog part of the ath79 USB PHY has its own reset,
which the old platform code handled outside the PHY driver. Patch 1
adds the optional third "phy-analog" reset to the binding, along with
AR9340 and QCA9550 compatibles that require it. Patch 2 makes the
driver take and sequence that reset.

Changes in v2:
- Send the binding and driver changes together as one series. v1 sent
  the driver patch alone, so it used a "phy-analog" reset name that the
  binding on the list did not yet document.
- No code changes.

Claude Code (Claude Opus 5.5) was used while preparing this series.
I reviewed and tested every change and take responsibility for it.

Rosen Penev (2):
  dt-bindings: phy: qca,ar7100-usb-phy: add AR9340, QCA9550 and the
    analog reset
  phy: ath79-usb: support the analog reset

 .../bindings/phy/qca,ar7100-usb-phy.yaml      | 38 ++++++++++++++++++-
 drivers/phy/qualcomm/phy-ath79-usb.c          | 33 ++++++++++++++--
 2 files changed, 67 insertions(+), 4 deletions(-)

-- 
2.56.0

