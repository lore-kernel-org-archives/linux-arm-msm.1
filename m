Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93E803EDAC1
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Aug 2026 10:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786097065; cv=none; b=PPL8sfCF42Hh3COleFGBFvK8iKO3oqfUmEjJHh+95Tkkf6sQNxeBj1QmbLBF/LUXYQi8b2Lipzx/pS/kS9NaONOQ5czVPNnel4ctX1zkzg2kLDMQV1pZZv6nlFzFw8eEB0fyg3R4xp+JnG2Ux1O80RNZOkKX2ZF1s9CYqyN6oM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786097065; c=relaxed/simple;
	bh=xhgVrtv9v5004X1ifYjA+OL0Il8RwnH/5Fz0sxrdmDc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UEKJ0fJiavf5HWBdSQfNl6fJryHu4athIB1XUguv2EUdHYbb/9e3xKzH8837wOojQV+94RmfCK3lnIp/gfc/S2+r6HjD/IlbNYFlkyJOmqZlszVqgvueDgn/vhHUHByMVk+C+/eD8mNrIfuYOx0NAqzocxqoT10EQlli/Xi3Va8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m6x1H5TP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZMnPTysN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m6x1H5TP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZMnPTysN"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6779Y6Ab262308
	for <linux-arm-msm@vger.kernel.org>; Fri, 7 Aug 2026 10:04:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2YxO6sel+FdiQvLcLCoi7QI7
	s/XcbqboOjuQsSWxzbo=; b=m6x1H5TPbr5tbPWMCuCM1oJgJLOm3X0XyoGXZKRt
	PvjhnccAt8+O3pnzRaIWa646yN8Nlo+bYb1LcEiC6GTY5NEilaACuTSfRT1l45Xj
	pFG34VRTNcrr5Sj/eWojsfNf1nUgWEUFk2pSKKyNIpDZB8gXAexS7RFo9Mq4HeYb
	GF+vZa7mZJze+TaXJaSZ+Z9RhTrCJyFYSAZFfLFweNx8B2LVQuDa7NAO1ehpwN8A
	6utXbRZHwB/dld6nuybPZMV/El7Q6LKHis6SBqiWySjQUKMItgLKIG5dbIE7ag5z
	ULLG/5Cd4wxapnNosFpmziBTboZQW8U8U+cojzSo7RzQRA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwcujg3hh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 07 Aug 2026 10:04:23 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c1c7f135bso47158561cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Aug 2026 03:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786097063; x=1786701863; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2YxO6sel+FdiQvLcLCoi7QI7s/XcbqboOjuQsSWxzbo=;
        b=ZMnPTysNDt9EN3JchTWrDWCRSH/e9Bk5pdccO5sjYzr5IB1fV7we5u9CS2cj5osSsw
         Hs44+T9m88E8tFyV3kb7BqziU2g4cM1huVKHkZBYRIy4Vm0o5cxHCsSVIiEglsJgRAiT
         u1JUxNcWphKpV9qZSfAbDkfXSpYiM3+2IMtl9N+SJ2w1L5orpEFhNdJBPfrqCUwTehsV
         eO9/j3eg4h5jpLbXJKo6N9qgdR5V9hO9Vc7G1YI4jYYz5vyEAXg8aB95iDqLJAiEv4pk
         2GwDVmfkT9/iApzBzCSBw3VLaKwDcE2JqOJCjZZ6LWMHsltb1xCp5GC7efgZx7zTfSlu
         mNkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786097063; x=1786701863;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2YxO6sel+FdiQvLcLCoi7QI7s/XcbqboOjuQsSWxzbo=;
        b=qF1xAhN0wKvYrwNWCpqp6iYYpSJysrRG+6GSi6tzDEq3Im6bmGARCWYaLhAG9UGe2e
         WpJbaulMcsN1STgo761DmPaYgrRAtldSENeKbtqZct1aygUqendsQmGTVbUheA73SC6X
         u+9bidZXycECP2Hf9UEnG0x3c5g1NU4KXGRCraekdfn8ENe2LA66v/YTBCjGkTE0AQkP
         GZgoNRn93TZPl7Wa4um0913qAj8yQhUO3iyjrUEXJVGcwEbHScKNb0SyBPYl3qS3lHvr
         7MCV9ErBgI7DO1FffHUuyMM2n68Gdj0NHz5MZnyoQp9rQrIUtkXAGsjYIeWrhzhQ9ocA
         ofkw==
X-Forwarded-Encrypted: i=1; AHgh+RqNUHv/yzLT7p9oQzS1dbmYQxU6tUmdUqQq5DnBCuS8E9Ppfu6tb6zRDGYz59Z8BItr32guWJzD711xIJbJ@vger.kernel.org
X-Gm-Message-State: AOJu0YzspRPKkSjJs1pH4X7C4l0oWYaswMcURTENYJyI556RkQQuqVkM
	+io1xS08s3zLGi9ASWpbxcSChkbbndvJ2kWXi1lAtPO6p3ly98PfbZcrjRYHcW94+Mo1uptysUU
	DVDX+y9hlipaRQoLqoBBMgU9u7XyAPS6ySmyOU6CXX1KPh/Fo/tWJL1OnekaZbZs/bGBj
X-Gm-Gg: AR+sD12XbUZLbCUTmLjMTQ9NHqeXSwzwIrnqwfABvqGqDpsJDR+gk17x01nifU5SaCM
	vpmTYKPmZnnplLHSUaerxbkbMFpE4ubL47m0Mz4OxxKthrl5p3Wu4KLJvbJbN0/9W1uvhY5lH8Z
	TGGM6Vl6GbLUp8gcKgpyuchNBUCKpus/JYI0Fic26i1Yrb6PUrFXMdksPtkoOQkXkMHHTog+wSh
	ZZVCNupLoGakQcxC11/iq/rBO340kkRQ/T6Q2pYlCNg3dRjWBkxFHwWj6W/EaGafkx5ttU3rxIV
	XyzRUQxDzUCsxLUJAMM6sb7d7rxi/CHXYBRNgp8lD3nej6bUr4wFytUb68SXNtccZSKCfQYh5mY
	IvzM1KtPCfRA5Sk5T4I2/imz75jUVjtVpTXq1He4G2EbDKAnmfUwfUu68yCyO5Oh717JmFGEH7b
	P3EQ+jtGrfH4qeJA==
X-Received: by 2002:a05:622a:2448:b0:51c:1117:c79 with SMTP id d75a77b69052e-52d0b193284mr99587171cf.24.1786097062688;
        Fri, 07 Aug 2026 03:04:22 -0700 (PDT)
X-Received: by 2002:a05:622a:2448:b0:51c:1117:c79 with SMTP id d75a77b69052e-52d0b193284mr99586611cf.24.1786097062306;
        Fri, 07 Aug 2026 03:04:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39fdda977d7sm2327021fa.10.2026.08.07.03.04.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 03:04:21 -0700 (PDT)
Date: Fri, 7 Aug 2026 13:04:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yifei Gao <gyf161023@gmail.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>, Abel Vesa <abelvesa@kernel.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Subject: Re: [PATCH] misc: fastrpc: fix use-after-free in
 fastrpc_map_attach() error path
Message-ID: <sy7253wbth3wlaqibiu62oddtc2o2vg33ybqjfrkqef33jydrb@os6cwxvhrqdt>
References: <20260806235056.456341-1-gyf161023@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260806235056.456341-1-gyf161023@gmail.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA3NiBTYWx0ZWRfX8ucDAIwOCwJP
 57YgJcecGCJX6Ht8bHb3ns6kLLlaOViLybq78yXv78+ggENbBcRtLpH6gCjuzsHkVKtD7fqmiPB
 1fmvbQTHBxL2CTHSptd7fdKXzDGYxOg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA3NiBTYWx0ZWRfX2xxp2UF+afAx
 hYjYAmbN6+G2OL3kUL+73yASclRUbJFWpzYwaBqBxP3pTImaGMWaDe6jJzfoiOTwW6DsKZPs28s
 KsXoMu3tQq2RIdumjRdwwtUF/ljfO/LAf6RtuFD2NkW4jAwJ76n09U9yfzATujgUH6hu5qgxoRK
 HkQ8bIgdi+NHkZAqKI+O6DA2sqQv+8bl2KiV4VSkwlDJJ4+kvYXzHKJNOkYEoDXcpr2rciO/Kgd
 iDvjFAlh2bVD5hmPFHuy7m017oA8zAojxDzGuShM28LcsugstiKhDjRX7jxfeuu4qqxpfq4S78y
 1uQm4NypUeMKywgO8S9vDXZfo3rCS8S6VKVJqHTgfGfvVZqkSvf7zpqNdsxxQI3QIqXTfJ6BLLD
 vL/j4+JCnACXP+Q4u9NcJ2V1P5z+ADaDaBCKnoDao8vM2f095ADx0vJMV8k1qtpxIql5bm7AgvM
 21wTZS3AVEPp6r8/UKg==
X-Proofpoint-ORIG-GUID: xZamwaXDzzBJvA160TkPWWaL5PXlre6q
X-Proofpoint-GUID: xZamwaXDzzBJvA160TkPWWaL5PXlre6q
X-Authority-Analysis: v=2.4 cv=Wssb99fv c=1 sm=1 tr=0 ts=6a75ada7 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=CgArLu3JlFgy8oRInKUA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 phishscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608070076

On Thu, Aug 06, 2026 at 11:50:54PM +0000, Yifei Gao wrote:
> map->table is set right after the attachment is mapped, before the
> len > map->size check. When that check fails and jumps to map_err, the
> error path manually calls dma_buf_detach() and dma_buf_put(), then falls
> through to fastrpc_map_put() -> fastrpc_free_map().
> 
> Since map->table is still non-NULL, fastrpc_free_map() repeats the
> cleanup: dma_buf_unmap_attachment_unlocked() dereferences the map->attach
> already freed by dma_buf_detach() (use-after-free read), and a second
> dma_buf_put() drops an extra reference on map->buf. As the exporting fd is
> typically still held by userspace, this imbalance can later lead to
> premature destruction of the dma_buf and a use-after-free.
> 
> The branch is reachable by an unprivileged process via
> FASTRPC_IOCTL_MEM_MAP with an fd whose dma-buf is smaller than the
> requested length, before any DSP invocation.
> 
> Clear map->table in the map_err path so the fastrpc_map_put() fallthrough
> does not operate on the already released attachment and buffer.
> 
> Fixes: 334f1a1cbe03 ("misc: fastrpc: Use fastrpc_map_put in fastrpc_map_create on fail")
> Cc: stable@vger.kernel.org
> Assisted-by: Claude:claude-opus-4-8
> Signed-off-by: Yifei Gao <gyf161023@gmail.com>
> ---
>  drivers/misc/fastrpc.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index f3a49384586d..d6be951d5538 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -915,6 +915,7 @@ static int fastrpc_map_attach(struct fastrpc_user *fl, int fd,
>  
>  map_err:
>  	dma_buf_detach(map->buf, map->attach);
> +	map->table = NULL;

This way it will skip dma_buf_unmap_attachment_unlocked() in
fastrpc_map_free(), which is not nice.

>  attach_err:
>  	dma_buf_put(map->buf);
>  get_err:
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry
