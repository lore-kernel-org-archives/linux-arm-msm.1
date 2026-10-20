Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792502669;
	b=WdlLMUnQmp4tAU5XU2RaF0oqVwCFr3/EO4bO3/s77IVrLYaAomP6Z2CndgeQ9hgtYKm+
	 NZTF4HGhBE999tl3QueFmi7w3/JvCze0w/dOvDkjLprb0OF1caiC3OyCbmAamkm41mWNQ
	 NQCcCOOOUgWGg+/OEgfQjAtJ78UEmHTeMTDyqAlf+5ZOX/w1+xQDDWkkLY5FiyE3MUA2w
	 W7+2AAJ83DgCd4aZkwyOmxapISfi4FO3ifwlQVzbi6PqdfXSeMT+RWpKJGLQXr6HWDswq
	 G3HRmple1kZKpv7IYvAiyXuArs8M4ldmyGMc2N5cG/ypn8j0/WVksuBDGHKVvI25xpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792502669;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=98Oxvm3jikEXsJUM/zp3eKNHFF44g7Q5zCxMHJr/tPw=;
	b=xQkAa73+8DxuIRyOAPVtClGcUIDlCP8tD/eLU1JhacvfbL0P/IBqzPYS8m/aM+KjZpht
	 UcEwfGNasYHVJucSHmbINe2oIHHtEm53abkDEsOYuAknmHIOsXm3Cj1PX53t4UU3CS/R/
	 bM/JM+Iijlewgg8UWU8rSzKHaN+qVl6+FRTPOjjFYKVedlN/+TtvIsE4/4Bf99Z7olyDx
	 u7mQkMmS9+omigg7l9odDtqVYX7JvN3a5tccFUlB8kE/QK9963QHYuopJgJNEUS2EVXIE
	 C1Z8QNUsSw/eyrXq18YbJRAqZMf5dqGX/vZeiqygK6vkHoeSaQ7KC7odO8IH+GctOfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Dh5dAH96;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D31B606A31A
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 13:24:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D31B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Dh5dAH96
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3ac451e128cso1992105a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 06:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792502669; x=1793107469; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=98Oxvm3jikEXsJUM/zp3eKNHFF44g7Q5zCxMHJr/tPw=;
        b=Dh5dAH96qDSLKgNW1cNMLv58m5QcNBer0LAwRdDu5V1GMrUo/j4SAzWA95GosfdHHP
         z55zXCYJ4jhT/w+jQgVs+OtTdNoobFK9/s9PVHDSPPAv8zj1V/nSK8Rui78dcTPYOHex
         yzjVQP+hYUQHPc/NxABf0/vguiNvRkAmU15PGa3W33ADeENUJWzl1byXm+X2VtnDxLiw
         RV2kQT9CNs/jFXGCmOIEi6T2hM8g4zt0KHo5ZyyxJeW+QN/KBBhz2fQRCAnMU3snsJHv
         7mK+QWUoNTdk424A+gj6pSPyq5nu8JdnSnUkb8TAZFUoT1G+YzZfkgjHsiwEu6hgXHpy
         SxsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792502669; x=1793107469;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=98Oxvm3jikEXsJUM/zp3eKNHFF44g7Q5zCxMHJr/tPw=;
        b=cLDRR/UCAuCT1sOjK2TXnLNyX+Xk4z5gCZfJYZqhBx71hSNYGOPTeL1IZoOVzeKAP4
         e4boQXDLm4OZg9J42YyXO/xGo2MPL6oxMsIx+jqkhaORtAxhq7hWwmO2fhLbZOjIq1ix
         zDpslpK+Y6fqMr4WKP2VQDH/2BbAGnmSj46JLAmlDN1L6qoXnY5jZY6EHekw/VcIqlCH
         j1aYZ2Gu206cLanLjPc3vi2Q660I1ya5XM4+FpvEX4Gx3O9+wliw8qYvCoZxp3L5YOzw
         vVyY6I38Ve1uScB5rpAaBeDnIm0jTZ2LZ3O+KEi4QO6yppcepxC+iv/ei4U2e6Ko7G4Q
         Z+7g==
X-Forwarded-Encrypted: i=1; AKwUvBw8XIungvfRJvIO1HL9RbtkVKzip+Jtf9we9HTnI+L6dRNQfCFrgfjSKma/lyXxhwpfOm8YSbllqRD81hTm@vger.kernel.org
X-Gm-Message-State: AFq9FYJg99xJKBM3At12bDkTFrcdEJMuaWy7PjASFsvy72hz/e2GOxSY
	DWtSvTW5zHRDWae87X4DQKl67mkS6Pni6PGV69WgtsqJ1wunTvJVP2PZ
X-Gm-Gg: AYBFou2YAaK4fVxk7eKjR+kW/mhvPoh9Xf4lHsWigT3GH5S1xQ9XbqeRVCy8kyVTxNu
	qy5BEB3daCWvp9ms+gq/O1tCGO7dEAk5cl+gmmx8iOzjK7bOfZ2K+6RyHcIFrcsj1Mj0wnmp5T+
	0mZ16w3FXFl06J96lpIN2HJf7NlGfRZs69QNZd9PoFWs5Pg8WOqZ4XKMKWt5qVtjDOI5gAr9rKx
	332bnA/KRImqjByvOA64sdATDLQYdEe2CiFbI9/cEFiMsDWgi3WPA26Q/018XZQ/iN2iyRMf0xB
	kRDHZO0DQneBEtB1YZ/PFN+cNkU0NWu0wQxebgVcUoBtVdQ6HD5dJOIhOO/hwbrYEGaE1TlZkCj
	dNkFYHa0qvFzOaVnwGsEp3w4wH2l79VlYrC0P+BdI4y07U/KEFYRX3K9dyN6XGuGO8BlouZ6cUf
	CK56vy1ByKjBeZrlS8/nWMTwh71hMoQ0xePEzPhk3qa7VBldGJ6tcYxT3/808NFKCf2+68w5n/i
	9sCnsKEnHmYos0bH3zTkeGR
X-Received: by 2002:a17:903:3585:b0:2e2:e0f8:e57c with SMTP id d9443c01a7336-2e9a6d2b9a8mr88276605ad.70.1792502668600;
        Tue, 20 Oct 2026 06:24:28 -0700 (PDT)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea1fd8a55asm7010935ad.29.2026.10.20.06.24.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 06:24:27 -0700 (PDT)
From: joonhoekim <26rote@gmail.com>
To: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
Cc: Joonhoe Kim <26rote@gmail.com>,
	Arpit Saini <arpit.saini@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Subject: Re: [PATCH] drm/msm/dsi: fix AHB clock staying enabled across suspend
Date: Tue, 20 Oct 2026 22:24:14 +0900
Message-ID: <20261020132424.983-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <179241542813.315541.11037007061803544238@mail.ustc.edu.cn>
References: <20261006-dsi-ahb-clk-suspend-fix-v1-1-67da848e1b0a@oss.qualcomm.com> <20261016125036.1069-1-26rote@gmail.com> <179241542813.315541.11037007061803544238@mail.ustc.edu.cn>
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

From: Joonhoe Kim <26rote@gmail.com>

On Mon, Oct 19, 2026 at 09:10:28PM +0800, Qianhui Xu wrote:
> Question: with your runtime-callback variant, does dispcc end up suspended
> after DPMS off, and does the panel still come back on DPMS on?

Yes to both, on SM8850 with v7.3-rc4. With the display off and the
system awake:

  current code and Arpit's patch: disp_cc_mdss_ahb_clk prepared twice,
                                  dispcc runtime active, MMCX on
  prepare only in the PHY runtime callbacks: prepare count 0,
                                  dispcc runtime suspended, MMCX off

The panel came back on every one of 30 DPMS off/on cycles with that
variant. I repeated it today with the same variant on v7.3-rc4,
blanking both outputs from the compositor, with nothing on
DisplayPort and with four different sinks (a 4K TV and monitors at
5120x2160, 2560x1600 and 1920x2400):

  nothing on DP: DPU, both DSI and their PHYs, the DP controller, MDSS
                 and dispcc all runtime suspended,
                 disp_cc_mdss_ahb_clk enable=0 prepare=0
  sink on DP:    DPU, DSI and PHYs suspended, but the DP controller,
                 MDSS and dispcc stay runtime active,
                 disp_cc_mdss_ahb_clk enable=2 prepare=2

So here the remaining dispcc reference comes from the DP side while a
sink is connected, and the display controller does not keep the MDP
clock when blanked. This tree carries my DP patch that holds one
runtime PM reference per plugged sink, so the DP part may differ from
mainline.

Arpit, thanks for confirming it is prepare=1 with enable=0 on your
board during s2idle; that matches what I see. I could not measure a
difference from it in s2idle (CX collapse counts were the same in all
three cases), only in the display-off, system-awake case above.

Thanks,
Joonhoe Kim
