Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792586371;
	b=hnCDztYD3kbe2jnHzmUpk9FDd94xSorzvdO5Zde0uhZWOVRQl1Bs7Ite4pMMmv/orfzt
	 5AgJNWT8438lucWgjtLEpJebFcC/wU11Ew3qJpIIJW0k1aC3RVNEsBYdJ2Hbvd3qebErm
	 uO9L86XsSak3lsdlIiNXpd20GJ3mGhqUTt2AZfAuGqDvXA9ATqejme6kbN5JZy7hB+5U2
	 Rx0RGU6Q3nWQGm/jHezeXGmPForvJyBX4wI4EcZQDIlOEdsWaQKG8OsQjnQPp2rBZm+8N
	 McPsVv+EJtE/34QNlq2MDWW19jMBkNYWK6rgjHhMd8nuBlhuvyRcTi/CuwOuC6oG3Mw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792586371;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Jw7R7ghwkOo3CoHd+hUh0fqE+mVM9B5zdvKjQAnWlsU=;
	b=Zk1IVZ0deTovK1w8JzumSzh+cAEZcL+iQKsI1mC3dDMfaN7jXHjA0fMcGuQE4bmhcWnl
	 GrNb/RkAOIYlUcUc7+2vSau9EoMPqN1uC2XTKPpwLrr7Sb4u4rO8iARolNYYIsco30wCC
	 f1IbkFAvkzc94xKUQ+kT3QY/Vuyt/5xkLloPa230GfmKKyfFw8lccC74uhd7kgcTbicmu
	 EX+L3GibS/bBdBH2FJEd8dASn3+//UyTDKvslhFssfzJ1Rj9RH82lQ8jfMuwRQHr1JQSF
	 t8lUBVSl404gypXtvFKn98yTR1ecfV/zVifojfZ14FjLz5WlkxR+K0fJkcrzh/ByJHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=b1Efu17s;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B8rG+yzj;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2853606A320
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 12:39:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2853606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=b1Efu17s;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B8rG+yzj
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LBfuaP543790
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 12:39:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Jw7R7ghwkOo3CoHd+hUh0fqE+mVM9B5zdvKjQAnWlsU=; b=b1Efu17syShExMOi
	8TIFaFf7PdUS9CWgB4NLvXu3SpAI8f+dkSyIoMkwcoxpCggzp+LX+LETiO/pBhBQ
	rkI+iofpaWYAcb+lu4ZmGt7ZDqGNpB4nXBfSdPcz4xndXzHYnQTkEHutrbJ9k1Hm
	naABtbKCQoSetTz5a476Ua3fIAJHRL+0ssEkIDQpqacxyFDd+clXcd+ljUvCwGUb
	vpjWUUzJfJssVidql1s46tAqxY7po41T+VDvacx14jOwzOaUvZWrsRCXxciOpStD
	mSw4QO2lZSPu8Q9Wu5c3YPPidWlNjh+M0tjagFuWUlmd12rIQn+9nbLZP+6UHf5I
	F29M+w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hetj48q1d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 12:39:29 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cc50fb0d2so12468385a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 05:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792586369; x=1793191169; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jw7R7ghwkOo3CoHd+hUh0fqE+mVM9B5zdvKjQAnWlsU=;
        b=B8rG+yzj7p0JulA4yTubKsU5nDTcZX8czgc6g2Y1jmAYxAle59S24WsBxNor5/GDik
         Ks3ZTQ6sU+r96jnV5rTh5qyAgxeZynIUWgsJeOdX0psUrmayOi2Dno79Urnjyv4xio+A
         Ru426AJiqi0emEC/4j/622rWZn5+FjDYmE0DJ4uMA4mAVmVP3GOuf16VZz4dza9vuCy8
         wa+9W2ZuWwnAkYkogg14AGOvJCi2RBNpesDj8cJwYmdeuEGVUOWySl7P2n2nPIcEzI1V
         neNcE3ltNaIdk5IfFPHvtHuYUUrgf7RV5W6OpSuwH/7fX/SYLPyJddUNbqbiq+ophkWu
         rZig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792586369; x=1793191169;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jw7R7ghwkOo3CoHd+hUh0fqE+mVM9B5zdvKjQAnWlsU=;
        b=yx7NyhXW22LOWgvXOQ8AYAcWzsZLOtWpqJmGEKTdpLRN/VHU5NplBSQ1K78g9JKaGM
         VKUSzgNWNZ8hHBhMBl4uh7R2O02KXVTrCozvX7TMxOF3z3Em8NVILKVo3W3LiGXlXLF/
         TiNvN8VroMMtfPtz2L0Gv64PLwEmnkA43uSGzDvh1LgSjJdW3fiG8gEoHqUDfRUukT99
         gnvi4v1cxLoK4EcmZkpmfNZYDxh08Y2AZbm7L8R88LJxlh41UntvLJh45HUrypBB7j88
         sWs2+/JHnSSlZuvhDSExzEZMgd0wip20FJRFjGZpHKC4td4upok+Vo5ZsvDfJ1/bTXWH
         Agaw==
X-Gm-Message-State: AFq9FYJICLIhS9eguvj/cmNgtkssER1L+g99MsGg1DKiJjpR0FoEO1fo
	k5uzGRokUXcGH+OFQWWaWwIWZR1uPJFzuP7DCurGjiCzVD/DucHTgtLki0YGMrNCzu8hNMkyRXw
	Ff1zKLr0Pf3ZPwLLUiCAYUsWAs1PHGmVZ52C8g/zDqLLAwHKcfUN/bWCOwEwFWig3EdFx
X-Gm-Gg: AYBFou0ASS9Os8+S6jcPY0HTVV3cJL4iBB2PZ4hL1yKTkfe/A4SufJnWciNJDSmUHi0
	oogJ+EyTwOy2NzrAXHoEZThvlnoXBn+HtbeIn+xVP53nESH9xI7AqPS6wYvKqVmfHBGiOau3Sx+
	A05oVP5Sdsvi+In0zDJgXOve3fR7xrOqM4Bn4sjthmQcG9yc2ykKhF0gQaJYE08DLn+8P/duix6
	ZD/fyQSxTRl65eW6s1fa/4/PUb9aTXGNq5mKLym4pL8KaLAxQhR/of2fgxGhnumFgpMrUL6EpJ/
	nfgsCGr6mP0Rrg1/r7rncjUO2sPHcKccNZ1IKRmq7uwKXDUsm2emw3+76F/GIYH0tOLqvuHeUdb
	yUz6kbEyT9coNs7cjCUKPsw==
X-Received: by 2002:a05:620a:1d09:b0:93a:14c:329c with SMTP id af79cd13be357-93f57e3e05amr481808585a.1.1792586368842;
        Wed, 21 Oct 2026 05:39:28 -0700 (PDT)
X-Received: by 2002:a05:620a:1d09:b0:93a:14c:329c with SMTP id af79cd13be357-93f57e3e05amr481803785a.1.1792586368328;
        Wed, 21 Oct 2026 05:39:28 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4030daedbsm830949a12.13.2026.10.21.05.39.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 05:39:26 -0700 (PDT)
Message-ID: <a966fe74-4ad7-4212-a164-f9f6fe225dd2@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 14:39:24 +0200
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
Subject: Re: [PATCH v3 2/4] soc: qcom: smem: validate private entry list walks
To: Albert Esteve <aesteve@redhat.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sarannya S <quic_sarannya@oss.qualcomm.com>,
        Pranav Mahesh Phansalkar <quic_pphansal@oss.qualcomm.com>,
        Sudeepgoud Patil <quic_sudeepgo@oss.qualcomm.com>
References: <20260924-port-smem-v3-0-fbc2ea81a654@redhat.com>
 <20260924-port-smem-v3-2-fbc2ea81a654@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260924-port-smem-v3-2-fbc2ea81a654@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: doTVoM3i7zDsct_cj6QyXdjtpdgG79CQ
X-Proofpoint-GUID: doTVoM3i7zDsct_cj6QyXdjtpdgG79CQ
X-Authority-Analysis: v=2.4 cv=N768hG9B c=1 sm=1 tr=0 ts=6ad8b281 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=20KFwNOVAAAA:8 a=MnczmIT-9I3NQN6y1tMA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA1MCBTYWx0ZWRfX2p4hhlqRBHty
 2WLZbEuyfN+Cu5G7w6TzywxCESV4N7iS8LKacfFCEr3/O84f36u9RavT2ujaWg7lgOtbLT3t+66
 NNoVrEtvkRqMk/KBD3hbpCx3Vp0Zu35GZ8ALVSvzpVIsp4Zbk1wFcvn7aDztYvN2/WR9JKmCNkr
 OkEZSX7px+AkZMuj4LYRHcmcAt/3j0yaypjhU5ciJ8oFOQ03wajhyBbvVLq3swXxZpcPG4X65y6
 Z0kJBgUBVX2vwF2NWMVIRJV9K6Yps2yWs5RP4XL3EWeRKSNwzKoStDYVToMpfsvfKsrVVVRV30i
 95J//PSDXB8xiBwfYM61D03OQooDFGOc9GjAYJzgnBJJfwcP0hT2YqDpVJy/iqFI97AZdjxq2t4
 aAh5m/8a5BVmbWCGJ7s7r5awwr4NeCiE06cJfucLwv6jdnV1eeSS17YRQTdlJ47xzBs/sTkmPZZ
 7wuPXGlJtE93lrntgZQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA1MCBTYWx0ZWRfX0Yunl6JbkAqE
 8U6KurPBcFbuNBlffTiUt47b0b9cxoJQZaE232Uy8LT2GYX/4CE79cvpbhMIGw0cqPAvslUbcZ6
 jTgRPhRnXu9ppM+5mt1TXqXrQj0bPlE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 suspectscore=0 phishscore=0
 bulkscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210050

On 9/24/26 3:10 PM, Albert Esteve wrote:
> From: Sarannya S <quic_sarannya@oss.qualcomm.com>
> 
> When walking private entries, use the uncached/cached free offsets as
> the list bounds, require room for a header before dereferencing, and
> reject a next pointer that does not advance.
> 
> Skip the cached list when the cached free offset is at the partition
> end.
> 
> Signed-off-by: Sarannya S <quic_sarannya@oss.qualcomm.com>
> Signed-off-by: Pranav Mahesh Phansalkar <quic_pphansal@oss.qualcomm.com>
> Signed-off-by: Sudeepgoud Patil <quic_sudeepgo@oss.qualcomm.com>
> Signed-off-by: Albert Esteve <aesteve@redhat.com>
> ---

[...]

> -	while (hdr < end) {
> +	while ((hdr + 1) < end) {

This will reject a header that's at the tail of the buffer, need
to make this <= instead

[...]

> -	while (e < end) {
> +	while ((e + 1) < uncached_end) {

Likewise

[...]

> -		e = cached_entry_next(e, part->cacheline);
> +		next_e = cached_entry_next(e, part->cacheline);
> +		if (WARN_ON(next_e >= e))
> +			return ERR_PTR(-EINVAL);
> +
> +		e = next_e;
>  	}
>  
>  	if (WARN_ON((void *)e < (void *)phdr))

And LLM thinks should compare against cached_end

Konrad
