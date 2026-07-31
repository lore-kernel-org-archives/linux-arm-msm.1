Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11B724279EE
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 14:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785507657; cv=none; b=RUicAHSbrbZ8IV1doRbGwK1/Y8GFZBNaVWTPCiw4eLirZEr7c+d6pji8P+/2TeGyWW9mCdus0imSQX15EIefyuA2P/hp2MsGBkvm3NgAjwm+SnenZPDZw683AhUoS6SxeVwYlnrnpgdvqvcG3fdmBSMYhZbv+/3+sWYdqQyI5xU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785507657; c=relaxed/simple;
	bh=QQbrQC64DOKFrs81hP2K6iVbP4JhcL9Ejso6A8dmgtg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=te/wSR4Iwj84G3gNrrnTZ0fjnPnHOpphFiI1O5oUxV0ySfm7+5T0WPKfvxi+pip3ndjZu266Awctx0zFr+CL+OhDd+hNKfcMAUofm7bS9Sz3xtiPBkDY0F/OoV2cuJKCURUNL0tf9uTJxOCEwa629kkzKnmU/FR7EtVuZ7BLu1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gRcolZea; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iaYBA2X7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gRcolZea";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iaYBA2X7"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VC9wBW4154445
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 14:20:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FjpPkOD7u5iityBLQ910RqkrcCltlUnYQsWx6dR7ODA=; b=gRcolZeaIYazIXsq
	TCw97cGNBVdYWyJbPFliK0KBnPmUt2eILaOnkA1CadKuCGqtMBD+GboVYzm/15ke
	dTglQeRB88EgdudWx9bwwnXFJg/g6zx/TUcFx9177KhVBd4AtrV+Rj0mBaDQ9piM
	ugJj2zpzhame7/0u01kT2dw9gkgDt57BhltwUBkHO3qmEQtL5GmQ8SE+ey9KmxyJ
	kjGBL7PxZVMBoSv9XDtcybLXfj1tT45UiXy/vvWN9AFjGjxXXV/zwlqUB73Eq8fR
	YV0j5uegJiWLLp8mrLjnkHzBNlp7nKmsk3UKrMIXjp6ggsjYtcmDL2Pkl+i7ZQpI
	4+jvkA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frufkgjb1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 14:20:55 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-737ddaf8c57so35605137.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 07:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785507654; x=1786112454; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FjpPkOD7u5iityBLQ910RqkrcCltlUnYQsWx6dR7ODA=;
        b=iaYBA2X7Z9mX2fbIQpBttWq/y/xGUKRJpY2Gr3Imy0oaqTk0ak6VBKd7LwpmLCb2lc
         Z7y4lqXmb/59CVWyNDv78DZZQAxjzdalGTlxl3XPIzjSa4/Q0nb5Na9SksyRMKsA9h2o
         FDcTf/JZ42aoDGJkEJLlnWSEatTZ1DlvlDdpJvVNV2mwVKXPPkbl8zK/hGZpUZSyv8Yj
         bD70SiJbCGegz2HhrYblwuFAKyy0WZxRJE2OBW9uVZZHbCGxJLF2dgEkfFoGlV9E9IbB
         Bo1FR7ou6vPlwxGtmeR5qTuZI2p6Dt7COUS9OyEtNygzuXiHQ2w70rNAbDwMyfsZBmPm
         joDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785507654; x=1786112454;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FjpPkOD7u5iityBLQ910RqkrcCltlUnYQsWx6dR7ODA=;
        b=GS2bjADsnAzmKhpGNk7iyBycHGqKWzvlKiGjeLvza16X6QTUWTG6Sx3eQzHazwdeYO
         pwxMaO0AOPzOhNWTO2veuWg1w0ujl8YilAGNnwX+pAU/wwAtNE+PliiYK0qfhiMZocms
         7PczXm5EQT8OA6i77rJdQD/ZKI67+0uPXTvjZQ5U7IXavgjMmvpv1zbrXMONGx360tq+
         8f7nsL3yo7VP8z4YhDFCIcxDtFkIXCqsp6q2s0rS8gMlIo/75LqRv+NsZ5UXlJE3/jXc
         20Tl2FlGUaDlOnCzWbF68j7D79zYn6sUoj0VHzEv6/+WsZE9ftNxVAVTkAGLSgBGibhr
         yLoQ==
X-Forwarded-Encrypted: i=1; AHgh+RoYWc3+XiGBskmjHLAEH9TNnm7vvBBIEUclGPZX+uO/QGUxgPID3kvJflZUREQAuZAbccepdfVbKdLLsBQm@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7FWuIBPUVpAtXn6Yi19Cdt7HQtAD8nHuLBLjdTXnfUmtLtzUm
	dtPH7FY3RchQUbbGsIBRiaTIaW6A52wlxNLR0sKjVHdKGS7iX9dmoaqNBgT7paIZSF0fHyrsIsi
	36UKy+GTz6ukJdYcEdBM+XFDl3iCDNYoUYWk06bI/0FhtgO1AbHcmCWApw1V7s8JzVifS
X-Gm-Gg: AR+sD10a8tdoDb2/0OCLjZZREV5PDOWADTpweRsJAhDBEuWJCjswiuiRLyD7cNf9r+s
	s7Fwhmnw/MtzYubpurzBsHa84dnwhAa4qkyImowc8LgC2PdN+WxbZT9evw8yxSOLSKmG1LrcMsy
	Jb1W8691uHgJ+Yj6oIqTEtwRrcofDe+frb39xl/HOJCSZAZAVZhNzgOaYQoQaGQy2VRqwOlFhMV
	tS65eX+L/TGaaORafexV6PGueCKMu2uXxesmtY0nkhTMjR19uvVCMiqpWlH3yqo3jhkcwdRsOHs
	KztQ3DJAs4tJE/BL0sa9rsOTEnPek67ExUs5P1gJA46RaRJ/qt4LoGcT5Wp1E1lZubiYZIuILzr
	M4awgkE4EpkzfNl4qSAR4PrBq
X-Received: by 2002:a05:6102:5249:b0:745:17b0:10cc with SMTP id ada2fe7eead31-75b2498305bmr147234137.4.1785507654214;
        Fri, 31 Jul 2026 07:20:54 -0700 (PDT)
X-Received: by 2002:a05:6102:5249:b0:745:17b0:10cc with SMTP id ada2fe7eead31-75b2498305bmr147200137.4.1785507653674;
        Fri, 31 Jul 2026 07:20:53 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a09c6615a1sm1609212a12.27.2026.07.31.07.20.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 07:20:52 -0700 (PDT)
Message-ID: <7a0c4a70-b838-4c7c-9f16-d394ffef95ba@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 16:20:50 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] leds: rgb: leds-qcom-lpg: Add PWM frequency mode support
To: Fenglin Wu <fenglin.wu@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>
Cc: David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260729-lpg-pwm-fm-support-v1-1-16d3c72a9921@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260729-lpg-pwm-fm-support-v1-1-16d3c72a9921@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDEwOSBTYWx0ZWRfX/7nEGXPiJu1o
 08C4ZFANKZ4ACcyAwQEA6DfNFAvJIVPUbTQMy2wUVNSYsJCL62eZKQHt/kxfEl+uwXnvpvnceJC
 P5CRlaz9/14/6sde2bJt+JcF7GXVRis=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDEwOSBTYWx0ZWRfX4TFr2Ogyl5Bi
 JkvJ7tlsnoFeUgghsPs4udB48prsZOYXij/cbZp2uQ6ARb1FwhAQro/ZyCYVJkdlVp7TGLsI+X7
 5gOOyzeeAdBW/ENrVpDiUUr7T9416xBt2D0QxyO3FOphWWklPqfoo7f3zyQWaEhY+L7fpQv4Lhn
 2MjiJbx2w6GgIvLobUyFNS2REPgdYCPJR0wj+WOBgc1ApSmA3Nstwe/+3NWj5/aeidVVrZAgt1U
 RhBejHjtnZsA2RJEQbGODnZbn3Q6x9W+acdr8XhhFFZY0Paf+XYLnXGNeGAnz5ZZwElUp4cSmu6
 qrL0y7no7OuBu9TGwGdWXVWFn6nS+SiHzQwEyDZfi9oPHF4uBMwziGOYgjQv5i/+eE6xu6YZ4xz
 71Xjpk3uNYq6A7V97z2pV2hAKwOk9tXgIZ+tIhkTkK+v4QJw6hJhgOm9i3qRABe1sc3AHaQpVlI
 YO2qA5BXivPibZuzTkw==
X-Proofpoint-GUID: 9rfxGxabdtvyuGl4thsKorXuLld_ALan
X-Authority-Analysis: v=2.4 cv=BpOtB4X5 c=1 sm=1 tr=0 ts=6a6caf47 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=AUv8OMIDIaVCD8xAqLQA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: 9rfxGxabdtvyuGl4thsKorXuLld_ALan
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_04,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0 lowpriorityscore=0
 impostorscore=0 phishscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310109

On 7/29/26 11:48 AM, Fenglin Wu wrote:
> Certain PWM channels on a PMIC (e.g. PM8350C PWM4) support a Frequency
> Mode (FM) that can generate waveforms with more frequency points than
> the standard LPG PWM mode. The trade-off is that the duty cycle can
> only be fixed at 50%. Add the FM support. When the PWM channel is
> requested to set a duty cycle to exactly 50%, use FM mode by default
> as it provides a finer-grained frequency resolution in that case.
> 
> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> ---

[...]

> +	for (clk = 1; clk < clk_len; clk++) {
> +		last_err = U64_MAX;
> +
> +		for (exp = 0; exp <= LPG_MAX_M; exp++) {
> +			/* Calculate pwm_value_lsb for this (clk, exp) pair */
> +			lsb_tmp = period_ns;
> +			lsb_tmp = div64_u64(lsb_tmp, clk_period_arr[clk]);
> +			lsb_tmp >>= (exp + 1);
> +
> +			if (lsb_tmp == 0 || lsb_tmp - 1 > U8_MAX)
> +				continue;
> +
> +			lsb = lsb_tmp - 1;
> +
> +			period_actual = (u64)(lsb + 1);

Did you mean `(u64)(lsb) + 1` here?

[...]

> +	/* Calculate actual period for reference */
> +	period_actual = (u64)(best_lsb + 1);

And here too?

In general, I think there's nothing that prevents you from
turning all of these variables into u64s

[...]


>  		regmap_read(lpg->map, chan->base + LPG_SUBTYPE_REG, &chan->subtype);
> +		if (data->channels[i].fm_capable) {
> +			ret = regmap_read(lpg->map, chan->base + PWM_STATUS1_REG, &status);
> +			if (ret < 0)
> +				return ret;
> +
> +			chan->fm_capable = !!(status & PWM_FM_PRESENT);

Can we read this register blindly by chance and drop the match data?

Konrad
