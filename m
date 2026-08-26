Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F8594968EE
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 22:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787783032; cv=pass; b=Ew87/xQXOd2ftt5arVV7sPXNyYj15e6pdojdy1VMJdUcI+d6NPaqbL7PVsghjpJqTIaa0bQH9irlIZ7F8frBkMkM28nu8s4ODJtvoaZfWOGY8OyYW9GosCS1+ISU1slPqndZjVxyN/SMBOtXukVs3sfngT4v2pE5DIZbvAB/Pok=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787783032; c=relaxed/simple;
	bh=S5OGYt+RYx8E8riC/eeGlk0mV7mTZNjnlBFSDCfqB+A=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=jV8B8QlRuieThObCkyR+/PFzWpXpb0PGctQPMD1Sdo0bGaiDehEZVi9tGWF2mXUbb0E4Qwld5mUSxCnaKeEForuLTNpHjneOLI//gxh8DqvZQOf/JEiO/w/7wM2D6WSDpN0h8T2m/9B8/r+SAFjfngt3SB6bCimS6bgG4Ou8eBg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BqxiRYhO; arc=pass smtp.client-ip=74.125.224.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BqxiRYhO"
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-66c70f69d3fso2012149d50.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 15:23:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787783027; cv=none;
        d=google.com; s=arc-20260327;
        b=lzotrzv4W2OVbuewMh2INCwh2ScazRsef0L+9XBKCG/0+2RK+WZkwKtc2ee+uLJ2HU
         0V7H5IcVjUoSwQtPA44ZTC2/UHJOWPlNxit8Ow4HKwjg/wK5a6VZw8FtYOSETujpky9V
         aX7JYGU1R60nrNFAY78Yl0nxgIvQNIDLtyUppUWKWiZpF/A/gxbhnfoeEuKf/9nKQ3Jc
         b3mq3GVD1YGTxeqiVgo7Jm/qJPQYxBhNOEWAIeVmD1RPxy0IULTqe5z+pLOqwwdWgl3p
         xSsXCOYHWfDLs/CemzYBLtD5HXp6RLQI7wW4U/2tBwvDhs3hd7Ggfbfn5OeIFk8vj+AD
         KipQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=ML+RL9poOp5jteHLM34YXWSGbDzwsSC2167PTN/5BL8=;
        fh=EIKHLPVuuz/DRITvONJYngcQtCAaKcUEIYe4vbdDFEY=;
        b=rgtvWxkwr03/endIr1dW51oxCmxt6J2tpXSbeC3uFXu6mXzulVZMUryIXKKeQw8wI/
         feQALoi8O4v4/6m3WIbV300gy5umAALP4q8J3oPvcEeGGFRTq11SczGhwY/EhNllo4ch
         /KQ8b16OzUc6iZDZStNwHQ8tfm498KMJN8mu7kBpUaqIIZ0l2DbRBV3iph5eqiKMJuTg
         1jFvwqCb5vK2RYdWzGr1mnJw0lZS9mobrHSQzorbmKV63lL2iQW9Sml3oTDlg6/ikGk0
         1IQd8BFokLWlchQP46asOQdJjhBmAJEVdarIHhyoMmRxkOqsXP6gwvmRQ/qFxz9NS1Mw
         FXxA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787783027; x=1788387827; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ML+RL9poOp5jteHLM34YXWSGbDzwsSC2167PTN/5BL8=;
        b=BqxiRYhOatNWZh9qLKidEzvu9RVyLGDfZAP+aMiCRh8Wu2/wE+V90O5svU5GjxJ3oy
         Id+ayjaTAd026MT8kCzMRvcnqR7bQ7JFyyzhWanycHTkWThQ0RLxh1C3I1Q1GAa69PT3
         3fjY5VTu7cQLBWDUIi/Xn3f5VyH+Rc15vKrdJlnLl7NZg66v2Akh+3e5Ogdh5JNy01cI
         3ZLTrUZtxG5467qWjT81QDmT24bQfeZwa7Ch7+Yg9IreJyqyAzn5DdDFpfZvrwglLQT2
         LW/Q6O8hkZ0PNzpM1rZvXUD7IpksOkSoTgk7RWbuI3fB2Mu/iKFGZ+makdTt8ackyEye
         KydA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787783027; x=1788387827;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ML+RL9poOp5jteHLM34YXWSGbDzwsSC2167PTN/5BL8=;
        b=WgSWvkrWzazSEuvGNFa+nivqgPZ0SpTMqXHoNnvJ/4FcFNveEa3+NMYncRxKvXZ6sO
         x+tOMtNBZ0N5G7NmtVQLRPSpDd/V1UwrF9ErGkGvUL9/PXjI72g2tXg8Lr2miz/1PuL/
         Ay0v01t5n6W/ILo3n76fSErS3oNwF5wDG4OEP4Z6XVw4K8zu50Bc/SaUwBBPV1Cbx92D
         UoG4PhNNAqkS3OqZ7R/04VAL57vRb3Y7RI5IYpxoKByUOX6OVTWB3Cy0o4z03YFUC1KR
         vR3r28JwXJPqAbzTrSlC3CGcE0K7/AVv63ozO/5JCoUevd+B4bmZRNUs1qj7bWERJFH0
         hqYw==
X-Gm-Message-State: AFuF++m4vTTHH1TXptpYQ2rDlwdAQERWLIBcsAs1Wbo7D+MgnP/5tpHN
	+4iVJMuLU+Nva8Awbd6+0OY42eSQP76gDOPEm9mJM9xXmUPGq7XyEAoRZl0fqicxLsqdSncGFMc
	Y/RG696zDOfieU3Nx7NwXfIpLjWScyuOCVV8llrM=
X-Gm-Gg: AR+sD11MjEjOjfbuncT24cK3cVDRaAdjHtd6xQCZ7k5YXH9wNaXmtFJFggXoG7GH6um
	P3azNHPdP/FskdaF4QR7eCtUbtv12BVZ2fdfUYyseR5l99ZTlXpYdwPWlhsNUl1ixWkmsTjSTCM
	+iCm9U1AhN5pKhwafPvulgCihzM37rVsglOmXR0heJYZVxzt+b5A/0QC6YQybrzO4P9iZk8brz6
	MnWQYxsJZjBUqAA+bP6yuc4Cg41yIBUfzGtbbmM3S8hAQqfpqy5/xuz2MSK9PefUhX859yCbR70
	g5eQA+B5zIwUDNBW8/sVIVfMdOtOcKOZ0AF7iTH5oVt7C9EMn8XcBqY9psumfp5AEnTeyxvoQSD
	NyanQKNilS5DtGqQ+rMVWyKK+4HEGlofLZYYO8PPN4gjxGReyUDSglGsIrC2JwHli
X-Received: by 2002:a53:c60f:0:b0:66c:f3a7:7515 with SMTP id
 956f58d0204a3-66dc38a36f4mr1153059d50.47.1787783026413; Wed, 26 Aug 2026
 15:23:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "justin.w" <kyjus25@gmail.com>
Date: Wed, 26 Aug 2026 17:23:33 -0500
X-Gm-Features: AcwNN1USE-f5eBCPufTlUrp9SNMhDdFTGTFpI7VXe6wRDw5JAHwTw2F3UoZZJVE
Message-ID: <CAEfXho4H+WTf6ai1P4sso3=31XFHBfRqtbJqOG19=b_o-MSR4A@mail.gmail.com>
Subject: Surface Pro 11 (X1P-64-100): UC-based USB4 host router bring-up -
 firmware running, rings alive, but retimer sideband never connects
To: linux-arm-msm@vger.kernel.org
Cc: Abel Vesa <abel.vesa@linaro.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"

Hi all,

I've been testing the preliminary Hamoa USB4 QMP support on a Surface
Pro 11 (X1P-64-100, Microsoft "Denali" board) and hit a wall that the
series doesn't seem to cover. Everything host-side works - the USB4
host router's UC firmware boots and reports ready, the rings come up,
the tb domain registers - but the link never trains. I'd like to know
whether the missing piece is known/expected to be public, or is still
inside the Qualcomm/Parade closed stack.

Hardware/firmware state, all verified on the running system:

- UC block (QcUsb4Filter-compatible, compatible "qcom,x1e80100-usb4-hr",
  windows at 0x15600000-0x15624000 and the ACPI0015 router at
  0x1563F000): UC firmware (the segmented payload from the Windows
  QcUsb4Filter driver, strings identify "[Nov 24 2024]") halted, loaded
  via the {target, count, words[]} burst into the +0x13000 area, gates
  at +0xd064/+0x8018 cleared, GO at +0x22000. Ready pulse at
  ROUTER+0x18 BIT24 arrives deterministically.
- nhi_probe succeeds against the ACPI0015 window; tb domain and host
  router (domain0/0-0) register; config-space reads answer in ~170us;
  ring 0 was used for the router DROM read.
- Router DROM: Qualcomm serves a rev-3 DROM with text entries
  ("Qualcomm, Inc.", "SC8380") and a trailing entry that overruns by
  3 bytes; I now parse it tolerantly (happy to send the layout).
- PS8830 retimers on I2C (1-0008/3-0008), mainline ps883x driver
  including the TBT3/USB4 CONN_STATUS_2 handling: after plug,
  reg0x00=0x03 (present+reversed), reg0x02=0x01 (TBT_CONNECTED) -
  verified by i2cdump; idle-port control dump differs correctly.
- ADSP chain: pmic_glink_altmode delivers the TBT notification
  (svid=0x8087, mux=4 tunneling) on plug.
- QMP PHY (fd5000, x1e80100-qmp-usb3-dp-phy with the USB4 P2RR2P
  clock) set to PHY_MODE_TBT/TBT3 per the preliminary USB4 series;
  PCS init completes on all lanes.

The failure: the UC never starts link training. PORT_CS_18 on the
USB4 port adapter reads 0x10 (TIP=0) before and after plug, the UC
sideband window is static, and no ring events or UC interrupts
(GSI 287 = DT SPI 255, which I have armed) ever arrive on plug.
The UC firmware strings ("Waiting for SB RX Connect",
"Failed read SB LINK_CFG") say it is blocked on the sideband channel
to the retimer coming up.

Things I've ruled out: retimer configuration (per current mainline,
and I've also exercised the USB4_CONNECTED bit directly), PHY mode,
ADSP notification, the router bring-up sequence (replicated from a
decoded write trace of QcUsb4Filter), and the DROM parser.

Things that crash: reads of usbap_config (0x15681000) and the uc
mailbox (0x15623000) windows hard-lock the SoC, and replaying the
filter's UC interrupt-arming sequence (router+0x20a8 enables etc.)
also faults - so there is context around those windows I cannot see.

Questions:

1. For the UC-router design, is the UC<->PS8830 sideband expected to
   connect autonomously once both sides report TBT mode, or is there
   host-side configuration beyond the mainline ps883x driver (SB
   enable, mode register, relay via the ADSP) that I'm missing?
2. Is the firmware payload from the Windows filter the complete,
   current UC firmware for standalone (non-Windows) use, or does it
   depend on Windows-side setup that has no Linux equivalent yet?
3. Is there any register-level documentation that can be shared for
   the 0x15600000 UC block (in particular the interrupt controller at
   +0x20a8 and the sideband interface at +0x12000)?

Full traces available: register-level DROM dump, PS8830 register
dumps (both ports, multiple states), the complete QcUsb4Filter boot
write trace, ACPI tables (DSDT decompiled), and a netconsole/ramoops
setup for reproducible testing. I can test patches on demand - the
machine boots a dedicated experimental kernel for this.

Thanks,
Justin White
