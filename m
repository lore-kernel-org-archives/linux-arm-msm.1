Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB83738DC67
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 16:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785430641; cv=none; b=q2JdOE5XysgHGRQSt0zjBQRGx0YNIrTa0sUL/ancczYQ+HLlbXJ0EqxVNiWxyMk0VFA9CKCaIfCSGipQRylWqKQVzPSp1mkxui49gczJF77tmDsbKSq98iuavAyUVEX6oBW+EDr1QnwHw7jxdUx5ALQwhH8jT59cl008n31roIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785430641; c=relaxed/simple;
	bh=2nZ2qmSUU/MnB94cfmHg1eSaMUWHizRc7cA68LCxT9Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j3mS2c0Ft7SEecy+yHpoUfI1dSfqQNAIQGwK1zAvvxJ3hy5qQnqezE9tTeAuhTD/Vu2DMrdvcnbf2+NJ5NRkh4AKAKd4CEpJsD7DN4s08ePf5gNMCRqYHzN/RRTIIIoWbPoTBlRgtaoSWqnygLsRaDnoCobOYNGaIhrYh5aANO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cSu8ug3w; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XNe2TGTZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cSu8ug3w";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XNe2TGTZ"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UGXdeq1572125
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 16:57:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tWXrkDm8PYw+2jYpqr8pQTpNKyoYlnom1vxlAG5j1HA=; b=cSu8ug3wIZTzAzod
	bQw3ku0SroEOOqa5YoO+aA10UeSstk75AzkvdT+AQTnGfU9hU5gdub0ShM4f+OE/
	z8x7+ay9Xn6G0bzXC0TGixTZxfXV6P8qiEk74l4AdYzrPz+AH4COqeugfq96t+EL
	zP6ksAtrOCnbEJtXdY5DMEVRhE6STpGQdDzt2NydbexPLlFSPRPkarfx+n3xoxqo
	9HOL+CHccGQpczkCm8EdgaugRQDZWRI1w8G+5J/DP8hEUTCY4Ra9w9Cq/ioNiZaZ
	CgGjAmCYh7CCH3iNLeLi2nraEp1bXiBiWLoXIyvVVK7oT9ByBBXML6/ebqbAKIKm
	KBP3zQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr891gw78-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 16:57:19 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-90520763ceaso158406d6.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 09:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785430638; x=1786035438; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tWXrkDm8PYw+2jYpqr8pQTpNKyoYlnom1vxlAG5j1HA=;
        b=XNe2TGTZ2C9fF8H1UTWBw2FXfhL3O3+ROzZP1JUf5oCKzHsDJWK2omQQweACpSWoBK
         H+Tpq7B6DlKCAGYykQNg/dYKPlpfspDLChr3Vd0k7nzSMWSA0z3tm5163cS2gx9Tn3QT
         MbMXPOrzKkta0nCLb40YI5MWoLuAWSXDLupbRLkzebHK5oI/B+ZY/XeK2mc7XqVCKfrn
         lgp1deOH/qer0FJCnnN5ED75nKzbKlaK/Wh9U32os48UI5krvDbrDSK+IfBUjUvXGmd/
         1Z2btjSKw4qayPnnTFU54WaOKGxDe/kAbuTyMRnUf68jnCb1ybPGBA+UHC/hjQ6ZQ35d
         RgiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785430638; x=1786035438;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tWXrkDm8PYw+2jYpqr8pQTpNKyoYlnom1vxlAG5j1HA=;
        b=FkYYvu26J1FsYc8/Ypbzr71TuePX2lJN4EQlIvUBudLwL3aDyl7UCx8w1jGteONPC3
         J1xRFpp7WYgz0HpEZqn6lmJksZl7qongP3Ozm8BVgFR5tNmjQ/NG25JTEjy4k+V2Aj+q
         7HsyOA/+4q1bBvwbFCyRPMhSSb9fGMW9mWfnLb6hmYT6jJk7Jg0lITVojiOX2+z9Gj3t
         D4wvcqdqDOBFP4fhDi7Wa5go9ljXDFZbCngyoTAwvq/H9cr8EfneiIrFEkOoV8Ax8UGX
         KYbJYW7cx4rurYrQ9J9iil4P981anBgB6PM/hKiOYCUFEPbRoJwmv4lTBQrFDozIoAKK
         RbqA==
X-Forwarded-Encrypted: i=1; AHgh+RoCuKlEtz22rC03+kXfxXUFQ7VRTfA295/UXzIRPk1NvsWw0kzSo+5DL5I7BjRSnY8geUC62vKqbaZnzfzC@vger.kernel.org
X-Gm-Message-State: AOJu0Yzg9LNLxs4agflcD8IvAqxSuetZ4MCHQ2Tv8l5J593VbpfX9oHT
	F1je6/IExbNdLQnV+C7uIYe6qx4ZZcIN26rQIVHlIBAHM3Ere/A9oJnz8Gp2w3UYkzL+zah7qOT
	OyaYnXrmkJqEAXbbhjw2Z301yDHukW/+tpmIMvdbVrd2qHoNK7Hb0RdjGsmY/69xMPOnl
X-Gm-Gg: AR+sD13muGWrx64mB9cPNxvxD47IXWBU1+ZQlVwmgvmvJz2nPzL+okeuDMQAf+HqtHb
	kIccls+/k2Te4FvV7lIPcoGPh/gp784cHo+PHjCwSgwtXKFYzxELIyzjpJqpyZfFQ3EFL42DAL2
	3o4CqxEgP6Rrt/5hTkt96/Tu54wPHtb0et1CzASpLmwa1seiigjXPxAsC5+G0+KV07lDgRCWAyw
	wb2stkM47Lg6/98gHsafJx0dLd1sjqa10G+JdBqU5EiRT/KO3W+ZOFU5qPot1I6YQN/unRCelsU
	FQaeOlRnV/gxmn7tvXc/61wZZPDIJc76pSn9TqShTYvGHtv+NcRN5jDKFZ/0MALC6zoaNOTOeTm
	5k08v0C6KXrHHMgjp6QIeQ+Dh
X-Received: by 2002:a05:6214:268a:b0:8ef:4749:b1c9 with SMTP id 6a1803df08f44-9083bf38fabmr12450886d6.5.1785430638125;
        Thu, 30 Jul 2026 09:57:18 -0700 (PDT)
X-Received: by 2002:a05:6214:268a:b0:8ef:4749:b1c9 with SMTP id 6a1803df08f44-9083bf38fabmr12450246d6.5.1785430637531;
        Thu, 30 Jul 2026 09:57:17 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fa851b68dsm95334766b.3.2026.07.30.09.57.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 09:57:16 -0700 (PDT)
Message-ID: <f5516024-15fe-4b4d-9fdb-695d1f2149f3@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 18:57:13 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: taoyao: Drop adsp_rpc_remote_heap_mem
 override
To: Stanislav Zaikin <zstaseg@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260730085422.631896-1-zstaseg@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260730085422.631896-1-zstaseg@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDEyNyBTYWx0ZWRfX274sZ+PAXDtV
 TWY0VAb92NBev1HrHZDxNm3TpMKHU53Rahp/YRx5YXTnBtgCN0l9JcnsGs2B4TYKHl6bNoXFu5Z
 UREwPebI2YXHvggsM2a0mGKnZJdbOOSj4kEevOkA/EGyWmG9vnki2nJF+oIabuwzLbwmJPLAx/W
 DzKMi4OjkdDHWp+FhfXJw1KU6w0sKOXvA1Y3s2FT0sPKlolxW4dj+23lug4ApijtErQ3RExt1kR
 8XTtZQo2fPp0lp1/AoVYLF9eKDz5O2GKEOwu/yRu2mGTqVuProThSnKQYLU4QKB60UgVBZGsERV
 OUuzCDUoyYZjUvSOjMXp7kyKL8Ml9iLSU/lTqBY4Ka/MkSDhiHny/pdBQu5NiiUpPT2zoZuqrqk
 zNJ/mKgC34/0mUNQKIpJrHDfkYIaCrJnsHc3SdBXUMS/btGWAcgl4JvSfEmfDm60qMZ8q3LLnbj
 18TCFS9RqJaZyvkC3Pg==
X-Proofpoint-ORIG-GUID: iTjHYI068uKWNi6Ja4I-x_qn2DVtds8U
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDEyNyBTYWx0ZWRfX16xFGUbp0FGL
 kd3Rwh4W5PTFl5DcFMK9HnhuJhJdWyupFSpQjnQk5aOKY00F+4b1MMv7kr9r2aHjP9P50FzDr5F
 9A+hjPOthF3SNpxDQ+0m/oyrZMo4Dcw=
X-Authority-Analysis: v=2.4 cv=PdzPQChd c=1 sm=1 tr=0 ts=6a6b826f cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=ZbrFkLYBBdIbrGIsR7IA:9 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: iTjHYI068uKWNi6Ja4I-x_qn2DVtds8U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_05,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 adultscore=0 phishscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300127

On 7/30/26 10:54 AM, Stanislav Zaikin wrote:
> taoyao originally redefined adsp_rpc_remote_heap_mem at a fixed address
> to avoid overlapping with cdsp_mem, since kodiak.dtsi's version was a
> fixed-address at the time.
> 
> kodiak.dtsi now defines adsp_rpc_remote_heap_mem as a dynamically
> allocated "shared-dma-pool" region instead, which removes the fixed
> address entirely and so cannot overlap with cdsp_mem. This makes the
> override unnecessary.
> 
> Remove the taoyao-local /delete-node/ and static reg-based redefinition,
> and inherit the definition from kodiak.dtsi instead.
> 
> Fixes: 28705df5d0df ("arm64: dts: qcom: sm7325: Add Xiaomi 12 Lite 5G (taoyao) DTS")
> 
> Signed-off-by: Stanislav Zaikin <zstaseg@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
