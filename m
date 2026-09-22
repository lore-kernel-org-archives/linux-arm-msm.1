Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC79646AA8D
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 18:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790100624; cv=none; b=UmNzZuB9Tws4pSua8/NSIYktTQqN8hCAW9u/EZfADJvjIWuNyEsLgZHRpkJ0UIQGy8FSUrZOe4Q8BzJcTf0bZP4ZCkY0aRXnGRuoDnHEh701D6tq/QfaCRbfht9WlsdrUVdUh6Mal9k/KSaZq+SkJLyH8wDmVT3DX0iWGjGstvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790100624; c=relaxed/simple;
	bh=Lhqa5FPuJI/7ZwHwFoc5BJR+w4pkCdSYjJUWN29IEeI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=na8VXiHxpSzA2LKklKa/3VT+Xg9Qu6gMsMMfmVuq0b/0el4FNn9sjY9eHs8tBEipb6HQONHCjFH66qX56B7hQ+/T6o45cEmExD90ZyvvZb9SpaRnAIxMdwlwI2oVAooVoCFBQWv2L8kC7XY7Vt/c8lyw/sBh+B1wZkvYGMBYWMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XFYlyaf7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O763qcD6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XFYlyaf7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O763qcD6"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MI6wip1873472
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 18:10:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cMGKbEn4nCSVnNp4HH/7UejWSUwgcuvmnhDSDi2jIhg=; b=XFYlyaf717HVkhsH
	x/3xzhnZ591xx/EVvHKtXKpI9L+0t46d6c21gZ1K5QucT95MNcJ5cRR746X8XctU
	Mok2bflXxqBsMLYrE0lw88JSiGXhL1pyPEzYYjrUAoU3tZTqfwHxW6SfYdgBc3zP
	pbGSUU/zsY7Nkw/z2Rsv8Go65VUw0Pguxo2Ee+Tq1bzpAQp13ta+ERJQXMoNWZEP
	h/RlRcUUQyugbTiZVvam6M237EXum+CzYK7RY0rsI4HOjPALDl5Lh4N3srgj8e9P
	v1ZqcYJNNTuSpIftuVrJctUBrmi12inSokzidqbIJP2FNGrZPSao6ZU5cDkxCIDO
	FdGuLw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guqk4t9k6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 18:10:22 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3286d2bac04so62230eec.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 11:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790100621; x=1790705421; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cMGKbEn4nCSVnNp4HH/7UejWSUwgcuvmnhDSDi2jIhg=;
        b=O763qcD60gdYlb7errbT136WS0A/Pq6Amu4WuJWOuavY00v0phOYwByPGNFoQ9SAgu
         Javx+wjYE0Br6Ocrjrdn4OV+0hdDVSHvWrjo8fiMlLTRhug5Y3szbdDnd/8cAWacfUTj
         tCsJBTODMZ3tpTBq+6zoJPJrcIZvvWaLh+zy/LNr/UCF3MR6VdepmS2arTza5gh4YHql
         I98b1GGA8LDk0dVSZXzY8D2abCjaTilbT00UFwTlybhJ5fT96VnoZ7hue6dG185ni8W3
         j/AlWemXs/kFLRS0xS2ZBCCW1YDPIvyycLvY0LLxESeWdPyRKBWhohvVt7VfquohBJrq
         e0Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790100621; x=1790705421;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cMGKbEn4nCSVnNp4HH/7UejWSUwgcuvmnhDSDi2jIhg=;
        b=tDvZO918l1RBPCTiGqrPwMg9bVOlaXj1e81nod04Lrx9k1ZaY5h3Q12RZdtHcHIPQa
         rgEfShqAMp27s3a/RnjYswrbVV15icLHW/pCOZ8hTq08lT1Rvqqbd24xpCSerddBLV+z
         G64sD9HbUY5Sxx/MBAOrx7bEho3BOGZDvgFcKI0lkZ8mR6maZ3c0Il0LHu3ho22KqJWc
         C/FklnnxAxv00DPC232ClESXx7MEkAh2gi8W7ABO91hOQrkCNAHly2sPV/qG8f9piPy1
         JMTnDCKdJ3RS2LD46g/IVeVqqjXStlXEdkC9z3jyQKQjC0jvfDi8UrkkSZQ3j9NgQpo0
         jXyg==
X-Forwarded-Encrypted: i=1; AKwUvBy30VV/JgL9iIpFRcFJO6flKOFQMO6Quz1QRQ5VaCTbvbzexxtsV4XY1tex/c8ZHG5SEGHIgGyX7yUq7Zmn@vger.kernel.org
X-Gm-Message-State: AFuF++nwOeiS7Y9dZY6iNYxs/M1bOAB2HSQRqoyJ9W4iq5NpOqVQ5zQl
	Y0YF1a1HYY5i0/icCDnbdkib9V1OsS+xuKpZxgUT593+PC1RX/gfrv92OQLXv+xxPv1O7OOsBYg
	yE3Tg5/qB+UyroK0WwpwXEyni/s0BRgNHlY7MkGvs+DGf/aQEdDBg2bf8DqXJWH3Ez8VPw9ghbe
	VT
X-Gm-Gg: AYBFou1KAcozu6kJgPaBAGlR3w007uTzcZY8Y8aEK3WPDdwCRVLOVNgyh6Zsk6TbCsH
	6dbAO0Ek5hCQtRSJt0ZhQTHOqMcIOZHme7BwgGKnHjlllJyJFKukbstCVgqgrJO/gwbJkSRf/WJ
	ZUGSsHA2DBVJEqHpb/aGtvjzvgUfyYhPS1TeyDrGbBAK1dl4P1LVZ4HH/tqtrYO0FGmgNeb2qir
	mu1HnqYJsPCzmLT680/qF2lmHQz5LQRaKj2maLmM9Cg2p5A2q/XCbzkii/2PACYwhmxWCzwNiJ5
	SRsDlbwttUW2gP1vflt8Mya5F1+HsKKBFa/dk9iR+l71jqE1Aig6amsh975FKFCQGr9IDYJuNab
	iEnRQDPt0ulscrngcJxslK84KSlh7iPcUeA==
X-Received: by 2002:a05:693c:60cd:b0:334:6c90:61bb with SMTP id 5a478bee46e88-33e8e1b1b66mr132195eec.28.1790100621431;
        Tue, 22 Sep 2026 11:10:21 -0700 (PDT)
X-Received: by 2002:a05:693c:60cd:b0:334:6c90:61bb with SMTP id 5a478bee46e88-33e8e1b1b66mr132120eec.28.1790100620512;
        Tue, 22 Sep 2026 11:10:20 -0700 (PDT)
Received: from [192.168.0.172] ([183.83.143.245])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e95c7c63bsm12881eec.10.2026.09.22.11.10.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 11:10:20 -0700 (PDT)
Message-ID: <3e4dbdc6-692d-4caa-8f60-f0d82e894141@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 23:40:10 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 5/9] media: iris: Handle CPU_CS_SCIACMDARG3 register
 write via program bootup registers hook
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260917-glymur-v11-0-e0c8bc914742@oss.qualcomm.com>
 <20260917-glymur-v11-5-e0c8bc914742@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260917-glymur-v11-5-e0c8bc914742@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDI2NSBTYWx0ZWRfX1E7e602ybzgI
 0iAamiJwLrenYLgS7Jpys8EK7M06q6lQdDKKU7FcFTv698Dc8Eq4aRRgFZpHYR02x6iNPSZnOKr
 eN2a/irTrFlFUo4VUykJYB6Nv8V1BQfOEdG06N1IanM3pG4lu46UaDLgpL/xNdc+XOR1hD0pLK4
 JyhtyEeZGxpe8cT0+gR9OrUblD0Z7qmkd6WmYfIklOtY0FuCUOlddgxIWhfqXzND/NkfwAoP++X
 umc37g9qmsBPDYOSBnK7RPeKyn15njlAZOes/Bxx4lodfsblkrpkcdFTk+0mxdhctcU8r2BJqRI
 vXVGemE8FgkchiTlwx5HiejIkEjOUd4eix+1dfGwp6LJ3ZkRHqzA30CQoSmnZ/diBt7cXfwUrmI
 fwrqq0rjuLtqH6J++V3xifwyC8HF9TmBN/FuxFaPpkvz5xUv2RipuSbeqV7rZ1+1SppGQyv3CQZ
 k1zDQIrBQgVhfUA4Q6w==
X-Proofpoint-GUID: iCZcEGCNijfAcX0yz3U6AgP2X1QyKakm
X-Proofpoint-ORIG-GUID: iCZcEGCNijfAcX0yz3U6AgP2X1QyKakm
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDI2NSBTYWx0ZWRfX4ABy2dhOVebb
 +vbRe9z4/fh/1Qiln68y405J+Vzbd+hvVghyuviChW7kHVem3AXTvcQhAwNvEguNbolaCFeaQ3m
 3CCGI5X++ZLFO7hCF7HO7itqYGXJAV0=
X-Authority-Analysis: v=2.4 cv=XrVvqlF9 c=1 sm=1 tr=0 ts=6ab2c48e cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=d+GKXRUq2vCLDWIvqUj1TA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=bJ2oX7-cLgL2xx1Iw9EA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 phishscore=0 bulkscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220265


On 9/17/2026 10:30 AM, Vishnu Reddy wrote:
> On the Glymur platform, the firmware reads CPU_CS_SCIACMDARG3 during boot
> to determine the VM count and increments it by 1. Writing the default 0x1
> causes the firmware to treat the VM count as 2. To avoid that write 0x0 to
> CPU_CS_SCIACMDARG3 as a Glymur platform specific.
> 
> Reviewed-by: Dmitry Baryshkov<dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy<busanna.reddy@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_vpu3x.c                | 6 ++++++
>   drivers/media/platform/qcom/iris/iris_vpu_common.c           | 4 ++--
>   drivers/media/platform/qcom/iris/iris_vpu_register_defines.h | 1 +
>   3 files changed, 9 insertions(+), 2 deletions(-)

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

