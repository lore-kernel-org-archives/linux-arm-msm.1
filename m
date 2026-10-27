Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793062057;
	b=gD9CLNrmy8Rgtnw20RKJx1hS2ngMyEikJqK++OW06eSCu9C1MGgQD1zhnbZACRhQFq0B
	 zDARhSDmO4u4NcAKznzTUFxXvPLvZphLVAbwLRQTOE5wwmCT803H3IOrGo5WVruCRpSDV
	 q1LD2fuF3xVMf4i9DHM0f7WcLh4G1Gekwcdpd5DA6XIWwNBTNdmJg9QUamzNEqFfCMOIS
	 RvM3iSXLyLVZRvbOCjkAe4I6Z2I0nnatmdujgMvN68q1/oPtJS/M0NwE8Z+8pi3FD6M6I
	 dyo2jx54WjP6oSJnznj80y7HlULd3M2NkUVFQr/UnQgsPdnMQHnazbLSdVf0BqVU3kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793062057;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=0JwiV77TZFPsGwYE3NQZqCj2nzgHeX9j4cZirnnqmRo=;
	b=pH+uHhXWrF5d8UyfnRmc6CHA8TWq/FyBwGJqlyZUcptgIX1oB2pe7TNAFY3G4HsjjaRt
	 Hgrpt1+D+DZqF5oFqPfxChUXflCfuTsqrjYSlfg6p/Ap7JNq/a7Vy0JTjhZpYZ+k90BAq
	 zKblkeNgRvuD3jASMXaxddDTJ28FWziye5/cuDMspsV+F4Wtw4k8RGwJcxzXTMkqSddYc
	 ciL1eRPIfsrINM+Yzfxn2u5KRpfgCnMrwv+dK+4IFboLMbjKLmDAIA7LrOXMFCs4kDeRX
	 sbr3Lh3D9874vn3BFxnm9W7E1C4M00R5y488e6uRJTXFvKwO0ff/+8XjgK3HyZLe04Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Y037Lem4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iqoSe4R+;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C9CC606A31B
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 00:47:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C9CC606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Y037Lem4;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iqoSe4R+
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QMPpPl3509329
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 00:47:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0JwiV77TZFPsGwYE3NQZqCj2nzgHeX9j4cZirnnqmRo=; b=Y037Lem4XbcYDRHx
	N7xk1Q+i2uzWcHZApOM30dPCzAuOJPbeqV9T8Ms/lfqgEUJ52nIOXfP6UOGjtbB1
	Nmm2MARYkg5ugoLJ1FrpSrFGmQneQuP+hjMX32bKtGyj5d52kMMrc82Pjm6UFZkC
	6CAeuwQ3v57aUUmILBBDzP9j3atsu4BfmhVHh6RzI31/kGqhhoyXreUBWfgfddLE
	0fZrl31/+9xSyRGpEvmJdfh1qUdpb0gWFLwCZvbyAQccaDCcnUjpqOnZUwIBg6Sw
	12Ui6jCdnkVefJkLiZvCOl1Y4NmLzIei6tI0kH4h58KpbdvQ0AqProqE5W3DCNew
	9TRbEg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj8smt30v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 00:47:35 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3552883bd19so63373eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 17:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793062054; x=1793666854; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0JwiV77TZFPsGwYE3NQZqCj2nzgHeX9j4cZirnnqmRo=;
        b=iqoSe4R+P/k0reXGNEowaRUkKEsrodLNzFHUGjksFK+nUO0zsV8gPA0Az3uTVnZAhq
         3OanKtje9NtorBIpgZMlZ0PPnllcmR098DOdM0q4+KfZAnNOFjmimtdeZBc728KIGjN6
         p1XL+7VH6iS+l1jTATI/eKEPyCeOR/O/cLr2Ed+aHy7Wh8wH5uKyKurBNUQkvqFPcgzY
         +K4Z21+gSV99pCrUgEtdYqwmCSH94dN2sSwL36zLrM+OPjs5wQEvucGUUJANM+/rEpWF
         mhJp3bWrn0FcN8znaPgUOl6lqeYFpsxst5GIJVeQEPH7Ymv4t5JlKcLHCWTKl79Y6BQI
         WQHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793062054; x=1793666854;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0JwiV77TZFPsGwYE3NQZqCj2nzgHeX9j4cZirnnqmRo=;
        b=HYLp06QMQpr9ADSoY90pFKbKNeBBwn5t+FY5rdEUAR8vS8SrdRcwxtWALZ/rvgUzTi
         slOjd8mFl2cP3Vs6uKPUnAPsz0PmHag6XkIymm6gq6d7WSTSPg1slOENWYhkarRnhJtD
         F+4gpdhXNm0jXkWDW2yM4HWXhg+VZorsma/Ny7MBNPWgUpdVDFSWoqdd3saSNdX96fOz
         KLNWWUjVXFHfkYM/8yhtfhMBnHY518tW5ziOG7KnHpZ8ppC1Q6+YRbJIqbC9QMWl59xn
         rk8PHzZCWhcfnfgf10TGzAYMt7mXw5QWbPtNM5ttIgCyPhc7rYuBG+59iUUHt0LTYfj/
         aMzg==
X-Forwarded-Encrypted: i=1; AKwUvBwjLrhzzDmtjg1ZDx2bSW8830yYhblOc7UrU+DWsp/zyE5B5EPJa6ss2/PiTXaOxnDGtQo5LRANfxq7LP2S@vger.kernel.org
X-Gm-Message-State: AFq9FYLAvzdCAIcWp3XrM32F6GtViY2rLSvOTCsO4kP0cmo4RXmJMj/t
	4Iy8Dn7GH7HsN/oiXtuM6R1E1bPMgP54Nn44czMT9DCX4sx4WI/cpEhdr35VXx5c5PDwRSurZHI
	EzlFVIoFU8+UObBL0Fz4PthbsIaKcJtDZTntolslFKVyhOeTsQSWjZ8y/2qNTjddCaeSt
X-Gm-Gg: AYBFou2L2ljNLrKtYLnixOws2ckflXHKYiPIdZ5vtDHbouB5S3Tijh1J3ZD/driF4Ty
	3RSQZgQb7SKSAV+n1v1pWUrktiCw8IMOpf/GxDq+43/TooKRTyI2er6r3/b9j8eQ2wHlb5c5/hV
	aqSoyOFshW/m3rAMY9dCVbVCWcZKLF+IZdexArsI3B/UuAA3nigTdtOocgOQqSz0AGpT00HcTzg
	UguaaVPfl00H7oYTfoF13umabsnY+YlGjSTlv5w1EQxLL1soH1UTI/gL8WldyIaxaLAW8ocBMlM
	xGl2SiGJ+Zz1ClL98g+AU8QH2vY1okZICuOHMGhkj1FSw9qy68F14/4h+NC86W0wi5CXB23oSzC
	EaOIcRrJFF62yKP+3JeTFpY7tNYeoWFnTeUYhqGei1io71oaKUGaMSnVYIw==
X-Received: by 2002:a05:7301:dd89:b0:369:9eea:cd25 with SMTP id 5a478bee46e88-369e842d28dmr12705666eec.7.1793062054221;
        Mon, 26 Oct 2026 17:47:34 -0700 (PDT)
X-Received: by 2002:a05:7301:dd89:b0:369:9eea:cd25 with SMTP id 5a478bee46e88-369e842d28dmr12705631eec.7.1793062053486;
        Mon, 26 Oct 2026 17:47:33 -0700 (PDT)
Received: from [192.168.1.20] (33.sub-75-218-193.myvzw.com. [75.218.193.33])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a01fa4c58sm29144011eec.21.2026.10.26.17.47.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 17:47:33 -0700 (PDT)
Message-ID: <7ada1074-9c84-4708-b5d6-9790b9f6f3c5@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 17:47:31 -0700
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
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: Yingying Tang <yingying.tang@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, ath12k@lists.infradead.org,
        linux-wireless@vger.kernel.org, yintang@qti.qualcomm.com
References: <20260610031358.2043716-1-yingying.tang@oss.qualcomm.com>
 <atcr70WFLxp8zreK@QCOM-aGQu4IUr3Y>
 <0423c93c-8359-4fd5-9ba0-17e5ed3927dc@oss.qualcomm.com>
 <atnVeGiu9Q07HyUq@QCOM-aGQu4IUr3Y> <atoTUgEIfkg6b29U@QCOM-aGQu4IUr3Y>
 <cbfa35c9-cfa5-4eb5-a203-09c9069e3b0b@oss.qualcomm.com>
 <atrJv0wgF20tmuDr@QCOM-aGQu4IUr3Y>
 <38fc5a6d-c019-43bb-98f6-ba6a667c64e1@oss.qualcomm.com>
 <atrYGgGWB_zQIrc1@QCOM-aGQu4IUr3Y>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <atrYGgGWB_zQIrc1@QCOM-aGQu4IUr3Y>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: pEibBIk1A9B4DClYjVifPGZ7FWP7hGiX
X-Authority-Analysis: v=2.4 cv=Sfti5fRu c=1 sm=1 tr=0 ts=6adff4a7 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=AnolQpdaNwb4XK4FG+QP+g==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=0oYm2DgIxsn4U9MLWVAA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: pEibBIk1A9B4DClYjVifPGZ7FWP7hGiX
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDAwMiBTYWx0ZWRfX7WulXtwply4A
 gr+LAQYQgSX2yNMbDOD7JlLKpUixgL04LY4fsBCtcqS37n8oPYbhGq/S06r+5aa9QC/ZiV2yQZL
 FCbAcCh1ErDfwK2Ky6FximYHS2HGUM4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDAwMiBTYWx0ZWRfX8AhiUVUa+HEN
 4ji+8qBPCsoCWn+DjY/PswOhoTYimjEux0UUeVuc/DJaqGpujtmlm3oUDAY1eJHuonTFYdaSvKM
 7uJ9kgScGfSwosO8YkrFZh+e7pPq4MOGPN4sa0GbMJbK2yRZUR7IqHt+jCq3++gfMAhiV5ITxx5
 HvDgZx70jtK71rGJr3/5zZBLz25ejXsaslaiyLbyKZrDyooDrwyNxohRmX7MeHIQbtGK+XvEIT0
 bIVy4yXUyZk9WpyCCZkdgS/stVKLfqyQiBe8xQ/E/D0Mtp400LFEIDAHyjnFWaHmrMmxVHy8VWw
 gRTJcbGjoved/r738R4dDWIwAnvEKxOTDfjlz8BoShSTLZcQjVwMg8TNsUVqRw726/NQ1/v+n46
 qCnAV0eTydilfCs2FPkYYLXCHl7eIl77H3oAxV6xyANpbkeuPsJyoTz12KsbsgYAPwy8smbDF67
 HdtgMqvBOfaX5qipxGw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270002

On 10/22/2026 8:44 PM, Shawn Guo wrote:
> + Jeff
> 
> On Fri, Oct 23, 2026 at 11:13:56AM +0800, Baochen Qiang wrote:
>>
>>
>> On 10/23/2026 10:43 AM, Shawn Guo wrote:
>>> On Fri, Oct 23, 2026 at 10:13:18AM +0800, Baochen Qiang wrote:
>>>> On 10/22/2026 9:44 PM, Shawn Guo wrote:
>>>
>>> [...]
>>>
>>>>> I bisected drivers/net/wireless/ath/ath12k between v7.3 (broken) and
>>>>> the ath tag (working). It lands on:
>>>>>
>>>>>   15f7603b69a8 ("wifi: ath12k: Increase RXDMA buffer ring size for default memory profile")
>>>>>
>>>>> The previous commit, 643f0bf93617, still has 4096 entries and is broken.
>>>>> 15f7603b69a8 changes one line, .rxdma_buf_ring_size from 4096 to 8192,
>>>>> and works.
>>>>
>>>> thanks for sharing this. I can repro it using the 481 firmware once get 15f7603b69a8 reverted.
>>>
>>> Thanks for confirming!
>>>
>>>> so the rule here seems that rxdma_buf_ring_size must be at least twice as large as
>>>> DP_RX_MAC_BUF_RING_SIZE (I also tries four times large, it works). This rule looks
>>>> reasonable to me, since WCN7850 get twos HW MACs and its firmware setups rx_mac_buf ring
>>>> for each, and each ring fills itself using the buffers all from the single RXDMA buffer ring.
>>>>
>>>> maybe I should submit a patch mandate this rule.
>>>
>>> I'm more concerned about how we would fix the regression for 7.3.x stable
>>> kernel.
>>
>> we can try to ask stable team to backport 15f7603b69a8 ?
> 
> Ok, I can do the backport after the commit lands mainline, assuming it's
> part of Jeff's PR for 7.4 merge window.
It's in Linus' tree now
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=15f7603b69a83a0acc7fcc8992ecbea6110f9424

Would obviously need to backport the entire series:
https://lore.kernel.org/all/20261007-mpp_ws-v1-0-739b1fb87d24@oss.qualcomm.com/

/jeff
