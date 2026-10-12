Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4932E4A49B2
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 15:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791820547; cv=none; b=a6Q3YWjbXV7YdJlgLRX9F0eTEtAJO16U01GTOMrE+8llcGBd0ABCgOLb66IBGE6A5gj+XbUATfkZq/XA0sEOqOUWDkguHSdpOq7ROibYcUn20xg9Tx34iRR4Mb74vVrz72BnJtziaQzmWpfrVlYEU8+srWvUikU1TmJ/IGQoazs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791820547; c=relaxed/simple;
	bh=BI1gVTJV/UeUd/ne+q5JVpH7YktjFsM6NrVxyhZ5dkI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D31Eo9t/P7b7zcPxkSlEoo7YsBsV4gh/Ji+JIt1YG7sFa1n58SCrED7s46RLTxH1So1WUO1nQVefAt7UzSsXyVlwBKcYGtdVfsUj/v/mDHU2yXYmHWodRON4NhgtJhRzjZ6gqt/pv46OYZGm1XSSDvKBhroEE4Nf15ZwI+IdW7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RmzLCTT+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aL0oBQEK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RmzLCTT+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aL0oBQEK"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CFfUmP2768474
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 15:55:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8+7Su4ClJN+jgCDcp5+vHvDOhB9DFP9bFcl6DaACBic=; b=RmzLCTT+ZQY/pl1i
	GmyEMbJjCaeZCDOvjysCo1g4b1ebpjyEgOC66o10SF8wwV8CA+KpJ8Ldu3mnGUtU
	g3VBIY1hDXJ5uXTKSkbBN8oOSnAF4dzQSU2tItVsGi59vk0LcEuz2EpJs42Ubb/5
	/V/U1RGKmXA2A4yQsCVvGlZk266nFKYdf5j0c1/QRmBBmS/56snKoPNtXWjg9NsB
	sfwBJqPWy9dx/xlUouLwJ5aI8TlY4MJd1Z4mAnaYI5tN9XS8DjqOwu676jSI745Z
	cgf9Pbruz5pzOO8j4nrSonLAlIvpEBw3YYr5HQMDwAYZpjHdLWVXDjGKxbhn7zlX
	1fFapg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8udq2644-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 15:55:44 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91782d0a163so4987036d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 08:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791820543; x=1792425343; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8+7Su4ClJN+jgCDcp5+vHvDOhB9DFP9bFcl6DaACBic=;
        b=aL0oBQEKs8mzaNEqTlwF6ABk3tmOlPcxs+7B9ieAseaSa+eoY917im2xA/a7V0k9yH
         +4ms0usQWiGX6JuDlvOzdxWKxshCPlWZXktiA74AGqqGSg2b9xzI9RdrApy3lReyOfsQ
         j/p2EqR7nKBYg2TNeHY/rr+JGC48gBIodDTbPE13sfKHpQCgu/uLjc0RxY+pheBfOczV
         FZCDHnWjEWa7nAGx7jSHWBIl6k8YWproger224fMbA3uM6w9Vx9zgR5sXzJDCwupHVyL
         /gVZA6kv3pWtdrKXIKDqaElf8eo363Dl+kCgqppMbbvIVclGDB3ERpbCiwoxaae4A2X+
         dMqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791820543; x=1792425343;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8+7Su4ClJN+jgCDcp5+vHvDOhB9DFP9bFcl6DaACBic=;
        b=XsBbdxzKUWMGsTpJx4Ux4wM+lVQ3Ctb41UQ0GMVUvAXJrYWWc8pyPQymMxfcMawLTp
         VRVfo8LnLmxPX9yisOqco8q5+zvfV3DRDuC0AFDIRjiIaymQqDshFiWuJd8Z9n4+gDuY
         BvhvTJ8GXYgdwbYyKhFhOWe0PIDyS3pHDAiuRuGUWIwHUtlG7TsEMeFuwAYluYiv/V5c
         2wk2EjIMRf/K4cBCFzVdfpLnag8bnghXNRSPLZxq+ZiJmF5DUlFRM/5760Z5Om9dhYbi
         F7puAfRosDtzpJs8E6X3ONl2TmFUQJfMsuvbmUO5N2Pt6JUxH0ziqYHJzPp+2T1CE6GO
         o05w==
X-Gm-Message-State: AFq9FYI9Y7iXuJox0Apy830bJh0UYjKzOB9HiAXd/HX8D8d5V2j44DgJ
	6ouFe0ZX2+qbC7IcIO7uE+WLXgE+73nO5KDvnsE6LPrOvunPXZACpsTqC++ql7GlnAgztVmySRQ
	eSH48x9la8o1RRaEmLFF6MyfacsRtMRf50zxbNaJ8eQxTxLTIcxG6UDGFpzbc5pnjxDf/
X-Gm-Gg: AYBFou3x34WmmVl7ox8tyJMsHYnEzi1E+eq+8CSy9+YEYk7oVBIlz6WXrsenP9mnMFv
	4w8Skxle6T8iOprH0vuVPY+lwhn3C3Zp78TZCsTvU6vUi9L0vNc//7NWmOocQXa+hnuRNjEzJ/R
	DKttv4BiLU5HM8TY2jR2Iid2JYE/gyd4rOpF76KHFTdFPA7fI+kVO6coBdcxsN8b9qD+LcdH+H0
	/HYx1gUpdpbgYfbXWfn0u+PEoPpPo5YqySYWH4lajhf3dpBk2hOOcRheIkl/jciEChwttTollKe
	05XFdJ/1fg5IUEm/l0Z0vQM68HnF4ST1t0BVlm1LSzaWDNr5GOfco98oYfp5LHsl7XnVZZ83+/C
	WG0R60/Id0UxtDvIFuqvm+Q==
X-Received: by 2002:a05:620a:1a10:b0:93c:c96c:a5b4 with SMTP id af79cd13be357-93ebd23a4f6mr1877789385a.4.1791820543519;
        Mon, 12 Oct 2026 08:55:43 -0700 (PDT)
X-Received: by 2002:a05:620a:1a10:b0:93c:c96c:a5b4 with SMTP id af79cd13be357-93ebd23a4f6mr1877785885a.4.1791820543068;
        Mon, 12 Oct 2026 08:55:43 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9a68c08sm474614766b.31.2026.10.12.08.55.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 08:55:42 -0700 (PDT)
Message-ID: <fd40f44e-8cf1-4c29-837d-85967fc6d1e4@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 17:55:40 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] soc: qcom: rpmh-rsc: Update CMD_MSGID_LEN to 4 bytes
 for read request
To: Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
References: <20261007-rsc_read-v3-1-7501c014fb37@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261007-rsc_read-v3-1-7501c014fb37@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=evJKXYpX c=1 sm=1 tr=0 ts=6acd0300 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=pP68ExRZSLElUsFVznMA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA2MyBTYWx0ZWRfX3sVe5vwAullD
 QkqoP8QgHrSz+5k2EzaPfh/ircNWa53uyvcnjkrXsf6+efuk4CcaMaJChIWibYjP1aLuNBq7Y7+
 r/xvaViwjLtTH7H0el5an0OoY6l1PcI=
X-Proofpoint-GUID: 3KeOQkBxYcIUm3KUo8M68ybemdT5ymQ0
X-Proofpoint-ORIG-GUID: 3KeOQkBxYcIUm3KUo8M68ybemdT5ymQ0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA2MyBTYWx0ZWRfX+zEP8PdW03sh
 HMSWBGGyvqXjfEUi77GqHkTToQ/UCTdhIKp1fcnZdJg5HsUyyyxME8BX65hf1+X9KTi+iusw4W2
 8fQwdDo/oG/gpKZKjpwdpATDbxP/jaRfnLbys0KK9CtPXAZl9MxxK/LmiePax+Bp9QL7Wprpi/V
 /JY62nglS6QWRzXw00+qdNEergvWlO9oxXqWbnhIu8+UIyrLgYMuRtX8+vwcmkJPizrQ0wUwGUj
 RUkUjDHiKABdecIgUauyESzWxuxgq4+ksgW1SDjh0wBvhq2SZ7krdHcc6a7h+kEWX1hN/b6ba1H
 lLKLoHIi3KNrucC2jnzR/zdbCRrJU25UaN5O54nyMhkhp2mCtSeD8SBhqt7+Sg98ZWdI0NZIY6e
 KPCNC/hA4yaZJ68LCzSfJig/S1QMkZ+4gtib0987d4ImIFK0HakzR4xObBfQj0RAWgf+4cqMQ8C
 NoZX/VtDVFxCbxMKB0g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_05,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0
 phishscore=0 adultscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120063

On 10/7/26 12:05 PM, Maulik Shah wrote:
> Newer SoC like hawi with RSC version v4.5 support 4 byte message read
> request instead of default 8 byte on older SoCs. The write request
> continues to be 8 bytes.
> 
> The CMD_MSGID_LEN field is [3:0] bits. Describe the length bits as a
> GENMASK() and use FIELD_PREP() when programming 4-byte or 8-byte message
> length.
> 
> Tested-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com> #Hawi
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
