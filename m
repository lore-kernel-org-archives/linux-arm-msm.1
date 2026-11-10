Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794284093;
	b=IAlVtHwrywBVOKACgU67ajFi7dXn954E4KhohRJNNxTgNyX7vucvD6UC/QwQmHIQNJ6c
	 UDKpRwokDiN1bOv1Bv7ngqhnr1bt/221WfD25cifnt9HQv2e2aleDHoKAt2as1w6s3gdB
	 3MUocybFb0H4akll/DQSJXqWkcX6BjusHV4l1wxeDUQC/QIdoQyl8qYrSdxbK7sklyy6u
	 FUOZf4iJKKAOvRz/AvGXyKjRfUPj4fP/Vm2J/CR8Um1zde7e4dSRFxeN3jiP16qTo48XY
	 5J/2cvjxiWTHTKaoinM1f4U36siV9qDtMCE7hiWKSezwFNPHQtxNRSKLhh5+3nIF9jw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794284093;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=OQIhJ9P2aVCPhaAWlXFblplRpy5ISGBvZif7bpHO6/E=;
	b=nucThWe27VGf3Gc+VaMyUUF7fSi+eKX3Fsb/d3vNNC32fgMfiy5yT6gKqQdNZP1zhQ8T
	 U+Q6KYY6RTT9tfOPjV6CVrFNjTHV+3Q9ZuXyigSiV+68Ffzi/D6F6D1iKMnxNGwJFAY2y
	 p+mD1lMo919DS4M1MeTFAuloNgt2xryRb7oVMREpjo8WD/Szkqdwc/SdRd51T2up0VcRs
	 m7qOeRXVfxWaeoOMa6aFcQl1oE+0ZlaggYuLgXNitK0cy00aETSY8rY5Ads6pxuNai684
	 wBOTkmpme6gZVLREpHFV3vRCO3o6a0wi9pvAHeFTftKt4vfqqmRTniXqdflJRhhQB3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bF60muIA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jT99OhqM;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6D5A606A325
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 04:14:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6D5A606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bF60muIA;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jT99OhqM
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA4A6RZ2297864
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 04:14:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OQIhJ9P2aVCPhaAWlXFblplRpy5ISGBvZif7bpHO6/E=; b=bF60muIAYY2AUBiX
	Z054O+oM5cpZ10NEt7uTrlZVJ4KFHnWLK4vZmluDrOhBPLd50fNTLTkvR5EGB5p5
	TOtBoHR9j1WGJXXSSCF4FqgJ24lXnXbCqioSV8+Xiaa39mhfmdHB4dTR+HevInDU
	PjU8RW+X+AaqMS7Y9TxwDSQ7/bQ1xzBTTP/G0581aFHwJuE6hGnLcZBKip41eEMk
	0RHONkWvjJ9ys1RXtvS3t/6JufItHjJIhgp/MTATZAij9bmEpMG4bd1Yolb3LaOu
	+qO3P4yQ0TLMNcAnpEkRAE/qGe9bwPb8jKOpZwY6LMCle8qWCF5rZecg9gMZJ26H
	DOmpYg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hu6x2mvvq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 04:14:51 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ed2c307e62so24210175ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 20:14:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794284091; x=1794888891; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OQIhJ9P2aVCPhaAWlXFblplRpy5ISGBvZif7bpHO6/E=;
        b=jT99OhqMp3R35w0nNqOm7g4BmqiYtoIV5XaupU/NnU9eFxhpFRvRx3IC+kI/x0BIWi
         ZaheNInucx94qpxbl2rCFStYmlXRv7j7Fu9PxZmxUCBayKYXZygYZ0zzxzo5MtWB3db6
         4StnY8Xx6FFop5FGbJmo6RzAgx+up9pTJHCaQsa67t4m6w+9heTpklxLVj0LGdVAgTI4
         ml5FIdMw6L/hEZ6dtwFVV+Ql1jbjplyq+sdG0TNyD7Rvr4h/WGWa9jxrHzYBLe39xu7n
         pbb+wo9d7nY15Oz51avw3RHzjCW4FYClP5JAh4kvr35FFBEZBJZR2BX2hW05mM4y2APT
         HVhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794284091; x=1794888891;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OQIhJ9P2aVCPhaAWlXFblplRpy5ISGBvZif7bpHO6/E=;
        b=ycV6/BA8fIeSsNXwGcJWEIXvlc734kqlp0oIgMDCJhit+12HoB9BlKepsIDJ+hH5KW
         1ibcx/e5Wl0voRiLEZ2jcuaCHYQe4Tom581MDicENgVfGZZWXAZR9+pKnUEOU1HLIVzy
         AAE//vTo8npuazqpQexwJGy87Mkrdc0y0TpRPjfGf9jvr1uL+7CQNswyf6Q0yZ9tmhtE
         WP4o4x9ZqCUf/m8M1+Et9rAJtqvHM7YT9ojD+dlt7llu9A16o548bRcJeFfPVBgqglj1
         7QVsq33maVrMXXCl44qm2Oyqr2oWvBj1ZPaDZjvX+YxMSmyNmlaYjMwYdO6MB4iCLcnx
         vh/w==
X-Forwarded-Encrypted: i=1; AL+hErE7y/iERZ4QjJGJsVU9eP+Ghe9QaDg4KUfgU7y5irD0s3CgmIWSxm3EI/0pJLuON89lj7DYHikyh+47UTPt@vger.kernel.org
X-Gm-Message-State: APuU4Z8iXazsgq3VEe8Zlyr9ZJpF52YQaOrzjJH2kvetw7UntNGJL1Dq
	5v8NnxZCCBzOJMWvowXbxzUPTSwxj4L/lTDrjeXVxLqz0IapEoVJNfzM1A6XeXMic/GUz3Jrjap
	1nT+AuF9j9+5nTa2reBw90fe95as2u7h2D4EyMGvHuyxYjAtbhTJAWt1s/kibJojh1hjQ
X-Gm-Gg: AYBFou19PxpwTuh3fA64uxQIY1ud7z/ciVanoxDpN6+zoxHmS1prU9YwoIOMeLNH4JY
	+JHM/+tWB+O05ivMTgYCrtYYIOrLQK2+oZjNreoA40Bwv87xfrMV3qqg2Mcyazbr3NTKcs+Ddzn
	DCpM2k3NjSthSYqfDeoMVvkbPGTsh4EHphsPCikhc7e8Dh5WRTjFpE2hLO331ybqLtvkQTFqsMk
	Hag5CCgCyu4MShq6gyvaCRANtrrja03e/hF5zYwwQX1VAaftWMemcKhzegttwGWqiNNm163DfrJ
	JW8smB0aN29qyx3ieW+h/29FeQIxJYdNxZV39tPIQvTA3sDxmFbzZLIgwGyk2b4jwbORyDfaIyp
	qF5ESMcKXudnpKEfIUFjdAr0QCZkCyILj7XzpmsgIDnimvv+AeZHbHstVoO4uE0PMYKzzRRVtBQ
	6f
X-Received: by 2002:a17:902:cf12:b0:2ed:cab:e973 with SMTP id d9443c01a7336-2edb912b6a5mr12936445ad.13.1794284090754;
        Mon, 09 Nov 2026 20:14:50 -0800 (PST)
X-Received: by 2002:a17:902:cf12:b0:2ed:cab:e973 with SMTP id d9443c01a7336-2edb912b6a5mr12936305ad.13.1794284090286;
        Mon, 09 Nov 2026 20:14:50 -0800 (PST)
Received: from [10.64.69.173] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6d4d838sm4208715ad.12.2026.11.09.20.14.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 20:14:49 -0800 (PST)
Message-ID: <f54522fe-064f-455b-ba13-bf084576c647@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 12:14:45 +0800
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
To: Robert Meijers <linux@robert.meijers.dev>
Cc: abhinav.kumar@linux.dev, airlied@gmail.com,
        dmitry.baryshkov@oss.qualcomm.com, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, jesszhan0024@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        lumag@kernel.org, marijn.suijten@somainline.org,
        quic_abhinavk@quicinc.com, robin.clark@oss.qualcomm.com,
        sean@poorly.run, simona@ffwll.ch, stable@vger.kernel.org
References: <20260929-msm-dp-mst-v7-0-4b81473185e7@oss.qualcomm.com>
 <c329cd0a-1396-4a71-a0cb-6921427f7699@robert.meijers.dev>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <c329cd0a-1396-4a71-a0cb-6921427f7699@robert.meijers.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TMjQ2Fla c=1 sm=1 tr=0 ts=6af29a3b cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=dRm9NI7_ec0In7u_rNMA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAxNiBTYWx0ZWRfX7q7CfQd0FG2X
 nVa2kGHzDFnZiywORYG3ESCU93EgNjoQt991I6FPsR30Pky9hd78ge1fhM/d6swt3A9eblqPSkE
 hQSA1m/hti5SKLbCkA6E5q7VLaa1VpfPuCr20Y1Dw81zWzlPM+MKQaciGvynnwytRh8KfxGA9JF
 0/fCWy/tvDZivXKHiPdLxUNbBhN4rzykgOvDi2nR4aut9PQBuY1xJ0cYktZTW56YhCFA55bpxJn
 YPlr44eUMo/dRkdKaFx+thKlyTLXMrWH4VBkB6ECigRSwASIqoo/wGfsDo2prVV3hD8AWFTjK+n
 8JeCD628tVe1E5zQjpu7XDKmOFXwlXx+CaHSXsDHE0c0yXYlJ+UbaDEquTFDnvSx5A8ZxXCTsKb
 mJnp5BY7p0905iQLuHM9eeZDbSlBIOoPfw/Q/bCZehs3raqWjDsT3N+lpLCxkdQziLqKoFTuNne
 ARZSjIvWscpbNRIhkHg==
X-Proofpoint-GUID: _hsJQzRCl_fi3TzD7UKk0WByqEX4Z6zQ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAxNiBTYWx0ZWRfX9SVfbstoNuOY
 jKerRuo42Btb2eBhB3kDUthNiNS2IEEOTPQyF+F2+AXmUr36y9LylaXumqDWrWtoNl4NBmWI0vC
 7pe8HWAh1CYM6vMwqEdlzsyxN2JSwVE=
X-Proofpoint-ORIG-GUID: _hsJQzRCl_fi3TzD7UKk0WByqEX4Z6zQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100016



On 10/28/2026 5:04 AM, Robert Meijers wrote:
> Hi,
> 
> ((Sorry, re-sending because the first was rejected for not being plain 
> text))
> (First up this is the first time I'm participating on a mailing list,
> so sorry in advance if I'm doing something wrong).
> 
>> Add support for Multi-stream transport for MSM chipsets that allow > a 
>> single instance of DP controller to send multiple streams. > > 
> This series has been validated on sa8775p ride platform using multiple > 
> MST dongles and also daisy chain method on both DP0 and DP1 upto 1080P. 
>  > > With 4x4K monitors, due to lack of layer mixers that combination 
> will > not > work but this can be supported as well after some rework on 
> the DPU > side. > > In addition, SST was re-validated with all these 
> changes to ensure > there > were no regressions.
> I have applied this patch series onto a near mainline 7.3 tree for the
> Xiaomi Pad 6s Pro ("Sheng"), with SM8550. But with these patches
> applied I don't have working audio, over USB-C to my (DisplayPort)
> monitor, anymore. If I disable MST support on the monitor audio works
> again. Debugging (using AI) reveals that the DP0 Jack is not reported as
> connected anymore when connected to the monitor, with these patches
> applied and MST enabled on the monitor. As shown, for example, by
> amixer:
> 
> $ amixer -c 0 contents | grep -i -A8 -B3 -E 'hdmi|displayport|jack'
> numid=208,iface=CARD,name='DP0 Jack'
> ; type=BOOLEAN,access=r-------,values=1
> : values=off
> 
> With MST on the monitor disabled this outputs "values=on". The same is
> also reflected by "pactl list cards" and "pactl list sinks" where
> HDMI/DisplayPort is reported as "not available" with MST enabled (and
> "available" when disabling MST).
> 
> (Again, suggested by AI) I also checked the ELD, which in both
> cases (MST on and off on the monitor) is identical, including audio
> information (like "speakers [0x1] FL/FR"). (Also, audio works both using
> an AMD and an Intel based laptop, in which case I can also choose
> whether to use "HDMI" or "HDMI 2" to switch audio output between two
> monitors, in daisy chain).
> 
> So my foremost question is: should audio be supported in case of MST,
> after applying these patches? Or is this possibly out of scope?
> 
  Not supported yet. Audio is only wired up on the SST bridge, and the 
MST connectors don't register an audio device at all. Once MST is active 
the SST bridge reports disconnected on purpose, so the jack never comes 
up. Nothing wrong with your tree.
> For clarity I would also like to note that without these patches
> applied audio over DP does work as well, irrespective of MST being
> on or off on the monitor (obviously always running as SST because of
> missing kernel support). Which would make me believe that no audio
> support in the same setup might be considered a regression?
> 
> Note that I do understand that me running a forked kernel on a
> (by upstream) unsupported device might also lead to issues or require
> changes for the fork. And that if audio does work with MST then this is
> something the maintainers of the fork should, most likely, fix. But
> from the cover letter and commit messages it is unclear to me whether
> audio support should work and/or has been tested when MST is in use.
> 
> Kind regards,
> Robert
> 

