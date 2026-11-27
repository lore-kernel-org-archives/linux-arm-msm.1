Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795769535;
	b=CsOfAwo/H+nrjaeUa5bIsTBSFveTKcM3hWVlWDY8qgQG6zxcHkF+qx4G+gz+/7tb3+nb
	 26mUQ6e3XB5aUf4CxZzmIuM2CV08dHCCZKeZ6KBELzComhQBPSm/xys/SQOoZjMZw1XgY
	 6L43CHUK6LBdHWzkmTiTP4aycAA/GYZxo+dM+Mwd2/QwQnFwljBmLfie1edWkPhV2fftt
	 fxIglTZQ1qzeuF9tYJgUKnp2/341EY8JnBZ1zyPLlbpr24uA+r5hPvcWLqy578FGVucnw
	 W4HTNIjSBOOqz3n71xcATdkVeaHZV4X4N9oWWMYISG6lsLIYfGihfhGX6/6/wE/Pipw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795769535;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=bf7mXKMlC17WwCEUPjDtaWn5doXh6SdMr0C4yldwOlE=;
	b=Exn0g805SR5rqf0dT4HiPP05jU0dfp9rQ66PRhA0l7+/HLDzZhnTaXfzWixA2vsRZNiN
	 9twMlU5nsAZKZ2UwFd9a30y265jnd/RrP5OydN3V/Z314xODeigXSIyWqSVf5a/hsaS5K
	 sn9BHJBM6lZ9JPMn30GM0YicmTo26oKQsDcZNVvT+TLoPvTyMRs9/if469jv9R0q8i0Iy
	 zfFPwIxX6fTLuKW9W4hugS2HtAO3JU9fv9l0KMCOsJiTGMS1BY82OcANrTap5ilwZ+0Cb
	 VyM4M5kYycfdjBxY53sECfULaTZoLAGKxUzxnhTZWPxYUtaDvmgmhLZ303iI9+onF4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fSjcd+rb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="ksvd/Mk+";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F8FF606A31C
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 08:52:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F8FF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fSjcd+rb;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ksvd/Mk+
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR7Gj052421555
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 08:52:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bf7mXKMlC17WwCEUPjDtaWn5doXh6SdMr0C4yldwOlE=; b=fSjcd+rb/O9U4FCK
	0Wn0CsYWgmd1LO59RLxKF8jetafFya742j5JB1EG5PNImzpw74sYWSxEDWSFL3Nc
	MGcnYNTBr8J6zgRoGbAs4bE+dlRQQPncobYN+jt06VGyIDBG/7h+FCkL7F9uOtNt
	QXHDkWLxS4w9Qgp2cF0rz5fWoIL0IjVgRE60fxVEVuY4DfsgIjXsIToiiFYGDGq6
	9XfP/VY1dGo999gluq7nIt6izHPJwHHKgF6+P3UjYn84X3qhBJU+WMB7Okxm5EwN
	Se4F4Fmyy50HhrGMXZ+KXJx4vZgcFMMTG675slXQYbvFo1UhnpdMOI1BK4fkI32b
	BZAZRw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6rf92nn9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 08:52:14 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-949b0d3232fso1078590085a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 00:52:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795769533; x=1796374333; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bf7mXKMlC17WwCEUPjDtaWn5doXh6SdMr0C4yldwOlE=;
        b=ksvd/Mk+UHfYQaLQb9m+tLIjBhnHRVQsnhCYRRmpY40qlwoFpgN7Iyg1ybwpCGdWtu
         2JEIvkc2hp38g9JMT80ymGBVZTyXOjjvBuAb+Te1Yp7JkT9KU9WhBBpwOVA9RtbZkg1R
         LUfwdjC5fjH0iZbRa2RVTV6ndF+CsV94VA6JNkXQObGiG5G5A2K6xhLS/6ZVpmpUASwN
         y1T0vOp/JzYXR1cNprMIieVxTj9DEukowsudhU2iC10i6ZrPpBEdDOTAyHoH3IrrXpVV
         1DUSZq0L8pFXiutwKGX+2hyrEddHEaL32nItatU092R6ofoZxqTOdldbVzra5Hcu4hAw
         xVKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795769533; x=1796374333;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bf7mXKMlC17WwCEUPjDtaWn5doXh6SdMr0C4yldwOlE=;
        b=CcTmX4niBhwS4THTUo6jy3/p0exFfl1tlLGDIEA3nPUzZ43T1YVmoMyaUtt99+oe3M
         qeijGZkjFd3plo5i42wW+t2TkV+F6pd9vpcoaIlvN88ICrfhu9dFa32E5dArVFg9i6T8
         mLuiEeBP0IrgYHLinQh+ePQ4guxz+EsyO2/Cj1aIyJTIVLh40uezsldMKttPS8eDTtg2
         Z+lF3ZWHysBOF6Nj5bmrEPSjRMzzXMKHq350B8aQHturysW2NDJ/iMOBlY2JYGqno+27
         tVUYn/c2WX5fXLyXndt9KQG8ZeaAEKk0Ut3xCaJbj+j3FVToGkCKats6yGRaHkhdXIav
         1fJQ==
X-Forwarded-Encrypted: i=1; AL+hErHrNGST9pjvWMBQfFllMQogR6rNwcgqCqDMEwwDFS7XcOx9dyy5aS9puJF3LJcfmvg1EjgMXQ0B8NDCuvhe@vger.kernel.org
X-Gm-Message-State: APuU4Z913S5bccMvw2lWRAEfp2NQVdD8dmubALdjlbKchGkEUOfns2C3
	ZDa34qZy+vTwg3oTHk5Mi8qdkeWa2F7xhVX61rpgrQjdIwje8hDEGZNMHrhOF0ZbUkgQbjLCj10
	FBgmH9lYmbaGpWMV+1+T9Srv8X3F/QJ1al59qgaw5Ih2FHnUiqeuov+01h9QSEtcHZfbU
X-Gm-Gg: AZFdTZcxfVOH1USCOmssUJEPpemvNheY4EhdBdlHzaqqZ5K7le5rDB6W2tu8XxnseeR
	vcYAuSjpZhGwlI2Radi8OWg4fZ2QNOfl8YsjIirVmMGy/1K3E+mKfuRdOnx7k25/Xnw5ZGqX35d
	bhcmDamxVyAdRnCU+4M6JH2eRl7kU0f2itLOB9SttyYPDkLci3oEV3KQR2XhR2GOkuHll/nkkfq
	ZEMYPyAz0EBU5SWo3NCfY3l840wps/CR0sDaWhIsTUIG9ggektVu1PJLSOMWocJ1Nqge184HeXA
	xwoIjQcJbfW8ASDe6dWMjhZIb6FRBDFCd67RCUJZQOCnz8y+9wXjIzNHZwF8OppqTqi5HnsS2Pf
	GSFeM5hzKHZOzgZhoNGHXBJXPfK7WC9gpq3swkfLW1/XT0D3a74UHPsedTJbWO2TQ3XL5oInAFJ
	Mgvw==
X-Received: by 2002:a05:620a:2a12:b0:949:7497:7c1c with SMTP id af79cd13be357-949bab5ae05mr3991120685a.60.1795769533262;
        Fri, 27 Nov 2026 00:52:13 -0800 (PST)
X-Received: by 2002:a05:620a:2a12:b0:949:7497:7c1c with SMTP id af79cd13be357-949bab5ae05mr3991117785a.60.1795769532775;
        Fri, 27 Nov 2026 00:52:12 -0800 (PST)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4b34e9c3ffesm30247576f8f.19.2026.11.27.00.52.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 00:52:12 -0800 (PST)
Message-ID: <6211f2a2-f313-48cc-99c8-157a65736350@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 08:52:11 +0000
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
Subject: Re: [PATCH] ASoC: qcom: sm8250: Add SM8350 sound card
To: me@fromdisposition.org, Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261127-sm8350-sndcard-v1-1-50cbf3db3cb0@fromdisposition.org>
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261127-sm8350-sndcard-v1-1-50cbf3db3cb0@fromdisposition.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: -vgz8SeeS0sY_Fx_-wj48W53_E93BUwW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAzNSBTYWx0ZWRfXxMXloc/qMY7V
 P45f2b6+ebPzsTGVAeNEwIgJt8LkV9+4amzlQFF62loVQyerzO3tfnHfOvOxfIEfNMSQSzpk2Hd
 KSDrQxkna/uBWMOMqN0iDSRPNACitC76yVUh/kFm82SlaVjvqEw6y+1zVZQyh63o04pZ63hCLhM
 zGzpHlwx4Y+nhlYyQmyqRggrHyIpLZIcxJm9N07HroJ+OiHAceuENFDB8CPyEQnOI+QaBwwakp4
 nadGNS6Q95/xq7wBl6voK3h19WhVbDa+xgYpDO4tlSRrD5EvQwQHHcj95lpHZhTShwqWpk/KV6D
 j3hqxRUwwwj45ekEf2M/lREfNElPsnR+Z7VXMHj0uCU7JSE2CkCLI0+VHvx+82ac9YURKlQZwhm
 GYdbN1nTdwurKQIPOJAVwRYqfXtnU54YzArcNJo+6A6gZOD0E93l00H+M8TqyeIsQ5Ukd0HGYKF
 i2yKEx1YN+9atmJrK1w==
X-Authority-Analysis: v=2.4 cv=cpkOAF4i c=1 sm=1 tr=0 ts=6b0944be cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=Tt5JBQAfAAAA:8 a=EUspDBNiAAAA:8 a=OV9TyUFxCiMX8QcW4tkA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=kpHMOrJS8sLNr5ru0mYA:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAzNSBTYWx0ZWRfX2vS0A15mQuWl
 7rQXnChg+Jdm6RDs+6ErK5xV31d2cX6tEnkLD4brBuDE5nasOMENiNxm6HOgBbYNtpnnJv2t8tP
 DZvTC92aYfYnkZoPFvBUr7cKVlA2PJA=
X-Proofpoint-GUID: -vgz8SeeS0sY_Fx_-wj48W53_E93BUwW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_01,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 priorityscore=1501 spamscore=0 phishscore=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270035

On 11/27/26 12:49 AM, Demeter Barna via B4 Relay wrote:
> From: Demeter Barna <me@fromdisposition.org>
> 
> Give the SM8350 sound card its own driver name, so UCM files can tell
> it from SM8250.
> 
> Signed-off-by: Demeter Barna <me@fromdisposition.org>
> ---
> The qcom,sm8350-sndcard binding this matches is already in for-7.5
> (a5b5d062b40c).
> ---
>  sound/soc/qcom/sm8250.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
> index d0015e5f5..ba0aaf428 100644
> --- a/sound/soc/qcom/sm8250.c
> +++ b/sound/soc/qcom/sm8250.c
> @@ -231,6 +231,7 @@ static const struct of_device_id snd_sm8250_dt_match[] = {
>  	{ .compatible = "qcom,qrb5165-rb5-sndcard", .data = "sm8250" },
>  	{ .compatible = "qcom,sdm660-sndcard", .data = "sdm660" },
>  	{ .compatible = "qcom,sm8250-sndcard", .data = "sm8250" },
> +	{ .compatible = "qcom,sm8350-sndcard", .data = "sm8350" },

Reviewed-by: Srinivas Kandagatla<srinivas.kandagatla@oss.qualcomm.com>

--Srini
>  	{}
>  };
>  
> 
> ---
> base-commit: 0fe506c81cc421509660163da72dac79adfb959a
> change-id: 20261127-sm8350-sndcard-f2367f4568d2
> 
> Best regards,
> --  
> Demeter Barna <me@fromdisposition.org>
> 
> 
> 

