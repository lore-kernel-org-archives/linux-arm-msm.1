Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793349421;
	b=q0do6EYu2AgYsmTPlM5AUmt6YNuuKiiUrQP9U63VyoFYPgP9cUvpDXS4tqIzfAajgzNY
	 eAN2b0q1BKY3TROvpLYUPYD/OZEsmjMV0ybI7WQGq2Kzwziz13aw25wsqeiwSbWr9NgI3
	 77D0rlWOuflYnFMlLx088R3XFxQas0/A65z2l6TKyX7HOu6ehJQN9pEnk3IP7EUqhXxOU
	 cvMmJhb0dNewPnx+6c4xs3+pXiOOvaMdS77ECZ+HqCRBGyOwu12P4dtDcMtveuL9ehT8R
	 Df2cWAQ5TZPJWu44PH1Zea8lykyDTco8guO2GrTl5FRfJ1rLocZmZ5ApwMgNoxUU9cw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793349421;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=gmECJRdrNVk5aT8kkhxOMhS3+xVOvClk2a1Pq4OxnnM=;
	b=uiPLLVDChRv4LtVWlK10k3WALpqSCNKrr/Vpm5HYr/WMf6zhyoWozajm6fjMNRBxBSNO
	 wHbxn4kuXnxLUrRiZWn0GGOUHfk6y48mKIVAqiq+d8l/NEhWS+S2bNqegz2YXDxyEDu9c
	 7jh6Vnxu13/jD4vsvVNs9Zav/DHabdyjcMS2wyraVw1oXbasa67dYyhd7Eu+NfBJbjsh4
	 kS7pL1k9+WCEXKyCk4oSgiZGs73UsvvvqF8UqGw8TDymw5xSBxZM/ak811wNP8SjtKwFb
	 oAwRadcT3ZqKdPqPQ7rqe5mPcAjiUhGZLk7b/pCvIARFgeMB/kuFXNRrSNbJazuFSZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CQ9pIGGL;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=guRcoSsl;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7921D606A321
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 08:37:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7921D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CQ9pIGGL;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=guRcoSsl
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U8F2hl1120522
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 08:37:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gmECJRdrNVk5aT8kkhxOMhS3+xVOvClk2a1Pq4OxnnM=; b=CQ9pIGGLRtsEKglA
	dyfY+1PCcr129kLm/j4EmwwQ33yGFTIMwQkS6Z/JRu7is6X+oEImWsvDjTm8qvnZ
	BnN187k1rFL5mDeOEERloEdGDvEFqHZFnpALLy94GCaihgjcuLHZZpJuyivJT84w
	FOA6vLXYIw9cD77+uhqXqqoHBYYcBey/bwm0BBHdBzPTkRifVTohx5/ngddc8asu
	S5nXfJK/0NcQfimVLCxH7ENfmYHeO0+iAFNUi3ggZeWWLLK+kgRtVEcsaPoFfWP1
	E7/0VkZLmNj68xc974k0J8Ewn6Z1F7ULkn0bPSDhhpn0VWWDYodbKhO9ZC3t31I3
	7F4ccw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6pj0jq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 08:37:00 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91c82e9d68fso1338226d6.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 01:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793349420; x=1793954220; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gmECJRdrNVk5aT8kkhxOMhS3+xVOvClk2a1Pq4OxnnM=;
        b=guRcoSsltxLg7pNV7iXFJlgO+gkzEYrFYdz/SdPQx3A5yfIIMIQFcn6Y7iJLbtoiuQ
         sQx5Ej9PRMIdlcym9AAi7R0x7CoZYmZmWA4WpfxrS41AK7v+45l+Jrkmg+r3KExiwkTX
         9jIzQf4b+m9hcAh4y4gdUIwFCggtF03JMwP2/b14/Xm8H7FRK49OEB8dKZvWs0Ui7e+E
         hTpCwSuHOrCzSklaz2kjlhSiAl3D9NgYyUq7DLi7+hE2qpVLg+vrOLeYAJMyo4bTh+sJ
         574ehhDLTcGe47jOEd9RPssxOm6nVlWc0YxvIEva7rmX+yfkhXwtmGE8mTqeLKOsjTIB
         NUZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793349420; x=1793954220;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gmECJRdrNVk5aT8kkhxOMhS3+xVOvClk2a1Pq4OxnnM=;
        b=TX7ydE6jGfR/OYpiyCYR8Ir45bI2qhvekwWdpRZAaTc+lSTGjp/E2LlbmIQoZ53stg
         kjB4FxOPH5weS+q1tZyc0Z72zltgOpsP/k3UNgkWBY+TrGXuXXk0kSL7zPOBPvMVyqKy
         FKeus0ZAMVuV60vUnhjOrRviyBu1oenlHHQu7s9zD4cmXo2nRFOJFpHGX9LBYyH6SlGN
         X5M4wFkeHiN++tXhgnJP+9bs/S7iJ46mq5UwDAAt8Gur1OvhkYkvrGAf3PwknY3rd8nS
         +e2sPrEflVcseI11gos0DWMCAiKp3XDzfMHdv5nBqLm/H4hZWjlUBrttvktkiy4pzasb
         ZmVw==
X-Gm-Message-State: AFq9FYL6i7iTscGTTw7+3ggU/yyVkDSoBGBQhBQTTf5xMa2u+Zr4qw4B
	c1urtL0XQb2SalqOEPI5GWhBBLeIZIcY/LlET3PDGXrD9jlPWM0KMbPHG25sQNKupcnFeMlnR5s
	mw9fCTI1+8SK69va3Sdr8pwzQ7B3S163RfveFOy+pMz7vX9AHvYvOLz9QvKNAQsWsW5ag
X-Gm-Gg: AYBFou1FPFFUAyPxG9NUbZw4JBjGkwzjPE4+xjoVx81ZIo1YuJgQ9j0ghhCX2Cb6rlZ
	ZG1UX7h84Frmwkcr48QUXAxW7bJrLuWhbanLuTXRujDFmks/pppRUiJEQ9JLQhJqdPFCt1CgmGa
	kTqK15rTquqb+b6ubjrLymEYaNlHa5p//x3J5+QFFpuhCXFXj0Qo1C9t90MDIvb8b1TbxEOR18C
	eZR+w/1vgqX3KAfy3npJej91lAxwKs2m997qZh+C6yVSK95Ux0kygEygmgifOdJ+n8i4ExdOm0H
	dGzXOfQPa81WiNfkr+S+WUAk0Yq3cMoqJVtI0DBOBfyvtnt/6s8AT7Ez4XeqAdqB26wOMr/lNH5
	2bSBiv4XlIYbEpwxbghVOE9rFJGvmbAZPg85cMxrn3qOi+86n3XnGUvK9cFzTk3VHmTyhH3w=
X-Received: by 2002:a05:620a:a29b:10b0:93f:1a1a:2974 with SMTP id af79cd13be357-9442173715dmr264285385a.6.1793349419906;
        Fri, 30 Oct 2026 01:36:59 -0700 (PDT)
X-Received: by 2002:a05:620a:a29b:10b0:93f:1a1a:2974 with SMTP id af79cd13be357-9442173715dmr264281485a.6.1793349419400;
        Fri, 30 Oct 2026 01:36:59 -0700 (PDT)
Received: from [192.168.226.64] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4d7b42653sm381344a12.34.2026.10.30.01.36.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 01:36:58 -0700 (PDT)
Message-ID: <fafb11e3-2ab2-444c-8eac-e98173db103b@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 09:36:56 +0100
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
Subject: Re: [PATCH 5/6] arm64: dts: qcom: kodiak: Mark USB controllers as DMA
 coherent
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261030-usb-dma-coherent-v1-0-3147b8f7aa64@oss.qualcomm.com>
 <20261030-usb-dma-coherent-v1-5-3147b8f7aa64@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261030-usb-dma-coherent-v1-5-3147b8f7aa64@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAzNCBTYWx0ZWRfXxqQwbmHENXNg
 Vmu+4fvxlFZYVYFpGGMGZ0IHhhTXgId+ZWIUzhJqgEP10ddyK1AOJRj4jCNTFXXLRtLFHW3xkwf
 Sgd/FWWFubkGl5+XHDAUOZWnMT8LLnwMVT21Sos/RjdUW4b7DShaZF8I2AI4qua1NUpjrb/dVdT
 8Bibz+YnLT2qBoaJe4AaU1p7fcXD9Z1bovTG66EslvjKx0uhdSv+WSuvs+/Jwkysdrgu5lX6jA7
 5NWQitbIqexSDswtk6tWZUvv4o3SGxHNhvx6K2otmNw3ErEQEygS/T7Vbn95iESbmDlUvpSXWnw
 5jG5ITAraT7JwjFHf13LDqqg2mgWxzR01O/Ezx54pqKlkR7S06fbsIiCbANmSBczGDyjLRg2e4p
 5pJwDvF+kGbMluM9cDSf5Ty62yayY1uTjkr90Ko112cZEl8Ne0/MbbPUJDuREsgkOEScrFiAoOm
 MknzV6ucPpymsf2Nh0w==
X-Proofpoint-ORIG-GUID: wRQEMH-LBZ5_BDrkTcx5ZCoW9mahrdT7
X-Proofpoint-GUID: wRQEMH-LBZ5_BDrkTcx5ZCoW9mahrdT7
X-Authority-Analysis: v=2.4 cv=AJ83otAg c=1 sm=1 tr=0 ts=6ae4572c cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=wC0WDq5Qq4zySJWTHJ8A:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAzNCBTYWx0ZWRfX5cdj+D10QPjc
 +9wESxOCJOR2Ay8GeU+pokgQSTmhKwdJaQ7wYN/ZTwqoGGdA+aMQxU47h3t9H0wtAn0mIzeUPRU
 EgJYQ1mKzQAvH6HpATGFpliINvrB7jM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300034

On 10/29/26 7:33 PM, Krishna Kurapati wrote:
> Both USB controllers on Kodiak are DMA coherent. Add property
> indicating the same.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
