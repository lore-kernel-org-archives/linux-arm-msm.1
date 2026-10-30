Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793377251;
	b=nn7+OTsrAMTilvxpTbGgyFx+QowNFvKqAf80LuDXXvzF9JWq44Z1n10OumZMudCWD8N6
	 Tlw9Lo5VEzqr2g/bKTotwBzHEALkh/Y4iXHvEbFcHaotOHnWfZpawDDOxLNVZNq6AAd5P
	 WB6J9Mq731klAqxioV+N38Gsj9fAoiXRCjO6w+2DvhhhlGMxQFE5ZWUwNEY2cPNBzltKb
	 MQFKCB9bAivYzQ01KArwIxRlxTaJwGFxWZAXUXZWpegJVGIny+18LfB4nJVyivAIpbdmy
	 ULJgWKN2EkwSZJBIaQC2Q1qPU9471+L2QXZN+IO6ENj+gjfWkUdmHni7fSPpgvgEMwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793377251;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Y0qxUp8kBfnr/dk+xkgp/Wes9AkSXjPM3A7y83JMIdo=;
	b=2tTqdfF1YuIB3nkbvM1PloncYyDqkMeftfc5o8eUYDaXhOZcdDwaQ48rAwhYAHyFyjYu
	 7kuhkuYQ1XuWV1dEwMVNzjb+gbs5wUpu6yF+fRwJw1S/d9eZ/o+nOmqKp8DXJG9P1XAX0
	 JaKIJlTIEcriR3WLF49R3Apn5gnqx9+t7mx/tBrtTF7IOEn7HC1GWIN9jCkn0dQHrFdJ3
	 kqLQQvH0YrXK5YY7zuFcokPiNoEODf0vVW+MIFHpcKhzSPnvwpC4mZtrtsJLumGcdqigx
	 YSVYiLVleaxNkObhes5ZIetxtQISjWpru2cHRt/smTizLDdjrWjbXbnJiM8BQBbamlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EBkGlNai;
	arc=none smtp.remote-ip=209.85.161.47
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EB25606A31D
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 16:20:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9EB25606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EBkGlNai
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-705cb6ceebaso566484eaf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 09:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793377249; x=1793982049; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y0qxUp8kBfnr/dk+xkgp/Wes9AkSXjPM3A7y83JMIdo=;
        b=EBkGlNaim3mLCi983A5zighQ7n43aKODY1AR6Lr45eP1ck471vLzW2w/YCxaGnMuy7
         iLBif6UY++eM+PkLfUM5DNpAnmlVxIBdIjy3gN9bBzV6vl4NWVG15OuAO377oYVddtDl
         98QpQv5okBGxWw/anzYcaIO2q5SLbuVscOLt9MV9VaL1nk7SZ6nF6+6P9mRJ4tUDrSX6
         hjuVGITTZtQRqxcLVDKMua0JxmkV2OOzrLZTcHUarxoM/Pb+4y2mCY7IN/E9s6U28W49
         ZGOnAJ45TGvngkBGv4pj2UoLRuCMK+Hg7HPfAsF9mrLlQySdF3IZUTshJBClp1nMuT/q
         ZEoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793377249; x=1793982049;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y0qxUp8kBfnr/dk+xkgp/Wes9AkSXjPM3A7y83JMIdo=;
        b=YQY5Pmtb/woSALooWSB4knrppdgaPGetwPPmtZb5/f+i8oiJVSSxPnSQwa0QSYYk7N
         7nXE+qZisu/o2A1wwbrNzxM18Vjf9briwZ+6bdswsTe+QAWQBS8sAnm2P+S7hFuXGYwi
         A2r6ObMHBVPfG7Q4Lu+hSR5Ku3faD9qQG+psjlL0MQbxuvdeiQUjmt+/LvtxjvSe4sSJ
         zQK2usfKkSxr/Z/i6IKk4FUUT1keVnSt1lQG1xJ5Nlk/fnxRMa+I9Pad/AcQFPt5pL3I
         4HrTlEzQFjZDwFHGZJumS1hRm4nEs7o/ChtEs1Cp+8AH8BFrb31bXOMKdjJRErMeHCdo
         jxAw==
X-Forwarded-Encrypted: i=1; AKwUvBzeG9+v0Ddm8L13VI8eYjMYAfNMJuKsnv+7CUceBuCwOmR/mCCQwV2EwF5Ep2MjhVb0/SefV5NHZezdl24e@vger.kernel.org
X-Gm-Message-State: AFq9FYJoxdj2Uw+W715QC9i8pbVuvMG12ehFVmMjj+u5ETvYyl6IGCvD
	sK1/wJuhBxjkcAGnmbKcVzVoW+RmjzlH1EkVgn6E7Z21wYxZjbATbWQd
X-Gm-Gg: AYBFou103MTr9RhOOHNCaZWRgpwKUUZc+qLncdEM7MxzpZ5UHQygx8Xv0iuaJ9xHKKx
	vSekSgxWwqA5qellYuJsWKEB2srv6SCYNIamC9Zh84fkkauiuPAOqHrtxJBZnvyDsNLdzbloF0A
	xhwlSQhuyjiddFJ9rUEMdLKXgIm/0y3dz4zcj90SGsz72cCBpbpmRPr0Mb+TW3rKwIUIaPwPkIz
	fQ67eVGcK7dEY2/OXwjcXUrRcUaOcygUWTQlsUO3+h50lrSc+4YJYXlivJj9fOi3PzfXJs5dqpn
	OO0tM7bz7Yl9hwsBjiXvpsF/YUeghxZHky6qdpWj4uGL51OrtVHwb9rNbMzuzouqRpkrnSxr7g3
	+RSYQycDkPQxThtdBQFO6Ghsu4NIzJGxg3/5GhS7KbT83+bsjJy7rEs/8payzNgIraRnNycJc5h
	krR0k/NsCM+sNDs6PHak/c+1KnKhCguSYt4BGe1lL7H8psTJaSmhh1k+hhv0PMNZF1ib1tMK7nt
	SnmElmIzevhDwbFQmYA4nXXEVF7Cy7xKQvXHMaRzrh3kP732ksTYAG1mORZkzzWEC1i+XnsLu1m
	4Y9BrbRV3Ogmwtn8pGFi+j33rxkXypy1oQ7je7zdqtvTejoJAp+8A+EXNw4Z/rdo6Jt5yNZwxNJ
	gQZox9KCeDtF8XSZHxny0noJu7GqfXYs2cO8wG5B4B0L8ter8R/hlVmpqy8CI3REuBOYCy8+/Cv
	x/qIWiUH/OSM2Hkb8=
X-Received: by 2002:a05:6820:7082:10b0:70d:9d05:dbf with SMTP id 006d021491bc7-714f27fe3cemr1142319eaf.90.1793377249547;
        Fri, 30 Oct 2026 09:20:49 -0700 (PDT)
Received: from brev-9gdpyq8lp.ap-south-1.compute.internal (ec2-3-110-210-194.ap-south-1.compute.amazonaws.com. [3.110.210.194])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a92167b03csm322536fac.2.2026.10.30.09.20.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 09:20:48 -0700 (PDT)
From: Samarth Narang <samarth.colleges@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Han Xu <han.xu@nxp.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Richard Weinberger <richard@nod.at>,
	linux-mtd@lists.infradead.org,
	imx@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Samarth Narang <samarth.colleges@gmail.com>
Subject: [PATCH v2 0/6] mtd: nand: stop DMA before unmapping on error and timeout paths
Date: Fri, 30 Oct 2026 16:20:35 +0000
Message-Id: <20261030162041.2998170-1-samarth.colleges@gmail.com>
X-Mailer: git-send-email 2.34.1
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

This series addresses DMA lifecycle issues in six NAND drivers where
error or timeout paths may unmap buffers before the associated DMA
transfers have stopped. Some paths do not terminate the outstanding
transfers, while others use dmaengine_terminate_all(), which does not
guarantee that the channel has stopped before returning. The patches use
dmaengine_terminate_sync() to ensure that DMA has stopped before
releasing the mappings, and all affected functions already run in a
context where sleeping is permitted.

These issues were identified by a research static analyzer for DMA
lifecycle ordering and have not been validated on hardware. The patches
have only been compile-tested on arm64 with W=1.

Changes in v2:
- Combined the previously submitted patches into a single series, as
  requested by Miquel, and included three additional drivers with
  similar issues (omap2, marvell, and sh_flctl).
- Removed the code comment from the gpmi patch.
- Left qpic_common and stm32_fmc2 unchanged from their earlier
  submissions.

Two questions remain for the qpic_common patch. The BAM driver warns
that resetting a pipe while the attached engine is still active may
cause a fatal error, so it is unclear whether the NAND controller must
be stopped or reset before terminating the DMA channels. The success
path also assumes that completion of the final command descriptor
guarantees completion of the RX data descriptor, which may need
confirmation from the hardware maintainers.

v1:
https://lore.kernel.org/all/20261030143945.2923554-1-samarth.colleges@gmail.com/
https://lore.kernel.org/all/20261030150929.2944717-1-samarth.colleges@gmail.com/
https://lore.kernel.org/all/20261030150646.2942368-1-samarth.colleges@gmail.com/
https://lore.kernel.org/all/20261030151843.2953269-1-samarth.colleges@gmail.com/

Samarth Narang (6):
  mtd: rawnand: gpmi: terminate the DMA chain on completion timeout
  mtd: nand: qpic_common: terminate DMA channels on transfer timeout
  mtd: rawnand: stm32_fmc2: retire data DMA before unmapping on errors
  mtd: rawnand: omap2: terminate DMA when prefetch cannot be enabled
  mtd: rawnand: marvell: stop DMA before unmapping on timeout
  mtd: rawnand: sh_flctl: use dmaengine_terminate_sync() on DMA timeout

 drivers/mtd/nand/qpic_common.c             | 11 +++++++++--
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c |  1 +
 drivers/mtd/nand/raw/marvell_nand.c        |  9 +++++----
 drivers/mtd/nand/raw/omap2.c               |  4 +++-
 drivers/mtd/nand/raw/sh_flctl.c            |  2 +-
 drivers/mtd/nand/raw/stm32_fmc2_nand.c     | 13 ++++++++-----
 6 files changed, 27 insertions(+), 13 deletions(-)

base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
-- 
2.34.1
