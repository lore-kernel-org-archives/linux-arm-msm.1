Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792572332;
	b=K8Q9UncLarGQiweEXQTkBqVdrMJd2HSOJEgxXY8aa0RfEORP2Wd4C7WvxQkQHLhuV1bR
	 sB87QvwzgPlgr+HNFw34XzNKBzv2TF50OBEDE0jDc1p1n2Ui75NpJVxXiMOB8zSOYTtqq
	 FU/EtpCEylyGY6zSdqFMcf7RgGrJu+4PzEeB1kK09TDImYxQO0TcQ96+hu+WCqd+Yf7Lj
	 Adsn03gzRI5uIugZIgjPumnnaJwaQiGkiXeKC+iY80XIlWALHTfoN8GETdc02VPKNUugt
	 yUaunmyRElzHBdlRpb7mxezFamkqRBZblsMX7OiFHn9Dtp5UrdsZ4jh08Eu9XLHToLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792572332;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/L2H1lepN+Or++0TSx4iDmyDAjYluQVvW80vZis8J4c=;
	b=s7jz03vZVn8Hupyo9PzazUJLiiOFm1eB/E0udA9lZ5r7YmkT83Fo1BPU3Jp1Jyvhj5WO
	 D41pV0Y9pf4rwTcqoXad8Ie9DAAkP58r7DF+cMCM0vXn3JEqUep1wZmIhRz+n6rNyK7Rs
	 hekuHuPWaHASy694CykbZ+c7DU/5ZZaYw8hymMLbRPQzHHclC3v1ZS9Ht4gBapKj9GJLN
	 Vtcl2PuZDuYBTIPFJIoUnSMHQDKAZDLZpJwo71lnjsJBQEDb+Tvl11fseL3O1vyfMOGCf
	 caynkz+dDZXW/iXTxs/ppBUNFouPigHGGyF11ZSyC/gm8GSdbSW6YXQsRsmO/tlDRdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EthEb8nU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XZoAEtA5;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C595606A31F
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 08:45:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C595606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EthEb8nU;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XZoAEtA5
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5iuXO3018442
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 08:45:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/L2H1lepN+Or++0TSx4iDmyDAjYluQVvW80vZis8J4c=; b=EthEb8nUYtdG+GyY
	p5JwIaqB1vcxR0MDVovpnpyMxONuJ4ZHG08WVxoSSDhpRj+KpaTSVbN2mWNa/4nL
	7ct40Sn0ZYs8Zuk7CWtHcCpE16wbYenupEcuoKP7WJNSDLu/HUj6SZ2rd3f2LiPD
	xvfSaH3Av3eY4H7SgOJDWPNssbsQcp4jRK+HqVxAC3m1Fw458b30KFiGC1gr0mqa
	J0EH145lExaJBfa6XLOuGThKyfqJZTG4yfQ/QNLa343VOMfX3emx3z4nE78Z8S9H
	88O8+ejXsypEC3tg1Q2hcWwpVSRxDxQohEefz6JCnOf0iGlrRdLbd4+wR1mDQsqI
	nFC8tA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hebyd3d8h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 08:45:30 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cac495d99so9335085a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 01:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792572330; x=1793177130; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/L2H1lepN+Or++0TSx4iDmyDAjYluQVvW80vZis8J4c=;
        b=XZoAEtA5+SSc7uWEPnJSZ9bn54TDFTYfTZ18AKDtIPBb3+FD7+483UBiSzQF9LW1zU
         mC4O8cKQH598793zsWIxX8RYa4USGbvTK9eIudqpSpLFlyetSK1ONlJhFCuJMPzJizIU
         d8J3KRrQ6MuJA5B0sIDl7M4TkBByVj3HXzOsQRvWtR5BBMSFwKhnVbKMtQzGNVfCOytx
         XUVDoCnMBB/Uyin33LhFVJh+LAsU75qKGS5haNReJEIgBFEC3VbOwPy6RBCGnkhNrldZ
         cxhETrtJKSW1qYoNXqTvpU0TkAuDZibTriQC+SAwxCt1q1SJePGGxWlQVoiSqnt7NnRq
         gFSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792572330; x=1793177130;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/L2H1lepN+Or++0TSx4iDmyDAjYluQVvW80vZis8J4c=;
        b=0mUpNTEm6j81eM1YGel1CnU/9Ec6XAhH+ALEk2Vcg4oq64L9NcyV+261MFMtIiRLVI
         8x7/LSsrY1SZBGBwW4MJhOTgC04eodQ3mvWFDDDMKhomwrK5gJrLKImOP4SluCmNxMo1
         ikC/Ww1LqM4Chv5EJ1iofEwH5V2yVnvgibvcP40dTlwQIJ80PafGIWAIdhmjbAA6RDIR
         RS5/VzZ4i7mjpKiQcbAJtVB+y1zkvcHN/5PlAxQKr7Q59MINuFTvg1LJAAkf7dV3drKt
         1NnE7rlJs6nv8xlKAoHHrtde8R4ZxVe8EmhtjyX+QhLP9CF4jc5c8xAJPdbuWiccZu6u
         Jr6A==
X-Forwarded-Encrypted: i=1; AKwUvBxpSuN7YFjaeObD6/exUhiTdoKo1MUln0Sm5hebBkYIdIv+yUlU0EJzhNz1TiIdzmu/xU+RMSfspJioAh0J@vger.kernel.org
X-Gm-Message-State: AFq9FYJUDz6647zAZHGzhlNn2n8RhGmSs53yetdvr9VlsAlBaBsV0nDK
	C3PlRR6bwHWqcftgOW1i8NQP/6pFF2BVV49rM+f7CzrXU8qKzXgSDM1PHpfG2wsxQ2AYdJ32z5b
	jQEoQ4ZJ8z2nph5fPhbTumjiw+J6lXhKGMjANouY0q61TTLC0FC9Hwonc0rQdHNFP6+l+
X-Gm-Gg: AYBFou3loORQpf5IulKM1JyzVTdIGg4vGuaNr67sdtrZSo/91oesIpw7MnjaHwhxXdf
	8W2ZUQ1qAzNX6mNSdux46tfQnEXFCNC9omL/bv8l722EIbyAGUSGK5aR6SGi56QxTj6v98yf1U4
	ToakDzUhzXLIDML0g4zTnMEd9ayPOEH8b/1m1kkzjMVuL+kF856UVdBEuY6QNEVZRxntqWSKyib
	R633z+AKDnSW7Ocmxz+iT3i+QykdlqBR8v67xheVs7O+JcPRmvDCoiNy+afZ3iGDGsVCF/kCu1z
	wA+bWbDCobhBM8tD9dyteEfW6QlR+2q8JW3Co0R3PPAveF3gOeim2EWx7Ula313kis8fJDziiDB
	qBOUUpwopdzjFX94As4SN4A==
X-Received: by 2002:a05:620a:45aa:b0:939:9205:4d78 with SMTP id af79cd13be357-93f57f96010mr337845085a.3.1792572329906;
        Wed, 21 Oct 2026 01:45:29 -0700 (PDT)
X-Received: by 2002:a05:620a:45aa:b0:939:9205:4d78 with SMTP id af79cd13be357-93f57f96010mr337842885a.3.1792572329524;
        Wed, 21 Oct 2026 01:45:29 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b40315a59esm601649a12.32.2026.10.21.01.45.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 01:45:28 -0700 (PDT)
Message-ID: <fb6a7e59-5265-4eb5-9d41-504ded38454e@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 10:45:26 +0200
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
Subject: Re: [PATCH 1/1] arm64: dts: qcom: sdm845-sony-tama: Enable UFS host
 controller and PHY
To: Shujath Mohd <shujath@outlook.in>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org,
        angelogioacchino.delregno@somainline.org, martin.botka@somainline.org,
        linux-kernel@vger.kernel.org
References: <PUZPR01MB514158F5EDA660AC85FA8D5BC3BB2@PUZPR01MB5141.apcprd01.prod.exchangelabs.com>
 <TYSPR01MB6204401DDDDB12AC906BB9F7C3982@TYSPR01MB6204.apcprd01.prod.exchangelabs.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <TYSPR01MB6204401DDDDB12AC906BB9F7C3982@TYSPR01MB6204.apcprd01.prod.exchangelabs.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzNCBTYWx0ZWRfX3jlgmtCrh/8T
 d08FTqcnTZZAoNDS5m17aaKhZ5YbIGLeOaCgxYcFlfCwGNCGk+vDqEw2eZAf3ThFwku6AD2i/CP
 iugs5X+q9KyiHRH+OYlH3AtDcasIjgl0j+TBY0XxxX2QxPiWSUdZozMZO4f9btILLLUvkcAQJ/r
 lUq0RpPbkXYVRW6DSlRpHAjXMU8yfnuCx7z0wNEziSkApNcjDxgP5tiR2bIz6aHfOWepAGJ/nvu
 b5OlkjL6bEoE6YAGIH9cc3Tp2BCMYMXnt5lbwxYU08XiM9FeI1Df0xbDavmaX9TloKUXMYJrgbz
 9XioHYhCA6sPnSfRuRAjSkPJf7RNefn3/9c/ZKRKniAgcXPZHEUwXrwTKWWZiHrglzlfizZAp7p
 OJAJ+e/YJ3tScpLL0xq5dJzPNKYUP5Csex3ezykzLPm7Os810ondqM5GjNh8YhSWSurh6u8753a
 zfbu18Udc91vqzALXVw==
X-Authority-Analysis: v=2.4 cv=TdsDJhQh c=1 sm=1 tr=0 ts=6ad87baa cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=CYTpYu_piMVnSvLoUqcA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=zY0JdQc1-4EAyPf5TuXT:22
X-Proofpoint-ORIG-GUID: vM4Z4yGxKGTBU-ExU5DjDqDwuJWS6tbQ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzNCBTYWx0ZWRfX3k/1QK1F7TKG
 6iDF2/9dTH5rbbr+27R+h/f+NDo8vXf5U/AzThbYzumAdi/WcikPEGAt0+e6M0m9WYl1lZmODFu
 9fms2yKvwmSwEf7Pkf2g5IGpkQ8CtAI=
X-Proofpoint-GUID: vM4Z4yGxKGTBU-ExU5DjDqDwuJWS6tbQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 phishscore=0 impostorscore=0 spamscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210034

On 10/19/26 9:50 AM, Shujath Mohd wrote:
> Hi,
> 
> I wanted to follow up on this patch and check if there are any
> comments or concerns.
> 
> The UFS host controller and PHY have been tested on the Xperia XZ2
> (Akari), XZ2 Compact (Apollo), and XZ3 (Akatsuki) across multiple
> reboots without observing any UFS data loss or corruption.
> 
> Please let me know if any changes are needed.
> 
> Thank you for your time and review.

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
