Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B93452189D
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 12:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790168370; cv=none; b=YAHr5HEfGfpWNMiUK/dEwk6PbvkvNk/QBXoyvD0VOfhKzxHIGYGr1XuF3C8tV3+hm5qONs9Oy9UCIl0/tYSp3dvbueOSgabDfIqoIjSy1kSbNqymoALDPlytdwQjD4oCuwd7psyhkUv5iJ5nr+8ssFbJjlOvm/mNwQoMowtOQM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790168370; c=relaxed/simple;
	bh=P+xRwyu5nJnmn+m2DvzZjn2DVc6kNbhn1YQF3jx45Fc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GTOnkFV86z9AGadS3kvD75RodUhHH62HC+GVMx1xQf4ifgCQc9X+MXtRFl8Xn7/0f9fMKb6p6MTJur4vKYQ9yGLdTKWVLEcb4Ub5W8ErY4ZWOzDeWvpMkMdhM8o0hx2/JDRdIrgZWRrW1TmLqqAezz4a+CYjA5BOfj7S7yckCT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W2PhrOtm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PAXMg7SG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W2PhrOtm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PAXMg7SG"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NBboRn3029161
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 12:59:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xPYcmdd0Sz826AQ6Z0SdBcU3Wt+ZNKdEePXQ3xgTNTQ=; b=W2PhrOtmf7gscniz
	FvHvFiv/ts/LcwuE8tQpvBI02Qh20xopZ/Xoy7ZcMHuAb8WKf3Hd3Mk7JuDtJu+w
	5gEvSYQORa3s+Zhy5XH7zFafnI6VM8dV93YO7PHCyZ+tZk3gnYGn6pepeJ8Tzyb7
	6rHN79IQnT/sE93iQTKEtjecoqQ5apOod15t7AHj3uBhqsDpQHyXMfk9boSZE8Id
	tEaLRWj499UsWjY3O1GrLKNNgl06H4b2CvIgnQuBOxrPvEFi1iVEa2EohL3RakO5
	h0+6lQWz5E4rTotUmuHIQYeu6oehP1ANeel+prE5my/bMdKgeimId0YuWk7IRWMx
	fc156A==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvbwarw7c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 12:59:25 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5c82b318a06so33892e0c.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 05:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790168365; x=1790773165; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xPYcmdd0Sz826AQ6Z0SdBcU3Wt+ZNKdEePXQ3xgTNTQ=;
        b=PAXMg7SGU96RZx5s7a6c8VA5QP4IPGM/RZRlAJRksyRr/RV98GpBsTgnO3amz4q+wM
         uNmisDtvuz0IkzjCY+ymJ2aJDPvqhAxoJAuX71tW1rk9g5LsUxg2R6iAvwc/nFn7FEXi
         O8+RZNBTsSvEg2ho5eCmMDm175+aiwY2zscHvIO8kSACBySFg+6+HlonG4RyZTHUpVoP
         kvNK6Orv54/ATaXTLinBGOFhLCj48XVSWFbR2Z72qz9bVQKDBS8Lkgq7mmjNKw7TdvFH
         HOCuCsqAC5E5tUUk+kUvKon3+eqBOhtwOjcMorgbcstfqfjjaNpQvi1It6NaGBk/vaq1
         ILAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790168365; x=1790773165;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xPYcmdd0Sz826AQ6Z0SdBcU3Wt+ZNKdEePXQ3xgTNTQ=;
        b=WbK/pVbF3D7joxAkeUPrD9n/n6QPidFTg4w6d/7rfJbGvqnsTgdCEYeD0c5CPaotsl
         hXqlq2TJZH+v+1ErVDnxUff+tRJmk3IKQF7aIREwBsFyAoa4SPw6k2PiMA8LERHdHWsj
         ruw0n3AkppMVW5sdLS1p90Rm57TOmPbXfGPfIbt+pqN2+il1zpjBQ2/hZkpx1LEP1gVd
         GXzQ6bmoq8aMyJlKdq8okyBrhLejw4hcAjZGCdeBdd3kpcEmmLX+KJFuuU5VV3JAj9LZ
         yBH+wMj8N2yBd4NTYibXZD5C4ayIJYlDfOT8HYy987gagxHNy+gFB0phnjDuJnt8Tbvn
         4LIg==
X-Gm-Message-State: AFuF++l3rsYRL1nvckNcB3DGkqCX9w83o+uoILWxcBgE9unaA0w9oSOg
	YNUT+Jt22G0nc1et/PMVE1y1/2bDKf+6sMekH4MmVplgw6sto/onTICzcrXL8zKVFDoK4fdqdue
	NCxNxv8AWNdXmSV85ogVUpaCkXzZdbK/lWx1sIqi6myIBsjHVW+sF0i3iKALZgOqV156WvsyanP
	SN
X-Gm-Gg: AYBFou057G0tjc1u6dx+nQzhjsLxkVWCNngyqjRKu3izd3uDQ+tVEBbTF8z5z3CZ+ll
	1WNkWAFnf7qG4607OMRYtTyU4eROnJYLItnidlTFlKur+USnlwDbQkk+wafhaW5BsVpuSZXPxvX
	Q2RQXriBwc8NafgMsXqrQMIrTxrwjJW9HvsohD8bT7J8KdjD2FHQZguVAw2ND/HucEHQ6UCCAMZ
	HPWhgP+isWtRdy7JQf0rqLa2INMGHxbWED13dTnZKaMRg736OQl1GwKAzYuoxq9PDiLZUy+o6fz
	yBF4S+wNznXwelIJtyMrYVwNOq4ARgbJCcJ+zF6/V6p6qzGjGnUv2Llbu43FmPM9kU3Y0B4ZYOl
	GhnZKrwNrIb+BdrzaWC/3KJQm+Run+jtC
X-Received: by 2002:a05:6102:688b:b0:7ae:545d:f97c with SMTP id ada2fe7eead31-7ae545dfcdfmr355602137.3.1790168365247;
        Wed, 23 Sep 2026 05:59:25 -0700 (PDT)
X-Received: by 2002:a05:6102:688b:b0:7ae:545d:f97c with SMTP id ada2fe7eead31-7ae545dfcdfmr355588137.3.1790168364828;
        Wed, 23 Sep 2026 05:59:24 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aab3897a6fsm1627496a12.17.2026.09.23.05.59.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 05:59:23 -0700 (PDT)
Message-ID: <4acd4d53-a444-4282-9bdd-1f2f2a487239@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 14:59:19 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] arm64: dts: qcom: eliza-cqs-evk: Add storage
 subtypes and rework generic parts
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260915-dts-qcom-eliza-add-ufs-variant-v2-0-86d72a2a8f47@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260915-dts-qcom-eliza-add-ufs-variant-v2-0-86d72a2a8f47@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA1MSBTYWx0ZWRfX96YK5uxmw6Kj
 XniEZg3u8JEuceLW/6nk0pcDYiDxD9WycC+yRGMPYU+bmWZSYnY+4dnJr6wiy75f3FGJWC+7e4S
 rTgF9drcRGKDWQ8nwSi+wz6e8oOnbVa4UQX3GKKjzPSfp1tNXaoFGQ3f7w+k8O41pefFqlBSw6K
 e/pkxLUZYed/urkrrMuLIpmZuvfDHaVwBgV6ZouUF8HOCbPVn/CJM1u/Rc3d6+Hvnh5iTNNUiOl
 +WL4atAmKYrnWZtIps/ZiqBGaHQeXJQON9jro9NytUmzyn1rjRBj/FHmfxi27IeVSVXv1zBo0cy
 vOwcaayv+dNixAbuw96uyI+C6QtEz1BBSr850JlTbSle36Hy6iht2ZtuUHUOOFgwChNDM2rH1sI
 dMtey6IFEABTKMLSmwjDjJzs25bCv2EK3Qz66mGIFHb9LEMzVaAcpQ3VJfc4OssgFCey4qYkfwK
 JPZw2FsKK/qYsYvJpaA==
X-Authority-Analysis: v=2.4 cv=HfuB3SE8 c=1 sm=1 tr=0 ts=6ab3cd2e cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=HnpcLAXKzKr4wbjNK_wA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: Su5Go2Wh6YFZbp9gyNaB_TAOKe573qZD
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA1MSBTYWx0ZWRfXwixS/UQDwkVt
 bdn5e49nVcuDnKaLoNLwO0VhW5FctD14UGmcJ5GkRgkoAgFLHS+hhPqwOHsooP9XqFe3pFQVojX
 MrDIn7ks/78stHEbNE74477O13seevM=
X-Proofpoint-ORIG-GUID: Su5Go2Wh6YFZbp9gyNaB_TAOKe573qZD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230051

On 9/15/26 2:03 PM, Abel Vesa wrote:
> It turns out there is a UFS variant of the Eliza CQS SoM as well. So lets
> differentiate between them with -emmc and -ufs suffixes for DTBs and
> compatible strings.
> 
> Adding -emmc suffix for to the current Eliza CQS SoM and EVK devicetree
> files will not affect any current users as these boards have not reached
> public use yet.
> 
> Also, move the sound card support from the eliza-cqs-evk to the generic
> eliza-evk, which will allow it to be reused not only by the UFS variant,
> but also by the Eliza CQM EVK later on.
> 
> Changes in v2:
> - Actually replace (and remove) the eliza-cqs-evk.dtsi when the
>   eliza-cqs-evk-emmc.dtsi is added.
> - Collect Krzysztof's R-b tag.
> - Link to v1: https://patch.msgid.link/20260914-dts-qcom-eliza-add-ufs-variant-v1-0-78b3249eae61@oss.qualcomm.com
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
> Abel Vesa (5):
>       dt-bindings: arm: qcom: Add more compatible for Eliza EVKs and SoMs
>       arm64: dts: qcom: eliza-cqs-evk: Move sound card support to Eliza EVK generic
>       arm64: dts: qcom: eliza: Rename existing EVK to suggest eMMC
>       arm64: dts: qcom: eliza: Add CQS SoM UFS variant
>       arm64: dts: qcom: eliza: Add CQS EVK UFS variant

I was hoping there would be a bit less duplication here..

$ diff arch/arm64/boot/dts/qcom/eliza-cqs-som-emmc.dtsi arch/arm64/boot/dts/qcom/eliza-cqs-som-ufs.dtsi

281,282c281,282
<                       regulator-min-microvolt = <1800000>;
<                       regulator-max-microvolt = <1800000>;
---
>                       regulator-min-microvolt = <1140000>;
>                       regulator-max-microvolt = <1260000>;
399,414d398
< &sdhc_1 {
<       vmmc-supply = <&vreg_l12b>;
<       vqmmc-supply = <&vreg_l1d>;
<       pinctrl-0 = <&sdc1_default>;
<       pinctrl-1 = <&sdc1_sleep>;
<       pinctrl-names = "default", "sleep";
<       mmc-hs400-1_8v;
<       mmc-hs200-1_8v;
<       non-removable;
<       supports-cqe;
<       no-sdio;
<       no-sd;
< 
<       status = "okay";
< };
< 
418a403,420
> };
> 
> &ufs_mem_hc {
>       reset-gpios = <&tlmm 185 GPIO_ACTIVE_LOW>;
> 
>       vcc-supply = <&vreg_l12b>;
>       vcc-max-microamp = <1300000>;
>       vccq-supply = <&vreg_l1d>;
>       vccq-max-microamp = <1200000>;
> 
>       status = "okay";
> };
> 
> &ufs_mem_phy {
>       vdda-phy-supply = <&vreg_l6b>;
>       vdda-pll-supply = <&vreg_l4b>;
> 
>       status = "okay";

Konrad
