Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 092C0493D57
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 12:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789992225; cv=none; b=nBgT4h0m7XaM5Qsx6GTMFNkN1OKrDdx2Z1hnzzVeAs6rflN1Ik8ghbSWoaJoouP8UNNkL4ULm5JBT2jV7n6wOt+YxECCVDsHeH/TRKNpgHxBQkb9nYj/Z2fgoyCbHYwJ5MKOlsTJKHbaXu215m1Cwe/zNjVhXrueFzdRxgUjkSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789992225; c=relaxed/simple;
	bh=dkCg0VF/nmtJQ9q41G4WkvDXretB+OVH59ybsKpgbv4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mMwEi1IrqW4JW1L8ZaCrDeLVEf6Q1EeD9mGn2McjdWzLdYDx2ux64h5HB38WcYdyCnjWp1LAfqre4bCgRrHIYQr6currs4O7pvpXzZ/k/Sahl0640FqnjvpFdjrXNfSpDcBw3dnnIeumBjl1LA2Ips5szrwjgJmp7yggP0NoQQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NAeFgV08; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FauWyBGP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NAeFgV08";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FauWyBGP"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LAeLxF1219039
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 12:03:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vr7HzjusZyhP4/dXgy2m4qWv
	YG4scQg6gixx6oakxiM=; b=NAeFgV08TE7KU6No2mBroDHTkTdOAvfq4qQHZ5Mu
	A0kq9ITkZ6jeF8X3oOcNFdGvUnT1MqLX1MKMjpWeV7/MYM2xkwldpCDJN9pqs6lM
	GG5mvctAQQCZF9ENDq58pXN4dB8ASIyWIPBSOgoErlB+Hme4/fY82bF9jL6JwULx
	qyr2DgMsRBeDEVOnb8R1xZp6QULEYfAHeG7BmKh7Xqp262dlPO1GrGTnK+VkYLr2
	3J51OU8nbbO6TpWs0Dn7nipKa/Bp9+V68y5IMk+cQD2DI4y/OkRKaIYTqg0q/X4Y
	waCWUNSrHiytYE/lXZqk6LUrBnuzr6X4WMio2o6sJSDNGg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu01194p2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 12:03:41 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-78fa7ff1a44so772533137.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 05:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789992221; x=1790597021; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vr7HzjusZyhP4/dXgy2m4qWvYG4scQg6gixx6oakxiM=;
        b=FauWyBGPg5iliAH3qWGUDc3DPH7vnt50WZk2EH9NJI9qgvvgmFFljOXI7lfo9ODBpc
         pqb/3nP7wappL8EWWVL1r0Uwl/2eDTwnY4Lzmi6KY0CC7hL8Sg7lfagEzKwfjTwdQolJ
         pEGdKYw6BCWYLdI8e6Iqk4MirYyKAZhntPypyI94FY8K/Gm3BQSpFOfwWrrjXggYjTEj
         VUPjA8TodqgT6As7mnu7psJsJvD8LbIWBmX2Rvm3ZDNcAssSFhBLNMcInU3dCOq/yb3y
         rj/RVU02sVLYH9r+nH3fgwcAnrv8PbrGO4gNHwwwJrsPcy7vzc7tq2cSxtoJvJlwXNRV
         1a5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789992221; x=1790597021;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vr7HzjusZyhP4/dXgy2m4qWvYG4scQg6gixx6oakxiM=;
        b=pUPQfxqb8VDrgeN6y/pougwzePM+DeN9qLBzwxhCZIUU5qFTM5w+c+gcwoJPw2rau7
         OFcI8T0AWHIT76Qij59pEog/dXMjhbokSPBM9C2qqi6KuEcg/Q9QCwXjeP1qHmI9FxRg
         T4lRvmS4ReJtK2Doif7k7nNWrv1pP7WpRx4E+uSfCnRbUveSe+2kODwSRQQU7E+8Vb9E
         UZ0sM9M3eL8v/T6BbddUtqDFVCiCFoThGbkMgwv/tJV8yc3L20SvhV2vky5VNBUhvJrI
         f9QHA+rLWtOck7F5l3VDYYkHnW5TMFDEGsuXjPBATrH1xFph6nB9z6YvLJt5+lGoIZhT
         cuTg==
X-Forwarded-Encrypted: i=1; AKwUvBzuD+FqPzHwHCpttszSwR/2vD4lGewN0DMy95WqAgr67DOw033wAkcGhYDlMiFuvl2O7wYm82ZJ7Zh3eqcD@vger.kernel.org
X-Gm-Message-State: AFuF++kWZ4vuAZUw53XLwKEjB7fG1AIQPptenFKlmxLffmevCSkLBAm1
	UWQQt7IkyvnEA1zqhU95xb9gpuIKoKKFkDS2kzpIoouDBPeXxdzmOaMB/cnLrwwBE+a2tbIm8iT
	Bg87qTwYbkGszqjAZ8aho/nHyA/9O4sYwyUzDR3LY1DnS4y2ngDPVD95JVEH3S4nTUltE
X-Gm-Gg: AYBFou3oSieTN07TfKU/X0jsfENBLjBUlv43TTl3/LmKt/4F9Nq5y9IDQ/pCKY6AZqa
	Jo0XiAaAz3idc2wI3o+fGlRYZGRp+HPHDGLFtVCtHO4HwAthRmKzWCO7zYO2ehAZZgORXQ7KAHE
	X+xLaf8+mKGEcRh7QPpr7g6mkUkTJtgByfshg9IDlHSW8ljPioqDpROL0TTgsNLB/8KB4V1P0o8
	X5uEIS/hoEA3MvjXyPFjqcanbHIFH+zXzIbtVbqy7tPshU2zYtW+/i/Wu2FrNoec7KgTSFCmEti
	6n6L8uPOfj/U7t+hGMR0yduMptQ9dY9NfzBlLahjb7/zmDLrJEYjE9HbWM0MKnxYYS2/HqP8NzT
	hpQZDFt5jdBPT0Vg=
X-Received: by 2002:a05:6102:c94:b0:7a8:1817:278e with SMTP id ada2fe7eead31-7a818172947mr1115775137.20.1789992220918;
        Mon, 21 Sep 2026 05:03:40 -0700 (PDT)
X-Received: by 2002:a05:6102:c94:b0:7a8:1817:278e with SMTP id ada2fe7eead31-7a818172947mr1115706137.20.1789992220398;
        Mon, 21 Sep 2026 05:03:40 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc471b9a2sm147882235e9.0.2026.09.21.05.03.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 05:03:38 -0700 (PDT)
Date: Mon, 21 Sep 2026 15:03:36 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>,
        Sricharan Ramabadhran <quic_srichara@quicinc.com>,
        Kathiravan T <quic_kathirav@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 03/11] clk: qcom: ipq5210: add 24MHz rate for USB UTMI
 clock
Message-ID: <is5xheeyacsg4evn7mrtwl5wzti34oswus6xorhweaknahm5dk@l3cdldjupkjz>
References: <20260921-ipq_clk_changes-v1-0-d242e3d49648@oss.qualcomm.com>
 <20260921-ipq_clk_changes-v1-3-d242e3d49648@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921-ipq_clk_changes-v1-3-d242e3d49648@oss.qualcomm.com>
X-Proofpoint-GUID: NeePd9vCMljXYaMNxu5pc9UyTUbwJUKl
X-Authority-Analysis: v=2.4 cv=dPczC+Zb c=1 sm=1 tr=0 ts=6ab11d1d cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=JaUoqYncsU2g2DIqJJIA:9 a=CjuIK1q_8ugA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE3NCBTYWx0ZWRfXw/MiVbTP46cC
 xE1V4D7IIHsldqppNAurZ72zdW5/mUzpju2QVv655NtDoYBzJ/ixEJVw/NJkBQiMGPQ5cJOxfvl
 NxPXaZ5l7pAgT33fE82aICUyCwP/9IhapSaw6Jx9FxzXuoLSTCKU/U3yIfNH2fLslEtJqfAeCaX
 a+SP71g/fpdJqUu7JDIsjA5SwQYoFK7NYe8OsdDnc3ru7E9NLba8z3xGJDoCYhQFgMZPaQeCC0x
 QzvgX2bdN/TLpugk765XzBKmD8cNcWm5OGmaGKpIrk3/5bQe6zbhe8g3ke/0A0a/yYNvAuPnvlJ
 ufX7//Dg8TR3CMdhZpxO50XeXTYoEcRkOkR/o2zCp27ZthLOGkVuQKEpJ9I+kmEnD7/8upn8QBK
 7YkY4yL1DiaFcPxrE8Ku1KzGoWib6bRlsClR0WaQVYYawIOSOkKLpVxGPFpuBCE2p+8VQLKj+cr
 JCAgLU/MTco1ZDllA/w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE3NCBTYWx0ZWRfXy9QhfLRx3bxU
 B25qZa2kSGIpPwpw566t6XmO0ZWwPRRZ8zzuLtlSDJl4zzi+U1HGamxslQ7D6Lpzz5OD+4INkEt
 8KlgMQ0GP3NXIsfWh0AUw74LBv9CqLc=
X-Proofpoint-ORIG-GUID: NeePd9vCMljXYaMNxu5pc9UyTUbwJUKl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210174

On 26-09-21 11:49:36, Kathiravan Thirumoorthy wrote:
> The USB UTMI reference clock must operate at 24 MHz, as recommended
> by the hardware team, for reliable USB operation.
> 
> Validation showed that USB 3.2 hub enumeration with USB 2.0 devices
> fails when the UTMI reference clock is not configured to the required
> 24 MHz rate. Configuring the UTMI reference clock to 24 MHz to resolve
> the enumeration failure and ensure successful device detection.
> 
> Cc: stable@vger.kernel.org
> Fixes: 844be6e24afd ("clk: qcom: add Global Clock controller (GCC) driver for IPQ5210 SoC")
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
