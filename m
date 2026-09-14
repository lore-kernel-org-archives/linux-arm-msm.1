Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5A953D523F
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 10:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789383457; cv=none; b=YylgUQh3ah+ukdt/4hqdlOypAnB/prkwTlZTdrsdPMf4AqMWI0wYROUbSMLlo/jcTm7VHtVf9HA0eIesfFW1Cr/ppxxVcFa6AULwHL9n8SG0odr9GAZNtOJcVqqmDwVHHhHqYDoR/K7Zh8KeK0bnUUt/LvjFcIkZcwJaGF3H/0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789383457; c=relaxed/simple;
	bh=KziHKxbNFDfs2CIWf9u6vkQUwcOAf74I8pDOVwGeyhA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gLVVQEr+47doovBoveDYp58XRVhQe1bEx/WRDNnEa9hmO8EHDz3TJRIYKGh/belKiEB+fbaUPh/Nx2rcRD6s/FUnnchniBerdZcF4TbMoZS1tqFldVY5AQrcDKcmgZMjCGq+KBg4kiNj/cqdgP0tzM+lFJgQpKHBMKLu5mCRzgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LKHVu9T7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PwbrXuTB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LKHVu9T7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PwbrXuTB"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAmcFR314186
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 10:57:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AfpbxI5qodFuclNrDqv+NkaqyrNe7rAen2jS+miRfik=; b=LKHVu9T7ioJox7QK
	uYGG2N3iIj7T+VDU+KlblmtX2XvUkgAm1dYCGNlrvM23gVxX2z165EDNWm1c6zmP
	VkU5/UXZfEv/GkRmDvRe3X2v2C/hOFylf3MhR2YgaOggHIOPg9cd3Gf9UGEmwmRu
	BGNpOzHd6ggohcR+UT5UJ+b9IL9YOt5DTLQf9IiP/jQ8bQi87pROZ7XKFRSSkgdc
	xrbjYD33pzjZbF86e1kaSVCawpkGio2bNc7iKcY0lMQNSeSoNDtEvbE5yxUwA8ai
	7UPRGCfcf7Yux00xkO+aRJ9hW5KnGvM8SJvNjhDddesgBQQsDby4+2ZuXMGxdmAR
	WLY73g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9c69dq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 10:57:34 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-934a8cd3a8bso62793285a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 03:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789383454; x=1789988254; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AfpbxI5qodFuclNrDqv+NkaqyrNe7rAen2jS+miRfik=;
        b=PwbrXuTBuvYQgBDQWa98gf93sVaaF1RDV3hq0D7VTk5kEqD7pJkxMyYZotCY5y5UeZ
         e/lORu3sVvJ5MemyP1sq3cfohF7NlFb8nLfWBaOnpMBwdh+iu//DRCha++1rR/Z1CjEx
         poM1eYX5FHsrcnSoJLy0Pss1Txx7JgMJjQvUhdCbUN/lHtFX08PRcQjbzGIyOuh8T3Eq
         /JZudMB+3JVz61oPf7aVG5pBmAwu4TglHVBMW0XLg5NQlWMFknI0GISksPi0Vi2V2Vjo
         Zkoff2Vr9hOsetBi9E+xYoSi9fOjkxz160BOTjlAPW5Ki4rO/BHGdD8t181aj+l9+lVS
         FMFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789383454; x=1789988254;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AfpbxI5qodFuclNrDqv+NkaqyrNe7rAen2jS+miRfik=;
        b=WXUoItrnldWG7ogAPlrOlptiSoTYMrs+T70ZbpWnDAM50Ow+Dv1us6MaL+rlpE5Orr
         r2TOw0N1d+6ynkwx2CtDDvna+42rWKfnKOKNZMC+q/zvXOtPnW2MlGIYoJsewwPFvaN1
         WoqACDX7hCCKkBGyDW43a6w/fj5GNoTtGVboDGYP3CU+bI8QI7oRiQ6QEcdOhtPClfQa
         R1MRkQK+n7BD4Ch3C4DkUiKzxWo5aphm9iZ/JLeBWteb4yD5rt2rSLvfPiulnVzPD6pM
         OsBaiCL4N7hRgaa/iede1JJv9EJ6EP+awZ71tFEmBV8zXX/Zmf/UxdP90dS5HoSNiSI7
         1bhg==
X-Gm-Message-State: AFuF++kO5rGgqmFdnxgY9rATEt2VExdj73wQLT0YuZYNVfVkRTvtK1HS
	haHCvzEGxN6SvRNL2zl4ebo04tIwKQ/nTb/d2PzilAHWlwFUlVHeTkoDR9kIbgv6DQSW0pMP/ew
	VhAhjGNucxNoCp50jO8G46t8yGMiJK92EXe1F886wSCM1kHH6ds3qpBmWcyojvZs3Wi72
X-Gm-Gg: AYBFou0jfz1GAvsEAYI8ZyKF2u0G6m5LOPELhROmYhMBDQ08g9Uufv8JVipsmyLvBrK
	sjT3ztbkQEzhlDKMFyTE91jIDxKkGQPBGyt7TvyNWQz2o4FfpLC6fEZ6UaKJtvKBqlE6wp1v9Hw
	WAEnIsZCZvoQHFaTHQ3Sf9M0zFk4uDPCQdH3rydKdpB65ps9V4e2XqqA6IFmEz+JueMBdTfOHdk
	pVjX8SLdyVUlZ8W35YNoUZ9Wr51DsEev5lMyW0Wh14yIZvXxCgrhW1pdyD+JocrozV7PSGTmBi7
	zi30UDhLcSTHUrYnxUBuyG8VbnpUazAI2zqIOLGW/BzP5cQlxPJfaoVaSKOWsxoSMlAtJ1vaLbn
	AWomr3bLKsaRNvuWFdDojbw==
X-Received: by 2002:a05:620a:2b9c:b0:939:c6ab:e3f3 with SMTP id af79cd13be357-93a29a24508mr220428885a.3.1789383449084;
        Mon, 14 Sep 2026 03:57:29 -0700 (PDT)
X-Received: by 2002:a05:620a:2b9c:b0:939:c6ab:e3f3 with SMTP id af79cd13be357-93a29a24508mr220424485a.3.1789383448454;
        Mon, 14 Sep 2026 03:57:28 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2966024941sm411467866b.14.2026.09.14.03.57.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 03:57:27 -0700 (PDT)
Message-ID: <1adaf787-1219-4125-9080-7426ef53826e@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 12:57:25 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/3] arm64: dts: qcom: shikra: sort /soc@0 nodes by
 unit address
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
References: <20260912-usb-shikra-v7-v9-0-c7b507a0ec27@oss.qualcomm.com>
 <20260912-usb-shikra-v7-v9-1-c7b507a0ec27@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260912-usb-shikra-v7-v9-1-c7b507a0ec27@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 29q55S9m0Fhq9W8l92XGGmVyrag9OXaW
X-Proofpoint-GUID: 29q55S9m0Fhq9W8l92XGGmVyrag9OXaW
X-Authority-Analysis: v=2.4 cv=c5Y+0h9l c=1 sm=1 tr=0 ts=6aa7d31e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=99Sh8nnqGf6VeWgbmrYA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE1NSBTYWx0ZWRfX5Y6EFhNHn8bN
 Ny5Va66ZHxyH7OoV3suFBMeRxtIR3YcaLDjfen/SosPGA397ECXUJDCVqQouELZHbf3bAy7ynKc
 ApGdW6dGiZMzZ3zqNVdJ/gg4blytnEI4Anbq7E4lDFCo3ps+lIAQIhPud5NBIvMCIJ5kTHfdnIL
 W16IQf+K9dAfZ+AFk92KUZNvQ9OXiqKwzJbqOizab/ZONfSr1AuJM2qxCWKgrSL8UlvkhZpxR/4
 9IpB7mo0ldxbZytRFhJ3N92S6e2hJyf08nFw4uVLeu/sNZdGnTgnX6fnvGrGXoCysbLw1tkzsc2
 ENv70qVHQLICBGhZosp3Hooz2dAq12/BfRmuCAINpj+9onGop80JETzO5WsZtXdUWVJOhpsE427
 IJluY+4pzzov0x9Xit7Gt7QFYjYW+XHqWs1znEW1sv+2JLu6UyUS694ZwP9bHKZGywPi1+t0Lc3
 sSEHsMA2bF1Gpu/jcFQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE1NSBTYWx0ZWRfXwBY0xQhMXbds
 JilWYJJTuWWVnpKwX6jenjAUpFwzyDsSrR81iAksuB+AEQPAGmYQjAclLA3Vadm/3oyk7qD6zcf
 lWiyQ4zMI4VxmlubLFvX1FJXDq1MNYQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140155

On 9/12/26 4:47 PM, Komal Bajaj wrote:
> Sort /soc@0 subnodes in ascending order of unit address.
> Reorder the misplaced nodes so their declaration order matches
> increasing node addresses.
> 
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
