Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792582942;
	b=IZqXljVhqL+bIXjD2CfVd5XVZb3ZzROUME8ALAn5Yxt/6oc8CoNbHKB4R2WCUCYZ1Hnu
	 YYEbpJEBoQEj3FOvBY7kFMilf2RPESXUOlbOXo8naCBal4pk9WvNfrPDrsTtkStfkOtoL
	 cnHeEz5sp/iBEdDP7DRjAW/sBiiID1Rx3sztkqy3kbspXcQcGblWLgXJXSk81aHQblus/
	 bGReqG24gBO4lwcKbR+ohEHs7fOACOsS70QErXrDX+AMO7NcTycP7lgu7X3hjF1eR9kGo
	 9idYCZ473Se9r2H/Tub3kOz+unVLWo4O4vgwgIzJ/OWf1XrzaHqA2kg8VRbwG4iqAaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792582942;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/GfvzbAUAClHbLW5u+kloXy8aTuazubWTlp5Yod8NHQ=;
	b=brbZDWppS+LNolKFAKhIHLoKW2RyLfq3dBB1NKvyU/U54IU4C9s7m/YylfWiOD0vYT+9
	 AgL0e0jLLHOUAWBf/OyrNBMv87kSdU5aEhXp4hPUjGdFdY9QJPB6MnjfZ3WvwZCZAdl5u
	 +ILVX0ehwkONJ63uhKe2GYd3wZYkhZL/2oEqQgeavMHRpOyXQnAxKX3JkHKPmVjF16JQ/
	 04zfvmd0/Ati2/Amk0Kmy778CTo8vFs3p4c3J1eKsBUDaHq+aD+QtJKLA9AIs2HTZug+1
	 3in4owoYlSlWuaXMwi9vMnHeoj4IQQ/jxQu2tyzdLAO/b/HaRqEBCgmjczJAK/2EW+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Por4fM2Y;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kTIPRVy0;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B74BA606A320
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 11:42:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B74BA606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Por4fM2Y;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kTIPRVy0
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LBgCAs325212
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 11:42:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/GfvzbAUAClHbLW5u+kloXy8aTuazubWTlp5Yod8NHQ=; b=Por4fM2YJC0uCsoj
	Vn7DrYVVF2tuw9hdNy4BDPmQ4LlFsB09cAeIq7IUwA112MJrvYZbFKQco2rU0bVi
	kgh9aiUqxf49vPzIyP94DIe9+VlgZZdNFxGB0JeEZlLAIEYgxm2H1cSUfdLJn0hH
	W7xA/L8uh9f96jOcnlnw2pWu0vnyKHa+ocA9G7ZJS0bqncBQykkQAfD6gowONhoC
	YIbUEkyOSbgKKI2H/KxdduXOVN8HHmoMXQJCiJOtdZX4/E2Q/BjHaE9uTebymC/e
	6Ztm6/+LIBps6duqAU7DCxjvRaN9UQahenjrNdboMC1aMPB5dXwVmdGsag+GnftE
	YIQxTw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hed9v3rpr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 11:42:20 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e93e2f72bfso8027875ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 04:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792582939; x=1793187739; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/GfvzbAUAClHbLW5u+kloXy8aTuazubWTlp5Yod8NHQ=;
        b=kTIPRVy0Pag8fxeNTp1x2vVbW45BdHzfIq/p3ezN+7B9LmuE/MJ4fb8eUyaksQ4lwC
         aBELveCY5bgYAfYQtwqUE28QRH6ImJUjXciXUmjhGu7INQXiOlGwmfLLVagtAnt+9ZL0
         fYaBBWNhXzDCqPlT09ATk1ZOQagU9nIQNB/4mt1uQlXm6B3VX9HaXDn2og0tH3zf9/Xz
         K3tpu27rBVcetymtrM569ZrWT4dTbm0YQPIxVk3ORMjN5zbiaBJJyhCaNDdyfV4fbeO5
         FQ3QHzHa21WCgilovTK4ifoE0/7F6zfMnokC8NVbr162Lb5QoPYfA48dLLVcg5dKQb+E
         IA0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792582939; x=1793187739;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/GfvzbAUAClHbLW5u+kloXy8aTuazubWTlp5Yod8NHQ=;
        b=cHoRLrs0YOHHVwKIjZKsnoHghS2+OTTCcR41euIbgw3maR196qR0OIau4tTP6b2k2K
         ql2s+39L4fhcdYgDbR+5RRgzV4JbBGwS0uboK9UFGdMu18KD+7BNJ9ln9DEV8MPoXMTA
         lIPOpS2cPyKbl8JIXb1QwDjErrcl1hFgfmkwL8hB4cBCXnGDIYrJ957I5mpRwE7egYOU
         5sv5L45y4pRPEOt3toeYSAdX/ztfUqyINC6hIHry+T+vm5nUhbvHEnQnA7L8TJ8qtHJJ
         uXm9unVJ7DMDmoiTQq6VxZCupcHkvOsZ8/ICZq8NDGO3F+ZvfDOsl4optRdQq3l7M+05
         2F6A==
X-Forwarded-Encrypted: i=1; AKwUvBzfCMznnZdMml2a6BDBj5aBhniBLDgwhJNDdg64DyIuJEmFsJUPlXUGCh+gC3N1NMXECY9tjW7LF0U2d4FZ@vger.kernel.org
X-Gm-Message-State: AFq9FYLaOGa/J7V5ygblUeEuF/PTzMoSn76G4FNXaqeJFpIO/Afmzc35
	ccVn1Zgyuhzd3d6NLIQtgZ9ht4EywHzbpjQG50H+ocmAxVbwZiAXoTMcV0E4uHz+5WSgh1Iylna
	5HSTrZTwGpRg+gtPJtDwRF/psqKhWHF/3drtsv1RrEJqIsqzDlafyWFYZqepfl+eP/vP7xMFo6Q
	Y7
X-Gm-Gg: AYBFou0e2ob2t/NKnu3L0ga2IuH7BvrV18r9uWNwG9Hw9/08Oe1dhSn3kRGonG2VuEs
	+hKc6/EWBPzBIQMzI3CHV4/7vqT7RKgIP4+NdUbxgB6xm3N/oXVE9ABdTH3+CNhveHrjTYpYYnV
	jkelh7jpmVtDyFvOpVbMVvLmRl3lms1qQHxbp3uQNxdwCyPMkoQrYR2GPICPiTPXn4nZVIf+CXu
	TbpS/eGaD4Sg4CcW2SkNChlTxmpnD1YuVq/tYujhWNmFSLjZ1vX49+ikDRARxnn5WRvyKHrIKGv
	0v9NCFy4Yut6x2A2fjD35N3ANFWoALMyhw8lbc2XUtWHHhIxn+ohz1zehnU2gmIJzbatX5sNfCT
	rIMsKGLt5kW5jG4oDCS9M5557As4gGg==
X-Received: by 2002:a17:903:b4e:b0:2e9:60fb:5e41 with SMTP id d9443c01a7336-2ea43d546b5mr14770825ad.50.1792582939423;
        Wed, 21 Oct 2026 04:42:19 -0700 (PDT)
X-Received: by 2002:a17:903:b4e:b0:2e9:60fb:5e41 with SMTP id d9443c01a7336-2ea43d546b5mr14770255ad.50.1792582937887;
        Wed, 21 Oct 2026 04:42:17 -0700 (PDT)
Received: from [10.217.199.117] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea3b4108a9sm10462325ad.21.2026.10.21.04.42.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 04:42:16 -0700 (PDT)
Message-ID: <194cdf44-059d-4d03-8cef-d674ba37006b@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 17:12:11 +0530
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
Subject: Re: [PATCH] arm64: dts: qcom: shikra: Drop CPU critical trips
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260924-shikra_crit_trip-v1-1-730c48fa998e@oss.qualcomm.com>
 <xa4gmzdccrububsmervkbtwqpddsbikubvgsqksypqmx5oih2q@q2hz6tadbmu5>
 <53c6b966-a6ff-4b91-a2b7-d7faee5a6605@oss.qualcomm.com>
 <3a87d077-8b8b-4bcb-9f5a-03920ef3d38b@oss.qualcomm.com>
 <e3de4383-f530-4968-a177-288162cd34c3@oss.qualcomm.com>
 <727ru4mlgn2bf7ta42ww7772mekk6bea7sni5b2h556pk3c6xw@4atjqo2ygylo>
Content-Language: en-US
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
In-Reply-To: <727ru4mlgn2bf7ta42ww7772mekk6bea7sni5b2h556pk3c6xw@4atjqo2ygylo>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0NiBTYWx0ZWRfX3BWtrXs9oP3S
 ieWkEY03lB9q99l2c1qsXU6g1h/FBciiY2r7LyJirDAFqrH3VHvFWt3lrXZgJLX6VmZm+olSw38
 A0q04/n01o69nTu9YjGeheMnD/QxXfY=
X-Proofpoint-ORIG-GUID: KBaPg41DJlGzKQareOcR9LXVMCxfczXb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0NiBTYWx0ZWRfX+UZ0y1JcN4bt
 QmVRUf2w58mDYyM+7ybHSLA0thXMfTb5JuKqnC3PIT8k29iHJ8iS3XRCOrxyBoIDZXeSY/kmGui
 +5KaK31kkk3riY/oO2J/nR6nnCV7LDvmjW9PJsnP2uPUqLRiMaSsLCSbQBhDk+gKUMELggYmOhZ
 Qhb+NuBNpgi5PSe2FCkxY4EVB+wXhlQ7vKzOEnfrcp1nhK4TtKkYAgS3jsBIpbin3STJ/gsGiDQ
 oR+98kxyAY/fHKV2FM8xPFeB+nicfje2i+Wj/LHysOThV4xPzSjkGxrU4Sw4gxXt8NNT4bPV0kB
 UYmaTMZWUy4LPbQoIbTxEe/Y+aV/358HizFKLGiQYT/lcNT4+egcNAYvPKdOQ8D6zmcdazJxu4t
 n4mc4/4EVSE/N5Xq5cwSePfUcbSGJoZtdH3ReeIZhNNZFiSi3q3PUf2GxsQjgi83u8ZjJq4D3mq
 tz5JBQFZSCGC9lLupfQ==
X-Authority-Analysis: v=2.4 cv=I6zw19gg c=1 sm=1 tr=0 ts=6ad8a51c cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=MAucDEMgGkwSF4ccb9EA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: KBaPg41DJlGzKQareOcR9LXVMCxfczXb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210046



On 10/20/2026 6:26 PM, Abel Vesa wrote:
> On 26-10-19 20:03:47, Gaurav Kohli wrote:
>>
>>
>> On 10/15/2026 4:43 PM, Konrad Dybcio wrote:
>>> On 9/25/26 12:24 PM, Gaurav Kohli wrote:
>>>>
>>>>
>>>> On 9/25/2026 3:13 PM, Abel Vesa wrote:
>>>>> On 26-09-24 19:52:32, Gaurav Kohli wrote:
>>>>>> Shikra firmware handles CPU thermal mitigation up to 117 C, while
>>>>>> Linux CPU critical trips trigger at 115 C. This can shut the system
>>>>>> down before firmware reaches the end of its mitigation range.
>>>>>>
>>>>>> Drop the critical trips from the CPU thermal zones and leave the hot
>>>>>> trips, non-CPU critical trips and GPUSS passive cooling map unchanged.
>>>>>
>>>>> I thought that was the whole point of having the critical trips set to
>>>>> 115 C, so that the kernel can gracefully shut down before firmware cuts
>>>>> it off.
>>>>>
>>>>> What happens if CPU gets to 117 C and the critical trips are removed?
>>>>> How will firmware thermal mitigation handle it?
>>>>
>>>> Thanks Abel for review.
>>>>
>>>> For the CPU thermal zones on this SoC, hardware-side mitigation is already available at 115 C and 117 C, and hardware shutdown is at 120 C. Because of that, a Linux critical trip at 115 C is not very useful. It overlaps with the hardware mitigation range and can trigger shutdown before the firmware thermal sequence has completed.
>>>
>>> Does the hardware mitigation just pull the plug, or does it signal
>>> to the OS that it's about to? We absolutely need the OS to be aware,
>>> so that e.g. the filesystem will be synced.
>>
>> Thanks Konrad for the review.
>>
>> The OS is not notified before the final HW shutdown at 120 C. There is also
>> no useful margin for a Linux critical trip here, firmware/HW mitigation
>> starts at 115/117 C and hw shutdown is at 120.
>>
>> So 115 C overlaps with firmware mitigation, while placing it higher is
>> too close to HW shutdown to be useful.
> 
> But having the 115 C one will allow the kernel to take all the necessary
> steps to bring the system down gracefully, while relying solely on the
> firmware will just kill the system before kernel can do anything.

Thanks Abel for the review.

On this target, 115/117 C firmware mitigation is throttling/prevention, 
not shutdown. The final HW shutdown threshold is 120 C.

The 115 C Linux critical trip therefore starts shutdown exactly when 
firmware mitigation begins. Moving it higher also leaves too little 
margin before 120 C.

So this patch drops only the CPU critical trips. Would you prefer 
keeping a Linux critical trip at 118 C ?

> 
> I don't understand why you want to reach firmware/HW mitigation anyway.

