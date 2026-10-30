Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793364711;
	b=wpUPIEAEhcsiVqpS5MnlqcINrpR590wnlhXrY+Hnx4+uKxN9TKLQx7f1837ca1Edj6gi
	 46xU5y8K+gBvz2FpmPlCN4uyHOWIXfiPviVBGQvZTPg7zqjzy6XXDcSCLDoR0Rs3iLQdp
	 veFS2+8sdFlqnqRCDwHxH2T6tWR3E9Fs9c2dkIT5Hg8+v/axPW+bwm3dsohrNixEQ17We
	 ZJtKyRVs2wZJLbl9B2FkquLLn08gP8Q5WgXZCAUGeEKZBWTZwfll86B/URovzo6011k4T
	 bleX5CfzdR1psy6VoESy57M/uBohyPfWKaXeiqe/C1N1swu2wPqYU2BHwCoHii+y/pQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793364711;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=D0EDMrN3qvcGMCxD8B6G5UF0I5Wmci6lKmkeZTbIbxQ=;
	b=jhLYaKTPFhlttKZqymHF7UnTMiEPI3V3cHCHOSsy8c5xmLA7iACB+/G5w8nHgubUCcK6
	 OOMYkUCZO7078QUVWkn5Kmy5ySV4uMJQ3yfwgs9BGL6IBXX+0tUcH6f8WrpdFZ4sRMu9a
	 Muf1po7r1zppDOGcthapk6jgzQXyDx9WRJlhVPfacd9q4WyZsD2ef0pCmsEDU6IECEiHM
	 uN8nC0MX+j/PmjX8d77gGoluoWuTP1RelKX+Hj4cEnt7NSUsizjFosAmYmSu4x80lm9sU
	 ilA0snj+mlK/02jKJXsu1TrJbIAOJ6rQNyrTnK19Zd66sc3/xTKh/z6Vf+aN1jgK/zA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Blypgrft;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="cke04Sh/";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B909606A31C
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 12:51:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B909606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Blypgrft;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cke04Sh/
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UBGWqk3679080
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 12:51:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D0EDMrN3qvcGMCxD8B6G5UF0I5Wmci6lKmkeZTbIbxQ=; b=Blypgrft/wyyMJSq
	mYY375W75c1+9WXq1BojubqxmfWXwPIf3SR4gHD/uaL4/xp/MXz+lnekH3dUu3f2
	QUk6CGan9obk+Ym1fNLrY/SUlajSzJ08omubYyIhKk+m0UkQTDB/zuFkxaYnCLL5
	PqV+OzdYYMVIaYIpWFx3VEISRxMwdMagcVooY+JAb2xA/AgCE7ckL4JY89SxKuAU
	eMwM7AFzX8vcIjOmpfQ1bcTV3eAboUZ/YG8shW/R6OgQgVHs1cIQns0t9Xyj+Vzm
	eOVhi5BvHQjUZLsgC2j9u8oYePm8hXL7jJLvdaN7mu6tr2+CkaaCPU9yE8Dg0K7X
	OvUPvw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qk3dd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 12:51:49 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-944102381acso14955085a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 05:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793364709; x=1793969509; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D0EDMrN3qvcGMCxD8B6G5UF0I5Wmci6lKmkeZTbIbxQ=;
        b=cke04Sh/EDrAj1++jkj6IXelNAT3Z/h/Mw//P5fHf2ZJR1WDQ9RNtMFl/2F82a1ZYD
         ZXxfugK5a9R10lMdb1QZmtNvXFy1bSztjQtSsS9AsBOo2Ei5X0lyDkVPr3cNIB2N3Ucz
         76f94O1PV0XKc0VTEBu50tHdIpHCsaOwKwEZYvT/IXbmvySbUSrmysW9SqGGqgIT9wjM
         5bWCiqdo6qyyuvNsZr9PubSb5KIuytUTmglJ6t5QF4sr6Z4FHesnKiYTkC8KZrEneXXU
         6neGciSz4Ddv6jkNEHr28a4j129/RuWbjUlCuT1fBIktq2gZyprT51NPZS0y1Uu86uKN
         2czA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793364709; x=1793969509;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D0EDMrN3qvcGMCxD8B6G5UF0I5Wmci6lKmkeZTbIbxQ=;
        b=AlITM5fpPNBXpbHk4z9HHQ9ZQzxaQeEpFmZ6ckBkXnqTwUhvIjrplPqDQE66n8Ht/E
         PWT18J9xdTo7L5kam8/udOk43c0P15cusv8kLtrlkP4PjL4V9pXQyGJrBunDi4wnmxzd
         L9AfHkrEFIWxPZfL4jJXu0AfM+tjbRePfd+RJYSf16BnJ1abQANjhDI9e7pP/uzaIQp/
         fJtjzXuVxhv8deZoRQytmLE5iqrGWj9aCBhE9TSEf9leVb3oKMpICUiPp7pubyS9Vd/r
         PdtYZJiiLc5SOKSprN6i9wG11goUfDjyt9OTGFavsFAx0oMQc7beyXy/yz9uJIg0gmOE
         7kdg==
X-Gm-Message-State: AFq9FYIEhJ4ao6f9bYbXwvFQkfGlVv4UDYlXYd7cJFeBg0R9J8mA/CIS
	PVyZkxxNH9bON7W4J3VC3Kt1t6x5unaZelLBwgzP617jJNxMWQAPGxZuwqt3KfMeMbbJyn+MCTq
	zQFyUR693Bvi9V4ItOiBNIcqfTSgbPSpn+7EH0cIyIAwP4sFfBYPtXoJkYOHU4HJwpwgP
X-Gm-Gg: AYBFou1blRc2HhMCzYPkNPHn83PeDwnADX/B62m73H8QXLDVcz2EzyZZoQHhzQDcx08
	ZjdvoL67KdyJvBoy/8aFC8XaS8eUT/a90u+ixASQjv2SSMwVjKonjdSjmWW3Z9V9dTBwCsWv1HA
	weGuPTd3MgrNueoubOrKQYDc0KoVp7QIud8nMD8e94/1XOYqiybwIpgfPq5WX8nFO3cOmbVTivY
	JuF0kOqLTusQbKtiNM7lNnjrnMoImq7fGiEoJSsbn0MAkOXaGnbBSx2BayHkWVt50Z11W7NXZY2
	wV88ZKK5d4HKOOKRHfoDIuW0aQ18NEoVpmdDdFkalviNDbf6XjHGLj7dJpILKHakIfs3uCoSYqE
	l9qGwkbUi/+m2v4Vv2y9R3vh9H5dHI9oQvxe9Hflg1gZ8Xke2md6yrGflgkk4nTu8us8LQFA=
X-Received: by 2002:a05:620a:a0dc:10b0:93f:43a4:a48f with SMTP id af79cd13be357-944217268c1mr334118485a.5.1793364708781;
        Fri, 30 Oct 2026 05:51:48 -0700 (PDT)
X-Received: by 2002:a05:620a:a0dc:10b0:93f:43a4:a48f with SMTP id af79cd13be357-944217268c1mr334113685a.5.1793364708087;
        Fri, 30 Oct 2026 05:51:48 -0700 (PDT)
Received: from [10.169.205.110] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabcfdb92sm62678466b.13.2026.10.30.05.51.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 05:51:47 -0700 (PDT)
Message-ID: <f0a6aff5-1293-4d18-8c8b-52f06a4050f5@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 13:51:45 +0100
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
Subject: Re: [PATCH 4/5] arm64: dts: qcom: milos-nothing-asteroids: Enable IPA
To: Alexander Koskovich <akoskovich@pm.me>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261029-asteroids-dts-updates-v1-0-79351337d681@pm.me>
 <20261029-asteroids-dts-updates-v1-4-79351337d681@pm.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261029-asteroids-dts-updates-v1-4-79351337d681@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA1MSBTYWx0ZWRfXyHQuarQn+Dze
 5onXWMuRfA3XsqrkeI67v+QIDQN/HEDjLYXA4lSbYYUDxyXaGbnH4Fb39ZyW0+QoznG8BXlFl4E
 JNhId38VrhJkhjUzkj2LaIQsLYRlPEweIVDmK1CG98mfdNHxxvdZGRh0J6Hy1y6NtWYz2VLva40
 7T+GTQ8O+wLEPITJTLWgHcmLlhxdxg7oqG8sm7Tj0U1qZQoPoROMknLVDVqsM5SLA2cWkjVzOnq
 jEASPAvzdSEtp37gpaS1w1KeW4b+2hsJwSFMaAFivapoOnSB0V8OrhCD/kOWMUAg7STdwumRD8t
 T/Sr0KKfHoSxrlCy3rBtoI0OhdKOAHjWqEmFQ+4t+tWs5eX3swA5i5tLqVl306uDgfSiaEtl9Lz
 9ohAYCCAaXyhDQcLg+L4tROvBieefGdWEQzyXT0J5knlU4LVSulmpKcIkBkGdDY/XuXMCB3hqpk
 VDt8+CUmfojRYhL3DFg==
X-Proofpoint-ORIG-GUID: j6u1RR5vbd1gfnUF9cUIv23_6HeO8Mpa
X-Authority-Analysis: v=2.4 cv=IeoSymqa c=1 sm=1 tr=0 ts=6ae492e5 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=2vvDfV54RvwmZ0zWTFIA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA1MSBTYWx0ZWRfX6CbUiattPNBa
 zkbAtzZy2KkhLCja0YN6ZXdPaRIXuZeapQhsv1btekPsakKuHaHRW/91Uacw03YMbc2fEYPydlJ
 6h8dxvdRKgYnH7sDSh4paQP7o53N1g4=
X-Proofpoint-GUID: j6u1RR5vbd1gfnUF9cUIv23_6HeO8Mpa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300051

On 10/29/26 11:33 PM, Alexander Koskovich wrote:
> Configure and enable the node for IPA which enables mobile data on this
> device.
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---
>  arch/arm64/boot/dts/qcom/milos-nothing-asteroids.dts | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/milos-nothing-asteroids.dts b/arch/arm64/boot/dts/qcom/milos-nothing-asteroids.dts
> index 7d8afe8e95d5..af115295a20d 100644
> --- a/arch/arm64/boot/dts/qcom/milos-nothing-asteroids.dts
> +++ b/arch/arm64/boot/dts/qcom/milos-nothing-asteroids.dts
> @@ -880,6 +880,15 @@ fsa4480_sbu_mux: endpoint {
>  	};
>  };
>  
> +&ipa {
> +	firmware-name = "qcom/milos/nothing/asteroids/ipa_fws.mbn";
> +	memory-region = <&ipa_fw_mem>;
> +
> +	qcom,gsi-loader = "self";
> +
> +	status = "okay";
> +};

Actually please move gsi-loader and memory region to the SoC DTSI

https://lore.kernel.org/linux-arm-msm/20260517-ipa-loader-v1-7-3c3764c1b4a3@oss.qualcomm.com/

Konrad
