Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795789995;
	b=vg5JfNxpBsK50VnY1i8tu1FpVm35QyVJ+uaucN2goiN5Gq3eJ472Qz8toAOC4gXdjuTS
	 I4BdYx5uPKQ7hnARKLEPuMnwwLbUucT1syJfPr3z3Ekgx2EwLCV9bPDxp9azaSku7dg9O
	 t08RdP21WuMuk+KZQqj0oHIWJg3Z6gCHzoZxDifFiDS2Q9Mzv4cbibsu6xfWLjF+Vuvr5
	 vn17HqhGprM6gePswXwAadrFlZC5PXE86VfOj2osQKvR269OkyyzmLChDZPSdnz804pmY
	 /bTII+pF9HrCWNhCb5sscw4wTgFgC7HtJpOjG9DqlkQqJqYCg7Jxkdi5bli7DW8Yl8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795789995;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=iWP69hNRNmZLA6SelaeZpNejkx3pRxxJb7FKwEEnVIE=;
	b=q3rLV7AY3qdg8Dnn3oGLSEp2evriH3UKwbWd44NOywTRxt0NOn7WV1xezTM6LMCm45d2
	 WT2MkowtSWn/NCgo+ihJVCtvih0dv1ni/nA420YVgl9YT6wfY8BO5tAe1TMJJsU1Y6tiJ
	 0VN1KphHW1Nv9dYzFMOXI05MKVRXsCQumm2wD6x0TNCOcAvBMl8CGrFp+DcjT39/w/lJx
	 TifguTN7kGq4Apr3cmwbELXmgXWV4Qt2BOpuE+THnCQDMvYyioAzotD1fHu5TY6jY2Wwu
	 vquJoPS4mIqsMW2V1HoLWrEVjfEEtfvtAQKXsncyx0imd80dnrlRxdC1DcjQSXOcqpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HMNucjW+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=guoj5dBg;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6267D606A32A
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 14:33:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6267D606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HMNucjW+;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=guoj5dBg
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARE1UXS3320999
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 14:33:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iWP69hNRNmZLA6SelaeZpNejkx3pRxxJb7FKwEEnVIE=; b=HMNucjW+xDb1S/AB
	Y9ZczFPd/ZYrE3A2AJ/8Fu/KLc9r8wkpQ1maqb/nTeWTQiKpURMtVpjzAmorngu6
	1Gss6J+nqHdibemuvtvF7+5yVSYZoz1stcwgOksirfcySiNYRSKBfk4YdrhcaUqK
	+e7BAN6YQJWNwj3xOsAWgTmFh0hIk4MUr9EgGsIueX8bVMxB8pIUTr3AIsABPdQU
	zlFaj0b/earxKA9LL5j1Av/ZZetrhd2da4RxjAKFbbECl8+1UJQt6psQZfwiFxF6
	VbBySedEHFpslbxpY1ZwC4SYyw3c6dkVRYA17OKHF35JFZQjzL7g/HOvXUPfO0fI
	fzEMLw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6rf93y18-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 14:33:13 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-9212747f4a4so9293976d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 06:33:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795789992; x=1796394792; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iWP69hNRNmZLA6SelaeZpNejkx3pRxxJb7FKwEEnVIE=;
        b=guoj5dBgrHSsIJp+Jmu2CpwoKGM19tObEGPQNiXAjRHv9AcBilHEdSi2H3vnVyP2cm
         U4hFV1QmBrQOgPe7XmAY25FybKyWvai+1g3olEqaF/vD320CgcvBXDvHPeLZllJsx4G3
         Ih7buufim0uFZ/ENj/wwVr6Ydg2/icNt0FUy2WRpBVZmh1NGoRF8858bHg0AIRzyGXVA
         +cKU1R9tzhe7EFmzhcMJEukQNurm3fq2G3UoBlKlALDKpN7atJsRs0OAsHLqFibKQ0/n
         cFFiXp39OYXcXuKiarANk2J618+WHMK4k40P2ctihrjXGmpZWJuo3+XwcD4VugVKWNAw
         70gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795789992; x=1796394792;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iWP69hNRNmZLA6SelaeZpNejkx3pRxxJb7FKwEEnVIE=;
        b=LeRiujCncEe3AeWkp1FhBjGlOaW9xNlFizdMznzxQJoLnudZGnaJy9GcfgHQ9biKXH
         pX8uGW4TxYMZp/SfvHy5gd113A0J1E8/qp0PY2Fg3ZQSSpMuWS5fUMsCa+dIYI3kgUcl
         pGXQDyAOHHvKZAfMsZV+YanHYXBrpuZ/DH4+dOMQU0h0FglVhKM7o6p6wuMqEEPLipUL
         CbLm4cPF8lwRSo4GVsFFcYVA0xvzo3cEX3UXpmDh8ClbLWKKz1MkG+ejtNMdqnIt65Ka
         cxfZiriY53gUF8yb6L7WicV+cDHqbwxhOkMU2jm6f4xZSDTrSMTkEQfgnYMavbbalb4E
         bF1w==
X-Gm-Message-State: APuU4Z8ifPmUkZTdE7rrHlOL8qTnNSkijVCqlB5twf1N9//bRMX1l3Lt
	nS6nmpi64hHMRDmaPCfKtVW2Sf7gvWqRfe3ZUFtW6NqGLbJBkP/a1ezV98g3yen5nAb5LslgzdT
	hRDokhZgHtpBTEmEKZoto78+/YlnFK1tcd6/wQrGHGFltpA3fegxUIVlpv374qCEn3UNPIzXRc/
	1A
X-Gm-Gg: AZFdTZeeMlGNmudEEd/fwvejWN3oC9ZpCxmo2BISkTObqNxGqhF/pcp1a1jIC3Zu4OP
	qs2jNSakKFr1s3lpUZlFaC0iM3KrCzcZI9tarDgxNx9lIsAvj8/DaVLTWqKmKGpvohLzBzpFNfI
	NIrRpxjvagJv0vz0iTqr5ErbgNFd4aSWMKRsP1JkF3ZdV2vkA+p/aR5FhToTLfw4Bs5kbsPlNst
	g3U0NVfZm707ZZbEaF905JsH74eaY05xvCtztLNvmIBiCG3FoCPa7Dmc9FvmiI95OFL++MxODMt
	wkYI87p8y+NdgS0njPXGKGv7Xvgs4lQrkA1/yI+qAX4RJog+XX3+R2Qc38GMusSp7jb2SBrlnE7
	4O3xi2lz1iZm80iIvBi3t1viTZtMYpsxojFxVwUYKgtSnLo0ntRclyDRKXVPvkXLX502J3vg=
X-Received: by 2002:a05:620a:6e93:10b0:949:7fd2:6758 with SMTP id af79cd13be357-949ba68c353mr4128044685a.0.1795789992458;
        Fri, 27 Nov 2026 06:33:12 -0800 (PST)
X-Received: by 2002:a05:620a:6e93:10b0:949:7fd2:6758 with SMTP id af79cd13be357-949ba68c353mr4128039685a.0.1795789991996;
        Fri, 27 Nov 2026 06:33:11 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae88143sm859572666b.32.2026.11.27.06.33.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 06:33:11 -0800 (PST)
Message-ID: <1ef797ee-131f-417a-b473-52e4dd965470@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 15:33:07 +0100
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
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: sm8350: Add the inline crypto
 engine
To: me@fromdisposition.org, Abel Vesa <abelvesa@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261109-b4-sm8350-ice-v2-0-fd5e84985e90@fromdisposition.org>
 <20261109-b4-sm8350-ice-v2-2-fd5e84985e90@fromdisposition.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261109-b4-sm8350-ice-v2-2-fd5e84985e90@fromdisposition.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 08wKOjfy0KmkHqwbu0FA8Mtgqc1BGGqe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA1NyBTYWx0ZWRfX+4W/I9v945Au
 rhQXaJyaYQ+Gs0j1zqQhTkZ2Er8mMrImpN5hifwA1uX9lR48ygxpdbvqfOEf6wF/4jPQMJjwfCe
 awpIEb0VHWiR2UzO4VCoWHc3oKVnTLD9PqW+rjnhwtrO6QuEMG94rSBZx3GbuQKrTJf6nIR6i0T
 J8BtDEoNrVbdwLiLPusuOLOEIuLWv5TahYpbwp67yiBmuIESkJNi6k7Px3M2CSwYRYGcirnFbOh
 XhyXY2df4b5GnfsztPwlGm7Y35cUqvbyTfJXCLEO6uaWhiljJVY1Fv1QMsGIoUUELsn2pjqOl7V
 jhv/BfaixIbinh2GWAf2A9tPH6jrkK+Uuw2LOgEwfsphgwX/97IB1XEkJ1lkRYMTStOrKavA3Ai
 Zmfza3IYwRAg9zU5qEGsR8N6Fs2adF2kb3qqkBXo2nhkF1vHpvAwgAWujIpuTDs5VKN0OZnea2/
 20WGNu5L5WTeAy+wxVQ==
X-Authority-Analysis: v=2.4 cv=cpkOAF4i c=1 sm=1 tr=0 ts=6b0994a9 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=Tt5JBQAfAAAA:8 a=R_l6ZAkWQ6Pq_YTnY14A:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=kpHMOrJS8sLNr5ru0mYA:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA1NyBTYWx0ZWRfX/eaaRoBUq/dI
 UPBuTNigR26/NdY368JBesB55FgQqXppAoLurpsJ1L8fTkQ8vdm3wiSXMvJWpI4tIK5VN8E5vAj
 C/KHNHBN8GPnujbTNC77N/ak1wBRYTg=
X-Proofpoint-GUID: 08wKOjfy0KmkHqwbu0FA8Mtgqc1BGGqe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 priorityscore=1501 spamscore=0 phishscore=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270057

On 11/9/26 2:55 PM, Demeter Barna via B4 Relay wrote:
> From: Demeter Barna <me@fromdisposition.org>
> 
> Describe the UFS inline crypto engine at 0x1d88000 and hand it to the
> UFS host controller with qcom,ice. The region covers the engine and its
> hardware key manager (0x8000 + 0x9000), as in Qualcomm's SM8350 device
> tree; it is clocked by the UFS ICE core and AHB clocks and powered by
> the UFS PHY GDSC, as on SM8450. Without it the UFS driver logs
> "Disabling inline encryption support" and fscrypt has no hardware path.
> 
> Signed-off-by: Demeter Barna <me@fromdisposition.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8350.dtsi | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
> index 55b32050c..2b258c4b4 100644
> --- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
> @@ -1782,6 +1782,8 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
>  				<0 0>,
>  				<0 0>,
>  				<0 0>;
> +			qcom,ice = <&ice>;
> +
>  			status = "disabled";
>  		};
>  
> @@ -1807,6 +1809,17 @@ ufs_mem_phy: phy@1d87000 {
>  			status = "disabled";
>  		};
>  
> +		ice: crypto@1d88000 {
> +			compatible = "qcom,sm8350-inline-crypto-engine",
> +				     "qcom,inline-crypto-engine";
> +			reg = <0 0x01d88000 0 0x11000>;

sz=0x18_000, please

Konrad
