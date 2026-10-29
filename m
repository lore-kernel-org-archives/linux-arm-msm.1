Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793263047;
	b=yi77hwRxnXoPiO+qsIhslelLPBjE8T9Zc3t+akSoA5aApl0CderTzNmt+v1w61nxo7b1
	 DM3y3WVqEkqm6JvC5lU2D5Pi29ObaQXp7fZ/SV0lq+XcadcoOQSOMx/xEccalNYs5kD4i
	 ibASNa2i9a8s25yLj1ADzjf+utBdJgnj6Di9y54ft54krGLPz8IZJ5gg2uoOElwWYchCD
	 0thoLD0El/xIuwgYuYQZtGHrJCpK8XnIn+YYgCTrhCssaQaOQd3OFUPiYOmwQg+khlvBQ
	 mMICB5pHtEtmQBGdPTmzvwvVT1AXM3bwMNt0MTYR1uT8D/zCSNA4FOnsNmP6VU7+Mbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793263047;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=fVa/mvUfwBbO40HIIbPEdimnS4j323pWkTjt0VcUg4c=;
	b=TZ9q/Qi3uPhCtM3Ya2po2sL8U36AnxYnDcokxd8Gc54KeMP54HQFbJhUhp4ravwlditt
	 b8vY96rCx2pZ5dMoyc4RZeDrdhZTSm7jW/fEUQ9MRuuts4ky2fDxRNFIDYdpr/8cWsn64
	 Pj5RZk+vSCzoIaoIE/Isob/Jkz6fMyzfEUgtjAEOM3FaTigZIsMLubQnbT1R2+flQGXAc
	 jGBPjP+WqTtU8AfpfUBAENvBR6dzE9tmgvu9LEVxHZmpZBBzr0aJszrbRU1MCQR0mBTDI
	 OLnyDgAfkdYJkMR9xSZGiXewbZ66G2UkQZMHhs6hcxxXg+MD3qgrl5JhsvXqMfKOZrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=G76ACjgX;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZyYmv8h4;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78EE3606A31C
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 08:37:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78EE3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=G76ACjgX;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZyYmv8h4
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T5GxbO2427201
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 08:37:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fVa/mvUfwBbO40HIIbPEdimn
	S4j323pWkTjt0VcUg4c=; b=G76ACjgXP/uXzaO4MxiTtGYBkSKqGy3Izb6p3o3p
	mGzza3fRsWQ4CdCCdapWpfmjbKtQeVrnDVglQdbhOYNmGCnhXfY+EcOn8TM9/zEO
	Qzby97a3wvajxI7IojFE3q/UFDWeHHgt2KQE3sZTeC+aGpDjCn+ca1U05WivBNcU
	nuRo3bOfKbr1R0ftOs0bVIJIAVrO7mb6DYSTAF75bNDPEzLYDV8xPlUDiwuNPvc0
	Ea5oUeoG8GHMTVF2SjU+KaxWYJn5aj0e3htrHoE85VGc3K8Moi9gFPVDJS1dPYVi
	d7WQZ2HzWtk/X4WBsTil/3ljF28uYGfWpK9Mk9cZDBzW9w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hknb2b32u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 08:37:25 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-53395d51187so32029471cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 01:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793263045; x=1793867845; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fVa/mvUfwBbO40HIIbPEdimnS4j323pWkTjt0VcUg4c=;
        b=ZyYmv8h4eHFljzuFGrQgwUIr47K2hfDQkP4jGkxQyCvFqd5vEsB01ea9Dqcxep46pQ
         vCUxdY/65D2JvNLiDXeNqxftMg8rKugnt/Tb+efWm0Y4Uu1o8h5B921qYIJBN04JDhJk
         llHvF9LYhDxDeBRf7L43Y1AYvJryewSKuhuLrRupTsOA2HtNnoSwDMNhPcqR/yl9MFUM
         ef9RYTyH4RXF8nbMTf+2Gdm1LGmf+Tir+FMzMdS8hPUkkQ0Sk7XPQa7a7XwA68ZQnksO
         TObSU+verXgIctKFwxgSjjY5p1UsXPzqF+CwNku4ELg4CmQU8KDlZjC2UHI5C0goCEji
         e6iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793263045; x=1793867845;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fVa/mvUfwBbO40HIIbPEdimnS4j323pWkTjt0VcUg4c=;
        b=uafbm6yN2ZM6MIpiyQxP0OXkZTXsKtRrYwbtqpVueDEuSq83V/Ohfzuu5ThxxY/r0q
         kj4IJkx/Ix3MKvmvgHpsHNNwRPZVZ5xCZUAXiJVrx09NCUP70gEeicazOatSO6HszCHs
         nYCBlUQ4BVfInWZs753wnl9cUuvWTQ1f7TY2hdDeIiEZuVUNh36QST/zEPQFl+lSzpaL
         hU35jHLgEGFXICcBqjQayedHrqYsxUglxTiSDfTui0gRfGkuBaX+7kssQjgvez20JOIh
         YkxirqJhvhP9xfc0iAckC22l3Z85BF1nCU0wsxbUWkI3aEZpaEIB/jHP+l7FDjgyyyyC
         JLzg==
X-Forwarded-Encrypted: i=1; AKwUvBz4YKEke1ds0vcDriZA/j1B3jpOzRbBAfpP0+EjzeEJqvW1+/T4m41uYxkvhGUp/PIQnexuSfazoov3W6Nx@vger.kernel.org
X-Gm-Message-State: AFq9FYKu3UBSDixiQm5+QLfJyF97tDqDIvpLw5vsMscPcQ4UWw7Q0wbY
	HmMFuBiAIxM/hEDtxXnpoI8ssguUbLZYXRsVyqpggdF6IVLX/46QM+g1+I7oxVtXgshNsbZR6L6
	w3qWB+DDOmY0Uvwh2Wix+wPn6plNxNu5jGR2ah6oYUKRzCoZv9OP0JA8fD3tEf+CglcAG
X-Gm-Gg: AYBFou1jgILJyCxX7TGFd1uXmpeLzuiPsFEO83TDuOa3utPm69eYZ2+nu4uDICPhyoF
	U8KJpseUg+Xpmv9btZ7QxpZ5u9ophVfTW3/ohuY3jICU4P4zdlzpt0UyxWW97lJN1Z9AWleezyL
	6774rrsAid+TE0c7ESgkSME83O6mQKLc+YcnpBquRjSgub+3zRSBW2K4lzu/vO4yLO27PZryJ0x
	PVb0dQEPO9TvzNvtdDv5eHzUudkmWQXaJAQ5Jf6Aj4XQk8/vx4vhLLUd9MM27ugW9ZBn88aElZQ
	PdGcFZhDYySz4X+Fzza08EMIuOMPpG8rHUokQyIERg3vmtAepz3h0dxfsjEegqBTbeXlTVAJ3Kg
	HMTBYgvtqAcPiXBD5uCcO+/QQcfWRdPdWQ6dcqHvY1m4+FcKD00bqk/wLnjVV7llu
X-Received: by 2002:ac8:59cd:0:b0:535:1f7a:e29c with SMTP id d75a77b69052e-53fcb7fd72amr73061511cf.37.1793263044585;
        Thu, 29 Oct 2026 01:37:24 -0700 (PDT)
X-Received: by 2002:ac8:59cd:0:b0:535:1f7a:e29c with SMTP id d75a77b69052e-53fcb7fd72amr73061161cf.37.1793263044021;
        Thu, 29 Oct 2026 01:37:24 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd354asm31506527f8f.43.2026.10.29.01.37.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 01:37:23 -0700 (PDT)
Date: Thu, 29 Oct 2026 10:37:21 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: glymur-crd: Drop L4F0
Message-ID: <mor4cxzv3iozz6tyjl62ib4dyndlxp6uluhzebardpgswujkkl@oi5tzh5vvafn>
References: <20261028-topic-sip_cob-v1-0-80ab6704aca3@oss.qualcomm.com>
 <20261028-topic-sip_cob-v1-3-80ab6704aca3@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261028-topic-sip_cob-v1-3-80ab6704aca3@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Yu2a1IYX c=1 sm=1 tr=0 ts=6ae305c5 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=2GcbamvMf4vLJYqmZ1cA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: mDKOjO1eaoSdZLklkKWVezvIubSrRiF8
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAzMyBTYWx0ZWRfX3GmKucSpRSUU
 PLpVbI0MwlSfNWZ/PEijaOpqUeldKJk+p/f+lXQYRyfNk1MZnF7bJ10x8AMJIs6f3NI5IEFGkD+
 zM2Bj+glGV79P/66nSybrdanh/cXeN0=
X-Proofpoint-GUID: mDKOjO1eaoSdZLklkKWVezvIubSrRiF8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAzMyBTYWx0ZWRfX71FAMBjrwe92
 HL52e4wKJIIQMbByXCj0y+4WtjZ2DQmSL68/GzPE4dU76kh+EIDF/2WDi5OlfmVAvtSnnvkyCsO
 Jd/32Oea7oYERq+69sATiFoDFuxbcBmJd86lk0yQ4csEzKLtycc434yF8939YTdxDc5IhI0kIp7
 r2DEEsh3YbMPD/BEG5Tm8p0yJKrZwZB6Ka61HYj+kQ5EW8awbempcWsZC801fNe5yRqTJG5EiNr
 URhOoc5MIcGRR5E6v0Y8KCvPNSu4jLCMGDqiWzBr/9/idmCCd2ps14A6om0urV5chB6szoa5C8Y
 UxfEvUwi8qTimE1ZAwZs9255/tWJUqUmeEqBtIm8K/6u6Q0UC45mAqHclou1U+FmXS95f2nOOu3
 TdOUgDKrHjbbw8f1WMXz0fNqlbZWcimZ4I8fu2PPueEpvGPAPOuHGejryKI20OOGT/dNbc6Bzaj
 2rjK9nByP17rig9fN/g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 phishscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610290033

On 26-10-28 21:04:26, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> This is VDD_LPI_MX, already controlled by RPMH as an ARC/RPMHPD.
> Drop it.
> 
> Fixes: a5ad8a8e473c ("arm64: dts: qcom: Commonize Glymur CRD DTSI")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
