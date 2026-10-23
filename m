Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792730536;
	b=JhCco+r7gnwRVumNbDf42pgx5R7n0U4oNvxqyJH+NLlLinh+rSx4XwZakbM6OLD2Bgbi
	 b7xvrCBp6V13K9cUWoXf6ZUFPIaUTn8pHJiFxj3z9nIsuz1xhyPKFrfuR/FQ0L+6J47mt
	 Vh3F2OOT11eNUrBBSdA+r2D5rrm6+SzD0iHvm5fwklucyyKIn2t0ZQPFE5s7dDESy7P/C
	 h5uzEr+n/XA5E7trrDqQbSpjDkFnD0CriM2GzpaVMby+zQUm8chJwpBZVSUHu7V0TDkqV
	 1VJ8ewpVGaWeK3gvXWOAYBvcrVvPmVsr9MnWJRjbNWVtF3flF5zwgvmdoUF9cvCOOrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792730536;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=lUCDU9lFfVuOMh+Kt/eYlre5SnQJD9k+JA/X7y4mPTw=;
	b=xK58YPCb0GmLJx5+E02Pne8Cmk2cLuLWGhlmdgphDviJa/cXNvBNfY46UNRPKcoksMBI
	 EREynQ12ckSJ/OwaLBQfIlAp/zGopuFd06/k9nXT7vNx66hYcMZVNYWdyUPzA/v+r+ppO
	 C9/fZzL7ZrHTx3jFGSJLF9StDdcwActftl1iDekG5K63gFNdq0inALTTQUZM43/5r2rzr
	 TMLsZ/D2qdNNnca1+9vY15wKiiBfa5qpsU3Gc7FLLJ05weNP1xe3x6DE8HA3by1wvCkA2
	 zbiupPLyFiEVcaXl6bkZJbDMMv19Mk5a6lxtIvCboGiIEi15+LEhdPjBsWNlJFZzoyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bmVNkx5h;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FLGYaryR;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB379606A319
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 04:42:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB379606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bmVNkx5h;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FLGYaryR
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N1F0Rh267686
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 04:42:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lUCDU9lFfVuOMh+Kt/eYlre5SnQJD9k+JA/X7y4mPTw=; b=bmVNkx5ht5WdX0GO
	kS1R2BbLYVM3oerFlqW5Ikhz74kOpupOXPOXKOB6l/8Rl4NOa6L/vMtYO0p+sUBi
	D039qjgaGaTQ56DSLQE3BRT+0C7/yd7LhC8cfR/ABqUS05JHENnBJpV9AsGOFxxc
	b6T+FqF/EZIu0YPvvDLsPq/SExkfqc+ci/af7ef9Mo/WEhREb4zjhBR1HOGsSI9c
	dc9BFTF6ZobfYMo3KJtv3hdcsb1HzTcvWnYdDiYAXHzMaCjsbmEpdsHT1Rwsm9oW
	Pqi/iC9D1hH2LyNQa5F0MWjIJq+6CSPQQCpioj38OPbSb3LQS6LfHswp4bEbu8/1
	319mMg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmbhxg2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 04:42:14 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e93f266d20so7350665ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 21:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792730534; x=1793335334; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lUCDU9lFfVuOMh+Kt/eYlre5SnQJD9k+JA/X7y4mPTw=;
        b=FLGYaryRXykIiNMJSadKx05v4itqylhfmMOrTcBIyvVIsbYtPK5lb3UhkowA7U5hI8
         +qOq0I+7kxL3EUbW+sCrnY3zcuLQVzw3jEjhE2MF1AiHvttoDXCS03bN+2nl6oQe0EWr
         x0OisPFJsTZ4fWtbST/A77Ex18iHvSfB1AdXdp+rPKW2livrS/8MAoZdK2oEvaHgk95G
         oUW6OkiX2pBOCOYn4EMbuo6tY1QWroJE19ArPkNfvgjLMVvhSvJP80CG9qnqd30ACone
         DsvjzoW69lYcre5LeXOhnE+50T+F911Zn//0FXSvewD3LI6Qe6ZoW2qMdE7S8h9U1gQR
         +GRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792730534; x=1793335334;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lUCDU9lFfVuOMh+Kt/eYlre5SnQJD9k+JA/X7y4mPTw=;
        b=Fp7IWOY6xXqnHBOwZqjGdzgIpTKCv2Xm2FGPgLoWZzlHA66pr9w3YWGn8HI439qNun
         dp04aejOhQ3jsFfPmrx1BWQGQAH+K7a0NERejE6a/IwbZiAiTQV8b0BZmOp6BLuq2RIs
         Gxf2tD4X2I+4JfyVQjnGBxolmw4ZGFM5TMnV0zhbfhtKrf6/C/X5KUrfqP22JKItsAk/
         AEGhoFZ3r4ULKqMo05XN8M/0JB+nXKIPWMhrcYXHiRAPnSvU7g/SMF3bzKJ+SVDnflS6
         SszBrWltl86tWpo0ijY351zRRYdsZGMzvnfFs2q9DNNH0EHyFZIeYTagELtA9vTReNsn
         LJNQ==
X-Forwarded-Encrypted: i=1; AKwUvBw1qhxcY9XltLsE9L/t7C8Hty5PmsLBX87kAIvQCLnSM+68bUJ5odWw6rPs36pYXBqnJMwIMLzKqumEiv2I@vger.kernel.org
X-Gm-Message-State: AFq9FYIFfJ0rdVhHdN6vlL5uwBtXMKjPQ4hX7UK89BXjNDj9I8lsg9+4
	Sb4iOj0rdpfAgvlkddr2xcBXaNzhtkBmVDypRcKA/1izXJGIAUGb+/Ym4HyNACAr1z9SZd1wBao
	g0qI1/xClRKr7nsrLZSI4tdnDeabcyHU3/c3GQpirP/Xvf4vnhIJqkQzVr1dOEmJNunE0
X-Gm-Gg: AYBFou14aR+0yAdKczYKEXj0PfLCOEwiK8X+X0GH4G1vwQn3umifgbOAvOYDSMpEdS0
	vYHqlZ40fzedzxaK+xKqlnh9UmUM79Z1AdeqS3GqpBYgWN1Lkzek98kylixjWqeMXCeqziGewAJ
	NxzOwtm1ysB2L7SL5x+Y6dG3Y6XmlI8jcqik0oTJot7SA5HiOiuRsx14n1iGJNo9byCtmCzlYMX
	X9UDG+zi26hcXzQ8Eqc8tVJNrAOS/96CT0v1CizorC4kxBThOmU83KdZuoq8KaoanISVN5h0kiZ
	O5fYoQ7vcmRQh08vhnhYpehkPZp3uif/2vTsB1MhPRLuS1cYp9Zi5AvDLQo+5lU0pbznjFtivHu
	JVSyueRoKZ0BybmL1WB9qjXkjyHthtEwqTs+DI3bz5Sptgz3zXUu5yNTDfbXZ21I2IK0TdYYI
X-Received: by 2002:a17:903:1b48:b0:2e3:598:75b8 with SMTP id d9443c01a7336-2ea7cfb86e7mr10901245ad.27.1792730533674;
        Thu, 22 Oct 2026 21:42:13 -0700 (PDT)
X-Received: by 2002:a17:903:1b48:b0:2e3:598:75b8 with SMTP id d9443c01a7336-2ea7cfb86e7mr10901065ad.27.1792730533227;
        Thu, 22 Oct 2026 21:42:13 -0700 (PDT)
Received: from [10.133.33.125] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea7b3bad94sm4880885ad.49.2026.10.22.21.42.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 21:42:12 -0700 (PDT)
Message-ID: <76d4ee42-c8da-485d-9623-6f65a19b0c58@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 12:42:08 +0800
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
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
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
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <atrYGgGWB_zQIrc1@QCOM-aGQu4IUr3Y>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAxOCBTYWx0ZWRfX03Gs1G/wdOdw
 uXuW8IR6cQ6mMHmUIqjF7D3B7H+rh0KlYh/Z2NxbcCqTgqamgXr8xrPnM1iQvjO/CPxHjwPvTAk
 JvecKyGSWi7vsWEcEBb75vnkBtkYmRI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAxOCBTYWx0ZWRfX3PgNqbuX7jQy
 /bgIgndU9YD4vXtpNvKEwjeCBrqEo8Xmy6apX+Ph4OR9DjuIr2YFvA99VnMah6as2S0rHVijLRk
 uR+oRCJIw2mZ2x5yPXlL6h1GUreL7oobJrnFcJu9YRwDXUPKBDlF5m0rn6ffm2SaldFtCdAPn05
 mRrmh/zfzrvniYwel+DsQI30myisig2qvyBz7kRZWhp9QYyc6ZhwXkXfsTsXgu0nt8yjtH8Ef4O
 74Qrs3aklEPjAP/ssbjE8pvNxBCwrveq3dZPWNJMMQPiDhCkogzMTCh/9RpdhjFcNZbUF0V7WkE
 u0Xgf52KUJvgYACYEqCQqV7WKHZCWxPnO3mYAOTPVD4t+HENSkNQ5gJ2Epb4bDBgnnybAn6WBI8
 02m9MAas8gMiHMvuGqsHYxPs7AZWOIC/MwQA9+Vj6bhHQqHdQIqfCUeiceT41aSMe37mXCxegwO
 Kis6b6Hg8ZdNjZir/ew==
X-Proofpoint-ORIG-GUID: 5otfFXBA5KdrmaugKclfuD6RHNVq-PYj
X-Authority-Analysis: v=2.4 cv=Nt1E4MdJ c=1 sm=1 tr=0 ts=6adae5a6 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=0oYm2DgIxsn4U9MLWVAA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: 5otfFXBA5KdrmaugKclfuD6RHNVq-PYj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230018



On 10/23/2026 11:44 AM, Shawn Guo wrote:
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
> 
> Shawn

Thank you Shawn!

