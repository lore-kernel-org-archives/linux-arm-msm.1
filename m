Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDA46439F86
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Sep 2026 08:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788770183; cv=none; b=b5dDnbwTC2Fpv098hSnSWUaWwylwZe6Aaj+n88zDHK4hdxz6C0aqTgQYfYBZD8cWhPqKc7P4L1+ptHvQWumEdHpXKQvLCoJjtqi/qqY+prioZonxfsJ0t4k4AcSuRhZ43xREWGz5muRP5FI/6bgfBQx2NHNdL0EKSwoX0M00DL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788770183; c=relaxed/simple;
	bh=EpBUO/pktu1LI8wvjTUn06mzyNUlC5RiWOtI6lhLAN0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CdEdgqCsGpwr9nfnW8IiRg3A9yye633FFVuGijWcaWPGZRyicX76lTxja99MM878eICmNowHBMqOLKBO+XbyelvRaLpHQvx1P4+/j8Zto3sBJyttLfyc4bEj/xGNjB/unHmmjmvz6wliiYrx13mPXw76Gnj5vgWzRhnsktJ+p0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a4/mycc7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PJK+SZB1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a4/mycc7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PJK+SZB1"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68777fef2146300
	for <linux-arm-msm@vger.kernel.org>; Mon, 7 Sep 2026 08:36:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	32WO/Xjsl8YBeCXk6vwKWTCZYT8FK+KYc95D1qtSyg4=; b=a4/mycc7VI8LHTRW
	PvnoRVwH/wOGERBA1yQa40Q/RMmfXKda5WqR2myYw3gu9wdSrE69ojWYoF2JQo8K
	THtCUfpQQMxPifvZATjjGLQEwolM66QXDJToEVZD40jAdV/vopAfkhXMpulOLjR6
	44MYbNdVqeW2ZjYF7uMqbC4oanrz+7EW/lYbrssJOUJNTeacBKALNDvX9UGvM/6x
	m6jD8W6N3HtMVfBhdVVAQOvDo0MhmbcQ5huG18ziEn8OV1yGUjthJqFJDFDo7yEF
	kt5AaByK2nJKBo7tOy6Pp8iXjU4hA+CLiq0PfLh/d/XxxcOwY2VSmVGQ0qG3XDfE
	sKhhIw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ggc8jdvp5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 08:36:19 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52845bd815bso6126071cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 01:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788770178; x=1789374978; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=32WO/Xjsl8YBeCXk6vwKWTCZYT8FK+KYc95D1qtSyg4=;
        b=PJK+SZB1wd4Q2tCQVle1fQVf4ID+feyIU/SfAuNfpZ1GH28mYDVvD8IMW+XI0Lunx1
         10no1k+G/1ieS1+VxFYwoWgPULo/V++sP83j+2tT7VMuIoH1tkn9R8haAejrDGr44Shr
         Ry5cUizHrYYcN43CU7nkoDAKJgfaqsXPQvtjTxk2FMv2C1/5R8zp4hvHMrs5uJxsVO5L
         6wEYJtaGLYUj/DuGV4wkpQD0gIDZFi7ytLyiOL6eWKsRYn3VhAyz1mee1lcOOCDGnCYK
         UsImCxy7GyRt4CYy7d0J5XNJFrImjpfNXvIPt1STXqn0rJ1BdlS6bSQYPw2bJKReXS3D
         S43w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788770178; x=1789374978;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=32WO/Xjsl8YBeCXk6vwKWTCZYT8FK+KYc95D1qtSyg4=;
        b=mz0CBS8RpsptIIhKP+1wY0xknfJG9eq+2C2P/nhtvsgAvke+COn4ymkh9U9vKd31Hq
         sR0X/Re+/m7Ogx8dc+jzA2f3nV5mUeAtydv13FOF6nlZfJ1r4BTuqsRvaEOaYw9XrOcz
         ndJKqe4XQ8mPdBI5hUlQBmu4Vj39yua+V6i3fU79+vtENlIB0oRfaGjJDZ9v28VEcUPB
         DrSdnfc5DKpUBbEB2QCmlFSLWHKVc1By8EFsDGfNK9NxlnMJLdbV8mfvTmhADUwNfRSH
         nOpMDSkDhU9o9mVCubpPUWbxaX0Ao3jJxjucKez2mcr81Ku/Os0hJY0lmCP3QmwsFi7B
         quZA==
X-Forwarded-Encrypted: i=1; AKwUvBxmq+8e1uUzG6DKmY6E8nbFMI4UPDpiSZfd/w8b+NEFBbqufAeRJEIEynOTvxDWV9SzfH/cfv/ctZeMsC5j@vger.kernel.org
X-Gm-Message-State: AFuF++kNYej5aJAXEenjCkDUB3vsmeQ78o4h6qHhQ2hyr/QAYl55SwFJ
	e7BINCxvuBKNbRYj947MpmwOiv45ahT1BXh1s+9v3iy3Rrn6ehPFZqKnkSQ3iI2qJNnLXfuUPB0
	E50yip8yIRKUj5UAkqXg3gjRzet47fJkNGJxG/jXHF/v2hv3p/1EzDsN+m/6G8dUFlpkq
X-Gm-Gg: AYBFou0Ky2LCIZSEol2GoZ7oKAx+nWo/n4VdnKjKoJtYUwlAJXrTlUJeEdyG1RYbly5
	wjjpl+Lz2oawwnhEiz6OTMADUiFjbl4LC6/GBv75nGBqg0/zkZxmBtyW8dDztHxBJcSyAdIBh76
	dIZHLGLrGSaAzNpK5aCxi5emqXG1g3DFo1j0yH+t81uP7nL3ockBw7lVpPc68m5lOe4FCD2nFKk
	3kmWhfPve4S9AE5iEhtGUeEGTYQrruKLMP/3ZxSabvsAMHQGyTSRQMwZG9EGIz8Ex5np7jZpHVA
	ByooPbfHPCJIX0BRBp8FETm6JjIEdY1XvYsaGvKHslc5nq1Qr4OJUyYH6iYFvH2Xt5wNx8O1zK0
	/Lm8dI9S72p0eB2EhetkrXg==
X-Received: by 2002:a05:622a:3ca:b0:52d:8270:8e36 with SMTP id d75a77b69052e-53064793ba6mr120479961cf.5.1788770177991;
        Mon, 07 Sep 2026 01:36:17 -0700 (PDT)
X-Received: by 2002:a05:622a:3ca:b0:52d:8270:8e36 with SMTP id d75a77b69052e-53064793ba6mr120479771cf.5.1788770177667;
        Mon, 07 Sep 2026 01:36:17 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a7e68c3d88sm3973687a12.15.2026.09.07.01.36.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 01:36:16 -0700 (PDT)
Message-ID: <b84cb955-2ee4-4865-9bb6-3fec074f451a@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 10:36:13 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 2/4] soc: qcom: Add modemsmem for Google phones
To: david@ixit.cz, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Richard Acayan <mailingradian@gmail.com>,
        Petr Vorel <petr.vorel@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260906-modemsmem-v1-0-a3634b553841@ixit.cz>
 <20260906-modemsmem-v1-2-a3634b553841@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260906-modemsmem-v1-2-a3634b553841@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: FtZghGNI70wuZyJdYacG3eKkTjm3Yxw6
X-Proofpoint-ORIG-GUID: FtZghGNI70wuZyJdYacG3eKkTjm3Yxw6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA5MyBTYWx0ZWRfX0E1ym5KnWSAS
 26dxZLDlTUZmHV8q3VaJZVGfykKRQ8KRp8xI7iajuJOVCzyEIEoERo9R3mVcWurOLpiuVRKpA3i
 7Ab/GZePJIv9p9KuLuPKc+J1bZObx/QjO39AbLtVFKoFJeGooAY7ucu7R8GKToF3l+SaBqB6vnu
 4GG7HT12D11z++aYH457zxfxW6FWyMmE/C2m+jNtc1hXXzvEy7qNxwrHCsuY2EfLQ9SrwbZWKtU
 X4EdJY7x4il2VeUiPvywRbZ4+dA7PFglGQLswFFzlAdVeL96epwGT8m1MTTfm5Fp+rroNrJ1VIt
 Q5X6pFfHCJ/ylRG3QcEdabQ5UrFUfo7/FfoQVQiuVJGOowZmYXoDGV6nF6CjVbXlkWW3HUYKkct
 pbi49hEhaEmUcn1BqkzAnx71JBVXqcbiG5gdNOi/luTG+eIgRmc/cJsWQ+I0wcGAklGqMQfjp1J
 KISopxlnk9EdRVzrbXw==
X-Authority-Analysis: v=2.4 cv=DYgnbPtW c=1 sm=1 tr=0 ts=6a9e7783 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=pGLkceISAAAA:8 a=SIia9Xva6E6vu_7LpCQA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA5MyBTYWx0ZWRfX1/EzJTDybCAN
 in0T8bE63bNQRrGXhKiS6BDx2JulqNvFg+l9l83AKm9MAXREoS8mBOqe/ZjYbZtXMwCY2KtcA4S
 N/Om+eLmA7a3rrxoVDs+kIbQaNNMsaw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 bulkscore=0 suspectscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070093

On 9/6/26 2:41 AM, David Heidelberg via B4 Relay wrote:
> From: Richard Acayan <mailingradian@gmail.com>
> 
> Modems on Google Pixel devices require extra information about the
> SoC to be passed through a vendor-controlled Shared Memory (SMEM)
> channel. This driver provides this information.

[...]

> +	ret = of_property_read_u32(dev->of_node, "qcom,smem-id", &smem_id);

Is it ever not 134?

FWIW you may find this useful:

134 - SMEM_ID_VENDOR0
135 - SMEM_ID_VENDOR1
136 - SMEM_ID_VENDOR2

which you may find in various downstream kernel used for various
purposes

Konrad
