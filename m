Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6876138D400
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Aug 2026 09:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786093553; cv=none; b=MPGxBj3qP1Y92HNOXfXZBW+pBsn0d0YtkslzJAqQU78OCHgx+8MPQ5fLShcRMlXoRjuLo690sffGU6K816H+8sLWrU6xTPey0FdQI+dtjr/D9F4scfcqe92T2ss9m4Di04LpAOh+PAweo7M4PbuKBX6u6dH9YQX9Oj5YpGF1trw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786093553; c=relaxed/simple;
	bh=mGv92fPDKTDgi/M1tLT70EngJtlD2QV5OTlgO3iQp98=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FKWganIP1RA3Z+b6G4LqceJ2JDYiLGHvtCnzAHQWT2lNw/FdkMPWsJbgqlZa/HS8FFHYuSlX07KhfQkirRcFbj0PcNbWlnaf92iDTgp8rFK1E9NQXkbUiOwQvOr4ScVaWSB+kMqXzl0jJQ5gnvVT4CE1MuvTAuIrRd2ASjRr30Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D5hsLqOk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TXV3Z1yu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D5hsLqOk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TXV3Z1yu"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6777u28p3822004
	for <linux-arm-msm@vger.kernel.org>; Fri, 7 Aug 2026 09:05:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4sMy9lKdqb+KnOmevtsdmhiZovlqPN/jquIBmM3Sjng=; b=D5hsLqOkLmOcfch+
	/R+z92Z9TjUz7IuofH55zEL12WUu4g+vdyZH7e9s6PvUzdREE2mW4FLedJk6t4DH
	9j4ZWWnSL+7a/JFH5jjOjTZdzQSwJr8GVIrRf8FREJBiLdRW1U+Cr5UlJyS+L52I
	0dL0lDNijmvoIX7Cp17SzUIpVf/BA6LqTpU41hW0UyjS2SRIhEoT8XoL2Fz9bnPX
	xWpIV7Tdh1lA3FYqOSQpXQMxGsBgTWP2mdUK18Uz/VmC9RQlBootvHuctIAjmjbO
	u2Jip0xCAx5x4PJVL5c88t+1qcadZ4QtJTPld5EV4KMDNaIfzQLF6jbdPhCFadF+
	fbwLiA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvy6gu6t7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 07 Aug 2026 09:05:48 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c96b4f58ddcso2615916a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Aug 2026 02:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786093546; x=1786698346; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4sMy9lKdqb+KnOmevtsdmhiZovlqPN/jquIBmM3Sjng=;
        b=TXV3Z1yurrScqn7ZYxWpZ6LkWaFaoKjRljL8qDl0FiTG2Vb2qD4AyN+GhGF6CHlSKE
         KSCu9Ep313NifakyfBfp0WYx1ux7+0V0s9rdVayjLqOjhtssjcyBw5+pkScSb9eujQFC
         3psE6NUhPUMyO8qy7PgsHcCIxS/mTESu0IprFdy9udGyPtmtPuSbGurPoXPxKDUiWOzZ
         2nTBduXGSpP5bSauGsXSwUNmqCCXWMjVvyW2LGKeo083NR2AC8DcfRMN7i9MHeK1xF6i
         52VuA0YeB/DxXft0ccOMeFmNWaA6U2n8jTSUlumhHjyPdYqk255i2NbDDjYV5zd29oUw
         J8yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786093546; x=1786698346;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4sMy9lKdqb+KnOmevtsdmhiZovlqPN/jquIBmM3Sjng=;
        b=KhZk2BxEFM1iryWAGx/BjZPXxp/2qtSrzL85sSbUDzBDZ0PTKBo+wC7mdqgKyIqkEF
         j/CZnt775wBba7D+5SSDup9+/3UwBVNVqm0d3bxebCxazg4Aq4SVrCPZpMJ+jX8fFwJ1
         RZuRN27+j+VmPzlbjQMz5LkqcFy0soutzkGh/C9ZimDIydM5ov3Xqh34yxfquwwewp9n
         jHkQItUbo7YfR9jb4hZuIaV/9ZDDHEGMraGpA/RRDMW1YDz5b5mahKl9LP4wjHc96D6M
         8qbGxutQ29sSJcuJT6XRXyoG9Xz9hLbApJ/gxbZ/O3P47nLXX44ZAOLfv3DcnIu+8Xtt
         VK9A==
X-Forwarded-Encrypted: i=1; AHgh+RpItod6XpSX/jvTxETFEeska9CWKnXNCWXsW1wdaxpVupHhCCzFUOWgZUCxf4fqhBZ5HrHgKJw4fy6fgnrI@vger.kernel.org
X-Gm-Message-State: AOJu0YwCyQIXrEASjSCba7B4pwSnfpqoT7GWFuB4QdYbKJsb+oB1n6Fi
	yLx7USBPLAF9ESvH805lozDN4Cy+p9C83UlPYdZP3is22CGKD94SyfZJ4SV4UThyC8BqD3WITID
	7BwCpw14FH1GqsxX/j//ovkfQiBtHwiEjOZ6Ly33OBlMKPfIXir6LWeh7ZclidM1wTzuq
X-Gm-Gg: AR+sD11h1ghnEockqQE1tnAh6rUwB3En3towUrMOKDlkoZIS9p9JJqiyMUWd8zrGi6P
	ahwKo8H+3Sl8ZGjANcfpKNtvg1dsx9NXHcrg2gB/530a4i1OgSuKRUyI4cjtWXYGJru4RwuPM0W
	jh2Sa7JrF5V9hQsO4FNfnFs5efzo2Db1MNNZ+AdPNtlitmnpd7e43OtefugGIBEOeTXoT8sykWu
	Qr8t++lJPQtGu7yu1Um3McigRi89bbrmp3Q2PjgEIBGCwAkUIs00EW0H/HTQl6XiWUMhamJW0uV
	u0mp9oXkjqfRvaTFq6S91GYd3ywBL7kvIq9LXNQUFmWYtnTpc3oS041Y26Tjl0+vQBcTIueU11D
	EpKRFhi75K0r+UxBYep6OqnUv+4U/5FD1Zn4=
X-Received: by 2002:a05:6a21:4c0f:b0:3bf:6d96:ac40 with SMTP id adf61e73a8af0-3cb85ded9cbmr27306318637.12.1786093545883;
        Fri, 07 Aug 2026 02:05:45 -0700 (PDT)
X-Received: by 2002:a05:6a21:4c0f:b0:3bf:6d96:ac40 with SMTP id adf61e73a8af0-3cb85ded9cbmr27306225637.12.1786093545435;
        Fri, 07 Aug 2026 02:05:45 -0700 (PDT)
Received: from [192.168.0.173] ([183.83.142.146])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315beb88413sm7785014eec.18.2026.08.07.02.05.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Aug 2026 02:05:44 -0700 (PDT)
Message-ID: <a3856ad7-f522-44af-828d-eaa1cc91484f@oss.qualcomm.com>
Date: Fri, 7 Aug 2026 14:35:29 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/22] media: iris: Restrict lower IOVA range for Venus
 and Iris VPUs
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Mansur Alisha Shaik <mansur@codeaurora.org>,
        Andy Gross <andy.gross@linaro.org>,
        Rob Clark
 <robin.clark@oss.qualcomm.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Pierre-Hugues Husson <phhusson@freebox.fr>,
        Marc Gonzalez <mgonzalez@freebox.fr>,
        cros-qcom-dts-watchers@chromium.org,
        Matthias Kaehlcke <mka@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Aniket Masule <amasule@codeaurora.org>,
        Malathi Gottam <quic_mgottam@quicinc.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Jonathan Marek
 <jonathan@marek.ca>,
        Dikshita Agarwal <dikshita@qti.qualcomm.com>,
        Renjiang Han <quic_renjiang@quicinc.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        stable@vger.kernel.org, Daniel J Blueman <daniel@quora.org>
References: <20260807-iris_iova_600mb_fix-v1-0-3996f67e33f9@oss.qualcomm.com>
 <5pnnu5nc6tpptw2wriq7r7mxcjvn3kvi5auz4vqffdent5bxiu@k5pbypgpgexl>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <5pnnu5nc6tpptw2wriq7r7mxcjvn3kvi5auz4vqffdent5bxiu@k5pbypgpgexl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=EYH4hvmC c=1 sm=1 tr=0 ts=6a759fef cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=eVbXwf39F0J6/s7D6zfB/A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=LEUcfjZBBKQ5YW9IAxkA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: iKQz_pp0xxWSBp93C6Bkj0tRkGoOslbU
X-Proofpoint-GUID: iKQz_pp0xxWSBp93C6Bkj0tRkGoOslbU
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA2NyBTYWx0ZWRfX/O+CN5Ot0s1C
 q43aMNOz14QhrAGIrXqZd8BhSHXLHi01+stq8YFC/yrDfVKVkgLPC5spEAefrdIigN3S772g8cQ
 q2vab/KoY/J10kCl/OP9Iidhn+uIZ3Q=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA2NyBTYWx0ZWRfXwJZNdk+7po7C
 TVjy7JDL6RftTfbaXG3bzySzUKHt2Hl4Gsbb0RSHTKCNSqVrJjwYW2CKWrA7DOh4JAi89381Qy2
 zLza6n/1WqEXYd1ISqsFQcdHfWdmvgAGjBWJdPg/H7gnsG32fiJ2mi89/viGETdHmzDPETkMav0
 jgHDtQjh5WZMSVOwkkxlYeNAFDblk9fvNGz+ToaLlBDsz8JgxUUAdsRk+j2FiCDwcwRJ/9jupf8
 S7UepC2HK1ViJi6pJfJY134s7aey9oA2GsgWlxJ78VBp83ecC1lRinGT4f/8RY4cleeUoT6h3Or
 2IVGZjd90kXKZngIH2RqW5faZY/U3y5Hl12FlZ6sQb72tGfN7NyU+cLJhEh7x4wImJRy2hZK38k
 2iq/57GcvE61n98ur4s6+Mxh3Pn3XGW3O0KSt1IEpyb+Kv2eTOsbMQlVbh0wS5KJXhhRC8A2lKS
 uj5qfwT++aZpAHFtaGQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608070067


On 8/7/2026 2:29 PM, Dmitry Baryshkov wrote:
> On Fri, Aug 07, 2026 at 01:54:44PM +0530, Vikash Garodia wrote:
>> Qualcomm venus and iris VPUs reserve IOVA addresses below 0x25800000
>> (600MB) for non-pixel stream ID in secure mode. When the kernel
>> allocates DMA mappings from this restricted range, the VPU generate
>> unhandled SMMU page faults, leading to video failures and, in some
>> cases, spontaneous system reboots.
>>   
>> The issue is readily reproducible on affected platforms by running
>> multiple concurrent video decode workloads, such as opening several
>> browser tabs containing video streams.
>>
>> To prevent allocations in the restricted region, this series introduces
>> support for an IOMMU IOVA reserve memory-region in the Venus and Iris
>> bindings and updates all affected device trees to reserve the low IOVA
>> range [0, 0x25800000]. The memory-region is referenced by the video codec
>> node, allowing the IOMMU layer to keep DMA allocations above the reserved
>> boundary.
>>   
>> The series consists of:
>>   
>>    * Binding updates for Venus and Iris schemas to permit an additional
>>      memory-region phandle describing the IOVA reservation.
>>    * DTS updates for all affected Venus platforms.
>>    * DTS updates for all affected Iris platforms.
>>   
>> This ensures that DMA allocations do not overlap restricted IOVA
>> mappings for non-pixel stream IDs and prevents the resulting SMMU
>> faults.
> Some of these patches have been sent already. Why is it again at v1?

By some, i assume you are referring to the 2 patches from Daniel. Kept 
it as part of this series to maintain the continuity with patches across 
other socs, other option would be to bring them as dependency and drop 
them from here.

> 
>> Signed-off-by: Vikash Garodia<vikash.garodia@oss.qualcomm.com>
>> ---
>> Daniel J Blueman (2):
>>        dt-bindings: media: qcom,sm8550-iris: Allow IOVA reservation memory-region
>>        arm64: dts: qcom: hamoa: Reserve low IOVA range for Iris
>>
>> Vikash Garodia (20):
>>        dt-bindings: media: qcom,venus-common: Allow IOVA reservation memory-region

