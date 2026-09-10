Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 676183515D6
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 09:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789031663; cv=none; b=my5w5UgsZQFiN2ypgYJkyOF/ssSKoPtvf3+4qeaRzc7ez+HHe8BCLWFIaU3TjiCb80ViEv9N/r1MNSCFxUcCLu7IjPLtH2i1/FFYGPlynyjjGmai8yEQHEbqpOM3ZGk2KUWnFENAaimr6+GraCIj0imy3SEYVkSK4la/VT3xYVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789031663; c=relaxed/simple;
	bh=uz3+dbHiRpA4SmEev1MoA+xkH76vDdpFXNkBjQmuEXE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b/VX31/UMl93Ve7tpa4H4SMS1gmUN9iqe3ocgsEEBK56qULsu0vzj5rCYBJLWJ9YtxEP67ARbCbPg1HNqz6s5mhOPOZdkXHNvrJUHgudtThrySGFKH18z5U3zyKm6hnQQGObcfLuQ3e8c7VpN3UiSeVMQ5CkaPU9cSQexuOQKBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dtF8thMf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RKXm4gDX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dtF8thMf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RKXm4gDX"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A8pgUH1589416
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 09:14:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x29jloLgP0YelbdO7EGD9HU/Hh+3V7Mt9Ty36rmYRQ0=; b=dtF8thMfsxOo25GX
	v8S5lXXxFqcDX1IckYrs6H/kb/uOc91obpg2m2ybUA0NC1zNUV5jQ8WyN0nRqDjF
	2+Kxlb/J3DjRzzeBxxA8vHR9UhTzW+YfWG6ZOR3oAHhOU8jDkA9KblWF7JfUDm3H
	ysG67AyX0iKt+JD1MtFgxMZ1FrUX/ub+ktq68Q8ZEpbXzWWXGCOE1ljAuPH3+8Uq
	aZS5xpPnAGMnXUHBstfKZ36JAXh7Mz72onjttNTk9+WDHSB4c+K9WDjaUMikgapn
	DgVwCDdt1T4nKgE42leVflmzbG5knlzyxosf5zcR+vPWlw4yOB+bqGY+YyRefdsO
	c/v8AA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcyhb11s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 09:14:17 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93495488976so91951285a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 02:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789031656; x=1789636456; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x29jloLgP0YelbdO7EGD9HU/Hh+3V7Mt9Ty36rmYRQ0=;
        b=RKXm4gDXqYXkdQoxBbu/YjiBuzjweTSYITwMcIuUk+8wS16miZ6bIV4l+SycfGwKbi
         aA3EyC1pc5PfHShUqyuwt6lSzRef7tNM9zB9C5W0NdH1Le7ISGhUosNip6+rasQwdcmd
         yKzXHgbJCIBB/pY4ulvJ5mwCzlTxeZpMamO1K3SzKB/R9IyrMnI4qsTtT3pyrjKW60HT
         /iGFZWAvEb1xVUHQ+1hvmhJ+n9dodvhZrW2KZMnK2njbOWHogV7wipQhsKkz/t5DHww/
         k2AoOUBOxICCKpnTJnAS0t3Dl15HtgAut1qd1RUg3vVdu5IY9kl5Ja+KmLdtc+1N4K8c
         El+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789031656; x=1789636456;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x29jloLgP0YelbdO7EGD9HU/Hh+3V7Mt9Ty36rmYRQ0=;
        b=CvrfpK70KXrF/8CTf4NKQ54Czko2H7wdQyMJSd6WXqVz9j6iBU+3qLwD1QExjW98h8
         BqteLWplirxKxcM1cO3StQueMNYsleKq2f0j/pO4TKUZbRW2u79OfShc5qFs3yYHSOYF
         bzfZX2S3SLdbaxR0Rx3p3Zw1Oyhkh237F+bgCy2BeSTYpVb1SeDjGAPhWB2v1DltIj77
         GFmq/5WMpYvDdO/PcwEYDbCjrpF+9U9bmQINEetsgrnzP065NUbrz4TxwUyhyCzEls6G
         et1xZ68njepnKZpTtii1RDs6nG2jBx4hcCrLqdAX9ZWnb1Vqr1ijS+UHlY/L2xJRMWHY
         I54Q==
X-Gm-Message-State: AFuF++nKlNtj4ETK6vB6CbiWAi7T+/qL8ltbGyTYv8qnw4tC/G0CXPb7
	gxPNxzkM4VyrVcgF92ubvWmGVIT958hBylREumzIZzuiqnkQSWYkSHK8+UWS3WnU22dZN73r2Oa
	lIxbNUXAR6izy4bhGdvUSZ75qnI5sGa4mKWGdMATRvziYSthRkPOg59thwdhJHTWyhngo
X-Gm-Gg: AYBFou0bb887PAxdKGcZl1dBKNoTNvRIM0+wvmxtGdYISIFModp+tMZfYqapnzch5OE
	KMDW/65SSJWlh73WrcGzolvjnoGI7a0iG7aGJvByw7XLjWJG032U/wXwPcKfvI/OYKzJZX0mSZe
	RkOzKqypPyxHELVfYjg+X9nHkSIJtgWgVHYVMWLi5shc4hqoAdcWXYfz0RLA1wMqGCNOjYiCDgR
	OCuEbwkLDIzlvH6j5M6UpNBUBCeAV5UoZjYhEWYsRtm5gs+6hoarKJYE2vJ9eU1doRCv9UVhquB
	4cdXzonpNmo784hpEcpnc9FjScW6jQLB+yVFjrTtjDQTyUBaN1aCNe0JFn4dJVba9qVVftLdK0G
	vBeI62UzmVcN4B9DG/TNlyA==
X-Received: by 2002:a05:620a:628e:b0:939:8b89:5076 with SMTP id af79cd13be357-939916c18a0mr3169528185a.1.1789031656187;
        Thu, 10 Sep 2026 02:14:16 -0700 (PDT)
X-Received: by 2002:a05:620a:628e:b0:939:8b89:5076 with SMTP id af79cd13be357-939916c18a0mr3169493985a.1.1789031650989;
        Thu, 10 Sep 2026 02:14:10 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c292c14c6a8sm254863366b.47.2026.09.10.02.14.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 02:14:10 -0700 (PDT)
Message-ID: <3058d570-aeb9-4f73-831c-c30626296006@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 11:14:08 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] soc: qcom: rpmh-rsc: Skip read requests on
 unsupported platforms
To: Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260910-rsc_read-v1-0-c9b7fa3cdde2@oss.qualcomm.com>
 <20260910-rsc_read-v1-2-c9b7fa3cdde2@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260910-rsc_read-v1-2-c9b7fa3cdde2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDEwMyBTYWx0ZWRfX2h8hNfALJWe/
 zO+8sdoVhtwYn42G+jRLIG4Xux0prr8TjNxLOr6cmkJh9rxN1l5uwMf7/QeS4QAwEB4hPWchlGx
 kR3Uw/6hU7TzKiiu4DgzY84d5KKPsgCgprM6qGlqJqNPWqW5qzG6rq4XvShev2TCUsUqEGT5soX
 VR9pSKD1TvfbNduUeqzevqECduUoC0etXoa/I9QlJvvCaMktQLmI+0s5ecdVo2FO3uNTaBwtobL
 9k8qtbKKkPhvdAi8l0CFbZeZAd2UTzYtfkdb+pm7P5NTkP+52lWJBV7xDtixi5xAu2lg4FB+Brc
 zq2Yrb3curV3bqxtBdaeGfwhn7ea9Jpw2g7dbcIj/LaRkAtpxZggANdi6FcOcWi0K5UG780S8iW
 wycPwnQ0gbklLZ6L1pOC19o7OhK/6y6esX6HQe4oRrrXOwyYxWoUgedNI+ekfDKx1rWjo7V0z8/
 NhV+mRZJaCIJOZSWigQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDEwMyBTYWx0ZWRfX53xd9FyMkpdy
 pgrd62+5Eo7OG0hWUpZL0i+oEneQ2LBaMRzTk791voPMF055SwZU6WeNJXyacnazTdllSHd8klt
 ztci6aAk9ENFb3Mj/zoeAwkOlrPy+gk=
X-Authority-Analysis: v=2.4 cv=YKgKWhGx c=1 sm=1 tr=0 ts=6aa274e9 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Md1K26T8aKPzGtA5o4IA:9 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: vi44Q1QRJ5ezZq9BDBMLUxTTgNQcNaaJ
X-Proofpoint-GUID: vi44Q1QRJ5ezZq9BDBMLUxTTgNQcNaaJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 adultscore=0 malwarescore=0
 phishscore=0 impostorscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100103

On 9/10/26 10:53 AM, Maulik Shah wrote:
> On some platforms AOSS do not respond to read requests. Read request in
> such cases will consume the ACTIVE TCS but forever waits for a response
> blocking the subsequent write requests.
> 
> Skip issuing read commands on sm8150 and sc8180x platforms. For such
> platforms return success to the caller with the resource level at zero
> to avoid the caller taking any action on error code.

FWIW, *some* reads (e.g. RPMH_REGULATOR_REG_ENABLE) seem to work on 8180:

https://lore.kernel.org/linux-arm-msm/14bb6196-8274-4c94-922e-4ec8e2d7f2e5@oss.qualcomm.com/

Konrad
