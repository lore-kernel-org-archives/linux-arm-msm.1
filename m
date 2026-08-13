Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F25BF3F0A8C
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Aug 2026 19:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786647969; cv=none; b=pMPy/IWCAaP/QGQgVfXmSpPWRptm+BQ1l976TuOQnLNH1iorCBQfDtzC4UZGY7oZ7gYSRq3TMyBH4xCZU1DlEaYAIVxYROXNex45eLzGmfCyV1CodybRBEiTtAY8q1uB9MQl0SAF/u3Co7zvWh0sOu1JWNa3BWuGk/nCmwGCpGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786647969; c=relaxed/simple;
	bh=jS8JkqlizgK4WoSUVO0lzGw9Um3tSM5EfLDcvRh59Hw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ih3ZycMH893ZpfP3gC+nAhK5GYYN6M1gupuTZIVIwaNtOvApnaovojiCAeCX5LqsQyDqPUF5uSm28GBdYuzug3I2sTtEAVXWyAAQKwGSDvDT31JbhBrENQ5Aq8deqlXIhWzQcnY2tymUMZQ187F8DQY0H6+5t+FzWMQwggFKndQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LpnB7zj8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QEyJ0TaN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LpnB7zj8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QEyJ0TaN"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67DIhWda2370997
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Aug 2026 19:06:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=SqtYgCGRvHbqjrphQKjTjd9J
	al7/lUk67I7fKfQTEOE=; b=LpnB7zj8J15wJ22YF0idbKclmSXSW9MHg3UGbz29
	/G+yzpRNuN6DmPyvKhIvNriEV36s9c3P6aLxD/zoRVL9Wp58o91CisXIQurbyoax
	rzZPvnwIO1rdMp+znUEcpyo7CekHTRZmlUC2FgHWCpZSkzin4/RzDA3kDuCNdpJm
	HT/NQUGOX7FB15B3iFEwVOSYOLlb0SbC72ms/1Hu77beMpeMasTJWfYRqVTM7nT/
	rOZTKch70qNw2clpScW2sif5V8qjMhGC6Hss4dBBcGEMBJ+WTzeW86nSr9ILin++
	wivnmdwhQ+kecfJM56y0w39Jnbc8O79nQRpIo4AkxyBRyg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1hgy0qgu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Aug 2026 19:06:06 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c0e702df8so3297511cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Aug 2026 12:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786647964; x=1787252764; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SqtYgCGRvHbqjrphQKjTjd9Jal7/lUk67I7fKfQTEOE=;
        b=QEyJ0TaNCHwjmRlrMxJGt8Zi4P7wNT8PPg+z49hurDgOnPLwPmp65wggmGUgaPQQHq
         hvJyJVi1ITTmot0jbacm2OadUBaQX+VNxIsB873xgdUCr1vcFUWnRg8LFTwkVJVUKA7R
         X5AtWoKVbKlH0nxJesU2FsUG35TsuVengFdarjTeXXncPMc1eydnKfq5Uglw2Qsg7dT+
         s5UXMI6WhcwOqw0cYoPdftZWQxoqQQC55hbgMnV7/K9w63pFv7ub3/oXPiaxHPF4Xcu9
         SmB7gwIbcn0U1nFmSoGwj7qOfkpP8y7Dq3+pFp9UoLZNQnJBxZpfrveptcrSRNPs1V2F
         qDyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786647964; x=1787252764;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SqtYgCGRvHbqjrphQKjTjd9Jal7/lUk67I7fKfQTEOE=;
        b=TXgSSQf2JYVP0FTGycuuIAu7NyqoR0XEm2sTEIL9fxGdTRRFOo0aOVDWEotg1npqwd
         x5fl+hEcyx3OJcN0K56Ut04OcdPiRYRXm2B+GVmu4euorht73aun3bMNLqFVAXq7o8Xv
         lnU5iByXzNvqijnKyGwMSk09iqrt9/OeTvFcb8izSiQQwYvKOY3/PgotqlI7ZQ6vSHZj
         AToRBUWk2cf5jvBmmExbbwpUHvdYGyD0Dz7fhyFFQCVLK16mr4wFNT1UQPqFbOzefbX2
         a6HTsgZ03H2gLvmEn6XVx7rQaaPfNuKPBTUUCiVRZ2Fuv31fwA8ptqF9/f64FtcHPJdr
         nLbw==
X-Forwarded-Encrypted: i=1; AHgh+RocZ0Y58B4mGBW5vgKkrv0NQOUyEu3/JdWX35/BXErmIbuGJND9miGsEAehAwNZxpqrAHmWK12tY92dbw3J@vger.kernel.org
X-Gm-Message-State: AOJu0Yxi9ZAbLI24HKKn0QHD4Yf5ENcf8P2sWByYhWwZxqdhNvwVqUdF
	3JZ3Yu1Lr2XIylZEcF2phbceVQuCPcPQUhfKfrMOEd0jqB91RNFCkkQqMBmZ8PQaaI4AyWXV29f
	/NQqSW/opHjzpi4dGeMsHw4RbpW54ddJ3b+Keiyz55FILy//pzrIWjiyZJD56ddEBPzaK
X-Gm-Gg: AR+sD12GZYqJxPMzBs1M5G7k2sxmd6/+/CKBXle6MMlLuLkx5eL8X4+LaPtzpt3eG9K
	qz3djC2DAKYTK9bSVNMFo5538g2ENoPrZAzh0IvCcaYG/z4+a9nMj4enoQFFXfUQIMRXA7gePCe
	WUHNUx88AXXXzJw3xPUqGSPUhbYJGlv9QuqWACOixGhQll/JIkU06sJ/E+XWEgZQw6GJZYJqyvt
	hLE0b0ZKIWipi9BzSrkkARJFwUjEQdpg0LIdyKoCPj/DMqlgGgrBTdllFBXyln8zV+zOp050628
	qtyXiST7+km8G29abBDqg+mv37js0ZW2YGGIGumGqXoUZQryplLoaYc0o7jqQ1ClvbKYGtGxdcz
	NuU3GEl6GBlE56o6/asQWP2Klaecyd972458PZdyAgyesFWf9aji7iCjGcpONnSrYw09HmpA9mm
	bT19RIW9WzrAn3
X-Received: by 2002:ac8:5f95:0:b0:51c:73f:e3a7 with SMTP id d75a77b69052e-52d85422700mr1954231cf.26.1786647964170;
        Thu, 13 Aug 2026 12:06:04 -0700 (PDT)
X-Received: by 2002:ac8:5f95:0:b0:51c:73f:e3a7 with SMTP id d75a77b69052e-52d85422700mr1953281cf.26.1786647963727;
        Thu, 13 Aug 2026 12:06:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b458bedfd8sm57388e87.52.2026.08.13.12.05.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 12:06:01 -0700 (PDT)
Date: Thu, 13 Aug 2026 22:05:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: webgeek1234@gmail.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 3/4] arm64: dts: qcom: Add Retroid Pocket 6
Message-ID: <pgup5kvjyhz7l7rucduzlqj7hmle2lrcvso6ge34up5am3uukg@3jocblne3lvi>
References: <20260808-rp-qcs8550-v1-0-a5a365ba3dc5@gmail.com>
 <20260808-rp-qcs8550-v1-3-a5a365ba3dc5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260808-rp-qcs8550-v1-3-a5a365ba3dc5@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEzMDEzOCBTYWx0ZWRfX7r5t7+LUiiFh
 AU4QVocHeHrRxDBVOZEG/khS/C+KFGs1yjZCv1YbNk8siLrhE2G0WXEEVv4a4IP7yobZsdQyNK0
 5mW/fovLBQxFoiLSqPIdo/rAcPl5xIe2nnXgV61/lfuNZlXUcuxefbTGEFeVYJQKplonfyF7rKK
 6oFpS6r/wUlZWj1WCEhtjWJNlY8rPqCAihlm41aqhP3DpCtFLOQZ/RMEB/qIfb6a19XM+zf6Pcc
 ygEJ7x5Oilw3WlmBJQFqJB4t1vPAF8tJtylD/0V8+RSNRY/t7ApWqGMvc00uv0ZfC9RoyTHuFBt
 XZYQ2jfEMoOmVBHv0SWldgr8JbHFhpJXamuZmJw/S1N1CBgxhW/6Yoaj83KTSujTQN3X5TvC+j+
 M6olveOeCRh6bm3tuLmeCP0DqSDPgb7ahfhXWYkSzO3F2LCdWCmISnEWM432WIVWYMIiDyBvtch
 xOrIreg9vc4/7/EVN4A==
X-Authority-Analysis: v=2.4 cv=AaSB2XXG c=1 sm=1 tr=0 ts=6a7e159e cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=pGLkceISAAAA:8
 a=x2SIRoQZ2ETBtXEx6nMA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: cRh0brq9N7wTY-tXO8VAjluWi5v9YbfI
X-Proofpoint-GUID: cRh0brq9N7wTY-tXO8VAjluWi5v9YbfI
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEzMDEzOCBTYWx0ZWRfX41OEP2I3rx6/
 yft81Xam7oc2fZbm+ikgk+tl/pl4NAUDvSsPbSSgoSyLZ42DwhMvv57P4n85DRKWRnsPOo2pKsW
 oLXjIfTCLPtE1W76GJvKhUKvVq9ZUUc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-13_06,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0
 impostorscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608130138

On Sat, Aug 08, 2026 at 12:37:57PM -0500, Aaron Kling via B4 Relay wrote:
> From: Aaron Kling <webgeek1234@gmail.com>
> 
> The Retroid Pocket 6 is a high-performance Android-based handheld gaming
> console powered by the Qualcomm Snapdragon 8 Gen 2 processor featuring a
> 5.5-inch AMOLED touchscreen.
> 
> This is based on the support by ROCKNIX, however their history does not
> show who the original author was, so direct attributation cannot be
> given.
> 
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile                  |   1 +
>  .../boot/dts/qcom/qcs8550-retroidpocket-rp6.dts    | 122 +++++++++++++++++++++
>  2 files changed, 123 insertions(+)
> 
> +
> +	vdd_disp_1v8: vdd-disp-1v8-regulator {

regulator-foo

> +		compatible = "regulator-fixed";
> +		regulator-name = "vdd_disp_1v8";
> +
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +
> +		gpio = <&tlmm 70 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};
> +
> +	vdd_disp_2v8: vdd-disp-2v8-regulator {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vdd_disp_2v8";
> +
> +		regulator-min-microvolt = <2800000>;
> +		regulator-max-microvolt = <2800000>;
> +
> +		gpio = <&tlmm 142 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};
> +
> +	ts_avdd_3v0: regulator-ts-avdd-3v0 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "ts_avdd_3v0";
> +
> +		regulator-min-microvolt = <3000000>;
> +		regulator-max-microvolt = <3000000>;
> +
> +		gpio = <&tlmm 144 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};
> +
> +	ts_vddio_1v8: regulator-ts-vddio-1v8 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "ts_vddio_1v8";
> +
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +
> +		gpio = <&tlmm 102 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};
> +};
> +
> +&mdss_dsi1 {

Out of place.

> +	status = "disabled";

Isn't this a default? If so, no need to repeat it.

> +};
> +
> +&i2c_hub_3 {
> +	clock-frequency = <100000>;
> +
> +	status = "okay";
> +
> +	touchscreen@38 {
> +		compatible = "focaltech,ft5426";
> +		reg = <0x38>;
> +
> +		interrupt-parent = <&tlmm>;
> +		interrupts = <15 IRQ_TYPE_EDGE_FALLING>;
> +		reset-gpios = <&tlmm 14 GPIO_ACTIVE_LOW>;
> +
> +		vcc-supply = <&ts_avdd_3v0>;
> +		iovcc-supply = <&ts_vddio_1v8>;
> +
> +		pinctrl-0 = <&ts_p_rst_default &ts_p_int_default>;
> +		pinctrl-1 = <&ts_p_rst_sleep &ts_p_int_sleep>;
> +		pinctrl-names = "default", "sleep";
> +
> +		touchscreen-size-x = <1080>;
> +		touchscreen-size-y = <1920>;
> +		touchscreen-swapped-x-y;
> +	};
> +};
> +
> +&pmk8550_pwm {
> +	status = "okay";
> +};
> +
> +&remoteproc_adsp {
> +	firmware-name = "qcom/sm8550/retroidpocket/rp6/adsp.mbn",
> +			"qcom/sm8550/retroidpocket/rp6/adsp_dtb.mbn";
> +
> +	status = "okay";
> +};
> +
> +&spk_amp_l {
> +	firmware-name = "qcom/sm8550/retroidpocket/rp6/aw883xx_acf.bin";
> +};
> +
> +&spk_amp_r {
> +	firmware-name = "qcom/sm8550/retroidpocket/rp6/aw883xx_acf.bin";
> +};
> 
> -- 
> 2.54.0
> 
> 

-- 
With best wishes
Dmitry
