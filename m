Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794932356;
	b=E4ODjKowzD2q4vPRjInD5k6YzV4IO9v1Xl3f63Y3A+pjTub8m23+IvqNa1+jw+cU4EEv
	 DlgSEihmJ86VtiQQyv61xm2QkfAAuC6k6bJus/F5oe312gLbr1miHer58VC3f1tyOeHLe
	 6C/QLBD/SiPv1V4aEAG9hQ8H+7J0+985rfLw2u6iJgVpn/6VMRWSc5w9z9+Y2OTQRdmvg
	 caF3Rp2NfkMMRVWhV2IP1HxivhMq9CV0mDcSi1gi1eWI5/ZfbZ3RWDysGVT/uGQHnSP/c
	 EBqZrZ2IViZuEUO1tUtVOM580reArQt3ZsAm2xVPOpnnmehJlECGcqeGKquJ/6+mVtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794932356;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=PoydfNflc37spVuYW+Qn3aq9PQN/sV/Z8s/hao3VHYk=;
	b=AZZq654mOEUNQ62Tf68iD9me2n3EISLqRdkwz9SAqRZZXEr2hB0ZiNsqOO5/G41WpRmu
	 w4lRa0tvbBrzDMMxDPnOERaDgQ6GX4mX+4+HjSW48GUDV3ek8uYRmOaUHjX6X2QykkfNH
	 4b5jvMc2s2NkBVXinJG91cW/4wbTjJMw9ZgvOibzThOVCB5wh2jTQZLqFVSreYXzssr53
	 FJFgtL5qnOneQT7RkI5Jw2zMDBiYL23TFSqx+fusMJ74G/1mrjcWnLepHFFmoLJB0h+4I
	 siw2PyJ2n0Go06DmPYdqoKVp/5nQepg8WnC23Fq17F1e1ZWIoc0M3h8HxTGgWAtpm+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XYWAiliC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aZvKDYHZ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37EA0606A32C
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 16:19:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37EA0606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XYWAiliC;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aZvKDYHZ
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHFQNNe923362
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 16:19:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=PoydfNflc37spVuYW+Qn3aq9
	PQN/sV/Z8s/hao3VHYk=; b=XYWAiliCsqFDfQmgDEgLMBFs5w3ewAqotIg/w28g
	CvkVNqkn3B2gfqbOfqQ8WFSTaC5hLc9DM3pbbKf4U4uhrd2TqkOriWTEY+SKmFc1
	FRWpVg9r1FA9PMPExtBvOCboddjvjP1jPvTnFUMCYrWZ24E7PZxawrTxBwaAWNpA
	iDSTI1qAswQSUNuM2+buMCWPotRapEJLJYzy38Bf+qZkdzAoJ+IzmKRxWy5wiQPy
	apcy9XzZB070kVX1ll5hzTacFY8nI96kpuBohOgDxmURkDhcsdx4FiQkW9ynoXvZ
	CPOAu5UNNonEitoFwsP9cT6hCU9997EVBQtLFSIMFsLehA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0qms0vf3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 16:19:15 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33713e5e6daso62802eec.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 08:19:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794932355; x=1795537155; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PoydfNflc37spVuYW+Qn3aq9PQN/sV/Z8s/hao3VHYk=;
        b=aZvKDYHZZXstA6wSA/KqMbhSn0JE3uuSd9cEa68s66ChbKJXpeV69KK2qOvRZhr+S0
         tPGl+jOJQkV1YsRQZROZwmUqGqO43iv3UFdCpYORLl+I2+kHKMvuY1I91q9vcAFIaqfD
         PvIyiwrMaPcLpM1jJbpyYrXwqLO+voTUkgGdgD/CVFNk7a2YQ4ZMmYIu1ljupc6188Ts
         j4jtisADPAjXD1WFDkxb/iir3wwrB9IArjiGStvg8VhGLoy6GTrIJr7rswICXyEl+rWM
         KzkFykjzJ8E9VtXXVQ0nkhDt1Gz43gFbX8s2+nDegHQpnyMqIgGJliH9657bB0DQ2L/K
         qgjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794932355; x=1795537155;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PoydfNflc37spVuYW+Qn3aq9PQN/sV/Z8s/hao3VHYk=;
        b=nQ6dIiVHlSWnLd6+xgMk3lhR6n8rEUHRmy0DqHs+hjepMeypUVcemmRHXKTNxNMb1Z
         S1t9kpBXcYbA8mm8YTDN0r6eBi789+BkRwp+xlo4IpG+pcZJOnCvPd6+oLuJ2hOLSVyT
         AVuQs8PLQu3ywxLRefnAJMCiRv/gumDB8oiPGC+mvBYPHFdo51okgN7SdXRHiFh/GoRC
         1XUjkHWSxQnDLWy2otfS3GPuT+STPwCSGvquiEmzH0PXhUYqRdbQleHEZrm1UOL23ec/
         UKYkdIrkxl+jSDNw4PK8CNGhCBM860N+qi7ps0GcD3beYK6eA++3k4/w/5iDKnlTpjfE
         31cQ==
X-Forwarded-Encrypted: i=1; AL+hErHSvfZ3Y75ZRRqKu378/EEuFwzkn+CMqeezlFVjCczUUITalfhNTDDLJtifAB5fAP7KMRK1m2ticdSnWjPW@vger.kernel.org
X-Gm-Message-State: APuU4Z8E0go01dFnBwTgxUpXKpKm+ujVg29cbScfzDiCnileSMSqq4eI
	91FTitNLrMy9fv3XYAeIa4CJ7gs3889bTfWWxV1xSYzZ7Ys66FUHXzAMOeen8sIlj7+yw+Tp43U
	SW4uivP6QhWhxDH6nGOGPu1AuQleNaCvSEweEUYsrBccJLYJrTMdyCughq3yUTuP9XODr
X-Gm-Gg: AZFdTZfDmxKEuV316Y9xYJjqhNb8Nvp7yA4ykllNLeGEqqSXrVaKKK+7BbNaL0HzZlf
	unRrXa5yVlXcww7Hdl7fNddSI1hVvH58hRgXMg3hZ9y/WqDrU7CuV94XsJwFLvdBWxBdW6mUARo
	GUl47Kl2ry5VXOb8hohR5dpSso+2MVoImepzsD8BDC+C7oBee2YT3ESxFqEOVt8knYvwVfLOiIZ
	FFMxviJZHY8xQ79dIoVqtyHE6iwMshR5hplowkmgC4UaLqBzEjBACctMCrpRNheQmjWCVDPx8m4
	iiLAZpsFoSB7M/UsvX6Zf/iEMfaQj1ktiN8+qRuym+5GUnFo46yYjZCRBz0unngLbIZW1QdNw2f
	m2eVrOiVKEzhybijeGOWCCtfyET6MAVxFwDV0rt5dA7qQ2TmrXc7fj8qqqTIaNFfUUV2oKumtt/
	s=
X-Received: by 2002:a05:693c:894e:20b0:379:c9e5:cf0e with SMTP id 5a478bee46e88-379c9e5daddmr12866919eec.38.1794932354388;
        Tue, 17 Nov 2026 08:19:14 -0800 (PST)
X-Received: by 2002:a05:693c:894e:20b0:379:c9e5:cf0e with SMTP id 5a478bee46e88-379c9e5daddmr12866871eec.38.1794932353720;
        Tue, 17 Nov 2026 08:19:13 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955332ae7sm68613294eec.8.2026.11.17.08.19.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 08:19:13 -0800 (PST)
Date: Tue, 17 Nov 2026 21:49:04 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Xueyao An <xueyao.an@oss.qualcomm.com>,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Monish Chunara <quic_mchunara@quicinc.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, bibek.patro@oss.qualcomm.com
Subject: Re: [PATCH] arm64: dts: qcom: shikra: Mark RPM message RAM as
 no-memory-wc
Message-ID: <20261117161904.2hecbffviqjz2dub@hu-mojha-hyd.qualcomm.com>
References: <20261117-rpm-memory-non-wc-v1-1-e246fc6bc66c@oss.qualcomm.com>
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
In-Reply-To: <20261117-rpm-memory-non-wc-v1-1-e246fc6bc66c@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA2NCBTYWx0ZWRfX4rDqEyuVhEBV
 ioqdTrzNN4Xf3GAyxRwKLR11baxObZsd+mSNI2ajUp0qck0XOFiTJVZAM+NbEC4lQPcs9a53UXX
 tVSRmEnHGf6UkzTR9fJF/W280XYyOik=
X-Proofpoint-ORIG-GUID: Nsdpq9z__9Mawz71Rm7NzReQpnPXG700
X-Proofpoint-GUID: Nsdpq9z__9Mawz71Rm7NzReQpnPXG700
X-Authority-Analysis: v=2.4 cv=BIEmP1QG c=1 sm=1 tr=0 ts=6afc7e83 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=I6c21bvp6He-TJasAPkA:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA2NCBTYWx0ZWRfX2rKUDplzq5T/
 k8sakDM1aFAHD7vsGo5WG4ajmaUul7SkFTOhG0ngDVDNrXJFuYQM/8/6KNBDWdE4FEssbA1fpvo
 jIw+dMR6DCwziKL/5prlXZziErORUD8TlSGk1/7nvKxZSQRay/nrD3GqAoXUGac2eq767Dra5uS
 gj2dhQF53+G76AxStwTfAhzKVQPiyMtymaRF6h2b8UMo5kikDmHRv35p8saRP6xhcUB3oT9F8UA
 XA3dTgxB1GMxLKh5B6aw4cx2mG0yK1EDL0Rsfn6FJHhXN4IEXp2LhrkwnQ8CGy1GI6LcdApL+6u
 kg0RKFFhQgb2kjQmCUmxj2gMn6RIphtnmTF7YFJwJcvuG3AlvpSAsFxSCEF9i91Nu1dQFGH83+y
 zUkklgte1ujnxzh5ZGsWd57WQtngMqk6zSholhGdpO/evu8//Oca1Xks7nn5y9j35SBdEufBGv6
 H9jVCr/RBK+XYbIEEKw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_03,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 phishscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170064

On Tue, Nov 17, 2026 at 01:35:50PM +0530, Vishnu Santhosh wrote:
> The RPM message RAM is shared with other subsystems, and parts of it
> are not accessible to the APSS. It is expected to be mapped as Device
> memory.
> 
> The "mmio-sram" compatible makes the SRAM driver map the region as
> write-combined (Normal Non-cacheable) memory instead, which allows
> speculative reads into the protected parts and results in XPU
> violations.
> 
> Add no-memory-wc so the region is mapped as Device memory.
> 
> Fixes: 66664b5701da ("arm64: dts: qcom: Introduce Shikra SoC base dtsi")
> Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>

Why only for Shikra ? 

> ---
> A similar issue was fixed for the Tegra SYSRAM in commit 61192a9d8a63
> ("arm64: tegra: Mark BPMP channels as no-memory-wc"):
> https://lore.kernel.org/all/20220622132300.1746201-2-cyndis@kapsi.fi/
> ---
>  arch/arm64/boot/dts/qcom/shikra.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
> index 2623e139196f6398c57b616879a37f84b83d59ac..597aaf490519e605d50e24c090bbfb1e47b1f28c 100644
> --- a/arch/arm64/boot/dts/qcom/shikra.dtsi
> +++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
> @@ -1347,6 +1347,8 @@ rpm_msg_ram: sram@45f0000 {
>  			compatible = "qcom,rpm-msg-ram", "mmio-sram";
>  			reg = <0x0 0x045f0000 0x0 0x7000>;
>  
> +			no-memory-wc;
> +
>  			#address-cells = <1>;
>  			#size-cells = <1>;
>  			ranges = <0x0 0x0 0x045f0000 0x7000>;
> 
> ---
> base-commit: 666539eecdf4db623f5e3c3e55cf9f2dfad24aa4
> change-id: 20261117-rpm-memory-non-wc-c93a6ff3e432
> 
> Best regards,
> -- 
> Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
> 

-- 
-Mukesh Ojha
