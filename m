Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794216119;
	b=Y0O5ihSa1YX67GYP855XzwqcqSO0BK7PmnY+WtwxD5LQn6izWnJZ6MgpZBxts3HXEqKZ
	 lV2K3zuad7fvqz2T5qBJaIXJQpH75xFShcdBN+X/RToxbzFCyne9P/DVRVsItVj2sgqPH
	 GcrIFjOvShAyyKK10H+VgYQ1JvJEMEwEfrs0af8IhHLHILjYoCy5+pJz8qDDVloifIy3y
	 tVZd8zJckA3HGP6h+lFZhY3mCUuNFCX2Gvp25MK5n0/1Bx2Z2/esuNLhH7E2PJiGXaEXH
	 bFuILQhcgYEIXZ10lu1rtKyn8mH0ZNxOBaC6/ZBhK/QwZCrTo+tErMTvlzwoPuJ5WhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794216119;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=+4/Tw2/BZgl/GDlD4gANvwDshf9nsMa1DlxhHC1kPEM=;
	b=b9Yfg9ju2O/3eELCpoW/olofE6g+HEi44vL3Rx4C5MmYkn1ROKc3J0ip8HFTMjZgbigL
	 izEpIgqsYGwTIvr42Pnp+p+3GwrTtrg+zUWNdSBRjqIK6zYNhKqJ9bnDeTY+32VkrwzN9
	 iUQvfwZs3pQQFPOZsPPnakOmhUnv0hhyMq2uNacFil2MWuRFq6VVHkPzQYH4pO+3/r1X/
	 PuW3yG3sst55lO+OEU01rzSTlMYDTKNQ7oBIlNO1zbgvHqqlyeL6sBzIiTQ/0MgRfzoZR
	 QIkHpfHyrMOd2gyjCRN+lQSyhyYqKQu65I2etFLO9U5tSHqjefqpHyYBcdNYwgLF/6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Gk5HEWLd;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=F60+zxxb;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34D09606A31C
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 09:21:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34D09606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Gk5HEWLd;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=F60+zxxb
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A969wvv2668061
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Nov 2026 09:21:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+4/Tw2/BZgl/GDlD4gANvwDshf9nsMa1DlxhHC1kPEM=; b=Gk5HEWLddCvbNRg7
	F6S5zLwNpdHTXhqPXDQmcJERUtxJqYTZUAYR6fq5CHz6tBAv4SJ6xTMeVq9IoDLv
	Cl8KwIP/HcQUs77bmYl3rdkIAtKb06OT4glPy21fmbwzkRk2ugW8va5jJfNvqwX8
	AjPG2fzQuYcTKtAz0BEFyC5XttO/tRzLYMXhLPOz5K1EAcplY0qK9fYNFPqDPF4m
	o0H0s+RujeC4NuqmQWGMC/k1Zbz5T3/sz/tM/2YhGPA0aPwTEGyTQn+GlER3WtW7
	k+BdkyCdgUDWbeIJIfpS7l1MOGDnLLKC16sGpRby+L1qTV66A1xdurbsDwIQsHiA
	f0rJXg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsw99ndkm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 09:21:58 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cc50fb0d2so20453685a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 01:21:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794216117; x=1794820917; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+4/Tw2/BZgl/GDlD4gANvwDshf9nsMa1DlxhHC1kPEM=;
        b=F60+zxxb/bj2pVeqRV1me/rbvfq92afsvImtmwRm6LmytjYT4g+pioFFAPNINfGxcF
         L119daqN2FTs9R3V2AG/iynKeN0apoO/nYGmpCfRyt0Tt2hwB8BIWBQRVEGySExucd6E
         prn7wZUINpJ6fQ2ycN7Lp714swurmSM709Ap7C1jX9NMnPTqd8iVWHanbQWISTXY/DMe
         sXp2h3mUXBHd7IKqasoBh2i+jLPM6lcTQwVodlz9XlB01jtEtVw3WLNjV7Iie0WGPHV+
         bUB0qkhlMoXP8f5ELWPMzwh7Pahrz7lKkNXlfZ+AAD0bwmW9WESgCU2WLP2DuI9PpO8q
         eLtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794216117; x=1794820917;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+4/Tw2/BZgl/GDlD4gANvwDshf9nsMa1DlxhHC1kPEM=;
        b=AAoCVWgkbIau5YL15uDQWBfaC5ohlgY+zwnSw4On8RMEgU3WBkSyHEXrPXsELXkN9P
         /qfpDtB/b90NK1+qtBDiZKnM+Kcfqj+ur6Ztk7tSQHdMBGC53bllT/OXTFcFvLMMJ83A
         Hwsq7COeyQ0S+tEAAwWVDFj/o7tUbscVq/dpVBmvX0b0dBWBCpK5H/YFbBe0PzET8AF5
         azwyJ65akguNtySyHx0mn86xJY2pUxYFMhLnnbJCtSfSnBlbUXyTJ17PLa4PAgLmqNTu
         LhFH4y1vEfua8fROHg0NqhajcLzq0a2CLe3UdR9d9q5mQAa6HznFkw3FXik98i9asr5H
         46eA==
X-Gm-Message-State: APuU4Z+Ot61U2TGVXuXUvi4XgQIylqywKMPn9eKYOSOsIcUFz2ucUkg1
	5E1196xdjoWCqSyOLYPaJOW7jFYOb0w/roDvoAlI0ijsKpUEFBzej2YovNn4lPuCatoXsbm1Qa5
	DWfSuWBlLRfST/KiKGB3hnYo4FH3TRm1XY6YZFdCMuOEvicV4CrDo0nPKjVRfdzmovk/H
X-Gm-Gg: AYBFou2QUmG5Z+dEdSEKMlXN/we3360INlvczCI869EkeqND/n2Ku31ML0iXn/YWAYa
	45CcIeq6e0Yk+FiQZECgWAEwPDnAMZWCBXrPvXUnVgW3WioTrgq0tzhOT2KlSk9MJcr2qODs/4M
	9eawXHQ/Vddbmqe6fWUQC2fIM4F6kmRA+2l9T53FNyvel0LderdrRk+l8S4C69JJ60Vg9M+RGug
	Pkq2H04lWn6t740um4cNqff2eFtXxhdxhirx7JuInnsQ9i4gyIoBqKZ49QM6ThaKPmXGrtxkBMN
	+TKIzMQBY2Er8lIbDJB5+tRG4QvFpP3QlWanMmO+iJxR4QZIlkR7LQG2ErWkgFzt8ekwm7zr9W5
	M99UPihxTnRZre8QzeWO/kq342979UwrMBEcPkuNY0JLET9JcD91NG3asvzH+KxbHjGhbDQ==
X-Received: by 2002:a05:620a:2253:20b0:939:c7d1:7471 with SMTP id af79cd13be357-947842bd236mr505025785a.4.1794216117419;
        Mon, 09 Nov 2026 01:21:57 -0800 (PST)
X-Received: by 2002:a05:620a:2253:20b0:939:c7d1:7471 with SMTP id af79cd13be357-947842bd236mr505023985a.4.1794216116974;
        Mon, 09 Nov 2026 01:21:56 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b721ef33f1sm1191344a12.35.2026.11.09.01.21.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 01:21:55 -0800 (PST)
Message-ID: <01375dbc-e497-4ed6-97ad-93280969c54f@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 10:21:53 +0100
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
Subject: Re: [PATCH] dmaengine: qcom: gpi: convert to subsys_platform_driver()
To: Brian Masney <bmasney@redhat.com>, Vinod Koul <vkoul@kernel.org>,
        Frank Li <Frank.Li@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261106-dma-gpi-subsys-v1-1-b37dcb4ba3c4@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261106-dma-gpi-subsys-v1-1-b37dcb4ba3c4@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: g9VDf2MwHJzwD7ADzqRri6RMKFAUpyc_
X-Proofpoint-GUID: g9VDf2MwHJzwD7ADzqRri6RMKFAUpyc_
X-Authority-Analysis: v=2.4 cv=CMq/zhrD c=1 sm=1 tr=0 ts=6af190b6 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=0tVWl-7fB1VfZMg2ewEA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAzNyBTYWx0ZWRfX+anXXhv8jc6F
 PzeW18YFscI0Bibar8U5vXsECLPlUlMq4FuCKHyykhPS/wmkdLO9j6CX0JqOuw4H2qXzIMsZFYQ
 a9/amH0LlcAl7An9tlbjRO08beTwf+4/A5Em3GX2Z3fpBVApMsLnMobAOPAKJhAiFPjI8NsnRAZ
 o9jGvQ/q0A5TIAs5MM/ylEuzi7n8Dz8tmx2zY2dBHFxB8Koy6j1tF27Je1VU/bYA5rBCoYqHBKX
 OCi1kiV81ZtHcWRr+6cIFpd0FGmbwE78tGKfShuxE9O1ZXjd7ouFgSCVd7i95Nwe3s0TF1U1hI3
 hNMUoCaXKekQdYqSmhM3/HG1Khhn3GnXaXwRfPZMnODVpgw9PJi0de9aMHYbE2xrCk/X+anCfw/
 Qge2kq1Z8NeaGufDkNqIyAUGrWwuZHCYpf0273aOjdCeLfwzbKxJzXtKg5v1ZMAC6Uhl+1U7do6
 rro1x/KiYYyFjc75V0Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAzNyBTYWx0ZWRfX0cJdDP/8kD5f
 Ykd08IqzMcCtR8MpGSu9uu0znnK29pFNPXkp0U7gHLVoKpRGghVlo2ONkhcQya2TDeqlgTPoPRS
 ZnibnDWOVeigXvISaSaIad3MkXQvpS4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 adultscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090037

On 11/7/26 2:00 AM, Brian Masney wrote:
> Reduce boilerplate code in this driver and convert it over to use
> the macro subsys_platform_driver().
> 
> Note that this driver is configured in the Kconfig to be a tristate,
> the driver doesn't have suppress_bind_attrs set, and there is no __exit
> function defined. This change will add an __exit function that
> unregisters the platform driver.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
