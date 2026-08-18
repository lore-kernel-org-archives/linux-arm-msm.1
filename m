Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F8CB361670
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 22:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787093245; cv=none; b=CoyyG3VECpbTBYskyqnXyKHsYiKhAGkdBS7VQDK/rxGyz4neJjoE+25VwPf77EgDsqNKbjo+ByxsqzVE+6E0DedkM6egMGrDXcUYCUkisyYl8voZdYttIZzRpQyHTjnYzXakkm9+8wpCgAYndAq5a61PYopgTO5I28Tb7UD+jYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787093245; c=relaxed/simple;
	bh=i++zW94PxMR8IYrKxOmUOw0j6reh6YFd7n9NS563VYU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ipTzRos/52ukqfTaWpVXGQsDjxX98/kma/D2NVzlLDUrQ8WzF/ur5uHHV+/6eMEToKk4Lm+L7suN5zQAXmZgW2MlJIgiFpmPT5vKJGvU9wYIm3eYfTtNm/uaqYUEsuXTudagXhgzS4pSlOZCzWDCCFS0SpVcJRC9EVcmaGtYMio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cIL1xFSX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZpcGS2/1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cIL1xFSX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZpcGS2/1"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67ILbvQx2326918
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 22:47:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pBvMLIb97/uwbiCsdTU27OQM
	5jD6wNRbqw0wj2EbdZg=; b=cIL1xFSXAzvZdOjBLOXhxT1LEVgwbTpGx6OTWLwn
	eq6FGTr4K8TXah7/h37zUIC/nVYVX/ub9fIW/wWkHP6wxX5MgTkXEH9aSSNTRWhW
	pnkFwdAvpdigTGDD3QKi//l1wbyOza303qp3YyphEWwRuyw7P0iNtUdtnPcpt5Z5
	JyOc5d/9S3oazTrUPrw8AUqyhOUmikRePjNt1n8doQyXfQrGZT1AEe56UbbxBHFs
	fCygxw1Ca1brhSELGJy/cFKgt84bK6YF5bMnlOXwDTD173arkJg1nH7StRo4nE7q
	dyUv2N7nDanIyQnSvmUVkIc5WQux1dxAlP8CTLzSxelj7g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfjgapw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 22:47:23 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-933023a5980so67050585a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 15:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787093242; x=1787698042; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pBvMLIb97/uwbiCsdTU27OQM5jD6wNRbqw0wj2EbdZg=;
        b=ZpcGS2/1fOA/ZVJbGz920L+jruEpTi55l4bwPz6ODDmQtDOi5b2vi2Y+IjfUQTujda
         Y8Pw97EmES1V/juNAX0NYjQUPgpZoOk43H/lm4qpLG1rFlECULdfjqDDQbYcaGg2uCUr
         AK5cYlf0rd0pA/73F9cdTitBreOxBXhHrOYlePBKtwG5Zetkl+3XtVoxPU3hj+/jRUB0
         u1h2auXTDZlJyFm9USjyZNDDCzSHqZcFEn2lhbqeeOgYea7XLUBiN1g9lHNp/0vZGZBC
         hV9HV9pgUhF+PpcYbX6m6dib0NfPsvuzJc8NIjWM4YZjoOMyDQ2TGSf1+1aLPTVChjDS
         buPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787093242; x=1787698042;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pBvMLIb97/uwbiCsdTU27OQM5jD6wNRbqw0wj2EbdZg=;
        b=e2dp4YA2AICyMTj+wldasEtThLrKtPKWOMQFu2y9UfnYRJwZ4fl2ESKzC3utzDEYdX
         7n2dasGDZv+zzgQ96hBBdDuh6JtMMQH7PL2eSUUUBsLLubRs7HOKLvgt5UwsmhI0H/w2
         zUU1e/bZkPWHKlLijH6tlWDNR30hS9/GYb78cCPhNLOgh9x3KV1/6MYZfAJhwWV72WP2
         CUmO2vDoWw9zO+v5X5LsL9iwopAB4CQfRGb6cSvr4yJLbGvwrRX05Jz8ZWynHY4+pYgw
         mC5RO2F+AFvni+HEW0KQlmk/nAb3Fg4SBZ0esRx4f4rwjzRUhgIlRxYHjXEXWOWGjeK5
         OI3A==
X-Forwarded-Encrypted: i=1; AHgh+RrAuq+Pf23nUHFalVNajN+p4lZWe1JVvvzKeEu4x6y1yZmZ7pLwMo//FraW1CNv7r4bbMqFLA2c679dAKiA@vger.kernel.org
X-Gm-Message-State: AOJu0Ywo1SQ4wFgfzQAUodgp3fVOJmMn5QnTIfZuv5LuGUobTJ1cNF5W
	Ks7TRJHUY5/i68Oi6GLYNDEJkeabirG1dBLABvCyPYBqIsB0KcvhW2vc8zVIxF+UwVoW+GtB9l7
	FBq0Y+m1EIZdTWfFJJZzunnzrsqxJYKKYfCNF5/37ykYHsNsigagJXj9NLnIvJLyNcuFy
X-Gm-Gg: AR+sD12oJSMYpFj586Vqa587+WmQ/v/OJtNyBfRIE+9hwE0Q04D7HWKry5iZDyHMuKR
	XJRcs+zgipk8a8fjYKkuPR/E04sTfoNl9rf/E8KfXKH4uBNApNr8KHvxpyOr+Khg6KGb+enKfR4
	ctYXk2KpW1oP5Mb8LknOknDaknApfBlKnAZkarsiqZ+5X2yTQqQ7imKVyGdIwd2FiB5Xhavf2ln
	8enuWZNa6vJjuBjCbfMBsePA58jcRq32c5BWh7Q0IV+cTzr1snZY3G2lZO2ToxLWyNp8ZjoLu3k
	mcG7ueWQYBaICpkeC0UtpuAmLyRICiDruh5+3KAG+Q3Owc9D51itB57x6WoM8PFeQrZTlQxMJl7
	zlpA+ArP6SHPHA1zZ4lDOfesuN6+C2LIuL/5kznM+HlXMfzzbgsm3uEV5bbvRwBXXypAE8IVMqK
	6ILGI7iSYceY2j
X-Received: by 2002:a05:620a:43a3:b0:92e:62d8:1faa with SMTP id af79cd13be357-9371e636dd9mr72253085a.46.1787093242456;
        Tue, 18 Aug 2026 15:47:22 -0700 (PDT)
X-Received: by 2002:a05:620a:43a3:b0:92e:62d8:1faa with SMTP id af79cd13be357-9371e636dd9mr72249485a.46.1787093242070;
        Tue, 18 Aug 2026 15:47:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b478853971sm45062e87.10.2026.08.18.15.47.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 15:47:21 -0700 (PDT)
Date: Wed, 19 Aug 2026 01:47:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev, linux-arm-msm@vger.kernel.org
Cc: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>, conor+dt@kernel.org,
        media-ci@linuxtv.org, devicetree@vger.kernel.org, robh@kernel.org
Subject: Re: [PATCH v2 1/5] media: iris: Add dma sync calls for input and
 output buffers
Message-ID: <4rk2qpalwmwtzcmmn6leezboybfgp7buuevap7pclcbf2f5mfz@zvadm7y5e7uv>
References: <20260818-iris-fixes-dma-pseq-fint-v2-0-8dc8c4b3880e@oss.qualcomm.com>
 <20260818-iris-fixes-dma-pseq-fint-v2-1-8dc8c4b3880e@oss.qualcomm.com>
 <20260818160351.4E8F51F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260818160351.4E8F51F000E9@smtp.kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDE2OCBTYWx0ZWRfX6Zi2Fz6MIZW+
 F0Sz4E0rNlIY78vLcxADcV/1FTKYPh4y6BXpURxCxTzQivQPV4fEefLQbfjCsILslt4/SrZPxUe
 ZQPq4mUHrH7HMAxzpefOav0u5aJzl6r2cpRKbD+asp8YMA3eYX6KIU8WvxxozOwtJC3CD2+s3kO
 dJ8BqphyreEXuXYX4bdvSrB72X63zghK96gjACk5nMjb/3dPGWj764TF9ZHCWG6x148kkS+nCL0
 0Ni6YCvKKxZT0fku4jLpsspJ/Bfa1zLocnFNLyNsfDj7gj+zTpVIgeaK0oL903H1LS7y4i0xwYE
 jySJgyexfa181SdI4EFIQ2iqNVHGfUcgxbOMdFkpiMNjb3tDNwPBdGDa7MwelZFyMvNZJymbNzD
 Q/1i5s4Y5NnIW2K8F7uuPJ1xo4/w0PRfrmUo+g/zjDjZinqXTM0znIfhGbRZr1xVhbSXDpd2+jp
 H4GYKYw+9/v0xbHs9oQ==
X-Proofpoint-GUID: CjgLoJZb7OXt5M_-dNQAUmvp65dYwt_F
X-Proofpoint-ORIG-GUID: CjgLoJZb7OXt5M_-dNQAUmvp65dYwt_F
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDE2OCBTYWx0ZWRfX0Vvg+l/5GM4p
 UOtNbTFwuMaaMjYwfn2qQ3cqOKgBrU7kWDaLssQadZ33VtAv+8YRabXuC5LTyQpeX6aT73oZb9J
 WlHFEIpOI4MLfAq4ps6wDnPBtjHiQPo=
X-Authority-Analysis: v=2.4 cv=Sb7HsPRu c=1 sm=1 tr=0 ts=6a84e0fb cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=vvLq9R5Q7EL3J8ZDTOcA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-18_04,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180168

On Tue, Aug 18, 2026 at 04:03:50PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Critical] Calling `dma_sync_single_*` on an IOVA managed by videobuf2-dma-contig violates the DMA API and can cause severe memory corruption for non-contiguous DMA-BUF imports.
> - [High] The DMA synchronization logic for output buffers is fundamentally broken: it synchronizes the CPU cache before the hardware writes, uses the wrong API direction, specifies a zero size, and omits the necessary sync upon completion.
> --
> 
Please respond to Sashiko comments. Also, this PR is missing
corresponding change for the venus driver.

-- 
With best wishes
Dmitry
