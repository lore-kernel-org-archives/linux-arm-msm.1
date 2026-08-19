Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE2664078E6
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 18:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787165226; cv=none; b=o/upDHU8BrH/qObxpU1BXJTdexgOCJ+M1k4ULWSiaPQ6Jb7Hrq2uhB8oznoS2E2qGHn+93mfO7FptE1pXXHwqvn/Uau2uyPY/kV5yun9AETvQMcSSRDxhesXX8ggKcXoL5FsU0Lcf2vGcoSc1qXuGw2Spv5XMLdLOfzUfIwdDEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787165226; c=relaxed/simple;
	bh=pVSU6gHUpkTMnxWNpZUmMtCp2mdCd6zb30kwIPKQQzQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JoCWqQSj0/9CJEJfXfKojge4L1jpkevkxmvV6uzBf7jPpjH+ea1uQiEUENryYweeUFsE2Avj2u/yIj/yPm3j9WrJ5rZXD4cunr+eDECHHulaDpd8rekYX5qXWNtMa24LKlnPG3mek/zWxHb0N1voVvdfWUUJIu6IczfvblGM6IY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n70I7o8U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dypJNx6X; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n70I7o8U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dypJNx6X"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JHpvdG1347997
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 18:47:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6Yc/Yaq/1tNvDQT+aiXe5wGFwh7/kV4QkVEEgF1RaT4=; b=n70I7o8UQD5AnaJa
	W1Z7vz3BbmerZRR4gLtKA2zGdLBfHavc12wstK2qv0i6dmBU3GROF12/HaCZYZIJ
	bGmykFQJKHj6j0yHYFVXyAb8OWWtQU+91ZS5sdZGRriTVCe/qr/KNUlr2yZqGJU2
	AOdu9ug27otBy8pvEny9AagZysY44794HBENF0l7YQ0FTsa3aZ/RpqceqrbM2u7v
	L1sxCgvCc/ETkokknIvyoKO08Sq80F46QCcx/WD27z5C8LQAkS9S/F4m0ZaH7Vhv
	QZ0D0+thkjNbOrRU4PS5UwdWZ76IuR4V0r/9KSTk4NB7l7maCNp9nz+nRO9oIHwR
	is1vcw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5es3h5jb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 18:47:03 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cc5faecf01so26798735ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 11:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787165223; x=1787770023; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6Yc/Yaq/1tNvDQT+aiXe5wGFwh7/kV4QkVEEgF1RaT4=;
        b=dypJNx6XNyDHGM8wBDSyh6PQ7b32KL4fJxD05YtnuXRcw2jp+jbgY5RKSRjaSqdXvZ
         xL/u9fa60dpruSIW+PerMx+9K80vexRzPj+rwEc4ufZd+3kvZQUp3nKck/ScM6N+6CGQ
         SrSI43SwsfbrAXvpjUMFzc+xl70wJLKa5cZzD/fJk0581TtFKAK66JAxCMh6+emSOXgz
         xI/miYEicMrnlF+h4C2rbcGvdlelvDjurb21rBTAQAIJnuFx/YdK6g9+ufAk+VUYsz0V
         VSsAR8Y83ZectEXfGsAlBgTGXUQOnsB3cVdGqPpx+LwZuNMplLgCkQLGsrmPFf7j2K0E
         kmnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787165223; x=1787770023;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6Yc/Yaq/1tNvDQT+aiXe5wGFwh7/kV4QkVEEgF1RaT4=;
        b=oZpwEmhsjRAIR7tZ1oPeMHcv3S6h6mZfSR9wy+xEh6tLDXnssjcTttRnt3xxOJ+fuS
         rYSPfufwFPzagISJR1YmFrqGWD4srsiWBeuGeSXM5YIc5S/kC+/NB6pvZzpkUukEvGqp
         ul0BpOfO1kTolEaEovS6nYUzOcvjM3ri2lY47kiwKSlY3bJ5ncZPCuzWsFeedHsn3Jvp
         qovVFOX73PZM63/nWCXV0kicR7PQMx+KHbgtMU+KsbO2ZXn58h6sjLNVl7wAYIXxc3Pv
         xRz6Y/VItMncf/boZZiqxyrnqL3Pv98RsOxfsyR1njjxNmo9RxKyGgyAAvBeam9PLwZy
         Smww==
X-Gm-Message-State: AFuF++lGN/dlVGApus8bdLvtIObPwg+efAjGRiMU1+Y0cJfpBmLnE1wi
	sYxZDGdfBhH4XuB68oUJlS/fdM/zFSiE9ZQUS+btXV1hPCLTXJPlarWQgsF/94+0SjlrEc+MWvi
	VsD9phWgW2w/qCv6F028uvdNe/bUSD3GXcB6AMeGTxZyAN1kzBNIOf7W/gZOYfpvXctsa
X-Gm-Gg: AR+sD13E212WAYwp9dSVbqASwtmdb1J6gNL/LGTW24aRpABkHFXg07Aw3AbKkZKvS9E
	fHoy78/43DWBwbYL6vsAMCctQWa2QbMt2OeFkZs+EeEuvUDUTIItsxxwKs8nKqajrmH/CTJNK41
	9qnJO0zV5H8mODOfmYD75nVXV+9g8GhrJlkovuVytOnjx+UzSemCYuWuNLFKpBlDnv2bwpB8MCZ
	qL+I7RoxX6jz75T5g9s95KhJDeDR5TVWcOW0NFWuCj8WQ986NBiZxr4lc7fGAqQRG42p25cbU9q
	9RG2HLXvIDRu2GlHAZikSfaRxaowYqE3SBlp+TIqAocMi2ngjpbJOX/SdCrEnx9revqbPStPAyk
	5CHiyxbluWSeLuXr02LDInQ8ZUQ7pGIvJVGE=
X-Received: by 2002:a17:903:b83:b0:2ca:e5c:7fcf with SMTP id d9443c01a7336-2d5fd5eaca9mr129476645ad.3.1787165222733;
        Wed, 19 Aug 2026 11:47:02 -0700 (PDT)
X-Received: by 2002:a17:903:b83:b0:2ca:e5c:7fcf with SMTP id d9443c01a7336-2d5fd5eaca9mr129476035ad.3.1787165222348;
        Wed, 19 Aug 2026 11:47:02 -0700 (PDT)
Received: from [192.168.1.5] ([106.222.232.233])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bf173b02sm9094410eec.27.2026.08.19.11.46.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 11:47:01 -0700 (PDT)
Message-ID: <d85712aa-4296-4890-9db5-143a004d6eec@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 00:16:57 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] spi: qcom-geni: Add shutdown callback to quiesce
 hardware on reboot
To: Praveen Talari <praveen.talari@oss.qualcomm.com>,
        konrad.dybcio@oss.qualcomm.com, Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-kernel@vger.kernel.org, chandana.chiluveru@oss.qualcomm.com
References: <20260818-add-shutdown-and-panic-notifier-for-spi-v3-0-8b62c4bc2d21@oss.qualcomm.com>
 <20260818-add-shutdown-and-panic-notifier-for-spi-v3-1-8b62c4bc2d21@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20260818-add-shutdown-and-panic-notifier-for-spi-v3-1-8b62c4bc2d21@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=UIrt2ify c=1 sm=1 tr=0 ts=6a85fa27 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=5XCNgjhq8C3qGxAi4A93cA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=ay6fHbYERNCo5qgovOYA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=zZCYzV9kfG8A:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDE0NSBTYWx0ZWRfX5l587cC7LX5R
 BNj3kjl7pfVprQpzCcew6InQ6waRBy5DWr7MUaumagS9A2UVoHJklC8DzG5YZ1Xc0hdwGJlGYBJ
 28mJ59IZPs2OHpgVqxbrL9OHqiuHMNRHD6+dncj1NxRQ6/OgFUJuHaoRxSVZlJyxnN6ayl7fbMO
 k78hLmiktyVMIBC3WKvDA1yXscov/4dYEDvTTd+7cqbv1UHxGcqkcgmqKr4xLWf+RsSFgps4Xi6
 UNYaR+4tkytyWrFFeNpoRInuwYadCSuBgX/9WNumQ19rVG68jSC6KkpJNOL5yzsJMmiJxcoTrhy
 Do3rW9aeYRb/MgEbi7gRdOu2PON6HAJyNAlyfw+OsWJYzGV/8uhL75YPtf1/OM3rDtDvOG6lYiR
 ApuT1mTW7FKXwUbOBZ+tWVu0kb6pZkpW0L4R6FHKp3uW1CYS7NSKClMV59dWeFhif9CKWpTiX7a
 g/cts9YVhZOVxcs99ZQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDE0NSBTYWx0ZWRfX9bAi+QOb2Ui2
 KVmAH/foMiH/MgeN9IsFz3z3zX317ahmJZxEBacHkRrGWbK5YunB3oBJZ/4MC7KYrKfyMbbfnka
 scFfcCJsltjc/5p1/OqgpR2eT13eYI4=
X-Proofpoint-ORIG-GUID: o7pNYsgRbwgcrhPvR-3RfYyoT1OCujaj
X-Proofpoint-GUID: o7pNYsgRbwgcrhPvR-3RfYyoT1OCujaj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_05,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 clxscore=1015 phishscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190145



On 8/18/2026 6:58 PM, Praveen Talari wrote:
> During system reboot, an active SPI transfer can leave the GENI Serial
> Engine in an indeterminate state. On VM-based platforms, if a DMA
> transfer is in progress when the VM is shut down, the SMMU can raise
> context faults as the DMA engine continues to access IOVAs that have
> already been invalidated during VM teardown.
> 
> Add a shutdown callback to suspend the SPI controller and abort any
> in-progress transfer, ensuring the DMA engine is idle and all IOVA
> mappings are retired before the system resets.
> 
> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
> ---
Reviewed-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
