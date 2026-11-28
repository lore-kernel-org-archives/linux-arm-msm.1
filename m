Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795833631;
	b=MnBbdzJPLTeYdj9IThq7cR61mw85jygklwN2Dxv+pQNvA1u4U2sg9QfU03aSiIWokxmG
	 Hk6E39JHqACw2W2mSzCmSZRe6BCjduOxe46xj1qTv7I0NDm7bEghbyvbM5aCEBkc3kZDF
	 i1aZMpM5Xh1ZuUFRzeiFtAYTemNG3dVHjjf7umPFBRz4xfCzI/cM1IIVgXRSvyGrbC9t3
	 wt3nwDxa2oJVeM9DgvdXnpRVoPGHN1mhPJuQkaaYS9uE4IS+2ZyT2NebJKT76mEwjvuaZ
	 GWiN3bD5HQS0/FkGvr/bIYpDGo3WcvG3Yu5EBZYUN/10VUg4O/lMANMK6PNBxpFteJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795833631;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=OKrmpmPowUf1ceqSdU7hRnQfhFnVYmAW5UXbIQRY378=;
	b=k06u3g+/qzKdPKzMPkc0dJyFdUi+U6bOb+1YiRrqcvcnqCUd63SwhpjgW1gothQWXIn6
	 0/HJwmnTy4E5hNQN/TIJLRcS2RgKVPKwxGj4eE0QaNxiqqKlHapyQ52e4g+kRLUCFqOLl
	 9+zbie+M/PqNaIODKCBCeh98sTpOzOWY24Q56ePeeS5ydhF9bFAMf+CUMKrbvOqPDlFIC
	 AIA7oxWmVoFt8LPzhpNSTrTkuATsl070cVexd2yPL95d0PkrdL2ea2oBNxixqEvG8aVYJ
	 pqsCXomuTjbWCMQ0wvOjf709tsmTZxi3M0k8TB78uGrtx0ajVZPvpVNTKHhz7CD0EdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LA6KK2XC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BpJ6KZ86;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA8AF606A321
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Nov 2026 02:40:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA8AF606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LA6KK2XC;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BpJ6KZ86
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AS0Fq2b3758029
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Nov 2026 02:40:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=OKrmpmPowUf1ceqSdU7hRnQf
	hFnVYmAW5UXbIQRY378=; b=LA6KK2XCtK3HsaOnH+u//YUIVHOBMYvU0bKl9hbg
	CfbfcgXrZJTsn7rYUkz+iOKIJngBq4dq28IM/oD1obRqBXYqGxZ+8FFJoNm/SFJ8
	WO8Qc2cK33XR7EwMlQBWUSXkAfvB75gICCkS5j9Ti7OJ9q/W7PSTq4d2wNnSI3Vn
	OX24R6lqqktqjc4cWnOKW3cHTJbBSlVWLMYCd9ZbO/N9ftZBySg/kjnhI6REFoJx
	38/uTF2dmCV6o4JTX2VBKZm1SME1KHTUymwjs8qjPjBIMJSPvqJyYn5+kjKC5Mph
	crNLqQG4XVhEHxpRT6DcaIsXDSIdhoo/15lNGVmdu4MI6Q==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j7hab8j80-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Nov 2026 02:40:29 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1b56c696405so13849540c88.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 18:40:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795833629; x=1796438429; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OKrmpmPowUf1ceqSdU7hRnQfhFnVYmAW5UXbIQRY378=;
        b=BpJ6KZ86SbjuD5XsV001NiGUxxdRIn+IYcBYgXNN1zrVWwwOM/mORjp4kL3B5RPHY8
         2uRSzrFrs6mD+TKE6FaZEVJwKGzSJF8vXu1+lwIWuwdSIugeQg++gW8rSNd6JCTVNkr5
         LWt3ui4LZgYhZSzmTiweP86CEgjp005gEiKFqt95qo1cPPgYVlAzNhzJbvDxJSRID37M
         0OWnf1W8Lzv+bPadi1zdswADIQlBh+SkTZcVCCwuwyu3A5nqI9qMp8LvMxkPQKyqrUuv
         AMl+V2bmJb2gIFgVkx6F7yf+ydfGElgVoGaRsHuIksHKWU2lH48oRyFaeDhH+C13QN/Y
         dxZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795833629; x=1796438429;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OKrmpmPowUf1ceqSdU7hRnQfhFnVYmAW5UXbIQRY378=;
        b=Bv8wu4+sGDeOlCyw7Vnpmwgdy4fiEQ9m7sPkBGVyoBEVvrX4G/QWS2ZuIyWFzPwFUp
         77qlREaGYgY0qBIHUjTYgiiRPxWmxzmmC9TXUD4EghNRZchrTlJqFVEuWuA8Vd6JYLBY
         KurKKZ+638bVKB3Adn1BNFW0VwpwRPj1vPOU4jGlKPuJyTRNAM73Coi7iakL/AA4ZPWF
         7FcI20ttn57EZ7l1jA3jRh3T1+w7RW38fnnRMNYdkEU9mWjXcfM0Azg748lN7P/UgR8m
         xMAnxYIfhYX3eDpLAbUgPNdFF+sOf/Po4NxOSP009grno9mB6kGsusTEgty26eFkJoL4
         8lLQ==
X-Forwarded-Encrypted: i=1; AL+hErGs2NZ5GnGXdOBOeCqk6M2IPnQbthLCNhNh+m6dkrm6pxEMvIJ9CNl3xZ7Np/37Xf3IFtJo+PPj70TrK8Ud@vger.kernel.org
X-Gm-Message-State: APuU4Z+Sn8zZXx5kSNnywvd0y9UyA4XXALYlJSuYbCaB3G3Aw29xQ22j
	EhpmHHOogacShSse4vqpRNlvB0IDPke+QdHL0qP3ZzjPdM/k25KtFHy7dVMlKqRN/MDPFIZZqb8
	dL/aWNrVcFLvV9yXfZhuMHhreI23LLgnpmUn6NSor3i3MJ4wSu+iYzJPIeyv10ziSMuyV
X-Gm-Gg: AZFdTZdnlCEvAhmAC3ncQY5MxukxEY06+rMA/+A2cpb0F0DxlbpkJOyTr1EKwUqY99G
	pNK6u8972QYNE/+tLhvkUJCSs/fySISCh6AgWq06VO2j5bEQ6fPEaBHkkkw+FigAbYO1OvOtS9e
	1CvfDmKG1vJaP5SF7brCv7uEE1G/JQdWe+XngsQV43uT5d10vkOPiHd1EgRE68PBsg9VKfsUXfB
	W5xSwtp9TX34J8MksWHd62UdjMFTbDANqM3grilq7RuaBfgmgtuyrd/f7EDIl73qA8Eol84TulX
	hPFfexzG6g9yv3TfyGejb5HYbHDteuqrhjxjwP4cOj0RWoYJmFirFxlXKDwugYcQW7/rwqFdR19
	ffW8TJdvXLZvVHygn6k0OBKRc3yf9mRIbbSA7z+5b2pAPy3TfHewKIJHKH4Kx9bKJlhHwou/B8I
	rrMUCFPa0lqQHdgRad
X-Received: by 2002:a05:7022:e80e:b0:1b5:3b6e:e1ed with SMTP id a92af1059eb24-1b55690bcf3mr30517123c88.32.1795833628610;
        Fri, 27 Nov 2026 18:40:28 -0800 (PST)
X-Received: by 2002:a05:7022:e80e:b0:1b5:3b6e:e1ed with SMTP id a92af1059eb24-1b55690bcf3mr30517094c88.32.1795833628120;
        Fri, 27 Nov 2026 18:40:28 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55684c85fsm90769604c88.14.2026.11.27.18.40.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 18:40:27 -0800 (PST)
Date: Sat, 28 Nov 2026 10:40:22 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org,
        bartosz.golaszewski@oss.qualcomm.com, abelvesa@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Jie Zhang <jie.zhang@oss.qualcomm.com>
Subject: Re: [PATCH] arm64: dts: qcom: nord: widen SoC bus to 40 bits
Message-ID: <awo_Ft6GikSaURLB@QCOM-aGQu4IUr3Y>
References: <20261127113326.2889944-1-zhangfei.gao@oss.qualcomm.com>
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
In-Reply-To: <20261127113326.2889944-1-zhangfei.gao@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=fs9J914f c=1 sm=1 tr=0 ts=6b0a3f1d cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=ko5I1cYZbepkLF5qciYA:9 a=CjuIK1q_8ugA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI4MDAxMCBTYWx0ZWRfX2KGio9+pflfg
 KGftWfMAEQVSo+39QHiqTukFs9tf96lu3dMgzH3KA2D3jr74wdGqsYdi5lK8GrVtEvWlGBe/tvC
 r/i1A9/DG181p8HKLSUwf2S6AxN+Du0=
X-Proofpoint-GUID: WiMS44gOfbnveumx5Ek-VaQ3Os1xXz-X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI4MDAxMCBTYWx0ZWRfXzXNjQ6p6+rhg
 CsdK7y3A4C2CXlMNgrlBchq45ytzrljDh3vEd9uS1gW1qmHynGS39CBAvWSclpx4KfYnRY/cMGT
 sLPvrvXxwtTeUbubsm77PQpT5z0VKb2IxAblwkGohIVpi/uG+MINT11YTNzU2n/x+bZTbNla2VB
 pdxgJYYunpMNilQv5V5lWfiwo3gOCW+7OSnruzI76souB5AOB9fHsNkO/SXnh125eivX6O9ZJfF
 Cc0A8PiyjqLhxHmS2DLaeu+tr2BsuPFIlts8Yfn+uhVjHVtoJh+avH1U/AXiQmxgMEjwb0ZDCX+
 K1KrJmP+03YW2CGO2OAvn7OmPiQdpJxBTsBDhoOHLx9XkSGu0iSnL3AfFmZ5OZV/WxF2UG6pDkx
 v+xgkJ3UQvS9roCTPqbyCrpmWpveMVvX0Xeb87pD8elrXyyiE6sodnpJF2BVuMWqrKVqNDlfWbS
 8ifDhm9z+EgnHfDt3yw==
X-Proofpoint-ORIG-GUID: WiMS44gOfbnveumx5Ek-VaQ3Os1xXz-X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-28_01,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 suspectscore=0 spamscore=0 clxscore=1015
 phishscore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611280010

On Fri, Nov 27, 2026 at 07:33:26PM +0800, Zhangfei Gao wrote:
> Nord exposes System RAM in the upper DDR window starting at
> 0x8800000000, beyond the current 36-bit bus range. DMA mappings for
> pages in this window are therefore treated as unreachable and may fall
> back to SWIOTLB.
> 
> Widen ranges and dma-ranges to 40 bits so capable devices can address
> the complete DDR map. Devices with narrower address limits must
> constrain their DMA masks individually.
> 
> Fixes: 5e97460df08d ("arm64: dts: qcom: Add device tree for Nord SoC series")
> Signed-off-by: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
> Signed-off-by: Jie Zhang <jie.zhang@oss.qualcomm.com>

Hi Zhangfei,

As you are the author, I would expect this:

Fixes: 5e97460df08d ("arm64: dts: qcom: Add device tree for Nord SoC series")
Co-developed-by: Jie Zhang <jie.zhang@oss.qualcomm.com>
Signed-off-by: Jie Zhang <jie.zhang@oss.qualcomm.com>
Signed-off-by: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>

Shawn

> ---
>  arch/arm64/boot/dts/qcom/nord.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/nord.dtsi b/arch/arm64/boot/dts/qcom/nord.dtsi
> index fdbe290350ddd..45cdbba0e4fb9 100644
> --- a/arch/arm64/boot/dts/qcom/nord.dtsi
> +++ b/arch/arm64/boot/dts/qcom/nord.dtsi
> @@ -911,8 +911,8 @@ soc: soc@0 {
>  		compatible = "simple-bus";
>  		#address-cells = <2>;
>  		#size-cells = <2>;
> -		dma-ranges = <0 0 0 0 0x10 0>;
> -		ranges = <0 0 0 0 0x10 0>;
> +		dma-ranges = <0 0 0 0 0x100 0>;
> +		ranges = <0 0 0 0 0x100 0>;
>  
>  		qupv3_2: geniqup@8c0000 {
>  			compatible = "qcom,geni-se-qup";
> -- 
> 2.43.0
> 
