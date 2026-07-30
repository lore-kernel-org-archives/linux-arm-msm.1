Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E95E13B19B3
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 17:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785431054; cv=none; b=TbBwMnNGeWk4ARPzTxH4NUggRGIFPKuWWmLzaScWfBNYFPMOZjjWEiIbjaAJzpauvNmUkcuPr6YLFgdy3rH9XF/5IR4TjL5gshbVXWXvm9lK3AIfp0PbbofNGPca5OeDjIMoRhV0HeqY8oXis5r8U+p/XpeXdiwXWAv5XCEcO6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785431054; c=relaxed/simple;
	bh=w4nxZ4t9jToYcjWqK3dqjw1l+neGGSxMyre0r+Uepz4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X7Rx02rLiwSPUqoSfMlyRQ4yxOg5NO1bJTd280w/SydxflwFvgF4h3TSFRUVRGza7t0V7pung8HAhfv3zEmzujulvKP5k/+v9WtjwrDSFhAQGaheO06JUK3DFhfDsQKhk2+uBtehN5riwBUQkdezylRTxgwC0RxYs8gIAheGhoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=embT7qVx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Izm6MvuV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="embT7qVx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Izm6MvuV"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UGWfe72556060
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 17:04:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8B2kKIkcMVLNTNUWOdUDAECnFfDkCwpTqdo5KvTH4DE=; b=embT7qVxA+JC3jja
	dONZn/Nb8agNVXRh4qwaVMTGSurrtt2as4X2Brqyj4Pl1i9NLXAcEFBL1k4GRwp+
	OpKpY6iI0ftKGT8TiiQwNAYM9QCX7/8uE/+rlDuh4vXDDyUNQJ/PTHqbRs1m7CiJ
	Cokc0kn4ZX2m9wCPGhyd462HusLWs09h7Gh7RLUQM065gEFNJvRfUn/MdXNGYrMp
	HgDOAI2YLUsCWlVSdOnjMaI1Gk8S3oINTfl7/4sBwjSUwb+iY1RJjZLMEviUvqzj
	S5Ypb791oFu9oxoGWdfng4MC0m3yq6f+AlSdXhmvyE31SZHcbZmwtNCeZl5E1I6+
	7OMSdw==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr8169133-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 17:04:12 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4960ae49accso18374b6e.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 10:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785431051; x=1786035851; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8B2kKIkcMVLNTNUWOdUDAECnFfDkCwpTqdo5KvTH4DE=;
        b=Izm6MvuVY6CxNndUBwVjipmQgscc8W1XQJyIuQ2szZ64SS7fBAWBgjO/UmGLdwVzk6
         VTUsed5skOpfb8vAOtLqOGxWTWdeaPq1f/R1AzIDEi+/anA5b4yBp5i0f3ttODizwOkh
         Q7IHomfl3rdmq4w+bOkC6JQ1u8qvPsc8JqpBrPRZ45NnwVSJerliFrxIpl2qCZor3Lfi
         q0IlloVmksLxlLMrXKB0wA5QkObVMdLZ3NQ/GbVdL95Zad6EayTLxWP9li+UHbwC58bU
         y5pSLhcyZDHDyr5oNcEH6J4iLtUBviLeE67p5HdXo6MKxtGFt1vCBFtYavTVhkw4/AX/
         VNew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785431051; x=1786035851;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8B2kKIkcMVLNTNUWOdUDAECnFfDkCwpTqdo5KvTH4DE=;
        b=OKF3Bj6FrQimIej/AJ2bFypSAuv8MTn3nsxshdHrN6ix7OTTpkFblX1j1bamxzTyhb
         4m9xK8mchZ/4XLAR4l/cXDnvIPWfklAPYcXSMH3ngVWbK46y4G9xL0MAO8315IOivKJx
         VO/tYO0G8bRpsapg3yUw1m9a0Fbe1hGi5BLCd/BJ5UmVIMgyx6rRJ0gLEdTajaV178hf
         kj0qY4Wzfe0sY1NChjr8f18l+bXTtOMzUWjlxgZxxyRChmMmcrYDiSo7vyogz9Orrh64
         d9+iv3stviTwnH6AFP88s6jw3PE4cyegcWF69Oo2NBd0IYaibCAmOgWmb+jccyUY0LFo
         0Wmw==
X-Gm-Message-State: AOJu0Yy4b45flpicjkOiLbEz7yfVbz0Xzrr+NxzFBM1Ld8zKYWIFNmYJ
	MlLZ4/3e4/8Gx5aOFyU/CW22Yt061Pnge6H1wpi+zJEYN8ule/WLM/fkTHcwF0nHC9QvCspCgcW
	6bB2b2r8lOzheAZCtb6GXzU3ggwQttwt3RiAfdG+Rzyt70xi/2NdbUK49tQVDzUK9AIw6
X-Gm-Gg: AR+sD10rciL+UkSHIRyrTrynVr/02NfKQ+m+Ji4+h0k2mmP+dndssIRFxUYGujdHeKI
	j5A9+TjcHDAQtzt7hTQHZQidpzjNX9Wq5nzXCC7ZgpLULWdblEmnUzo9l5EXgtJXyzgkScBcJ8M
	QdXNi0CHz5IbigsGW2u2+zQflGcacIK6hzB+ft6k22n34xzJRacW0jEkWF7bV0qYLb+/Oh/+t/2
	lsmJiA98o4wMWHcODpKp8uv1FhJum53QDivRF1olt6RHkqG7U616o/p1oJbmLhE3GB0O9VQz2+y
	BMQ7pfv4odr9Iej9zy19ReqZTNRsRbmr8aynisqVZyxSmxZeLLHvh7FOJHjfh61fYgi2PtvYCP7
	1hZkUUNEhU4zaHlwkmZZeN58P
X-Received: by 2002:a05:6808:1797:b0:486:7a1b:5a9a with SMTP id 5614622812f47-4ad954171a3mr1176956b6e.2.1785431051324;
        Thu, 30 Jul 2026 10:04:11 -0700 (PDT)
X-Received: by 2002:a05:6808:1797:b0:486:7a1b:5a9a with SMTP id 5614622812f47-4ad954171a3mr1176871b6e.2.1785431050733;
        Thu, 30 Jul 2026 10:04:10 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fa85dbe43sm93327666b.27.2026.07.30.10.04.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 10:04:09 -0700 (PDT)
Message-ID: <9d9eaae1-97e0-492f-954d-d683f089ef78@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 19:04:07 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] platform: arm64: qcom-hamoa-ec: Add SoC junction
 temperature reporting
To: Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <20260728-ec_add_more_commands-v1-0-771abd65ee1a@oss.qualcomm.com>
 <20260728-ec_add_more_commands-v1-2-771abd65ee1a@oss.qualcomm.com>
 <94081897-2e6a-4c8f-bd95-1961ca843478@oss.qualcomm.com>
 <95133f63-c7fa-4c68-9db0-2123cf754f50@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <95133f63-c7fa-4c68-9db0-2123cf754f50@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDEyNyBTYWx0ZWRfX2EQHmH+GLQFS
 PGA5K3zdy+gOud8SXe34v3ljSYA6S+L7fkhDI9XELoTLzPy/d97pbAqXnMFwLeuGKQEu3jPqHBY
 XsRZ3/Q8884jfxvIphVCC5lLTrI548BmJWU8oPgtoKa2kxjEm0a3P6/JL/QVlYJi2Lpvqf3UJEl
 sHvWMCWGwe9NftkV/c5HnGg17QIUZxQBY0Q0pPu6qJ/BMqQEBEwSuW/o/D7WBHHEV6A3HhEaRzG
 NktSq7KnD6QZj8osUVuDPEBjNW5r6v/Hc+rOJ0jDpBSxRMsaV7fJ0UY8QcqZiU+C7E2AQV1SwWP
 TrLhJiDXBePlcwanb6oHKG+JW1QJO2p4P6HR7KbhbUraXMf7jJbg4FDDkmHeftXgJeHTbCfH8Bw
 8ciBWKoYyIXym30w928MV8ol+dqrGPAJuh0DZG5AHV6G+FAt+6hCy6gVCWAc403fbDTNsLYOVlF
 /aXqi6nAH4GI1sG2SRg==
X-Authority-Analysis: v=2.4 cv=LIlWhpW9 c=1 sm=1 tr=0 ts=6a6b840c cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=j8X-GRWtO0FzkeSpfNQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-ORIG-GUID: RqipW-vC9cKuFh1Fc6n1YeCKAXl0laK0
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDEyNyBTYWx0ZWRfXxURws0AbTvz1
 9fKziCnn5ogQTjMbde/p/60Bj+NgsuC9WRH7u7r7SlHur+7vINbWdw2vz4GkE/FDRn7ONWKb+Vd
 2G6Ipe30XvEz9Z7fUyDezmOL4dVRHXY=
X-Proofpoint-GUID: RqipW-vC9cKuFh1Fc6n1YeCKAXl0laK0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_05,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 impostorscore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300127

On 7/29/26 3:03 PM, Anvesh Jain P wrote:
> 
> 
> On 7/29/2026 4:29 PM, Konrad Dybcio wrote:
>> On 7/28/26 7:44 PM, Anvesh Jain P wrote:
>>> Add the EC command definitions and handler function for reporting the
>>> SoC junction temperature (Tj) to the EC.
>>>
>>> Discover the platform's thermal sensor to zone mapping via the
>>> qcom,tsens device tree property, average the junction temperatures
>>> across the mapped zones, and periodically report the result to the EC
>>> over SMBus using a delayed work item. Serialize this and the existing
>>> EC command sequences (firmware version read, thermal capability read,
>>> SCI event control, and the SCI IRQ handler) under a new io_lock mutex,
>>> since the delayed work item now runs concurrently with those paths.
>>>
>>> Re-arm the periodic report on resume and cancel it on suspend to avoid
>>> racing with the modern standby transition.
>>> ---

[...]

> Agreed, will split the devm_add_action_or_reset() conversion into its
> own commit — it's an independent correctness fix (also disables SCI
> events on partial probe failure, not just on remove()), unrelated to SoC
> Tj reporting.
> 
> On the -13 during suspend/resume: that looks like the SCI IRQ firing (or
> its threaded handler still running) while the I2C SE resources are down
> for suspend. Will dig into whether the IRQ needs to be quiesced/disabled
> around suspend/resume here and follow up.

I hope I'm misjudging here, but if I'm going to talk to your agent
instead of you, this is pointless..

Konrad
