Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59FF245FFDE
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Oct 2026 14:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791298506; cv=none; b=AzyJbfiolLkBpniRBLPk3AD1GVT/CGKP2v6T+6MbQrZr0J73HnT45EbndS/bkIkjL5ajdoZE6rTmN69WA3Z1gNvtvUCWawfzeiT0/xyIyfAkBZSN/Qa33NlIiiK1Onje1P9DfEgEVj9b2YpSq0zEQ2kN8RFrkeHDFcDVCBCMiVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791298506; c=relaxed/simple;
	bh=R4KgQ3S4Hw1T8EoPFbH6w2icBtvqBXb5gZZ1wkD2hYs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rp0huciktIS++5g2UH5t1gJRua+LeiTVMvnO+LhRGWIvI6BlYNLK4MIsnWGFWQ1P+PY9GqVqpdTZj/A2df3N5jvVaq0G87Zl2NsCL0Ad9jHAY3qFJ8elMv7Q242wR8UDCs30kiEHedpiq7lRaInmdE0ISOOivIKebp1HJlMnFwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DNxW2ePX; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DNxW2ePX"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-3282db206d3so8853762eec.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Oct 2026 07:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791298504; x=1791903304; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=R4KgQ3S4Hw1T8EoPFbH6w2icBtvqBXb5gZZ1wkD2hYs=;
        b=DNxW2ePXDQoOCN5STko2zaq29Q++QxwK4Xfv145SwJCcF06vUIzgSh4rVlyXtr3Zeh
         /IVzWppqfBAiKolF9tXNgGTOVpyamVdrdcBpYp4JMga6uVmS+vhzyD7eYVbPjj/cuvsy
         vBpV1op/Gl3P/RpCPRgo8dDr0te1qUNeJ9VCDAKmX46my3vkGdDQRouvoYMOIpykRKEq
         dO6Xf+bsIIZnvgXA1GgQNIoFwrQUT+ZhXAZ6ksD2KacrM5ykzFmyIVXeOi5sGQDuVZTp
         JG77q/LhEyajnxg3L45XbL3tlOzvhj1O8nfARhGIwtsJZI2FRKINRO3l8ZPBIVNfoLgN
         CV5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791298504; x=1791903304;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R4KgQ3S4Hw1T8EoPFbH6w2icBtvqBXb5gZZ1wkD2hYs=;
        b=CZWkwg7TYOkwJCTNM018XadsjcvIZzLLPIVcNGbIT18N57riZDSn0+vs6cw+FPRJFk
         DupBVMOMIOTPEeLoPeVB+pkGL8Yqk9htYIKsfI7CQhSwTkhoxMAsUUd5srv9a6NCoil3
         Y7B96m4lxWJbb4ZVnUpvVlhnwhxikQ70oyEAULLQJtTjonLoj1R8f6Gdi3AmSV1Wwmbe
         JAJ5XorTIv+ItZwd5yEktdzMBxyeukTQIvMwlatR662Sxb3YlwBOgtr3Jxeat9qGWqdq
         IB6WUFSngcriXn803LisY5e2V2r62m/0d0TflP6+VN+g/LJ3u9jl75vn6xoRGmUmWppA
         9rdg==
X-Forwarded-Encrypted: i=1; AKwUvByK24ix7lyRs7RKPkctI7Vfd+rjnuQjfBD8zpBnlLNcqUwwIjXk2MSRzbONg+OqvZSIVeM/suWoAl/hm6g/@vger.kernel.org
X-Gm-Message-State: AFuF++mNwrCYwcmsge8bSGoKnB5szsAhpSrkFMwtCfJWL+dRzNGUk+Zx
	orsd3BNvCicsXuU3jpQGighbsDOz3o9M04ZNb/2XNDzzhtq2ZFrcRCiK2vFlokmSaOyJ1g==
X-Gm-Gg: AYBFou1AHHjJhFw24TndN2yerEMyx7nN8djVM3/Txbxw4Hfjb5hHxyhxOBGHHU0JbNP
	qcB6BL2H9C4zerz2xtK4ixGd3Lym7SMIQl6cIj4leIPhVoCdPzMMXZ3D0s380624gjw5DhBmgRe
	Fp//PbP3O57P8RcpSlB8FLW+js/xUUTzFULeBTCLXLUZhK1cYzyGWxvsQGWoAJuqLWayQluKIWF
	xORNwKEC4HmYvjCOjCLRpbff/NCzWAk42RncQ0GX6UTSw7Udlrkz3mzXAQ0spF4UQKV5RJFXvdC
	xZD09RAi9CFycsn1Yje5raabu7UlpP+qruEZ1FjG9QXyZuov2HyB9hgo9PEfP+Dt1xJICzL0u0c
	C1BjdxNB/ghs7HAwifKKADjlPBlYuLQBBUpr+Iu2ehzLUqoHyBner25z6nuYHEIv9UdRAKDfDr7
	CD2n6MJTImYq4nEtorhaUfcmPyLr2XJzlPnUvR2aE5LsxctjwGX8rN0uCOIPmQqKltLaIEgGtKR
	3sTdruYY2eelrkL9vfVcO4+Bdw590rr2QpqTaMLoO0yQAUgKUovtxs6QizzFrvazavoa0ISNiYo
	joJEoxw4Bkvp3gmHLZnkhbo/SO9t6inB0iXeFU/DFJcyEN+zRsY/lHZ6awda4X7Ngt8otctiSnI
	LfMUzpdjmf3hCGAQJzyzz+sPD5cSEA2T5SY5+lEIE/RAdI/iY6BvaRMM=
X-Received: by 2002:a05:7022:7e8a:b0:143:298f:33b8 with SMTP id a92af1059eb24-151c4c11b5amr21602995c88.44.1791298504055;
        Tue, 06 Oct 2026 07:55:04 -0700 (PDT)
Received: from yoda.tailb23519.ts.net (38.70.247.229.sumofiber.net. [38.70.247.229])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-16105519176sm11243c88.13.2026.10.06.07.55.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 07:55:03 -0700 (PDT)
From: Hasty Heat <hastyheat@gmail.com>
To: abel.vesa@oss.qualcomm.com
Cc: linux-i2c@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] i2c: qcom-geni: Restore the source-clock selection policy
Date: Tue,  6 Oct 2026 09:55:02 -0500
Message-ID: <20261006145502.105542-1-hastyheat@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260928-b4-i2c-qcom-geni-preserve-source-clock-v1-1-9aded7552a76@oss.qualcomm.com>
References: <20260928-b4-i2c-qcom-geni-preserve-source-clock-v1-1-9aded7552a76@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Mon, Sep 28, 2026, Abel Vesa wrote:
> On X1E80100 CRD, this results in switching the source clock from 19.2 MHz
> to 32 MHz, which causes intermittent failures when probing the I2C HID
> keyboard.

Same issue here on a Lenovo Yoga Slim 7x (X1E80100) running v7.2.9, which
carries cb97bf3d4f91 ("i2c: qcom-geni: Fix hardcoded clock index in
SE_GENI_CLK_SEL"). The ITE 048D:8987 keyboard on the touchpad's bus
(b80000) came up as 0018:FFFF:FFFF with a report descriptor of
0x00 0xff 0xff..., after "did not ack reset within 1000 ms". After a warm
reboot the same bus also hit "Bus arbitration lost, clock line
undriveable", and both the keyboard and touchpad failed.

With this patch applied to v7.2.9, the SE clock stays at 19.2 MHz. The
keyboard (hid-lenovo) and touchpad (hid-multitouch) probe cleanly, with
no arbitration or reset errors, on a warm reboot, a cold boot, and a
warm reboot from another kernel.

Tested-by: Hasty Heat <hastyheat@gmail.com>

It would be good to get this into stable as well, since cb97bf3d4f91 is
already in 7.2.y.
