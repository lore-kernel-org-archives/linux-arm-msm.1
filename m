Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794367910;
	b=gHbImdPSWScByefdSSTQLZGwK/tQRgz7TCU2LvmQ2QaiVHmcPfF/G3S1blBs9HFjAFxD
	 CGL6CpcWqfv/AEyrdQBPDnpd7onI7d/XMuDrTpP0U4SPmtbN5WiELSUawVUzrFePouwv3
	 Tf3WZbRulojgSMaKMdkE75NWRkF+Ygw698V3elTCufm47XppksfKLGkq+Rd5X6RjODe7L
	 BZC69J9mH/bfF1lUPJQS87l1t2Pbje8XYEot5ncW7WTfxi+W5cp6kC5vucKi/S7h1BOfh
	 T0QB7z+5dQ23C92P3SExrI6I1Xn4VvV3nvO/dLJy/vwaGXwLMeQ1zgw1oFvM0Roo4ZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794367910;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=qNGauoob2TP5WIpfVA9MGfoc3EzZmkSfCenA2eySi4o=;
	b=xet2tsZJbbE3Ri/NAJlMx4C6vVRsxFc1ruU6OsU91UgcDLqB8SMN2xGYlFzRVhwUCsHJ
	 /duO38DAEYmcAFqas5Siq846Vzo04QP5dxmixy7ZSqT4RXkbmo53MgpyvxdTt+tjkYzFY
	 Yjp+8ihcdMTaMvqqoy+tqQmF1MgKmNSQe0tHRaIevapNflQDjkFChCTlHVrmyvLuuTW9d
	 893UJgOP0ikY9rvsHU5vbDE3aM8ZPjhsUawC0M2oWmo+VKRq4AIr0I3gni/qdefVOMmbD
	 O9ZVYtS6YezTikIvU5Z8Zn5+fD6gLpeU+p86RT2Yppk9Hy9281Ukc9zKl959fN/QTVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AuRGy0Y0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ypax4VbP;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA53606A324
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 03:31:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BA53606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AuRGy0Y0;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ypax4VbP
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB1t2Ns1905460
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 03:31:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qNGauoob2TP5WIpfVA9MGfoc
	3EzZmkSfCenA2eySi4o=; b=AuRGy0Y0w3oA8aN/uKuSGfGyCz0wlbYNypqRsPu9
	+ZtFtOtTAwbuoUnhpJtEQMCjw27JPYaoUAtaKbdcsfvYiKVMbexGfdBdJDcG6pId
	sWLIOVJ3PuMI+Jl+DXQVH7M9IbGXd7FfE8ODr8IlsajMJoXVsP8/qX4z7Lj9wari
	mKpZ2EWwLRfaN53Bb6ReMkH5fm07Edh8rjxYjl11oHCjydkCRKyJmGcwsaQ+f4K9
	quzSc0oMqOmw/kn95O83TuCtZPz5ZCU7oS17wTsspDpa4790J9X7Z/+Daf6HXi31
	JMTa2yGPcONmTSicyEQ5EKQbRaABsEIvAedG9dzxjkX1xg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvdnp0kub-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 03:31:49 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36a3451ea93so4090584eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 19:31:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794367909; x=1794972709; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qNGauoob2TP5WIpfVA9MGfoc3EzZmkSfCenA2eySi4o=;
        b=Ypax4VbPE6ye2OvXa33EybZYC+ejnCt4k16K9raNL4HaOZIjmxgH0YXYia6nWgbcmd
         AXohEcgvrv2nV5T6PuWnCTDoR5omr6xsSU56lJJvftZsYN1MpZIDXOOsEd5M8lytz/Dp
         CM6z5QDvkvsDsQu0H2Rd3VwfV1s6F+Ifp4Nfxf7BioUFniIaTFW4MXdjJCG35uv9lDJU
         lPnb/Iu3y92BxVJqtKOQkpP/JlZKwFieKHXOvu8DzsrYTnCv55DqisyjWxMeFf8QDhnp
         CaUhasuZaSTz2YrarCaWqF1EdO/tBAMgfTSTh2SG10AEYF+raGTDX6skDbPyHapIO18Z
         MyIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794367909; x=1794972709;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qNGauoob2TP5WIpfVA9MGfoc3EzZmkSfCenA2eySi4o=;
        b=Z8I1hHV3a5keKG4nYDh9Q8j6yn2M35ZpkRpcmgwtQvNQ/WqXnp95VWip0fMR26AuON
         ZhtH9qP1je6cBEY218G6kBSsAXq5o22rq+FilO0QE6+8KuWWgfNBrSTSs5vjGE8az3i7
         BJZl8fRAlVkhmbuii0j6bJnToSG9ZLFq7FF2DWDmPOKh1nHeFn8UgucQcYM5Fm/6Fq1h
         RqjdCpVCfScjfzP+XQeRPQ/SxtYKby9ne137bLrPyUJN4X49Lbv1f1Hhme7JIBOjC7oW
         TRkoHAq4Lc7BObvU2UU/am4CUv0OiJkYRwSoZLGlPh3kIcK98+39aowEtGo4vXMFrOxD
         upWg==
X-Forwarded-Encrypted: i=1; AL+hErGOuTTRZRKptkmMl7mNjVr2ytGhG1gUgkT19iRnkJDtYtAVzyv8XPDArqJvYV9b+JXewWyRlOYF9TZALguh@vger.kernel.org
X-Gm-Message-State: APuU4Z8tAK4kUSH2y9cpernFCStoY9oZDm8N3+iGqGab4Rv8el/DKZAL
	BHSihuUfmyenf66CEkDph57ax7z0CkU+YOnSULNV049IYZp+3vZF70Y4z+iiNe91wDkOouCRpP6
	fr0yw7CLbyB1KwlU0uppBUwfWIMlo+epHXc+uyAr0fs3ohSf6WONTFhew0Ybz7tt70VXn
X-Gm-Gg: AYBFou0I9iDa4CZ631d/gfqYgqYRBcxT09DjdhfiWD3ZLEA5HG4/Zzh/E1aFjrPVnFb
	H/Zbaxk/3pkH5PHxFKZU+iNe3e/zkntpLByqruLAeDhfqxA8WBgsLwG7mGoBj99tfj7Rc6qaMIL
	c+wPkX0cDOgQ1bg7uhoWDgPObKlnKlCttWT5EUNwJD5eREyqcKHzQkYEvAcnYU6XDTdzbuFdwML
	hXlM5qvgUT4ZvsP0dvjAGTDZfGMtjGaHG08PTrBmBImaJMZrE+O3YyMqetBBidoLc71cR67Wbh7
	8W7FBrwNVwa9qre8+OI2ED1LqUJH0W5U87occyfALBFpMPouZ0LopuxwnU/k5tbxBKH5cqXz86T
	YarM30hWGfN7lrBL2oaendTM/M42I+O9sCrgrqGZ+a7pbGns9Yz+WqFoqya24yo8tuxCu01HUdD
	2goHK0g59sL8Ygq+ApiE++Fc8=
X-Received: by 2002:a05:7301:618d:20b0:36f:6b99:f963 with SMTP id 5a478bee46e88-37685d72e49mr1839299eec.21.1794367908710;
        Tue, 10 Nov 2026 19:31:48 -0800 (PST)
X-Received: by 2002:a05:7301:618d:20b0:36f:6b99:f963 with SMTP id 5a478bee46e88-37685d72e49mr1839266eec.21.1794367908089;
        Tue, 10 Nov 2026 19:31:48 -0800 (PST)
Received: from hu-petche-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751ff2ab59sm11513881eec.6.2026.11.10.19.31.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 19:31:47 -0800 (PST)
Date: Tue, 10 Nov 2026 19:31:45 -0800
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
Message-ID: <avPhoe95Xjn3A4ec@hu-petche-lv.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAxMyBTYWx0ZWRfX6wjCas58V6am
 jAqKXsnWNsITwsD0L2fDmTMLCGxaVxEfxpubDjlJ6gmaINu6wbLXxojTO6b9iSUk+8GTgalr1mA
 JmEsirv8IEx975wpVfFGHknmw/VDiQkus2wft0qNrDJVi+Xb4MzjNb3WTcaF426HY5QgNeKw/c1
 S/qgUMbbNElzMbGKxqISjWlelrjxdDVZNT77oKEmipMfKw7xnIAAqXA4n7P1c0CXBAv13yUrFRG
 yHO7fMaoakVvHdbpACvU9PhrAJW0iEiGEgfpNLbSq/ODSsdd4FmTj+f7ZnlL7CL+Fz89zeyKkYl
 IDdV4c8k84sHa66YysBFnXZdQsOLeDWCMpa/e6ektb5t/okuCCEhWgKo0MDYchYjc7ob+ink/jU
 f4AvGkxR0SieHJtPM73KjFgHgJC6RzhN3bzAPmacvr87DDjcOR/MUTMGmPLMYEuwnUXNCOul2Z8
 R/PLt3ol16zcHBSNvfQ==
X-Proofpoint-GUID: RPpLVlbT-QlvLJc2kavkjfMQwkW9JlO5
X-Proofpoint-ORIG-GUID: RPpLVlbT-QlvLJc2kavkjfMQwkW9JlO5
X-Authority-Analysis: v=2.4 cv=NK1AaE6g c=1 sm=1 tr=0 ts=6af3e1a5 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=rNO_JpGmdzbLC-vSDh4A:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAxMyBTYWx0ZWRfX8lPC0zqHGxzj
 MiLeUg/IoA94ACxJl/LhB7mMlsLUbIj1X4laQoqugHhnuVAUM4h9IYtBlkrs79lwlqbRChyiRJv
 MkSxukzjQ60/2T9edPq2ED+RctoNjgs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110013

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

Reviewed-by: Peter Chen <peter.chen@oss.qualcomm.com>

Peter
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
