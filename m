Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35EA13CF02D
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 08:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784535899; cv=none; b=aIKzRgkKA7ZukxcCQ6DH5ZT6A3BNMH+jQ99wN4svCbf+8862YiLJ7bH+JMpvMKcDM1ePbadnawmzGRTCq3Cc2R2+XwuElUh6GZsCPs4bvdjhfitgNmp/IqHM3MJhS3VZ09DK1WVGsTcQCdFtsmYQ41C/s/lW2tplhw6ucEdkTSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784535899; c=relaxed/simple;
	bh=waHbqcBZdYRc8JsjHtNidcoWbr6SLqkMAwOxCxRofkE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gB1Xuu8nkuYBvtPzrJMWB2jHv3g0RDxgEldnoS+Csci/EMTaMYeTLPVKm4t+sttUvYREZKg1GGq5n9wZm1EHwZczmxKiLkLOsfRpZvAJdmesehBxyPSBnqyI+4LjwOsj/9elzWBbnWHROqxP0MdJvmVYDNoWizf44Z+q+eAzvbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LSPAEAqS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AWcX1Zxj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LSPAEAqS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AWcX1Zxj"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66K6RSgF1520049
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 08:24:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bL7PVVg75Jth1HsfxflnLYBX9Vi18Fh5UEv4H2ildT4=; b=LSPAEAqSMDawS6iM
	JgyiTQ3dDyOFrudHZcTTIy/IlQxESaiwX4rxM/XI9axFnwEYdAENoZh6KD3PKoPe
	0tmJbl+6QkRlO4w1h6G25bxd5SLj/93lmBM/Y0Plshj0/Twq9Z9E+5TwPkX6NVbZ
	BbAmx9Ywl5KrD77Ki/d2QoOepXyJRPW3O+g2LPLaVffYA7a/rP1h6cvO4MEo8qax
	jG0R77qb+sqcSU+U+1DCrHqjlh+2NlJZ2T4pgAysQ45UzZ/6JLdDAZiu4xfy93M1
	EMjlWoonus2csm/f4y1o3oWssRkqtoOuWljUO0lOmmiRzTmK6U7ddexJANUCyQNU
	Yuk+bA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2chn5na-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 08:24:57 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c21be5bb4so30335811cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 01:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784535896; x=1785140696; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bL7PVVg75Jth1HsfxflnLYBX9Vi18Fh5UEv4H2ildT4=;
        b=AWcX1ZxjoU27S5mCRFzdeD9clfHlSpwiYlXk/1cc2HenI9IXNsjULF/p7Ws/a68ocb
         DdnJ+0N8uVtSYgzObjAkVUPlr798GUWAvn5Qsue2XuSNPEaT4dalDxSm/kIl5VoK65bZ
         S/GZuWV2lVRD2qsWSEHKy4ufxM1l5iBr50nSCBjpUfjRR/Wd8nD5WAJ1ppnAvEsR/PjV
         vNH+racIJc03CGIkl5MFSFXlp20Gr76YiBlDJqzCriEW5lvQVa9SUMsooKmAay3A4wmr
         UtG1qet0jcEXNSoGPxV3ohWruVINP382imOHZiyGVD49pQWIKWRiFDSke+l+2ZfU8Q32
         CEDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784535896; x=1785140696;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bL7PVVg75Jth1HsfxflnLYBX9Vi18Fh5UEv4H2ildT4=;
        b=ACj8sb6Q6BqZitgslD0QwUlabb4e35nDYegis7LmshyIIl07nXi2v8J0nWXk/YjBqG
         LIpgAkTVhW2lH2ed21FoPkfE7Ej91hc0bgcH+zP5+5Szo4xTZib65btkIOVFhVx9hcaA
         +c12EMHVTegEcMhP4qm+wXaTyxyJE+1aqkxIrMSToL/zEg0ZaQVIQ51VbTol4Rkknz0h
         rcQ6yekgg9TTaB6Yrs7KK3ecFZj8zd334sDiC8zUUKfMMhu1MTehNjEABNtpjsm1ZrQ/
         rY9XbfTon3nhdOCk8wiY9+TfX0YJlnbbTKEGv6HUiXrFUHm1nP1hMFIC9p+sXJaEXV5a
         kJHg==
X-Forwarded-Encrypted: i=1; AHgh+Rpa6HjwjynZkeRqSG9GuD8sUBs9SsE2wPbX3qeXe7f7itf68YXR8uBAv8aq48mQmC2greHZlZOJlbN28Sp1@vger.kernel.org
X-Gm-Message-State: AOJu0YwhGT2HHqyb8wiH1lSRIXS59wz55bKwnhWqbvHQ3iufnKtEmmuC
	+3E6S0kUmBhvUvZ/FKTXUADlrEDUqA36eY4kezc+VQUH65qDugKy16WdaAb2CmK/q8aUsMjI42F
	tV8ruu3GS3PAazc6rxbXwN+59MRvXAhVf63J5FuOfLCmV6Awacx5jKWM9+OePbuO+6xLV
X-Gm-Gg: AfdE7cn9AoWAR0awlrkupz1jgOy9RAWfxReceYQ9qNXZQbYDy8pFQOKNDyoVsEPqnd4
	PjJbwuF1IJgMTTFpV3egU89rDMRkVE6IycEf+WSB40DvNI3/gVd83eTGwnnOLco0z8wdLybralp
	uaevAxTL7Lmu5C2CsbaZioHz6Ps0GFHf9anOciM+4tZPbiVQzZ/6yX0upZQUs+1SUlNWWLRKCrl
	kI5gQyIEYpE2WB9DSL9ZA9iaIzUcIZ0MGh7egEj92qPImP8EBV0Nse5KBfAFLOYckwFg/srmWl0
	YycL6/vUAFIMKX+Mab3kgPQLklU534FZuCaKh8v+Sc4dXo8EH5GDKhfg8cTSVbJT6wlCh6ztj4Y
	inaF9PWDoZJVAg0tBHZyo3nAX
X-Received: by 2002:a05:622a:aa05:20b0:517:5d21:9899 with SMTP id d75a77b69052e-5213d2b85efmr73668731cf.5.1784535896330;
        Mon, 20 Jul 2026 01:24:56 -0700 (PDT)
X-Received: by 2002:a05:622a:aa05:20b0:517:5d21:9899 with SMTP id d75a77b69052e-5213d2b85efmr73668591cf.5.1784535895851;
        Mon, 20 Jul 2026 01:24:55 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1724f50ab7sm426171866b.50.2026.07.20.01.24.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2026 01:24:55 -0700 (PDT)
Message-ID: <d8e2c2fe-a504-4ba6-806d-f3923ea0249a@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 10:24:52 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] arm64: dts: qcom: sdm845-google: Add dual front
 IMX355 cameras
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Petr Hodina <petr.hodina@protonmail.com>,
        Richard Acayan <mailingradian@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260719-pixel3-camera-v5-0-99593f1bd8ec@ixit.cz>
 <20260719-pixel3-camera-v5-1-99593f1bd8ec@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260719-pixel3-camera-v5-1-99593f1bd8ec@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDA5MiBTYWx0ZWRfX7Kb6hsQolmXy
 n/yxJU2iGBW/CJfVKWO6lIVN87em1tdRE1StRgLVHgccBTRu6OFK8a2T6wxxPT4lNnLaW75oHhm
 //qNbr3na/a/9cbYCFoixNWD6YI6wZI=
X-Proofpoint-GUID: KRU7nMORs1HtoiguBbbnlpSKIypV_LJG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDA5MiBTYWx0ZWRfX22AoqY0AFYWo
 OOcbee/9xrx7mjPhH5HxjdzPsdi0FxHBOTKG6Gop8CCTo7Py5zDJDTWy9DS/MZtSu9NfWQED0j+
 0RsWpEqSkVSWiNJxdAR/pT36De0lcpgEJNX7qc9okdbJmSGJ50IDLLWV84/Xwwen8G6lorHsKLk
 QSwi+N02C0EByXbjgyq9t0OWtqrehqWBv7MUKCwFLwsxiGPpfR3hmLttLJj4IK85oM3MYZyJsGX
 hahRMTu1oI0au1ptFiOqStNY+gxcFORjy4dbiYpq/S3rUOjLahTJn9hZdxfC3mqi6nwbfKgSeWQ
 y0tmzf3JU38v8g2r5eULger4IA/IGuuEJauusTYN0FbcwqA1POZSISeOVvwIXxHHnPR04tyuQdf
 DQVONdX2cRo7qiWH7KcaOBrSxRBkvyn5g7swKfSMSPGf0/btfp4kBWl+LaPcCHdT+NLzaEE6o0J
 qJmxHLWIOERDd79d/hw==
X-Authority-Analysis: v=2.4 cv=T5K8ifKQ c=1 sm=1 tr=0 ts=6a5ddb59 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=ecbwrVNTdaeG15ON8XIA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: KRU7nMORs1HtoiguBbbnlpSKIypV_LJG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_01,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 impostorscore=0 bulkscore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607200092

On 7/19/26 8:03 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> The Pixel 3 features two front-facing Sony IMX355 sensors with
> different focal lengths (standard and wide-angle).
> 
> Sensors are connected via CSIPHY port 1 and 2 and controlled over CCI
> I2C1, using MCLK2 as the clock source.
> 
> This enables support for the dual front camera configuration.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

[...]

> @@ -127,16 +128,48 @@ vreg_s4a_1p8: regulator-vreg-s4a-1p8 {

/\ is regulator-foo

>  		regulator-min-microvolt = <1800000>;
>  		regulator-max-microvolt = <1800000>;
>  		regulator-always-on;
>  		regulator-boot-on;
>  
>  		vin-supply = <&vph_pwr>;
>  	};
> 

\/ this is foo-regulator, please stick to the former
 
> +	camera_front_avdd: front-cam-avdd-regulator {
> +		compatible = "regulator-fixed";
> +		regulator-name = "front_cam_avdd";

[...]

> +	cam_front_avdd_default_pin: cam-avdd-default-pins {
> +		pins = "gpio8";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +
> +	cam_front_aux_reset_default_pin: cam-front-aux-reset-default-pins {
> +		pins = "gpio9";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +
> +	cam_front_aux_avdd_default_pin: cam-avdd-aux-default-pins {
> +		pins = "gpio14";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +
> +	cam_front_reset_default_pin: cam-front-reset-default-pins {
> +		pins = "gpio21";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};

This addition fails dtbs_check

Konrad
