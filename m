Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AD3138D419
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 10:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787654157; cv=none; b=eHTaF2de75vaUp5TGaxS+zEHESLhtixLcDGolIcc6pemhkdJRd6XbfQvk3cmBi4LUnTmY17t+dNpuV2bzCHdl+h4rWTDx0YcMsnjWlwlULn2HZ7RQU4merfYj85OCBJgUOs8xwoO5l8t35zC2wKPMO3ODCcDF7RQz7KhgHQKkUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787654157; c=relaxed/simple;
	bh=DfyVBN56e2NqPZWvmOnCCiUB5xG2xPKXSlt6DQy7tUY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Yn7YIkl5RgMesaAfL0X8uPTRFDappXXnK6x9R+lOcoUvlDqPvq9kk6F72C0Zi9S03A5pidmoUXwkYRmvf0zZ07sOU69cbDMdCbaiFFX7ZZvql9vLx5vDLvFWGFbieWDRvlEFhL443pX9BSsRrHUnloKB/4fg2L0XyCMtYBCn4Bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dH95ZmWn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S7YeByVI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dH95ZmWn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S7YeByVI"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67P88SFp1163466
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 10:35:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yl0QksLVyVsTjDDZ0w/DwLlXDR6Eujjgayv0fISugvA=; b=dH95ZmWnEdI6Gjju
	+GkgT6VRYbp2Sjz5518/1EMoLgl4kul48SA4WxbLfl56HAnB94A+cBDpHPAZVTeQ
	fUToiNw+8fawFtDTCRaskxWUQ1rXPRIcEIfgu42tvAfuoDd0Oum4ZZ7Ppd2+kZPV
	fBDMLKbE8gjFrCkXO31nw6MFiBt0CfLjQ2Cm+kObWycPOBVf15qFd50/8+mWi3+T
	iaFUlwsq/Pa03BUQFMkt9HLdK1bN5HGkW6BBOSZogoFEz6RYtTpisDZsocN2JZvn
	A1bRrNVqjxktK0nW0d3MT0ojcyS3PnNri+UDa+5YxskbmPlrPu8t2ey0vp8/9bK0
	GUSCrg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8y5jj9kc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 10:35:53 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39533bb224cso5940098a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 03:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787654153; x=1788258953; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yl0QksLVyVsTjDDZ0w/DwLlXDR6Eujjgayv0fISugvA=;
        b=S7YeByVIBIXHZe9m7b4XBpAx6cL+KB74aLdAZXXJ1R857R3bU0hkw81iu8cyRU5rBN
         a3m+6THWxmKLsd50S+6PCuGH2yiAvoI7u6kVI3Tr5hsmt+VoraCkP0ApWbFyNnlibsCb
         mAcWfZAq9+ckeAcexUCQIzZwuvc2hr+LG7FnV2xQ/mZM9X3+E1m8jcNcKnRgCOKLdI5z
         ouT+xz846ovQyHRmlTaRxVGUBVey6yELk+hKJSkjZIIeeDuCpKdR77QPzdNKaILu2ZJ9
         tgxgGOqvNRUw7swmhh7+P3J0tm95pfolOAAUE6Rh1lHGljo8ZDThQjAGwoANaptKVPpT
         bnBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787654153; x=1788258953;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yl0QksLVyVsTjDDZ0w/DwLlXDR6Eujjgayv0fISugvA=;
        b=jeilPghLRsRhY2bNxXiU0PysxyKpHLgTLd67vsQw9jrOJNqedJ4MwOggtf2sHd62n4
         nrMLBKQBDJqU2S55fwKSngO76lKUJu9fJlqIq1ItOahQCD7veJ1qjKEiit1h5qTKAhJH
         C3pzDzuv/1zNk/qdeZlIEln5bgS4aIrdba5YI3127aqEh6+I0OIrcaSQLEyjLXS6PrSP
         kC5I2r6g8F0u8EUvfcXLrw8klwdvzDYXXVkpZy7gFPRCovoMO9ToerKqO4Ei82udEmR4
         VNvuTCeqmT+kerze4aM+hjlcISLS0Pd9Mpjmzx6RyRdwzEQlHui7ILwrhdLwi54xE7ps
         L50g==
X-Gm-Message-State: AFuF++mGhazN7VwpdaKS0W4faPX6X0P1KQXjGHjqcxSGmMBkSlpSRvLl
	8AFgUqL5XRF+dJ7Ggyq8wlX9hBHTVQ4qPCGrl1EE5hxnwSfW69OlWsgMZFiUXubIWQdUWwbKNM7
	PMefoZRhf/4L1evRnpJ2thZhk5fsv6YSvAPBeVomWKzR/LcGYjtSc8qlBUcC3UIa4PipZ
X-Gm-Gg: AR+sD11L5eriLPgslIc2jSLmO97vNB5PGP7eqhlBuUQARowcEx/Y6BdmOwm039ql3R6
	RnCbC6gvuTVXT5BguEgK2ly/zVk+hhmKEKsrb/bKF2rZ7q9qfK/it+Y/vWlrAd4n/wFUry7eP9G
	6qvKaKlaCjh4IemmHQR48YFWz+K5kbybsgbti+ZzmjMNdk/Jkms4C8it0wLbBWrSU5nh3wqHV+S
	xB3LPQ2ChUtlprBwuyUJjaJNR1Nwv5ekVu2FOFtym29ZWW1Zq4j5UPJ4LaMvQkZG34D3l4CKIAH
	q8m4c8w/8bqgdrpOCwanIZqCW3ZnTCLy5S4CpljabnTPTNUJy3yWtuEYwX8UYv28eI8aegZFuYv
	W/3arfUu9gfFiBTnthSrIJjLlhnz0sms=
X-Received: by 2002:a17:90b:3805:b0:396:4c63:7193 with SMTP id 98e67ed59e1d1-3964c6378fdmr7844472a91.11.1787654153005;
        Tue, 25 Aug 2026 03:35:53 -0700 (PDT)
X-Received: by 2002:a17:90b:3805:b0:396:4c63:7193 with SMTP id 98e67ed59e1d1-3964c6378fdmr7844389a91.11.1787654152532;
        Tue, 25 Aug 2026 03:35:52 -0700 (PDT)
Received: from [10.218.21.115] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39645d31e8csm3259881a91.9.2026.08.25.03.35.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 03:35:52 -0700 (PDT)
Message-ID: <92bca6c3-bf00-4fcf-8fd4-5808f883d97e@oss.qualcomm.com>
Date: Tue, 25 Aug 2026 16:05:48 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: shikra: Enable dTPM on EVK boards
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260820-shikra_dtpm-v1-1-40d96b8238bb@oss.qualcomm.com>
 <b9b07abb-b9be-478f-8e4a-204d8ce0586d@oss.qualcomm.com>
Content-Language: en-US
From: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
In-Reply-To: <b9b07abb-b9be-478f-8e4a-204d8ce0586d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=O5QJeh9W c=1 sm=1 tr=0 ts=6a8d700a cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pIAKJmClMoa1dPgAgGEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDA4OSBTYWx0ZWRfX6aHbCGXZVP4n
 bu0PsB07Ctl2OomPreuczVl9SxSAaYLv4K8rtlKbHRUJynbXey/Q7cEJxFbPU1MUSeSIy+Qcdkm
 ULcuSaSQy0EB2iLdSWD+1hYQeRi2AMrAhwwntRYQ81KUddBx1NvSuj0smOunQBsCGTVuXJiSc6q
 kvXHbI5ksdaXOF7+PPllrtnc1gh7TsryBb/lrWOhlYVtw9/x6uGriz9lwDbutBdDdy/3SVpJ6Od
 kK5NEmKin6pEH3Q42CwODJEeO5SWOZfyGgLsX2QpVNWeFcENqyyY+TYSUUcIOv/Qn23TR6fgCUe
 FYX4l4gUwlqwzadsTDmCZSR5eruJdfM0GGw5pL+ggu/23M+46cB+8t1KPvkLWrhjYCBtrtPArIL
 wY6BOwxVBG3dHw+rAcS2lmryo/xnwO0UdM6ANxc7VYKkWRDM6G5iLdUonF9FoZu644SMgGTy8a2
 kImAyJUcmZUtO/NErBA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDA4OSBTYWx0ZWRfX4KgBvrhUgjQa
 DoqPM9labO6SQ2bPz6sK1V+lHbA57ovp9ParV1vVbQB3nFezBNfgOLxXQKJ2JYMzgbsGZ+zzkyV
 poUr64a/pNJ99vi4d+PnuLkZY/mKZDE=
X-Proofpoint-GUID: 9qdWKcM2prPGvzzaIwWzU7nXsX2d86kp
X-Proofpoint-ORIG-GUID: 9qdWKcM2prPGvzzaIwWzU7nXsX2d86kp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_02,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608250089



On 8/20/2026 2:52 PM, Konrad Dybcio wrote:
> On 8/20/26 11:16 AM, Khalid Faisal Ansari wrote:
>> The Shikra EVK boards (CQM, CQS, IQS) carry an ST33 discrete TPM
>> connected via SPI5. Enable the SPI controller and add the TPM node
>> with the ST33HTPM compatible and a 20 MHz max clock.
>>
>> Depends-on: https://lore.kernel.org/all/20260820085347.822-1-xueyao.an@oss.qualcomm.com/
> This is not a valid tag to put in the commit message
>
> Why haven't you sent the two clearly interdependent patches together?
I referenced the SPI5 enabling patch because the TPM node addition 
depends on that change
being present. I had followed a similar approach used in an  earlier 
submission
(https://lore.kernel.org/all/0afa55d5-20bf-487b-abe0-4e2126ccf453@oss.qualcomm.com/), 

where the dependency was mentioned in the commit message.

Since the two changes originate from different internal ownership areas 
but are functionally
interdependent, we have been handling them as separate submissions while 
documenting the
dependency between them.
>> Signed-off-by: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
>> ---
>> The Shikra EVK boards (CQM, CQS, IQS) have an ST33 discrete TPM (dTPM)
>> connected over SPI5. Enable the SPI controller and add the TPM node for
>> all three board variants.
>>
>> This series depends on the SPI5 node addition in shikra-evk.dtsi:
>>    https://lore.kernel.org/all/20260820085347.822-1-xueyao.an@oss.qualcomm.com/
>> ---
>>   arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 10 ++++++++++
>>   arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 10 ++++++++++
>>   arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 10 ++++++++++
> Turn this into a single addition to shikra-evk.dtsi
I intentionally kept the changes in the individual board DTS files 
rather than placing
them in shikra-evk.dtsi.

While the current EVK variants (CQM, CQS, and IQS) all carry the ST33 
dTPM, a future
board could potentially reuse shikra-evk.dtsi without supporting the TPM 
hardware.
Keeping the node in the board-specific DTS files makes the hardware 
dependency
explicit and avoids enabling TPM on boards where it may not be present.
>
> Konrad

