Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2F3B3921F1
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Sep 2026 07:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788422184; cv=none; b=dowHiGlH6fstrqhYFvPW2eayVK/M4GIr5oQPhq6kXQxYzWHl8oG6NL01gsqjD6IRupR42UkQTKpHXVGsjHrz4FcXG0gbnAcdCFBksh0+s1cxcS44oh+YVLhGeJDkovPyCINelOJ8DzcGjDVF22/7dFSUMUYORXjt7gMiEF+sNug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788422184; c=relaxed/simple;
	bh=4Qc5+bea2kI2xGzw0WkDPMlUpgCylUKO+0faw6tO2IE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k86DbzWxFuIgHKeXQzkcC+KQBwpkIoAcdVBY4JewqbnGsL0LmRf0ByBmnwmmvRew4WSvxtBdS2cfoiD8M1aN4Vz1sOFV+iZW1UIQT/qJPJRJDvF0QQFnaXIAqWWYQm9wNyy/5X+Z8J5p23Lhd6TNiLW60WMriQMLo1C+x+gxYKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FyTelCTD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=faevgEqK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FyTelCTD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="faevgEqK"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6835lMq8324633
	for <linux-arm-msm@vger.kernel.org>; Thu, 3 Sep 2026 07:56:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XHPJP41TgIHU79zBOphfgD7yOzfEA7cgSBaXkcRYWcI=; b=FyTelCTD1dOsKdch
	7HScrYaM12SfvKsgHDCiNPhLyPavKw7PUGL+EJO4VfCuWWT5YC05smHrZOW1Eyr9
	dwyJUDj0bZzA5Ih99ZjUhfQlqNEe+DW+iffjmLbxlfWxQQq5G5/8hPD3kvKszLWy
	OqTfdDRmOAgBPqbJPfyBlUq58UcfKIjXn0aaQEem9xtNFs2KVPHlgWAn0iacyqSQ
	ggE1kP48m3XfHzlgJc3sMPaSkSo2h9mV51Wy5hd9y2uSGhKnGsW1mK5YgFUa8bR/
	OSCVv4LIulO5XBWZBCM/QHtUMXykrFB8jz2Xv+ee6ghPevK6sny8eSmLOan/R/kH
	9g3XKw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gerdnb6ps-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 07:56:21 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93495488976so49279985a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 00:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788422181; x=1789026981; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XHPJP41TgIHU79zBOphfgD7yOzfEA7cgSBaXkcRYWcI=;
        b=faevgEqKJJQD6NR5HDYlW6z4Q1K/VRCrTgX52FsZnxeMzmewQzZvSjh0ajBkcsZwXL
         YoogVbZzaFu6tgna0AGncZF6kCKQzZAIK1HhTErJI/AyjYPwQr5YtlAv7hIiagKHyzxb
         XOjeZwfDjGE1jJo/sgRDp+5Fx8j1O0qtMnVTorwtsYZJf4krrNhgA8mLHOFVfw7mC8p4
         1L/4n4tikTroASjfgLocwcXUtGLFu37Fr7vq7G95S6UthcwuJUUS81QjNXx2GsWloXy/
         wkiKXD2iyeWzctMeL+QtiFkfTit3NGWMxXq/EZ0hYY0wMCcb9266Ccee2jwUntFillDp
         MbkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788422181; x=1789026981;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XHPJP41TgIHU79zBOphfgD7yOzfEA7cgSBaXkcRYWcI=;
        b=PIsrJgLzmUv24HFIPr9AETnSkLSTAbjt2OT5Eg3T5nTnb+9/C/BMMJPTlcLNg90fC6
         Mn6watjJlsplyhosSIon5eSurGBhpOSyMHuRvKZDWcbTV0yunWuJXxrThs0DcCJLiKjT
         mRLKZNNW3tojtWmrDex1qsrN9S/2txDG8O5PYt1QIYlVrEHPdhfOPpklSm28g6EwR7u1
         uBqp9ndnQppvKO5MiESRh94hkHviAV30wzQWvwBAixdQIvtWX98/wamo01pf/zUZ3oUZ
         x4VUDxxJEzwnT8eUo/NNO2HWclChoKIBsZ9fcqUNC1NOZ87zKroZJ098l1RqKEmc8aJF
         IUqw==
X-Forwarded-Encrypted: i=1; AKwUvBymkfNVgDUuze+fMGqp7pET7LY6Mz8jPArP34BkFpCtJYZTAA6XKnxjWX+XnF35qmO/VWOT1xNmGNlVcVRW@vger.kernel.org
X-Gm-Message-State: AFuF++l/XP3QXwDP3UVMnd+ma8Y2ovrXjtowRUg0KL70mkVYneLs5bWB
	tm45xa88lgICnUatScwxtI9IkqLUt55PdDlTWkyzwsCeKl/R6SSoc3xTyRy+Oo13Ei/81xU3hkF
	n2CW8XZ+79nNzOjWHQB/d2NfJw3ccAiZn3456cXO5IFZGJMlyCgsTJyypISCzPmkQ66xp
X-Gm-Gg: AYBFou10QKktb5tUgf6TNiCIVq4yf+4wRnKpFLvrM+rio5WpMrw0GNOhrsLnSiw27Nn
	7bh37qVeiCP29IKYGG9R2x/sAW36MLZK6Iq7PaQytq50kuFW7H7XoJWj0dHhyevO4cMC30uFyRo
	9IS9DDMojSg+Tgt1JPPf8rXpAYC2bCX7cwXRb0Hsxy5qKn7NOL5R3cHnXHV8S4ADUrT9QUs8Ibf
	/PDpv/cvcOvGU0FJabvS2fVIVRbyioV86mKAVM5FivYoHRbIUE6celkACCKhSMzksfr1uPs/Lnh
	kuSKbTYGRX9Mkzzs5SjvthDpLw6bpPDTOoFo25BJellTZiNyjv7B22hkfAcJHA+9j1uYyi6uQ0D
	QopcVignn1lt52CT76ZPUiA==
X-Received: by 2002:a05:620a:2622:b0:936:6e2f:a34d with SMTP id af79cd13be357-93960faf11fmr771673785a.3.1788422180765;
        Thu, 03 Sep 2026 00:56:20 -0700 (PDT)
X-Received: by 2002:a05:620a:2622:b0:936:6e2f:a34d with SMTP id af79cd13be357-93960faf11fmr771670985a.3.1788422180245;
        Thu, 03 Sep 2026 00:56:20 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25f3eed0bfsm60697366b.7.2026.09.03.00.56.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 00:56:19 -0700 (PDT)
Message-ID: <287f35a3-9979-48ba-9c49-e8afa5ad3946@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 09:56:16 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] arm64: dts: qcom: Add initial support for Nord Ride
 Embedded board
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Anandu Krishnan E <anandu.e@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20260831032103.341633-1-shengchao.guo@oss.qualcomm.com>
 <20260831032103.341633-7-shengchao.guo@oss.qualcomm.com>
 <a8396c00-0704-4e7f-a4ae-44acebf0a470@oss.qualcomm.com>
 <apkkdXShqnYiGx8q@QCOM-aGQu4IUr3Y>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <apkkdXShqnYiGx8q@QCOM-aGQu4IUr3Y>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YcmNIQRf c=1 sm=1 tr=0 ts=6a992825 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=PnXPAKEUq80feH0KgGIA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA2OSBTYWx0ZWRfX2dnmUlJjJZpt
 64kGDlNxaB/CR4ge7Q6BsVlrZ+qskfuuZruCs+IatfRM+0L2z2nFGvQvI06j1/QZlatpGrEOuMD
 9Vq8gLnQtbsmR7+4AX9cb1nQ0QbQUnY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA2OSBTYWx0ZWRfX/GRjsz1zgQSl
 pxxI5xUH8LOLTcs21q3hs5OheOzBPTg3bcpyVkZPILN5z8SdA5riTxKdG7nCkSldzvMxQq4QzbU
 48pYhe2kVrnjUB5EKt0oQgtTG/NHE0UophTHT9wToWBALpqX9I7K7jeW/Mk8CPVtuPZloXmH5mW
 APRHRBL9Q0wiDk9eP/bL2hKgbMgzr0Vy/BsCNK60+J2d7BkJrt+5WL75TkKamxVVWyP1RZk9RRk
 MymJQ2erVIz/k29or9+jhQWBtGEBbhYpECBIhEIvkkxwB3mnVaCo5WH6AQCCw1TlTZ7YxyxVE79
 LSgQstKvMwm8luBf7nW1Do8Mlkqp+VmcrRWCCy6UJtEwf/RQ+L13iIy5SNgRHu3ZbNFmOYC6JzA
 1hUakk0zgv9F4UCrEN1qqJcXjEaU7bYWxQF/5i8pW3zEW52mJO55mmgoVyDuYWRt8a0IlbUBbwu
 JATe84PbHEMnJvtI5wA==
X-Proofpoint-GUID: 9M45X07qeFEYLY728pC7A-qACc47gjCG
X-Proofpoint-ORIG-GUID: 9M45X07qeFEYLY728pC7A-qACc47gjCG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 phishscore=0 impostorscore=0 spamscore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609030069

On 9/3/26 9:40 AM, Shawn Guo wrote:
> On Wed, Sep 02, 2026 at 04:00:52PM +0200, Konrad Dybcio wrote:
>> On 8/31/26 5:21 AM, Shawn Guo wrote:
>>> From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
>>>
>>> Add the initial device tree for the Nord Ride Embedded board, the
>>> non-SCMI variant of the SA8797P automotive Ride board.

[...]

> Since we agreed that a bit comment is useful [1], I guess you are saying
> the "satellite (CD90-73961-1)" part shouldn't be there. I will get the
> comment aligned with nord-rrd.dts.

Ah I forgot I said that :)

[...]

>>> +		vreg_s7i_mm: smps7 {
>>> +			regulator-name = "vreg_s7i_mm";
>>> +			regulator-min-microvolt = <300000>;
>>> +			regulator-max-microvolt = <1200000>;
>>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>>> +			regulator-allow-set-load;
>>> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
>>> +						   RPMH_REGULATOR_MODE_HPM>;
>>
>> Are these actually exposed as regulators and not RPMHPDs?
> 
> Great catch, Konrad! These are rpmhpd-managed resources and shouldn't be
> here. I will drop them.

Don't you get a huge log of errors with these in place?

Konrad
