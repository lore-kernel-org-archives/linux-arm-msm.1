Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793100846;
	b=lcUUQiL98cyEFA46fxiCEJE+JW/Qekrh23tv1qZzNfXbLJr1MQ1gjzxy1x+AgI7XJpA9
	 F/ZfWIT5UlmFn41/Bhl17macxFZfNWwaJ4SmVqppZ2xxD/IKPY6Q9fI67JCEnNI5JAN9n
	 jU5sT7179XAg39rx4ZbC7vi47w7n7LYBGRgccK5i5xT2ZKgIpgiwyHmcvxiJlrmoME9q2
	 GYnAZcd625bS/vk21H0oN4JwwRTtYMYaPpE252i9MfNdKHcidlY2+iHaCrAMrXlhwT3Yp
	 3amoqNTZ9rkChWX3qnjqX0fvMDN37NrN0xChrThQ20N7vQRkordgXQ4uZIiCuW3k2RQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793100846;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=9NnZK2sny34h7fHthZ2KAJ/JJ3o+yLef90wnW+xMkRE=;
	b=goGWICsE9LS0UFy+aOwl5zhPfXrX5B3sG0VGZQJen9mF1baMH0H00/8xGYR0aDBEBNIN
	 0eqmm0nDyMQ9ODyclyUwPFmsuF58TYpTbN3blPc2PWa+2XYgyYgQgFweJj8v/2RaSnvwD
	 d9ej3neYLPclNltZMfuHSMBv4z/lqggU6dIkXXrjMHzZyXLnKPulTBED0eK7gMJGY69S+
	 p/a5HbNVUXjarv9ivfgMyMCLjceema3cz44S5kL2jORYgW9Czv99w5bXzaeIap7C1zbLw
	 EEjMFXN6SaT0Hx76A+edYVambfj/T72XcsFrQD1OaLId8NhRJIWntIp71OUCHDr2UKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UDKH5IxI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kVRD6031;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC3C460A381D
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 11:34:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC3C460A381D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UDKH5IxI;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kVRD6031
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAe5dP1922139
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 11:34:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9NnZK2sny34h7fHthZ2KAJ/JJ3o+yLef90wnW+xMkRE=; b=UDKH5IxIV0M1zIuK
	wfthDtrI33Q1APWL+XivnX0a4xs4ouEd0AFb5cAnlMA6Tl3Es/yAUKQX2EQ04j0h
	tl/9Xg5HqTRZDkT75hpX2dqoabff+OVq5TpTG4N1bzDuSdAdKBPd23y8oBsgsrM2
	tFBpiQIl94JxmVuII/2Iof+7fclT+/qrpM1sb0y4JGdIUJcliWuiEgYw5cuNjToD
	VJMQPQ77dk2Ozo/rNkCQ1u+R/jyGF5EFL/FmwZGEVRvE4Z7PW/uYb9qKAYoauQMO
	R/2Y6I+qJptUeWN1s1zvZMeNcVhnnn/gn1U39U54txoHHYV9qbRz2qgcJnB835kr
	VRsCTg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjrq68n3n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 11:34:04 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30c0d568830so10794484eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 04:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793100844; x=1793705644; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9NnZK2sny34h7fHthZ2KAJ/JJ3o+yLef90wnW+xMkRE=;
        b=kVRD6031Gq6bxMtGSh9EcEKA4RPRMAAcIW2iG3v3BPV8QSB6rafpIlPgf0UMsVKtlz
         IlN3ub5rgqcI2JeqFULEIiVfk6sREveyqZwPdKIJqC5wsdRpZLBNKppLGPRuRFr9OX8I
         hNikVyQOl01+HlaNmRC65uhdClmSQxeKBIrBJosajNQL+I5FDwXDV5F2oDkJ55E/m6d9
         GRgrFQ9eLe6qC0DKzcsPzF9wuh45qKTptWejgXmbSRvbsFPqCoXVFbtYKRtgcOlhuddD
         f5WZw7dma5d+Oe0v8fR4285IPgqxRMd4FSFEXflidnyKzGKdfOY9l3JTR6KKpT3qlOqh
         Usxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793100844; x=1793705644;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9NnZK2sny34h7fHthZ2KAJ/JJ3o+yLef90wnW+xMkRE=;
        b=MjujoCaWC48IXhFneJPawPQ5SMBsLb51r4uQCDj/UWn7gE3+tD2ZjkHLdcWAOzdQTC
         RpZaYVqxvwjFBnYzapQxsmKRWsf851TlB6edzanYZeMEaQZ9GYgR6EV5+NB+vkxvWQht
         Gwu4UFhoXvVZtp1ygTgFMuzmJyccJ6pMpMM05xkE0Npudj1ok7uyRBU0tVZHZoWcPvyE
         xJ3ajVQhdYi8oh95Rcv0bqBorS+NaD9B+9UAsH3aiyEh+Sd0XKbiDek9W1gJSDinlGnC
         A3R9dzMTEna2Mte5XBHi0aKHMJ8HXgrtXeLLwV0/61fhAO8tsq80/qXwg/1+5intOhZV
         rcyg==
X-Gm-Message-State: AFq9FYK1RN+e7kL9wAbABHh7QNqeb/UvMCozYm4brz69O/DzEMcieDdL
	8MdBb+5ZDp1h9ql6fwH/1UBb07krLseHRyh8PiyAod73tFAQVOgR00w3o/Y3ScKun79wQAwpEmz
	bfKh8Fl5rxb3KyXWFPmVRNjaDaSZr70oIybLcpCdBC//BS+lwFcMH+18vJyiRzktju5iW
X-Gm-Gg: AYBFou3YpSOfcZB/3KtGMvgC+oyvxn191hc9ZVmiDrF9CIPv1SCWz/EhTKeb3heqPXw
	ECfq8hzJAPvcCbCauUcyln278lLdUeH5wOFIq9YgaVhBCuETq6Z0seMDPKCD43cx4TEghLoTrh3
	gjYLbjkPgJth6pKJ1YjVwvc+ubv/V2HYgr7sy1j4oQo6lwepXt43lDoh7DNXx/4GsepJ8nUT1Bu
	MZi912lo95hyohCmsckD2/KSnKaz6bzPPkRfuGHCQ/zUh+UR7p8I9LMbzABLDe2Kh3N7oYpJKRq
	pgUvyhlmD4IbxnD51yxHSpXl4AGVBghKlnoB4BioBJLtJAwfSV7R4nq08T0ehgzDvXpLWzwhVCv
	H0zyxoXOo08/yhB+oNAKcigQRaA==
X-Received: by 2002:a05:693c:2d86:b0:369:44b3:99c0 with SMTP id 5a478bee46e88-369e847b24fmr20368346eec.8.1793100843562;
        Tue, 27 Oct 2026 04:34:03 -0700 (PDT)
X-Received: by 2002:a05:693c:2d86:b0:369:44b3:99c0 with SMTP id 5a478bee46e88-369e847b24fmr20368294eec.8.1793100842969;
        Tue, 27 Oct 2026 04:34:02 -0700 (PDT)
Received: from [10.218.2.197] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a064510b0sm17653416eec.2.2026.10.27.04.33.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 04:34:02 -0700 (PDT)
Message-ID: <3a1f6a65-4406-484b-a2cd-00019149d4a1@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 17:03:55 +0530
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
Subject: Re: [PATCH v2 5/9] irqchip/irq-qcom-mpm: Program wakeup timer when
 CPU cluster goes to LPM
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>, Marc Zyngier <maz@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Anna-Maria Behnsen <anna-maria@linutronix.de>,
        Frederic Weisbecker <frederic@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20261015-b4-shikra_lpm_addition-v2-0-ac7f1a0d5638@oss.qualcomm.com>
 <20261015-b4-shikra_lpm_addition-v2-5-ac7f1a0d5638@oss.qualcomm.com>
 <b833f6f9-5729-4936-8c5b-cd42d32c5198@oss.qualcomm.com>
Content-Language: en-US
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
In-Reply-To: <b833f6f9-5729-4936-8c5b-cd42d32c5198@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RYwFmFtv c=1 sm=1 tr=0 ts=6ae08c2c cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=vCH4AkwshzAlar4tAyUA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: BKqfglJTc3mixkzHS4r71j4-pvIqlCxk
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0NSBTYWx0ZWRfX7j+Hsc7/bStq
 MWu5JC6n3RThcoPCgvjXE3tI9ewHpKxNS9lbhxRNmk/pXf0jhnpxzfhZoDhVwcNVgy0s1HZYGn0
 lLdQBGMjkkb22so3NULIltGZES1/bQU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0NSBTYWx0ZWRfX00f6YuVaqFf/
 ZNqrBuKCTW26J32XpdWRlnQJOj3Gj7gJV6mesBEU1DiLxO1aIJ58RZTUqj+xaoeqRpx4NbbJNsf
 IHwNkbzplQqP7MVjmh1KpaHyC7n0st9pHespvtgcHBrOgs6Sdn3FcijKnEVbi9+v/3AhFw1F+sh
 s0TDZMrTUxBe5BzoQgJaDcEIfeNFE2uklEICW6UrJI5Hl7M8S84L6vym5A66wn5Riv9pYWk7/zp
 gFRFayDOQ/96l1Q5X10IEcScuc2AyfW1bmlM3mgZlBIZ14BvkHgWZUWneibeIs0RqIc5hk3ksuX
 QyOFi73l34UXM4tha3SfmSU4NltMIZCfuNlw8+zC1FziXEApnmmpDjhDrEWc0BYzJzXimzlk+dl
 XPyXlrtK6O0wzpul1SIx2BS8HmK3Wekqg6uL8jHitgXP8RiutYB4foppq2hWneixaHEem+5cDRf
 NDBTBNueLsWF5HmUz0w==
X-Proofpoint-ORIG-GUID: BKqfglJTc3mixkzHS4r71j4-pvIqlCxk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270045



On 19-10-2026 17:26, Konrad Dybcio wrote:
> On 10/15/26 11:55 AM, Sneh Mankad wrote:
>> The next wakeup timer value needs to be set in MPM timer as the arch timer
>> interrupt can not wakeup the SoC if after the deepest CPUidle states the
>> SoC also enters deepest low power state.
>>
>> To wakeup the SoC in such scenarios the earliest wakeup time is set in MPM
>> timer and the Resource Power Manager (RPM processor) takes care of setting
>> the timer in HW.
>>
>> Add MPM timer programming when CPU cluster enters power collapse.
>>
>> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +static void mpm_write_next_wakeup(struct qcom_mpm_priv *priv)
>> +{
>> +	ktime_t now, wakeup = KTIME_MAX;
>> +	u64 wakeup_us, wakeup_cycles = ~0;
>> +	u32 lo, hi;
>> +
>> +	/* Set highest time when system (timekeeping) is suspended */
>> +	if (system_state == SYSTEM_SUSPEND)
>> +		goto exit;
>> +
>> +	/* Find the relative wakeup in kernel time scale */
>> +	wakeup = dev_pm_genpd_get_next_hrtimer(priv->dev);
> 
> This returns KTIME_MAX after the DT patches in this series are merged
> (because there's no power_domain that the MPM hangs off of anymore)

Yes that is true, thanks for pointing out. Perhaps we will revisit the timer changes
once we manage to add MPM device under CPU cluster power domain without blocking cluster
LPMs. For now will drop them from revised series.

Thanks,
Sneh

