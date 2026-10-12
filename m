Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 843B549A3D8
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 15:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791818598; cv=none; b=D8uE9gnBFF9UaotNw7pMTZ294PQXPnYPTr18J/V2Rvk+tmbWovG/Bl13lX4EfDtPVsxV1v21zKxZuIbtaOXR/dGJOFSZOhXIdRwcxQe3xb4hGO8gms2jqiijbgoCTBj5B8sjx8QFgk6VVjL+2J/N5hFYvoDVgV1+lOu/+uTKCGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791818598; c=relaxed/simple;
	bh=s/Mbf0x0sIgUm6VG+i/AMdI84Hw7nY61I9jfRK0CkHA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WPf+tr5POS6/LJmywAKgNL7WwqAgjbC5hMrBQAWOO9QiMPaTK3rUi6bZ6FWWtiaJER5I+9CmFdBcmxTPDn55hhVWRwrvllWTNwBhp80qQYfsiMl5iqZ6WMPHWFHnJS4lVX4OW1y9DosrqznraZNHWcosYRpJgq/0nGH3or3q20c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bhhYHCwf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U0x5pe5o; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bhhYHCwf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U0x5pe5o"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC05Mq2786873
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 15:23:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GPlb/6FP/XOC0zbZ9c/es8B3def34aaz5lIhTTHLCRc=; b=bhhYHCwfiJKUic7D
	YaegtrCdVkBm5Ca0kuHxCiwbhCux8Z4Q0BjSiDc6OQlqQPw3PTtRCJdTsOtt5HyY
	GmvpcUazJywS9Huz5AnUdPIq+EfH0I7Czc6OOOqtmrSG2aBxLyTPjSC6kn7gQCCc
	Qq0qlOrfbVUW/tD/MVcKzGrxXasUTDaxbvsTvPLYKCVX0uEG0FH6sdNS03X0j2vz
	hJi2Xz0xVQzs2Y2pHGbkiFPC6Kz1n1XYETIsuC/M9nbGUSJmLT5opEqWmvEOmER6
	dXCWrVndxaoFr1D84Hw5kan6HWh1bsRI2DQg6oKLta62QduZ4iZEHcMVcPynPn0H
	mx8v4g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8wffhc1g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 15:23:16 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e661ce1dcso22029385a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 08:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791818596; x=1792423396; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GPlb/6FP/XOC0zbZ9c/es8B3def34aaz5lIhTTHLCRc=;
        b=U0x5pe5oI8mG1AgE3ABSwsCmYD9VL0QmlG1Y4F+TVRQNC/sw7PzRdpReJLx5iytBBK
         vmlkMfXFuEPnsKSsj7kmtqxzvsHTI72PFBN12dgOshShiSCvdZbrcFZOJ6Y8jwMr4v+o
         3AX+h75tzhg9pVyrOmHcNGeLsaxG4BXlk/zgXg0cBDqzGTSFGbRaej3NH5L8nVdasvmj
         DrSK2xJ8PXXvw4uQWAd5soXF+r0OIgLMl+9yqq0XoF5t2+m4TP6K21nYSFJgg9Rt7pi6
         RFMGqLs5jT1nDBvYsR4D+SHyXb9IsOOHzBiRGseLuopzzV2GKo/eCxW4nUM+hvNAzClJ
         m78Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791818596; x=1792423396;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GPlb/6FP/XOC0zbZ9c/es8B3def34aaz5lIhTTHLCRc=;
        b=Y3g3MBDi5+ejhLKWVQPj43/8p/5rKLLjRGV7cMPmC7+lYs03JdnQlFbO5p8WFWSquq
         mxaY68gbY0/yDEiW2TUoiVOyJPA0lR+WPexvEM//BENj+GGqEKmwS3Zcflj4VHN8ccEY
         havB9ThWJVhsYxXiZ3BdIQX1723yOd5P9t0BVCKHS6VQDPzhGiuFRCgBGVTNzapFDrGm
         /+3V6KeDnVmuenkmWMAqr9GBPF7IMkXxp9CRU/fx17g9B/jOTKXKCsAQxqzX60jecjdI
         xd1+psUPCxaf1wqGk4D1uert8ZnbuOfaSGhxLc8PO17d9IcXH74jQc9WOx1JFAjGep5p
         c2hA==
X-Forwarded-Encrypted: i=1; AKwUvBwnSwuGLK3v3zm4NGwovzltNLKnE1O5f6yzMICDjC2SyYEToaUIZ2vewbKWdJ+j9IY0lpqFdtjUdErNOzQC@vger.kernel.org
X-Gm-Message-State: AFq9FYK6SYeZNn5YSu9q4TnaW5mUkPbpOoGDYatFHuXE64Kxg401kJmE
	GjBr0An9BTkIT7phzHf1Sj0jUPANJ6ZszXwnkxIwZmDf4EkpPpXU4OUCtj182bIKRnrrmb536jT
	v3Cv7ptS8Yc1EEmMV2EYVr1Q9fNZTN+MgnczbXeTGsr9V9fUkevNZQzbNk26bzQQbNlJ4
X-Gm-Gg: AYBFou0WCRYLZnaLIghfn9pTrsYvJAtV6J7TOtc0Cs6uYU/gKC+/ip1JtC1LKI7T/i0
	q+IPtkKQscYToDTjL7WTZUEKvu5C6jqAuoLraBnxhi02woGtMjJZWYo5C0WAFLkyrIEA02XWor0
	ETK3kql2mYJg1fAOJy9nd1BLx86YbYTFaN3uUZS9oSh/NC457UIEMQpQFYgsWHwcLVtUgbI+3j9
	Lq9JXXh+iJP+EIVzEB6do41hEFiE9jEk9MzM7hmjLj3wEzJAL3NTJOjXoEKNIVpfO+IfQ1KJH01
	Lot0GugzIwyHX/Y/w2TjnHBhxYL+taYQnljxmwA6egdQZDyWYDL37/A3AoPxME4QVsgNg8CQt0n
	cQPwOUpAA5SSYhCaFHZrxpQ==
X-Received: by 2002:a05:620a:458f:b0:93c:61e0:81ff with SMTP id af79cd13be357-93ebd0a3722mr1990277585a.1.1791818595851;
        Mon, 12 Oct 2026 08:23:15 -0700 (PDT)
X-Received: by 2002:a05:620a:458f:b0:93c:61e0:81ff with SMTP id af79cd13be357-93ebd0a3722mr1990272885a.1.1791818595394;
        Mon, 12 Oct 2026 08:23:15 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9766743sm476153466b.4.2026.10.12.08.23.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 08:23:14 -0700 (PDT)
Message-ID: <ca8d0e1f-1e43-48fe-a2e7-14fbcbcd22fa@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 17:23:08 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/38] arm: dts: qcom: apq8060: Align multiple property
 data
To: Waqar Hameed <waqar.hameed@axis.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: kernel@axis.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1790892852.git.waqar.hameed@axis.com>
 <ef0bce23540c24088526af1d686287d74e14b67c.1790892852.git.waqar.hameed@axis.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ef0bce23540c24088526af1d686287d74e14b67c.1790892852.git.waqar.hameed@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfX2yce87naqe9b
 MliN2CCumEOo4fU0hOA0Z+YAUYUZ3maz2GLJKyxfuIrDXpgZIYQBXTQuOAe/XVts9zUTG2nIFSp
 x6mB0LHIpF+BjthcQwh67fpX1vY9Q5JB+j230MwR8S5BtFwELYXAPUUfMJ4/y0hqsvYo+YZtlVN
 xrangXqPVc2t/YhSqr4aD3nQ0T+/vzadavY31VveVNWobA/Yj+tVasYIrWfJWGDlCL0ZsVKJ8I6
 G9jBEEztI9rqBTpYyrscKbjPPxZT5mAACa6n3aARPBKwfNUDRM3Xd1QBcDvzEA/5jswtxuPgxqC
 q8QCEcXPXjJN61R+qCV9oWkqViCggBpYJbKIHzFtqoDS+MZUeqNy9dW2wTlSSJXaBKgFXhSQPSw
 2WRFbiVpYhh15Yw2qlV9V6Q9Bn4cNwiX6urnybt+YHIIqe6FTSOSLUumUy2vzQ+4pCC2zJNTdbl
 ug/X7lb8OEcLIPBxfjQ==
X-Proofpoint-GUID: l_Vfki3enjfSVDpA5cS86FfCIFqtmSXj
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfX9Ej0/QLWg5ut
 tpqygDwsduW+djYlhVZ3AqAiT1Mq4Pg0VXIotLi9efgE873yDL2Y9pag4Ypiu44SAaAFlr2CUt+
 QUOm6zLLZFUM1x2miP+ySNbW0vMv+gY=
X-Authority-Analysis: v=2.4 cv=ZcWIpcVA c=1 sm=1 tr=0 ts=6accfb64 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=3-RhneuVAAAA:8 a=EUspDBNiAAAA:8 a=Bz_mBq91WImKixDMOFkA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=VLVLkjT_5ZicWzSuYqSo:22
X-Proofpoint-ORIG-GUID: l_Vfki3enjfSVDpA5cS86FfCIFqtmSXj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120061

On 10/2/26 12:36 AM, Waqar Hameed wrote:
> Multiple property data on a newline should be aligned with the first
> one. Found/fixed with dtfmt (Devicetree Source formatter).
> 
> Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
