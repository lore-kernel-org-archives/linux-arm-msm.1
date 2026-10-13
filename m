Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CF2F3FC5C9
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 14:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791902622; cv=none; b=GcPuIMaKF4TrMNj2JkhugR/BLMWYYo/1/+546VXJriDSUHDiKzcVQ9NQtAJSK6z12ZZ3/GgsLzfdCfLBWA7enJIwa6Ex10L2mPF4CRJZK+GUtw8HtlBSGSygbHczFLI+M7iJ223mbUwQ9Fg7UndElJeaRRqlrn92HnRyAeKIQMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791902622; c=relaxed/simple;
	bh=hRee58Kt7S5y/UGwQRupQTcuC10MswKmClFHJFzTshw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TWiAswfi/JNyzOjUpQsTzfJowTTtshR0XGgjT4wfp4NuQZvXVlo6gjHwDYXDj8A96fgERk7X1TOqsqFR9NT3n01YNaCGHcYtimjXvAKvCAjsdrTrceqGiuwL0+9s+2UGGCHdVvntDWpbzWED6DVaTsh3MJh0AZCoUBSZDUDc+Fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NkmMHhqg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Sp72T/LC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NkmMHhqg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Sp72T/LC"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69DE4Q4G2571134
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 14:43:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XGrFsGdzOaW98t5aAcMeDng2+ODIxPogmmneM/3dCzg=; b=NkmMHhqgRbencrNw
	RJwnSiavZsDuBaUzcUXIqxcOFMR2Z0zTQsSmUVrUEBx/RT/HmlX5CcLI0YbI4W7+
	DlHA7scOvyPFOb94xonF+aEuCJc9338TJduxFC5VeQ3zPymQt8Ey+4QWJCVpoFtg
	8r1Uscj8L+jmk0uR+YesT+3g60g7bI0bZ8vBZJjqr2ev0BdkB6/uZM8WFu04SmM3
	oimIHGuXAegGfdYYbuSMOqBGlZYdYXM11eAimmOZNQdTpPGjmhvB2TlLTn/pKvDK
	MiHF32EH35fzMT/wnfoKS+3CXr/rRgd9Cy85KOgb9vreN65kR0HP1+ZXc1+FoCkn
	t940hA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h98hcbg43-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 14:43:40 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cc50fb0d2so54071385a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 07:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791902620; x=1792507420; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XGrFsGdzOaW98t5aAcMeDng2+ODIxPogmmneM/3dCzg=;
        b=Sp72T/LCMTI0OgALyLF/x9KP3PuJhqMfxPMHDf463bjSNXmyGuSZvaYQLVbtaudvmg
         ikBBxCEm8zcwKUVZOnkQf0V0HtrMBxZIXv0ygEvmUIDuJ1m7SmgQvwrlifA10Q0ewBOA
         HxItJ+GceZNu8rvaiIqx4luRvSuDyeTqeOk2DibP2lkbI+G+anv7kr9Gfb4uWCFlxVrd
         y/clb2F6Is0WBe88quaA9TKelPNruxkR09A11sDC+ctl12ds8mLpLUNIx8pWA8HIfDuX
         +HW2nEG2l2NvUORSjaD2edL14Z9Dbe4OLa4VxQZAHLmzCmB6vPnNo8cJN3CERUVQqtau
         d8bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791902620; x=1792507420;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XGrFsGdzOaW98t5aAcMeDng2+ODIxPogmmneM/3dCzg=;
        b=bVoVTn3M1g0ZqejvB86Qc6L3kyLLPASZMRl+N9KJXyd/7v2nOYn2ZUzLpGFW7vU70c
         FPAa2GN5fnWBVUMUaGJcxNdu92HNy70ZNv0wmpv8UU6E8cbRn2TI3rRC5SLqjiGq/sIa
         YP4TD9TJ1Ek08SrcZEZxmN6K3tge+4dRBf+7MzZaEfqSt752yRwFnSnQAFM3qlb9ycl6
         7tT1bPpLSqcoUMif5PFkSnhH+OtL4se7+HGMCHnW4eLS4EZ8Bl+4lHCsVAN4iMexDM+D
         s0nCrMulZR6ZsYQuChXUCa49OqHFMLcDvjdNM1u5/pUC0gkiRr0TOs+itYJk2vqhRlXB
         SUGg==
X-Gm-Message-State: AFq9FYL9wg/6JRSiJpo0plrA7OqBje8EiCjALXpP11o3LvZFJpb+VzIw
	FN1EkOz1GjtvuY86gnj8dhEB2peo3+FFBa5JlcF1jrDlM8zF7S/Te9aAqsZmtRCztIdBP+3e3tk
	LKce6uqIWR0CrczSaoTy6VjFbVKHD6VOnwesf3pcu7denpLEYjFAfeMmRaammAeZEUGZd
X-Gm-Gg: AYBFou2arYzbhfWHbALyPPBBFvyeoLtl2KmzEotaczDepqXatgZarE3SEzOSI/kstfE
	cH7zgMC7sJCjho70izulxwXaFfW42I14JimDzNDyPc/FFnjg0nMNPZVNsWiKQTX2ebAk3/oIxOU
	xKqR4gLb5dxwNNDkjmaFTtW6ZYCaalPru7ptx26Mn0mojaBMJRuQvLvhcka8+iiSd2ML04CEiZZ
	+TpvqDXMWUjWByiNVL3Elx3Qti2Q9BNTHIlw5Ec2vAPN5i0rU7xV6p4Z9BUIpZGy+eJG8+vFM3G
	WP7+OFxBAmbJIreOYeiCH2M0jhXZ1HtpgLVVVxeWtgIAvPxil6ndO/lqV4GA7EGLQFPqrTUbgEP
	6qzEG7kDPvi3h8/KuYoaorw==
X-Received: by 2002:a05:620a:269a:b0:93a:14c:329c with SMTP id af79cd13be357-93ebd0c2693mr2404963885a.1.1791902619720;
        Tue, 13 Oct 2026 07:43:39 -0700 (PDT)
X-Received: by 2002:a05:620a:269a:b0:93a:14c:329c with SMTP id af79cd13be357-93ebd0c2693mr2404959085a.1.1791902619270;
        Tue, 13 Oct 2026 07:43:39 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9ac9ecfsm620584966b.74.2026.10.13.07.43.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 07:43:38 -0700 (PDT)
Message-ID: <a7f04052-37d1-452c-8755-013e6e16414b@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 16:43:36 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 06/11] arm64: dts: qcom: ipq5210: Add ICE support to
 SDHCI
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261012-08-dts-v7-0-77bd3d68d850@oss.qualcomm.com>
 <20261012-08-dts-v7-6-77bd3d68d850@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261012-08-dts-v7-6-77bd3d68d850@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA1OCBTYWx0ZWRfX/GfIvKEa+ftQ
 54BKmTeugdG5+Y8e7yXXiapWeg/mkRoO3Se3mYFGRRgWFxhRfT9z0A/NWDrIjfaboxnL+4Ph4+v
 3VnRoIhHPITv2HnXAqKKw9W8jVwNZteJxU8Mjli5FyX7u64DYVggGm6wzw6vqVfDFM29FZtP2bM
 e2UZrvhH03LRbIrtjnw1CO9cq65A6zR+gOPYP67GmoO12Sj/FgNUha3xU2cgo0rHoshKE0p54h5
 WQufSqbfgi4bbsd4Psk1LU1LvvYOedj+t9y2qSVMmkLjbIZXnL6VF6c2uRDfnDYCfdqIrrOZD/N
 F9o0YaTxhqMWBykmOwP/pAGxbsZL5B5olXBBzqggYB/8Zf884Bcebe+oKqAAZnX6UuvWmd9KdIf
 ShXwU/7MNwc9Js6Vi+GV0vLv0p+f9a7R5qNA/fZ36VBEqRSGDZLcia6nYx2KLQs7jTRzI3dmUGX
 d4YJzG2n8//O4/nZMdQ==
X-Authority-Analysis: v=2.4 cv=VPVIDNPX c=1 sm=1 tr=0 ts=6ace439c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=lT5hrBjHAMB7_Zzis_wA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: 7j3JLAzSymDQcvMeeh_gS-PvPQBQWPjx
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA1OCBTYWx0ZWRfX1n7c7snaGo4j
 BiDFqPu8mwBKbo0JnRRuqLCB16XSbImjY33cSA851xIJbtfJ/6/Uwhv8jBCplrd2zmbmbfvhIv5
 0DD1nJoSE2ZqtVPRVsQGb+/9lUQIIRU=
X-Proofpoint-GUID: 7j3JLAzSymDQcvMeeh_gS-PvPQBQWPjx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130058

On 10/12/26 9:23 AM, Varadarajan Narayanan wrote:
> Describe the SDHCI ICE register region and clock, and enable CQE support
> for the IPQ5210 SDHCI controller.
> 
> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/ipq5210.dtsi | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
> index d28d68a10958..c14b42c22616 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
> @@ -416,9 +416,11 @@ uart1: serial@1a84000 {
>  		sdhc: mmc@7804000 {
>  			compatible = "qcom,ipq5210-sdhci", "qcom,sdhci-msm-v5";
>  			reg = <0x0 0x07804000 0x0 0x1000>,
> -			      <0x0 0x07805000 0x0 0x1000>;
> +			      <0x0 0x07805000 0x0 0x1000>,
> +			      <0x0 0x07808000 0x0 0x2000>;
>  			reg-names = "hc",
> -				    "cqhci";
> +				    "cqhci",
> +				    "ice";

This should be a separate node, like on other SoCs to allow things
like frequency scaling

Konrad
