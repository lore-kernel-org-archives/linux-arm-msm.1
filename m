Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793020199;
	b=OGh9voDbqOJQ3tEtHyVI+qSGBo1LHANOoiwOMspuNLNHFIkLrGie98gUBiVvu0DQedCp
	 thL1c63je+k23wrsh2CMMZFXtys+zwCyFtLlNaOdSu3CSGaqxg8AGOmTSq+uh25bV76j+
	 OoTJkRc0F8Iw7/kFiaVpKOcFOwJvHDKQqPyI5SHtdoUk94pgPrBL60tTnnpwzKLJxN0ui
	 4KfEv6I/Bwi2Vx+EQretbbHdVytFgKrnfQnB4LM+k+RP6zCXLe5OsvsWNqMCt6e8qaKip
	 Dhpwo9Mv6iL06ywlYRz7bGfN24pllY028NRlOz252AyDatR9DDJ6CVdaDUMPmzHxLAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793020199;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=n7yxWtPMUXi7IWlyGxpU0TZfSphuR8DxMIcDIMKDNB8=;
	b=FQAZCtIzb8aOzdx72LC49t+AfX3Y/ltjeKiGA9AaR2DToaRZfgcZTwROdFWZ+fFw1deP
	 jVhROqTn+P+ciXhUByIkKBx5HqN5YFgiqVSbKUnFz4+OOAjIXY1JmzJi0S3J4qHSv5ADC
	 tsbcz6tUsOR8au14+6swFTn6/1HN+S82yGZYLMgVSOCbb4bmThwAjzdIXOJwsPBMT4fzE
	 s1+Yo+tQ/9nWzMGxXwNraM+Og/vKxY5ONhgFxB/si3VbsKDbRU7TeuZN+lkCvz5RbMAj1
	 IsRJZPfJF3URJOW7Ihg9lta2hRP8gGJlOs0SoNrg4d20Wf56DgDKrwkG2E/YDeiIowg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=murfKBxV;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eqwvHt3j;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAC9B606A323
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 13:09:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AAC9B606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=murfKBxV;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eqwvHt3j
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAt2rv2733255
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 13:09:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n7yxWtPMUXi7IWlyGxpU0TZfSphuR8DxMIcDIMKDNB8=; b=murfKBxV5uzBPNCR
	T54ppeH1fTQLM3q/mBgRjDF8P1SH6AV3rdnDYWH0i3t5OJ4iY28DaWIC0mFxcNi8
	vIUm3Xi8GEy6U1GLXNSYwCfDdsmcWOf6r1tGAwS23/MyH3LgIKQu5bGDcqsukvzm
	O7zJfhIsDdGbP4w/2nm8TOW7PClBA2eXKAlD0ygEM72cSir51B2owyLYK/gLmcKi
	u6IH4uc9plP5f6e8X9gbHpgVL1tsneix2Ae5+YHmzmJ+mX7+S3bAiTlHjc9FXxkM
	AWf6368sFLrAjH9BrUG3rB16k7h5ia7hPV9HOkOGcv0zD3ajUxcGqMBsHOfQHH9U
	uRiOhQ==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj4cp8st3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 13:09:57 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-8490a7d657cso4498511a34.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 06:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793020197; x=1793624997; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n7yxWtPMUXi7IWlyGxpU0TZfSphuR8DxMIcDIMKDNB8=;
        b=eqwvHt3j0UtIVaY/HHDorO/6I4+QBu5n0DLjHVO7ly+Ki2zHoCCNGLxvgZdziQ09z6
         vm2z9CDrXtEulbdwtEJixHAwJC7oXwvL55xrim1jTGPdIHFSPulbpn+K5iAoufCVOlCK
         jSRqgaln7PJeXMH49QmsKAl3BdyhnlOd8F/IaF2ZBmvf8/TJUkxDOVaQ5nAQ1ILNzY5D
         mjsmVyrW9QUUH3IKRqSfAgKmorRDDtpegXIROO7zfUIeuF93MxcfmswtiLSl69dOT2XL
         jTtWPi46/Xf/nXCQverR9jhV5z495EpnbJK3DctrERI0uJ2kvgRk5oBmbUvPIiuEed0f
         8kDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793020197; x=1793624997;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n7yxWtPMUXi7IWlyGxpU0TZfSphuR8DxMIcDIMKDNB8=;
        b=zj4huT6Sgz23Hz/AsKLRtrm6I//j9uckvU3Jv/I6X+8rLX4DYI0vPx00ARBJoUqsTU
         MKOGxP2GlT59Z+7l9XJ45xrmN2vhIurMv6dfpti13qZ1N9XqWL+C0Wf4eQ0D5No4qolX
         pmleKQ9DJWnxCn4SBjSdwCrOc4Er7bMSsA9BOEmwJfN/FQY3ltzOsssgfMOcrMRuWTMk
         IHaZ9qYjimGg2yTCiT3Ai2bRZFQ/Cn7+iec8lG56ytZVYsWY4CgyrHrGus5kIP2KYIoD
         Y/n45Ujfau0gdWYz5p75BpVu6LgHuJ0H67cBuiITnOv5g14exQeB7n+Tdsm8njA/xzfJ
         5OaQ==
X-Forwarded-Encrypted: i=1; AKwUvByGQBf5pDtCHllQfKiI301tAsKMwppUnUXtEuUmj8I+w56LapdHgyHPCjFvN02tS+cxDYukcPBQZWttHsrH@vger.kernel.org
X-Gm-Message-State: AFq9FYLnE5ivoJJAGcqHrTeiTnWK5TLHYGa1GnLrBW+U/MIq/Gn/X/Iy
	G5vgcrrZ77mEJEC6mL3vKvVZBWXi4pjY8rJDh6BdFSdn9+EhFhTH7aayXPE6VQW0l00+RthQpnL
	TwJ2WlypZMwQfEqk+IxVIVcBqpqRGz2otL6uUZ28VGUqF38m3L3zxDv3gUBj7mN6kTsRv
X-Gm-Gg: AYBFou1h5fWDjo38PdjPtUN4VjYHx/lgZnsyTZ03Z3W5DfMmJ6PSGt2VKbc1/gL95iZ
	qwgFhEIupgO+jmHwARiRdldCI4Bi1yNokPIlMowocYz16/T6Wx4Kuq+HaffQfmMImhsywYl1IDK
	VzL1IG2X43UjIOZBBmMiX89q4O22xSyZf+eZa4LLln3JiLK8cmmFMO61QEapKHVOUXOZOWqLZ37
	eM1vfy8GHdAkr3aQ8WibiPjpteFVKO+NHUHsZykZ8gEqvb578q/BHYb6/WC1d+LlFwAN1TJvL6p
	qAIbqirY3DRlF4y63lQU45a92ER2wPM5OIEgd9L4yO8T+FJprty2p8ymLxvlPJn0tJH+wqQJESt
	rfkR24qkGGGuNMsvQkgJklRFtjP4Unh83aqvr2xwYRhgVf3ev2zIfcywxJmLo48tfepmruZOnv1
	/GWbsygMbwslWz0ymKuCmpfS//iBw=
X-Received: by 2002:a05:6820:61d:b0:70c:f411:409a with SMTP id 006d021491bc7-70cf411484bmr1858259eaf.60.1793020196906;
        Mon, 26 Oct 2026 06:09:56 -0700 (PDT)
X-Received: by 2002:a05:6820:61d:b0:70c:f411:409a with SMTP id 006d021491bc7-70cf411484bmr1858226eaf.60.1793020196412;
        Mon, 26 Oct 2026 06:09:56 -0700 (PDT)
Received: from [10.190.200.105] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-70b9e163a5dsm6838618eaf.8.2026.10.26.06.09.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 06:09:55 -0700 (PDT)
Message-ID: <0cace778-b68f-49a9-b52d-dc632bf3a0ea@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 18:39:45 +0530
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
Subject: Re: [PATCH 1/5] dt-bindings: arm: qcom: Document Microsoft Surface
 Laptop 8th Edition
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maximilian Luz
 <luzmaximilian@gmail.com>,
        Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Douglas Anderson <dianders@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        dri-devel@lists.freedesktop.org
References: <20261006-mahua-surface-laptop-v1-0-406fc042162a@oss.qualcomm.com>
 <20261006-mahua-surface-laptop-v1-1-406fc042162a@oss.qualcomm.com>
 <245e5eef-e18a-4ec5-b57c-65e561101351@oss.qualcomm.com>
 <52adff3a-370c-4445-9797-e0b0dde36fab@oss.qualcomm.com>
 <5568fd0f-e412-4f2a-9f1e-729a469da572@oss.qualcomm.com>
 <65f6883d-8ead-4c6e-80f5-81f6857df0b8@oss.qualcomm.com>
 <f624b075-df3b-4862-8231-8fcae7f18d50@oss.qualcomm.com>
 <5cfc6414-735d-4df3-868d-c8c3c4a98e30@oss.qualcomm.com>
 <5478c0da-e28b-4ea5-9b7a-f7aef2c7f437@oss.qualcomm.com>
Content-Language: en-US
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
In-Reply-To: <5478c0da-e28b-4ea5-9b7a-f7aef2c7f437@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA1MiBTYWx0ZWRfX1r+r84Dd4Wj8
 kZB/fGZW+XHyvFqYwpWUh/nLRQxrdwAbjQd0ax4O3MO3lQxS2eILjHh6JUbSwbR7NCWw0NymclM
 mw2mU2NIa3Z5zrqkVZN4iqvaAz/SDP3NmPsX2QDvV08kDlMMOwxa7tuBr0mqCd/TetcfxMAz8ot
 8+dVxMR4ZCic9jNUpANPn7AOK6SYemFKR9X4qwoL9dbHqzO0xUpPQR2/rADShDrRyDWMC+jpyY9
 3IxA2wf1dhTWiPGK6Ig5DqKVGC8RukCoeP+IUEbGXHIKNCbAS3HZhJWRB5d4foRnwfMlXtMstK6
 hERXm5Lt1WeGYWwS1UP3uGHKvVYlR1J2SPUPb8r66ZRZFiwBEL/HhrGOcxJnqSHYvmHAR+W6sno
 rQIRSHnV/AcNJUdvMeHsj7QWwy7HGqlWFpVpg0Ieb55wdEDmnZXrZGDF8xvyVyMjMcmiagVGCQL
 oh329LEm4Shlykya/2Q==
X-Proofpoint-GUID: V0TiUfyN7NrHAimvc8NiP8X2HP6PBE5W
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA1MiBTYWx0ZWRfX/ARKPdMMmnt3
 1Oq+EEQb+ehCj5PlCMeTvEfRaZ+805osd13IZrsN45BpzSSOXa/8SW22DsIkG2dgSbD0lnRn7qy
 bqAwZ8wrkHujF/TGME6qsyBJEh4hWvM=
X-Proofpoint-ORIG-GUID: V0TiUfyN7NrHAimvc8NiP8X2HP6PBE5W
X-Authority-Analysis: v=2.4 cv=TboDJhQh c=1 sm=1 tr=0 ts=6adf5125 cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=orzTaoVzejLQ65uNlDkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 clxscore=1015 adultscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260052



On 10/19/2026 4:02 PM, Konrad Dybcio wrote:
> On 10/19/26 12:31 PM, Konrad Dybcio wrote:
>> On 10/16/26 11:26 AM, Sibi Sankar wrote:
>>>
>>>
>>> On 15/10/2026 19:02, Konrad Dybcio wrote:
>>>> On 10/15/26 2:47 PM, Gopikrishna Garmidi wrote:
>>>>> Hi Konrad,
>>>>>
>>>>> On 10/13/2026 2:09 PM, Konrad Dybcio wrote:
>>>>>> On 10/7/26 9:11 AM, Gopikrishna Garmidi wrote:
>>>>>>>
>>>>>>>
>>>>>>> On 10/6/2026 3:20 PM, Gopikrishna Garmidi wrote:
>>>>>>>> Document the Mahua-based Microsoft Surface Laptop 13.8" 8th Edition.
>>>>>>>>
>>>>>>>> Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
>>>>>>>> ---
> 
> [...]
> 
>>> microsoft,surface-laptop-8-lcd13
>>> microsoft,surface-laptop-8-lcd13p8
>>> microsoft,surface-laptop-8-lcd15
> 
> (FWIW I don't think there's a non-LCD option)
> 

ACK, I’ll drop the lcd suffix and use microsoft,surface-laptop-8-13p8
instead.

Thanks,
Gopikrishna
