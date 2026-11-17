Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794884715;
	b=5s18G/JYzdP2oxVzJT8ACDqvfgOZ8PI6O+8Nop4CYf1VMe5vPJcUdDa4Vk3Krh+WTEa7
	 nkue+BGPkVDxw2WrP/PaE/G66r5PZ2DJsn3IXIUvroMOI1KshHGAL02VLIp3hhAW5j6rg
	 kftHOlx6zXvuv2h6b19WKK9Aw5feCGeQPEUzPUxeR6rwxVXniKb9ajVHfNn4ZBUDO6pyB
	 rwhWpOgaw15lpjOAaTiOOrSgjsN2TyFE7bziBzUvSqI9MkXTBxuANT62UQhMgyoFoo1iy
	 gcltRN8IFmnmAfiaIYbNDjjeA1q0mPPrWSB3XCWQTu4MOZtFEXew+F9DeSzC6ogR3Ew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794884715;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=mCoALzMhu5q7+FAJc0HEyB8F4qmrYW3UsJsZLcqOZX4=;
	b=NHToyuQ/Dojkz0GvlUmfZgfzSaLtu7x+AubzeUMdmGGmpCGsr5ww/W1FYT+TUqRl3Bq+
	 Q1UBogglQG/aoIjliBEHsxzJ34omAWl8C71Kt2J03YY80ijjyZPcMFA50R2gTxAwSRYPw
	 3jQy7K4XNXC7FPdoPmudcGFdFC6gJwQ//NRaLhJA6xC8f92f7tvMcLPNhNuu3m/zoiIDa
	 XAN4UkQDbM3a7GfaCDAoiWGFBDp3L5IawLGM6MXOw+YD/8AhdeQ5jQETH+/WPmEZ/emzi
	 9gfNWh72lczP4SgDRfq5zGjJNoRVH8oUy7KwLF+DOS+6NJ0RlfYIkDxh16/MzwDww4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="xjR7/BNc";
	arc=none smtp.remote-ip=209.85.160.182
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49954606A31C
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 03:05:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49954606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xjR7/BNc
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-5364d86f7f0so23592711cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 19:05:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794884714; x=1795489514; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mCoALzMhu5q7+FAJc0HEyB8F4qmrYW3UsJsZLcqOZX4=;
        b=xjR7/BNcxJw6s62M/s+PdhaTGRoIONz4etd8ABsWI4I9NKfSdNlDj0TddCPf02hnZz
         lD3LxUVkgZ3r6ulmA/U4G4bxkKqafcPQ8yj4+UCUruC3FGh644jW9RrAWX5Hwr/lhzcT
         Qarvkt/O1ecdlybAFOS90B/d5oTWMeSh7opB+CcxUg+9mKmUPSYqdtHZEWtW22MkxIVS
         ehPOd7Ml0WXYSWllhmH10Q27i23Y8YlOnIolDHUVl5pZV1SbCBAaCPRIsS00m4As8QrC
         So8fEpJxSXKuSI5t5CJK088L7VOOjUXfcL9uRuHiWa9xIAo7lZq/fSUoUTUi+zFY+n5f
         FZNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794884714; x=1795489514;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mCoALzMhu5q7+FAJc0HEyB8F4qmrYW3UsJsZLcqOZX4=;
        b=ZBIk83AKYnmAB0ojYE/T1X6cueiqG9m1Ru8lYcgPlqtKdElwtD4TkOI7jhKMuNDLHA
         6+Gp/nlfKzShUXoMo5fTTORrPA+XiHIbXzlLGK9+xw6efiE+9AeEKu9xTupEbGnMQPii
         QymAoOCQOL9IRDYk5O09308Vduw1nYmSEVyCJfmDsL/cHC6ISeX8h4z7gczkj4e3QbRq
         q/T9yVFV22+nhMsBWPGfjbXs+mqGl8I3+BvVzMIBMCGK5GOJhffJw8GfGE2kGLBBwTTe
         ZbP2CHPbNK33rhNnh8R2sXL9NhvExi0NPpgPX1b6M1G8lKOOq6a2FXHfHuuBSOocz0oh
         9nRQ==
X-Forwarded-Encrypted: i=1; AL+hErFffzYgujDqeJrph2u+8eSVXZwm4DJqKC/6FKzU2gJjSLItuok8+McdcpvHUNJpAEJ4sQkR/UCl/RFkeT3r@vger.kernel.org
X-Gm-Message-State: APuU4Z8ClLFS3C0vG4CuyQKkgZxiLnSfxHwDcr0ZkgyM7nWSMUwAFcxc
	PfmwJc6NMguK+Jcn+QHaBCkGx16IG5gHKJCiK/75xzA/cYnyMQKXhchh
X-Gm-Gg: AYBFou2i8AjhKP+EN+Lu0DNsxtabmZUXoaHGxsPBWOiQohMZ+PChqlyS35YUpuIfbNp
	Sfi7GTOIBNJOXz8VkH0NCu282J3TrmZ8pHyffd7h3EejYnGXdeHWxL7KYGWBfy5xWv/PB3CrubQ
	ZOsUfbIyj2oAva2rmXfVRNPFpI6oyf/PLoSIHYmUFJH0n7AGIb408AsrqnW+CqASlV0dIMCdO7v
	qR0wmw1ePFTKwVSB0EParh3yQMsBuKa8cQy52zaazly/tNaeUUDHZ13pTB39bbwFSl5acUmSRkW
	xM02Zk0fi/L/N3pfBrHPSwZSxzXwdFmBjopOW2aFJmrPaA/L98B1z56JS3UFTrKdGBKYACyY0lC
	+CtIUBI4L3pskERFRUhHmBzBjEKU4RAoMEpk/vjoZGSBLYc5alyiWDUiiQ0ElMdtpZZhW6KmJSg
	DtDbrZwFsV/kz6CGtKYvE9lT0cug0Cul0Svwth1TT+v58gnmuuy6QZdm4wmC8cunbq4DwRVaoQl
	Zd7JCUxqQ4TA6B/mo8BW8EkRvric2EiucMrKw0HJOwKoc58kygwC4gdoKOs3hgJxAsfl4zEVcEY
	Jfs5JAk+HiolEPASnlIbtIT3y1aStADeNnLCPdSxoKQIN9UxvGBP38g69sl2ysqHBHMlMG/kz8I
	=
X-Received: by 2002:a05:622a:c8c:b0:55d:3695:c1b8 with SMTP id d75a77b69052e-55d3695c801mr97933321cf.11.1794884714307;
        Mon, 16 Nov 2026 19:05:14 -0800 (PST)
Received: from linux.. ([8.34.174.240])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23d453casm100066256d6.10.2026.11.16.19.05.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 19:05:13 -0800 (PST)
From: Changyul Lee <lcy8047@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-remoteproc@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Changyul Lee <lcy8047@gmail.com>
Subject: [PATCH] rpmsg: glink: hold idr_lock while completing open_ack
Date: Mon, 16 Nov 2026 22:05:09 -0500
Message-ID: <20261117030509.1708983-1-lcy8047@gmail.com>
X-Mailer: git-send-email 2.43.0
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

qcom_glink_rx_open_ack() looks up the channel in lcids under idr_lock,
drops the lock and then completes channel->open_ack.
qcom_glink_create_local() waits for that completion for five seconds.
If the wait times out at the same moment, it removes the lcid under
idr_lock and drops the last two references, which frees the channel.
The OPEN_ACK handler then reads channel->name for the trace event and
calls complete_all() on freed memory.

Keep idr_lock held until complete_all() returns. The timeout path
removes the lcid under the same lock before dropping its references,
so the channel cannot be freed while the lock is held. Taking a
channel reference instead would not work here, because the handler
runs in interrupt context and the final put may call
cancel_work_sync() from qcom_glink_channel_release().

Fixes: b4f8e52b89f6 ("rpmsg: Introduce Qualcomm RPM glink driver")
Signed-off-by: Changyul Lee <lcy8047@gmail.com>
---
Found with a static analysis tool we are developing.

Compile-tested only, with x86_64_defconfig plus MAILBOX, RPMSG_QCOM_GLINK_RPM
and W=1.

 drivers/rpmsg/qcom_glink_native.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
index f848ab46161d..862565bf965d 100644
--- a/drivers/rpmsg/qcom_glink_native.c
+++ b/drivers/rpmsg/qcom_glink_native.c
@@ -1101,16 +1101,17 @@ static int qcom_glink_rx_open_ack(struct qcom_glink *glink, unsigned int lcid)
 
 	spin_lock(&glink->idr_lock);
 	channel = idr_find(&glink->lcids, lcid);
-	spin_unlock(&glink->idr_lock);
 
 	trace_qcom_glink_cmd_open_ack_rx(glink->label, channel ? channel->name : NULL,
 					 lcid, channel ? channel->rcid : 0);
 	if (!channel) {
+		spin_unlock(&glink->idr_lock);
 		dev_err(glink->dev, "Invalid open ack packet\n");
 		return -EINVAL;
 	}
 
 	complete_all(&channel->open_ack);
+	spin_unlock(&glink->idr_lock);
 
 	return 0;
 }

base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
-- 
2.43.0

