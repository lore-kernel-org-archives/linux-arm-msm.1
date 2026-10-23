Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792772894;
	b=HM2jJV23DEtIwFPSoICqzXZga0YDs3JZhTxYYMy2OTmX/YRnAVXUblUM3grkNlWXI87Q
	 tkgMdN02OzqoSvqVObaQ3VqcWrXAkkNh4j3Smrue2Srm2WsONSUJFPKkdDboqNOaMPZ7Z
	 yd8tjw3aUzHVJ5QSn+Z/Om+LlngCHsmsCnzmpN5Xwt2ss6OP0hb/YPdfVd1Q3mzvO2GuU
	 ZJgcVveFK8CLRKNypUCQSKnAqP0N5Yw5s6GyBZECY8Zbwx4tXLluLXLyeOxwRUgiFrle7
	 wOZfOBAsshhXwN15eIvRm0bEQxaBGcWAD5tGFT2w9TvC5+N7iXX2EMW2WKQ0m9vbn+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792772894;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=AOMQhYGznP8ZPbiSDUkXtajttWxKGXnZv3BF5N3G1jE=;
	b=cDKCq0B+g88wr6r8cx5m7Qq0O0hLgpoWV1dSgx/MP6N7cQq3JARBftuf7tKiHZLmLf5m
	 HdV4ru2KPxXp1k5yjAYBPXQ6R1xmb5jncI+RY2/2dow99lPUs4ykiuWVPBCbLkcgLYmMm
	 S9I5RUQgIZmnnAZ61SKagljto8jnfITnkxI9f5tKvqRW8lx1I0YfuFASyEwURuPxRS8KP
	 b09eGinHpVG9yJwELa+w+MlljuY9CUl2yD2+O9NBkh1fCFdHc9lUXhaNv2h93gwfOSfQe
	 qgInazqATJuSk/WmqgMiAWt8fo3zOWc4LjwmoWSAnzoKklpI/YimeeUZyD8YEcSp2YQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PTNkDsG9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hx6DAByH;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C539C606A31D
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 16:28:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C539C606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PTNkDsG9;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hx6DAByH
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NG6S332216170
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 16:27:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AOMQhYGznP8ZPbiSDUkXtajttWxKGXnZv3BF5N3G1jE=; b=PTNkDsG9A5emxBdq
	Pdnx8L7FgDxoNVqkFA2NtbEIyf6WUMTnmbcDT8G23HbLjPiLCMt5MSAvJ/mD2ci9
	FICN5MdG5/wyNgBiGbRxgDDropOPEfi5FKebw9B2bsteteFRD2F1ncmHoSiIcZNQ
	4pNvD2pcEXQxNrIBSbFqNWbRlfAmVyaYlX5A5Iqs34WA1KZIrYzkfoSvpdQsI97b
	ISmo6r46Cj6qktZPtm43ptgJW8W2dMiXF/SmmygTq7HbDsX/u5SRc1+ByKcGUVki
	HMtxxSCkCa/xE5tihNs65C8BDUmF6IITGqIWqMtufiiBLaMQef0bTRWiRaUB20Zz
	tTXGsA==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgatc82nn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 16:27:56 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5eacd73e83bso72706e0c.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 09:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792772876; x=1793377676; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AOMQhYGznP8ZPbiSDUkXtajttWxKGXnZv3BF5N3G1jE=;
        b=hx6DAByHxqHHpsqa+EIKQJzX/ToMEE9U5Cbjaj2FZaaKJbovJSAUxvQbgFxBgjb+Mv
         +Kqsoq9CVfpi9GllC6Kd0C1M1IRDfMAIV6ydzbI6+Cc2qz0TTNgRBTS0n/cRWexerO5w
         VoJ+uGac4uyIo5sJS4bNfoFPmeaVRfrySFeZGF6CYVUpMUWABEC100aoNigV49LdkQN8
         phv05OvVCaMwHlkechVSZzPYS/RYvgboY8w7MEKXH2sidG5dqMAE5SeV5MsdnmynwdXh
         1ZNnzmAna1lc7KBqlELMBfi/0c0HytzRJGLm22V45NyjXx4IkRRqDXjvBOw21eoxMM3p
         uLRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792772876; x=1793377676;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AOMQhYGznP8ZPbiSDUkXtajttWxKGXnZv3BF5N3G1jE=;
        b=AOV6TKhBJ6uvN4rXvgE4e4Sr7ahQ+AkwziU7CZh5uvrsJ2sPgDGrHVVGG/4Es1A/6P
         +hu/ERqwIe8rz7G5jmaD7n3RffBgibQHyDc25LmuKZzGvvkj48IEqwaJXepTyYiU7MfZ
         BpkR0BA9w8E/vwHs51/v9TXKzgzvcf++YElWflU7BSGqHCU/YmiPMWu1nJUc4ylSCldc
         CJMN52m5K7/xYwWtBVIuA7fBuxvZe/8XUgnbG/UviMTDQ2nAAZ5d41A9mvcOloK6Ic9H
         R7drOngU4xDjUa3NL5GAWv+sVpfovrEoMz89rX3O5UfhVnM3eYFD++U2gmcGL8w2JC2g
         a1EQ==
X-Forwarded-Encrypted: i=1; AKwUvBw4n2jRzIw9PbI9+tHY9v9/5QFoVo9zIhFmNjiYxf10X+5xMoSQpie5KLPnZt3sBAQ5dkkuIg8iAmySnnDT@vger.kernel.org
X-Gm-Message-State: AFq9FYJ+j9aqbXQAiNVDlM5GcEK94qvSWid7FAoF67PnyDUX7LoTBfDg
	AJnBVHKTOXXkzZGCtmlgZjpIF9jAEuZUAjN6v3FcNQE30KdySjenkyeFdpp95CSRg3Xd0+6+GI9
	ejYhQbChLijhwZNWyIxYrnN1jQ6m6wUlilImOAIuHGQBo8GFJ36eDrGKd+OW38cE1pzce
X-Gm-Gg: AYBFou0rOhZmyFZ4x1H0Ecvqa6B7Oo0gnibOtOtRwaZUh4hbFiaen5RPrOZg2XPlA/R
	O2eJl6ytnUvim5P9FfxojALYGW4u9k8Gu39ETEzYFJyL09Rmd7Dc6ZN8ZveFanyoS2y0AVT5sbJ
	8yvk2Dy4RNfZu3paZRIZP1maQZF60K6/hW7tFuygKTRn78Z9qEib2qce0rqPtnae+cy0tZi7w1v
	dJfvUYbQvVixgqUJxAu+eLSz8rR1rr1EKXv+tOIc0M5xyL0Pj514rj3ce64s74Q3HwUoWzwm6nY
	TibNFCrg0ekDkU04UvJBmo4YXAl4xMPfqHWT0Ej1qWBNxA7SE9xai8Ik2ekWp9pfVHxOIG45ifC
	jOjad2Sm4Hk4C+jPoq7xPJw==
X-Received: by 2002:a05:6102:a187:10b0:7cc:32ce:4c41 with SMTP id ada2fe7eead31-7ccc32a88e5mr1227638137.2.1792772875835;
        Fri, 23 Oct 2026 09:27:55 -0700 (PDT)
X-Received: by 2002:a05:6102:a187:10b0:7cc:32ce:4c41 with SMTP id ada2fe7eead31-7ccc32a88e5mr1227624137.2.1792772875358;
        Fri, 23 Oct 2026 09:27:55 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4420e7268sm40969a12.9.2026.10.23.09.27.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 09:27:53 -0700 (PDT)
Message-ID: <15c97297-379b-45f4-af63-c9c71733ee52@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 18:27:49 +0200
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
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sdm630: Drop the cluster idle
 states
To: Fabricio Akio <fabricioakio@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Alexey Minnekhanov <alexeymin@postmarketos.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Martin Botka <martin.botka@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261011-sdm630-idle-states-v1-0-3181d488dc0f@gmail.com>
 <20261011-sdm630-idle-states-v1-1-3181d488dc0f@gmail.com>
 <2e5bfe2f-f639-4c55-bb4e-e8893e9f098d@oss.qualcomm.com>
 <CANxzQdH3eC97bb+eef=wizrxoB4XfvROzg8iHFxCrN_a+TZiSg@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CANxzQdH3eC97bb+eef=wizrxoB4XfvROzg8iHFxCrN_a+TZiSg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2NCBTYWx0ZWRfXwZU4KT1O/9nV
 /tNwxrEHT9Qur27/QKKi7AKiTHaV2ifeYwe/DkpnOb75CuqK0SSz7dzdZc8p8jjHJnQFiUEvG8r
 9dbsKI/jZTt6EO2txiaK3+oQY/M/y4VCK3iT3F6RGBv83T2GUnMQv7WtzPfaT2fR7nJvJjhaXQV
 PlEbejEKil7fmRHTsrKeaZnmQNDsqmqLBpHHywugtgNgdGWJRVFct/VI8g5vznthivf2LbQi9wg
 NdZNh+MNn6Iyxwb8Cm7MU0FfSFBGbgVNZrEBhr7UcMrrBeO8pvzGAYqSkll4l677wkCa9JxA0LY
 SKMxmWKGbl9p54iCE0MDO3Aee8D4LbapZpbWNfWsdetq3GQyvrtwaab36lneOavcsfdmmZgvFgV
 iqU3OnS1m4/wgMZ5D4HYE0E0LrTEkC5GSSHcwMjDTzhOh+AJ6FhbQNNkzNuehSqJ//nOtRh/eTi
 Epq4Fl/vCQlhWa6UWlg==
X-Proofpoint-GUID: Yk1RDPZt2mGhz_hBGlJdTbb95w5TqRvd
X-Authority-Analysis: v=2.4 cv=Scxi5fRu c=1 sm=1 tr=0 ts=6adb8b0c cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=2CUSOdstmcgysknA9-EA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-ORIG-GUID: Yk1RDPZt2mGhz_hBGlJdTbb95w5TqRvd
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2NCBTYWx0ZWRfX4xQkDfm5PAVw
 RXmmuYu9QKeTkQiB3NU8ax88q66LEzpXOlUdo3ahk/9PUFfL8kkEb3hrxPfgURanfpZiSqLlWjV
 DYUxqjCGb5gR68yhN65Yel7ggwvN40Y=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 malwarescore=0 bulkscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230064

On 10/20/26 6:15 PM, Fabricio Akio wrote:
> On 10/15/26 3:51 PM, Konrad Dybcio wrote:
>> I threw an LLM at the downstream tree and it decoded the states to:
>>
>> C2D, no cluster state    2        0x00000002
>> C3, no cluster state    3        0x40000003
>> pwr/perf L2 D2D + C2D    L2 2        0x01000022
>> pwr/perf L2 D2D + C3    L2 2        0x41000023
>> pwr/perf L2 D2E + C3    L2 3        0x41000033
>> pwr/perf L2 D4 + C3    L2 4        0x41000043
>> System PC + L2 D4 + C3    sys3, L2 4    0x42000343
>>
>> sorry for getting it wrong years ago!
> 
> Thanks! I had decoded the same values, but I didn't just put them in
> place of the old ones. This firmware supports OS-initiated mode and
> refuses platform-coordinated mode ("psci: [Firmware Bug]: failed to
> set PC mode: -3", PSCI DENIED). In OS-initiated mode a cluster state
> may only be requested by the last running CPU of the cluster, which a
> flat cpu-idle-states list cannot express. I tried it: with 0x41000043
> in the flat list the firmware returns DENIED to nearly every request,
> accepting only the few that come from a cluster's last running CPU,
> and the idle CPUs spin on it again, at about twice the battery current.
> Linux runs OSI only with the CPUs described as PSCI power domains,
> with 0x41000043 as each cluster's domain-idle-state and 0x42000343 for
> system power collapse above them. I'm working on that, but I'm not
> sure yet when it will be ready, so this is not a placeholder for a
> replacement coming right behind it.

See:

https://lore.kernel.org/linux-arm-msm/20261015-b4-shikra_lpm_addition-v2-0-ac7f1a0d5638@oss.qualcomm.com/

https://lore.kernel.org/lkml/20261005-s2idle_state-v1-0-3c402c66f388@oss.qualcomm.com/

> Dropping the states is not the complete fix, but it helps now, because
> as they are they do harm: cpuidle records no successful entry into any
> of them, and since the deepest of them is what an idle CPU picks, each
> failed request is retried instead of sleeping. On the Moto X4
> that is about 133,000 failed entries per second with the screen off,
> and the battery current goes from 277 mA to about 115 mA without them.
> 
> Is dropping them first OK with you?

Temporarily, yes

Konrad

