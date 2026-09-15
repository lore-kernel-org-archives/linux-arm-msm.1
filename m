Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C515E3B71BF
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 08:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789460023; cv=none; b=k/Ag55ukBj5sUil0LJHVVecxK8NHxDhKKoLjotD+N59h1Xxbv6Y1iHW8UJa+LNGF9eh+lEhXsRflo5SqybeZXY4JCPQNEKg2sLOMLqSrVnx+TAziSOB1VQ6JOCHDxzfTkjbv79K5f4rp079/UU5FvwFxKRgxQg8z/KEjq5kd0Hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789460023; c=relaxed/simple;
	bh=kyzw2pH+VqkjszrenFOZLwTMsFd+ulYHLHoNklEOK1w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d59gR563CLP3yYdMZa8GE2lvV/4cDKXLulyv+34gUi1YnGUMyryW0ZUxSOMLEvEteD8h/dzHJ/VgypiWIDobdZs1kNDiU7j75QXqDngUtJ1J3A9OeStF/UC6OE+n1xuFQiiGaKIf2Fc/4iHIivf8aJGxWCoUUP/UZ0ha8xSFbeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MYKEnq8q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ePTEKSvO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MYKEnq8q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ePTEKSvO"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F6Zbfn3824010
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 08:13:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OqwiqOE8S0VuS8HI72jUGtoqWeLsi10AOQc6npZJz18=; b=MYKEnq8qsSb8jyZ/
	m+RIQGaG5uRKIpXF0XBkYCtDdI5EWTacZYfR3arU74fXrfPwFgHlVkOeUwl3Vu7s
	A2V3+qmSpk2IfSOocU7I0fWXbgo+7kh0EdpDVXRWvaB6QcZq1DXGtOvlwmUFh64Y
	bM+aNgIqFAFyQIsIr+G7odSOrO2V9/t+4RLgSEDizU4+hozmN1yNH5mb0tM0ZOYI
	ntaYP5ZjtAdZclyhFXo4JAv8v/fjL/EW065z7owamN35XSIqErGi9HZ4xtlJsJsg
	N2WVIccXKEZwWsSCkdbsHxlazBKDEwItlWD/8aK4h1Z7QnAjmbAN9Jkk72vWOsGY
	H4CPew==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpn41u9uy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 08:13:40 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-9106a836457so11860766d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 01:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789460020; x=1790064820; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OqwiqOE8S0VuS8HI72jUGtoqWeLsi10AOQc6npZJz18=;
        b=ePTEKSvOpMl+ksn0OuKKz0eh7Djy9i+NIxoIZ9Aj7L5R01UBH+4tNy3NMJ1sqN7blS
         1vdFMhNTmgumnVCLEoIG9cMw6gAR6IAGhsiFhcNXRXAg2c2v5ejlaNbViv7ilsUBRJgR
         jFNZnoLYb9qjHdmQwqmjdfgeKWyY4D15+5/8lcfBgFcnwcDRm/hadxls+okxbc0lmpsT
         u7Kgk45TlRw2c/reJVT8nFtuCg0XB0VG5E/fCeCnUSFJ6TyoShvhIy9AgA+F613c1D8a
         2w/dB8+vjsrpofp6jT3t7MWFQ/3l8I/Q6Rs01RNMqnGun0RSTrByVqVMxsHYJfy0fN3n
         3pcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789460020; x=1790064820;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OqwiqOE8S0VuS8HI72jUGtoqWeLsi10AOQc6npZJz18=;
        b=EuuCxHTBesJusnSmF9bVSy2tuvz/lLTY3tcsBd5dqiZ5SqcyBOOe4ji99p9lYRfpU0
         XKprgbrYmb+zl4TXP1urPMjEhaS2g9pbWLoXd7ipeqXspJKI/f2A7hO7bmWT6G8G7baC
         C2KywesWsjQMMTu9e8aZoVVxMxyYXQtrrMMGtsr+e6BZAb31tW2Nk4PY4inG8Sb/ieKq
         R0+nK/XganKJU6Px5Ly0ONH8Wcx/hHqfsBx2UUlw843um5qqnYZX5QS4U0AOgmmjiuMY
         RdhOz9SP3n/sTRuIcPo/4Ngqa3JKBzWhwVqk06qXuUQJf/3QUD8wsML0jZarllh3eod3
         GKkQ==
X-Gm-Message-State: AFuF++lr3vMlpvM6o+wa0XRZ9xJ5NO2ytKpexIeDOGnrWuk17X4dO8im
	wM3Zm1K3N/flP8pSKiU5VXMWy0+IdQe9bk0/DNsHOxG989ZFsfXx8mrB3YBn2nOUn5rkTniiuwX
	2NS+Qtz2X9hOxWTTH6RRuo21gX46AbMgeCL0Pn16T5a/pqY63DqWa/cSSutDAraBSc7NvnOYSoL
	GJ
X-Gm-Gg: AYBFou1SSTVljHTY7wz+7aqZcux5ixUrdJqxOrxHl5skmMSq9ltoBr2qP/NyxsIa6rd
	riVaJ2ergGK3CXdSggI8DSJB5RysWwAHf/M3IiWxtJRH1JvGrC/Cq6Wugf12xOFQVDXEyj/g9u7
	ec8ERT/7E4kzWqKGtXApmdTerGbqafkItliybYYxjMAbrmds7BOEtYoaLrR9YatlV2PU2isgNg3
	+T1IebBtBj30Je9vbTSDtdr5evYgkFBQvwbjgFEg8SOVycUUROvWfVGEZS86T7Z2/Qi3M9KTd2F
	pA7jLm+oJy+uX8qmQjqFNeqVa5v6EkdG9fU0YLX0+Hcwgw3lNVscq4JkM48MPrOXROdg7O9H7Ym
	2vYb5oUE1Eg6u7wY6ddyZGw==
X-Received: by 2002:a05:620a:288d:b0:939:94c4:b799 with SMTP id af79cd13be357-93a29cc315fmr754972185a.5.1789460019671;
        Tue, 15 Sep 2026 01:13:39 -0700 (PDT)
X-Received: by 2002:a05:620a:288d:b0:939:94c4:b799 with SMTP id af79cd13be357-93a29cc315fmr754970385a.5.1789460019294;
        Tue, 15 Sep 2026 01:13:39 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2966066b76sm38701966b.29.2026.09.15.01.13.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 01:13:38 -0700 (PDT)
Message-ID: <158d06a0-2e93-4300-bf96-eb8937ed28af@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 10:13:36 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sm8150: Use SM8150_MSS for the SDHC
 power domain
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sashiko-bot <sashiko-bot@kernel.org>
References: <20260915-dts-qcom-sm8150-sdhc-use-mss-for-pd-index-v1-1-c4f3857204fd@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260915-dts-qcom-sm8150-sdhc-use-mss-for-pd-index-v1-1-c4f3857204fd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDExNiBTYWx0ZWRfXwaVlweejpahJ
 v3RDMXTmx7v87sXU0+vajW/l8z+ol//tcxzRCwr7MvY87obq5L8BeoXERG9uuRqB/Rsq5UFzcik
 BkqkIzsMMPAAexltI9hTzV+nVBAv/TB9IozXI348kNVA5hcTp1q9MNruLKTeRLQeLV+N8zNDW7m
 wZDrURqBPjNOzSSY1IocYQqkoJaI9zjZ8mAS7Kt26qHXnSA522HiIEp6zkegveF7gWdEY0H8Faq
 FNChtFhU0KPz2NGUsntyBH8OHpd7QvBkQD9J93zrnUky2hMFUvDWwTxmFvFOdoHwF3c8NeeuPMb
 ds2Q8UaFJqYP0QkLDgDF6ft+HOd5HOeCGkX8r6MTbO3LpRLJ01bxnIz7GWhoHAYN++q2mKZC2dg
 WlDtNavsj3ql0O+EPzJr5i5Hq3J99lNZ0ZzOuGNpUnoc+4sL2iSCP8cSqQ67ekSVsli2qmZBS9k
 TQisdws5kJ61B0BmG7Q==
X-Proofpoint-GUID: LG2ycQ8b_Nn_1s9QWIHpnkX5ZXU0-pue
X-Authority-Analysis: v=2.4 cv=cqQOAF4i c=1 sm=1 tr=0 ts=6aa8fe34 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=eAciQRwPYnktzpsGUZ4A:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-ORIG-GUID: LG2ycQ8b_Nn_1s9QWIHpnkX5ZXU0-pue
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDExNiBTYWx0ZWRfX2rDIKx51TkLT
 X43WRk8k1ZwDv4GwrK6TcS/ILQyM70NSeNu1wURWFpTCLVG4h+MVirSsRfPJl0iKyiDvw1iJ76V
 d+ngXf/HNeenbm9H/mt5gvVC5nrrpkM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_02,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150116

On 9/15/26 10:02 AM, Abel Vesa wrote:
> Replace the raw power-domain index of SDHC2 with the SM8150_MSS binding
> constant. This documents the selected RPMh power domain and avoids using
> a magic value.
> 
> Reported-by: sashiko-bot <sashiko-bot@kernel.org>
> Link: https://sashiko.dev/#/patchset/20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com?part=45
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

MSS is the modem power supply, this should be CX

Konrad
