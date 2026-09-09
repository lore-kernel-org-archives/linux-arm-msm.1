Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A5C643FD3F
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Sep 2026 07:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788939733; cv=pass; b=b4XJzKyurYHM9KMvJc2b4XmvF2PdsVttW09ZNhewaqfnWwctHoMmxQxFSjTL1rSw1yOSUnuUVM+oXdIWSG/eDZOpNsQJ5LbyyWJLYJCfEYf8bVALruETdK2cE275Okxn98/qibgkNsKs4Zp4Vcdyu1DMqIFog8PjLmtnHt41ldA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788939733; c=relaxed/simple;
	bh=3523oMidcQmtypT8PpooIe3em0q+Lkry14jI2PZd6R0=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=phelLjm9egLCG0Li6L6SOYDWKeNJkpllSeV8VcsKQDWCsMjym0Ac7wuYrIgDOyTfv1HZ9KuYtg5SMcNME5WYWkNfDMxz/V4RJrPQt+y+g4TllXVLvASr2Z3ZKhHduA4MTajSjDsHEmaG9ycHqi78B9p2XP1yedH4SYDW4oxsM/0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZFOG1k45; arc=pass smtp.client-ip=74.125.224.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZFOG1k45"
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-66e63c2c9e1so4999391d50.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 00:42:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788939730; cv=none;
        d=google.com; s=arc-20260327;
        b=GiySv6wgFBjkrfnQFpI6kRlMb9Q/Yrm//BGimiyNlvVAOGvbdiQqdzUKiPFnEF4ita
         g0FJsCbMGezNelQyC90fgHfdiqXx9QLhWAdArCGdytyRRyAF8OYeo8zcJZuccPpkLJm5
         dncOt8VtIjHhgRY8M+0u3yKs+J3GC11uei5qn9ya9rpNJBVMkcby4VZYooHxvfmnQreD
         /U8blXDZjuWZBsccXGmIcUad/SvbA1GWsp32WT5teEgxwdFcBIDdD/gPa8WF3gksd8pS
         Sk7i4t5kc0Gm+PBFsB6vCASw+zM1B5aKMj5xyWLDxKFB2qqiQuswEUOEGcy3gVlaXV0g
         9CLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=3523oMidcQmtypT8PpooIe3em0q+Lkry14jI2PZd6R0=;
        fh=220zhUXHTa97qPv/Y3d1Z3V08esnNrff7jOXPqW9gB8=;
        b=Vi20u3/gHn37B09oDBNoyu9uauWdCoCy/VulLZvdyEr9L8zLHZv8g3J9yTVdhpjQE8
         k19JoBku94Mv+HOXK/W+8umbYbtG+wXTVZcpvQhlXyVlQZzR+qHsJcyz8Wb+mL97Xiwb
         2YWN9Mhl0kE26Aw4Mzn0GpjXWqbrOc12dW0Db1tmleAekj/6daxprdWp7+3tYSXp0ttz
         KfFgoqgozn1Cv4hGblOFUgz0JZCk/c8lSZhte1ZZ8xUcdOQgRRLrw4qKDC1ZnlRCXQmI
         0KRPv5qEcsYwopu/yr5XbDfPTVtk5D/32ii+nCgXpS15mx0pApX7RHZzhekiYHLy2HRh
         Iwhg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788939730; x=1789544530; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3523oMidcQmtypT8PpooIe3em0q+Lkry14jI2PZd6R0=;
        b=ZFOG1k45Lpv0l3/VgXMTjunwQ6GTosElQXSzDo0Td7+P+Spq7h2dDBZvcOYJ0pNQpo
         ypdlakuzJh4Cgxn3xMnHjpkNVs6grFtxV9a02RxvDR9IJgnSAJcafLnmp5vrEt2qJP08
         EfWrPeiNuK9P06U+dWITqQwq/xmgRxYfGld/N9/h9GrOy/v4JFu2s05hEzzBEwyT/XF1
         T4qSAhlVrJF15l9FpGoKKUm9rCs0XR2/4RI9tBtm2b+W6fdD0ImU7ixCgUepGfZPM8ij
         m2on/qUN5X3sNR9RyIEqUy8tDuKkgmk+nohu3L8E0hSndwkSqfjBO4lmkmMVjgYnPbB+
         eEjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788939730; x=1789544530;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3523oMidcQmtypT8PpooIe3em0q+Lkry14jI2PZd6R0=;
        b=OYNzG71u2vqG/pC3/EZcpoqyA+MznOXabnsRzoptEXQ1svF1tNUHOyTplI0G2jEq5Q
         cgjJlmpHUEXB/tE5kkXq81p93RCH2sHEbpxIXB4PgEAReo9CWGgx0e/WRprLgS7VLMv3
         viyV+syeY/m93be0V1Msc+GsHpA1Zk/NGL/ZfFlHIwU8Ao1G8TEpeK0WMuQwm5/b31rR
         aV/lj/xZJsYtjdQCYuSLT1PLqAY+srvGBoHL32jIV/J8owVV+ykHSzKMvVDJSJazATzp
         0zZoXpxCYE6u4BQ6fHZS1xOLiUS2ri45/UaJWzBTtF/5RuOoLAXbWDN2C8lsxOrb030Y
         4aRQ==
X-Forwarded-Encrypted: i=1; AKwUvBx6D7qqvFZy6xuCql7yrKfmmg80ebNfkbcHa8tUFuPJMcRP0aZQA1OhfN2bYezCtjyPr9v7CcyKCez4wmuE@vger.kernel.org
X-Gm-Message-State: AFuF++lGAlemkB6GWcRckMLb4PegSskFRuv0TNZS/pESKfvemZXSgh8O
	pnb8OnN7wqqAUYqrKaYduJYO1mvjif2gTU0WkPC7KU7aU9520bpQVihmlJxgr7VKNWHl0z81lIa
	UEKeS7sqDW+VL5UJd2/6Tivrt3mXR7uyjWn61
X-Gm-Gg: AYBFou13/ZUkJ9EDqKhI1BavU4qBXzAM22w/2mY8wTQlRTSbabuuc2s68O2nohymciV
	pvFhK5qhmaqvU7JKfdcd+r/SdiMDwW2NoxqjOQ+Ede1HIakgYjZwcPNon2CaOI9hTSbe9C2EM4K
	Nc2XYhKile5LemVCvubn7W/1xTVNCU6htl84aFvSOKxBmHa2m4BTDKNULH3RyfkB14oN++3aBux
	OxSFnLjuHTYLu2U2U1bRkVL+94SWZZR38BrpHqtRWdRr7tr3eTwa/xVOSvH64+FSfoNInEH/Pzm
	yC+210vhvkc2jiwPr9f0FJjAJZLNQod6Hu4dL2mq2jePtAySIwjs50P/UA27BnuhPkv4+ku2quM
	8QlXHTPHs6wkb
X-Received: by 2002:a05:690c:26c2:b0:853:fc17:6054 with SMTP id
 00721157ae682-86e6c41ee8cmr133970117b3.3.1788939730075; Wed, 09 Sep 2026
 00:42:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: AHMAD YASEEN <ahmadrandhawa01@gmail.com>
Date: Wed, 9 Sep 2026 12:41:58 +0500
X-Gm-Features: AcwNN1XiJtBTcT3xawx5grusG2FkFugR3RRjLRX8Nh8TiraKn5Uhw98BhRMFfcE
Message-ID: <CAFJ6yro2PRQAsNwDMRmU8sve6nrXXWVruStgyYVRMcYeksdufQ@mail.gmail.com>
Subject: Acer Swift SFG14-01 Camera Support not working on Linux
To: loic.poulain@oss.qualcomm.com, rfoss@kernel.org, 
	bryan.odonoghue@linaro.org, vladimir.zapolskiy@linaro.org, 
	linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Acer Support and Qualcomm/Linux Camera Maintainers,

We are working to enable the built-in RGB camera on an Acer Swift
SFG14-01, board Bluetang_SX1, with Qualcomm Snapdragon X Plus
(qcom,x1p42100). We need assistance identifying the correct hardware
configuration and Linux enablement path.

Current environment and findings:

Ubuntu 26.04, kernel 7.0.0-30-generic; device-tree boot.

No USB camera detected; the internal camera uses the MIPI camera path.

CCI1 at ac16000 and CAMSS at acb7000 are disabled in the live device
tree, with no corresponding platform devices.

CCI0 registers adapters, but an experimental HM1092 probe returned
timeout -110. This was based on an unverified sensor configuration and
does not establish an RGB sensor or hardware failure.

No RGB chip-ID has been obtained. No media/video devices are present,
and libcamera lists no cameras.

A controller-only CCI1 boot test has been prepared but has not yet
been validated on hardware.

The Windows driver files available locally contain multiple sensor
profiles, including imx688 and ov08x. We have not established which
profile applies to this exact unit. Existing experimental GPIO,
address and power settings are also unverified.

Could Acer=E2=80=99s platform engineering team confirm:

The exact RGB sensor and camera module fitted to this model/SKU.

The CCI controller/master and 7-bit I2C address.

Supply rails and voltages, power sequencing, reset/enable signals and
MCLK requirements.

CSI interface and lane configuration.

Any available Linux device-tree configuration, driver patches or
supported image.

For the Qualcomm/Linux maintainers, we would appreciate guidance on
the minimum CCI1 configuration and dependencies for this platform, any
existing SFG14-01 camera enablement work, and the diagnostic evidence
needed to investigate further.

We can provide the kernel boot logs, kernel configuration, baseline
and live device trees, minimal CCI1 patch, and Windows hardware IDs
and driver-profile details. Serial number/SNID information can be
provided privately to Acer.

Our immediate objective is to bring up the correct CCI controller and
obtain a repeatable RGB sensor chip-ID before proceeding to capture
and libcamera integration.

Please route this request to the appropriate platform or camera
engineer if necessary.
Ahmad
