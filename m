Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EDDD3B8950
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 21:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784669483; cv=none; b=TX/5umtGtc/OafpCCbunN1zU1zyh+r2RnrALtfS8Cn502Gr6jz3btHi27N/mtF7lT+6s5NeP9AoDcZhL8IwDgTPVHKdHwuJSeVFQaOIy+CNvL5k9b5QOR2clGufMjzOb2lR+IHxVMe3if6f5tj+HNE+uVJx6dvKk3/TOef7w8Dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784669483; c=relaxed/simple;
	bh=WGcxnkGuEQ/PD8PBykdNZKm9HI4t29kXKfK+xdeajrw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OHk1QDI06gqzx/di7ptjgaVPyYRVAN27x23GsF9FbIPv2BCCLyrkRY1icnaYzNt6EvCTttF++ptuYdhde8lRIPTfPJoEnN06Vj/ZfvySV6pGsC8uITTx2iKJci8hJgTaOPJ+LGv8+Z4YVu1E7uWG0l2kbovx36IXkouLz3rXgUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GXSQVZYd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hlQEQL6x; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GXSQVZYd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hlQEQL6x"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LKlSLH3954672
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 21:31:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1Jxq/pRyE3KiNBgXhnGvpItM
	kfBZsfa0vzGX5KU0o4g=; b=GXSQVZYdMbvLJv3sWVy1pwfL7lQt9Vr6Q0HO7HoX
	szVkVijIktha9tjhPbyCP2r9gnasbUWz2RPRFxqgatuEzyqRlydpC1NTUI25n9cp
	LqTuv2/5EPv/SXPCNusJtRFL6zZfuJkmEtXWuacMSPfyN0x1g99bUWgUm7a0Hwwn
	g8Q58+2u78ixXgpULUHiRbk8b/jq1nRh9StoI3vlNiA4iGND8BbFo8l+uPl7xbG5
	dHrnmBejUYIp+ozh7TTS5KPn8+C3ZwJDizB1xwadmxbUSbm/bMIjKZotsZSaMvZk
	0+yK5glDU/vf1oBhJFNChuLXm7lKrUtZng6eMr6xmfWbqQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj6nsu4vy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 21:31:21 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c26012cd0so207083191cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 14:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784669480; x=1785274280; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1Jxq/pRyE3KiNBgXhnGvpItMkfBZsfa0vzGX5KU0o4g=;
        b=hlQEQL6xMBWM1B22VFpk9gN3JjscjhSc4llKtdNusZDdNRQWLSAU4UYrKcl2RsdinX
         ijbGWgb9ilMFyvrI1HBuzJfy7uBBiLpT0xkTBYYPO8h1nHgXegQ8YbmqdYzXEwj2+31I
         Cr8sxsefaqaEX9LBPQHCYVQ35pO7BxGWi5KoKJLMVHZYW5mxaD5E8/wUhvqNmupvVzqX
         7ijZuH2oENI91ovEP8VzUeXfynUpTgv9x0y4gYnF6zJPVkPMF9bMAOYfxFn7VzJzeSjs
         8yGoEKm+kxJ4YluV1+4TDv5N/TqBCckj6nvOWMdQuWX6g3J0Ru9cL0Jj/q0NEQRZ2Z2U
         eo+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784669480; x=1785274280;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1Jxq/pRyE3KiNBgXhnGvpItMkfBZsfa0vzGX5KU0o4g=;
        b=mUwqQeY9fxqnGjVtVxtlDWobqoDrVwqmeKTih0/HIHB1pwml/UfUpU3+taN95DiGYo
         jTyvOkLM+iGfLPymwEkBz7UfkyWxofYNAEzWrr1jUMVqnOIFSz25fD0HMXUhKZldnTN/
         XsSVoS3N1kcHpaDwi8P9+po6b9K+6ZEqOETScc8CFccQi0MUBEXwMX0Px2B6IKKuy0d1
         LcfQ6/mRsZIQjY6A9qRKIiWIHTx1JPPUJ16uknuMexxGc8NEGIBh6d4WpuYnaF+8uy0l
         tb+IQxeTZbAAlmlD1qe8KOJEsTJXWtpCYS9IhD3ReMQJntsj0A0wlZLVngu0jBNI/49Q
         3Ugg==
X-Forwarded-Encrypted: i=1; AHgh+Rr9mg/iFvMUrnykUDxQdfNTp04mJn3XGmTcIsEcFue5rKwYMq2CpxrgjzW0VFqC2zu9AJg8duBgzbebA3XX@vger.kernel.org
X-Gm-Message-State: AOJu0YybtyCz80MDn09B5VocZkPtKbU53Q/nUKI+LTCGm3qXAsaqfpbq
	5543BNsH85BAWpitglatAICirDOdEYrhvh5Pix26WCmPLYERhmwNuniuYdzyg11GaxTKYfxVNXV
	FzEMyLT5n02UuGhBTArkZS0XW6NlrXNtwf6qpkwNYq24UxUfkJywZQSmazrznkjYEEu32
X-Gm-Gg: AfdE7cnav7rMMFmcB8Av2Xnph7bWy1LenHzprfxgY0kT2S12hPaLFEzYu/3e/Jr1y9G
	yYs71SMCVRVaOfIjBohkD0GTQGCiayOPDQ1zsBM3gRzgi2kRGD2P5HisG5DnZaLv04Q6Mwbxjf+
	I1948SQmgP7Nr38keXdoAP8YPb2ON73r6mL9wYat06qoU1MCUMNAHsYvh7fFeUVXXuoph5Bwj4d
	k9bnnrQWR3wNaIGJgfDWmoXwz3oA/q4p4x6QWKLUzfXPBuYon66mJ9l2691lshF8wkRtiqOlXoW
	H5090Sw1Ka0gsEJw8C5snRF29bzqXWRY9fY4BPHDVkQI4ElekSWU4BQpWqKhE6MCJ7RIOJ8mR0+
	Pzt7S8Ob/l9w1II+BUAxdo1WOgdd/UtaeNZfZVD2XnBjvEDmgsj9IzHUlGfRk3yyhS7lyegkM+B
	4ZFOIQEIOiA83esA==
X-Received: by 2002:a05:622a:5ce:b0:51f:636c:8eae with SMTP id d75a77b69052e-5213bb21712mr199305001cf.14.1784669480597;
        Tue, 21 Jul 2026 14:31:20 -0700 (PDT)
X-Received: by 2002:a05:622a:5ce:b0:51f:636c:8eae with SMTP id d75a77b69052e-5213bb21712mr199304631cf.14.1784669480127;
        Tue, 21 Jul 2026 14:31:20 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9bafdf5sm123323e87.35.2026.07.21.14.31.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 14:31:17 -0700 (PDT)
Date: Wed, 22 Jul 2026 00:31:14 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] arm64: dts: qcom: Add Glymur QCB
Message-ID: <n2v6fnsxxov2rxrhv5f5wj3kxqgc4hj4hmkwjhaxegz5wjrmhq@mqw44qc6hzt4>
References: <20260717-glymur-qcb-v1-0-aaf1cff84aab@oss.qualcomm.com>
 <20260717-glymur-qcb-v1-4-aaf1cff84aab@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260717-glymur-qcb-v1-4-aaf1cff84aab@oss.qualcomm.com>
X-Proofpoint-GUID: 9LM7aoZG63iWmK0S-HcSgaUALNs3KTk4
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDIyMyBTYWx0ZWRfX8ixk/UQ1vmCh
 5AAs4D2HbJCuwvEQRZ12iBnk9kQqW++9f9EKkGRml3FFzyCshaTIZckWxb1zHwprDMoQbumMoSH
 T+em1J487rkgyxxWFRCjuNDgjk2UbpE=
X-Authority-Analysis: v=2.4 cv=ZJjnX37b c=1 sm=1 tr=0 ts=6a5fe529 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=oAzEektMd9gfuz-7_G4A:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: 9LM7aoZG63iWmK0S-HcSgaUALNs3KTk4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDIyMyBTYWx0ZWRfXwXDvw5UzxYSY
 WTuY7fO+s3EB0xYKk8POlNGJTBcSpBjSz3ZsqcDV4bwf0T/wuoXX9U1hT8CXGBxrIZ8qMJmIkYR
 Ht8TzM/BprJzbrpU9OpqBCVV3XeaLoqzY/E32IKdtwEIoSIPZWbO6XOWA4lwzNbS/mW622Mhu0y
 2fJ1nih5MGJFR8h5+hRB+DGoJoT6jeTOaBA72x8F6AUYZNGrz1OfyyF6wHxYPyko7T65qjAznA8
 /OisKfrTP+w4TVXUVuiDnaD1rTnA7BeicXa007ZnnM0FNpb1Qkpn6TFz+jWQUFHlwsOZTGv1ViS
 HB8W7ACJ0l6nQ28FgeORQnia0u9rKNwkOWPdXH0MvN1amtbcSsrb/ZSxv6D+Wo56exLfPZin6j3
 cjhLUtZhg0yESMSWidECPKhmTvnQhfArYn7c1AKQN7v/PZjqTbs946FFQp0iNjCBwPD5/oyJgRs
 8ivpC/I76f9C/CHoW9w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_04,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210223

On Fri, Jul 17, 2026 at 04:54:12AM -0700, Gopikrishna Garmidi wrote:
> The Glymur QCB (Qualcomm Compute Board) is a Glymur-based board in an
> open form factor, aimed at compute bring-up and power/signal measurement
> rather than the closed enclosure of the CRD.
> 
> Add its device tree. The board boots to a shell over the uart21 console
> with its root filesystem on NVMe. Enabled so far:
> 
> - Board and sleep clocks
> - Volume up/down keys
> - PMIC RPMH regulators (banks 0 - 4) and the NVMe, WWAN and WCN rails
> - PCIe4/5/6 controllers and PHYs, with their PERST/WAKE/CLKREQ lines
> - WCN7850 WiFi on PCIe4 and Bluetooth on UART14
> - Embedded controller on I2C9
> - ADSP,CDSP and SoCCP remote processors
> 
> Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile       |   1 +
>  arch/arm64/boot/dts/qcom/glymur-qcb.dts | 679 ++++++++++++++++++++++++++++++++
>  2 files changed, 680 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
