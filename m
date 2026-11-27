Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795771914;
	b=d+RiZVxpzcSJwiSyPTvNPtb9Dg9Zb+VAuL9vB7xxglgbVEeD/RCHIitSBX29aX6EohH6
	 MZTDOdvN6nbzWiTQdDL4tYKrFZ1/gPzGqHLHTKY3H12W90cYgCraBWsOyUP7rKFyKDHQj
	 Ve8lfI62Ngs0fEIXvTmTAM/u4it1IWgWxMLni354TzcaL+6rIsZLbPg8xLQ1lelFUD4iB
	 C3ScpQKZomzACIlZ7Xd+bTq+GU1KorFdb69ebCxLpgLCE/wHD7MOEFD5zhOJODJ4i5QfM
	 wd4sKl3S223GH3C/Ps/r9vPGsIa6g6sgxiufG6YSxjWbnHMbmemDhmRoecN9OMlYL7w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795771914;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=rYtTvFCeRVwq4VXRd7pixjilcP+eVEpuccpxopQo40U=;
	b=rvgSkT0hbqycnR+zRBchJNysHjDyN0QmzgRR9XY9on6Ea5686eXAqYiPk8cQ4SR3KpY5
	 M7BFxwEn408uCkeif3Xw34lk2jkm7FrxfowqojHnA2xiBav6wcmwNGh0peDgMURzESOLv
	 HM/xfrRwEYGP4PcB7FmLcwzB4fI27HvK83ibq+psau6bn/ltV+PsPitaKD3Z0bvMddetk
	 V7hUFbT+CoQ5e6F979kXTFf/Swi8SC71mNLmsTHvfFfcFlqm/DPu8oZzH4CdqeLeM2AfV
	 RcMFsxUhm38311YPyZ/nFvSXTIW9J5uXF4e3FD73G/Qbuu5vHNZdmbQANe3MeZhJ9MQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kgTH4UB7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.48
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A203A606A323
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 09:31:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A203A606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kgTH4UB7
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-71b45386310so3747107eaf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 01:31:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795771912; cv=none;
        d=google.com; s=arc-20260327;
        b=XIwIdwC8HJcNvkqgGkqHSoCthM7tKALcbjf266HDpj8j+ldpRgRrvAaLxp9c4Du94k
         nos5EB9cPD8Pbvsd3fFFrVV9KmgxmMJr9XstcvFqWUln/CB0rnpeq2jA5to2RR/VvDHC
         H9XLOQaBQVw6OCdRKYpyatNwdeHwCX1pNjy3+6Q95aX8p3r9D1Xb3GH/GBGpvfCdHqsM
         Um2CGv3T8QPbO/4P5tDVK+IdpReqOp2SXw8VNzGThdKq3CtCyTLI2dm8RCTSrUvmepRe
         04ueDNQfV9taxqYPnbTaLISM/l9LG1aseawt2P0mmT58rSSCpgSDZrVp1vAfQQYHyLhQ
         WLLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=rYtTvFCeRVwq4VXRd7pixjilcP+eVEpuccpxopQo40U=;
        fh=eSoaxC0XAbC9dIvLt81SAz5evA14XdvWpLPQl4b25fE=;
        b=emL5L2Yj3fepkViu5aUg6O3y+UvxTP2k1qzcoxMeJA3KUlw84W1OJ9gu43hcZT8Wtj
         jKWgCY8OJzUMSS8TLcU6dyvQstkiBrVrBD+H+vlPiTSbyrmTM7fqfOzK5LnPO4piKbAi
         WWZQCRAluET5e9EbtnUDrYqguUtk15Vksw3bv1FEY/E8h3m8/5mgr8E+AM59i1fotXDT
         2+sa1fxQOzcNXyrLG+IHQZwtIwrcC+4V/hmyQB6FPrvptbaisC7r+z+Wrs3IsGnOhUvF
         fitvtqWL5gTVhXDwEOk/xgJwVbCM4au3vaJa4/jR6/GyOGbKGPz7qPh8vIiglncdR/nR
         KoWQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795771912; x=1796376712; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rYtTvFCeRVwq4VXRd7pixjilcP+eVEpuccpxopQo40U=;
        b=kgTH4UB7TdH895I/yZyfl2qhrZUiBsrMugyslK9h/xhdkLD6Z9tkvI7FrVSaDYvpfr
         9YdnFQMkrWvNOwpUrkrpulfUFxnOn4F2n74PiGMCDRMqfPny+hOciZuP9+7ndAr6vrD9
         xojkjXE5ZfmYZpX+fPBX08FfXdT73jkGpvsITUj+L6yQOlCGo+1aNpZQIH0MxFrQULvw
         ri5hh8P99w3If95uJasGdUwKPNCbz/+gSyunmSAcKqW2IyDHh48rf6tslmM22jlQJBAi
         DXY73qiH9NYpY15PvKcjUsL/b2Sqc+WYqj5Q9LCUiiPo/0obdsObFiUz6TLBTgq5/Rmx
         w9kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795771912; x=1796376712;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=rYtTvFCeRVwq4VXRd7pixjilcP+eVEpuccpxopQo40U=;
        b=Y2NZLwO7j55eVIkYHGG9EqXX8AtrgVa+9wu/tZWGecrH2Cv9oeT9lb/vBcfQjiKrgn
         a6sPZjS3WEhHUKOb4pGryTGnw2fdud/xIi6Q9g5qai28VxS+eoKNlKjiPEDwSY2KTCE4
         oTePQgUY+xCKJnnRORjdPvP45rtISq8Gmye8bSyLq6gWFveloi8GDD14FQVQl8b+lVsO
         DjAPX+0wfLwK0aI86gfSFr+hQvVWaLTwRHQrGncRNKVeda6dJ2PUiUIMahqTfoWC9VEa
         a0r0G82tXu+LfAcHKCCWi0Suc9tNkq9C8UuThUEohkP8Ou/EthEyIetR7TAj3soAGb+x
         kdBA==
X-Gm-Message-State: APuU4Z/3zxzsw1PoKqbeMnjpa9X66Y60/AAeuBjNDa81eZP1vFUUvZM5
	P9vqyRzNs0y98ylzRclHnvgMZDAPYp4ho9Kkv/L3EiUvrMkksJcT2W5yyqsdJdYlDy939iD5th6
	BjDZYRdUlKgBczNe5N8FGQm//E4XTcXxMOsoR5Xc=
X-Gm-Gg: AZFdTZfkY5EGu8gk6mco72691cgYbjB8HTee3qhfmPpYLLEV2ujlvI5X9pwW089HVtX
	9YEyJH+IRpBKFAVayYZxIUDpLj2M/cHnNpt5cXDSn+PNbz6Xrzw3Py4m/bcykfhd8ja8Fyi5M97
	x5K0anIsnW9rVK73O5iy0yjpRqQKZEC0gSS992tF0K5ZKUTYCnoIN680JkH1sgAV0XqqyPs1Smg
	Hj++WyqN2ZvjfLL8dgFbQY7euVJIlX+x7wv9ds6Tc8w8VEPZe4itZIil5d0cM7xpP/danHVGRQk
	fEbz4d+8dbhDf3tn9SR6uOC/D/1NvyHp8kO9uGxOVO3b5ufKLXj6H+d/3kZOotmWS80D/MZeWIC
	TzPKB1VecInicCfzoYgbtkYrgxHAx1QvUdRxCgbmCb/lQl+UG12WzQ2azGfU+9aHP49baYkrMqV
	oC4eNKqVz/7Os=
X-Received: by 2002:a05:6820:a747:10b0:71a:fcbf:2468 with SMTP id
 006d021491bc7-71b395bd211mr13965028eaf.88.1795771912538; Fri, 27 Nov 2026
 01:31:52 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 27 Nov 2026 04:31:51 -0500
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: getfeus@gmail.com
Date: Fri, 27 Nov 2026 04:31:51 -0500
X-Gm-Features: Aa3M54qQ1tt1j9P7Rj8XS1ubdWaAGsLnrU-PhqZoKg3SNgf-6Tc7NA8ZE6SAwm0
Message-ID: <CA+m4KrAaEbbZywwCq38BqvTuh9dn2+23br6N3FYxB-mix_+R6g@mail.gmail.com>
Subject: [PATCH] soc: qcom: rpmh: Return the first error from flush_batch()
To: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

When a TCS write fails, flush_batch() breaks out of the inner loop
and continues with the next cached batch. A later successful write can
overwrite the error and make rpmh_flush() proceed even though some
sleep or wake commands were skipped.

Return the error immediately so rpmh_flush() stops and leaves the
cache dirty for a retry.

A mocked TCS writer returning -ENOMEM for the first batch and success
for the second reproduced a zero return from flush_batch(). With this
change, flush_batch() returns -ENOMEM after a single write attempt.
The ARM64 kernel and modules also build successfully.

Signed-off-by: Lee Youngjoon <getfeus@gmail.com>
---
--- a/drivers/soc/qcom/rpmh.c
+++ b/drivers/soc/qcom/rpmh.c
@@ -334,11 +334,11 @@
 			ret = rpmh_rsc_write_ctrl_data(ctrlr_to_drv(ctrlr),
 						       &rpm_msg->msg);
 			if (ret)
-				break;
+				return ret;
 		}
 	}

-	return ret;
+	return 0;
 }

 /**
