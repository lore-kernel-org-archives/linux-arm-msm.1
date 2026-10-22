Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792671746;
	b=UQEztUviljrGeZ3AZ2moDvcQc9L0uBJZYMFUliXAdb3eORnk1FPSO2ze/eVl4xAPdRg0
	 nncmo3GRBPZ9BTVV01Y9/o0DZtwTmTGIRxA+7lYXpEdaClHSpBMtDFfDnc80hZ/V5zMbk
	 4Da2h1QVI45knth8tyi3d6wUZVugXD5T465pS9MNx+EPgk6I4AdCdR6lJV/P0QNUhLGCF
	 guB06EEhlIumqGnZIQaTVmAUQJpM2ytC5xBzrlItKVREOuLAzL8aksE4uSSF30H73y30/
	 pQrlttetWKip6+AJ8tVXZGBU+bB5vs2C9Z6/ppjNMz1arSeapfj9kX66pPR1Fco72kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792671746;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=jMMBwaLsIajhBzJwHlXR4BwgAy9WFdwK3Pip2rL08qc=;
	b=LL5YP12CT+3R+QgoIQEwHF//kjzTbV2V5HbI3YihzbcwTsr3SOYBXKQZTy/3Xg7M5fu+
	 Pw8k2ePHMd+Kqkgug93MucGqLKLzDyKllqIP8WM54kVy+bAhEUWOOvZSE/OEu97bcTwTx
	 rpMMI9ed3N7G7/pUZQ6cTfiG4rFiXMQNVGQt7xBQk6jSf7eaIJ/PE1JGHfiwQO+HfE9sI
	 hV+9rUtx0EIVmpu7uTVRy/nLLIEvO7qqkfLK294MMQYJGnAcqzijMQAB9rUTEqCn6W4CA
	 HzwK9dcWR68vn54uOGV3Wi4VbIGiCihY72qGh6OIv2VtZKmUQhPA9G5SNhuOiIW/VuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=b7FjuHri;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=C6zvZYVD;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94544606A31F
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 12:22:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94544606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=b7FjuHri;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=C6zvZYVD
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M9xlCX2573576
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 12:22:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jMMBwaLsIajhBzJwHlXR4BwgAy9WFdwK3Pip2rL08qc=; b=b7FjuHriWyJcQF6b
	oVxgz8d4XnoXFI7faQANh+GAqlf1hwx2KqrTuYLjyW5FpjEwS2L/kimmAc3pa4AB
	CT4m7ayULxWWZG3q3wZbrPIeLAHicmVkjguUeG7SFxAspd6FWvaKxbVB3HurC8OK
	fcUz/yF/RvrJD4lPFSo6JhfOzG2b4VNvQPZIQxfZkBQgvZJephazPUFFGQ73TqiJ
	R5iVVRCTGKIlJJQdCgbkZ6MEHpNZ0Go3fRbWPJuCci5ZvlhXGO52remI9hyptRID
	m9aiYahu2KCq3Fmjs91IJukRzfggloF1DzztroxWsu6nIhC08nEbKX1fDlEAVsCH
	olWzmg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93ak6kj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 12:22:24 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e94f72fb9fso16273895ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 05:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792671744; x=1793276544; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jMMBwaLsIajhBzJwHlXR4BwgAy9WFdwK3Pip2rL08qc=;
        b=C6zvZYVDvsQzlkSCBnbfBSEinTQ5aqEOrZNT674hCUTK3Z05R+AH6DP0WTc4lrKLzq
         +pHyQwZQfA89UHm81BY5XebO+yKhsStKDNo/bb/r5ijlIw08rB48z7jdfSphizItJbq6
         f+H3UlJilQPQOOB4erv+ZTLSQCR5y3vZw7ipABz59FsDCLTHvPj8c+5v8jl/hTBVBbow
         Yy724azzBS6hhZ09zZa6IW0tE2c72VLgTx89YOy4SEyBu4Faoz692cMJMWFMC08uJdZt
         TP9FEUjo7ZFUeowAtZmVF3OFihn7b+/hpHpgojpxauF2sHALP64B2pKOLNPSZe+NLo7e
         +n1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792671744; x=1793276544;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jMMBwaLsIajhBzJwHlXR4BwgAy9WFdwK3Pip2rL08qc=;
        b=ykjXVjSoqwx/OeCyTJRGWRn6Jzio0F5PBhgnYeruTXQGKOw6eJHBMw5Nr+6H1oC+8D
         WMGwdAZclfdghbSv+PBSw1jZ6smmmRQM0bIAVO2mAPZ6MHSI8FpSWSLjD6P7bEyYn7IF
         m3zNqCE3Qf4mFakN9MFyOnnKp9ipcBO2YKd2MkV7J65eaq9haXYxdmKF/4j5PDbGtnfe
         uEPmATG54iQro8edoGXi8ZdtJDdMu5D3OGL3/ckhblpbsizqCRLcQjeVKx3UQ1HJrKp0
         sQ2ktcZZJSe52q1AO5Euwh0nv9XmVlAUuiAj8+O/yhMoLhgm4tsEcieM5tFIhoY+JBas
         CRFg==
X-Forwarded-Encrypted: i=1; AKwUvBzsCsKbwv4hGD9C7r7qqJnISTmDNcc+Fa9M/JHj56ESDPeOwHqZmmUZ1Dhj2WshFlBGkbyfKrqRCEgrdwf+@vger.kernel.org
X-Gm-Message-State: AFq9FYKHJG2WAuwATWrg6vivrDiR92aPO+sChrvUv2GqLb9ZQ58anr4f
	HAmwJsVJAYVn5JDMGKTuKdUo/4G+9ezVcHqkqURBxRPmOnTiJXAleVznIHXkbytzyitJ1nL7u9p
	fx/tuozqb5Nimu+iCmiV1LIkhpdufXVjzDhru4FJCUkHhBSL677RqSXllKV/6lFXOT8kf
X-Gm-Gg: AYBFou0N4wUxfgMEsZVLwthc1Rsesqkn+mEYEslU/hlAlndgdVT9Avv6nqSyJK0xb1F
	9nxApqIt+4ySuvKBldpBCVI9Xfy5Tt82Xr54tRudyrocylV70avmXC+Ov4Y7iBCJ+syQUZmHsY2
	OfZNvIPRKkWTuUHz28GdmkyMJOTfSj+g2LmBv/ookwQtsIAJXQK9KTdFmmspWhzFfvbrC9ATqpl
	Fb7I4WtSm6qkvYW/cGFh4HGijgKgDZBT0fB8tZUZUdRpk1Ls+FBMpOM0aE1HAZMgmfTSur8JgBF
	B5kke9j0R0wIGnrOnFZWgAsBONVQf0/kUkK0+L2M1XvoNP/gO1zfNUPhUVYpgtRLDTQINOOD90v
	W4KwcdcxoDUC9kKByTynQWGQ8TuWWURtgtA==
X-Received: by 2002:a17:902:e844:b0:2e9:514b:7a73 with SMTP id d9443c01a7336-2ea43fa9f19mr45591735ad.48.1792671744004;
        Thu, 22 Oct 2026 05:22:24 -0700 (PDT)
X-Received: by 2002:a17:902:e844:b0:2e9:514b:7a73 with SMTP id d9443c01a7336-2ea43fa9f19mr45591515ad.48.1792671743527;
        Thu, 22 Oct 2026 05:22:23 -0700 (PDT)
Received: from [10.217.219.98] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea3b412756sm23642595ad.24.2026.10.22.05.22.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 05:22:22 -0700 (PDT)
Message-ID: <5dfd7245-c2c0-4468-95ed-6bb8a385da98@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 17:52:15 +0530
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
Subject: Re: [PATCH v3 1/8] soc: qcom: geni-se: Populate clk_perf_tbl with SE
 source clock frequencies from perf OPP table
To: Praveen Talari <praveen.talari@oss.qualcomm.com>,
        konrad.dybcio@oss.qualcomm.com, Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Mark Brown <broonie@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: chandana.chiluveru@oss.qualcomm.com, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-i2c@vger.kernel.org
References: <20261015-derive_clk_perf_tbl_from_perf_domain_opp_table-v3-0-5da1096243c9@oss.qualcomm.com>
 <20261015-derive_clk_perf_tbl_from_perf_domain_opp_table-v3-1-5da1096243c9@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20261015-derive_clk_perf_tbl_from_perf_domain_opp_table-v3-1-5da1096243c9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: tVoJGSDLeCCKQXLjQMIYXRTfy-wZdfDy
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA0OSBTYWx0ZWRfX7LqwbJR7wHha
 7VRSh9A9OmMye7Q4B3IOA1p3GsMvndbKtcIPl0/L+XjuxzqHIlGEe/nY/lIe7Ldk565fxGg/9c6
 +I9vgRhGEZu1rh6efe2hYkLxYzr2g+o=
X-Proofpoint-ORIG-GUID: tVoJGSDLeCCKQXLjQMIYXRTfy-wZdfDy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA0OSBTYWx0ZWRfXwUPmqKPIz89i
 KNhuqwGgmM2gt3Imc7wnsyavHvPBYo6/2Ve6flV92Tu6NtBb3YnoQabOYGjtNrgj0Ds9lj3Wph4
 vXtI1RqNxYDbdXZ1kxBuXIbTcopf4dq5xrVYk306bjR4XUeLrl35UxAV1bEjAy5kCXTK+H4T7WP
 wpHfHoimO+w1IN1rwyeZL+udDzJWKJuzyfTvKG3wSbyl7Ol+lTtBVlOZ09NRmlHyAgGsjnBBMqX
 jflBAktsFA7w7zRm6AEdBdSfb8IbVukUWfsTkhukRccWFxvFSgQdxX184bhVnrCftxyi+EZ1z6r
 fUnoMnOaC49v068kDiLf11os5IeB9QNrQA21K9iXV12qYzRw5mOEoCgjQTrZ29ILs5XxF6Jf3+j
 1gf654MP8ECpTY/NjGMjc01Vups156ZXbPoNUy9MG8isYXtMV6+5xhRcuNaUaLqtrh3gPrZRh2c
 ZnnyxaAAAQxJLgUMsAg==
X-Authority-Analysis: v=2.4 cv=dOszC+Zb c=1 sm=1 tr=0 ts=6ada0000 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=ddSnBWzqd8mu_d83chYA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 spamscore=0 adultscore=0 phishscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610220049



On 10/15/2026 6:28 PM, Praveen Talari wrote:
> Currently, on the SA8255P platform, protocol drivers attached via
> geni_se_domain_attach() treat each OPP on the perf domain as directly
> corresponding to a protocol value such as a baudrate or requested
> frequency, and simply request that OPP via
> geni_se_set_perf_level()/geni_se_set_perf_opp(). This does not allow
> computing a source clock and divider combination for a protocol
> requested frequency, unlike the Linux clock managed path which derives
> this from se->clk_perf_tbl via geni_se_clk_freq_match(), and then
> applies the matched source clock frequency with dev_pm_opp_set_rate().
> 
> Change this by treating the OPP table exposed on the perf domain
> device as representing the actual SE HW supported source clock
> frequencies, the same role clk_perf_tbl plays for the Linux clock
> managed path. Populate se->clk_perf_tbl and se->num_clk_levels by
> iterating over this OPP table in geni_se_domain_attach(), so that
> protocol drivers on the firmware managed (SA8255P) path can also use
> geni_se_clk_freq_match() to pick the closest supported source clock
> frequency and calculate the required divider, and apply it with
> dev_pm_opp_set_rate() the same way as it is done for the Linux clock
> managed path, instead of relying on a direct frequency/baudrate-to-
> perf-level mapping.
> 
> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
> ---

Reviewed-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
