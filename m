Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B2E946C4DD
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Oct 2026 16:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791302601; cv=none; b=vEsFov4A0mZa1nVByrWS7tQpAf9b4FCt0zWNJLPUuPsSxW0LPMmBzlCcb5/c3zz0Kr/0VaxCiivh93IaUvZghtqs3HgeWh2/6NXRG9oACbWowRQrDHUFczOLxBsJ37B/Z4UrgNB8QINstOGT7j1zfHEYf503dCcAoZDbCVlHxb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791302601; c=relaxed/simple;
	bh=tRVWPINyjJdLoLNnFQLSCFJ69aEwcAX1O7+rRp+bsrI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QCjVrzGhmyjDTFSI7FOdWFpDpFbDpujdBuhyQ1HvJ1HYsq7LHOqWTL070E5rW2ij2KXNlOnwp+K/+wbLiOm+/3sznVVwi+sa+Et/sEULEpif6NpJZd7z0NDHVGuqpI2UcRrR7oCilOz0FMb9QXBHLmCjsFRuocZmCtPcSEMavmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ItV+2PGU; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ItV+2PGU"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6afbc363efeso3741354a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Oct 2026 09:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791302598; x=1791907398; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tRVWPINyjJdLoLNnFQLSCFJ69aEwcAX1O7+rRp+bsrI=;
        b=ItV+2PGUXWlL9Fs0o/lVgpThK3lCIS/pSY1ob71U5KrNWhyU87rAAJooMXrVHdkyxT
         ySLhJGSgKllAG+USLOv5KToriJBSO/zusK+cYpBtIK4R2yQ/Clskv3Fs9PX9C0SHRXFn
         pGdSrqtjcqRmYtI4XK6F1Zu8gCJvw2wP59jiKD7P3idqlgNf7sOjYjlAX2eZoh2Hq9l2
         fyvXaUj1AUv+y/8ggFjFrJy/Cx0iITtlv0JgSqfcSo1uaIxl5fS6QYbfzNJTp/JREORB
         10q2k9RzOzgfcMzGwPyulKaW3jic8LuLvuvg5Meya/XRO40HzZqFGpxLNdnxolDVw7N1
         I8Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791302598; x=1791907398;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tRVWPINyjJdLoLNnFQLSCFJ69aEwcAX1O7+rRp+bsrI=;
        b=tDVLjuWfztD0YkeCOhmDPdV54yU8flMkHf989pgEB5V3wEMEu7MuM4oY9Vbc++rmri
         tuoK1IDE43ktYFPvZu98LY6Pef8QsrTW/HgJs3FCYulTamZv1qsYQ/3AGntgc7ejgY8Z
         GPfTuXxibXTdaIet4EaCSMfp9Jwp5d7JphazFMt/bw3iKh7CW6KXzJfMio5BOQT2x1Do
         Nr5Qqp/RO/l21T9PHRwBdcY+dk8FNl9CLtsbdAJTFl3dRVF3XPU5WyLrcy6QCFsGGNCQ
         YA3kf1eslafTP5JlIELgsL8sNUFQHfP2HG0jL67MmPhxD5mTHtkqyM3M6UapDBBbs1jY
         Esog==
X-Forwarded-Encrypted: i=1; AKwUvBzuiepIizVqeQxYjitewMKZFgMBrnyDDyyPLi/RMm+9IiF6wlIzX5UYyeAMRat99jBdTapw4ei04ZZ5KrGh@vger.kernel.org
X-Gm-Message-State: AFq9FYJrohLag0Y0rVuNro/07PaaovAQkYg/F2p2HHp851O+HT6aFzQe
	WY9zJDPtvUCnchM7VPdt4UtqgNdKNvayVIYhG4qtFwDuS1eZGqZyJpXg
X-Gm-Gg: AYBFou0mU0ipfs6WYgmz2R1dMAG8uUx0gqZzdquiZnIpW2yy6QszlunVJiT1MuYUgUu
	nSnyBzvFVpq2UhPNgWXI4jHXTOpeUrIXObJAE9zoSHSHPI6pNX15rQk9DuummE4QdzkFPXOyhlX
	6a1TXBh4pGjb6inFzvYGRwZ501oKJrVL1zTW8/fzhWTU61qizeDBTFk8BNAuG2tiuJDcMX/rDUh
	IJq79lfvcbQ23IL6sTSTAcFBk42Lfh7dLeUuqD21BFumZexOT72/Fr1GNwRtV/ao2tBT2IiLBtS
	LX716n8gxNCYvZTZapJ0P03Lx7ey1jrUutiGUGAtz2qYbcXj4Cz1r3vs8vTjDk7MUXfutqKhJVz
	vtxkF5cs89+el78vMpuxsBaU0C5VuX06ZPb1Rc1S2PrH48j5oT45Su1rQbDiXLD3TmL7cRwWxrg
	NmSo+HQQySm1v0JAi7QrJorxdmD1OBkhCKPHZalSnhAOXsrlWuTbXHK7Z7L6cUUMP1lVAeMxbOy
	YEeVKlqEbi+Yew08PwX+Vo7XdmlC6kfVnKXp1YS4iYDGd+3DLkBtWNt5tmamyKYGoOr23e/HHFO
	AmNTzJcgI1XM5Lg406dgv3LME26YtVpGuA==
X-Received: by 2002:a05:6402:24c7:b0:6ac:9a44:d3fd with SMTP id 4fb4d7f45d1cf-6afad8eb9bbmr8191161a12.16.1791302598082;
        Tue, 06 Oct 2026 09:03:18 -0700 (PDT)
Received: from localhost.localdomain (94-255-221-162.cust.bredband2.com. [94.255.221.162])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6afb021a5e9sm5040641a12.29.2026.10.06.09.03.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 09:03:17 -0700 (PDT)
From: Yongzhao Chen <yongzhao.derek@gmail.com>
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v2] net: phy: qca83xx: read resolved QCA8337 link status
Date: Tue,  6 Oct 2026 18:03:04 +0200
Message-ID: <20261006160304.1563-1-yongzhao.derek@gmail.com>
X-Mailer: git-send-email 2.45.2.windows.1
In-Reply-To: <179113606534.434549.7144959528343737840@kernel.org>
References: <20261003173210.1235-1-yongzhao.derek@gmail.com> <179113606534.434549.7144959528343737840@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thanks for the review. I have prepared v3 with the following changes.

For the idle error counter, QCA8337 data sheet 80-Y0619-3 Rev. D,
Table 5-352, page 325 confirms that reads consume the count. My MDIO
model reproduces the loss with v2. The revision keeps
genphy_read_status(), so a steady autonegotiated link no longer causes
the extra MII_STAT1000 read. Reads on link transitions remain as in
the generic path.

For MSFAIL, page 324 confirms that the bit clears on read. The model
reproduces the reported difference when a one-shot fault and AN complete
are visible together. I have not established whether QCA8337 can reach
that combination on hardware. Keeping genphy_read_status() restores
the master/slave-before-LPA order and the generic error handling.

For MDI-X control, I confirmed that QCA8337 has no configuration path
that writes the crossover setting. The revision clears mdix_ctrl to
ETH_TP_MDI_INVALID after each successful status read, including steady
polls, while retaining the MDI-X status report. It does not add a
configuration callback or change the generic ethtool setter.

The revised model checks and arm64 W=1 object build pass. v3 has not
been tested on hardware. I will send it separately.

Thanks,
Yongzhao Chen

pw-bot: cr
