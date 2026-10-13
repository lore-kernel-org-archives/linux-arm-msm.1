Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EE8331353C
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 12:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791895619; cv=none; b=mxI3BG7qHbmUGCLjh9GsEv0kncbUVqeVVMjMJtgBlAuwQVYjyGosg9e8djec+jtzOYm3dp0g8R3OQNn1vfmeCMJRoXOCQJCl04JLOwIdUPMr2ljtfKsH+ZYgKZAfJKsm6NTR9y+vj+C3XMGQvcFjPZGoPspLzAApcNlRRRZvZ38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791895619; c=relaxed/simple;
	bh=2/N65LdBK3aWBuEUGJaENLU/Tj7MhD3XAL/9iOeMu/E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TCj4QaHcUfPR/nB3bOI61sHQkMEteWO2w5SitkmZTESwEhGUwUj9gXA+bxA/EepDjnlGWOYLtcSvIWWtabFrT0gNqXvjrD6/pPubT04Ety0TGl9uyyAvEnGM2cIOsy2swOWqdCRWbfCTZy+ThwZGz3NZggZo635+HcD3B5ePwqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OyMydtNg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JGq5W5tT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OyMydtNg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JGq5W5tT"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69DBRIj0949467
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 12:46:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Aakzja3lws1Q1iJFHWUz/m3vsX5LMpE1mhwH5LO332Q=; b=OyMydtNg6QsUgyw8
	7d4qSpd8Uz62RhksyfnB7oIC/MZZAVWd4Kc362dRz4XG/x8znkECVA3n72odQOfq
	IHw3NHOT6GKTzZvpgVXGDMxMZfns6nrW9SCxGqGk/3Rbh7z4dm2zaACp1wxnAo5P
	5KpBX2uc6+e3BMgYMTxAgRYBZOfKFFJnlydOVOrPXcx5yXIQbI3aWT4o8AjAHOzn
	vKg7yAjfvHoMlrXGpyzfSWMSR/LFIEjsLQ1H2g3iS0S5OshyMSBdZxe2dHt4QZfh
	3Er6NfErh4lZSUuBaYeo99knZWwA0ey7dTum1Ncv1yTlK7aUUXPESPiQt0KQ30f1
	HRgGVg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9f629mb7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 12:46:57 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cc50fb0d2so51285285a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 05:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791895617; x=1792500417; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Aakzja3lws1Q1iJFHWUz/m3vsX5LMpE1mhwH5LO332Q=;
        b=JGq5W5tTDJ23Q+ckGAliAqLSHfo9WObuR7Qj93jBmiNxy4jjKaZElx6ivcA6kWM/H+
         7Yodozrl5RldDQJ2g3+5uyftltNRqUF7dBiMYYWVmXL5XNpsKeHe8afAQOVBoVTCl6UN
         jQkpiJrDAYVDRgDX+axGO5EHLLdpz098YeePH+2UhfYKzF4LBhcJlSbrtHF5rBHT7WR0
         sOVVpcXcO3gL064o62s3onpjVwjdwatFV4mcNQbbsr6nD72qD5Ep8qWlz8/TvNMo+bEF
         bKKjvU7/zw1OXiasExSkWJnUAFS3d69PF8SgOCQaSYX1ZQGC8G8BwrDWP5p2uIRH4Mx6
         JaKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791895617; x=1792500417;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Aakzja3lws1Q1iJFHWUz/m3vsX5LMpE1mhwH5LO332Q=;
        b=ceMSwInNbRVCbNuQHZySDy+v9SUKhroScxa4ZXdZKEUZD4PrF9gTEk//tGyCmp1AFc
         a4GSWAkrhOLlHf45NXkfA2WGi5agb7OiD8NEjzZPZq03qzDWsW1U8w+RZgtfxU0Q2j3b
         UFobjebL9aNIWIGUELaMhSfbz9GseP69CzvQS8qAGBcTWpX/9a6zR3krG97geccHf4km
         oT2pX3jWZk53vi1ZJQ08fhbuRurQx7EAC+91qPzDaS96Ehu1Qzl4RhKNK5sWOnbOZwUO
         DmZMPAaq+/N728DyE/ugrK3zL3TJ5p8JvHpWuEMTH51aZg2/IMjvHF0vDFmdnlztSpUG
         fOtA==
X-Gm-Message-State: AFq9FYJzv/OM7lKH8SjPPV6RT4HsnPw/QTUzxCAXDxtaZq2e9r1cgiJ1
	l0lsGrfasbFOufNjcmy4mXAUMKKhrmtQ4Z4FqR0b7TkZKLj4ElntpQzj/C2e941tHO6TCkrUFmZ
	E2S8vajDrHraP40idtefM8mNoTDvAxfiaHKSTBLD/fbQHBOygaFcCXSKZtN9dp4uay0WI
X-Gm-Gg: AYBFou0wkvAXlmuZLCSUeeSND6MjTEHh/hPP8xKxL9sKoy5WS1pdmd9qwkYk+FxO3yq
	wAGJNuxao/y2rov+sV5dErenDn23R6iTeXk2u2VRz1p2ybux1pqcj2M4h7RLE07jCXirJBFNLIb
	pHPT9fd1XzSDNEx/o5Nohj0W3p1eLlKLi5tcq/X+UYGly+iiC6VDmBnKSAX+9ooaUkdhz5ogp/r
	AtwKGK36p8p6fzHo8DISdsCJFZxcabwg4ZzI4ATjKa8RJBr33g7WUOXb9VI+4JRyRVvpAiSdn0I
	WAB5EltL56SERE15cHI9YGwu3kW1glhYddrdtcJ8zBKmbs6sITV0zOikkHseC7hn7yqvBNN+7zP
	6O/C7l+hBRVJcvmAXEessug==
X-Received: by 2002:a05:620a:2b4e:b0:93e:6d87:4f69 with SMTP id af79cd13be357-93ebd1e4d57mr2219330885a.3.1791895616710;
        Tue, 13 Oct 2026 05:46:56 -0700 (PDT)
X-Received: by 2002:a05:620a:2b4e:b0:93e:6d87:4f69 with SMTP id af79cd13be357-93ebd1e4d57mr2219326385a.3.1791895616121;
        Tue, 13 Oct 2026 05:46:56 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a9c3caacb0sm38641251fa.20.2026.10.13.05.46.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 05:46:55 -0700 (PDT)
Message-ID: <7fccb993-8605-4eb6-afd5-94edef1d487d@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 14:46:53 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] arm64: dts: qcom: hamoa: Add CoreSight nodes for APSS
 debug block
To: Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260922-add-etm-devices-for-multiple-qcom-platforms-v1-0-c2a8c3225a2e@oss.qualcomm.com>
 <20260922-add-etm-devices-for-multiple-qcom-platforms-v1-1-c2a8c3225a2e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260922-add-etm-devices-for-multiple-qcom-platforms-v1-1-c2a8c3225a2e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=FOKOVOos c=1 sm=1 tr=0 ts=6ace2841 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=uzhSaxHqr0uYvXhH--oA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA1MCBTYWx0ZWRfX9ZZR5WDpuRt6
 WPxhCVr2CmCF9KQpbq9vP6NrgHC4XOWIOXGF69kMaHDYcrrnTxGnXiY3JWaegHQ4NAmERH6Rd/f
 V5oFTFogtBNzZBT4Er9GF+1YKdiiTAU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA1MCBTYWx0ZWRfX6wdwBm8OyDlU
 PEqfc7j/9M0FT0GYvX7E+AVzRb8oNm49ZbW0y7ZLt6mzNeM0YveRPJhZgt6Ba9a0brlskaBKYnf
 wSN5MfcqtZYpzUzCi7dbqa13kOZVwpMJVySbnBB/fjjPFavTfn+7GVxPoDVfFr8RU+7ZVuqil6w
 H98duPZ1Gfkj83rs06UAgj1yZkEBIhVViLEs5f0HjMZoViF+R0iKW6gj/HT7/cTx25ExJz8EDz2
 FgHQO1p5YkSSvz7MSbcAPXiwTPmh2U+8lp+84qdgDFwWUoyHQDzn2N9PSwK801PeYDbvP+/msFA
 ztb1UwTIIe9V6yaCMZI1WPA0mGvfjaKV/Re+e8nKZlK4gnVKjXDty/B2Sk1V5qMiPrjwtzd83R+
 4b3RS1DF/MnSuq8pFimHtNgapjh9ZvjP2YB31csqgBWv/2fdkXwnbKy4bzyfjbFYe8WZs7MEjj6
 0MMaJqxAlmgfTpFfYvg==
X-Proofpoint-GUID: 8tbTEFdOq4H147UGdLO4O0yj8bxNjeH9
X-Proofpoint-ORIG-GUID: 8tbTEFdOq4H147UGdLO4O0yj8bxNjeH9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130050

On 9/22/26 12:35 PM, Jie Gan wrote:
> The APSS debug block is built with CoreSight devices like ETM,
> replicator, funnel and TMC ETF. Add dt nodes for these devices to enable
> ETM trace.
> 
> The replicator, funnel and TMC ETF nodes in this block are physically
> powered by the CPU cluster power rail rather than by a dedicated always-on
> rail. Add a power-domains property referencing the corresponding
> cluster_pdN domain to each of these nodes, so their power state is
> tied to the CPU cluster domain and the runtime PM core can power the
> domain on before the devices are accessed and let it be powered off
> otherwise.
> 
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---

[...]

> +		funnel@12080000 {
> +			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
> +			reg = <0x0 0x12080000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			in-ports {

No need for power-domains here? (also same question for the other
platforms)

Konrad
