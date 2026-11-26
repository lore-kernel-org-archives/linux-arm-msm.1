Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795717972;
	b=zqJbN6vz8VMH252tV0fKuAhRuWU4pA189I32hxJJSFrfLaECbTh6sE60Of9a5Vmvxy0N
	 01FpZr5jTez5Qx/YnzyXm6FTHP28mSREbXB0NhIFx+JaJ0/FFJzv/ScVH9Z339stK9qik
	 hJyW2MyotlMahTmXee7ZbuD/V2zcsh1dOl1G4ndWM1n9Vm2K/mLOFlxqb0mFAinVi/1Gn
	 jSPaGeQWEJm1Ri3Wdu+bKuY5lOKDP/rVGdFT/iBKo7LpABy+OOfPhsu1q+sVqB4t2Y+R3
	 Nh19fC7ptFsjqgZU8rp6+xRi2FUGcfKbYB+VabP1cGHnQaDB3fIW6lEC0EbA2nW53KA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795717972;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/AAbzqN6gL/Sx0YtNRBarMK5mPpXPZmH0nkOki+mzQo=;
	b=Ix0ZRPhUpeSx3YbQAzqWx7+LZq/3QaQhk/a7CjdARaYdhr0AobXKyb0x0RwnaH2MNliM
	 KRRbseR8JyOgAVWujaXYXeqwsAXgeStHoBCzSqk7p6O12BsBupIFWoQXuAuU7oFcWFdrk
	 C4t+ApArK7lqFseaOzNtEhQRbxUVDCZzMRVn0CshnqH/snbX7viOlQwV4nQyJjOUBQL9S
	 4sncvNHEx6gaS64R/tP73f4a8kElJu7veG9Mca5wsPcE8bL3BHwArd/KpDcJzHADfs/5N
	 LBRv/23Ygk5S35jGhANVZJEPlVzHY53/lkG/Ghzisdvtb4oGeIdKLVEzBi7CPcjxuqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="bFGxra/0";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=COPiPtAq;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B153606A31E
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 18:32:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B153606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bFGxra/0;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=COPiPtAq
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQFtwvX4048185
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 18:32:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/AAbzqN6gL/Sx0YtNRBarMK5mPpXPZmH0nkOki+mzQo=; b=bFGxra/0eJHHWFJu
	0RIQ9y64G1jGfSfrswDn599e6gfUxhCB1vdVAqNwN+hTh0vSvGkAaHMQQemA3pnM
	2wMvlAYeqZO2Zm5ySUZkX6XKS+EkyvgALeb7EL/coJsPdVcHiK7WoYefnVhsNAti
	ZTOODe2FapSksKkYbyhcyTF0EYNMBqGni95LkfE7w+lSL1hkntzTYnDLC/RsTYVd
	A8pZCc4N+hYZXxgatrUZlc1eZNQgY5fabHEqmHEDiGIvYZDBtUtEUVRATniJE3is
	G3A7Lk+qZ+WpZZXbnwYFC5s41V2Zd5yk0NTFaF9BWG7/RZWqGjtT5N5alG/W5+xF
	jojcpQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6f8rjjjf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 18:32:50 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-384c78aa0dbso9353132eec.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 10:32:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795717969; x=1796322769; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/AAbzqN6gL/Sx0YtNRBarMK5mPpXPZmH0nkOki+mzQo=;
        b=COPiPtAq5/rz6TPdhWg+FssP/VqnV6HCxUoBd2itKojxl+dbNG+Mc2qWvcQhssXQfL
         p017xnqCi1SED+UhHrtjEkmqHcCrQHfXt0CFXbE+ZHbvse6g7GI4ep2Ndyb8wME9JMqg
         oCEGKFc8a7yI+KJaw7t2DaJ/tlm/UqRWC7UlHHU1bnAt5s6/vUHsaqRL+tunZC9QMtL7
         gUY1BXn+yFNudPaxuz7Xdy4adj9Ouxw14XbOTYNaejUlPULcfrysw2hWpzV3/95/tPWy
         ViGqj9TOGXGrD8mnm1aW7ei8dohFSrjGmSDEtUfFIpAiEn1qgoNGfALyqYGUDmREofQV
         fzRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795717969; x=1796322769;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/AAbzqN6gL/Sx0YtNRBarMK5mPpXPZmH0nkOki+mzQo=;
        b=emMndSWQTcxnPidWXEDqJ852zsb3VsbUnAJ50yJDnVhrlt+xeUgZeI9p0cCrswE+9n
         /+bmrv4ajbVLu6Ih4vCTuGiJwIFznNokoGw/6G66JILgrmVT+wtDQVod/6izVCU4KnMp
         mX/NLGnYmgNt5B90aCAlR5z0bGQo2jA7LJUXF19Zg7bwXad2JZOpTEMM0CBVNU3nlfSE
         fOU3YFNR9meRYOzTtDqN4nFwlRC3mMukv93E7eYBwxDa+DRghhThTQVijexsKhCBcFEr
         zT68lzkXh2vp8QtAesi2XW2k7DwRyHWMfcZJ58BcS4jevNJqP3zfAecxbq7piKndSo61
         5/VQ==
X-Gm-Message-State: APuU4Z9DWFNXP46SJMO5DsoYNpLuy30k+Zk3EuaZceNvfipX8L9wS0gF
	NSGQh6YPsSZk7LbaAxW0iXLS2CjfSqKQZM2z7BH1Qs/c9IWlrQPg96oE1Mhwekrqts9bFO7hsv3
	9g4+eKBAeRmXRR4F0+xy0hX8qKQCJ/LTsN2cz9lKIfuCqE4ZkIXBTLUhCfPUI6idjDrdx
X-Gm-Gg: AZFdTZdMyVW8vN/t2uHnMpevi/cXJ8+MgFRgSxaXCIDWSc6X+hMODKkzzPI2T2/xwD7
	KVk/XvYbmBVjY+YtFwhVC2IvOVnMrYxDSGsEbb7ujcaccFvFRuSaNjbG3GafeUUBL0+ETKtMshU
	ympEjQDiH8aZjoDcC1V9tj7TVIoLYLUGhntyF0pS2zYL6L18AfY+Rnr7MsRocyv6Lzu+dj0Y99T
	fO5UVFQDpO2UqbZOJHoBf3jEU3t9S4glRn0kB/4UUKIijMDwYwWf3bl1l69I53ZNfY4/ZVq6E3q
	sEi0/aSoKVwBwDdcj7GOB0tzURALJYB5sHHNixainKeXSFthshjEBb5BEtew+b3mdVII4ouyGbv
	3r7WVdxbjeOQqyRpqhsUbyANRXcAZS4RzdF7JkpKyL3KGcFVhtJZuX5pilb4JVLfsODjx3qe5aw
	==
X-Received: by 2002:a05:7300:dd46:b0:385:7762:e1a3 with SMTP id 5a478bee46e88-3857762e729mr21207575eec.24.1795717968885;
        Thu, 26 Nov 2026 10:32:48 -0800 (PST)
X-Received: by 2002:a05:7300:dd46:b0:385:7762:e1a3 with SMTP id 5a478bee46e88-3857762e729mr21207541eec.24.1795717968385;
        Thu, 26 Nov 2026 10:32:48 -0800 (PST)
Received: from [10.204.104.211] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385f68bc0adsm60895320eec.13.2026.11.26.10.32.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 10:32:48 -0800 (PST)
Message-ID: <5ade8269-bc76-40e1-b0bb-559d3f211fd2@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 00:02:39 +0530
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
Subject: Re: [PATCH v2 1/5] drm/msm/a6xx: Add Adreno 753 support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Shivam Rawat <shivrawa@qti.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
References: <20261118-nord-gpu1-v2-0-8d6d9908b7c5@oss.qualcomm.com>
 <20261118-nord-gpu1-v2-1-8d6d9908b7c5@oss.qualcomm.com>
 <a005f8a1-76a2-46ce-b328-2063bc307758@oss.qualcomm.com>
 <70651641-b264-43cc-a745-178ef2b02680@oss.qualcomm.com>
 <6962c4ef-ad14-4984-9df4-4624c4bb50ae@oss.qualcomm.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <6962c4ef-ad14-4984-9df4-4624c4bb50ae@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA3MiBTYWx0ZWRfX1fXmE8rF9eqo
 NltBACGlZSpmFZ2ilJA7WVWr9gzTZS4dyVZ/flfbPoqpFyKMUtjaaGxwK8NQ2EW6Hk+B0/f2A+f
 JmbjOzJof4L1xpXVRpqnpvFzWaVlNhogresozf4Di8R+oXyfT4T69UgFT94I8Rm5s18s+PinmTW
 Y4mS0OlvDSuyqYbXfJVsew71dXm/J6bIhmzinUxHA4ViW1pcQOa6YpgEN4DnfK8UC31vVgyLQfn
 g7Py6LXPF07KpA5/sX2KJ4CH85g/1Sxn51izSB8W8yWxuxHDBO/vKHpaF/jWrkYeTORtMfRNgx6
 w43WHjW30CJzSFPNQ60HWztGqvLf8rQkTEbwsKFQ3zw8sJV5kmWTfqNgS+SxC1Fp+fkl9YQlAZl
 j6smg6RyVi1sgBm5Z9yca4KzYtRvi9T/jBYb81fIGZ1euvtDBU1q36kEGAHZXoM9nheHmjPcI07
 2JOFCUQebzYVozE7NIw==
X-Proofpoint-GUID: XuBJSPLWdr0d1Ape2_RIr4H0Tx_Xtmg5
X-Proofpoint-ORIG-GUID: XuBJSPLWdr0d1Ape2_RIr4H0Tx_Xtmg5
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA3MiBTYWx0ZWRfX7HSrxN5KA2wv
 x9FyPVng/6uNba4kAOaGvJrr6/PgSq0Mbq3CGJvWzrH7R/Bgv9nht0yr0/MTGXrnVup/2jHnaEk
 nDb3FDuYXpfnOFWDdjCaUZlU0HdZDa4=
X-Authority-Analysis: v=2.4 cv=FuOQbGrq c=1 sm=1 tr=0 ts=6b087b52 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=4rBPJfw8ZRJ0ovG7S4kA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_04,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0
 suspectscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260072



On 11/26/2026 8:59 PM, Konrad Dybcio wrote:
> On 11/26/26 3:53 PM, Akhil P Oommen wrote:
>>
>>
>> On 11/26/2026 8:17 PM, Konrad Dybcio wrote:
>>> On 11/18/26 12:00 AM, Akhil P Oommen wrote:
>>>> From: Shivam Rawat <shivrawa@qti.qualcomm.com>
>>>>
>>>> Adreno 753 is the primary GPU in the Qualcomm Nord SoC and belongs to
>>>> the A7xx Gen3 family. It is derived from A750 and shares the same
>>>> IP-level configuration: protected registers, pwrup/IFPC register lists,
>>>> GBIF CX registers, gmu_cgc_mode, 3MB GMEM, bus BCMs and preemption
>>>> record size. The differences visible to the KMD are the chip id
>>>> (0x43051701), the GMU chip id (0x70d0000) and the gen71300 SQE and GMU
>>>> firmware.
>>>
>>> [...]
>>>
>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>> @@ -651,6 +651,9 @@ static void a6xx_set_hwcg(struct msm_gpu *gpu, bool state)
>>>>  	if (!(adreno_gpu->info->a6xx->hwcg || adreno_is_a7xx(adreno_gpu)))
>>>>  		return;
>>>>  
>>>> +	if (adreno_is_a753(adreno_gpu))
>>>> +		state = false;
>>>
>>> Is that intended?
>>
>> yes. It is mentioned in the commit text.
> 
> Right, it says 'it's not working at the moment' - are we going to

Well, that clarifies that it is intended. :)
> have a moment where it works?

Yeah. Hoping to enable it in a separate patch later. It is under investigation.

-Akhil.

> 
> Konrad

