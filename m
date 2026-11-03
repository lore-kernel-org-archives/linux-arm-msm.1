Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793702134;
	b=CX1ido46z1iyulmJ2wIi8h2E94Ay78artCwwUohddiZDjF3LaWSc/HnkrcV410LHuenA
	 8Zu0BYAhOarZ86AoCUbkFAHDXQp9XYvCZ1JQGkdceATJg1ir+YynFlaSzz56RhDL0Q1i4
	 Vz0UhShN6m0X0DzK1v6E524pn5Gu84wgHud4MZ+3OpZUCD0Q1dT3SeOzhr6FByj6+MXhT
	 5lor9aWVrseO7z3yFLNBJGbonA3NF2o2DvyNsnQ+wC71a5OiwpLbSXJJjiWI3iit4q87b
	 Zbj8dKWa2Rt670JyoSCfZ+YuV2u71ixlqYWc84J8+8mktOe2XcMLaMHeZX9sFSkkVvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793702134;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=8G2i52QMSNjS3WqnOiLf0rOX1z8/4eapMGP5PDnRZQU=;
	b=VuZS32mxFSX9sCt/VlcLAkxrckgZy9lPEn/NTJjgtGlhCqSWfo/4Wuehz4a/HIXkT5Ps
	 Z0W0htvVQnhsINcijToqMYEmgz+qmdVc3M0sg1S5hrsAR3eYDlzs2G8oVn3iUZHj0rCrN
	 tD99a+dZxEdyU8swrI1TQTQx/topfcYTU7cOUrXoUyVhhLH9FpV+AloFRfa1p7bl+f1KG
	 FezrULlVJbilXAEvo/G0XUo4XfxTEkpOGdJyrTV1XPoPgRX96jAKQUhzxAilFJuvOOlKi
	 oMmvro2j1jjqQgaKaSKfTWpv8cMhSs0yHsoqz72IZ8PbvvjWPxhCbr0XjGz7jMxP0Zw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vgJhJUuE;
	arc=none smtp.remote-ip=209.85.167.53
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48BAE607FA38
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2026 10:35:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48BAE607FA38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vgJhJUuE
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5bcb0f245e0so3762199e87.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 02:35:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793702132; x=1794306932; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8G2i52QMSNjS3WqnOiLf0rOX1z8/4eapMGP5PDnRZQU=;
        b=vgJhJUuEvrAmYmy+knsgMQszfxSA+iqVgMMq17HoEbmRhjDGFT98E0A3FuBdsGdCLW
         3nQZOYJRoIoLVsNksYzwtWEEAkSK7K6w3wGCg5ZyKDQBdIyCCWkMYN0a2X7CxSOqfDYV
         jfKCCyege8pF5hCswkqPzA5Wko8+eTSZq180QiBDoSlZY2KFuJbt7X4Ye0Z5SJXXnssz
         vXPwybkmOuSmNpOil6qHBpqR6yJjPU4yQtVLVppRbyLho4mSx7nz4hVUOSWG8uDunNeH
         iDISDAda+p8nPCwy4tnivcAp4Nczebo2UJ57yd/Nx0oOCL9WMqtM7rIi0YZ+1yfotgSH
         yLpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793702132; x=1794306932;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8G2i52QMSNjS3WqnOiLf0rOX1z8/4eapMGP5PDnRZQU=;
        b=sx1r23GzDG+sxym+/vM/kk46Jj2S/2DXem3PsWkLF62xBoy0NfN6IqVQnLgKM+h7vg
         41QIHXOnStyY0tLMUsPymUYHilkEjnr9es7lhSre4KvHCU9SXZGB2hUT7wXStuDl7Qpo
         wd7l/k8mWQOcS2IsIR+rRnY9fbQo80vbnDPn66seuJMIezd+Rh4ZjP241v/GXrH8WEeL
         bPjxdh5qTwPiGuGyetr5YISQO0GG5ilz4qF91SVnoXaAQ+J8cqr5Zk3uUKqKd3ZQjYQA
         rrP+pHlwTHmYvTB3V/IHyDnuyr7yhRdELcu9KEDhhgnsIoAd6RrikqS3dXHNzin5mjnN
         oyeg==
X-Gm-Message-State: APuU4Z8vlvd3DmB2obh34TxcIypMBetdzJ7hThq4SZYSNVwZBdV3C1DH
	kjVSdKK3dodBA+b/OP65M+fz24DeDhVYjvKd+Cc/2zMH6acfhnPyH4P+3vLHQ6+W
X-Gm-Gg: AYBFou1fyHxusSAYw8NFjm66YCtPor72NocOZ4fkbS2TC6pJJdtmMF0yTp45g3OWQG6
	eJqlXgPMEgP4e8tanBpFOcNFA9mmoMIfFpZYz2KUruTbnAKsir+XDsGRHK99S/7q131VWVoN1Cj
	pLaoYUHk8AF/lUFzXB1vx+121h1TKW1hsraVF5DGagCnqEsHYZPw+Zb/+dLJWa1DCLI87z9pToI
	+YA+BImEAxuI8erceiKvURemTNdWwv7VI8KOEUzXRIBnIULTwGeCKn6Gm/OnHC0TlrmuqqaldMe
	2A+1FkTbvSO2QZAelfVU20HymmImLT6R1I2Etdq9QZu9LuffBNB8pZSjyp2GGOIfS5Kdp4/XU+Y
	jdB9iUPdxQ5b5xZMLEpUioYEMdAZZZ4u/yZ+UP23vwnyt59paxp2XXGEYAlCpZ3sFbVwRRSz+ro
	BH/CmmAZiLXWwS6lyBehk+Vs0PImaLtutxYFUMt03W+dVO0ZcwLg9mvyeScqdpXsOV4SWlpkf1u
	WJXTnj6EzFwRPg1Jm5l3Yk9xntmdd9Q1cyth7iOCpLNSuQ369fFbxTh/rWAVrR3bnNEIb8TDWJC
	qml+ZfTP/awIJtC6Z6VX9f7FtQans53Wp9p5Rv57KqSSEdcwTVywsuDQHG3dSamht41G4qxg2pK
	edQ==
X-Received: by 2002:a05:6512:130f:b0:5bf:cf41:2578 with SMTP id 2adb3069b0e04-5bfd95606bfmr3866973e87.21.1793702132215;
        Tue, 03 Nov 2026 02:35:32 -0800 (PST)
Received: from valor-verifone.verifone.com (balticom-242-238.balticom.lv. [83.99.242.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe074802esm2121007e87.73.2026.11.03.02.35.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 02:35:30 -0800 (PST)
From: Stanislavs Nilovs <valorcool@gmail.com>
To: brgl@kernel.org,
	marcel@holtmann.org,
	luiz.dentz@gmail.com
Cc: linux-arm-msm@vger.kernel.org,
	linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 0/1] Bluetooth: qca: Clear 5th byte in TLV tag 27 for WCN3950
Date: Tue,  3 Nov 2026 12:35:28 +0200
Message-ID: <20261103103529.804025-1-valorcool@gmail.com>
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

Hi,

Recently at work I was making a proof-of-concept for swithing our
WCN3950 setup from hciattach tool to hci_qca driver. With the NVM blobs
that we got from our vendor, the QCA drivers weren't working out of the
box. There were 2 symptoms observed:

1) The QCA pre-shutdown command (0xfc08) was always failing with
timeout:
Bluetooth: hci0: command 0xfc08 tx timeout

2) After few power cycles QCA driver was entering into "SoC crashed"
loop and wasn't able to recover. It could be that SoC stopped answering
to any commands.
[   76.546600][ T2315] Bluetooth: hci0: command 0x2008 tx timeout
[   76.559398][ T2315] Bluetooth: hci0: crash the soc to collect controller dump
[   84.706487][ T2315] Bluetooth: hci0: Injecting HCI hardware error event
[   84.713363][   T80] Bluetooth: hci0: mem_dump_status: 3
[   84.718645][   T80] Bluetooth: hci0: clearing allocated memory due to memdump timeout
[   84.792374][   T80] Bluetooth: hci0: setting up wcn399x
[   85.004363][   T80] Bluetooth: hci0: QCA Product ID   :0x0000000f
[   85.014503][   T80] Bluetooth: hci0: QCA SOC Version  :0x40070130
[   85.020682][   T80] Bluetooth: hci0: QCA ROM Version  :0x00000103
[   85.026816][   T80] Bluetooth: hci0: QCA Patch Version:0x00000001
[   85.053183][   T80] Bluetooth: hci0: QCA controller version 0x01300103
[   85.059987][   T80] Bluetooth: hci0: QCA Downloading bt/image/cmbtfw13.tlv
[   85.358930][   T80] Bluetooth: hci0: QCA Downloading bt/image/cmnv13.bin
[   85.436495][   T80] Bluetooth: hci0: QCA setup on UART is completed
[   87.458917][   T91] Bluetooth: hci0: command 0xfc14 tx timeout
[   87.464830][   T91] Bluetooth: hci0: crash the soc to collect controller dump
[   87.827568][  T106] Bluetooth: hci0: QCA collecting dump of size:196608
[   89.382355][    T8] Bluetooth: hci0: QCA memdump Done, received 196608, total 196608
[   95.458459][   T80] Bluetooth: hci0: QCA Change address cmd failed (-110)
[   95.470949][   T80] Bluetooth: hci0: mem_dump_status: 2
[   95.485343][   T80] Bluetooth: hci0: setting up wcn399x
[   95.678116][   T80] Bluetooth: hci0: QCA Product ID   :0x0000000f
[   95.688217][   T80] Bluetooth: hci0: QCA SOC Version  :0x40070130
[   95.694377][   T80] Bluetooth: hci0: QCA ROM Version  :0x00000103
[   95.700521][   T80] Bluetooth: hci0: QCA Patch Version:0x00000001
[   95.726263][   T80] Bluetooth: hci0: QCA controller version 0x01300103
[   95.732834][   T80] Bluetooth: hci0: QCA Downloading bt/image/cmbtfw13.tlv
[   96.022441][   T80] Bluetooth: hci0: QCA Downloading bt/image/cmnv13.bin
[   96.099833][   T80] Bluetooth: hci0: QCA setup on UART is completed
[   98.114243][  T779] Bluetooth: hci0: command 0xfc14 tx timeout
[   98.120160][  T779] Bluetooth: hci0: crash the soc to collect controller dump
[   98.485913][  T106] Bluetooth: hci0: QCA collecting dump of size:196608
[   99.964863][ T2268] Bluetooth: hci0: QCA memdump Done, received 196608, total 196608
[  106.210456][   T80] Bluetooth: hci0: QCA Change address cmd failed (-110)
[  106.222796][   T80] Bluetooth: hci0: mem_dump_status: 2
[  106.237541][   T80] Bluetooth: hci0: setting up wcn399x
[  106.445797][   T80] Bluetooth: hci0: QCA Product ID   :0x0000000f
[  106.455937][   T80] Bluetooth: hci0: QCA SOC Version  :0x40070130
[  106.462069][   T80] Bluetooth: hci0: QCA ROM Version  :0x00000103
[  106.468214][   T80] Bluetooth: hci0: QCA Patch Version:0x00000001
[  106.492522][   T80] Bluetooth: hci0: QCA controller version 0x01300103
[  106.499099][   T80] Bluetooth: hci0: QCA Downloading bt/image/cmbtfw13.tlv
[  106.774412][   T80] Bluetooth: hci0: QCA Downloading bt/image/cmnv13.bin
[  106.852931][   T80] Bluetooth: hci0: QCA setup on UART is completed
[  108.866237][   T91] Bluetooth: hci0: command 0xfc14 tx timeout
[  108.872172][   T91] Bluetooth: hci0: crash the soc to collect controller dump
[  109.238079][ T2268] Bluetooth: hci0: QCA collecting dump of size:196608
[  110.784410][  T106] Bluetooth: hci0: QCA memdump Done, received 196608, total 196608
(... and so on ...)

Note: These are traces from Linux 5.15, but the hci_qca and btqca
drivers were ported from master, however there are no BlueZ's hcid_*
APIs for dumps. Not sure if those produce different logs

We also had a different device (produced by different vendor) that has
the same WCN3950 Bluetooth controller. Out of curiosity, I have
exchanged NVMs and to my surprise - the other vendor worked like a
charm! No more pre-shutdown timeout and several loops of automated BT
tests haven't produced any errors.

When I started to compare the configs, there were only 2 differences
- one new tag number and a 5th byte in tag 27. And the answer was the
second one. In original ("bad") config the 5th byte was set to 0x04, but
a "good" blob had it to 0x00. When I have applied the fix to clear this
byte in btqca - the issues have disappeared even on original NVM. Still,
I don't know what this byte does and what the value 0x04 mean. We have
asked both our vendor and Qualcomm support, but no answer yet. Not sure
if anyone from Qualcomm's OSS maintainers knows what this field is
responsible for.

Also, since I can test only with one board and one Qualcomm's BT SoC I
am not sure if this is an issue somewhere on our board's config
(previously all was working fine when using hciattach, although it
didn't have IBS enabled) or, if not, is applicable to other controllers
too. That's why leaving this as an RFC.

Claude Opus 5 (Anthropic) was used to create scripts for dumping the TLV tag
values.

Stanislavs Nilovs (1):
  Bluetooth: qca: Clear 5th byte in TLV tag 27 for WCN3950

 drivers/bluetooth/btqca.c | 9 +++++++++
 1 file changed, 9 insertions(+)


base-commit: b118b617cd2c37f41cc4675f5f2cb219e22b6ed4
-- 
2.53.0

