Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794469936;
	b=autRz6eka2PplGFt+uPrWKjsMvNoky+ATfAikMYrqwJDopDcseezlts8lSLO1Tb59G98
	 1uLEJw97vwIuiTHXvJS+VY17CUw49Zxvah7geXs18l5PnVUUtOmX/CoSzhCE2zpUuXpe2
	 PoxVQHrGbGk2Od4d6R8ku9g/c2sAXjlfU8EvRv8l2RLwmcatgAUZbrjX8oSrp69lLw5lv
	 IzAHprsjsJbd18dJXT7HnPn9WTEl72YyT3KqCZ9HlWrHUwFfEBZhd5vvWrPXcabS28vL+
	 tMAHuZ1LwMd0PcRd1apdzrq0ShxHGY/me53mQn+VMhlycPpMkaIxRmpiUnRHoQDEfgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794469936;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=+PFwRraLiMRDLMfi3y8YngO/QGo0JYSFg4Ky5k3Gocg=;
	b=OQZUZq3fBNx1E7ZKKOnSX1TMIGY0/lqQEbRi9yykWTno5eqgdWJmHND97qszhJjgtm4e
	 RKsKHSyfnt5XzniEpVt+UP30lxm2VxqzJriomRLrNEUpNQxHNAAnSdd1AN+DviJwtaptO
	 /VBVl6vQAZXJmJi+J2d+CyhgE+VRiNBUuyv2YCSspplItruD/8BUsWPvAZShJ8ncuA/y8
	 yNX7XunHSy0C0MFBYobhG/f/9iHPzK0A8ypVHjOkoU/RCY/oTsYeeAI/SsgOy7tiggAoK
	 Wuq2HiPatw9w4OpQCWhZ7L4Tx4df9E895jI6WV+zMbzKNar45zDq2Xb5CzS9LitO/Qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=wdftOyOk;
	arc=none smtp.remote-ip=209.85.210.174
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60BBE606A327
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 07:52:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60BBE606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=wdftOyOk
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8b29b83fdf1so1845269b3a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 23:52:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794469935; x=1795074735; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+PFwRraLiMRDLMfi3y8YngO/QGo0JYSFg4Ky5k3Gocg=;
        b=wdftOyOkY1sLWQXJYAbmkMy32upEoG2NnGnzvQiWCFJxautu9P8QgBgYvtNMgxk1L1
         HIlr5HHJzgZKwR+aMvNpZVjkjux4lRncx5nfOmStLriSBRYuXR5VrNPdeq8RMA0nV6oU
         H57gRJWccE/DApwzPytzzyaAuPDqPdHHwGpNZtX+YW4n55eNVl3UQw59lcEgB8IM6M9q
         GExqB9B8xXqGcK4yOJwXs1pUwEblXeiIlRdKeYYd13ny8M3hl9Ni4eZyzxozRwQuuL/m
         xcgViAERvVk61Sesoi0y9cGUUw0feH0IvdWFG2RP6Ls6MwpuKKJxSwgRbNZG02/rbOZg
         qetQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794469935; x=1795074735;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+PFwRraLiMRDLMfi3y8YngO/QGo0JYSFg4Ky5k3Gocg=;
        b=KgUh+zKyQqlsPdCm09Bj3VT87CYtyruOqWk7pHX6JTEbk1i6OcXE+0iJ9pnKlhJwLV
         VpZOUFYxAProjNImgTfhHj/bdeLfEWK3qfe8A6rFjyRblfrUxyYk325as/F+5XOn7tVE
         Xyt5HtryvOXw5lG0cH1Z/NiyVUISt2OV9FfRmG8dhBhMtwR4SoQg4hiTARty+IdQ4IAf
         Z/RFedCYwCjMp/ATS1iWEhkEQQh4fdZcPMwOx9tAs9InFQ8Qo17jGHTiSdw+uJBm+FjC
         rZvlqSBr2TXIJqv7Z2aiZC34Qf7hBuJL53z5GRV6XXhqSvCcI7E45ug1UeDB2U6q1vdr
         Jdmg==
X-Gm-Message-State: APuU4Z+5tVlKGe9naFxf72rM7Tj5/UEvSoIIfmNxKezFyEzKhLtOYCvp
	Ylo4+Yieu27qdDqAsEp7s7ikcQM2vRB4qv1EkrWsjjeviAmLsIbOujesRqp9Or3WAXDV4Gm4rO8
	8HVtc
X-Gm-Gg: AYBFou3mS2wTmssY7AbzF04hx6Wkr4+FVqUZOft+KJyQrbI5ymkAvE9+UmuhvsptBhe
	j4xJvdUaFfRZi1ktktBmh8q2Gr1rSXuZ/g1UA1HQOIHjMJ4f9xg0fucBG8OUHMzPbfF2kCVviam
	4x4iwgom4Xg20Tjxg5q9cuceDArs+DUFVSOYOKEjNndmrSsKF+70IFRRqVo2Im9D3bSYMaFHHVw
	rr/USTmGflVRfRSLs81cuJ7GtUey7SnZpYaWy8abKlEahP+XIrp0VYoPQaJnMfVAzgmChDtQPwU
	/ZY1jXsuEHmdjlJP/LyhcJ84OvU+XSk2a8BtdMXNH6C8eaqODhy9YD1bIBsP5W3SZklE6i2s6m7
	fpKiZocRkp0+wVqtM/SCBichmFDoz87RmobIz5wehN80URq7DHH2iJHsPi71SRjm25RofH+8593
	FhB5xuDc+urXL97v/hH+P3XRGbTRga7aWMjA4JV2JslRN52Vee2niuY/BufdO/NCmEkWnKotXoN
	TsITpLAFLBf1iwLBhXaCQeu9Go3e3nIIyCn/XaKzpCkYKRO6JEQ9quRk0o5r8qkK8PlrXfggc9m
	hTYQocOzqMYGheP9YFZCHvOboaYZSA==
X-Received: by 2002:a05:6a21:a46:b0:3dd:85a8:cad7 with SMTP id adf61e73a8af0-3f2fda8ea2bmr4128953637.46.1794469934715;
        Wed, 11 Nov 2026 23:52:14 -0800 (PST)
Received: from [127.0.1.1] ([116.237.168.131])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baab5f3f99sm3131256b3a.51.2026.11.11.23.52.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 23:52:14 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Subject: [PATCH 0/8] drm/msm/dpu: Support dual writeback for quad-pipe case
Date: Thu, 12 Nov 2026 15:52:01 +0800
Message-Id: <20261112-cwb-upstream-v1-0-a6a88d928aa4@linaro.org>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQ0Mj3eTyJN3SguKSotTEXF1Dc4tEQzPTNAtDs1QloJaCotS0zAqwcdG
 xtbUAWXjweF4AAAA=
X-Change-ID: 20261112-cwb-upstream-178a165f816e
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794469928; l=1932;
 i=jun.nie@linaro.org; h=from:subject:message-id;
 bh=LDQHNEWwvGp+XPmG1v3NAcjKHwFdOCIS9tVrnzczdd8=;
 b=ARmFWeiLPQROkAvRDrimtqZhEByB9Xs2LRthGXKNk7FplqMa8aDEP9C/QIRIxm74yD7K7XOcc
 nFMA2ISHiQ5DlK87dmHxhJ1Z8mjAS7C5MWbwV3RpCP1oli47mkQXsx4
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=O9aRQ3+xXWihQiRRgStCET+eFXx1EZs43Fh0Xh+8Bu4=

Only single writeback interface is supported even some hardwares provide
two, such as SM8650. dual writeback and 4 CWB are required in quad-pipe
topology. This patch set expand CWB to quad-pipe and make writeback
interface allocatable. So that 4 CWB and 2 writeback interfaces can be
utilized in quad-pipe topology case.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
Jun Nie (8):
      drm/msm/dpu: support allocating multiple CWB pairs for quad-pipe
      drm/msm/dpu: do not use DSC merge_3d for writeback
      drm/msm/dpu: support mapping framebuffer to 2 physical WB
      drm/msm/dpu: expand CWB to 4 pipes
      drm/msm/dpu1: Support wider writeback width in dual-WB case
      drm/msm/dpu: Make writeback interface reallocatable
      drm/msm/dpu: ignore merge_3d flush bit for non-CWB INTF
      drm/msm/dpu: Add the all WB interfaces for sm8650

 .../drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h    |  10 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           |   4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        | 157 ++++++++++++++++++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h   |   4 +
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   |  17 ++-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    |  37 ++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h          |  11 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |  45 +++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h            |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c             |  81 ++++++++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h             |  25 ++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c      |  12 +-
 13 files changed, 358 insertions(+), 47 deletions(-)
---
base-commit: 0da2f36712caabba57bd8384fe6ecb066d251860
change-id: 20261112-cwb-upstream-178a165f816e

Best regards,
-- 
Jun Nie <jun.nie@linaro.org>

