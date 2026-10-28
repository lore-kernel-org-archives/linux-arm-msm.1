Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793224778;
	b=B8gcu07/EQQzLcxC7IC6OTatAJsL/zElsyJ6tYob7hLJy/3pKlsa6g263ZunYAniGXZo
	 OwbwoayccrrMOwNyI/RnLV4eaYj0ubnoPH/nazXUBI2V8tn5+UJa6r815gdD4U2i1ATd+
	 7n1egEDzgrrsrRp5UkGJiK/intVJMj7eNxaOjcW36IgEcQUl3/uC53HEwHn0Sowz75Mo+
	 dJEdh1jPuU1MmZbj92rG7HeqK+e5ZaxjGvpYhkZp+vN+7B/shou13WWiWVwYkgnSucPo2
	 46cSvLQneIsuj14FIJFfDDaE5fgl1ADSzPuUTCKIU+AvC7+hwJKugQOGhShLz5tvI6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793224778;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=OLK10iOzeuWAqnuh3xYH4xFqSBC7B0DkHD7buwOU474=;
	b=IEIoke3AsuMEdkjnSCOMV39Gd72zqjrFYzcx2EYi5bMEz6CDitFGcE+DmD0/rB1sqe3h
	 tO/9eP1CZwWwKFIWdM2X2YtwdjvxkD8IPJJCemsPIadgJUK20eHaT3QhDMBcAKhQ4I9gD
	 5oUPR7E6Ofi2GOYCg5EP2lDTnGSHJfLgE5RT2eaQPV9LQZX/9Rsivt0bdS06mwNLpm4BF
	 QAlTKCejSDyCwsFyjFuTq41sSHN2Y4XlYjSTGHKehDhHaiMnJQJZ6lACxJiSPIxU1ITEA
	 gZFiMuuDTSsKdWdGYpDcjWg47a09JUVcXyzX4AeTi/LMJESWlr57Wvi4AIp62rLjgjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Qzq94gNC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Pud78Nrc;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9BD8606A331
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 21:59:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9BD8606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Qzq94gNC;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Pud78Nrc
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SIkDMa2546827
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 21:59:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OLK10iOzeuWAqnuh3xYH4xFqSBC7B0DkHD7buwOU474=; b=Qzq94gNCm29yddEq
	2mnaoytNhDl9X6hqSkD4rl6cke3dTfYXobdfGBw1qXK5XPxuynjoFeOWI0LxuiZo
	Q1zqGflIzEd4iY8a1gmSJpFmjurp1IR6nylxCqKHlMucaP2mEW+PcX5GQ8apj27g
	HnR/B1ZSRZ3+vTs+/eWRttJhTolaZIzzZcnlh8lNDocQgH9S09QW3Kjiw67Sgi/K
	VZSzNZeDxmWhkkhyFHbqhZqqsOQAquJ5MXMlPj+WfQOb+LS24vE0a7SjE/BvKNhC
	rBQXDsbM75balqwCfmKjlEi5V+tSAo3iCGSNGS0mPBV46/lr3QRpN+yrK21NtJ2N
	UIL8Tw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkpmc0n5v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 21:59:36 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f32050e72so303278085a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 14:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793224776; x=1793829576; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OLK10iOzeuWAqnuh3xYH4xFqSBC7B0DkHD7buwOU474=;
        b=Pud78NrcNSED4MERVPeYoyd4YwNdGAFxjQWEmYZAiKWGBCh04kWTQbh+uQ5Wt4+EKl
         A0X3yC3XPSJvND8+4yLU2oQfyg63Cs78nwiwFFquBlWOVeEh2M+mBMg2PWYzSRvHs5eu
         yXQXtHd1VXj0H7+Tx8c2kLDgW1lszwuSY5rpyN5jybGmQy4gZSLIi3jGbAnTdJFlDcTE
         Q+Z9ZXpfN0gqqvg3iq1kYAnaTB0vhnrsPSulpGgPXfec4AxFDraIXoQCw/EFCJOTloOj
         vXNNT92jPSIhPaxudLEoO2HqR0ZNdbdd8kEttDJpEdT8Vlr8/DAE4pyKecwjGQHjZD1Z
         mF/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793224776; x=1793829576;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OLK10iOzeuWAqnuh3xYH4xFqSBC7B0DkHD7buwOU474=;
        b=dD2xYjo8Z7MY/hVWifJKxEqk64CXoAPhJ5yYrA/H9Jm6ZQ4nYAaOdqqryPgCP+E+tc
         +2H3K74JJNuTUt1pupPRLJJ6eqtn8Bp+xya9x/kpvkjn8RxU+iNBXAZmtm3lxz7/8DQC
         9HI+uZ7ervOw9EovemzR/9gcu9B6MJ8U/lGez5k7LeTOzAyBmqVSAhss/Nbjl6aEcRXa
         2p8vNxq3gOznjEupvzW2FLcIwbS1+HwVPlaaGutzFlTAugqfIfpXiLSpub/KVdziuSEl
         siGanKA6lYZlJthkHjOiIPAPH18Gl1q9DBhF+ZGcb7B0cRaqy2mTa9ooEz7ruR8toNBn
         w2tQ==
X-Forwarded-Encrypted: i=1; AKwUvBwqhkuYYaPkyEN4B3OfAL5dzt/O+b4V3sUgK+QAiOF9240oUVKlBKgEOQbmq2m9owoSiOC9px7UVW8QEgXh@vger.kernel.org
X-Gm-Message-State: AFq9FYLi8kLl+Dis/+4Vy2jFd3fKJXc1VUuITvl+o+K5JT7IyaYMBUrO
	IrAdV357xIOvwkUZFdQxbxloYnG96UpwlCly4X25D0KSwPwELcgTT1LXqszgLbdBKxWJMM8xpTp
	WibjpqdHTvTnxYHZHZmY3ZVfMSCHaAwhMsei2xolo9ZG9gKn4zLIqUM838ciHayMCOxLf
X-Gm-Gg: AYBFou23u/rHcLLMX34my9og/R6gqXKmfK8hnV5a6XKGd0kU5lWjaSwxmjTxFR9jVi2
	EZA8f+EWizoLySZdKm/u36fNNz8h3jn+20iEffjvEVgpRvKK5eXkd2ZBZ6fXfOomZ6XhsylF9dV
	4su1Qk94a2AgLWuI9vpHwAk0vV+EfAhJBA6E8QNIxStGPhu7aj1Hz0GLCF6UysYdm3srKFJyNus
	iY4/ZS5k1NL23pyOJ451WH084RnupgyXquGNB29uGAPUtdnXqkRnBxtR/wtmAZTQuFYxOn76kob
	6WBpiVhQkkZ65NwF8GtMKNi2xcqurK+gxKv3NCkCqyyEGdw2lgOq1MM/E3QIoZl0nON2bL5AH07
	qfV0Mtk+ek+gsYPp5TSVjbLUcehrPIYtHYanFO/UQnEBiXR7DJ7ZHXtWv+naqoEVGXeta9J9Noi
	Q=
X-Received: by 2002:a05:620a:45a2:b0:93f:31f0:6a7f with SMTP id af79cd13be357-94408d5db27mr592891885a.69.1793224775816;
        Wed, 28 Oct 2026 14:59:35 -0700 (PDT)
X-Received: by 2002:a05:620a:45a2:b0:93f:31f0:6a7f with SMTP id af79cd13be357-94408d5db27mr592889485a.69.1793224775294;
        Wed, 28 Oct 2026 14:59:35 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4aa82516a45sm24352855e9.15.2026.10.28.14.59.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 14:59:34 -0700 (PDT)
Message-ID: <2b9c44de-6379-43b5-933f-54074cf99930@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 21:59:33 +0000
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
Subject: Re: [RFC PATCH 22/23] arm64: dts: qcom: glymur-crd: add WSA speaker
 protection VI feedback
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        Ravi Hothi <ravi.hothi@oss.qualcomm.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
 <20261023171433.820092-23-srinivas.kandagatla@oss.qualcomm.com>
 <0bbe4db6-0c47-41e3-838c-37d880869ea9@oss.qualcomm.com>
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <0bbe4db6-0c47-41e3-838c-37d880869ea9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=X4nHu2Te c=1 sm=1 tr=0 ts=6ae27048 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=qbwID_QRwwrUub8pYvkA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: o10rLJzZQY3QVwrPblZQ9QHOrrpZf5qj
X-Proofpoint-ORIG-GUID: o10rLJzZQY3QVwrPblZQ9QHOrrpZf5qj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA4NyBTYWx0ZWRfX/x7Bf9Wl6exs
 r6/It8FKhU44mYuaGfp/j7odDGL3GbR2QDwKQUmiAbWeNprJly6+fkScSIzP8MddglICpdX6wCT
 EsZ2VXlhSyrnmVUtNK/+LktmeGYhgqDjR7dA3Ac2Gp1DYWRUrCc7AIGPnTELZUCRKR8l09bVZ0y
 x/Yz4TfkWlkxj+kskO0etI3/kwRF4ZcrBHNyXcuRtsLh5F5SkOkYW9Rnu2k8EB2NWbuGz18/89i
 s1m3b+gW9BTH8ARELOBRHRMkeqC9yWzVT1oswCYpffOs5nGvIogvm2Ozhn3kf8tL98Nakq1XxYF
 AhADU2UKvmb06ETuLxcPzKl75f6K+6owDgd99qM3r7X7cnjTbQ23cMloHidBjxuTPhsjZbGotBe
 IT/ERyArN23Yc2S86VmMWRUUE9LPRXfSqKtKYqhGkMgWeacpJSeKhp/gqPOf8XnJSMbQNTDYNcw
 MFWEQGhWvZRMM0QQ7KQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA4NyBTYWx0ZWRfX7S722DWhPx5y
 XyGUX5no6yNQZPEAircWGH3PgHKdbIj95PZr7K3uPbGT4+mkMwWjCZYdL3HAlXp+sjT7Of07RhP
 3KUEqYbmMZ/kcLZgp4QcD3Fc08LDAKE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015
 adultscore=0 suspectscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280087

On 10/28/26 1:38 PM, Konrad Dybcio wrote:
> On 10/23/26 7:14 PM, Srinivas Kandagatla wrote:
>> From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
>>
>> Add the V/I sense DAIs of the four WSA8845 speakers, the SoundWire VI
>> ports and the WSA macro VI capture DAIs to the WSA Playback link, for
>> speaker protection. The speakers now expose two DAIs, so give them a
>> '#sound-dai-cells' of 1 and address the playback DAI explicitly.
>>
>> Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 29 ++++++++++++++++++------
>>  1 file changed, 22 insertions(+), 7 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
>> index 58158b51fe29..fddc76f59557 100644
>> --- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
>> @@ -256,11 +256,26 @@ cpu {
>>  				sound-dai = <&q6apmbedai WSA_CODEC_DMA_RX_0>;
>>  			};
>>  
>> +			/*
>> +			 * WSA SPKR playback-side codec DAIs plus the WSA
>> +			 * speaker-protection VI capture-side DAIs on both
>> +			 * WSA (left) and WSA2 (right) buses. One MM1
>> +			 * playback open brings up both chains via the
>> +			 * machine driver's multi_direction_codecs flag;
>> +			 * the SP<->SP_VI control link in the tplg handles
>> +			 * the DSP-side pairing.
>> +			 */
> 
> I think this part belongs in the commit message instead
> 
Yep..
> Otherwise, do you think we could bind the speaker protection
> channels in the driver to avoid having to modify the DT?
> 
Nope, it has to be a codec-to-codec link that should come from dt,
giving more flexibility.

--srini
> Konrad

