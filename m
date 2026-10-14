Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1253747F791
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 20:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792009183; cv=none; b=g13ayi8Jwj9GFe/Zx07qDvUQ/LU92OIuZdrt5S9vjIIcZXKWwZQS6bmSI1dJa608YpSS2D3V7lP0TVjJmnci7bE+kLLSjac951uGLLOgQ2w/E4OLybVb6v9d7ar/DoMW0VnHK/i3Eku6aPMD7mGRYmjrWOBkHsUXXycNLoDo2PI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792009183; c=relaxed/simple;
	bh=k1D2Jt/MIMBi18JJ3Pt1Hkf+TwV5cUpgoCJZNM3kUto=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Q2F2YKEhhcIU5QykNe/RLSA/qUvcK1co9Qf6JakZsvhGRKgzDjoINThza4NMmYSu0Oeslo4hb83e8NLNYiwtqdxZhPWc7gkXCuzRUoELnbf86IZx4+E4Q79Ge554sI2t9rYxcgA93bSo40CZjDCxkGKjx88kbojQ1461bQsxMl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OBnBTHm/; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OBnBTHm/"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48b042c0728so1088005f8f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 13:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792009180; x=1792613980; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OWEw1y+7jiUWTAz/9BEGibbvR7uznEdBfDaaovYCeps=;
        b=OBnBTHm/FkkQTkD2chiu35SvD7upEnXnKmecrVI3S7wDlonoTuzZgzM+hjTX1VmpYy
         QQHkSHVD58aegvUgrNrFt02hoIBkDzs6jwh9OyGBu7EVPGXI8ilhnKg7p/cj2o3pWftx
         lL9Drok9uMfNUalZfeHT90XSj6jZutLCXahUQyLNjs4Aqq8LYemSQdxg4VH3AyCqOCQJ
         rCpBI3lLHftfTdEPgxmcMiWSM/OBEla558rq0yighjgaVQd2CUYIHX3U8ur3UHK9f31b
         FNBOR8pHqa7KHC6GkkQ7Eq8TJsMvv7n0/vPEVUjrovK+21ofQ+h+Ju1jyCUJIkpmQXLP
         1CYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792009180; x=1792613980;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OWEw1y+7jiUWTAz/9BEGibbvR7uznEdBfDaaovYCeps=;
        b=ZgMrIe01C9dlbXMa6l9ghrnnJ/fhL/9N1I6XWSM9xz//pnmof6eXcscaicoSL98k/O
         RyNwcdA+i8z9Orx8x9rit5lAvJYP5WxCxDnlMdkWIpuK0Repiu8rlUen63FVk0+V1mGf
         3gigx4EgUeWfNQaDuk3IF8AZmNV99SRj87vnEay7r6ok9fwsHfsAujc17IJ/Vep1uY/E
         Z2ZWbSw1d3UrS3L8KnkcjlwFVrIJ43CLYl22JZOI5JK1dRnvB8U7yCpUO1jDgb15Vgrv
         DiK+y5hnWsT6mHBb7sZ3SiKP1i61WTuvbJI3RJtmOVI3SLKyH25XjaLTrMy9QbwB3OSH
         XTxQ==
X-Forwarded-Encrypted: i=1; AKwUvBx/90zcnlJp8yjoGfT/Lfa+Ocn29AglP89bVcB8tpEnB41C5HnQAImFNrbCZL4nGxmzTogt7+ojMoAEPh+u@vger.kernel.org
X-Gm-Message-State: AFq9FYIVpodwemUIDKRNnTFGGgXzSnNsu6jejddAZvugHPIgqn8zWn6E
	mRAekWO3fiQCyKaDzY7pJwUFNcKdK6azZ4VznPmZ4gR9fjpoOgftdgRR
X-Gm-Gg: AYBFou1khRJWOnBHUNRVNG4UFr+jTdz0IOIlJ0XY+qziwHWA4zyIy0cFgZTAtq4tV+d
	oAwDOyxWGF0Rrh0Gnh7X23ABchRgnfNg2bfYfWkwhL/A+x1Lvzjff7kRp4BgBu4Zj6qq7SjM28w
	UhR+lTbuPxC27fFoHOU78XdULON4VKPeIDqXCGj7+Q8ywSX1qxX9kblpmIR88mp6sT4Yet+IzNw
	npumDzYJ3goALUWUmkFCRx7htnlj8wxEYkzNIKz5X+P0UT+ntoZwOiHSY1V8Z8mCQgrdUDOD/Q6
	sIFkpjl0CtJm/WO2YEM7TACPZ2JkDjU1rjBf3GW6SR0u25zYzTunUTZfkztTr8+9wEgqCOAyU9f
	zrAfAzntZihnI9qsAirX1hI1X60mtzr616JBHZvRz4+h/+p9WbwQnmL44SGLpTGZMA7S2gCKsEZ
	/bUCt7WuGIWRSn8MrMUle1XZ9wHGBIe6RfBTtouHGVzmroIXb/ucnnfn08K+mgphj6tRi/XW8NH
	Imz44SqO7zwoT3rbTKyaRAlG4w=
X-Received: by 2002:a05:6000:25ee:b0:48b:e50:715a with SMTP id ffacd0b85a97d-48dbace01abmr36901888f8f.34.1792009180027;
        Wed, 14 Oct 2026 13:19:40 -0700 (PDT)
Received: from localhost.localdomain ([188.190.249.216])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48df0f8f624sm2708292f8f.5.2026.10.14.13.19.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 13:19:39 -0700 (PDT)
From: Vladyslav Tymoshchuk <tvlad744@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: Vladyslav Tymoshchuk <tvlad744@gmail.com>,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-arm-msm@vger.kernel.org
Subject: ath12k: board specific SAR table and coex settings on a devicetree platform (WCN7880)
Date: Wed, 14 Oct 2026 23:19:11 +0300
Message-ID: <20261014201912.4487-1-tvlad744@gmail.com>
X-Mailer: git-send-email 2.45.1.windows.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Jeff,

I am porting mainline to the OnePlus Pad 3 (SM8750, WCN7880 hw2.0 over
PCIe, firmware WLAN.GNG.1.0-03342). Wi-Fi works on a local branch, and I
would like to ask how you want two board specific settings to reach the
firmware before I send anything beyond the WCN7880 support itself. Both
are handled by the vendor stack today, and both are properties of the
board, not of the chip.

1. SAR table selection

The board data of this tablet has SAR V2 tables. The stock user space
always selects one of them per chain (index 6 for both chains): the
vendor driver sends WMI_SAR_LIMITS_CMDID with SAR enabled as V2 and the
table index in each row. Without that selection the firmware runs at
the target and regulatory power of the board data, which is above the
SAR level the device was certified with.

On ACPI laptops ath12k takes the BIOS SAR table from the DSM and sends
WMI_PDEV_SET_BIOS_SAR_TABLE_CMDID. A devicetree board has no such source,
and ath12k has no set_sar_specs, unlike ath11k (enabled for the AHB
WCN6750 in 2023). The limits the device was certified with live in the
board data as table indices, not as dBm values that user space could
hand over through NL80211_CMD_SET_SAR_SPECS.

Which of these would you accept?
  a) a devicetree property of the wifi node with the default SAR V2
     table index, in the spirit of qcom,calibration-variant selecting
     the board data;
  b) set_sar_specs in ath12k as in ath11k, with user space providing
     limits per frequency range (the board would then need its limits
     as dBm values from somewhere else);
  c) something else you have in mind.

On my branch the WMI parts (the SAR capability in the service ready
ext event, the SAR V2 limits command, the SAR2 result event) are
generic; only the index comes from a module parameter for now, which I
do not intend to send.

2. WLAN/Bluetooth coexistence settings

The vendor driver sends WMI_COEX_CONFIG_CMDID per station vdev with the
values of the board's WCNSS_qcom_cfg.ini: tx power while BT is active,
antenna isolation, BT RSSI and interference thresholds, TDD mode. With
none of them sent, A2DP audio drops out on this board while Wi-Fi is
busy on 2.4 GHz; with the stock values it does not.

The command itself is generic, but antenna isolation and the power
limits belong to the board. Would devicetree properties of the wifi node
be acceptable here (ath10k has qcom,coexist-support and
qcom,coexist-gpio-pin), with chip defaults in hw_params otherwise, or
do you prefer another source?

3. A scan observation, in case it is known

With no vdev started, a scan that mixes 2.4 GHz or lower 5 GHz channels
(up to 5330 MHz) with upper 5 GHz or 6 GHz channels does not report the
lower 5 GHz BSSes on this firmware, while the same channels scanned on
their own are found every time. A connection manager at boot then sees
only the 2.4 GHz BSS of a dual band access point. Splitting the scan in
the host works around it, but I would rather not send that. Is this a
known firmware issue, or is there a scan parameter the firmware expects
for this case?

Thanks,
Vladyslav

(I used an AI assistant, Claude, for the analysis and to draft this
mail; the tests ran on my device.)
