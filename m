Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793280506;
	b=eCqzMvUZk6bU2iTV+f790mqRNVgftaIh6IjEsZqYSZ9qokplAN9PtP2ZCYiAQI2Fu+Dh
	 NQy4pcMT26lMDjJwP65tVK+TkUECxzcZ+NHceX0tOndkEVekXN8RoZhOC8wl6HTwdK2if
	 z/2QSRrcaxmqoWT2cc05FHBqXkdmmcBYXzBI8Iqic1rxuy7lByOh6VLMNzZfKlGXRcsFG
	 /t0bhjW8t6xQJrIXzdFY91LBFwzAB62kyPCZS3evkmj2a9kU9iYi8iAf5i+CvZ2mv8AJb
	 OR513shNjsDFv6edkno9SqpGSHbEac5iAy23/fPUQKIlkuNMTPcAAxjHsF+gAQv8vZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793280506;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Kxsl30UboLOS2ZpvP+RQC7ESIVxJ3jBleFGlPfY8Ytg=;
	b=1TVGchTkfD2JafgEFHNpMh+5+Kk7XmrkuytQDz9f6RLKUQjrZO+dv660h7THq3LrOI70
	 gzsyy5yI5NW9z8kGkhvXXZAfd/QJpMS9jv8PQ0fqEqFm5fDoui3/Tiu7RIAm1bpr3r0hr
	 mkdW7EmcWr4P4MkMt3xbu4EgNFvqduVHAdplqHGn2IKPMAC9J+oV1YVtw2RrNO3Vs/Ik8
	 WbeNXEHEMA6lkQef69zncYKIYwsc+GQkd8pNMUE54UT4CuqEqYpAZo8lXKuHcaz20+OJs
	 Ovfoo2s5qXS9z3KV3gNCqCto+yPZrp1sxi4oyMNHtXJdLME02LinEseoNgar/aTQt0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ladCPEJ3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=COVF4gct;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA5BF606A31F
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 13:28:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA5BF606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ladCPEJ3;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=COVF4gct
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TCeUNK2762043
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 13:28:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Kxsl30UboLOS2ZpvP+RQC7ESIVxJ3jBleFGlPfY8Ytg=; b=ladCPEJ3fJGgNUnu
	Q6vslGflvT/5r37724+q1QME0Y5rc95Cwynv0h6HFvuyIEN2qgmE4SzB5SMdWhE7
	3WwOgd8+1pouWOpm5bsomyb6HEcNAdFryo/GW22gUhTVtVgLfDMlTG9XuRdm2Rqj
	gufdSBnQDlP0G/jjZdXm7s4GV8bV1hhl4PvQm9rZTr9T1PhkZrptQzMnIUsEy0fM
	pMUDmaSvtMUb/IFiISVbRKESXJT4bavxk3WRf7KuiJRG41O/jKRmPnVEXEhbo0Qt
	uwM9pZ2sC6SfdahUmAuO47uPIksnblHG0ylKQRlQIm1tcciYupA8/Px/yx7jycK9
	Z+64KA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hm31b0yst-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 13:28:24 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f6f4fe531so362537885a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 06:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793280504; x=1793885304; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kxsl30UboLOS2ZpvP+RQC7ESIVxJ3jBleFGlPfY8Ytg=;
        b=COVF4gct45wH8WsRLchmp40/xaS9QqQobVFihMDwSoiaBvHI5VrE9F/bADazAKuWnZ
         2sGJL9qJr6ataSusGlYj/cKem5Jy4tt1RlttcAPk1rsyU25LKtni8FOKlR1ZzIQxZiVd
         MTdeU7ALiP37bUxnpczFH1o8ISL6U95w6BaVHuDlRxr/xRDSlDmPB2JdjO2+y5s4h9Xn
         qUVcI98IF1ZEO09r2ZwWq6RjP1W1OhJeqDlYfnVJB0fsFHCkr1uiLATdbRTr48UMKhbK
         8Bq1BL7p2bzSomis+V+ALoFm6p8Rzca5zp6HZczb2XR1K/NDGpWxkqc6XAfi4u/R3AKW
         4IZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793280504; x=1793885304;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Kxsl30UboLOS2ZpvP+RQC7ESIVxJ3jBleFGlPfY8Ytg=;
        b=boii+uHoqmIULvv+RAHIu03RTmvZVqLQsWcdgEV1qI+YDQs1K4nhgtlNjQgHHpNc9g
         K/DPA1bqkd2E8ogZF6PY+uygHxfS62WEqKNUo2SFu7feSkRYsfRXO0kgdh0tbw+vSsu1
         NMLQ+qvcWQNwWH9X2dMZGtxIBfAdPqcg6Sm1LiRoWYQojmoU+6LALrSbScd61iHYgoHZ
         7WF/GA4bwZXMJPcsvv2p98l/4kt6UHt3yKjKNvEJr52wcpdyusq8Jj/M2mMCV6Cmwlc6
         pfPUDPO9BzKZ+WQ5IGEqUEyDfRhwveHitcmM2ta5x57kZXafjsbTFiLOwgCWEKnlay3w
         BTTw==
X-Forwarded-Encrypted: i=1; AKwUvBzR6UNxGXvUCR2Y4kHJjNfqUBuDvXU4hHPl9sic0jF7B3QwqhHfINa52MLG+owJvHllki/m+ONTgy3+7vJS@vger.kernel.org
X-Gm-Message-State: AFq9FYI6XI9ETnTtwcXlg7OM3qWxwTG5tvoyYgL0rqyAda1xDF/+eByj
	M2n1tI/OdQ8YHdJXRrC7tK856F2BxpLzzjQW6/CWly9Mj/1OvK365pPsW41KLukin0+Hlc7hCXc
	Gl/GonxZPNACh9bRyeecNHvcG7M4mooHp5kpjBLLuJtB/Z2ywTYjYlXM36M4+Y5JFTs9N
X-Gm-Gg: AYBFou3qRqjLDP3XG5qbyHlU6h8uJjYw7x4RNtb+poNPsg1wgk3vIDNyvRrmt4+9f7o
	vHFC4FUlob3Xg6+CmgFPWi2oI61ai0u6KQrEO3Wf+6bcxKDCzqx474YzzW/T1giT6cfVvpf7pEM
	YBi509QkHf2eHCmqTJ4Ojc4FtjGS8aexd3QtxwPKX1GYaVzS7MR8BtsxwrL0pJD8VBUV4Ln0OQm
	rGbaQc/XHFAlZ+KCPbVGfSVU8ST4NdmTlAxf68qoxToPErCOw9jJxGJK0Y+w5LsYSwb+jUXyN0Y
	pjGhAyTPAyMQaNIWAmJAcy5POjsabD0/7ym30zAvRswWOtZDWElPEoAsVXzJGqXXf616SXPEJ86
	u9Wv+jhoQXMymV+dTucU+sX+TXaE59MLSgWqngC3A0hrTy36OW8ZvbcLtgN0Fc43TXVse/6tSQs
	4vBIghvxbvXPaW
X-Received: by 2002:a05:620a:29ca:b0:93f:322b:2209 with SMTP id af79cd13be357-94408aa1437mr826050585a.28.1793280503569;
        Thu, 29 Oct 2026 06:28:23 -0700 (PDT)
X-Received: by 2002:a05:620a:29ca:b0:93f:322b:2209 with SMTP id af79cd13be357-94408aa1437mr826046185a.28.1793280503080;
        Thu, 29 Oct 2026 06:28:23 -0700 (PDT)
Received: from [192.168.1.31] ([85.196.172.179])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa813d295csm67364985e9.7.2026.10.29.06.28.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 06:28:22 -0700 (PDT)
Message-ID: <05313835-c868-45b1-b246-f98cfb8a1d6a@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 15:28:20 +0200
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
Subject: Re: [PATCH 00/14] Add SOF/EOF sequence logic
To: bryan.odonoghue@linaro.org,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
References: <20261029-v4l2-frame-sync-v1-0-d37992559c58@kernel.org>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <20261029-v4l2-frame-sync-v1-0-d37992559c58@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA1MiBTYWx0ZWRfX4gJh/KCDOdis
 TN4N3doUg/OGWHvDgIKNfvpFNojU5V4CI6uZm3h0umU2HFu92wM1G5J67qwat1F4ATChbi4nkmc
 +LAS2Vjpjo4b+UwhtiY0wul+dXIibIw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA1MiBTYWx0ZWRfXzLg/FNCrcyw6
 /Qkf2mopMpSuDJK/OEslLBE7/4H09TcHrCtV8bZe/u4FmPtS0dPbPKhJmbClRqQkq83Mg7JahVb
 G6cL3PxfLcQMMvy/fUH1NiRxOrASl5Iw+boIYZ4eJiNtbO+o8R0CCPCl82bn+NUcEbVDjUZs/3A
 OdaCLEWnDahxlxXvxcKuBqnwrgYYakZcO0KZfrVktHdX6bIlbwUz3vO0b3XKgUSudLbYDG/hz1w
 74Sml2GA6LXmT7UbXGGvPh2P08uMmd4rpSHyd+/WxXDbmgD8mYiTqVXyfiNmK27F68Gv76KmwSo
 bTbqPLH8/S4sUw/gNKXKbCk9C0jLTcBR4lU7pw1paaIpptn5tFLfIdmZLs7d5w3XudQkYUT2EU3
 0HWXWXcnyFHTUAh5+OPp9lYGzOyxGEftERApwQIPSdqx6CjoH6SqGWymnG8KuNIR26BEeLjUkNZ
 g+98jNaen5WtZeHAc6Q==
X-Authority-Analysis: v=2.4 cv=A8T5rKWG c=1 sm=1 tr=0 ts=6ae349f8 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Q/e3f29T3Hw2hnAEzBPF7w==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=KKAkSRfTAAAA:8 a=382KtSWcDXd1BgHnxQMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 2eZ9pDkZXavwbToo0qUEYqBFQUiPfES3
X-Proofpoint-ORIG-GUID: 2eZ9pDkZXavwbToo0qUEYqBFQUiPfES3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290052

Hi Bryan,

On 10/29/2026 11:55 AM, bryan.odonoghue@linaro.org wrote:
> This series enables SOF AND EOF event tracking making use of both events.
> Whilst the code is actually very simple the functionality we want to build
> off of that simple code is not.
> 
> - SOF
>   Serves two functions. Firstly. Informing user-space of CSID SOF events.
>   Standard Linux V4L2_EVENT_FRAME_SYNC is trigger from this event.
>   User-space wants to capture this trigger because it allows user-space to
>   better align the time a frame begins to events elsewhere such as IMU
>   event timestamps.
> 
>   That functionality is directly applicable in this series.
> 
>   However we will also build on the SOF event in later patches to allow us
>   to begin programming of shadow-registers for the next camera frame.
> 
>   When the EOF event happens, we switch from one shadow bank to the next.
>   This is only possible if you have the SOF event.
> 
>   So SOF serves the immediate purpose of timestamp alignment in user-space
>   as well as the 'evil plan' to trigger off of it programming camera
>   parameters for the next frame.
> 
> - EOF
>   EOF even on its own is useful because it allows us to increment
>   vb.sequence for each frame as per the spec not just when we have
>   buffer-data.
> 

It is great to finally have V4L2_EVENT_FRAME_SYNC support in CAMSS. 🙂

I would like to share my opinion on tagging vb.sequence at EOF.

The EOF event is received from the CSID decoder when the EOF short packet
is decoded. In contrast, buffer completion is reported when the write
master has finished writing the corresponding buffer.

Because the processing pipeline includes buffering and line buffers,
buf_done on the pixel path may be received after the EOF.
Conversely, when cropping is enabled on an output, buf_done may be
received before EOF.

That is why using EOF to assign the buffer sequence may result in inconsistent
sequence numbers across buffers.

I would propose:

SOF
Increment the frame sequence and generate the V4L2_EVENT_FRAME_SYNC event
for userspace.

REG_UPDATE
Once REG_UPDATE occurs, we have a guarantee that the configuration for the
new frame has been latched. At this point, we can iterate over all active
buffers being processed and assign them the current sequence number.
The bus-write active-status register indicates which address is currently being 
processed by the bus-write engine and could also be used to detect frame skips,
if necessary.

BUSWR_DONE
Complete the corresponding buffer as usual. Optionally, we can verify whether its
sequence has already been updated. If it has not, we can determine how the buffer
should be handled.

This approach ties the buffer sequence to the point at which the frame configuration
is latched, rather than to the arrival of EOF, which may not be ordered consistently
with buffer completion.

~Gjorgji

