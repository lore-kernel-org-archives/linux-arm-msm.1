Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793609353;
	b=IZ4ucuhWVQeXkLRL+mTxJlBV5QOor/32bcK8bz6uDJkuDrVpKZ5pkM7BkOtncIoqwBfG
	 3X89HK28efCZajLgornUjoHzovYaHxKI0yn7P8Ly8TxKaHllWY6L2hkEW2E6IQGALE41l
	 TZZQFbkFWL/9XUnTNiySeIKdceI3kqiHDjWZTTU/Hd97xLIIYQF2zUyjWp4ezJjTUnDGI
	 HvVGv/1Tx543XYpc3baqiGflUzHqsDqe9M2t5U0nxdM/3kybqtVR6xPi2myFxS/6mYI+B
	 YV0i7nm2M1bwzuCKK5f2IfD87KjEJPn6imN83xtxo+yJBL8JfuoWkZEq6u7gZSaQBJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793609353;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=33/Y7BX05nV8qZ3sKWe/KprgJl/HommYyCMjFKJluP4=;
	b=gF+SnN9CV8rga5D+7jywiEJrV+K5xWrX0GcmKrVURX88tkc990MUTQ622MRbjQU4Fs5z
	 nR1+9PIQXajlykDcQNW6agifG8nreGnMNLnmAU8nJWsSF8G2ZuTiAQcLQw8gOT1RN3pRr
	 4NNTZ7d+zb58PcwgIOc1BP/VOu5PsKbYB/mIlgJCnaZLPnvy5clZRrkI0meKN1PrOh0SI
	 oQQo19HDBV40VBJS+KfbQx30HmgTFPcs2er/OcCiqxScCoSbPEd1lIps7+EyBMkZ9e2My
	 CtIyKQKj+Dd5EsgRXpezuH0fj48rK8Q2kicN7Jt4qEgA1gql9FxbqgChtG2q5qeG5RA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eceodDuN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dOrInQpf;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23259606A326
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 08:49:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23259606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eceodDuN;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dOrInQpf
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A23vHQl3324639
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 08:49:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	33/Y7BX05nV8qZ3sKWe/KprgJl/HommYyCMjFKJluP4=; b=eceodDuNGLr36J4s
	yVBg1xIwCKo/8dffM9gwcsEF2vsE2IlT8xRbXUROVk/UR+kxnIcf6i1yzezTweKZ
	xb7w8SiyG23ZGfCcfPb3oxB4bxi6b0Wf31OTuSwRG5Oo8q8KwcU57iFrHgFcbint
	1fCvJHvcFWDQgrE4vh7b3AuA2gZWfEJu7uGPu0wSns9UZLziEzwCykMwZEFS28Wu
	/rTquj/85epa6Ug7Ab3HlFdUVfYVA1SfQzErZ0AnLT1fg+J7wtAZos+bRLb38IEe
	SjT1+2iyO+Vk39/xHGIgntn1TLZ/GjpWl2YVR4trnPSFML3dktjGtkUIEvj+kkei
	K7YJ9w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn7b6p5c5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 08:49:11 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-53657d237ddso2983001cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 00:49:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793609351; x=1794214151; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=33/Y7BX05nV8qZ3sKWe/KprgJl/HommYyCMjFKJluP4=;
        b=dOrInQpfmmvTaZqnHCNY05RpLv8FCQxHP5mYecUjrtIxbVYSgQVOAc5LUJsA5okJrX
         Dk3JmTGkZVkYzozXUndSI4A0ufhBMiW/HEm1Hxy+BQSTBm7/xHy6oJFOEXJ0gpIpcA6L
         ROxo/wgRMDSsOgCQ/GzG/ABL4YY1pc8CwzKTPVrcPayMABjwERKbulUK6a2i+osjCN6Z
         CUQtHbxKWt+4RBvuMCkKklJCpErG29X/0sd2nYK9u3KhB8yvzSfOZn56K5dHulvqb6sY
         T0SBfKuzhqFkWdHxIB+UBFpWMI4iTbginlCADqn4SJDp5agiiw56Mb5Pk3BA6Vhe1lrQ
         Jm5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793609351; x=1794214151;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=33/Y7BX05nV8qZ3sKWe/KprgJl/HommYyCMjFKJluP4=;
        b=WNckOzoyjUU+dYUPrVGLvyfXBHNxpRfaDnqYbmcuiqGTau9wI73JISW7/4uJ8/SIhy
         TBWf/OB7yTeEEslqJpfndOqwqc9wtTrqo7PYS/KhHzIzWikE/KkBAjE3iNkFs+UXqpL0
         cXYWI1cg5WjITx5wgWip1PXesluKaR5Aqd8WaARJYrBjp9JDpgXTqQxIQNrTiu+yaqwq
         Wru7n4F5xPeyQ7do4dDP6xtJfwPZJA+4uNeCvrqjYvMaOpSAOTqdVQogpaY0U+GzOvUf
         pXBhBgnRKOmXocE49nEZv9OGXCawD4KDMJ/xjcDEX7GSCDgRIT2+s73K1B8Og+NYMYek
         0rXg==
X-Forwarded-Encrypted: i=1; AKwUvBwWPc5v103Xnke1i75QlAPG4RcvvyaV5XMVvQtm03i8CU3rtZ9Mg2cmgzKCfAnig5f3QyuhiFOvseULkQWz@vger.kernel.org
X-Gm-Message-State: AFq9FYKUo62gDqcHSLZl8v1XtM9W3vkT71vlbLhFC+FNya03378GLF/i
	BU+P+4ZIhYAyL16yahTxM/4QHuavgkTB5N3gU9h2MOj7tLdstgr/yUpd8bcWzr6fRvxkyc8hTmm
	H1dFa1uWsVUc87CGXMC4i5hyvUVLgcZy2qbZzA8A431UHBVFFx8Nc+TXncoyJOeGHdqQj
X-Gm-Gg: AYBFou2sLTIJc326K8gHVK3fOV9GZyolrsqxLHTa89u6XGhUidDz2UScAF6BqiwZwQR
	TwvNxb0LS0tHiYxLbNHjN0P7cL/yFEH9aXR0QTTBj5uyGjEhTx6pUCLBHeLsfPoT1YNgGrLwMwO
	g8jvD28TonftOoS73zqiYa1MPKYywDY05Fs3ahzJWDvT5YEQmqhRvqiI3++j7dHGhOKbhgX1pql
	Al48qr/DHVJZJe71tEzpBx2H8HoTe6TFbN+ayagsbJx7s1bDwlpnGZZaXK1auLLxB+b0YuXg0f4
	QG8+igRXp11/pexiY4jSULg6d6aBR3x09+N0Fp+f9J3Rpv5BF7k1Kw9QbG4+T/nKpng4iH7pzVr
	xht39yRpg5HLMFgSpICxs/n6SSQkk6UHVuAeZlLnW9My4Aaf01xSYXOw70HdZevODN4nRHeU=
X-Received: by 2002:a05:620a:6f96:20b0:93e:54fc:2c79 with SMTP id af79cd13be357-94421878c51mr1460716985a.5.1793609351171;
        Mon, 02 Nov 2026 00:49:11 -0800 (PST)
X-Received: by 2002:a05:620a:6f96:20b0:93e:54fc:2c79 with SMTP id af79cd13be357-94421878c51mr1460714385a.5.1793609350605;
        Mon, 02 Nov 2026 00:49:10 -0800 (PST)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabc18e78sm369278566b.9.2026.11.02.00.49.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 00:49:09 -0800 (PST)
Message-ID: <9d35eabc-c6e9-4d5e-a2fb-b11b40083bb7@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 09:49:07 +0100
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
Subject: Re: [PATCH] soc: qcom: pmic_glink_altmode: Fix printing of a fwnode
 with %pOFn
To: Asdlerto Korry <korryasdlerto@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261102003324.340577-1-korryasdlerto@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261102003324.340577-1-korryasdlerto@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: vdo1s7RvIv1zEUG-1axN9VBU1FfC-ywi
X-Authority-Analysis: v=2.4 cv=QuvLTlyd c=1 sm=1 tr=0 ts=6ae84e87 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=9UWtz5tzZ0TQeNEpZG4A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: vdo1s7RvIv1zEUG-1axN9VBU1FfC-ywi
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzNCBTYWx0ZWRfXw/PHW5zlnZpt
 2rcIrOIKHmPxt6qus/Sqxes5UIFtoClc6/cp1JCl7GqSOcKLHeWCZGgQSmc8tZNELOqUFBH3efq
 BpS6vsJ4OqQQrsp0hqtxL4pOkRB45Qo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzNCBTYWx0ZWRfX6LoHEvSmOH/5
 +FZrKDFvAMjPbYabm8WcWcdbS5f4rDxg+H2v/plP+I7nB8qqeYNoaPMl6ROEwp45ikyIDmIttD7
 tQO/QAB2w4UeHMhAv7hNRRe8f/TqsDw3Vu3zxjGbGaLlPpEG/kaP+U95SwAd9LsdXeZGgUe2u/W
 o5sx4HLGJDsYHxfiFQvNO1zDWHSry9AcsuCSI+5qb2trBVzkw6O9AnNgplNeSnXJTXxbg0KdQSY
 rSwPL06q0SWAahH9b+9RAevBm7f2HSJLRQl7R21YsaI+4fd//KNkXv/wVCnQiyyhjVb5n3oyGdb
 WHMerGYvkJsQ2tJ7zFwbZhb/Pfpy7Fqrno10bgb+GGVyEvlANvbGCoCgv2XOeuTvgIBjh0twNYT
 6nsW0rDPQJsKWcZ/vQJLEhUNb7JhA1Eh69v4Z0qeFncY6D+5Agao69NsQ4W9OnQX0vrFkjrTMEi
 mIfMVmjRqLQQ4DlfBGg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 impostorscore=0 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020034

On 11/2/26 1:33 AM, Asdlerto Korry wrote:
> pmic_glink_altmode_probe() walks the child nodes with
> device_for_each_child_node(), which yields a struct fwnode_handle, but
> prints it with %pOFn, which expects a struct device_node. vsprintf then
> treats the fwnode_handle as a device_node and passes &dn->fwnode to
> fwnode_get_name(), i.e. a pointer into the middle of the handle, and
> calls through a garbage fwnode->ops. The error path ("missing reg
> property") therefore oopses instead of printing the message:
> 
>   lr : fwnode_get_name+0x34/0x50
>   ...
>   device_node_string
>   pointer
>   vsnprintf
>   ...
>   pmic_glink_altmode_probe
> 
> It was hit on a Samsung Galaxy M52 5G (SM7325) whose vendor device tree
> has an extra "qcom,pmic-glink" compatible node without a reg property.

FWIW Vendor DTs are not supposed to work with the upstream kernel
(because they diverge so much from the upstream dt-bindings)> 
> Use %pfwP, the specifier for the name of a fwnode.
> 
> Fixes: 080b4e24852b ("soc: qcom: pmic_glink: Introduce altmode support")
> Signed-off-by: Asdlerto Korry <korryasdlerto@gmail.com>
> ---

But the issue and fix are of course real and valid

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

>  drivers/soc/qcom/pmic_glink_altmode.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/qcom/pmic_glink_altmode.c b/drivers/soc/qcom/pmic_glink_altmode.c
> index 465e5d2316a0..6f3737b096cf 100644
> --- a/drivers/soc/qcom/pmic_glink_altmode.c
> +++ b/drivers/soc/qcom/pmic_glink_altmode.c
> @@ -596,7 +596,7 @@ static int pmic_glink_altmode_probe(struct auxiliary_device *adev,
>  	device_for_each_child_node(dev, fwnode) {
>  		ret = fwnode_property_read_u32(fwnode, "reg", &port);
>  		if (ret < 0) {
> -			dev_err(dev, "missing reg property of %pOFn\n", fwnode);
> +			dev_err(dev, "missing reg property of %pfwP\n", fwnode);
>  			fwnode_handle_put(fwnode);
>  			return ret;
>  		}
