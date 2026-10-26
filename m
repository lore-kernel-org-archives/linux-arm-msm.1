Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793018390;
	b=PiksDAoaZTKj7R767QKMAIyTzDEtonTud6ha2+p/7xyd0VlmF3nkWt6+dV4xnyTxALpn
	 CfuBL6k6Ij5TeRXdmBsfizr62Fu463KuQQ5qDsftp+H0/besqcgy0DKmwW9o5FSpAfHrP
	 ubrSsmn6u/DcAz8abDbrd2KGTYK5/tDNYRvGwQx8+yjJ3Zf2Fz0kfaH3U1CV/oWl428Zj
	 ys2SP4h2AwFZrPvXuoJ7LjZfQ1Tncc2ezYoWOcTMme0JtyA6vZYrvw5GbM3h6/T0+OCXB
	 aVg+m8qB1SZ+5uzy3gBQAnngisvsHlFYG7rB6SZOO4OycxHK7S7vdLETNxoeMAgp6/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793018390;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ja6gmdD2JmGFs0lY8XP4mgS/BSc4NsAvuUJRmdYg7kk=;
	b=cyaHx45lRcQ+Xt44KgFYtlQTLl8dGQ2eedVyoyehxod5XGQCKN6tbNDCIq/9RlEMta1Z
	 jo1ELPcgA6rYGZQczFICg7eUyP8vMWxuOiRmAp1jk1aYBzyor0YZ//U7LKCVGbc5t3X5o
	 WjN+oCR/M8bz9F+aX9AJ8FdTvxskLnCwmPRpA9ObcmpvCVeUWlWAJSbPw4X0LLi5Sicxq
	 YQTYr89X/d6n1kZzhrqfWCNdwEHRuBz58JlXIgPHWvGK+Om13DYk7sOE6a32wBH3RlyeX
	 ALCUrL3eFzZon46hj3/utOy2oDV9H1Lyyl4ElSGohpQ/qXRIs26DHd18MqrUJVOcWbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mFVWfLNs;
	dkim=temperror header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=V7bFEDlX;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3C1A606A322
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 12:39:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3C1A606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mFVWfLNs;
	dkim=temperror header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=V7bFEDlX
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAsmJi2168527
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 12:39:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ja6gmdD2JmGFs0lY8XP4mgS/BSc4NsAvuUJRmdYg7kk=; b=mFVWfLNsjWIGvAe9
	ahqatTBNXrOW7rBEt7J/1Zj5eKycgNyFO72FzCgv0Hnnc2+qd0aVpmT7GZXIGDqk
	rXHeepTWTpjU2jnwRX+TPwavjcmSaY+tk416jVKV+WWc6Raobc3BCAJSr4ZcNGHz
	lAXJABgdXo70CGnYt1w6qljKK8LL2Jwg5mLUs0meA2Bm0PKd95IToCrGQCcVm0u2
	3emUM7urahv73bHlcaRmSA3K+GHfWZVD5+0cbjXJDqzzXPEdnmcd1W+nWcMPZ3sq
	Sr3lk0xXQ4m/wizgjsEfa6IwfsVH7xTrD3YuuybZ5dnJH9pp41dgmpXxsDxXlTL+
	Qo0vTg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj3u60sun-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 12:39:49 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7cc0ae52207so48546137.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 05:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793018388; x=1793623188; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ja6gmdD2JmGFs0lY8XP4mgS/BSc4NsAvuUJRmdYg7kk=;
        b=V7bFEDlXa0OgAa72h9HJhGruRotZbuPkT1L9ajtfGn/o2J8d4ZLpNQqPTQ2mVrKOqz
         PQRSNQUoZsOeco4GubqgBInhDfAe3XdX3AepTQjybb4ClckutX1aumRdRBLrK+xs4Meq
         DlEMMj1SkkEn8RwSWgQuFguviEOXdd7gkvv1Hc9hJNUNbV7OJ0iXg+sm/PAS6ifjkowW
         lyxl+ykViAAeexKHKcHWi6J8lwAuRn2Xm0VZR4U8He6ssQqzjAjijpGfWOTbvPTWSBxt
         fpaocdgVENg3ZBwjUz66Oi5SWXsQh8gQLF4Ko7WO8TPF0ElZyxAj4YgZPeuFIG/S3Sx5
         Or/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793018388; x=1793623188;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ja6gmdD2JmGFs0lY8XP4mgS/BSc4NsAvuUJRmdYg7kk=;
        b=Pf5wvZNj++qAHtfyvwFRMou1u8qCxE+yTVbXOiUuCD7JXfP0tPZqHWcerLKvIHzrs1
         VSkfdB3mkRH3rGztTTZ2UpPMj2uxysoYQubaoGjTGL5ctxz9OpJdjCYyzOLbd8xD3D/W
         XXoiDbY7XKv5xUiVUP329dwG7L7XBZLA/pRRc8Ca36RlrN2VES9LiIAX6ZEetcIYel0V
         c0xQLa7Qd2ssOI4V9KzG5yauZ//QETef8H19I022llM9MLt2NaCc4qHKGSwTjqC/OPAI
         Hb2s886lYLIFbqNfZV/Sspdklc+p0sWkvfcGt73Y1C2VWTHOqVCz0im4s+S8Ic7CTBx7
         9dmQ==
X-Forwarded-Encrypted: i=1; AKwUvBxWnhSmD225ha++FyMPZyuTM04Hx2YoqlVnkcHkptkxXUNuy7zdc2nVhRq8NGYb6JCLLtyMEFb5paldsBLz@vger.kernel.org
X-Gm-Message-State: AFq9FYKYc2Wk2Z8xJe0EYjJ7QfNYztFc41RhoXKzMJk0UfIKf59/ii9C
	1siWjnTAkJ9s1jNHL9OkINNa04legxw5HHv6jI4Bv55cgWuGLWdWKRIQtUU+IewV5BFfXaONDhe
	av9jq+8fR5YvdMQaVC6Lbl6p6Be9yQus39XZF8s86GT3ZEf9PJQLAtVhPJ8WcoAr+UL/1iicqwJ
	4t
X-Gm-Gg: AYBFou2mqvWAWzM4M+S3PvTrAp8moyCmOS6afJe7k9OErmeeNCF3h9MedLjqkzVzSpn
	bgkoVsvp8VbCM1pVqHOdLiKi3Z3Xz2YQMO/JFlnwbrycIWC2cy/cDE640MQVkV5JVuPv1562wXn
	sWrdqZqPrWzy0FW6K1Y5GPGz3nmgBDoP1h9dVZ4UCb5ztXXQO7wWbtgnHF3q/WYdSKUumi4yZm8
	xR7n43OkeY/cFaLwyb8e+t3kqWwCKLlrXcLrnjgpQemzRyhC84ENjp/xyyZMInD6EzBbMzB+lAt
	ALSygUBaS36f5H18OBnYQqgYUpc2rVk9BaYX8qpqZlmnjjvXE/WJBHSeJlrmP6tzuDvNxSjcEel
	D/pW22XaQZmjdmdiHYxUkKw==
X-Received: by 2002:a05:6122:6b91:10b0:5e9:2e3c:2f5 with SMTP id 71dfb90a1353d-5ec230bb944mr1757891e0c.2.1793018388191;
        Mon, 26 Oct 2026 05:39:48 -0700 (PDT)
X-Received: by 2002:a05:6122:6b91:10b0:5e9:2e3c:2f5 with SMTP id 71dfb90a1353d-5ec230bb944mr1757881e0c.2.1793018387768;
        Mon, 26 Oct 2026 05:39:47 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac70993e89sm18146581fa.9.2026.10.26.05.39.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 05:39:46 -0700 (PDT)
Message-ID: <7056d429-5bd8-47bb-8c9a-5827be7c6279@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 13:39:44 +0100
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
Subject: Re: [PATCH RFC v3 2/2] arm64: dts: qcom: Add a minimal REDMI K90
 Ultra description
To: Zhang Jiaxi <Z1529105815@outlook.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20261021-b4-warsaw-minimal-usb2-v3-0-9f4213ab83ef@outlook.com>
 <20261021-b4-warsaw-minimal-usb2-v3-2-9f4213ab83ef@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261021-b4-warsaw-minimal-usb2-v3-2-9f4213ab83ef@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: CDDWq2NSvMvKDpOhixc5kktOdCIZvBgK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA1MCBTYWx0ZWRfXzFKchCaAW3bd
 1Tsw6+eGnYRCNEJMjtQ6HlOltboj4HqbPiHEPKfzEZsTfWgI72d65ummZqa+HXFZMHH/bT4tX93
 cRJCxGT90D8oUqudOYpQ+22AtrsWi1fScshe4erAJlG0E6UQvNF3/rCtMSrlhT0LmI+P4/esIwJ
 6m6jS9Qom5kTwGpBoePl0MZfitNDaV/ItYGQcIXlPIh0T1FNOV/kcoZMKr3Y6xVWPRHPgsvzSKj
 SbORTzFy32ZwYvGFRX8ZxJ+6GdPN2Ns8V928NBhXttGCtkwo2SlZqL8i8iDoYNK7AC5CTxbOV7c
 Y8h8pkwZ6U3x8l+glfLFkeOUD8RCgrlQre5fOGL9ANNJ59cb/kFZKc33v0Go3n23KLFnmnQ1zBz
 JmsUX2tAFRcJafK9kErvidSvlABIspuVhxD7H8KGl98RI2fWE1MJjAgg0DEozxY4kobSq4aCvCF
 yQDSrtIqe3UojRgc8eQ==
X-Proofpoint-ORIG-GUID: CDDWq2NSvMvKDpOhixc5kktOdCIZvBgK
X-Authority-Analysis: v=2.4 cv=K823jCWI c=1 sm=1 tr=0 ts=6adf4a15 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=cNoKYFeJyS4W4/1HdvzxLidmn8o=:19 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8
 a=BhY9DA6nPAixTnPfFlgA:9 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA1MCBTYWx0ZWRfX4ASdYLRPKOc1
 AnItjgsjgFGI1BwJnOTg/eG32j+lp2co0gd/NHK3A6KomhBxvyiS9Xm+nM6CUjrFiKttfFKWnlW
 p5gQO5vg6CvuaTxgX5hWGQXDl9OXTMI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260050

On 10/21/26 2:46 PM, Zhang Jiaxi wrote:
> From: Jiaxi Zhang <z1529105815@outlook.com>
> 
> Add the REDMI K90 Ultra (Xiaomi internal codename Warsaw) board identity,
> reference clocks, PM8550/PMK8550 devices, keys, debug UART and USB2
> peripheral connection. Build from the SoC and common PMIC includes.
> 
> Reuse pmih0108.dtsi on SM8750 SPMI bus 0 instead of duplicating PMIH0108.
> Keep the board-specific repeater supplies and tuning values. Preserve the
> OEM firmware GPIO reservations without assigning an unverified function
> to GPIOs 48-51.
> 
> The OEM configuration retains OTG and UCSI role switching. This RFC
> provisionally restricts USB to the validated high-speed gadget path; the
> connector, role-control and VBUS path still require board integration and
> review. This does not establish a peripheral-only port or rule out DP.
> Usable RAM and firmware reservations remain a bootloader contract.
> 
> Signed-off-by: Jiaxi Zhang <z1529105815@outlook.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
