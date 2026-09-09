Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D69775581FC
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Sep 2026 14:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788965111; cv=none; b=KT6CEOboOsWOzoNHjJUngMS6DgP4X0fFvv7YyjKKTIwrUgMiXA52xdPBuw1L2FfZja9/oDWLBEGNkut3GjjgDOYxg6UZa+f4SsnGVdpMhZ10vL9wubd6BcHBSS7oZLTPKzlafxi/2O5dNyWJbfoCHxElHD3wMqbu6K37tkJGcXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788965111; c=relaxed/simple;
	bh=lngbaFIw7df51hzvDfpcwYG1fGj9Oc7zBuT183aLNVA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GiL2mNDIEJbakY7bMy47+55J8Qq3RgRhFPEA/L9CPgkg5napSU3YVd0UlJjF7ZBKQNaDgyAVGStDgLoQGVZAavCB8bwbElrkI+mr+cAUEC+0nRhbKAShiU/BsBF6vuFCU5FIJARjmBNOYKJIDNyR28Os3NH+gJIZMzbZBeDyJKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N0CSpgVr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=InpgR9SF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N0CSpgVr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="InpgR9SF"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BU4QD1723123
	for <linux-arm-msm@vger.kernel.org>; Wed, 9 Sep 2026 14:45:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0ZRG+xpPfqS2+swMicsmkK+9
	EkUi9QaTQm3JgCuQh98=; b=N0CSpgVrul6qu8O5h0DXcRK0MEH1V+IUCww2U/zL
	35KIUHJjCUFhLahoFQE3ho77HM0dcktjLjkR6vjmvaCjhcc0d5kofsFX6eplxTku
	K4hTzoqXoRFEAM3UZbtl9O0yYcVyJH3HG03r9S1HCnh6N0WWVei5vl+2VlAq0IpG
	WbgeuJIiSVD2JlRyzrwoTc4WvSSt0WIBR1OC8P6qGrJ2s5y9iiC3UfmKck8vWWtt
	1e8RfuEYHizlXataJyPJXmnuiWsBndc/pngfxIb+Ms0pNQpvhDB7hhFkAWikoYPm
	VVjv/Yt+QzCDfgdEjH+osItM8EyPqZNAkt2+1lmR5LUOeQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk5cns50t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 14:45:08 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc132709c76so8182040a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 07:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788965108; x=1789569908; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0ZRG+xpPfqS2+swMicsmkK+9EkUi9QaTQm3JgCuQh98=;
        b=InpgR9SFUBmz4qGcdsZ58aK8zKOvF4lBNbOxweNgHONQoj+dxEs1zms1qriuZJdRxh
         1Iq9oYQUw6sZ8IAO+F2QbxF8QArx7watk31oJrgxcU/kyKS2xGMjt/9rXejEofRzH3y/
         vHut7CK4RkGEJDP0zCDaEBuVPV/mnWkJ+tUbVnH7Z318PCkgfqneHCBCUtky2BVb8nzB
         1y4Py2Yr+WScJAnczlQG2jzcyPByQZYFdwMYVTpVVzRKjs0BCeLzzccSBqn4OAlTSk00
         qCWJFG+FXfVT3xhznrJRPt6khL8JvHNa2oHJRWZMivaczfJVxYvsiyC76zM1vEX0BXJw
         b25A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788965108; x=1789569908;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0ZRG+xpPfqS2+swMicsmkK+9EkUi9QaTQm3JgCuQh98=;
        b=aLOgCepOFyaV/BGTztaKlYUtR6X4WvRV2e5QKZAm9FIVdj0W8Za/tEj+XuDHj0+B+b
         BGfv4QqJNFke3FcwpBP+QLzVJNx0ZsFjqhNInAYuM9oNXv39+L2V7d6iY4NfQbOSxPz7
         OSKvIRCqK80drbuFohMNfRG5mxSj41+MJQFlHfQOHzM3lFYsX/dVLIk9maxD33RuBBkC
         SpYRYUQh0dKF0B2jGwOTNOcbOAxW1BquXN4M9MveM2ZJlZ8YinlVYNas+PNecmc2UJZJ
         lzphlgncjgZQweHFEWdKIsUYJnB8/AgTcOcQKvlcQNVYG1N8/mt3qFlxOLWUYbrE0yZ1
         cUvA==
X-Forwarded-Encrypted: i=1; AKwUvBxWJMs28K8J1FY3Q/ZF5qFo9IGNi61P4xNtNO3NpELOsPUuUXsdRQTmjjWm1WAZfDsIZa42crRAIQa52OZ4@vger.kernel.org
X-Gm-Message-State: AFuF++ml44ie9AW/ASFDD+Ir1kjA7t4zObzlEYa8vE/Yh8ch9rT5FXoG
	hH/q5IiF+vIpzLkIe/6r3PeLUKgJC49Gb9zLOVAH/OoWn+1P1VOmpJzg5dfKa0hQgFYllxk3gk3
	pDhRy9uQ+BZmtVTz/mgnuH+2qO4moB0OxoimYqgrz/1J8sh/eW2bJ+QP3bWT+Klpij6yV
X-Gm-Gg: AYBFou2ZX/dv5EJN5FGAbjQxAvQT0b16uXMmD7hoSufR62/5B21Z2B5CS8ULZ2cGLjJ
	uqQ7iVmUFA0g0IjGWejKMa0JDw9Rknm6O93PTKKtnI6oA+BBLAOIOJS+//Mq1KNxYuxHHs/x7t7
	wrTJV+1Rz4qSPFGayd+B2z6u13/t4kNdOj80BW192twFKGTauHkTryIri2ZZ5tl7yEPUemHrN3+
	JOeB5y8oJvMQya72+SUAiTfs3KSvyQa60tPGjxjpH3rYnjImZpm6gtiTbpzuyxs22kDcyjxm1K8
	qHZOU8hTVmR64yExPTF6db26t8lFYNbsjVUGlF8HgDpaVh/TmZLWmYA6H8Fk3aX3QZRVUlOcEeF
	5+Ozu5K6mdzxL8inDK7NFiraC4Ho5ltGnErwLtZfAWl0=
X-Received: by 2002:a17:902:ebc7:b0:2d7:f0:896b with SMTP id d9443c01a7336-2dd0797ada3mr22680325ad.13.1788965107537;
        Wed, 09 Sep 2026 07:45:07 -0700 (PDT)
X-Received: by 2002:a17:902:ebc7:b0:2d7:f0:896b with SMTP id d9443c01a7336-2dd0797ada3mr22679445ad.13.1788965106910;
        Wed, 09 Sep 2026 07:45:06 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db149cc85dsm75711565ad.74.2026.09.09.07.45.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 07:45:06 -0700 (PDT)
Date: Wed, 9 Sep 2026 22:44:57 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
        Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
        Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v1 1/5] ASoC: codec: adau1977-i2c: Add OF device match
 table
Message-ID: <aqFw6RNBZrkiAg-y@QCOM-aGQu4IUr3Y>
References: <20260907-nord-asoc-driver-support-v1-0-997d3b20cf43@oss.qualcomm.com>
 <20260907-nord-asoc-driver-support-v1-1-997d3b20cf43@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907-nord-asoc-driver-support-v1-1-997d3b20cf43@oss.qualcomm.com>
X-Proofpoint-GUID: AgOFQLLp7xsvRnC38WecMk8f6uFE7yNM
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE2NCBTYWx0ZWRfX6VAkidrS5uW8
 cuYvPA31YRk70IJRm9trZbUpelUR9CW+67Hf/TfdwsWvFPcy5pNcks2DQdM6eZF7CjrbkWvNQHi
 oUtqDHASqKxXFQeqwcIVaECx/jGLb/o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE2NCBTYWx0ZWRfXwBK0A+8Hyc0Q
 JUXD8C9TEJemqm8MzOW7Rle9gUpo5ix/Kae5kAWJNdqWUCv6QVyNQBgEtuRoq7i1gVQI14Mks6B
 Mh/yfv3nwcML8UcKmXSTK8C3cto13gE+1hl/DWT5UoajZCp6GQDBRHL76pDPwTL/wSE3c/Uh51n
 cC2bccv2lU3MjvkPXlukFEweCFohVd1f3DWxgSmsMKQE5dRwzVdEm4pRASqRTJD1h3k0Oxz9nds
 nCiTGRHx5oPPK5jyTviVTVhtr6nHZeZTsRmjmJHRNPSg2jWXhyDEKo6AUJ3u+vMg61gpQ/OCdFu
 +uu/BpgEvas8MiLld+4tln2eq3JOwfJpVnvSJ8FJ8wD4inMJbFYgsZ6wbSSD7cK++89KKt0czDa
 mHc15MuVy7d3zHMcSV+VQnxPuDfdI0zPVCmiCbND8gQG7dgjz8CVhWPlT3vk3LAvr0jHmMtxoY0
 8L7HwvidHqw81Z8V8Vw==
X-Authority-Analysis: v=2.4 cv=S+jpBosP c=1 sm=1 tr=0 ts=6aa170f4 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=1coeNckUEot7TYRSRIgA:9 a=CjuIK1q_8ugA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: AgOFQLLp7xsvRnC38WecMk8f6uFE7yNM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090164

On Mon, Sep 07, 2026 at 11:39:42PM +0530, Mohammad Rafi Shaik wrote:
> The ADAU1977 I2C driver lacks an OF device match table, preventing
> it from binding to codec instances described via Device Tree. Systems
> using compatible strings such as "adi,adau1977", "adi,adau1978", or
> "adi,adau1979" fail to probe the driver as a result.

This justification isn't accurate -- DT instances do bind today. The I2C
core matches DT clients by stripping the vendor prefix from the first
compatible and comparing the result against the driver's id_table:

  of_i2c_get_board_info()          drivers/i2c/i2c-core-of.c
    of_alias_from_compatible()  ->  client->name = "adau1979"
  i2c_device_match()               drivers/i2c/i2c-core-base.c
    i2c_match_id(driver->id_table, client)  -> matches

So "adi,adau1979" already probes without this patch, and the patch as
written doesn't fix a probe failure.

What it does fix -- and what I think the changelog should say -- is
module autoloading. For any client with an of_node, the bus emits the
OF modalias, not the I2C one:

  static int i2c_device_uevent(...)
  {
          rc = of_device_uevent_modalias(dev, env);
          if (rc != -ENODEV)
                  return rc;
          ...
          return add_uevent_var(env, "MODALIAS=%s%s", I2C_MODULE_PREFIX,
                                client->name);
  }

The kernel therefore advertises "of:N...Cadi,adau1979", which no module
claims without MODULE_DEVICE_TABLE(of, ...). With SND_SOC_ADAU1977_I2C=m
the codec module never gets loaded and the card stays in -EPROBE_DEFER
with nothing in the log pointing at the cause.

> 
> Add a descriptive prompt string for SND_SOC_ADAU1977_I2C/SPI so
> the driver is visible and selectable when running menuconfig.

This should probably be a separate change?

> 
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---
>  sound/soc/codecs/Kconfig        | 4 ++--
>  sound/soc/codecs/adau1977-i2c.c | 9 +++++++++
>  2 files changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
> index d3730c4da51b..6f481a54313f 100644
> --- a/sound/soc/codecs/Kconfig
> +++ b/sound/soc/codecs/Kconfig
> @@ -526,13 +526,13 @@ config SND_SOC_ADAU1977
>  	tristate
>  
>  config SND_SOC_ADAU1977_SPI
> -	tristate
> +	tristate "Analog Devices ADAU1977 CODEC - SPI"
>  	depends on SPI_MASTER
>  	select SND_SOC_ADAU1977
>  	select REGMAP_SPI
>  
>  config SND_SOC_ADAU1977_I2C
> -	tristate
> +	tristate "Analog Devices ADAU1977 CODEC - I2C"
>  	depends on I2C
>  	select SND_SOC_ADAU1977
>  	select REGMAP_I2C
> diff --git a/sound/soc/codecs/adau1977-i2c.c b/sound/soc/codecs/adau1977-i2c.c
> index d1c6c4ddf506..9f54fa8375b1 100644
> --- a/sound/soc/codecs/adau1977-i2c.c
> +++ b/sound/soc/codecs/adau1977-i2c.c
> @@ -34,9 +34,18 @@ static const struct i2c_device_id adau1977_i2c_ids[] = {
>  };
>  MODULE_DEVICE_TABLE(i2c, adau1977_i2c_ids);
>  
> +static const struct of_device_id adau1977_i2c_of_match[] __maybe_unused = {
> +	{ .compatible = "adi,adau1977" },
> +	{ .compatible = "adi,adau1978" },
> +	{ .compatible = "adi,adau1979" },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(of, adau1977_i2c_of_match);

Worth noting for whoever touches this next: the variant is still resolved
via i2c_get_match_data()'s fallback to id_table, since ADAU1977 == 0
can't be expressed through .data. That's fine as-is, but it means
adau1977_i2c_ids[] is now load-bearing in a way that isn't obvious --
removing it as "redundant" would silently make every compatible probe as
ADAU1977.

> +
>  static struct i2c_driver adau1977_i2c_driver = {
>  	.driver = {
>  		.name = "adau1977",
> +		.of_match_table = of_match_ptr(adau1977_i2c_of_match),

Drop of_match_ptr() and the __maybe_unused. Upstream has been removing
of_match_ptr() from drivers for years.

Shawn

>  	},
>  	.probe = adau1977_i2c_probe,
>  	.id_table = adau1977_i2c_ids,
> 
> -- 
> 2.34.1
> 
> 
