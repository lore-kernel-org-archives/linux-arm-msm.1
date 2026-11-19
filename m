Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=23.251.234.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795082990;
	b=Nvmz97J2ee8DNKAzKy111sd2lQuDZLbm/RbfKL0CqM6MSLcNdGPAmPu0eoQ5VuSq+30S
	 ljmSuE5RSEvDB8qakwYSDSQ0P+m0SKqnWq84w1ACSRTMWGa0xxmbzDc/B/ZplLwYZ/SMj
	 98NMt7AUNoIFQHJ4l10uoq28lmT7m0lS+GMwJhXHDJAdqAKGLMivoSoeK3jaPdgNw7NxE
	 P4YPRh49FKX8SR5E2g1Q9J4VmFehR/1oInq7siAWQTvp5PnKvgF5NS73SNTs2YbIA8pvh
	 LVFDpPAOIMrUCu5J9GRpB02DdfN/Yk3g7wJKHTfLuQLM/zSjBYHhNigSZKsPLXFSlKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795082990;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:User-Agent:From:To:Cc:
	 Subject:Message-ID:Content-Transfer-Encoding:Date:MIME-Version:
	 Content-Type:Feedback-ID:X-SES-Outgoing;
	bh=+c2SR/tNT42HJhoGlWnFwCiTke63Erxsj6ah49lR+3A=;
	b=VUAQHtdHN/X/vrFupVZAEvzOTwl5uFwv3oXJICPW2bpsamTh1xSi+3LUa175fmdx7oba
	 /YVZCDi04hWwnK7wp1ECezK5pKFMdGtlViBdtAPdwbRvDbcSwf/OkjJtYN8qcoHxm9Eoy
	 5ZlJN1IaBY5iku0E80uWrYjf5yIwZY0QkkWl9HX1poH37WaJz32w4zEuqGexGBTDhb8Wa
	 DADxhsW5FQxv04bBiHPLTgdhnBonGLGTMDCtqlFAXruexcsBcmfSwhd+ejiiTVdNKLXqa
	 /CNAp2INFakVcE6SDPaF/C2B8fDs6c7rR2+pII5XSfdJ2FP6YzAZWH1f9/RGMQpEV/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=seaslug.moe;
	spf=pass smtp.mailfrom=rsend.seaslug.moe;
	dkim=pass header.d=seaslug.moe header.i=@seaslug.moe header.a=rsa-sha256 header.s=resend header.b=tburQjA9;
	dkim=pass header.d=amazonses.com header.i=@amazonses.com header.a=rsa-sha256 header.s=zh4gjftm6etwoq6afzugpky45synznly header.b=a4ytP4tz;
	arc=none smtp.remote-ip=23.251.234.56
Received: from e234-56.smtp-out.ap-northeast-1.amazonses.com (e234-56.smtp-out.ap-northeast-1.amazonses.com [23.251.234.56])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3895F606A320;
	Thu, 19 Nov 2026 10:09:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3895F606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=seaslug.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rsend.seaslug.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=seaslug.moe header.i=@seaslug.moe header.a=rsa-sha256 header.s=resend header.b=tburQjA9;
	dkim=pass (1024-bit key, unprotected) header.d=amazonses.com header.i=@amazonses.com header.a=rsa-sha256 header.s=zh4gjftm6etwoq6afzugpky45synznly header.b=a4ytP4tz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple; s=resend;
	d=seaslug.moe; t=1795082989;
	h=From:To:Cc:Subject:Message-ID:Content-Transfer-Encoding:Date:MIME-Version:Content-Type;
	bh=ErlkRxmFQecr5Uue/oFTaTuv9wsp2Ivgw2iDqEihatc=;
	b=tburQjA9nME2bnM/uFfxSc1ssQL8ysavQ90gBBTvs9cwwtCrzPTg3q8o92fx55qf
	3k2Rq04XlQPXwjk1tYtTK4Yoeet68St6iuKxEtTahS5+rUQL4KNAsJzRO4Nnd5Hy4fm
	Dls6iAionScmHQlP9aQWR8rq9foFZcxwekmPT2PI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=zh4gjftm6etwoq6afzugpky45synznly; d=amazonses.com; t=1795082989;
	h=From:To:Cc:Subject:Message-ID:Content-Transfer-Encoding:Date:MIME-Version:Content-Type:Feedback-ID;
	bh=ErlkRxmFQecr5Uue/oFTaTuv9wsp2Ivgw2iDqEihatc=;
	b=a4ytP4tz7PPcUdt8G3ZZI0qo0usvyWHNfpvJ6h8OlI5HgiIdDGes7K79il9JavXw
	Ir94wFikDDclmwtn5T4Vru9yOrTxrwq3SpSuKz82ww5F0RFMnQ3dnBfPgJgiPSvrUTr
	zEukJ9ObgHG1Gk0WvigQBu7TNFIhL9zs4A1OAPE4=
User-Agent: Mozilla Thunderbird
From: Jiekai He <i@seaslug.moe>
To: robin.clark@oss.qualcomm.com, lumag@kernel.org
Cc: abhinav.kumar@linux.dev, jesszhan0024@gmail.com, sean@poorly.run, 
	marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Subject: drm/msm/dsi: LANE_CFG1 hardcoded to 0x84 on a 3-lane C-PHY panel
 (7nm PHY, SM8250)
Message-ID: <010601a1f348aca6-cb9be5e6-dcc4-4a7a-878c-006ed1cb9079-000000@ap-northeast-1.amazonses.com>
Content-Transfer-Encoding: 7bit
Date: Thu, 19 Nov 2026 10:09:48 +0000
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Feedback-ID: :1.ap-northeast-1.ZNuWYJTX3AC0+KBOptCLUmfpt7SHI3IHQOkB5LcUBhBP6cY5WSpWElQ2N5/Rm+HvriE3mnDhS+CVg02tsA3KAKkClMNixvejJkY0vVdjLtRJQuD2EBZHHHT1rD84raItQTVO4CxeNwLsHKoTx4hYfcdB/UVTn0LeTis7osgztBXJRrMsmYLNe50eLAKwP82x:1.ap-northeast-1.tL27A1JIpKR2Y51a8BkHZBekDcSR82jwOhKrSwgRw2U=:AmazonSES
X-SES-Outgoing: 2026.11.19-23.251.234.56

Hi all,

I am bringing up mainline on a Lenovo Legion Y700 Gen1 (TB-9707F, SM8250).
Its panel is a Novatek NT36523 on a 3-lane C-PHY link, dual DSI, and the
PHY driver is dsi_phy_7nm.c. I would like to ask about the hardcoded
LANE_CFG1 value in dsi_7nm_phy_enable().

What I actually know is one number: on this board, LANE_CFG1 = 0x84 leaves
the panel dark, and 0x04 makes it display. Everything below is context for
that single observation, not an argument for what the value should be.

Method: to read what the bootloader leaves behind I boot with no display
driver loaded (msm never binds) and read the DSI/PHY registers through
/dev/mem, so the kernel has not touched them. Everything else below is a
normal boot with DRM_MSM built in and the panel driver present.

Observations on this board:

  1. Bootloader baseline, panel displaying, no Linux display driver:
     LANE_CFG1 = 0x04, LANE_ST0 = 0x17, LANE_ST1 = 0x17 (both PHYs).

  2. mainline as-is (0x84): LANE_CFG1 = 0x84, LANE_ST0/LANE_ST1 = 0x1f.
     The panel does not display.

  3. Writing 0x04 instead (selected by phy->cphy_mode, D-PHY left at 0x84)
     makes the PHY registers match the bootloader baseline exactly --
     0x04 / 0x17 / 0x17 on both PHYs -- and the panel displays correctly
     at 1600x2560.

  4. Reference point: a Lenovo TB321FU, a different 3-lane C-PHY device,
     runs with the stock 0x84 and displays fine. That comes from an
     unofficial experimental port (github.com/enij90/armada-tb321fu), which
     its author marks as unsupported by the Armada project. I have not been
     able to check that device's registers myself, so all I can say is that
     the same code path does not break that board.

                  LANE_CFG1 (0x038)  LANE_ST0 (0x148)  LANE_ST1 (0x14c)
  bootloader             0x04              0x17              0x17
  mainline (0x84)        0x84              0x1f              0x1f
  mainline (0x04)        0x04              0x17              0x17
  TB321FU (port)         0x84              --                --

For context, this board needs a handful of other DSI changes to come up
(command DMA / read-command path, video mode start ordering, the dispcc
MDP clock source, the MDSS reset). Those are constant across the comparison
above: only the LANE_CFG1 writel changes between the two boots that differ.

Questions:

  - LANE_CFG1 is written as 0x84 in both dsi_phy_10nm.c and dsi_phy_7nm.c,
    with a "TODO: we need to calculate this" comment, and it traces back to
    dsi_phy_10nm.c in 2018. Is 0x84 intended as a 4-lane D-PHY default that
    also happens to work for C-PHY, or is it expected to be independent of
    the lane configuration?

  - Would deriving LANE_CFG1 from the per-SoC cfg table, rather than from a
    constant in the shared enable function, be a reasonable direction? The
    2021 C-PHY series left 0x21/0x84 untouched, and at least one other
    3-lane C-PHY device appears fine with 0x84, so on that hardware the
    value is either correct or has no effect -- I cannot tell which.

  - dsi_phy_hw_v4_0_lane_settings() still carries "TODO: Support all lane
    swap configs" and only enables LPRX/CDRX for physical lane 0. I may be
    misreading the scope of that TODO, but is LANE_CFG1 part of the same
    unfinished work?

  - The register database added in 2024 lists reg32 0x00034 as LANE_CFG0 and
    0x00038 as LANE_CFG1, but I found no field layout for either. Is there
    any public description of the bit fields, or a known reason why the
    value is a constant rather than derived from a lane map?

Full register dumps for all four DSI/PHY instances available on request.

Disclosure: I am not a native English speaker; the wording of this message
was improved with the help of an AI assistant. Every register reading, every
build and every test was done by me on hardware I own, and the observations
and conclusions are mine.

Please keep me in Cc -- I am not subscribed to these lists.

Thanks,
Jiekai He
