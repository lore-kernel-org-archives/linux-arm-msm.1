Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9159735DA6E
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 08:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789373617; cv=none; b=HDDkB48n455eSWhOZfwlF3EvOgZcWf3g4xjTBb/5Xcz4FCy93sL9K2fItrsNdnuEjmOdBRbryUGWH8RP/ArPWSdvy1ky/bUhISwt/XiQorpB+8DcxP2tKsHTNoJLG9WezS0G3FIZ1S/coPc6rspYVV5IbxtFcXyU06d/50wYhnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789373617; c=relaxed/simple;
	bh=ry/PHtCb3fMC33PA6aeOge+X7oula6IdRsZRjpNEJ0k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ufb6DIBL8lggUWR2QR1WxXx52gI9zEf02QYltKZ0Se8DPA3gKTDFt/Ppw18sCzhLJXYS6uXR9NfUso5Rrw9wdnd9nKKCIc3hjjLVkKwD3O3n8nQHlamP3bONMUwJW3focz+ChHV63t4XfRLpRmrK9i2YcYIdSv4Vrh4PFKWk+Zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nJZnmSpS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O48/vgXU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nJZnmSpS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O48/vgXU"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5jY4h237710
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 08:13:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VpOzWkUmj0fptxU1puX959kqq/TzTpUukH/T/db+xlE=; b=nJZnmSpSvtT4gSHS
	xm0c6XJ6eE1AmyI2cjT0LUjoiImQJZgXIJNmvUK28lECnEgv8xdNZ4TF+eeLLyb1
	3nj6nMWjyic+0+R74dM41nKTSwAQEn9o0uHWgP5V7vdrAcw6o/25brn/wh9qCOpd
	5la3Yy0A21zaWW4dVgobUo4/xVzrLpSx0C4/fkAh3CybB/NZnhIM/ZC2/j1uhgLQ
	eJ3nqC4NDLckKNvunwPEwAe7xQ9sxyMN46O1e2SVqioGCjksomGU1GeRkQ9eRr00
	NfD6ps3y/ifbl79PyUggx5KytbwsskQb66y8mQD4I2CSHG7eY4Y5zmNehcE/Q5Li
	uyM18w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9dnpxr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 08:13:34 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-939f8e7ff71so32794485a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 01:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789373609; x=1789978409; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VpOzWkUmj0fptxU1puX959kqq/TzTpUukH/T/db+xlE=;
        b=O48/vgXU7KFJ+LzL8qXZW0TsviT0vw9dKXURtpqUUet1nMMmmpjsezypBBkKXCOyZh
         CROLOhe8kB1dCySaQNUOYe6xhXwanch0VdrChH4i9JmBk5tvm3f1wqAmbbxPed3HxeTv
         ExbXOwS+leG3rvfV+dwRm3EiRm8AF2ZX6gRUpA9CCXDBkC2mrkNxMZO7ucC1/yBViMvz
         jvYrtwMof09RKlw3NCUoZtWAhpu/J8O41cFGJRqxAenJunomfE8T/W4HO51zSYbAr5qb
         CMEBOLURWfe41wyQe/JjOnGgB/mCRpB/A2IWpd3KPTVE3hhJQRwCo8zXUFZCViNdquPt
         yx1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789373609; x=1789978409;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VpOzWkUmj0fptxU1puX959kqq/TzTpUukH/T/db+xlE=;
        b=I7eL3hP5QsmLXMuURLPa288Lq6RsYsDSfIgJwSZbeOJtwMiw/t0LxblTxJsoO/JYxD
         EI3KG1z69UwTZSoJzMInTfHP4ICiQMO1AHnO/xn9XT9vlh9iETyyf+nzl841GZKvrUmv
         oL2fcxwMh7FpYyn9DhfSma2A9NrRbbmoOIhThcIQoh4N+SWWscXkDbM8rkISYGrOgoPU
         8ViZGeOkDqXtbanlvkKroZ5HSF5/E8cmNjzivfdQ+byQbZvCCRD5oy1OqKFtq0aYhB89
         L67a89isTj5WCmhIXO1vZVMfPVwDTIcr+RH1Q7B0Det5TJFazYo7FSeS1KazGXwf/aOL
         EFSg==
X-Forwarded-Encrypted: i=1; AKwUvBzNhL7ujcbGBFg+IWx2cLJwV1mfSgFBcD0ydVJnZkMGD5FfN1aCukyB62ESlTDcdmKlMt7WSeU5Gz6Wpne8@vger.kernel.org
X-Gm-Message-State: AFuF++mcM3vfkqKEaJ0BW0p8Cn+WYr1vlauQe9C7xuJy2HFgBqnhkxw/
	zaKyum/wxG35LbGEnlYOKhzRDhBFRI+eGL1YUFpNt9CmNAAHQ9MW6JQvelWVu0W3Tzhz15OUb33
	eYcQKeAXxo4wZ0wT4M2XhyF7v3yJP5icAskhPDbVq+af2pMBcshW7u5lxLpc7NuXvGNLy
X-Gm-Gg: AYBFou0QQCsQFWoaIru/5J7AViKk2TrBml3JvV5WPVxC2Q+suLh1ZEUwUOrBplpOc8E
	aRUewHY6zkah2MhRLzpVsCbv2mgS3c4twEtsX+o3QVN1SCcxVHYIIyTZkhAajdGYIkDt8tRhX5d
	fahy6PUpKJqOzn+48woVRTgKtrHiZV7NtV5B2UqdFbMVGZOtINtL6xgiWKoQlU5qHP4uOWYNZ/x
	v+4sx5n47WV7ERWpEMaA7F9vq4vvTt6Sw/74FY0cC5ean2CaG+hhq0jVypnv0tsdP8H6O4dJM8f
	T40IXiKZ5qTqdNzwJuX7uHS9+RYkq/qkdwXCPsZWriBQVV9LCv67pVpuw1Wu8F4ltM9yAZsilsi
	yThAgzsneTwh6OaZoBWqGxg==
X-Received: by 2002:a05:620a:1a07:b0:939:48e9:51a1 with SMTP id af79cd13be357-93a2985be2fmr175419085a.2.1789373608817;
        Mon, 14 Sep 2026 01:13:28 -0700 (PDT)
X-Received: by 2002:a05:620a:1a07:b0:939:48e9:51a1 with SMTP id af79cd13be357-93a2985be2fmr175415285a.2.1789373608222;
        Mon, 14 Sep 2026 01:13:28 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a9bc808adfsm3661441a12.4.2026.09.14.01.13.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 01:13:27 -0700 (PDT)
Message-ID: <cbc69211-0b2e-43d2-b8d2-647a9cfd2f72@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 10:13:24 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: Add Lenovo ThinkPad T14s Gen 7
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Douglas Anderson
 <dianders@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        mpearson-lenovo@squebb.ca, abel.vesa@oss.qualcomm.com,
        sibi.sankar@oss.qualcomm.com
References: <20260913201835.250085-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260913201835.250085-4-srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260913201835.250085-4-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: dstjBu8fuvptvt9sWpMQwY9D5McjibKa
X-Proofpoint-ORIG-GUID: dstjBu8fuvptvt9sWpMQwY9D5McjibKa
X-Authority-Analysis: v=2.4 cv=NelzRGD4 c=1 sm=1 tr=0 ts=6aa7acae cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=2i8abOnZ9zkVdpuz0iAA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDExNSBTYWx0ZWRfX0kjcgkWOmu+2
 j84MnSmc3xV/EbeE58knldNRT1EYOE43ZoQRPexSinl5/VZh1G0dYajD1r6/7G9ikh4QFTDdgLN
 yeA0wsNgpqTHYflceTyAsm4pfhyie9w=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDExNSBTYWx0ZWRfX7ymK6GxSivTp
 dlz76PhJ58A6WpKCrIV4lEPj6OLmaVIILN53T3irABHPLGSmEYPraFBRuiyk2azCeHVyXoscXd9
 +lxYubOqXZ4f+MHFQHw1kWvYH8pIX/zyMp/lFmivNtJFdsUVFt8kHbLvyh7Olytq0W/Enk4jhkv
 T3Sv35fWJVqNWK0L66RByiZPxv9t6rsrXj2mxgbWKPEFhA8eicyvISDM12OpVBJDHQwDggz28NG
 swQ1S9SLOKxJ+IWX8/RzM+F8owU3CUabwY9Fcxwo1peAD9Yn+XMkNY+Dup6fk7PHafgk7diQR/Q
 oWwPyUhb7fQqPzwR0VF3pBCUB2G3b2DnbN4Zk62nvQ8jYRDbopsHP45lptWl7MQD/zBFxplm9sR
 1JQXRPUsCh8C1ch+Tm/rP1/OXrxxhmeEBYRdry0883y5khz8IxHt/oeac80rFbicNMbY8GipvE4
 lmWgtrU26J6Ij//KhBQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 priorityscore=1501 clxscore=1015
 spamscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140115

On 9/13/26 10:18 PM, Srinivas Kandagatla wrote:
> Introduce a device tree for the Mahua-based Lenovo ThinkPad T14s Gen 7,
> a Snapdragon X2 Elite laptop.  It follows the Qualcomm Glymur reference
> design used by mahua-crd.

[...]

> +	vreg_edp_3p3: regulator-edp-3p3 {

nit: please sort the regulator nodes based on their names

[...]

> +	reserved-memory {
> +		linux,cma {
> +			compatible = "shared-dma-pool";
> +			size = <0x0 0x10000000>;
> +			reusable;
> +			linux,cma-default;
> +		};
> +	};
> +
> +
> +	sound {

Stray double \n above

[...]

> +		vreg_l18b_e0_1p2: ldo18 {
> +			regulator-name = "vreg_l18b_e0_1p2";
> +			regulator-min-microvolt = <1200000>;
> +			regulator-max-microvolt = <1200000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-always-on;
> +		};

xxx

[...]

> +&i2c5 {
> +	clock-frequency = <400000>;
> +
> +	status = "okay";
> +
> +	/* eUSB2 redriver for USB Type-A ports on the MultiPort controller */

nit: this comment seems self-explanatory

[...]

> +/* Internal eDP panel */

Likewise, it says so a couple lines below


[...]

> +&remoteproc_soccp {
> +	status = "okay";
> +};

This is always enabled

[...]


> +/* Two internal USB Type-A ports through the MultiPort host controller */

I think the right thing to describe here is what they connect to

lg otherwise

Konrad
