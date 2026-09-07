Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4704D3D6CB0
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Sep 2026 07:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788765924; cv=none; b=IzvZOEUO7xfh4a0be092RXF+rVAhKaoLKEkIbhzL/aLECeBkbuEqJcQj35p7kobgPhpNbJVx9ANnCSSrxCNDUUJZqk2ivGoaUFklaGdYE6No+RThVAFM+lfIq9t2PSXhcnyGa9uv1bOyyyyLGtc8wVr7dwluzGgMR1VA1CIik7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788765924; c=relaxed/simple;
	bh=45G384sHb/muNeqlCokryNPXhln5CIbFxbacPGlagfE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JyUoXFmilSdKUjWMhCFfWlwBUP5Xz5tMZxp1/f0ZXAkzDDvt8Ajccw5EQtyDXRpJKOI85H8j1xofKenvoPQTKTydEVRmQo4wxuKpcRYChpF3+/CajI9N0i/PCnvUW60nuhBi10JwHCAYtJC5GYOtLQ4GvgLZfL/ky+E0bmRtUIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XH2Pv31A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cLVwx1lo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XH2Pv31A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cLVwx1lo"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6877NNtu333056
	for <linux-arm-msm@vger.kernel.org>; Mon, 7 Sep 2026 07:25:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tse8UCFve8e+o+mmsY6iw6x2prwa5xpokEYT8L9AOhc=; b=XH2Pv31A0BcrwUNg
	iD2QZKkvWvkhY1Einw4iD2a6LSLoUku1j14bcUVQ9eVfkThzinmMCqR69LUw8gzR
	U1HFou/47WFx2Rv0pfJFV5eY6/UuZ7MQwUziRrDARaLrkGgC2ivvkw641BLMRIJN
	G9/wQPNrkEReJrml5/nWH2dY5116CdN1R23hF/LBeCYAJVApoiYsJqQBcu5jaBT/
	w0yaxUBTT1MykL7hngs+9VHgeRBY00zoNbWMcq4/bswB6vcrkWP/ml+r/gXnXYwU
	YUHmMUWF9q0Ftc81I1JT6Rk2PEwJodbvSROmbR7jq7RV707CuwPWFvOC+Ed6SiTN
	mW19LA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghrua82pf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 07:25:20 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2db22383e8fso33149215ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 00:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788765859; x=1789370659; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tse8UCFve8e+o+mmsY6iw6x2prwa5xpokEYT8L9AOhc=;
        b=cLVwx1lofadyfcO7l0wC27yr/UZThQLYZmslV5TmMGCFYeyh3BsNc39EET9TvSdx/W
         jdZZXBdbjunpZBBm8by6qED8zLJt2i2PpZnc5kPJRs8G+nvv20qxu0lXpnI6lWvUK3bM
         WMSbvWFm6xvH7oZ1rGYMwc/A22FbWl3StVNsXZKT3mKhO+aUkuOt7vH++5koYYEIqZm3
         bSxoBztwW+kVrX+u5gIVk329VTRu60BGzEwpc7IsQn2W4LeBgrxZVWi/Aq+DOZn7u1Y+
         u0dRBJ4AbGEvXBOgsBSuZqTEL4WpkrF4f+dq+kYhrJin/CiqsAJXWOf5cvDQoiQS5YpL
         5EWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788765859; x=1789370659;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tse8UCFve8e+o+mmsY6iw6x2prwa5xpokEYT8L9AOhc=;
        b=rBvqrK35cRpXERHR0obMWaqhTsp060io3jhjwloAvCgKKIJ5lZuVmOp7iVwkiXMUbH
         EDVyV92BCcosD3W5Dl8mbVbbj8ODlm6xtMDx5fYX5Bi64keJtQxZcwsPOgoh/nw7MOaW
         rO4zwUcjbHgWaEREt7r6nJq7/G0M7CcJ5htlkfHW6P4TIqrdPvpmxK3IqLGYny3Tr/nL
         SSr/47mUWDI6yBap1a3NvnBvLONKPeu47Z79cVxptb//c8hexQO6TmvMYCBADe+Jx2uL
         aKZUBpqLnpFFZ1UebPDtYtkbaZ4pjRFD/7s7X9J2BUJAwbUBNbS5lcqLCUawNt89IfYe
         1rMg==
X-Forwarded-Encrypted: i=1; AKwUvByHmFqGw6box1gEiI47YGGp16QHNGMuGnNL1CFcQFib7MTwScEOPzYjMrnAJvUMD+7CvYLN9Ea/5mp7egYV@vger.kernel.org
X-Gm-Message-State: AFuF++moXKs3oo5XWkWy2P9ZM0RSIqsoEGWnLRg2YWQNfbZGwCGF1qnr
	XWynszsfCJW4MsuUm/EKv/VmT2JolQ8pgP13Ra6afAWTasZdR/RoQum3yXX64zkDHOdfpde7ftJ
	8oDaykM8uITL52rPAL3aiMScMvsTRmLbza3soFI0/NgQMoLSUPBdfD/McdEIKBb716/Yn
X-Gm-Gg: AYBFou3v8uKQTBY+Lo6ES9asceLIY4Ehqv2O0HX4NDOf9UUdLv3hBlmAXqLWEs07i90
	mWMyaqzee1AEhDJgNHZwZ4rOcC/z8o4WfD7ojYD4J7Xc1YkhFEcKgfXjnVcC5PS6NG25sGzlYNk
	SpdyfcV3iNwWZJFumxqapevAQeEoFHA78dUr+HKNtIT7rpTQb55Zbe9t7s0qM8S3HJSbwuOgliZ
	gcEaP3IJ0I5MRxKqku2I6fvdtUEoWj3FQRfQXm+k4FVpZu3H4Tmynzsh7PA1P4p1OyIJxnDKMIL
	YHlYCkOeqoqDSl5wL7FDeG6qR0DvwKQUbvxyOlCdAAtTDrPuD+aCxTfJNMcUdna8qh3dTQUsvt1
	tIqFoQ7xgbhsUgZyLf3H2wjBdTADayoPJBA==
X-Received: by 2002:a17:903:37cc:b0:2d0:401c:2edc with SMTP id d9443c01a7336-2dafaee6576mr219280315ad.1.1788765859245;
        Mon, 07 Sep 2026 00:24:19 -0700 (PDT)
X-Received: by 2002:a17:903:37cc:b0:2d0:401c:2edc with SMTP id d9443c01a7336-2dafaee6576mr219279925ad.1.1788765858714;
        Mon, 07 Sep 2026 00:24:18 -0700 (PDT)
Received: from [10.217.219.15] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b123731sm23938529eec.18.2026.09.07.00.24.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 00:24:18 -0700 (PDT)
Message-ID: <e677e122-8653-4de6-844f-b7ca7154e3c0@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 12:54:14 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/2] i2c: qcom-geni: Add dynamic transfer timeout based
 on transfer length and frequency
To: Aniket Randive <aniket.randive@oss.qualcomm.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Dmitry Guzman <Dmitry.Guzman@mobileye.com>
Cc: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260827-master-v8-0-596bc81c5cf9@oss.qualcomm.com>
 <20260827-master-v8-2-596bc81c5cf9@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20260827-master-v8-2-596bc81c5cf9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: vyOz2YPYEpsl0Y_G2FYv0yNahJa71lLu
X-Authority-Analysis: v=2.4 cv=U+aiy+ru c=1 sm=1 tr=0 ts=6a9e66e0 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=QSOts3N8JwC41gCs4uEA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=ZXulRonScM0A:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: vyOz2YPYEpsl0Y_G2FYv0yNahJa71lLu
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA3OCBTYWx0ZWRfX4ibpFb/1DSUa
 EAlRhDmZQnU6UiXer8jKRnB+b/J68c4n1oIAd8x5SRziwUmdgH57f5cFA5Shmwv5bNSNVL1063a
 As0BSxY39/AnoJVXKIbHjsYr37+ZpWA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA3OCBTYWx0ZWRfX+y2F+uP75Deu
 PJ9SJdVO8OWJ8pPGtlnPFsewyY1O9iemEmxaEJKQAArIdNJlBCk2GVGJFnPATAMuTlVhfTBYlmF
 FaEGcevafXy8K8qHCaRHa5tXiAEZ8cxCA4qD6Pwy/xQpJ6szPu6t+B7iHXpcyU9PT6pyGSolBTU
 VqONf+tVQTggEASKSO8tjZmCAi2QdKBoWmYW7FXnUhrSeP6SmVr1PTcTypV6bhfSnEQPpnT+jli
 gufsFBWY40aboV6LkXtuIPXzuPsUsup5gcw5H7XCSBdVRJeQM/gx2tsol7uFwrxPUmDzyFcsgw5
 0iLFonR5nnEIuMZQ8jBZKSvc17nNmQ6DXgSx1WV00iXsGRLLlMfCTQwymI8iiBgB/iWKw9FWEPE
 Tpuj5redoHUL6ivf6HrMqPvbnUwhURSjJCJNRwkRa8Bf3oob7iK1YEDgV0Kz533lgJoS3yeAQr6
 0H15PtdY1xMNxJ4eakg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070078



On 8/27/2026 5:57 PM, Aniket Randive wrote:
> The driver uses a static XFER_TIMEOUT of HZ (1 second) for all transfers
> regardless of message length or bus frequency, causing unnecessary
> delays on error paths.
> 
> Use i2c_update_timeout() API to calculate transfer timeouts dynamically
> based on message length and bus frequency. update the timeout per message
> for FIFO, SE-DMA and GPI single descriptor transfers. For GPI multi
> descriptor transfers, calculate the timeout from the combined length of
> all messages, as completion is reported only after the entire batch has
> finished.
> 
> A 10x safety margin over the theoretical wire time is applied, with a
> 300ms floor to account for I2C clock stretching and other situations where
> a slave may keep SCL asserted for an extended period, including faulty
> devices holding the bus.
> 
> Signed-off-by: Aniket Randive <aniket.randive@oss.qualcomm.com>
> ---
Reviewed-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
