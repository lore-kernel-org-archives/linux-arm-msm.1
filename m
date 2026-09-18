Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B7D495526
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 14:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789741228; cv=none; b=ZX5Bi/WIS77+/VGFNYxjmaHLzLvSIZgit/CNg8Vh1KqM7aZOX8DUDSeLMU36STjDGz2SIVSWMYNZNt+7VE6q6KA0K4H9uOsbkjC1znbijmgX00SeQ1EOiSqBWYv9FGnH1+cDfSa7QrnvJ/c5nfaQy3znzVaSIdQOhFXv6zeB2mI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789741228; c=relaxed/simple;
	bh=gJTLMCNpjxCPB/O/GnGRRpYU4FhUYAffCj2gOaX4u8Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nyqpDbsgraNc+A23aroezG6pFWlt4BgJB9vmT4mMhrptryk5XgGsF3P5p8SxkkUAKxtjObC8txjpQ9KC4s9MXLfUaKhbKECAV0DTMgO2HnJ5nHwbYwRehJjLiQu4AZJvB8hZHl8tFZmJCxtcZrOM7sQB6hcASpOeEJ+3ZOnk/9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gsrtoD1o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jGgLZcdW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gsrtoD1o";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jGgLZcdW"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68IDOTAJ1900365
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 14:20:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/lCFRHFwb/IgtpvGJjUvtZPXMkXwFzU0Kc0GzdJqTRU=; b=gsrtoD1oE4vbHlyj
	YPwx6i6qASESItiVEtczLACbXnj7z/2yGZm2Byj/2zQT3KFQ2D6iSoekt07Wlltj
	yLttejpJ+M3IVSKuKb7xJXiRULU196VIExn+Yb2sX12XCTTbPyQ4fF48nHvFQ5Oh
	PNbj6it5UC7uc+m0jHzEI9cXg9ZQ/PvB0Bs3RMIi0sYdDytnKnzRGR/jpl/G69nf
	mnsOlR1UFBikOT8NUmKAiD76N5bDLLlyBEkN2NRFeQDORgG+oIdxenYgu5CoOFxY
	JWJCLC31f+ChCsnwnXN95Pkapz7gV3GwT8KryyS2GtgebsqFNYa8hRZqSSw3/gWY
	fIDDzA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grtdpu1ya-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 14:20:25 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-9104ba8bf51so26823326d6.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 07:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789741225; x=1790346025; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/lCFRHFwb/IgtpvGJjUvtZPXMkXwFzU0Kc0GzdJqTRU=;
        b=jGgLZcdW+WlEp46eF+hiDATS8uyXY94yeogJ8I0lkxJ1fnc0u5xMPLqWKV3j0qt/HO
         bPR/WP/7+mH7gtKDDiYEusnVibGNzCCX2LAt6/Ok1eT420lcKFGqQYetyi4e1Nt1bQY6
         PbvjjcfnHwlpKlxYWgntsH5pXC5UhtyoHktHDUwwH+1ndtaqQBtQuAHQ6pBuuxXTwlri
         O5xDpTsO2DVGyq3+FKkNTI8AU4dBjLp1evOlfmcbRRjnDuKDwYTYTzjMCFvHSoMh4F9+
         wBOCCAuEsU2XQ8OF78lrqTjWu5DfvNtsJZzJu5Dt67EkfHBwfLOAIzv+Mwe29gCQnF3G
         UK0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789741225; x=1790346025;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/lCFRHFwb/IgtpvGJjUvtZPXMkXwFzU0Kc0GzdJqTRU=;
        b=t8yXljciNZJKP8tdCsymJYdqdowW/nnV5YM3HiXW4qdW4nV2Rg+yraKVrZ5EyS+Bgl
         D1oR/Ree5amhh5ndjYNzOGrb96SouROOc+jtAF8jv/lWmgvF1j/ruBJV1Wmv8Spwt0Rf
         oBhMN8B/NGrKrFE0odZPHID2YdmiI0/Fl87dm61auyr18hKvm4pjqdP13MAedxvZc45A
         VPCcWV0iHCreRSD1k2M66lpsRlMtij7CoW4PwSLWMfx49PY+yFlf5w0wliGdM1DHwWiW
         y26GlaZjawBxld96F0HOGLqZN+6pFF8VdguSNulXxCrd56iLgP72QZTdHIDuM0ww1evT
         V+9g==
X-Forwarded-Encrypted: i=1; AKwUvByFWYCyk0aUyzuhsvV4VDVk9NAocbaqTrZGbt8XvsN7XSpQHqUpaQegzHq2TsT8Tq7aMrPcxYsgV5Lpe/Wa@vger.kernel.org
X-Gm-Message-State: AFuF++kAyxyr4dLv5ixVM/3Kd/dS/yeSznEE9vC1M9J+o7PIU6JANTy/
	OnvYb8oSVuA886wRQr1kCcwTuRjvoa8Uz1cNrB4yRuLENf6QPYBRad7OUOH+5kGVoKvtHJsQ9S+
	gvSgbR8ZnBF/SUejg7ac7lAbSVtNjjh4C9uZ8zXO+cWIXj3gQGl9hh/8qMRHFcPur4ZjZ
X-Gm-Gg: AYBFou0gX6eke+wFmSnWReKhOl921KOhn9b54ADun/lOrGgDt15cClW0b9mt92KzgmO
	Ej4H8g0LMtsVTkrWjn+PplGhZSwzOcBbloabI6PJiIpsVIBIpnFO97ifEZL3Y3wSbEW2ZbEMbj/
	oW+F4J99BWOKqJIb4h2KeBfp6dSMLJl748A6i9LbT/ydsQsPmeYq4upA0vqXMmZk0qvx9t/F2Oc
	N+xLj4W1fN/0edy5zAJCzkip0XCtZO+OV3kwYF3+ifJMKE82sjhrFgbUTH/SFaWQIckXKpiEVAg
	pMNlOkVyrpxEI6+dCA3/CZMrmmhicQcWNZtne47JHvkECG1AOBUvKWK2a94JJ9/Eoeok9i8aAZp
	P1clw03uDaCrxe1mVNDM48VEMnbc=
X-Received: by 2002:a05:620a:8909:b0:933:aa0:bb83 with SMTP id af79cd13be357-93bdc747954mr372714285a.34.1789741224642;
        Fri, 18 Sep 2026 07:20:24 -0700 (PDT)
X-Received: by 2002:a05:620a:8909:b0:933:aa0:bb83 with SMTP id af79cd13be357-93bdc747954mr372707685a.34.1789741224091;
        Fri, 18 Sep 2026 07:20:24 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-c2a1bb8a1d2sm62661166b.40.2026.09.18.07.20.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 07:20:22 -0700 (PDT)
Message-ID: <13ed4e23-1092-4e6a-82ce-b36c1a0016f0@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 15:20:21 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/8] ASoC: SDCA: add
 sdca_apply_default_control_classifiers() helper
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
References: <20260918131914.681588-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260918131914.681588-7-srinivas.kandagatla@oss.qualcomm.com>
 <aq1Hsw0se8zKVQSE@opensource.cirrus.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <aq1Hsw0se8zKVQSE@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDIwNCBTYWx0ZWRfX2RHUZCS6cRGH
 KalgSbNqPfICF8+INTn8HesQYIyUQC82ZWzRJtqGiYBgVxIbjlAhleWufpquJ7PNfJ4abuLkbuc
 JEXPFMfEjzwzrVIogEGO8moYT9GUasc5M2xp630SzeDSGQwB+YsOgCFElYJwx/0/OkDNcVbMzf3
 w3xym0VfDUG5GgqosMCw9FbtGFDu3YGRmvu4FGz96Wiqvm0gVmahn5XBZjMBDKri4jRXuIk5VqJ
 wOSTmf73Zco5F//WGb5U78UcymYKOjO5/hGWWGs5nJcLMeZBrVJjUzJDhfUNZl/MAuy6jo9i6ht
 9CSSnX6rKXxC77sZvXPuxm3y2Li3YLNYbrZyrRaKKLMgt2t2YwdZMc53bt517fHqwfwhhvuMRif
 iSd3+khavOw/L656tf2l6HJPLhTCd5WgXgKXoXS54EzYMXj9fSH0NoMQb4LqyZqQl8Tqx4JDdJN
 jY7pkOR/qtRd2OJgG0Q==
X-Authority-Analysis: v=2.4 cv=N+e8hG9B c=1 sm=1 tr=0 ts=6aad48a9 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=bNv17eZGp78-fAQ_3FUA:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDIwNCBTYWx0ZWRfXyyZUpdkKfoz2
 gEVRVTOYbjmILLH3U7BOSnBhSKeQ7+h26FFGD6qmec0oiyuVYSSNep3glmRxshkxguTCKmRVieg
 YnLbuPpu2m+l290CvYjTa0b4UCLHOQk=
X-Proofpoint-ORIG-GUID: 6l-tf3s4fgTTv1AD3NKUWTL578xCQSIS
X-Proofpoint-GUID: 6l-tf3s4fgTTv1AD3NKUWTL578xCQSIS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 clxscore=1015 spamscore=0 adultscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609180204

On 9/18/26 3:16 PM, Charles Keepax wrote:
> On Fri, Sep 18, 2026 at 02:19:11PM +0100, Srinivas Kandagatla wrote:
>> sdca_parse_function() derives is_volatile (see c7b6c6b60594) and the
>> spec-defined reset value (see 02d851b46b36) from each Control's
>> (entity type, selector, access mode). Codecs that ship static SDCA
>> tables via populate_function skip that path, so RW1S action Controls
>> end up with is_volatile=0 and get replayed on every regcache_sync.
>>
>> Add sdca_apply_default_control_classifiers() to re-run those two
>> classifiers over a Function. Elevate-only, so codec-set flags win.
>> Call from the tail of populate_function.
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> ---
>> +/**
>> + * sdca_apply_default_control_classifiers - apply framework-known Control fields
>> + * @function: Function populated via static tables (populate_function path).
>> + *
>> + * Runs the same per-Control classifiers as sdca_parse_function() so both
>> + * entry paths land on identical @is_volatile and @has_reset/@reset fields.
>> + * Elevate-only: codec-set flags/values are preserved.
>> + */
>> +void sdca_apply_default_control_classifiers(struct sdca_function_data *function)
>> +{
>> +	int i, j;
>> +
>> +	for (i = 0; i < function->num_entities; i++) {
>> +		struct sdca_entity *entity = &function->entities[i];
>> +
>> +		for (j = 0; j < entity->num_controls; j++) {
>> +			struct sdca_control *control = &entity->controls[j];
>> +
>> +			if (!control->is_volatile)
>> +				control->is_volatile =
>> +					find_sdca_control_volatile(entity, control);
>> +
>> +			if (!control->has_reset)
>> +				find_sdca_control_reset(entity, control);
>> +		}
>> +	}
>> +}
>> +EXPORT_SYMBOL_NS(sdca_apply_default_control_classifiers, "SND_SOC_SDCA");
> 
> Just set the values correctly in the tables in the driver, I
> don't really like this going back and fixing the tables up leaves
> the driver tables looking slightly confusing.
That is one way to do it, I was trying to be more align with what was
getting done after parsing the acpi tables. But I dont mind updating the
tables directly aswell.

I will try to document this so that in future if someone is converting
any acpi tables directly and then they need to mash up few things before
passing to sdca core.


--srini
> 

> Thanks,
> Charles

