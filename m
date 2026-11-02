Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793618196;
	b=wHzsvKy+HdmqSKjAALLwX0hgpeE+1EzYSeLCZxMRnuxbBnaOwtC1d8gQSdRx44g1xHEm
	 o8XkxGPYRSqs9EadTVucqtjx+xc9Bt+WikKBGpTwnjeAF+Nf7dxammtK6jI0iC7nNvOKl
	 oN0R4XFw+1vOmN8OivAlFH6yhNBPgxMKQ+NHsUuOHHQmrnal+UIAskf310kZd2oc4TycY
	 gx2PZnl4fNqnXHgaVdZ7VaAWQan35BPbjvAO8CWNQuyvfiSBv1BAUc8UtgJDH0CON4YtH
	 17zjDSXEm3CDsfhnzWBUMQ46iSE4IuTDhBxRP/0xkKqMvAQlGELItc+sZK0fDOH5+fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793618196;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=M8NNYeoqY3f0iLF0uVCsWM1ZsSvLIKqA637hrJnqz3I=;
	b=kmM9gnWSPg8o96/mbhK4VPPHaQQipBosSJuUpSbfJEtPnjzwHMzIIBKoIkt2tzm5FEkX
	 /g2OpzAybL4kG1wzVMoNeLT6OZTTHuTVILeFXn1B1iICaGQQM1K8an0oQk1kJSwz8Ra9m
	 UjDL3cX6vN1+j2dsINhyT/IGJKMzOK+5wUkmCcNJz71fcSyfGYbv2IcUQPRPHDiMjdow2
	 LjlY/b1ywvV/qkgMhD6J9BN3luYx/WBrXGrdW42Iu27VqS8xJxvXYRhoe6sKXxE+cbN5W
	 QsxRy/MoGuCrbdvdL/5Dj4Bdevjvwny24XE1CIQvt81JhTfJruEIzUNTQ6D0fXvMNCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VfB6cH48;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="DM/NTXyd";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CF92606A324
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 11:16:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2CF92606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VfB6cH48;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DM/NTXyd
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29AONb3086551
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 11:16:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M8NNYeoqY3f0iLF0uVCsWM1ZsSvLIKqA637hrJnqz3I=; b=VfB6cH48K3B5IvTq
	+XRFUyPBDigK0aptjzC3ndp5eKTujZRVXxpHBmzVdXDV7iV3w3p6US018rzwyx6m
	YPMF5XfXSWyvTn26lz3MhKKomDUJDxNF7Q2cu+Neu5+EozAaf+xLzi9cj7k62/GQ
	78uGHXGcWEEH1K+mlWPMipRHFLPjKxJt0UqAPSoJzAXCnCdQy4ugBT6xVcHi6vll
	rafoBkIWq+Qjt6hkYiGCW1C/kXzuuhPHXNqguuW0/IvhrDybSFQSS3LsYWOaclOT
	JubDL+JqFisvDri7ANHRxq6EJjrcxzDD7LyDEqZAR/1YnMBg3FaSNJyHO+baHirT
	bxWG6g==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpka61gy2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 11:16:35 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91c83481504so5716216d6.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 03:16:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793618194; x=1794222994; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M8NNYeoqY3f0iLF0uVCsWM1ZsSvLIKqA637hrJnqz3I=;
        b=DM/NTXydrLTX81DBI9cj8SB2PFrWSw2rXsKA5QPGPW53o1iwj0dl50gHIhChHrjRzL
         RewYKhXJZEnikdnkWxLZQtaIM9vWFUEgyvCj1Idb7KB9X5DY39WHI80yNj6vTO1FNPCI
         GRC6HXHcvcimTqVtV/TEqL7rLECvqVt3UR7bCdvN5G3GtGSN6PbL6P7n4I9VwweDd+hs
         u3HE0YhCnkzaovDIKagG81HNFcKl6ubhnDxP9L9CG50BaaZK30URdZfSvPoYFx29khCh
         otXctL9B+XIwcUW+4w66vbSi1eOYh4zKHcbt/S/Yyk2TyziULlumk/1IoCey1RBS6XBk
         qgkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793618194; x=1794222994;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M8NNYeoqY3f0iLF0uVCsWM1ZsSvLIKqA637hrJnqz3I=;
        b=F3aQ/7Nwebaz0UQrsXKaM+VHnCHGzdLJG7Ic/+IcZss2twRO/D6nEI3NX6kU8AygOd
         AV9Jx/dlwQhy8mGT2G9dFVI3TCeCDbfvPzLcEPFyZ4DcuQiH4mOH42zDe9ROruC7VpQf
         7V/8vKzYq+CHg0Ve4bzJ9WrNGrwbdezLpitPiJ64d337+a36YMfgAXamQC9UTqPNsPb4
         B6Vn68Rr/nZVvr7NTuCn/Ks+2Uh0js4+rFwY1Ua/gkUsYhNjP0PPt6WAGrftDckduhWM
         JIo98UuG9/viMkwwsbhkJnyt2kmvlaVsROOjGvghdJzTawcKZNvUtXVPHfBss2lKk9oj
         nnxg==
X-Forwarded-Encrypted: i=1; AKwUvByBiwQ9LkehOFb8L7CyMbCthxhcEO8StmKdb3/b9Bj2OXn+YwV25Dpwm83a+vlwGr5TENO7OLjqAzSzS73l@vger.kernel.org
X-Gm-Message-State: AFq9FYKx+jQlo8Av/HvWr0g/ySCmv9zn2JMXLE+wHzbio/utKwA8eTXf
	apIlHUE2xqqkwQAV7eeiLHX+qt9s8eHpAIUu0RV6eKNAcEHJ/iQmEVrm0hHnuUibfnh1YBb0kEo
	fL5C5r+fya4F4u/2YOysFwFnFzBZN02fTgm5UNcy7toDdRvdgMQq0vl5rRmN62tvCzeU+lMyBm7
	/C
X-Gm-Gg: AYBFou0C7QBg08G+L+sg9o9U86Jr4QV64lFNHxJ6Ux4wQzvBckQtH59JE7rPrwqEy8v
	Z1lYUbZ4lAm/w5KGbBmeEjxAXtGycMegnsZ3B6PUdh9tczKX0U4JA0Vs88Tw2wc7k2wrRGQIKQA
	kq2Putz8xequqXJWlYe9r7UmFEKpOWwR63k7vJrSHGsnHlyxEnSq785MCbqn3dv7NzRjSFWP5ea
	cviZ1TTznVeVbyP5czdzH4pvME80qtwbyZjhow5aHyIfad15FTOWxWfQzGp/bIVbzfoejeXBwbr
	FX/+kMBEUby+LTOMRzKg7096cTviHmt0/2sydRDI11uVATKZzH6pN4pT08CTlJrMnR8vv3l/yB9
	9A+vGTufFeQWo/lJT9fRVI58wSxs0Kbm5JojbG0wUW3ONGvUM3Ljz8BNd7KjVawSNbHUM4nE=
X-Received: by 2002:a05:620a:a7d3:10b0:939:8bc:8826 with SMTP id af79cd13be357-94421529babmr1581226285a.2.1793618194550;
        Mon, 02 Nov 2026 03:16:34 -0800 (PST)
X-Received: by 2002:a05:620a:a7d3:10b0:939:8bc:8826 with SMTP id af79cd13be357-94421529babmr1581221885a.2.1793618194032;
        Mon, 02 Nov 2026 03:16:34 -0800 (PST)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4ec9a8908sm3146238a12.1.2026.11.02.03.16.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 03:16:33 -0800 (PST)
Message-ID: <b6c9ec8b-6169-4080-ab50-8c3a2e81b98b@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 12:16:30 +0100
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] arm64: dts: qcom: milos: consolidate IPA
 properties
To: Alexander Koskovich <akoskovich@pm.me>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Luca Weiss <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261030-asteroids-dts-updates-v2-0-66a56c537749@pm.me>
 <20261030-asteroids-dts-updates-v2-1-66a56c537749@pm.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261030-asteroids-dts-updates-v2-1-66a56c537749@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: UttYq4bB3rSkWOhl088bWZ8st7dTGhMZ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0NCBTYWx0ZWRfX9fBngWN0Tgwc
 U4YK8Gw8EKgjJRjB2ZNXay7sY9YQeDf1/dsM4c0N/3YTvGBpQtjJkc1a/xocmwofoF01MAicrEt
 qNEtjdS55NhxFvmoWHlLAnd2C/Gljhs=
X-Authority-Analysis: v=2.4 cv=ZbyIpcVA c=1 sm=1 tr=0 ts=6ae87113 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=4a6cFKT3k8WqcdDSgRAA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0NCBTYWx0ZWRfX/enzQTyCP6aL
 Z93QrdGjadkLrCrJGo7T0x1pcd+1fLLSPaWW19V6RVW00G9CNmrkgDEHr7I+Yj9FQH/tpWUnPzU
 Br7LZCyQPxl5g1O+ap5rlfy0XoznCd+Y9HWhAoI9/8VEdAxfxlo1ucV0BrghDiy8FD2HWtgjux4
 viwPsYs31/IdU/zkRWCDNlpU/H2ZKqdcaHsNpFoI1weQUecVtaofBWD0ZZxKPzw7/sggsQvsPfc
 ACOnp+axTC9VmOm9LnHuHzmvauL8WztLtYPiyvFZT+PeefqEbBaOjFRwAsO9/cdaaDVwv88qyI+
 DfMDFZ7BaRo8mJFm8t30WUosdM6ihpHEbBsbLVfY+svJ7svbKFR7eRzH41dO1nyYjdC4nYRu95y
 DTuXIG9LBASvj8UNhpIMclDUAJ+9Ymo48qlsD9CEMzvQyLz5k5aeJ4hKw4uRbhk3oBpaUsvp3e3
 Sfkwo1Va2A23HSmohiw==
X-Proofpoint-GUID: UttYq4bB3rSkWOhl088bWZ8st7dTGhMZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 malwarescore=0
 phishscore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020044

On 10/30/26 11:41 PM, Alexander Koskovich wrote:
> Move generic IPA-related properties to the base DTSI file.
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
