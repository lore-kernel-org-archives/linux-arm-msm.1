Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDE363DD866
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Sep 2026 06:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788418134; cv=none; b=ESH4Tj+hMC0jFj3q6be29YOCkFviuLWTM76ZMz3qTpe7ABYvhZ4vZyLQRVsw5+eJS3Fj5N4arlgJrWLv/Wyruj5gYXEQ0BbLe0H30gVsqUzEpQsRTUe1GjR/sXuOFw9neBCGDsXnYJOLDE+ivcNIsJj8BYzg/XGV0jZKCi6VWbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788418134; c=relaxed/simple;
	bh=VNg4Ml8WWrvjIJn2pMNElqo92O0nPPWlpnfUKt/mm3w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GwCJnMqPdh5+BOw6mY3aRgpOdQQ3P6emXm2UcyV8p/W01MS4YoWFOYnMJNVTrM82fucGflCxjpIGBxDyhUvocTghw2aqZ4trGRdIPgBWFHB9H2zEVEIxKtbyTiHe4qE3hJ4LKI3Q1eFlqVnX5ofEkH828q0QBA11rplVmbF/3Mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n2b98CLg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W5+Cii4t; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n2b98CLg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W5+Cii4t"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6835lTMX3749489
	for <linux-arm-msm@vger.kernel.org>; Thu, 3 Sep 2026 06:48:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NwE31ft6yiaBuMlS/fTv2nwYnl2HCWr9J2+PUKcNDL4=; b=n2b98CLg44J4KFtl
	Y0YfDBPuuhbPYX1R01CIULWMyK0UKLNd9NajiVai7QI/teJR3osEZ2j7HC5gAkyL
	WsveES8X2Myq507WFEk9GS958U3Q7k7opfxJ5gcAgGhmoCHg8K9NViO2C7NVIbhv
	mN8mp/e7/vqevkFGqGIMP/4s6Oj/WHt2ncqp8zBUH0KaHcvazRZVo7PRaPn7Bio4
	fO+89s35tJqnvajZJGJj4RJZ4+Hc6wfajWhBhtDdolYIGwH7s+CxgS/G7raXkAuy
	4u/FLf19HAC7dFEg+rtEddKfg09R0Em4xPutClxPWdTf93StOzWXh01Wd3+4a/kC
	HaGuCA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gepv5u98n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 06:48:51 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52ff0dbeaabso2179731cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2026 23:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788418131; x=1789022931; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NwE31ft6yiaBuMlS/fTv2nwYnl2HCWr9J2+PUKcNDL4=;
        b=W5+Cii4tjPr6okgSHRcQo3TtXo8ao2ztCU8NisXDsCZXvSsRUrnb3FAxwad2+n/nxy
         uVReHTeSCc4gD4hWFmvbJ+RmPzCI63eLex/iYf+AJHdhNUB5q6EsXWzfo6TiUq3xKbdj
         HFskGjXLX4e0nHuNzaEJefUswtXpDK/kaLFGFG5F+O7kfcXLfHDtzZ8IFYkkJBpTvEOy
         1cm5G5VELlb2WCkjfzxEaXvl07GsEuUhUHvIY8HxwQMxk2g6Mb+KBJ1QM12MBk/6IeCn
         aBVbKqzHxhQ+rlqevd2BUFPYrXKh3CQjvLNsCyADyzHawuo2IjDlO15mnOEN6D2pyUli
         N3SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788418131; x=1789022931;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NwE31ft6yiaBuMlS/fTv2nwYnl2HCWr9J2+PUKcNDL4=;
        b=OESA8uV6fvYYt77gIxcYnmpFIOFZEga5qM1SsavXCdCjIOgCG8A6IKnr/fv72O+rwb
         3KcGrPVCLzYbMd+HY6VSkqkOZfv67QVxnQsPxGqvUQj2BW4MSa0vYSx0VkDwZHjHPd2a
         bL10xoZIb6ciIKrGZPDCSwXvbxnOAEzaX1W1VMbr3rZyB/a/4MCIBcRdJQky6BIyhrgP
         XTpbtcPQfUh6o3zFk8ahlDg807bRnCmzpSVdfl/jDwN4FOWqfXJQDPFZO0xAm47hENTm
         lFCx9d8wMrl/DNPVW0TsjyiNCQ3G9S8piq2KDUbdQPnOfNO/tI8uVHO4Gd3gYMMaOWNb
         Lbhg==
X-Forwarded-Encrypted: i=1; AKwUvBxkLzhJkeMYj0bBbXnu5I/+FtULo2kNWwjfTj6Y2nH+yQ2yzY5BDu2PSGNnWos5Nek1aKsA+vDn9gorZFmK@vger.kernel.org
X-Gm-Message-State: AFuF++l0vX1Q5R8pGtTaNG4TOEOKKwvensraSet+Re4mJW/r81SbYtcK
	zxKrq/YhBsQrytL2/veWhT9swtaF2KYrFZDPvO1ZGHe/Z3SJ2Rd+mIJVkpYdcbFjWbFjC2da8qH
	xPSHWHYwtSctGpH7e/qeoowvJBeKnxxp1ipOEAECaTDswrtAjIu147GOC40cN4Iyt9TU4
X-Gm-Gg: AYBFou3mYdrQvWzVcI4XRFKuC5WpcwysdxYc+b+XwATxU4DamRoNMOhVvRaoQmGA328
	sPde2cbUGYAPdE5amTlw41ni3TTfxTAvyUHrPxrH0CPsYicpdIjND/wVYLOiphe48wHb48kGFrF
	d4soNvZO39+zcXDyw+gEmIW9YxAcVtjqfW/EeG0aMFXaQbO0LCUE6Gb434cWOjjhVwqZT9Mj4mQ
	3/NDB2kIcOVT20FhU4wWqjDsD36aNFP7uSD0qiZ35xLQJH31Z3qAZ4T+2WzpDWXS2pDDaW0H8gv
	fVZnX487Byv1l8fE5cfU/6cGFyFu1yu4THTjsPggd3Yv+XdGXEHKZy0bQtWI9McO0JkXpp3cAL0
	SC4n09QvpBlPJJ3QMDv9tyg==
X-Received: by 2002:ac8:570d:0:b0:51b:ff78:f229 with SMTP id d75a77b69052e-53036d47004mr82359921cf.5.1788418127618;
        Wed, 02 Sep 2026 23:48:47 -0700 (PDT)
X-Received: by 2002:ac8:570d:0:b0:51b:ff78:f229 with SMTP id d75a77b69052e-53036d47004mr82357281cf.5.1788418122392;
        Wed, 02 Sep 2026 23:48:42 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a67f9432b6sm1838033a12.24.2026.09.02.23.48.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 23:48:41 -0700 (PDT)
Message-ID: <30b0ab70-b4d6-49d1-83f3-f53dde24f817@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 08:48:39 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: qcom: ubwcg: Add Nord UBWC config
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Gourav Kumar <gouravk@qti.qualcomm.com>
References: <20260903014309.314962-1-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260903014309.314962-1-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=T8y8ifKQ c=1 sm=1 tr=0 ts=6a991853 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=Ka2OnlH1bFlmAtb8fSYA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: 439iv17IBYfgdmrxeQ-Um6HhcxfRjg54
X-Proofpoint-ORIG-GUID: 439iv17IBYfgdmrxeQ-Um6HhcxfRjg54
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA1OSBTYWx0ZWRfXz/8nF6XZ8HAo
 AiIqdRt9zR/IFznZtEReChINyMUyxmkIhl4zRDdEfJC00sYkmq8ZITA5XA/kkw4rs5CUPnNVBsv
 DXDjNV1uocicJosB2ChHZ7KIm3DwfIyhCFLmXBSSkgJhjJG+PFfagVb0wyZTvZuNz/4Owe07TNf
 LXNqcGt0YqMnwJFHOubLZn1/6/PemS4zmGoYzayM8biRu6L4s1juddS4B3o2TeOKMlup56kS8Xw
 9Iu1vhY0xkw23U0SAFa4TmX5BVm3TmzPKsnWjFDyHIQzt+St8xgd1qlOlh+c1XvvCpErFZon7fb
 10kfrxVZ3SAtQgViIcyjr5/N39m2kyVrDx0P2KfYqQSLa89LlHA6MMVevMEG2fY8CYeHoOhiD/T
 ME8/hKVPGSBJaeCNEW4FRc59e18e1/dzoRVtTYIWnY4fcnLMQrwo7vuVOxdIhLYtHT7xmwQ9nWC
 xduorXg+7/hwqtkNlgg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA1OSBTYWx0ZWRfX/fn83OkpuvrF
 SEg8C0OxwaS5mMQ4fhLHL+hxZesOBpyGl452RgOlwNmkE0R2o6Fvndb8B1ttWE1f+XR4a9sffTE
 4jIZzyOFS8b9XY1HwmX8f9FSiraYV+M=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 adultscore=0 spamscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609030059

On 9/3/26 3:43 AM, Shawn Guo wrote:
> From: Gourav Kumar <gouravk@qti.qualcomm.com>
> 
> Map qcom,nord to glymur_data in qcom_ubwc_configs[], since Nord shares
> Glymur's UBWC capabilities.
> 
> Signed-off-by: Gourav Kumar <gouravk@qti.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

