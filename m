Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795752942;
	b=YtRP0rKtTcjxk8opnOOGHnu+3WOGVJ2w2S1mx5EhhuNQ0durcuTsr3wxfA8zzGpTaDWv
	 PiQBlF/YUjf1PuD30qm6ET3P7kKnncSGBUZY6g3ufm5OTkKNcSgYQ7U/+GBg3fBUE1MF9
	 nUwIsGgb4Ne6gu17Dp0w3TTgUnfCgXJATFga45zRDu0mCvdLAz4z5XtSVdv3AgByoASHD
	 R9rPIi11B92QT2gBACUuiiN1g6H1G0TGMkhqdaYpsZE7GP8iQIAj361TMaUQf5Xvime8Q
	 NyuKfeVu+MwmchLLhCcqU+HG4DDMuyzM+DoE9NDq8nfCuLGQnJWJkPdN9YT4sQU7Vgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795752942;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=bHf5cXXltkgpad2vo/4TSgTr50gXfdBsa3VtXa/31i4=;
	b=kKlZhyvvrRStVNDYSSC4KZHIjbO7lBMhJ/H4OP3+g672nW+plWsKEm7VFLkjmOl/M7lJ
	 oaIT/exJrsBiWfCRZwenn4Dim9Z7tEXThVnexT7LAP5g5EPB8TV16hzI2xl9BB6NxjIfd
	 6Kcoo5k+98/LkapsADRl9NAQahB19UEACcOTRA4KRyMW3MIiIVPNOs1mNtqScgaJbniGa
	 MH52L7dSqQlJprPRZsOketRw1TT4qfqgUfpd4LgPWD+jA6BASAPHS6dIoUY8Rz0uitFdN
	 R3zx2SI+vMRY5jUn5DK8Zptrjld1TE6R8HIAMutqmMO9QwlinrWbqi9ity4DT6nm9ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="QOM/UIr7";
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35407606A321
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 04:15:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35407606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=QOM/UIr7
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4bb606491faso40446405e9.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 20:15:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795752939; x=1796357739; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=bHf5cXXltkgpad2vo/4TSgTr50gXfdBsa3VtXa/31i4=;
        b=QOM/UIr7Ult8U4nZY1f0BqSwC+4kTp0bzbhKCPnhI/erSvvH8DsPAmohIbPwwdTWNN
         sQE6r0/wGWihhyG3mX7KuXSNXEqfz7aTqM6Vh3B9TCINNB+PxRrCUfKxFFiCvfd+wPAO
         IQMAAmmBO56QgEqHb9r4id46ByAgUkUK/0v8RSpD9voEMMYXu8mkmvkWgxlM0x14+euh
         qF4P5npcMlzD7Rtmh0yxiBJ7j71c5Tyl0FzpZxkHcW5XrkTMo3RzDn1nJznNpQUOe3mw
         eYC6SBQ46KWwlTBfsvBavtNTZBnO2as3rmD2lmeHnVuUlQuNqPr+/SOhgcHb/N2ETzDB
         ULuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795752939; x=1796357739;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bHf5cXXltkgpad2vo/4TSgTr50gXfdBsa3VtXa/31i4=;
        b=ROJ7NZRpPFdSIwZ96jH/HIB6PoXd9J9er87Yd1u84HAxXrx/i7H/H1klYoMU8ZL4V/
         GOf+wAvbJQlztA+S/ilcdyKSxwX2wOkjzkyhnM67n0KMx9P92HgAIYhWzmm6p+bXvtVK
         K0jv604yzBWVw7SshMFxYWCVfjfZO5FYPN0tTEPitwTKG4MdO0dnfRYzls4JUmZJgZn9
         UUoEbQ2sgK/xDUFQk6CclUFd8uo6u4qa+jI/Jy24WBPaY9o9ScvDZSA+kcPAcERRzicN
         nCu+UXRDVnO7Au1BIGf3x3X9asVIIsMB9PRuY3lLUGwYPCTTyzN2KohFoyNjvTGGJ+Xr
         aFng==
X-Forwarded-Encrypted: i=1; AL+hErFNxIYk8eKzsv5w8S7u6CBCOB7ZGFgPlJ3cfY1hkn0bbHdA8u+QzP7DsALnN4DZP+mHTUhbea+4irj+IXRI@vger.kernel.org
X-Gm-Message-State: APuU4Z83nomB4nkwPkTz59HSQIGv6Kg60pv+0LI1ZDeill3TIFEN83Ag
	PUjz9i4hiABCmQ0pwLXZUCV9ft9oIYGeWUGH5b5PBs9zlO0UUX6aBDo+LYGZPhSd4nM=
X-Gm-Gg: AZFdTZeLXgSpYUaUJD0il34WKohgGDOo3hEke97OJ5M2RbEkW8xeZBC9ETvnaXgqmRl
	yMCzYgIrFPFJAB3Ww+jY6TYLgEISYP7R1nuGfT9mL5raosmPtKWyw0/uHxnh/8xgVLdzeFXJDdc
	HJgyyqB/ipOC1rDR0Ox0bUBk15VTQBdd0I93A0By+l9Uem8VJ/bfCfbQA70eoOjMSE9T29fss7q
	HiFS4jrpoyX8tTp/FwQ/K4cJapUzUT3BISsbROfvQsr0NkmvqM5KQeAgnWTkF+M03O0Lv975ZlU
	YDIcw6wzgCUJLrDBtnK9op8RAV+YgAGinhhFudY5r3oGP9CDNxd3ZVTsHvi1k8XMYizWFI6g/TJ
	OHgsbZk9bcccFlNnAALI8nS60KlCce2EURUzWTOoSd84eakqvpufPkZAMVkI+0Xh9jofsbQNKJa
	sIO08M+qlu3cUXPM/wCKfRuVtipG9ISs1zZ8T5XD+UJ26YdmKDxME3YvWuaBGJ0Yks9jYQZZhzz
	XBf2WYir1J48Tw1jZn8fddMpSVmB19qB4Eq8r6ItVWSkApaT8Ik7w9/ewXsP2T0IoZ/+hViaPoG
	r6Wrt0KFXECnjnECcuU=
X-Received: by 2002:a05:600c:1384:b0:4a2:1612:6367 with SMTP id 5b1f17b1804b1-4bb88816c44mr470580845e9.15.1795752939556;
        Thu, 26 Nov 2026 20:15:39 -0800 (PST)
Received: from [127.0.0.1] ([109.79.27.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88442995sm686987465e9.2.2026.11.26.20.15.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 20:15:38 -0800 (PST)
From: bryan.odonoghue@linaro.org
X-Google-Original-From: bod@kernel.org
Subject: [PATCH v2 0/3] media: qcom: camss: Two routing fixes
Date: Fri, 27 Nov 2026 04:15:29 +0000
Message-Id: <20261127-camss-routing-fixes-v2-0-b7152f0af49a@kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32NzQ6CMBCEX4X07Jp2Y5B48j0Mh7YssP60pAtEQ
 3h3C949fpn5ZhYllJhEXYpFJZpZOIYMeCiU723oCLjJrFBjaQwiePsSgRSnkUMHLb9JwJlz5Rp
 XnVrUKptDoj3I4q3+sUzuTn7cprZGzzLG9NlvZ7P1/j/MBjTohoist1giXh+UAj2PMXWqXtf1C
 975VzzJAAAA
X-Change-ID: 20261122-camss-routing-fixes-b178bdb84f20
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>, 
 Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3835; i=bod@kernel.org;
 h=from:subject:message-id; bh=aycJqlvHjcbzLgomZhj0p03rDZMloDfOoT2gyU2UeYU=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBrCQPnGrJsjZzNLDuNRaTCr2RvMuc79AkF34iYH
 9/Ps9azxVuJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCawkD5wAKCRAicTuzoY3I
 OgFDD/4/u1qzcCepVc4Uy/d6YkUynbhm9fPpqrLIaLPiM2uEkjMDhnGkBGnS68S6Fj5okvWrnE7
 K2jcz6yNlIq0P4Vz7CqK6nGFKrQlUMGu5F6b+TMI8f37W/G7KZvjXQrZawTxw8+69uXO0cqX3Da
 peU6vapMxK7M1nj9GF9ZHr+szDmGvtj1Kd2xor+QLSNh1cVH1bq/722EBra0z0bQx56MKFgPv5A
 i0O4za1/MqSz9qpWwcL//Wo0AoOB3HWFamRU16Pnvu1vO3ok6xL87G2WCUW6dYQxF56uqKtBoPx
 vhzXli+wI4xQj6fSgHIKrpIzxSUNKz68Z7rIU8lJBcKl++fSK1YGHwpTdLnf3wTYUCn6ikf4OwD
 sHpWF02ievtjSIHaTeTxPcT8drrhvWtH4vkUNMwFM0n4dzyjZWqInTPB8m3NY3TZzuozfnAm/lD
 J3EY1uJuJ8k5JQHSBKdFRsC6ThEWmCZiPd4AeAsCu4q9PTXRjlZiv/dLVAilCZ+R4CGksOIS6+p
 g+RaIdJE3Y0dLnUnBzGZ3mtHVgaAShqNTKHKzryuAHzGJrbQkowNRW5HHA0SU/DZ0GasL7xZYKX
 vitoXIzD3020U6jZAxCzIQ0o98x4LMpqBdwYaazNBLEvFkx/3b/I1p7zoN3rcPNCPDwpMmhfvxN
 96DflvC+G9MpISg==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

v2:

I reviewed-by and then wasn't very happy with adding a new field
to CSID resources hw_id because this means we would have two
identifiers despite already using csid->id to mean index and hwid.

Bite the bullet and make the conversion.

This is the way - bod.

- Adds a precursor patch which provides a .id in place of CSID.

- Converts from using csid->id as both hardware identifier and index
  Instead helper functions make clear and explicit do you mean csid_index()
  or csid_hwid().

  Several callsites need to be updated to make this happen, but that's
  life. I'm a big fan of patch granularity however the differentiation
  between index and hardware id must be done simultaneously.

  Follows the precedent of csiphy.id - bod, Wengmeng

- Straight drop of CSID2 retained. This is the right thing to do, CSID2 is
  useless dead silicon, already RB by several community members.

- Link to v1: https://patch.msgid.link/20261122-camss-routing-fixes-v1-0-0deeeaca2622@kernel.org

- Applies to camss-next from
  https://gitlab.freedesktop.org/linux-media/users/bodonoghue.git

v1:

This series lands late-enough in the kernel cycle and applies against the
camss-next branch staging to linux-media/next.

Link: https://gitlab.freedesktop.org/linux-media/users/bodonoghue/-/tree/camss-next

First up a patch drops the declaration of CSID2 from x1e/Hamoa since this
CSID doesn't have a corresponding VFE it is entirely useless and violates
our 1:1 mapping between VFE and CSID. Since CSID2 routes nowhere there's no
reason to keep it around.

Second is a fix for a longstanding error in CAMSS which as stemmed from
the original development of post ISPIF devices. These devices have a 1:1
mapping between CSID and VFE so the mapping we have given to user-space
which declares each CSID as connecting to each VFE is just plain wrong on
these devices and has always been.

So the second patch addresses that longstanding issue but, I've been
holding off on fixing this for a while since I believed it might require
extensive surgery, but in the end its quite simple to do.

Finally the third patch is a tidy-up patch which inverts our current logic
of continuously adding new elements to the src_pad_code switch for new SoCs
filtering those SoCs down to a default: statement. In fact is is the old
SoCs which are the exceptional case so, just do the switch for the old and
the default for the new.

To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Bryan O'Donoghue <bod@kernel.org>

---
Bryan O'Donoghue (3):
      media: qcom: camss: csid: Add and enumerate an id field for CSID entries
      media: qcom: camss: csid: Stop using csid->id as both index and identifier
      media: qcom: camss: x1e80100: Fix CSID2 routing to nowhere

 .../media/platform/qcom/camss/camss-csid-1080.c    |  2 +-
 drivers/media/platform/qcom/camss/camss-csid-340.c |  6 +-
 drivers/media/platform/qcom/camss/camss-csid-680.c |  4 +-
 .../media/platform/qcom/camss/camss-csid-gen3.c    |  4 +-
 drivers/media/platform/qcom/camss/camss-csid.c     | 34 +++++---
 drivers/media/platform/qcom/camss/camss-csid.h     | 18 ++++
 drivers/media/platform/qcom/camss/camss-csiphy.c   |  2 +-
 drivers/media/platform/qcom/camss/camss.c          | 98 +++++++++++++++++-----
 8 files changed, 126 insertions(+), 42 deletions(-)
---
base-commit: 91ff71dce5e770e7965cb3b09c87f6d334c6c4c5
change-id: 20261122-camss-routing-fixes-b178bdb84f20

Best regards,
--  
---
bod

