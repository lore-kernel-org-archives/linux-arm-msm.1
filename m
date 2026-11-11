Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794402892;
	b=Lf4SDVPtJYBt16AI/m6dPHqD3iPYDv4TE57bEfYGc5kQx/wNaNEIcxeJqWEzyDXsxNYV
	 4+MYdvu/Ek9eJLHBzoJJwitvMfTh14jenfS3X41rywJO4ccO6beeZnFWo2bPxFhaNdqd4
	 WtOXvVc0+fFug2A9/7vMtZnhjbfCZ3jVxgJlcNo+6emUr+KiFDB7YJcAnFxcW29dFDF6e
	 Sn9cBX1BvQmrjwMXbxfspCkxnt/J9fy6gHaYUhFysSylKdHF3n46wTKblkZCAM2vtZh0j
	 58lkOKgB8DuK9IAjaBjT0N9aCwPNhJKPeW3cCuoUn9U8XQZCjWIPsmetalyzuEL4jww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794402892;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=WU9tbewfdDNGygX+WsvROhINm1RTKRFNHxU/Ul0rphA=;
	b=rlMEuXEmjbfrc9UHHZ3GPZrfSc0VhB0wiRKymVDYJtxoi5X7r7p7gZLenpuO+4ot+9Fh
	 mXF/cxZI7jStEInQ/OY+TIWp+r8LzaMK52fRsUNKT5i37NrZTYL8MCLj23FKqc10kMTVB
	 kVoXb6qVxInrdRdzIr3nGU5olkOYCFb18ZvcL+Mlqn+yCbk3IGAK3uuB+8H2w2l0tQ0GZ
	 9WK5PrTMYWCLnm58VGq1FYMomUV4SRI4Rw7ZZkJXEkqqSLGz9P0bc+fgNWb0PpUmUEMvu
	 OVWN9+yh7xcjKSJ/X/SFayBxny7VGIh4eovyVFDCI89WZO1NPpBCtk7BOjp4uVLmfuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qS+OZ+8l;
	arc=none smtp.remote-ip=209.85.161.41
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B96A6606A324
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 13:14:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B96A6606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qS+OZ+8l
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-6ddef424972so2682405eaf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 05:14:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794402891; x=1795007691; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WU9tbewfdDNGygX+WsvROhINm1RTKRFNHxU/Ul0rphA=;
        b=qS+OZ+8l5x0OUYgVDcIkSVxv7Vxi8PNBKwee4x8AXelL/5+qr2Pr4Fg+UQfFw8l1rj
         No55kaqFI71remSSwh8C0sIWEmcRXLn/LgJJ8lpGzDPnaJ/5WcocsKojdgzmaa8lHvHd
         HQs2czIVCMURudA3gIXJ9vsP2VOZl0vZkzTqQQoaBmWWzwM574avQsLeQej92E4jBIeK
         o/tBVm9WAiwxh/6YuHMR25V/owmTOwmrZYG0gAMJRMI7R0389sw789bnXVCewsgvem5b
         uEApyHKz8LT0KTVR8oTw0vc6jNNTx0qwaCt0x5PcX0soUkxaXY9G9iXg3IrDp/yvIV0j
         97/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794402891; x=1795007691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WU9tbewfdDNGygX+WsvROhINm1RTKRFNHxU/Ul0rphA=;
        b=Uq3RWSGmyi/icUiVjwvtLx0o03axOKz7oUhJiyEoOOUjbErUq0sA4gcjPUeJmVvyOl
         hDbzUVtH4kqDzaAelkm8kUSU3wwWkq4Rci+ACvs3x4sKWsSXXvpIm0PHQCZC15XGHIz2
         RdlS++1Z3IIiHOljEmum6dOmp8JPuQOr851TbRP0xu6fXpo4/oCn/eXMjAjHvRkPU5wC
         hYq0YiinS75gt879eoRBuiyBonPuFORls9+DVU3cJ/c2eH6miQh7r+phAdXcGwCVPy7K
         FtaCBbLU1uXQ4mDKwsgLH9lQaihx47Oau4XjVH2zJe/BPdEPlAwuwxSFAvgl5uCxiVMH
         N5mg==
X-Forwarded-Encrypted: i=1; AL+hErGiC+N5qwxz8yklA9P4KrS6r83gtKK15VoFxkLOtOz524CYRuroZhaq+NccKwqNcp1M6ndNsHyETotJ0B0W@vger.kernel.org
X-Gm-Message-State: APuU4Z+U0PQCZMrC3bECRnbpxGICwUTrMdUZ2k+51FBclNMJpoAr1Ikf
	pCbLiqoZ+CrAhtw9NqbY3O1mleQm0f2ICA6pAZsX/Xb2bV/LxX2ouuaf
X-Gm-Gg: AYBFou1V2D7e4/XC4HQG8wk0qPtLpmuE3YCeHXNaFXhJJf0sBZu0gnYwkRdRFjB/XtB
	SPvf3id+W330tugiYaF9CXw/0AUnkvXuh8YeSjaK/sTewCdxvLIFbIkalxnH1l+fvTF4hqq1Bjy
	pXak9LS5CzLrZ7eeusFY/dQNZXckQ+t/qvNV+CA2NBzIscnz8XB5sd/2cFCVFlBAIxLy8BRS2jy
	xncihw3br5xVuEuIQt2STp6hCk+l3UCFLiJ2/zMKXAGTo8/wFc7FsnnbuP1DIgVgJZq/h/JseMJ
	V182lPnOIdVDRqJw51gzCvs68ObV44+ZShFI2xbLv5540KLDRe8t3MqjROGclMuPUD5KFSPo1Bm
	vcn7/TRyM6hTPBNo8kvV83nRUsH+i/6/vQrt7occ0XYwyfZJM7Nr+5iCHgWcA0mERT/Vm7dBzjH
	1zDucZaeyobnzGO+P3wqYoKQeAH9u3v2mQ+4yySXZvPlnmd8sXoFomQAUgYOeI3kyBUc1HFNfA6
	oQQ9h+2J4jzUiiE2PY6FdgbGY87dmNWwlUbXDHPHc/03LO9QsDzNrW2zyJEoRr9aOl0wX91Ttt2
	nHA4KN3cVp0tEmCoxkQ8+PycktlbJls2r9buSJ2pNOyBteBVQSxpYYgK7jKLNcUTMHxrC8HH3x0
	=
X-Received: by 2002:a05:6820:c0db:10b0:716:f44b:2dd3 with SMTP id 006d021491bc7-719178602d7mr969188eaf.21.1794402890659;
        Wed, 11 Nov 2026 05:14:50 -0800 (PST)
Received: from jeffmr (63-152-14-173.cdrr.qwest.net. [63.152.14.173])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ae22fbc9c5sm3602123fac.9.2026.11.11.05.14.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 05:14:50 -0800 (PST)
From: Jeff Roach <jeff.roach0@gmail.com>
To: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	David Collins <david.collins@oss.qualcomm.com>,
	Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
	Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
	Tingguo Cheng <tingguo.cheng@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] soc: qcom: pmic_glink: Add GIO pmic_glink instance
Date: Wed, 11 Nov 2026 07:14:24 -0600
Message-ID: <20261111131424.51869-1-jeff.roach0@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261110-gio-framework-rtc-driver-2026-10-12-v1-2-e4164178183a@oss.qualcomm.com>
References: <20261110-gio-framework-rtc-driver-2026-10-12-v1-2-e4164178183a@oss.qualcomm.com>
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

Hi Fenglin,

I tried this series on an HP OmniBook X 16 (X2 Elite "Mahua", DT boot,
qcom,glymur-pmic-glink, 7.3-based kernel, firmware F.04). The RTC part
works: rtc-qcom-gio reads the correct UTC time.

But UCSI breaks when pmic_glink_gio is bound, although the commit
message says ucsi stays on the legacy interface:

- pmic_glink_gio loaded at boot: ucsi_glink fails with
  "error -ETIMEDOUT: PPM init failed", no typec ports.
- pmic_glink_gio blacklisted (patched pmic_glink still loaded): typec
  ports and partners come up, plug/unplug is seen.
- Same boot, then modprobe pmic_glink_gio: the RTC works and the ports
  stay, but UCSI no longer sees any plug or unplug (old partners stay).
  USB data and charging still work.

Happy to test a fix.

Jeff
