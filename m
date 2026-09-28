Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 074FA502566
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 22:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790633253; cv=none; b=WHwv5+mqN7GivK/sugwrzjJEISbRxE03f+ucmXQ9AYh3uMUK/kq9RddgM+WefA3WqLhSVQtfk8nlF68+GjjwFXe/3rvfPd1GjNgSc//RwKRRpQXYCDCxulJ73+crkeUExHU7mIvHgDC/v+3xEcS4Zjgy2m8lrBzbNrPg2fstRUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790633253; c=relaxed/simple;
	bh=Wzp7NBGBBycqLpdAbfE01xx7uBKdSRv0qdi0TBFQZjA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dcnbBRTH19KouGZBCYo1aC2dl1W3gMwXKGgZnrGfb1VUitTOHrsW3ymoiOx+1L7u6hlGLnn+DqyR7NYuhDWL0MHno5+CjcZnuBWY5qprqY4g6L1UW3/t0usZcMfno/hh93Hn+rezQYOsq/CSsBckJM2hqA9OmBagPqcfygg4XEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bfKhoNN2; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bfKhoNN2"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c2940ef15c1so490929966b.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 15:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790633250; x=1791238050; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lFkW14Ux5nF3m2S+iJsCNiUfHXVOlemX2yDn1EvBi3A=;
        b=bfKhoNN2tZOjz0k7em62zYcW2rNS8Akvuey+CSsiTCttn0EHPTLOEzhnEyt0mteAyy
         BG/W48aFvkfaTZp9bfUFxZ91C110AMOyWhkFbbaews7hBSpAVfv66oAtPa30NEVJgsY1
         nRyQKv67IBAjRG8J5/nqkK2gPyrtd9di9L+fQNVbie7xod4QKYluVAJUDe4oG4EKW2t6
         Wr9BY65Gr9HtWud1NnMF2aj+D9zOLJGuMKhUPKo8PLrkxLeOA1ZMjxwwPUpVJ+coegNf
         UtA99Jsx1XIA0+Qrr3GF/wxsZ3Q4D9IMnwfihTnkVOO6f+Y2Y9dYpl5jnIfhwNVzDMCY
         bpcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790633250; x=1791238050;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lFkW14Ux5nF3m2S+iJsCNiUfHXVOlemX2yDn1EvBi3A=;
        b=Ux7yQl40XeODcff1Yi74J1t77S38m2Wml4a8hMwpJlwzTOK5qorKJZNLNo/PKNJFMG
         U2sneeYsVAbzWHYdDFDyxKKQKBWDGQUrLGo8E+Rg5k4drcZTgaic4In087rGecW6opJZ
         /vTfhRrLVo64adtXtq6LmR9Hl3Igwp9mXj2Jv/fVTZC9QmMRXtp9QfFneTdeeI2IAsxu
         MQjHtVAdA6ZyvHOERP/PdReFmK1l/S+fZGzXn104pYKFgaXzZwGbxBcI8rPPEeHTVJBI
         eSDW81PzG06/5xN6vL5IAe/Go6KxpQ7GerwYTH7SEjTIUJt0VBVdB29tFLfpfochbSZQ
         zfHw==
X-Forwarded-Encrypted: i=1; AKwUvBzYcULqRyRWdvIDksVNhXhS1PhsNam3nmSZmZxJxOD37IoIPDmnwk5THH2XG+dvKQfOzRGyhAPm+qmU0VRo@vger.kernel.org
X-Gm-Message-State: AFuF++kaDv8jCL3IzH5bYm5Q9SWiz3fHgXW0fU+jx2rKuhkQ55Zes//C
	mcHmtkd9BKDE4ZCQxUvyDWR2bvlhY5anKceZ8ujmOFRhn9RIfGz4oAn/
X-Gm-Gg: AYBFou1UNRCDnuKWJ98l18gilzncROZb5Z9EqSOw3g3FzJ+YoooRHCiKwUwwcCkRUX/
	d/P270O2vt6vJta9F/DGeFSiZIqqxR+QgDiUWw+WA4rD1lnDVSqqQrUPqj0wwFr4K48B/jQPYeO
	ZvOccvbIvTkJZ0sh7NWAng6CRtyziigbcAPoPX8Uh0sQK2N89YK//GMUotjGKsCBS08dvz8dIT3
	7TgsXOvXy+CePcqFdRhaEhzl+B0ECq+6aU1loSt9+M+aF3r6/qPBaVMTCBQ86cQpYjmAlv3ILMu
	7tSv9HmLM7YeaQGN6sogInOxfMlWy7r8BnFein3TzOWDbAMIbXII86DWSpxnk4vXop1/9/eFFWo
	0fFq9t43My1LqKZ/YiSH316X6c8oxIw5ok++z2LtJWkcZ8jsyjV2nDKy9LJFJFhjWEjBvOtxiqV
	u2SpBUc1V91tP0bRI2frlqNQYgQU+7W6qNlZzQu64o+INIheqrlFMNNlMO6Fq+uDRXEocq0p8gc
	rmLclbJVLs+vAtwQvrLE+E6jSQHHRzvTzaYbZF0wwoBtgaQCeNvbEqh45+qIR9Rnpg=
X-Received: by 2002:a17:906:9f86:b0:c2d:cd1a:d5a9 with SMTP id a640c23a62f3a-c2dcd1af35emr405148566b.39.1790633250063;
        Mon, 28 Sep 2026 15:07:30 -0700 (PDT)
Received: from localhost.localdomain ([2a00:801:793:68fd:c07a:9093:1956:b4bf])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2ae757b9c1sm540308966b.33.2026.09.28.15.07.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 15:07:29 -0700 (PDT)
From: Yongzhao Chen <yongzhao.derek@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>
Cc: netdev@vger.kernel.org,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	George Moussalem <george.moussalem@outlook.com>,
	Ziyang Huang <hzyitc@outlook.com>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v2 0/2] net: phy: qcom: at803x: IPQ5018 analog initialization fixes
Date: Tue, 29 Sep 2026 00:07:15 +0200
Message-ID: <20260928220717.939-1-yongzhao.derek@gmail.com>
X-Mailer: git-send-email 2.45.2.windows.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When the IPQ5018 internal GE PHY is connected to another PHY without a
cable, its analog setup matters for the 1000BASE-T link. Two problems
in that setup are fixed here.

Patch 1 fixes the short-cable DAC values, which were written to the
wrong bits. It is the patch sent as v1 [1], unchanged except for
Andrew's Reviewed-by.

Patch 2 applies the analog settings in probe, right after the PHY reset,
instead of only when the MAC attaches the PHY. The PHY starts
autonegotiating when it leaves reset, so until attach it negotiated
with its reset defaults. On a Redmi AX5400, where it connects to PHY4
of a QCA8337, 1000BASE-T never came up in that state and SmartSpeed on
the switch PHY dropped its 1000BASE-T advertisement for good. With
patch 2 the link came up at 1 Gb/s with SmartSpeed left enabled, and
the SmartSpeed workaround discussed in [2] is no longer needed.

On that board, with both patches backported to OpenWrt's Linux 6.18.52,
the link was verified at 1 Gb/s after a first boot, three reboots, a
power-off cold boot, interface down/up cycles, renegotiations and a
network restart. During a separate 10-minute observation, sampled link
status remained at 1 Gb/s and no new switch-side CPU PHY link-down
events were logged. After the cold boot the switch side first reported
1 Gb/s at 4.4 s; it went down at MAC attach and recovered at 25.2 s.

Patch 2 accesses the PHY right after reset_control_reset(), which
pulses GCC_GEPHY_MISC_ARES for about 1 us. The vendor SDK waits 200 ms
after deasserting each Ethernet reset, but it does so for every block
alike, so that does not establish a GE PHY-specific minimum delay.
This patch adds no post-reset delay. Diagnostic warm-boot tests on
this board read back the values correctly after writing them in probe.
I have no specification for the required post-reset interval. George,
does the GE PHY require a minimum delay or a readiness check after
ARES is deasserted, before its analog settings are written and
autonegotiation is restarted?

Thanks to Ziyang Huang for asking whether the DAC settings had been
corrected [3], which is how the first problem was found, and to Andrew
Lunn for his reviews in the v3 thread, which kept the investigation
going until the cause was found.

Changes since v1:
- Added patch 2.
- Patch 1: added Andrew's Reviewed-by and Ziyang's Suggested-by.

[1] https://lore.kernel.org/netdev/20260927155136.2489-1-yongzhao.derek@gmail.com/
[2] https://lore.kernel.org/netdev/20260923215858.1653-1-yongzhao.derek@gmail.com/
[3] https://lore.kernel.org/netdev/SEYPR01MB58827E0D18ACC93AF98A4109C98E2@SEYPR01MB5882.apcprd01.prod.exchangelabs.com/

Yongzhao Chen (2):
  net: phy: qcom: at803x: Fix IPQ5018 short-cable DAC values
  net: phy: qcom: at803x: Apply IPQ5018 analog settings at probe

 drivers/net/phy/qcom/at803x.c | 94 ++++++++++++++++++++++++++---------
 1 file changed, 70 insertions(+), 24 deletions(-)


base-commit: a7bfaba4823e3c165bb2004c74eff7c096672bc7
-- 
2.43.0
