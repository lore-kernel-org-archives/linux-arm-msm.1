Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 432103B27D1
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 08:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791880768; cv=none; b=rI/8YCve+v7cXPNHZr78kvZRbS/5kfSuDucNNj6DvOCSd12LSkjUdhGli2p82rML8ADoC5hCXlxdQMp2FG5ecfPcGXUgL/jQk4AWvT7rAMXMC1o9jOQtDq2h4nHSvZDsAKEpENFad1xcguB7Xja4Ew2DEJtPkyEwttxD9UJtXYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791880768; c=relaxed/simple;
	bh=S8u+ZnaFpsDK+OrhjGJtztlHxeebOrcfzgdGhegteo4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ho8oGgUi2tb9R17R15cNrUSNJf17E8avSu8XmKpJ6ppEcax+BQIaIdm5FuP7z+0vCvzMW2OrTJx7AnaP2qArz+YtP3QUt6uAnM5WttdhZIKKPKZyryTXb++mKqPvivib0Uzxsu4T35NJHDkC89uQ/TsZ9WQ4KaPJ36dF7WJhPIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o5IG0UQh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cuwONN8G; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o5IG0UQh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cuwONN8G"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D8J0os3908171
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 08:39:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k+ncZHSuyduxlJ78FU1tzgAiXmr0kp8iJkZCM/xCfcw=; b=o5IG0UQhQ/fgtba4
	sMA8Cvk537oFr+AHkiMvzp51CJEqJdQMaTN/MiFnYysiBXLPV4Auu4zBFYFzqVGw
	5mC/wzeRHe3qi+Tkns/EIG4egoDFRgwwmGHV0KLcmTvTK71PCPprLcRko3P5ocML
	8+h/PKCLvRX7UtKZR3XWNurGYes9o5OJ9bhzIhmBPF4EL7QJ7WGG0mAfa/iqMKR/
	cC9AmDfgDHPd7MtzEHvtdAIK5z8AGQu0EMEZI8xj6ceY73D9u+wrugxiBz0pyMUf
	JxAVOKh/66/d5infTkL6NCDIzmofneK9jytwUgYY5/pTztiV69nBo6j6kMAx6RzM
	6fmD1Q==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h95xqtjf6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 08:39:25 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3515266f6eeso5161966eec.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 01:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791880765; x=1792485565; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k+ncZHSuyduxlJ78FU1tzgAiXmr0kp8iJkZCM/xCfcw=;
        b=cuwONN8GaVmGTOlw4PIJOYul3xbHDv9dwYDSCXg3V64y6J29jSJ/ISIIAGjIlrzz1L
         c/ROwHqavmqYPgf8iW/VD6DF8O8+rPQNHv0WBFWInDCIusmRc44XGgCjCoZxFXrmOgxv
         T/67YUxpawF1jC3t0NL8tx7G9rzsTZCaE/GUpazG61tDms94BcAFhcBOZiUP0Sq0LVzK
         89YnSUwQvv31VP4PiQZtCZTLbjLaeSSDICLC7gA9vMqb2rGzotOEa8Gq7nUKf9S+D9lN
         iEwT3Ej8vJI4BvH56Y0vNVAOsAs5fiQFZRVnitBfaDjb2G0IcJgQmjLU3ZpKDLeayL6e
         FItw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791880765; x=1792485565;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k+ncZHSuyduxlJ78FU1tzgAiXmr0kp8iJkZCM/xCfcw=;
        b=mGv0069seIPJvHLjhsiVdg9593r2a2gpB9/NA1jiptlzGl2R+xwry/ht+nPUNQAc+2
         BJHUp1EqUNO5Gz6qoyHXDpJxma5ihOGs5wM6v7xrq06asTKFmDeBz+fAckinT3YIMw/O
         YH4VHfrIwyialaWYMveC8jMlQgCZ0sdiqWNOSWGqn/W6E+hz9vA5gllUA1MMO4gDbNJt
         emm6QsS4C2q7bQm2F1X5qBMPABdfJxCxffGwWg8F7CCdsjOb4HyiPOYuhkeEJ97kyCA7
         YpDYI7P/dyHXVba3UbqnBwmqrGBf9CkcHURp6Pwx11FFbYq6OmI/MBXo/dr3sUdREtfW
         oOUQ==
X-Forwarded-Encrypted: i=1; AKwUvByyo+LKbRp7nV3ZHjj4xfmFhJS9MC5l/kHTVJvgj7tP9sc75amec2ZQOdRkKj5oyab0HOTfCSBwtQZqPFmV@vger.kernel.org
X-Gm-Message-State: AFq9FYLRqjEs2O1hK3bhC6VnN6po9llbDn76pJ3Nm9HVsJBBJiojOd4B
	PzDiiCJR27TckvbMIUTiX4UXiJ/BvYAiduVLzCVxYxkRr3Rxt8xLnqYtrtD+BqDzCd5ixnweAOr
	wt31dDj6IPX3vQ15f7ZlNwbFTMasPA49am6OvnY+AGXE+HEXad5ZIohmU+s8OeOUEWxgf
X-Gm-Gg: AYBFou3tFNoaHHENC7z48W1Bf4J0us8E1ZBTiUcK1EkuJ99fYFg3IPZqR6KwhjHsicj
	kStm76JZKZNkNwzf41Cdq/dWl7DD5ZRGsKqkVGiuHaLVqtItb3ag/18iYRYr56Jr38ZWGZGwJw2
	3X8H3qsaurlEZXgcP07W8P2hMrS6LYo+W2AYNIonNL+Z2IscIw0Z6w7igGY4RKKvY/BsEBUqR0I
	nXhisnpy56PMy7MsD3XYYy0yIqNyHdI4vAic8KpCv/GjCczS1MPwcabuVnSv1grytRle3WwrGNA
	zWvMfV1LRpkT0xQ0OhqkPg0l2gzvs1VlasPJ/1AxmbDFsvLyGr9LjLoqZmZrc+WMhjGhjWlHZcm
	+rPP8p3X9q/QiX5XhUXEsSXXiAgQOqYMG95yy57cBWjQ4k16RKO3rlZRZbw/XjjFr
X-Received: by 2002:a05:7022:b055:10b0:148:4d6c:201e with SMTP id a92af1059eb24-16a5faa6965mr17112683c88.23.1791880764408;
        Tue, 13 Oct 2026 01:39:24 -0700 (PDT)
X-Received: by 2002:a05:7022:b055:10b0:148:4d6c:201e with SMTP id a92af1059eb24-16a5faa6965mr17112648c88.23.1791880763693;
        Tue, 13 Oct 2026 01:39:23 -0700 (PDT)
Received: from [10.218.1.199] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a442ac67sm55939416c88.18.2026.10.13.01.39.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 01:39:23 -0700 (PDT)
Message-ID: <6851ca2b-775e-44d7-b437-d04fd4ea4f21@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 14:09:16 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/5] Modify interrupt handling for eUSB2 Phy targets
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260905-eusb2-interrupt-v7-v7-0-820cf5377a70@oss.qualcomm.com>
 <aszg7Us_ACMMiM9N@debian>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <aszg7Us_ACMMiM9N@debian>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAzNCBTYWx0ZWRfX2dmCdoidwhlY
 TRVuTlHoilFef+Qg24b90SnzLg8u6IBmq+DqdVzyte1DXfY7Vr5xjxuNhIcvqekcBPCO2eVgfrV
 MmpXi4drlboCbmyRD0mXC9sbBXvrINZnTRw/EjzSww56xWEyVyhRbrfQZ9WkTcGsVdGhILV1t3I
 sNI7DMDKFOda72FOnkfQ26rJRsT8aPNeKCWcCEdmK7ZBeXqMer/7gW+8fzjeL51tymFSG8oPB0o
 F32vR3/v8LKtOESVyo5R3jk3nb1nG41EO+0A7wNEdgLOEFSD71naZxtTmbTX+kPhzszMZAwvTzd
 +DtqllnlC3XuPWBb6KoO6gDUtqO50QZb0JiWjW1WfckxYMlPrQSdqwsf+Ils5jWkcGFViELLwpe
 7OfqYrcZpk1BhIkRkWDm8rICi4zlwSSYVFQW1Yix6B8pYC+cQ5z6cMNqZ9SiFkw0ZxKRZFTWM86
 UFY/MhKP81uxkA3AblA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAzNCBTYWx0ZWRfX+KhGVNGuPq7b
 E9M5IGl9CBN31IjD8cB/jQm8Sn8pP3gNxMCrn8HSpmAjVm8va/yOpbbRAvrVaqg0xUTfYinhYxG
 ZpKdpJJkbbTJnLsuXcQoUFq9upf6QHY=
X-Proofpoint-ORIG-GUID: bifHbAO6HPQSdJ6FAc3P62QYSzcMYjo4
X-Authority-Analysis: v=2.4 cv=EP+TQFZC c=1 sm=1 tr=0 ts=6acdee3d cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=SsOP-9FfJHXtHJDkYNsA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: bifHbAO6HPQSdJ6FAc3P62QYSzcMYjo4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015 spamscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130034



On 10/12/2026 7:01 PM, Manivannan Sadhasivam wrote:
> On Sat, Sep 05, 2026 at 08:59:04PM +0530, Krishna Kurapati wrote:
>> eUSB2 targets handle wakeup interrupts differently depending on device
>> speed when operating in host mode.
>>
>> According to the eUSB2 specification, remote wakeup signaling in host
>> mode is detected via different data-line assertions based on the
>> connected device speed.
>>
>> When a low-speed device is connected, the host repeater drives eD+ to
>> logic '1' upon detecting a K-state on the USB lines during remote wakeup
>> (eUSB2 specification, Section 5.5.14).
>>
>> When a full-speed or high-speed device is connected, the host repeater
>> drives eD- to logic '1' upon detecting a K-state on the USB line during
>> remote wakeup (eUSB2 specification, Sections 5.5.15 and 5.5.18).
>>
>> Since the eUSB2 PHY's "DP" and "DM" interrupt lines monitor the eD+ and
>> eD- line states, configure the wakeup interrupts accordingly
>>
>> Add support for a new phy "type" attribute to be set by eusb2 phy drivers
>> and be read by consumers (in this case usb controller) and act accordingly
>>
>> Changes pushed on top of usb-testing branch. And v7 is only compile tested.
>>
> 
> I believe the merge strategy is to merge all the patches through PHY tree. If
> anyone feel otherwise, please yell at me.
> 
There is one existing comment from Vinod on v8-2/5:
https://lore.kernel.org/all/3a3cf540-816f-41a3-b31d-2902e7f4cf01@oss.qualcomm.com/

Once it is addressed, will send v9 on top of phy next.

Regards,
Krishna,
