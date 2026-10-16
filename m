Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 287113955EB
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 08:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792139725; cv=none; b=c5oCDCGPYeWENTvWVFaEwQsWOEfX4wXdsNDqKz+spUto6b1b5QmBZ9WHl3Ptcx2VLSLxnGiOz3wyZHNXRle0qLJxmx003xZNhbzr5zLWagPuQv7RV0v68IAx8OiGUiONkh9XJzoj63brTohAbOsJGGGHZcJZddAPWAjRh/TvO2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792139725; c=relaxed/simple;
	bh=G+jvZB6Mji53Oxuv/iP7a0JCLgGXa8e6zRkHoa1NUhA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=obINrwV+tlhUu4QZaearzsgw6swOQJYbx0pW71Wvw5sHlHfQdhjse5OPbGI0+6rmVhJAQ5TrbYxmiSVzH+GGyDuPHdapnnf2PVYE2GDCF8jy4/nwNBxRvQ2deGMKU2XW5EdskkCOAt+Uv1Da3ihUCjnNV63oS+4OG+Zhs0C+eqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S6TA1gfJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XD83Bo/O; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S6TA1gfJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XD83Bo/O"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G448je3875074
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 08:35:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oBG4iqg2NWlURuAH2FetWXYaxhCLT77P4rTe27vpggA=; b=S6TA1gfJST8b8prs
	meZKZi63tbUd8HHJmfS5+6yfjKRzff0m/7kv4rZAIHYRjGt5otfdFy4/aIrsX2DQ
	H1yhJoclugUPlUnO+kT7Ro56A+RxTfMmw6PuQKLlV/c3JCa0c+Q9wWseZZle7jcW
	uswCnyXzCxH14VkbOSOtc15itfecV4Z+L+MWdrZISzk75U1Kdne6BUFjYfL4s3zw
	UlnSsyTdzxQFUiXYX+FcFZCUgCqp4ifNyLw0tWrcTdH6W+BvdP7byrQoUoxY85md
	lj7SFj1p/FAtV+FS01p1gdlQZsCE97ZujDnYy54rqKbhK0ekL8Zxfgvy5wNNIBfU
	42E57g==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbcjt8xx8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 08:35:23 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91b89618384so8312186d6.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 01:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792139722; x=1792744522; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oBG4iqg2NWlURuAH2FetWXYaxhCLT77P4rTe27vpggA=;
        b=XD83Bo/OfyRcasKUb8MkPSCMcb+1Bx3alk4Xjd6rTyTZzrqv3x3RvcKcMpVHgrqV9t
         ETsTaw8JzwHgSNxzO6GANjv9pYvyiRhTHaBRA4UNm1izBXiQkxqorwduqGwc6BRaTvxA
         QXexTEqPwNkl37YkNFi01vIFCjIy+yOB5OJIJvISo3T08n6QGNUhDp/OuaiXjAgVj+jD
         c7+MNfylv2AX4HhbI95WjdL7gi6jKedaM/ZDThYV8g3ClIaqjDgUxDxzNcF8atW/7OHB
         Zvty7y0kKpUiM4lCAhqZWOJiAhFVsRhwObXiQVZN1ot53P9d1SZn2Efl4zhplnmbvRVB
         sfeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792139722; x=1792744522;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oBG4iqg2NWlURuAH2FetWXYaxhCLT77P4rTe27vpggA=;
        b=tphU046Cb91MgPTzcjqR2y7fN+NFuZpCJCOzAGeOchG5ARJsnVgZ/VwDPHRGOi7paz
         wq5J7kpYx7QmkE1CC9TrE103PeBeTtYXfOWCDhz6mcgiN93N0j+8EE8+vzR3WNOlFmf9
         yQpoo93s65vhzzEmN1QXcOeSfdlPH/QuvSHtiyApvYCuGa3zogrF02SQ+v05d/kYPRyg
         sQT6I7dncanpg6k0MNNiP7ocd5w3bYWD/g4xILR7L7gKORMEu5k2cvWU8iozaw4O3vz6
         Ghh1/e086RW1yUrP9dyC8izkHBQWYrhlmPJ+DT4rUDLsJTxBB7vHC5oPWfpL6uady3lr
         ZFaQ==
X-Forwarded-Encrypted: i=1; AKwUvByIoloXltfuwWk5fTf/6uQPF4+ZnqjOq6pSE0Pwn4xIFztq2BbNbHKA8j5k1KjMLiB82PxpYLF0+RNvPnR7@vger.kernel.org
X-Gm-Message-State: AFq9FYIyOJsFWeuaJZL3E6nDOE2bz85Yjt3MAgbeT/2JigRpumsynBNr
	nsfDfIcCMFMqHF4Lrk8cO33iOo/M3eiCut8gEjV2liGl5WthP8cMyayBW3jfp0O1Hfa9D1izqfN
	2pDhtO0eM24EwhDKPPd8veSq4F6RHFe8arhOj+iF458W/lRDH4lAeWFttfebws3ZCIeza
X-Gm-Gg: AYBFou0n7UHmU9m1CQvF3datO4PwEQU+Jp9oV9dX1e0FAhvCkKER0SCc5fVoPeeG2Km
	1G2TQjS7KAkQdsPln0QoZkpwc097g0e2kzHgUibQntzvfFe+is3e37X7keBtgrLM8QVDflUTpAN
	MmTbcv3PQfmz+2BY/Cyb8yjVB4Zww+A4yVEQZnupDMV/vEg/kKR9dcG/ICrGWdNqHQWl/CAFoMq
	x9MlnNKfm2e7zPkVPC3LCV2JKvJ/52DVYkWt4zgJrJFPLle28oMMXywjdG5xWqogDyXE0fOE0qW
	fqf8EWM0Y48chfXD2zFtZ/XAHR+WeNPL/A3rfjrtbwg+8oItW11YJd5gbNpUwynEbWaGqCVrktl
	NgnoBQLFTQkK8gG08x3a6Rw==
X-Received: by 2002:a05:620a:390c:b0:93f:a34:d9fa with SMTP id af79cd13be357-93f0a34dd2bmr1305256885a.1.1792139722258;
        Fri, 16 Oct 2026 01:35:22 -0700 (PDT)
X-Received: by 2002:a05:620a:390c:b0:93f:a34:d9fa with SMTP id af79cd13be357-93f0a34dd2bmr1305253885a.1.1792139721731;
        Fri, 16 Oct 2026 01:35:21 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40912ce133sm52324966b.31.2026.10.16.01.35.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 01:35:20 -0700 (PDT)
Message-ID: <72ad4c04-a959-4862-92f5-9e07083eb2ff@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 10:35:17 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] arm64: dts: qcom: glymur: Fix fastrpc compute-cb
 reg values for cdsp
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Mahima Bhattaram <mbhattar@qti.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
References: <20261016-glymur-dtfix-v5-0-f56a8b94b4a9@oss.qualcomm.com>
 <20261016-glymur-dtfix-v5-2-f56a8b94b4a9@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261016-glymur-dtfix-v5-2-f56a8b94b4a9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAzNCBTYWx0ZWRfX0xmz5V4Ng84V
 H/WcyLi1RWwB9UapE/XpswaTm9WWkUBMeZveZ/agq73UPiRXM78UJ460S2lPf7Jcvs6G13lFPrJ
 kkL10UXr39iXBI5XfkjDVxyZmL5gcFBOvqs7JObTd7fzrrB2Tl5kF9i4LfVtStrTLNTqN+z7HYy
 nmNNkCxVdzHzmh3RPtgdP3cI/95fGCmvbGKrmm7z/M7rwOVR785muNQu1zDG/ohpC+z7JU7DrUt
 mWN/zWVve/kqaXyRIgJ4qD0utm2fu04SwtmncvI9zP2UzGJOknRk49BJx/ak65ocEXqLcvCjWn2
 3gf0DjIqyfV7f2ce7tEW8sUbI/GAcD1KmHrSnhv9bjgAUG7xNXxp1HvOitMsmD+rHj/Wk1YV71M
 4/KT5wu/3Dh9Q2imL/miGoqP9em/Xxg0DESetaEXktpgtU022Czi5UmrkVD5JUiyGqLOVIepllB
 1j2bW3f8ddq6SxGKFeg==
X-Proofpoint-ORIG-GUID: hwCAvBlzAPZbJ4Dbb6uucxzge6rF3Duu
X-Proofpoint-GUID: hwCAvBlzAPZbJ4Dbb6uucxzge6rF3Duu
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAzNCBTYWx0ZWRfXzFTYP8EL+PQY
 LAzdPeBq/F+UWXfvjlQ7Q1fH19VRIVCCPMMjpOrfRHs0Ceb+QIWJOk1a9N2IG9GgunDu9BDj4EX
 YJ295zBW/cAvE3W4iA+x1Z70gAPj0q8=
X-Authority-Analysis: v=2.4 cv=VpS2kO2n c=1 sm=1 tr=0 ts=6ad1e1cb cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=Fnn43W3oJAV-pqR0l1IA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 phishscore=0 clxscore=1015
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610160034

On 10/16/26 8:36 AM, Ekansh Gupta wrote:
> The reg value of a compute-cb node must match the SID (the lower
> nibble of its IOMMU stream ID) it is associated with. In the cdsp
> fastrpc node, compute-cb@10, compute-cb@11 and compute-cb@12 were
> mistakenly given reg values of 10, 11 and 12 instead of 0xc, 0xd and
> 0xe, which don't match their SIDs and leads to SMMU translation errors.
> Fix the reg values, and rename the nodes accordingly.
> 
> Fixes: cd1d174c75f7 ("arm64: dts: qcom: glymur: Add ADSP and CDSP for Glymur SoC")
> Co-developed-by: Mahima Bhattaram <mbhattar@qti.qualcomm.com>
> Signed-off-by: Mahima Bhattaram <mbhattar@qti.qualcomm.com>
> Reviewed-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
