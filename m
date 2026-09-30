Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8686648424B
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 10:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790764383; cv=none; b=FL0bgTaDdYFzQkTOeA2WR4ZVQj08F3xY2vUwymhQz2k2gFw6XankKyW0pzvW5qj8M3b9G67zTtqm6DtnDBLuyY5flc8KS5QgZE4426uZyFA2FQ1DDIxbTs4UzRolq9l2DJZ58P0v1mQChD1DCo80eeqozD7wED9pC+PCBYFXsLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790764383; c=relaxed/simple;
	bh=XJqq/HqfHJps0QJpX9Yh5Stodb+XN2Bv1jNcqRvC1+w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pcPXgJ1acxrOHC6clQbEoZXuvf7P1wIDducXvvtmRGNPmOS9DGInsog+vwm57sypmLby4ucowIVAs4+Cx46FPXDcTcY6gmqhC+Ov3Y5msZSbX0rCh503cU+Xmk0+IftJFF0iwKPhbaCnSqLM2LDHSzSQ4+Y+cKD09OhZusNdg24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GChnVdVm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xw0WtRwQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GChnVdVm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xw0WtRwQ"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68U7dZBG3330383
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 10:33:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oOS8cWcom7zKihTK0i6yF41CIgFONzu6H2go37Q+AJ0=; b=GChnVdVmku6RuTmC
	1fJ2DDWjNwhRb0XkKRKojfl/OySNJn0mjLQjytrD0jyPZzWYmQjFT/+yw5pQf80o
	mT+EXEMKTxg1LCpst2Rg7MY2GArzBC1naM2AfI5dSc7ugCfHOE9JNxoSRJldTx/L
	dTBAUyyDYKneeve+pienZb22d3Tk3FX/C7vNQ9F+S3Ytdqb2vpDXhIechrUqaAhE
	9ganUWrJY+2Uud4gFJFhErbj6l5c9Q0Ge9USvjeic8BILUZigEjcVNwQCp/I2FGG
	/Hf8VP82BS5k28cDrNqRa6PblVvCu+T7/DIpgvoELCFfDRe1Fw37qce9NBktCBRL
	AU0eiw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0nm3jvsp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 10:33:00 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-90520763ceaso7702476d6.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 03:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790764380; x=1791369180; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oOS8cWcom7zKihTK0i6yF41CIgFONzu6H2go37Q+AJ0=;
        b=Xw0WtRwQpmCmCg4z4YGXHbq++JWhTRBMG8YxzVEbTEO9H9aBX7AKExrJfZ0LeDisbE
         TGTcu/pJtgJ9MuyNcRsTY+CBc5kAQrV3Cku9PBYJVYwMiuqmj8ynvVz3g4SA1NYDMIIq
         38jA7WLWjXVmoRBcTY8i/BUbsEswyqb1Er9wxCWPvDw0e1nV9+1brbvIYsdQqJwU6iZh
         kYH+WgIQrUvV39C1BAnWOLiCwEPb/9Df2NlXtWpjZgcdzEMDzpSE9ZYf6sA4t++NQnLB
         1htnJ3AuLWCp76fzxRPgx50eOrPYAVSohRPfmjW/RNUsSiRgiN6NFqQG1SX8PzpzVRx/
         cA7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790764380; x=1791369180;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oOS8cWcom7zKihTK0i6yF41CIgFONzu6H2go37Q+AJ0=;
        b=s0PaGuDl5JLMrYWVdqLL5u7pWecgOkA7CIzqwW1ae1Z/YvfahZu7EGBeFhpGYe83al
         A9M1xFXpsUmyeuiK4s5vxTeJbbHUUJkJYZ/3vqbYwt7WW5Z4aS5DARTb/bnZbzwoZlGZ
         CigmAX0N6KviGJZ7uPSVz35usyh3mPMx+Ux1TBqX4Qro8YrOcIGPEJbqfRKoog0AI4mP
         SX9cxdOR9SYSg478OUtsUG7FzSEBAoaZSzc8EbNsFLq8htqRAAPXxpD/fMFEuNLa/cZG
         O7rXalUNeYwHH+0tj4UOpbx/RSFK9Q8QetRCfwnRylPRA0OaISQF0nukaGndOqQyyj0w
         bMrw==
X-Forwarded-Encrypted: i=1; AKwUvByGrAqYvNetqYN9/4c9uEl/+C2MhSf715zMEsHTqZDcDR2oxr8hf5hj2xV6GjqjE5aWb6VRu05JKebtMWo/@vger.kernel.org
X-Gm-Message-State: AFuF++n9M/ppnC1bbT9E+BrFn9/12vJRixad3/07XUAnB+Ez3VtQWn6R
	W1wbmWlbnlYAEfeuF0EAwP43ISuYiagjLo/BHSzSNXgkZ+61kK9iRgPVFvpE2uV/uRu5xbCb0yB
	Xg2O/Xz03EGyPnw81Pf6Vr3TZQEj0+7+Wx9Ov9FDcN1RnR/6e87/vteCxD06y7wJTd+utIt7C0q
	Ge
X-Gm-Gg: AYBFou34RhFKQKCnRkVXOeqmIUDk6ly8Zzy1K5nPbnGNxM+Pm3PwSIjiEoKEAC+ab/S
	ZYzPWa542IU0FIFATWV78pOE3vFuH0eCu8x//WGdabEAql84DXlzQqHT4ysHerv1ZLEEqijXRwk
	KfYlq4QuRfo5frOeSXwTgw5NWkAt9E1pondAv2aG1ErOHjOpeePbxiM7eDi6c6geirRFdcWMBAU
	jgvCvJDaVSy4+AgeXjtg3E2FnfDbb9QFqyZI8gchoIAY19ihSYMWeMhemGNosIH4SS6InDYADFa
	k+cfFcE4xNJghCMOWt26efEn5ygFgXLWhNGCdyweGKlBJJ7TrgFVL2ZIiSPGU46j1dZ58ChbHcS
	b6HMqAcCsxnohmgb3SkkBKw==
X-Received: by 2002:a05:620a:260d:b0:93c:6e1d:96c0 with SMTP id af79cd13be357-93ca96ce16emr134798185a.3.1790764379655;
        Wed, 30 Sep 2026 03:32:59 -0700 (PDT)
X-Received: by 2002:a05:620a:260d:b0:93c:6e1d:96c0 with SMTP id af79cd13be357-93ca96ce16emr134793185a.3.1790764379143;
        Wed, 30 Sep 2026 03:32:59 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e22f7f26asm44710266b.42.2026.09.30.03.32.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 03:32:58 -0700 (PDT)
Message-ID: <6c081871-6799-4ff0-ae19-187d8a6f9d9a@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 12:32:55 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 09/13] arm64: dts: qcom: sm8550: Add Iris context bank
 subnodes
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
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
        Krzysztof Kozlowski <krzk@kernel.org>, iommu@lists.linux.dev,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
References: <20260926-vpu_iommu_iova_handling-v5-0-0322ca5dc10c@oss.qualcomm.com>
 <20260926-vpu_iommu_iova_handling-v5-9-0322ca5dc10c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260926-vpu_iommu_iova_handling-v5-9-0322ca5dc10c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: _4H3guWGqJQ9hJfjnpjIc6PfyikOjtut
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA0MSBTYWx0ZWRfX73cSRoe4kbjs
 NQRDefMeZOj2EfgpKHv4RR3n7XRZqdrL7oLRQf7zSdNb2FsOkA94/NReuakxkYNKen+P5MiDFhY
 HKkCBZWbaiMnWaWxMDRpjRIyMYNyLBh5ob2ScYspluh1Es6IlaD6XlaLXsKpPv6ViBwGAVz1Zwu
 CJcGa9i7ZgBJyMSi7vi7yWM9G73h2JecpWguxjI9bXxmkXA2Vs2qOR9jSyGKo5DmgiX7s/Z0EQ1
 xmA9cZvD5pabgKKHoiPcwzRgpMCOuNiP0LFmtvw+BL5jiyYXgy03K+vBhlqoqadoui7prO2E+ZI
 nKHNDZh4mISDupCLPGphgNIvEJxeFb5FPVPrvf93Rgv21c9E5NSDkFCL3qMHxYz0FF8BsXlI9aY
 abGJSGZrLfQChEG+Qi1vTN9F8h3hjyAGOcswDpfBr71/OrEmgm7nMhntg6hoHDAszlus7gU9jCM
 ls83SB3KP2xE6DoUXlg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA0MSBTYWx0ZWRfXxAqq7O5qbdMG
 5TdUJftfzx3fpuJcQdTOhU5uHMXrsRQ6P0ybR0jrxG+2GK1KivlfbkqVzrAJ7n/HuTB1rBmn6eS
 nBmEx0ynIrqKTPdNvgBjV7PiAvXVxVc=
X-Proofpoint-GUID: _4H3guWGqJQ9hJfjnpjIc6PfyikOjtut
X-Authority-Analysis: v=2.4 cv=fqxJ914f c=1 sm=1 tr=0 ts=6abce55c cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=G2U8quZLHxfXJRKprjwA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300041

On 9/26/26 8:34 AM, Vikash Garodia wrote:
> The VPU issues DMA through several SMMU streams, and the hardware does
> not give every stream the same addressable range. The non-pixel stream
> cannot address the low 600MB of IOVA space, while the pixel stream can
> address the full range:
>     +-----------------------------------------------------------+
>     | non-pixel stream addressable range (600 MB - 3.5 GB)      |
>     | 0x25800000 - 0xe0000000                                   |
>     +-----------------------------------------------------------+
>     | pixel stream addressable range (0 - 3.5 GB)               |
>     | 0x00000000 - 0xe0000000                                   |
>     +-----------------------------------------------------------+
> A single "iommus" property on the video-codec node puts every stream in
> one IOMMU domain sharing one IOVA allocator, so nothing restricts a
> non-pixel buffer to avoid 0 to 600MB. Once an allocation lands below
> that boundary the hardware faults, which shows up as unhandled SMMU page
> faults and spontaneous reboots:
> https://gitlab.freedesktop.org/drm/msm/-/work_items/100
> 
> Given that the address range restriction is for specific VPU stream, it
> should be ideally be moved to that stream. To achieve the same, a subset
> of streams is now represented as subnodes, so that each can be
> associated with its respective addressable range. The design was discussed
> and agreed by mainatiners here
> https://lore.kernel.org/all/c7b956a9-d3e8-4e18-b780-5d08f5cd2ca1@kernel.org
> 
> In the past, this limitation was addressed with an iommu-map approach,
> with the iris driver dynamically creating the devices. That approach
> was later concluded to be a hack to avoid having subnodes, and was NAKed
> by the iommu maintainers. It was discussed in detail here:
> https://lore.kernel.org/all/c7b956a9-d3e8-4e18-b780-5d08f5cd2ca1@kernel.org/
> 
> The video-codec node includes address-cells, size-cells and dma-ranges
> to declare 1:1 mapping for DMA translation to the parent.
> 
> Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
