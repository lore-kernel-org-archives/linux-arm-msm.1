Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4106C4FD27D
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 16:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792166938; cv=none; b=pGkvw8c8Oq0+pNA3t+MyHWlfHhmBr2KR8pFWXoe4qMOfahaBY+NzCXq1sDF0SwCqbqlN9EwPB1pp6jSvbOxxZ1MTWn4OX6XzuZIhmae4n81aH8PNLiyBDlM+JXYi8DHtmiVC45EU+bJqCHSBcF77k7vLzbrUBx+ejfJu8jmehZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792166938; c=relaxed/simple;
	bh=n1Dj36+CCyvzyVqupK5U7F0BlEQjzHPDpXfS7N5ssjs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uTKEA5tGvDpyd8wXheHQ2Omspq7wASe/OcXFhjDHuvyHeSu5E/RtMpp9HweLZe1WAUOviOiPZI+INAFYTJEy1SUGqtjFztHfWR15sDM00Nzp/am+tSJcSUXamxQtY6OzL0qTeB4SYsd3ywvdoK0CGZlCFrosJs2LLHlIa3dgNVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=plBJ3L2c; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="plBJ3L2c"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48e04773687so78663f8f.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 09:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792166935; x=1792771735; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y3yD2VSIymN6B+DlBxpDWOb8du1EZz/KqBX+LpXERvI=;
        b=plBJ3L2cKz9ck7x8jQY/AJnAoCNaJpqUeraxps9+iq8TyggaQSor+T41+rIo2UpUbl
         LFzrQ4OwkVQ9X+mAVjoQahekWOgSAHpElKluF9sEiB0Qk4Cr0l6eifAgaSLjRpLsDuYs
         alPjoHIIC2dEpRPfm3fNtPpXL50C9Jn/xrZj6A7HqsrZEszNd7UvPifLaoB7JlQj4eMz
         FcNYmQK2hphreYd5h4ecCojoxYF6ScjWYHEFzXuLj2a4M2vUlXB4uLkEI/gya7NF4ugw
         Oif8oM1Efal/FbnD/SMmEs1UaX2s1Kj+lSgViTuZVM546ORqVIITcjuSPRbuLFmvcTx1
         WTpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792166935; x=1792771735;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y3yD2VSIymN6B+DlBxpDWOb8du1EZz/KqBX+LpXERvI=;
        b=iCwfI2cYm38avXcfvzLQ8Hi4OOceEmuOenHTchCG05w2cQGfEA+dJWoFAnrNsa6Atz
         QRQ2ICBnovQIr4L2nh0easo7PX05I21VRqOZB7KhwXobvPyGuk+p9wXg71p5PrN0sTeI
         3F/IV3sOVHBKeHz7IO1+38VVvJC+0o3uSrpeKtm6Nz3sCYlyRxXZMFnkluMPeokhny6U
         +zTolgXYl+Qce8ZYeQimQwqIQh9Juq3fWHrfj2aSqkutDKZ7MreiLHk8xJmPcY/Wa2LK
         kEcaRK92RR7lBAZC/rkZL3+zwQ7xVhQWdVc1KUjMQHf9nuEUK3UmGkhcxSJI4Zj4LP4f
         Qu0Q==
X-Forwarded-Encrypted: i=1; AKwUvBxJ7AzNPeQwJ/MRYSSug97D8AqZj34dYCMFCNnKMhVNzBGKf3SWRIhZoSsqKr6iQPY8ZuxLgR39BspEXVi4@vger.kernel.org
X-Gm-Message-State: AFq9FYIZjRRJGaz0FuyxQCvIiX3LCpyEAMKEAh4OSVPeDWfJ6uRyCIJS
	cK5c0W5cRMCdhNFbXSPF4F7KHSFThQGPz9z6RG2SaXrvlsLQLXmB0Sa8
X-Gm-Gg: AYBFou38KpOimufpOb7pfUboiUdKYgvAKwfWAUN7cJCLL32VozUPryIzuraqgH4euv1
	DkxvV86YbOi+wnczs+c8tdvPt11TfATQQW3kkmdRDieVUb28tvxauUDS6umIQl/ItuEQYl1thLy
	gRzwgNRGeRnxwQMYRfzMH6LiLDpDs/57cJa+Jk3RlW1lX3N1FFp3CH2eUmSdTbqC//z/KvWCI2q
	7dgzGXvX/LAc+97qGvd4LoU0n5K+1dJapPHBpLWMZWxLgHK9xMAIY1l/kw+o6L/CYXE9Vrz4I67
	Prckj7+2lvrgge1frU+sUgaCbDdNBMULo6qHU2DVC3uDI+kGXP/yo9nkJuYAnZTWeXExtjxrOJj
	eCWf7OqrB2A/VuHJXtvgRJR9Gd6gwP++smxwnod9QvOPPVlSm+E29G0dGkfXq70VrLonatN1qeW
	QCPLrNpRsIJEFRX9228DvmJMvsc43at4HcJZHgRS5fkoHJHyD9cxePGPvAg+qyYUgUnvCanlyuU
	0A0qJvokOSA72a/DZg4AeeUKncpIu6gdhGIBlPTuyk/yqaAGZijjHHUfE3xiNpq6jtuIY7lqipr
	7R2uRO4=
X-Received: by 2002:adf:f491:0:b0:488:7d08:edbc with SMTP id ffacd0b85a97d-48e07bc120cmr65033f8f.24.1792166935169;
        Fri, 16 Oct 2026 09:08:55 -0700 (PDT)
Received: from SP11X1e.cable.virginm.net (cpc99340-croy26-2-0-cust244.19-2.cable.virginm.net. [80.193.62.245])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd471b06sm6766200f8f.5.2026.10.16.09.08.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 09:08:54 -0700 (PDT)
From: George Neacsu <geocausa@gmail.com>
To: Bryan O'Donoghue <bod@kernel.org>
Cc: Sergey Lebedev <lsa.uz@pm.me>,
	Andre Gilerson <andre.gilerson@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	German Pablo Lindo <germanpapulindez@gmail.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 2/2] media: i2c: imx681: Add C-PHY support
Date: Fri, 16 Oct 2026 17:08:53 +0100
Message-ID: <20261016160853.193378-1-geocausa@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <11f1a19d-7d57-497f-826e-901f9f88b99b@kernel.org>
References: <20261015-imx681-x1e-v1-0-fd22f5f3b0c5@gmail.com> <20261015-imx681-x1e-v1-2-fd22f5f3b0c5@gmail.com> <11f1a19d-7d57-497f-826e-901f9f88b99b@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Bryan,

The values come from two places on this machine: the Windows sensor
file, and a kernel debugger attached to Windows while it streamed. They
were then checked against the CCS definitions and on Linux. In detail:

1. The Windows sensor file. The Windows install on this Surface Pro 11
   has a Qualcomm sensor module file for the IMX681 (SONY0681). A script
   here parses its register tables: an init table of 364 writes and six
   per-mode tables of 68 writes. Nothing from the file is
   redistributed; only register values are used.

2. Windows observed live. With a second machine as kernel debugger, I
   set a breakpoint in the Windows front sensor driver just before it
   applies the mode table, started the stock Windows Camera app, and
   dumped the 68 writes it sent. They match the file's 3840x2160 30 fps
   mode exactly. That live table includes

     0x0114 = 0x00 (CSI_LANE_MODE),
     0x0306/0x0307 = 225, 0x030d = 3, 0x030e/0x030f = 375,
     line length 6752, frame length 3554.

   In separate debugger sessions I read the CSIPHY2 registers while
   Windows streamed. The receiver was in C-PHY mode, and its settings
   match Qualcomm's GPL 2.5 Gsps C-PHY table (121 registers, compared
   from two snapshots).

   CSI_SIGNALING_MODE = 0x03 is in the init table. I have it from the
   file, but I did not catch Windows writing it live.

3. Why 0x03 means C-PHY. 0x0111 is CSI_SIGNALING_MODE and 0x0114
   CSI_LANE_MODE in the MIPI CCS register map, as in
   drivers/media/i2c/ccs/ccs-regs.h: 2 is CSI-2 D-PHY, 3 is CSI-2 C-PHY
   (0 and 1 are the old CCP2 modes), and the lane mode is the lane or
   trio count minus one. This agrees with the hardware: Sergey reads
   back 0x02 and 0x01 on the Intel model while streaming two D-PHY
   lanes; the Windows receiver here runs C-PHY on one trio; and under
   Linux, with 0x03 and 0x00, the sensor streams into the PHY in C-PHY
   mode.

4. The 2.4 Gsym/s is calculated, not measured: 19.2 MHz / 3 * 375 from
   the OP PLL values Windows writes. The receiver does not report the
   rate, and it locks over a wide range of settle counts, so a working
   capture does not prove the exact value. It does fall in the 2.5 Gsps
   bin that Windows programs into the receiver. Likewise,
   6752 * 3554 * 30 = 719.9 MHz matches v8's pixel rate, and the pixel
   PLL (225) is the one v8 already writes.

In the next version the commit message will say which values come from
the live Windows capture, which come only from the sensor file, which
are calculated, and what was checked on Linux. The extraction and
capture process will also be written up in the project repository and
linked. I will also read the CCS capability register 0x1602 (bit 3 =
C-PHY) here, and Sergey may be able to read it on the Intel model.

Thanks,
George
