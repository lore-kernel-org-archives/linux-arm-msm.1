Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E135F476072
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 Oct 2026 09:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791193836; cv=none; b=kHbkc99qD4s4hTpycllui5KjKilUEfvvfpg/WUOg0WYmkSEcw5bfuVrpfkxJNbNX1djhoTf6Jb63bKVVXJTjhq83X56+sBphZkH8XKIeEL3wQC79WcqR9NJB9CIpqqHjkoGeqk5d2P+wunvI7OYChbxgzERFGjq3i/5NFyImJIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791193836; c=relaxed/simple;
	bh=JbK2XciOCAGYGhh2WwFKNXGA0zTsF0JZw6rU+WHZCk8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mERVEmBFCXOKSqLBXxVzZouNY7h88AIBnCpd3E/OYv2kly4lquzLvIzDgFsfXnrGlwGlrYAs2xhuRxQgYOqsLJm3MoNRefCEi0c/4ehRPRwH6nML6no+zncyeI4dNGJRLPIOii4G31nLQAXiO2gY4P2HlOzeaUypLsMurFG69Uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m3iitKEd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AzSgbiGu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m3iitKEd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AzSgbiGu"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6958xO1Q047973
	for <linux-arm-msm@vger.kernel.org>; Mon, 5 Oct 2026 09:50:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9yVrXwIWJyocR1tAJIhOeeUu2pEhXOkwQN59FJ7DNeY=; b=m3iitKEdTX/pVTGo
	uUcpOEJe3bY/VPfBt3uSLAm6zg1kRHO0AHLTCTXe8J8r73ynnZBJtzJrM6E0JgsP
	495uwzdnV4ycOpbJ3hVKWubpo2IT5/VTtTWPJEiKVOSg5wvm1AZQLYIFu3DI3l4F
	PngAUyq1zI9G3o2TLAMj7f2BOPfsPcLUDI3fbjTwO7EAHnG0vK0KNTOXPRLYteQX
	4pVIRx48Xco+TxfpBkYtPpBh+tMcAAr1vBkl2h2H928ukwMv3HwTnpoRABxyuE53
	ALN7AvhW+pGP72JhAWi63OueSIAWGwb5o5dqiCrb+c0N6ctL0jCaI+K24aqaBwhA
	uSknxw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2tvew6er-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 05 Oct 2026 09:50:32 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3a470ead068so1306941a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Oct 2026 02:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791193832; x=1791798632; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9yVrXwIWJyocR1tAJIhOeeUu2pEhXOkwQN59FJ7DNeY=;
        b=AzSgbiGukSsAgKxhD4Y1q1+pxxDxBQIucb0IAKIFQYQilJt8CpSZGxnFP4F8TuGp6j
         yFAtOGJHKbsGqlpj5fi1gtweb9QuA5YIzxGEkDxSAJFw7+sV7rChvqoh8rOSh832TE9+
         Y1t9r6nnbgab9avCUV/pe7iTXqeDXbxbkD5uOss6Vc8uPqTi7xzyfx4vKmxEyVsgwPDG
         kmXbXYFvS1uJtw4xzKVQ86JdN6eSSb9D0yEAVg1kUqtLbYRVcKDb5Vi64LCS4mJ69QAA
         cS9GJsij1xvT15qPJL3J3QDqTfTk3QTT9M0e6RWO4FuVR5bVmgdFXirlErSTufY+xXns
         JBGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791193832; x=1791798632;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9yVrXwIWJyocR1tAJIhOeeUu2pEhXOkwQN59FJ7DNeY=;
        b=1YWJlkTHUyem+afXZNgXNtmAJD91bSx/e9OZfr901xh4zuabZjpXdbWBSqPlVv6T/h
         WOPSWQZNgyfLkTegdRGt39hYDKTF6EWp+Fv4RgR+owNareKtVXmZQvILXctEkJameVNY
         VBpdde1oSajwB3w8E4GS+GH9NDm7jVIYC8xgn+cnX2t5Ib0aZPM4ucJgpu5jja32350G
         qMi7HER9w1jq7aDTj96w6ogye8zjFFAMDdcPN9FHMHi9xfLtOMjS/E5c0DPxR6xvJsHk
         R7QbT4/6y6Ru0b0Hwezudu/BwOn1bnCzfbiVQYmW6vfv16uPLIejRI5E8lGAAnV+CSRu
         yqwQ==
X-Forwarded-Encrypted: i=1; AKwUvBynq/Pl6br/KmGKCML69CbL7VWGKa/sy9aU3YhXxDdLQoN0UiCzxRmey9D+C8U6NCBDkr/+l8Jl/dkoObzD@vger.kernel.org
X-Gm-Message-State: AFq9FYJk9Hz0aKLbIxiF1aaFXraqkeyWsddZQ/77ahHZThyMkKAf5/8r
	Jud0j19dpZZ3DyEYVkBG07wPKTKh8vL6MyjgKQqnt0OE3/1DHfKOJH3NhLONykyzwBAfm3+1VD0
	lq3yV4qqm1oRzi92fSnM0zKrilTm7UcVAjZPBzYmLlT3wcqKyJTHVsNFPfgBCbrOw7Rv7
X-Gm-Gg: AYBFou29Skh9Y2ewlYAiLfAuXgGJ4yHwptG8OR6q5Ptv0a2oV9hiQxP4ZuKMc5XO8B9
	qA3yYF0ygX8NI6BnukQYBXdAZJ/WzhV484XSnt6dAkvUC8qHA77/kczku3lJp/IdVOaImcik4HG
	o5zplwZQvGty6EJZG/c7CuoSg7cwk1Rayk2Wv1uAb28bFSusew/Y6hrOncHpTcZj/5YSA7KweB+
	TEa64DuBnDNkNg8ZPC/Qr/Pl5rttDv/u85qiV30wCzhN6kxl3LkK+xzB1/r6QweI97LwycY6fDh
	R0JUwpWOGJXdKpV/20fxNm4OPbXoQCmGATiXwNKn6+UtO0zUukbT1NxkyZHYSdTOk7TXd3W7b9F
	kzh7FRvIla+hmwxoFSe0QxvN0+M0=
X-Received: by 2002:a17:90b:1346:b0:3a0:ace4:d2b4 with SMTP id 98e67ed59e1d1-3a6ceaf84a3mr3933989a91.23.1791193832036;
        Mon, 05 Oct 2026 02:50:32 -0700 (PDT)
X-Received: by 2002:a17:90b:1346:b0:3a0:ace4:d2b4 with SMTP id 98e67ed59e1d1-3a6ceaf84a3mr3933979a91.23.1791193831490;
        Mon, 05 Oct 2026 02:50:31 -0700 (PDT)
Received: from [10.218.30.203] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78e4a1bfesm11565317a91.12.2026.10.05.02.50.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2026 02:50:31 -0700 (PDT)
Message-ID: <9f049a54-96cc-485d-85c1-58ee3c1cbd2a@oss.qualcomm.com>
Date: Mon, 5 Oct 2026 15:20:24 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: remoteproc: qcom: Relax PAS iommus
 item limit
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
References: <20260930-shikra-el2-v2-0-f0822be5aaee@oss.qualcomm.com>
 <20260930-shikra-el2-v2-1-f0822be5aaee@oss.qualcomm.com>
 <20261001-ordinary-cheerful-velociraptor-80c793@quoll>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <20261001-ordinary-cheerful-velociraptor-80c793@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: xQwwAL_MMr9GP9somX2GjodszQ1WFa9g
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDAzOSBTYWx0ZWRfX6DkqsLRHN6MD
 apqHEEKGIwCy13bN7iWe0KMipT1dwegY4aOP129pDcFzgJ/czgCfCvYXk87DDgFOc1BjPE13WO3
 /MHNPI4XnQcA6fsayKwzGVadXEZRe6E=
X-Authority-Analysis: v=2.4 cv=YoGa1IYX c=1 sm=1 tr=0 ts=6ac372e8 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=CHHwcf0ky9qZlHHGEQsA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDAzOSBTYWx0ZWRfXxGaAehzLsubq
 ZGo4UBXtIsVXir4cUrPm3S8oksQMVkXo42mkGYxFGekT1GNoly+6U8rXN9C+bl2qe4qQFLQN5QZ
 smiHubq4+Jq3dtn2cMa6gDWr6wiqWiOYMKDEwAy/V+FPpvM6nfmb6LKwYyD5gmvsbbGHzComO6Q
 +vLYoELgZkxlTBA2SjS37NNH6AUoLte4xJmH1CFBYGIuQ3RNq+Iu5Ey3327wyvqp8G9Zs6PW8n3
 ETAaHfWO11f0tFHkJ5sRJio8x/9cn6OyejpvsCBr+RRx2Tcvwv9JRjVSxpUfzDwSoAFJH6P7pJA
 UpLgC4TrcqA0UdyWWV2xPwvqtqiXMSFJbEXSjBE9haESP7teqTDMn8BnEygVkZd/Bf74gx3Hap/
 XTutVeTzcd60fGxV9fe7VOsYLDayaAhZ8X0o2LFDfMkXCtWxkkqLScsOlBQBbnRmifBIGTpheTh
 m2hIsrfpCNkyaQuwusQ==
X-Proofpoint-GUID: xQwwAL_MMr9GP9somX2GjodszQ1WFa9g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_01,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 phishscore=0 suspectscore=0 clxscore=1015 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050039

On 10/1/2026 2:03 PM, Krzysztof Kozlowski wrote:
> On Wed, Sep 30, 2026 at 05:19:03PM +0530, Komal Bajaj wrote:
>> Some PAS users require more than one IOMMU mapping. Update
>> qcom,pas-common.yaml to allow up to three iommus entries so
>> PAS bindings can represent multi-stream mappings used by
>> platform device trees and avoid dt-schema array length failures.
> This is incomplete. You just added two more iommus to all devices. You
> need constraints and proper user of this.

I see your point. This change relaxes constraint for all targets, which 
is broader than intended.
I will rework this and add required Shikra specific constraints in next 
revision.

Thanks
Komal

>
> Best regards,
> Krzysztof
>

