Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795091758;
	b=471NAmSzJQnxT/Zg62okYWUusmNrlkUKgAc9DeT1iL+/zGHxVbfW12Vcp0szqBxn0b5/
	 cORw4Rq5YgnC7Glwyz8zsbxGj+12dJBvLU4PiGWKeaUAaMeYe1IcsZTBW2iVgICHwTP8P
	 fZ/R7D6V8D1hOkElxUVnZgtsNlO4FaA3TqQgOVHvIgXs7pgghOR7NozI05k3NGqBv3CDI
	 ea2nxXLtV9k0/MZ5rZ5W/WsLDjspYqv8xwkA0vfIMjLqemc6nIEvVnakmvsoWPBJ2Pjdc
	 HyxN2DCGnzxIiyXcuotojwmwjIiMKx+XYaCJbRG3roNCN9j/qzfI3r1qQu/aZW6jSaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795091758;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=tlh0sDqeWlrC+CughwxhHDNVvfwaR9aGAXcv08hxMJg=;
	b=Wg4SYDSt9VHH7xUfHV3iveOp2TRUNMawATQSoivqf4gb0f+Omxu/Ac2B8DPHzkdXlxh+
	 x/iLCiVeZzrTeAThuLVfu/R6VEOR+nHBB9vblqeQvgtoXgP5EpgYwcOu6Mrucyr0iKyfT
	 /nvQb30/0m7WM7OwnAwA8gz7TqWnOSeaywqS8flbxRUDVBps+rbE3jdfh/tTTdby+JYP8
	 HXSRxcmKAIOQeje2LqV+yvikmdMfPZAAsEh060EArrn2YlAv4/t6dA4L3oThIyQoLpath
	 dPvRKe+aWRmu7MFA1n6yPZ2OqZAg0TB0+THZcW2pTY9Jn9y4Uqsu4WoTwP+/qLeyn/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NyEHCG7D;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9F28606A320
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 12:35:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9F28606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NyEHCG7D
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-38431138772so1058856eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 04:35:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795091757; x=1795696557; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tlh0sDqeWlrC+CughwxhHDNVvfwaR9aGAXcv08hxMJg=;
        b=NyEHCG7DVoNCj5XQjqnUzUKFjPI7k/LKK/dVBRMfe/Fjv8BNLzGJmk2y+wNXFgk6Jx
         lMfEf5G9IsQjJmsrmB8jsDCOb1D3HC2uaWLqdqX8U6zWCsFqUucGwof+50UFwNKKm2e3
         9u4lmcYidTcNGPE69H8nyy0/S5ssQICabReyhztN90UWyRLiSSpnZb3FoSwJEd04UJ8J
         tTPQIDjwd9XFeERuy4TbmByegYnuWvwTZ2qivoX63pjiakxiv1QUcN+8KrdCC/sadozc
         F2P8bQQdVtfeICrVLQHHGIVG5E1UBEhW0bQvacunwWLGO4Pik76bVRsZ3b66QeMOeEsF
         g7NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795091757; x=1795696557;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tlh0sDqeWlrC+CughwxhHDNVvfwaR9aGAXcv08hxMJg=;
        b=lOKq567pNZCCIC1iclwhZSv1u0Zy5GffUqVEvZVO8W2zeUFzNZ5FgU6lLvnM4SP0kt
         svEBvdAkKCnxkSKPIeXacRKIc5e16d0ulJ9xyYCR83178lH2s1XX5OSzBLK7T2hxFKrw
         9u+8lgIeV9x3aiW/BEub2pgtGD6//9r7MbiPI7cRTgF5hVY++TvXXagCaHPud4fX15Do
         cJ1eIO4rX4Gq0usdeFfTtZJLljnR2UJxv6vjQp/HHHyoHtbAvkexlZY/KUrHBqkPSXll
         ElBIdG2iybJC71eqdq5ELs/5ffbdjIu7sNed9o3cZxsFW3nCFqIRBJ/ra3au/20vkmbm
         W1Gw==
X-Forwarded-Encrypted: i=1; AL+hErGBnD3Is6f9w6CHhCZKTsoYupAesKvXDp+dQ1fJ8nC56M4dMNGpAKdDr3HlOJrPmt5csyvQda2TRLXXqk9M@vger.kernel.org
X-Gm-Message-State: APuU4Z8C2gfH2H1cY5GhSq/w2Yw8XugB1dKv2veG+4NRYZBP6Td1En2n
	cAZWC4H1jhD511DSkDs8Mf4G6DbKn6TI4f4MW9v2j8fGYwmsutiZUzOK
X-Gm-Gg: AZFdTZfdHu9J/Wtc8suBkVrqXjInSl9gkdlAxDOtJatzXIZ7wsRacjpmy0NLbh6ekHO
	S90UlMbLezVsVLNpFrry2xlSpvSWKoY8W97QE6UhrzndbKWHK6HWFf05qTISk3XUFK/4kDhX+yi
	QlaxFPBfwYqj+79s4lSjegMG+h970xaiLqpf5KK2yNB3M7RYdfFlPMvwyzUBc4xHdi9135Oegxf
	u6cn1Y4o/HO03azFh4/eviDfgpOiej7epC+Ub9kCJBVWMdWAfP3haxG+mpI4FTiP/TZnXtKt80Q
	TGLD8S6ZFUE3h8Bzv00/y+7wtUQVEBTLRv7bCPz5lG3tLg40p6l2v1d7E3LFoLVG51ghPA/Dcrf
	+nF9x5kliMKW8PeD5yIEbOGeYbzHFVAdNfEFPtfnC+7J+co9Tr0mUCUB28ZBo1D1vGtdp7B+zKp
	DMHzDOflLrOr4JtUYTGt4gZn+DzH+G6vXBuCregpx4qrt6U3b6idQnwMuJClY2urSSKwzh0/p0C
	wAuWsYaRLcsX6Zh23nRduiN+5SCDIbRLNr8IiWBcCDpTJ+KTYzEXOm19O+93GK+7gZAXcqrEvJ6
	nOIRiyf/cyVh6K7PKqB2s2dd8bZhP1iWKRebOSOHOQK5Sw7EJz/NrQ==
X-Received: by 2002:a05:7300:b594:b0:381:5fe2:8008 with SMTP id 5a478bee46e88-38281eebbb1mr6690547eec.39.1795091757005;
        Thu, 19 Nov 2026 04:35:57 -0800 (PST)
Received: from csl-conti-dell7858.ntu.edu.sg ([155.69.195.57])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a63059e3sm26605762eec.5.2026.11.19.04.35.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 04:35:56 -0800 (PST)
From: Maoyi Xie <maoyixie.tju@gmail.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
	Bryan O'Donoghue <bod@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
	Praveen Kakkolangara <praveen.kakkolangara@aumovio.com>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] media: venus: hfi: check the write index against the queue size
Date: Thu, 19 Nov 2026 20:35:52 +0800
Message-Id: <20261119123552.1378131-1-maoyixie.tju@gmail.com>
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

venus_write_queue() takes read_idx, write_idx and q_size from the queue
header in memory that the firmware also writes. It checks q_size and the
write pointer against the queue memory size, but not write_idx against
q_size.

If q_size is below write_idx, len in the wrap branch underflows, so
memcpy() is asked to copy almost 4 GiB. It reads past the end of the
packet.

Return -EINVAL when write_idx is not below q_size.

Found with a CodeQL-based static analysis tool that we are developing.
Reproduced in a userspace harness under AddressSanitizer, which reports
nothing with this patch. Not tested on hardware, only compile-tested
with W=1 on next-20261116.

Fixes: d96d3f30c0f2 ("[media] media: venus: hfi: add Venus HFI files")
Cc: stable@vger.kernel.org
Co-developed-by: Praveen Kakkolangara <praveen.kakkolangara@aumovio.com>
Signed-off-by: Praveen Kakkolangara <praveen.kakkolangara@aumovio.com>
Signed-off-by: Maoyi Xie <maoyixie.tju@gmail.com>
---
I used an LLM to help write the harness and this patch.

 drivers/media/platform/qcom/venus/hfi_venus.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/hfi_venus.c b/drivers/media/platform/qcom/venus/hfi_venus.c
index bd82066bb6e77f6..662b7e89a53229d 100644
--- a/drivers/media/platform/qcom/venus/hfi_venus.c
+++ b/drivers/media/platform/qcom/venus/hfi_venus.c
@@ -190,6 +190,9 @@ static int venus_write_queue(struct venus_hfi_device *hdev,
 	if (qsize > IFACEQ_QUEUE_SIZE / 4)
 		return -EINVAL;
 
+	if (wr_idx >= qsize)
+		return -EINVAL;
+
 	if (wr_idx >= rd_idx)
 		empty_space = qsize - (wr_idx - rd_idx);
 	else

base-commit: 7e1392a42ea288d70a266f6553fe06f57f8647ea
-- 
2.34.1

