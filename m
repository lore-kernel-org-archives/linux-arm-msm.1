Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 455CA3B6C1E
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 09:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787735450; cv=none; b=fiXIurorWr6K/aYq7w3FemQyjSClTCjjG1AE2Qfdtli62Wo58U2IvcoxdLGFmSZFOfRwKT8SgoRpJsh8/6RU3jsVC4XvdP2hzMG/d3FXErqS3sj6gW4qhOvtDNVA12h1lwdhQjLmlH2dq1jmEbCL/ka2S2THe6kYx3VRQwyrlWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787735450; c=relaxed/simple;
	bh=PirOP/6mYyUgE3g3UWc2YvcMbozEvDcezFy2iEvLvTY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=clQd88piNcQohUREfjKHgrUE3UJizdbqvdHshnFgCwbETQWHRq1bepiUK0yICo2zOC9lqkJhn8e0gFyES11UFpbotuyS9qR9nRFCmkee5YJXSt02o3Nzx9uDVuxGVfw6rn9KqY1pcLNXwUYKtB0fLx974iPSuw3IXKkC3evIjno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dIbZPxKo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RD9C98Zo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dIbZPxKo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RD9C98Zo"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67Q6Rltf683482
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 09:10:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f81VLDmDdPRVFVxNVVyj3Y13ljPrGbTUOnFCJBpmiMQ=; b=dIbZPxKozGPAxqSO
	IJW3qrtnZps7x0SAml2qQknW+TSw6ixhchQQEo2b4tTa3gt1hmKQkdJ8gYlWeqtU
	v19rBNr/9nC2CFji3bCilP17U5Fyf6+a8Jr10tf0GgKtS+3c0RCoMTEc7ZqJozzg
	tHAeaqj7XFv7t4XpSglV57LIOqoHBinlkiQOb/Nd3oPrNOvXWlrZTC61mJ3s8O0s
	+VtZUc+f3L4RXAPShAKdbL1pWnOORslQNvUYqmU5wJ/dXEYnhTbF6XTRyVpAuNCF
	gnbqp6/f2pU55IHH9M15/rza+xm7WE/anGyo89tocm89o74YX/mKZ6FjcLRmTHp8
	vIi73w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9fgxk46t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 09:10:48 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-930bd2bfc45so16275585a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 02:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787735447; x=1788340247; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f81VLDmDdPRVFVxNVVyj3Y13ljPrGbTUOnFCJBpmiMQ=;
        b=RD9C98Zoixl1ABDSpOSH/ftsC6IkKlevV4i0VYJs0a/2mAc3NvCf8FDR1DlnNRUYoH
         M/HmBcW62OeUgKzRzTgajdLFyEdrzWjnsOKLcHkvbKUbXf8PpmTv/9kaYDoZWplU1TK9
         UPNieLfBmvA4MfY4tXZAWiHJr6/7TOWpMmQhh/4gaHeBOeih+BCebfItciLjiW8wKvDR
         flv3bj2+GNky26DvZoFSGx6eXOjHYtrG4raRz7MGqrBTx8Q+iOsJDWIvzMigYIsYqPB6
         pMSi3iZ+k1zAzNehr/BHKzA33joBLqdm/0sHhCty4wm8YWNTdOZ+raEbctmxnaqMT0Zw
         BJww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787735447; x=1788340247;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f81VLDmDdPRVFVxNVVyj3Y13ljPrGbTUOnFCJBpmiMQ=;
        b=ryEwgoe3y4EooLLfNSLDm0PpeRJr7I3HGokzo5dGL2uvDzleBsnKzsRxtkIAw9lu1G
         YHDfsOz7C9w8/aMF6AJHek5TDulc0bUOLYaugCsKBEqgFGqsmkd4w4PHgQ7X98WVf4T0
         3oZ2whVsmdqhF7ZgE4gFenxN8yLnqn2h/GXQfvBO8EA5D3LHe5Ruzw7Z/k9rBD84bzhJ
         ZeswtD1jOfZb0TPDiriEE3g+CLD3oAB1sjhsS599sv451MCX0xy6ki/poM++ZwcJ1DaS
         /OeptgIt3sdunoWhLPuoNr6J7SZAHTyXPC7KLTl78vKz41fHb+y2h+ZU6bD2vq/9eSTT
         l/hg==
X-Gm-Message-State: AFuF++kAA0yveKsXwf67u0FrCXGzscKsFuXwg6E+yvt1dRTNfZHNmDdy
	x3/2+uqD/DHFSbSHwITfV5Gjbt8Lb1Gjsdr9b8Qlfm/suHIIqrpgEutPYlJ4wtzxbKn8WaSWBN7
	7vO7rdBwid+fZ1YxHWnk3wPVANmccSCJIA5fscpcttJx4jkwWzN4c6YSb+7MkwmqWhhah
X-Gm-Gg: AR+sD13DMuT42NicYxXkx62gguIqyh0hp8TWXJtX5rkP0Yh5iJ9XChTd+/R1ZiALp4P
	7zdJmRpJY0WnPDpQpVnIBQKE2VnFN92oVX5ubMrYH3QNOwmCcrbHzyJvgcKRwW8rnD2PBeJOHl2
	8ElgwT8FNA75AFSt1jvEjlZiui38yFUnUeeseuLPnrb6dr4iuaVqe2FdIbAzCDRutH2EXD+BL0L
	EuU71LiqtdEE+52wcxRtHUKLiapaNAep2vNVANL/pWHM0SFwjaorPECzD5BAdYKi62KKyFxQuDq
	qh2RbraErpA/9PYeg71rXC48KVu5X5R0CFbpS9ufilfPtx8bxe7uW6IB6zfhICQDw+EtEADJMtN
	90Gm9cgAkfu/hQ00uQqz5YalI
X-Received: by 2002:a05:622a:1a8c:b0:51b:ff78:f229 with SMTP id d75a77b69052e-52e424e0c1fmr33738671cf.5.1787735447541;
        Wed, 26 Aug 2026 02:10:47 -0700 (PDT)
X-Received: by 2002:a05:622a:1a8c:b0:51b:ff78:f229 with SMTP id d75a77b69052e-52e424e0c1fmr33738371cf.5.1787735447108;
        Wed, 26 Aug 2026 02:10:47 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a88a928sm419424366b.33.2026.08.26.02.10.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 02:10:46 -0700 (PDT)
Message-ID: <371dfd4d-0c9a-4496-88ea-a3e8d93df144@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 11:10:43 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] arm64: dts: qcom: shikra: unreserve GPIOs 14-17
To: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260826-shikra-dtpm-v4-0-8476223184de@oss.qualcomm.com>
 <20260826-shikra-dtpm-v4-1-8476223184de@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260826-shikra-dtpm-v4-1-8476223184de@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=MqZiLWae c=1 sm=1 tr=0 ts=6a8ead98 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=rJE1ynEhMgyPisKzH1EA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: zV3TPUZUaUfQwm_PNrl4ENhA4l82INz_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA3NSBTYWx0ZWRfXylL5BYsUox7S
 nLNjKwQM281MwKavajLnvRZQj2NRpdItq1KWrcUXOdIMIx4OGbMkM1M0qr0YdxVVSfyULPjrB4o
 MtBFyVndMPU+05/RwbhMfUN21Lm5/wl6Nko8OBysIZZSGi8MK8LuC+rxrwpBmrdfy8kvKOFOOXO
 kmj2jeOYQA7uxBjnCgcC3mtwSRA8OrBp8Iz1dT2UeRY+y47PR5w3br4FmbRHQWnRyrTZdQNIIu6
 ebWmmJyxuKnG5+UpN7jXJB/hZJJAnVnQ4qaWPFpWDGnu7Zi892h4Vmsxsd4OBYqKlpK4eCoh7Hk
 ylgsVh0auonBvz25wvCwMxTn353WifiIvTWK4tXWkM2yT5jLK/ZPVVMMdvL2L+ZK/iPJ2UR2wM+
 C5Sj2FF7n5IizMQ4Lpk5R2FLOYwc0VqU8LauS4xSU9L5gX+AJ2kcvN+yLvu30WQhI0N2eX8ZPCD
 5D8Z1lSHZo09ezxkbtg==
X-Proofpoint-GUID: zV3TPUZUaUfQwm_PNrl4ENhA4l82INz_
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA3NSBTYWx0ZWRfX9Vifx9u+IK6c
 zP1bHxrQzR9WorOOK45hRKhIYBhnwbNUbfUgyyYo3hYiz1hG7CfK+dDCWrVsL3FPaYyMxO5KDO3
 foh2dn+ne6KJf9WaRqH2JhkljTGF0ao=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_02,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 adultscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260075

On 8/25/26 9:13 PM, Khalid Faisal Ansari wrote:
> GPIOs 14-17 were previously reserved in the tlmm gpio-reserved-ranges,
> preventing Linux from accessing SPI5. Removing them from the reserved
> list across all three Shikra EVK variants (CQM, CQS, IQS) enables it
> for dTPM usecase.
> 
> Signed-off-by: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
