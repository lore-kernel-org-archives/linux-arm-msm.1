Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD15148D896
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 07:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791963556; cv=none; b=Ie8kAWMS9MTapMgD3ZllGbwnBQ2hhXb3QgHmMJyvZEp0rS48AGH/yhcD3Y7L0r6L0n2WB4xu4c1pW3jZNZRotTngrZThUmfegkSic3F47iTBtIkisIHThA5LCep7TB6/Rv1CzMtcRowBld++Hq1B4qDxaGL0BMIKV7jLl7YiEKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791963556; c=relaxed/simple;
	bh=OGqY9OeuSuI0aEthSsiU7JsrWFGKoAcXGOm0ksXcQTg=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HC23zGyulO3tPoDk6Rgo/zjWoUFDeKVS2Zuf2CCor1ggSuhpzMnTUDVg6TR/TWt4BJ4XDj4NvDPmTTQWXeMyV3kaocudeWF7GAdKlLiSlRh/3upURTiSKVRL2Gzdi0TQORPHhlVu87ICKxbXOZQVMsV0MR9cf4tJW5H2hxevYUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WqRkRRom; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WqRkRRom"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FE791F0089C
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 07:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791963555;
	bh=OGqY9OeuSuI0aEthSsiU7JsrWFGKoAcXGOm0ksXcQTg=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=WqRkRRomO92WDiOUWic+S1zHuVNhXsWSqhTlNhkdarMyTWSgdXSEKVpoFMKUT4usk
	 XUv8PpKBAUMM6AJl2xktCaqgYC12xkTJQvFn2v1THERUM0W2tXYkba4Lj55kBYj+Ac
	 5C87fGKNhL860wPdWdqDtVbLoFUeD6toPIMc+3HvWKQ7FLIYZ/mT3jF4egkVCKG0QG
	 WJ5YQV/oeau4uugnNfeKQz+6SSDba1pMWUsneUuVr1skiU3ju4hzL204tnmnoRmMli
	 oP7bX8upeOJAIr0OXqet5ynKIT3t3G5P5h3DXO0ebIzteQGtw+Havul+HG0PZwtiN7
	 TCW9BfnBWh49Q==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5bcb1f1358aso2612580e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 00:39:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzeb8nbwyTz5HwDxg9Lwpj8xlktggAcp6v3lmrH6QdVLim38hKCbX9gaiCNULSbXUbF9ZXBQk2xqjmpbzBm@vger.kernel.org
X-Gm-Message-State: AFq9FYJw5AggHJP13JGVlhFNDf0wXcBmraNrpzZaoJBX2JXKG6XkwCJ4
	OjIl26gAytwWEY/bxoc6jLBG8SgABRXjcDsMzFVv6iSUr7qsh/q2KQ1ixrB3EHhEqNuUen8J91Y
	MumbOQRUM8Ypwcbzh4iho/stbHoz1cI+FfYnDZQOTqQ==
X-Received: by 2002:a05:6512:401e:b0:5b8:ef11:922d with SMTP id
 2adb3069b0e04-5bcde6cae88mr4673476e87.39.1791963554104; Wed, 14 Oct 2026
 00:39:14 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 14 Oct 2026 00:39:12 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 14 Oct 2026 00:39:12 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <5e221ba3-fea2-4663-80a9-94fdd5135e89@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013-qce-fix-self-tests-v10-0-57162a38a554@oss.qualcomm.com>
 <20261013-qce-fix-self-tests-v10-14-57162a38a554@oss.qualcomm.com> <5e221ba3-fea2-4663-80a9-94fdd5135e89@kernel.org>
Date: Wed, 14 Oct 2026 00:39:12 -0700
X-Gmail-Original-Message-ID: <CAMRc=MdqwrTGVtnZuVUsn8onTMxxhbysVfUPtmABL2a1Avd2_A@mail.gmail.com>
X-Gm-Features: AclHuK_y_qSg5r7k-9srjbMx_1U4_7rx7a-kKL338uumbIkGOujVoeMBFDNQ3IU
Message-ID: <CAMRc=MdqwrTGVtnZuVUsn8onTMxxhbysVfUPtmABL2a1Avd2_A@mail.gmail.com>
Subject: Re: [PATCH v10 14/14] arm: multi_v7_defconfig: enable the Qualcomm
 Crypto Engine core driver
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, brgl@kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Pankaj Patil <pankaj.patil@oss.qualcomm.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Thara Gopinath <thara.gopinath@gmail.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S. Miller" <davem@davemloft.net>, Stanimir Varbanov <svarbanov@mm-sol.com>, 
	Eneas U de Queiroz <cotequeiroz@gmail.com>, Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>, 
	Eric Biggers <ebiggers@kernel.org>, Demi Marie Obenour <demiobenour@gmail.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Abel Vesa <abelvesa@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 14 Oct 2026 08:19:23 +0200, Krzysztof Kozlowski <krzk@kernel.org> said:
> On 13/10/2026 11:57, Bartosz Golaszewski wrote:
>> The QCE core driver should be enabled by default as it binds to the qce
>> device node and scales down the interconnects if no child auxiliary
>> driver is using the IP. Add it to the multi_v7_defconfig. Disable the
>> crypto part of the driver by default.
>
> Missing use case/hardware (see maintainer profile).
>
>>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Tested-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
>> Tested-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
>
> Drop fake tests. You cannot execute defconfig on the device.
>

Ah, dang it. Sorry, didn't verify b4's actions.

Bart
