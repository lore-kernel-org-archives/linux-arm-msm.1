Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47FEB4C10D7
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 09:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790070392; cv=none; b=qzO8rznNQoBLDizBFpdPIqHKU9ZnOMaebNKE2IzpFGeBoECoCIH16CBsEZEzeo6IH0cbOCkpIOOEPjPHJzTR1ojNOQ6omAXK0+II/TXfJZhvr3JixYWpcWb+Dqapuf3wvrX8GzaOZnI9mQu+TeKdIg6+XsVQubVOubzSuFXhINY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790070392; c=relaxed/simple;
	bh=C017S+WPS28H0KBmmCJHn2yw1QbkE42J+XEXfHlj+SE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nIFZjbSQOwqBipkFdnwH8e46PkNt0GlQO/jzy+fXSnEqsW/wvuoTXoAhpembYtf4P6nmdW6kyYQPHqZMT8CFTJXmmCq+e61E9OJX8rc83rYYjMHa+tV31MZX3eQIBzOx2PS4M1w8+sTBvRnlXohdXZZtmm9DWAfBgijS8ESPvfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O+a9BUsw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NwtbOSxU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O+a9BUsw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NwtbOSxU"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M7Pm2b3044076
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 09:46:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wH+m4/fTa19EiJ6UA3g/PzW4QR25sui+i0TbH/t1//Y=; b=O+a9BUsw2VXm5ong
	k+YXzFo/6TD7ZlJefX/7N26o0qNhrLtg7TqWaVbvd///Fb/j1+V2TE67UNiTTxBX
	IJKR9mi3iXHF6HsIld1g36yKAENTjggviowO8uTA3EPXhY1pVM4h/f60p2rt9uKE
	rCiEdEXkcBXqbUAHp6IWbHAvJCixGG6EMpvVobEDgioX9j/SoM0T+1FpeSVPjGGb
	2I/EUfgm669VGXrEcYsVE2lv4xV/D0b//+TdmTWsyXdiigKRdMl1ozhbPj9MO3c4
	0sAbrZUIg/XAUnNb5JyZvfWgtfbw7gGH2C/C0Nyc1E789u0SEAamHyHSa1JeHo5t
	BLg3kw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gufbasww9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 09:46:29 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93bfab40895so49317385a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 02:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790070388; x=1790675188; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wH+m4/fTa19EiJ6UA3g/PzW4QR25sui+i0TbH/t1//Y=;
        b=NwtbOSxUhk8vzHwA0IxnglgEPOPKBhyZhstzaR74CH3XeE1qqD6ab2bXXWU9rxfMnD
         aLfQ5eOwjKxPnPN42Do+drjHNf3K0cCGtKZLf/G8q9wYGmZNsgcEMQ8vG95wtCZjyemc
         g2c/q6vcbHh7Ax+lat6ecQK3dYm4TTixnUgAi7Odhnw7VRL/R/5mZJcXU+zXstm7oXwx
         SBbTr7nhohR9haiSJlJWBwi8jmm4NnuZHKStuB2ysVdP4tk2cTPuEkmFvMk5ekb74Y+/
         CdTrwIsD6KTO/+IrlQvn/92DIyAnM0nUO4+sc29JDxkh4mVmGRWCrni+KgAvrx5FVMlD
         eeCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790070388; x=1790675188;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wH+m4/fTa19EiJ6UA3g/PzW4QR25sui+i0TbH/t1//Y=;
        b=v3CWoMbYdiU+caJuAB0Kx83uiubm2TKJOWwBlXTC90I1mOsL8HU4BmgTmIQpvvszMs
         D2ctnzbk9l584rq66becnMAeN/fxZshjwydWBnv0hNJjtuHCVl+YkjanZpLko4x2Nvon
         HWQZCMzlrwVMHYTxyqYimhA5sY9I20SG8ocl0DE8bQ+n3KjIDndaFk4Bx/t/Ae5wU04t
         VaAtBuOOvbXkqsfrmT8EKJa6HrvUbvzldTtBJIm1iOhqgCmp2YNFHWVtCWS4vBgULDuu
         xuEdPWf6EHLZZfO3aS9JB3hJjvZlBeZtIkJAuwfKjiGLsDUg8dmrFyOcP1MFJo5sEopO
         f96A==
X-Forwarded-Encrypted: i=1; AKwUvBxeoGxxkGOlEfDrzMQleBINsOVEUZsqRlEGzC20Gz1LSx2X8Zk3kl5oRS1QZOOmJbPVQdyKEIxSFgVs5zJk@vger.kernel.org
X-Gm-Message-State: AFuF++kXyTpoXl6n/pQV4JB7d+FLeGg+9M04myRvpl/c6gpMUC7CT8iN
	oOo0HJL+7DDX3HUULe2Le95F8IOyrp7nVUt6SowufNL5lwH6AwsFD9JpriZqEYQw73GYVjYssrF
	my/eTCt1FFVjVtAHtZ+Ysm8UbxIAPaVB5mpx7zFweKdBcloN/+2F+S/v/nWKYzUj3S4ri
X-Gm-Gg: AYBFou3wn1W2OTuVbEpHvmN3G/WG/mh17jTSk9n5Znr10zkgwmSGBBUclZQzUxh7dvj
	HBD9UYEdEUiP/B5o7sbtTpNorLOmYs8k800umEtmuZ2ZAMLJp0bdHcewxoSroPk1vGDzRMSC1/0
	6uNX3tgWwjdh2jBUstn215mcPKcgn5/WSZjo3lgPV7DEdfsXWffHMECoraWdlRF+lypW35/dYkI
	QuGqkXTCLG8Xj71b0QbRUdimQvbUgwcvCXi6FdBmWNbfpnIcP/T1dvedOJxZGbq5sVVd9NSEghw
	Aqm8xk2BPT8hIAbnHMWcsvXapPFStpmdBCHmXAYJqtrzvH7svxikcCGEGKgZjyxWuAEDEWkc+9S
	xG6ysE1CD4ez3721zbbI6sA==
X-Received: by 2002:a05:620a:4006:b0:939:eb09:4458 with SMTP id af79cd13be357-93c15f34b74mr512911585a.3.1790070388507;
        Tue, 22 Sep 2026 02:46:28 -0700 (PDT)
X-Received: by 2002:a05:620a:4006:b0:939:eb09:4458 with SMTP id af79cd13be357-93c15f34b74mr512909185a.3.1790070388166;
        Tue, 22 Sep 2026 02:46:28 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a9f1895ddsm40279266b.9.2026.09.22.02.46.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 02:46:27 -0700 (PDT)
Message-ID: <0b5ae4d6-13f4-4f48-bd25-65cffad0fdd3@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 11:46:25 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: nord: Add PMU node
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Anurag Pateriya <apateriy@qti.qualcomm.com>
References: <20260922093446.493606-1-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260922093446.493606-1-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDE0MCBTYWx0ZWRfX0rHCJjSdfrry
 3szMaEbQ830V7MWL7rqg2e0Sf+3sabHVARa0owswOXxQLqOACGzwzBKyRejn4/KlCNBE8pQAXsa
 GE8ODhW8YQ5gagB5CjpagX0vUc2dvgGUrzEUKHYiXw0rcRfTsVfVp8q3HzZBHQLmv/80x4fMPRj
 z/O5MTSlI8AnhCfve3+lhNFx/ZbWV5OdJ3Vqsf0oGSkn4V8KqmSweP2KJmTAeR9A/VmVceY/k7P
 pbvEjMx1Ver/m80SqSvgs9a89Q8DP6/FdCTaA281c/zQCbvtjZFMYIkfqa6crAnjliIUV/uZXgd
 4vxx+Z5bdRb9egdLn5BXLzJaGtagoKMrz+7AcOeDG4/FzKplZXvLqVgdbnyeANdi/BiSaHER0oy
 GSyvdduB400oNvugC7LD43ub7ebKjvz9fyqLgZeQxvUhWfgg5w7DeB2MU7zz8jrKoEzdMZSGRLf
 oM8oTkFRlIUB0YkyFmw==
X-Authority-Analysis: v=2.4 cv=IYYSymqa c=1 sm=1 tr=0 ts=6ab24e75 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=aHEHYAZx7hSDT81ZUAAA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDE0MCBTYWx0ZWRfX5ySOmXYCtVHq
 W7q7vmi7nSdRfMaan2kFekDJM4bBTSVxt0KRBeEj3C0r3Qxx9iyRX/rAiqJi6nKI8hg8XM4ytba
 J7mY8SNc+qVUrx+vGyEyg24swBQKZes=
X-Proofpoint-ORIG-GUID: l5EOCubpehVJ99qiGwRzfltoeDGTPGA1
X-Proofpoint-GUID: l5EOCubpehVJ99qiGwRzfltoeDGTPGA1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 spamscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220140

On 9/22/26 11:34 AM, Shawn Guo wrote:
> From: Anurag Pateriya <apateriy@qti.qualcomm.com>
> 
> Add the top-level pmu node so perf events can be collected on Nord.
> 
> Signed-off-by: Anurag Pateriya <apateriy@qti.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
