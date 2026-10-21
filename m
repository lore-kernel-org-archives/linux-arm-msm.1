Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792572259;
	b=Ri2at6Hdi/USyUvtEndMbMnIcdv45QT3hMCmPgPtryC74Lop3msA/GHiKqAzA1ninPpZ
	 zhnUqO8vZ5avFwIb10gnyKMR/P3jYtz4yj1avhAukLP++XKHNXUPJfZndlIEIX61iRkYg
	 CUIWha9n8O+MHKyy4JWajzKaavPD/t7h7Uar9IXEgQaC3wNegx4i6XxknvuMUX1F1HiHH
	 pQ7eJK1e5/c/CoFBdr+MWHyaFl8Ww2+pKeE6Vooci1BiUpgj5XtBfzhhxc6OAUi5vUwmU
	 9qz9H3PKxbrjMelmY/vFY2/8FPKZU5D6gMa7e9kumGq/pRe8P6HtWGbtNUssVbWkEeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792572259;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7zeTZgUgaTV5J5UofPRCsdZt2a3+CBBlIX0V3IuvJFI=;
	b=O1tG7TZO1zhNrTkAkqiuWXaQ9YWFKyZomf7ru+Cuik6dcbiTwO5jDHX65jPAYUaAs9uu
	 2UUdUUmkqXydxfZK3DMDGMMWczIDK+y/s1RtERWjOalOohEUkbuW1mvXdEIovGpckJ/Bx
	 K0QoJ9vT2D/OlQ8M0vhJh7MgAPAlrZZFYMS2RV14jrm1J6e1fKUdJrCXiacN7jKSx2W7q
	 C+0MTQb4lp1yVMD29VOG7EhpiaOmf0xpOfGL8K2domoVB3WDJ+5VIaZpJP6FVP6ef5wfM
	 mLcystZ65T46KpwWjOMEhqYyLMvLnavYDQdgvL1WEjYphmdYZ6FrEgOGVN2WMv4WgvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hpOfuolR;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X6o3TTCN;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7322C606A31D
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 08:44:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7322C606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hpOfuolR;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X6o3TTCN
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5jL7W2848643
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 08:44:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7zeTZgUgaTV5J5UofPRCsdZt2a3+CBBlIX0V3IuvJFI=; b=hpOfuolR0+jKVMpo
	33QmtwARAa+o9NzRh5dyf6IyBefKjPOMZI1lAepMKOlVF9J0ePEmagdaUja7zH2t
	ISBiFiYMRGti7H+dW7oAYM/zYjPE0IKzN/3M5fYAwVhxOnmAcaRNI+luwPePzVHE
	yFYHtBos0Vl5GNjs5z2EslrvwCfVn571NuB78rxe8Fs3CH3iofKDzq72CXBPWoA6
	qAgdVjlPtenDeTuaCRcjbyhYznntgOahi/faGirsK7e4L+yUS6e3jysAFOYhNqBM
	AmrC2VZeims1+NqF2j+yCkz0ZV8rTbioXB9TOFiY92d4Dc/ywx8yTkNP9wz6Y/+O
	VK1pWg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heeb9asdg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 08:44:17 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f3960dca5so16072085a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 01:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792572256; x=1793177056; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7zeTZgUgaTV5J5UofPRCsdZt2a3+CBBlIX0V3IuvJFI=;
        b=X6o3TTCNv/y9QntxIJEp67V/dBBfFOfz3HjJWKE3DHaZ9rMjLCzfNGu03+H5DFvM0w
         PQgTSbiPec7AnMHYSoeRgTegox51XNfxxjG0eEjvFctZrSo9vVbp7+6jlJe6RPFuth+g
         rFz86AA7WosIGdmFTdqBCFYHhXscDJ9EJuV86y+Ei37B65WO6OKRDpGCm50xkw3uaPke
         fOKYqb3h9LrCflTGsKScktHexCIN2lTxLsPkc8t0A9XgyRW6EnKIkHFGu1j4pGBMrkGN
         EN5XoZiYIh3SdlFHHo20x1JCbEwM7sSi1kygrJeP04bFwxNcRCdlFOdCVU0OUalzXwQL
         9KZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792572256; x=1793177056;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7zeTZgUgaTV5J5UofPRCsdZt2a3+CBBlIX0V3IuvJFI=;
        b=CYOd4nqKUzl6jeSSWOdkFtf8ptEZMXLpEJz1EB8KLyaLBhc6nk1VUPEJpsjJ1H8CIW
         S2wwPlktR1wh1bOFBNry4WAKYepeEU1FXe5Ye9oGe3X6F7+TkGyRvbwnSWImSx2MQtay
         8JbZwA/SKNnJNPO91lqr8LS0B0+jo78ELE2JajApAHXYLcp6aaBlcF/7k8rUW5wYiSzs
         eqb8lezowbhmYqLPa5AA2FSh2mp4qqYAUCHTQgxq+ivmcjQ3fCUAD6DBiW2gsWLe5oUX
         +Q8NNx/Ex7SzNSnvi5vZO/zs+JTuPUYQhK//nnz4BoRiqOh7oyCIscffgkwl8x1RD367
         3aqg==
X-Gm-Message-State: AFq9FYJMkkoZut8Hv7vgi6vadx7Flu2P4LBCsBGssk6AmsEOmzb2YF7c
	pMd2kVfGh8QqceweMUrrYl/c8s5y4jE6WCxaJACZP1SYueWfnEvlYHl5KhaEBP0mcZ7QTnlQJMv
	AV00iBW9+waRlVKp54iyRewIHEWUBfv8rvMMqTZGvVvejZlrqzB0M2t9/2/FX+icR1gKd
X-Gm-Gg: AYBFou1jqzqgEb65QscJxw9kPqXaHIS98xC6B56onaf+ma7JzJCAq0dOwRDU0hEPdMA
	bI4zXa/cerKhgCjlZJPAn/pbPARGPsFzsbLNt7M2mknJH+Kai6tR6ZXFLWWo023U/J8Yvu1W0kz
	kzJY0Cxu0lsnswg60HSqsNS0UErg9K5o4EYl/xTFPwjQ+HVMUSA0rRYjj/qS0HkVJFuoM8bFgk/
	CWdG+cA60DEEX6hjWJgrIE8aA9gl1iqfowfd/qPhvF6SfHcb6559F/AJaqgJ/Eh0ZtMUBbIW2l1
	NLGPDZc1YX2mFUK+fNfh9bVWL9V0ztSc/DwNmr1OhTDgWpdTIk/QQygSu4VBGevT90trJeAZfME
	wnhAOWIi8g6cHj6qcpLi5EA==
X-Received: by 2002:a05:620a:800c:b0:93e:5a3f:ac13 with SMTP id af79cd13be357-93f57dbbb66mr348786485a.0.1792572256565;
        Wed, 21 Oct 2026 01:44:16 -0700 (PDT)
X-Received: by 2002:a05:620a:800c:b0:93e:5a3f:ac13 with SMTP id af79cd13be357-93f57dbbb66mr348782285a.0.1792572255968;
        Wed, 21 Oct 2026 01:44:15 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4030dafe2sm602667a12.12.2026.10.21.01.44.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 01:44:15 -0700 (PDT)
Message-ID: <6659599c-68f3-454c-b461-1947afa29ced@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 10:44:12 +0200
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
Subject: Re: [PATCH 11/12] drm/msm/a8xx: Switch to generated protect regs
To: Rob Clark <robin.clark@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Alexander Koskovich <akoskovich@pm.me>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
References: <20261020204728.28844-1-robin.clark@oss.qualcomm.com>
 <20261020204728.28844-12-robin.clark@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261020204728.28844-12-robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzNCBTYWx0ZWRfXwz0FpEDqwCZE
 7MOyRQ8aOk3Qo45w8nDxfOHR3wpS784Rex4l7GHPullSTmNGoQzMVeC04zT9dAJip7Ejz8osuFW
 gGoyS+hCJR+lmiN10///GWcHfGIalmM=
X-Proofpoint-GUID: 3uawlLz8mzkUSjOUk3wV5_Mv6mncqxRC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzNCBTYWx0ZWRfX3jb1N5+FUJLl
 waz67v4MxKSNJiR0tPNDI8Q9fsdF8JxikC6hA4xFNsN27Mf512lncG3LZ0Gr7+GgVJPVGEgga1F
 yvqmE2LDOMAA/YirEMS9CgTno8Npqh4osGdvkSPhJiSt5x7LPq4WpidA0lvBks/++cEq2pViOxU
 2MH4S9IaXm7RJ7IYvssJ1XcnS1k4p3Y+sVEtxOEn6NzUoCedhfDSRdD1XwlaHcBUzMyh/UcBPia
 J2iiOZP/8ORGsqNFsmrFMogWLd53exeAp5m0wyfjUhn7UEWXG0ZQns1VkbMNsbER5XBYEwM67Ui
 67feHGUNbza8nY9ITg373QJJpyvbeXF9Gz+Aa0fC7jomhc0CG6IZQ/Rrt0D2kNKdv2VP60KNHbf
 c4EywdAnIEqieSjJRGTnpoPyz34XLfiK3UvWa84OlSWkMPX+d4cWNNYXUKobod/cCeJNebdMHfT
 WtZtt61BRESrgDFVSmA==
X-Authority-Analysis: v=2.4 cv=R42WitRX c=1 sm=1 tr=0 ts=6ad87b61 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=Uo0wf__DB8OGiezfqlwA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: 3uawlLz8mzkUSjOUk3wV5_Mv6mncqxRC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210034

On 10/20/26 10:46 PM, Rob Clark wrote:
> These also fix some perfcntr SEL regs which were mistakenly blocked
> since we previously just copied the protect tables from downstream kgsl
> (and only sometimes remembered to fix these).
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
