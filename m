Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 263A44457AD
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 10:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785322784; cv=none; b=UIQcu+Sm8FPrtyCK+nR/9PEIm/xrTUNIMkP4mRdjciIi4fnyhNkoIKcEQGtRPvXUgEV3tK1PbbAzLoloHQvSzye5fU4wh/7/akldfJ+IW0jbf1TPpAggUNrBouhsJOdpIM59YVk0Xibma+gmjX+QdQwvX/xOY2IyBrURZnDDn0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785322784; c=relaxed/simple;
	bh=7RTJQWnL5hx+W9CM10/WlCRexSIlFybuQu3riz/+oNY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WJPSbb/PnoeVf8CsbWvmoKyRW8Eix0rdF70JRZrferGjB3bWGpknv3JHt1wryj/2ray85AyYGAP+CjIvQwZspduEe7aK5fB3Aqya3bcSQQFy09acv/nMe/vNtes/Y2g6mVk+kB2N8m+9JHuWGmlMNxgqP3qXOCDxB3duXzyeOic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UV3jKmR4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y32G40m5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UV3jKmR4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y32G40m5"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66T8htia1484320
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 10:59:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z+HScNtSm/fsTc1nP6tPXuEJN/xN6GzE8XU6z4AKsg4=; b=UV3jKmR4XDL+hMwp
	dfLUHAwwp4UXdOyNHTIiktHXU33Y0hh3pEygrOnp9N/FMObTo58VwRD7p4aRcZcT
	NXUXMNGtF7p8+2Wxe/FRWD+Tqff71Jo3GARRjvU2Yvs/87/hVXqfaqZ85vxRaXl9
	B+qP0dwDkSKJ+jUWLmlXzT+4aB/eymzaBO3gTM4NTYqNa5+o2096C4nFj8njz60Q
	9bA9tY+W5PI4W0D9ofb1cHALlirLW7OSU6j0pmrqWVykGmXQ+ZrgDJcmhjjUme/w
	iSe+Ra6kaglwJN+JuhDi8gKYToMN9ZzTwKeAMoTWay1a4/XIPP5liAZz0aNA9JvQ
	qBCbLQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqe920kqm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 10:59:42 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9310484c005so19410185a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 03:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785322781; x=1785927581; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z+HScNtSm/fsTc1nP6tPXuEJN/xN6GzE8XU6z4AKsg4=;
        b=Y32G40m5MOj6JZZL/Cs1WG0nrDDbMad7eT24e0UPmlni9EDTgyQGrIkV6KTO+c1Ls8
         H5DDFMJOobGx7GG2zh48xPpoUCxdSWuEvuKYX8mQv2LC4oT5s1TdTORxIpb9sS3CfEUK
         GdMvjA+SG/6DBqFdaYqyKThjmaQxUBh57zCov4bUZ1n4nO0db/9daOnYIEXmVnUTQl6j
         DnrEPEwJN+q0l8+e/J11K1Z5IE5fr/qMV0JHkd9qGsABf8SloRgtl+uliX8SjaZPCp8G
         uVHl5ourbKQloG0M1NkyvwOdbZXLx7RhkR1ngGL7gn7DEKcYckGfoZCiRSBlHOX/zEtX
         9a3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785322781; x=1785927581;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z+HScNtSm/fsTc1nP6tPXuEJN/xN6GzE8XU6z4AKsg4=;
        b=d5Z6JLWkWa5GVxGgabTfLUYjR5on3ZvD/JMXn56rRUkxJHOcK0mOjgCQCy+LcnbV8R
         L5SUDJdwZExPEDIeX8X1/XzQ7lYHnb33pBNsa2ooO6Zu5qmH8USVMzyDHiV/xirKLWGl
         Q7JlEQPFN6vefapeUyeqricspo19YObbEMHutqWc2+wG1FIh6xi9cHhfMGtE8D1584CI
         OeQypqvKJWgYKCtpUpqxZnuKFKQ5MQha+yy/++ykX7ME+4Ew2eTfiitSpd/ajsAbqDFX
         ze7rjHGTMFZf+83e8WFglvk704GsyaZH7o6+faqF6MC+BIruTOp3uB7QkUzqxmKLOi5B
         BU9w==
X-Gm-Message-State: AOJu0YyhEIFGBV5r56dgDMFKITRIYWkd/O9rkW3DC4s+z78I7QZCHuj0
	cTdPDdLt1ZnhHHtVXLSLXKCkwhvsp7gBrNS0lCTi2f2o53XnuswA+LunLBFtbAfeg2nSwjXrIQ3
	Mn/nc/e0YdmjcicVyWPRt50VRw3TuqPPr/i2LkxDaUoqMEDu3OQ/KJyKk2h/4B3i8mhBv
X-Gm-Gg: AR+sD10IqZMfBAqnJ6B51r/0nzVCRBCN2fHuwq+OJch6oiyVcA4V9+JCgNWUhy3yx3e
	cBIMtfHiMkVshGiX5vJQiQr+sKvRizO/MNVDMkydmtyn5EjxJgb83lRIevJcvBJLQULMe3WnpOd
	AfiuPc40lwdobZ4YYPleOSxrIOi1MSPTJ1/AfHiE79idSYZYGBKJvfH7NIBR1GfyfnusZ+c6N1d
	AMpPnftXb4szyrRPC1joo7QSK/9wc1nPS5cHZ+5eSTrjkEhYYla36gCrkFM6n4jrCwiO6zy75dZ
	iDbwZsknavpO8vbRY6vuA68+diyU+euzIRkVIUEvFPZPAcDgF/i8JUud39NrqIDVo6EDcF7gehp
	pTAU7nwVtnpTOQ4j3QtlJpcKJ
X-Received: by 2002:a05:622a:14d0:b0:517:5d21:9899 with SMTP id d75a77b69052e-529df876c1bmr60463471cf.5.1785322780799;
        Wed, 29 Jul 2026 03:59:40 -0700 (PDT)
X-Received: by 2002:a05:622a:14d0:b0:517:5d21:9899 with SMTP id d75a77b69052e-529df876c1bmr60463221cf.5.1785322780392;
        Wed, 29 Jul 2026 03:59:40 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a050be9607sm737824a12.12.2026.07.29.03.59.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 03:59:38 -0700 (PDT)
Message-ID: <94081897-2e6a-4c8f-bd95-1961ca843478@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 12:59:35 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] platform: arm64: qcom-hamoa-ec: Add SoC junction
 temperature reporting
To: Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <20260728-ec_add_more_commands-v1-0-771abd65ee1a@oss.qualcomm.com>
 <20260728-ec_add_more_commands-v1-2-771abd65ee1a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260728-ec_add_more_commands-v1-2-771abd65ee1a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDA5MCBTYWx0ZWRfX5OtyDZK9tpVH
 yAaeFX12++d50cKVOmVCgSAMEMxJv4hjnLNHWlPXCTc9FpmjuxWQJ5eVVY0jmj95vU0vzgPv4r3
 TVNDTwsXZCMhSTGyHPQ3qb758V64cls=
X-Proofpoint-GUID: IzBrHS-eLd5uJD1amXdEn6vgMrYo2k-s
X-Proofpoint-ORIG-GUID: IzBrHS-eLd5uJD1amXdEn6vgMrYo2k-s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDA5MCBTYWx0ZWRfXxcovJWhgXMmq
 bJhXpkh7iFUL9/WmkQJpfKsSx0EkEC+ldHSGTBEcMl96GWOWvLc9LIQoB9dPpk8RJ30+iYfxhdF
 8Dh9OlPLHTDn6mpbt3IYZp+WRPSa8aQxEMzPgtSLxpMqF78nCSZT/wTC0nv4GwCRsVJirK0Cim3
 Ou1APyWZ+sdH39H2BlMHdxZ7p+o5ynsUcG2aiFSlptE2nobyJMlq+NwoIKLASBr6LeyS4EeOvel
 ++gTZqmDKFIYnidfVM0iQDMXPWmK8D3TEhtRTj8CISrf00bgP6rlgMAupW9Jbf8m1UdcqyKUCeO
 CjDlDJypKouN1QmvILTAEXaO0JXOgOKuP8u0sA+TFeIHlDPFUmfQOLh1mdvejl6V5h74V/w1E0T
 uu5VvF/TY8XT0nGNe+vr1eMCYoCBk4PYLrZwJDDBIZspBwK92FugPYM1o9p8cCWQ7rYHNQL0Xrt
 8hAchJN8a4nwPUEHJPw==
X-Authority-Analysis: v=2.4 cv=JeiMa0KV c=1 sm=1 tr=0 ts=6a69dd1e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=0UkU7q0zyOI0kmPNHrEA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_03,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607290090

On 7/28/26 7:44 PM, Anvesh Jain P wrote:
> Add the EC command definitions and handler function for reporting the
> SoC junction temperature (Tj) to the EC.
> 
> Discover the platform's thermal sensor to zone mapping via the
> qcom,tsens device tree property, average the junction temperatures
> across the mapped zones, and periodically report the result to the EC
> over SMBus using a delayed work item. Serialize this and the existing
> EC command sequences (firmware version read, thermal capability read,
> SCI event control, and the SCI IRQ handler) under a new io_lock mutex,
> since the delayed work item now runs concurrently with those paths.
> 
> Re-arm the periodic report on resume and cancel it on suspend to avoid
> racing with the modern standby transition.
> ---

Missing sign-off, have you run b4 prep --check?

[...]


> +	mutex_lock(&ec->io_lock);
>  	ret = qcom_ec_read(ec, EC_FW_VERSION_CMD, EC_FW_VERSION_RESP_LEN, resp);
> +	mutex_unlock(&ec->io_lock);

Does it make more sense to simply stick a guard(mutex)(&ec->io_lock)
at the beginning of qcom_ec_read()?

[...]

> +static struct thermal_zone_device *
> +qcom_ec_sensor_to_zone(struct device_node *sensor_np, u32 sensor_id)
> +{
> +	struct device_node *tz_np __free(device_node) =
> +		of_find_node_by_name(NULL, "thermal-zones");
> +
> +	if (!tz_np)
> +		return ERR_PTR(-ENODEV);
> +
> +	for_each_available_child_of_node_scoped(tz_np, child) {
> +		struct of_phandle_args args;
> +
> +		if (of_parse_phandle_with_args(child, "thermal-sensors",
> +					       "#thermal-sensor-cells", 0, &args))
> +			continue;
> +
> +		of_node_put(args.np);
> +
> +		if (args.np == sensor_np &&
> +		    sensor_id == (args.args_count ? args.args[0] : 0))
> +			return thermal_zone_get_zone_by_name(child->name);
> +	}

I'm not sure that's the intended use of the API, but this is NHI
of_thermal_zone_find()

[...]

> +static void qcom_ec_sci_evt_disable(void *data)
> +{
> +	struct device *dev = data;
> +	int ret;
> +
> +	ret = qcom_ec_sci_evt_control(dev, false);
> +	if (ret < 0)
> +		dev_err(dev, "Failed to disable SCI events: %d\n", ret);
>  }

This should be a separate fix. FWIW suspending and resuming on
linux-next/master currently gives me:

[   43.754787] geni_i2c a84000.i2c: error turning SE resources:-13
[   43.754811] qcom-hamoa-ec 3-0076: Failed to read EC SCI Event: -13

Konrad
