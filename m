Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D58F51C75F9
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 09:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787563499; cv=none; b=hH4JyYgeDJzjymc72vn21gafL+PU8qn4futtDvW4ejXa9H8jHLicFi1eH6A76yzJHdVnFnSfHCWTioGvar6f5J103ZJOuOAQn3n2aNPvPQ760jeIMhEcsT+n0PZy5WqxpZnBkPn8zV667QN8/ElrkPFx2FmXHdtFXfCSmnRUiRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787563499; c=relaxed/simple;
	bh=Y4EgcjluYnSRJLSjmvyLzbSd0FfjBnqIP95LJDK8Xd0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T0Apj7C5l/+bMQQPoNXjfdRmKRxiTgkovOudeggEDTWyCa+LsbNw9xcJQ1/69s5DRUk2XlRZ5SGRns1TxjlqRVMTwetPQpLCTZ8kZOLZRsc22cMjcQ5h/C0qeddYxKt3YECo0NPSQkCrGrUPqIUH2zBozEFp+H4TBZIeZ28J9dI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mm5hBv2H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hjrrvFhT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mm5hBv2H";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hjrrvFhT"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O99P2g3575690
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 09:24:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PRh437KQ7ulwK7lu5Bc/hF/l6rZw1vWutipg0275TjE=; b=Mm5hBv2Hu29EiFSQ
	aD+o9lx0dpXmXug1FTo+YGJpikM6UujbnAVDQ46BWskqfSeNudMUrDrDSwk0DKJV
	gLg9W/BXSZSjnvNbkbscetWBaGHGCviydf+VbSiHUbtJEY6VtK4I0PIRR4peRvQn
	Kfzv9WLU9ZMsQeo/6rnXvS8eh0EHDebWFZfGdLiZQhbzK2zH4pmRmvoaZUi+kNTv
	M4MSzObS3U0GhpnS5RtC8iJSKYHkWLEihOUHiYL6msER1EGQ4TS3oZo6s7Az2v0f
	GM7+8O0pCPLYw28KSEMVZAu7JhaBIO6sJhSULTkXxZkGt8osjBL9XXvAUXwMEYrV
	5oG7tQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g88jpj059-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 09:24:56 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52d57d17d6cso6914371cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 02:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787563495; x=1788168295; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PRh437KQ7ulwK7lu5Bc/hF/l6rZw1vWutipg0275TjE=;
        b=hjrrvFhTBGKN9jQYCMZh5lAal/2qtZ8C7t99HYRIKeoxRjr+YdruAg7XlEv9NTH+JW
         nz/O2qj0NxIU/5hvG1Ba344fTnTZ+IyxWdSLGAY999zxgk4IvNiIYANaCUZwEUU8lmHy
         /n/4PTt4UfLbMakkmMlx+YjitABR2nJStxoAje/aStaNdjGg4FWP3a4oL5vnVxArymxm
         f5cAGLgPozw56yOyaqndDfa4lCfNl71WAASsuCvAXYzvoBycS+ZCsf9THXjC4+nDKgNo
         uIteSn4R1wwkKWk+0HDKO6pLPBPlc4pzagzDTlMs4h6O0v5gb/4MM07bTiIaH7NkgYmL
         4TkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787563495; x=1788168295;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PRh437KQ7ulwK7lu5Bc/hF/l6rZw1vWutipg0275TjE=;
        b=rdHTnFdo5ZNJk9PiPBxiKLoWhuafIKfTPQqhctxsvIfQhvwVs8S/fUowRX0BTe9xab
         172LyVkUPkDLWcwTrVen1lkryKZ8joIliutmErMKNpnOg2xXDFl2byvzkirYK9OjCVmF
         RdKbnUU+NY4NQzc/cFTUrRYKZOsPdc8RGiS/6waD1fMz4l8SO+H5VQtaNWYkqwaOwqw3
         jAFqQ/a5S+FOq5baVdv+7jYigdO6WSk83IrnuMDy3C+Beks2x7pf38FWSTo2R9OjMMR7
         pauXnU6usgwrlraKlnFx9v19SclLXElKMgaqmtWZjUgcT03Z5jhvMZc+HSsM1P8LXpPf
         PM7g==
X-Forwarded-Encrypted: i=1; AHgh+RooZHPzOdvv2HyOr8YS5wQloLDNAPda7uJfQ4bf+z8ONFJE1ApwxKJ/QJdNQGKYRmjCGjgFKeYRkafvMX4Z@vger.kernel.org
X-Gm-Message-State: AFuF++lOBC2USUMQU4egvavl1YaKV+l3dksJHbCQObpTrwL4m2IeZha4
	5zOQi7tkwaGVJoKm0QUGnSnzKdW1v+VA2F+G1/y+Alih3L021qgzBs+e6DqEQkUU0rXH/AHvbyT
	yawtDKJYmaO+5CmNDFF0zJF0tzt2VTYaDMwIH0Zb4QooBhKMy1MvbfxInKF1y7ac7aK1f
X-Gm-Gg: AR+sD134hXLY7lwefvJlFqpB8yrFDiKg6TTkjVWl60rZnOza4fSCG/UZiIZVDxsJKv6
	BYsfnuifYhc9h0b1NojFy1yffspY3AhBeN7tSbIf7E52ZxO1b4/DAs0R4VhL16PrKHH8RfsK5Ye
	zmCZUhlP4VfcUmNP1odRU7FcOqUJOT9uNJnlfGb7iYCPOXArwUAPe3n8Hn2CMtjCCF1ASoBcZQA
	tendb1lh12YHBIHREhAA7Rk16LL/sXxb3voH6HQVWWuFyeYkPiaIWJJVDvn25PE/WQJo2ePuskN
	G0coQBfbV9iQgTgsVAaevB4bCqx9Y9akeYhpNkPl7qZDZT8Mn5FVN6nSdB6tT9YnYGV53adzMeL
	jEtKvz5khanq7yJod/dafTa2Y
X-Received: by 2002:ac8:5a95:0:b0:50f:a53b:9d5 with SMTP id d75a77b69052e-52df565735dmr167550731cf.2.1787563494989;
        Mon, 24 Aug 2026 02:24:54 -0700 (PDT)
X-Received: by 2002:ac8:5a95:0:b0:50f:a53b:9d5 with SMTP id d75a77b69052e-52df565735dmr167550501cf.2.1787563494479;
        Mon, 24 Aug 2026 02:24:54 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2496734bfcsm1236377566b.43.2026.08.24.02.24.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 02:24:53 -0700 (PDT)
Message-ID: <30a04183-b8d5-4a6d-8092-6b888a240410@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 11:24:51 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] i2c: qcom-geni: add I2C frequency table for 32 MHz
 firmware-based SEs
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Manikanta Mylavarapu <quic_mmanikan@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260812-ipq5424_i2c_scl_updates-v2-0-e09cd39d01d7@oss.qualcomm.com>
 <20260812-ipq5424_i2c_scl_updates-v2-2-e09cd39d01d7@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260812-ipq5424_i2c_scl_updates-v2-2-e09cd39d01d7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA4MiBTYWx0ZWRfX/a+hbu+FuNEf
 NKC7krj5SLcKdgdyDhY/Dx4V+C87NjBmaAJWh9nLVGdynVbyrsjHarMiQWI+Lw5vmJDJreNm74M
 jAZWgHkbjg6HdcwsnPGWVLipvPcSfRo0alLTMk1SsHBeMXROkOOZ/TzlOxG0yCBu7RHiyyZLHmR
 Bc2hv2+7CDCEjAPReRvpSYYfKrBVnPUPAh9dOVreeYMXlG1lIh03dimP5fMuOXNHGTHWTuaw7NO
 GIYhloYQKDd0Dbgn1nQER1b2gQoILL6oszlnWcLHemAGI00gwtoda9hDD3scY10WtFqjBm1N3Ta
 cj7p7u1C8dkWxEG1keC+J/g4ZsOoDdpbaNGt0tGGwabwNxNf0Htd6l6smsOmB2sT9ztLWHX6W9P
 u3Jm1gjcf6UnLchp2HhNKfWi++V2QD7ENejQ1G+kXHD+9CRNloZL/0Ke9eQZGqugnumGLbWNbSx
 ifv//14j/onlK0o/MQA==
X-Proofpoint-GUID: CIxHOZEJoBZKkf4qoasc1o4BITw7z_bl
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA4MiBTYWx0ZWRfX7CczmVPzGUH9
 aYrI9ftVjoqWqUO3sJte0VWWBB+RubssjI+XaNmvvXBtesnze4Vvsgdp5TpJzS7WEe5JMP9BWyZ
 c4hvaJuWMwvxVTeAb04QDlEXsLAbfHg=
X-Authority-Analysis: v=2.4 cv=Xey5Co55 c=1 sm=1 tr=0 ts=6a8c0de8 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=NH3m5DBF-mqJd7-nbgUA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: CIxHOZEJoBZKkf4qoasc1o4BITw7z_bl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240082

On 8/12/26 10:30 AM, Kathiravan Thirumoorthy wrote:
> On IPQ5424, the I2C controller can operate on both RTL-hardened SEs
> and firmware-based SEs. As documented in commit 506bb2ab0075
> ("i2c: qcom-geni: Support systems with 32MHz serial engine clock"),
> in IPQ5424 SEs use a 32 MHz source clock.
> 
> The existing frequency table does not provide the required SCL timing
> parameters for firmware-based SEs. Add a dedicated frequency table
> using the SCL counter values recommended by the hardware design team
> and select it for firmware-based SEs to achieve the target bus
> frequencies.
> 
> Move geni_i2c_clk_map_idx() from geni_i2c_resources_init() to
> geni_i2c_init() to ensure SE_HW_PARAM_2 is accessed only after the
> required clocks have been enabled.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
>  drivers/i2c/busses/i2c-qcom-geni.c | 25 ++++++++++++++++++-------
>  include/linux/soc/qcom/geni-se.h   |  1 +
>  2 files changed, 19 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> index 00013b41a6f5..15835f10b062 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -187,19 +187,28 @@ static const struct geni_i2c_clk_fld geni_i2c_clk_map_19p2mhz[] = {
>  };
>  
>  /* source_clock = 32 MHz */
> -static const struct geni_i2c_clk_fld geni_i2c_clk_map_32mhz[] = {
> +static const struct geni_i2c_clk_fld geni_i2c_clk_map_32mhz_minicore[] = {
>  	{ I2C_MAX_STANDARD_MODE_FREQ, 12, 9, 10, 26 },
>  	{ I2C_MAX_FAST_MODE_FREQ, 4, 3, 9, 19 },
>  	{ I2C_MAX_FAST_MODE_PLUS_FREQ, 2, 3, 5, 15 },
>  	{}
>  };
>  
> +static const struct geni_i2c_clk_fld geni_i2c_clk_map_32mhz_fwcore[] = {
> +	{ I2C_MAX_STANDARD_MODE_FREQ, 12, 9, 10, 25 },
> +	{ I2C_MAX_FAST_MODE_FREQ, 4, 3, 9, 18 },
> +	{ I2C_MAX_FAST_MODE_PLUS_FREQ, 1, 6, 15, 29 },
> +	{}
> +};

The fwcore one seems to be slightly "stricter" - wouldn't it work
for both of them?

Konrad
