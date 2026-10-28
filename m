Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793201678;
	b=lj3ppQs/e9HMf4asJ29lBGsEUico+DVVl3QXvHH492dno+h+z+XYmCaOlMonr2h5dAGm
	 lLFNnC84cG7WZOdruPN/l//4Y5p5Io6ERBlyQ0xYjIQ2sHt5wwxTZUfN+CfJPFn3Qxt8+
	 Mx7DwrODLd/5O4jgH9igtO+TJQKD4hy4aDtODurwRjonsj7a/3I8+8IROn3y54INfzudb
	 XHspaqCksMTipugQAG/eijphwjKIIj5AHR3FbCs2j+ZM4B0XjclyytAnkPeJMEO/WGmnh
	 Z62+hbcVY/xRBI+2y+tpa6DMUwIRxv/xex8NPGjjG7UTAxV+zXf/GiJhi+LyttMB56w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793201678;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=nwQvp5gT0x4Cpwf86+olDk4WVML2oNByPo4ORkg5KCw=;
	b=1/deRa8guNWZLck4NcUF4agy1JEaHxEPiwtLmFHm2CM9Bj8Bw0fYNU8elVv3SQDSzhJ8
	 FlCEPhHC/VQNHtsp8Cqp+JDgcWCAF5oSgYWoomOXRIKFvggiJMdeJqa/HkNFV2WAW2s6R
	 ZyjWI50vIQRs8XJ4sqbcNXg7q7CnShJPAga7VB1OGz932z19/Q61FNs0N01vYCTRU2RDz
	 2adNx09dSg5G45FaB0QYF8plqsMzTbsLjfP9QIbHR/YwcHddwKglUxPWj1R0/IsC5+4CL
	 uzKRAxsW6Glm2c6Y+CqY+XM62MhYxcUKclcI3t4+hiq7kKL36VmAbkeofZVc2DsCyjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CQMZ4hD4;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E331D606A323
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 15:34:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E331D606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CQMZ4hD4
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a599e9110eso3878455e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 08:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793201676; x=1793806476; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nwQvp5gT0x4Cpwf86+olDk4WVML2oNByPo4ORkg5KCw=;
        b=CQMZ4hD4sVB4t0bzFakBLUKjDTrGYS3mdtMI0Mk9SqITBCUJ/Q5kUsVwo/cjdYl4r2
         Gj0jSmbHV0IcRDbeLEBRdiwmYy/TNMa2GgVWaNLuOEQu7p/KcrRi+NDnoxlrCtoGmnCf
         iB7fUXehopDG3JisGR1WTJio6CfokUl6bMkicidOn2udHddVNf/YNyxFbsOgoEhgCG3l
         SKFemmXOBmpAZzo/oXCybTSVoMI3mlXcweJM8J6iZZ3F1gg69y+WRkI3JkMB2k5uslJo
         Q6cCnuME7SfxFb98pVAlp80QGk9J/k7wKCW3HE3uPvCRav3rOG0jEQuGee/+B6/Vshjy
         szdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793201676; x=1793806476;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nwQvp5gT0x4Cpwf86+olDk4WVML2oNByPo4ORkg5KCw=;
        b=Lz4rzsb1MDKLEJMCH+w+AN9Kl5sgC5tDoEm6dSyWlB89DaDZpa2U63qKXxJcZDGSYS
         vL9pugdcA92VgXFAatyq7bCXIk2J+FdF6Qq8nA2nJ+h00lyDrNyv9GoQJ2gbgedSVAES
         h6ovEeqwPg2JZKZnUA4Uw58tB6sUaLKB4smUFn/vupwUdFD3pTP3PtZ+l9qsdMH67lFn
         KjkNjh/J/jFLRk+o33JpchO+skOX/sDmFoFqR5ooG+Vo0EWr+dGau7H0+qoS3AhKi6PB
         K3+ONUlubZxeSiybJNOLDkcUWCfGMsbYsHOda2xN4lMZFWXl6n1Fd65MO8rGUohurg+s
         ad7w==
X-Forwarded-Encrypted: i=1; AKwUvBxuZUn+TRzw/h16nO8su1Ftt1mkpeh2fWf/lGc8tH7z+WxStwryu+QopzFBumLMLOx+1+u9dAOHiXHf31Dr@vger.kernel.org
X-Gm-Message-State: AFq9FYIJq5Z889ahA4/dXFGelcHNj/eHcGvEihX+n9aG0cr/xUY5C7Pu
	nh++EuiLI/95AED2lqkijhEdeXY01FmGA2nLuFkct6zl3ndqBJBoUwb/
X-Gm-Gg: AYBFou1bCDR6yoyhGoJNN762zM/go+7LPlb+Ox+GfBLU59uLaCfySBvs7iufRZXRqlF
	jH2i6S7mo949tFxLLjch43uI3x+SARQEBgU17yNhp29Xs+e3moRnseAAVrNgfpCh0/KBYcUCVjE
	vcM+EagBm+M7ToS8qbWCH5NsvWO84Dl1pQXmSK6A9PKQt2aOuBKSCLx/eGn49yWDomGI9Smbs+D
	vUJWDXnlLJwsU0y/d2xRrZRFSBOZckG+U4Gva51wmPbVdwUFPqUENH2BV/EVmWznejB9QlH726h
	eGWVDN1cMtcNxpJURlLOMEWN+9uoRtEhS0x1KOAQEQTUs+ftnyDtXXrrExT/Q8YWUserFHYmp5W
	xX6YZFeD7euhP/coMsqJqWCWRVWaLtR/Ilcirh1R9JehX7QQnSwhLG3FLi4/R1EqH5iwYEhsUcD
	qctCFwlBqppLkMWWvxyhrlZ5QtotnQjnMJD/ELmS4+De09U3wAh6+pl/r6wtJaKpkD6ibBvu1q/
	b7XS+EvK9AIDDTB8msQ57Gt+4w2fzuqvE81+deMdwI7Z0tCy82PFis/+x0113ETE1+jIJeXA8da
	crRvSx3HXbgFM52rhwFPeGSFrPnCuci3yenn7kYE0uDrG08IGbQKfRSqXZ8AL60rqQBkuCYQo26
	O+dC7SEkJl1ogYu7l12r5nfQ=
X-Received: by 2002:a05:6000:2ad4:b0:48e:60aa:793e with SMTP id ffacd0b85a97d-48e60aa7a9emr3918828f8f.3.1793201675959;
        Wed, 28 Oct 2026 08:34:35 -0700 (PDT)
Received: from thomas-precision3591.paris.inria.fr (wifi-pro-83-149.paris.inria.fr. [128.93.83.149])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e542ed998sm14428423f8f.13.2026.10.28.08.34.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:34:35 -0700 (PDT)
From: Thomas Fourier <fourier.thomas@gmail.com>
To: 
Cc: Thomas Fourier <fourier.thomas@gmail.com>,
	Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
	Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Philipp Stanner <phasta@kernel.org>,
	Akash Asthana <akashast@codeaurora.org>,
	Roja Rani Yarubandi <rojay@codeaurora.org>,
	Wolfram Sang <wsa@kernel.org>,
	linux-i2c@vger.kernel.org (open list:QUALCOMM I2C QCOM GENI DRIVER),
	linux-arm-msm@vger.kernel.org (open list:QUALCOMM I2C QCOM GENI DRIVER),
	linux-kernel@vger.kernel.org (open list),
	linux-media@vger.kernel.org (open list:DMA BUFFER SHARING FRAMEWORK:Keyword:\bdma_(?:buf|fence|resv)\b),
	dri-devel@lists.freedesktop.org (open list:DMA BUFFER SHARING FRAMEWORK:Keyword:\bdma_(?:buf|fence|resv)\b),
	linaro-mm-sig@lists.linaro.org (moderated list:DMA BUFFER SHARING FRAMEWORK:Keyword:\bdma_(?:buf|fence|resv)\b)
Subject: [PATCH] i2c: qcom-geni: fix double free of the DMA bounce buffer
Date: Wed, 28 Oct 2026 16:33:52 +0100
Message-ID: <20261028153353.69651-2-fourier.thomas@gmail.com>
X-Mailer: git-send-email 2.53.0
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

geni_i2c_{rx,tx}_msg_cleanup() release gi2c->dma_buf through
i2c_put_dma_safe_msg_buf(), which kfree()s the bounce buffer when the
message buffer is not DMA safe, but leave the pointer set. gi2c->dma_buf
is only updated when the DMA setup in geni_i2c_{rx,tx}_one_msg()
succeeds. If the setup fails for a later message, the function clears
only its local copy, so the cleanup helper sees the stale pointer from
the previous transfer, unmaps it again and frees it a second time.

Clear gi2c->dma_buf once it has been released.

This bug was found statically and compile-tested only.

Fixes: 357ee8841d0b ("i2c: qcom-geni: Store DMA mapping data in geni_i2c_dev struct")
Signed-off-by: Thomas Fourier <fourier.thomas@gmail.com>
---
 drivers/i2c/busses/i2c-qcom-geni.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index a431e98723ef..78701310936b 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -500,6 +500,7 @@ static void geni_i2c_rx_msg_cleanup(struct geni_i2c_dev *gi2c,
 			geni_i2c_rx_fsm_rst(gi2c);
 		geni_se_rx_dma_unprep(&gi2c->se, gi2c->dma_addr, gi2c->xfer_len);
 		i2c_put_dma_safe_msg_buf(gi2c->dma_buf, cur, !gi2c->err);
+		gi2c->dma_buf = NULL;
 	}
 }
 
@@ -512,6 +513,7 @@ static void geni_i2c_tx_msg_cleanup(struct geni_i2c_dev *gi2c,
 			geni_i2c_tx_fsm_rst(gi2c);
 		geni_se_tx_dma_unprep(&gi2c->se, gi2c->dma_addr, gi2c->xfer_len);
 		i2c_put_dma_safe_msg_buf(gi2c->dma_buf, cur, !gi2c->err);
+		gi2c->dma_buf = NULL;
 	}
 }
 
-- 
2.53.0

