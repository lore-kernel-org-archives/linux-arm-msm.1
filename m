Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795445683;
	b=xGApOtZWVMKIOBxWSpOJCvgeAf+Pe/+xYTf9GTDO1kgFpRDKGDkf/LMicsOkysps7Qdg
	 lZegeAaIOgACd4Rp/ehdOnk7CZsuMurj+6bnEkftjrIcPqpyI2K+41OQ5duhw5ebiT+0D
	 EduQTHBD0Q2x2v4WnNRxabaAa4m+vfgk/8vt+Va3JlYrle2Snrn6rklqBwMVG6O+zGLRn
	 mngO+UPIETc3c8JdZBBU4wSjl6MsEM9wCh/2YHmauspJgRsSqhV61Kqpr61jgN8hO2uYZ
	 kYpMMFH0m/Rc0DUIWNg4G6PnSBiVo3hsdoMdv/QdY2IQBBvNBmb+51SvmbIBs4WPbtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795445683;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=cjdhAiDDNjn2+9CEOyy6QSd/w/KllDQxmuyoGixQI3M=;
	b=Y5aJY00MPlonYohZBKCucv9KcCoPJnzhxGr4RFiEwiT4Mm1/wnCf2J8TXccccc89dxk2
	 hP3hMXlvhyjw5oTFD+XitkMQhYqq65aXo01CUt7+qKXqwVgkBn1RdeWaJ7uPhBc7ojLpi
	 SBTMCpCSbxBzvN6NwIyLxrsCLsMQKhqLNsuO1xJdOBMpYoA5V8ctuZ4ysgVKP/lEmTcFa
	 QrYQVbKa2wI43SUtswTkWj5mDXozxihqWGhwvIv5eiKsn9Z/x1ndcTD8KOgv8cVdMi/xq
	 2um+5uG3sJT6Cse9FTRfPnDGBOsKbFlRnqbd9fuHUNj1nPTN4OjD7+sAeHl1YHbqMXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MFZ2YcHi;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Rg1j/yKT";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F141606A68D
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 14:54:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F141606A68D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MFZ2YcHi;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Rg1j/yKT
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANDKsVC2369173
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 14:54:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cjdhAiDDNjn2+9CEOyy6QSd/w/KllDQxmuyoGixQI3M=; b=MFZ2YcHiETwRhg9/
	DIdZ4DGjkEzUgOGtUu450VTuKRKTfK9gvPPVXbcnks5Ibu9HV8WSHmOi887T1ZhZ
	7uKeSUY5zbxBymI2R2FHR2fpV7Cfd5GQHpgtoVm+o75PYmfAJjZZ7ouWmko77mu9
	UIgMVjfJS85VPNmEBhVjryo2tBfG8LrzNmyZV83s1E8kgDpIEIFMQwL9U08q8d7h
	fWgES4y1lnUEEbjNyXfLh4Yp+4vv0E0Zez0eJaxcyeYWchblMHYoHobsT3YydFWr
	1VTOap3EKB60jYHBv06AZBBpGQZfU6EUO2JtluqXoGnatsKWOb6Dj07T3AdLPgc2
	kn4ahg==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g1p9vcr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 14:54:41 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5ecdc7807f4so112062e0c.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 06:54:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795445681; x=1796050481; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cjdhAiDDNjn2+9CEOyy6QSd/w/KllDQxmuyoGixQI3M=;
        b=Rg1j/yKTZXfqBU4QGKaYLm5S5bm00zn8hXdvt9m9wGSelkpTeu+/uSjt8IBo86OjOb
         YRvtENPDbueaHVFbXueeKo2Q3SEvQTT1VnQFy3WZ6/FwDztJsStR3SY42CDMaa3nohJN
         tYYgA/AHuDX69sJPmtsGBaW/KVObBgSIUSppC3KbfDKtAw5uIlvwv7tD1jWhB662McBA
         5Hk3gQQRR2Ui3giXYbgndQM5qbBJBKTPIgvWRUvEcFD9Wo/aRX4JsFEKhqeUNt7gz+Sn
         0T4wxbSBU3lP+Mecon+F8EeQ3OsWFwsP3b2JT++MVgDiS1fezxQPp3598alRDNzeDJeY
         w47A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795445681; x=1796050481;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cjdhAiDDNjn2+9CEOyy6QSd/w/KllDQxmuyoGixQI3M=;
        b=tO/VO0UWD/SalDTP1tE1CaF32o9kskfxmz1uJBskFDlwdDMjm818Yjmiut2F4PCwyA
         vs+vgFM8ynndKI1YF43BZ15DU/TtjR5sDf5t5wJ6mv57Ucxk4ETaMRdCZpDr1J6xPwHi
         5nGkWLn4buqxC61IwHG2Jk7FLTeikky6ET8QzSOnFUsFEfjNut6cb2xw1AbIhUJfj0XO
         QZzQQ63LR4xK7RGxkshhsgDSiYUP0T5bpEPde+mjryZCqtGot9ZolEgFr7eKUNHt+8iS
         UyloBOJfAI3LcWpAoBTq13IeiaN4Ob/Hj7zrX2meAHIvxaumvOENdm+UxOXMbAVXT8kt
         WByA==
X-Forwarded-Encrypted: i=1; AL+hErHZPa8veHzANjNikHKvMLbTE8oSpiD1WFr/Dv2gM3iFn0+N/wHJMgnPiGdhmXQkW8Y0H7bPy88ZD6fDb4UD@vger.kernel.org
X-Gm-Message-State: APuU4Z+hHnkdll/q7KReF6K2DAJwKP9pX+lMwX0sR8mfWaeUbvNK4+Z5
	zcFEA4rwWvyUBvC+z0BYXDk/L7G/XA79Ijuk34cs5VCZTBBPhkW745FpKbGqCW3Y8aTtoku8c5C
	AI03Lb4KAAuk93nkIpSL0i0PPaGIjiHt8YEhUabp7dJP9H9woNY0Udyhu+NIjI6sjJi5I
X-Gm-Gg: AZFdTZfVAO/Dl1z/kJRZso4DeR1txRhiLAx6+39W4s2jwerjOc5JEzpjydkIe/5dSJY
	6Dkubi+E5R+i56Qn++riMTQPIgSpk1hSo4C08dQKJjO+L0dQEkLViT9/T8esis4R+GemaPtPvRl
	UrilM0NqRviVH94oF4UdQlFjIq0VOV3zad27NzIvoucd9oiJFUuvH6r6MSa2fCb1icFFoM0qpT7
	hY/GuM6zu+LEW0ex3Us8lCcLgTe1eUxVe3fUHG5J0vctcd6BswFcByY1ZbeQEoagoKK2/ashyVs
	qy/ekwQ8XRuVseYN85UT78045SBJ5R9E/0Sa6waUMfBZn2QK/YP4R1ZiJvA23TCb8IDnxdrFKFm
	ZMEBFYw8pnqMCqY3Tj+LXNRqIiRDZ0ioAg2801c0rpYovle1O7XsgaAYyl10tuhfCLdwMiH4=
X-Received: by 2002:ac5:cd3b:0:b0:5ec:e2a2:b70e with SMTP id 71dfb90a1353d-5ee8af4a71fmr5979642e0c.4.1795445680852;
        Mon, 23 Nov 2026 06:54:40 -0800 (PST)
X-Received: by 2002:ac5:cd3b:0:b0:5ec:e2a2:b70e with SMTP id 71dfb90a1353d-5ee8af4a71fmr5979593e0c.4.1795445680363;
        Mon, 23 Nov 2026 06:54:40 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513aea6e29sm413697266b.43.2026.11.23.06.54.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 06:54:39 -0800 (PST)
Message-ID: <52bacac3-557e-4b2f-83eb-3c82fdc2ae9f@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 15:54:37 +0100
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
Subject: Re: [PATCH] drm/msm: Use div64_u64() for the retired-submit GPU clock
To: emcp@enser.io, Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20261122-b4-drm-msm-retire-div64-v1-1-94d6981799d0@enser.io>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261122-b4-drm-msm-retire-div64-v1-1-94d6981799d0@enser.io>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA1OSBTYWx0ZWRfX1aExqEclaSVW
 N0K4pmT7r/DNbf6WVI49NPbiu0BBaH5SPOBy2IVkxMLK0ZZUzJtvhcg6kMqKllpsKO/8S0s186r
 GTQbPLOZEn2Yvxm3tPDHILwD2vUDhjdV3WZTbCyzBkGUfvBqsgADLLpXFfoNcPfQZOyV0ty9GsI
 Ab6Xm+0paLj48xMt39mrf5lU2/hdtvt6ocTnHB4ac3TTJr14eBaxEEbDwYRw6k5yZ1QyjAc74pq
 pxcXQ7O8XicaHJay8tKIMTQD7mexVduvGcSg9Bb2mNAuxkkIiDcwzH8j05tl7tldqhO5z9l/hoc
 +uxFe0MJBFWGC3ntY+EsOZCNPeecb2gu8n61YqRhloFxwpGLq405BxWxgpQTjYwVYBl+cliq0QC
 HjyzEPiUwuk0cbGGt2BgHx3AU8MR+5kYOK/3/StEko6nYStdZ4mTFqm7BYC3/9N3sxoVI03xsid
 tbpa9in/qPiDg9DjVqQ==
X-Authority-Analysis: v=2.4 cv=AeIkjHXG c=1 sm=1 tr=0 ts=6b0453b1 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=l1nHKxr-XrZQ-B15pWYA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-GUID: 4l1_9WRnaPPmZIGhuEfrmmW0MWLzEAaZ
X-Proofpoint-ORIG-GUID: 4l1_9WRnaPPmZIGhuEfrmmW0MWLzEAaZ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA1OSBTYWx0ZWRfX7LW40GfuQXLC
 /M0QP4hehYv01MVREliUD1f3Z0F0anDZCNR4qQNFqpQlmw8vhCo5slTv2D1nDUknGzp0dZUtLGK
 I6dBXCkqT2/lojQ+XdMgRu+LxeR3VbA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 clxscore=1015
 suspectscore=0 phishscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230059

On 11/22/26 6:12 AM, EMCP333 via B4 Relay wrote:
> From: EMCP333 <emcp@enser.io>

Hey, thanks for the patch. Please note we can't take anonymous
contributions:

https://docs.kernel.org/process/submitting-patches.html#sign-your-work-the-developer-s-certificate-of-origin

Konrad
