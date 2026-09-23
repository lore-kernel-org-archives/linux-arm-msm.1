Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39DD9352C52
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 05:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790141482; cv=none; b=HPabg6QnKycYe4uWRaNyLSHI0HxxqyJGtbwc9COX4/g5vhy2xkGJdgr/K20BBPNbzwUtVzHHy/fd8inJ/DcDpgFU+bFf6eQXbAqbnqkBLeYWkug2LVms4W1bQx73JzmO2ByEfc82oJ+U+5zfPydg3/5xTJzJSJG0oMaBJz++xRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790141482; c=relaxed/simple;
	bh=qyxPaT9VL3iggKLsNgzLafbVD6NN2QNY/OEteKHN5kA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SeV+nVIoHh0H0eXkvBdGWGMkbMLcxrIvP1YQxhNUIIVYbLM89WW1Qbp8iYNioUMSrYgbFGo6fvRMLOBxHBqKzYGPh9dsZmKuDBKtx7qosEKONpj5eq2rlpy7tMOdrfgoaUklisSxboW0IZaETCISugLFswK2RzfsxFYwWD9k2p8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GwjJS6Lf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hZNKs1vg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GwjJS6Lf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hZNKs1vg"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N3iXhI2728537
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 05:31:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+LrvhrC2M28wUTYTFfBdvCnZV3wVCma94KrYLJhrE84=; b=GwjJS6LfpkFyGPv1
	cSMlzIOb4VZ1n19tY7T4XzY3OS5H3Nqz8tMyJ7nPKQbWcm4FC2c5ayEI/IKRBHm5
	uOGy6XlObK699LQ0l1HXIPRNkflWkZ1u1IFKgtrGBaR4YZYPQDIGggTujWsjwMrZ
	Fxz2NEl61W0/KXGIudcft6cqJnfrjBQQyEfW2Rb+txcHkDU9yIxXuH+d/sYtXOZi
	kWh1qBGLItWRDxZzk8QPXAnKmlNqs77F7nWyiGs1/2qBBJ4CKhQ//pJP9pRudYw1
	LRxaKmCY6gc/gG0/K3kiT/gIwGJcZkp25t4pb9FqKoCpdMQ8QjMy3h2AU+DdBs8S
	645ong==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gux7xtnme-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 05:31:20 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30f1b904861so705761eec.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 22:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790141479; x=1790746279; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+LrvhrC2M28wUTYTFfBdvCnZV3wVCma94KrYLJhrE84=;
        b=hZNKs1vgaTvHP0Upg1lvQ3/MUskyT+XYVCtgFogkZEMyg9T39ukgoDew4EMx0hD46t
         17feKl7m63L4hgHNd3UFwEv7ZRHuBxGL5VTCYl2HOo/ZnU3NPdZdnhe1clLMirvT6TZZ
         Jtx/+214ZYVx8uyK50InHYDlODSLK910n3UOzOb9c57sbQLtQOWVx+wZbmfLMed2h89C
         ptNMSY54R4ExZUHS19gnjxeAr7tyJc6lNITx7yHbl6bxmFz2LrBT+eR8+X5QWs5gPhTQ
         ej+MDpvxnN3ayJLPMv4g4Off2RVRgO57LRKtw5oVSvZOJiszMJSevJIG87tkLEHYaPNl
         ilAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790141479; x=1790746279;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+LrvhrC2M28wUTYTFfBdvCnZV3wVCma94KrYLJhrE84=;
        b=hZezdXHXJmHkoTvS7gQ7UWS5uAmtQ9ew/dVwHpMk+V8aDk+6rnZClKDolKc5VZFX8P
         hRYAQrbWpS/lLZz/BdVlvdNg7ftujavJ5rx5R2sB4+VgJK4a1fDgSAGKbZLlYZhsaYbu
         TQp14JraRWrVy9n6JJMtXQS8QhDLS5Ha5HcVPj90pHqmeJnKFkZv/xtfCYyYcbjlt0gE
         cNymxvg9suVt0pCYTrUD82+DryKUk/bi/WR0U5Tmr16pYptr46AmO8lI6uphYxyPxD5j
         29OaemmVAZVCCj+GyamU/KRz+Yw5RoFStwBUwePwwogVHthBSQyGSPAUTmk29xHO6wae
         ENYw==
X-Forwarded-Encrypted: i=1; AKwUvBynMNEQF+a6BWqHNqD9RD4v8zjnbSSYeYVoAtoBi+mpBXLoBCFx+MHzTkHzbcXhnWuiK46wuJvnwbUGhRqy@vger.kernel.org
X-Gm-Message-State: AFuF++lwssKR17Uy+n4EGVqoF68CxgShov8tDEzRLPfdbWFQ6nn0PWWM
	7AvLFQSEBSGeCPHj5A2cMiqw8rVllku/h/QwCYBSN3dCoJriNKZtbAQu5TviaBzRB9y0UWx0O8E
	PJDyepcxT9iYyu8H4FGDj6KGNIi68UjOcxHPZdLXVPb/ryXjVBqYtzuWHyLsatxegq+Ul
X-Gm-Gg: AYBFou0v5CR6JeHOKoMkk4NIy+uW7r8mZz+fZHey61jjLz9cx3p9+N4MrLygRP7Lmvs
	TcSUTlDU1EZofGhYy1SMS007nHkg1ol1nXsnF7f1hCrVOnuoQvMdIZU+xfZQo7c0ucpub188rOd
	GDb/k8ZLWcIH9McEPak/l41spzYzolMKlFa43Yi7ZvIZNcehX9uJCB/GpjqovLmMG4h7GCFyVIs
	tP8Qq9Zj1AlbLwJSJLYW7AqUPDKfPcGtJWCHqpL37oYz27JWKv1mbHofG/4V6pdQDq43LgrSUYO
	AZRtLmy4pjdVqFYWpCK+QeyzILgZ0Vb+D94ntvIyZDNRNXojsxeD4ObAxRY+Y8QZ6Jgxg6j1SI8
	1z1OUKUIJNJJQNyUNEsRoey9oKjeIekJbq9UHIpDvqjI=
X-Received: by 2002:a05:7300:1c13:b0:33e:6d14:be9e with SMTP id 5a478bee46e88-33e8d2ebdc2mr1499149eec.23.1790141478845;
        Tue, 22 Sep 2026 22:31:18 -0700 (PDT)
X-Received: by 2002:a05:7300:1c13:b0:33e:6d14:be9e with SMTP id 5a478bee46e88-33e8d2ebdc2mr1499134eec.23.1790141478269;
        Tue, 22 Sep 2026 22:31:18 -0700 (PDT)
Received: from [10.217.219.38] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e9684d643sm7003888eec.18.2026.09.22.22.31.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 22:31:17 -0700 (PDT)
Message-ID: <2a50b64c-148a-4d44-a2a3-3275982eda60@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 11:01:11 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] i2c: qcom-geni: Fix hardcoded clock index in
 SE_GENI_CLK_SEL
To: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Sagar Dharia <sdharia@codeaurora.org>,
        Karthikeyan Ramasubramanian <kramasub@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>, Wolfram Sang <wsa@kernel.org>,
        Douglas Anderson <dianders@chromium.org>
Cc: Girish Mahadevan <girishm@codeaurora.org>, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
References: <20260921-i2c-fix-se-clk-conf-v2-1-8b5537ceff2d@oss.qualcomm.com>
 <5fc58faf-dd51-4b7b-a2ce-5acb0ac6bbd6@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <5fc58faf-dd51-4b7b-a2ce-5acb0ac6bbd6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: c17GepM7hTfxRgJE2VONAn5m_vG8_x80
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAyMSBTYWx0ZWRfX30RhaYtQETg0
 lNK7+heowVAW0Y7MQBtVdF8UZSXA8KDUZUXDHLH3khoPwr/FpL8ihkrbnBaMl5FHeVjpQh9JveS
 mm6TBzW9B7iGAP70dORxxwB6BpFmP5J26YDGxO4/CXqeXJ5I2DwyO84uCZI2SB+iPSVPfJ+YWkN
 RMsNRclujQ4aOO4Y1muthlYoPXgkM1wr2wcxGETcAHKNxLUowBnbPG9rS6fdM/4vJLg1KIUdPYw
 /CWOaFoX4ZBKmgis3cK+QNkKZfurtLPV+vzHNTGkoTGZwLrvdwocoHE+6WaXZUrpBX5lc4uY/D9
 9stxYl+WwwbnDqd1gTm6Z+7f3DvBHzUpT/zVAfkDIf05N8fq9ZLjxfmH/p55LLNuzK3O+Bi+dNN
 /8vX0eh1ErKMTdeiyBgumjFR7hQt58O/NhamspQ/wLsqVX7GUfZDYI8r7PATfW0Srt3JBQatBY1
 LVV2117l9pksMARPd9Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAyMSBTYWx0ZWRfXxCVxk8fMSkzv
 /KA3LjJzCbXOa4rJyfQ2vdVEUkCZRD0n0Ez+DisTCUNZRQoUSqj49doWheQWLz+BTDQwIO28a//
 5JvL0gMJbeMUNlTi4O1HC+/g89Yju8M=
X-Authority-Analysis: v=2.4 cv=QsDLTlyd c=1 sm=1 tr=0 ts=6ab36428 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=ngQ2yLvfpiWeLRerOt0A:9
 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: c17GepM7hTfxRgJE2VONAn5m_vG8_x80
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 phishscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 adultscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230021



On 9/21/2026 5:33 PM, Viken Dadhaniya wrote:
> 
> 
> On 9/21/2026 5:17 PM, Viken Dadhaniya wrote:
>> qcom_geni_i2c_conf() writes a hardcoded 0 to SE_GENI_CLK_SEL, which
>> selects an index from the hardware clock performance table. This always
>> picks the first table entry regardless of the actual source clock
>> configuration. On platforms where the matching entry is not at index 0,
>> the wrong source clock divider is active and the I2C bus runs at an
>> incorrect frequency.
>>
>> Use geni_se_clk_freq_match() in geni_i2c_clk_map_idx() to find the
>> performance table index for the source clock (32 MHz or 19.2 MHz). Store
>> the resolved index in a new clk_idx field in geni_i2c_dev and write it
>> to SE_GENI_CLK_SEL instead of the hardcoded 0.
>>
>> Fixes: 37692de5d523 ("i2c: i2c-qcom-geni: Add bus driver for the Qualcomm GENI I2C controller")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
>> ---

Reviewed-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>

>> Changes in v2:
>> - Update the comment describing the source-clock frequency requirement
>>    and the rejection of higher-frequency multiples.
>> - Add a blank line before the final return statement, as suggested.
>> - Link to v1: https://patch.msgid.link/20260828-i2c-fix-se-clk-conf-v1-1-9adc72308f2d@oss.qualcomm.com
>>
>> --- b4-submit-tracking ---
>> {
>>    "series": {
>>      "revision": 2,
>>      "change-id": "20260807-i2c-fix-se-clk-conf-89f6f92d373a",
>>      "prefixes": [],
>>      "presubject": "",
>>      "history": {
>>        "v1": [
>>          "20260828-i2c-fix-se-clk-conf-v1-1-9adc72308f2d@oss.qualcomm.com"
>>        ]
>>      }
>>    }
>> }
> 
> Please ignore the --- b4-submit-tracking --- block; it is internal b4
> metadata accidentally included during the rebase.
>> ---
>>   drivers/i2c/busses/i2c-qcom-geni.c | 38 +++++++++++++++++++++++++++++++++-----
>>   1 file changed, 33 insertions(+), 5 deletions(-)
> [...]

