Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B4A742AF97
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 11:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785238884; cv=none; b=m1WmkBl0dyrSzYspq0HY5ht7J0FLGc9MFLVOHMVWJDmwdU/lifeGvw2kPf4axPP1FM8iG56x48c4c4BWY0CJdy4ay1EdletGR0twgacEAhhbc3QTsy+uuOx94hJYcwKuhXvNgC6xYHNCJ7BLP9WvaPF/Cv4aVLNG3RBXrmBVGL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785238884; c=relaxed/simple;
	bh=OT2U5Q2c9q6HMp4kMFq2rSEyqIMynlP2ctX7MuoUtY0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Yq0AUhcfYqGP/0FB/qzPY2EpHlejlIjruo7AiLiwAZsko/jJ7lCO9WdMmSilA4xkjxV+WULDP3+Qf2PnY2np+GDrdaKvk0eFh8tWrjGBJ/PqFlt20MoOSXntUiggjX6SZeX5FUr7+dxhvx+bSMQOio7MYyuTlwLAK3sqDllsTQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fmLDQxpl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PzHhvIB1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fmLDQxpl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PzHhvIB1"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66SBHANe2121225
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 11:41:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UMR7gg44y/TvQkxJ51qp3xdXbug60H7pn+vHkh3PgPQ=; b=fmLDQxplM1lOU5zE
	XQqGH9I3Os2iAbxXzBzfd250Ih8BXCJiqFV6NqEZd0lF3FTR8u3Xu+HtDAZ6W6zT
	I9ZaM8+C23wrerenRSKske4iZzjbVqJMPC4jlfzRWHAxKEcUFevKyoP9IyHyT7yx
	56r2buP+WBuLA6dqP8LK6yW9rOSadfLA9c7hOw9VzOlVCyowwhg9YQfD+GxZi+LG
	gGrzfhz1F5/If37aO0+c44+wgo1oL1h14qOrRBgpvqqtxlyj22TlCQ8K1cAfZx30
	Vk51cevpJ8GjT2564C0y1Bigrdc7EruYlV16ZhG7/6LuG/7DqZMKmMB7P44jVnfe
	4rDhBw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fppttsbtu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 11:41:18 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-520a00c7a03so68690981cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 04:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785238877; x=1785843677; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UMR7gg44y/TvQkxJ51qp3xdXbug60H7pn+vHkh3PgPQ=;
        b=PzHhvIB1dKcjyjKB5/NrF2iUxCYtVxf3aQUmSYII9FjPKOlXHJxV7VXlZ9f9tm87g9
         VzhaVYlCBXQT/KRpkLuCrsDIWKJuzbbHa6p8viRGl7y+/rKnE15fNX04ks5ZJ3sucAfA
         SBdKc16C0+ckvZ3UrvrSL4qnxXV/MzfR8fOCj+HxS4m1QnHp95dk4qYjsMraeiPIwQ5y
         ePSqATa979nknxthKEZzn1wgS9aZ8zhEX3VYU9ONXwMssEGW/jM4UauD52qYzIN2C3Vo
         zp2CRGxPP5/YtapTOoMXOrneIshY1ftTY9a9RUbXZxkQNRsL6U4abKR0R6fKGgc+pbDQ
         QB/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785238877; x=1785843677;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UMR7gg44y/TvQkxJ51qp3xdXbug60H7pn+vHkh3PgPQ=;
        b=HsiW69XPrnGR3JOmPh1oHhonjItGMS4ddm43BI3eB7qrbiuBJ+P2obZlZ7XX7jMiqx
         O9PCy0Y2rCQWZOy0LVVIlc2kypyS1nUg6Gg2QJzOUw+ySraYEvDL6vw8crq5r/+0W5ka
         MjFoGaoPfXvHEL8LtMHP7SdDP2zKePfwZeNQsUMRnrhnggzYQ7exy9JaGFRS/iGzlGmC
         hAxofWxWNkTfwPJ20XZoTgCS/6us2qG9yTlrPwcBQJ9MPFpmhDnrRVtRTaDy/j0gfbTL
         ynyfjkENiG7OTl6DXHhv4DGGUUCzXWzRQfIwt4pmikqh1SmVJYoJXO3/FsQNIeNZBWaN
         HtJg==
X-Forwarded-Encrypted: i=1; AHgh+RrXk6bfTEuyb+vqNxOHSed6NDFym4EnuoIWKOeHoaB9EH5No1WjU2DvCtR1C5gIDAG9Zzol3EFnsZOnPP68@vger.kernel.org
X-Gm-Message-State: AOJu0YzJ3HC+LBNK6frf79/2Df/9UbFtrm+Ldkj/prlEJIiOyvU7b+eE
	WNjCyo1NxbSriOYVBOm5XsCfCOr9hC8nrIdq3P9PKowcBfPL9YgGQ2YdWiHtmShktYUqg4KfGdp
	QifYSg3bPt1XSkrusOjEQcMBVWbynTrT7bajb6ReHBC5Rm5KrO95LBeWN0RdUuC7oZMYZIuw4nx
	pf
X-Gm-Gg: AR+sD13+Ei44BoA5EbatSdD5GPQ+sE0BPKABe2QF4lmYnBleNHHSyGBVCeYMHz3clU0
	taekrrq8Q9jhyhGuDzbcfJG/JGIHsVShkX/0dCSisyfcW6ZrRbT4RqYXwPvYT8vg45SDC33tQE4
	6vxPwm0PIBjHsW6JrrAHCqdVT3Z0AF67b6v0QEmNgS8ML9l39nl2KNT5IvfDCtKMOt56lzIp/JO
	0W4n+kHMPvK0mvaz+5J57EeZfzfW17VRkSnXg7vaa7t7RvgDZyEeVuOuoTRd7D+O/0KO05H7eaP
	M2d7GBVYOaz1qxveC9iCArlnqvSLpq9duHIxiz6b9td1Ul5kDtM8bPvWISeHxHCnassXGRKodSB
	NGp7pJ9r3BOiDKf1oXPREGbrPTfM=
X-Received: by 2002:ac8:5704:0:b0:51c:7b11:419f with SMTP id d75a77b69052e-529d7252c4dmr15343981cf.76.1785238877486;
        Tue, 28 Jul 2026 04:41:17 -0700 (PDT)
X-Received: by 2002:ac8:5704:0:b0:51c:7b11:419f with SMTP id d75a77b69052e-529d7252c4dmr15343601cf.76.1785238877018;
        Tue, 28 Jul 2026 04:41:17 -0700 (PDT)
Received: from [192.168.68.112] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-69fb5843580sm3879325a12.25.2026.07.28.04.41.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2026 04:41:15 -0700 (PDT)
Message-ID: <543b5e46-9b11-4749-aa57-2839866773e6@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 12:41:14 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] soundwire: qcom: set the bus mclk_freq property
To: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
        Vinod Koul <vkoul@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Luca Weiss <luca.weiss@fairphone.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260727162741.68081-1-jorijnvdgraaf@catcrafts.net>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260727162741.68081-1-jorijnvdgraaf@catcrafts.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDEwMyBTYWx0ZWRfXwjBFPjRnNHj7
 kx9b4atuETMtA3RyMYIREsAppc03wuj2jLiRdRb6Bt7vyXd1IeF3d4/QYideqwZ3PlNa3MLBtg0
 M7ukk65MWGureJC6UGQWV9j6cL4zOR4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDEwMyBTYWx0ZWRfX+TaH0AH2E6ph
 CFwOq594zj02eLbb0OrSzf4Q/qRA4O7IzOpOaA90Xk9hHYxcRQSrKZD9sq26/9dBRhAKB6dYWBd
 9C3WpXvmq4QA6k+P49cVxjOwicvjmU8STt/ojDaQWOZNj1VGXVNJXi9oVxOlISxO3hy+NKRCTCD
 cXNy+nchIQ75F9VP93wKv70Ijv9njvie/7BJaBSXO9eC7i2EUo8lMN+4T5a4Lzms2svMhE8bqja
 AEmGAWt48z8KjQwU/UlU9UcAP+RFDYJukvQwTsZpF2M5MNpri82Y6Reoe8Bd72HYaT/EYyiktwb
 FnUcBj+oAvUAeAHBIcA8PgBJ3j2wheRIUrWyQ6wmiTNZ6qCmtfd/lxLvQiaVickUEbhD60RcSXq
 FUt7y4q3CFCxoyPils2DbWtWzHJlMMe7/S/54s5UY0I/N/xZex1A23hvD+LvSUeYnp4lz64J4WN
 ABlOkiFr8B6E+YVJVOw==
X-Authority-Analysis: v=2.4 cv=aa1RWxot c=1 sm=1 tr=0 ts=6a68955e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=GYSh3LzNAAAA:8 a=EUspDBNiAAAA:8 a=h_oqePV9Fa_cmV4Db1gA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=lWcdFasyL5yHfcDTNXXo:22
X-Proofpoint-GUID: 7jb7mrOn-9GZsOnky4I5xgFSsVPGvw4B
X-Proofpoint-ORIG-GUID: 7jb7mrOn-9GZsOnky4I5xgFSsVPGvw4B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_03,2026-07-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 adultscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280103

On 7/27/26 5:27 PM, Jorijn van der Graaf wrote:
> sdw_slave_get_scale_index() needs bus->prop.mclk_freq to compute the
> SCP bus-clock base and scale register values, and fails with "no bus
> MCLK" when it is unset. The qcom controller never set it, so slave
> initialization cannot program the clock registers on this bus: it
> would fail outright for an SDCA-class slave, and a slave driver
> declaring clock_reg_supported hits the same error. The pending WCD9378
> codec driver hand-rolls these writes as a workaround, following its
> downstream counterpart.
> 
> Report the controller clock, letting the core derive the same values
> the hand-rolled writes program: 19.2 MHz base and the scale matching
> the bus clock (half the double rate).
> 
> Assisted-by: Claude:claude-fable-5
> Signed-off-by: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>
> ---
Tested-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

--srini

> This is the soundwire side of the plan from the WCD9378 v1 review
> discussion [1]; the codec's v2 will set prop.clock_reg_supported and
> delete its hand-rolled base/scale writes, relying on this property.
> Patch 2 is the helper extension requested in that thread.
> 
> Validated on the Fairphone 6 (SM7635, WCD9378): with the hand-rolled
> writes deleted, the core reports "Configured bus base 1, scale 2,
> mclk 19200000, curr_freq 9600000" for both slaves at enumeration, the
> codec's SDCA sequencer powers up on those values, and capture works,
> across reboots.
> 
> No behavior change for existing devices: without a class_id or
> clock_reg_supported, sdw_slave_set_frequency() returns before reading
> mclk_freq.
> 
> [1] https://lore.kernel.org/all/20260707151329.67858-1-jorijnvdgraaf@catcrafts.net/
> 
>  drivers/soundwire/qcom.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> index 3562802f4204..55678a30cd4a 100644
> --- a/drivers/soundwire/qcom.c
> +++ b/drivers/soundwire/qcom.c
> @@ -1633,6 +1633,7 @@ static int qcom_swrm_probe(struct platform_device *pdev)
>  
>  	prop = &ctrl->bus.prop;
>  	prop->max_clk_freq = DEFAULT_CLK_FREQ;
> +	prop->mclk_freq = DEFAULT_CLK_FREQ;
>  	prop->num_clk_gears = 0;
>  	prop->num_clk_freq = MAX_FREQ_NUM;
>  	prop->clk_freq = &qcom_swrm_freq_tbl[0];
> 
> base-commit: 6409292ab5f7d1a60a6f8948bd6dcd8633c36dfe

