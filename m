Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 168A844C4F1
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 11:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785325137; cv=none; b=rRaYSP9yoRqJVs2bI6UvPcdTPqHg+3qhhAKeE6Z91WjVFwZO+fLG8YMw7ogL05jhD1fuY+PKzHVNPLgYTlKYGCGeor/CZfK9g36lxcaGnfJOvsLAD3sUiFnOjke/GKJ+3DxMk9FMyAeK80cFebcGwBb5s6H1VdAdRqfLyecjpG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785325137; c=relaxed/simple;
	bh=+bl7W/DghJ2lNo8ihHQByUSlt3smL+/7HO/f5BD68Hc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lu3QIEHzYAVVX02H5EgrfC3aQBe380rBWg54JQ2Yd+8AI7HQIRkBwxpyI7ds4EoLfbXP+GSPrLIXibm7PApDgXmA1Rz+y4UQr+64cEpvuyHO9dNSSseE4gcyyePBiAX3o8hRBTHvenPBR5Fd3io1+dH/HCMvpI9ZDRZvN2OrjNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nejlkA2+; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nejlkA2+"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-47db714766aso1184191f8f.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 04:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785325133; x=1785929933; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5iX3sEVovVYi3DpvUrl6PGylYfhOnizJPhWXlTW0MXY=;
        b=nejlkA2+NzyvGg8tmcTtdNPOQ6J5qEh5WK1TNnNPzsC59uemIEyg3wx/1Gt6LQqKkA
         XbDmwtSrZCz/ASbPdQVAGpH3nJS5kN6K201Vfuh7w1xBbjOOrtGLa1siIui6KVneDaRx
         GWzy4tZobZ8wg47hoEu7QXdAinREusNW1rNZI6oj6Sg4Pz3W9ZelMjdSOXU9pATnJHqP
         Yoml7SIRAX/y5jPEyxytHNrvxfCODisa1A1DARKRBDNlcJ4/SYhNsaooM7E/23Chbta2
         rj47ZtnFpDUUfZ4N5Yw3GtpQ5hUmYj9QhC5CoXEZU7nx2rvn3JiEEjOY5rfWOKWLf5ol
         UJXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785325133; x=1785929933;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5iX3sEVovVYi3DpvUrl6PGylYfhOnizJPhWXlTW0MXY=;
        b=IqEMk1rKuRVgwigrA/q2ixJpEqvhjpExYkAO1qCRXxkd4pLUG1CiNENfuNsYo0fL6h
         UIq01fKVpQiIPZwE+sWFZZRGRjnaLUyPeyg5yoxYCD1hrixvuI5S2s8kmDKMjwnPG2Y5
         OWGHTVxoUXUrsEEz4XWNidxOmC1lGV8iszSeK6jhoUMtEBKKncxP/l2ra9Ofo+Ldfu5+
         FP8Etd3zwzsrjFytz9TGl7oTOdE9XBu4XtQz8GcckoK3kjVQUylygcg1OAk0bNMacBWN
         LBjtb5h5Xu9Q1WTgVLg7q3HAfm0/p5C5PXYvnqucOOYS3opf3cQCZ0Vkv/2vhrsGwnVq
         RT9g==
X-Forwarded-Encrypted: i=1; AHgh+RpA5vD7q7tGv8CA749OnRSaz+wCxWe9C395ynj6vowATNeyJXKthL9HOwnoFY2E3qacIyoBPHA8y5z8toPX@vger.kernel.org
X-Gm-Message-State: AOJu0YwqmEpyFeZTWigDO3AsI18dnUPSFMi/c7f5+ZpsndBET36cGezb
	AyHwipsKC570Oy/dAcDwlvOgIKyUeY3kD2iCAILry7WSOWSpoXpF27VSJl+qibRfFI4=
X-Gm-Gg: AR+sD13XpJVJo+v+DTJOcQTvPPPFJE+ceJiuU8kbhFtqvkoHtweAju1lfI3/Gty805l
	w9fUgm2mDKrv4bJrefF+nABGPLvROdoDQUwdKltchj/48QS8056K3bUXqUtlmSOHM39HwmKi0i8
	1PVQ1zilaSQDaqf6RGVHGeuZxnbuTU2fAqQUL7UqmCAeHdDOQw27W82pHFMdkWNGXeNBzbRNXTs
	JEKraK0Phpt4ISI/71M99iuERbK0/nTuWFp7XoiLoVsVoAujGReCQFy65sZHX5MupdPYVCZqwBa
	JUsXuRZqeupDOIau5JITxG24KuPwGK2M/2KKA4dUHJeVhwULlHaiQi4wy0zoGq24yYJlALt/sut
	XyPdAXWpVI18GH2E0AthqNmOH0CUvuTSTKyUL4DWA/G7Hktd+YiP2bmDuI3Mqgpgujm6XVEAx0l
	V28SZ5RLIrlLDGUOQKAVUvQDYc0mIBcRq/+RLpWc6Nzmefyq1Ofm4hcGKs28E8sTiDzTSzf/0=
X-Received: by 2002:a05:6000:2c05:b0:47f:9763:9864 with SMTP id ffacd0b85a97d-47fbabee850mr2432854f8f.19.1785325133163;
        Wed, 29 Jul 2026 04:38:53 -0700 (PDT)
Received: from [192.168.0.101] ([109.77.24.32])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fb6b0f039sm7702125f8f.18.2026.07.29.04.38.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 04:38:52 -0700 (PDT)
Message-ID: <f77aab11-0e1b-4962-9d53-0bb2fcd6486a@linaro.org>
Date: Wed, 29 Jul 2026 12:38:50 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] media: qcom: camss: use
 fwnode_graph_for_each_endpoint_scoped() to simplify code
To: Frank.Li@oss.nxp.com, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Dafna Hirschfeld <dafna@fastmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Heiko Stuebner <heiko@sntech.de>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: driver-core@lists.linux.dev, linux-acpi@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, imx@lists.linux.dev,
 Guoniu Zhou <guoniu.zhou@nxp.com>, Frank Li <Frank.Li@nxp.com>,
 Guoniu Zhou <guoniu.zhou@oss.nxp.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
References: <20260625-fw_scoped-v3-0-ffd0868e498d@nxp.com>
 <20260625-fw_scoped-v3-4-ffd0868e498d@nxp.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260625-fw_scoped-v3-4-ffd0868e498d@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/06/2026 15:17, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> Use fwnode_graph_for_each_endpoint_scoped() to simplify code.
> 
> No functional changes.
> 
> Reviewed-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
> Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change in v2
> - fix typo simplify
> - collect andy, gouniou and loic's review tags
> ---
>   drivers/media/platform/qcom/camss/camss.c | 17 +++++------------
>   1 file changed, 5 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 2123f6388e3d7..23f3cc30a15a5 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -4793,30 +4793,23 @@ static int camss_parse_endpoint_node(struct device *dev,
>   static int camss_parse_ports(struct camss *camss)
>   {
>   	struct device *dev = camss->dev;
> -	struct fwnode_handle *fwnode = dev_fwnode(dev), *ep;
> +	struct fwnode_handle *fwnode = dev_fwnode(dev);
>   	int ret;
>   
> -	fwnode_graph_for_each_endpoint(fwnode, ep) {
> +	fwnode_graph_for_each_endpoint_scoped(fwnode, ep) {
>   		struct camss_async_subdev *csd;
>   
>   		csd = v4l2_async_nf_add_fwnode_remote(&camss->notifier, ep,
>   						      typeof(*csd));
> -		if (IS_ERR(csd)) {
> -			ret = PTR_ERR(csd);
> -			goto err_cleanup;
> -		}
> +		if (IS_ERR(csd))
> +			return PTR_ERR(csd);
>   
>   		ret = camss_parse_endpoint_node(dev, ep, csd);
>   		if (ret < 0)
> -			goto err_cleanup;
> +			return ret;
>   	}
>   
>   	return 0;
> -
> -err_cleanup:
> -	fwnode_handle_put(ep);
> -
> -	return ret;
>   }
>   
>   /*
> 
Acked-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
