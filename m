Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792791144;
	b=txR44AmaZ5roDpObIjb6c3grxhBvtprafr3elaL0DDcUMiFvvQm2f77QtPJSaXdyPD+D
	 bhon1AHGXPMoRGWs1oBACxLv5C8v8Btc2tTVgA3W8fjq/VJutIq9lO4/TqXXagnbzkXyd
	 V1Aj8zwHC/U/OsmOjI9sSuw0KC2u4vNJDW5LIGCro9X/cewL60+4H43Ce3JrER7Xmu9oF
	 hceiC+QTK3+0ifvN6swZ4K2nGJhZdaiPnZYZuNsYkoq0TKhTjz2xaqj45Va6RqZSiZ26y
	 aJD0lHxt9G9oL7VPOjQmIa7fkE5+2c8rsoeaojLzG5nkiIuNZ3H2jxkgzb+J46AAFyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792791144;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=MCxa46aslGGuaUGVmz9JnA/umfWZT7rJVYao++z36o4=;
	b=B2n1bCjicdMzGkuzbgWLYKMfRzf5Va8d2oM95oeNoVyuTFLO9KzkQ0AW07VKI/RUiOkV
	 UrwgA6FNPR34Vciy2IqFTDkbyBmt6iNCNPn4DMBhQWYuztIx+BbHEgG2BbchkydjFfgBC
	 2JCI2ED6SI8qa70lKon+A3CARjpaGXecxH1tYoKiNzYGw5sTn7k3BLVWgMDg0tbAl+66a
	 hDMIrK0pYlwUVh/mY353lPIX3cYAjcPg24TIbCOdj8vVsozvvEgQhVBC12y3BD/Eqc45Y
	 rFaBybzu00UxbUOc3qJmWcr14WdoeRmq1nnyMBbDEiuZzzjr2YmcjInkNsoQl5WraYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="gW/lVNEr";
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBCBD606A31B
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 21:32:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CBCBD606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=gW/lVNEr
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49d05d51553so9287845e9.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 14:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792791142; x=1793395942; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MCxa46aslGGuaUGVmz9JnA/umfWZT7rJVYao++z36o4=;
        b=gW/lVNErkWubXa1IK5n1Pca6MEI56259qgdOLKwzMCmA0zMYTMRis6aNpLK216moqD
         gPVhyYHf70MniXrc1ts0otBaqIRS7oXxy6ab1m2qDUNct93aiU98mzTTyzrsRbCsvXZd
         W4aMyl9fw1PxNNM6zy1NmVPdWEN4nhQ33mrNH4N+fG4rOv1smC6MLPpH9EtsJDzCd2Rc
         Tq2Pyxrhi/fVsYre0eT0cgKZfCtcNZSwvB9e9p09Twh537oAJNc40e4ZO7f0QHmvyhsk
         c3RtQXjbIgerz+NOlIH3c7JSNpRlbRNjfQJcLC2oQPjJ9JhUEYMpFqlZ/xqC+mcyDKke
         huFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792791142; x=1793395942;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MCxa46aslGGuaUGVmz9JnA/umfWZT7rJVYao++z36o4=;
        b=K27ITGcrXdyhF9SmYoiid+lgvvF0S/ddVqG97AW8gV2/ENv0i4kYqaunquDCO7wTIj
         RdzbURyqyuJn8xlBlYUGfp3zUshWuQHSMf700Kne3xoZzSq8XEBXEphWNLCJzEnaKct+
         u/8H1VT35fKOiAqdE1cal66WxyjSDoGWE3Xo+tfGPFp9PNsXLNOhpfaQK3l8jWweQIqE
         R6VUqNxJiwxoJdF4I+3qm9aVxAJ3d2c4DycRO1q2nB1kMGVD2Fqvd+Db5VCdrru269ym
         44kT3nmiecGUU9x7GDAp748oS1gZInyM1CBe41PXbdea4Qyny2oXyLs4w6XVBaTVt/F7
         ckQA==
X-Forwarded-Encrypted: i=1; AKwUvByzJIlR5V5yvboypbIfieeNzuISYq8GdJ3t88/2IlNIO7HiZPat0ybRIx8gRDN380QOVpYaQ/q73H7Xc4P6@vger.kernel.org
X-Gm-Message-State: AFq9FYKf+Kh34i0VqZEv4ctg2qEx4rjzqEqT6/bHSKOEo686ccciRmks
	23BywjM7cHYN5zVgM4oTbiw/wQrW7SxCWi8EFiqh4G0u9FkFQ4nWLGABR3cP/4lUVkk=
X-Gm-Gg: AYBFou2d1dbY4+9qu1p/rQZ1n2VUL0fs30G6JiDVLkGZQAgPED+n6uy0K7rgNMHdUDq
	cVGLAM3Pd61j2NNNmoBRjeVRVaFzskSFO1Fs4MbBUE3o1jrE3JA9qkdRPHBXOrdlj9cArGLvOH/
	gop5/1XSiM1hPfhoCptsgB2KRUG+RAHj771cqduPHx/ZieBn2jfca+x6QTQzPirYxarNPuDp7jh
	QCSL4xhH2i0HKFcTlek3i61x3Hsn25U/3H9tBynNlafyynUTQ4+LnNITAyAlNznlq4yP9BISoAW
	vGnpZOd068toks59xZpDUmCoT9BeyveSq4wnG+h50QcHRPYxW5xUuX7b5GwA/HBTTQvMaimNOuT
	4aL8BzNd4JSsGYstoeSM9qmVB/8PEtLHkwtNOVLZ0ctJIdxV//yZk7C9nQEvR6WH+L4vcFxb6Lp
	CJ5/8m6Sh1b5H1SMpYnOZoj7AnHalU0uX4uZ9BG8ORoZx+iBU2xSo0qfffX+kfBKoKsTfwZXeQ2
	ffutorBuccir2JmCWsWHfnur1GiegiRcpq4d/ZYLMPIUJ8CF5psLvNpgCoUukmOA48N
X-Received: by 2002:a05:600c:530e:b0:4a1:811c:8078 with SMTP id 5b1f17b1804b1-4a35acbee85mr2035185e9.26.1792791142061;
        Fri, 23 Oct 2026 14:32:22 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.107.26])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a58a0e2sm10678435e9.13.2026.10.23.14.32.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 14:32:21 -0700 (PDT)
Message-ID: <d9b8fbc8-c8f5-4c3c-aa5e-20e1e311a543@linaro.org>
Date: Fri, 23 Oct 2026 22:32:15 +0100
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] media: qcom: camss: sm8250: do not set VFE core clock
 rates from CSID
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261023152857.2859767-1-atanas.filipov@oss.qualcomm.com>
 <20261023152857.2859767-3-atanas.filipov@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261023152857.2859767-3-atanas.filipov@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23/10/2026 16:28, Atanas Filipov wrote:
> The SM8250 CSID resources list clock levels for the VFE core clocks and
> for the shared VFE Lite core clock. CSID power on runs after the VFE is
> powered on and sets these clocks to their lowest level, overriding the
> rate selected by the VFE from the pixel rate and lowering the shared
> VFE Lite clock under a running VFE Lite.
> 
> The VFE core clocks are set by the VFE. Drop their levels from the CSID
> resources so that CSID only enables them.
> 
> Signed-off-by: Atanas Filipov<atanas.filipov@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/camss/camss.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index c54185c93a8a..7fe12049b78a 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -2052,7 +2052,7 @@ static const struct camss_subdev_resources csid_res_8250[] = {
>   		.clock = { "vfe0_csid", "vfe0_cphy_rx", "vfe0", "vfe0_areg", "vfe0_ahb" },
>   		.clock_rate = { { 400000000 },
>   				{ 400000000 },
> -				{ 350000000, 475000000, 576000000, 720000000 },
> +				{ 0 },
>   				{ 100000000, 200000000, 300000000, 400000000 },
>   				{ 0 } },

This sounds like it needs a Fixes: tag

---
bod
