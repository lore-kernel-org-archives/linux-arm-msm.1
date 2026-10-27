Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793086960;
	b=QAI1uh1MgrFhrVMaw0I1ut9XT/40R8bNrSb9snVYvHZBo3V8B2ub0Xh+G5WrzA4IY9RI
	 ZB9OqgFaNwXSkh4BZ2W/1L4IIEH1IyiWq9YftQPZtimdTAt3cmMR4Az2I0AO/Paymcfcc
	 v8Ar84WdZsLgN+BUQu9lDAe48WtYBG7J7vvzXN2ubyOVfdoOBa5JTGYS8FyWXgJ5pHGB4
	 KKMmtMr3S7DwGSga6TnFO4lfFd5B/PeODwXrG81qirnQdTTE2Wgs1xFuCf0BcdZxiN8YX
	 1FJn4HTvPpml/Nm9CAENEKMbck4pf8kyKle7Z5FTLGwK0RJSSJn7tCorgzdGa6QSM0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793086960;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=m157EeAc5sLNKhs4hlgrRGXu0UKUNCa1GXuB3p4hzOY=;
	b=DL36eKVIdTYehd/06NFcrhyiPn5fRfAbFtU3cAK/J0MDwUD43XCUc0I1pTuv2atrJiWx
	 j1d6+6fXCwzYiekOk4Gi7v0/I7knICHcQPqMlOVeqFH+waOzMIJHfUMBCNZ5FntWWq8ln
	 22lTrfusQehrsCIEmNWg1YZxFSjtnzWAauCJYVXJbQsL/R5tfNDDOD+w6lFMtQZUlQ8GD
	 Y3u29M8jAskY5hSt2vOKPgLQJbFI8RqJlFIeBvbsbY7B9smdIDGBlxfT0JSHdp5KaXlhx
	 EZjsI6dJW5SW5+yI7a8A4HMlfZLZqtTohHnwVDRACCrSlSxTTYOyKtOHWtV6AlpW8Ow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bg0ZV5ty;
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAB24606A325
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 07:42:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AAB24606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bg0ZV5ty
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2e977109392so22339325ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 00:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793086959; x=1793691759; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=m157EeAc5sLNKhs4hlgrRGXu0UKUNCa1GXuB3p4hzOY=;
        b=bg0ZV5tyvKeUdgxNvo06M65SzckWh6FJ5biqZI3EyhgQPXrgz067S6DVryf/CgbT/X
         Udq/oc1QO3G3n761M/eEQqtYlzWia5ls5dhvxtELQNkwCq5BIevV1DpDclRneTghEHKK
         mC35/sUop7jSxGcZR4Z3oe4x6YhE3KiaRJfkqLBrdQpWASjO/pzMCUz0y6QM9W02cF19
         pgEjTon3KVrB3JHUgEMHZd9VL+Opek5AhSS2pQQEw+3qy9Lo1/J3aFi5dTKdwoVnQoEp
         pP82kTEotOUlzys239CkugFBuLaEG6Nr3TGzlzv9rodTzy21tmwVTZElMVzVU5HHgMfA
         vQng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793086959; x=1793691759;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m157EeAc5sLNKhs4hlgrRGXu0UKUNCa1GXuB3p4hzOY=;
        b=hMhDG/7IPhjxKPQsurJSr2Kp3FA9AduOtUA/1zQijU8wzJxck2lFlinVg8rlovRz1h
         spMdhoA/h6zpZS8sCWQDq1iAtfUStX0SkDng5fNR3ZJckeu+MMJsTzUqHWiCcWawqUAX
         cmRLpLhzE6fDyYITv0NyGkBn4ynM6DOorbtZys5iNeFleQAasAnBV43XHDNtY4hYqr10
         cqRKVXV6VvFwnOsEzEuj260EpzVZa6HyV9QmK2n+QvlYoyU12yPIiAx3FJjsAomRCWZj
         BBATCklZxaU5fRQC7/sdCTMssSixcnNfh2QTE7bmsKZy2KdGvToRJrlA0Y5ZLV9oKUFC
         e+nw==
X-Gm-Message-State: AFq9FYKqjAkIXj56FQxVn21Jt+pb6aQqc4kvgOAllLg80tdq5OlTTUbz
	uj4ubxH/bCQFaYzX3TTszWN9F4jHL6pRqRdwD/LGC+PrXobsi49S+V6twuqBn0rt6qw=
X-Gm-Gg: AYBFou1CBVhlymtdPxUDLYeEKtKFKxE+nqqLj8p1xoD21y6IUDz3II03Lwr81WaeRFo
	9XzaIVqZlOK3amtH6LLcUyZzim2cbRDYVaO2qh72PZ+YDVBwvoBsJf0R97HOGUb/f0ljyQkhZ33
	i6Gj0uuh5oGMs3C87mCtfz371AyA0w2bsB00lk4z9/VryJiOENZiMkNeorMdvLWJLkI0ssWO8Nk
	Q73ecQqmh6wKgIENq4T0sElo7sDl6ld+gw89Q7QS35dwI8rPqgA1uKUQWxWNVKvcb0XbXVmzBR7
	UYGLbSWZWfplTkHzUHYGTP4y6qwRZb5jzd9UOtRY98s6Ogehd6XUZQVQFn9i6/ElEO428DvVdRN
	h0SA79MVD6iQZfuHFb51TtcjOSfV0CkGohigjmGnmq35hUMGQMtI+y81vbANMN2KrK3SAtO9DlY
	sYaEyx5Z+J+Z+qHdLJXTwnAiCX0AHYe6jrBBTzFrwgbM84ixFIRNQeMEyJum2nrAw5tU65CLAIK
	ssWkEDK7MZ+p1aFUMSqmzy6YeibJLPlpxbI9CQ7WlRCJocTJzHLgfXRkjoyeWzBfduw98R/tsr6
	FATrGwCD1kcsveInbVCE55rQ49PsyO75/5DgygeTHaykzLB55ZDhGYCZ6O38jwNKG/zv2w==
X-Received: by 2002:a17:90b:17c1:b0:3ac:8af9:4a77 with SMTP id 98e67ed59e1d1-3adea8952f8mr7118560a91.10.1793086958931;
        Tue, 27 Oct 2026 00:42:38 -0700 (PDT)
Received: from localhost.localdomain ([218.194.41.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae4064f4bdsm2504189a91.11.2026.10.27.00.42.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 00:42:38 -0700 (PDT)
From: ShiTou Hong <redstone.dcity@gmail.com>
X-Google-Original-From: ShiTou Hong <dc_redstone@outlook.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	ShiTou Hong <dc_redstone@outlook.com>
Subject: [PATCH v2 0/6] arm64: dts: qcom: sm8250-hdk: Enable additional peripherals
Date: Tue, 27 Oct 2026 15:41:40 +0800
Message-ID: <20261027074146.3911012-1-dc_redstone@outlook.com>
X-Mailer: git-send-email 2.47.3
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

This series enables additional peripherals on the Qualcomm SM8250 HDK.

It wires up the SDHC2 controller, the LT9611UXC HDMI bridge, the FSA4480
USB-C protocol chip, the PCIe ports, QCA6390 Wi-Fi/BT support, and the
PM8150B LEDs in the SM8250 HDK device tree.

Signed-off-by: ShiTou Hong <dc_redstone@outlook.com>
---
Changes in v2:
- Add a cover letter to the patch series.
- Reordered nodes alphabetically
- Drop `output-low` and `output-high` properties of the pinctrl nodes.
- Move the `status` properties to the end of the nodes.

Link to v1: https://lore.kernel.org/all/20261023072832.2642647-6-dc_redstone@outlook.com/
---

ShiTou Hong (6):
  arm64: dts: qcom: sm8250-hdk: Enable the sdhc_2 port
  arm64: dts: qcom: sm8250-hdk: Add LT9611UXC HDMI bridge
  arm64: dts: qcom: sm8250-hdk: Add FSA4480 USB-C protocol chip
  arm64: dts: qcom: sm8250-hdk: Enable the PCIe ports
  arm64: dts: qcom: sm8250-hdk: Add support of QCA6390
  arm64: dts: qcom: sm8250-hdk: Add PM8150b LEDs

 arch/arm64/boot/dts/qcom/sm8250-hdk.dts | 454 +++++++++++++++++++++++-
 1 file changed, 438 insertions(+), 16 deletions(-)

-- 

2.47.3

