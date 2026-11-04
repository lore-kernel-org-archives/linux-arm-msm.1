Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793823806;
	b=ghiXgGMqiw0TfW7YwYB3xsHve5S0ipjxHFOIyThC9W9EsdROxku5Lap2yeDIdCj3KqFj
	 5G2S2LeCSKHTm4W3X8LqKCPk+Tk8xcgUyiwUBGkuI0UbbM5zgsbMtfEQ1Bljebegvoo5o
	 UHs+KGTzGEpF+Ip7CHPF/ltn+9N5XnYhvcBmlSttGulTMvJt/+R6l6SCKLVM7RHeS9ujv
	 bx974LBk918dk2N+O5JltufQ+qAaUcPUvs/4e+sxxzgaR/QQqxQwY7yhffM8iDUdJd23S
	 X0U8mq08XKFU4SRzt13Vs8CuIXDGFqS+kRMRk+FopoXD129prNIFLcyGgbcM23hDtoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793823806;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=0j93TeNA9tJq3iswKqqlnki/W9UfBZdAqtf2r5wDRjA=;
	b=jF+aRrd4eCH4Y1TqqZZDT+u51B+YO1K04IAjR97oVD7Wa6F1c2cwoqbhH8WHCDVtfDSj
	 gnjCjSgeokI+byiwROB7DT9+AXLcH/iJr5v/DcLatci1AcoRwUPFSnFsy+2qARZGUr7+Y
	 k/q2ufxxhLq1K7XFhg+F6fmasEHfBgieUrBTOBpEqVxsEd/eYBAw3DnqxSWzy3xl+ibAF
	 fbMD/C62eELhZyfTGZ1srKWyah2IuUxMEW7S6rjKEWga8xKkGkWfKXUUYXpAOxMZ/l9jm
	 Tr/OBpnvbcOYV1yf7eXJtH5so/vLagOF/A5N474SECC6qDd5nHA1mqfcSoaWltyo/Ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=fatecpompeia.edu.br;
	spf=none smtp.mailfrom=fatecpompeia.edu.br;
	dkim=pass header.d=fatecpompeia-edu-br.20260707.gappssmtp.com header.i=@fatecpompeia-edu-br.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=j+TomhfB;
	arc=none smtp.remote-ip=74.125.224.51
Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D69E6606EEB6
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Nov 2026 20:23:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D69E6606EEB6
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fatecpompeia.edu.br
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fatecpompeia.edu.br
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fatecpompeia-edu-br.20260707.gappssmtp.com header.i=@fatecpompeia-edu-br.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=j+TomhfB
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-675617e81f9so1142949d50.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 12:23:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fatecpompeia-edu-br.20260707.gappssmtp.com; s=20260707; t=1793823800; x=1794428600; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0j93TeNA9tJq3iswKqqlnki/W9UfBZdAqtf2r5wDRjA=;
        b=j+TomhfBAaKVUi75g2hFwXy80DA2hHOKpyyOCjlerB6w7qOvX0K82SYVW0B1OMQZQk
         4seWrqB4v/ga4ZVzEqiXjHqfcj3Tt8FT1j5OQpFmImIc7Jjd/Zx14xvGqsYLYWpHFmFR
         zF1go7sn4Y+Z2dk9BNECnIQhpT6792Q2s8qaSasJbUOL+r9wQ2vur6h9ODHcyEw7hBNR
         xeg3VA8opyCHP208kGs8krToRuYv/U7XZ3Ur681J/lhP3TPzszA87EbuaQSof/gvftqB
         I7CzXRiJi+zGOObGPW+zsQIBYKS4voMPgePcXQQdoqhwCO+tI78RqQfozDv+1qiTvyYd
         eddQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793823800; x=1794428600;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0j93TeNA9tJq3iswKqqlnki/W9UfBZdAqtf2r5wDRjA=;
        b=bGeXPmFDHhdK1WKFdjPQgXfXb5OAQTKptdawS90iqK5e7hFGsC9rXPT5K2kRIPRwCE
         oB6fytrPoxLV7kxpKvvj/cHzLzorBoG77RRZ2lVzlJzYfARDU7nrTC2ZhiSj4beeHqTV
         C55cHMwkjQQr+k8mW1q4k11oTU7Otyd2lGmkwEu3nzifenN+2pQNelZdj8TCu2BfEDhB
         4EZ0bSMwpsXrr8tF6ubSxP/NbWuuNdONam7mwrTl8tZHzDBjfOVI/r9aHZqZ0mETEVR2
         p8uGMcToNRcdjW0DnNRfMIQECPDnnThpnUuGdRdWY1B5ZdtRq205RE3PS5/69UOCvSE+
         M7/Q==
X-Forwarded-Encrypted: i=1; AKwUvBxpG2NyQ/bYdFNpmVAWCAxM5cBDE+6Sj3Lbgkx6COG/BPie6UQ1ejGVVD/iNTHLhgCEAH02TFY5eyGv7pbq@vger.kernel.org
X-Gm-Message-State: APuU4Z+yIRp3Kvbwg7jkEYpnInvqMQRebLmofJAeGX3a7fgOJIalQNPd
	ZhMNoTqM2K0rbe4CD3LX3ns0HjOAphwn4KTq0GiJ4aOCQfL6HZzDEo+ubddNAC7SKaU=
X-Gm-Gg: AYBFou2N9VkZd41WWkhRG+MqqYX1Vr5xO6EgV8aEeoNlGZcViQCls5D4fFe941ZL1G2
	2DvDSloEN/eTSQA8oU16Mju9ytSEy0mlyL0YLIiiQ6iFzl25BMINKZ1xFLTNrGWJDIimRm2prIO
	BO+XlsAoJ082SYOr5fOHnhTZLP8AV2gYOUyF1rPPn9Sbr4NqGrYTyJXFpDyF8om9RQnOo6H9paT
	QiiucH4Sj7c14sczH1PWI84DtEBlaHMoy1u7CZXefd6MQCzJhYxl1q15tZ4PQ9T9+SIADvGsjez
	pKG+O5BbXk7wv1CWFewAePW0TRJ97GA/GI+h5flPK8bkosD222PQeuoD4Of3EFQtZxNYmdoEl0G
	lt4+kD2EUFLSJ4pKZQSD0FZbFgWDSKXOazCSNVsdw/kv2AyE5HHqVovDc93QIfr9ib8t84tlbMu
	C/+5rDNon6T9Lz6dEzzM5QBxaJ1yyqbkya5yUr5AbrTcmq7A5DkvBqTpC07gfSVN1zd4qOxU5Va
	uQLRvIiTLgWlnu6dhNB2Ddgh9oT6+1ijtWu3F2trNKruxQO6vL1OmUvlJW/p2N9eQ1osqWfMAuD
	0Ba+gRw+ZLKCF+KidLFIUHOPzxGQYBJ1J5s0CBBVqWKYoo+Y7HeEJ5BAzkFqq3CfBBLeLXLck9E
	S8xQ=
X-Received: by 2002:a05:690e:1686:b0:67b:e1e4:6766 with SMTP id 956f58d0204a3-67be1e46985mr3226996d50.108.1793823799719;
        Wed, 04 Nov 2026 12:23:19 -0800 (PST)
Received: from localhost.localdomain ([104.28.244.23])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67bf91b6e7dsm1298292d50.13.2026.11.04.12.23.17
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Nov 2026 12:23:19 -0800 (PST)
From: Allan Siriani <allan@fatecpompeia.edu.br>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] media: qcom: camss: fixes for SoCs without IOMMU, RDI and CSID1 streaming
Date: Wed,  4 Nov 2026 17:23:09 -0300
Message-Id: <20261104202313.72494-1-allan@fatecpompeia.edu.br>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
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

These fixes came out of bringing up the CAMSS on MSM8226 (Moto G 2013,
"falcon", MT9M114 front camera on RDI), where the CAMSS is not behind an
IOMMU. The MSM8226 support itself will be sent separately; the problems
fixed here are generic.

1. The write masters take one base address per plane, but the buffers
   come from vb2_dma_sg and only the first scatterlist entry is used.
   Without an IOMMU the buffer is physically scattered and the frame is
   written over unrelated memory: on a 1280x960 RAW10 capture only the
   first 656 lines (the first 1 MiB segment) land in the buffer, and the
   device reboots within a few frames. Use vb2_dma_contig when the device is not IOMMU mapped, and
   refuse non contiguous DMA mappings on the vb2_dma_sg path.

2. In frame based (RDI) mode the VFE 4.1 write master buffer size is
   never programmed. Program WR_BUFFER_CFG as the downstream driver does.

3. video_stop_streaming() bails out on -ENOIOCTLCMD from a subdev
   without .s_stream() (e.g. the MT9M114 pixel array), leaving the
   pipeline started and the buffers with the driver: vb2 WARNs and the
   next STREAMON / "media-ctl -r" fail with -EBUSY.

4. csid_set_power() powers up the VFE of the same index as the CSID,
   and fails with -EINVAL when there is none. On MSM8916/MSM8226 (two
   CSIDs, one VFE behind the ISPIF) streaming from CSID1 fails with
   "Failed to power up pipeline: -22". Skip the VFE power up there.

Build tested (W=1) on next-20261104 for ARM with COMPILE_TEST.

Runtime tested on the MSM8226 (Moto G 2013) with the same changes applied
to a 6.16 based kernel, not yet on linux-next: on the rear AR0543 (RAW10
1280x960, CSIPHY0) every buffer gets exactly sizeimage bytes and nothing
past it, and STREAMOFF/STREAMON and "media-ctl -r" work repeatedly. On the
front MT9M114 (UYVY) the first frame after STREAMON can still run 128
bytes past sizeimage (one burst); later frames are exact. Patch 1 alone
already stops the memory corruption.

Allan Siriani (4):
  media: qcom: camss: use contiguous buffers when there is no IOMMU
  media: qcom: camss: vfe-4-1: program the RDI write master buffer size
  media: qcom: camss: always stop the pipeline in stop_streaming
  media: qcom: camss: do not fail CSID power up without a matching VFE

 drivers/media/platform/qcom/camss/Kconfig     |  1 +
 .../media/platform/qcom/camss/camss-vfe-4-1.c | 34 +++++++-
 .../media/platform/qcom/camss/camss-vfe-4-7.c |  3 +-
 .../media/platform/qcom/camss/camss-vfe-4-8.c |  3 +-
 .../platform/qcom/camss/camss-vfe-gen1.c      |  5 +-
 .../platform/qcom/camss/camss-vfe-gen1.h      |  3 +-
 .../media/platform/qcom/camss/camss-video.c   | 78 ++++++++++++++++---
 drivers/media/platform/qcom/camss/camss.c     | 17 ++--
 8 files changed, 115 insertions(+), 29 deletions(-)


base-commit: 8b7179210b22f8e48a82c5ceacb9d56a9c4cfec4
-- 
2.43.0

