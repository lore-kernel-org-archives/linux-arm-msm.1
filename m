Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793291786;
	b=4WxdZpphYjapulOthVZA601bgQ7H5/xjnVgjHgsQw6+24o74WuOa9GRk14sIQOuCpOFM
	 TRGNlEXQBPBIcK9ru/I4Ll4DlB8jnDl5dm32QVXMnolkKeJU9fPyunf1KjW7ZxC1ySDGz
	 uA09RrqdjehSYKngcCvjUvImHDkdHHTfFp/4VpTpMDv4NLLx7PjreSw4hvNL0SHHvgQIi
	 IFoiTcAgb9IBBrxfyeyjedBYtzgJR3i3WM/fwXBnpUuonXzpp/WVok+v2mq474wEc++kf
	 pSu/6fAEGykrCKirK3miAXZFcgG6f8fvf3qBoJBdwD4A88G7pm4oYS3YUajCAns2FIQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793291786;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=kJdI7lgw36TcxKveMl5fMT9rIbHK9w/ZYjtL1gqVF1M=;
	b=bcvyiXHO+AR9WJUuDzcKpsMFhlHvWVpeYYwn+pYnPD2CUL3fnqLIYNDHK3YYsYH9O20O
	 VZH91DQ0pNlomTbROJ/5Ilje5wj/nDC9t7IgaryCDSARnR8iF+cfUwVjS9Zx2i8hL5fcq
	 hHqnE9H2tQx5OND8rZX+451kTbCMxWcelYeUFQaYXvA8kfsObaOtTYv0Tv4ND9FgjYRxT
	 zQyV20IXvIYHbm0qVphIFHlzuJg/ZsjGNvwzbUQyrGKnja+s5nUIjmbp37tAZ0mBM0IOJ
	 jx3SO8MULvK0kRQM8FH9Njc5mQYSfcMq0nAZuh6TDSneTWHKLSl/XMMrlv9KpLE/NdQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=temperror header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YJv5fObZ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HvUS+66i;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70827606A31D
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 16:36:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70827606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YJv5fObZ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HvUS+66i
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TGD7bE1143524
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 16:36:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kJdI7lgw36TcxKveMl5fMT9rIbHK9w/ZYjtL1gqVF1M=; b=YJv5fObZsxXrs5TJ
	JP2FiRwWcJLzY5Ooe1F/a4kjaCYdASWRjwzbJPuMGDfG0c3vlyjsFq19kXD+kuLC
	etB+pXh+AXmUftAnGybcVOC60/TpddSjI4OKAU0X1oxm9HQB855J/efC0ZxRMtd7
	myEoK8Tq1P+B/0m2ER1b4r/lGjnAtFCgQ0DcryuBM+TamOsCLb1fWHn4zjPIulti
	PsGlwVLHeLm3nxKNwK+zInI8/Zp5YM8NmeEDPgAR/T5xO8sGKo21OsJ2NUASzYED
	aZ6+/5RE/8lR14LSqSbAtnd2CopMflOF9YgLtPoxGT0xhECZ3Sxgfbb9b5cmiAy2
	XaOzlA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hm76cgvue-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 16:36:24 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f5844cb60so186668685a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 09:36:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793291784; cv=none;
        d=google.com; s=arc-20260327;
        b=BG0laM8mLz0r99cOGRXyj8jl/0FPeZTX8JnThgs6q8cHgSuHrqfF1NlxZSHfbFTJZq
         8rFtssKDRR2fGHxVpmO+O4dkuWpGJqTKr8VKt3Xnm4byES1UMnptkWWyX//U915QjUKT
         uwlM9AZTdECPpb3CDTtWYa0u0hcbu2OhviKmxGuV+qIDN55dT1yAohGecWZCuLw+D1+z
         VduT0tX16sFR5hkHVPQdc4fg/RkNwAz88Zkm0GP4/QW/4x4uSiL+L2Q0QIL8dSE80SxV
         X5+Gt1RVuSfqPukpWFmomgL3dkOTCIr1DyY0pJ4tyMptbRFdWfpGzpdm0R3orK2KeAIw
         vifQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kJdI7lgw36TcxKveMl5fMT9rIbHK9w/ZYjtL1gqVF1M=;
        fh=2+tYyaL4L6c4a6WGcojzDCOvwcf2hYZId4/JuSqJgAg=;
        b=HC/1tW2uVoyGc8I1AQinW3wz8Ys3uCUR+cNQFa8Y985eV87NNpewCrwQL95F7r2WKT
         SNt2dm9FH+R1XyJkYYxyAexHeJ2XDEES8wsE2T5KFFsEOrimFGgSgeRVNxVp1R5slnxw
         rQWFjT6yWuJTrs+0iQqiWKKgC/UOSMGyqpa8UdU1Jqc/5TFm5HT7GajIKIueCx06pyLn
         Xa6PKkkIvYE2E+VjekhM0Ms93RSOUoVQQ6nWPx/rUtWb1SSvisx/YK7rgsNqFvkgN5Oq
         9H93F9CXOJsQwt/0cGXMKhRkn5Z0aeDMNY7l8zIyKL/kCMZkmukYK6NJnnRLYS74CciM
         7j5g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793291784; x=1793896584; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kJdI7lgw36TcxKveMl5fMT9rIbHK9w/ZYjtL1gqVF1M=;
        b=HvUS+66iBocUOf6Y1f4wvmfEKo4eVByzq1G05DReTOcnZ4PT0yBwqHvLyibsw9xHLB
         Fn88CxtZsBgUcz4xfaNXyukAjDjwTOIoUt76UWuhA6obvgK/0ODgMoSW4jMTvUoXV2wP
         dPUxnWOe8TjxP0Fh8RoTzITb/XkCUVe2FL25UqCichmKz+b2fvBX0PaWqyUYJ8vwj9vH
         FWo4aRrRLAa6s7IP4C6aCM1oQiyACPmk8R7v/zNzq5M0nMcYcBFcLdhB4+8Mi00R0SH9
         E+Jhqv/ygTdcTgfno0MPXRRoC28jRH3tA6TcyLQ7GhM+QZfJ5dy13rfW70BAqUiKwy4t
         0m4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793291784; x=1793896584;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kJdI7lgw36TcxKveMl5fMT9rIbHK9w/ZYjtL1gqVF1M=;
        b=xSG35HFb/UZpxiYI2o/BI8L9i4KRSNRN2f2Mv1/0EA47qNWPyQDDF3hVJaDLuaOYsZ
         rAEzdYY5lRDvfJlYezYwyzPa/1H9EZxMZg1kh0KpAXU4M2pjohbObXU0zKXxZAM/68aK
         5c/zJbcpRWnGNtmJ3jl7ikb6YXfXbf4byYHEGbvFttDygykXrbJkPmNKcvaxbUwQrXIQ
         xZBljpAQnQdoS+WfA71PfB92qkY7bdhCBeK3Y+d1pHubzpYxiqtVukJ85FrY123cw7BT
         98ZjmfXfIncG6OeDYi3J0VFppTFeZZOmbevo1RoZgnPdAf0gFECfDeeDZmXxB9AzKvWS
         pTlA==
X-Forwarded-Encrypted: i=1; AKwUvBzhI8kSzNBLD/S2kh38H0EUG9/KLv71t8BhDE8dvhHlram6cgWDrdUhbvnPGtec3R/78VxKgSBp0fuwt5SW@vger.kernel.org
X-Gm-Message-State: AFq9FYI5jO+N4IN79lc45GfztUyg92bvPIr1JML/JT9+v3IHW76jep1+
	lUF1CTTYXFQz2EAqZ6UE018pojxiaANdTp7mQ0xkHopIPSvE5iaOWnH51opCjIMws7IxHSt/H/D
	1vXdeiszalnQbIwtxmkUsqf7rAtQlN64eW6JuJM3rGpKpJHU8mu4uIgITF+RR1UbtEi9FhDROCO
	d7bdhddnLtw/nfDz7cy3DFusXhLwvxeLlrS1zrU9LREjo=
X-Gm-Gg: AYBFou2VsufNxnHweT1oOkyModmx4yLqOc1BZmKV8/LmWGxoBKKCseVgwh+/dX3fYFM
	SktaqYPkABpIMXjJTSc3SMRJxD3lOUs3oqanRYEiwDynIAW8ns8q/yHAX66lTklVYCkc3zk8+7/
	tHUbvkdtnIzGvkYquZ8WapQIsthw+rLb+9qwUbYiY2PUblMzMnFF/ug1UeNhmL6P1S1KUJj/qXE
	ZXUJggAe8E5XeuoCuV9/K+L8a/zGsAzvrUc/2cliRS2t8X6pZjxUyk1S2vq2KEj/WVd2KL5JiYF
X-Received: by 2002:a05:620a:410f:b0:93e:53db:d59e with SMTP id af79cd13be357-9441338b4cfmr451652985a.23.1793291783829;
        Thu, 29 Oct 2026 09:36:23 -0700 (PDT)
X-Received: by 2002:a05:620a:410f:b0:93e:53db:d59e with SMTP id
 af79cd13be357-9441338b4cfmr451650085a.23.1793291783401; Thu, 29 Oct 2026
 09:36:23 -0700 (PDT)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029-v4l2-frame-sync-v1-0-d37992559c58@kernel.org>
 <20261029-v4l2-frame-sync-v1-5-d37992559c58@kernel.org> <CAFEp6-2ykusk85REekU3mmFw=4g3yjB=doOi=i=1LS5JEe4T3g@mail.gmail.com>
 <CAFEp6-1Y=OyFHPnGER0GvGfTpc4o3_wTvXncvLWM81T9M-7+kA@mail.gmail.com>
 <1371d5b5-d347-4456-963e-8effb4a82f27@linaro.org> <ada94208-4a90-4e3a-9d9c-1ecc87b53d6a@oss.qualcomm.com>
In-Reply-To: <ada94208-4a90-4e3a-9d9c-1ecc87b53d6a@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 17:36:11 +0100
X-Gm-Features: AclHuK-WDQCkOQS8rm3sz4w-2NNyFvkqhd1R2IYzL8N9_O99RTw_p5nx2kiOD7I
Message-ID: <CAFEp6-0xQTOvTHJyYBK_iT+wz=yrHgufi68NJ5vgEn_PMZx5pg@mail.gmail.com>
Subject: Re: [PATCH 05/14] media: qcom: camss: csid-gen3: Enable RDI SOF driving
To: "Gjorgji Rosikopulos (Consultant)" <gjorgji.rosikopulos@oss.qualcomm.com>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, "Bryan O'Donoghue" <bod@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: MruPJFzXo_f-S-AFpxwEEQc5idIlPoc6
X-Proofpoint-ORIG-GUID: MruPJFzXo_f-S-AFpxwEEQc5idIlPoc6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA2NSBTYWx0ZWRfX+SWiKmQAxe8x
 uN08WsRFZfKdKK7ebZsOX06ca1c+wgDaRWKTUTKEVpn62Dtl//p1wML1D+Icnj/x9vPlWjAFb5p
 OKxC6NtPFF6NtM9vInGVaEMmlKbSSA8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA2NSBTYWx0ZWRfX0SNS/3XSGHPe
 o4+Jw2U+tAZWSHieJn8i5qH3KKUOJxrkut4iG+rx1yulQvfy2Zj6gGDRQs/ypbe1UPEOHi5LDcx
 rT44SuQCc86uLC8K2rU1ym+Z2i0bbpfc6WV9b9IqsN+rR8s0G+s+jOpOTEu0kKny2+nPd5VxZRx
 oK8U2It5pkBRpOnc565OApzEfOXEVXPTo7ejYrbeQBRTecsy8OXH5g9aY2n/GuH59lDL44JUAHu
 TRYFsRQJct4PzkruDouGOnWfFtJd4F8jZ+4fVDK/0dVgX+ruWFa1idju2G/KwaC1m6evncVv7mM
 j1fcLFjgLCbqVXc0yx7NhBElY3UnzleiRZsPSlP+4I29BNpu418ChA16EnUqaoiAfnw71nVv2b9
 myNFf3ZuKNifrgJzxYLwyqZjoMtvdA==
X-Authority-Analysis: v=2.4 cv=NPtAaE6g c=1 sm=1 tr=0 ts=6ae37608 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=3Wac3Xa727c3rp011QQA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0
 suspectscore=0 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610290065

On Thu, Oct 29, 2026 at 5:25=E2=80=AFPM Gjorgji Rosikopulos (Consultant)
<gjorgji.rosikopulos@oss.qualcomm.com> wrote:
>
>
>
> On 10/29/2026 5:49 PM, Bryan O'Donoghue wrote:
> > On 29/10/2026 15:46, Loic Poulain wrote:
> >>> Is this something that should also be tied to frame_sync_en?
> >>>
> >>> Also, just thinking out loud, are there cases where we'd want to
> >>> toggle this dynamically at runtime based on any V4L2 configuration or
> >>> pipeline path? For example, should it be enabled for the pixel path
> >>> but disabled for RDI?
> >> Obviously, if userspace subscribes to the related framesync event, we
> >> should enable it regardless.
> >
> > That's the behaviour already :)
> >
> > Again though we want SOF so that we can drive seqno which really
> > _should_ come from the CSID signal not from buf_done() *
>
> My opinion is if userspace does not need on SOF events, the buffer
> sequence may not be  important. However, for use cases that require
> bundling and matching frames from different outputs such as DOL,
> it makes sense to tag them with the same sequence number.
>
> Therefore, if this feature is enabled/disabled if userspace
> subscribes to the frame sync event, this behavior should be clearly
> documented.

Ok then probably better to have a consistent behavior and always
leverage the SOF for sequencing when available.

Regards,
Loic
