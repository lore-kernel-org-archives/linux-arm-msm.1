Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4C5F4A9D6E
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Sep 2026 16:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788366416; cv=none; b=bRoY2ajKN1wZwIwDYW2xLV6QtO9proco5FrA36ZYOwPa9XZZ0UVE+1XfeDo5OfOes7kDLW6F62r6pm87ARoBr6mFdT+V1WeKvQMlnk3AgHi0KjQWCkRPCWCB6NFiFPKRpaLSYmPielge4ndploiWmp34CPkT8j0tRE8k5s9oJk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788366416; c=relaxed/simple;
	bh=4V75VXPdJsV3etEtmOB92/leTElAobw81eFBDOD25Qg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cOCNl3EBEbJ2b4goDhORnn6V3lGALZmLMlMW24JcsaNb5hULQyD4daYzFTP3I3dNE5AHt949oeQjAkxp0iaDqp9PSKD8xsvwWxYAqNEB8qXZmtQaD8hIHpcUjs5daN0FawIPm8/eaUFqVHVRZHxKlO0Wt0SkT1gUI+irYlgjQkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DgsmkQRr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XCyGuBWM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DgsmkQRr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XCyGuBWM"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682FZGF62670701
	for <linux-arm-msm@vger.kernel.org>; Wed, 2 Sep 2026 16:26:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d8GmeZDaBEbzaZ8I2SDdKZrPLXHH/1Qk7o9QmMFbE1o=; b=DgsmkQRrhtcjid92
	Znhb87lnm8+WWhMHrKl4p0WyNyWqrewdrlmVza5UDPrH3MYl7DzjF0C5lZw/PaTl
	7uPGMMKDlh4SX7v7smfmyUSh5QKzh1vMweZWqXs96TeLjLkMTScAcpGCMWdxACeG
	wTE2fEdTBY+znffYJ9zbVlrpQifwrWgPgPjLhcf/xlw2SMnCoOPAfk2J6ZCsvpNO
	tStY44Kh7xJWgj6Ee+rMgVHoMBKusCib/w1SGWRASmLXsqkTxc1lpg5BzIPY+TGl
	znGPSYtEAWTCtaenIXJnlJ5vp3swrQrhKAkZE5H6ZeeIgCK62gjPvfUZZwnWIbz+
	DomOCw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gebsx2wpy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2026 16:26:53 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93821883e26so34128785a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2026 09:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788366413; x=1788971213; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d8GmeZDaBEbzaZ8I2SDdKZrPLXHH/1Qk7o9QmMFbE1o=;
        b=XCyGuBWMANu3f3U1dDXHchKD+ICOwliLmxw/EqwtoCNt2AeSTq4t2qVMzEmcfCU2N1
         P6CqlcSjJZ0JGBJEOwmWVAaznIj3RKpyJyHoXUYVJZ3JRAlQqSlUSZT5/IbpBWIZHxj+
         nCacCl+1ezCtwfYBBF3SQtkBLdwY6cdNstq0z+BgFvCf3/SuTZS3KC+J+w+twtOxUwpo
         KUxetH29XAfsxsydlpNBev1Xq70be4h6VXww9AiDXojBc+hshDJo6epxBCwy1M+nf3eQ
         thDvDj4eoqLaYhFpGr2eprr/DmEqF2lGgEtxSfJ5o83+BHO0ukoumBerZSYUupw+2Vdb
         7t3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788366413; x=1788971213;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d8GmeZDaBEbzaZ8I2SDdKZrPLXHH/1Qk7o9QmMFbE1o=;
        b=ShdIBN3scvfMWZyTvLC/xqSqtcnT4EIqq1q9+jzCjh62wI8Px8I98hVgkRzhn8kuQh
         DUW/kbslqjpqpp3SCpUDr/mM8j58gReF4mUNsrlDE2HxRVkzCFzzyj5SuuR/oH5rqtHP
         iT7j/Ntly8kzQ7H1RnDqZT3WzXqnVHBtslhNFBb3U+EYGvvvY7o5fy1YKFaeH/7RSSOs
         XOxDicnmqZ93sAxOIkjBF81xjY561/cXWHfVZ0Oib782CQudsvrzOuRdb9SxBSdJFIQ6
         9o6R09o7LuHHCPn6Zyviv2Y83acQRuN3qebZHSRPfeFWNge93aqwCbaLR+6BU0r1TVie
         1N9A==
X-Gm-Message-State: AFuF++njtlDv8aJ0letZsilLL2eK0E5NmlqKQWjyuVzXgNlyAJ7bX1vl
	s7nCp9S9gM6zwd3Lh0+LFYm37YxaVxpuaFFJ9AWXKaT4G+ngHEAjQdFGXolJtr+Vkb+DJq90Aqr
	cIK5hSGD6DJaeXQlIuSj07iLaFHKh6zLU2I9FjbZ6rW2eQjkkfpx6EFd09bNL4e1SzZtg
X-Gm-Gg: AR+sD106nwYp0xeQsTqwmRrkxDvxGHfJ0AEzV/v34OZt/LnFDyuB21Gzc+N0d+NVtcG
	y1U6DClOr5bsV0lQcB/NAYBnrF/TlszAU0iFKJP34sLPTio1YPSg8224vx+xT3uoCERdlcerfZf
	RSDyISsYG6EZLVTjh3FGQDmzTDLxeheEQ8flr32LOMW6gKaWRJYjHzQsu8AUX3MQ01xfHFvYBwg
	4EqOmX5Z2mRlqlTyhpZmbL+oSdLmJQB/bVM2fVj3B6kzfsP2BtU7mJcTMZ4US/rcpvyE2c8t+Lx
	y1TNn6SEMhaL101JP1CtwnhYmFFqKDf3+S2ZoPLlGJvMoIpevylX8AbyMcoM4VyWeb41zCHobNU
	YXWi4eTVsQPQQO4e5IfqzfQ==
X-Received: by 2002:a05:620a:236:b0:939:6c5f:9a8e with SMTP id af79cd13be357-9396c5f9b56mr101470985a.0.1788366412826;
        Wed, 02 Sep 2026 09:26:52 -0700 (PDT)
X-Received: by 2002:a05:620a:236:b0:939:6c5f:9a8e with SMTP id af79cd13be357-9396c5f9b56mr101466285a.0.1788366412214;
        Wed, 02 Sep 2026 09:26:52 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25cffc70fdsm163297566b.4.2026.09.02.09.26.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 09:26:51 -0700 (PDT)
Message-ID: <11ddf6dc-f943-4070-882a-f60733dc4f71@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 18:26:49 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V5 3/3] arm64: dts: qcom: monaco-evk: Add SDHCI support
 for eMMC via overlay
To: Monish Chunara <monish.chunara@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sarthak Garg <sarthak.garg@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Shiraz Hashim <shiraz.hashim@oss.qualcomm.com>
References: <20260826112456.482982-1-monish.chunara@oss.qualcomm.com>
 <20260826112456.482982-4-monish.chunara@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260826112456.482982-4-monish.chunara@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 2MEZsRhM6K6peMtEMRaaw2zLjZg4_ax2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE0NSBTYWx0ZWRfX9MEZKlCx8zYm
 hNhVC4F/LElJOV4sCNpbtZP5BW3n4gT7B7Z4VlIk9OGTH/6s3AgQXNVt+Q+nsFZPfL8P43y47L2
 uxHt4WksF1/r60ZWmSJrmx6NbbG6PHtxXRnQ6OWj7/dABaSYe3Al4rY+H4J/xomC3qM2A9Rr/ZU
 dVN38W1bziLMzQrbU1CtgyuQBuHNYxFFn+wL7ycOGJq487Sj0z5n1oh6fFG/HPBNIejar4BQjlp
 5OeyBiur4/ggoHLLy53H7iOqsfYAXSrmpSNHRj47TAWE5bffz6MNryH2HZ4cm2x8jYHaiVZcfro
 nH2CWXeWX+YkmDjD2Vc85VPnPtXFLHzCuFn2+/ZqRUcfrNW8f4qqcj8mtYl4bSI8ddTZjeUyUag
 5o+jKH98O5kNWW7yYtquPywxLUu4ChqOUdxGcQQSqUWJZv4jkIAIkdmYLm9vPOKt03FzOK0Sq5H
 hW6TXJBCtEc8EIPxV7g==
X-Proofpoint-GUID: 2MEZsRhM6K6peMtEMRaaw2zLjZg4_ax2
X-Authority-Analysis: v=2.4 cv=AufeGu9P c=1 sm=1 tr=0 ts=6a984e4d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=sfNJ4pVXpVnTwTOAvM0A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE0NSBTYWx0ZWRfX+YhPYN1rmgkN
 EIom2wmsz9/qtCbn6WZzmxBb43r8BCjkoROVCngzGnce9jK+aVcXRE66THSRwtew+yIPVuCy+6A
 Kdca068QuVdnxHwPqg4b3WyVfv6UOgk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 spamscore=0 adultscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020145

On 8/26/26 1:24 PM, Monish Chunara wrote:
> Enable the SDHCI controller for eMMC functionality on the Monaco EVK
> using a device tree overlay.
> 
> Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
