Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793407662;
	b=oJ2NPSIFOi8zabBlvjY+CHvSNvFnoCJmYno9w/kRGChbIH7abArUiqNBb03sE8tVBowa
	 IpZOkTauH9Yhrj0RYBNgRFLX7XEoub0ZfCtTvXTNKEF9gOy2cA/4vyWjJbtirv27gciv2
	 HQGfkfDu93x0+XJo+0RwjMzKKulANnkC5T93HUdk/BlO8SCUlJ1Xew8JHDe+9p1Z1yF65
	 1oybEkwSN6xegWCyp1A3zvfSTvKK3QvyvfZLCn9ipvkR4GGogx/1T9/lPnjUhBGhlAQh8
	 Fik96UGc5rjO2oJ322fBQLs4ySLKpQW4WmAQu5nxPBfC6WE/EQRB8j4lrJQM+H+0aqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793407662;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=268LSzP9pfFwdbgVDxMqdS0o6I6QpSICZ5YPTlGbOXk=;
	b=UCy0AQby7mv8Vfgq5GiOfLh48rU71YJRp5TYNutn99SAMrUo77EbudMOJNOVrwBWTu7K
	 C6mNCuspGHc9MMAfVrvpEwgSBX3WOQwSZZvdMSyGl8GvSgggRkxU2dzsr9g6hNjC1WMOc
	 mKAPSiYIifDmeApYnASKT2MOGPQf08nz6gJ2PUEpGzOuJxu/Y7R27T3nNcz/e0dOz3eL8
	 hqqKaev9ZOz9E66nqiD0RilS2ZVN4v0BE2extVutwQ/9e+N/dW1LKmsGLndOTKy6xQh47
	 96/Q2NicuuCu/ElLK2EEEDsoDd45/mA/ClBqtZ87ls0vfJ6OT/lbnx+B8fW4kN3gesA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IJRDK+mR;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B262606A31D
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 00:47:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B262606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IJRDK+mR
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-353804b591eso2014630eec.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 17:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793407662; x=1794012462; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=268LSzP9pfFwdbgVDxMqdS0o6I6QpSICZ5YPTlGbOXk=;
        b=IJRDK+mRMeVNqm4z8zkrrkm0GNNjwiXPX2+viPyOK8zgiaefP8s19h7cOcU2VEcWoU
         PqS1XRCbjdYh8/g0znLNQU0essI/+qfLqU2xlyBU4DHp3tNzHFcvrLS2+rOiIVaJCWem
         kEaYuHo6CAuPnj+kPUfjxxsg/uCUZVeAq6n1gCrgRG2swHABFX5Ao65TGHmfT1wmdlg8
         x1WzbkGgr50xX0yR2P3DEtnPnCv35Knv63DNLVKWeUKLGcj6G31LaDCsMW5PoGfP+lrS
         6/DtObogIU9qrRnwiZhPWD0X3MwiZ+ZazfKSBeAVBoGiXe3giW9oRw/gjKDHqMDTKgir
         udqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793407662; x=1794012462;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=268LSzP9pfFwdbgVDxMqdS0o6I6QpSICZ5YPTlGbOXk=;
        b=g4b1Q7+rRDTAmPTxmEk6UZJDz7B6+svaYbK4OzecP7eO6Aow1fBwTbSJoDq0kiyW6d
         ys5P/t60A87+n9sIgD44Ju6g3Wk0txbn/LekuSr5SqnweQNxmtn6RoX6pVVXirNBdWX4
         OocpLGMzIYZkJ9LomLmz7hIFmp1POqjltPX47QsERbVxj1OEZicELdIEPGaoY6s2bhgv
         UcGrxj1MDfLg5LHEX+tOqdNVDwFg2zuwGM141+HxG1It0Alhq/9gGeKJTVjBocaI8uue
         yIJ6C8crgawHTOVqawJDs/ibVgyZq73SR2HegvIZ4FWVmqFcMtIdC5e/Yxuk0YNwvMZj
         Qpng==
X-Forwarded-Encrypted: i=1; AKwUvBxmql8im9KRUK7FGRp9cZIs755kASSLv1xvnyhJxGe4Aiph8z/bX1iBxEK9agSxxE4ftYnmD1Ow32aIaEoI@vger.kernel.org
X-Gm-Message-State: AFq9FYL/HN6E3PA1kT/IG8RNX4nFyJXzTFgwNiBpVBcYZOq1UvPztrfD
	mGh+Xpx0NYVbW63IvIKhGn+LN6YWHQ57JvRWJZpEVTerpAtkQhZV4o10
X-Gm-Gg: AYBFou3BeAycn0UxCl290N95MxDy1JuJaGVbLnsc7cxkDy2YqiNT1qT3yE1YUkyJs+F
	YWyrM0p3mYQoWNG0OAPSrckKn6QlSxFin0aSNuC1HWzSrkMSb1uMC+rJoJd9PS6SaeyEIzt87Gv
	zXochEgSWVCvyTVtRMNMT8YkAGon9WWMemxdyhTS1m6zZ2GJ6X0P8DfaV6B/y1xiB0q2lQW34TQ
	XDCyyBTe07PLqH5HmSt4VFlzqHS2XAr2fITgo1BU+L+W8GPmVNZBSaHWz4L2LPI6ZqstGznLBG1
	qM61LNbbnmS5mF6Nq50BuWWS0PM3DRvkEasmBE6iDFaDjTjNyTeHj53uG4WtXiY7kew7mfg5s4j
	JKoi/CUXrNwL7gcSFhvIF/UDW2krR4WcGtKcWrfQedDeKpdE31Zad8F4UxxrVc94PdmV6U6K2J0
	xZZyGY8E53+eYxpvU5w4rlj61FE4JBZPVWlOEAJTmxE0Xr4xD8PvGwGiY/U94q6eYMukMlTDTxN
	6UuXm443OJI7SV3oVBpmmJVwh9pmJPAaerbcTuTLhxb4l4V3PejYDtO2lbN4xENVfevbbXXD8ul
	lw2yx1oJ7YGW4F17yj+z7E36fO70d5Oe9trycncbhZCQm9xMed9r+G70ndqnfjVEhKceaUW5dv8
	mKa8rUdsEK1dxoo5gYf7oD0ATWzEsBOUaavpgqiBP3xxCRcvkHpUEJhbTWvEasE6+EiUg2wNzfH
	YakOvbSI+yZ5Hs6Dc=
X-Received: by 2002:a05:7301:e105:b0:36a:15cb:30bf with SMTP id 5a478bee46e88-36a42345851mr5374853eec.13.1793407661421;
        Fri, 30 Oct 2026 17:47:41 -0700 (PDT)
Received: from brev-9gdpyq8lp.ap-south-1.compute.internal (ec2-3-110-210-194.ap-south-1.compute.amazonaws.com. [3.110.210.194])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a77c0dsm12703100eec.26.2026.10.30.17.47.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 17:47:41 -0700 (PDT)
From: Samarth Narang <samarth.colleges@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Samarth Narang <samarth.colleges@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Laxman Dewangan <ldewangan@nvidia.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-serial@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [BUG] serial: TX kfifo underflow when TCOFLUSH races with TX DMA (samsung, sprd, msm, pch_uart, tegra)
Date: Sat, 31 Oct 2026 00:47:33 +0000
Message-Id: <20261031004733.3345841-1-samarth.colleges@gmail.com>
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

Hi,

The TX FIFO underflow previously fixed in 8250 by 9e512eaaf8f4 ("serial:
8250: Fix fifo underflow on flush") and in qcom-geni by 452d6fa37ae9,
7ea38c49e717, and e3c04834ae1a appears to affect five other serial
drivers. The line numbers below refer to mainline at 83f32c773255.

uart_flush_buffer() resets the transmit kfifo under the port lock before
calling the driver's flush_buffer() callback. If a TX DMA transfer is
still active and the driver does not account for it during the flush,
its completion callback may subsequently call uart_xmit_advance() using
the byte count from the old transfer. This can advance kfifo->out past
kfifo->in, causing kfifo_len() to wrap and the driver to transmit stale
buffer contents. As shown in the 8250 fix, a subsequent close can then
wait in tty_wait_until_sent() until it times out. The issue may arise
when a large write is followed by TCFLSH(TCOFLUSH), or when the port is
closed while TX DMA is active.

Four drivers have no flush_buffer() callback and therefore do not stop
or account for outstanding TX DMA when the kfifo is reset:

1. samsung_tty: Neither s3c64xx_serial_ops (line 1679) nor
   apple_s5l_serial_ops (line 1700) implements flush_buffer(), while
   s3c24xx_serial_tx_dma_complete() advances the kfifo by
   tx_bytes_requested - residue (line 342) without checking whether a
   flush occurred.

2. sprd_serial: serial_sprd_ops (line 944) has no flush_buffer()
   callback, and sprd_complete_tx_dma() advances the kfifo by
   tx_dma.trans_len (line 276).

3. msm_serial: msm_uart_pops (line 1547) does not implement
   flush_buffer(), while msm_complete_tx_dma() advances by
   sg_dma_len(&dma->tx_sg) - residue (line 482). Its check for an
   already stopped transfer relies on tx_sg, which is not cleared by a
   flush.

4. pch_uart: pch_uart_ops (line 1518) has no flush_buffer() callback,
   and pch_dma_tx_complete() advances the kfifo using each scatterlist
   entry's sg_dma_len() (line 756) without holding the port lock.

The fifth driver, serial-tegra, implements tegra_uart_flush_buffer()
(lines 1272-1279), but only clears tx_bytes and calls
dmaengine_terminate_all(). Its completion callback calculates the
transferred byte count from tx_bytes_requested - residue (line 537)
before acquiring the port lock and advances the kfifo afterward (line
540), while tx_bytes_requested is left unchanged by the flush. Although
terminated descriptors do not invoke their callbacks, a completion
already running when the flush occurs, particularly one waiting to
acquire the port lock held by uart_flush_buffer(), may still advance the
reset kfifo. This is the same race addressed by 452d6fa37ae9.

The existing 8250 and qcom-geni fixes provide possible approaches, with
the former clearing the outstanding DMA byte count under the port lock
and the latter marking completions as stale during a flush. As discussed
in 7ea38c49e717, comparing the completion count against kfifo_len()
alone is insufficient.

These findings came from a research static analyzer that checks whether
uart_ops implementations using TX DMA provide flush handling that
accounts for outstanding transfers, followed by manual inspection of the
reported paths. None has been reproduced on hardware. The same analysis
found flush handling in the 8250 core, atmel, fsl_lpuart, imx, sh-sci,
and qcom-geni, while amba-pl011 is not affected because it advances the
kfifo when preparing a transfer rather than on completion.

I would be happy to prepare separate patches for the affected drivers if
the maintainers agree with the analysis.

Thanks,
Samarth
