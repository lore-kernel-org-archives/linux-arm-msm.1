Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1D223B6BFA
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 08:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784537571; cv=none; b=Zj7GZhC7o5ExzsDJV2kIp3Drd89UZNkg6oPcj539oaG6gREzsJSbiwYSRL/yxnfYPbeOPCGGAjqrni0zPpoKWH8Y49VWn9QO7NAt52MsBcCjvhDffugmRDEKEb1u1dg0v4SrTyhlCyISD+a1KwaCGoWTFEv49NzYVeW+abgywfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784537571; c=relaxed/simple;
	bh=vd1FkcixEWgKJFb8Do06MPkpUlB5ON6+iKKTYabxPpo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oKf/QYGHCBIxqb+6M05/YoLRmB9CPO4RewcxNpGgO3FK3/HFT5OjZk1Gud+sYZYgH22suUCqd5hofXgd72koHqf6GlICZE+1dGqFIUdPhuBFbZC/Wa61xTkfud7sq4JeY2joobc7Ahauh3GcHgcMuTC+yH1vbuYNS3a65T70OSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SUf5XUT1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VsKFd/q4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SUf5XUT1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VsKFd/q4"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66K8n7Eo1858441
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 08:52:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	khrEdLV5wYHeiPqKWkgPxtADj2ISUrxQNr9hY3PFgd4=; b=SUf5XUT1+BVq7AjA
	t21+n/XreHUfj15ueWtKwTsL3BEOcKaTa0eE+/5TxSU3j2JkbSk4tqA/Nzbwrux0
	YwOGkfmTlWkIl/drBL+BhkcDBcsBqaGC1jmaX2lO2oo0cd/B24Ywo+eY6uH05V7v
	AoBkYkHINtjFEr8ux5L+26NJyvdmiZOnXyUt7ngo3Q4xlcYhNo+PBH7e6WI2/uj8
	SBwxe//R9URZx657aCii46TpEXERqKEDdFzXQ9rsZFD8pehsH7hqFsTAqHOOviD+
	NjomqMbYiKeoPoSUmLzYFbBXomt+2IcQXnCt6LzyiH9ediIwumDJJwAuFhZRMQm0
	hrCFfw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhggg80jd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 08:52:48 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8ebb599e528so22697716d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 01:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784537568; x=1785142368; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=khrEdLV5wYHeiPqKWkgPxtADj2ISUrxQNr9hY3PFgd4=;
        b=VsKFd/q4Vy+PdhEysBL1ArJdwvYiRlMBsKmDCwCfKN+tR5XH9UkQR8Q3YyWgiKpVxC
         NcEHpsr0c3Nzv7cZUUtMbQWDKNfUYiqVFgnoasW0vIzGtHKx8j8zhC7sSFZWD42o4izL
         hbTIlBhfgV0YW4apgmgyfOz7O3JOiDq2saHW48/XgFDRayHVbZ1craKFD0gki7nqxG6M
         xO6bVKmh2Ey2MMG7LTAOFHzEzsbsVGYHqkr/NcxP8j5D8ajj4doiii5PYz/nvGKd0MYq
         FZkZ6oYrnI6Wv1HSmR3lPeh3JBOBtZW4crmVrdoThGNF6zfdp99PsBs+ouk0vz6wHd8p
         08HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784537568; x=1785142368;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=khrEdLV5wYHeiPqKWkgPxtADj2ISUrxQNr9hY3PFgd4=;
        b=P6vYRzw/LNhiBdt5SNpJlA49EjNRCzWXwS5p+9aXXyieSIz+/5JO7OH7BilGAEiEal
         cUranqN+bvVvvFsnmSJ44FlMUBzsFx+nNesXW3RZtfF0BsCm69fa/sz8vJpHw8K6fRao
         MMmrInDvpYk+CH8NCL6wEYHIYfHrhrNClUIwPjNK1bcPoLCBBJOLC8mvuosPozjEGpEg
         IOHWWWka2SEN27cpAfP11kNcf3LJY35TQeJWBpvEUizq4lgPIE45SiFE0HvlNHityX/2
         6IJyfMB+hI39WfrVFrkcrEImc1DH69pWn3GzSTzlLxG9GY2XYhhfOzb8fq6o1T2QY4xQ
         vRsw==
X-Forwarded-Encrypted: i=1; AHgh+Rpf+f14cWm56OMzq6GEs/ZeUxpCir1X10TZ3GvUWOELK900uzLBSxfoT5zScDCogf1Ne3Xx+6EYEn1pRiOD@vger.kernel.org
X-Gm-Message-State: AOJu0Yyd6hrzbJuxM4jJO5inO2zEFHwhSkz34AVV5wgd2E+yBfoRZHap
	8xLeLYr9aulGFHNx8fmjZd3hNrSkPzDLnv2etE2pXoApKdLSMnbtd7sP0ebadhCT3/f/dxXs1+O
	/fe3CYH7zWGwt8wFsdr187TlyhmQ7ay/7wheI7+bvCgr9rwANBFqCT2nae3+WS21KmYU3
X-Gm-Gg: AfdE7ck1Op+MrGmv2LuWuVdR/c4sNxZfsWjOCAc9B3IYSCsPEfjb8FDW7cR/SmzZk6W
	m+8h2hLYT9ZmEw/EWd3kcJ1yJPweTOVX7TdGZDf6Pv3djj1MsXD1Qq0W8wUtWpvJutUJVsiJXbW
	61zpvHt36Qo7lAN+JoqLptHb7mxWkX+xcEkxBz1XCTXJHj1xDCUIQfpNYJ+6t93gnU4rggQYZJ/
	fhma1dXOpg/5rVBqXN+rp2cNpK4m0DEzQ86QiheEtZQgvIY3jT12Rl/nNBnIxLWXMyWIZwaJl9I
	bHlfsq0eXgPSCodrhpBJ/E/gAEDC02mcIzyPcb6WmZtSEmTOG/0AHki4uIpGpPAxqXOdrB5rVM8
	gte+V8mMpO5rHXRAEb9D+/SAS
X-Received: by 2002:a05:620a:8804:b0:930:831e:1299 with SMTP id af79cd13be357-930b41bf48bmr992555085a.6.1784537567817;
        Mon, 20 Jul 2026 01:52:47 -0700 (PDT)
X-Received: by 2002:a05:620a:8804:b0:930:831e:1299 with SMTP id af79cd13be357-930b41bf48bmr992553785a.6.1784537567401;
        Mon, 20 Jul 2026 01:52:47 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1712a5f986sm430075566b.40.2026.07.20.01.52.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2026 01:52:46 -0700 (PDT)
Message-ID: <2bc870e3-5d2e-47a5-b5fb-15d6749644c0@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 10:52:44 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] soc: qcom: ubwc: Add Kalambo UBWC config
To: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260718-b4-kalambo-crd-v1-0-a1069b5a2757@oss.qualcomm.com>
 <20260718-b4-kalambo-crd-v1-5-a1069b5a2757@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260718-b4-kalambo-crd-v1-5-a1069b5a2757@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 35K2x065fV0AX1OvGHVTbrMASQxPcR7P
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDA5NyBTYWx0ZWRfXw4mMyS2QNdCP
 t8+aYrEyi7y3w6stcMwFB35X4BfGxXGeRwSaasmWSwRt4p4K/Lzuv7oBa7G6TQgqCK4Q5iA+0iW
 s0S3ORPshD1bNlPKoWm2xnxWbPzyXY8ojJefyhPD4KMUzbLS0Zq41ef52Rys8oFAVwpDT+My4SQ
 AlnViZq5cx+Oakhy8uBWw0QZuU2BzmEQjScJ+vTW0ds7fidcpH6JiCQFWMn7I+d+z28tl2OPG+h
 usY1hQ3C2etCAsElKm3umLFjLlSQ4YQNcYz2TPiEj3ltOcyEdl/6kGIU4BK61qxUWkhvO5XTi6K
 936/grpA9dndaMHkzPYDlArxU6LuOUyGYJMDLoY30LWuhm9mEUixloAOcRMPb0OaXOEOIf3r4ao
 q0c1R/YnWCwFinwsFRAh7cCm6OzTbvFCxCt7jFD0/sRj++/WUN/Z50qjJ/H5pSsMINxmPyQIecD
 /lodkXZ8Mh5HWRRsoVA==
X-Authority-Analysis: v=2.4 cv=RPmD2Yi+ c=1 sm=1 tr=0 ts=6a5de1e0 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=ZAuWv5OiGsYHQS-HHhcA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: 35K2x065fV0AX1OvGHVTbrMASQxPcR7P
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDA5NyBTYWx0ZWRfX8Dpg7+e1xeHv
 u6zRM5KjwBaZ4A+kfjCDpPOyx/V68dXXFza3C/iYF87PES3OG9czB6lp6gqNnzTGR8MTlPgiB0k
 W0srmM8mjZlMfmAbhWD968qrZ8WCPak=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_01,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 spamscore=0 bulkscore=0 malwarescore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607200097

On 7/18/26 2:06 PM, Gopikrishna Garmidi wrote:
> Qualcomm Kalambo is a derivative of the Mahua SoC and shares the same
> Universal Bandwidth Compression (UBWC) configuration. Add the Kalambo
> compatible to the UBWC configuration table to enable support.
> 
> Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
