Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792503664;
	b=IJk/TX3ewu2pa6NPg/efLzPYDSC2HDMTLH8q5CPxGjeCeT6pj/zEoflck0rmEqSRV1Jo
	 dmIcEhOuky6zTS03n0pyZ1UPB1CcYl1Sh7dq7SZb9WDeR9Ny0JVVsHNB5iVJMLvnrcWW/
	 dyj2qlR3ZUtefgKPjiTXcZCMJAWS61Yv39xLixMQZCpf1Pike6XkcP5MQQsV5Cj7wFUXD
	 ELiZuRZx1JF06FoDraWUZ3zI4302Qa81zwdMhBzQEv76MfVBNloxKwPPPSVG68YqcFZ6K
	 07lgNaPhfkcBQZ27QesA6ETZe0VCkDSEY5LW0kxUs/x4oFeMZSAtRMvl5EbC1oaKMGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792503664;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Sa9lpvauXQl90De8cdbvV2MdiZsRbRAViae/U5I9+yg=;
	b=gmfKp+Fr8mdP3vjFBVDHxMMH/Vn/nogd+yGQZhd1gUo+tfWMHCRHoHiWeCAOxqLop9Bu
	 f39A7VhlnRp2ptv2WHGIHlWvc5ZVW8poR7QmKSz6O0f+wki2RTkJoZ5QfAX2SJr8RoJ3k
	 BHF4LF+dnS4WDlz2QOBSY5jyKsop2ILDW1dWAo0GfgHsd9fDsfs9HQxN1LMoB6ULwi+ES
	 naCloTYDdWJph/sauuLGe25rROQ3cRjkhpT2e+fm3ciUyyGJms+QIAJBQlq6JbnwaYuaL
	 T1R/rc2mGrbboGHkekVHBGgsQCIthW3FUI9Oqc7Nvs4feRn196cSMRbvCHsQRw01tEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eHAxwnQs;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=K1srM1iW;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C9BA606A330
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 13:41:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C9BA606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eHAxwnQs;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=K1srM1iW
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KDA2va271966
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 13:41:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Sa9lpvauXQl90De8cdbvV2MdiZsRbRAViae/U5I9+yg=; b=eHAxwnQsXXCfP4yr
	Q096nr2TbnJ/fgyB8Pb1zZfzWKCgzShCqiS8WNHps6n+3+0d/p9dkcIDao0yZzsh
	jpja2Mmw5oFAD2PmFtlolgE4o1ovxx4BcXKBsaTnrIGVc903aNetY8/NXg7B85CF
	OlF5Tz01ZgUzURPvLLyGEozF7XRjN+WQFF17ZLDshpjyYB+/sT8zBDxzyO3ryE6K
	4AZsrE5ixjTtGFRBxyl9+nusA+g6dV1Gt9eo1DFYaL+F/2BfmGnH5s+FMGTkiIjq
	tta9h3TuPBrWnddHG9wwJKRZeP9xe+abSOdEzmDRmUX5d+Oht/ZLQso+KjkIEaMi
	xFJOfw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4he7hv8ddq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 13:41:03 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5337f843b50so2479311cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 06:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792503662; x=1793108462; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Sa9lpvauXQl90De8cdbvV2MdiZsRbRAViae/U5I9+yg=;
        b=K1srM1iWL1Qx4l5FE+fo5sEdlue6oOxxe9nzFFjxJkrI7lg/2FnXemrHLyRpyQ4ERW
         WLe5q1Q2m/W0EvtrS8tQuP6Ji1E1zglWrDxrFdjK8zqe5UEK7TBkZPN0uH1JjxWPykcw
         QOnxfaKGRLyjJA6ZpHVkw1+tc9Ahf3qFMcHSWSnH0l6AP8Pg+sKKCHi+bZFz0k89MDgw
         BeWjTAmZC3yqCjn3qsw/T0kk+AJ5H/yTupBjGDK8FiIRryDYdBAoYY6tvaUDJtqy7i8k
         2CZHDK2gcCWoyz4tZBtxF141oDgsYbzqLCqyHrXvgDxKvaM+vND5nK5b1HRWbHOkEJaF
         7+eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792503662; x=1793108462;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sa9lpvauXQl90De8cdbvV2MdiZsRbRAViae/U5I9+yg=;
        b=B9bRD3skVFLOhFl5ZwwxtNHUrUIj5/BSEuH7P3Eivf8tGJgwUzKuKAHFjWwNmQvlzK
         QwLcJEQnLK+MrPFkxUd2h3cf1/KOYu34rHpNrDXcgJxjJajK2OqhP2jDHbGrC9/Q6uZy
         zI6ubQsWYoXrbnyaea5679Pat3+GnKBiDFnmBFneX7Zww05KqwcfZFSmAxugqN6Is4/A
         1++ROSoLKA0JyboglkyM4iugZawYS3W1ySZVtPPoHpMHp4Z9izmKFkx/ZBWTRqzp7le3
         1qIOor61j7Kjxz+T6Y5C4bn4I0YeJVaRn+gYfCzBHe87kDBYWq1v7xDZDEdTML7EhyUK
         TmLA==
X-Forwarded-Encrypted: i=1; AKwUvBwNVI8MlXORWNkg0fEo8bxMq2GBzHnhmtuhUuRBOePj39lhChDJTxpm0//OpPb3G3NTZnWivURaHfCOIF/A@vger.kernel.org
X-Gm-Message-State: AFq9FYIH2uYuyCUuP9spM3NeqtGmuRfnS2Ay+8K7kZpBsQCi1ciiFLPf
	c/yY4gc7wLDRH9x04lGoBnvdStj5cQ5drvV3KGnBQI1mraIbXKKYkjgpWC+1gNygBb4SXuBIjrO
	ZyjE+sUK3MKFW6Xl71DaTxVLT4C/mYefHplqTFgA4/ufiWyJLQ+Ct04HNV9WB7ih+Mj6k
X-Gm-Gg: AYBFou0JtfR0rg+0AoW1936LblAxfBix8+jAbvzZwCQeCLCBi4QbUbjBEBt00A4tthx
	HaGFN40oN1rBw0E+/FbrWd3gwqtuEz4oJjLUxx0fbSsdfveSLF/IN74TgFZG6LzbUejNYkceSXu
	oR+uagW+AhvJhc83A2SiyZbO5VmcRFneICdY8rXrI5eePPewMfkSTv3fnjAWyD+afKjhJ4+LrDm
	sVYfPYJ01YJYyMKQqlgeYdtCUR8QikybpNHSk7KD7LQEcoZ9hehuJtv3M+XfXVBAmB1DZDzZOtJ
	HoZz5fGfEHvrYpewKZQvCI7NhRDBHRS5qYx+itlsjMqgUx1EiNCjAh2nMbzuqeCmDc1h3HrGi7o
	mlog+v1QVtCJX5vZz0Foj1g==
X-Received: by 2002:a05:622a:3d2:b0:532:d67e:bc2e with SMTP id d75a77b69052e-53645a1a28fmr204967431cf.0.1792503662653;
        Tue, 20 Oct 2026 06:41:02 -0700 (PDT)
X-Received: by 2002:a05:622a:3d2:b0:532:d67e:bc2e with SMTP id d75a77b69052e-53645a1a28fmr204966841cf.0.1792503662173;
        Tue, 20 Oct 2026 06:41:02 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4090dd10d4sm487237566b.27.2026.10.20.06.40.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 06:41:01 -0700 (PDT)
Message-ID: <f3240952-f28c-4c2a-a4a8-4492aef3a88a@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 15:40:58 +0200
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
Subject: Re: [PATCH] arm64: dts: qcom: shikra: Add RF_CLK2 clock to
 wcn3988-pmu nodes
To: Cheng Jiang <cheng.jiang@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261020130852.3049639-1-cheng.jiang@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261020130852.3049639-1-cheng.jiang@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA1NCBTYWx0ZWRfX4UNTo25SadBl
 VJpfljayNeyiRAmqBIQad8/UaJB7yiJ7rnsKpyMF3tEryT3TuoitQD+5RQG7/WpNX6yFC9Vhszj
 bM8cWDP8cTeJ7Tqpj/PrteOBLb3ri3KDz1rKQsJOEk6/T21wmw1Xxy5msVj0NCS7ri4jSP3aROw
 01PZbWx/LUAN4sCYieqEsVf5I6KI+sNYwhRlRsZU0Dv7fOBucHUqpOPVyUB3Xes4G6oUdk7J5fy
 r9eUMadnYnbQvWxKVzUFjgcD1CVoXPLHGC4/Kec3GIqt4sIFLvYZQuvUV18nKoTXS6n1nvp1WwP
 op/ya89JaafgaLunhdxEMerzlJPFW6dIJB+kgIB0G1VC+JD5xT3hgQZUDDlkdP3X1HzizXhMN/S
 0vFvQAHgRSOsKdEul7vsNHOqwLRBh334P23Fh5IBLifKbWa1Kcdd6r0S7maKUFNpMEo1dSKSccr
 4ZruP11Kntg/CVcYQPw==
X-Proofpoint-ORIG-GUID: Rj7KmqIji-9hiSdZBGytAD0GNWKADk--
X-Proofpoint-GUID: Rj7KmqIji-9hiSdZBGytAD0GNWKADk--
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA1NCBTYWx0ZWRfX8AN4p1yWquZH
 yqHsFXz/xVDHGtQv2hx0VzAdah2l6tLjXE7X5lA+TzG6PoeQ3wCodIyqp4zY7ojZ9SjIemReGdQ
 26jEPdktbTXzhFgBYrEnUJUMp/5z65o=
X-Authority-Analysis: v=2.4 cv=NppE4MdJ c=1 sm=1 tr=0 ts=6ad76f6f cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=ZZu2SShvvRyxSvgSXh0A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501 clxscore=1015
 suspectscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200054

On 10/20/26 3:08 PM, Cheng Jiang wrote:
> The WCN3988 on the Shikra SoMs takes its reference clock from the RPM
> RF_CLK2 clock. It is not described in the device tree, so pwrseq-qcom-wcn
> finds no clock to enable and RF_CLK2 stays off, leaving Bluetooth unable
> to come up.
> 
> Describe the clock on the wcn3988-pmu nodes in both SoM dtsi files so
> pwrseq-qcom-wcn enables it as part of the WCN3988 power-on sequence.
> 
> Signed-off-by: Cheng Jiang <cheng.jiang@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
