Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794384395;
	b=feZW0zVdMFzW28GBpiZnIln+VgU6L9nTDncW8gxaGUOna9+XDvqdPkZA20ufykYiQH5k
	 B/rvpsSG7tP7shJjpR1q8i4tutnQdRdNw09OaYVke6LwVAIIXZ1oxWuXs5uYhfyO+epWi
	 a+scRLG30F8oPj3Qwo3T8H/UerEmYHEfnzWC4yHRq07+1ZISJBlrIJ7ZhwzdoGmuUbt5H
	 6gNGTyD9jOCM3Kzyaf1icBCLrdCnSDPKd3cziQCaY32pmT9+qif0czR7wh1YrpicorvK9
	 X3jecXNQiPoLQkqBMlrAbrOrzoF9EYfHXVUPhljtb2yIUQsbcySHIs4uFjiF+nqraWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794384395;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=RY1xGf6xjx6c8K79NC9uGzboL+TnbiEN+yACYOIgnmc=;
	b=a5zDNd/gWYo4HBCMQAX/BXIaBAv21tM3puR+y0uZpGzzx88K8OFbWUsvm6qv85+zRDH4
	 NRcCgLAmwkG7SCK3agg6occN+TOCkFY8fzO3tElMf0WFfq//20m+6WgK5nVnuca6UnJTK
	 q7ENUqvAyaUJkcNuqQi4KETjhsGv6cBjjYX75xOIthZVWgokrSRJML44xzEDygPglYIg7
	 GD948J8jwxDdNPTkO+NCxtcWbLqt/VgMDP8WfRCda0Ukbq4PP0ASx81wko27knJ4+mY87
	 9shc+JnybqYoLIfVYNOdhZ2N85dNqz4XXOv+DbTOpH+HitOBqzUEksOgv8zdWYC0pxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=Nk8QewPw;
	arc=none smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E9D860A5BC5
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 08:06:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E9D860A5BC5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=Nk8QewPw
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b571979178so3942904a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 00:06:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1794384393; x=1794989193; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RY1xGf6xjx6c8K79NC9uGzboL+TnbiEN+yACYOIgnmc=;
        b=Nk8QewPwJwIWwCBkJQkwqLqUH0F4hfEadYxImwylvX9zqSPh44IE7kbONs4f4Fpp5m
         JI/W38VEG4J65NyhxM5i6PbvVHFzMJOb3NanD56JoJvDNBcnMWqddIRaiH+FHyB1PVtL
         0F0AmnCpTaBuiMs3x2bDROMmqpc/MYRUaWKyZxPjYS7OJ1rQrqPlZ1EMxfwcqbbTfhKH
         D9j/SwJU5UqJ47fWKWJofTmjLd7LIbkszXYv0YH7+fMaMWF1Pi474yOonq1R4YYvV2Nz
         IaGhyl78AF/CcPTJd+q9rasm4R7lHQ5qS9CwTqNYY+udRdL0WB4A0Teg+gyI71vg3GqE
         V2ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794384393; x=1794989193;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RY1xGf6xjx6c8K79NC9uGzboL+TnbiEN+yACYOIgnmc=;
        b=kUuqFtBTvSeJrcybXNwzNs1lmenygwqPQpSO8wyrYJmuE8QdGyP+ykuveevqYrI0Bf
         iGUzZyM5mFhrxmRI6rG1SWhSRliW2FpGb10NFcRC1rLfv59Z9i4+E9zyAdfoFiQLeKRZ
         NVmiT2iGot2IwLPXV2+A3n1Su9tzmakdGtrFH99loWmhhf7KfVFw9762p+d011Bov3KR
         PVXWAqXL9rlI5wtj9O/h/wBnspWtUveBjAgWw0XpgvJnaaIQckR3XCQYvr/Ohp6pt8H1
         VFkiqEUywzG7mJE16zLZFd91OaOkMfdaxXI+kIx4IOIWMrMqbQepoSwqJWQhBWSXRpy8
         JjhQ==
X-Forwarded-Encrypted: i=1; AL+hErEHlrroE4++ahgcupQvXedfP8RiTdiN81kO7HycfovzVXazuFJGR6FajkLvunbzn/Sn2RPFw/JoZ6qxxzYn@vger.kernel.org
X-Gm-Message-State: APuU4Z8vghG/oJjlYHwRPVdN+2G3t9bKget08LSavhvkyjaHRgEL6YL9
	1tXDQWRzQnqDv19t2pzDYa4xu+Uu3/z4W6u/5x5+dncfr378DV/vPatXiwsHrOBhmQ==
X-Gm-Gg: AYBFou2SeGWdAkB+mbCvuYJiVy/5fG+uu7NH5v5EpHI+ER8AaUbYPfxNV6PA3xdT1wQ
	lWHptni/l8oQuBqRqqDHYV+rvz05GU1Ck1lu0lyTDKM27CcslfFs0hj1TrwnyPQSiCY3pjGSNIH
	QUVE7mHBrOGY3fTNd9KKgtUGoPfa8TeZ+MTZrfELC++129kEesVWj/u3sfw2HjMaPgM4XAS9OBe
	aSJBdtVQGIsEXtHZ2qq9pIJEOYeqkH0jIf4lXw33IFqIbE1gm5nWTcIFgBWZ45JhJpv+hXZrL6N
	yyMAlZ3gOwz+gitBmAG21fIavL0CKKGTQ+wsmJ7wBZ3coy/6n6psZBj+eGq4QMkdXdQmlY1juB9
	hI6DcqdSc0Iod51ZiLUWbuC5ZfLkfFQ1VO7PAhXJKzkXcCAw7/u7l7M0ANgQDrhQ54Ao44+7eZe
	6Gk5LEvbBD63lFqHD6EbR9y17n3RjFVPDn33XpORp0cL+vUny4KyqOGs26ClZIjXLPNVwTzBvg2
	fu/1BRj9LbrlVLQnveDA8TlGTchLiq8YJ3nrTHBr6HOXVnGmvI5yTphIHdVXKkC8L0XYzztYKmA
	Q4R/CDoI4NGrmPY2f2rIqYVZOABoYmAo4U+acDKTCizdakVKx+SaXowMDpo3urJ7OSGNBLpx543
	K4LkR90m70MYrsEr+lTuXvizS9LzuYHrtoKfIp3y9mZ6QtVgujWqeEXuTGgUMrZeRnyOMD7tG2g
	dwUqnXq4zen19o0eSWZ4RmZ6M0dNPp+kPtkhF6CnHs+O8Dtzxt1prqLh2SmKayUSDggPJyns0OQ
	8nmsps0+mKJcwheF4G4xnatN71HS29hGGFLSmsWcDn40HP/ajJqgG4KKTebR+ScDRaLCUOW3kii
	+gBiVsd1mDAXLZG147Y=
X-Received: by 2002:a17:906:f59c:b0:c44:16ad:c31d with SMTP id a640c23a62f3a-c50668b84bemr120721666b.4.1794384393506;
        Wed, 11 Nov 2026 00:06:33 -0800 (PST)
Received: from Desktop (p54aff574.dip0.t-ipconnect.de. [84.175.245.116])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a6af519sm203722266b.87.2026.11.11.00.06.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 00:06:32 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Chris Lew <christopher.lew@oss.qualcomm.com>,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	Karthikeyan Periyasamy <karthikeyan.periyasamy@oss.qualcomm.com>,
	Kalle Valo <kvalo@kernel.org>,
	Sriram R <sriram.ramachandran@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] soc: qcom: qmi, ath11k, ath12k: take WLFW messages only from the firmware
Date: Wed, 11 Nov 2026 09:06:27 +0100
Message-ID: <20261111080630.244427-1-julius@bairaktaris.de>
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

Any local process can open an AF_QIPCRTR socket, send datagrams to the
port of a kernel QMI client and publish a server through the QRTR name
service. The QMI helpers hand responses and indications to a client's
handlers whatever their sender, and ath11k and ath12k connect to any
WLFW server that a lookup reports, including one on the local node.
Both paths reach the REQUEST_MEM indication handlers, which free the DMA
memory that the running firmware writes into.

Patch 1 makes the QMI helpers take responses and indications only from
the servers a client looked up. Patches 2 and 3 make ath11k and ath12k
ignore WLFW servers on the local node, as the firmware serves WLFW from
its own node. Patch 1 does not depend on 2 and 3, which can go through
the ath tree.

I used Claude (Anthropic) to help write these patches.

Julius Bairaktaris (3):
  soc: qcom: qmi: Take responses and indications only from looked-up
    servers
  wifi: ath11k: ignore WLFW servers on the local node
  wifi: ath12k: ignore WLFW servers on the local node

 drivers/net/wireless/ath/ath11k/qmi.c |  4 ++++
 drivers/net/wireless/ath/ath12k/qmi.c |  4 ++++
 drivers/soc/qcom/qmi_interface.c      | 18 ++++++++++++++++++
 3 files changed, 26 insertions(+)


base-commit: 067c5c24cef23d913b67eaaf71ae67e7169a6620
-- 
2.53.0

