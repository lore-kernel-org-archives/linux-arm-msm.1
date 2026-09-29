Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D00E5226A0
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 12:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790684825; cv=none; b=gvJtcptPDzEngKI5lFhtubSQGsZp6K3vURNHvCew5z0RSSIWIGOPdwbqV540ozOs+cGmMoHnkdFHJuyysEa28h4liucStQHPOIMTVa76ECNINDKmAsThZbVVrgDQfq+82SCHzzOuDS4gKJdrC1kTOZ4galPVkAeT6bdNpUah9Sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790684825; c=relaxed/simple;
	bh=wVX9Tr7HnaivYfdSnTdnsZDeQROujyVaYQOXyN9yjvw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AyA8EEbtGvGJBHKH6Kq4w/z8AYdYWeBxBAzWDQyRCYLB45G440G/YD+fwShhzaeJec9s/c+52dV6R+UBkLYTmvNyVK7p3+DTHY0Sa/2TtDVLDT1gMyHi2sF4aYA+XCLurnUeWDIp33aNXTkm1DqXe+NQ+WGFXwG3uS5V+WLT2js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DK6MxPi2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JUajyaQE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DK6MxPi2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JUajyaQE"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCENiN119197
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 12:27:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	asf0KM7+58qKrDcBQ2kvBbjz43o0vuPlNwfun278XbQ=; b=DK6MxPi2HYGW1rqE
	P8QYmuq9m3OkjpyQFmXRsNteTDjf5RdqJABeXwH9/iSVB3/QaZ7uDQfDz8V+O7jN
	mraYnpAiObh2bFgfNQd3lavmAH+s2VEHzu53LusLNQkqfO74M73K1CgZ/IUmGUeG
	YnkHHBtUU0Rka4gVHZi0u/nnbyAEYEAGH0ruto3Xwim8lXTm5m/6tKspngPxOAlR
	GGgttRdPPV37XukytVtZdE38Xfkplqi/khg6VrhVhRXlv7hm6ls0MQDL3Fipl6yS
	BXsDA9Cj+9fm31Zb4XJRHy2dzuiJcdmQkYRnp++CXC4Bvbx8sZlDBHX6bhHEQY/0
	4LiVIw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0144twnw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 12:27:02 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-915e9e1a5f1so3116646d6.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 05:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790684821; x=1791289621; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=asf0KM7+58qKrDcBQ2kvBbjz43o0vuPlNwfun278XbQ=;
        b=JUajyaQE1CMmEZOfYk4Q+aGWorPc6nrMO0ji26SUdaD6pG3njfV73ZcKLCmaFBtUVC
         kRbtJUJm/7wLttejjUHyquKFBAxJdkNG0+Z9fDRi9ZP08CgITi6bRsaiEq9xECGiGVvA
         clP69exxyp4vOrjFHDpqX26GdJzQSUe57aHKm+BWHmUWCo9yyGY/oxC85Ylr+sRDGmQ8
         nCKonjtSgfhgXXwi2NUF/QHg2RoZ+osSk3rEnmVONJemCE456BNwpRaMO9hN8k7rvHMN
         bNfidNErKLeXZ4NbqcAHTztq9I6V1yyKgWLHpK6NErrNS2hlr3klZg9zWnlLfb96X8fI
         X1nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790684821; x=1791289621;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=asf0KM7+58qKrDcBQ2kvBbjz43o0vuPlNwfun278XbQ=;
        b=lBGrHiODVG+oskPo8cejvA9+lcvrZSo7N0piL4qeOLdYvdPR7U4SKlvAd8sUvDQdbx
         51CeRK3b1JReYQn2HjViNu3WAISNXFpwBzM0h7GtWr52VPFnX7oI3g+vTi6p2ooYSDgr
         9G6LBEBAP9dzpThkitQUKdu3RxorFbrIZJR5IT7fMHCRnV+8hhMzWcCLy8zi0Th6lgc2
         xT+sWa8lsrMHW18ST1bFfH/Jysmogdn9D9bA2vpcShZC+mI2Nxezkc6dB/fMjogeas7r
         Q9tIN8qSn74ZlIjHTHNbDLyg6GK7gfazpNYX4VEQ4npxjt5vWrh2qdJJxTmRQswAp774
         qeZQ==
X-Gm-Message-State: AFq9FYLlfjbeoLJcMQ6MPo69VOBF1DUxHHpy/DCsGjFmSa+vxLdHdV8T
	eVN3mPOTLrBoETj8GEX+rvsjZsqeBLMsV7bhiCH5m8Ip2A4JX0Lpz/EXiX9Pc5FTRwAPCCD2yfL
	layyObbTS+qPaY8wB30+oZUxrCGWawIPxT9KI/fjP//Ix8YDjJoXtOih3WmhpVHlGQAGt
X-Gm-Gg: AYBFou2EEDz4FbtYiDyjsbOJ2MgicrdidZgE+qVVXTQmGrdH1iAheWEU37jNyjnHub6
	IGRPesYbGAiKqK1lgfaaWlGIt6KFjqIV2E1GdyjuVMjZHBdEM5djP6l3iZ5OqNNzyartArq9cld
	ytuznE4nQX1m6elFrwuNJoAvBpZNeomrazYiaGXIzfzWxxvgfNUQofaOwyL3qJEV6YDku390RJC
	DGJu3Mb54lVuQ9Ot5ahkQ4Xs1ws9cfZMT+sc5JN1Jw7c2/DHcwqRZM9bCZOu6+Rt7K9E1kejOhj
	ietuRTuZD8jPwpfL7PA2F/k/ldo9+lDfBDC21cXuhsaa6dAwB1xEVdTXsSLBLA/wVNv35mWJrQ7
	uRChg6enRts3ipt3QIEiXuw==
X-Received: by 2002:a05:6214:2d46:b0:917:8b9f:d54 with SMTP id 6a1803df08f44-9178b9f138bmr19819056d6.2.1790684821145;
        Tue, 29 Sep 2026 05:27:01 -0700 (PDT)
X-Received: by 2002:a05:6214:2d46:b0:917:8b9f:d54 with SMTP id 6a1803df08f44-9178b9f138bmr19818326d6.2.1790684820138;
        Tue, 29 Sep 2026 05:27:00 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6acb9036092sm724336a12.26.2026.09.29.05.26.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 05:26:58 -0700 (PDT)
Message-ID: <b4daa3e9-6055-425c-a5b5-7e3dbcef45c3@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 14:26:57 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: shikra: Remove cdsp compute-cb@9
To: Anandu Krishnan E <anandu.e@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@kernel.org
References: <20260929-shikra-dts-cdsp-compute-cb-fix-v1-1-90e4abb873d6@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260929-shikra-dts-cdsp-compute-cb-fix-v1-1-90e4abb873d6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA0OSBTYWx0ZWRfXxK0eQ46SNKcE
 UIc7wginREOoeGkf2dDuo2EVQNfEK/e3D4suaHpzv3v2TywvH3hfSpYnrMx6JXm5IcRVTfOhXTc
 l+iyAvY4AQn1hEQl5GwcnkbLu4ZzLRNIkTsEteTOrVP0dxcshY2UfedTf5pCaj0TXGURmTakosh
 PHzMCFWH3cH50WK2Moc2pn8KkXaA4RQjI3WAU+V62fyirg5aR6aLthJo8Ttjqbpgu5YOFlboQay
 RsNcyYbreMdyd1e8jjUR+oGJ92iO0XLAbZIQxbwuFw8WCOUANHYquvXwZA3Z7sEZlQijwhIQ0US
 2oc6Zz7bWznYpajgd4bUzHTMrjfs3kaoDDaKWHxa5iU60s7npG6ubMbgprcNlc9bqJ0r7zbioiU
 PfKufhiZF53DSqt45sHDjxurIb+vlusZXplWUnXJCBCjz5/dtKVPEwNIvgk4lPqzfcDfwiBQXPh
 vzfhtclBl4xHpo3VPTw==
X-Authority-Analysis: v=2.4 cv=FJSOVOos c=1 sm=1 tr=0 ts=6abbae96 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ZlKZNMP1RgdhJ0d1o6cA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: eo_r59fa1uf-H7zJ5U5n12fQXbGp0_UW
X-Proofpoint-GUID: eo_r59fa1uf-H7zJ5U5n12fQXbGp0_UW
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA0OSBTYWx0ZWRfX3nNVVUCq0ra7
 0Ue6MwAdfALlIKRSM7i37NuWWdPGRMvxvQjW3LOi6oVzTsXrOhvUeywvdQ9uLTzxKBBw7DiuWi0
 nmyGQbDXwzsuLLcnpCSkxeMggdjRzF0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290049

On 9/29/26 6:15 AM, Anandu Krishnan E wrote:
> Remove the context bank compute-cb@9 as it is a secure context bank
> used for secure use cases. Secure use case support is not currently
> implemented upstream, and allowing other use cases to be offloaded
> onto this context bank results in an SMMU fault.
> 
> Fixes: 8b6f81f7801a ("arm64: dts: qcom: shikra: Add CDSP, LPAICP, MPSS remoteproc PAS nodes")
> 
> Cc: stable@kernel.org

nit: strange empty \n above

> Signed-off-by: Anandu Krishnan E <anandu.e@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
