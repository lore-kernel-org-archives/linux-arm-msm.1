Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 228C144C656
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 10:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787136356; cv=none; b=qTtfPRuX8gXvxQVIqxR8vYCM6kGbR9u+qpy4/vJ9887IJGJBkAIkrBi/d9M+ONFz5Yf7x6dF9glGCgPErocndSu/S+uEthxby+wLbC+Gj8wcGMJWCD2phUUEKmXCyQryhPaQKUZQTEcpTMbUx4Az2Nx12B7QusOcHV3SsUmd8vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787136356; c=relaxed/simple;
	bh=7okmRphLqV8C5vyS3WimCvmgoZ6DsPPFI9j8IvYB7uM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HcZINOfZ4w6lZwDXpwdclf3NTVBRBuG9wzntsT1+nruRha+17Q17QiJnFLYe6354E32OfmWDhgbJae/caKaJ6B4Z4UszCGkammaRxMiJYVlEGim0ENZaxSbRABcrjbBGEEXcpB1Uh3XheD0I1eVJoeYwyz3qejA8p2na6wzeny0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Co46MBwD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WP0h6+O7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Co46MBwD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WP0h6+O7"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JA867x3216328
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 10:45:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7okmRphLqV8C5vyS3WimCvmgoZ6DsPPFI9j8IvYB7uM=; b=Co46MBwDfoTthz9H
	QUJcEP7G1NtTj/GjNlYPAmkJ4C23VHtndBZeLywQoTUXEJhm1KdLSPcefv5OtiMm
	kytkQfJjol1dhzLJjl7Vjsjwa4nNTFYH1bZ+EgVK3D3uwBQS0RMnUla2pPXGnSPf
	rTWIbigDOKCPKlzFPCfC6zFURKvyCHNJK7Hrw8xRz9nFSowDEpNvccqc+NKUuZ0l
	LVDR2iXxf8Rr9gNa8Cw7qk3tTOeNRQAdpba4GUGqEOIXG39waoPwiEcY0f6R2Iqb
	c9HhuohQxoqq5hY+zO9zY4dstT4rwIjsie8F0lt7CUrfJQRSjCDPTNsooCpzJvHw
	zSxYbw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfm2rn2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 10:45:53 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e661ce1dcso19963385a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 03:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787136352; x=1787741152; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7okmRphLqV8C5vyS3WimCvmgoZ6DsPPFI9j8IvYB7uM=;
        b=WP0h6+O7Ja6vL0jj3f44DmPt0JNRCRwcVgTm9AJizilDwt9fA7sg93iy9XWzXS2YI+
         lvIjhvc+7r8XtBnWu7qRb9VvPG5svDiG70LdDxbVdW8qYvHOeBCDT2RUy8JgchlHvsLg
         4bo64pEv72viYkUZqaCP0MLM2V2AvFEIvNPMmm6TR0gjgLJ906EYzyNlzqOmWzSW3bR5
         Y3WuGqYlN6MeebJ9Xu8ATE6avCqihJhTMpPAaSrzBufNAQZjhy7h1kOaG/O1LXgrnazF
         PXSv1JJXrOizAnGKfT1TyT7HjJag0aGnwPc7ZQG2J1bT9Pow1rrmlu5otFqXrD7NhYLG
         i1RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787136352; x=1787741152;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7okmRphLqV8C5vyS3WimCvmgoZ6DsPPFI9j8IvYB7uM=;
        b=JBpi8gyMtLZzuTqQtEoqkpL4XnXEvTECE46CvcIdey8TA5LLUNT10QZKj2bZAAol+S
         n5UccasI7jPy7Pt5yOMfORDnOsUXHxVAQWExdVRsW5H1djtdST+Fj0YyHag28FC+0TPC
         f3CjGawGHUneA6JOyjRJX3WJaqNWUl6Zl/q6WzBa1RIV8UI3FjPq0J9lWQioPWcyCcXp
         Ll1LjDGRHBFEaNqCZgEGnG7mpi62YJjFZtmK2kR84cBjptteLaflr0kMoHyM2s4t/0rh
         ZAp/6uLMbeEc9izYJh/7kLiw/fhQ3Rgy6c07Q5JwFmJTcpbXDa9idKYAuq0XmIix5B87
         FDmA==
X-Forwarded-Encrypted: i=1; AHgh+Rqm4r8kZ8ev9cDeDhEa/KEdunglKPFsOSBhNaa95RpoT3dUc7cmHX/V4kPzRQNXnSlkhqnbknM6t4NB893W@vger.kernel.org
X-Gm-Message-State: AOJu0Ywsio5LRJFN0JxLkB52ymKh52gECpWt/apJtwbErHgaK4wxPx6L
	Kgh1SaP6K8sjK825p7vs51nQdUvnvg+nw77h6d+CTPOJ/26HJPjCeQ1DR+8pZqCbctt0EYKRSeK
	kzHsLFObsaD55wrUQ4qRNMcpBfSDVxamoyhW8K0FfEMkknTrhuFo46qwOlYv6r/VjzSXF
X-Gm-Gg: AR+sD10Zsa2gqHfhFN1SdxvzEK/WNfAcERgZPg9QhIrB0szoOQzgumhXkklJ8+ONcpm
	3EhrBxX5SxyjmmgdFbEfuF8vPGB2ecyFzM8tNBsrJIu0R/zT8i8uvZWjmtuat6MfdvquGcPUMXw
	GCw+ilq5e/dS56VfDlqgtPPbFFDBdiIFGQvSX6/eu4WzAQxJtmZvGHVyfASe0En26S8i9hHClIu
	NBHN6BC5iUlPT5AfPkFSdvLVWRVzdCDfjCl7pxF90MLJcS8Y650w5uKXS5lx39IR/hCyF11CYKe
	e2U37PzLkJYOx5Y4G/UhS0irRaFzzlNo/VliN3Wes8xPUImGwFy78G6F33/nVW8XwqTONzlv68Q
	y7KyhMyVx88u+f+8XLSJsWEbh
X-Received: by 2002:a05:620a:4614:b0:92e:6485:f640 with SMTP id af79cd13be357-9371e7024camr222458585a.4.1787136352009;
        Wed, 19 Aug 2026 03:45:52 -0700 (PDT)
X-Received: by 2002:a05:620a:4614:b0:92e:6485:f640 with SMTP id af79cd13be357-9371e7024camr222455785a.4.1787136351495;
        Wed, 19 Aug 2026 03:45:51 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3feec9f4asm749470a12.3.2026.08.19.03.45.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 03:45:50 -0700 (PDT)
Message-ID: <f4f25633-668f-4217-8e64-d77a38e4770d@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 12:45:47 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] PCI: qcom: Add register dump support for PCIe Link Down
 events
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260811-regdump-v1-1-f22db3fb37c2@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260811-regdump-v1-1-f22db3fb37c2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 6RGU24T9cjicDUBKDGoK4gMCBukhXYNH
X-Authority-Analysis: v=2.4 cv=bth8wkai c=1 sm=1 tr=0 ts=6a858961 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=6SV30oLp8BWL7HE82y8A:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: 6RGU24T9cjicDUBKDGoK4gMCBukhXYNH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDA4MiBTYWx0ZWRfX7l2/Ruoqd5Bn
 hS4cj57owJD1nT3dfnb0t2K7a99ZQUGcD/wbj+e6bMsfq1elNsn4cYh+pir5UfRlwAF6dkHkbnr
 nLuImN+677qncZYScwfN+aYIB3gmPsIGRxQe7ZTykOPmGsIT1pWyYVjgkRmhHTFETTAs+R+6J3Q
 EqDjpH24bE58SDWpNf2OxmoznqenECvjPl8XZ69o7UtLIQ7Ba2P1ponlRLBAaByHRmtZndgatrT
 /TkftUUeWke6Ai5CPrDzbRKNnQYysR/RT5Anob1vnF+iKaRt21WbVudNnS/OmMWpF6jsT5AnQ6o
 iVxQgJ57Oyqiau64dvySB2xC0FUzCfw4xURE4zRRtNhJfRM4gHylMp6DS7YFfpg0Z4pdB1u7VE6
 snC9g1lbti5T12/05AF+I/YzM7d9SA+aAdXPB82sqa4dn9CX/jMUBB/SsZoh4Tk+LofIFrsfLWw
 h3UnPTxv2cUMWxnHBFQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDA4MiBTYWx0ZWRfXzj2bXGI5rvl5
 9dy4ubajMG8KCw5L6E/QZrV88B3y1I/+PDuG564y3hSilQ/2IOpdZCW/K4SMGefBqvtwNuQkA43
 eJsspGPmVssMyv1Wx1FnGPezvItYPeM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_03,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 suspectscore=0 spamscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608190082

On 8/11/26 6:12 PM, Krishna Chaitanya Chundru wrote:
> When the PCIe link goes down unexpectedly, being able to inspect the
> state of key controller registers at the time of failure is valuable
> for root-causing the issue.

In this current form, does this patch not cause the splats to appear
for non-fatal linkdowns (e.g. hot-unplug)?

> If a storage endpoint is present downstream, the dump is printed
> directly via dev_err() so it is visible in dmesg immediately, since a
> devcoredump read from userspace could otherwise race with a storage
> failure. Otherwise, the buffer is handed to the devcoredump framework
> so it can be collected from /sys/class/devcoredump/ for offline
> analysis.

I think this is a bit too much, a single implementation is enough.

Konrad
