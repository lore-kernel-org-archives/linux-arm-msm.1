Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AC4745A2A0
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 09:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789984162; cv=none; b=rfABE9IaIxWGl/fVkJ7EtrizBahOTcDbAILBLlROfcuxM8s03dGk8VzjPcUDnaOeKN6hAZRrt8wWxfgEPZQzGS2n1ffo99B9wI7U+b9xiUTDbO37KJudgV8wGcC4SKB7T5fmOCrgJ0BOfTz3NOHBv0WkGlEJrHxhuquOJ6LsNpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789984162; c=relaxed/simple;
	bh=RFiZzF2ElB0O7/pZu8dBVKeJi6fv0kAHLxB/68b5kK0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U7hdmwbMkxuJIyfU14yAbj8Fj4KzaAilzfs90fmuLAewKxr3pYdAtyDd5YSpI3HJfui6hGGJwiryB7vIVKbAWnkqTqitSqMtGCibTPePAWLXwZ7eGCe3+5/3UfbgTswNp8mQenpgctZJ1tgo3UDjnZcH7TxUfLyeA0BoSZLihTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n+x153h5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FYTapqGf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n+x153h5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FYTapqGf"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L84Twv4135093
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 09:49:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GsKXw03ZbXYXr3t2AeRXLXUINacd1i8dLiOD20nvC8I=; b=n+x153h5p7YMtISI
	ngKfcrj2YibnqTzb3BTzUHRWdRrhdAAMcYciV5hIicV3VSw6+DiH1tzreYD5behH
	zuDtvReAkXNMvDL8QaprF9Nup8hZUYrzXBqPh9IfZgWa7ifywhxEQ0fEoXm2MfWy
	EYdkWICJpUUWfVFdGrslJay1wngk4Dhbmbr88piHgWQcJCvdPnGi/H2/xg3hxFkC
	gHCVE0gzwfq1ko1RvWuIeLZ7fYwraHqE6TEABt6hgD2ZgbraoFuHhUbh4TgaP/3c
	A65h8DNI4xS6Xnix64+r/MmJ1Pbzyi4ggIpS+VjogV8ffMu6dd3XmaAbMH7Avq3Y
	1wU2Rg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu0rj0etx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 09:49:19 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93bfab40895so23171885a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 02:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789984158; x=1790588958; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GsKXw03ZbXYXr3t2AeRXLXUINacd1i8dLiOD20nvC8I=;
        b=FYTapqGfNawKXB00fDDa8Bckx3mrl23e1voc3nnZMeg1so7h6Z3ZMIqosAhp+ea5GL
         pEU07jjBLL+joOAMeNdMzbpFQNph2Jb2WzFQXG5qqzOF/TqbLZIcKOPXHbFDr5It+pb8
         pc6VyeEj9wRyz9/TbPT0ZmHrNFrOtfxl1rWhCmvQlbIBL21GIt2Hqq79lMrqsyeOJnmr
         +LZLOou6iWxi/gAf8XMTkK3MKa778951lZ4OaLsJTXFZxlLcqaG1qZsqQ5nYojqJuv9L
         4YkzZnclRHCbcJnaPqCXtVwjH1cz0QOYIDmDpnTe7khuehPFvjoun+xD4bRancTllplo
         lcew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789984158; x=1790588958;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GsKXw03ZbXYXr3t2AeRXLXUINacd1i8dLiOD20nvC8I=;
        b=tE7M4bweIurI0t7nwfT39Q6FaeXmS1xtF9QoYYIgzbP/9qGMEHuFYv2jzo4WKGpCt9
         6/mQIpWKLS7Ns+s5S4NB76DmVBNIkJOAyBxA0F+cMPiMimruHy+tTrSP1ZVCSEU+zxj8
         I2tvEQr/TpzoAQoHOfXYYx0izw13vUwhf5cyRzp5uJQOk6iOnv8Ld4EUEvwk/16UCttn
         ui9bcEEM9aobtfi4WR6v2CV4a4WfvJcxw3cYDZUaQGYGihOqDrN37Ei2gMejNYXQNTcv
         h0CGyxW+fdMgEv0+3SS0pjAjUvCnvswi/z8yryitql90FSIjsXjFjsotNXSOLjdNfJfr
         Lp9g==
X-Gm-Message-State: AFuF++n5exYHUXbjKt8JvXCIJwi/hc94qBqNh5d9rEvVVF+9EghJrc5P
	/NwPA2/CiocO6R7NWuHYuUy9cBdgwMS45YWqynN/Na1HDy5JqUQ+pZAzLDphV8BaSn0V4HlOtkD
	AYii+lPOHjDhxYMHUJzPs7Hm1IxWDmvaiuk0cNz158z3Uxfpl0QCR9WbcwRSJpxHKdDQA
X-Gm-Gg: AYBFou2ADmAbMxMdRyxTro6Cztf3iGsGX2SJouez7X7UloJEFhzYg7V0++v7Hm4giYR
	IvtpPTUMITNX/AORQPBoAgJl257lyfjt2nuNIwJi/22Zsn7mBfi3irSDwoZhR654xDeHiFEXFsq
	wW9KGgipKWMLkvnWsZEYoiN6mTM8pm36FusK9ulI2ppfvhK3x/l4V5wbYudxCDacG15wOF/LTuc
	qrPSqLuB973JIL3Y9zqrBZXaky/01MmQBpH5OcibcW+swB+28GC+A4bWKq4/Psl/8JiEcPQeHM6
	fSp4DTK4/Wg8fW0pF+E9eWAawGk0vdwSAdIBabcuF9+NjXamiUDKIi4uFvnjZiFaY52/EevRXQL
	FkaLDHcN6OA/lf4kKjcxUTA==
X-Received: by 2002:a05:620a:6f05:b0:939:94c4:b799 with SMTP id af79cd13be357-93bf57bed26mr895927485a.5.1789984158620;
        Mon, 21 Sep 2026 02:49:18 -0700 (PDT)
X-Received: by 2002:a05:620a:6f05:b0:939:94c4:b799 with SMTP id af79cd13be357-93bf57bed26mr895924785a.5.1789984158287;
        Mon, 21 Sep 2026 02:49:18 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a355eb33bsm288228466b.15.2026.09.21.02.49.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 02:49:17 -0700 (PDT)
Message-ID: <36fab4e6-ca34-49a9-a8ec-d2a6607171c4@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 11:49:14 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: sm8150: Use SM8150_CX for the SDHC
 power domain
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sashiko-bot <sashiko-bot@kernel.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>
References: <20260915-dts-qcom-sm8150-sdhc-use-mss-for-pd-index-v2-1-a8610199483d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260915-dts-qcom-sm8150-sdhc-use-mss-for-pd-index-v2-1-a8610199483d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE0MSBTYWx0ZWRfXzZqFNwpAaNzS
 QKuzYnpSreckW7r40f4iUQkOZ3fpe1ZSguF2UXj4Aazh8kR1Rq0jg1+IfXcZm7vReKujThmtiTi
 kjle8ZtKug3HBtDYX5xdOzG3fxa0LWo=
X-Authority-Analysis: v=2.4 cv=AsR7T+9P c=1 sm=1 tr=0 ts=6ab0fd9f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=22wPqFrHPIZlpLYNf30A:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-GUID: 1wHGtOc5KdEdMmEg2FqYIBtofuPKounc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE0MSBTYWx0ZWRfX+ctflfUBdMBI
 46zXb7KTRtoYEVQW8gU+Hyex/mXvZKc1/iH0BN0DiyZurevvPrEyILGvA49XCdzg81hR2Ftkj9E
 ttksJRlWwmbsfeCWNS4cL8ZQYwBF64bwR9uBHbGqQrCv80/brYss7lvz766mF5B5E1fO6zMy3W9
 fOo54zBTNafB1lef2+jILX2M6EKP5LmK0YX/uXshcOKKt0kmUzOrYb+488fK/tz6tVcDlz0VHcJ
 dqsuytHMYRtKiNSdgxf5bVys4FZyxI+dS7kZuCP+J/AaG+Bf6iYA0m6spOj181/AXOxI9Xm3g3H
 Jkm5qBtyhdzbLxaW2JVbACd9hQKbttV9Bs3uj5XEKnF0AmccDDZEm2fKOjTclKbpf3Ba2TMHOF6
 Kl8wGHznmWL1nw+nWh/0eOdLj3D4PM/OI4chSMMKn09LtyCCQVmIFOzJdu/e175Co3F9GyYVN+w
 9FzlgkNRc056FEAalnw==
X-Proofpoint-ORIG-GUID: 1wHGtOc5KdEdMmEg2FqYIBtofuPKounc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 impostorscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210141

On 9/15/26 10:44 AM, Abel Vesa wrote:
> Replace the raw power-domain index of SDHC2 with the SM8150_CX binding
> constant, which is the correct power domain in this case.
> 
> Fixes: 876644c76034 ("arm64: dts: qcom: sm8150: Add support for SDC2")
> Reported-by: sashiko-bot <sashiko-bot@kernel.org>
> Link: https://sashiko.dev/#/patchset/20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com?part=45
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
