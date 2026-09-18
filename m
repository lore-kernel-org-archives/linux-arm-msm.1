Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8897F48FF9A
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 10:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789726075; cv=none; b=EJY9lpAeqSjK4c7i3bMu6uaf9RCUcjQnHxCU2n1+oJ46CRkvAZ4Cd2E5uxDfy2vDJJy51clZgHPnA7MoZ/6gHaKcEIvA3KjGixEbXDNVMjuPW7nzK2ytMKQIoKHgFKjT7jPCA3OAOYv+z9WHq+TefcliLmEASA6rxJOFMG2v/BM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789726075; c=relaxed/simple;
	bh=ODVmTkrsZTOLsERs/mMFzF9HF4r3N+YEx0HdUk9SIR4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qxnQJ4QBp4vcf3T2XuOL/zTM/b2F5ccMUe6af0KtTy0I91o6gpliqjClUITTQslEunFhrJP8XbzMniXxSTgGPbg4CImtlgt7adojHlC37N+GMy1vsodARdrMFRK6THD+RQS2Pb+JUa86adfTpx5EUaesSghMutLU5hUGVFmNw/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ogUBvaEm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GI296D9P; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ogUBvaEm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GI296D9P"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I9dPSV250743
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 10:07:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IyLsqrYOLhWluhFVI4TOkNjyOepG5WLOoRC8Mfe5u5g=; b=ogUBvaEmTnaaFXm/
	jW00N+7dTJd7RIPTsJvwzFnVH5ua68O9Oac4uyIem1BN1H8JcXjN73EGNYeNhiu8
	y/ivgbYkmSRVRz+FGpLMzdDQiwmVzrd4imP/0+rAbW4Akp8A1W9koKjJ6seGr2wB
	fXF8Xq0XWEZx9vb76iTYZzjLAd5eCtb/n6nBGOU0mCpD/Q3uzFo05hvJGmLgIQOS
	mhEQBZ2cVh9KpTubYIug6fHCD3c+mqjK7sOtJ8ap0eVKFI9KW7uWX5suRDGhjaqQ
	7hziXLOzbLIphRo2gGwA159IgDcOOmf7ej0OWx+SY6mzv+oEc5wndXFEBUN5J4Ea
	AIWAjQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gs2390ar2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 10:07:51 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9375d92d0caso12851985a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 03:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789726071; x=1790330871; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IyLsqrYOLhWluhFVI4TOkNjyOepG5WLOoRC8Mfe5u5g=;
        b=GI296D9PWngPqc1qXiTqL44peJTy1KSwaMwIgr++AJvOjp78N6XToRJC3dLRUVusYY
         dhcE1jgfpzoaehXoyO0PIBMcX+KvF7xWmVfHCYgDcc10BB5aXjFO32qQ7OB5ailPkhju
         Q3iNrL50IR2fn7iSCSmHyO2ubZetBxmZElTxgIxT+QjiOmWerQCUbNA6/gwWrHUWgC3R
         wiwpuJnolCL4nOtd1TuhIuq9M6XqdZlUdnnK/Yylmdq9rf5lWRVvGMR+XIKmLdAoRkt1
         53nX1T6gYECBt4HxPT+NwJ5ANnzW19gI8F7eABTYS9LbfjzvkSx0QmhD6ZlbkPQpp8s1
         kPrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789726071; x=1790330871;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IyLsqrYOLhWluhFVI4TOkNjyOepG5WLOoRC8Mfe5u5g=;
        b=fVXstQI1gFySm6SLAdmNj/X+0VlnbRL+8qUyDOGUXO74lM9wNKGxR/eReFyp3M+M16
         cJSynz6WhlpaGVOHqSnit1QW7+0UqHdScGQ9bmkUy1EfDJ+x7RrLWB3fz07lIgWEhpFp
         riMd70ZfLTrprF3eWU0nhovoTBaa0yEfrfmwL9VF7yqoOaBfyKuNAyekXpeCFC664AOT
         bxPRwCr3griTLer6RZa4xUozSWA9ZA5BmXKU0r+Amo+mVc3WAEEc27VYrsdaddENS8yq
         pdCxTyWqQ2f4mzE1VHZq4E1nZ+UPKSH9Q0juCNgAXXJ3r7vT7MjKKmt2mKKvZB2mmk0a
         /Vdw==
X-Gm-Message-State: AFuF++nipRmzXU+AAzPmOga3X9jEJGl7D1PDNj50iHwcbJVb+RrZOwiy
	oUF1wOO/QnD2AuItyEEKSdlbsyMvVv0khR8D8iiB7MNvVtI3FIQVmsg0NmR2Gf2OdG1n5ils5gD
	b2r0ENRnWgpxSalt+FibIdqY8aJfazgxvKuZRKBx0Z8G3Rx5C9W2mczOtZS2CCXFdDKwJ
X-Gm-Gg: AYBFou33E5C9UNohl7mR0Tp+CtGD01PhbidJo4IDum6RNE/pQAPSzwSTu6SOBOkU7WF
	sKKFOG/yqajGqcHUCOF2BT5eZHYbR6H6NV/Ydah/Rc5CwNb2vcwWC6W05g2aLtSWayqCiKJQFki
	6O2GlKz5hUq40G94zsM2vmX8DKTSExfKwYQKVuyIH2KUPgddWYVmwuEKZ52PU4pfbCRpo1RiRBd
	euvbGYr4XAqurvBbyV5QddbcPE78Unz3nDzHGIVHH3fnjqcIiHYWTP7iFrRyhsoV6LC23foNTUr
	R/vE03/cRhmZ/8ISxMA+/TMv3mgHxmw61n3+4BKnAZtHL+PIQoh+QkkhC2CrPoZy+nOvGEnRN0Y
	JEhmfrrNhnGcK7/kT8Q8udw==
X-Received: by 2002:a05:6214:e8d:b0:912:16fd:b389 with SMTP id 6a1803df08f44-912570aade9mr24560176d6.5.1789726070956;
        Fri, 18 Sep 2026 03:07:50 -0700 (PDT)
X-Received: by 2002:a05:6214:e8d:b0:912:16fd:b389 with SMTP id 6a1803df08f44-912570aade9mr24559686d6.5.1789726070480;
        Fri, 18 Sep 2026 03:07:50 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a1bb08182sm40252166b.15.2026.09.18.03.07.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 03:07:49 -0700 (PDT)
Message-ID: <59205ec8-78f9-4378-8556-6902364b9f54@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 12:07:48 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/15] arm64: dts: qcom: sm8450: Move PCIe phy and
 GPIOs to root port node
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
References: <20260917-root_port_v2-v2-0-6272b7caae9a@oss.qualcomm.com>
 <20260917-root_port_v2-v2-10-6272b7caae9a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260917-root_port_v2-v2-10-6272b7caae9a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDE0MCBTYWx0ZWRfX3YHcqYt3kjcn
 hYyZOKU8xkfCh2SkMzlhAmDPBGQq0uBwNteIqk7CHfEh9Q9pilZANjc4Us0alhiFfMR+qKAaLho
 LMBYodBSPBBJtwXUp8A9MuNJlXaOkk0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDE0MCBTYWx0ZWRfX9eV4QHmhyLtO
 TEuaS93jf3MXPZSToN5UoYUlg5Yi3b/d725k4iLw1yev4oNgLwUIZb3VLpYCmx+HJH4eMyOkNcA
 Xg091/vh2PueFLXVAj94texyQzwyDIrfiZGJzPblxE40EdCS5MI/P7FBiDjLP8C0vLqT3XI79m0
 E04DGTtyps3zYPuvqLw2PqeF1R4qFq3nlmKz4bAGT90fz47Wpzr5ajqSFtIBg3hQE4Q2kswF0xz
 508Sc4R6s2GIU61byee5QH7EPl4E8scyMttGGKt+gF6FAAZn+gMn6ZEAlD0JpmX4jQLLsUEd+Rs
 DJqmW584AL/iaAqe1h7n4qGUAmAY6ZpSFKYjXe75txbSZkhIYACf0uMtCY3xpyvheUDmgu32Sct
 FDPQ1UFqHJ9cZ0NT67g02am6KCvLG9S9ChcQth12WHp+xB2Y1FowszLw5oBXgm6HDczeuX26lGm
 DFWPzgS3mX318ukRxpg==
X-Proofpoint-ORIG-GUID: Sq6lsRnNHmyLQ4mVd5vlQRaeWZmPEWVB
X-Authority-Analysis: v=2.4 cv=I7zw19gg c=1 sm=1 tr=0 ts=6aad0d77 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=6pHcnep46kEejBPVP2gA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: Sq6lsRnNHmyLQ4mVd5vlQRaeWZmPEWVB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180140

On 9/17/26 2:25 PM, Krishna Chaitanya Chundru wrote:
> The PCIe phy reference and the perst/wake GPIO properties are
> per root port and belong in the root port node (pcie@0), not in the
> RC controller node. Move phys, phy-names, perst-gpios, and wake-gpios
> from the controller to the existing pcieport0 and newly labeled
> pcie1_port0, allowing board-level overrides. Rename perst-gpios to
> reset-gpios to match the binding used in the root port context.
> 
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
