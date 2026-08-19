Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45562363096
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 05:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787118641; cv=none; b=lRuTsM5xAZq2LYZavfakzIYeNnUuXtab10oYI3SXXE0Gk4FZDvHyzAG6AN4tzaQTx2kFMgpmz8RABoS6EebXtXCuGQlzqkDl5yXV5LLHQ+3U9lg9DRGtOgTE3Zh4Rl/PD76Vi6xhR0fc1pnYjw+DZkJ+hhBWbefwCtWkPmnqp2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787118641; c=relaxed/simple;
	bh=xK2xnyL4tQOVvhFVzniMKoWSg953n0t3NPhq5b+kXGE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E9etP4MJ6zLhth7MxTJ87AK+Q5P8OWctvJ7uJwGZ8OYOsH+iCj2VNxJbftB2QOtc9ZXPsA1M9JzLLNTWbE4rLcDvoQyoUlicdZb/6v0J2j/AqVK23hWInujlsH4azj6NKvq0ZAU5PJJVZ4Y0YVroUmU7ViDLuJfLow27bLfiIB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f20frE+6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iPV11zZz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f20frE+6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iPV11zZz"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67J5I3Dk3323945
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 05:50:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2s4j/uygbfoFjK6Ord7ttP4LDeDncsIPuN0gUDVjqYE=; b=f20frE+6MU7IX+wq
	VQ6CLo/LnMV0VMUW2R6mMpvVCfubgMLSnkVLIonFYPxBaoFG3Xqy6baxIae8F5mr
	yBdtIIi4kk0UTQPTfTe/+ESudp5UiTy88E20qKGwfUfNfCrEX/+tq4xyStLLZjKk
	2O0J7QXzezGdCeWmeujNLq8yzAYUH0cHawjKPdkQgiDDkBJPteeHSakGPNQccT5V
	KqYdNlTCv3r9HWsfVL57asycLe1SIN1lVBYM9NGXr2qKsLVthdBUScLkyNwD1HWT
	2p5CfR7hEHdtqW0xlGWyczFmzM9tsRs8F3pN5MMsn2KifW4DAwpBVqSZl5vA8rby
	c/IvTA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfjhm6m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 05:50:39 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3823dcc1647so1069414a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 22:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787118638; x=1787723438; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2s4j/uygbfoFjK6Ord7ttP4LDeDncsIPuN0gUDVjqYE=;
        b=iPV11zZzxQGRZ8Ij/+yJUqh1IkTA2EGLblW0bDIFq9Fn4GqPnuhQjYRPksT1k38sDx
         00cn0qYv0ChE8JmGg8nLPX91bj668KVwz7Op1EwCa9mNLUsYgaFNLzaLBl8kZQHu2Aw7
         pN0bh6QzgIJP/SmQIQYpyfmRAieXC2uyyW7Bed9BQKfmg2d/e9DSf411/CGNbTekL/0q
         /JcAe8oD/TJPwiVGyylhKcWi8+wySmrjV5JRjcxFvB2zqoipUWCivbM6CrAZcQUoGgVX
         t+1IN5Ut1AASNkHUikmYYBZDkHDZN7oBkVQisTB2T62Fo3eLxF2f2xUabCriWzQHHa4G
         oxZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787118638; x=1787723438;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2s4j/uygbfoFjK6Ord7ttP4LDeDncsIPuN0gUDVjqYE=;
        b=YX4VLwfVuw0SR1XQa/SbzqdPfEdqap+UTtOtjC9BFKuVoqd8KeOChUAUlM1bFfkvoM
         J+FPNz3ZUpiFbqj96nZI+d3vN6KW7pe89k7x0+IkpzF44HTQ0Pge7Q900aui1WcZ3q2E
         L5kW2aFO65mQJyKDlWqLxeQ5C6xRIswWYjRIvslgFN+3lSnkYIKQIqWPNijmCkaXYAu6
         YUWbQGyKEs/bkvm6jUDakU25LRzCogcZeRhV/jQD/QO89EacAZOATqwyJXNezJdNntEY
         8JhWdIg9QGxAgblLCfTd9SzplNrZZEEorKONE/U345h8y5vRJsaAFqgPT+15OqIF0kWB
         LVYg==
X-Gm-Message-State: AOJu0Yz3Pxo7MQssU6jiOcNvwVKuy+CrNP1M/kHQR9pSXC0K0IiCqQ/P
	/TAjDmKMaAQNn79F07Xl9oAmJCFG42jY7Q+xMQPLeKGXVsBrnDfY5YLXC659zT+tR2OafZyJbce
	JdAfK9c5QnF918yWPXPxwwQOD+GYGMTP5tSmfZA+MG+hUBzQCovjN18nyHboqKxm1itTq
X-Gm-Gg: AR+sD13zyO6v0szHfclnv6flsl1EDKKCBWfxyEXQTPQgpG1WD8NreCxpHYVUnZ/zrN1
	YlsDGa2xZf5giDCBuHQzlB0bprgXlnwxCBG2Lq7rLKWhMr1vr1K2Ttu1+33WDbP/4TyQ/WjLz+P
	R5w8B4B18/jTlpMB7gsHNYgiXr8RWnwr3GzjArVE1DSYRaNfo+U0KD07V4FI2KG7IuYQc0E+b4i
	ojcVVeqhAJw2xdVI8booI5lkvkVYzLTp1IfCah1Ubp4x9QFmBO1YGK7kBX8//LVfF36XQFSiQd6
	jCdBPoN/O5BcPT7Ay2pRjKdaEiYFYIjWlm0V7sa8vty4SuSJTo3eqL/2FMgDp+glMd4Qe1oSm3G
	kDLuCMjX/q5MS4OsKzvV1+ilNe+x1u44zMRxbBHDyA1l8ehO1YA2LtqzzA3gRhLIec8AJp2U=
X-Received: by 2002:a17:90b:510b:b0:36a:5d1f:7b6 with SMTP id 98e67ed59e1d1-39580ed9f55mr4454784a91.2.1787118637948;
        Tue, 18 Aug 2026 22:50:37 -0700 (PDT)
X-Received: by 2002:a17:90b:510b:b0:36a:5d1f:7b6 with SMTP id 98e67ed59e1d1-39580ed9f55mr4454704a91.2.1787118637537;
        Tue, 18 Aug 2026 22:50:37 -0700 (PDT)
Received: from [10.133.33.183] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3957f96ca41sm1251541a91.4.2026.08.18.22.50.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 22:50:37 -0700 (PDT)
Message-ID: <0b5a7518-ebb8-4e3a-b6db-c053c2edaa42@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 13:50:33 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] dt-bindings: arm: qcom: Add Maili SoC compatible
To: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Yijie Yang <yijie.yang@oss.qualcomm.com>
References: <20260819054203.61385-1-prasad.kumpatla@oss.qualcomm.com>
 <20260819054203.61385-2-prasad.kumpatla@oss.qualcomm.com>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <20260819054203.61385-2-prasad.kumpatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDA0MSBTYWx0ZWRfXydPu8YkkFg8J
 56UdaXB10J1n7M7pY55t4cT/WZXn2HJV5bAvC45MbOSKlpAKBmQV439H8FMRy8mTslMnoc6SWmJ
 hpBlnrSrBAPKW2HkY8pVN7vdh3LHtEyne9dQGJ3sgywT841ZlrCvC2ZfKyeGX0xs0N8pV5gPqJF
 8l71l0pKLb7B22i7IebI30UyeZuGZ3mSTU1LkJLZt7oCeuHuYBZrQX4j/Efne3PQKembx6Ld1DJ
 dP+j1w0IMXIdnKQ3FnVwWNq0+ukI8sdQZxuYOogXIVDKBezYEmzYr0IwW6i5tmaS4UjGEQB9YWr
 v0yW205KtgYs3IplfPSEDED2evRwllSU56q6pWik+q1vIH0nbwMIAgczrZCgd+fAeHddDVmDsN3
 3CPVfzSGnoWn+85as408XnjrrlgfE0T02n70ndp631Vx6wpoQWocb59t3ioCotrBA2nN1UQfP2T
 7xkTlhDxbbnEhIIPGgw==
X-Proofpoint-GUID: P9NOX4rLQkBbniHPDI-oxAQTGjTGC74N
X-Proofpoint-ORIG-GUID: P9NOX4rLQkBbniHPDI-oxAQTGjTGC74N
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDA0MSBTYWx0ZWRfX/aIJygupm/DN
 FwGPD3NvTRZMFyahh+LKBl/8klrbTMewJfUV/qUF1nZDv327gvPP6NZFKv1T7duiM8OOWxe1EvU
 mCVv0YRDfDlfvRl7f25jFMAwYJIv/Gw=
X-Authority-Analysis: v=2.4 cv=Sb7HsPRu c=1 sm=1 tr=0 ts=6a85442f cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=gGspQyDpFobIHN80kfYA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_01,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190041



On 8/19/2026 1:42 PM, Prasad Kumpatla wrote:
> From: Yijie Yang <yijie.yang@oss.qualcomm.com>
> 
> Add the qcom,maili SoC compatible string to the QCOM SoC bindings.
> 
> Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
> ---

your SOB is missing

Thanks,
Jingyi

>   Documentation/devicetree/bindings/arm/qcom.yaml | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
> index ff8a35df7862..00d9a493fe76 100644
> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> @@ -175,6 +175,9 @@ properties:
>                 - qcom,kaanapali-qrd
>             - const: qcom,kaanapali
>   
> +      - items:
> +          - const: qcom,maili
> +
>         - items:
>             - enum:
>                 - qcom,mahua-crd

