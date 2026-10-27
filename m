Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793080176;
	b=SUrVb69J03m/BDA48XulqGB9vxVYBIXK1mBsp8mByr5T0eLORUTJ3vMXynjNhewtxcCf
	 AzmFN5ow6ZSllme63ljJad4bX2bDGUH1pUX9KlcezNbm1Wk95Udlb6zx6g98c58QSw+BF
	 Wxze4FKbY7CFUqcCOiiScCVrdUHha7v1I+E4os15zm43YGNskO80+s8ZTl0HHBJU1j7wt
	 Gum3z+3WoNUpEyiXf00bP43SNyJmDaOlMIKI47tGkTvvwO+Q+/hq1nno0snHSmaswK3M7
	 VO9ALPU1T/8eT2NeF6JNWn4aukQ9XPpysOnTALdssIkOtLXpUhV0Uojbi/Tt15X+9cw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793080176;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=tdDzzb7njMmvh6JgfjhgDUzQ6IjYVoA2SUdOnYKOXKI=;
	b=fiVXrCxzeOxcn0nLveWzOWGtHRHHFXM5X+59eq5XtFcnLCl7X19CsqLjKJrkNePoLmEa
	 fyvc+hN+BmG9mpvZ+Hd2PbUTz49Qwmt8dhZc+wOFVrM6urHmZZfHmdy7wxz+KqWx6I3fS
	 QrqCvPN6MXvYqBhnb995MK2ooq6PhuNmTmtmU25wIovBvInGbhj1Cu/JJ/ITcjhKiZA2u
	 OEx8sChx7n8tkgeo9r08vCIvJzueGji3wEh3/05UflTOIh8MAKceP/4l/y5Qubs3PmWdF
	 yO4kU751p8VIU7DsQvCFNfMG0FHx7enR+MkWcz19N9bA53HuyH5+7YWoPikgDge0g1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hpxGzwiZ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=S1kPF1X2;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BD76606A31B
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 05:49:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2BD76606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hpxGzwiZ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=S1kPF1X2
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69R5iCqD403997
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 05:49:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tdDzzb7njMmvh6JgfjhgDUzQ6IjYVoA2SUdOnYKOXKI=; b=hpxGzwiZiSlsGp3P
	W9QLw6M5XPzomtb++twUI+iwwedHrG60xbKa5/ILDrcktnaL8yM1xnhnQSJd+6vp
	LlMANgU6F44dEUtizmCSHj2LVn/A8yK8VbrPG4P09Y8xwRVdkFHNY0w+6o911b7q
	ZkYvQqHC1oGi//5Sru+Pqu9NiTyW4IjrnN79PHcD5syyurmMO1kHdy4pjt3oY5l0
	n9iFcrZtUom7HSIA+eBGfzZhPijKgXGmLMkr9Af5OvxJbS+pdXMpJMayHvcErtaw
	pkBQDOkZOtP1h6QXdCOH7IQ/WAZCoOEVq7Qfs6A7DLIX8aYCC78upfwusa9y20R0
	GHixMw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjp2t80ga-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 05:49:34 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36a190c53a3so71683eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 22:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793080174; x=1793684974; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tdDzzb7njMmvh6JgfjhgDUzQ6IjYVoA2SUdOnYKOXKI=;
        b=S1kPF1X2dQElSSRL/X4eRA/IESC96043BV+ewUBnp6mHjymkXvsxnAnDXQBxPr3jJf
         9kbsZyS3NuA9T9f22dX0U+SKMiZk0Q7dci3wGy/R8Ovi0p30hfql7wVhwtHoDHog3NIW
         64YX17NFVuvuqnTT8XN3HX3VE4RtR/dDlA8FGOjrJpn9NjEpy3yJqfmYpC2STi+aaVL+
         KEM8fL7MW8kOyIWEqVaNASlggeAHimxBbmDgKBzfCMoAUuPqpiNf/AITxvr6C3Fl/wOb
         GM0Xtplge7v7OJx8gqchGf8RhXkaFD08fVd5LessAYGEcXISUN2ge55RLZKywt7RW26E
         Bp3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793080174; x=1793684974;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tdDzzb7njMmvh6JgfjhgDUzQ6IjYVoA2SUdOnYKOXKI=;
        b=xf37eFHt1WMUT6DE2E4FiUvZQIt4oYBnGoO5JkL8kTfhj+y+BaEHY89q4w8YDh6q1x
         U97UnAUiGWKbo0bbhjI240N+nCsXsxjqCARNx0R858yut9fPrMUWHca4rjiD+Q/tBxSd
         zEAvGQa8/eDHrOMStIRBYOgBf0YoZfKA8E0JtmdBECfJlve7T/ItN8ns6eBkEnnjJ/F9
         Bf/vhxst8U8zKewENifTZft3tlWVLiMGUB44Q9MIBBiOMliLIWpisla+5Es7wAVMPAGp
         OMQ4kX9WqwjfqfmZBTLh6Kv7KDsbCHeREFihrjhb4iPc/dDwlIeWElHJDF1fGZabu+XG
         5mqA==
X-Gm-Message-State: AFq9FYLWRuTB6OrypvISYaII5lssABwFkeYUgSGTqI7Tn+eKzFoUrSaO
	feFSkvTKcWfLbf3UPJg72HSm65jpFnzVFYAWw0beuZBZ98TAQsnTdstBCotRNim4nd4GdwDlojy
	t5OSyd0tQsj3CbxTSyFtUl47FSkbzP9MreYxLYj3x7la7cq4LvEMddxelaVf090wE3ujE
X-Gm-Gg: AYBFou0hjSQ5puPyVdTmkDvX9zFmIesyDftcEUlEQ+A6U/rjfH9Y+/UjTB9wBvNiauy
	s82KgqJCKDb0IW00fQDi4v61Xqi0Sik63o7qaTH/SVMYZHBd5x9Y9N4jtFAq610mSYfhALmFoxe
	U5J9GeE/KWGdyFDkHz2t9tiCrrLOkkYa1sBiksPsIZzs0TvvMO/rEXKB3HDiXD7L8OlKOXqA+s0
	zCte0LSzTiD5X33HNOSmVrLHE+Ld2d2UNvBUVGck7Wy5Wg7EFTnpDoAfH8zcD9rUcreEIZ/ubqE
	vFRzR7WGsgrRqb7PMTUwR99Z7AkxuFotiIeyNZzXgqCohpCAq+uHJvolLJ4K1Tcahru89MOo4eT
	0qEEbHIzXCsjJErpiL5IQnTNJxA==
X-Received: by 2002:a05:7300:bf13:b0:369:fa21:ba12 with SMTP id 5a478bee46e88-36a0f7df5ecmr2031704eec.7.1793080173578;
        Mon, 26 Oct 2026 22:49:33 -0700 (PDT)
X-Received: by 2002:a05:7300:bf13:b0:369:fa21:ba12 with SMTP id 5a478bee46e88-36a0f7df5ecmr2031669eec.7.1793080173027;
        Mon, 26 Oct 2026 22:49:33 -0700 (PDT)
Received: from [10.218.2.197] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8d93663sm35294210eec.13.2026.10.26.22.49.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 22:49:32 -0700 (PDT)
Message-ID: <9cb32956-53ca-4f29-95f4-ceb629b9e884@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 11:19:25 +0530
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
Subject: Re: [PATCH v2 1/9] arm64: dts: qcom: shikra: Add CPU idle states
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
 <20261015-b4-shikra_lpm_addition-v2-1-ac7f1a0d5638@oss.qualcomm.com>
 <1f9c34ee-7d30-4ce2-9e88-93612eb897fb@oss.qualcomm.com>
Content-Language: en-US
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
In-Reply-To: <1f9c34ee-7d30-4ce2-9e88-93612eb897fb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=AJjzCM5L c=1 sm=1 tr=0 ts=6ae03b6e cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=3tai7eX4eetm6bD_N14A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: _ZNLG0NrYA7W9d28RMB7lTckWm1S_hcR
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDAyMiBTYWx0ZWRfXw6PW6Ytg+muj
 xMbOym9PH99X1vZbQuSX8W9FKxjeI+SmghnuDj/PcSotP0uzved13+tjUnwSULA5tJVofPiD8lW
 yh/3JdMyzCjcHMRKDk/BcPnXa6/urDA=
X-Proofpoint-ORIG-GUID: _ZNLG0NrYA7W9d28RMB7lTckWm1S_hcR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDAyMiBTYWx0ZWRfXzKTw9rj/OJZ3
 K/6aAi+QYZJl3+rivnd6tA5Es+6GynvTz6qDhb+J7YZI/Frw4hx5BtjgFu26ur+X/fzKYZMuOB3
 EYvsHNkoJuE46gOFsF1DvhsjpBuAunTNRyYcMx+ivMjswglHi1ZgvJz0b5B7dql9NCeFOxzeBrJ
 yISDf8aBFlJPMlpgAxwQwv+6UfFuCkkU3108RNTIyTBL7aef3rjviGNZ8pucHh070To6iIMr8Kv
 HDFMOnupnWI8qrP9y97OMwoAnM8mPSCEHC0CRvysczeCD7Kj7bAsssXPGdk8/cgSZeEVDtdly9b
 +Dv94JZ6eI3zQxNwszHFqqu0TWt8z7vukK7xJ8nkhL/onknO8GZMHX1UDixwhuk0+dKUVJHhkr3
 bWzRpKxM4XxLE+4A5OB8SvS9ByhcgalZV/Sl2cV4Cny4nTl9upsA/hx6UxoELUo4k1Mget+7lfp
 /7hJIyw0o2n9EfY5JLw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 malwarescore=0 spamscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270022

On 20-10-2026 19:29, Konrad Dybcio wrote:
> On 10/15/26 11:55 AM, Sneh Mankad wrote:
>> Add idle states for the  CPUs as well as the whole cluster. This enables
>> deeper-than-WFI cpuidle.
>>
>> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +		cpu_pd0: power-domain-cpu0 {
>> +			#power-domain-cells = <0>;
>> +			power-domains = <&cluster_pd>;
>> +			domain-idle-states = <&little_cpu_sleep_0 &little_cpu_sleep_1>;
> 
> nit: ideally <&foo>, <&bar> instead of <&foo &bar>
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

I will take care of handling this in the revised series.

Thanks,
Sneh

