Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 016DB30C168
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 08:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787648105; cv=none; b=Wllkll+x3QRTuExiNaRLKyUDqWbCB6oiPkd+KAL8HvLvCll6iTS7x/8O4rC1WX6OUICoqqDXt9LG0EBTItW5rGA3shRWskHIdHIxv1PddInop0OQ6vJQHamIrwKHv0fWaPL9M25snVRbkxvuG4RMmgd4JiHJjGU8VB/8tXiynjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787648105; c=relaxed/simple;
	bh=RfWC2h198SzMHh78bSbhzMXS8oWI/cEyMgWYs1lcpBk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=apT3njhtLS4Rp9RbyV/i1caF4Te1orK1c22QXbbEezH/VUXEO34A1+IJ2RF6b8tU/bvS+0tqtn0QJv4PtwU5QJi/mQ7mZAFx5efE2hcgH0VOlZC91Ki7bd/1WqRasY4RYP1Kf4ur/Zo7QF/V1Mbk8sODeFn5TPlSHsiHbBCaNiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DVN/BwK9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ThiJGve7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DVN/BwK9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ThiJGve7"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67P88FhM1376195
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 08:55:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Wr3sDhheOlgkwCnib0I8dD1VSRrr0zHDqmtz1axNo0w=; b=DVN/BwK9d8AhUlL8
	u6XoGwem5m1k0WApnIqh6Eui5hyGvRgwXV0wYDwieZViqW5S2Zw09EEKmu6Dsz0a
	SRQtNMPMN4qBfPFzaVEEXfeCnfpHj/y8fhAgh9Lbi1lgzZA/PHvOrGrlW1tFAkY4
	Al+G2MEqauPqDrFzdd6BAI6oP8iwP/RpwknCktNIy2ZWuNGDEyb34bKcUtzeXKFN
	Fg2WIkaMeIjn9KnWDGfJrUZ7MA8rg6yxD1CAkQv+1LRug7wXiYgLerwUZj+2+n2V
	hB6dOMbuRazjMV+zprtBtm6PbK1PwoyoY7ctvIidQPGRlewgNgLz2MHEU1Ho/W9v
	ig4Hxg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g96abrff3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 08:55:02 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-90a80332521so9742446d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 01:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787648102; x=1788252902; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wr3sDhheOlgkwCnib0I8dD1VSRrr0zHDqmtz1axNo0w=;
        b=ThiJGve7JlFIgGWwEHe10pbEYxXK8Wl0E4pLWv7uh526zmEUQBOkWQoJ9rSajgN0eT
         Giifv84iWZ3b3vB+LjXlmNljnWMogF6o1zf/5vc/K3QGxitBbJR7E9qBsBO11cJOrb33
         Vgqow1ljQUOu+AEgBYR6g8DSB/kKvXI20CL8KJvpVzWSPeez3Y7qca/8s7vAA/ECQqd1
         2ZBbnhwkhFZpx9ZDWvRg8Le1LPBJc6zeZiCC/AfwB1T8yr0DkVwB5h9qw4FR1JBiuGc6
         hyoQXG59widp2GccKsg0qMJdduTgt26ehFe6pQeRa2au7QGW8IhwgzrKtQpgLovxVuk7
         cBMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787648102; x=1788252902;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wr3sDhheOlgkwCnib0I8dD1VSRrr0zHDqmtz1axNo0w=;
        b=Gb2jqhJNKk1SVQ5Bixn3ipzCt3+jMC39g8RtwQ4/l9hS9y8eKSbhMEzIo9Qzk6fdES
         0VjoKN14EQTvoR9Dqo6hD7s67Av1nx20SHDsXv+Fd/mFRooj7WjL6xhqWS4nN14WuQca
         w3jqhrr0kxd6U6laxmg6kvB9nJCdaJQT/FV6VGD4wr5Alw1Pi+hc4CWXR4u90abR8nvh
         2QP37V9b8KGje3FFwKlKUv4BJiYf49A6W7CDay57rkdhmlNALdT5+LTChMHGDs+J1jAt
         +ph4+PgDshKADdcWUiq+3L/jgtAOOkA8y6yAXw17/Cme9QYzAkVPsDNVKjM/ZDda+gt/
         F4Gg==
X-Gm-Message-State: AFuF++lp33i4mSqArMwwti8t0nxhCdMWJ2SHojHpCuYlSa+amtK3Dt49
	ZMry1Xe8IhBi00OANeliop+oeLzKvYDK3ZuQe4lMlePYUBzYZLPcyRR15dINpZpnrhILJwgmky5
	t1iTcp6YkvajEgk+lDcCcCT2M5p7iOCowx4GvnRQiEFCCFrE3xo1S1Lxy1Ex+tepxwnlv
X-Gm-Gg: AR+sD12SglCVtSENB1PHBmgMIlOE/KsAL0JPCgwmL22BTDjW24fXd7yJnlGnWR4FJO/
	2/JJggpwsQuy0Vvr/trC9/OGm+3M7KtD5PC++Dj/TIOgv5nX54CuVzKKOBv2z/OAxZ5f0ov+i2R
	n/yircV2B07hageLfKzqtm7jJaLA5wM8xhbUGHYbwpsVkiMzrs95QKkz5T6qDdd3jHHgpbCguOv
	9l6o0Ltsu0QFrQVpvJ7XVWDmsOVJH9KsNm30tz58+LX9soYM2HeKrd/82SAV1q7vMhw1gKYRSDL
	9/EeRPT02uJmxSALmKGNBqrGUPR9Z9FDpOxQkvPWIVQuUwvZjUYeEzlm3babqW4FjBD7wzAAZ3Q
	2WyxlRhvwju1s68r0z9vgjJSA
X-Received: by 2002:a05:620a:1790:b0:936:2f59:dfe4 with SMTP id af79cd13be357-937392b8125mr2182945585a.0.1787648102005;
        Tue, 25 Aug 2026 01:55:02 -0700 (PDT)
X-Received: by 2002:a05:620a:1790:b0:936:2f59:dfe4 with SMTP id af79cd13be357-937392b8125mr2182943385a.0.1787648101597;
        Tue, 25 Aug 2026 01:55:01 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2496738e8bsm1606744466b.44.2026.08.25.01.54.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 01:55:00 -0700 (PDT)
Message-ID: <d3d075ac-598a-4b79-8d59-556657edb23b@oss.qualcomm.com>
Date: Tue, 25 Aug 2026 10:54:58 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] phy: qcom: snps-femto-v2: Move PHY init registers to
 config tables
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260824-phy-v1-0-257d68a3210b@oss.qualcomm.com>
 <20260824-phy-v1-4-257d68a3210b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260824-phy-v1-4-257d68a3210b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDA3NSBTYWx0ZWRfX6BdhaVVqoSk4
 Oy7esjhUoSwtBJ+tJgy2wbR81P9ahrn7sLdgIEyiUgQpOQhxWfO/G+BpuMYrYeuuB+oPKUg6pDf
 aQuOvIeLrHJSIHpHlzplAN9KWl8DPilHnYAorNBkymzYxnf3H49S7U+UzfaoobcPVdXVC7haK+J
 5MrmLDEqFJCufFYgwey48QUiXrbLEQR3INKZHNbO1nFWKoOjpn0eCxjZqNgyDWzD+/ixxynd9lK
 dEiSS4yk45ZM86IhwfbRb8qUMlnLef5wwgbXy/ztJAfCW7VZ8Jz+Alq85n8ihYNdt3eDdGIfBj1
 cHrFz/SYxJr8ZDCCn/dnmKY8vs5CwuNiNXAQjDHDYKeMLyY3llTcW66OaehpEaXiHfHV+mIGhBa
 uUw9ruOFRUaHLMMNWHzH/mkYyyEvfAW67kVg8xwsvwbQv03LcQHzgcmwoFpKExmvKRmVnUDCRCX
 OwGCmegPuuL590xdaDQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDA3NSBTYWx0ZWRfX8z6eG5E+DO7C
 a4fWNiBqe+qt57adhAOBTKekYCwBlFjE2EuhdlplrAjfJ6LjDQSgh1LhBdtTbb28OD9njvb6eYL
 Bbp0O8icXMCtz4n+awekzxM/VacC6vI=
X-Proofpoint-GUID: GyRCF4Y7PJYgknxEijFJFGwRezEGzYOU
X-Proofpoint-ORIG-GUID: GyRCF4Y7PJYgknxEijFJFGwRezEGzYOU
X-Authority-Analysis: v=2.4 cv=SaHHsPRu c=1 sm=1 tr=0 ts=6a8d5866 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=i2kGgbFhGYZGOrntVjUA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_02,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 malwarescore=0 suspectscore=0 spamscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608250075

On 8/24/26 8:37 AM, Varadarajan Narayanan wrote:
> The driver currently programs the common PHY register sequence directly in
> qcom_snps_hsphy_init(), with the fixed register writes split around the
> override parameter handling. This makes it hard to support SoCs that need a
> different sequence or different values.
> 
> Move the fixed pre- and post-override register programming into per-
> compatible configuration tables, and keep the 7 nm override parameters in
> the same match-data structure. This allows the driver to share the common
> sequence while adding SoC-specific sequences for future platforms such as
> IPQ9650.
> 
> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> ---

[...]

> +	for (tmp = data->pre; tmp->offset != UINT_MAX; tmp++)

"pre"/"post" alone are not descriptive - perhaps pre_tuning/post_tuning?
Or do we maybe know whether the order matters at all?
> +		qcom_snps_hsphy_write_mask(hsphy->base, tmp->offset, tmp->mask, tmp->val);

Custom termination is both error-prone and memory-inefficient, add
another int to size the arrays

Konrad
