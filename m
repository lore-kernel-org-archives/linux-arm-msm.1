Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8E0042E43D
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 11:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791804486; cv=none; b=FUTsMvOaBGsA5Y/enqUXbBEguvAgaUPXlEvjFDnt7/CGFpNSyt4T9mLjioHkM4GNZCXUXYqZHaIIbrb+BBlxRYrdp2pBniEBSG6cvvCgS1MFinZl3q/4dczTGLyYu2XDh4aHkl8SVFcdSjkmZeYy/nNAlKv5JMyoerIQe4fco7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791804486; c=relaxed/simple;
	bh=qjLm2iBplbOItMK/nBGuK56LU3E2ytdvfFyzPtdXtAY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V0F1Mp7GNp2qQ0HpuhFazZnAKwQhGsxqa1EPDr7D9RhrKWdUz5DsXNNLlFZYDhCO5ciz9y0dGEHlxzQzAE6XOsznrZ4jOLZKdAxx9tLK6V6VTvz38tF3r3+i4sj/7jOdHaaRedQ/pCeGolInIuS6z/4YLiyW+ATCJUDelLLgbHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gImQNbwd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=elE4aiMB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gImQNbwd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="elE4aiMB"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C8KftJ741647
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 11:28:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h2vh5XXOQ95SCxIAFLYDt8jIXow1InAg31g5yBuaCXc=; b=gImQNbwdgJWauHAY
	mD8xFrawwRgpJu+i5pfErJVfx1bc1+jj9MyTZQz31bEl7BScch7eGz+5NXkmeC0w
	K0Nzn1tXgvaVBKEF1L678T3vvNr1hT4/Wsx4apRrwWwam5euUV2lEaHGHqqY+wF6
	iyzNely90CuD/iVOaErHNoKc7+ibJZHxLi2FfnyrjqL8ylFzmZkkPDomzeZStmjd
	m6hLmXBgxmxklByXqNCQJkUGDrB+O4+k29Am8ycEHZfJw1wlZcXqLf3r8HOCMgY0
	wMU6orZA36xouMkZNPBXW1PnUPROFSl5hQWq6hdlJqg7J+U9tpPbenrev+FHVsYc
	TKB9GA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8j6djq95-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 11:28:03 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3515266f6eeso3450662eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 04:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791804482; x=1792409282; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h2vh5XXOQ95SCxIAFLYDt8jIXow1InAg31g5yBuaCXc=;
        b=elE4aiMBx92RkViyU10SwbV50mh+xHJper0Un3j9s5dckwiEjeRET6mQdTsUvaYN8y
         nx1Zi9EFOkFvsHWpLSdZC/q+/zaBolRr6dAGU6xGGBAWM7ELOH4t/OoTMC3ejM9ItgW4
         ENoDCPljllVUAhF+9XNTGBdoiB2jsIwZt992HPHceiGyOujImM/inH/n60T+L39cYW0P
         s0v6IK69iAA7rLt5YhZ4df76mnio3RoFiS9Glr2UCGVlAlM+ORmtyS4gLB3RroqbB/Q8
         Z0dSnvMRY79mWZF2DeQGg8N74v1N36dD1w5uP/8KSJWT3RHk69SkI1j2zAOTyHB4ZWen
         WXpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791804482; x=1792409282;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h2vh5XXOQ95SCxIAFLYDt8jIXow1InAg31g5yBuaCXc=;
        b=YLmyXOPNItsMzwej2+bzLdOnM5EyqDKb/LkY1VcmghKVEacyqaRyPHFm/bz1Edx9ys
         KCwQoA1OvPU/Qi0d0hIRJC7y5wSuOa2qCuNV2zN1fPAEr+kN7+zyUucuMTOlfAXTfG58
         vRJU2FxMVAs5p6VAV3quEh43qX3HH4Zuks49wv05L2211sq9VMo8TlIqU9sJ1YHUX8ap
         icmspGxuMkDAaJXuQ2TvF7BRMUjH950SNgA+eEKF3JgfrL8oLYRI+co8Ql+AwzlQNGIq
         oDj7sm5elEUWH2dqOH/FX6tyvLcS36oJKmLeXX8Bjipk/NNeuqQHgS8W0itU5zl413j/
         mfyQ==
X-Forwarded-Encrypted: i=1; AKwUvBxu5MPjyNqwMdUWQkzYVU6FncSjBpgEreH9EjreUIYC5bJonrGLiC9WYpxxJPMbk5iAixQ56hJ3p+oUwIc5@vger.kernel.org
X-Gm-Message-State: AFq9FYJJX6w1a/0Zou9G/blP99Hqk5KNMBCJfA9Pd5rwIsgVX4TVeVrO
	KLF/Z51h5gpRTqN2zWsunP13vvu/bFkmkCpKr6NyfkWqxfXB8wZZ1nfAQWvlWOgfk80DlFkx61x
	7vMiorTieEMb7xYMmReDvMbSVJE3karKCjBnow7NssgecQyQagl8zIZGU/4M8BrhU1D8s
X-Gm-Gg: AYBFou0TgQ+/7dDZOIREvli3TvFrG/vlRlwu0OxwuW9GjGS8L7x5S6zytezYGghkU2f
	uVQI3YPF0t/czmvfegtOIvoqHjRnPYlxZd6mXnPqywpg6JR9+BC76KzbdoeCLacTn53FCqcYRI1
	B7C1iXxXAKjhNhTLsODb1QH3+CTg2cOLCUTnBQZp0fZ0O/LTAymrHglkTfkQhYy9CIxDeYuAPc4
	2bJHEj39gaLlLHqtxyepLFkc9nHMgLKmtToPTpz+lt9hf0qGdiQG0L2yzsSCSXtPHczPV5ni+5t
	lx3tmSbzGz35+ptKj97PMspaB6oq/VemMvBWhcgYmWH24aVIaA39p6P84Di/SjJdBF3e++jF6Dv
	mSd+JZ8nMcgXBsycLU2k9/zQWBTI9FC6HDg==
X-Received: by 2002:a05:7300:4349:b0:351:62fe:62 with SMTP id 5a478bee46e88-3537e0b81famr20147803eec.19.1791804482385;
        Mon, 12 Oct 2026 04:28:02 -0700 (PDT)
X-Received: by 2002:a05:7300:4349:b0:351:62fe:62 with SMTP id 5a478bee46e88-3537e0b81famr20147743eec.19.1791804481793;
        Mon, 12 Oct 2026 04:28:01 -0700 (PDT)
Received: from [10.204.101.119] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3593b8b2ec7sm18128821eec.4.2026.10.12.04.27.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 04:28:00 -0700 (PDT)
Message-ID: <82993933-090a-4306-9d3c-40ef7dfdf367@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 16:57:51 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 04/13] iommu: of_iommu: Add support for "iommu-ranges"
 on a device node
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, iommu@lists.linux.dev,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
References: <20260926-vpu_iommu_iova_handling-v5-0-0322ca5dc10c@oss.qualcomm.com>
 <20260926-vpu_iommu_iova_handling-v5-4-0322ca5dc10c@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260926-vpu_iommu_iova_handling-v5-4-0322ca5dc10c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA0NSBTYWx0ZWRfXx1pqUI2Yzq5t
 FOS4FR8WR2lAIIppsij8EyNEtPbwNOnE5UGqytj6UgyP5djU0jfE++fDK0O+bpjFsXrdGT7bYW3
 ASbwbUEscJQbUEud1L33vOPZC5dLY1+tiC3gmmD1xsfUaDiH9NDpOJOamdBoLYAcX6sX0qpDzMS
 H2ZbJa15He8aw6WN9KH678a6aXEzD+Q2PbXapvZMe2h0kbJtKH2X2fcx4ZPZ5WP+qHyPHe+bFtz
 gcB1l7WJl5tX4J1TFTyPhQPbanwaRL4Ti7K0M3z6fFRnv0yag+rAG6AyzXRPldEfd00hAIK2O+h
 bORFT65/m42/Bw8jMX4qSwlETBhkjayobs/WS58gwtnRORwbVi1pD0IkmBgDndh6DLBYQ1cwcsC
 /WaaRuaifgwMxnlDSP58oMHr47q1y+FsRvjaVwmCziEiF6ANpYri7xa9/3KYTFFmaog6oCJG4WK
 aM3fAfUufEtWPr1HNPw==
X-Authority-Analysis: v=2.4 cv=aK5lOr9m c=1 sm=1 tr=0 ts=6accc443 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=MjlnR1W742UOhp88nnQA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: 2CmUvU-GydzW37WUuTxPpUc_jMagmuNm
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA0NSBTYWx0ZWRfX8IbdkDMBA+M1
 cbn8zJae1K3vgo8EviWO4IsUS+eHWMtIp+66UNvBBJodF4GmDpzn19pAtDfJtFQh84ZENOekneg
 XnTrctHnbM7GqKwPLACUIhVKlJNs+fA=
X-Proofpoint-ORIG-GUID: 2CmUvU-GydzW37WUuTxPpUc_jMagmuNm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_03,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 impostorscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120045

Hello Joerg , Will, Murphy,

On 9/26/2026 12:04 PM, Vikash Garodia wrote:
> Reserving an IOVA address using "iommu-addresses" requires it to be
> placed in the reserved-memory node. But when "iommu-addresses" is the
> only property being described and there is no backing "reg" (i.e. no
> actual reserved system memory), it does not really belong under
> /reserved-memory. A device IOVA range is specific to its own address
> space, and does not describe the system physical memory to make it
> qualify under reserved-memory. Given this, place "iommu-addresses"
> inside reserved-memory only when it is paired with a "reg", otherwise,
> define it within the device own node. It was discussed here:
> https://lore.kernel.org/all/662f7093-fb0a-4564-9ca0-98e03e68ba9a@kernel.org
> 
> Existing "iommu-addresses" property expects a phandle, which does
> not make sense when the property is defined within the device node.
> Introduce a new property, "iommu-ranges", to specify the device
> specific IOVA ranges when there is no backing "reg".
> 
> Suggested-by: Rob Herring<robh@kernel.org>
> Co-developed-by: Vishnu Reddy<busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy<busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vikash Garodia<vikash.garodia@oss.qualcomm.com>
> ---
>   drivers/iommu/of_iommu.c | 128 ++++++++++++++++++++++++++++++++++++++++++++---
>   1 file changed, 121 insertions(+), 7 deletions(-)

Do you see this patch getting into 7.4 ? Or, you have any other comments 
on this patch ?

If you are ok with this patch, maybe it would be a good idea to have the 
series applied by media maintainer.

Regards,
Vikash

