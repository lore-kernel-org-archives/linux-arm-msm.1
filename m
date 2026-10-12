Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 479FC37BE86
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 13:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791812774; cv=none; b=QPNzJMZWqKdeZD8K01b7xzkCl6a+o7Sx9pjwoLlUDleQnMBkylXXaFf63HNpC7/PnECdrd/U66KdTfIezenaRnIcSDBsjoUnm4kGdAupxv2YXpEXasT323gIKeaNzPymiyWGcBGT/0wQdl5YCF0gPUHRWQabK+4sWYukc/JYukY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791812774; c=relaxed/simple;
	bh=sTKTqMrlzRhmp4al7IjMezpQjYCs9jIcQILHVFsOG/0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Rix1bRpwkrPDW6c2sutfKKtW9A4WLZknP/td7LWzn510r8PhRf5/CNDzCQ/QYMUZQqUJT9bIuDRh03wKUFfEjw3a0V40r3ssgBWF08bGJFxwBtBh3nZPbOJbTy0Rz/44FgUMq2XhJ7EcMUbI+j2ktXLGj/WE+e6vMXXlYhPJ1p0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=idagmA1O; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="idagmA1O"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6afa651700eso2805083a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 06:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791812768; x=1792417568; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dHws0iegm7/ve8hvmLh8jfg8R/Vly+TZYm5WF3yIxo0=;
        b=idagmA1OsttXeaiGPadLVKzPXLX0NB1ob11DFXAoYvqMdPFtUDY9HvKppD8MZj2GKi
         M3WbPNsoW5SVSsufyE9KYGn9DDvPNT2vM4L4h1Pc/Xp9ZNAA6/+5BDa4IsGX9XvD+0II
         vWzLtk2c5VPea7zWlNDlgv1fK7WKBTKLNCr3XVek2GlXAxI13Ljuf9ynvW//8eN+PrCh
         jQB+lAIXe7vl5CU1/PdKWYAMmuh0QkdI7VY8cB4u1ZtsFBmyweZPxrQmOCDJ2OmVsfbW
         e7iBzT8KuJPEfGGGX0POqomkj0+FXQk3sqtRX9mx1bn2D74+P/h7QFFK/msoK3Iysg7m
         ES7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791812768; x=1792417568;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dHws0iegm7/ve8hvmLh8jfg8R/Vly+TZYm5WF3yIxo0=;
        b=EBknVEC7JnJNzJBKN+XV1zJMIGqml03SGMyMLdOCe/XSdK67o/Y6H4zn/U6mILljfT
         5Ovpq/mtaJGf5JcoZSVzp+2uhdjxZ7RKgfNCFijZfAfV6y1PifGcdLDGkiIEZJDJTF5v
         xZFMsxCOUQGTuOL8PyWgoRl6eGEtxZPLclB0GQBk4gGyDgbvzf2JFkFNBI2JaauFwnDb
         JWp/HbV4MmiQuZCltlQqv04VbRf9yal7oSuc5bhJgInk5aBmSwhbpkWxM2plma3FZUps
         B2FOBG7ECYxn5zr68dw1ZH2zl6SS3nqXMXh9CXYwD+4K6xiGyVsy0vE8RePCp6zFIbZg
         YiNQ==
X-Forwarded-Encrypted: i=1; AKwUvBySIkxgvKjroqSgC0dUmKkRPsGL9dL4NzKs/25ihKS3/VBAlbr/EzJL+cA/XMwSJexRNqjD9t24WaXLZYbl@vger.kernel.org
X-Gm-Message-State: AFq9FYL/fLKP8FktnYqZir6AVgT2u0QCh9SRTGEqAgNXa1Bk/UCsgM7c
	Mnc6f/7ORgH3eNeVjvCqOQkbvyf4jMa7i/CPuv7QBWAcb0Gu0q1uTOn/SWtH3oTE7Mo=
X-Gm-Gg: AYBFou01nQsEIP+Z5a/oyg8XC8szwB7sl/n4jtFretBvwn7GcYwQHsddGr4xCgTzMCu
	LmlzoGnumlaTPpJr2I7QfDXA1+U77XJTlleXS7+7D9ShS9lxCtlPoIHxBFOwmKyPsS02oe7jMOz
	ElrMONq0OEZBabtb2u2fBmT0BqdrWwWSohq4xyBj2oOvtlhocbM3ZZZOEWuufphtOHYOvV9u+gP
	01eQUMTQmvfOZom1wLi3gwvEsXtVTNJeGuOHAIP1OIC4f2REGZXiFluOBtuQBA6lZxky9If/MNF
	ZrQK9vcTk945QFN0xQr7y3IKRNHg/Qheu1li4dO6DpTaWVsuL5mTXOVGJFaQmTEFPQEDh6nWVqi
	Iv8HRICd0CCD+STjJT0SZPKD2iux+82AlhMB3lrI7cxm+9XM+LWANbadTPjfmFmkkQTc76vIBBD
	77n2UKKcDy8JyLnYddeALWXUtrZOHfZgHH0lyIg12dDkbN5Msdfds0HoiwIiQYNTgz0p9RvAWSL
	ix6eMNfmjvK
X-Received: by 2002:a17:907:2da4:b0:c2e:4705:467c with SMTP id a640c23a62f3a-c31a9fa2040mr978925866b.10.1791812767239;
        Mon, 12 Oct 2026 06:46:07 -0700 (PDT)
Received: from [192.168.0.167] ([109.77.202.22])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9a38050sm470538266b.24.2026.10.12.06.46.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 06:46:06 -0700 (PDT)
Message-ID: <6f40cf25-1967-4a7a-9952-a0fba3bb5fe6@linaro.org>
Date: Mon, 12 Oct 2026 14:46:05 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] media: qcom: camss: csid: Match the current
 set_fmt pad op signature
To: Hitesh Patel <hitesh@ebytelogic.com>, linux-media@vger.kernel.org
Cc: gjorgji.rosikopulos@oss.qualcomm.com, bod@kernel.org, mchehab@kernel.org,
 vladimir.zapolskiy@linaro.org, loic.poulain@oss.qualcomm.com,
 dmitry.baryshkov@oss.qualcomm.com, atanas.filipov@oss.qualcomm.com,
 jigarkumar.zala@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, ravi@ebytelogic.com
References: <20261012120542.1140157-1-hitesh@ebytelogic.com>
 <20261012120542.1140157-2-hitesh@ebytelogic.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261012120542.1140157-2-hitesh@ebytelogic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/10/2026 13:05, Hitesh Patel wrote:
> v4l2_subdev_pad_ops::set_fmt gained a
> const struct v4l2_subdev_client_info * parameter, so
> csid_streams_set_format() no longer matches the op it is assigned to
> and the driver fails to build with -Werror=incompatible-pointer-types.
> 
> Signed-off-by: Hitesh Patel <hitesh@ebytelogic.com>
> ---
>   drivers/media/platform/qcom/camss/camss-csid.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
> index 2559ebe98..991275398 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid.c
> @@ -1696,6 +1696,7 @@ static int csid_streams_get_format(struct v4l2_subdev *sd,
>    * Return -EINVAL or zero on success
>    */
>   static int csid_streams_set_format(struct v4l2_subdev *sd,
> +				   const struct v4l2_subdev_client_info *ci,
>   				   struct v4l2_subdev_state *sd_state,
>   				   struct v4l2_subdev_format *fmt)
>   {

Please add an appropriate Fixes: tag and Cc: stable@vger.kernel.org

---
bod
