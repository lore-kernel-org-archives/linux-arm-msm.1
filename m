Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794214869;
	b=SfjETmpH7GG5T52QE5LzVN+blaHBqDpyN4DYFNghSmzQ+eTCvCHUPGFhFUrgnToQ8/3U
	 C2hOh0X/NaLE7CQo0letviyCg1xju3f7XAG96PaaSSR+nGZ524gHRANGS+mOFDXIwCWfR
	 BoR2bf9x87+4wUGRR6G60XfGoPZ9BfjtfDjTP8+zl1WtL8rJQy8qilJ14LVFxNkfGgYMY
	 zQkiOQsIRh+rt15ph2tm+NtdtSDAeLrl59ojI1W+UZCJOugVCoYvgEyGm7iJSpLgRE815
	 57UgzV6Mt5lHXsQEayNJZX5su1mxVjX/0zlduqIljZPBSmnYQkny/YF674U+arhnJ0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794214869;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=jg4upLHUrM6H1fsgp5Xb2gkT8KIhNg+n3t7qrZRLzsU=;
	b=i7jdX24Qtpt90XraoaWGvDuOaH8tprA5pxXawnuy1n/DDhEI/ya3PkBvMnft+/MZVMFm
	 MBlMwNE6DvzdoZ/pZUlS0kGgaKmu+ZjhfqS0b6QeR5yei7NIaLevlVb0SDKcWaLVUWrPn
	 Wl9XGnxc0ZZn9yV+fzrlP39sNV6VeFucZgsrbElItvs9km5WBUuERFHjhnh3mhaSGSnEX
	 2683Ty6/AroE/SkJE2RKrSDmgNmySWrKJ+Gpi1cI+9OI07EheQp1CdMW5t/YO3pB3KgD4
	 wlQOyu1hhOIrcp70ikc7ZfTxucMuYQ1x8t849SvZ8ap+BVRfmyEeDDX0kCmDqHJ6DAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CwF7Z76K;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="IjH/UgHo";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C546606A321
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 09:01:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C546606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CwF7Z76K;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IjH/UgHo
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A96AXVe066301
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Nov 2026 09:00:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jg4upLHUrM6H1fsgp5Xb2gkT
	8KIhNg+n3t7qrZRLzsU=; b=CwF7Z76KP0m38XRhVKLHCxvumfvreMoizoCQK9YF
	X66jwKO3Nra60tif2qVyMXpobdRj5RjZ82dbMypq4VGE5dBV4mwRVaVdbPuikw2N
	x5hypu0YtE881MMAsBptBHxyuD/rTmzvU2BfSCpgvgJH7S78gY4F/XKrV8leUHp3
	gzi423PJU112uRme3IU0/6mSO9V2d/j4qQgIpjSdO8kmCc2PSacad/P0E6q5WvBW
	EWT6b5boWa4jF259uPqRYhdbR9BIWixj33bFQcqV1BOvO2YTxzKjAypJZ8CPN9Up
	0HIb8xjDbyIwaFMlX6zEb8k67FlVw3+6Yc1cO/R+xU3wsw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsujxdmc6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 09:00:56 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30bcb065bfdso1452311eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 01:00:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794214855; x=1794819655; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jg4upLHUrM6H1fsgp5Xb2gkT8KIhNg+n3t7qrZRLzsU=;
        b=IjH/UgHoGAdNFLfiKwSnr33AkJaLpH+dHNF5e6LruX2sEcRYeUOsABOqKhfVUDnvl3
         0qxqEypw6ZBYKYtqpVV9wTluXXJNoCWr47UrDmKdSAe8Vmy5GbgYMtnGWlFpfcnXaTgB
         J0vkCj45Rs9OtTLJMoeuG5KL74HnLXW3rxb35BWG/Aj4PDCXIKEr1MFtQxzrOdvf6Fww
         Vb5VudW17m7UzG+H7Eb7unbCU2fSV+0JwmDTvUNXBogUbcnaV02ALx2I7iAg826QC4zY
         S7xa2jcRkIJTcb6vMgiN6fHPyb/Zqt6zmnMEZhlYFIPCcQqaW+pQUIG9Ozv1ltTxb3hd
         ir9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794214855; x=1794819655;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jg4upLHUrM6H1fsgp5Xb2gkT8KIhNg+n3t7qrZRLzsU=;
        b=1WDX8bFllCZcIp8WY/BdF/zEnBM2jp0eT/K0s5AZr7ajtGvnlrfoaRcWF1dzLeNNKy
         A7SPztEHr6QBgAhPMNxQHqPiVziI7HSfTdaXPntC5TvUdIoQLjQpsFTR6MgvgVZFc0+n
         AFQnFqzk81TXeIlU7KGnwTIdHoJsCEqc2mGdglRENGkGNpEkcBtVAcjxZRwZZTT8Uxvc
         svz+cZZnuuPCjrKtfVIeNnD4kLrSfvXUXIKqROceGj11unUBR3rs+/0j45ftBHWdhONA
         mbnHYO0IWq5Ax1P8iUa9qTMr9FuV3Lb+x8VqxMXzbwmJXnaFmbTKqqtCMKlh6NsNlNS+
         YvwQ==
X-Forwarded-Encrypted: i=1; AL+hErE3y+fluihtCkvYlx5K10NiphhX6k8Eo9f23jkEg10FK31pN1YxMqqBgd3ZWvMzQWDb+kHa8GzStO2PPqP7@vger.kernel.org
X-Gm-Message-State: APuU4Z+ptVWkgu6cA8dRMCT/adp8T1EFwzF4He93GMKIXf85oip4cjwH
	EvkJyV5xWvFyZBOzmNtYtQl1vNKNLjyQFt/Z5eiY5JjEISOBZIKvd74OCA779Z7Ft6SUjJGGuDL
	gYdkLLdT0X6JYXCzp1Nw6w3N9aJTzU17RyMJvnHQOJXbn22Oglt/nMSpjR4xPqZI+Mpy5
X-Gm-Gg: AYBFou33S5saUdLPXzGmjLxbeN6rkEaH2TPhHh0LYP0KyP4usbdepXS8uEzUsdRbIuI
	Owp2AtJETsfohEAQO3zzjpW5fsJOYzJ5xVKhqCrDE6IUTsN4KaGjHVB6aDDVFMx9QJe7G+mi2fP
	LfK3cDmiMXRh9t3qH17LYRRqtpN4uEcSHO8kuDa4wVEYglFLGUVxhTIkQoHSdxO4/rTKODmVEjH
	ivfEvkyrm4HgdiZ1y+Fp9L1pIEzJBSqgAKONwApiTqanEMmkV2G5xO+MZC+XepgRCyBneT4g4K2
	LtzJaKoNb6rlMTBpf0VK5/I2o3v3NbLjO7Lui0ER6ftNEAtFQO9mZTxljk+tOo/OD65WWc8lx13
	QwG/P6fkWNZ1/h/o+WagY/hlflhOvGri/eVOXYMkGgN2YibhUm8JHp43e5cWNMgqBrCXjy8s4Gm
	rBH1d9Zh+5PLsqrk8YVxXnbQ==
X-Received: by 2002:a05:7300:de4b:b0:36c:a42d:9bc9 with SMTP id 5a478bee46e88-37256bf17d9mr6702793eec.25.1794214855045;
        Mon, 09 Nov 2026 01:00:55 -0800 (PST)
X-Received: by 2002:a05:7300:de4b:b0:36c:a42d:9bc9 with SMTP id 5a478bee46e88-37256bf17d9mr6702737eec.25.1794214854259;
        Mon, 09 Nov 2026 01:00:54 -0800 (PST)
Received: from hu-petche-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37265a179c1sm10908331eec.11.2026.11.09.01.00.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 01:00:52 -0800 (PST)
Date: Mon, 9 Nov 2026 01:00:50 -0800
From: Peter Chen <peter.chen@oss.qualcomm.com>
To: Akash Kumar <akash.kumar@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2] usb: dwc3: Update nominal max votes for qcom usb
Message-ID: <avGLwjn6yZRqpBhF@hu-petche-lv.qualcomm.com>
References: <20261105100626.2003771-1-akash.kumar@oss.qualcomm.com>
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
In-Reply-To: <20261105100626.2003771-1-akash.kumar@oss.qualcomm.com>
X-Proofpoint-GUID: 8uBMLOGYDTFlIBhYtaAVFsKXYribJwve
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAzNSBTYWx0ZWRfXwuRrSutaGsUG
 2cUUhheGiFbCX/lxVpuWRFzJJ8XZyq8uE6Nx0/IP/fwgWZIPzVCxJOnpMF6QRQ540jnmN2c/UPK
 oZwlwzT1i/wwaKP6uENdSZTDRzD24d09hpbRNW+2GjC+vjikJI7yO7EfOnisi5863Q3Q1xVd4EV
 uM0IEJwaSqqOzJnlSycAmkNHHpo/OsQ2TJUECvJcYXw9eaoMpcH0ZW06YmPjjg4TremN64pY5Hm
 t8MerxvplNOLHsrVYHAqDcwPosU47yanUSoXwgy7xhXDI7A+FQUriPA5QMuL97YCx6KddtbM3C+
 7LrUfQkLeuuaHv9aNbG4Zx+YLc8uFJCqgor8rNVkhcPmks+9wvIHx+kzc0h8eFpTp5Idk4r0iQH
 xEty6RUxK2egwopq9Wl4j0mF701Yvc9w6WrJveoOZJJBWhfHTIxGHRPhUBHBiHW/Zm/QgTzUO6c
 R6d3g1k1naKn1e/aV9Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAzNSBTYWx0ZWRfX8/Vpdc/+fu9N
 74d568WEueNLkvgcyBCUXmeuQ5d2e77Vob2pc/K26p1ri/Pi4YFqiGfjugyrSqFAlnReDbO8uSZ
 TPzc8vVWWcahs2mae0o4zAGGKNZQlRY=
X-Authority-Analysis: v=2.4 cv=TeIDJhQh c=1 sm=1 tr=0 ts=6af18bc8 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=rNO_JpGmdzbLC-vSDh4A:9 a=CjuIK1q_8ugA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: 8uBMLOGYDTFlIBhYtaAVFsKXYribJwve
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 bulkscore=0 adultscore=0
 spamscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090035

On 26-11-05 15:32:16, Akash Kumar wrote:
> Increase the nominal max USB memory bandwidth vote to let DDR scale
> higher within its nominal corner, fixing glitches seen during
> simultaneous USB audio use cases.
> 
> USB_MEMORY_PEAK_SS_BW is raised from 2500 MB/s to 4500 MB/s (+2000
> MB/s, ~1.8x). This ICC vote does not by itself determine DDR
> frequency; the vote-to-frequency mapping is platform-specific and
> comes from each target's interconnect/OPP table. On the tested
> targets, the old vote kept DDR pinned at 1 GHz within the nominal
> corner, even though DDR can run at 1.5 GHz (+50%) within the same
> corner. At 1 GHz, glitches were observed during multiple concurrent
> USB audio use cases.

How we decide which value is suitable, eg, you set 4500 here?
If DDR can run higher, and we have more stress test case like UAS
transfer + UVC transfer, do we need this value to be higher?

Is it okay we just set the highest value for USB, there is a platform
OPP table, and we let ICC choose the highest value for USB at specific 
platform?

Peter

> 
> Tested internally on RB3, RB4, RB8, Shikra, and other KLM targets.
> With the updated vote, DDR is allowed to run at the higher nominal
> frequency, and the following were measured (not merely projected):
> 
> - USB memory throughput: 125 MB/s -> 145 MB/s (+16%)
> - RTD-USBC audio latency: 17.9 ms -> 16.6 ms (-7.3%)
> 
> RTD-USBC is the round-trip audio latency measured over a USB-C audio
> path; lower is better. Note the +50% DDR frequency headroom does not
> map linearly to the +16% throughput gain, since throughput is also
> bounded by other factors along the USB/DDR path; the frequency
> increase is necessary but not sufficient to explain the full gain on
> its own.
> 
> Signed-off-by: Akash Kumar <akash.kumar@oss.qualcomm.com>
> ---
> v2: Added Details of targets Tested.
>     Added details for usb vote.
>     Added KPI Details.
>     Dropped USB AVG BW vote change which is not needed.
> 
> Link to v1: https://lore.kernel.org/all/20260611081831.2743464-1-akash.kumar@oss.qualcomm.com/
> ---
>  drivers/usb/dwc3/dwc3-qcom.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index ac68b4218b56..3a19385969dc 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -46,7 +46,7 @@
>  #define USB_MEMORY_AVG_HS_BW MBps_to_icc(240)
>  #define USB_MEMORY_PEAK_HS_BW MBps_to_icc(700)
>  #define USB_MEMORY_AVG_SS_BW  MBps_to_icc(1000)
> -#define USB_MEMORY_PEAK_SS_BW MBps_to_icc(2500)
> +#define USB_MEMORY_PEAK_SS_BW MBps_to_icc(4500)
>  #define APPS_USB_AVG_BW 0
>  #define APPS_USB_PEAK_BW MBps_to_icc(40)
>  
> -- 
> 2.43.0
> 
> 

-- 

Thanks,
Peter Chen
