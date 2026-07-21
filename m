Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5158415F27
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 18:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784656902; cv=none; b=CFz7VWAaJsJ7D0JbPLM/ddyVDHPD22sIK2EFJop5smFWkfMaq87ZYHmr2Qnp+PY25uNojoweJXoJOOhQHLc6OQSAH7JuoYmQ0ZD6TiUQVC8PBVigA4cjNR+3iZK95UcpAi4sdlNLEYNHU7r8bWrDrOYLOVuMAJo5JJscpAOAD94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784656902; c=relaxed/simple;
	bh=aqq0bZT/hXwWx8UmLFddb1dgw0fuBz0WtdUMce/GDRc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o4NISxeLqQ5U4A464fwamOwBIjmm/M/l6Z8a079h0gyh1YHnQ7iFlnGAVD5rKVlBz//BbukWXJN3B8pP/g2KQSkjhInE1wFv4CoGnYV/ungqvzn5rtqu0f92LJSFcjWXEn0LyfoRIYH7yELnDWzDIlghhjqSHlWdyL/Xv2pl7io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mLQXOczG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PS5qXv9h; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mLQXOczG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PS5qXv9h"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LHRA3c2376074
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 18:01:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/6k5png2EebTSIaZVxRWm8CM
	pbRPFtbdYVyNuYkr3Bc=; b=mLQXOczGSWLql6CaoiBRiSt2MSd/PEkDyEOCPiO9
	Qi2BBfj7JoMKyL6h7LFo2V3JMxJQTywe2i1oTTKpzKC9q3Hz0Njq4d7bboprE6CC
	iWSW2bW74uDvso864zQ938lON6ywA1pYuTMVm+IFAkpOCmlACRB9zQr5GOBmYv5x
	ZHwK8NP5yC53S4a5Rh3FROK/zOlBOd+7aG9uvZUGdN5id6Fg2J4uf/UObCKn02uS
	MYcrAKzMTPI6qrUhjWk8Bzwd/Hv+HHbJZS93p75EG9f9+0fwl5H7ytjhh55AXjQU
	M1MKKRM4Pa+Bf38JL7Z/TsQk/dh9Z5EsdNXwda7M7jaDyQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjd6a85nh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 18:01:39 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cc640dfde3so95506385ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 11:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784656898; x=1785261698; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/6k5png2EebTSIaZVxRWm8CMpbRPFtbdYVyNuYkr3Bc=;
        b=PS5qXv9hMkOFX4L30BIpQz8bjeLdJYIO0IgV4YchIxiMxKBIlX5ZtHmMZi2jv95cz/
         9Kn8whWr7BRMV/yjsiT1VqocUBhfg/htviIKhLUWrIeP6SllMhGoHKX/A6PKZoRlb1XF
         OV1O6Afdh7a6pgMah821zYYf463Uf3wAkYVLrxK4g97aDCCaAElHyNHSiLUzMP6o6rO4
         6MtZMiW1WyZgB8qFny3mUwhCeVAHEJK0A6iVgNIiy1YADDgZOi3fYjN4aPFZTWqoeEDP
         +aqXSs5bLCfTHMUta2v5iQryIHqJG/tCF5gDkVkAbvcugmBzKikwBjVgy60y1VCXc1XK
         QKXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784656898; x=1785261698;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/6k5png2EebTSIaZVxRWm8CMpbRPFtbdYVyNuYkr3Bc=;
        b=pFFBfcyX8vT9eA2W/Yw5wPV0zA30CdYryT7Cf0tMsfEfWIvyvTIQZdd9wNImjpL8vT
         vyOjQvH84stzkXtXFAMJWrGCPoH2NT/Hdi9Dwtl1Rb05haqNMoyM6O5QT9WWo/hZelNS
         cp9WxgDncQv7lRRmjw8MXmjhDmIiCv8/McZpEOU7bl5g1W2rgVaeUjPvdtNtECSH4LPJ
         1PhC76Sqtm0XTkjtnLGwppwHAnUDOXlJ6EloaWyYq9VIQ7/rWZMh5ViD2W/Bt2I+4Xf1
         SLZZEw07A78m/4W1Q9kk0ZbnOHf8haXBCuz4Jmkb47XCoYkoDWVb9cDzbuhZWrtAPtpA
         at/Q==
X-Forwarded-Encrypted: i=1; AHgh+RrXcn2rP8/VYygeSXadtAZdn8lCC8xBn9mrNo/Vbuxga8jkq/TCAs/98r5mdqO+2Ymvckf78B/XlwM/K/wq@vger.kernel.org
X-Gm-Message-State: AOJu0YxuizMyUXWRr3JyYNHez6r4N7nXFtPPmks+YDpfe0sk4Ii1AnJa
	qCLZxJiYL/aNK9h0DQEvx8qzgRNbyExWLxC6SSOnvzOVyLFA8FzgnGW0V6Smn40YhbOMZx4D/Kn
	hdwfRDf80J16Djx4JB9FJWd4PnNHxTWJahrfVQKiw0dqK5on997lIBm+wYsZ60fAtJBZV
X-Gm-Gg: AR+sD104rvuPqC00Lk1HCDbAzJl9zfYEPDj6ddMMp/ITRnwbohwkEivPEed5Z70VL1V
	JmDZqUHkIUoQmVp5YJaTdTmmEaqVyM3c3xQ4EefFTiRLOnWOb5/NgoVSMHB6ZqQcCuWJAEBEroU
	7uN6GR+VKCL0qbEOjHZNuY9+6320LTdfdxVeDcWQcpY4xwFBXMo9+yqRc++mepvyG41BgQDX2Wc
	miPywWN5yIod+vZ/KXrMrXUxcFgcvIytLJN1oFA8sOAmy4stp0oi7Hk7k6DbjYjReNOHhBDyiDX
	mzg+SICE6qzplWluwvyTH07EBz2f41WdzLWTCkhjPAijydOVtuaVX6V8VGfW/44focTqAAqmT/+
	tmO87FlEBaKxJvmefrgBs8hqglzpHtyyY8g==
X-Received: by 2002:a17:903:15cf:b0:2ca:be8:62d with SMTP id d9443c01a7336-2cf349b5923mr205347305ad.32.1784656897475;
        Tue, 21 Jul 2026 11:01:37 -0700 (PDT)
X-Received: by 2002:a17:903:15cf:b0:2ca:be8:62d with SMTP id d9443c01a7336-2cf349b5923mr205346725ad.32.1784656896901;
        Tue, 21 Jul 2026 11:01:36 -0700 (PDT)
Received: from hu-pkondeti-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147dc61637sm1021861eec.8.2026.07.21.11.01.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 11:01:35 -0700 (PDT)
Date: Tue, 21 Jul 2026 23:30:59 +0530
From: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: Sebastian Reichel <sre@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Andy Yan <andy.yan@rock-chips.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        mfd@lists.linux.dev, Srinivas Kandagatla <srini@kernel.org>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v23 01/13] power: reset: reboot-mode: Remove devres based
 allocations
Message-ID: <ac030bd2-6b14-4b55-b277-422514da5f32@quicinc.com>
References: <20260714-arm-psci-system_reset2-vendor-reboots-v23-0-e7453c548c21@oss.qualcomm.com>
 <20260714-arm-psci-system_reset2-vendor-reboots-v23-1-e7453c548c21@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714-arm-psci-system_reset2-vendor-reboots-v23-1-e7453c548c21@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE5MCBTYWx0ZWRfX+UwsVgjg2VcW
 9/xtHQP+aed5cXbvYNo2FoEavmyRdnV6s12EwmkbyPXpgmdOb/K+JhEHES3XIHV519P/nODIYre
 DetYFvYdX3mk2WsR9pap8WoJCi4+i9CDEpturTFP4Fzcd4FjA13P8lscaWB4lwh5o/WA8QJUvWQ
 AOm1U5Xt//LRfJjcMQWk91vD1uDxv34tIM25QxhZ6qXXhzgAQhnZIzwF+viZelp2Pa1Oy+Iw/D+
 BCOqTmTL8TTKb8aMM9Y61EZy13EqHlLzg4+Ig3Nm1lT1RGR2ZzsXG8ZjBMp3VpSPjfCuEZR/Isw
 0rvFcT6vIQDD8X2of/AXjAqVrY4aDkePXKe/CeAEwlVoPaFXmsO2oQfu0N78TKE7XofYlsMAd5e
 8jc7UotpO9koBmVonMoqED+OprHWkhJkJviUtMHQRGwb+RHb+iuR8tfN7f6GvoEI3vVw7PIE0Wp
 xF3Jn1THe62bO7f9M0w==
X-Proofpoint-GUID: ADFgEwZz_5rQ-Spuzh_kU-xjpLe6ATTJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE5MCBTYWx0ZWRfX0FNXnbOv5gsV
 4L+E3lL/wzCFONi6fLA42RmYq7M5aE2mI+NPBlhpyCARCkHgFsylV0nJWb6N8PNLDVzKyDhw0AS
 9+3HBD+h/UrIaEu8GlNda9eH0CqCBTk=
X-Authority-Analysis: v=2.4 cv=HvJG3UTS c=1 sm=1 tr=0 ts=6a5fb403 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8 a=GxRVn01Nmxo37F9Fo38A:9 a=CjuIK1q_8ugA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-ORIG-GUID: ADFgEwZz_5rQ-Spuzh_kU-xjpLe6ATTJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1011
 adultscore=0 priorityscore=1501 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210190

On Tue, Jul 14, 2026 at 10:46:29PM +0530, Shivendra Pratap wrote:
> Devres APIs are intended for use in drivers, where the managed lifetime
> of resources is tied directly to the driver attach/detach cycle. In
> shared subsystem code, there is no guarantee that the subsystem
> functions will only be called after a driver has been attached, nor that

You mentioned driver may not be attached.

reboot_mode_register()->reboot_mode_create_device() is using
`reboot->dev->driver->name` directly for creating the reboot class
device? 

> they will not be referenced after the managed resources have been
> released during driver detach.
> 
> To ensure correct lifetime handling, avoid using devres-based
> allocations in the reboot-mode and explicitly handle allocation and
> cleanup of resources.
> 
> Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> ---
>  drivers/power/reset/reboot-mode.c | 32 ++++++++++++++++++++------------
>  1 file changed, 20 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/power/reset/reboot-mode.c b/drivers/power/reset/reboot-mode.c
> index d20e44db0532..7a74f72a8313 100644
> --- a/drivers/power/reset/reboot-mode.c
> +++ b/drivers/power/reset/reboot-mode.c
> @@ -3,6 +3,8 @@
>   * Copyright (c) 2016, Fuzhou Rockchip Electronics Co., Ltd
>   */
>  
> +#define pr_fmt(fmt)	"reboot-mode: " fmt
> +
>  #include <linux/device.h>
>  #include <linux/err.h>
>  #include <linux/init.h>
> @@ -10,6 +12,7 @@
>  #include <linux/list.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> +#include <linux/property.h>
>  #include <linux/reboot.h>
>  #include <linux/reboot-mode.h>
>  #include <linux/slab.h>
> @@ -168,10 +171,11 @@ static int reboot_mode_create_device(struct reboot_mode_driver *reboot)
>   */
>  int reboot_mode_register(struct reboot_mode_driver *reboot)
>  {
> -	struct mode_info *info;
> +	struct mode_info *info = NULL;
>  	struct property *prop;
>  	struct device_node *np = reboot->dev->of_node;
>  	size_t len = strlen(PREFIX);
> +	u32 magic;
>  	int ret;
>  
>  	INIT_LIST_HEAD(&reboot->head);
> @@ -180,19 +184,18 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
>  		if (strncmp(prop->name, PREFIX, len))
>  			continue;
>  
> -		info = devm_kzalloc(reboot->dev, sizeof(*info), GFP_KERNEL);
> +		if (device_property_read_u32(reboot->dev, prop->name, &magic)) {
> +			pr_debug("reboot mode %s without magic number\n", prop->name);

Any reason for converting dev_xxx to pr_xxx here and below?

> +			continue;
> +		}
> +
> +		info = kzalloc(sizeof(*info), GFP_KERNEL);

The recent commits to this driver adopted kzalloc_obj().

Thanks,
Pavan
