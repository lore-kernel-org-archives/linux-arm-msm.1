Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792809657;
	b=glIdk8Pq8B/+tQOQyWWWcaOCowb5L/b54SZiQXb7JMRR3G9IYILbeil5aMCMUj3hq+7S
	 yx0O5E8lVbyiKMdQUGAir3QUhkviJwMObC5CtR5pia6AfxWS8BKLnx5KUqg1+G8uZH9kw
	 NFHQWXvWoGx1amffC7eybwJ6SSMa43TJD1edCp3+Cb3V6cfbXyesiVO/P0ArZWTRoh6Em
	 6TC0N1QU4MqLH/gExG2u+6W8vRtcuT5GIcwB1qv+LTX81sn3E1roQMZUWK8Yf87WL8FmB
	 jBwye8wtoYWiL9cGpkYL7t8M1fy7Oz1O36ao1qFRBVMtOs1Xq/0btZSKSFGvv2Tr8xA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792809657;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=d4mvKHVg0u9lhgOXNdg3AlX0ucHCymbdGcE+4K43yLg=;
	b=z5UUQESyZZLPfGiNOdhN5SP5XqX0T6zgLWWjhij+HXdDqC/Y6thnvkLMduHxQrcQB3p9
	 ifW3lrZrZSixdweL5gHU0vFE5MLC34yHdAypDNDexnPRsOpke8r6U0E640QmNNs6TPZmu
	 T5ODV82FdVq1vV0Jv0ZzEDq5u3l3ezp4FKNsSr2sXMu1PdbcgtRf9a842UUX+cZFgJ/Km
	 EfOTz139TS1gcI8nW1hXhVaI+T0p7PkCW0LH7BKg+WBBCj2CqHXYDqsEoBd3yocS+cKlG
	 sDEDJ+tZwxAEHZkjt5wzXzcu1czIj+RvaChIi8+Vj3Zfno3reKE+C8NurGfYaQVGFKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ovwbUIQu;
	arc=none smtp.remote-ip=209.85.219.51
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59E42606A332
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 02:40:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59E42606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ovwbUIQu
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-917bab38b14so14833236d6.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 19:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792809655; x=1793414455; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d4mvKHVg0u9lhgOXNdg3AlX0ucHCymbdGcE+4K43yLg=;
        b=ovwbUIQulR/trzGPUe6AcLFuBGKSStkt+G9NV0x/7+h8nj3ReutjCibybUc6ZFjQHm
         lfBVGmkk5rWNBMNKWK5v0A5IOxiDq5ULKr6rKEBivFivT3xDaR2Ye/NBC6e0A5QJd7GX
         8zGnXlUgwunCf9VHNAT/nroUrPc1lGIm9inioB1hh+++u6OMboobvWKF0vfY8sJKDBn1
         ZgXiIex0X3gA6h40TSXVieXjR2yvvJITRE4YI3uHR9rfqlY0WDR7eSrGwXZd/T89JUSv
         1PpaI3mnE3HWO5RAarekm8tthS5t1YXfowWa2XuQDaOpoQLuaaO5oTpIK/O9sZwkullo
         13wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792809655; x=1793414455;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=d4mvKHVg0u9lhgOXNdg3AlX0ucHCymbdGcE+4K43yLg=;
        b=M1a/ihrcimTzpLRx2ZBQpTNPYkv96Y8HXYe2LqeULc6bs68P9itjQyqEk61DaAVxu3
         4nQHqyagiYUusNsel7S4Lm6S24WeJYGVsFkSz9PzDqB2LHkPF00MhlkUM8NgxMMYwxYi
         k2IFQjrdq71FzR5oWavtgbkRQbULeWYpyqthaKThTNnXn2IC7bDL7xHe3chyXbAC8mRy
         G5qhEkcFfFtSc7BJJoE522MOQO+PYF3+XKs+A+RCb7GukTTZl40E91jSK6TrAmF3yMlL
         iVv9B+97crwBEIAsdsFJiJvtMpDdKi6+5MbOtUiFIqi0qgI1OZjwJoJiC7JPCvzI1P6N
         r2xw==
X-Forwarded-Encrypted: i=1; AKwUvBwUYB7h285Y6rfca9E3/A8cCvCmL98r5+htMDNP15BtCCNvh3jDYHiJ42gviaog+t8tTfSx0Pk90drJiJ+K@vger.kernel.org
X-Gm-Message-State: AFq9FYLadhoDV9g40lEb3yTGv4SV8R2tl8K4FGvGkETCv/CQyJy2FrTU
	kkzAPX1zfLdA0A7BD2fUiiY3beUKaTnWyxKIOrA7V211TsPy1NvPaPs=
X-Gm-Gg: AYBFou1VTlhEbuPQKO1PCBEv040WBMbWa4qHB0dQQzgiHiXQIAj8PugHy1s1VEltjkl
	FYNzpUZLENK/vEWKtjMXv/XhugFexk2F+P+BZiNH0b2SrzqbgGtYrkVdX2U1ABrCuA2f02yCZ6e
	c2t408nVA+cAeHBddOdO7H3dBrNcyl7G4TVG9+TuZcJnqFDNsb8NBM5XoNZSFZrlJ0sQeOhT8F1
	vQriq7ReXQXsOx+Mg2Y5xVdomC4T2C7v+xMV8ZQNg5XggKpfhrIfQu4QeuzvC+fjXheaMnkcUaJ
	NzNALT0ComzE5XDbcGYrxOOY+D/Ji1cq7xBRiWspP1VLIZV7FDipKwVOJ51Yzse3Qw5nsksi/Q+
	75SJ9UfEii6yjaqoBxOYmg+nPDhAZmeloetqnQexNjGH5XcLm9iWqAJB64zh19lOltd8iCUt3jy
	q8wyPgo+g8iy5j1SrOOtu/kPhti+6/x68cQPKwZ/xYLaeJ4bowxISlTPNKkVPewQIzW7/0zSggb
	Yp03HOe1pKnz1U+tZwxZNt6AcysEFEZTzSqu2O1gZ04o/j/90my95r748ye0J0qjQn7gWC5MAEw
	CbS25I019I3gRVNuSp2SY4oePKUz3oOhj31z0qVGzTB7rpSSqS++ZV8+i/kWLBk7nMvq156vzgQ
	Oqclw0w0XBQ==
X-Received: by 2002:a05:6214:ca9:b0:91c:1a4e:425 with SMTP id 6a1803df08f44-91c48e75052mr14414866d6.56.1792809655265;
        Fri, 23 Oct 2026 19:40:55 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c48feca9bsm7203526d6.39.2026.10.23.19.40.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 19:40:54 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sashiko <sashiko-bot@kernel.org>,
	stable@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH v5 1/2] media: venus: hfi: disable IRQ before freeing HFI device
Date: Fri, 23 Oct 2026 22:40:50 -0400
Message-ID: <20261023223635.3c895c4752c4-2-mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261023223635.3c895c4752c4-1-mhun512@gmail.com>
References: <20261023223635.3c895c4752c4-1-mhun512@gmail.com>
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

venus_hfi_destroy() frees hdev and its interface queues before disabling
the IRQ. A handler that already loaded core->priv can therefore access
freed state even after core->priv is cleared.

Move disable_irq() before clearing core->priv and releasing HFI state so
both the hard and threaded handlers have completed before teardown.

Fixes: d96d3f30c0f2 ("[media] media: venus: hfi: add Venus HFI files")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260612103333.5585D1F000E9@smtp.kernel.org/
Cc: stable@vger.kernel.org
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/venus/hfi_venus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_venus.c b/drivers/media/platform/qcom/venus/hfi_venus.c
index bd82066bb6e77f68ac3fe1440a8b5429ad62a192..e7e4e78a186adaa7fd80deeb094ed53d54f27ba6 100644
--- a/drivers/media/platform/qcom/venus/hfi_venus.c
+++ b/drivers/media/platform/qcom/venus/hfi_venus.c
@@ -1689,11 +1689,11 @@ void venus_hfi_destroy(struct venus_core *core)
 {
 	struct venus_hfi_device *hdev = to_hfi_priv(core);
 
+	disable_irq(core->irq);
 	core->priv = NULL;
 	venus_interface_queues_release(hdev);
 	mutex_destroy(&hdev->lock);
 	kfree(hdev);
-	disable_irq(core->irq);
 	core->ops = NULL;
 }
 
-- 
2.53.0

