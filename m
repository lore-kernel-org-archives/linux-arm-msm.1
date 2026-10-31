Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793450373;
	b=bnmYc9R4hO6i7NC/DU5SKfqV8WO6KTqmXlKsduBIHYWn7oJSd1jR36PsjjkXZ9mXY10n
	 RkYNNHgB5/uJzfL+u9LGBEBpyxyKFbqvRr0184VqTuS9DNiOxl/nPOxlNjqspO29+MDM2
	 sOZJo6vrTylmLs8uOQyUmqecE8QJmRLBydbAwdF8iPbK5JWiXfDJLZ6W5vOGlPxdPxM7Q
	 R+KcrcC5B3bd1S3UCGvs4tJ4Kvl+WtYkuTWbtGXKtYgROF9K+OluvKl8QCLyuYDVP69Zt
	 8Q7CYlrUF+IcVRYQpiFVYkpWsE3YPc0g9mcRdnLPETwvqVoXG61z5OZOPZjWb+dacJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793450373;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=sU9FonDcj7pItReaQHsb8l5aj4324fAJTqMBMqrSuhE=;
	b=C3VI6YDDRWs7E/a6XylpPXRdzz5yoj4VnoZwYgQSx/UqmbaZKbgVOSlZU6o1uGkfkxdi
	 q8WvtTCMQRUZMNm+Miaastx6OvKsbRwrKFrUTM2mR3sYMYXK0Mun9JvOLdSkfIOUS+Q7V
	 BfdVvmKySUGx9OO77G9QYfa//255fnJq0aBChMLoiWZICG1BxNEw/23LQpWUhpZ5DEa0B
	 EvfUSBOL9qTTj2tkhzeeFGuJqy6dIkU3KV3qDzo+iCx6xLNqy2tAe6AC+BO5xiErKIJgY
	 N+/nfUiNQ4efsn41Z3kcU6qVUwfSnGoiYCpYMkaC5/nlXHdFDsNm5q+V9lPkkHtbQiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MMeYLSu8;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0234D606A321
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 12:39:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0234D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MMeYLSu8
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1aefd1bf74aso374175c88.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 05:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793450372; x=1794055172; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sU9FonDcj7pItReaQHsb8l5aj4324fAJTqMBMqrSuhE=;
        b=MMeYLSu8Hfxb4MMwRmB6e+af88Re5khoHp3/t2EUBiUGkWoq5iAZ1cjS/455NZJMYc
         IujJzHWomO3jTDNhqb6DoiExYizct5Q5FVUJmFS7XuCy2LxUc8jj0Oofyc0IHl+EntE/
         eUcP2z4Ax8+oIgGKpmcRfzMrD9dQdamJcuC3zrvef27BS8pSvZievFDvuWoZs0CqMcCq
         3vKRYyOQMEzwBfi2Zm0+f/C1csutboBvSRGc8Yte8xi/BQo0n10Jw6RwB6XCFvO+KJ09
         hZWMahyBeZ0zoMbqMmuxiabU6Q9VNG+7uRaQgI//VnxikZbVXNq/V6EAx1/ZV4NVzTzt
         LUWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793450372; x=1794055172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sU9FonDcj7pItReaQHsb8l5aj4324fAJTqMBMqrSuhE=;
        b=viWIB7s6cLHHdeUFXKYKk+uJ4xLqp+YvKTs37F47PpOvxDqSmY4Bv03+JC+Ch7hdJB
         yKxNn9hDYCI7khbOWMQYbt3KphBk8XcU37q1quEbGYiG4dnVJMTuEHkWxvIYMkmbyMcS
         wxRFBmwNSHspQBKcrZc+2ycqdQ/HXi3jkH6ChDZLC8OBo196jN2YMyZ+9o0HOLuwpkYw
         OJdEME35L3/O+Ss4b/My51NjgwkKzy5g7fBeHHovis8wtaodSB7zAXQmxWxvq+4YhjI2
         1aceGPxA4deJHUWEE/p7MHVCKvetTm7uWbhDXOUhyvNDJ3dV9MZ9VR8zJhRO/p/0BRkF
         T+0w==
X-Forwarded-Encrypted: i=1; AKwUvBxQ7a0dTkKbhHzwlj5v74pQRr7UFeSAm9QmcJ108PdRNOX4l8kfiNzaXu74KZOTDjjs9+3WJlL/fxemHga3@vger.kernel.org
X-Gm-Message-State: AFq9FYLrN7e/Lk7W/9DWaZlbqpVkePNCGiawLPkanXC4pSq8rFWofYYg
	2xEYc3EPvX3kqjh1PaQJ22WhPEXpsThT1Kbkyc/UOz35C4g6nVfqviqd
X-Gm-Gg: AYBFou1iAmeDhkQ9jWrOA4iTkz/guayrd6mDjZfGC+j/fkn6tsH3/+y+42pS2qGNKDi
	sueX9oC1RJO1g5ioTD57ViJaBLgLJ/13ZRZApE3ifiMsVdSwTS2/B2JZZ01bY4RAuj43/WMNg10
	1+SdqaAvEep4IpU6BPAEmHLrfihMOtMfrXBttX2TKlb/msH9ynCHyIe/OtWthh7Ynn+8w3Uq6Ii
	w/cmGJsIxEKDUUaMDI/DaODTrLZEi8tGeEASpG3FQAad7eLLYnsNGNYu0/eg/zUjp2t5jBYy/vz
	5Mdo66Xds71Cug+ik/V5sbLDv4IKxlvkLlanEG8Sn2GsBJ1jagt6cQ7AYrvTG0FDZE8FRvO2K6s
	+6re7k316tYZttjGAMkZFrfSyhWNK/eUSYNxpmFZHeTM8D3YtEK16k/HNia9weKsZQe9xwpG8Q3
	s9iMjfkg0kU2vUr90/ByfpkNBGjiW9PHvimbQ/zzcXicnCxGiP66/GtikOIEnr7A1YWu+VwySa0
	IevXIgDcCMlTaVIHXF84tBX7WwmF0hfCdBj0t/nWfIkm0eBv7OHFdr9dxI1k9Qsso1kBlhRaZFT
	TR5nvoPLoA6e9y2bSWtzhaR71TJKG+SKyqlqJU3iPegobu3SjhOEgYRkDejX95/kWgbWl+f3Hm0
	Zq/130y1PJp/pfRye74YBMPO+QVf+9PMdAarvHwRv2bkmEiaCVtAGcmjcZBCKBThhXk0UvFOUdd
	5us2FkyOwX+uXJEA==
X-Received: by 2002:a05:7022:294:20b0:1a9:4d51:8c33 with SMTP id a92af1059eb24-1ac5bda4837mr6575924c88.18.1793450371863;
        Sat, 31 Oct 2026 05:39:31 -0700 (PDT)
Received: from brev-9gdpyq8lp.ap-south-1.compute.internal (ec2-3-110-210-194.ap-south-1.compute.amazonaws.com. [3.110.210.194])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1854da78sm21566039c88.6.2026.10.31.05.39.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 05:39:31 -0700 (PDT)
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
Subject: [PATCH 2/5] serial: tegra: don't advance the TX kfifo for a flushed transfer
Date: Sat, 31 Oct 2026 12:39:08 +0000
Message-Id: <20261031123911.3784690-3-samarth.colleges@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261031123911.3784690-1-samarth.colleges@gmail.com>
References: <20261031004733.3345841-1-samarth.colleges@gmail.com>
 <20261031123911.3784690-1-samarth.colleges@gmail.com>
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

tegra_uart_flush_buffer() terminates the TX DMA transfer after the
serial core has reset the transmit kfifo, but leaves tx_in_progress set.
A completion callback that was already running may have calculated its
byte count from tx_bytes_requested before acquiring the port lock,
allowing it to call uart_xmit_advance() on the reset kfifo after the
flush. This can advance the kfifo tail past its head, causing
kfifo_len() to wrap and the driver to transmit stale buffer contents.
The same race was fixed in qcom-geni by commit 452d6fa37ae9 ("serial:
qcom_geni: fix kfifo underflow when flush precedes DMA completion IRQ").

Clear tx_in_progress in the flush hook and have the completion callback
skip the kfifo update if the transfer has already been retired by either
the flush or tegra_uart_stop_tx(), which also advances the kfifo itself.

Fixes: e9ea096dd225 ("serial: tegra: add serial driver")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Samarth Narang <samarth.colleges@gmail.com>
---
 drivers/tty/serial/serial-tegra.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/tty/serial/serial-tegra.c b/drivers/tty/serial/serial-tegra.c
index b0fc4ae3686f..8b712a9bc293 100644
--- a/drivers/tty/serial/serial-tegra.c
+++ b/drivers/tty/serial/serial-tegra.c
@@ -537,6 +537,11 @@ static void tegra_uart_tx_dma_complete(void *args)
 	count = tup->tx_bytes_requested - state.residue;
 	async_tx_ack(tup->tx_dma_desc);
 	uart_port_lock_irqsave(&tup->uport, &flags);
+	/* Already retired by stop_tx or flush_buffer */
+	if (tup->tx_in_progress != TEGRA_UART_TX_DMA) {
+		uart_port_unlock_irqrestore(&tup->uport, flags);
+		return;
+	}
 	uart_xmit_advance(&tup->uport, count);
 	tup->tx_in_progress = 0;
 	if (kfifo_len(&tport->xmit_fifo) < WAKEUP_CHARS)
@@ -1276,6 +1281,9 @@ static void tegra_uart_flush_buffer(struct uart_port *u)
 	tup->tx_bytes = 0;
 	if (tup->tx_dma_chan)
 		dmaengine_terminate_all(tup->tx_dma_chan);
+	/* The kfifo has been reset: the completion must not advance it */
+	if (tup->tx_in_progress == TEGRA_UART_TX_DMA)
+		tup->tx_in_progress = 0;
 }
 
 static void tegra_uart_shutdown(struct uart_port *u)
-- 
2.34.1

