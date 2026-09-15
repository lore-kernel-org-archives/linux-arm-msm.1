Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 841933EC808
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 05:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789449178; cv=none; b=Hm89TaOZYOZi78rdZqFYyc6cxakO6mi5br7ZPsIW/3K7QB4ZHb9jUZWXJZBmiSeWEn7ofe7uCqSnyra7zx0q+yhA+D/erC6zMuDyysZaYdjP8IgNnSQOEaM4Ekycio3EN9UBDo+BmPbQ/TMqxyluzNn4KQe6HENnS7bnQvUHAqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789449178; c=relaxed/simple;
	bh=HR0XZdX2D2u0KtgeE0YOCG/CJ6cueEc3ds4iCmzG/eo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dcFtJZWVamQBNAye0SM0fgaW66XxD+JYsOd4NVJKks+0+0PNzCZJUCIJG0ZrudYtJJj3Yd6PZx2GfayhuUceRDNxEOQWwuTQt3ABQCJcEsooE2WtwqgRvRqti+5yc9Saz39PhVwyCLYN4RoYhoOkNYwGXF3wqTCVBrO76tEo3mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xrc8YUBF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DFc6kfv+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xrc8YUBF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DFc6kfv+"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F2nRAT2477899
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 05:12:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IaKMq2iEgH112+MNMunDFqRICOBIUCOg2em55rtMQMU=; b=Xrc8YUBFaFOaEj4t
	eaSSluzyDy4Kjc/R0pTBTIurYcdivL3+qYhjfqgvcdnL7iSQVsCooUvpEP6yQCMp
	5arVoy0Sg4B357ZP0uaYorQbwZqI9DJylO/Af0xxxQ6OJ5j46ot8HG+LkrVZaWKF
	87uSe84azaKe+At9VdKwcrvW71XHhW1SDjKW9uwNvCg/3h7ZFkXfXf5ZQxIr2XA0
	5ZFuogG5/nF4KoknYIV7F2MQ3jOMte292TQkoTPRsKbzR59TkjQy5VXR9dKvb7ef
	uzauQVo/++BcC8rTCpE+IlowMtxlA9qg30IapXBK1VuWBDmFu5zJJJA+ibCZ9hvc
	AfVAvw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpnet2bqc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 05:12:55 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3823dcc1647so5721878a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 22:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789449175; x=1790053975; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IaKMq2iEgH112+MNMunDFqRICOBIUCOg2em55rtMQMU=;
        b=DFc6kfv+LiWEDndAICsPnQmXFsvSAXQ4zZZRR8YLBumEjRa0K/JWQ3YTzAzwQ17MIu
         DC4TodBNIZlHId0aKJSYaSsrDVxhn/zqpGrvIWQt95AMpgjosVDOhA/vn3CIrE7dA0lY
         q3/RjrHI9GaGU9/3qoH7JX4WhJnC8c6c4e2uM+BNZuPMMv/FJQYXCgWi56kQzPExrlBu
         lMS+4Dd0h7w6JPCZuUt/rz+7fBN3Ea7lp+tlUwp4wFbudQs601I2jUd7nRNS79UcMoqv
         K3IANnq7V8AaYM4FVfLNA/4sDDg2ul2r5YBJwNOTJMrXvJNmCgZLR0m73gzyyhTqgVA0
         csiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789449175; x=1790053975;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IaKMq2iEgH112+MNMunDFqRICOBIUCOg2em55rtMQMU=;
        b=QdsOa6/ySJYGxAIDH64j/VAsHKTnrS/3KuZEmCAibEM3yr3eacerRgfDrvJrubjGGi
         c9SqhE12x/jCBaQkC3fAV5XS3EVgfoZcELwnh4tZ1Q6LB1mTw4jnYrzPyV7HicU/g7qQ
         lU6hAWMZKUwCkaTHhHinWr1XkBlHdxZcAflr6AX+Jz3I72vwiFRnBKAFo91NXr5wp5Cm
         SaaPoaCoVE6RGy10oArA4dRjxKcWnkvWlr5ZCp6shbDVo1u8L8Y4xVQMoDCj2og3Jxnm
         svjrcBaeUKYhNKswG9Mq+mSVmdcGhoSPTbOLMesXF7aWeInwkWyzzZjzp2UD6ZlBv6u0
         ZJlw==
X-Forwarded-Encrypted: i=1; AKwUvBy50qmsnIrais35MUNxiucYUorfagsFzfDQFETop5LO2vl1FfUxtGaeQCq7OkoHoISCImK9vj3bH+w7DD/e@vger.kernel.org
X-Gm-Message-State: AFuF++lsOD4Nvwoa4ko5pvsFqx6lbfiqiX5/HifJPR0FIurKh1yGDZla
	u7Iyh9TRLjMIcwTDlIc6cGKLczUUcGPI7YP8McfGobv3LK0ShpwEC0Wr8YkNmSoUxF6Rt0uz0r4
	VMNjqhCJJsLEqG7SFhVI2J02ofeADK1l8kaK7TUfg2CCINJld16JZkzI85GUrtlMfT3+C
X-Gm-Gg: AYBFou1o4VtsYNuN4fl+w/T5uEcgC1wdHOUEtPyT3z3EvF87ZCT1uhVL7MW05OrC01W
	eZZ8ldEQhHAC0mdQz0kyDLEAFdQLzzmx/s4/qoJ4N9zi9dhJ9EV7N+2DX8ZbZkGGCP1w9aVO8D5
	etGgOZmjPhsnx//TCNWTEBKva2kdeogxdaai57omKF+QOA2esruyIXZ5M0fUoA1hc3czWJJH6lg
	SMBjrtGQIe8K6f/+TFFjio3mvpG1Uafaq1qNOQUDUe2hutnYSWoMLaT/1LaeO/VMhbhs+oNx0d6
	G5E1TWNHNB/kDY8YBtobaXb5Il86jgjcc5sbr+x4kD/sWbhdqMeQorY45IEc9IVswOupwf/2/7d
	tJgbIo/MuYtZs2yKOQfpXDcFV+rE=
X-Received: by 2002:a17:90b:4b10:b0:39b:92bb:9eef with SMTP id 98e67ed59e1d1-39dec0f738cmr10877533a91.22.1789449174876;
        Mon, 14 Sep 2026 22:12:54 -0700 (PDT)
X-Received: by 2002:a17:90b:4b10:b0:39b:92bb:9eef with SMTP id 98e67ed59e1d1-39dec0f738cmr10877396a91.22.1789449173407;
        Mon, 14 Sep 2026 22:12:53 -0700 (PDT)
Received: from [10.218.7.127] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1438d1381c2sm3755853c88.10.2026.09.14.22.12.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 22:12:47 -0700 (PDT)
Message-ID: <90fcc9ff-4ba6-4e16-a322-17ad8e4a51e7@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 10:42:39 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] PCI: epf-mhi: Add batched DMA read support
To: Manivannan Sadhasivam <mani@kernel.org>, Frank Li <Frank.li@oss.nxp.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>, dmaengine@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org
References: <20260803-dma_multi_sg-v2-0-c12bb05e42d6@oss.qualcomm.com>
 <20260803-dma_multi_sg-v2-4-c12bb05e42d6@oss.qualcomm.com>
 <anTARsISvCPUA9_v@SMW015318>
 <szx7jctqp4h6yhgvhwmiqfjtsemwlu3iardtntp4nfc22u3bfi@ux5ioixmfdnh>
Content-Language: en-US
From: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
In-Reply-To: <szx7jctqp4h6yhgvhwmiqfjtsemwlu3iardtntp4nfc22u3bfi@ux5ioixmfdnh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDA3MSBTYWx0ZWRfX2FXwrqJUjtl9
 UqxO70bp4k+bL+AZqVXxFtuX1bMwLmHX+EXvT/g8JM2hy+ALUvD4tWKytE7uOW22tE63g6uh9ML
 eQSndOupHMIc1EJu7WIFC1VQnlMptek=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDA3MSBTYWx0ZWRfXyGIIL5CZdT6r
 VdXAo+lxW0RpNceyrSw1jFhWbV6O2EeL7Thc2n+Zuta8gvSSKueBNDShIOKUeC/ybIboczWuQOB
 V9RFQkXbN84pVerL4oVujU2qsYi1fcfNubSYgNWq7+xD0C0BvVntkyNne5HXOmblQn/MHFWe49u
 Ap5oTcouqlHUjwARUjRPA82RnftGLHNWUYunwGUtXu1/1Aj9Lh0Se36FqUtZHs7Jri2IzYxJsME
 kyO0Tw6q+RAOix2K0CaezMEbdDsyxaFU1y1fOkb84EIOipYS1OvTMWJUAXAwew6UNRuCfbfSye/
 tyTQIRtdYV+HJ1zNKe2ep6FGGNJ0z3ik0gVQPzUaD0jRyp97DlWWvRaj9XRsL6QmDkMJDX5CHvc
 +3e+B48La0i1Yf2RN/+Y5dswzvmfqM1XXPX29TRflRhEjPZUmcSdpDgCZj+uDnbYGVb+Ge3V8Wk
 G5H9vrejK2JtdpnZKuQ==
X-Authority-Analysis: v=2.4 cv=PKKaavqC c=1 sm=1 tr=0 ts=6aa8d3d7 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=Z1hDqqN1xTHES3mYk24A:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: EWsFg-b7Nu5-iEdlvWUhf3Jt8m7Qyr0N
X-Proofpoint-ORIG-GUID: EWsFg-b7Nu5-iEdlvWUhf3Jt8m7Qyr0N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_01,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 malwarescore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150071



On 8/14/2026 8:22 PM, Manivannan Sadhasivam wrote:
> On Thu, Aug 06, 2026 at 12:11:34PM -0500, Frank Li wrote:
>
> [...]
>
>>> +       config.direction = DMA_DEV_TO_MEM;
>>> +       ret = dmaengine_slave_config(chan, &config);
>>> +       if (ret) {
>>> +               dev_err(dev, "Failed to configure DMA channel for %u-buffer batch read: %d\n",
>>> +                       num_buffers, ret);
>>> +               goto err_unmap;
>>> +       }
>>> +
>>> +       desc = dmaengine_prep_dma_sg(chan, dst_sg, num_buffers,
>>> +                                    src_sg, num_buffers,
>>> +                                    DMA_CTRL_ACK | DMA_PREP_INTERRUPT);
>> Although both side memory address, but as previous discussion, which is not
>> memcpy, still memory to IO space transfer.
>>
> I agree, it is peripheral DMA nevertheless.
>
>> Maybe enhence device_prep_peripheral_dma_vec(). Actually eDMA still split
>> it to small trunk and linked together.
>>
> By enhance you mean keeping the semantics of device_prep_peripheral_dma_vec()
> API? I don't know how it helps because we would most likely end up with two
> vector arguments and duplicating scatter-gather lists.
Frank can you comment on this.
> - Mani
>

