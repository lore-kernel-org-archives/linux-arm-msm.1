Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792676309;
	b=qUn9LbId0S3AokoSEQwle2y41qE0mJodQTZ5kSFT2hVm5LEkecm3/hqe+aFAxecfyEVZ
	 L88icBpccSX8Cpwa6Iz0zT1MH/xqFZg9i5XgJimNnZL+lOk5F5QFtqZKTZhLJ3IM2EgjB
	 wMArMuL9fSaG6X8DAyEc+CT57l63hyqAKUWjRX4mXhB54qZADVryjPF1vCtUGLyD823vA
	 vG9LfEaLOiZXkVsiE/clgxjABUaw8Y5MNuQPiIaP7T8c1QmQouS2UUeJuqLBGBRwgW0Am
	 dw9vVvAVCZBheP8/1bC/LPo8DsqOYrDbt+68/1pRQd0vMkbHQ4XzIrGldWzj33trx5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792676309;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=9Vw7fnKc3VAocPM27GWdWNWFuAYiQe9Qj0jcJnHPkQY=;
	b=B0TgW+98/fDiusv21hgrlFLm+0E8TZOn8THZQVWel2JC7NcqqNd2U6smy8PXF7GQtnjm
	 yIh8zBKDk1jsVrCsRXHGt+z2e8sFpxiO/7mdPkuoqPsAmx74RpC4ZXgfzA/7WWpcEI5u6
	 6MM1RAxXDkHwwLvns378JDy6Py1PLtsTHwyf1MH9vcNK7FfNe4BZozVENKzzDR2uPUcwd
	 FrvM6xRWxxkCEzyNABZeuEgJGyLX7FLDid+R5vMPRNEc9WqqCf/6RowCbirp8Yieoo/4n
	 sRE4SIjQqrpcIpAJeke7vwFaJwaI7Hd/dd5oaMkxLP3m+2YmIc/aJXCucqqH6Dxdgrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kBYxFLjr;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YLgOV4CL;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AA67606A31A
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 13:38:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2AA67606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kBYxFLjr;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YLgOV4CL
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MA02NI2574416
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 13:38:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9Vw7fnKc3VAocPM27GWdWNWF
	uAYiQe9Qj0jcJnHPkQY=; b=kBYxFLjrTr6+r+wNEyfUXpu8kTmOIFI8bJWdB/AA
	VFXovdQDD8z9lYJpybCGfPLYSURbbGYr6lpUckpQMKcAeQw3YQTYsRUlFuwnTngp
	jHtnS1eBKxYr7JXlivZITdAjsMawxTK93zRF5dD9YWYJX15jW6ui0QDd8D5WkeVA
	5Sux8FZ3be+TBrGEfcCqyEtWtTDPxvobiRPn+bv/K1haZnSy7o+Fn2LdPBG0OSvj
	TL4V7XIQKhfKormHXlAT9xunEm9cWZtNem7R3xWN8x94OlV4hSzt5UzvGJjk9NBa
	7kxzXM6BuWRe9+tJFSGXq1eh57Aczma2I05QFKfEkSV3VQ==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93aksst-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 13:38:28 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-139b62317d0so2598140c88.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 06:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792676308; x=1793281108; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9Vw7fnKc3VAocPM27GWdWNWFuAYiQe9Qj0jcJnHPkQY=;
        b=YLgOV4CLBxnspR/566bovclCqQSZXqlefduvFcgc6MkqrU+mFvXK6BE36qvejnNDgj
         S8Hjkaksf9y3JxMJHVQcMewzy4cD1wA8gb1QY/JJ4W4soF67br5ps4EGXze4CrYSSwdb
         ekBmZVB38e42fu2nQ3He0C3lLkbBlnFjmKWXNu3wmTyyA82Mn4ri91iQAQzd1w7wvxfs
         gjfj5erkwslI6QygUMDad9t81eayuTqQ9yP7FirVa/Cpb0I3+SHKx8HoTRL/65Ds2rIl
         WjbiIh7jgDJmmcfAXlKW6yiq7k5rEl1X4ktiV4HMWS/WOqH5EsVC4MFfV35VC5Ht8r+a
         2RHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792676308; x=1793281108;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9Vw7fnKc3VAocPM27GWdWNWFuAYiQe9Qj0jcJnHPkQY=;
        b=JUaOfKHWMoH93hEbG0eZa3C4Ql6WCaLa81MNH8RxL2S469KAQrHxGaNbymN1fai7JM
         b+zFaJ27ITSw0OBvOoayKfYfZLbeWtF44mouOAX+Ci5ThvJkc/xCDbqKPVTJ3opfu38/
         aS1iNITq3bHr3OyRCljwR38bxZJFJbeuDIHSeQfmciAsL1P3RRnxYFu/76snKd/c9MNn
         coMOsNeZFG28pBPcsdj/G/l9C+hntvFXBmP8MPu6xHeTNEkO3qMBSZdwOn9Y/wT1wbaq
         pUAZwT6Emee1+FdytZSonVAMO1RDEzWEUIP0EyKpj6zVj5BgWWuH80Hm6W2csoMwndYw
         mrJA==
X-Forwarded-Encrypted: i=1; AKwUvByyRi3QTmHiLdoXkWgJ7GsiQQ+yQg55ycKCfYGkZd2tJKS384lbHvscPKTyzWX+HIrnyglgtCYm0WdHWua4@vger.kernel.org
X-Gm-Message-State: AFq9FYLhyNu1Vx0QZoWz8BdACvlxd6VIJwF9xaYJ1dfJXheyEQ0F3is8
	rQCXYiXiuqayHDenG8cmnLeW9H4Bjl8rsXhMeHgpgJ9x1qHEnMHje9V6tRh0V5/EL2DOdbH74a/
	nV1CTJxaYQ/Uy2bNHlR6UY+o+1l6KUreaPCUC29fU3L4Fn5X0Y7e2LfcdAg1Dwl691TV/
X-Gm-Gg: AYBFou2mQgRflucf5SX71zkw4rBAj2tPS80hwIEiKwUuD0aGWr2M7jf4av0S2RQyije
	LjbCoZAFSyL1vy0i9bdVFFJ5puLBUZKd/emuxajFeQ6ERuue3PeH/5V4nf0baukqHNCw0+GlOcM
	qnpU2Gw0noLdcUVsZWm1FVR4U6lfAF3KvtD6LN0TCdh3737xwpW353x2h6XZvVOKFkYYBLruAYE
	4vsVfs9AghG01/KD3X95aSqDIsty1Tl281czdI0+tFDbPzqJvg1gAJniN6XUy9bbKF6a2PR3GRA
	0bRV/50hAh7eKSPE+ig+KSIyCJkdaaxGng8Wcw4RdvzDZ+6oJOYgAlFRhOcpGejXsVzWA5AUad6
	cx9X2PzYkyy8JjTFvYLLO17xqLAi/XQbnG/BQW8sTEQ==
X-Received: by 2002:a05:701b:4553:20b0:189:ff2b:b194 with SMTP id a92af1059eb24-190a6adcaebmr6406865c88.16.1792676307522;
        Thu, 22 Oct 2026 06:38:27 -0700 (PDT)
X-Received: by 2002:a05:701b:4553:20b0:189:ff2b:b194 with SMTP id a92af1059eb24-190a6adcaebmr6406826c88.16.1792676306856;
        Thu, 22 Oct 2026 06:38:26 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903aefe90asm14097649c88.9.2026.10.22.06.38.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 06:38:26 -0700 (PDT)
Date: Thu, 22 Oct 2026 21:38:20 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: Yingying Tang <yingying.tang@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, ath12k@lists.infradead.org,
        linux-wireless@vger.kernel.org, yintang@qti.qualcomm.com
Subject: Re: [PATCH ath-next] wifi: ath12k: change MAC buffer ring size to
 4096
Message-ID: <atoRzGmURyjFcH7Y@QCOM-aGQu4IUr3Y>
References: <20260610031358.2043716-1-yingying.tang@oss.qualcomm.com>
 <atcr70WFLxp8zreK@QCOM-aGQu4IUr3Y>
 <0423c93c-8359-4fd5-9ba0-17e5ed3927dc@oss.qualcomm.com>
 <atnVeGiu9Q07HyUq@QCOM-aGQu4IUr3Y>
 <0d5d36ae-3d65-4dec-98cd-7409ba4180c2@oss.qualcomm.com>
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
In-Reply-To: <0d5d36ae-3d65-4dec-98cd-7409ba4180c2@oss.qualcomm.com>
X-Proofpoint-GUID: DQDZ_H4H_MyZQQ55ElbHB9ZQL1iGr5Mc
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA1NCBTYWx0ZWRfX+ywW9o4XJFx6
 R3v/Yvt/y1K4DhMs9PoBeKfEBT9FrjLAOxBoDxq4swaw/9AeEP466SZ6iHAmQ+Td07Hx4mVaJg9
 yhuIwhjGSOypnMPOkx2/HiJSbKH71K8=
X-Proofpoint-ORIG-GUID: DQDZ_H4H_MyZQQ55ElbHB9ZQL1iGr5Mc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA1NCBTYWx0ZWRfX33pPhV0yl+aR
 tTQ8ol0mxFFgEJXLhT5QrS9QgzREUqd7rd+zkdzQgq6zBu33uSwyUjoEEbkBQkIHy+vRANdBwK0
 neJU4AbDF3vzlVfmmJBe+CTANuK2P3lEupxVi1YzYyMKCtJY7VDQFfOMYlfcYWK9tqAduuVVWF6
 FPOfHW9zufEdycRdSSzM6cP8YswSWOtr1uVjPYs74wTr+gwg4SiBGZWDNsS6P12vqbovUP+JZly
 9+zidRB/JH7oexcG9uhVEU5fMOnsWnt88SAoZtFpeCYvTUJ8L5TXR3Bd4URg5Kod6/H2QWpEC0Y
 vrtpjvZUt7I5wmA70Y/FbPgJv7BYVqHs6MUgzQoeA9l4AwQRKjWNfyX+DP8YGCBVCq2UV5mxevQ
 Vh4xlDtOjH3wTmkZxjzETGBxGNS7tJ+xUUkKm++5pH2riw/ht2Z6kNj767e3q4YE2i4D98JcGHl
 9mj6b1TBzsKW1TQIzzA==
X-Authority-Analysis: v=2.4 cv=dOszC+Zb c=1 sm=1 tr=0 ts=6ada11d4 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=Z4Rwk6OoAAAA:8 a=6ugie7c4VXROldkqumgA:9 a=CjuIK1q_8ugA:10
 a=vBUdepa8ALXHeOFLBtFW:22 a=HkZW87K1Qel5hWWM3VKY:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 spamscore=0 adultscore=0 phishscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610220054

On Thu, Oct 22, 2026 at 07:00:31PM +0800, Baochen Qiang wrote:
> 
> 
> On 10/22/2026 5:20 PM, Shawn Guo wrote:
> > On Thu, Oct 22, 2026 at 10:30:45AM +0800, Baochen Qiang wrote:
> >>
> >>
> >> On 10/20/2026 4:53 PM, Shawn Guo wrote:
> >>> + linux-arm-msm
> >>>
> >>> On Tue, Jun 09, 2026 at 08:13:58PM -0700, Yingying Tang wrote:
> >>>> For WCN7850, MAC buffer ring size is updated to 2048 in
> >>>> 955df16f2a4c3 ("wifi: ath12k: change MAC buffer ring size to 2048")
> >>>> to increase peak throughput.
> >>>>
> >>>> But during the RX process, a phenomenon can still be observed where
> >>>> the throughput drops by about 30% from its peak value and then recovers,
> >>>> and this behavior repeats during RX.
> >>>>
> >>>> After increasing MAC buffer ring size to 4096, the data rate drop has
> >>>> gone.
> >>>>
> >>>> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3
> >>>>
> >>>> Signed-off-by: Yingying Tang <yingying.tang@oss.qualcomm.com>
> >>>
> >>> FYI, in case someone else runs into this: with this change (merged in
> >>> v7.3), WiFi on my Lenovo Yoga Slim 7x (X1E80100, WCN7850 hw2.0) stopped
> >>> working with the older firmware that Debian trixie still ships
> >>> (firmware-atheros 20250410-2):
> >>>
> >>>   WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> >>>
> >>> Probe and firmware download succeed, but every WMI command times out
> >>> once the interface is brought up:
> >>>
> >>>   ath12k_wifi7_pci 0004:01:00.0: wmi command 16387 timeout
> >>>   ath12k_wifi7_pci 0004:01:00.0: failed to send WMI_PDEV_SET_PARAM cmd
> >>>   ath12k_wifi7_pci 0004:01:00.0: failed to enable PMF QOS: -11
> >>>   ath12k_wifi7_pci 0004:01:00.0: fail to start mac operations in pdev idx 0 ret -11
> >>>
> >>> Bisecting ath12k between v7.2 and v7.3 lands on this commit, and
> >>> reverting it on v7.3 brings WiFi back with the old firmware.
> >>>
> >>> Unmodified v7.3 works fine after updating to the current linux-firmware
> >>> image:
> >>>
> >>>   WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
> >>>
> >>> On Debian trixie that one is available from trixie-backports
> >>> (firmware-atheros 20260916-1~bpo13+1).
> >>>
> >>> So nothing needs fixing on the driver side. I'm just leaving this here
> >>> so that anyone who sees "wmi command ... timeout" on WCN7850 after a
> >>> kernel upgrade knows to update the firmware first.
> >>
> >> Hi Shawn, thanks for reporting this. I just had a quick test
> >> WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3 with the latest ath tree
> >> (ath-202610191908), everything looks good, simple connection and ping pass, I don't see
> >> any ath12k warning.
> >>
> >> The firmware images I am using comes from the first commit adding WCN7850 firmware:
> >>
> >> 	fb04a7f4b750 ("ath12k: add new driver and firmware for WCN7850")
> >>
> >> and the md5 values are:
> >>
> >> linux-firmware/ath12k/WCN7850/hw2.0$ md5sum ./*
> >> d3750b67b1013fe82358d0538fb131b0  ./amss.bin
> >> c79c410d585360000c0490f16fda43e2  ./board-2.bin
> >> 73056f1d2aff886ce9bff313f455e963  ./m3.bin
> >> d0ee61498bf1a205147cdbcf645391e7  ./Notice.txt
> >>
> >> can you share the md5 values of your images?
> > 
> > Hi Baochen,
> > 
> > Here are md5 values of the old firmware shipped by trixie firmware-atheros
> > 20250410-2.
> > 
> > $ md5sum /lib/firmware/ath12k/WCN7850/hw2.0/*
> > d3750b67b1013fe82358d0538fb131b0  /lib/firmware/ath12k/WCN7850/hw2.0/amss.bin
> > 5dacdfbe6c3c25d9e0605be8a9f1f6e4  /lib/firmware/ath12k/WCN7850/hw2.0/board-2.bin
> 
> this is different from mine, can you try mine?

Are you sure this board file works for my Lenovo Yoga Slim 7x laptop?

> 
> > 73056f1d2aff886ce9bff313f455e963  /lib/firmware/ath12k/WCN7850/hw2.0/m3.bin
> > 
> >> and have you ever tried the upstream mainline
> >> kernel or the latest ath.git tree?
> > 
> > I'm not sure what you mean by upstream mainline kernel, but v7.3 should
> 
> I mean Linus's tree
> 
> > be the mainline kernel released a few days ago.
> > 
> > On the other hand, I just tested ath.git tree at tag ath-202610191908,
> > and it worked with the old firmware. So it seems there are some gaps
> > between v7.3 and ath kernel.
> 
> can you share the exact tag of v7.3 kernel? is it just below tag?

Yes, it is.

Shawn

> 
> commit c03c1a14507dfaf8b856c2608f9ac216021fc222 (tag: v7.3)
> Author: Linus Torvalds <torvalds@linux-foundation.org>
> Date:   Sun Oct 18 13:14:58 2026 -1000
> 
>     Linux 7.3
> 
> diff --git a/Makefile b/Makefile
> index 0dc1a9f4e63e..c61ea07ee505 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -2,7 +2,7 @@
>  VERSION = 7
>  PATCHLEVEL = 3
>  SUBLEVEL = 0
> -EXTRAVERSION = -rc7
> +EXTRAVERSION =
>  NAME = Baby Opossum Posse
> 
>  # *DOCUMENTATION*
> 
> 
> > 
> > Shawn
> 
