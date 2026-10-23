Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792764138;
	b=fVIjDoTcEy58RChBLF3SGJcisnbeDFv4UCu6ni5Rr4mxIrGDt87Ef5SSx2FFPo3l1iuL
	 ClU5tyEVw0sRexGERUPMEpAmfH82hALtYE3rI0pykfpGOQ71UG6evJPNK8nWIBIQqp6T+
	 4BtjrrqrNfV4Uk/5pTeittnuj5HYEYgtvqcw8QTyZcT4Mu49MWiHmTuFBGBzfwefDqne7
	 RXtyMVqwxl+A781LQOCXrNlMjfLWFephTXHR9QDseLpvtD2Uv9a68UipdV+kxC2tgVBbj
	 dlPeQG//oD7x81bDxV81Z1jAwiRzdzsGd7zF1P9IUJ0GcXOKN1QMDA8aRY4ValsGlaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792764138;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=MXyWGToeJHvKTRRZq3XwmlkSnt8Y/hGNiIq9DpWzezc=;
	b=J41zGT19HSTBPafn2JUWxELzPqDa8zux7UwubIl00nEiLoEn3zC204yX7EQBKYapFoyS
	 r8P2uUn0NUi9OfqgxtUnMDL7OxRI+syf8+UKTrVzPh2wPXZdsUqOGgw6tW8otQISAkddE
	 hseQl3FEataKT71lClkXu2w9Q0uEf2pauIFfw9VwDT6oesotsRB9pGGtd572TYfYxeVCJ
	 K4IusG5mE3vj1kEtbyE5OBM601QhxYECeGd3uLYJlkUYbxniPKmFAfi4TfzSjl0Fz3v/8
	 X/ozQyPOsHu4tAIOtGQWkwcI6KS0snCCm6lr7Gdh9JQl77OJRGq+WG3ZGkrgHHNffBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Dg6h2ZMC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ST6mbG7i;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EA5C606A32D
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 14:02:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5EA5C606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Dg6h2ZMC;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ST6mbG7i
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NAAZsC1948486
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 14:02:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MXyWGToeJHvKTRRZq3XwmlkSnt8Y/hGNiIq9DpWzezc=; b=Dg6h2ZMCLLsc/yP1
	I6qTTMVxn0gHmzaeTvaOGgud5bFVkeJocoTVCav4vqqdigQvcPIuygrlLDH2EIxe
	F+TGw6CKOac8cyTs6zr1XNCYrnoA+aNBnWo5jbsqL2U4MJIguL8QtS4PdAyxXJL3
	tzi/lByzoafs5QJ2whEB/A1L9sd1k+sxRfoQ46vJhdhtOcmQZqEOIjV51vgvE0ej
	EgJYrK8vcdyW/OaHkwSfAIfACEegabPswmbrzPsbvCXm1wt/e9CZkODgh2aTStbs
	z2pJclQcrIb2EWusOmtMfJgP+oYsJGA7HFyXYlCJkpMma8IznROzhB44kzgRqP50
	N9XDVw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmtv0xs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 14:02:17 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30c58d35c0aso159971eec.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 07:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792764137; x=1793368937; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MXyWGToeJHvKTRRZq3XwmlkSnt8Y/hGNiIq9DpWzezc=;
        b=ST6mbG7i4M3s7DOpZVaASZUvYLEdViCqEw5SoAQmM6Yn9ENixSn1N9RlYYLBT+sM1n
         OUSc5Q8QBzIgQoHSuewVwox8nf08A9br3eu4ZocwivDB5VCSP0ijudwtzvvFiLI+07Lg
         +ZPPIhJ96tNUjeDDnQqhYSQ+rImFHtPpbkb8MEZALdms3woxZV/pRNNr77ZLzP6cN3OF
         rtVeGKA087k3cXi012uhq35c1oGh36Dfp+5yMbxPMUw9l9zgOkMu1DXKeOKQzX2UN8tm
         PMFJ++tG6CRibbs6QVtw8xPy1qch0crXaOsxxmi26mgf7Kfrvs6dkl27AGAtzTaBrKoo
         Dc4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792764137; x=1793368937;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MXyWGToeJHvKTRRZq3XwmlkSnt8Y/hGNiIq9DpWzezc=;
        b=piUkkZ7CzUY8wT2tlj2U+Vei8aTrlSIIZl9ex5/g3ohILr5bA+RVU6t0zwai4sTAXn
         Mvy8vepsMjWLO2brUBua6EfH6GDn+MKEmwvzcboJYgSqiorNx9lpcDiYQsi4m2+y4rhQ
         UMbvEeIN+9S6xgaq9jf1sxUIVN6Q2Kcg44ESTAlFdlt0AgGdJagUfSPZtwXT41FFHft6
         0y5IO3MbqLPU6kYxULA0wT0wWKC9CmUu8XC3zRDhOkk9R6a72ak8QU8j4HGBEpTiUY8b
         eZtdp5HTk1jNpSOWVP1BDOtmzEzvwDKQwERy79hsav9wD1ytewanb+fPBSzx5kfTN4Wp
         izdQ==
X-Forwarded-Encrypted: i=1; AKwUvBwIi4o/3PqNRWO1VcpslI95CZd7rNJBoZvBPYyUXIFI9rh4UX8g3IUp7TeG8lmMdWPBwfLfQVpnkkv23E28@vger.kernel.org
X-Gm-Message-State: AFq9FYLGKyyE0nDolYaiefcSWCRmcuwDU45AJ8D1AQNpZrOi2PdpjDHp
	eTood4fCEth2CQQgw3JNkWlwruuusQtDF2Yic71NenImw2tHAp5x0NbGHa6K6s0VDk5fiSF2sO+
	FvwRaK6liOm6Q4cctLgOYBKDUVEFK2Zm+HYolpnN64wdK+xV+53lC956V3UwFPi+W9vzp
X-Gm-Gg: AYBFou3gV8HBYcGPOeo+UKk+xLbKXozjONpUG1HVDhdhr3yexWx7d3SETm2b4csfE3V
	K8uySgkgGWIH+IrCp23jdXPknyDYoJxrH8zcMokwPdaTsm8FZo/KMYj6Iih9abo3ULj179BtH8m
	FRzrSscbsai0y0z2Rq20zGfanmYOG4Vbemo7FAwsbOPcpuLMmm1dRUWIS+5O1zcVRjTvFvkdhY/
	2MrZdChsR/b2Ycb/kWVs3paqxNdlnn+l6OAe++ctpBMA0UaNvxieYer9quCOgbVTLAPTt936q1a
	Wz0KSf97D+IKXKt0OwpoyLgW1RlbAUWppw+7IZH4lhsw1CPWnA0kyiVQ32ywBYqMdffgVkq4Zbf
	5/xA9+jk/WlfQwRAg84f1jA==
X-Received: by 2002:a05:7300:e9c7:20b0:369:d85a:d416 with SMTP id 5a478bee46e88-369d975dedcmr5567427eec.1.1792764136771;
        Fri, 23 Oct 2026 07:02:16 -0700 (PDT)
X-Received: by 2002:a05:7300:e9c7:20b0:369:d85a:d416 with SMTP id 5a478bee46e88-369d975dedcmr5567356eec.1.1792764135935;
        Fri, 23 Oct 2026 07:02:15 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46b8d3a041sm3976866b.68.2026.10.23.07.02.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 07:02:14 -0700 (PDT)
Message-ID: <d237678c-9279-4bd2-9d72-b98830db5d79@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 16:02:12 +0200
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
Subject: Re: [PATCH v3 4/4] arm64: dts: qcom: ipq5018: add Ubiquiti UniFi U6
 Enterprise
To: Andrei-Alexandru Bleortu <me@andrei-z.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Johannes Berg <johannes@sipsolutions.net>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>
Cc: ath11k@lists.infradead.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-wireless@vger.kernel.org
References: <cover.1792761470.git.me@andrei-z.com>
 <d1bd2f947ad986ff3c3fca1ad367aec2f1cec6b1.1792761470.git.me@andrei-z.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <d1bd2f947ad986ff3c3fca1ad367aec2f1cec6b1.1792761470.git.me@andrei-z.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Gt3XaU1C c=1 sm=1 tr=0 ts=6adb68e9 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=J72pobsmAAAA:8 a=EUspDBNiAAAA:8 a=5oLZaV2ftHNI1lavKEwA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22 a=CEj32ImPKXYnrW9rpEIO:22
X-Proofpoint-GUID: 1KnMxTamMB6I9z3y71ygt5I0y6T8cbce
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA1NCBTYWx0ZWRfX/XHZkuKp+sCK
 9aIvpiQpDfworhOVoPCEFMOWJNydI4kWITc0UwXpRkQpImAvnE0OOj6COynz0KO3N6IfObakKRs
 vx8WODTFRSa+uQRGM6VV2+o0IFPxZgBG3Js6Fr93vK1/dOdssRsytNtnDepn8vG2tRQmsXrbTgW
 oJoa4luopxdPoKoR7jjjYKqHe0cMY26SaEpqT02nVJs5uwiyhAr7C7Mssz1C1HUegdPBrk4XE5q
 etBcgy/7N7GfmDVUrwewuiL/e6BkXswz4xdJi7V6xAR20FLDEiZlU5zowBzoTek3OCxtGi+PVRH
 /K0maoIpZAhBcta85pj/lc2dhM0ROVQMR7Oxy9Ons9M55048UzXD/sxKkcF8UqBA3PHq6dcc8zg
 O4yB6xdUSRXzRTKfGa9g7UUwTj/wRCqtcyEt24cO6V0r7gsMq5lNP0Nv73Np8H7JDLPrZRVKK5i
 3tMDVOY/rMzUOwfzOqw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA1NCBTYWx0ZWRfX73SYGCMMZKSt
 u7Ar7IW750ZN3ouh+6tXCTehkJjaHuQ0e2p7jomWxzydUmGI9xVp+lrLoAI+NWYAv6hLz9n7AQm
 12YMidnhSFGPrYJfU3ECvm0hpUlkBn4=
X-Proofpoint-ORIG-GUID: 1KnMxTamMB6I9z3y71ygt5I0y6T8cbce
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0 adultscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230054

On 10/23/26 3:37 PM, Andrei-Alexandru Bleortu wrote:
> The Ubiquiti UniFi U6 Enterprise is a ceiling-mount Wi-Fi 6E access point:
> 
> - SoC: Qualcomm IPQ5018
> - RAM: 1 GiB
> - Flash: SPI NOR (boot chain) and eMMC
> - 5 GHz: QCN9074 on PCIe0
> - 6 GHz: QCN9074 on PCIe1
> - Ethernet: one 2.5GbE PoE port, a QCA8081 PHY behind GMAC1
> - Accelerometer: ST LIS2DH12
> - Button: reset
> 
> Describe what mainline supports today. The Ethernet port and the
> IPQ5018's own 2.4 GHz radio are left out until the GMAC and the WCSS
> remoteproc have bindings; the LED controller and the board MCU on the
> I2C bus have none. The QCN9074s carry the calibration variants their
> board data is looked up by. The SoC dtsi gains the pcie1_port0 label, as
> pcie0 has, for the 6 GHz radio below that root port. The vendor QSEE
> reserves 4 MiB, twice the SoC default.
> 
> Assisted-by: LLM
> Signed-off-by: Andrei-Alexandru Bleortu <me@andrei-z.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
