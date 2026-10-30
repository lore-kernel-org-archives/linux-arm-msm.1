Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793323922;
	b=uP+T58JCm2UGwlHfnPx+zT2cfqQ64ek0DCb+zs2p+8wVKclfhmfKwf2OR1BQZyiT8+Zw
	 D3v7HQvXc1tqi2g1J6gvfcHrKDDwbV/ID1Kxo0rm7d7PjC8BYoIshKnUQsyNsVWi+OZzU
	 U3Io/IghpjcZX8UgYvKxAoT4sRPVI/Ocn/ZtjHO6sto4NLT4IfyuwUDgyImGhtLKsF14N
	 qsSZHE5jUhDiMo4Wr8ezY7NBz6FqYD1j3NkQnzoJ38rGgPDzLkM7teJnN/sOpH9aHuKN4
	 EMNFTjkO0wfTBJE+jVtgOyWmB/+PGnouU11REbTvQfWn9zvvHYk7oCaCVNGS9UqOXxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793323922;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=QkGJO+kgqaCulrnXtUJH9iL49QSQWCoACVPD9LkI2pI=;
	b=Z7QF3noxzCgY2j859Y3Ete5+EqOS9M6yGaoo6kHmwemU9LGxjxloylqM4e2oYWPQoNXl
	 vG0Ddr9FumzjMqEHJP3/kdyYwXDqP9Vz8p5EineUlVgk3Hh38FOoc04oFejGBKMzm846R
	 lfIHjETyYYdi2CYylOMpvPTk4UJd5fF9HSIc7V2j1+qVw+6t+f/t/SaC9O+dotJiE0Beb
	 e02rkY6CWA4X4FcoByhfLyzLuRvFxwlBjPgxrWf5Or6LBLj6JgMUFT5dqIBdU/fG+pjq8
	 /vUbe9Hd3BMTp4LX6xUmB0mVF7H5Q6COV57Isx2xj2g1I7y6zwr2Ays+zY+rW2Tb4wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WIC0P2E9;
	arc=none smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8212606A31E
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 01:32:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8212606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WIC0P2E9
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2e5fb79ce82so1306195ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 18:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793323921; x=1793928721; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QkGJO+kgqaCulrnXtUJH9iL49QSQWCoACVPD9LkI2pI=;
        b=WIC0P2E9KkJ1uxcE5cLksyz39hhtiUmsnSNL+ZzvDtS+6nQCBPM3FA4iQ0mH2kv/i3
         3Him82UzE+pgSUNQT76hLQElesMffpDb18NLv1x2PJ1v3HtGDsYLR6fxKy2lSbdTlQh2
         vpglfKEZdQcjJDFVdvPbOfBeWsqT0SZyvETGb/nlPIA9LGVMsL4FIhi/kwnkoSf/4s3D
         B0v/rZY21OnvfhSNoZ9HM859eaHuy68xVE1gGMquwZ9HHqAz7bhOU17bN4FD1eoLL2if
         1cUWnR+W700jDDvZ9D/DajYxTRYBqi5r70QrqTkkTP+YhQIKAK7V8kLaIOPy5wlA0ywJ
         nIDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793323921; x=1793928721;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QkGJO+kgqaCulrnXtUJH9iL49QSQWCoACVPD9LkI2pI=;
        b=JnM2GWEj/W3RSWIjsGT5JpYwIgbcgIOBZ00BzAT4Ki75c4gmxPVaqgqoxWBo6WGxUh
         RbV51FZSTk9ZMW372niRaZCFmDZr9L1WZO9SEvAyzjsbF74m6FUV2QVMwD+r2hp5t2Rk
         vn9hu8EHJtLjx1bhkkeiwjDBNOhL9Ecc+MzEg0MTXR3mWjGmcdEetEVw4vTGFzBx5b5H
         yEzDwphEZorthdBvRghNNg+36UNZ05ZPDf8WD+jYNu0Ujb5wKQclTvXIePNVZDVHnb2k
         zXrLLJzKvp1t+DZBzDziuI5t449eHppEVzC23k+FmtVQj0BFOkAaBVLhSYBxJL3JEjUz
         t51w==
X-Gm-Message-State: AFq9FYLsfM4ey+zml2JkIyMTi5HgmQTVPH4sWpeZ+NwigrE3oiDcfJiH
	MOquSUJhFYWy+FlYCavWcZq8+9RlyzAHQEfP+r7UpeQVDUql44yu08rC
X-Gm-Gg: AYBFou2XkADLllZMkX2r3uUUEcZM4bab9Z1nB5soZzyZbWbpRLdk8FrPz45ej2FQhMW
	1CCbo+bJDiYnejFfVLdB3puG+ZwqTErNBmm8cZhqEASF4TjKjPga+ArQyVXdV1RQcNWQU3Lpsks
	k+yY6+h+DR1pdE/Xx9IhpOyeBd8u/xm+AT7TZ9arq3sdaRXFBiT+7Mz8TteLq6+G5MoKVUoUX5d
	R0AvNqz7KoUfLsdiwT2aWqgPm6FrFk7XqHtNl6bhxRvIvQqElxx35R5O2d1/26JrRf/8FaBj/Tn
	Q0vy1cqgQyyRJOngzoDzRsbTjkifcb2YTmgHp9kDdD77FTXAHCmoZ83SCrqpBeofl3V/nCRjV49
	pJA85oF2w8FTe+yyFxRkX/AikRZfTaBS0jPF7l6IhU/AP6O+6wg4uC+EV22Jpa/y4BWONUjCBwV
	JZw7jIask6iFlBOAjMuN/dbYlAXGIz1frK3dS0LdWp6HPnNwWJCYrLkGY8RC09Xw7ikSt1m6Jix
	GmJyQ50vsXjs0VIbrL7+nPYATG+Ugk3wQ0uw4WOlZUH9GAHxlmIDlJesCpz+JUgJEsv8lEYJlVQ
	MgPr7xUUhDLiTkM6OyL4Y2rKDsSrd/Ga2kVCcQvfi+c=
X-Received: by 2002:a17:902:c405:b0:2eb:1e07:adb6 with SMTP id d9443c01a7336-2eb364b8b76mr10600705ad.26.1793323921214;
        Thu, 29 Oct 2026 18:32:01 -0700 (PDT)
Received: from localhost.localdomain ([240c:c983:5:4bbd:2481:c7c4:68af:3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb392b15f0sm911575ad.73.2026.10.29.18.31.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 18:32:00 -0700 (PDT)
From: ShiTou Hong <redstone.dcity@gmail.com>
X-Google-Original-From: ShiTou Hong <dc_redstone@outlook.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	ShiTou Hong <dc_redstone@outlook.com>
Subject: [PATCH v3 0/6] arm64: dts: qcom: sm8250-hdk: Enable additional peripherals
Date: Fri, 30 Oct 2026 09:31:29 +0800
Message-ID: <20261030013135.158157-1-dc_redstone@outlook.com>
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
Changes in v3:
- Move the omitted `status` properties to the end of the nodes
- Reordered the root nodes alphabetically which were also omitted in v2.

Link to v2: https://lore.kernel.org/all/20261027080758.3990418-7-dc_redstone@outlook.com/

Changes in v2:
- Add a cover letter to the patch series.
- Reordered nodes alphabetically
- Drop `output-low` and `output-high` properties of the LT9611UXC pinctrl node.
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

 arch/arm64/boot/dts/qcom/sm8250-hdk.dts | 460 +++++++++++++++++++++++-
 1 file changed, 444 insertions(+), 16 deletions(-)

-- 
2.47.3

