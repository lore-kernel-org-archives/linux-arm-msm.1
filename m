Received: from mail-qv2-f42.google.com (mail-qv2-f42.google.com [74.125.230.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D5BC51AFE8
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 Oct 2026 17:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790877317; cv=none; b=dpSlDiuHrBEa9UNFCLQ5kH/6AYQNUHwT4eUY6ocxsan6mCpKq8Jv0y21g7B1tcKtk+479FNyDtLpS/N6YM5H5r4QcK424GhVY7t+gWiEwhugdWIkyv22ShWzx5gUBoRr7DG67Ec/s2eQw7t/StmN2+tHrDnHu1wPWOFH74M9CxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790877317; c=relaxed/simple;
	bh=SOOCumC9eQ+FqCQBhWQsEMA9l7NUzxXaCBLLHxZm5Iw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s6XQPObH06bUTk9VM2C8giVxh1PwmKSiDQcE3JoUG06SZ45l9Q3+KGmUJYjQjzwPUTv8+mOtV4QVVwGABPEV3zBZN0PPBbrov3wgxJhmCvSSQERahlXu8VvbnKAADZs0JaHt00D1nL2DTSUWgViBJDWKQIBJ2Uao/U4uVYKokUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QQZhE5zI; arc=none smtp.client-ip=74.125.230.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QQZhE5zI"
Received: by mail-qv2-f42.google.com with SMTP id 6a1803df08f44-917bcc8705fso2995246d6.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2026 10:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790877307; x=1791482107; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mAtw3dj8Gb3TJS5ccNgw7hK/vAKH4nT24lqGQ5QRDdc=;
        b=QQZhE5zIEfFTgXYmCslpda8fhWtO9mV/idwQwjftpnZAYn1cFZU/+N3j3Xg98weI9D
         rRxbV5e2zMNnAY2eDf3fpNZPEs5R2RdJ7bY4r8Y7+yb/jZR3SnZXZUiwT6irUAleLjGn
         rlxoh4ItxZWvVso+AhdfqWj2ZWgwn+CPMF5z7xWJyBc91H9c8gT+NoCJG12maWO5AdAh
         IMmtSuQ0Dq9kSF8KPvbj3kC8D9Oka64PEYoCWPoLe81moz3A2ubmh6/LXK8kCzDey4Q8
         mLK4bHQ4bbnREfV0KiOgDi8n/m3PsVr7wOQqGmXFpSxHByhpUC3TAH6e24OakhrHya4u
         BeSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790877307; x=1791482107;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mAtw3dj8Gb3TJS5ccNgw7hK/vAKH4nT24lqGQ5QRDdc=;
        b=0nBbN/FiqzyIMdQ+G0Nj6XgSe5oJT0PYcGgImbxX4ooJIfJ7U3BcQpJ1iAfRd+HHcu
         /0aYJ95H0BlW8DJj1EefPGckdV1RSunqdsZZNZP0LtzJcEo7eC9YtvB0uVdcIRrYBBZV
         bPlMRX2Xn5bv3VvjdShEZzJGAa6ZeF9NPWOnF871Xb2kH8102A/PjC3YLhIiD3PdIlLC
         cHsymATJKlR5rAz7fyHP1zdNOCArciHK99V46rReq0f48T+VK3NG3VSq3YdJESYpiBT3
         x0MPzGiOitaMh2/T3Z1PvLcJJCU+7Ha6TO0EYjXe6HkY/U04cFAfxmUOlh+l4WGYSrfB
         8FRQ==
X-Forwarded-Encrypted: i=1; AKwUvBwW2J/P1QxJF0BMPUqUif6+hdLKf1U8iYFSX+6EePWCuN1RP/8nZFoE0QsqsEhsiREB4tCcJ42WEij+iY3e@vger.kernel.org
X-Gm-Message-State: AFq9FYIV1Nm3m6T7z+uR2fxqlHVVqWCKC9gWZq2234KukXGGJGvfan8e
	THHpj0sB7VwlcdQOhyRH4qAdWvR08CCEHj/Iyp9V4vMZO3e56oTSmt8=
X-Gm-Gg: AYBFou11BnhyMQjEsQnzJrU9VeSp61T1TfD+eIzqd24ANTfR+PV/RSysxqTV/iIv4Td
	SAgnGnRKgExxx3Nu46a5raduHd7MlEICtOhL39oYPH6i9jyMrqMKCt/MV9d6yOyDD9otoQ1Q7M6
	WU0t6ZBrpm2jxMSBib7DdibgPx4jesKaR+nzRS7Rg+j/mA0OKvL/QTvS/xpMIwx9xF0t5Mab+Zf
	ZfL5CDuspOPh0evFi1SwSuAZNbYrl35bsT1VkGiCuzAe+zMpGe2jSMhgXCh9HafMWkiEJE/8+C5
	n8FU7OShARE2gDKe7IJ6UGRnORGch7+LoFt1WMioVxo+SDy5GtuKoNiJyXXksdyeafm2eAMtpeF
	GDV4rIw05jLqGXYng8r8OuJTCi5oPFxfFGSJkR/vN/xg+CCsqLSwyLP04K7nk+RO6vHZzBKRIVn
	HEz4eUcREf3m07IifixkiTNpEHoc0RPIhh98gsSt02K02tfoH6UO03Baw53o7312jxRbvz+SAMU
	djtAWX7RhUJXK1iwakHUP5unqRQVzYwXeud4jho9CWx+B8ZK5xy8t/+s550HmuUz0uz34S3oVtR
	Zr5+T8Er1qkTNXLiG/JBm/eKMZme
X-Received: by 2002:a05:6214:53c7:b0:914:52bb:688c with SMTP id 6a1803df08f44-917c009ef8dmr4828476d6.15.1790877306628;
        Thu, 01 Oct 2026 10:55:06 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-917a8a22f96sm32077796d6.32.2026.10.01.10.55.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 10:55:05 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: mhun512@gmail.com,
	Bryan O'Donoghue <bod@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/2] media: venus: fix HFI teardown races
Date: Thu,  1 Oct 2026 13:55:00 -0400
Message-ID: <20261001175502.4045853-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260925191653.3144006-1-mhun512@gmail.com>
References: <20260925191653.3144006-1-mhun512@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As part of our ongoing static-analysis research, we reviewed the Venus
teardown path and confirmed the race reported by Sashiko.

This series fixes two HFI lifetime races during teardown. The first patch
waits for the hard and threaded IRQ handlers before releasing HFI state.
The second disables and drains recovery work so it cannot be requeued
while HFI state is being torn down.

The later Sashiko report also identifies a separate resource leak when IRQ
registration fails during probe. That issue is outside this series.

Changes in v4:
- Rebase onto the latest media-committers.git next branch to address the
  Media CI base-branch check.
- No code changes.

Changes in v3:
- Send through git send-email over SMTP. The v2 cover letter incorrectly
  said git send-email was used; v2 was sent through the Gmail API, which
  still wrapped the diff --git lines before delivery.
- No code changes.

Changes in v2:
- Regenerated the patch files with git format-patch after the v1 mail
  delivery wrapped the diff --git lines. No code changes.

Myeonghun Pak (2):
  media: venus: hfi: disable IRQ before freeing HFI device
  media: venus: disable recovery work before HFI teardown

 drivers/media/platform/qcom/venus/core.c      | 2 +-
 drivers/media/platform/qcom/venus/hfi_venus.c | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)


base-commit: 4a069a763e8a86821edac4159f7c59a20015631b
-- 
2.53.0
