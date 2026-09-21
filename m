Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C64C405F7
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 12:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789993932; cv=none; b=bkpo1J+fN14CuAuyItf+x1cOjTdrp++O09ZIvw2Ksd5FxZ2kFdbBJyQSjhPQTiaxCFepPUWhbASe+nEdr8IjmkD/jfCV8XMqF4QSgihawaM6EOImNxvdq1og1n89LWKkdGa9TckZ3RNdAoWRBmpYkNO0RUBbpHdW70eeyfm5pjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789993932; c=relaxed/simple;
	bh=ocVsv4oVD4EaEoTXMaXIXLhfptEhJpE5Y9sC0bllC3M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e5B5sNIvzstg38nxMYbwPvpuftxyOzgA6CO8AOjLiGfPAr+liiM5d1Rj25x6rlNK3uMfF5ae9L1hUrKYTNXnWNd2uUaD8lbqmi/SkoxYLB7ywO3p4MykcrS7e/IpX7PAgg7+7WlShK27oondMfneMcpTTkq0muRbcWaIA/G4RkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AeFHsdWm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G7UzEFri; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AeFHsdWm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G7UzEFri"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LAdtjW2091236
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 12:32:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=A9EmN7Jpn4onA1CVJxcI4dYK
	dOmL7N0L1nlQPagxebs=; b=AeFHsdWmqBxM5iWrVNUCjj8QsJvYjk9SNeNDWr1y
	RHXoZqzJWguURxd03TKuxoHn2PILNCckqPU7UDP3HGH9y5/RgqrhOwY/+zzpxZix
	ZQ/qpzc9ZefAlvOhNQWKtYEGl5HdjlI/S/UF7IBSkBANNuy0AWf3s0sGDGA94EAH
	c5AKnJrgV976BQ2Qk7QtIZZmFq7r7hUMnAoI6Cu4nRYpwk6YqMSECDTRZsTgrXO/
	GgZTMu3bpUYN8S4C3sWiG+Ta+WtA+JxO4chpYGo+2VXbEqkVvmsMjt0OX5qZteNP
	xTePnoADBg+fkFxkQZ+uFYRo5OnWKZdiD/T9wDUS7vQzaA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtt3wtb9y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 12:32:10 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39512608fb1so7209799a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 05:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789993930; x=1790598730; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=A9EmN7Jpn4onA1CVJxcI4dYKdOmL7N0L1nlQPagxebs=;
        b=G7UzEFriGZrZOcopA882eTw7qd/l7Bsf2zSbagSCP/Go/eZ47EGjHgiHwLwZ6WcbAM
         VUli0OeJbfyYFzzJfQ5ifptTkFxWtKy7jQgH6pbuAASnc3k0J8ghd/LSVAQ0RH4fjQnW
         zx8FpiS0tidYPr74J8q5l7YwXVxkpuDlH6qaKUhSmd0Bv6LBtasZegbChfTlxcy8L7hm
         CCDUXMP7RGsYckePKoKBYzP7PdLIKNHTeDFVbndV14pYVoti+9Dc2txe1iUTaDAHcMQT
         NqiBVQqSBbMF/DfnUhRLmjqb/nRMfGCTa7qbEc4Rtmgz07/+xamB3c+1Y3fAVPmWE9tS
         UY/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789993930; x=1790598730;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A9EmN7Jpn4onA1CVJxcI4dYKdOmL7N0L1nlQPagxebs=;
        b=YeWGFX811b6m60E/7/ONhB8scB6r/kqc/+qFO5gCwBnn6k/0KmblqDzF9raC2g3dFm
         EFXOQGhuEmCNgnPFPu+jjLaQyYl/vfTBpQwUHDa5bERPJ+saGvT6LmgwfOlGRGfg+v+w
         ZK5XOFXv9BNo+1SiGZ2QB6bwapFLIxioQf3oHXguC3yCXWbiB3vaxm39+p8isx3v5DYs
         xbZsF5tzko+lgedg9rJmIHkcGff5b2cKyu6dTYBgtvDoqDvPb715maykBl6RH96RywXE
         ZRciL5GomA+0rRYPS4ZQcMYXPTTCIHdOhEc8v0viqgLsKcFCkd1LLIjv0LHScNGBGYwg
         qK3Q==
X-Forwarded-Encrypted: i=1; AKwUvBxa+RyKdM10jKWpncxFlav4iLG7pZoL+3zsG6tNKFHEQSdIWovIqTQ9eJUerjw1TBqQzfrjlAVluXkwWmxZ@vger.kernel.org
X-Gm-Message-State: AFuF++mvH813dbaWGcQv7k3gBeHSagpKLcpNdHB193t9c95YSiyL/nt/
	MPrH6JKHBoqu+jbZ/HQ9KxGT15hFtEEpE7zdZI0z/XxNLeNDDoPbN7gVclHl63QWUb1qhjZ2tPS
	Fwh+hBY5A43pwjfFO7Yzs1YXcAK04vWIMwStO0dwjiII0P1T89Z5QCkLGLILJkDmoaAsxtZAcku
	SG
X-Gm-Gg: AYBFou0IUy0ykLrGqzWMwM7tDz/6N/Gl1TipwWFjwYy3skJ3kwNGt0Gdpkw4LxD9lr5
	nd0mDLXSnaFmWlY2UMQZcSCU2DEZ7MdQ6XrookyCltXe/mk+Y628uJP+fgi6RG71JAUwZmcVj/e
	a0HbsS+KJrYETfRYhAhgBsLxzrxztQOYNrl5tcAFDxLm4vPOBohDJAi9ugV7J0AaAkUAJnRPxru
	L1g2p/TvAX+sk1SGXSEroB/Cy128jffIFlgDEIGlHihkbfgZRYwbOu5PN95v9ld/MxoumEfnIiA
	OghFyl09gERN/Cro2qb8KucAkP7v1XN+xg8AT+AKCAOlarf1YgAvQIA1m14vGVkXubFVRo1T+Zk
	M9LrsutrC/kfLul+RfDiJ0VboujK/ie3EvQVLVI6NmMO45w==
X-Received: by 2002:a17:90b:37cb:b0:39e:6c69:9b9a with SMTP id 98e67ed59e1d1-39e6c69b2eamr10859759a91.63.1789993929575;
        Mon, 21 Sep 2026 05:32:09 -0700 (PDT)
X-Received: by 2002:a17:90b:37cb:b0:39e:6c69:9b9a with SMTP id 98e67ed59e1d1-39e6c69b2eamr10859725a91.63.1789993929074;
        Mon, 21 Sep 2026 05:32:09 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c342b3c67sm20440546eec.10.2026.09.21.05.32.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 05:32:08 -0700 (PDT)
Date: Mon, 21 Sep 2026 05:32:06 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Birk Skyum <birk.skyum@pm.me>
Cc: "mani@kernel.org" <mani@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
Subject: Re: X1E80100 USB4 PCI0 MSI-X routing under EL1/Gunyah
Message-ID: <arEjxhvfIFGGo9O9@hu-qianyu-lv.qualcomm.com>
References: <g7V4kc2AO9xogkH0h-XHDvPbjDXcnS11cp1q3hv0X96KPW-zed6V79HUJY5BFA4pBWUE-p2MBYCeDcjWwUGBIU2hXjDpodiWaxB38obe8RE=@pm.me>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <g7V4kc2AO9xogkH0h-XHDvPbjDXcnS11cp1q3hv0X96KPW-zed6V79HUJY5BFA4pBWUE-p2MBYCeDcjWwUGBIU2hXjDpodiWaxB38obe8RE=@pm.me>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE4MSBTYWx0ZWRfXz3fyu3uX2FCf
 itczfxxqzZUf+tWbGJGxTEFCdr/ZMy9hAkui7DILbbEQiyPz5hSWM59xDa3FAi7YNMv9TbCGPym
 L4FbI3BpoqSx3NJDKOZ7BcCh8nJOvNKIag7agAfKoIq8SCmrP8Shv4xm2lzG3osbVbLPlAfwru5
 1F6TZYGOFhZT8sI33QdpLLHf+1SesNNxaJkoDqlwKY7xm/9+Tw9YoVEndBCh2IS5CEwkTy1LXAC
 Om5Hi1aDH1bJvWGtv17dGeBSiz9vDCNb0+ozeDL2FO5Ggx1VUUEu3MW0Uk24IiK92KyPZZNG1jd
 pOx4JCRuPdDFdo3Axxl06hEVRQVx88xDlpQJ72GK048oZiwyWuHsoMg+4Q006/DoDhJmqaqzAzt
 /9VIKCHG24WSZzJd4oEkyQ8EuEFT45WlqqwonULEHy3HnBv1Cjqi9bavy5X/RLOQ2dehOk2rHz9
 C1jTnrjZ2g2rW2wxn0Q==
X-Proofpoint-ORIG-GUID: S0cTNqFd-H9R3FFAwl2S7I0GdTroeCJI
X-Proofpoint-GUID: S0cTNqFd-H9R3FFAwl2S7I0GdTroeCJI
X-Authority-Analysis: v=2.4 cv=dakVTnXe c=1 sm=1 tr=0 ts=6ab123ca cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=NEAV23lmAAAA:8 a=c0qIyCC_QqcG9ToN-sIA:9 a=CjuIK1q_8ugA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE4MSBTYWx0ZWRfX1lAZs6UYcwuI
 17GA5BedYm6Lkxf723gY5nT041hw2a5mTlR8WF49yxnQs56rtc4RsWkI15raCC3Iydl+XPqC4AU
 xbIUHo4231DLmzGlYa61JHhnf7O8WX8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 adultscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210181

On Sat, Sep 19, 2026 at 08:33:20PM +0000, Birk Skyum wrote:
> Hi Mani,
> 
> I'm working on experimental USB4 support for the Lenovo Yoga Slim 7x
> (83ED, X1E80100), building on Jim Martin's published Glymur stack. This is
> an out-of-tree bring-up, not a regression report against mainline.
> 
> A directly connected LaCie Rugged SSD4 negotiates USB4, enumerates through
> a PCIe tunnel and completes a 4096-byte read into RAM. However, NVMe
> completions are recovered through timeout polling, with zero
> device-generated interrupts recorded.
> 
> MSI-X is enabled and unmasked, and the table matches Linux's programmed
> messages. Software ITS INT commands reach the NVMe handlers. In a
> separate test, redirecting one MSI-X vector to owned coherent RAM
> captured the expected endpoint payload, but that does not prove delivery
> to the ITS.
> 
> The endpoint RID is 0x0100. The captured firmware IORT and our DT agree
> on DeviceID 0x80100, with MSI address 0x17050040 and event data 0/1. The
> PCIe SMMU remains firmware-owned.
> 
> Source and test results are published here:
> https://github.com/birkskyum/yoga-slim7x-usb4
> 
> Is direct ITS delivery the intended route for USB4 PCI0 under EL1/Gunyah?
> Is additional controller forwarding or DeviceID setup required?
> 
> I also found the QCS8550 change using the internal DWC MSI receiver to
> avoid a Gunyah limitation:
> https://github.com/torvalds/linux/commit/33cae252054a694269f9dcd41b354063193c8f59
> 
> I realise that involves different hardware and symptoms. If an internal
> receiver is appropriate for X1 PCI0, where can I find its parent IRQ and
> required initialization?
>

Hi Birk,

Please add below dts change in pcie0 dts node and also remove msi-map if you added,

interrupts = <GIC_SPI 655 IRQ_TYPE_LEVEL_HIGH>,
             <GIC_SPI 657 IRQ_TYPE_LEVEL_HIGH>,
             <GIC_SPI 664 IRQ_TYPE_LEVEL_HIGH>,
             <GIC_SPI 668 IRQ_TYPE_LEVEL_HIGH>,
             <GIC_SPI 348 IRQ_TYPE_LEVEL_HIGH>,
             <GIC_SPI 349 IRQ_TYPE_LEVEL_HIGH>,
             <GIC_SPI 351 IRQ_TYPE_LEVEL_HIGH>,
             <GIC_SPI 702 IRQ_TYPE_LEVEL_HIGH>,
             <GIC_SPI 167 IRQ_TYPE_LEVEL_HIGH>;
interrupt-names = "msi0",
                  "msi1",
                  "msi2",
                  "msi3",
                  "msi4",
                  "msi5",
                  "msi6",
                  "msi7",
                  "global";

#interrupt-cells = <1>;
interrupt-map-mask = <0 0 0 0x7>;
interrupt-map = <0 0 0 1 &intc 0 0 GIC_SPI 703 IRQ_TYPE_LEVEL_HIGH>,
                <0 0 0 2 &intc 0 0 GIC_SPI 708 IRQ_TYPE_LEVEL_HIGH>,
                <0 0 0 3 &intc 0 0 GIC_SPI 714 IRQ_TYPE_LEVEL_HIGH>,
                <0 0 0 4 &intc 0 0 GIC_SPI 716 IRQ_TYPE_LEVEL_HIGH>;

- Qiang Yu
