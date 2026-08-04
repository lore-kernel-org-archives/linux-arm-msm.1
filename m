Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B00F337FF48
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Aug 2026 11:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785844311; cv=none; b=KhERn9vDXzV6iH5+eJdyHU/OaPhjBSXDzH7hHCM901wC4eWQh5fMTMqDODstoFpDEz5PxVBq5chbACWAzy/RnWUduJ1sjgvP4up3I2FFaPyEarqqadhRR7wWWBvirtfodTD+GS88BG1a3/gJQyH1m4R7MKUeZubDhEg6lc9M01s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785844311; c=relaxed/simple;
	bh=NFBHq2K5YXVs77JpjGHzOD9w0YDDqt05ghtTmidMy00=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VWJ1Vr6JT/ixSBFZun2yTCWe7UmhQ4Z3Hf+dLaiu0AAQPJFbQUB1uDgSk5Zh1ul8Bz0/omXt6kyiaoB+DbA/CiZsWYO6SLX1eWltf92qH3VfYV6DUfat19vnI9xNBlGGamXaVeyVSJ9HdVt/jPqbzf2vedBtNghzgycYda/Lzs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cmsjHgfm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OZrcEk4p; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cmsjHgfm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OZrcEk4p"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6748CGSO3546088
	for <linux-arm-msm@vger.kernel.org>; Tue, 4 Aug 2026 11:51:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ze98RxjUZ4ItEu90Mq8Gu+jH
	l28YEoO98sbI96+/AEg=; b=cmsjHgfmnvAXfXQb9WqiIIH29tCv4MV9KMIJq7+H
	0cUQK6Ru+CSAuuizdIb2R6MbPOLIZs7s+nJWwCexLzEz7Pm4AWcI5WHvpTDJcUgk
	h+8pdvSh4wI4hs63QiBAznKd4waFgfanquTfOvZJWGSCEAMgYk+CeSfnjOKrS3Y0
	KASnaPev3x2tKWcJU2O1d9U/XNG662unF4w0nATs45+Nj7lCYq7zk/3+QCzhouyc
	H8YKR4i9OJRTu2DarGRGjqt8fe4IqLSsY83VHtqI6DQ6wWFi5G9Tq8GtNgjq+bqC
	hGMXtWEgX35yB8iQm49nacKj5RBSNIADa6UuXW/hUn2wrg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fu3vs2sds-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 04 Aug 2026 11:51:49 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c0199faafso46556341cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Aug 2026 04:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785844309; x=1786449109; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ze98RxjUZ4ItEu90Mq8Gu+jHl28YEoO98sbI96+/AEg=;
        b=OZrcEk4pFwmdUWbbqXSrM/a3ThCva3jCe/Siuse1GVvM8j64+Z2GM4s5qLy1+Y5RCC
         qED5UdhH1yuvJPv4U26of6Aqw+ZZttvvK2M0x+9ZWETT9lovarQiA9E34FF43b0gCoMN
         BNrlV9r+Xtxuz/7gqvsor7XwejPipAneqfN9qqWSD1WFaf5STbqPPuVGzEY8spm82igB
         +CVcqeucgSvHzSi8ahScmPHMMSQq4s3ODPVHnD8x6LA5SEXHh5zK2x7mC/GmB/F9JdqD
         EpB5TTt6EsktDBqkUzwq8+En3XQ3Gb/BLJlho2sP9M5+equguP3+53u6gyAK67nF67PM
         Pl+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785844309; x=1786449109;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ze98RxjUZ4ItEu90Mq8Gu+jHl28YEoO98sbI96+/AEg=;
        b=DpXl3U8KixEtrPSwwAxr4JtIL1kjAtA0rqL8RVCd72t4i8A4gu+8ALbCJtEnlNWDnU
         Ne73MH65WqcMRtBTyzptL9riJeaSE2zyeQS5I7V32x3WJoG8uezVtScWLBLj+t0sh1bq
         0hFlSBP0RylJj5fds8baex/d8yjpspzA/Xaul/4TUDfD9RmgsHjZdNs00jUWjaiCPKrD
         j9+o/9XWTcfIvQlb+9E4fejuMUp0aVj435FcXf2caoxzWwBNqo+oDJZ8BN3D5xHyW6rp
         TUlmdNq/60wCHFRmwNWtuxiNYhD3/Q/VRyn9+wvdwV1kJoyWQg7/hnG67DiytB6A03+s
         KWKQ==
X-Forwarded-Encrypted: i=1; AHgh+RpUh3n5VRigM/3eLt3yu3rmpFHlbB4E50IN/+AdnbxHGK2clweC+0ZJ/X/3u+176eJj3sUkTtWqONGgTfp9@vger.kernel.org
X-Gm-Message-State: AOJu0Yzgvi/aBEUUb074uLOEAKd7uLUiSqvkPXxPhgFem5bJGrWS0BnP
	+tyE3vGcKwpb78seq2yJ7cV8OAFxO8ycEQHTEQAf0c2FMpbt7li+phbfnAQ/6TtvrWDPsLsXf3L
	gUQ7N54OUjfe9AWMxud7+kbA141ziOtoaA1vn84iIKToZRECkTUvFEOLlfenge3nHkCrV
X-Gm-Gg: AR+sD10JG1kuMi7LsNuFSCbUNADQYe+yUViSvjNir3a+4NGKYSEigtOg8WNrV16JQwt
	xNGuQTsU7RowEp1SWAC3qXpl6zajDSZIjCOqizvB0iayc74M+0/8+UWDzWgPXoqKkSvYqU66PXA
	OPKA+v5DRQn8q9wL1kUH01CaLIVauQ/IbOuXr513UGrF0xzYws2d1M3y0lInS9Q/VB9hdj5DywX
	kXVNl2//LyntpDC1u5S/Xai64ce6qK2LLRDu0i6SwcltIZbo3XdtZ1eWcsTcOldBda3Z7jhPv7w
	HRoKzch5iy2eI/chFAT9nRElAgG+mlUD49lXvg6eDAs4rzUq9Ck3nU8Fzv/xJdqNmcUa2iNM3aW
	4Mb9RiG5Kxm1vFQ==
X-Received: by 2002:a05:622a:1927:b0:529:e058:d185 with SMTP id d75a77b69052e-52b56751886mr271519421cf.24.1785844308728;
        Tue, 04 Aug 2026 04:51:48 -0700 (PDT)
X-Received: by 2002:a05:622a:1927:b0:529:e058:d185 with SMTP id d75a77b69052e-52b56751886mr271518991cf.24.1785844308168;
        Tue, 04 Aug 2026 04:51:48 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.37.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd458bf7csm45059686f8f.32.2026.08.04.04.51.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 04:51:47 -0700 (PDT)
Date: Tue, 4 Aug 2026 14:51:45 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: manivannan.sadhasivam@oss.qualcomm.com
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>
Subject: Re: [PATCH 26/28] arm64: dts: qcom: eliza-mtp: Fix swapped USB QMP
 PHY vdda-phy/vdda-pll supplies
Message-ID: <tiln6lkf63i6ezelo46alawu5yxl2rqu5x7kiz2emre5g65ctr@mad73j5h5xyr>
References: <20260803-phy-supply-fix-v1-0-5880630cde3e@oss.qualcomm.com>
 <20260803-phy-supply-fix-v1-26-5880630cde3e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260803-phy-supply-fix-v1-26-5880630cde3e@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDA5NSBTYWx0ZWRfXwfhouGEgF0g+
 mBIpnmITh1Wa6DEuXNOUzHVBKNu7Chii2MgR6Cqwy1824oJAxhSpRwhu3fW4UOfx4qTHMOfRiK/
 JMLHusbflQRYDufoMENQeqpf5Gm4HwlS1sbYOL4X/GedmPk+r+lUCYwnXtrwhfnwQYimexh63A/
 /Yxlj0ZGWWCQ7kUFqounwPGuFoMhsgzm0NAt47a2IQy4iMjA3e3k+XzV0Udfts50R/EUvxdlucl
 amV6RBdkvLS/S0VemtQRqsLpc7AGD8xITC2wrKNnCSLVBBQnU8jKGo/b2CNsD+EFjZn7uvZmRiM
 DxOI+loLdlNV6y4CWA6TWazk1PcSy/aIAw/Bzgk5C08toc/5r04+QVB2hedjzv/Ok/vCrB2YsPW
 GtLw8ih2E+pMz6EhRbBe4d9eotwfczvM4PtdYOwpV8SLrXIjZtX7Uu1WJmiBLrWqq2FXs8JEig5
 WSLBuneYaH7aakxoahQ==
X-Proofpoint-ORIG-GUID: _fvS1AbZFxTPklAgYNssEtTXVf2rOl1E
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDA5NSBTYWx0ZWRfXyva2KqF0CaSM
 EBj6al6X1JuOC9+WXi09H6h4oREUU9fM8zab1A6zKqqADojbxri93X0Oh4EtBP1d9XLQLDR0fP0
 JdEjoGPjMDHh3ptKwn3C+SylAZ51y+4=
X-Authority-Analysis: v=2.4 cv=EK82FVZC c=1 sm=1 tr=0 ts=6a71d255 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=Afnz6uBANMlDQL2PJxecKw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=OGV9TLrtSMBsBMb3FhMA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: _fvS1AbZFxTPklAgYNssEtTXVf2rOl1E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_02,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 spamscore=0 phishscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608040095

On 26-08-03 08:34:24, Manivannan Sadhasivam via B4 Relay wrote:
> From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> 
> The QMP PHY expects the vdda-phy supply to be the lower voltage (~0.8V)
> and the vdda-pll supply to be the higher voltage (~1.2V), as used by the
> UFS QMP PHY on this SoC. But these two supplies are swapped for the USB
> QMP PHY on this board, feeding 1.15V to vdda-phy and 0.72V to vdda-pll.
> 
> Fix it by swapping the two supplies back.
> 
> Fixes: 49dab7311f57 ("arm64: dts: qcom: eliza-mtp: Enable USB and ADSP support")
> Reported-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Assisted-by: Claude:opus-4-8
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
