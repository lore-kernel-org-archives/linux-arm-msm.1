Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795605839;
	b=ReANWWvO/gTjFOO/nad8KnyITraHf2NsE7i3Bsts8DIX/xYOD7Zo7OPI6SumXq0lg7rL
	 qlVPn/2ERgese6T9qsa22a6GEdY/eTJPpQkVfE50od1+O7mPzOsNcCBICiUqgTIPuyoR9
	 /V6JkxnMPX4B3itFzFHIAZKXcBFZFrSG2oGP8jQRKHem4zLtgK05kf2FmdSlaxmXfaOcm
	 bhwvtsb0gQMPjbW4LyYQYiv1ryC9R6lwurL06tDZ871S5lSwzyJ9+zrkgRsfSfss37vEH
	 ekk5Kn4dnbreogxc5R1dIxpj+eKISUKhB0SFCABq0FJLVb2NOuDH5//T7f2CLoxxHXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795605839;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ZqyE+XGTWOgC2A3mi7+hrJBzXMkQ44TzEigxTeE2xT8=;
	b=bxCSgU8zqo/iFm09vD36N73p9KP9HfxqCbnZF3/vBcCM5JHcTXjHdtlyu26a1ZCVkGlt
	 ovF1TwiH/AI1489pF8Qn1BRKVJmMwTy9Q5ib8HA+rOxEMxRW59B84OOFYN6o3o5NXGnbd
	 CquvCPUikozccWu9TPVbpblMJrFuUrAH72Qqu50Z/vlmVF2OyUZ1+snJCeUWDpmQ9B4kl
	 ybSM1L6Ac5LRDD5aZHALZFj6aFTn4iEOTXGT/H/FtrJrEUWlwh01ezyhcKupGS13uq3x8
	 8EgWipd+/fBzQXgPzEC9xdfN2/sGkoyGniZtdfhx8oL3Wbu0SQXsMHpqYvWbwjG0xOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nL4ewuhA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ia+BShyl;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E807606A32D
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 11:23:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E807606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nL4ewuhA;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ia+BShyl
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mSKt3764057
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 11:23:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZqyE+XGTWOgC2A3mi7+hrJBzXMkQ44TzEigxTeE2xT8=; b=nL4ewuhAv9oyScHu
	e+ClnbT2414Iwn52QoUbnT9u3D32UAd3+XVCe7sMMh3E9BzW+1yWdSu8tiDiLWmv
	uWG1EbsKKI8BR8XwdHpEXv7Jw5v//8kau8jr070/U8W2A7Y51dGPcg4ZuMVvfpxf
	j4r0mfzBhizlcq3EVt7ZgupJQxCwmORBLrvEDVBnI0PppaiFLcQgGQ4d6eX3VQN8
	1hTKMShfesk98FYX0kkpmQt8YEhW/Cx2ormbw6NjFHpGfWRVAy4rgDZRPp/bMiMV
	/I2HNIkL+EYjujndRxemOMqUajJZrdkWp/CUsYBlctWD6/1IamvhDsurGokb80JQ
	cFzugg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vv2rhkw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 11:23:58 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cdea3a64d1bso1364597a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 03:23:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795605837; x=1796210637; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZqyE+XGTWOgC2A3mi7+hrJBzXMkQ44TzEigxTeE2xT8=;
        b=ia+BShylIKbIPCrYOM1gtCiA7ht57v6tLSiguVvK21cFPrItLN6NulzPhovkB8RLu0
         D6PXlgze7CgGYsCyjjxuzAvMgBZAXnjcxtmU57q/Jlo7cO5ElY9QzIxXqn+zbuyTSqUz
         XLlLGjfmPTrOPTlm7sT4mNUWLCNAPNAbqyaBuFjNjKCKe5UqOa6EFiM9UBod6/CVUXeU
         ToYMcaa0QDZuC/uJIMkCGH+YAd89XP57mm3ZoaaKh6oGU9tcLUl3a7ZszKkO77Z0KU75
         1y17DuKnlWfiwwZvZjJv4j6t81VxEwhLJx1HXrasxrjZaaAjtrmymlF0EhypttiZsmdc
         VA4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795605837; x=1796210637;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZqyE+XGTWOgC2A3mi7+hrJBzXMkQ44TzEigxTeE2xT8=;
        b=aSXEzVv33XcPX2ts7tvAzRytoWujZRdRe8DFwJcD/1vymcpmBieJf6cO6XdrX96/Co
         HaqJ09cgNusuXPgCcUqfKBbPNfeNs0aBaVKhmZKS5yj7tbmQRJxaAyZLJwHTzOybGaHs
         Tdnjqtt/ViQhM9KwwxQaLXuG9qRp8hhOYu46tdy4COFeTPIQ6ydtlORKZYq7HHEGadnJ
         mhYcX9xOHvUPYAfaUanXnAlV6ss582W1+0KJlvqd+rqJvg8KK0v2TR+encRkt60w8u6W
         ATqT+9BAwuSyj0OrusXTpapcwdqYqYt6CguAuIxwQEdbq7VWruKfZh6wmlJrYp2CWgL8
         LhTQ==
X-Forwarded-Encrypted: i=1; AL+hErFFOzvEqBOEpHDMjPBTjgE77H085128/NgRq8D8dHyLMPrHb0AJT1zcJlCUHs2FiGg3sSbHyrPrditA2HVE@vger.kernel.org
X-Gm-Message-State: APuU4Z/2amK1Kb+PazwGVQl5ZYZcXy8zhEFJuDVPG+DrxwhQg8X6udpR
	XKlaGN0zJuAsEcIYEoG7nwwKXKHBdCQJuniNidDTT+b+ui9fGsWQ2a8ytsSYkF7Erljylr+DHDh
	vTfFReyWOazAbHDMEMhBpw+r2HQi28kCI5EbQqm4hff5ETRAsIlCJ50rABF8VT3ILf7Jr
X-Gm-Gg: AZFdTZejzeDi7VZUGJsv7iRoDj3mBziIz4ZyqWCsAo4qBWYqSsCiFg3Azf3FzmpzA/i
	9l786blr6yDEoBF8uqARpoJJ73KlI94PYYe6OnkxjdLL1e5r7o1OfCh4sH3NDisasa6mXOuz8HX
	P6D9SZO2sjP+5Q3q4be3zYsnwHlb41xhJOgZYvy7vKmf3tOA0QYKqgmRgMi9DfuxO/D05Xaq0uw
	+jPz3NpwpYUNcTk0M81FOGAyboPu9YH1ko10vwSRdHSZuRAyhLwRamrm78igmTE3qEo814Mp16k
	A1wGi2boJqwcqfpUNa0OugadqLnqgqKWXfds9EMHnF2v+WM6VnXYb8NR2ca8sg3hdWbRlWSJ6t1
	md+75b3cVsr0GGqXpYp6feOE9BWUsCQBz23FkLC0+CKJe+1FZWkqN9se2uq8vurTRWQa7loqVk4
	DNwRX6yo/5w7ElYTZOpPvxDxe71jFav5neBTUw40EnfnMSemLNAWJc8ajiT5SsH6e5xg==
X-Received: by 2002:a17:90b:388c:b0:3ac:e6a:1b2b with SMTP id 98e67ed59e1d1-3b41c5585femr17326635a91.0.1795605837186;
        Wed, 25 Nov 2026 03:23:57 -0800 (PST)
X-Received: by 2002:a17:90b:388c:b0:3ac:e6a:1b2b with SMTP id 98e67ed59e1d1-3b41c5585femr17326617a91.0.1795605836738;
        Wed, 25 Nov 2026 03:23:56 -0800 (PST)
Received: from [10.79.116.36] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0a34asm26985027a91.3.2026.11.25.03.23.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 03:23:56 -0800 (PST)
Message-ID: <6493f02a-5880-4245-86f4-1e1bf00da017@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 16:53:50 +0530
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
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: qcom: Add qcom,remote-owned for
 ownership update
To: Linus Walleij <linusw@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Prasad Sodagudi <quic_psodagud@quicinc.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261106-egpio_fix-v1-0-569d220a4748@oss.qualcomm.com>
 <20261106-egpio_fix-v1-1-569d220a4748@oss.qualcomm.com>
 <20261110-modest-significant-ostrich-8dd408@quoll>
 <CAD++jLkpFWWSV55LkhAa4YfckDvzB6PrHWugX0Mth=cQRYkMDg@mail.gmail.com>
Content-Language: en-US
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
In-Reply-To: <CAD++jLkpFWWSV55LkhAa4YfckDvzB6PrHWugX0Mth=cQRYkMDg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0NSBTYWx0ZWRfX0ZreVOpl4b6X
 pxMz+RfYugtj2RG/uET+HkE8pKDElJlgI6dW2aJFFr6L53/prTXc4YVSgcjfSoNiNePGCL9Rq17
 eMdKjxySLZoDuEhYVKqd4Qdr71PhQak=
X-Proofpoint-GUID: jtMf6PHWVNP2N-9El3zZOtv75IXjrROU
X-Proofpoint-ORIG-GUID: jtMf6PHWVNP2N-9El3zZOtv75IXjrROU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0NSBTYWx0ZWRfX7kZy/h1lo6/M
 7ZtiRagyr0tVRt3RXGeIyHSwV/9U8p5XmRobYCaSwJxf/NC7m2N0SaIPWbJjJAUsAlO2SJruLXA
 mAEqF6HnU5yPnki4i3GWfnXEfMHd+Eum/xm/H5HFZxSXwJiHJAK2MM6WNNjTJZ/x1L73lwgMlRu
 XZN3CfVq2TPs9GaIxAVz1HdJcyecMY8F3Jo//O3G3OLP4wZL+WZkiAd09772DSe3W55zjvRXjTa
 AoiYvSmnkgPnypI+VLeszD2Wdl9Nmkd+c98brOdyzjTl0ivin7JEt7DoiY6MKHYJB7iZCK6Ehgt
 jZfcIZ+ESdNCp6i/dZOQbb18OxIRYwJE0ayCcMoQl8B6F5ueVtYOq5W9gvArtxUcVMbaNSTkjvZ
 Yc5OSm760+V63HweWmzoLXUiKtMwPzHVCrCND/1Uj52w+9zjyIASiNXE7ChDYipWeXZhbV++nop
 E5zvbIT0/cdR6dJmVpQ==
X-Authority-Analysis: v=2.4 cv=A/z5rKWG c=1 sm=1 tr=0 ts=6b06c54e cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=oGwIKRxBBWau_mrDdCwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611250045

On 11/22/2026 2:16 AM, Linus Walleij wrote:
> On Tue, Nov 10, 2026 at 2:28 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>> On Fri, Nov 06, 2026 at 01:29:41PM +0530, Pankaj Patil wrote:
> 
>>> Add "qcom,remote-owned" boolean flag for egpio capable pins since they can
>>> be owned by remote island io independently of the selected mux function
>>> even if function is non-egpio.
>>>
>>> Presently egpio is treated as a mux function level decision where as
>>> hardware programming guide(hpg) specifies it as pin conf level decision
>>> i.e setting egpio bit is independent of selected mux function, the
>>> driver/apps claims the ownership of the pin if it's egpio capable in
>>> case of mux function being specified as anything other than egpio.
>>
>> I don't understand this. If the pin is not owned by Linux, then simply
>> do not list it. What is the point of listing a pin configuration which
>> should be skipped?
> 
> We have instances of device trees which are maintained in Linux
> being used by e.g. secure world, U-Boot...
> So something else is using it perhaps?
> 
> But I don't think the device tree should decide system partitioning
> like that. I think the boot loader should set gpio-reserved-ranges = ...
> before passing the devicetree to Linux instead, then pass
> other reserved ranges to other operating systems in the
> same physical system etc.
> 
> Yours,
> Linus Walleij

It's being used by a downstream driver which cannot update the pin
muxing in any way and starts accessing the gpio's assuming the
configuration to be as expected and the property is set in the dt node
in overlay. More dt nodes will start using this property as the
upstreaming of those drivers begins.

TLMM is a reconfigurable block and the bootloader is common across
multiple soc's hence it can't be responsible for platform dependent
peripherals enabled in kernel device tree.

