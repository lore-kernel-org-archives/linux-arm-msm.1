Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793095942;
	b=navXpySYYuljcmQ0LpA0ReE6cOIbeuFeF5dTESKCkg8cqUvdWpRCCe+c5L7bjnibrlJn
	 0EaYF/MmUJd6K4Dq+4ZiS5dyblKjF0DcRLopnnOiAJj0rQV3re+az8ON8Kx2SV9TJhjK3
	 +DC/4NxCxIaiXJQ3Arm8uhbAncoqiW/961buz76K0T6XKhzzzoWr5wt9TdqG7WdZ8zMZi
	 ILbFhLBH0h8KLXez6QzptjqrbLfuFq+9fq0IzOQxmH9j+zkVFDdhj3zylrunxOEMSCFLN
	 hi2M35kuFAAtAqL9esyGIRZytYpbcpqOaosX/iib9FIhTuppjQioxBmaLTiiU+x2KIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793095942;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=dZnFHrUl+Gj/kFt3fJT8/StQYbFIpGVV57CGxmYbwtc=;
	b=uhjSsZm0TW5nmGGdQFh9dVSRgv9mJ2BXIqN58UllJrFyGEyvwsuFIWUDe4oDo7Ysg/UR
	 2j/dxghm4Qe3ahbZvSyQAkZ64iyi2kjKiIJcb8vZW89Y1k5CDttnNCLe6psMqTsGmFwD2
	 BAuWBSjFX5sxqTJt9scUuV8SZERj5MBy5cIqFd3crcvzQ5fWtdpuz1dndS/r/OVVVh/DO
	 M51KU8MgUdqcUzo7ytx9r6Xz5zwXShN7WfjHeYkAu58iVP7MuVd7tlgjOybW6RlbaDSoN
	 kWbwgIz6odb1rZFdL5ode+i3rHKTkIpOetlDj8irUrPufRK1IiiCgeA2tZPrrsnw70g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fLSBDTaN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=akr+87RG;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4A5B606A31A
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 10:12:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4A5B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fLSBDTaN;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=akr+87RG
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69R9wXiY1882216
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 10:12:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dZnFHrUl+Gj/kFt3fJT8/StQYbFIpGVV57CGxmYbwtc=; b=fLSBDTaNKRLh2hEr
	yvyVAWGqth6HKonr+sPGzLCqrP94y6OfJVrcQOb7vtsi8pwTKEGTU7ZPRP3le/+h
	yB1AEwd2EC6jpgcfDUBWBKtZq3csFAAkwFs4BswZCNdCOTHwPJX+pmiGhIjUGrh+
	n/vgq6LStHXHpVxWp0cNwCnC+uvgL3SKUjEgwZgu3RAyBXvybGH1e5TLvp/pv1Bu
	HffWM7TtzD+VgivKG80LzGqKzNAxjCDY7c9oEoqnfx5NN9icM54jplEZKTGZrE0E
	2Vt6LgFs/wuL1lSS+r4nsCOW1k+nNMvHixLWByJGRtQraiGlFGjwyaRRXFGZ30GU
	66E98g==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjst1g1nv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 10:12:20 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc7e0321ec1so5228376a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 03:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793095940; x=1793700740; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dZnFHrUl+Gj/kFt3fJT8/StQYbFIpGVV57CGxmYbwtc=;
        b=akr+87RGh5+qXhfPHP3Rc+Wxe8dIyairNR+xYvf+E0FnpVyXauNn4cXK7KCPj5Mk9v
         KnNArUR3pqWz8hc8j8wCTwXjlxzf+9yUerjU3GuVA4vg67MR1fczxAhl4e/J5rZdpe4d
         RrZyqZnxgsgMfDXfkY1VdL3Avfjf6bnZ15SZ5L5YuXPlEN8CqU9ABbuD7yPiojWfR9wr
         r16dDpJzWoPLkXe+TM88PPPzvpcXbEbgE6Z4M8yulxHOf/KR4VFfZK9S+oOaC9OK2XmY
         e2GutPTEKhI641/i6aTf3Q08bMihlpOgpj9cf3uB4Vdzb5VWszusbtIHkIOYL/p9TZQo
         kKnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793095940; x=1793700740;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dZnFHrUl+Gj/kFt3fJT8/StQYbFIpGVV57CGxmYbwtc=;
        b=s7ZzeMY+6M8MBMBMzsmPmCZSCtGYsf/58fyJ3wHphE0RCRXtO80R6e9TOo8tkJOiDl
         nel6Am9BZ/Ppbq64f3l6jdsVSpLU/UbRfh5AvZJqMl+rSWY2h3VJpQGfjdSTLam//9vw
         cGGn/aYYPnLR//rrbSN3JJmSyGHbdJ5jlh2IWuoeA1ndeOzTrudEPNNlUCwr5DqnqUac
         WTx+dF/HryjY9y5arcGzJQeUn8VXpDG40zEZHe0b6jGjFy5lefoXioXzJ27ADymy/2Ud
         awA3WmUvwmHGPoVfdkzZTsoNsIBPNW1M+sWgunQACXl3ahhrR9AZjJ/I6Bc0SydF7xOb
         VCVQ==
X-Forwarded-Encrypted: i=1; AKwUvBx25kmhK2B5UaZgu04ETcVQ4VTi08yM7J9hvMOtBkvSmp4vkZJ9dZyWeYGchnI3nLbV3M6J5jWHiJrd7Lp0@vger.kernel.org
X-Gm-Message-State: AFq9FYI0w73g+lOxK83cdm5z1APBrRARnZG5D4lbGI/rhBHz3bT4FIdG
	84IGOPKZpPF47vHeyM6T9JiAB814B3M4wgxv6bu4tJTthdN1CbJp3DY0PDaG8/aIFGdlm0bhN6n
	zgXKmp+dWdCNb5Y3vSM6WCFOouY+FyHTJd70OzLYcQpjVTQM8Gvrvgzi9P/0Q4SpDQ9L7
X-Gm-Gg: AYBFou2ZpzConN3i4yKB2u01WeKo2kANBc82LEla3Q3nm7IWZ65uS06yoiK9AVjsYKS
	UFWUULsS9XDzamxxJO1qDXIy7O1Vs75hqM8RBC24rpIZOSAVZddRmsU1U1Sq4wGz/WygzGQcBzj
	hiJ80l7CL2XUWuE3tJl93C2LOvKUhjVJZlcW5u26FXuHT5gGUMNTHL6tmoT73SKRFZGpaNjqnRU
	BmopweiHQb21rZtZvEzWU4g5/4OLyjnLrcOjkgj0Y0EKtFTtqdQvFdGL97xO7STF18Q1z4fjKOG
	meiIhrpOikseiR/mv/1t41hpTNVMkvvdImaoHXmosH37nnytSRqqeL56lyHWsvVy706RBB4JoUJ
	EhiM5L8ES202Dagfeb8SILfjuOBneDQFJXBWCeovVfnkvThgOIyy39mhS8tsnc7jmoUI4SG4I0Y
	PsVI5QfA==
X-Received: by 2002:a05:6a21:35c6:b0:3e2:3392:53f0 with SMTP id adf61e73a8af0-3e7bfbdbcb0mr6810834637.14.1793095939979;
        Tue, 27 Oct 2026 03:12:19 -0700 (PDT)
X-Received: by 2002:a05:6a21:35c6:b0:3e2:3392:53f0 with SMTP id adf61e73a8af0-3e7bfbdbcb0mr6810815637.14.1793095939506;
        Tue, 27 Oct 2026 03:12:19 -0700 (PDT)
Received: from [10.219.49.187] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8ccc666d1sm2442498a12.16.2026.10.27.03.12.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 03:12:19 -0700 (PDT)
Message-ID: <7f405774-f6e4-40da-994b-02c8dfe8d648@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 15:42:14 +0530
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
Subject: Re: [PATCH] ASoC: qcom: sm8250: Limit RX digital gain to 0 dB
To: Filippo Falezza <effeffe99@gmail.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261027-sm8250-rx-gain-v1-1-386ee6d971db@gmail.com>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <20261027-sm8250-rx-gain-v1-1-386ee6d971db@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=HJ1WhYtv c=1 sm=1 tr=0 ts=6ae07904 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=PDEUqFOJZ0MzX4fEFhsA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: SnHSZPLJFe0-ba5IqPKJr6RKi53kaGGE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0MCBTYWx0ZWRfX85My20H/n4V8
 31WHyzKvUwOLIRWTnkkQ1DB1XThGGx8c2QxsMdm8hmqUL7UmpgPtMD8nLwD5SRLiBjjt6J0CqVe
 hlhmW4JlzT//IzbFgRnTLLW1Uz4PnZU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0MCBTYWx0ZWRfX0D+7A8WjwKYn
 oT55nrOjSVkIQqjiVsz1Xcy8w5yC/kuDoO+njP/hKUml5MT3tM2vOrsw8HWrD450y9nI9niEXu2
 tVxyhZkKKb27ZwhjC9GEs8xLCZh3A+xPNG4DA7M4w07rMXzWv0tLridTnXF72/1nMR6PGoY6bO5
 eoAuL/KW+fpImAoJjye4rGMFziXOtBHFxl9+vsuvFUt5z3ar/eg0o/5U6rov+4YYrlQbpzBgl9R
 5F+pk7gWhm7KCe8b/6LAxXwvQARhScxGT2gxnRczDiOxDPCAc73Wqqzk/MqwYpcnfIB8o0cT1qe
 1cvoyD74TkRYYqwQZtyfZgVcqp81rcGDW0krRz10sqleJrZhyLBSQXhX4arw/QpEB3Rq8ldxXDD
 OYZ2DeOUxKmZ8f8iY+l3BMTJN52Aj8jZvzXn2G0YMzKfDZ02FIAaFA9wVHZL7tX5bFWtRc/c3+C
 TzKodzWG2MHpUAxNxWw==
X-Proofpoint-GUID: SnHSZPLJFe0-ba5IqPKJr6RKi53kaGGE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 spamscore=0 phishscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270040


On 10/27/2026 7:03 AM, Filippo Falezza wrote:
> The RX macro interpolator gains ("RX_RXn Digital Volume") run from
> -84 dB to +40 dB. PipeWire and PulseAudio map full volume to the top of
> a hardware control's range, so a UCM device that uses one of them as
> its volume control plays 40 dB hot at 100% and clips.
>
> Set a platform limit of 84 (0 dB) on the RX0, RX1 and RX2 interpolator
> gains when the RX codec DMA link is initialised, the way the sc8280xp
> and x1e80100 machine drivers limit their WSA gains. 0 dB is the default
> of these controls and the value alsa-ucm-conf's rx-macro init sets, so
> existing configurations are unaffected. A control that does not exist
> on a board is skipped.
>
> Signed-off-by: Filippo Falezza <effeffe99@gmail.com>
> ---


LGTM.

Reviewed-by: Prasad Kumpatla<prasad.kumpatla@oss.qualcomm.com>

Thanks,
Prasad


