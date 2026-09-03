Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0CEE4C77CA
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Sep 2026 15:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788447824; cv=none; b=a2d64rMv4mPSY3t8K20FtcVjBTtFQRSMhJr8c6FVJt1M3PFUwAe49GOiUMCQiO97Xy5AumrFGWIRilwwIYnHFzBBP1dHebSZVMtiXafXMaCNu92ElCtSuCeXQJzOyiisLedE5P+4L19vGO7MwLZ1cAvHJG4Laf8kB/xX6ursD3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788447824; c=relaxed/simple;
	bh=RavRiSXw0c90tbGRZ+I0K9Ulw+qbgmxvRzPe+L17rkE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VJw8ooWHQfpgcwvzKR7+Mr9BFC7qYjgitfnWjBzIUN8/5rG3Lieo2EWWCSRzcYHhyLcfIaqOL+JujkYwneX2sz+ilfiWpGInMEAl8DmPPk4wibXMEOFUMCYkJY7rRvaozzPlgNxfVmlYFnN5o59NeMXr9B3ZG+qxxcPtNRHHNFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MaIFM5vr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CWXxGuuS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MaIFM5vr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CWXxGuuS"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683DAPMu433651
	for <linux-arm-msm@vger.kernel.org>; Thu, 3 Sep 2026 15:03:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=g+mnk5DfTfkUNUAaoQao6YSG
	lrDwKuJlbKUzFBnu94k=; b=MaIFM5vrc2Es2a+GS+SNJn68/bX+RLpG+XFZpFfm
	+Di0vIgm8COrv0sbZWgaC+OUV0Tq2jd1S1JwOY1eTogra50lMSw1Ggel7U7wJq26
	UAX3qU2NdMpYndr8uKqt+jPLSXKs0x2d+E6shIPHH0FXvNqO4aMZXEE1UwfkYWDd
	WpYt6OHw0ydnDeikHmfR4ss2/HY53dQR9t/fRjXAfo+24iD5h223Wl50NEiaKsIR
	VA1fej06vjY4srQRkvL0EU1SjcGZwwMZcbWuhEQIGZBeZewbC+jq4Tya13B60KJE
	mLt+0B4hjAqTlmpA+itds3ssL3nG7XHXl9+o6C4pSbl9Xw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf82k8x0u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 15:03:41 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-939694871aaso304093485a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 08:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788447821; x=1789052621; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=g+mnk5DfTfkUNUAaoQao6YSGlrDwKuJlbKUzFBnu94k=;
        b=CWXxGuuSXnN/fMr9qygBXgiQ0zvBYuogv1n5MLEsdPCCdhv4fl61Y3rWawoVN7JDEr
         OmUKJTNQ746B83bnJTdeMfe6FjiDVzIntazqxmUzrQTBytJTklXKoJz/DcEduFoCR9JY
         zHriqCBYY09byJ1yYBoCMGmJNGiuGUy4nSu/ysm64AvBaF8p82CDw3qeZnMzlTVsrVK0
         8Rob39+wysKKZ+C9BvU06WSphG64RjTezlGo+6D5BIkZ+9H6zX6iq6ck/A2B1ZQz2GBt
         D2H3OXNIx37BqW0cqgiXYCEcJ7isulAH2YWEc9UpulgbcWtuOPMMM1GqFbMoYKVbpKv6
         s+gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788447821; x=1789052621;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g+mnk5DfTfkUNUAaoQao6YSGlrDwKuJlbKUzFBnu94k=;
        b=StlgUiukKVx1O39kCCOZ/zVnyV1QGef5aIaLh/Jh1n7U3rBx1ONsiHIApmUW/CtHaT
         Po0rhDO67jUwmpfo/1/b3dlajAvFvMMyceCdx3xQepd8hKUP5d5bncr4IEsI0RdmCqVe
         x7PTmJGr21ZP2UOQauEM3rRVa0/7iMRSzHj8jpZKe5rAVZIwRS84AFjBwKpS7JJpBphf
         3ecFNvbpBgKEzv8yRMphOjZd7rp1UUbaRtqUGbP3eSeYi70XafkValvzXhcQAQj0pjBq
         V25kJ3rHH6rSMTRCSWUeHsLDZ4Erc+4G8xaVNCHB5H0njx2iV6PxN+vbKKmNIOpr6D/6
         dLjA==
X-Forwarded-Encrypted: i=1; AKwUvBwYuMCWRFNTSMnyy3RpqXRsER7QcGCrVJzbSjxQFQKHou5G2JTrImp4nosjALs5/EAiUyhcusafAtfeLX/S@vger.kernel.org
X-Gm-Message-State: AFuF++njQ2zWiJfnibEACgWXT+MhIltcV+kLjBQDNJhz9cQviq4MblP0
	OyJPMbij1ZM6o3EXJ1m98tllk9aPiWQXePk1xt1y4IOwRApctOohVmtXgALvxY/W3NifNf+HV65
	edo0r4T98OCDNxI1k9ybj8cYy/v4aPp7I8h03WoVc1nR5EvMXJ32tv6mOmP3Lv3ELelD2
X-Gm-Gg: AYBFou29zP2gTsqUQPsh7vJK0lyBQnHNL0LK2FfjzGiZlqNMe1tZT+ROPmKIYy9SKNb
	2lrgiAs5xJlLs2tbNz1EU8twwUTUr9I9TrK9+RZ1X1ZUo8lq1Pa7FwAbkUH7RhZu+tS3f1A0k7a
	PiesfNWv874pSRNLk9nZLji6XKEbjJ2aSFEL1L+x+fr1QNsflHz98Xmi0EuiWrAMkiQNTjVzWy9
	q8Ztv1UUUHWmxceQgzTfh8K6dIE9YWe1GcX1op4dqiBXwfqggjW1Jsibnzqyh0ZKHpJALgVVq2B
	Or7Nqq91W0PyXJM9cRf9i7P9Yf+Kcp5KFofF6emaDnhvAGpMbQnirxlMHGSYQVlqZ74IMFG7WGB
	OUz7Ax8hQN6zX7w==
X-Received: by 2002:a05:620a:1a25:b0:939:6dbd:de55 with SMTP id af79cd13be357-9397ec20921mr15185085a.18.1788447820869;
        Thu, 03 Sep 2026 08:03:40 -0700 (PDT)
X-Received: by 2002:a05:620a:1a25:b0:939:6dbd:de55 with SMTP id af79cd13be357-9397ec20921mr15172985a.18.1788447820325;
        Thu, 03 Sep 2026 08:03:40 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e6f604sm14339403f8f.2.2026.09.03.08.03.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 08:03:39 -0700 (PDT)
Date: Thu, 3 Sep 2026 18:03:37 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Iskren Chernev <me@iskren.info>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 3/5] phy: qcom-qusb2: Remove _SHIFT defines
Message-ID: <fkje34nz2eqlhm6nywtcvh5pue2qczmtks7dvcagpqb4ytniak@a4fd6jisdsji>
References: <20260903-topic-8996_61x5_qusb2phy-v2-0-4c3f980a4560@oss.qualcomm.com>
 <20260903-topic-8996_61x5_qusb2phy-v2-3-4c3f980a4560@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260903-topic-8996_61x5_qusb2phy-v2-3-4c3f980a4560@oss.qualcomm.com>
X-Proofpoint-GUID: ZtqN3O1r4xocDXY8BTdt7kivTos3f6Px
X-Proofpoint-ORIG-GUID: ZtqN3O1r4xocDXY8BTdt7kivTos3f6Px
X-Authority-Analysis: v=2.4 cv=OuJ/DS/t c=1 sm=1 tr=0 ts=6a998c4d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=q7XEBjOi5DRkXzmV0jSBjQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=3bhTxtwNgCDITtlkWrAA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDEzMCBTYWx0ZWRfX5UWNW+++RfJb
 0V3ghFZj4KSTeD1aFwTWBFoB3YIeHy+itV3xYw+N6darunk+Ed5izWHtVcq7QyM/h+JpnqUx7q5
 V/MYonvjWDSpg6RM34KpNHl7QorYE/CWTwbaX4yEz7YnumrVSBogUXCRZtFocWQSonvCWYau+ib
 H7/2jOmuFXb/qy4aSfGAH7SlmVjUqth8HCw9Mp96H066ZPjVQotbvJNhRfeLBZQaDCwgRDscvo/
 FVEceFpaF3Tcd42kpkiF5Kp0PcZmGUlsW5i8idPyUQVpd/CYEGbUOBcEPuTDo0wfCO4E01/QkIo
 rAyyuR6lZkMzzRqizf9vrfm4i1jwitnBFJ45Uz8KIVmlZ0rG0ckMqYhGRqKFkNXAhBbi4KOy+k/
 6Dsqz28niVhP+xFcrObXfYx1aD4TO6CBRWhbeRQeFcBMOm8VgyYfzt0+RdyIIUXBZPGe6mF+j1W
 5OXFAN/BVhJpLT+42OA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDEzMCBTYWx0ZWRfX7T9Emsl7R2KR
 uCu6oJzCY1/52axIcjb/fukJQTN19RCI8NhjU76E/3x6GhHw96b4stcESvJ5uAw2JXvbYsFQwZo
 WMl2Ob1ErqYMdm7McakCP/umydNH+gU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_04,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 adultscore=0 bulkscore=0 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609030130

On 26-09-03 16:25:30, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> These are unnecessary as they may be inferred from the mask. Drop them.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
