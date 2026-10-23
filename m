Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792758743;
	b=4zJD2u+Rlpp4Mb7egDCOlnPd7q6pSupOSUUHu85SndUbdxw+K5PNMwKLvaqPQFy1nbxR
	 7cMBIpagtGVIKeIow4EpLZY7xJvM/CBx2hg+26dUUsjXit5CRjFCSIQ1Pdwt5BX0wnQrA
	 MSY2HkbyyUn2SlxKVg0iUUt7kU6IPOBu43/cAopX1l1Wd+P62Qt+raFCuDWv7d7+BauEW
	 x8GgbQlfxScDxhrdaQRXZIAJBhbUTBru6Kp6+7+A8FCMpDqOnePgRIzdITZCU3LPtNleU
	 V67JYFUgI1z1S5F3ZI97k7C9exxSP3By57XBDElzgSatqRyv6OTHTKBZ8qj75YKHw1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792758743;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=MJtIEZRHfL2+tKH4qspJ2nYCVYpqSi8PgJO1PWzFn14=;
	b=pSRf6s3K/u2nOjil6nuD+4NlS5Q4aU81RR6wXGd+dc1OmPYTCsUfQim5+4vxosXkFECi
	 PA2xr4GGk5RJp+mxu+exYO/3h0LT+lFQKYU8NIlqeJMD2+9jlVKhQPV7mB26nBhhDO5S+
	 +nm5r1YxAIDXFEo7t8QuYqkPZYpSW1TKkYY5tcDTCqmJCus1BFvVVRdz0QxVCK4pD4sgD
	 wgXplBUf86bbwwektfIhojgilQ14ZKrH/7V5OF/YB1olJnMOj9WIolfGwHqGB0I3CRHBL
	 9talwEzcZsE3fa1vOKltpt4pcAoB8kTAcuOgeMwo5ubq+Kjy/f/5/DcixU7YynS3zgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mbJDyKUM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UxIPaKvA;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18A97606A31F
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 12:32:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18A97606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mbJDyKUM;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UxIPaKvA
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NAAUDb1948370
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 12:32:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MJtIEZRHfL2+tKH4qspJ2nYCVYpqSi8PgJO1PWzFn14=; b=mbJDyKUMbsKBTfpd
	VF8oUL6B3cbqcpONko5rLSZwiSypf+0PUBrTO4nFXhk33eYHiLHJf91mAN5NGP9/
	GaK6wo6T2ZYGK2XZR3r48ri9/cIHnqCcCspymTQJ5S8LEzxxkyNCm/1kcyRLO4tk
	2MKFiABwUAcj37rK5cP3+Z3TFPNw0SVlkJE7IQusX3/AhjlfZkOf5GfRz8lLNF9P
	8MjQPBINN0TchVngglUI4Yew4p10ig5GU1ysk/TuPqvF/JvIB/4vRh4syoDGiqis
	i/ux/RWC6TTU0N9FDlSxbRiVUnrvs2dlBw34F/DA3pO2zyRDkCULRUxuIj49pv9q
	f3iRMg==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmtunpc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 12:32:21 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-988c723394dso17645241.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 05:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792758740; x=1793363540; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MJtIEZRHfL2+tKH4qspJ2nYCVYpqSi8PgJO1PWzFn14=;
        b=UxIPaKvAEPb/sMLdf8Tq6WKEQIdqsrsNT0os5hPL4o9/aFNMl7FtuAlRey7fuenRsl
         +zaAN3Z6se16fIuAtkjm0n0noNXLsgKfC0mLTXyt+FH9Ylf+ysqGteh7jl4G08DdE7EP
         2v3GdwCSsHWorfysTDscin6EcG4Rj4rJKDleYQxgjNo2gEC+VEeJCGg5Ouahq8JexvkW
         dETKCHXL2f7pyAQ1gUqxVGUbaj+07EOWU+nHtcL35owaptkvifYX/mpNYwH3EUsc22gP
         e/6wd5VfSFiNURDK8RnWKLBTzQMYcg9356eB9vUhLDBGpyQiQ8WZElGGBGYr/Rsw9zON
         0p9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792758740; x=1793363540;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MJtIEZRHfL2+tKH4qspJ2nYCVYpqSi8PgJO1PWzFn14=;
        b=Vu/7467cTzXbln7wZ7bfOZEwP7wPriimU9Bz4SF1tZEYof0tTmZoVcZe15zsfEhpD2
         RVQ2R/TyXuY2G4o8xAvApd8n94wiwWV/4VqWzOBGbnGQdczF+zXwRT89MC8KJm+QqU91
         n2zhhJWZzEBZo20tFO0imkAuC2TFnkzY57/RZ0ZRXwSw2UCqZNAZdeoyURWMEfwMs97Z
         eVadgcMDke8sjK0VB9mYz9gIJScQHdnAgcn2bdDxYkVsb+sWADNuu7Gm/dXevFjhjJrf
         jtBhLh6BBF1C58cpqUylC2P0yXm31qsyxmpNw8ESaW7c720IKmQ109U1kxSsqWC2kz6I
         /R9Q==
X-Gm-Message-State: AFq9FYLXOgGYcwvbzTnljMhk9AfmRIWa/fhQYcQw28eDBAPpoO3rQI9P
	pwVVki8SBswPbISHyikstpRNCqDSVxtIyRlKfIAfdDg7571xMy9DWY31e4DFZBN+MZrk/KHkSE3
	lTdXI+3trHsOS4qvoy5xFWawd90HB//CKW7JZwSnZE11rRQk+uARjGNz7V4rLUglPMAf2C1K1Es
	X5
X-Gm-Gg: AYBFou01IWq0bxj6lqA5mzfgxnphDhOLPY7Y0q3RXx/40SRnSedfOVWFdrDD2aMUVew
	MsQ+oc9Weqi3egSCUYZQVhYZBgObjg+i86r4IcgsMgDQPgERXbuDyml6eCKsLoobV6UkkMi5hCB
	WMfleXc4253DgOb1uqDsZ04yXyPBK/76wnSWE8IUPFBImm5Int2bWXI/bPItczUZsQ+LUbScwuu
	80mu9dIvOxr5xVk85vXQXqAtXwO0lCSZy9oNXBYIbwEqbQP9IQBB/6kTwKbLAgoGvLUsvfH0bWE
	Wd05XPTkW2Z7/Key96bBxgyI7OpkaSwKuocfBP7E8fR04c/Beu5sPtBn4TalTnzZW1hH7Aj2vvg
	KkmshW+82bLyaoySMt/3aDg==
X-Received: by 2002:a05:6102:8515:20b0:7cc:174b:f7b7 with SMTP id ada2fe7eead31-7ccc2d8f97emr775031137.0.1792758740396;
        Fri, 23 Oct 2026 05:32:20 -0700 (PDT)
X-Received: by 2002:a05:6102:8515:20b0:7cc:174b:f7b7 with SMTP id ada2fe7eead31-7ccc2d8f97emr774968137.0.1792758739637;
        Fri, 23 Oct 2026 05:32:19 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b432cc83d3sm993728a12.27.2026.10.23.05.32.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 05:32:18 -0700 (PDT)
Message-ID: <5114bca8-91bf-4db0-ae12-442d21ebad84@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 14:32:16 +0200
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
Subject: Re: [PATCH 3/3] arm64: dts: qcom: lemans-sa8255p: add ethernet nodes
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <20261023-sa8255p-emac-dts-v1-0-a34d778ce9ac@oss.qualcomm.com>
 <20261023-sa8255p-emac-dts-v1-3-a34d778ce9ac@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261023-sa8255p-emac-dts-v1-3-a34d778ce9ac@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Gt3XaU1C c=1 sm=1 tr=0 ts=6adb53d5 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=TV7SFOc1Y2i57lEA1eIA:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-GUID: GnWr46zO-J4WgUpvdQuvaQf4A69_-2xn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA0OCBTYWx0ZWRfXyu3beQHPE8YD
 X6SNm85wzX8mNb/5GbPAUTykHqzHE9rNS2beIr55QQ0f8FSsxlythnsQdpSbW/JuUo8ejU1i24r
 bSV7HE4JpIbzIePyEUPi0HSoU9/IB7l2VE2hj436jzJKZZ2ohsY5Y2qaaRzF1CHQVB139SsHxrX
 BooKSIXm9hGCofA/MAmjAGLy4fWKFK1EnAm2Rm34ItM9VkCjW1QNkxmH/hGqjSiACpJpMiby27w
 Xoqz+LDLq5BJStWjK+ZdsI/35fUH0AcLulb+KYmHoAE3MFbVBcI2gzikp4fodVvyMorUEeEYGj1
 j/BRlcKREdMuGZPvbMnrDtvRYuD1mfHgZq8drjxAVbts84zynZ1QjxAJrA0bpWa9VtmwWn0Falb
 8zyFlSFUAXGBHl/J9GN1cTP/02n8T3ikuWvY35Qj6oNPJ+G+er3hpXtgdIaE84ZR0vsw5v0v1lS
 YkTC2JSq8x0ACFRo+3A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA0OCBTYWx0ZWRfX5BUDYsFBhLCT
 DIxXtc7Vd4V5j+1v8UIyNxcRA82fy44SfZqRxrTcWI3v5euq6WOlPxjSj+qCtlGVc/7vHq2wtsZ
 unLfcAjraz3jZLZX6g2K+zguUq7jCOk=
X-Proofpoint-ORIG-GUID: GnWr46zO-J4WgUpvdQuvaQf4A69_-2xn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0 adultscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230048

On 10/23/26 11:02 AM, Bartosz Golaszewski wrote:
> Add the ethernet nodes along with their serdes PHY nodes for the gearvm
> variant of the lemans ride board. Enable scmi7 and scmi8 to serve the
> EMACs.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/lemans-gearvm.dtsi      |  28 +++
>  arch/arm64/boot/dts/qcom/lemans-sa8255p-ride.dts | 213 +++++++++++++++++++++++
>  2 files changed, 241 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/lemans-gearvm.dtsi b/arch/arm64/boot/dts/qcom/lemans-gearvm.dtsi
> index 4c155cbc79754af632848cd55b738e3ef0511cb5..c64cfd279af458e24fb48083ae549c96cfc07485 100644
> --- a/arch/arm64/boot/dts/qcom/lemans-gearvm.dtsi
> +++ b/arch/arm64/boot/dts/qcom/lemans-gearvm.dtsi
> @@ -58,6 +58,14 @@ &cpufreq_hw {
>  	clock-names = "xo", "alternate";
>  };
>  
> +&ethernet1 {
> +	compatible = "qcom,sa8255p-ethqos";
> +};
> +
> +&ethernet0 {
> +	compatible = "qcom,sa8255p-ethqos";
> +};

'0' < '1'


> +
>  &firmware {
>  	scm {
>  		memory-region = <&tz_ffi_mem>;
> @@ -3226,6 +3234,26 @@ cma: linux,cma {
>  	};
>  };
>  
> +&soc {
> +	serdes0: phy@8901000 {
> +		compatible = "qcom,sa8255p-dwmac-sgmii-phy";

Hmm.. I was hoping Shawn's DT reshuffling would land first

Are the PHYs hardwired? If so, you can move the phys= reference
here

Konrad


