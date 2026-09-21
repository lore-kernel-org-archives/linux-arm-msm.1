Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDE46493651
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 12:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789993082; cv=none; b=YZvkbJNcWCtH2WXQ+OLJ+XnmeD70x9gLRaolis1H1dLPOSXjhZphgjZcJsb0zPmHznsp0ujm3pG0tHeGDMm3GHH8pNBV0IXK3VdBUrzYBcnYVYJ5pUiMG4cfvYHZQz9CbZCAFvSZuFsCKuI2ebREHdNPjR2q10vlXOuorKCPMZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789993082; c=relaxed/simple;
	bh=ESkY5FWgQMLmQHwOLxfmFmINRkCIod2d2UPAP7eaJZo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eJt09MUPBE0i+H62WIiPqDY0yjjdzalJxg684E87z8dBHuo7GiBHOXumlOV2otP0A68vCnMVzmyeLC7XuE+jcIypZ+l3yRrMSCdRD5/Mk2YCadGnmxxt1xQdff97fh9AXiECOB33voXBjarGfuQeHhUV7N4n2+Aslxuf76mt/Yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lji2HYAd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e8O9F/FD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lji2HYAd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e8O9F/FD"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LB4skB1130249
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 12:18:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2YNSbtFBhYM3/ttm0CXJWPKRBCFJnEW6PXzhW6IM1Nk=; b=Lji2HYAdkc3DEm1Z
	PQ+lhb98XVPGLSxzKly9KEVrnoyx5FjfBQJbmntN8j5HPHGMK32xkyQFSOOXjnqS
	1MSaYqDOIP2blUU0H04cYbIAZ/ou/Ylg+wHlQp7m7FgTCQsrUKsPQa0LZrP48SRm
	5BrEtPSg/3+7QrFNWjNkJWmGxDQXxjnxCR7HhEmS1R4gnfDG77/eN8/dpEk2Zxuj
	VRaV5RIQn4CXfYpxup7AA/wFbYsnttceFu9mh2sha8NQMWsSu3+PQheaP1ySgx1c
	nRmF8pYrXzx4ehmub8d8ryt26PUC9BtgF5w4ioZhN1ybxVJI8L0TQPuptJCbuUV1
	+R9YMg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu3csg8q7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 12:18:00 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-53002215979so4132411cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 05:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789993079; x=1790597879; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2YNSbtFBhYM3/ttm0CXJWPKRBCFJnEW6PXzhW6IM1Nk=;
        b=e8O9F/FDTfW9eFRBiLIFNm7G+7eGYbg5iu02tfsqs8iaxq5Y8D0epU5bCOBLYd3TW4
         GLb+bmLJvssEH88JirFuds8hXqoTfZATfuunfdKDLHju/6cpXVRCvFm+O9/a3bsc9vWr
         sjF1QgiNLb7KSMRUyH0+I72lR6kuFkSNsXNGUB3OrnMZyZc/qsilNg5b6CnmgG4FGnS7
         timY/J4GCtObHKlGJDNt2xeUfhUDPI7OzR0IWv5XavlSuHds2KTV8I3Q2VlDVBK31lTs
         nTWmAV0kxjJ2KCfPbyHBFtZUn82Snz5x4CY/6mD9Y+E0OUZp6f9A+aPZmeuH0WybFxqh
         fuSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789993079; x=1790597879;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2YNSbtFBhYM3/ttm0CXJWPKRBCFJnEW6PXzhW6IM1Nk=;
        b=w8FEClabJsCe4QhlwHl7+/3RCypDUWybwGOzmJkWVwAWoyqb6nDU3YlX2uIjxbHM3b
         Qkn2gpiwAN3xa74NUQYunGHDh6Io2YUmR/oPAp7i/EXsGx0Zvjr+Qloggx2VBP5feCLk
         guVNIPekOCBFs8FiB3HI8zNfwQl3OxXgtRpS4tYYZpiNZSoL+tSuzVrT2sD3IU2c0+50
         Nbw/VgVJqWc2Xlq6R8NamIvdl5yyt4Y9ZJ2vhvI/4iVJ5yOlSCF6rNUEvjW35oYcuL9z
         VmqvX5gxW4+rhfg4oQA9VUwms/QmsCON0Pr1gek/odMfUD3nwt5PP7DAtH9S1D9WmZd7
         ZlfA==
X-Forwarded-Encrypted: i=1; AKwUvBzO1X0imyve0ZAgU1QQuYK6v3fsQkHSjP0DU80TEjIoyDC4Tj58nP+M3M848PQeaVDoWX1qaAtHN3Lpn85q@vger.kernel.org
X-Gm-Message-State: AFuF++nM8cPrFANEaNowk/gcbV64jTOn4zG6jlDzijaHDdtB0RzbRirt
	PTNfnIseV/MULA8Rja0X5xuP0Ueo/yPiA2FMfGU0s8J1O3u1oLufv0nTwh0p79Cq1ThdxXNltAl
	ukhRXDatTD0oZAnaq0wDz/TXwGn+Oz+8NdZxu4zXzwKnMKTniFvpnho8cf+0hIYxasfCF
X-Gm-Gg: AYBFou3L/bqv3IUtlJGbFbfH5UujkPMiIyVWHGwq/Fbe0vbF6aG8+IEJTkfHcyxNBkm
	i8+XOGvY1Kshvf48KMZEmwFUzeY7e7V4CaHTX0m/GgGOetQBzS62sHm5DcG5/hMKhxFIUBpJvAM
	hZsh6o5KbW0zFt6/3RpXYER6BRRoo/ZQb3pg2ZO+GdLOuGnkPb109jBedvUZwUQq9vGrS17anGu
	nFA/XUdGYGc5UEl/a2zCWRvq+flyB1SG7BIOmJEdn4EwZ1Weu++v4Bf1WipawnXzGQyjLJR92JB
	rY3Wbxg6MKH4JiuTHueI1sgHt885Ccey+/QoO+ytuIcGnDWGh0JA1oo66XQXxxRszWYjC0xv+1X
	o++DHCrWGK6mqlKDAEREkew==
X-Received: by 2002:ac8:5f47:0:b0:532:9b57:14d7 with SMTP id d75a77b69052e-532d8ddbfd7mr3265541cf.2.1789993079005;
        Mon, 21 Sep 2026 05:17:59 -0700 (PDT)
X-Received: by 2002:ac8:5f47:0:b0:532:9b57:14d7 with SMTP id d75a77b69052e-532d8ddbfd7mr3265071cf.2.1789993078428;
        Mon, 21 Sep 2026 05:17:58 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a60761b338sm21061231fa.28.2026.09.21.05.17.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 05:17:57 -0700 (PDT)
Message-ID: <d7c55b3b-53f4-47ea-9dbc-c212c414a694@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 14:17:55 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mailbox: qcom-ipcc: remove stray disable_irq_wake() call
To: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Huang Yiwei <quic_hyiwei@quicinc.com>
Cc: Jassi Brar <jaswinder.singh@linaro.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260916-b4-ipcc_wake_disable_upstream-v1-1-d1b363b5a735@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260916-b4-ipcc_wake_disable_upstream-v1-1-d1b363b5a735@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE3NyBTYWx0ZWRfXwiF4JW3pWgkB
 vfGrGq+HIN6wpenjMliPIYfohMh4GCspHmoC4JxBf3z4BU3pjhrEtfEgAtYlxaGrTRpOd0Hw0MO
 bfBndehzMMQnaNfUom6o/VEmKZI9yfo=
X-Proofpoint-GUID: 6foZ5feMFlygh1_DXhhsZdg2KeB90cem
X-Authority-Analysis: v=2.4 cv=QovLTlyd c=1 sm=1 tr=0 ts=6ab12078 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=qUYU0M5rQdTeglGxE2QA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE3NyBTYWx0ZWRfX2xaaIp7s3m5p
 x/f02CRym1/ySYLRvAibPa1B3sildNSkdgiEIeW6OTyUCZgvKz+JIg0EQQ3tFPzJUTOP0jrbwXe
 qDlB9/WBmK+ihd69qoW3c5+mj8pcPw6svhOxjFWkwk1uScwZUd3P0UzfrEcZ/pLUM3kP+ekFqI8
 lNU1qY/DGCvghpJp2pQMSxJXklGFMFrzkH93FaA+VGiDVGiioPAJJTqihzTxCnKCrvvPcIB8F7+
 6G7BpTZkJK4QDysnT/7/NulDRUJa4v4bCYNa4mzWJmq6X8/tOiHf8gc+S7SlzDWSxAhSgVb/1JU
 vSeZspk5kDD7KEWk5RtA7V8RJgzrMELTINIbeCKqQaXOb9l6VTCRwbbDQ4pJOwEfp8o17cG9muo
 +AdP0AhhD2aMgOHhl6B4TA5nq4JLkcqi/WWmIMsbyZ1lTSX1Jy5Z1AnYi1Oe7fgXWtUqTyM2Bzz
 y9svnv7sMEmIwdPpzGA==
X-Proofpoint-ORIG-GUID: 6foZ5feMFlygh1_DXhhsZdg2KeB90cem
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210177

On 9/16/26 9:31 AM, Anup Vishwakarma wrote:
> Commit afaf2ba5b430 ("mailbox: qcom-ipcc: Support interrupt wake up
> from suspend") replaced enable_irq_wake() with IRQF_NO_SUSPEND on the
> IRQ request, but left the paired disable_irq_wake() in remove()
> behind.
> 
> disable_irq_wake() decrements the IRQ's wake_depth. With no matching
> enable_irq_wake() left to increment it, wake_depth stays at 0 and
> irq_set_irq_wake() reports:
> 
>   WARN(1, "Unbalanced IRQ %d wake disable\n", irq)
> 
> on every unbind. Since there is no enable_irq_wake() to pair it with,
> remove the stray disable_irq_wake() call; IRQF_NO_SUSPEND already
> provides the intended wake behaviour.
> 
> Fixes: afaf2ba5b430 ("mailbox: qcom-ipcc: Support interrupt wake up from suspend")
> Signed-off-by: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
