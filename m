Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BA61370ACA
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Sep 2026 09:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788427019; cv=none; b=UBIkrMM5u2jq7d1mo/XvTLku+SugcaXXieUfaMYW2Dkr3FuwsFmJqudgxhp/Wtdi5ikQqJxnpKz0o3pLq3k0Wlahd/AGa9wxm0/DGpgO2WnC/k3PtWk3+fDVC8f/uRhNX45CaFtOEMKh6CoEZI7qFC60y2VLg+EWnZ2bTXS7nOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788427019; c=relaxed/simple;
	bh=7Zfs/6hhRgyw8fL1AnyWaQm3thDH1DSMxrgvQJFL5Qo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PfrQWlctnKE4V1WbU0bkMbSr79+vFHOEoN/IEHWLnwC7V4TL1bcvb0caiWpyFBVGxu1Lyhs7jCDL3ujPtV4JpfRcgVk/J0skyJ5V6C1o14NF1ALyT33C0I+fRsQWmADZq774RLzWyT6cfa/fOrBAIPgb6ADsRumuY6VbiJ3FJ/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oEUVB0c5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=anjLQgQO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oEUVB0c5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="anjLQgQO"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68392U5X4078988
	for <linux-arm-msm@vger.kernel.org>; Thu, 3 Sep 2026 09:16:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yFafEtSTH+ZPtAnnWEH3FEqertJcjN1CmpqFKxM+KOI=; b=oEUVB0c59HzMRCH6
	nzPTrI34Mxo4NgolgRlnmjgd3cauFHGhBQBbex4wnBC6TavADg1LgHYBRAn0v5dv
	9wX4VJur39fJlZu5Z/x6vKDmpaalTNtaxSWf4tJwTUSwE/i/VQzJu4GKZmzOFGDT
	adPZjVro0kvaL2xhmVaN3nbkeC6vc1bFcnlnjT9Lm/EW0hPWXk2W6fMr1K+2XrJ6
	4uy0v8ABbs3gvyNzKO8ZmYyj9oAzBvcPE+84b5TyP2YxrPcxOaEkyT5AHFVg0EP1
	aI6vCZx20bqOsCtjjfns/FuD/Bg2SZN515CFx2tcAFoa8aWj9NhYxkI7Zr1wphn+
	nZGnfg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4genrdv5c1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 09:16:57 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92eebb130dcso51796385a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 02:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788427016; x=1789031816; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yFafEtSTH+ZPtAnnWEH3FEqertJcjN1CmpqFKxM+KOI=;
        b=anjLQgQO9m0juUZ0ca7QmWlQJmzg2rz+0mWSTtlde+Z/zlUCK5AhPX/Uq0CAObJ/SO
         Gk5ykmjZ3y4zWgGPVmD39np2Kc3oIpLQr9pHIIv5TRYQ1hVUiiBNCBzsO2yugXGvfUQd
         JOFUjNxUFhV+1FkkWvKBF1dFnOxb/O0WYVr9uoeAmLWwT5BRXkhuUEBYfS4kLd11T6AV
         WwBIhKI/6/zWkMWz1f3+uoYEPRNoyAjHpghB7T2U6ZJDMxmrh2F8SSAmjJt6AoOAPlHg
         nt2/xyqLOADCZ7bV0Q/30w4UWPuyuoGINUw8viwXPs9Pv/53CLmSw5xFrxkixq87d7ho
         mSZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788427016; x=1789031816;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yFafEtSTH+ZPtAnnWEH3FEqertJcjN1CmpqFKxM+KOI=;
        b=qHapXGwHz6aJ/xKjdIc+cQaE9ggEHNjrfsnILZ9XvCewpmxfpdpnt+ZUQqf4Xqd5xW
         UUJtiSjaQawuKD0Maf6uaBAYuiKjUQVSQie9uoy8HJUfMqL9176g3QdJn41LlW/UqaHY
         YeegW2p4hd8wa9OhUEfK6nKwWfab/2Lbi+xYGwcH1xQ0hCOQmZB1kHPCCYemiZ38CIKb
         srSlhyKcQOrX6R8pBjszKYUtRTbuhHOAxEle+0TpjsGK3tNGcC75zJBbYqBtBZ4zfV48
         ziyXUe32RNhDjT7noCtdRscZmTmqasXPnsohaowyeYcwudGJO8Na94How9siwJNTD/4p
         r5+w==
X-Forwarded-Encrypted: i=1; AKwUvBxpiRX/IM7oexo9LOV6Sp8ilDvIrjQ7kT3D2Q111aug2biH/hTNgh1W8moZjrt6vJnFcbsbZdaDzBxoGmo3@vger.kernel.org
X-Gm-Message-State: AFuF++lnUnCoLruv4YL4AwOjNl2SUZYyzbK01SUPeCV8/XZ7h2CePgQM
	UVLHC4mzIz+wO8VNYW62CMHYc/UHE3Vp3UX327Uf1Gal/f9DYMUMEp+JmyPt0nOEzfC10FSZpyM
	klXoSNfTOwbeZMl8YVpM/Ud80y9F5VcTJeqzSFsl3JIjTED1ifjY3io8DfO+YF60wtON+
X-Gm-Gg: AYBFou3RD7hWmI79g3pIEecxG1GKx8UuSIZAQ+sIfmtSBTZd1PC7gnL+0KF2oCAy9Jg
	lwyDvDfpy9dFvL+DR7T9sCddiJX/n9d7nGBouHhZNi9cZ13fvQuL4RyUnkNtuPoothipEZ6n2l5
	izMITEM9Hme1paN8NLNOt6FXq4UitXoaxKFdcQ2KX7BLPewLWnFLSxS/A7ojFYUaV641wkfwmcO
	EhgHt85YuQW3wor7gzJmynJtHE7XCKspU+W15uM6olUS49YjcgocZt/b4I9zUmMi11qh5WivQtc
	qdBiuwDqcGjCm4Zrh1ORAcOtAkBH0ZHIQaLPInBTWXV8FPx42viNkBlEx66BOnbPn6QHImk+VD8
	Ic9f3F/r0JlteVXxY7fTcTQ==
X-Received: by 2002:a05:620a:2704:b0:939:288a:8a0c with SMTP id af79cd13be357-939610b5598mr746529885a.6.1788427016587;
        Thu, 03 Sep 2026 02:16:56 -0700 (PDT)
X-Received: by 2002:a05:620a:2704:b0:939:288a:8a0c with SMTP id af79cd13be357-939610b5598mr746526385a.6.1788427016118;
        Thu, 03 Sep 2026 02:16:56 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25f41e71a9sm72173866b.43.2026.09.03.02.16.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 02:16:55 -0700 (PDT)
Message-ID: <8fe5c6a8-5202-40ca-9d44-aec284a90042@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 11:16:52 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] arm64: dts: qcom: nord: Add support for ADSP and
 CDSPs
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Anandu Krishnan E <anandu.e@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260831032103.341633-1-shengchao.guo@oss.qualcomm.com>
 <20260831032103.341633-2-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260831032103.341633-2-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=H4/rBeYi c=1 sm=1 tr=0 ts=6a993b09 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=LvqhzNTnz3AqRsj0EdkA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: jIRXgsQJVMfMeXNJUEtL9sLweRIFgGv_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA4MCBTYWx0ZWRfXyijKta6hV5Iq
 j56xfNwJCJL+qZHKYXzgljGJDkFtbeYHjZY3zvqaYWzTowlXooaciuhtB7YTxveKRk0e6Q1iPT8
 MHJXT1Zf7aID/Pg5HULpKsmvWhuu+0Dt9KJ7dEA57WELvhlb3frKDlu1VZqXrRzSOxNcTAk+rRW
 E/+C2ViDGJ4ZQ6P7zji8TaXiPs4ssIPitVcry1W3IFGoqjql9lOj/43xUo4P/YA6a7N/RguCdAd
 NspS9xzkc+QNWnDs+Ho6/AHeU8glm4j2sN5vEI20J8AowDN37lKqWhxYkYKvy/9HHz7m3xg95BY
 +cNm30ifqIMTwyVV/X2W/cRc6wpAjqvMge1P0icjsodGbm5TQlNKbSHGp11MTW/ni3OpwYOwDsp
 OQ+gRB0muiRzYUCeN21bhVLoDevL3riVarH2j0Oj0QloXpAoX6T8l6oLonT4i0WWAQXkrR81ZC5
 354l4adf7lASg8mzYKw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA4MCBTYWx0ZWRfX55OqNuj22Q82
 HvwvaPIcqk6zw0aMYwif2TTDvZmi8g0xSHNsL0C7SmNMA9laEOkNwcHv6Mb3QRjrnNnTUc89Ogp
 +0W7L1fkWUMbq+e7jzsAILePTVSCS60=
X-Proofpoint-ORIG-GUID: jIRXgsQJVMfMeXNJUEtL9sLweRIFgGv_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030080

On 8/31/26 5:20 AM, Shawn Guo wrote:
> Add device tree nodes to support ADSP (HPASS DSP) and CDSPs remoteproc
> on Nord SoC.
> 
> This includes:
> - SMEM memory reservation used by the inter-processor communication
>   infrastructure
> - IPCC mailbox controller for inter-processor signalling
> - AOSS QMP node for load state power management
> - SMP2P nodes providing stop control and fault/crash interrupt signals
> - Remoteproc nodes with a GLINK edge and FastRPC compute contexts for
>   userspace offload
> 
> The embedded variant specific power domains, XO clock, and interconnect
> paths are filled in nord-embedded.dtsi.
> 
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
