Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795728619;
	b=GB4ktasXeeYdYpYIJwHatZlpHQMjQBENVtrstVO9HQtA4ZGwj6RYTRoiO3iPFR2Pqhs7
	 q1RyyFUn3H8VjNPs8Dc8Ov3GlUt1gsZH9e31EmbrGvZPKeWUmFgjcyLwoCqaFfoc/w1qy
	 l3r5lEfmSFvhHuSB3HBNhgIvt9/1jIf+uPQMz96ArKzu9kvloBv6UrRykcqm35MMUahVg
	 K7RKq4SKie7W/SmtkyW8lm9sDH3QGbqf/c45LSSKbvYMnmOmJXK9DdJWNXop4loJ1eb9z
	 tSX4pW3g0PziyzzBYPS5LT9E+NjwcmWyxMlhdgpQPodNwyMXVYfPNBz1R745xPBd9Lw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795728619;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=4RtbJlUlsczj6paARvmlvvR8jJ/pnRQ0EKYrkUxZGMs=;
	b=V1/VB4aXunfb4tIi/n3y5031PRlASmJ3jc/ZYcahxL3rD/KavvlDGoz4b1rFNpvf5JF7
	 q2/LYBhI3zSgUH8QfMZBMXq8JVKTU/K2J1t3Txd4IeY1Wt3+9QyYBEhpvEGjndizEUXiQ
	 RBScf4t9S2KfVoYpH4Dyfj8lukA1d8CKwqB8YbPIW4qhINVO1IqGoUvKpD2i6r0CseSso
	 53O0rmThOBbTXNIuDJR8V8sR8Kd0gj8LhXmsA7V9WDmhllZlEvOmAkr2vi6A6CFKy3gUi
	 t6ma1rxOAaEBVDXVhxUB+DpW6aWJVG/NvAzFRWvgMonF/SSjaAsZOv/RmXT6WP5Yt0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rBisZxHH;
	arc=none smtp.remote-ip=74.125.229.5
Received: from mail-dy2-f5.google.com (mail-dy2-f5.google.com [74.125.229.5])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97167606A31C
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 21:30:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97167606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rBisZxHH
Received: by mail-dy2-f5.google.com with SMTP id 5a478bee46e88-36ca2ffb757so214615eec.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 13:30:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795728618; x=1796333418; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4RtbJlUlsczj6paARvmlvvR8jJ/pnRQ0EKYrkUxZGMs=;
        b=rBisZxHHB05JDLE+7PoXSxuYALG/9iHUO6C/p/+sPT5zq+ULF64KAiBafYa02atIIi
         braoxd2zOkGmFUcUOMsC99KRLXL76FjTtOpgYmi3aMsps6WqaFVB7UKPaX/qGPTgjdFI
         BnQ0corxtMGU7WHBw5JBaB3K0wI+VN5XP4OGuG8ig4njmETAHoALabORMoXKW6SuNqIQ
         5u1jtNLvh2Pl3nnKNcvZ2zS+BysbFDy40KUbvN5Lx3JLbQcnTyVd3cAS/F3FVkl72ZEq
         kGuNYG9qY109JfKZWB9pCVBTgFjOc3W/m9WZJbyEuxikMueSZZxZHqawBOTe6HoZH3tv
         zOYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795728618; x=1796333418;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4RtbJlUlsczj6paARvmlvvR8jJ/pnRQ0EKYrkUxZGMs=;
        b=SlR8N0HjeR2MgDbcIPQ9z4BgN8lWcLlL7Twg0s0uiN7++kok4Jdo1tnAVTbk3z55QH
         sn24teifJqAc5oRleAOFYMH9+WQ10Z8kYNHinuIxyI8YVSVJoP1dkjP/MHc2/oHUFYAz
         x8ovvoPqiJqRURG7jFYLmSgb5t89kJCnpNEArU/FZPsgvv8fPt/6jrbzRUprPFjK79ly
         6FL7ihGzPQ0PxEBVligOwA8rV2rfox1hVuuNlN60Us8S1U5BPAIMs2gYTX0tyS6IgITn
         XnB/eksYLpkGBtf/N/IgmIqo8VEjE7h/0sh3V7+mr6CLPnBHQO9yPhNC+PG2x/ajgdZt
         cMoQ==
X-Forwarded-Encrypted: i=1; AL+hErEF/T/AKomrIxJYyaAOBZcMy6EBwoluxIdUGpNpjcbsGJ8CC6UzvJ4qjKEetY+NWXKNAiLt3XVCh+PT2jZa@vger.kernel.org
X-Gm-Message-State: APuU4Z8J/3aHDEMQG5GQkHER+DEJdjLdkQGQEOCSh6kVA8Cu2ijkEajz
	CqKPhm5MT75kC4/2J0mTu23dEFSlhzZx0maqbb+e0TnB8Hoo5gD4Sfg4
X-Gm-Gg: AZFdTZd2gOXeEyea3UT798ROYLsjjSGumnYlh0Zh/4q0xUYPlFJ/ZJA2AtumrXnyr1n
	E1KPlQySH7l2Cc6QC4RwaPHdcIHm+iHLI3nr2dW5lq5KqTG0K2P1cUK5XqZLfEalODdiZnApfdQ
	M0Rnu31ULt+z7KT/d90LirkHJkLqKJ8SLVTAGJ4cE4a320UK0zi9oUnqtA/GssBZLYk6cZpnxOE
	oSglYaZTJwWT+FIVSszfxiCeexHMAQs7YaOdsYi4NVkLioZRlfsm1Bb4KxS9XnfKWkVma1awSGt
	tt+37ZSVYOi7G0+gDGZiva3TtPjC7iM9lH6uuhgUK6Bb/9ZByLqCYRYcoh/6FOQx9iOgFYBnAoc
	dTaWWATelpZF6tKS255ionFrvKMBJ6MOROCZSakWzUjjWaf0pihUKiXCg3QFgW31VpmqMhp7jn+
	qcweQb4r/wxLHmoYQpctieQUIfvOCRPm76zMc6p6n9Ql6tvGLBwB9BoqWeV4fVoX/VpAJSLgby9
	/REUB/TdKhPMybuP7Xlyf+SbDCOSBEeBGQhCxrx2STY3p3ND8RLmZTXxoxIcFTFqD52P+o66uag
	e3OuU97cf9zZE8wIICLtr1sYkD5tRwTcDMcp7noA3gNzeBL7jLn6/oxWXCIczOocVjodt3XLIgY
	UQHYfADlO9jKixUDqTzvyST1xehTLL+JGlhpi0huQ
X-Received: by 2002:a05:7301:fd07:b0:36d:be15:2dd6 with SMTP id 5a478bee46e88-38570844f7cmr22309381eec.11.1795728617417;
        Thu, 26 Nov 2026 13:30:17 -0800 (PST)
Received: from localhost.localdomain ([76.33.234.50])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386b9bdafb5sm33434219eec.9.2026.11.26.13.30.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 13:30:17 -0800 (PST)
From: Hungyu Lin <dennylin0707@gmail.com>
To: vikash.garodia@oss.qualcomm.com,
	dikshita.agarwal@oss.qualcomm.com
Cc: abhinav.kumar@linux.dev,
	bod@kernel.org,
	konrad.dybcio@oss.qualcomm.com,
	mchehab@kernel.org,
	hverkuil@kernel.org,
	stefan.schmidt@linaro.org,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dennylin0707@gmail.com
Subject: [PATCH v2 0/3] media: iris: add missing packet size checks
Date: Thu, 26 Nov 2026 21:29:01 +0000
Message-ID: <20261126212904.27207-1-dennylin0707@gmail.com>
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

venus got two fixes in May 2025 for packets that the firmware sends
through the shared queues:

  49befc830daa ("media: venus: Add a check for packet size after reading from shared memory")
  06d6770ff0d8 ("media: venus: Fix OOB read due to missing payload bound check")

The iris gen1 code has the same logic and has neither of them.

Patch 1 rejects a packet size that is smaller than the size field itself.
Patch 2 makes sure that the size field of a packet did not change while
the packet was copied out of the shared queue. Patch 3 uses that size to
bound the walk over the properties of a sequence change event.

Changes in v2:
- Add patch 1. A packet size of 1 to 3 was accepted, so the check in
  patch 2 could compare bytes that were not copied (Konrad)
- Link to v1: https://lore.kernel.org/r/20261117204946.21359-1-dennylin0707@gmail.com

Hungyu Lin (3):
  media: iris: reject packets that are smaller than the size field
  media: iris: check the packet size after reading from shared memory
  media: iris: fix out-of-bounds read in gen1 sequence change event

 .../qcom/iris/iris_hfi_gen1_response.c        | 73 ++++++++++++++-----
 .../media/platform/qcom/iris/iris_hfi_queue.c |  4 +-
 2 files changed, 57 insertions(+), 20 deletions(-)


base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
-- 
2.43.0

