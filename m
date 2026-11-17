Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.6
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794948595;
	b=tT2FG3xTonDqVC9SM1LhUx9TCudELacSizj8w7QJ302RzW+GqhL17DbKGSdOnXBwi1VN
	 YQKcplFPJSlzq9eUrHrmMOXqTHEeeXqxviCRX4m2fGZj/bkAzP7nMxwqwmGtNZ5BWTxVr
	 5BanP8iJdt05oMycpobHl46iTGoqbTRiwIOifWiSAsZeE8lC6JeMpg/dBcTsGD6e3S7dy
	 d+nWDXzKKwdR0JR9v14U9Q9p9y+U3uR4StvHvfI1mGknSORxcjb8aFNstlOzdhWvCdvai
	 sR8qQX4GxdhugflJl54LkE7hCHXzOCaT7g7TSymFo0m4iupRWGAgmUwCwRlvwmwyieg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794948595;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=NsdvpJVQ4ynQwMkb58aAP0PxU967lp2zLrg3y5n21PI=;
	b=SqOTg7ro197ToV0kRfFYkKm00zQZSKr+GZU5OJ0zv9Ma7mKeiT1+Q0jZEB6qT95FKDU5
	 hu3jVtuyG2whNRFDAC9kDDZAhSJ9NeTRz0VlDXHVFjg1PKW27FVZsLv2pdgbLENvUHk8X
	 cxcU8OHvTDgNvXUgME+/vUukl4hHR4w3y1TqjIkJGYThfHNJiAA0Y+WRurZgqPnhw7Lov
	 U+XZbAwhjvvt3HkzKliqF8wDK+hoS3eRSsmsu1yzAsfa3+L3vQ3iUNPAz9qSktiKGknMY
	 GOftZ9HzAfgQLY3oRpqH/7ADCJ01NiLvMYfYlJICl16PIvZ7do73piOKdhzYfGtEkug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p6w9kSFA;
	arc=none smtp.remote-ip=74.125.229.6
Received: from mail-dy2-f6.google.com (mail-dy2-f6.google.com [74.125.229.6])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8F05606A881
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 20:49:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8F05606A881
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p6w9kSFA
Received: by mail-dy2-f6.google.com with SMTP id 5a478bee46e88-35adc681e1aso288078eec.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 12:49:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794948594; x=1795553394; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NsdvpJVQ4ynQwMkb58aAP0PxU967lp2zLrg3y5n21PI=;
        b=p6w9kSFAa3KeB1tx66Z35R6AkVkJ5TAt2zalrQE5hGVByehQEiaD7lmGJqJKqMpIEW
         xdDcURvY4k9dM4CyO4Hx77BTY73icie5zXztp1wJB0HhbGZi8Ey1PcGTh3vsEtr1FF0M
         dt9qDU5WmCGpmFvsvPXhzHpP2c7CKTmwSm82gDwJSvIOHMKFoCRY2/IKpbekyvuTkhGo
         gnqKH5jTvGJ0CPnzyk5CG8yfo8kzmlsqueHeCVsvZhRMSWD7ZSqueo7TLynvch4Iywa6
         6dyBMy2cUJDuMmzYbbk+RoamJSCmAJldvwY7CPHldR2H5pqbZqxNEMLBE+OXFkq8yuwn
         4FAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794948594; x=1795553394;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NsdvpJVQ4ynQwMkb58aAP0PxU967lp2zLrg3y5n21PI=;
        b=mjfPNGQ9bBvT8NMBdeBOna3zPCxklCGtzoLEFLrhUi+nU9kdw3Q358gbWiUPwCLAcZ
         t2OBcSjWkwqTlspEuVWjBiEu68JiqwTL8qQtFNGcL5VD/F47uLvMk/Z/Hpqkn9apOElK
         kYOQAnvksodgDk7yonNOmBuYnmVqeIxSaC/V/ve00L5nvnF2o1th8V8ZmCstehjCbHpL
         FND6+QLO5O5cc15iCWNrQ42fqwyFmVkz601HgyvNFZDOZE8jeZvGas6bWxLgzjREzEKb
         cHJOpOz024U+wf0zk70OFzJTN8L6faA8eBR2diCDXML0tOD6V2fGjFNw813fNvDBCZo5
         YogQ==
X-Forwarded-Encrypted: i=1; AL+hErGTLHqWBD4sSd5hCrFmmpcwEi2Rc9QSXbGL+JP6Lz5X7yfh0FDIb8RlEG+xmRh1WaUpFqjsJiL4cw+3ifIs@vger.kernel.org
X-Gm-Message-State: APuU4Z+qVLdQ68jLXqrMyi3ncbo7ziJmgkwCFxSsatRF4Y2K4meYcKSd
	PF7AmECAtMA7GGL1Spg2IrYCziGbac1/rdPhK9kY+l75oEembkOVRQyR
X-Gm-Gg: AYBFou3awVzUFKQ/SzY8ejkPUDQgTu8KKVUz/N5AMxIZ3l6Hkg8A6dzG+/Jy361GNA9
	/P4ckwP+oDjPZZ7g508u/kcq4Lg3jWwo/Ucswwa+OJkWIfV1oVM2RrqodR6FyTi0Kv7xw5IiT9e
	pF54KLOpAIXTze7mPsB5Y5kQcGcsv2l5HH3FLnrus2c4T0a9trHxNIIgtz8aqsgYW5VMSV8B86Z
	v0fad7R/dYv2fSJhqyfpz4EcpeWpFPvV7F6+KZEC8OOzWNG7nvXim5CH99OVaIFtqLURmn1oL2F
	bE4IRXuFFXgN3c1tY58FWdQ8TwkOWYO6uQmpXP3BPATp37ln/8hthnv9+PudrhvCcFZr3l+7XSy
	inylYG3HLjedEGdg38pHegTva7jFsUJrJdr9Z6j+4mgpRLkdrPvL5sZ1gWWcQ4qx79gUXF1Frdp
	xroBV4RDJ+gfgyGdWdW+ONyiLb5FFVSGZcyKkaM0WhvRQIDEOX9wQjGwPnjrPqij3GWNN9r4On1
	skNm+s+ip0MhBN/zTMPynJOKS/u3NofEQZSaXDbt0bT6Joht3YVy9EH3ncOFzWutjEto0bCMtlu
	sR04U+m5bzRJvMHBkVtZhL12WoLA2TdonhzVZKOrmZQV1XZgWWocpicrnmJLtpD8Wxy4nYjNhOH
	FbiUSR2jA9747+Jgc4goTNC9dUrcSc2lhWJZeTw==
X-Received: by 2002:a05:701b:4291:10b0:1a1:47b2:5512 with SMTP id a92af1059eb24-1b543d0cefcmr702286c88.26.1794948593763;
        Tue, 17 Nov 2026 12:49:53 -0800 (PST)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5447dc5e9sm989029c88.11.2026.11.17.12.49.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 12:49:53 -0800 (PST)
From: Hungyu Lin <dennylin0707@gmail.com>
To: vikash.garodia@oss.qualcomm.com,
	dikshita.agarwal@oss.qualcomm.com
Cc: abhinav.kumar@linux.dev,
	bod@kernel.org,
	mchehab@kernel.org,
	hverkuil@kernel.org,
	stefan.schmidt@linaro.org,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dennylin0707@gmail.com
Subject: [PATCH 1/2] media: iris: check the packet size after reading from shared memory
Date: Tue, 17 Nov 2026 20:49:44 +0000
Message-ID: <20261117204946.21359-2-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261117204946.21359-1-dennylin0707@gmail.com>
References: <20261117204946.21359-1-dennylin0707@gmail.com>
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

iris_hfi_queue_read() takes the size of a packet from the first word of
the packet in the shared queue and then copies that many bytes, including
that word, out of the queue. The firmware can change the word in between,
so the size field of the copy can be larger than what was copied. The
gen1 response handlers use that field as the length of the packet, for
example to walk the buffer requirements in
iris_hfi_gen1_session_property_info().

venus got the same check in commit 49befc830daa ("media: venus: Add a
check for packet size after reading from shared memory"). Compare the
size field of the copy with the size that was used for the copy and fail
the read if they differ.

Fixes: fb583a214337 ("media: iris: introduce host firmware interface with necessary hooks")
Cc: stable@vger.kernel.org
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_queue.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_queue.c b/drivers/media/platform/qcom/iris/iris_hfi_queue.c
index bf6db23b53e2..5d3315f71623 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_queue.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_queue.c
@@ -95,6 +95,8 @@ static int iris_hfi_queue_read(struct iris_iface_q_info *qinfo, void *packet)
 			       qinfo->kernel_vaddr, residue);
 			new_read_idx = residue;
 		}
+		if (*(u32 *)packet != packet_size)
+			return -EINVAL;
 	} else {
 		new_read_idx = write_idx;
 		ret = -EBADMSG;
-- 
2.43.0

