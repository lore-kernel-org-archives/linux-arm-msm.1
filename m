Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18FA533F394
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 04:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784264347; cv=none; b=MP2/bBOqI5JuXOi/R9zIUl2U3xp1ekCJhI83AMth5wUJ/gVNdWVAvRejjauO4NvBozH6xBWiUEyXdEYx3GnwrNTE/VQIqIbHEPOvd7RvxrN7KLyrdpT/BfCnHG9QzBxMoQVcV35Hmr8nO1iVwpftaR/3RkekjMKKkOMOh/L4oHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784264347; c=relaxed/simple;
	bh=Lyi5OWNxXgW6GgMNGYHWvqV26MQItJXBvI21B1UYvGs=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=rH39xSOdOTvAge5a+BZX1l0rJLJ6Ud46qdqP9EafWZo+LQWx41c9h4hm2vaOqICuQeKqQd78mqWWtpfXmipRCR67p8AAXEfP4U4CslPJ9hVwKmPYcLM87p+x28lC6wi3F/e1+L3EGC6bNCoW5CSCnS5N9uheInkb5rk1td3zke4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=KkLBXgfW; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="KkLBXgfW"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-38e041ea211so4998536a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 21:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1784264345; x=1784869145; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=B6gP8gD7FO98IWrTinKRcDaiPUF3GPGYLy9PYFT6EsM=;
        b=KkLBXgfW1qVybeNPOmIY+shjC5Kx5HoGJ3etz0HofIjnbnEGAyTBG6BCcZ/9MfiR7W
         507tNDMd6Vl0KGbeU1bxPGp1nPu3DsgQrv0H8egOEvgtvTNrv2NotS3M8CvoClaZ+ONh
         Nw52TZurnAlLL1Rkycj3hg18eBSMZXM90xjrGm1l/dwbUWtjaluQfDFTBkisc/RE491h
         5jnD0FbIdllsQGfXz6V2aTTRgA5vJe81wO0OpCP/HV1SzAKASXbxKf3l43cLqj4crkW7
         PNb0uVzHHvGioRVICyO2sGMSL2EopFHW0Ioa+NImciICphU5qBHbIJmRVnA+37KFYet8
         3o1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784264345; x=1784869145;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B6gP8gD7FO98IWrTinKRcDaiPUF3GPGYLy9PYFT6EsM=;
        b=G/VaUnQeWevU1eDUFtR/3Y4A6RF6lZB4Yy5IBt4/BO2cvE3w35B6GlSEyyAF73D8S8
         D3djndwVBt6RMuPBiaKytuzX9Pxdo5JpDJPNwHwqPixrqr/8Bc7tw8E1ZYgwJAQlkZRu
         9uZMQ4i6cesyJT+sIcjxd/GJ/PjP5sNAlrdYi48EdkZXWrkiG9U/O+EywahodAfSVKqq
         sk5UI/qU1Ir6+ktNyBTIb5G0EXONvLVYzRHK7wtTg7wit80m++UkHHhSyNya/oAuQt2y
         PZDhOSuP5ZQzGhQ/x9SWj1VpbuJD2V0g8smJcCjz/IVihKy2i1AWYhH6ir/EZcdeKWmU
         2sEQ==
X-Gm-Message-State: AOJu0YzsiOGuOYU04drtKkCsCd19EYh5XOnPROKpDJQ9SXtP/TbdAgw5
	Ie1FceU+CRk9Oqo1gxDXJek1gDXUZo6yKssTs3TFwKWLoUn8RhZmIZaWnajL+/JCp5HDNAQMXaR
	n6lMb
X-Gm-Gg: AfdE7clE+nqNBoCGErEYS0JXnH+c7Ar0yIiaswlJG1nB0Zkdbrxq4opO4Inrtm+jxWn
	82Hz2FN64dpI1TAfwGk/y3En0wVK+yHBguVDbNxYU0u4Mgp37m8VAdeuwOdZ0Zn0n6s6mnCdR1W
	Mf4ail87886/MmgNzNU/8xgvGaTUR1mpSr7kK2H7Qc/4Z1DlAbWu+r7877oLAn6dXXq65jZqZeS
	6v2lnavecRVCjZrMUwVISGoHO/Ln6FGfCYSod82+pz2gcyheWeu+scH0a6wAygN+2/y2OyyxI1R
	NOqHQiLeeW9QDZuOiyq6dxi1iXMeaiutlHdc8mPSKo0haKiiQFrbcbi9FXttvwB51QHHuj8yxXj
	Yzv3qnqFX3p6RhStOM0/HUnXzW2IX2Hgh3WOi02QRoyp7k7WjXJvJ3WOwTL+FAV187jf2tk8=
X-Received: by 2002:a17:90a:e7d1:b0:37f:9ce1:7366 with SMTP id 98e67ed59e1d1-38e4b51b969mr1050616a91.28.1784264345261;
        Thu, 16 Jul 2026 21:59:05 -0700 (PDT)
Received: from 963b246bc1b3 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31429fdcaefsm2425879eec.10.2026.07.16.21.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 21:59:04 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [REGRESSION] qcom/for-next: (build) in
 arch/arm64/boot/dts/qcom/purwa-iot-evk.dtb (/tmp/kci/linux/scri...
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>
Reply-To: kernelci@lists.linux.dev
Date: Fri, 17 Jul 2026 04:59:04 -0000
Message-ID: <178426434363.11836.10489080558310367907@kernelci.org>

New build issue found on qcom/for-next:

---
 in arch/arm64/boot/dts/qcom/purwa-iot-evk.dtb (/tmp/kci/linux/scripts/Makefile.dtbs:140) [logspec:kbuild,kbuild.other]
---

Log excerpt:
=====================================================

=====================================================

When fixing this issue, please attribute this report according to the
patch submission rules:

Reported-by: kernelci.org bot <bot@kernelci.org>
Link: https://lore.kernel.org/all/178426434363.11836.10489080558310367907@kernelci.org/

For complete logs and details about the environment used, see the issue
on the KernelCI dashboard:

- dashboard: https://d.kernelci.org/i/maestro:610b93a8656b3e2c26bc0fdb2304d640dc75cc4a
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git
- commit HEAD:  5bdb10dafd3fddb0c934235568b0c1374e2246ef

# Builds where the incident occurred:

## defconfig+arm64-chromebook+CONFIG_CPU_BIG_ENDIAN=y+kselftest on (arm64):
- compiler: gcc-14
- config: None
- dashboard: https://d.kernelci.org/build/maestro:6a59a3123427a5b0fbebfa0d

## defconfig+arm64-chromebook+kcidebug+lab-setup on (arm64):
- compiler: gcc-14
- config: None
- dashboard: https://d.kernelci.org/build/maestro:6a59a30c3427a5b0fbebfa07

## defconfig+arm64-chromebook+kselftest on (arm64):
- compiler: gcc-14
- config: None
- dashboard: https://d.kernelci.org/build/maestro:6a59a30f3427a5b0fbebfa0a

## defconfig+lab-setup+kselftest on (arm64):
- compiler: gcc-14
- config: None
- dashboard: https://d.kernelci.org/build/maestro:6a59a2fd3427a5b0fbebf9f4

## defconfig+lab-setup+kselftest on (arm64):
- compiler: gcc-15
- config: None
- dashboard: https://d.kernelci.org/build/maestro:6a59a2ff3427a5b0fbebf9f7

#regzbot introduced: 64a28053710d050b72f8f8aaa9e75654fac0f2d5..5bdb10dafd3fddb0c934235568b0c1374e2246ef
#regzbot link: https://d.kernelci.org/i/maestro:610b93a8656b3e2c26bc0fdb2304d640dc75cc4a

#kernelci issue maestro:610b93a8656b3e2c26bc0fdb2304d640dc75cc4a

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
