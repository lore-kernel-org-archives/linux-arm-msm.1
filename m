Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792723398;
	b=GxGJxt0Y0blRm7ZAgM84Yct5d4SVCPLZV0eqJC1AW6tVGpq8X06LuOqTubjxn0KCbegP
	 9eCxHDkKEZior2VX9yn+/a8lzoDqxjqCXfb4iotmLW59jaA1kY67gV/NkdxmDet3qRgT8
	 HLiWGJFKcOI8EgdbWwakJY80pNVzibXHQnCAYPe0IixOlDd5DrngOLZj0IXIkV8kqv5eq
	 T4W6gYLkAwc9P1NfCW5JcIR63BDBkUGsCGgchC1/DaVWPKuEmkM1NIkBqd5wDT8GNNHx7
	 QVSEpLmq/dX5hSghE0+wNuOzmB4YoNqTziwinyG2bHafuIDDftxPIoUPGZph0aFDpAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792723398;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=t3/8p3pFjwueYne/Fh+jqF50g48cn2FBQc5K0PETrMw=;
	b=pioC4f78mVWJUOaJULPqdMGkz5yVossO6XdQZzcilaiGhshO89oZYFW1TJTi9szTT/7G
	 ytdxLP9xUIjIRw5s8MGtEd/OnRquef1qoEJBEAlzWnQrDmhNeRoW2j6HPg2ahIv8On2Og
	 1v4gevg4bqoPZt6CoKTC760nbWmXlgCc25JfvY15GIsy1mGoggIzJ11Uj48RFBD6XMS+W
	 UTkIDg+yZ3MkIxmbfoY6JHxmzPKzFzD9gFzP3kWWpJanjOdcoIV2l7RczcN/QQMGBHVWR
	 JQCsJ8VkJ7NRdM6djnl2k5Dj5Z/liDBEFFSd9XdW27It872hxun97QSnOz6AG9bQLqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Te9rgS+b;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=J3vq+TMe;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B252606A31A
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 02:43:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B252606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Te9rgS+b;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=J3vq+TMe
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N1FKvj2391394
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 02:43:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=t3/8p3pFjwueYne/Fh+jqF50
	g48cn2FBQc5K0PETrMw=; b=Te9rgS+bv2msXXO/5wYw5VMGaXSbyCBYxYwRNEYX
	LwHCITC9h8OsKfLinfrSSqDOPiM3prbubXt+YUPvYcpl3BDt2GP+WuBVeoQVDByq
	28inHfeyJ32OunSJFdrIR2qyTaOGifx6pepv15QtegFY8t1ocKR6BBSlYEecWbEs
	z+BbZXSys+ZNbyZh9p+i5ehE+tr3tzuIxv2XOz7cR+iUByTWBN4b8n8Asb5sW8d5
	NVmEiph/se58xaYRFZiR8zz3VrSX6uwwBIcKtyqKOVYn+NUvaL3Hg/2x6SVEAND/
	wUlfjy5RrQPmsr/j5/IkAwO58ZUXS2kTLF3k7FKZrYhyeA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmp9hbm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 02:43:17 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-359b81ad4e8so589850eec.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 19:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792723397; x=1793328197; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t3/8p3pFjwueYne/Fh+jqF50g48cn2FBQc5K0PETrMw=;
        b=J3vq+TMevafEBwT/jEk6H7RPuCFGhsxwYahCP/X+rucBEP/vaHRqCuh8A0j9AlTIQZ
         XUPz8HU8bvu54z+3uoSDCT4E7CSaxomQ9UGUp/Vz9uQeSouD15bSw0BcAavnOYOWp3XW
         3eLCnzFa9Q7KIYW93eiVwLUNhSR47F8ZSXeGZbsAknMsRad9jqFkcnt1OFp5JYRMsLbB
         +9mJq8hLQUCHPdjJTIiQXpvnRWy9Yx4ek1b7IGv6/Z2Sg+WHtbUdo9YMpjNeILO38fzL
         0joHR5GR4368asDgBnOBVXnUMcFJ4uNEYriUhGB9psLSDXuyxwwvEdPlHSsRuR7SdCrE
         aM7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792723397; x=1793328197;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t3/8p3pFjwueYne/Fh+jqF50g48cn2FBQc5K0PETrMw=;
        b=cxsG7e6FdF0vhAchryo6k+yxGxYZhxH0rssZ7lqVLLAJ+D6pkQJr0Wrl/ZjcMfFzep
         YDr6NqFi3b69FAuC7jJnJqzqToYlDyQ97DZJUFjkUyEdXSc4rSzp09XAi4mOcOIsxbkE
         GblkEfo3aWLFDSwO8AI2k/4Yfxj+H7ZlJca/KgECcCyB7u8Ppq9Bg8EFp8ZzAd4Dq5Zq
         RBk+CEWnuJ9y+WdV7pldnMmK9XrK2W54PILwqx2HC6UCmTlEf8HQSd9eDbTA1NGf4paE
         Bilp+EGgeXirrOxwi3HMkJRUvMkR1A1flndwPTwMXIb/xKI4EjaUTn5l/nQqeAbWi/po
         UGgw==
X-Forwarded-Encrypted: i=1; AKwUvByYMqAo2+zzGVYzXC5WNUcyiIGQ4Qj6Rtao909N9lt6/NJmyj5YC1sJOd2fNVp/CD4DG9gDnM4Ps2xM+pqA@vger.kernel.org
X-Gm-Message-State: AFq9FYKn8JPGppkFlj/iOK64qmMo2I0WdhEOGX5CX0uBgffPFMjJkliv
	xEUjiI55YD4Sej1+ibe2U+YgNTDL6QShXi3chsrKJbPMJaIuimL7Faa6jALCRqrzuu0LIavJuYl
	28PDhp0gxYF0dUlGRBu5P2RlD3PhqsNH4Vu9+xZjYgLAep8zJZ0+4S174psUZ/nola3aY
X-Gm-Gg: AYBFou02BPCy0JZqRGJ7vuYsO5vIyKahZ7DjGaV5FjeAE/BGJlrG/C9mC+wptUjz9T8
	pEkXle0PtXPBOxhq62ImLk4YL62+d/TSEW3Lo/e5p8gVwTcg74Vl+drneG2j8YAQzpOkmvXyLKC
	1e/j4mjKOeugCmPV9PzkjWrAAtTkjeryo54R5LaeoIP1RuTQzoumUgLemC621BV+T3dizSs3fbh
	9VQ0JCurcjYrx+b3Ylu4+Jh3jaEDfoUIZ3thIxjzS9rvnY8+6HUWVBycyi4bHSAEHsp1/SMtDvi
	Qkl1CiiY25mzufumw7311/uUv/O42i2oWDUL9SXWhvDNitzcU6M6QqZYqCxzwt0/6syoGT2J/G3
	b1rMEs7Rl85YwEbCvK9yz2bRD+QU86bwlhqjgrHnA6Q==
X-Received: by 2002:a05:7300:f48b:b0:356:23dd:3c72 with SMTP id 5a478bee46e88-369d964640dmr1148552eec.4.1792723396667;
        Thu, 22 Oct 2026 19:43:16 -0700 (PDT)
X-Received: by 2002:a05:7300:f48b:b0:356:23dd:3c72 with SMTP id 5a478bee46e88-369d964640dmr1148517eec.4.1792723395966;
        Thu, 22 Oct 2026 19:43:15 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369d9d5e9edsm2090503eec.9.2026.10.22.19.43.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 19:43:15 -0700 (PDT)
Date: Fri, 23 Oct 2026 10:43:11 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: Yingying Tang <yingying.tang@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, ath12k@lists.infradead.org,
        linux-wireless@vger.kernel.org, yintang@qti.qualcomm.com
Subject: Re: [PATCH ath-next] wifi: ath12k: change MAC buffer ring size to
 4096
Message-ID: <atrJv0wgF20tmuDr@QCOM-aGQu4IUr3Y>
References: <20260610031358.2043716-1-yingying.tang@oss.qualcomm.com>
 <atcr70WFLxp8zreK@QCOM-aGQu4IUr3Y>
 <0423c93c-8359-4fd5-9ba0-17e5ed3927dc@oss.qualcomm.com>
 <atnVeGiu9Q07HyUq@QCOM-aGQu4IUr3Y>
 <atoTUgEIfkg6b29U@QCOM-aGQu4IUr3Y>
 <cbfa35c9-cfa5-4eb5-a203-09c9069e3b0b@oss.qualcomm.com>
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
In-Reply-To: <cbfa35c9-cfa5-4eb5-a203-09c9069e3b0b@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAxMCBTYWx0ZWRfX/ehB5IgoHkdb
 /szU0avueYCLojMjGMvlJmauq9uiaF6fBodHdH7UIvnoziIHmJARsssbbZhgN/NJRvlJbHdEjjX
 BK//WOroEiKCpAckNZIt0uw3JUpQJHY=
X-Proofpoint-GUID: MF7HNxybkrVv6H-ypLvDI57gcLzfPpzW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAxMCBTYWx0ZWRfX4GgcwgkSj5Z9
 5lEfDlIeY5gWA8GudWzEW6HxisWtpNnFn7kiIbi+l4D4u8nEjErKnexG4d/94uZ4DVybkwdzcyv
 eOP81ht8pWzcfYJZd0LrZabciIBCYlGSoP+RfnBSMR+2js1HXudG4pu+mI/KAfq0D4VnojALIiC
 ZJeBV54XkBwKs7dvZNJhDpR9KDymaSK2ShzY8E5n9TWw+KfM1M71e+VWgbFeK3es69BhdIoBH3Q
 C+QVRxBrSfIqgQsQ6djMnMjjmFjx485U2iTuD5UUDXvAtIw09+SXVnCKl8wKwzm+OT0HgDa8uw6
 I3+95RMiPGN7VsffWuyisg8HKeZdPmhn1M19lRSFSK8E22GEGgtv/pXOCxFnUZgbvkGqAGmQoQN
 sBh1OkPXFxrqV57MvPMFdkJ8Sb8aZAIM2sADDpVdad/tDnBlwab+3rsV/oO9JtfLajPgiEgCdDc
 dEomqjRaAm6KAh/eDRg==
X-Proofpoint-ORIG-GUID: MF7HNxybkrVv6H-ypLvDI57gcLzfPpzW
X-Authority-Analysis: v=2.4 cv=BdBNQbt2 c=1 sm=1 tr=0 ts=6adac9c5 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=0oYm2DgIxsn4U9MLWVAA:9 a=CjuIK1q_8ugA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230010

On Fri, Oct 23, 2026 at 10:13:18AM +0800, Baochen Qiang wrote:
> On 10/22/2026 9:44 PM, Shawn Guo wrote:

[...]

> > I bisected drivers/net/wireless/ath/ath12k between v7.3 (broken) and
> > the ath tag (working). It lands on:
> > 
> >   15f7603b69a8 ("wifi: ath12k: Increase RXDMA buffer ring size for default memory profile")
> > 
> > The previous commit, 643f0bf93617, still has 4096 entries and is broken.
> > 15f7603b69a8 changes one line, .rxdma_buf_ring_size from 4096 to 8192,
> > and works.
> 
> thanks for sharing this. I can repro it using the 481 firmware once get 15f7603b69a8 reverted.

Thanks for confirming!

> so the rule here seems that rxdma_buf_ring_size must be at least twice as large as
> DP_RX_MAC_BUF_RING_SIZE (I also tries four times large, it works). This rule looks
> reasonable to me, since WCN7850 get twos HW MACs and its firmware setups rx_mac_buf ring
> for each, and each ring fills itself using the buffers all from the single RXDMA buffer ring.
> 
> maybe I should submit a patch mandate this rule.

I'm more concerned about how we would fix the regression for 7.3.x stable
kernel.

Shawn
