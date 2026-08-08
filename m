Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 077F937F8D3
	for <linux-arm-msm@vger.kernel.org>; Sat,  8 Aug 2026 16:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786207393; cv=none; b=DwJLRmSkiGefRRZfjlm1AxPTic7PqfRLTxntTXjZA+EOoZGaJg09FCT89N0v38fgibYZSvYN69M3hVKm09usAz1wpWwxLP9rOT5b7QVMMmthWz61zTwcQEgmLGPkTytniZ4HkFTEEFeUXQUbfw4qGRIeTRlTrnEAXIdUwaRN8Fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786207393; c=relaxed/simple;
	bh=0bxXGjtUYZ12GWiuUDgAxwvkwIt/FjwVfCq8AvrhPv0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=A6/n7Yvdl3+onl7nIyyc9Hi0E1zvsx9a4Kb07NfzInbXl/Vp3L2rKHe+aEEkhCKNR+loKXGmN85cxo8jPm4ffVtuv/4ec75y2JZw4JC/tl/SKJrfVfb39ybzGBxNtK7jvaQjOXC6nDY0ClQx6Wociho7Li+nCN+Y5YE3JQA2yHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H1EzjQIt; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H1EzjQIt"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-92e50a650a0so24858985a.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 08 Aug 2026 09:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786207391; x=1786812191; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Lz/jE6jwP2/NdrVzpAXOIzj+A4PttFcfbpXJ2Xjln/8=;
        b=H1EzjQItY4ME3a5Vc0pqyttfrr6T94PzJOMu1C/dNCZkznAIqgoaCXbb6rfrYkPW1U
         3YWZjOxTa7YUA1fsIO0mw5ZRiyvjsnNljW1PrbMi0d4MPLFQKR8HeZK1MB08ymRScMJq
         RZS7liV7qdLBjHifEAVWcLx732eUPxGUuO1NBCVFyDcNBRnOrZr29m2GIFCFjvH8XibI
         CjuG6yr6wHO602pYw0iCJZUFS6k2e8lowPcAputpocIg01DDGfDnUZ6boUqTBmFW5OY6
         D1sPoOOc7JfVemRg3Gcf/WxMRAPGXkUfMbkyZqL503pQNtbKzb3td7SPefDU91XHDg/j
         i0QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786207391; x=1786812191;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lz/jE6jwP2/NdrVzpAXOIzj+A4PttFcfbpXJ2Xjln/8=;
        b=f9E6Zh5vQ2e5D2z9U8rsV8D25OERJ7tTKUm+UbKR5LZKLqSSbg1MXIlBicNcaySATZ
         vTTFDZXAmzPavi8SXW/1x8jE+1fZD5/7Nfkfxqgn8/N8V5qgl++bTI5bsDnVPYAcOchA
         o/wi/p6NveDr7yzVj09IUUhU84RhcR8/9QF4RBvfmrbtF/wRYOkNSSDGx7IvaIWQ7kzd
         XQGSex9QuUg+s4RhNwV/4OWMDJzr9ecCcs4d6vE4o8O5RemUWqMTu4S9XF+2/1VhvBlM
         UgZ1m/vknwfjOAEHImWec9hSsko9Fl0dVqRmFZ9cCNYlFTNxrK3LaXKCv6OlyFKbKTkJ
         jgEg==
X-Forwarded-Encrypted: i=1; AHgh+RrzHi14PddxhR0RzjlvGBep9BwP51iLzgncdFQLLi3T+cFmkcXD4J0SovD+sHeWJzeRk0dxYru1nRlCoIUx@vger.kernel.org
X-Gm-Message-State: AOJu0Yzavttb65kmzh4urW4r8b6eve9kYYqubV9A0lNNz0765AzQl+pG
	J7Yx2FHnP6XvBaqNuQTjYVUOalgUjdhk3ojJctY9qzoImKBbYU3dxBhY
X-Gm-Gg: AR+sD11FrcSYQ2sha4UBR6WRvjdnSz1JTRVEGM2zDU2GEWKhmHKTAtcpUN3arxEUu01
	LRwYlDaf31Y5f8HX7+uLNX6f3Ck34TQimR6XgpQ/988oGp4A/cMGUsr7ufROpLRXzhnFmMWsdMm
	2qfL55q/nvqiDZ160SQXlGRCAdWJjeVip1EGNLfuzSQSI6YKxfm5tQwMXFYbpCYIf1e+l5zaW3U
	xS25787fy8glmrzQOfJm9Ta0DBuWhig6sRa67L4Fu6SMe1E/WKvwVmh6WXt8gg1l4rgvHVKOfgb
	I306Ag/0LzU2YD4nNpF9U8laqCKoZFeENjO83UrGhQmNcF6F8VYqGxtgjWIjeAP3nqMyothcQNE
	09cXH9aewZ/QswCAXzAa6JmsRsvQLV30HJ2nhL5Bs9YmA4XMpekH1kLESD631H141E2qAxIVYSu
	ebOMFaGj9XKgQmqfvGjY2/XnFJswTB2uSKLZbijOmZ9aEwGsSlwtt5FSHG9G7FGEj+bpNYo32Dk
	9qrpFEb/d1sIarv2LTxvulQEmtI+wZI5WUN4CS2iYbByCd6YMw7SMwPldF4jJ0hd42e9m3Dvffz
	YmsNV0nB4g==
X-Received: by 2002:a05:620a:44d2:b0:92e:6f45:dfdb with SMTP id af79cd13be357-93648f51d58mr3084475285a.0.1786207390576;
        Sat, 08 Aug 2026 09:43:10 -0700 (PDT)
Received: from JesseofTheNorth.internal ([2600:4041:502b:ea00::1408])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9366e22695bsm402910885a.25.2026.08.08.09.43.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 09:43:10 -0700 (PDT)
From: Jesse Casco <jesse.casco@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	linux-phy@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: phy-qcom-qmp-combo: com_aux enable fails on a DP-only instance with no USB half (Snapdragon X2 Elite / glymur)
Date: Sat,  8 Aug 2026 12:41:48 -0400
Message-ID: <20260808164148.123057-1-jesse.casco@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

On the ASUS Zenbook A16 (UX3607OA, Snapdragon X2 Elite Extreme, glymur /
X2E94100) the internal HDMI output never produces a picture, and a second
problem turns that into an unusable machine. I would like verification on
the reading of both.

The failure

	Failed to enable clk 'com_aux': -16
	phy phy-88e1000.phy.7: phy init failed --> -16
	  clk_branch_toggle <- clk_branch2_enable <- qmp_combo_com_init
	    <- qmp_combo_dp_init <- phy_init

Plugging a display in afterwards produces only "phy_power_on was called
before phy_init", and the connector comes up with nothing behind it:

	                      status         EDID      modes
	nothing attached      disconnected   0 bytes   0
	display attached      connected      0 bytes   0

Why this looks like the driver and not the DT

phy@88e1000 has no DWC3 behind it. The USB controllers on this board are
a400000.usb (multiport), a600000.usb and a800000.usb; none is the tertiary
instance phy@88e1000 would pair with. That PHY is DisplayPort-only here,
and every tertiary clock sits at an enable count of 0 while the two PHYs
that do have controllers sit at 1:

	                                en prep     rate     hw  consumer
	gcc_usb3_tert_phy_com_aux_clk    0   0    19200000   Y   88e1000.phy
	gcc_usb3_tert_phy_aux_clk        0   0    19200000   N   88e1000.phy
	gcc_usb3_tert_phy_pipe_clk       0   0   125000000   N   88e1000.phy
	gcc_usb3_sec_phy_com_aux_clk     1   1    19200000   Y   fde000.phy
	gcc_usb3_prim_phy_com_aux_clk    1   1    19200000   Y   fd5000.phy

com_aux reports hw_enable = Y at an enable count of 0 -- the hardware reads
as on while nothing in the framework has enabled it, which is what I would
expect if clk_branch_toggle() polls the halt bit and times out at -EBUSY.

qmp_combo_clk_init() fetches {aux, cfg_ahb, ref, com_aux} with
devm_clk_bulk_get_optional(), and qmp_combo_com_init() enables the whole
bulk unconditionally -- including com_aux, which on this instance never
comes out of halt.

I cannot say from outside the SoC why it does not, but I can narrow it. It
is not a shared vote: gcc_usb3_tert_phy_com_aux_clk is BRANCH_HALT with
enable_reg == halt_reg == 0xe1074, its own CBCR rather than a bit in a vote
register, so enabling it waits on no other master. Its source is
gcc_usb3_tert_phy_aux_clk_src, an XO-derived RCG, at enable count 0 here
while the secondary instance's equivalent sits at 2. That leaves the
block's own power/reset state, which on the two working instances is
brought up by the DWC3 controller this one does not have. I would rather be
told the mechanism than guess at it, which is much of why I am writing.

Dropping com_aux from that node's clocks/clock-names makes the PHY
initialise cleanly: no clk-branch warnings, EDID 0 -> 512 bytes, modes
0 -> 32. That is legal, since the bulk get is _optional and cfg_ahb already
demonstrates it -- cfg_ahb is absent from all three combo PHY nodes here and
nothing complains. I do not think it is the right fix, though: the DT
describes the PHY's clocks correctly, and it is the driver that enables them
all regardless of whether the instance has a USB half.

Reproduced on the merged upstream A16 DTS

The machine daily-drives linux-next next-20260807 booting the merged board
file, e8fbbca94db7 ("arm64: dts: qcom: glymur: Add Asus Zenbook A16
(UX3607OA)"), which builds standalone. It fails identically, and everything
above is from that boot. The only local DT delta is an unrelated
arm,no-completion-irq on the SCMI transport.

Konrad, the merged commit lists the HDMI port as working, and it does not
work here, so I am sure I am missing something on my side: kernel revision,
a prerequisite, or a difference between units. One thing I can rule out --
booting your merged DTS, the board brings up all three USB controllers
including &usb_mp, so that is not it. Any pointer on what to check next
would be welcome.

Also, msm_dp_aux_transfer does not time out when the PHY is down

This is the part I would most like help with, because it turns a dead output
into a dead machine. With com_aux present, plugging a display in puts the DP
IRQ thread into uninterruptible sleep, and the compositor follows it in:

	STAT  PID   WCHAN                  COMMAND
	D     480   -                      irq/230-dp_display_isr
	Dl+   4855  msm_dp_aux_transfer    Hyprland

	# /proc/480/stack
	[<0>] msm_dp_aux_transfer+0x1e4/0x868 [msm]
	[<0>] drm_dp_dpcd_access+0x84/0x1a0 [drm_display_helper]
	[<0>] drm_dp_dpcd_probe+0x50/0x150 [drm_display_helper]
	[<0>] drm_dp_dpcd_read+0x12c/0x240 [drm_display_helper]
	[<0>] drm_dp_read_dpcd_caps+0x48/0x270 [drm_display_helper]
	[<0>] msm_dp_display_process_hpd_high.isra.0+0x50/0x240 [msm]
	[<0>] msm_dp_hpd_plug_handle.isra.0+0x84/0x198 [msm]
	[<0>] msm_dp_bridge_hpd_notify+0x94/0x2a0 [msm]

The AUX transfer is waiting on hardware that was never initialised -- the
"phy_power_on was called before phy_init" above is the same fact from the
other end -- and it never gives up. The compositor holds the DRM master lock
while stuck, so SIGKILL does not land and the session cannot be recovered.

It is not specific to hotplug: rebooting with the display attached brings
the machine up already wedged, same two tasks in the same function, with
phy_power_on-before-phy_init logged at 2.3s and 11.8s. An attached HDMI
display is enough to make the graphical session unusable from power-on, with
no user action at all. It took a cold boot with the cable out to recover.

An AUX transfer that cannot complete because the PHY is down seems like
something that should fail rather than block forever, independently of
whatever is wrong with com_aux. I have put the msm display maintainers on Cc
rather than writing separately, since both halves are the same event seen
from either side -- happy to split it out if you would rather keep the PHY
thread clean.

Environment

  - ASUS Zenbook A16 UX3607OA, Snapdragon X2 Elite Extreme (glymur/X2E94100)
  - linux-next next-20260807, merged upstream board DTS
  - HDMI chain: hdmi-connector <- Parade PS185 (simple-bridge)
    <- mdss_dp2 (af64000) <- phy@88e1000
  - Reproduces on every boot

I have the hardware and use it daily, so I am happy to test a patch or dump
any register state that would help.

I should be upfront that I am a hobbyist rather than a kernel developer, and
this work was AI-assisted. The measurements are real and reproducible;
please weigh my interpretation of them accordingly.

Thanks,

Jesse Casco
