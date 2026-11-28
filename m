Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795836206;
	b=n8+ZyUhBmsN5UGzHIf07NU4kkLCYrCPh1GZWoJdj7Lyq9daShc8g7Mpyomx9cW3F6pT2
	 pZVhMaP9OfezPXwGNmCtx5NxgI+FEvjogUyDzacB8G9Dc2E5Z/EziYCW/kjiIfBOw1KP7
	 lj9ARpx1cEkVPlr9Ue+LVDP/bmeT4DHOQBPRKx5vV9U5lDGPKhgV7tQ6EwCamTluSXMRM
	 S8Iq28ut3SyTfgsvB8nknUtQx4WJL5bcH9hoBSo4n59wQmZelWmAJ7jLFN4EYdCz8CJuI
	 Hf9KzRNZQzqA+ZY25GNYQlDyhawmYdxDNzVHmEYpyPwKBJ4MttdgK1einO50tq8ldkg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795836206;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=xvLqOkRhFnCV2PyLjkezKzpeGL0t2N71xBc5T097LOw=;
	b=eygF1hdqeU7QZgMIy8g4zQ5xHu98xL8mfSmMOMpKXwSuI99TfGshIx1ypl0bEvWy2Obh
	 P1CDfgI2i6SOo/6ydnRyldeR/oN5inkPeQrZip2Dv01nHys+hezAA4VR/1KGG00gBmp8O
	 LdHOfSrL3IzQHEW+cDtvQQru6JNQlqo5QcN9DfBGbWkB3XXJpYG4IzEp8bT47wO7DvoHx
	 kz0wKV5n7PDzjLuRJHT/sA2DLYmKVJUSlrX1wVBzcVIUp5k6IkYdxkqs5U7Ew9m4Q+B5o
	 DYDTk9W6EZL9PzbXJcGCHju8M5eCH/jzX/EvajqtJEgcwVavMdhwc1pFbRArKLM7fQg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=glgdVVlb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="SmfRt1o/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BEFE606A31C
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Nov 2026 03:23:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6BEFE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=glgdVVlb;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SmfRt1o/
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AS2Bpeg420642
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Nov 2026 03:23:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xvLqOkRhFnCV2PyLjkezKzpeGL0t2N71xBc5T097LOw=; b=glgdVVlbEXW80Mx2
	5is/AiQPg1CGXsp5IZgNFFJrWY2E0bjzOr/WjJPWYJg1I9EUtuuwX/EzHUk5Rq3h
	MD0u5JbHsW9dDY98hiJU1xPxvv7dvaq9hW0TPISFntdH69pS9VWe+3pzYI/R+II1
	d6T4wybWuhKaoxmz0MQ78xZxdBgdTm4WDSz+HoHOvfcLRyzV9NEuvXwao5uN+HrX
	mqw2bWr9ty4a2BBMLwRA/DbW9AOQYVjoOP/BjHmTem6L6JUNKFwsuCw6OnJYG0Va
	Shwilxs2lXH7E9tVnIloYAlO/oeCLnsG8qiiUjkunRMt3weIBeaA9QGfQzHS45uW
	fHn3Bg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j7ny683xu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Nov 2026 03:23:24 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b41333cb47so7369938a91.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 19:23:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795836203; cv=none;
        d=google.com; s=arc-20260327;
        b=jr/+nKGRTq3bcDAPNQKunRyNGeemqLrEeZcCMLDP9p3X/ZPYJ//XFzAcpX3ETZcQ3/
         6LezNYwDVpN12UMnF43C3wKMc3uTD3E1xFk31gtYZIMjkn+cNjmmcbAMA6CQULhSCo8p
         TEs+mpuTWDGtN4R2afQXmKtSUfEc0tsnuVgru6X8dECi0KHHyl+k2iqRAIHhEHBK+mk2
         YRB0JkwEHnMPfxZWNglQWUk0xX0+UeQVtK+FebwGbEWenmLcp0e7mfEEBNJu6QjRecVa
         PjL+q5RKlJg2WwE0GlNYGpZn2J0LWv8Vl3GycRCxgU7kjoiQRH+XSez96srf2Q45qDG2
         80ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xvLqOkRhFnCV2PyLjkezKzpeGL0t2N71xBc5T097LOw=;
        fh=VY+J0FUFWG2EBAyU4/ESG59WQ24jpZSzhRoVl6x2l0I=;
        b=sd/PIXQay4NNaBpue3BHfcwsnEW8x6BJTjt1CUJTI1o/bcE8PwDERBk4prsaL0gep5
         kA/y4/reO8HKtfTOTfw377tE0bcnf0D/aqkQltzlX4l53zllrT/vabmyretByvRqhi1C
         bcybXR11/axPJqw4x1ptwcEAB01H+F1LD8TZ5fiNu/mXgogmTIHbtVNhETlS2bTqTPT4
         m8b9DKOAfdji7KaGvr3GBiEHZzpPEBuhrhVd6mSmYUrrvkBLGZFjYu62P5CcrZ8X3X+y
         zy/NecHD1xvo8ZkRBhdw/WqJpXLN4GdoytWDQbdHa4t5epCdS1J2c0ciy2avCecNHE5l
         +dFw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795836203; x=1796441003; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xvLqOkRhFnCV2PyLjkezKzpeGL0t2N71xBc5T097LOw=;
        b=SmfRt1o/4Baa287biOyZWvO6I8Ho7i0flsEed0gzE06/BS1RPXpK6c0NzqpkFn/GpI
         QOtHBXkTJfPazZTPwg7vCLTt5R5Cff7iNjxHGNKNyhP5U2FJOjX39oMYv7KSLynQhySf
         BGpAOrN1mXDFJ+lFtznCIo+eZWe61IQdYnbro/wfN/dz+sRk/GjfIVEpW0jOOGdcE63r
         oXDqHp76ZRJsqsJRzgCE2FBJtyiTV4ueVCiknq1CnOznncF1LkchYUiIU9YDYCHzl2Gp
         VsIrWlUrNhq+SAWxQ7iSj3X1DoiZp2J8wvc9nVprlAnMEJc9hGt2rS50PfrbLU9l2xhg
         tnMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795836203; x=1796441003;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xvLqOkRhFnCV2PyLjkezKzpeGL0t2N71xBc5T097LOw=;
        b=zlUaU8KmWWbf6aRSKj8cjITLrfdvSMqBH8rk3d0VAV3ZGD2Tcp5HUC4ZNwFay7sYyX
         gRGvu9DctY8t/35X93RUOVglgUfkXeR1WHcau8cwxs9HhNdmbbJQkjXenYv+wl9TRCYx
         xF1QRM97d5FH8J69/wE2oA1AjTL4plY20q6jBqblDJCjCY2zoukxO0VzbbY7uyEFkWN3
         GahZUgsBc+8GuQ9nIRw/HlGHm8ZrEsUGGODWNfd6BY0DQ72OHTz8dSJ7hq54C5S9MSJF
         QrO+oW33pJuiB0QQy2eIsGi+ug14RmCoEZHUwn/C3l64E0ebtSu5KdpDYvKtdac829J8
         zo7w==
X-Forwarded-Encrypted: i=1; AL+hErGbm6I1xkRdYmVj6AFqOyX/5a/kVDpFnDpkYd/6rCLNBhdSSVdefmOEU0FnDHowfAMxlxNRs1nqD3WGy9v/@vger.kernel.org
X-Gm-Message-State: APuU4Z+V6LgzZwIryEuMr++3zUFVKfNHjOi2QtJx7/RfebJRN9ZvMsUy
	IPo+UNEYQJMYhIy53EoI5WnyP12IVIEVOlxB+6RKEBGPHGGyDpyfyECcpt0kmU0PKdhbA2iilg7
	xr3gff0ytG5u4N2uT0bXQmgy2HFxkjI1gN+joabcLh4PGr/V14tmBhcKGGetG9NHLf+Bx+Y9g6e
	RiaenYLcMG8Yovy8Xo0wqI2b9lhAWpjHTf3hh3KN+feLU=
X-Gm-Gg: AZFdTZfea7p4g6Le9fnP5jdUSwlcsmc/yEXk/j5SsX+obGBd6XFSwnU6kTSlAnQlNCe
	UZLOGc2Za9rAfUrywscumHqC1nMybWy/752P/lqqtc22Ph0rvVL9PVDEkrBxNIlz/cORIUrLGGY
	tuGTkY9BppNT9t7EB7b9zZZMjVm+M7l/IIx4Cm5bKSPZLE8eSSZ0Cmj4i0IQ==
X-Received: by 2002:a17:90b:4d10:b0:3ac:a1c7:20fd with SMTP id 98e67ed59e1d1-3b41c7ac351mr25294735a91.4.1795836203089;
        Fri, 27 Nov 2026 19:23:23 -0800 (PST)
X-Received: by 2002:a17:90b:4d10:b0:3ac:a1c7:20fd with SMTP id
 98e67ed59e1d1-3b41c7ac351mr25294717a91.4.1795836202652; Fri, 27 Nov 2026
 19:23:22 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261127113326.2889944-1-zhangfei.gao@oss.qualcomm.com> <awo_Ft6GikSaURLB@QCOM-aGQu4IUr3Y>
In-Reply-To: <awo_Ft6GikSaURLB@QCOM-aGQu4IUr3Y>
From: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
Date: Sat, 28 Nov 2026 11:23:11 +0800
X-Gm-Features: Aa3M54pdtHVhMPiDpwvZpA_yiFjD9XBk0DLdxrb9gqbWX-5xD2AirK18RsI_fKc
Message-ID: <CAFkd8huHCnXbkLhjVg5_UW-1zD9WPyoogBKfmKGrdQYzBhD8zQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: nord: widen SoC bus to 40 bits
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org,
        bartosz.golaszewski@oss.qualcomm.com, abelvesa@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Jie Zhang <jie.zhang@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI4MDAxMyBTYWx0ZWRfXy/MYZFv9ktCZ
 bGrzRly3v2e+T1AIBodwvZhFM28jvweKDr5QElJsUh93mhnxMZJnQZkOxYyh21SXCGuBBqDpTLZ
 +j67c88yhCqmrbifcu5CJF8xv9MxlKI=
X-Proofpoint-ORIG-GUID: aqfR4EXOlgGl-7ELTIKZlAqlBxareb9d
X-Authority-Analysis: v=2.4 cv=TMfQ2Fla c=1 sm=1 tr=0 ts=6b0a492c cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8 a=dn66lLI4fUZHpx3frZIA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI4MDAxMyBTYWx0ZWRfX5v1CbumgifIC
 g6wiNFuFS9VxgydSlKXpXcRTuLLTtjFtzYU3Gf4KfJO3DOdHnPGLXRaqYb/G7t0laF606RmAhiT
 zXO8wL4qXMDChx/0ln1gqJ/b+HUo1zqh2jdmpkfQplcJMx7axOfeec4C8K0/tR1Aa9xIpMX35Ss
 bL1fQfFlqanoj94HA7taGVy5DeuO33F2KaKInGe1o51LSpRdsrDj/ZTvrR+JPX645L/UqgVo9u7
 nwpt/AVqjUZa0qBDokqgPKl/+2A63u/3uMa8O+NfX0eKNitN6eiVACnHOsD2Kbb+VldAZunjWxY
 trK4drQaZ+GjAN0hHS2Wd96Nl6grt+S+tYMWcBojrT137rs3YXpe162rtVE+qibRU8DBEETHiQk
 TTKF6cBGZ07ah3LV7FKs1a0dB6G+vz8tMyUi0icWMXdgayImoEyG+mQcW0Hb46A+UWNzt0zCiSp
 ikMvG/0G35IbA0TKf3g==
X-Proofpoint-GUID: aqfR4EXOlgGl-7ELTIKZlAqlBxareb9d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-28_01,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 phishscore=0 impostorscore=0 spamscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611280013

On Sat, Nov 28, 2026 at 10:40=E2=80=AFAM Shawn Guo
<shengchao.guo@oss.qualcomm.com> wrote:
>
> On Fri, Nov 27, 2026 at 07:33:26PM +0800, Zhangfei Gao wrote:
> > Nord exposes System RAM in the upper DDR window starting at
> > 0x8800000000, beyond the current 36-bit bus range. DMA mappings for
> > pages in this window are therefore treated as unreachable and may fall
> > back to SWIOTLB.
> >
> > Widen ranges and dma-ranges to 40 bits so capable devices can address
> > the complete DDR map. Devices with narrower address limits must
> > constrain their DMA masks individually.
> >
> > Fixes: 5e97460df08d ("arm64: dts: qcom: Add device tree for Nord SoC se=
ries")
> > Signed-off-by: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
> > Signed-off-by: Jie Zhang <jie.zhang@oss.qualcomm.com>
>
> Hi Zhangfei,
>
> As you are the author, I would expect this:
>
> Fixes: 5e97460df08d ("arm64: dts: qcom: Add device tree for Nord SoC seri=
es")
> Co-developed-by: Jie Zhang <jie.zhang@oss.qualcomm.com>
> Signed-off-by: Jie Zhang <jie.zhang@oss.qualcomm.com>
> Signed-off-by: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
>

Sure, will update, thanks Shawn
