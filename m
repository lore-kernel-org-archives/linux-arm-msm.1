Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793115409;
	b=vv5092KFUffT4mYPkDbDjnz6stWE6NwlvwmEKQJiLiCahmWxhQvRWu+D2vsnvH4r2xfR
	 VkF8SEFxlQcqD/dHFhxt+DevLNXz4UiWZkh+OyJBghuiIU7FSMbqD2PCy5+TUMTgIcak+
	 +SLltmBmMBuYKWqcafJQOsS3u5kLHQWkddcaK7zY43Len9uqkR7N1IfWCKz4IDF6HjDuz
	 mr5z2kwGezQc8TauMPYwJksM0G5AUXIs5q9kOw0PgE0KxFxK1PUygxVlp/O95Gd+3BZ4/
	 aPOBz66Q4ySd9uG4rXlzJGDakFxAwWfNScniUs0zV6+oA1O+tPRcvUKO+nF5gT7ZNnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793115409;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=JaqaLjrmwy7fdzHOEJtle5+O6Kddtcs9UQZqSzs60sw=;
	b=0FzjxZ6aWba8JRPorbzlN/S/y0qiYVBq3pbasxo1c5YQ10WgeLPVkrkSZhxoVRs0in5s
	 JH29BQyaB95BQFOtSS3zNgDnDXav+4arEynorTadL3CilWflEHc0p6+eJBNcBd2LN1Tyz
	 Nj4XbFE+Vh0UzMo+c/Sb+Yt54l4tW2XggRq/DgJ2jawfNp/cPwV/lb44CVw0ZumhBFew7
	 G5sc+FK8LCteYhl3AaUrSrX5uMqfBsqg5ZX21eOsyen0F8C7eBF5UsXJw6xwSa3ZJv5wV
	 gqb7+/KrXNwJUIyAe4YorhyAcqarb4cZLSPps1j5d377/95FwWd5EDVfNBc/i0yQlog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RfC95asv;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=e4lt6VN7;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 721C0606A31E
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 15:36:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 721C0606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RfC95asv;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=e4lt6VN7
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RFL0eC3153182
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 15:36:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=JaqaLjrmwy7fdzHOEJtle5+O
	6Kddtcs9UQZqSzs60sw=; b=RfC95asvO3wBuKKfTiSHSaEcUiMx7L9WepLVdFew
	SHc451TdHYCuykvg0xVZVIJSIBpVkpEH/tWFAMZG209pfBUTly/bYWCT3miLfjGa
	jBPQGtotY7AEqEFqOfv+CxvCmJVb4gRBwXkEITAWt3K5Imppa47wJihjd4gsE4o/
	fNCrX0Cq1Fwnazq+hrQOp/g4NWDHU4Uzn8BesIbilsYizt8WZ3ZMbJO8FGcCWret
	G1DbFM910nhwWRi59JUdZuB+/7cWlCJXRPkbqKdSEwncgsZZmgXSTYI47d6uXKcx
	yBQ8sOgEm8843TgbDpK9gekvdSZwxwZ2/7Gd1aetLQG5Gg==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjqw21vpc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 15:36:48 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-8452af97d8aso6657756a34.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 08:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793115408; x=1793720208; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JaqaLjrmwy7fdzHOEJtle5+O6Kddtcs9UQZqSzs60sw=;
        b=e4lt6VN7zUTusj/Jm2Kumv9EL/pGZ/ArEgwHNV26B6Xu2Imrj92r5mbDWmICJGmIhN
         IN0BgfEgdu/nJDFJqlWGnM48ezEPgueaQBOWCJD+v3OiVRodg1ZuAsE0vhZblhghk6Fj
         ZxFVgT3sbNubmoQOCIHnkcGv3dL+Uuuk/EZabS4HhHQefBQOMA5pVm7YbH9+r6sCEYx/
         wq/SC1uLy2lO9r6iz4K06gJUuYq0c2ytDs6U/hByCetFkVH2fhSg8HxPDubfTDN2FP1r
         l5gMbElu4m01FYexRNBzfeF5W6byHFXgLLXcMP7BcklMNmYVN7v+edKBTgIHeO7fzAkN
         jstg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793115408; x=1793720208;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JaqaLjrmwy7fdzHOEJtle5+O6Kddtcs9UQZqSzs60sw=;
        b=OLzqwY/0d6QvVmXUUK5GRzS+GSbKyRaS/m8Ne/rGqMmQVtJ4sP1/OSP1RLcnLVKwCS
         5B6OudvXwV8BphsTLugZspFimapvXPS/JTERvCKW6fzylQDatDjEkYOOK7UfWsciXnQc
         ZisyaIDvKMpi1XNr0zvnynqFEoFm6oa+Gj2Dx+DHuV/LA2OQovxUhM7sTQcBwK5ZBZ1i
         syy0ntsHaIrPtIEMFBDEigC/3Ujn9w3GLUBCUJylZw3kIFf4jy662MOGjkSky2NBeOkd
         gp6L6KtOAn3CrO/I+DPLciZvR0/gwSCrSTpDsSi/0xJ2tQ7DIPStbPRXLvC2D/wSgSKh
         bXoQ==
X-Forwarded-Encrypted: i=1; AKwUvBzTHf3jmjFtKIP73l0fCM6zYgr9hn62wEE5K+107lyKHa/hYK/LDMlFLL1WLLBUOhvhDStINAEFWsLJBYtP@vger.kernel.org
X-Gm-Message-State: AFq9FYJTq544UdfUzFVlyAW+1rBcJ2BVlMLuyeckz1Nujck0NTJBwb5L
	OpRzCqTwqkPgwS5SMJDuYEisTZWMlmQnYm1/udVba0YZTwmPszJceBDFIUtqaqYd5DGhssHclZ4
	Ehi5mq14XePm3fWlq3kFHyflo10s14VrYqJ7RO4IokmBvHvLBhFNKEGM6Y3Ed5pGwa0qP
X-Gm-Gg: AYBFou0cnknXin6LRcY8utg3vZZwnWiMPdLWMlzM3Zbv1GHkUMfo3zMXdd83buHuoGR
	xp6biHOdSUoN/kaE3BgD1uPRumol18q6kg01ap+cpwictuASXetoKyqBXCynYlREDM3y9/tww99
	z4fYB9KaSbG4t2X0tHsBY910v9A10hMGq6Mx+ECUIeNeByhcuV7jzrr1jk8pYlU8A6yWBJOxdLj
	drv2+tZXBYIVNDgemvArk+7MUljOfgB8R51guEJY2oS9fJe11dNB6r1d9VkElaZBGuYzpP3oaRd
	k888imEdOHuO+QjEQ5EOSDRm6BtX0J0x6ok21ovyFzsWtji96+7QbMJ2djXI6Zs3lo9r7YfbhjW
	DILf6THBPqX5RmhPQlAzDERH6uurZCOePwTpuAa6K1A==
X-Received: by 2002:a05:6820:221c:b0:713:9556:572 with SMTP id 006d021491bc7-71395561134mr419720eaf.40.1793115407524;
        Tue, 27 Oct 2026 08:36:47 -0700 (PDT)
X-Received: by 2002:a05:6820:221c:b0:713:9556:572 with SMTP id 006d021491bc7-71395561134mr419711eaf.40.1793115407003;
        Tue, 27 Oct 2026 08:36:47 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-70b9e04aa58sm11128084eaf.7.2026.10.27.08.36.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 08:36:46 -0700 (PDT)
Date: Tue, 27 Oct 2026 23:36:40 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Yingying Tang <yingying.tang@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, ath12k@lists.infradead.org,
        linux-wireless@vger.kernel.org, yintang@qti.qualcomm.com,
        stable@vger.kernel.org
Subject: Re: [PATCH ath-next] wifi: ath12k: change MAC buffer ring size to
 4096
Message-ID: <auDFCMlOJGhGbbL9@QCOM-aGQu4IUr3Y>
References: <20260610031358.2043716-1-yingying.tang@oss.qualcomm.com>
 <atcr70WFLxp8zreK@QCOM-aGQu4IUr3Y>
 <0423c93c-8359-4fd5-9ba0-17e5ed3927dc@oss.qualcomm.com>
 <atnVeGiu9Q07HyUq@QCOM-aGQu4IUr3Y>
 <atoTUgEIfkg6b29U@QCOM-aGQu4IUr3Y>
 <cbfa35c9-cfa5-4eb5-a203-09c9069e3b0b@oss.qualcomm.com>
 <atrJv0wgF20tmuDr@QCOM-aGQu4IUr3Y>
 <38fc5a6d-c019-43bb-98f6-ba6a667c64e1@oss.qualcomm.com>
 <atrYGgGWB_zQIrc1@QCOM-aGQu4IUr3Y>
 <7ada1074-9c84-4708-b5d6-9790b9f6f3c5@oss.qualcomm.com>
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
In-Reply-To: <7ada1074-9c84-4708-b5d6-9790b9f6f3c5@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA2MiBTYWx0ZWRfX3ap9vWSS8x8k
 HujYXMzWqeOImq41zxieQaOUCkGhkAVNs6Nac1j2rjggZ0cqYE1a/tZITGYMI94FmAUB7S1JcJc
 /MsPxxnK3IMhJERvb/hTzm7x0PzsHSY+PKAF3fBOhERsJ3cZsWjYAqGP9xTndDGNVLg9hUrZbdv
 kcRS/HLzPJBnHrjfgC5yPBEGAck3ByAulwnk7wzjNzIQ0ZIsVVDEDsirzhELmjysGnmka3OiAmv
 FLQtBHUq0xnrrEAjdzHD238+7tTSfi3mDWyMmY7+JqbFHLZQKvPqDUyK6qKBCyzzV8HA1zfIiTT
 hwaYTVMBQ7z9Eqk0vGPzwSinY+KVKYws9pxjOTzv0ifKxKpOt+2ZF/oyHnPB78jyxtmYk9BOBk/
 hHPDrZXQSkni+pdKp+pFx+559BVTz1U/ZY8U8JpxzYfz25ToUyg7TiR5aY7YQldVpGP1C71fH3U
 U/579sJcHIqprguP6VA==
X-Proofpoint-GUID: ecGhoabvqPnz6iOSB7BR5Ev05mJoDKw4
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA2MiBTYWx0ZWRfX1B4pX8EFU0yC
 rDvfzkpzOXsVi+9jrB4axY8OdhMdNU0xuOBKxj42KGl3jpMgWyJFp3jQBUzdTm1RRfVkqccH72P
 QQfruXUqupUwTjTV/SiNRoLyyxSWQ5U=
X-Authority-Analysis: v=2.4 cv=PsYG/AM3 c=1 sm=1 tr=0 ts=6ae0c510 cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=xoSu3tygczuAq7DmB4IA:9
 a=CjuIK1q_8ugA:10 a=eYe2g0i6gJ5uXG_o6N4q:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: ecGhoabvqPnz6iOSB7BR5Ev05mJoDKw4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270062

+ stable list

On Mon, Oct 26, 2026 at 05:47:31PM -0700, Jeff Johnson wrote:
> On 10/22/2026 8:44 PM, Shawn Guo wrote:
> > + Jeff
> > 
> > On Fri, Oct 23, 2026 at 11:13:56AM +0800, Baochen Qiang wrote:
> >>
> >>
> >> On 10/23/2026 10:43 AM, Shawn Guo wrote:
> >>> On Fri, Oct 23, 2026 at 10:13:18AM +0800, Baochen Qiang wrote:
> >>>> On 10/22/2026 9:44 PM, Shawn Guo wrote:
> >>>
> >>> [...]
> >>>
> >>>>> I bisected drivers/net/wireless/ath/ath12k between v7.3 (broken) and
> >>>>> the ath tag (working). It lands on:
> >>>>>
> >>>>>   15f7603b69a8 ("wifi: ath12k: Increase RXDMA buffer ring size for default memory profile")
> >>>>>
> >>>>> The previous commit, 643f0bf93617, still has 4096 entries and is broken.
> >>>>> 15f7603b69a8 changes one line, .rxdma_buf_ring_size from 4096 to 8192,
> >>>>> and works.
> >>>>
> >>>> thanks for sharing this. I can repro it using the 481 firmware once get 15f7603b69a8 reverted.
> >>>
> >>> Thanks for confirming!
> >>>
> >>>> so the rule here seems that rxdma_buf_ring_size must be at least twice as large as
> >>>> DP_RX_MAC_BUF_RING_SIZE (I also tries four times large, it works). This rule looks
> >>>> reasonable to me, since WCN7850 get twos HW MACs and its firmware setups rx_mac_buf ring
> >>>> for each, and each ring fills itself using the buffers all from the single RXDMA buffer ring.
> >>>>
> >>>> maybe I should submit a patch mandate this rule.
> >>>
> >>> I'm more concerned about how we would fix the regression for 7.3.x stable
> >>> kernel.
> >>
> >> we can try to ask stable team to backport 15f7603b69a8 ?
> > 
> > Ok, I can do the backport after the commit lands mainline, assuming it's
> > part of Jeff's PR for 7.4 merge window.
> It's in Linus' tree now
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=15f7603b69a83a0acc7fcc8992ecbea6110f9424
> 
> Would obviously need to backport the entire series:
> https://lore.kernel.org/all/20261007-mpp_ws-v1-0-739b1fb87d24@oss.qualcomm.com/

Thanks for the pointers, Jeff!

If we want to backport the series as it is, we will need to cherry pick
the following 9 commits onto 7.3 stable kernel.

  wifi: ath12k: Increase RXDMA buffer ring size for default memory profile
  wifi: ath12k: Make RXDMA buffer ring size configurable per memory profile
  wifi: ath12k: convert DP_RX_RELEASE_RING_SIZE to inline helper
  wifi: ath12k: convert ATH12K_RX_DESC_COUNT to inline helper
  wifi: ath12k: convert ATH12K_NUM_POOL_TX_DESC to inline helper
  wifi: ath12k: convert DP_RXDMA_MONITOR_DST_RING_SIZE to inline helper
  wifi: ath12k: convert DP_RXDMA_MONITOR_BUF_RING_SIZE to inline helper
  wifi: ath12k: convert DP_TX_COMP_RING_SIZE to inline helper
  wifi: ath12k: move dp_profile_params to dp.h

Since most of them are not qualified as stable materials, I'm considering
the adapted patch below. What do you think?

Shawn


---8<------

From 7cb5ef07401ce8c8f0d512bb3a6521a5451046d7 Mon Sep 17 00:00:00 2001
From: Pavankumar Nandeshwar <pavankumar.nandeshwar@oss.qualcomm.com>
Date: Wed, 7 Oct 2026 14:53:33 +0530
Subject: [PATCH] wifi: ath12k: Increase RXDMA buffer ring size for default
 memory profile

commit 15f7603b69a83a0acc7fcc8992ecbea6110f9424 upstream.
commit 643f0bf936176c114d5631da7547e991b5d99f10 upstream.

The default RXDMA buffer ring size of 4096 entries can become a
bottleneck under high RX traffic load, resulting in reduced receive
throughput due to limited buffer availability.

Increase the RXDMA buffer ring size to 8192 entries for the default
memory profile to provide additional RX buffering and improve RX packet
processing efficiency.

This increases memory consumption by approximately 9-10 MiB and improves
RX throughput by ~20% with the default memory profile
(ATH12K_QMI_MEMORY_MODE_DEFAULT).

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
Tested-on: QCC2072 hw1.0 PCI WLAN.COL.1.0.c2-00074-QCACOLSWPL_V1_TO_SILICONZ-1

Signed-off-by: Pavankumar Nandeshwar <pavankumar.nandeshwar@oss.qualcomm.com>
Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Link: https://patch.msgid.link/20261007-mpp_ws-v1-2-739b1fb87d24@oss.qualcomm.com
Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>

Backport rationale (not part of the upstream message):

v7.3 contains 58aeb412495a ("wifi: ath12k: change MAC buffer ring size
to 4096"), which sets DP_RX_MAC_BUF_RING_SIZE to 4096 while the RXDMA
buffer ring is also 4096 entries. With WCN7850 hw2.0 and the older
firmware WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3 (still
shipped by Debian trixie, firmware-atheros 20250410-2), every WMI
command then times out once the interface is brought up:

  ath12k_wifi7_pci 0004:01:00.0: wmi command 16387 timeout
  ath12k_wifi7_pci 0004:01:00.0: failed to send WMI_PDEV_SET_PARAM cmd
  ath12k_wifi7_pci 0004:01:00.0: failed to enable PMF QOS: -11
  ath12k_wifi7_pci 0004:01:00.0: fail to start mac operations in pdev idx 0 ret -11

so WiFi does not work at all on affected systems. With the RXDMA buffer
ring at 8192 entries, v7.3 works with the same firmware. Per Yingying
Tang, the RXDMA buffer ring needs to be at least twice
DP_RX_MAC_BUF_RING_SIZE (four times also works): WCN7850 has two
hardware MACs, the firmware sets up an rx_mac_buf ring for each, and
both fill themselves from the single RXDMA buffer ring. Newer firmware
(WLAN.HMT.1.1.c5-00302 and later) is not affected.

Reverting 58aeb412495a is not preferable, as that gives up the
throughput improvement it provides for newer firmware.

Fixes: 58aeb412495a ("wifi: ath12k: change MAC buffer ring size to 4096")

[ Adapted for 7.3: 643f0bf93617 ("wifi: ath12k: Make RXDMA buffer ring
  size configurable per memory profile"), on which this commit depends,
  is not in 7.3 and does not apply because the profile parameters
  structure lives in core.h here. Fold its rxdma_buf_ring_size field
  and DP_RXDMA_BUF_RING_SIZE(ab) accessor into this backport. Values are
  as upstream after both commits: 8192 for the default profile and 4096
  for the low-512M profile. ]

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/core.c  | 2 ++
 drivers/net/wireless/ath/ath12k/core.h  | 1 +
 drivers/net/wireless/ath/ath12k/dp.h    | 3 ++-
 drivers/net/wireless/ath/ath12k/dp_rx.c | 2 +-
 4 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index b0107cde99ff..b25202effb00 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -54,6 +54,7 @@ ath12k_mem_profile_based_param ath12k_mem_profile_based_param[] = {
 			.num_pool_tx_desc = 32768,
 			.rx_desc_count = 12288,
 			.rx_release_ring_size = 16384,
+			.rxdma_buf_ring_size = 8192,
 		},
 	},
 [ATH12K_QMI_MEMORY_MODE_LOW_512_M] = {
@@ -68,6 +69,7 @@ ath12k_mem_profile_based_param ath12k_mem_profile_based_param[] = {
 			.num_pool_tx_desc = 16384,
 			.rx_desc_count = 6144,
 			.rx_release_ring_size = 8192,
+			.rxdma_buf_ring_size = 4096,
 		},
 	},
 };
diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index 93fd227b4d19..6941cd41551d 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -934,6 +934,7 @@ struct ath12k_dp_profile_params {
 	u32 num_pool_tx_desc;
 	u32 rx_desc_count;
 	u32 rx_release_ring_size;
+	u32 rxdma_buf_ring_size;
 };
 
 struct ath12k_mem_profile_based_param {
diff --git a/drivers/net/wireless/ath/ath12k/dp.h b/drivers/net/wireless/ath/ath12k/dp.h
index bef0f2ba0560..53f7cd990892 100644
--- a/drivers/net/wireless/ath/ath12k/dp.h
+++ b/drivers/net/wireless/ath/ath12k/dp.h
@@ -202,10 +202,11 @@ struct ath12k_pdev_dp {
 #define DP_REO_REINJECT_RING_SIZE	32
 #define DP_RX_RELEASE_RING_SIZE(ab) \
 	((ab)->profile_param->dp_params.rx_release_ring_size)
+#define DP_RXDMA_BUF_RING_SIZE(ab) \
+	((ab)->profile_param->dp_params.rxdma_buf_ring_size)
 #define DP_REO_EXCEPTION_RING_SIZE	128
 #define DP_REO_CMD_RING_SIZE		256
 #define DP_REO_STATUS_RING_SIZE		2048
-#define DP_RXDMA_BUF_RING_SIZE		4096
 #define DP_RX_MAC_BUF_RING_SIZE		4096
 #define DP_RXDMA_REFILL_RING_SIZE	2048
 #define DP_RXDMA_ERR_DST_RING_SIZE	1024
diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
index 8fa0e90b4531..d1f0ac152dd4 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
@@ -1702,7 +1702,7 @@ int ath12k_dp_rx_alloc(struct ath12k_base *ab)
 	ret = ath12k_dp_srng_setup(ab,
 				   &dp->rx_refill_buf_ring.refill_buf_ring,
 				   HAL_RXDMA_BUF, 0, 0,
-				   DP_RXDMA_BUF_RING_SIZE);
+				   DP_RXDMA_BUF_RING_SIZE(ab));
 	if (ret) {
 		ath12k_warn(ab, "failed to setup rx_refill_buf_ring\n");
 		return ret;
-- 
2.47.3

