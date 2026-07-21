Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1A12477999
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 10:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784629119; cv=none; b=h39lscP4H7FiaZSJX4tIJN7ot+DUBnxXvvRcmbrXzJ5P2ContPne1EK5eig1jyCQ7quU06ibj0UKijBRVFbGPh48TrwNcQFwpdvBQt0Snsl0dt8Ast3SLHTmOcZ8zVUtsyKYFCzEfFT6gUAH3+9oAFzu8Ogh5TU88dnK8zLyywU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784629119; c=relaxed/simple;
	bh=pkiXZAo1OSd3Q7dIx2lrjjazMtFtNk7a2Wikcl4puOY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=umyPidxdccyjtdX2dbYG5jQuqvwJ+IGk3msPodwIASbgSHOzI2lILGuBBmeqBkMnRLIOAxG2ZMlDy8opcqi+VwsSmi31IV1SCQtsv0QTyO3jHtaSQrK4ApBf74dpovZ8zyBVV5JcCxvn/JMPYJTD2CjRvK09v2EUFg63lvG5wxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OHJlWRre; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g++b2EHo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OHJlWRre";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g++b2EHo"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66L7jqU6043427
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 10:18:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TQN8SBsDUQeybJAOaRVq9P7dww95pQx11Qz/2/Tev00=; b=OHJlWRrewAuLkteR
	lb16fd0YnNhjkg6euvBMYdC8GHtIhcr9e9O5lXptvH8WAuwoaKaB1ZgtGJ0uZdQQ
	2sabnFU34d+eAu5MA2lGRkx5GeSGnsQRRitD+4/DvjGVRMoYOsqmAYBMzCp6DxfL
	WGS/PG9B0lcavxmt+D1d16XqNnMqliaVC42OeiHc8WKWNXenunSHr21BELAEq8x4
	5YcJhj4iOgF/WXdxGfWnRipiCBRV+4V4DCCEgDZC5cggtjNyvg+QUzyd5rAmkFec
	CPBWdEN/UBl5pQrA1++DDZUYefywrdgPW/IkbwBs8t5QJv5dsF5wPvLs6z9IpSz+
	u+9wPw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj0as21vc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 10:18:36 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51bfe75b7dbso23866311cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 03:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784629116; x=1785233916; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TQN8SBsDUQeybJAOaRVq9P7dww95pQx11Qz/2/Tev00=;
        b=g++b2EHoniBvAe61UwzXE1J+/w8fjDWlMUKTVTz9qt9dYZuj5F75hNuouix51o8/xP
         p65rsYJrBrSYAc/w6BxhXmcmd9fMSSKztG91FG5zlfJLJYNaD26R0IKwRb4IvCCPckgf
         3Yq5qlMLRtjLtISJZJdvSy+pFGxXWbyUw45bENbNKNKEdRvmtdPl68rPebSk6WEl/J5n
         AyyxpNHiJjTjbx13G8uf/nsNcJqq2Ue+wtYQX9pLg5wu3g45Ec0FmVHejZyc0ektZDgP
         SDlC+AE4O1EIjMCRqc5BDYC9S0QyZW6C4eUmTmH3bRk6kQBP0d7o6wFBhzg8xj+bZpuU
         fFHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784629116; x=1785233916;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TQN8SBsDUQeybJAOaRVq9P7dww95pQx11Qz/2/Tev00=;
        b=aqsOnS99V22s9VZ/4wG9EgehfMkqtsOs0GJxvLtj/KMuH7RCjm7VupeTyDdHhWFC3M
         5iAGdQa0mGO2pccS/oiH6iM8Ikt2QfvRlcruJTL4R1fdvVUPZ4XrYHVy2bGgV48pm/BC
         9c6lf/ACXgC6TEdJRrz85CPiE0tgbYt5wownUHJ3D1uuu8Sh2qn//kDZmizMTY5Al+eX
         nODqlU++baww5rQuXmNTMtR3m743Q0tmPTrTFIsl/g7l6x/Kvg9cG+sZQaxlY77RihuG
         Bo+hzMX2J1Y1V0rRAjeDcWWKuxmJrh8nIR5JiRyvexGFM3MXc+XQtyq7J1Zj2fLPGCZf
         m+ug==
X-Gm-Message-State: AOJu0YycDSi7KN+OTVxTN/Sp1rkvxt+AA1pV9//GbcLEdG1Giw4Kmlid
	rIxMrRDz0CZtHZVHsyiORf4SXpIBz70rKYULq3bneAxLNttmzuAmA5OuLvqONXo+8YwBL5YXjVR
	gZvtrt83IdSLGd1rfCaplEOLw7tYsSWh3xM1H7oUpqvCTU8kq9SdUY4Zz0zmmRYK+LfSY
X-Gm-Gg: AfdE7cnDLMCr1jwa/og63qyJ11VQ9supW5Kjsf0MmtltfjHciKpbznWVbaOuzYpDjbe
	1/RrN3b0/4SV7cmHkCieYbC8G9WzfucwFcV/zQTJViofgQVBUwhsfXA97Xfv1s7ta2aKH5FG5TB
	jj6aSvUNED7XHyxY+gRBdOKJHO5fY7akjyr0FXGp1msHsOZ5hKhW1uB8Gij1IMNIT5O87nYl6JY
	lYeed0uv0LPzLbWykPsMK3DB+bYWwZUO8EDwxS1pxZMOlEknQUABCW3+AH0LBBw/Fm0RjQ8ZKgH
	T+zVqFJyAavFjOxM7v6oKtjsHENP9kpFQbpOM6lHXdnlLcGyyWoz2da5D9P4Yxw9Tjycp4sLydX
	I4myDo2aWwhxumHmIHyQFWMOy
X-Received: by 2002:a05:622a:2991:b0:51c:845b:ac4 with SMTP id d75a77b69052e-52672ed4ebcmr15924501cf.3.1784629115876;
        Tue, 21 Jul 2026 03:18:35 -0700 (PDT)
X-Received: by 2002:a05:622a:2991:b0:51c:845b:ac4 with SMTP id d75a77b69052e-52672ed4ebcmr15924321cf.3.1784629115471;
        Tue, 21 Jul 2026 03:18:35 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1ac6ca516dsm86967066b.25.2026.07.21.03.18.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 03:18:34 -0700 (PDT)
Message-ID: <f15fb988-09a7-48c8-aaa5-2a5dec3a1d15@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 12:18:32 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: Add support for Acer Swift Go
 Pro AI (SFA14-11)
To: Kaipeng Zeng <kaipeng94@gmail.com>, devicetree@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org, conor+dt@kernel.org, krzk+dt@kernel.org,
        robh@kernel.org, konradybcio@kernel.org, andersson@kernel.org
References: <20260721082410.18275-1-kaipeng94@gmail.com>
 <20260721082410.18275-3-kaipeng94@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260721082410.18275-3-kaipeng94@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDEwOSBTYWx0ZWRfX5kq5+tcEBYJm
 dsHJFvSiMAWaso4LmyVRrRbrjRBloq/nEow4SvJgcfA+D111eY8CN6QqlktWdxKbW+pVMEBMR6L
 JTLA9UbSuYm7BGErCkM57qHQeREHweY/spr0JMogNNAangS1cbXfxorYjlD7/9NzVrG9UAKBhmW
 KkgWEoM1dkc/8LSDSeOQm/HkkVeUizaIpXoUxQKhYiLQSsqPdw3FAIgeW2gXsUhW5hllJXMILqQ
 ATRKrCIkt7ct+mJGlGQ/vqdFpNpgznA1Ou0JmA2tKNLZkZB0OV3CXhEh54GJzbxYGtPrzLis4JN
 ZRzny5at9lF3Fe6UgI6ePjsa3gDZ3n9C0unzMoI7qLBp4hasUni9j9Tml0jOOYb3eVVH8ohLDDh
 MaxZvBAPYe8gIOTnv0engBKrPDKWodDOsceX2h3ofThd2KtDMXFlIiT0j4JC3FQF4AYJiniMk/p
 ZbbPaWPdiRWJiXHPcWA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDEwOSBTYWx0ZWRfXykzkb9MT1lj3
 qXYHbvHvp2swKsqycU4e0DOwOFyTMzIz4Swqmyp0mM1arVML6tPO1J/agt3rYXTCzi2Ht5oDwpG
 Pjpp93ehCS4KDwiAjGxiVJpQUoHI2EI=
X-Authority-Analysis: v=2.4 cv=DoFmPm/+ c=1 sm=1 tr=0 ts=6a5f477d cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=_OVoRcir2XhzUFdSYwcA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: 079J4ntpboOy0tkOImjoAQB5whVfLic7
X-Proofpoint-ORIG-GUID: 079J4ntpboOy0tkOImjoAQB5whVfLic7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 suspectscore=0 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210109

On 7/21/26 10:24 AM, Kaipeng Zeng wrote:
> Introduce device tree for the Acer Swift Go Pro AI (SFA14-11).
> It is a laptop based on the Qualcomm Snapdragon X Elite (X1E78100) SoC.
> This device tree implementation references nodes from the x1-crd.dtsi.

[...]


> +&usb_1_ss1_qmpphy {
> +	vdda-phy-supply = <&vreg_l2j_1p2>;
> +	vdda-pll-supply = <&vreg_l2d_0p9>;
> +
> +	status = "okay";
> +
> +	/delete-property/ mode-switch;
> +	/delete-property/ orientation-switch;
> +
> +	ports {
> +		/delete-node/ port@2;
> +	};

What happened here?

Konrad
