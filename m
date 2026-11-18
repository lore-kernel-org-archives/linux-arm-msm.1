Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794984805;
	b=mOPm/xCzOQT6UPCCaDlIH9KCI6zYJjMJASggEtw/6Ep512dV4WFz2wtUxXRF8kfbBtPy
	 wvWGmJ+56ff5rFyTwaP3guDcPVu3p4RUn9i6DyvYrGr/cDEVzg7oMUh71KfqkxkeBOijq
	 PBa7ipld3v6ltVhRrIyrWekLMFQJXGaf394QTpulap3mn/IqpStTOO3vN9NB7hey0Nea0
	 fntdd+zRKsFrN5+S4CQC04PdwwCa2JNXSYNo0BvgCP4fPORPUsreZE/TdNfYz3Tu977S7
	 v0+YuGwu1Y06y2E1h+G1f8fF2J8z6WMIz3fw1asHSZP8zgad0IbGYHMfw0Kxq87EhYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794984805;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=rEUYLKQhmWgiSOqECsPQjbXJYCWlUHA/JEJFzARsK9o=;
	b=UU3QdzAHUsLVr9o6p/EfcWu9hNfSrdhdbXPNvFO8xwpJSj61iRh5/5JJ72deOWLXF4Pc
	 K+VRolZe6XmC6G9Q4w2aMFVBOjbajL9YOcfiDrpHVptelxbEOxRKL6Ss8DQSpFS7d8sjh
	 bJJHmOlEznXoe0bUETTxpsnGhDypH7aO/VgT806/UoGlu1ujoBz57ffDSDEUsk8HHi+Pf
	 5QLu9CpeN6fQUhJb9JRVRLaU7FxddJNdf9qoFEcUPh06nd5aG7VKRZELRd3cIp9QjqN83
	 Ppdc9a+Bt72ViFBlPuuNPbUqAbC6s68cIe2WzPKXpjYMcTBbq74vqw6ZDNhLWluxuKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jq4DSUUF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="JaLSpv/x";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52F5E606A31C
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 06:53:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52F5E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jq4DSUUF;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JaLSpv/x
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2V2El764106
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 06:53:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rEUYLKQhmWgiSOqECsPQjbXJYCWlUHA/JEJFzARsK9o=; b=jq4DSUUFY4qxxOrO
	4cjBLfKTqSfNpHioraIwZA/NG20jyjWPuZChQFn3SQR4So+HwXPSDOd6ShoMD4u/
	FBRMf4bqzW08Uj1vKVm9oeBvo71ZiXVA++lcNJMDKyYzYWrWybJMlWpKucTKl4TR
	hwFWWAdX/GCu1sAIT7p0YcbTzFopnUUH+4M+qQ695xYs52CxbYVb5DdGXrS3KHBi
	+QO+jA4KzQTGVXWUUTu+jXb3JPsRaalWmJNb/xey5GeCVTnUWgkmwQhJ7rbPVNoN
	NcODiE2NpxB20GUrxyBuji0szWjXQfcvxosu9G1ZEh4W0rf4CqK+bBPRsH1qp5va
	IpTWPg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yvb9nmt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 06:53:24 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cdb8931aeeaso445712a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 22:53:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794984804; x=1795589604; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rEUYLKQhmWgiSOqECsPQjbXJYCWlUHA/JEJFzARsK9o=;
        b=JaLSpv/xrg2YmBQiUtFOPprkGLhsS3x+c9oLIZPMOT+H5ujgueHPV4DO+XHSRSkN17
         lH2Mi2frCktdNJG3/s2hHXfbC+VdJWziDr3YgCz5FaEJGQ8O+cdLIlNDB3DZ7rX16uJQ
         JdAufjmeahSAvBtWqWsbq4FK4AkV/PjDSarydRQFGZQTYX6eoQmwOhKDqkSn0Zdwm9Ts
         bUzYEslGC0KdWJTQRK/50P6Z1sSk3/fM+Qp6wi8Mer4/MQK007TUUDXGGdCse60fMYEU
         1CHx0KkTWLwx5W8MlRxu4woExnjfb1Al6vQlyu0t0ETZoXpuNqS0vheWW8N7iiODJVmy
         p9tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794984804; x=1795589604;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rEUYLKQhmWgiSOqECsPQjbXJYCWlUHA/JEJFzARsK9o=;
        b=nlTdO6QFm+emrPgCFbUlOqccrqHJC0w/lclCre3o1zuLu4ATFU0sYkpXWimYFSmqXl
         Jj2EZk3CksVgh1i3ZQHcSa+B+Og2I1Hf9VPLnTzcuXYamANbxJRvqchbZrba0rW9q1a6
         gX5btF38yPW69rEdGSifjTXOSH0zDdbw7n1+uj6YHwi1SAkc+oBcJ5bZbJHu70hH1mhx
         547Kiesl36Y45fvdnSgLL2iPhmJkeF0Uhgq+AnOS2OqG8ZhIlUmELhZdx3FCz3GPoapz
         sJLTAfpYFLC5l6bxGyIWtfQ7enhjPyYFicnOJyOhENmKl0jF+7LTrq0Ms18uMBxxDGd9
         zgjQ==
X-Forwarded-Encrypted: i=1; AL+hErE7uqQQ7LDdc61H11AiwNJ4zFhE3hh2oIGL5cCOfNEy5moN4uXVpkIeW4vD5x4ZpxzxH3VrcCCD0Rz8ZAGR@vger.kernel.org
X-Gm-Message-State: APuU4Z+a+B30sH9e1G+z3eX+Mwr5pmtGNQaPThwSmKo1AEeuvqVo0Gt7
	gEwFgXH7X15v1q5JSboX8xNTujCpO1iit/tTyKbSdPcurIuQXcwbC0ax4aIY+9Q7CveN1D4e0Hj
	55EiKMtNX0aSabRm63zNe0XU+eeU4w/5AjoEo1nMu34aB8mvFd8sMMrS/EElzJqs+S4Cu
X-Gm-Gg: AZFdTZcxbO6fWbw5klZri5AwJ9tUFO5HtDuuLr8vOAJOn5aAhvGDI07WmRecM5kOpUW
	EeaPJlniANo9GzihzFoj20yVZ/K28t5Vh/STM7P3ruZpaTfgbEjnGD541BgWM1idXvYBB07/D9o
	EE2ra6jMs1yIaNS6azEPlXyYOIz+qST4RfOQmsm3T+DeTTm9yIcczpRMgXYZ95wR43Wnn2dAKsw
	UhtzlXNzhI5l9uRmvauPnyd1vqfyiWhr+p+b7uhfhj7xBLqw5jgM71qxk9N0B6Aixbdx972DQ7S
	Jp1IqaAaqm9gyTCdZHBnmxntJwZJms7EhlGS+9tPQV2ajbSarYVzVdrDJgLLxtebsLmFKjfrKWG
	creCMoHj5+CSI+QH0pFkb9gfGPTJ6JmrQ0xUY+BhXLbplHbeNC1X+DqlDZw9axMa0xcJFF1XNLt
	1x
X-Received: by 2002:a17:90b:4b12:b0:3ae:6fda:78b1 with SMTP id 98e67ed59e1d1-3b3d07a5319mr1630660a91.43.1794984803778;
        Tue, 17 Nov 2026 22:53:23 -0800 (PST)
X-Received: by 2002:a17:90b:4b12:b0:3ae:6fda:78b1 with SMTP id 98e67ed59e1d1-3b3d07a5319mr1630645a91.43.1794984803323;
        Tue, 17 Nov 2026 22:53:23 -0800 (PST)
Received: from [10.218.30.203] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ac4ddecasm7774110a91.14.2026.11.17.22.53.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 22:53:22 -0800 (PST)
Message-ID: <10c3be7f-f329-4612-a7bb-c033fab6f99e@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 12:23:16 +0530
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
Subject: Re: [PATCH v5 1/3] dt-bindings: remoteproc: Move iommus constraint to
 SoC-specific bindings
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
References: <20261113-shikra-el2-v5-0-8aca743de97f@oss.qualcomm.com>
 <20261113-shikra-el2-v5-1-8aca743de97f@oss.qualcomm.com>
 <20261116-boisterous-ancient-macaw-8cc00e@quoll>
 <20261117155208.wbnm2hldjrfomryh@hu-mojha-hyd.qualcomm.com>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <20261117155208.wbnm2hldjrfomryh@hu-mojha-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: hYeWvxYDKd5Lqn2h9HG1GM7N6yNfN6Py
X-Proofpoint-ORIG-GUID: hYeWvxYDKd5Lqn2h9HG1GM7N6yNfN6Py
X-Authority-Analysis: v=2.4 cv=YfgodARf c=1 sm=1 tr=0 ts=6afd4b64 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=Q45aZnUg8FDEnReNsB8A:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyNyBTYWx0ZWRfX/dM9Q0VBaWp1
 aZC2in3E3dU2h178L3d/+4KW24qvShNlfr62NujpgfOdQVB7nxHrNA6kAMqbCcqDwaTEKffRoNP
 4SEA8oRERaOnRGx5P0mbrv2MZe20zlU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyNyBTYWx0ZWRfX0gMzR7ghIikM
 b2sJ8fxgqAqFkaxkEXwIdgc4BLK17Ng79PuT4ZhSH7bUkhm4SRYdEMaQj/LplYSkP4IVgjLP5HE
 G7HSU9CcGkKywvJj3LUQ5v4/J4MCmBJGGhLXO11lnCBmt+w0p8YxUTWHT044hBJS204Ynt/QiXu
 Ryemqaanc7t5nFFbxgW3uSq1a51ud6Tl7S5l7mDgTU9uL4kO/aiv7dWetILQPv9eBZGxo4i79an
 JjhcW7XtTTG/VqEmL6ApGIGpyzW8tUt1hgXeOXEW1ne2uDQZDDfi6soCCLj0bheJcbckSWkWvNm
 1MBU2QbYu/gDwZ39955ex5nSkBV0UeKUoFOsPyMvDByBXL4THE3ts+xtQEWVeHFYtzbKHcyeACK
 w2DsGZxoy3d5yv0eJHqqMGFCy96UN1YTKDWr4MFXFef3ufDk3Z5bSoth/SbvI/y4iyhWww5jQyz
 CCqlI5kujU4shk5n4/Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 impostorscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180027

On 11/17/2026 9:22 PM, Mukesh Ojha wrote:
> On Mon, Nov 16, 2026 at 11:58:20AM +0100, Krzysztof Kozlowski wrote:
>> On Fri, Nov 13, 2026 at 08:02:20PM +0530, Komal Bajaj wrote:
>>> qcom,pas-common.yaml limits iommus to a single entry for every PAS
>>> remoteproc, which is too restrictive for SoCs whose firmware uses
>>> multiple IOMMU streams.
>>>
>>> Drop iommus from common binding and let each SoC-specific binding declare
>>> it with its own limits. These bindings set unevaluatedProperties: false,
>>> so a compatible that does not declare iommus rejects it. Declare it for
>> I do not understand this sentence. Compatible cannot declare iommus, but
>> anyway the bindings do not reject it.
> @Komal,
>
> Yeah, this patch should prepare for the 2nd patch, so ideally this should
> be a no functional change patch. Any constraints change should be a
> separate change. So, ideally, this should be removing from the common PAS
> and adding it to every SoC PAS YAML that inherits qcom,pas-common.yaml.

Ack, agree. I will update this accordingly and keep it as a 
no-functional-change.

Thanks
Komal

>
> -Mukesh
>

