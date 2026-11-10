Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794284086;
	b=zU+J55MGVQOs4b6hfjC4ALEpy454ZSILNY+kyn/OhjPViOs/sJT/uYhtQ7U9q9W4Mof1
	 Xwfp151uuWM1/sImBKcVWkfoDIfdmOfekXcfOigLr81r8yhxlY/Uo5hdz1JCdjky2Pwr9
	 UQ2nL6hHmnRrkUPb/ZIXwBnPZV+vsPoR4glhyInD+3QNALaJn6qi7ok9WBeMRP4ko/K5f
	 H/HdelmSFogA1J1UGt3pEiVg5yYPvTGFYzbSj+v8EF3CFCMYzblTBpa6ku277PThKuDuO
	 2JcGCx72pzCBxlUfY235csHHkaHdlGaPkC19TXsZkbr24PdK6g5ZRn1wN2+4eGxCtYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794284086;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=U3qlC+dXK+CpAmoGXqDZjbSPLC+XRHEjZb4i4RRbB8w=;
	b=V50aRC29/JFzq1Ypo99+g7OPA0nUA5+/+fPBK5rvee8Y5WBMa9eC9weYKg+wSD9H4SMy
	 ax1DX7xf5Z6a2uTn6FBgC2C4+IKFUp7AIA9Vx+5i97qXmyuHvIeMd1SyPvyLch7D0KtRV
	 OfDyE3yK0YTFjNA4FAvYjIhuCI2HPSsH/5vlHoS4z6lVfc4YV2Uh1tT3+AvO2EHeaNJjh
	 YtMPAkzoch5zK1vkd+x8Ik7NTUX740l9GWlvPj4R1G83mZ132szEcJTA153EFkpVDtc6k
	 VCXS8ryz4ipCM2a7NIoIQk/ZHsjvEeSqrXVu8zX/YvAQVyLFRt8iIX7idZSVOT6oceg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AwD0zJSj;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=chivNziG;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ED7D606A325
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 04:14:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5ED7D606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AwD0zJSj;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=chivNziG
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA4A18u2249120
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 04:14:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U3qlC+dXK+CpAmoGXqDZjbSPLC+XRHEjZb4i4RRbB8w=; b=AwD0zJSjZ2kNkWJN
	ccpRP8CVoDMEniLAHBxGHAmBLezgXrJ5C8Q5JRnrHagwgwnFSXcCv5U8J3RgpC0B
	bX5g0KkkqqSyJRTvxU20DRDK+KDb54uvDkbNkJ1+vvunYK7LQiNrWXpUBZ9MiCw4
	ZHfada8u6hl1SQUvF1AxcbmKEORYo/yJYKYKR9B684WSYI5oc4xWz2Iw76SJ0Pw5
	bANkRf/bNp0N4uNNrhIbGuEveq2ElJKcF7TQzoa0EMzaO7EddzQMASOSzRiYvI64
	PP/Ef0TjHeP6drxR8kZcGM0kOc5GTLXjqWcdQ45k7ds8cLGBNX2IExW1TAL1GqcH
	dJ7qQg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hucapbjxc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 04:14:45 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ea446ea8c9so11072295ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 20:14:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794284085; x=1794888885; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U3qlC+dXK+CpAmoGXqDZjbSPLC+XRHEjZb4i4RRbB8w=;
        b=chivNziGbxn6PquaCRLyWZbOAlBCLG2v0xT0uaMfjHTUwqr5woaxxyFshK1i6Q3hVq
         6vxo1lOqt475B9ytHwkBReRiPYbwZMjw01zVcw5VUMSuOcCzeUIUxwX4lNj+TZLKmY4S
         pTQIzhbI+9Vvt52rPpWpodqZgNn4RT0Q/fduKL2gGb4nR/BSeYtd5j041hiX3m1proTC
         uwIW89zvlH2bFaDA6I34b1mtp/N44G58S5EvDuefxaahNTjYeqCi9YtwsC1Rx6CIX+Rh
         42gngj1oM3p5HLNTkTQUc3ITYrXhegl3p7gK3RqBKSoA4on/gmxHmixV6MEH0OwHa7U9
         6yEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794284085; x=1794888885;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U3qlC+dXK+CpAmoGXqDZjbSPLC+XRHEjZb4i4RRbB8w=;
        b=B2xefEtDCyQ/sa6yhzYWGlt4uuUfOpcLCwZuT6ougfxY1N0GiFQqhNAkzsw5jhuzJh
         WNxUjr8JCKL20cqdoMgFs0gQOBP2IGOUR4w1P4DCFErw8/IQK9U60YB8SLrYbTiIeAIV
         Cj5U7Jdd47IFA/1pGBYpoWkcqOEUqsUalJIiGtZp6not+u0nCppkvH4zh5mjDS94UVn7
         1G5Txp5co8lbA1OEWFRg3/kw8AOJOLOHbnp5r9w3fGoVU+mljv7g+f4DT3lllRPx/bl/
         R/wUjYohLGb49MlJw6F390tLFnF8Oo7W2jFzJhGSuapEXHSUjEJvORHpSC5FebG05ywY
         /nGQ==
X-Forwarded-Encrypted: i=1; AL+hErEUW5Rg0O1xYoJ5efr0MYhmpqFlyfFXQXicZ7KK6/KR46KcsQ7kyWlyK3RxTSNHHXz6VCSw1fNL5XJ/kboa@vger.kernel.org
X-Gm-Message-State: APuU4Z+70Usq7AjT4ljBF8+Mg2oLl9TiLxKZRqcRejv0s51suR9Rgrsg
	J+SLeYKfkwYofe7ntXoyI8PV9LucUCEk8Qc51LaevAacecnJyrIcgIVMId2wYHOaNEBAQTC47Mu
	RKlqiEy5m6F3H23YbnLlsc2MLyFr6kE+tBFUb4OUMOai9Rtu2MUkvTJR3RnAY7Zkq+S0n
X-Gm-Gg: AYBFou3MdcR5xP9HSzFcHLXTdxeRkzJW78b4tVVUAz6SJvlkXL74WwpVWgRPB2nDAC/
	fmdzQh/QiuyHh8aeiWIM+MW8XkHEBh4y4vwmVwzaSF83mBxbbpHDR1+kvr+0GN7Jnetqw1BMmb/
	vfq3pr+cWbs6uvxovNq9FxyRPSHLN3mh++TRabvW1H+lqTz58WLNkoiX7XybxfBvA0e88bj+id5
	OIJQhm0/EHUacfxENNoGl8Ow9dI+/nX+7CRjPwWbKPlZBpnh7qyQ99AdWDm+o2Hq71iTUrUZG1x
	ecFd/c8dBTki4/7Pxs7NDuMrHOE6N1xQNgl8b5ZSWduFzisAjRwtLik8Xy6PbgpZIjCeS3colZv
	Qk7i+QwF5AG/X9+FSkdlAR6bymruT+eDnLs9Ds3Pj8Dsr8Ux6U6k5xLW+spuWAYimkDOzFMoVI+
	IR
X-Received: by 2002:a17:903:1850:b0:2ea:10e9:7db6 with SMTP id d9443c01a7336-2edb6e6d449mr12044965ad.3.1794284084671;
        Mon, 09 Nov 2026 20:14:44 -0800 (PST)
X-Received: by 2002:a17:903:1850:b0:2ea:10e9:7db6 with SMTP id d9443c01a7336-2edb6e6d449mr12044695ad.3.1794284084156;
        Mon, 09 Nov 2026 20:14:44 -0800 (PST)
Received: from [10.64.69.173] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6d4d838sm4208715ad.12.2026.11.09.20.14.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 20:14:43 -0800 (PST)
Message-ID: <7c80e1ac-e4ed-40cb-b562-cc2a27e6bc3f@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 12:14:37 +0800
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
Subject: Re: [PATCH v7 00/35] drm/msm/dp: Add MST support for MSM chipsets
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Robert Meijers <linux@robert.meijers.dev>
Cc: abhinav.kumar@linux.dev, airlied@gmail.com,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        jesszhan0024@gmail.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, lumag@kernel.org,
        marijn.suijten@somainline.org, quic_abhinavk@quicinc.com,
        robin.clark@oss.qualcomm.com, sean@poorly.run, simona@ffwll.ch,
        stable@vger.kernel.org
References: <20260929-msm-dp-mst-v7-0-4b81473185e7@oss.qualcomm.com>
 <c329cd0a-1396-4a71-a0cb-6921427f7699@robert.meijers.dev>
 <vr7xot6mfkdjou3wy2ni33ctban7goaqsr3xuw73przuefaupp@6lexppuvjypx>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <vr7xot6mfkdjou3wy2ni33ctban7goaqsr3xuw73przuefaupp@6lexppuvjypx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAxNiBTYWx0ZWRfXwkFxCv99e7sG
 AJP32EUM646bjHDOEBOsqE6p+lGoUd7GFRK+lEMnufk87YljTA2DiHuz8lA15w6MDFSdY11cHG5
 r5NL7pj2pMRb6HR4csmkMLMxjX7ZtLEuDtwLlNsjGRr3QpK4VztACE1ARuqT9ECXV0tcmQObZTK
 pb6k7uB+sGR6Lnn+shfqsNg6Z6TOH+s4k6aQ/hAl/+3jbmXm6XZfZVVg887msH24KDmBiRrQXMC
 vrOUOa8W+EbN7aw4Ea6ra8Z3Dm1LmyjjhoaK71Kkoh085Eimy4lHH4oyJDwNyT7xK5Jz0wzewwq
 lBniOXAf/rbzKC25VBqEiHbDv0mEe0++DRxLqxjv2vM1GT02SwVx8qbsAiiNdDkO0W38bMJMqDz
 N4n8TLXhCjLwnSMQxQhj4xnEr+vccSnNRUd8s6VL9KlrdFTsIt5Z7uR/LVENiUoDP1zUBbvB6sL
 aWMNCgEb0XjaxTYQu8Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAxNiBTYWx0ZWRfX4F6LzdIGavGd
 4gG1BLr5EHGVqBiqip0txJn+7XvqiubDO3pTBBvjyi0fWGywCOxaKltoCZV33sR19/KJPZ8MfAL
 /1Rg4H4L6hJwnZB9AW8eH/+FdFYGoeY=
X-Proofpoint-ORIG-GUID: zKJDbCzMWj8FGgolu4i1M3qJxRCbYN0W
X-Authority-Analysis: v=2.4 cv=TaQDJhQh c=1 sm=1 tr=0 ts=6af29a35 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=m0oZJYypAzi8eX9yTqQA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: zKJDbCzMWj8FGgolu4i1M3qJxRCbYN0W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100016



On 11/9/2026 3:25 AM, Dmitry Baryshkov wrote:
> On Tue, Oct 27, 2026 at 10:04:54PM +0100, Robert Meijers wrote:
>> Hi,
>>
>> ((Sorry, re-sending because the first was rejected for not being plain
>> text))
>> (First up this is the first time I'm participating on a mailing list,
>> so sorry in advance if I'm doing something wrong).
>>
>>> Add support for Multi-stream transport for MSM chipsets that allow > a
>>> single instance of DP controller to send multiple streams. > >
>> This series has been validated on sa8775p ride platform using multiple > MST
>> dongles and also daisy chain method on both DP0 and DP1 upto 1080P. > > With
>> 4x4K monitors, due to lack of layer mixers that combination will > not >
>> work but this can be supported as well after some rework on the DPU > side.
>>>> In addition, SST was re-validated with all these changes to ensure >
>> there > were no regressions.
>> I have applied this patch series onto a near mainline 7.3 tree for the
>> Xiaomi Pad 6s Pro ("Sheng"), with SM8550. But with these patches
>> applied I don't have working audio, over USB-C to my (DisplayPort)
>> monitor, anymore. If I disable MST support on the monitor audio works
>> again. Debugging (using AI) reveals that the DP0 Jack is not reported as
>> connected anymore when connected to the monitor, with these patches
>> applied and MST enabled on the monitor. As shown, for example, by
>> amixer:
>>
>> $ amixer -c 0 contents | grep -i -A8 -B3 -E 'hdmi|displayport|jack'
>> numid=208,iface=CARD,name='DP0 Jack'
>> ; type=BOOLEAN,access=r-------,values=1
>> : values=off
>>
>> With MST on the monitor disabled this outputs "values=on". The same is
>> also reflected by "pactl list cards" and "pactl list sinks" where
>> HDMI/DisplayPort is reported as "not available" with MST enabled (and
>> "available" when disabling MST).
>>
>> (Again, suggested by AI) I also checked the ELD, which in both
>> cases (MST on and off on the monitor) is identical, including audio
>> information (like "speakers [0x1] FL/FR"). (Also, audio works both using
>> an AMD and an Intel based laptop, in which case I can also choose
>> whether to use "HDMI" or "HDMI 2" to switch audio output between two
>> monitors, in daisy chain).
>>
>> So my foremost question is: should audio be supported in case of MST,
>> after applying these patches? Or is this possibly out of scope?
> 
> I'd say, it was out of scope for now.
> 
>> For clarity I would also like to note that without these patches
>> applied audio over DP does work as well, irrespective of MST being
>> on or off on the monitor (obviously always running as SST because of
>> missing kernel support). Which would make me believe that no audio
>> support in the same setup might be considered a regression?
> 
> Technically you are right, it is a regression in your case.
> 
> Yongxing, how difficult would it be to support audio over the MST?
> 
I don't think it should be too difficult. It would mainly involve 
programming some audio-related registers for each MST stream. But I 
haven't actually tried it yet.
>>
>> Note that I do understand that me running a forked kernel on a
>> (by upstream) unsupported device might also lead to issues or require
>> changes for the fork. And that if audio does work with MST then this is
>> something the maintainers of the fork should, most likely, fix. But
>> from the cover letter and commit messages it is unclear to me whether
>> audio support should work and/or has been tested when MST is in use.
>>
>> Kind regards,
>> Robert
>>
> 

