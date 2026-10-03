Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11FA9384CDD
	for <linux-arm-msm@vger.kernel.org>; Sat,  3 Oct 2026 17:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791049075; cv=none; b=bEsVWBxvVeMeaXLFuGsZJLi1Vn1wWWX9OoFf9k9+HIgt+fLNBqMhnkRomegvijrQ+nRB3IFrNRdZdIGTCojyNhKRx6qeycPVnOtEKeGs48Zx7Da05wn9EeNME1rvKWngioTJnT0klXk1d0IE8q9ImN45EAUqP51O4G34PnwfBv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791049075; c=relaxed/simple;
	bh=ffsJ105eYLUOuLk7JN/4EgkWfpmmINiOvVNT5OhL4Jk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=d7loQJ10yCZY8AnP9HGyDhyJ1qoB/UfVbzAa05aoBWQq1fqc9ycX8zxwePfJrvUDsx8MvAVxMeRR4UtlY0HuzMO6pv6vkddoHSRWgAHuZXpZYt+M3EeixWMnfVxF3WcHVuL7c34tBMWQrwcn5WCF79N95wF8GISrlHg9/0EAKZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VsaZhMEG; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VsaZhMEG"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-4a11603310fso6810545e9.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 03 Oct 2026 10:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791049071; x=1791653871; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=I2lRWsP1FfRJ0fI6QeP0o6eYlL3R/tQRBoVsnT5hF6o=;
        b=VsaZhMEGaTNKa9BsUOdA9s3PPKEfhCmv1EmN9RCz33admRwT8Ms/Wy6G2grwFhrJtf
         /PATnI8ft0htPhiYIXQdIVZi++AjnJn6wVMtw+h8Aai/XczE6rqa5UGxl3R3iea7wEgk
         5eNRBxpFSOy8SpcSFQjeHG5YlfYeLvMSruP7pktiwIZUp2Vtp85xKhEqClrmJxvyTnWv
         6QDtMt1jNKOsEIcwQM7WgYEQO+jgdW8J63et0+Dv6lqe9ayWz6rNbQVpNGafvyrnX25y
         2BYe/hyPSng4uGsgKJsYh7psGkfPdA8SZrxLLTjuwYILBCk0TrKer6+wGkxYUN4Qx5/Y
         K2Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791049071; x=1791653871;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I2lRWsP1FfRJ0fI6QeP0o6eYlL3R/tQRBoVsnT5hF6o=;
        b=XKwWOFyd8nY0SSnBkg5MJ7p2LyzaRy/0ceVm3bYGcpTa1CmM95mWTWFxg/gsr6K6Lo
         Gm312VwyNGsBsTLt+L/pAibSuIZEHTNOMWBQ2pgfb8jKqGeTcLcCfTzkB7JSbGV+64VR
         qETZ1q9bwdq/sS8h467nKhmlXRpVWgHZg2GYxDhlpjB/W2sR/BgDXRSI/8x5XmZk4HEy
         xa2TXOjuRqTPXZLP2Ykw3O5xCfAIRA5NNyVm4Xa93zulXrdx6WEXQFdgZBlBfPcDMAJU
         zINaF6oKROzNqwSv0wcgOO7E5gC5SPSNUX5EQjEOy1AcyKvFXtSOP3mEST+RdagaJlVV
         G6nw==
X-Forwarded-Encrypted: i=1; AKwUvBxQr1P4EnaeNnCuy+87B6o3czOvHnEgZWoPt7xPz03GZu/pzMYguEI4q0ALvhACxhCev+lh6/cXVjqyitwo@vger.kernel.org
X-Gm-Message-State: AFuF++lk5CZcKLj9Hnjty7+tI5SCz88YF327CWW4CCN52R5z3LMEGsqe
	jEuysT9P8zh7hbBFV9mugrkMycYme5EiFzW4r1Se5O24BOahCGnUNi+3
X-Gm-Gg: AYBFou3EyCGYvKqHTxO4VyLC24UOs2ZiiQ382StyNyhn8oZHN+FB5qqWa2R+2w3PN3Y
	CTXz1hD1qEfygpBIYbRqbAvmBVs0+RJ7ammjYID51uf6or0yadKUak96eGqVjdo+eEPQu79Sthb
	QI3k4NSLW4aVqbaKNgoV3IBXW2w1ZOyAexXoOXRNF6FeAYxe2W4u9dxmyzYiZcRIvup37LQxP9w
	iMPr9+AYoqgpi1oABbKpZ0WajYxHDtQvxmnIiUi0RpvndENBEf4JukY9e6Z1yVIQBmOK9WGJt+z
	IJHxJW5CclFwXa76g0b9br22CofZa4NG6k6rtfixjOt+WtGH3d99SVseW87FBH0X+xIpgng2+e+
	7UhomYvUOhHtrZ5ErpygHYhr9b2eisifnUYFlz4ZHRMIkdJraOmFakLDriwS/j+KQUHr0YfK/w0
	XRzjYd9B21rwHi4f3ouzyPpI6kr5UsS+Woh3E6LsB1mu6Qpu0PJL4DBsaPpygfZ9ygsnroCdQty
	lPoXQAPIp8Wtym2zPS3z/cZHEGs3XG0iYjZt/P9E29kDVE=
X-Received: by 2002:a05:600c:2049:b0:4a0:35c:8953 with SMTP id 5b1f17b1804b1-4a027566371mr66713875e9.7.1791049071004;
        Sat, 03 Oct 2026 10:37:51 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a03feed16bsm152460585e9.4.2026.10.03.10.37.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 10:37:50 -0700 (PDT)
Date: Sat, 3 Oct 2026 18:37:49 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, Dikshita Agarwal
 <dikshita.agarwal@oss.qualcomm.com>, "Bryan O'Donoghue" <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Sachin Kumar Garg
 <sachin.garg@oss.qualcomm.com>, Arnd Bergmann <arnd@arndb.de>, Abhinav
 Kumar <abhinav.kumar@linux.dev>, Wangao Wang
 <wangao.wang@oss.qualcomm.com>, Dmitry Baryshkov
 <dmitry.baryshkov@oss.qualcomm.com>, Deepa Guthyappa Madivalara
 <deepa.madivalara@oss.qualcomm.com>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: iris: avoid plain 64-bit division
Message-ID: <20261003183749.4f113fcd@pumpkin>
In-Reply-To: <20261002124435.3435628-1-arnd@kernel.org>
References: <20261002124435.3435628-1-arnd@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri,  2 Oct 2026 14:44:22 +0200
Arnd Bergmann <arnd@kernel.org> wrote:

> From: Arnd Bergmann <arnd@arndb.de>
> 
> inst->fw_caps[BITRATE].value is a 64-bit integer, which on 32-bit
> architectures cannot be divided:
> 
> ERROR: modpost: drivers/media/platform/qcom/iris/qcom-iris.ko: symbol '__divdi3' undefined!
> 
> In particular, doing three divisions in a row is particularly slow,
> even on 64-bit CPUs.
> 
> Rework the calculation to replace it with a single division, thus
> avoiding the build failure.
> 
> Fixes: 5f21cd9a4ae4 ("media: iris: add support for multi_slice in iris encoder")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> Please check the math, as I'm not sure if this is the intended
> amount of rounding. Previously it was rounding down twice and up
> once, now it just rounds up during the combined division.

Can definitely change the result:
	DIV_ROUND_UP(7 / 3, 2) is 1
but
	DIV_ROUND_UP(7, 2 * 3) is 2
who knows what the value is supposed to be.

> 
> Ideally this would be replaced with a cast of the incoming value
> to u32, but doing this requires to prove that this does not overflow.

You only need to prove that in incoming value is less than 32G (Hz).
The '/ 8' is cheap(ish) and can be done first.

David

> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/media/platform/qcom/iris/iris_ctrls.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
> index 8c4c47944f22..5294999fdf7b 100644
> --- a/drivers/media/platform/qcom/iris/iris_ctrls.c
> +++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
> @@ -1588,8 +1588,9 @@ int iris_set_slice_count(struct iris_inst *inst, enum platform_inst_fw_cap_type
>  	} else if (slice_mode == V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_MAX_BYTES) {
>  		hfi_value = inst->fw_caps[SLICE_MAX_BYTES].value;
>  		if (rc_type != HFI_RC_OFF) {
> -			max_avg_slicesize = DIV_ROUND_UP((inst->fw_caps[BITRATE].value / fps) / 8,
> -							 slice_caps->max_slices_per_frame);
> +			max_avg_slicesize = DIV_U64_ROUND_UP(inst->fw_caps[BITRATE].value,
> +							     fps * 8 *
> +							     slice_caps->max_slices_per_frame);
>  		} else {
>  			/*
>  			 * No bitrate target exists under RC_OFF, so approximate a

