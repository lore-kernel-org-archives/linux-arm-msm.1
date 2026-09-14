Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38622490C16
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 15:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789399318; cv=none; b=q5oscXF0fWNswQlEpiAQSLRziuSgaDonIIOkyrWMZ6uhF1M6Y0gVjORQsZlxN7lhXedTAh4jFbZIMdipwD5oN5B0DhKi1PYxgRBsN2dPRVNDLBPB57Dl3fyBuAyBV0ICngg4w7uHUfzwxQ/2aqvlykhpv10IdHOrNMeJT9zZTs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789399318; c=relaxed/simple;
	bh=7nGECr84emLqWyNDyOX70IfdI2ORNdzf43u4uutTtBo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uqvSY4RZ+K9w+6AaiOcXt6Ac0hKlCroqJBDWfNwmAUfWW62J+N+LpwFqzEP0pmsXAyXHn1kLTBhJIF3jpvX4fz8nTR6xmGUgRK9n8/kUvbAmCD2tJNlNuSb8jDPsqZ8aWVvPqkD1RIslJ6VNO2bCIAkJwpqvCea8zfVHmlYyJgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rCvOVXKx; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rCvOVXKx"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a60591ae52so3906347a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 08:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789399314; x=1790004114; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qLA3m0NGa2cvdE7XQveDYTZqplmx5lDSMQV/pnRZYqg=;
        b=rCvOVXKxPv/FFfQwsHVmxjQFa+mToo3kHUmwb/zeEi86gCXrwww/IsL+EXkmnzSEWM
         M+Bnbd3W7+ml+S/2sYTojU5J5Ms/9I5fLoC//jrQ9IH8qSvvxiE4KWzZ2+RqxYllreOr
         IyMFgbUY8QdLcVd9c5CYXlmS12/dz1FoiNfFxbYIPBan2VBuP5MjT7rLNQMTnuzz5z9q
         KNpZcYlWHRiTjQxgOAA1NLiy+yd7nRcAfFFmzh1seVfzRdLiBy0oO3Vw9KVRW0HXS9kC
         9hAcigIQ2zDKkI4JqnG/PLMNIMqrIn5qVPNpU+UcfRWqNdKg4FUZYBhhex9RopqdDD48
         gZRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789399314; x=1790004114;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qLA3m0NGa2cvdE7XQveDYTZqplmx5lDSMQV/pnRZYqg=;
        b=qgPw1QMeLQdwHOghQR4VbaKAXOGBuuNoRIExeKN8b8MZPcgZQFK+fKn9WUvbUtaM/A
         IU0KCY02+VVgIrO6jIxgZzNqNg/NPfPJbA0z9lUkgJcXZcIoqyPZLmPF7pnbPW+pAXSh
         uJl38OIwht5YYL9JG0UV/aqoRjoAuFQBsKyRVn1sS3v8n2N/wel/v+jldOv/puaka1ky
         yh3bRLivIJlb5Tu5uy2kOvNQuguOTL1wWPn5pNGvwgFXWGPptjHL97RqcYnJ4yKA3Ff6
         3M8OBEEb4hNHClnuKeSEIcPiVjjiOpba6lnfkMM1QGvCOQHRx/gIMQWoYkK5C8hnJFlC
         /bnA==
X-Forwarded-Encrypted: i=1; AKwUvByKkVtFC6fMZnN7rw3sBCXBAnwUxtXGTktDUt6cFkmUjY3PbqrohMH+rkqjzgsviUVma52RVL2/6U/wMpOs@vger.kernel.org
X-Gm-Message-State: AFuF++kSwUAMmdu+r4XqOR04Xw7o9yvVtpD882Ud8zNHy8AxW+yNQrqq
	LrhCkNhoFIHTENZDVsfFy84Ee8NRDqH0sKHS5I9yZ780z9+KXdogQEzmrOjxH1CADys=
X-Gm-Gg: AYBFou1UpXMgMXBiU5g2cnV3wX30dTlEluCGCJvRKx50Ao98hyk7Kcs1EqVyp2damct
	IxmqYHcf6x5nNByh6XupzXmB7Fif4XkVe4Tp1PpkTiwVYoJTXeUKYmysuVMggb2XrT4vwNHczFF
	ypCX9m/CCFnPh4uFae+xN+fOWsvyHx2RmJnwtMaq//lzPnA5QQEbzlZMaMNMxB3/wJyy79nVv1b
	fIeMGMHhv7rgODemlyXlxkh1ujnXqbupdpTffUAg6a1VGfRkpvYYfo7BMWM6lDmAvFrLzZcBkaw
	QiXe65jqgBn60hGxMLh/uB6kZETE3PwXwbsR++/EI0BMjwUh08EYy0hATtTBI9goL4ha187WVXf
	ieu7ieRT4r9MuUb7V4lZEGxCJo6sFkr7o0eQd4oiCNf8Bb7swwa8Kc7eC7V/Onn58bfDNlf3C+g
	KR8PKmmgoSNMOI0xnu25eXavaN8y0C11aEA4h1fu3N2kYpNgBhUEsn/9adsA8TFEWqZUHUQY0gs
	RsJpepDIU4=
X-Received: by 2002:a17:907:3c94:b0:c25:c979:e76a with SMTP id a640c23a62f3a-c29b8767641mr374816866b.22.1789399313992;
        Mon, 14 Sep 2026 08:21:53 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.248.34])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c296608480esm470622966b.36.2026.09.14.08.21.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 08:21:53 -0700 (PDT)
Message-ID: <18b629b6-5944-4a1c-9573-fd0ee4b25cf4@linaro.org>
Date: Mon, 14 Sep 2026 16:21:50 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] media: qcom: camss: vfe-17x: use the write master
 matching the RDI line
To: Hitesh Patel <hitesh@ebytelogic.com>, linux-media@vger.kernel.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, ravi@ebytelogic.com
References: <20260914133416.1030231-1-hitesh@ebytelogic.com>
 <20260914133416.1030231-5-hitesh@ebytelogic.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260914133416.1030231-5-hitesh@ebytelogic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/09/2026 14:34, Hitesh Patel wrote:
> Signed-off-by: Hitesh Patel<hitesh@ebytelogic.com>
> ---
>   .../media/platform/qcom/camss/camss-vfe-17x.c | 22 +++++++++++++------
>   1 file changed, 15 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe-17x.c b/drivers/media/platform/qcom/camss/camss-vfe-17x.c
> index f62fdabbc..0cfc24255 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe-17x.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe-17x.c
> @@ -403,10 +403,20 @@ static int vfe_get_output(struct vfe_line *line)
>   
>   	output->wm_num = 1;
>   
> -	wm_idx = vfe_reserve_wm(vfe, line->id);
> -	if (wm_idx < 0) {
> -		dev_err(vfe->camss->dev, "Can not reserve wm\n");
> -		goto error_get_wm;
> +	if (line->id == VFE_LINE_PIX) {
> +		wm_idx = vfe_reserve_wm(vfe, line->id);
> +		if (wm_idx < 0) {
> +			dev_err(vfe->camss->dev, "Can not reserve wm\n");
> +			goto error;
> +		}
> +	} else {
> +		wm_idx = line->id;
> +		if (vfe->wm_output_map[wm_idx] != VFE_LINE_NONE) {
> +			dev_err(vfe->camss->dev, "Can not reserve wm %d\n",
> +				wm_idx);
> +			goto error;
> +		}
> +		vfe->wm_output_map[wm_idx] = line->id;

I don't get why you are disjuncting on PIX here.

Also isn't this a problem for ~ every VFE ?

Again.

- Fixes:
- Prefix patch title with Fix
- Fixes go first in the queue of submitted patches before functionality

And since you are going in with the knife for vfe 17x you may as well 
fix this for all of them.

---
bod
