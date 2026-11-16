Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794818356;
	b=VMJ8ecNyq1usVmonK/0AJ9O7+oKoDDNxhXeMxk3IfMao45nZ2VeAubf6/IgHHFoVdULV
	 qgc10qTvQr9JeKczxjzgjCLGZPYLQcf5idJLtWtj7Qfx6T1pq1dEjpb3CpE0td/wFtdq2
	 VX6zQZ3oARuI3tzDHRq4E0zY/WfMzrb26wxEtGwJG+Wr2ciOP6IL3TOVYtFQ4ktr+pA9/
	 xh7NA5qtel3NuRCwPs0bk+8/3ml8VL/e4Yuw1IPtXTdjtLte5g8EIgS364Fg1zGKW7hNL
	 MCrt88fn/qUzDzknu7Vs9YBxAAivaNhXNuKG4z9yv6a2mv/PyBBliWH13/LxNz/GLzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794818356;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=GSln0dgCtCb5NYN7ycmhGMDAWgf5IcHRxJsc0mjSO+k=;
	b=WqGVOVZRkPNO/c6Oj+04qoPlqTKgvi/WD0YCmHFj7z90TH1e6mE7ogQbHezV9H8KRKe/
	 wjBDluIgMOyme7OAhoofxBlhQHQbC1r5hQo+wsNJC0bX7ew/3Vm2oD6dR3tI6O3OmZnNU
	 vhjegyxAb+zSidMf/UoLoeOvfhgQVLvMC2P/mVz9dZrUWxF434J6JdoP17d7et4lsob6H
	 Mtbt1E7NAsAMeX05GhJsBPluD/Asuvg+PIyTT8p5IXhlqzXw/TkQZSFG3ld63gaSKYTOP
	 ggMl/KQ/m/oq9OyjxixySMID0/iaH8pqHm6MUAhvFcaDrVpfAHe7v2xogtAXBBkGTiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tsFTamSo;
	arc=none smtp.remote-ip=209.85.215.181
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F48F606A329
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 08:39:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F48F606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tsFTamSo
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cc4aa0246b7so1151578a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 00:39:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794818355; x=1795423155; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GSln0dgCtCb5NYN7ycmhGMDAWgf5IcHRxJsc0mjSO+k=;
        b=tsFTamSomiR+GLKFISpDKDvQ5p3W01tAMOnHBeL5SoE0r19R8f5QdYLQhKjXs/FBYh
         feffXB/05XEHW5zOXdHiuXnyxPxduKmOYPVFik31hT8xlg5cbFlqXhmqOogWCGltks+8
         Ab+zWXYY/pv0F/2+zKktYs6rFgpa3g5wzYvXIjWfDWDxXHo/0YVPd9nkr8jUWwJ2bpkB
         mg958FFeq+ksp0ZHiD8SJW2A6AB2383yNeGxV0XGyfr+C85reeJ0OFCtub8Ze0O1mHBG
         /hDNFsjXu228ETzod9MfJIOU8MIvG1yJIAobkVH0pWCEEDkyj0ynmSISgKKwdccAjSRI
         52ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794818355; x=1795423155;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GSln0dgCtCb5NYN7ycmhGMDAWgf5IcHRxJsc0mjSO+k=;
        b=TpdQBenPqrVkvzYbJm5XKDAo2WOtN66q4FTGwj2KkbRKhXdD1yPaMqKt5Z+Vij1q36
         ELvJxsdjcXlbqnBXuLkI5T/56P/OEjSL66KqCuSwsHLcZURb5OVi9gxP+wDGwBFB3EFQ
         kkMXsCUD9u6xcURb6/HuWD2ZYIeysx6eq6GltLV0l4fEklKP2CJoIj0ZrpW9aFbZnv0F
         7Y+th+TC48Pp7TK2s8PpPuCBDavEjQqFnlm9NTDGjYvdWDVigJ1RjupgVUqs0WDmQYlS
         VAwke/rFbT85BFCywhp4tSPEiGuT8oG9eGjoIhS/b1z3m3f2/69MChy8A84OM64RZK9t
         POAA==
X-Forwarded-Encrypted: i=1; AL+hErFWbzU1dnfX8ucds4CORTOBRHEwItzyZRSm8+VTBVHhpFJU/62NN+Bnn1hG7D0tr9SVQHNsJGPihD7wu+e+@vger.kernel.org
X-Gm-Message-State: APuU4Z93Ol3raPI7rBaJE3YxMTgdm6180FwMykVSVbZ3Uvb/K2odeeXy
	EOJgClgzT2qtrb6vZEvD//ps8dVYxPcJs0ACtt1cyPe4HfOVMd5mo7g7
X-Gm-Gg: AZFdTZc7Gtvz9acgUKEKxHT7SJ5pG1S1zEN6oyr5Mr5ERk8mMJ7E/Xb/N9xI4xdxMLn
	3XUKbUejPKdCGqp7RbLL2kpNqCDCaxZlfHNif8jFx+dn66pv+xL8BbMloaOv9Wc3hx7XIJCDeIB
	sGM6Ua0Nm1q1znsa1JyvwU86kyIxz+2FF8Z62MCj5CeKGI6zMEWfvL0B5kPiTuMXtvEFV/EoNIm
	QYndZg5woZTPj1Pner+Uat2yOmQ6BlCItUBwTWTNpzgzqQ63LOoX1oy8HYqpSaZqDWWdR+6wESM
	6M9UETLGFh67Nl2inq4eH+joI58ZPoklE+jyX4N/lo7wZiE+RlnsFvtpmYSD/eBUlX04UHsJkXl
	zPqJY+gUvQLhhmlSZvJQ5w1H/j8nbrPIJB5ZwNE2r6CxSZQ1l66PzDHoK8kqj6j+ELH1YomInIu
	8qn/iw6/7snwRbK+MdvaZcXcyM9/UNI0tgGi65N82LuDm3+Wb9/CCDpdARLpvI2EbR1pZHyWvHF
	egwF2PvoVyeM0soNZhXJqMqq9wPUsMI8YIcmGDP8N1NeJwo1eTYGj0A3GAVckS6RFyjl3a1K4q4
	YfJ8a7v1kLyWUsqvWuONSF1Hb2J00PhxzngHT5oFq1YqjmDISQa1RY4LD0M=
X-Received: by 2002:a17:90b:4f85:b0:3b0:91ce:6720 with SMTP id 98e67ed59e1d1-3b1b0a1ef3emr8998420a91.30.1794818355362;
        Mon, 16 Nov 2026 00:39:15 -0800 (PST)
Received: from G7XWH7K1F3 ([2408:8256:2e80:7371:90a:5f11:9056:5eea])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d32ea0sm20238697a91.15.2026.11.16.00.39.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 16 Nov 2026 00:39:15 -0800 (PST)
From: Zhao Li <enderaoelyther@gmail.com>
To: Michael McAllister <me@michaelmcallister.org>
Cc: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	brgl@kernel.org,
	linux-bluetooth@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	quic_bgodavar@quicinc.com,
	lumag@kernel.org,
	mka@chromium.org,
	markus.probst@posteo.de,
	shuai.zhang@oss.qualcomm.com
Subject: Re: [PATCH v2 2/4] Bluetooth: qca: Power off after unregistering the HCI device
Date: Mon, 16 Nov 2026 16:38:46 +0800
Message-ID: <20261116083846.85334-1-enderaoelyther@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <179468159400.2456.12381703314197227930.wcn3950-poweroff-v2-2@michaelmcallister.org>
References: <179468159400.2456.12381703314197227930.wcn3950-poweroff-v2-2@michaelmcallister.org>
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

Hi Michael,

On Sat, Nov 14, 2026 at 06:39:54PM +0000, Michael McAllister wrote:
> +	/* Drain HCI setup before clearing protocol readiness. */
> +	if (test_bit(HCI_UART_REGISTERED, &hu->flags))
> +		hci_unregister_dev(hdev);
> +

Moving hci_unregister_dev() ahead of the hu->tx_skb cleanup also closes
an existing race for every hci_serdev protocol, not only QCA. Since
21139b3ac62a ("Bluetooth: hci_serdev: Fix use-after-free in
hci_uart_unregister_device()"), unregister frees hu->tx_skb before
hci_unregister_dev(), so a concurrent HCI close or reset already inside
hci_uart_flush() can use or free the same partial frame. Calling
hci_unregister_dev() first waits for that path via hdev->req_lock, which
hci_dev_do_close() holds across the close.

What the series leaves open is the same flush-vs-TX race on an ordinary
close. Your HCI_UNREGISTER early returns keep hci_uart_flush() away from
hu->tx_skb while unbinding, but HCIDEVDOWN and HCIDEVRESET both reach
that free through hci_dev_close_sync() with the flag still clear, and
hci_uart_flush() does not stop write_work first, so it can free a
partial frame that hci_uart_write_work() is still sending. With your
series applied, a test hook that keeps a partial frame in hu->tx_skb
across a close reproduces it under KASAN: a slab-use-after-free read in
hci_uart_write_work() and a double free from the close path. The device
reopens and transmits afterwards, so this is the live path rather than
teardown.

I have sent a fix for hci_uart_flush() that stops write_work there:

https://lore.kernel.org/r/20261116080538.66575-1-enderaoelyther@gmail.com

It is based on bluetooth-next without your series; your HCI_UNREGISTER
check in hci_uart_flush() goes above its new lines. With it on top of
your series the same test is clean and the device still transmits after
a reopen. I will drop my narrower unregister patch in favour of yours.

Would you consider splitting the hci_serdev.c part of this patch into
its own commit with Fixes: 21139b3ac62a, so it can reach stable without
the QCA power changes?

Thanks,
Zhao
