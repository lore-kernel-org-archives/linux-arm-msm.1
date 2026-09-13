Received: from mail-pj2-f8.google.com (mail-pj2-f8.google.com [74.125.227.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A3FA36F421
	for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2026 18:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789322613; cv=none; b=Td1Tj5aQEiSpDTqxn0zMKtannFULCjHcQRkGY0gtMUQY4ACpYBKlOFp4+5EOmPkiye1g9Hn4nPOmc5k6tS+gM48l2weOCuWt5/c4jXpiSwA1cg7N/uJlVZvCsf6wEzjqEjSWvjunxKoo4bBSFXwC3Sa9TlWSQc454klkzRRz79s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789322613; c=relaxed/simple;
	bh=FpXuibbgunUKWku75TCdJBzKVddhMIdiIekGxKU8ED4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ERQbcqI/1e5cgfOjp7QQhmoE78mndipVoFxQ60yjUDfwkPejhINcSQk3fWeJErd3XzayiQO2aW+EigqxmxS0U41zHvZ/e1cwT9v9zSWja0TJx6aDVBo8NJ0K5ZiQ5EjHofD2WAn2HdnXSaC3ZCy+LN63ojllaiKjS6gTyAe6XKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b7CnKwba; arc=none smtp.client-ip=74.125.227.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b7CnKwba"
Received: by mail-pj2-f8.google.com with SMTP id d9443c01a7336-2d313798bf8so12342835ad.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2026 11:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789322612; x=1789927412; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=A8Z4lHNbz+UeURqdjUe4LqKVsnHKdKejzDleunOFUKQ=;
        b=b7CnKwbat8OOBrsXV6aCXwgUW3B0Rv79YRxzZ4S6BqwfssPksofP9PyqW0zT6hv3v1
         uV1RnTEER9xt7NAq5ZN/s0kaDf5AbUdLh8a0jTsS0X/cS/nNtSuN2qcR7MAdzAaJw6by
         36mPdU4i1CNROr0a+5e5w3FNPFxne6Ijyj/fpNbt3RwioQVXO7wD8Dkee1kVQkCenfB1
         tavJHpOZGUTr+idZcMem+diifsvi1RToWhH9nu8o76LYrMwKaD6+EaI2jNR2pprp9V89
         fWeuTH2d7T2xwcnvdsNlAXWhT1AIOB1cyErzgbMkPnsMH5ysiClRaPkTSUFhUy58ANQT
         l8Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789322612; x=1789927412;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A8Z4lHNbz+UeURqdjUe4LqKVsnHKdKejzDleunOFUKQ=;
        b=KBWCCtBRzvzeANLAl8R+mR7SsR8tusEAUdidHRpW0BjeU0O1AbVSnWbvoQWh2dWG82
         F3EGRvdB31dxPgjKlsnzhiEi4cQEocCDHvVF1KS+HcVoZyROdp+xp/ydnAE+U781BhGk
         YUg7cJt0TuPWG/mMJpDAmSHkzfx3y40zV0RdFSJlmnqi6MU3+uaYthJiRxV2EMOVqFEU
         vMMdUaMcA4iFJK6Ywek0DCrSevzEVxJegl7I1WiPtFFxslZEVvJOrfaaOdOVmM3KXikn
         j57t+jA1W2LC3+jw2Aw04rSKq6/JU2FSc7aOGx02q8akjX7P3+yQNTFtuXGQ+iF5tp6d
         xbDw==
X-Forwarded-Encrypted: i=1; AKwUvBzybnuRWpvTlCSPixR+y9FI8OcCwMnO0aCmvnRQ1HJhLXCtxIJ5YQl1/YxBRDpf/FWz2cHS1TMBGgFTsRk6@vger.kernel.org
X-Gm-Message-State: AFuF++kAF31NzBa4DgTzC9H7yYXLA/tTDC7Bg324D/h0VouvQkXEFiWe
	xKn0Ayb9C7n9WwMAQQ+i2jtaLc72pdW1qDTcqM4OTp3KuWzmmKAZkP0=
X-Gm-Gg: AYBFou1WhmrEIn+0F61hzDt3I7fvsPTJaON2psX4+2JaUQWzmh7TipZ3jhZwutIrJwq
	LkfYOvXRYp8CMxrMnSDKuvxYt/yBN8GemdnlBkpiOj/GM7Tvzs7UzFPeLqqe7hI1/vE349XkaZ4
	3NK/6376G6DrnmthD5azApiwi3DTC2A9rs8+ZyacSm8YDgWy6RLrGFTA09LMhwhX5WeSWRjjGfg
	3z902AD33AdoaoXTYZtNVp57T/nDP7m3R/RL6Yv1YIWwEIk9Q3gebSdHwfnXFKKZdcpc4M5PyAI
	RGNxOD2GBdnwPKtKFS42e7xSdyYwWw3IgZ+qIJZeObyH5YJplnlLnkFtmpzggSBC2u84VoHUrCr
	/IInleljee47C3n+hqx2CViUgfZhpmgBqsL6DrTTbaMZO5ip0fgFWCWy2WBC7FjCE1WR7Ajakan
	UQ0Rg1VQcItXW7alwaBEl6LNtjSdM8hI8D5XH7ZBBI4ddkTaz5UnF8gGHDg6IoNGF18L631CfkB
	Tnf4A9djDzaUZVxqEGCYABvMw==
X-Received: by 2002:a17:903:1a2c:b0:2c6:90ec:f601 with SMTP id d9443c01a7336-2dd4bc5b974mr133282765ad.8.1789322611675;
        Sun, 13 Sep 2026 11:03:31 -0700 (PDT)
Received: from murali-Aspire-A515-58PT.. ([2a09:bac5:3b24:1a8c::2a5:ff])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bc03ac1ecsm8749863eec.10.2026.09.13.11.03.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 11:03:31 -0700 (PDT)
From: Murali Krishna <muralikrishna2444b@gmail.com>
To: mani@kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	linux-arm-msm@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Murali Krishna <muralikrishna2444b@gmail.com>
Subject: [PATCH 0/1] net: qrtr: fix coding style issues flagged by checkpatch
Date: Sun, 13 Sep 2026 23:33:09 +0530
Message-ID: <20260913180310.8885-1-muralikrishna2444b@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

This is my first patch to the kernel and I am still learning the
process, so please forgive any mistakes in formatting or etiquette.

This patch addresses a few minor coding style issues in net/qrtr/
that I found by running checkpatch --strict:

  - Fix missing space in a pointer cast (ERROR)
  - Move trailing "*/" to its own line in two block comments (WARNING)
  - Add parameter names to a function pointer declaration (WARNING)
  - Remove an unnecessary return at the end of a void function (WARNING)

After applying, both af_qrtr.c and ns.c pass checkpatch --strict
with zero errors, warnings, and checks.

I would be very grateful for any feedback or suggestions, even if
the patch is accepted as-is. I am happy to send a v2 if anything
needs to be changed.

Thank you for your time.

Kind regards,
Murali Krishna

Murali Krishna (1):
  net: qrtr: fix coding style issues flagged by checkpatch

 net/qrtr/af_qrtr.c | 12 +++++++-----
 net/qrtr/ns.c      |  2 --
 2 files changed, 7 insertions(+), 7 deletions(-)

--
2.43.0

