Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792720765;
	b=FoabtdHgNUiTA2tzhHAUUAPI2QORCW/zXSSJi9b7ayt8WeDEHcxT7owBEoHHTUggsh5H
	 tdUoI5a9ZjIZcjmOLpVs88z1ftqjaeW7DSYnr8eT8Pemh6OSct21j5blaeDCqrTpU02k0
	 dRRpZkK2AnOnTJgk35Md804/zVYCGqrdUs6L/V+RdAn0aQz/NKaEL4wgw5MwhjVPAWLL0
	 +RTCP55k8bHgN7/e9rMyRHX5bn370UVkuIjnIzon8fjWrZJe37FfLehVza0fNbmEjkJab
	 cJNV/sF8sH2idObvQXjIA/LKtei+B4bEBvy7yodvefBg9CILxFOYYOa7gI81+m23vgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792720765;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=wwCEH3UMjVWNpdZ/sPhfjcy7DLhx96UCaz7JYkCEV30=;
	b=Gs1u21VKV1ra/71Vl1xG5k4MncxcWHoQxPcdlON9Zcs9V6LCiRtAl/VchVX548OgwZqH
	 733+y9/T3wdNY5UR/bzMaK2nSnQVqkl/JWrhZHWmad4E5+JVwq/s3VKGRWmxC8i2WCa8H
	 nIDro91soT1TgqmT1kInh4MKt/Ph+pfZ4Hpf1AWdE04PUG8yzFmfjhJi3o0QnCM10IJgb
	 86T1FoQPOHvobWqSITX5C5WzwA+XdWNclt5ZxHXDZJ3L9SiIH9GdDsFrH09jaJLZbSPaA
	 GHSUhWKYf6IpAcLKvN1HO5gSldYhgJL2f81KtjZDU4W3x3q4MWUPGfnYN1LDDbXXsmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XAIVzq3Y;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YS2FxfCZ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1913606A320
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 01:59:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1913606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XAIVzq3Y;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YS2FxfCZ
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N1Ex271868181
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 01:59:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wwCEH3UMjVWNpdZ/sPhfjcy7DLhx96UCaz7JYkCEV30=; b=XAIVzq3Ypb2t5gbB
	JNSjrpFOj0OeSlSy1sTvXDFdbHyZcTYl1ePCaYYNHt4upOcl9B0fDV5OUpCSvNpI
	8P6UQVicjM3weO5GFr66C6lL1XSuHcL8mp3+AkqH2hHhzYlBrpPbDQekw1oDBHId
	9TxzYE2SOOUtL+2wvA3CMHLP17T28F1HyEzvHNsXEOM/3wOzDnilq/be6wZ7yidZ
	/mxUrqfnDBjwDsKLCEYwmsQF13C3Jp93WBo2bODYq/RTCB7MD/rFDyZ+qYtNp5mc
	jU5QP5lsb0n//LDhpOiNrVoajbCZJ2nsbPzJeJlsr/uJqb9qUcHmNxNwWA4nn1a1
	x0W+pQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmj9e8h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 01:59:22 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ab2395f104so367765a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 18:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792720762; x=1793325562; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wwCEH3UMjVWNpdZ/sPhfjcy7DLhx96UCaz7JYkCEV30=;
        b=YS2FxfCZCzIEGqHGuEosMsXkrKxP2BAKGiMX2sTL580WfDSRIGPTRaIhDXLK2PPfot
         i/hJNYqAsei1AlRUh1wAWB9oXbk21fy2IYblnC1crEQkrBwRVn0X35bDo31j45+R2XV2
         EEcYKo4yicjayUiMOP+4ZlC31wA3NrbzqyXiE2rsCx4CAXpuk+9MF6WkgGu5S41vi/QI
         JC99t2iOxA/ih0dMg2wf9t9lEKXZ/nJ/AtKRgprBIhtJIRiWOnT3QsDIiAoWgYmGTuiF
         7g5CY5Te6rZUhDlzXAA8w2YJSuXaauxU2u4FE44XKbmFlvu0r8RFNJGfksj5Q3djp+lh
         bq9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792720762; x=1793325562;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wwCEH3UMjVWNpdZ/sPhfjcy7DLhx96UCaz7JYkCEV30=;
        b=G5gzJHa2uRzBJNSY6QvqpigQmd3TDWOta/W4A8ICRvqRdft2Aiw/h53diDqYUmv2Fy
         WM47jOw4hcfKxnqZoFs2Ca7E32Le0cIiKBt16ygK2vYBgw3xwppCLUnFegepSOL3kMfv
         Hu+sgecygK/C+MXMLzBC9cmRXQwT64nyfNgMuPY+gnyP7hNFOGAEgZoRqNGQWHPPdw+L
         kvShEKLAeI9iFp9XQT9CXWVYpBP0kSfTx1Y7NSok0E7D+NTZzNbuKQtFyvy+wb2nbufN
         f1MFoDLoSPbiBbADuYy6R5xktUvbpKRfqJeTQI76bctm4wajeoW1viyDoMKOsZAAQP6J
         OrUA==
X-Forwarded-Encrypted: i=1; AKwUvBzm59RYFRLWFYuBqHxEhpQ/ZKnsG2/4spuE2ipq0O+WOEgRPQ4Kt2hqBD87x0SGmkUP+QYwyxVcYUCkCemX@vger.kernel.org
X-Gm-Message-State: AFq9FYI0hoUa8NHW46wgFdRuSjiJf2lBUDZy8u7zEle2g2ohsKce5cEA
	tVhEHZ+YHeygKY3JDV9pI1yBh4eerkjRyPgzf74O8ZM1NJ6Ry3JGiPh4951L3pQoQXQqrYJcT0l
	gHQZhNfg4288iJsCNNSyxAfa+NW2AltaEPiMMB5LEB2S/t56+UTqOMXFi8esydsKyRoGb
X-Gm-Gg: AYBFou1k/F4D11Pu55l2vlVRcSN1Xnaan1ljjlgnwAPv19+shaU7ORCwLdSKx/anY2J
	LgL9hEFp5naySx0LLVvyYFpDdNrypvAZ0xKKAtg0ZhNABmgnoi5VPNFTxzifGZsl3FFAVybjEav
	TFzjfRuUyBMEzlFMYNUQNaS2+YuBjzwRfrW4GuGhsQfV6XLH4wqbCMDanf4PQNPhHHqh8mYURVx
	mAFuXjw1KfohOXjwNpAT5bYdS0EhkkqkmMe7JHNWXyw9FsfFomJCZXUBLXxUtdxnSHZYDvHgbbw
	FtOBSfEZBIhmPsZahVcp35/f4EGK5j8jJW3WLwdlK4j2DubwYDycXPjDKMFJwrmiBk+kIff2ZQw
	ZvG6+GfNGlXeaBaBWAU887nXGGZJYfDXk1x0gtajJxqCTXRCVcgevcxajYtSCzy0y4u58XeI5DA
	==
X-Received: by 2002:a17:90a:dfcc:b0:3aa:fc22:8aa7 with SMTP id 98e67ed59e1d1-3adce7c7897mr585319a91.53.1792720761517;
        Thu, 22 Oct 2026 18:59:21 -0700 (PDT)
X-Received: by 2002:a17:90a:dfcc:b0:3aa:fc22:8aa7 with SMTP id 98e67ed59e1d1-3adce7c7897mr585307a91.53.1792720760990;
        Thu, 22 Oct 2026 18:59:20 -0700 (PDT)
Received: from [10.133.33.125] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adcb1f93e0sm1232848a91.15.2026.10.22.18.59.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 18:59:20 -0700 (PDT)
Message-ID: <4fb7840a-27af-483c-927d-f99d33be334b@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 09:59:17 +0800
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: change MAC buffer ring size to
 4096
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Yingying Tang <yingying.tang@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, ath12k@lists.infradead.org,
        linux-wireless@vger.kernel.org, yintang@qti.qualcomm.com
References: <20260610031358.2043716-1-yingying.tang@oss.qualcomm.com>
 <atcr70WFLxp8zreK@QCOM-aGQu4IUr3Y>
 <0423c93c-8359-4fd5-9ba0-17e5ed3927dc@oss.qualcomm.com>
 <atnVeGiu9Q07HyUq@QCOM-aGQu4IUr3Y>
 <0d5d36ae-3d65-4dec-98cd-7409ba4180c2@oss.qualcomm.com>
 <atoRzGmURyjFcH7Y@QCOM-aGQu4IUr3Y>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <atoRzGmURyjFcH7Y@QCOM-aGQu4IUr3Y>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: XQD1Tv0PNShaXSttnDqEjt45dCQxZL5y
X-Authority-Analysis: v=2.4 cv=cPR1IVeN c=1 sm=1 tr=0 ts=6adabf7a cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=RU906sw5RCHCpFq9C6YA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAwNyBTYWx0ZWRfX7/VfwEWEJy5a
 lqt2q9/vqevZaq6EUOiB4MdpoQqbbh7isYZmunFKi3iouX31y1PaFxO3jjm9Nz+dXaPNtDSaAlg
 yCFP/CQr6f0crAq6k/1FaKuGetUJRjo=
X-Proofpoint-ORIG-GUID: XQD1Tv0PNShaXSttnDqEjt45dCQxZL5y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAwNyBTYWx0ZWRfX9WIAG5sd+elq
 XyBoINtTCHSDf7ifXrAmlFCV+bUg5AvJ90Vi9OORuDkAkhzIjYqmpcHVZIfbu/Mcn4tjPROtWoN
 KEcTpEgHrZTlsAYHns0TdqDwAP6sRLwwleuHq6Q0CETaH7+769HynGjWfWDoGsAetvkubZEbw1l
 LKbUkRrvrSyKleW8MAzuwUojolwJ8ZvwFO2O533wB1Nvnr5RUlsBksJw+Q2/ag/W3ylrR80VfvR
 fsB01XtjQG13nx/i2Ojxn+egDiA+jDw/IR3N4sqsi0xLe+v88V57BbUlTHNincjum6yK4j0ylDl
 hvfcLTo7Tb9NHsNZWa4MYqIUC5O37jOVFLb+y5fjJiiwlacvPRmJrdk7I3tW5B/NbJRt3UuZQVY
 nTXAxu8x2l2OFQAQ5lz39kjIkcrxcSkaPAUh+yokiNR5WKxEOKZwJtLfC8vd1LSJrMeJFpzyGvr
 VGerAcBB8f6Wl0ukynQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230007



On 10/22/2026 9:38 PM, Shawn Guo wrote:
> On Thu, Oct 22, 2026 at 07:00:31PM +0800, Baochen Qiang wrote:
>>
>>
>> On 10/22/2026 5:20 PM, Shawn Guo wrote:
>>> On Thu, Oct 22, 2026 at 10:30:45AM +0800, Baochen Qiang wrote:
>>>>
>>>>
>>>> On 10/20/2026 4:53 PM, Shawn Guo wrote:
>>>>> + linux-arm-msm
>>>>>
>>>>> On Tue, Jun 09, 2026 at 08:13:58PM -0700, Yingying Tang wrote:
>>>>>> For WCN7850, MAC buffer ring size is updated to 2048 in
>>>>>> 955df16f2a4c3 ("wifi: ath12k: change MAC buffer ring size to 2048")
>>>>>> to increase peak throughput.
>>>>>>
>>>>>> But during the RX process, a phenomenon can still be observed where
>>>>>> the throughput drops by about 30% from its peak value and then recovers,
>>>>>> and this behavior repeats during RX.
>>>>>>
>>>>>> After increasing MAC buffer ring size to 4096, the data rate drop has
>>>>>> gone.
>>>>>>
>>>>>> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3
>>>>>>
>>>>>> Signed-off-by: Yingying Tang <yingying.tang@oss.qualcomm.com>
>>>>>
>>>>> FYI, in case someone else runs into this: with this change (merged in
>>>>> v7.3), WiFi on my Lenovo Yoga Slim 7x (X1E80100, WCN7850 hw2.0) stopped
>>>>> working with the older firmware that Debian trixie still ships
>>>>> (firmware-atheros 20250410-2):
>>>>>
>>>>>   WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
>>>>>
>>>>> Probe and firmware download succeed, but every WMI command times out
>>>>> once the interface is brought up:
>>>>>
>>>>>   ath12k_wifi7_pci 0004:01:00.0: wmi command 16387 timeout
>>>>>   ath12k_wifi7_pci 0004:01:00.0: failed to send WMI_PDEV_SET_PARAM cmd
>>>>>   ath12k_wifi7_pci 0004:01:00.0: failed to enable PMF QOS: -11
>>>>>   ath12k_wifi7_pci 0004:01:00.0: fail to start mac operations in pdev idx 0 ret -11
>>>>>
>>>>> Bisecting ath12k between v7.2 and v7.3 lands on this commit, and
>>>>> reverting it on v7.3 brings WiFi back with the old firmware.
>>>>>
>>>>> Unmodified v7.3 works fine after updating to the current linux-firmware
>>>>> image:
>>>>>
>>>>>   WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
>>>>>
>>>>> On Debian trixie that one is available from trixie-backports
>>>>> (firmware-atheros 20260916-1~bpo13+1).
>>>>>
>>>>> So nothing needs fixing on the driver side. I'm just leaving this here
>>>>> so that anyone who sees "wmi command ... timeout" on WCN7850 after a
>>>>> kernel upgrade knows to update the firmware first.
>>>>
>>>> Hi Shawn, thanks for reporting this. I just had a quick test
>>>> WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3 with the latest ath tree
>>>> (ath-202610191908), everything looks good, simple connection and ping pass, I don't see
>>>> any ath12k warning.
>>>>
>>>> The firmware images I am using comes from the first commit adding WCN7850 firmware:
>>>>
>>>> 	fb04a7f4b750 ("ath12k: add new driver and firmware for WCN7850")
>>>>
>>>> and the md5 values are:
>>>>
>>>> linux-firmware/ath12k/WCN7850/hw2.0$ md5sum ./*
>>>> d3750b67b1013fe82358d0538fb131b0  ./amss.bin
>>>> c79c410d585360000c0490f16fda43e2  ./board-2.bin
>>>> 73056f1d2aff886ce9bff313f455e963  ./m3.bin
>>>> d0ee61498bf1a205147cdbcf645391e7  ./Notice.txt
>>>>
>>>> can you share the md5 values of your images?
>>>
>>> Hi Baochen,
>>>
>>> Here are md5 values of the old firmware shipped by trixie firmware-atheros
>>> 20250410-2.
>>>
>>> $ md5sum /lib/firmware/ath12k/WCN7850/hw2.0/*
>>> d3750b67b1013fe82358d0538fb131b0  /lib/firmware/ath12k/WCN7850/hw2.0/amss.bin
>>> 5dacdfbe6c3c25d9e0605be8a9f1f6e4  /lib/firmware/ath12k/WCN7850/hw2.0/board-2.bin
>>
>> this is different from mine, can you try mine?
> 
> Are you sure this board file works for my Lenovo Yoga Slim 7x laptop?

actually not, my board-2.bin may lack the BDF for your machine
