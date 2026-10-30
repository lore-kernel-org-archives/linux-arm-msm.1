Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793364667;
	b=WYqlPjqNvj+iAMKomXSjUSC2v+c77WwNr/N9urU5pusGibmqiHtfX8mPgT51muA6BVig
	 9uAwleF8ZFArsWSmdngvvK+0cyb3nq+ZWghvQHg3jARJM4dsVZGU/oom29tUaoyZxx+ff
	 9gdZiP8D4OiENvyuVm41ODOVda7kkp4uuvzT5wxuixthfhBk7jY1iDWoNL1xSkWLjTSe6
	 PtbPcm96GQSUXVMA/uxyXqjM935FqxH/mBxP8PNcIYm2VOQwJpNX86FIb2o9oGv4T7LKn
	 9b1DsCqT4ZDpBx+PMXNS2Ns5xCeEEAOMs32mle94xpmIQ2NZzP3MODScNLtY5Lu3cJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793364667;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=XphpQpFJsEj2QqhW36aSkIT3Y00nbckxn13CU38V6to=;
	b=KA2n5ko2vGu8prImdlktWw1uQAeNp05alhasy9HSkK230srJZhYHG3mjL9Njy51O0Ing
	 JIzBCu2tRbJjBD+ukOApf2vTN2EHDrFsX6FlxMleZvGfpee8EVz3mKMrnKdLGbqIug8W/
	 9pRSnpefbAqtQNFznAMmYXFMY9c3fMm9iPZ+2cC8paQViWex4umQxr59c70Ij5mql69cE
	 4xzU2uHu9BaiPQjvWVQ3SsvdUQKh0mtiNTv3spyJKxMW+lhQOYicfrKmzdGZgqYEmFTMt
	 hL+2gv5zinK+QbGeBQLfxdVcQyMAreHzIjv1CatG37eXRa+CcFCvNBijDeSLs9vgclw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nUl0A3x+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZSpqk4UO;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BDA760A2601
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 12:51:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BDA760A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nUl0A3x+;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZSpqk4UO
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UBejPC3143684
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 12:51:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XphpQpFJsEj2QqhW36aSkIT3Y00nbckxn13CU38V6to=; b=nUl0A3x+80g2PDHd
	YSi3RtvkUmndK/cWEi6mFBgVt2+sgpGUi8wxOqJNpJTUl88fXpS8UKnxLqWyzpku
	NF8G4AZ8srlzBAmizvsDxaM0k9KJei0QiZXxZSGtSNJX3ALvHriMIxONoO1NITAo
	dQ+aHcDPMGscUY3jEM8+rqWr7/6Odd5DAyDgJl4eB76MEmu3MnC+xtn7njoBhAem
	c4R3Uy+DKAkAY0DCQSqYsRXc2yHGZvJnQbHv7+bO3F4xf5UL/Mifk+Y/dEgnoslO
	s3gZjhk1sJR/gBhP2znsOGsi32d9AfAQGD3iqUXiW6UXP6k/0O5K7nlWgp3ag/Nh
	MMV1zQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qk3v0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 12:51:05 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cc50fb0d2so17802285a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 05:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793364665; x=1793969465; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XphpQpFJsEj2QqhW36aSkIT3Y00nbckxn13CU38V6to=;
        b=ZSpqk4UOjmuRfkVfmxjiNernb5Jffau3mWzsjSdi+FoK0168afTXSpU6pFFGmhpbkd
         2/pgz2hV22xzgWo18MCrzgO7Jfp0wqcvHa3bv4Kvr8BNBOSR5aT5cNksXsS5TlOadcNV
         MnpGFdWu2e/uitKA87xJKz/pbx7lfGnpYAKo9PKbEmd+iXjnemL+FvL0qOe4USLkVwoB
         9A3bIjeMU2tDrnma/Tchf+2qg/hdiL8fqGfq2UBbrx6EF6NYFQ9Bp1Di2pI8Wae1L10/
         c8amOZefKKgl+yjZS/Y3FCatYNr3qhdtWWCu7NZ4g1ZMGwFd8pwvwIQESf/H+rkpNNsP
         vy4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793364665; x=1793969465;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XphpQpFJsEj2QqhW36aSkIT3Y00nbckxn13CU38V6to=;
        b=aEkMvPPtYU0N6wkuIEj1BoBXsAuJheVcU6mlLzK2i1/ujOVY3lMx3UZt4u6/enGewC
         KyNWbdWVWChwzmmqcTo6fD5Z8MzrXx4TnLqoULqk9kp9LaGMb7bnBPk2HaL1TuJotArk
         j0ro6N/HNIr1/4gAdjss1Q/SmdL7gL8RbkmYVFktC/Nc78M1MexS8s5fOW4TLyDTl9W5
         r0rXczo0Uc4gxUj7DXM9BwXvFUJZBKh2ubzDAz4pI+j29Ty+hyUDFv2y3iR61TAA08+m
         /ta7YgnLR0xcGCFcXnw0Z/ny1q3D4rJCJ127aY1CNg2//hmhE6HLl32dwNWGFYNzAqDp
         W63Q==
X-Gm-Message-State: AFq9FYJGmQzyK7LK+qtb6lyQ0Zb+mq5dmTdkMm5B3hhPdc5QDM3HGz2e
	3/7NfEkEknWs0uoVVFbNKrCRn2ujh1QdAYCCST3LGRBTozsSJsZPxOIXCTaaZRHSRfz335U4qIT
	zyVEAQSriJ71d6PnOTRZPu94GS0N2cxoqJPlwReSrpEJbGce4muIgWRUAQh5lsFO89p+w
X-Gm-Gg: AYBFou0Wy1vUUcBTqtLGH4wVfdkgwtyTT2kW33W3cylqAYnscNa+sgebP/AQp3yF35u
	uBF7LyTT8YgjeapJuhOC4M16RmWBpEon0oGU2LZR2wBUT2+y35KLQhcEmoPktb/9RySBY4hcOj8
	gzwFUF4irIPh1NfzU+odXf7u65TxtjskIdPo2S1Cf1uH8iChsmYtb3SdJOUqMzKfrtZqzgNgOiB
	KGv+9bmuMtDByyR62WBugS8h2ZkWuOIqmi0pButi9KPyp4ZjK4xFQzvikxSy2phckdFFz5QtrTL
	ZIfgVFVWYPcIedQC/d6w+JzobUCt9qBBJo/Z8yDc6/QNLWFUKcXITcZ1nHvtfypFz38iHXVhvK9
	U7VkG85ld/majBjPEc9UFZ5izcF0Z4lXsegeEuUVRSmXr2lEAmJY8ww6hR4oawJltY2aY3VY=
X-Received: by 2002:a05:620a:6e46:10b0:939:c7d1:7471 with SMTP id af79cd13be357-944216cc78bmr347959785a.4.1793364664803;
        Fri, 30 Oct 2026 05:51:04 -0700 (PDT)
X-Received: by 2002:a05:620a:6e46:10b0:939:c7d1:7471 with SMTP id af79cd13be357-944216cc78bmr347955885a.4.1793364664241;
        Fri, 30 Oct 2026 05:51:04 -0700 (PDT)
Received: from [10.169.205.110] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabe5006dsm60694766b.64.2026.10.30.05.51.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 05:51:03 -0700 (PDT)
Message-ID: <4e578d56-f865-41f7-9189-7ac15f7a835d@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 13:51:02 +0100
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] arm64: dts: qcom: milos-nothing-asteroids: Enable IPA
To: Alexander Koskovich <akoskovich@pm.me>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261029-asteroids-dts-updates-v1-0-79351337d681@pm.me>
 <20261029-asteroids-dts-updates-v1-4-79351337d681@pm.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261029-asteroids-dts-updates-v1-4-79351337d681@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 5GhubEqjnq1jyWP6l_cW28tM9HRoizUg
X-Authority-Analysis: v=2.4 cv=KLzPn1Fo c=1 sm=1 tr=0 ts=6ae492b9 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=dMdhFRwUw7ASlwpx6HcA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA1MSBTYWx0ZWRfX0ECsTDsQVTfY
 TDgRTK0EDCk5wcwzRhqgL8PxIeYn/Mw192DnBJhsG58mfIhxkZrbY+zYRHYe4ixhmXfn5hW57vm
 N2IBIjvf3gQ6p+dMQDvKyWr/v9Gwx5D9LHfCE5bUFzPA85M2aF1/a/rO4z4t2Lm78NXv2fh4tN3
 8b0rUtp43K+/MHGdayENEhFV7mGgIepK3hrm8G3ouEOg/k0s8ygVQgruyZMQie2aNVPfZX7W7O1
 ja3u2qfbkvnkfAuap7HVG4xbJGccACyYfQwjrq/7hmqaEraj5GbKJ98XW8oPZA1i7L5M6wolf6+
 lpL4ic3MRwmircU65+0oxz7G2euNQw+wPMaJEQ1SF/P/86MDm+1+MAmADozq3GKhKErQDrWQ5Jk
 O3B342R20r8+hj+XUZU7x3PGbjgRFbFZFeveZCSdkvcIFZj0OjvngzoOiRcGRZljXDf7/A70npw
 iDNE4XM2R/LeHrODZDw==
X-Proofpoint-ORIG-GUID: 5GhubEqjnq1jyWP6l_cW28tM9HRoizUg
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA1MSBTYWx0ZWRfX9COUjpf8IBmj
 HzrfJudnOr56PZNLYvFqF0V3H3Xah8qDpXNGUUEh8YQIizNczWcC7nnRIB6oKvL8ZxmgSB18hpM
 ocqgGhYUiMfmlo1E/8s4db0W6dlgz64=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 spamscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300051

On 10/29/26 11:33 PM, Alexander Koskovich wrote:
> Configure and enable the node for IPA which enables mobile data on this
> device.
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
