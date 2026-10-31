Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793450360;
	b=Q9vXHJ8gidAbqAyP5QtGDI9RuWWTyxd1GmDrO5KmogNj12zFNIRFu8w/rS3park2ALMi
	 zMh51vFKtqM0bL5ESg3iRD86HfMIyuG2DeT4Nf5Z30HoLsVCdkCvBJCmnn529Edl08ccK
	 VOIb8OT8ipTSpS9IfROsUMIjpdw27ylap8KYB/bNDj/hvE4UTlPFjX8o75khTdDDJwpUR
	 DKU3RFiJyKbT3rSrnKypEC4MPEpc1QF3qfBXqYtpEQFHOzkvx1i9CHlQl/zGxZIfG9RoV
	 p3aNUaZyP5FrBQ+8hOF60OatrS3v/yOpJUjXsbMopCzMPMBuNc1eo4jnA39bKMt4oEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793450360;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=p+SP5aC6kFf2m6+Y0UAcy1XbuoZimqxQ+Qboov/RQdw=;
	b=2IPUwK9FlbQNK+kdejXXeWMMkR7oKNiK9sQ+jBbihuNYwvIEG4cNRD7egc5h2zV5LnNz
	 +7eakIzqL/VcqUrG457Dwx9Ktm6Dblyh4K5ltGWqVVzpeBVwzHiAlkCSUfUjRBxAGqVLD
	 ozOHgTWLmfbcr3Aoo1W3lLDEHohZYKzH/gXw0jxFARtnuwNNqOEfft+sjsOyzSa1W3edP
	 1uOHO4koAGCXBNHhecTgh1sh6flUO+OnOKXIhf+A6mX1aDygWAjIo+HTWufU3LCDVcA8i
	 C8DwTIqCpHSoHKTFMA59jBGB+hnHfYhS+W0eSAy57ytaeTKhT98OGsQzNyaTEHoT+Ow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xKL4FZYZ;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69855606A323
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 12:39:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69855606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xKL4FZYZ
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1aefd1bf74aso374055c88.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 05:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793450359; x=1794055159; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p+SP5aC6kFf2m6+Y0UAcy1XbuoZimqxQ+Qboov/RQdw=;
        b=xKL4FZYZxZ2DMFO63mud1fJJvL8ljHKd1cSzKueTBjZ5KWdT9ssOnP0v+oXC+Q0hZo
         Qs+PHJ9Klrp7eA+ZXpy9jf3Dvec5+bt97LOlRXjZ2Q/ZQk3duWOE8JWGvfSgl57vgWch
         JCwhFXX9MgJGW590FuwNWfZumZRtLkpFT5T7+6Bz4lAo+aIOdOUI37/Kc3CAmRyY4HcK
         W41yN4QDz1O5X8AHfcEF+5+xoVAARl8Hp+FsH+KuRBB/WuH0FK/KGowokkDV3UY6/ekT
         v7y6LWO5F42Vjer5ob4L76hFwBAGTlmtyimH5jt8uYFW8EL+iFHLnr9Tu8b/QEml5OWf
         mHPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793450359; x=1794055159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=p+SP5aC6kFf2m6+Y0UAcy1XbuoZimqxQ+Qboov/RQdw=;
        b=X4xJoF/OnWiPHfwZchKPVUc4FAuN80Qmaopu4Ptqhx3aSe7vEdIRZ1GGXSr9RZCk0C
         PXmKuruNMrJb+BITameU8Mqcyo5a7jjkmrr6Ztcsghq3VbVLP0GrpXlYmReOxeiOO2Eu
         4tDdnqICeLtpO9JH4K9YX9lo93z/ZlHyw8mRCc0DGfNEfWtKowYRxq8bCCzzoALgQVPY
         yiuMlOv5lKiSAHM04pHAnABwU0ed7PSeO3i4+xMDc5Xd5C4Pq1JTt/Y60dWIeT7s5mSe
         J1ylxPs2ck5yKncR4GVkd9tUa/cM60t+C40wnOvdfj7YclFRNiLAW+7qzThMNDsmWNDj
         CQVQ==
X-Forwarded-Encrypted: i=1; AKwUvByU6X4ef/r7EGF8aBi326AGuolmR1PCYlfqUYNpqhHHllS/69CHKUCCD6iZrovH6EaN2VqSU+Ru0OvW1gaf@vger.kernel.org
X-Gm-Message-State: AFq9FYJakw9o/fgtrdtHcGk4LRQPvxrv1zUlQY5f3NQ1M471KMJyyO/D
	LA6dcyc71tQE5Zp4Ebw9zZRU20y7gniysezV9pok2HpbYBEjss0rX/hQ
X-Gm-Gg: AYBFou0TDTRW9jgzrVrl/wlg6lyohHaEe/v3vORHxwoTPA8fkjGK1MBAaRb/z8PgXj5
	pQhbGBb4YqiXLsOLLYyRmnfT4Zx/qbh9755wNtb0eAmCcne2jWn9UsPEWtSjff1YBCd73A2Ukzo
	oIxxPmVlgMo13bA+uLUZq6KOWq3Mfs8Kclqdi4CLlW7jaOmeUNWamT8FEofwUlxAdb6eFmrgR3j
	tuVrwsmkE2rQRb6Y8dQF1C8rM9c5L/zV4+KAfJXpL4Rojdy8ep0O7qJEZWS9GNOXMJ0ziO+65nI
	SLx5LG9QXrhE4uxgK1t7mxWzroLRrnSP+/UU7niLG2cv4kwJqP5hprDFCNZzDvmj6xXyt5w93vp
	S3l3Lq6u9uKkLT3rQdGJ3G9Q4ilA+EulQJaHBhB2ZpiPsKfhBLNp6zsR6dtvRan/gTTgt8p+MYu
	ENJ68/xRkmdO/HtIIsRIP2TAfWz8Ph4CA5pdij9x2pKm2szxNDGbdaz5esZeHudNz6Yw7Nvvxkr
	Oi/fPyWB/3NqOi08iyZXxmdcY6S1RbYZwfi1ckiDFAOVky+f18u3aibU9tJ39MA/EQCFtldNB8t
	F2iMZ/+h9HDmfESCS5tzormjVf2r63qdqaNQG3kGzhPzICssxlQTKWcNZqdkx+F+WPSWh2DWs1e
	5aQXQvSHcbFV20wmwIAX2W8I+60HApWpCei1GXUlO8WV5fO9Ow9PJsdQhNzWpNpujbZMikQNJod
	VLO3JlA13fk9rY3Q==
X-Received: by 2002:a05:7022:f507:b0:1ab:90a8:87a2 with SMTP id a92af1059eb24-1ad1077e9a6mr5123543c88.11.1793450359362;
        Sat, 31 Oct 2026 05:39:19 -0700 (PDT)
Received: from brev-9gdpyq8lp.ap-south-1.compute.internal (ec2-3-110-210-194.ap-south-1.compute.amazonaws.com. [3.110.210.194])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1854da78sm21566039c88.6.2026.10.31.05.39.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 05:39:18 -0700 (PDT)
From: Samarth Narang <samarth.colleges@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Samarth Narang <samarth.colleges@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Laxman Dewangan <ldewangan@nvidia.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	linux-serial@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/5] serial: fix TX kfifo underflow on flush in five drivers
Date: Sat, 31 Oct 2026 12:39:06 +0000
Message-Id: <20261031123911.3784690-1-samarth.colleges@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261031004733.3345841-1-samarth.colleges@gmail.com>
References: <20261031004733.3345841-1-samarth.colleges@gmail.com>
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

This series addresses the TX kfifo underflow reported in the parent
thread, where uart_flush_buffer() resets the transmit kfifo but a
completion callback from an earlier DMA transfer may still call
uart_xmit_advance() using the byte count from before the flush.

The fixes take two approaches depending on how each driver manages its
TX DMA mappings. In samsung and tegra, which map the TX buffer once,
samsung's new flush_buffer() terminates the outstanding transfer, as
tegra's already does, following the approach introduced in 8250 by
9e512eaaf8f4. A completion already in progress skips the kfifo update if
the transfer has since been retired by flush_buffer() or stop_tx().

In sprd, msm, and pch_uart, which map each transfer separately,
terminating DMA there would leave the flush hook to unmap a buffer the
controller may still be reading. These drivers therefore leave the
transfer running and mark it as flushed, allowing the completion
callback to unmap the buffer without advancing the kfifo. This means
that the data already queued for DMA before the flush may still be
transmitted.

All five patches have only been compile-tested with arm64 defconfig and
the relevant drivers enabled, including pch_uart through COMPILE_TEST,
using W=1 with no new warnings. I do not have access to the affected
hardware, so testing by someone with suitable devices would be
appreciated.

One race remains, which is also present in the 8250 fix: a completion
may already be running when the flush occurs but acquire the port lock
only after a new transfer has started, potentially mistaking the new
transfer's state for its own. Preventing this would require tracking
individual transfers, for example with a generation counter, which I
have left out of this series to keep the changes focused.

Samarth Narang (5):
  tty: serial: samsung: fix TX kfifo underflow on flush
  serial: tegra: don't advance the TX kfifo for a flushed transfer
  serial: sprd: fix TX kfifo underflow on flush
  tty: serial: msm: fix TX kfifo underflow on flush
  serial: pch_uart: fix TX kfifo underflow on flush

 drivers/tty/serial/msm_serial.c   | 19 ++++++++++++++++++-
 drivers/tty/serial/pch_uart.c     | 27 +++++++++++++++++++++++++--
 drivers/tty/serial/samsung_tty.c  | 22 ++++++++++++++++++++++
 drivers/tty/serial/serial-tegra.c |  8 ++++++++
 drivers/tty/serial/sprd_serial.c  | 24 ++++++++++++++++++++++--
 5 files changed, 95 insertions(+), 5 deletions(-)


base-commit: 36aad21d50d1af3f6954bb0c988257a908202477
-- 
2.34.1

