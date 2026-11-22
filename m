Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795313455;
	b=nGCTN+TKJH7H4O2YpDJ6Ba/LEVZZv0TmFFWvaAwBNGwrSRfur0fmGk0Yo9m0Nkj6O7wP
	 /oJRJpTRHdyY59I2Db8t8/NNv+0979hlUYT5kH8Q+K2jA32A4ThFKdth8aaj61CVlQBKN
	 fQeF5ByXfVTi0sO5wHP/gKjMKGgEHYLSXtNqecmBiLTpGn/NfGwaRUujkdtp5Aumwp49t
	 QsVRH3cQ84DGUXpGg0OzbkTyHiygWNOItQiMYmdZjl0AFm/KkQ6fTU9+c/6WFeOiuvfHt
	 V36pXyYqcptJWKfHF7VZNE+aDc3Q/rEvpJWuSnMk+rDuCoSRoCE0PtTi/HEgFJWBfFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795313455;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=Rt7rwZgRCYcjZmCk9F8bbKx3wnJH8epK/AJCfQqcRoo=;
	b=sfJn9EyGk3HVoOUUKK/MF2iwVqmKwzuM/3LqwJhtUQUYPghLjXGQcEMpP3WTos3JELTl
	 ciV2b7zJ/XNtV/uFKcvzlMiCKUZAZAZLZb+BZhfTQY73FdW4sz9m+XBqz76cylXN3VWsg
	 7v4KtfCfVWa940W2lp576iG7wx9Q6Mb3lnjr1QVrZRxLv+EmsRVsWkWUijuts4p1n1b+z
	 BWTP8dLQ+5IBhYMra9rdHgR2ddmn2N5eBZBW4H/MeR0q4wZnvtZ3Hx9m6HlfXLbcMd9UU
	 HVjRV2WqWlJqa54u17gCXCxo1tBXuXdRU9/NEA4OXI7DidzU9bEIhduj4fSdRq9Ng+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=EMDgTpVl;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3BFB606A32A
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 02:10:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3BFB606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=EMDgTpVl
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4a34ffd3e39so1137468f8f.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Nov 2026 18:10:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795313453; x=1795918253; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Rt7rwZgRCYcjZmCk9F8bbKx3wnJH8epK/AJCfQqcRoo=;
        b=EMDgTpVl19aJrdx1+76OBSOlyY6cUxXnVjMEuu+ZSf9r5G4sQboqFKGn5xVHzE46CC
         O7Ja6d1OfDFZbzEWSi9UZja19fpPz9A+NKVwlIaxKvfd8Zt9kiuhLtoH+tYsjE77naP6
         5YB+zDXFUAzjWmdAay3biZZZ6FnT30jNWfcyNXdF+l4lyuTt/1kFek93FsMjhn4DTF/6
         RlT4cXA1ISj4q5Jp+G7VTCcyNpz8GhDG8uUoDrlfOurIEi0efbVWgxIyuUXcpENCeX6k
         WxYa8lPHxpXTGc5Os+rR2bTKGA7UzcfC19bjU0v0l9kREGQdtDjdoO2exKoLCcrvD+5a
         1i3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795313453; x=1795918253;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Rt7rwZgRCYcjZmCk9F8bbKx3wnJH8epK/AJCfQqcRoo=;
        b=WLqgK9upWPlfJfout6SM50eYJ3fdIma05s/4wZF3MBb+B0tXkAh1j63/wJ4+OSEutA
         GtLm9imF6kJ6I+v96yNFoOX/nNi8cNKmvhuwepBCgQkctqFV6LBiYvPp6Sswx+y3LP2K
         MNd8BhZ2GBU2rOy0NCLcO+IhovcqwUpi85PBHSyKPq3IVxeK4kStU5gimidloUdTMEFC
         1DogP/2/nf3eHIpoimMK7sJlSXRX5ZREF9mwDhNSkp4Sru3Y9KK9z245poBhRtkeFf2R
         cSa5HcwvIasX7dsTunIzoRwk6MTGqE/siEpxZLsC9eFOSYrTSGctG2cxv+O0GdnBeP/F
         398w==
X-Forwarded-Encrypted: i=1; AL+hErHULNlAI/V5XPbXZPQKeUEQl6WdlkyaJzmdgkMcdYcngOJJpjYV/Dap+FqQm2mW4KO6eCqFmvq7cUGvGa4R@vger.kernel.org
X-Gm-Message-State: APuU4Z+1UQ1FbsOmWo0bC8uwcSeSwYY+a8/jMLXFN8gcYJKMrTICda0S
	5EU0B5g8CPgMDwd9dRtQyIgAYhxLfWeAtEqNKgr+Z4A7eCH0eAi6SjMCxGm9gcDZOo4=
X-Gm-Gg: AZFdTZenC+gXoVw1fhduXUKeDKeu1L9oAyMQI7vPFA7Y9HZjMD41bKFgO3jh+yZNnBT
	mi0/PwvJ8FquVKXFCqFOrn48keXkn+LjuQKROuAbBxojL8pwzbqFLx4pymSTX0D+XfzxnzUyGkL
	NnS5eBYfJwBlSfJHI2o1Jz6DyONAkyPgl+mSMdoJLZBwGn1yzj1IRWWFU+LLKfoqKBFXThjtXT0
	lnGn3IYA/OwVy1Hm0hGLAZOU4HR+w6t56VC1LQCUrzFtb7xlDpstDvm1s8hmUf+wXKDgP/c2TN1
	xur4W28lpzrGT2T2Y7PjZZtNHBxkhIMLTI7uH3NJMNCMlI8nX7r1JkqCtBdznWsGxQgehKPc0qU
	gKA8nHioL5MFmI0pJ0pEtvoynysMJScs7s7C0Bw5zLN1nYzW3wjWz/Rt3txsjqtI1tmVaSOIQrN
	QK2rbJGsM5SzoK2B+AWtc4rC7rqJWoxKUjOTk6ZVz8nPtG1mn/PLPt/CzyMiM6mJtoc8ND7fUoT
	3HDXrOflLNZIQ1vi0R8+xVnakdRckjk4T28Bus/vmt0R2NAonZPLIkF74Nutu5dResC1IqcBSC1
	wynHR9d3ytvcXI+cNn38
X-Received: by 2002:a05:6000:220a:b0:4a2:edb3:5d45 with SMTP id ffacd0b85a97d-4abb4b84c8amr16484182f8f.41.1795313453164;
        Sat, 21 Nov 2026 18:10:53 -0800 (PST)
Received: from [127.0.0.1] ([109.76.78.239])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2c8csm14822085f8f.2.2026.11.21.18.10.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 18:10:52 -0800 (PST)
From: bryan.odonoghue@linaro.org
X-Google-Original-From: bod@kernel.org
Subject: [PATCH 0/3] media: qcom: camss: Two routing fixes and one tidy-up
Date: Sun, 22 Nov 2026 02:10:47 +0000
Message-Id: <20261122-camss-routing-fixes-v1-0-0deeeaca2622@kernel.org>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBCF4avIrB0wg9jQqxQXJo7pFBpLxogg3
 t1olx+P/+2gnIQVntUOiVdRmWOBqSvw7yEGRhmLgRrqjCFCP3xVMc15kRhwko0VnXlYNzrbTtR
 AKX+J76GEr/5vze7Dfrmu4DhOeis2bncAAAA=
X-Change-ID: 20261122-camss-routing-fixes-b178bdb84f20
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1985; i=bod@kernel.org;
 h=from:subject:message-id; bh=cMnDYUL4opukNrol1StasRXxBSNWfB5Kp3VxUzSk2o0=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBrAk8pUHcWbJEMMPNNAgqoCw7e5C83psmxbUfrO
 A/UeBJcJcGJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCawJPKQAKCRAicTuzoY3I
 OlHWEACqI5ipgKoL8Nr1752wgSPh6lAw0iZ7ldpZi36ARTP9Y6ldeiNCDTeXtAWVLOTXN3IYRhc
 8o+HL2AlC5KeOBB2nz6bCDau7V5mTgXIxs56ibkfBjSkQa7W5fVh2XzYx13vptsuTiqz8tAv3OM
 8SybuqXAY5Gz1UUbRBGSEzASlUBQzFKsbx9CE0vO9GP/7cPE8iYAFeOeLY8FTI3OmCAmQIp+gpI
 q2ec76cDvcjncut6qMCa9QT15BsSx0/Nw461pfdSQEM4SFpwwsTwztY2pTa4SU10afE4ilY2Xwk
 iQv8H03BtZDwEXmfm7ZS0yPeVZqCduGXWUBRHsUxpPKoSuZUuQrImbUw2tuP4edC871CZzoJDYT
 Ytda8laTShdbqeAgEv1r0+niJHrm4ckAKX1hxS6dZ5GTYLP5AxYI5NgLhK0gQhnGwIiKnm9Gzhm
 I0RgaUc8XcbR2lGWjiR6kCb8QTCcICaENgoqeWEb+w2zkwme/q0xV9sbgIr48M1vJU3OJQKA18c
 ghYHOA8+ht2LTfqoTvof0Ttg1+TyIWnCEO5sPMC/fh2f0Hhq1peiPp3fBsW07/sZWLjwfxrMXpm
 0t74p9Jq6/E7uJcG525pL7aWhWL0G1uX1VYpCD6sYugaD9y8wdi1GAxxYD49g9AoTQirBM7HxP2
 1gzJ5dY/jCEN9iw==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

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

Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
---
Bryan O'Donoghue (3):
      media: qcom: camss: x1e80100: Fix CSID2 routing to nowhere
      media: qcom: camss: Fix CSID to VFE routing for non ISPIF platforms
      media: qcom: camss: vfe: Eliminate ever expanding src_pad_code switch logic

 drivers/media/platform/qcom/camss/camss-vfe.c | 20 +--------
 drivers/media/platform/qcom/camss/camss.c     | 59 ++++++++++-----------------
 2 files changed, 23 insertions(+), 56 deletions(-)
---
base-commit: 2ad58ca589da80990b7afbcff018777851577f89
change-id: 20261122-camss-routing-fixes-b178bdb84f20

Best regards,
--  
---
bod

