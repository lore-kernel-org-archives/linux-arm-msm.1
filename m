Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792501577;
	b=xykKmrGIW2MuDXtcAp43O2GTOGCBNQhjsU1v5YbxFzBV9aTc3K0qpSILOQ+rF2F2QOlf
	 gdL8qSJQjmfBu+g1f/IzuFv9Pk/q52he4l67urDmR4qC2MjRtXFFQMmJauS7clwNhZG+c
	 KxfXGutdNtvj7WKSuqu5L3T+wRXI7J7pW7b5hzTc4tHCQfw3kRTr39l3skhnSnkmDxzpQ
	 y+I7xoSK9Qh0938QeaCRNRMX9KniNRq6Np1mH2tEnBAazk8dhkiuR+VUcfgC24aJRTS8o
	 mBAUK39bqGekz7BERVsMWmJnYxopTi/PgjpbSeLkTtE8bIhVjugII3C14rpF0cRHOVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792501577;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=CE0LblYMBDhwvK0/37IJJYzW6feczp9XAWylbm82xTY=;
	b=LiJKHdJkYFh+paEQ8Uq/DoUixzHuWzSvz8DWKINPV79P1KJRm1cOiMfNdmsU2DndVi+d
	 +aBysnxTTpj+15oDgyd2D/MKRw+HUdUo8ZGBXVKia/ASAgfe9sc/EnxdtEznDKNSGmRQo
	 HDNqR1pHtlA7+9Upagby/nOetpGug73wVLiGolmhb5sge3j61ThJctWmi3S0qX7cUWoeR
	 FOS9YAXv0YQPPgHhVB8E6Ozds4R+TJlTyEzCwpCm0kYA6fu0bgfs1jOnT70OvZ8EQZrfG
	 57o7+7k6fmNIrt+yG85n0InzubCg6lbHJXB1XfiRx3C28819bxrXd+BlWX7nFKGf3KQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Qnsg08wT;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="eVl/rqLa";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95E39606A31C
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 13:06:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95E39606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Qnsg08wT;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eVl/rqLa
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KBG6O01486399
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 13:06:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CE0LblYMBDhwvK0/37IJJYzW
	6feczp9XAWylbm82xTY=; b=Qnsg08wTR9ZQ891ogCrMHX9ECV8khG+TBrcQurDv
	Fwesgel3VDU/uqrZgfHZfHPHYVgnls1G/gR1cps2J2Ohd1feR1PghgfO+mmKXqMc
	yGktTqNGQWXAdtUTfOZ1ehwBRNB7zptacSQ1sIbIcT660xAgXO8FIuIWvch2fZ52
	i1EydDbSlXXvY0cjw4YWAWFzQyTYBy2ViUM7IBiNs5Chm1eIfHVnJ5nOFVDe1W4A
	pSVgXCY07pdRaM47z4yHQ9OsIQT78wiCvpFiRau299ICdg4bQq2I8Jg54If9ZIIY
	livn1eKq1RDldvsA4I2/RGsH6XN1W9tqoREo+5JZH5u3TQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n2jqb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 13:06:15 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7cc37ee6562so383348137.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 06:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792501575; x=1793106375; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CE0LblYMBDhwvK0/37IJJYzW6feczp9XAWylbm82xTY=;
        b=eVl/rqLamutJg7J+wgICd6B+u6cmattpRX4g0Xl6RGI+aP28ZF6os9Jmn/wEdt2yyK
         j4lb3ECmHE1AIDEm9iIKlG7188BkJHvXLG12Q1JCVg//1Pp1Fq6K+C+KOO337BtuZL59
         po0DEhHGp0kJFFAASVcmxwZtj8fjf2LYHfNnx6FD4bXwA4g/YmSGKAvKBC8WXAFGmhnY
         G3w2/u7i9jQmaO1OEQYfc8XiKYnFj5JOYJFgFUZW/vh1BlP5G5kAawbX3iDoQv0N/fGf
         /i2O4I+IB+KAH3oX6vxpSOjtM1v2EP/THp5HxUQkkSxIT0a/11P/4kpxmprOGDcpB7u8
         mmVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792501575; x=1793106375;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CE0LblYMBDhwvK0/37IJJYzW6feczp9XAWylbm82xTY=;
        b=DUDGfc2JL3FhR408BcsnawMg7TTBP5BUhdgZpkmHBqn1bKwcPSZ3TnUWTyfSdXC+xJ
         YmHruKWxz/3kPyl1bcFItEpL+o6S1e8CcX2yzkl5Pd0Y/neCt5X/3VswxSYHCnU1zJNC
         dT/0Y+rMN0BajBnSpIrqWWfgk65CRRYrVqkOKu2lF1ejLZWH3GIc32dCVIJIJlMRcYSq
         oC+ZX3x3a1/CKJrHwlXw/UAaYt6tJftm2QTjyxjj4cblcYSc21rliBrxnjoegBj6SJRC
         3hD4Cn9/WlVeN2rT57fLUIEbQnx94brYJXFTM0hxIA/kueDwblGYACvKrrESHEK/6eT4
         IUaQ==
X-Forwarded-Encrypted: i=1; AKwUvBwzLgY1BpzpmbPPPC1tucrUDpRduioGIi3RrQY72/L5fwqnSHP7L32VT5XRk02jeBcnClr5M/uDfprJ7J4p@vger.kernel.org
X-Gm-Message-State: AFq9FYKSqTAWkqUVGHjWrj45TbaE9gLBOzPlLWIYkt/+eEDh2AI3H6Bu
	notEF6G2tBqf1kx0/8/+3kO7t9Ltldu2Qod+vFel+QJOODRrMtKg6nhbsFSoQlm9xTio3JMsrTa
	F90nmm74bqrl6ivTvvKzQeM3ORtpn86R0NwaGxc3voGlnC6V6CP9Cce7DDny9KhWyMd7SG3lx4X
	ay
X-Gm-Gg: AYBFou2friWd63MGHf6PwNpjtHZczGWkH2dCrJlFriDfxtpYmGfwWnFP8JcZLO06rMk
	Us4bdFQWyzOl9QYtKowa1BN6Y2R72VsDuYP0Pb9v1MfTVKv0DeIFeLa9JERvwAgxMfa1pTX6fkK
	2SrLNOjL38WupwkEpQBkXF9gUq+NkcVVUjHrPS/wEFR+zDopkxW5nbDJwPKnnRuIl2MDV3TwWQV
	og/sb6mHEUmtZmXXWXEiNAUM2OA29p8UtkaUoe+LPBKKL7cfjsudznQLbPtfYJhYcsSSeX4WuVd
	8fFQWV+a4p4qVH1uDDymwTLxIFt6X9ZulWl9hrToeTE19zjrz2GUZBYXKo15ewLsJEzdtUwVMM8
	dUhGPlsucrSPIyFOM
X-Received: by 2002:a05:6102:162a:b0:7cc:198d:e2f4 with SMTP id ada2fe7eead31-7cc36733497mr2642215137.3.1792501574640;
        Tue, 20 Oct 2026 06:06:14 -0700 (PDT)
X-Received: by 2002:a05:6102:162a:b0:7cc:198d:e2f4 with SMTP id ada2fe7eead31-7cc36733497mr2642204137.3.1792501573972;
        Tue, 20 Oct 2026 06:06:13 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d82dbbasm5839673f8f.45.2026.10.20.06.06.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 06:06:13 -0700 (PDT)
Date: Tue, 20 Oct 2026 16:06:12 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Thara Gopinath <thara.gopinath@linaro.org>,
        Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 1/7] arm64: dts: qcom: kodiak: Use ICC tag defines
Message-ID: <z2cfdniye5rigkc3zrhazk4zqkq52bzl5tm5mn36ij4lxhq7l3@mh5whmrnowld>
References: <20261020-topic-icc_defines_ao-v1-0-cae8d22649ac@oss.qualcomm.com>
 <20261020-topic-icc_defines_ao-v1-1-cae8d22649ac@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261020-topic-icc_defines_ao-v1-1-cae8d22649ac@oss.qualcomm.com>
X-Proofpoint-GUID: GRdyN2T6Jg5YnAdIbvPXUS-zsqAH9PUK
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA1MiBTYWx0ZWRfX68y4qt8IYSUd
 hNfQbzm6GRg8tx0M4t9lQjkXlvdvfH7YKg0yuWFmQDakrdqOmMhv9ZrEU9GIC/y1EruVzwGL+MZ
 m0W18r2+jU3iTTUgG2/1KL8F4b+haUc=
X-Proofpoint-ORIG-GUID: GRdyN2T6Jg5YnAdIbvPXUS-zsqAH9PUK
X-Authority-Analysis: v=2.4 cv=A5z5rKWG c=1 sm=1 tr=0 ts=6ad76747 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=7jEBbBY3jDUfc6YBOLYA:9 a=CjuIK1q_8ugA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA1MiBTYWx0ZWRfX4fBPnl6/DDsG
 oxExXJZc0TtGwAS6DgI5YHRLEo50wTZ/vyao96r9BDbhfFKTMrtMLz5LVkTfpwwD0zlSbnD8/yC
 YZG6H5/OpLD41OE09v91fNxr6uQkpzM9ghWuyP31mcpR5cYKiGaAOZJ5jZoXWQWwNW/d57s3yyl
 6Fvm5OKb8y7jGBngBQQkArhJIc8lV4eUok4wUUj2Uw7dxZPlAEjuJxH4+QaK8U//YbKNzRLd0la
 4jE/CpM6oH5GZ6SflIrcBC2v2ct1maexv6m4ZXvo92RHxfAqVzPcEMyTRZFvtuN9XQpsRcZ8dQ4
 k4GiM/t2nwhtzireUoM9xCm538xDs6KKqSqGPs0Qb8P+AOWKc/lC847I3oLZqvkbLyZ7giNTZeo
 EkpNCRV1+Vq6NGfC/ob65UsZ6TSSAI2I33nWc4khBl8SVoZd4DuhxYe9fLKjYrjEuV1acJMKYc4
 xv3BtT20EuLdWCdNe4Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 priorityscore=1501 suspectscore=0
 phishscore=0 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200052

On 26-10-20 14:42:05, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The magic values come from dt-bindings. Use the existing defines to
> demistify them.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
