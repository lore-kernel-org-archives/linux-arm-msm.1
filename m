Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 939E33F86EE
	for <linux-arm-msm@vger.kernel.org>; Sun,  4 Oct 2026 09:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791106520; cv=none; b=Y1WaATa6aY29JMrq8gKUN3CKK9EPthwBZLOc0U5lOdKhvkPH+4lcAsZ7wzEFMrNmTgD44ppedtNnm8v7RkXGHIjSr0ksan4h8Vu2JRScg+xPDuMtmsuqlsKxOTfU++ONwwQ3JslTf7CXwbVJNQ/Plk1M9SOxemNMMeJo2WixB40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791106520; c=relaxed/simple;
	bh=NxVeEh6zn8foBFrmhLMkMkalU3Ytt/AEGEN+gLGqrTo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aluCIPFNFT3JmShifbMaeAonfpHAT5j98aIB/1Sof0os5UgSHJFmAfYEYh+ltVyMrXs4lYpFNXmyAtDuLZlY+c87YoXtV1Sk3nDKMj6fcTmNDwKTxkGqyblg+CsV2Un9Xndao3nfDWic3b4UcP8jzzcPUAz/XAratyhpyW5Y11U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XV/U5sZv; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XV/U5sZv"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-38ec1402b05so338916a91.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 04 Oct 2026 02:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791106505; x=1791711305; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ieoCN8zHQyjpKwxBxBu39ADqPAcaD3Ug1famBdxjyE0=;
        b=XV/U5sZvWxpCz1+kuXxNQ76bvIMv1Hc5+hMiRFe5kHT7OV67UNKbWO0ZPh/n/fmiYT
         FdgAtMLWmT+YkBhqc8X+1WSjLUY4NRZgankMG0f0nHCwRIVbvLZsser62x0eWYdJjr16
         d1Exr/QrBKyDd/bHIGnWfciaPQzUWuM2Zf4UynRjj8qOW4nrVJImsTAF3RdVwR30Tm3q
         KKsM49rml3N74IAcbDQUnJjKQM1GGgxu2H28kS9ywUpEtVra/lJYKq+s/kJ9A73b2LPV
         IafXVBwdRGMsZCukCAU4S51aWQjk/pOQ1SgpUAtmxw0t8R/vgoO6cLnGMelbspQRaUva
         0SMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791106505; x=1791711305;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ieoCN8zHQyjpKwxBxBu39ADqPAcaD3Ug1famBdxjyE0=;
        b=s+9GG8nU83YpgFl9z8/Ug9INhNiwpTY5n/9bRPyCaBQrMqmzsH1b31rBkmS9lkmb2+
         fSf9JHh6EMdODI+lQme58wpEyke41M3nKw40V/W+8wTLfQUScUvc9scZBI5+HhzI+0X/
         oB7kPY0tyd4GrkItCcdm11dFtUBmYNuBapSe83rGTw8RcNO38RfnvcSASn20T43JbQl3
         7zTTq/O1wSisOhZp0EYEORxR7Ky0qTVBsl4gPwYlCo8fon+2y9cb1H2Z54W9Y6BOl9AM
         vjPo/Qv7SdFuF9v6BpbEODnrrcWyiRpsC7uU2cH5sv7/cgWKm4lJUyCYlGh4ix/iYoLq
         cBBA==
X-Forwarded-Encrypted: i=1; AKwUvBwsZgHult8xF0PxgoEh1/wqQvc4fAq4jsWEmf2ru7p10reYhOKyfxQwXK1zKZs8pdzs/CqyYo+z50QQdjqf@vger.kernel.org
X-Gm-Message-State: AFq9FYJX/gmdwRZARtdji9NVMTs+A/kI+sL3954chAAXOrURhzpzADu7
	NhRwrzRec0F6mWr3orpvQ3u0GrBGhV0JBfsd+ykUSRGczbBJxLJk9KUS
X-Gm-Gg: AYBFou1sT/KJtLEId4hY/3x2vkGGIXLzSc3XsxrqIs1u15fTgZQSi6f0AV9XmtEKBqt
	WO/h6ZM3rvoyNwqtKcw2xFmRRsXfDU0co4deEFcR9tt2pYnKQSRzT9/sWnRAsL682oBwxQwb2Md
	oifNItjSsZogh+Kr4lyIM0SPeHVw8haax4Pd07AM+O2QM9iKJVFCea4aEcqRsmgSuoik9JDtQUF
	fU9sx92HyNEPCI7ISnMobMMZKTo1rl9xQUkTBIXJkQdfxpIcx0gJz7qT5Jd/lCI4fBYziIe7uAm
	jDh47yHnDXjdl/Sr68+ex0GkpwG12XeHzty4/DLthDTA2jjs5HNVape7dU5s5YKMkZotoXoOCWK
	dph2WPJCgypn4TpfKnAhysuAc/qTlR3Xp0c79G5Bm4/SnW8Ynzhe2J9rKy55+5pMpsTqlPA5s9X
	VioehK6xQhYLo5fQNpR0JNt97va7rDfq1vzUdaiz098lItyZp82hQV45Zp5od1/ny5+gQIq3mhk
	XCXSvlwF+Pu0A==
X-Received: by 2002:a17:90b:544b:b0:3a0:cb48:df6b with SMTP id 98e67ed59e1d1-3a7873db380mr3330070a91.34.1791106505312;
        Sun, 04 Oct 2026 02:35:05 -0700 (PDT)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc9f7383535sm2682884a12.20.2026.10.04.02.35.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 02:35:04 -0700 (PDT)
From: Joonhoe Kim <26rote@gmail.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Joonhoe Kim <26rote@gmail.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krishna Manikandan <quic_mkrishn@quicinc.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] drm/msm/dpu: Add INT2 GDSC power domain support for Kaanapali
Date: Sun,  4 Oct 2026 18:35:01 +0900
Message-ID: <20261004093501.74290-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <20260915-msm_gdsc2-v2-0-9157237b8382@oss.qualcomm.com>
References: <20260915-msm_gdsc2-v2-0-9157237b8382@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, Sep 15, 2026 at 05:27:47PM +0800, Yongxing Mou wrote:
> Kaanapali (SM8750) has an additional INT2 GDSC

(Nit: Kaanapali is SM8850.)

Tested on a Lenovo Legion Tab Y700 Gen 5 (SM8850), v7.3-rc4, bonded DSI
panel with DSC plus DP over USB-C:

 - without the series the INT2 GDSC stays off with no consumer; with it
   the DPU holds it on while the display is on
 - DPMS off turns INT2 and CORE off, DPMS on brings them back; s2idle
   works
 - with a DP monitor attached the cursor plane lands on DMA5 (sspp_13)
   and scans out fine; VIG2/VIG3 were not exercised

Tested-by: Joonhoe Kim <26rote@gmail.com>
