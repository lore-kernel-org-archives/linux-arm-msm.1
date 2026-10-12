Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAA9B49D5B2
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 15:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791818709; cv=none; b=cvr5QlikaXzCw9ZdhomOqH0MSgJfY2hgSsw15XWoF7Qhm3wNoIJWOyYRQgoBOhVnQDfhWUms4U1zPhGS8Dlr29w13VZxSqeQYjzBskC8J7ckw+VbYsYOOwvqtxukmgbHKUshIgbYXrXVYoz+wMrusW1yP5ig5EcgXcEGDNIjs7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791818709; c=relaxed/simple;
	bh=NIV9vhYhi+Bn4r9nXOWmPMXYzPFmJuXkh8mVvNNHbcE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iPZSIWUyjQYVzuxNAfdSDJLA2Edetsdy0a+n/vLI0pAJArEQdXPUoRp183R6/ZUnpUEASGrvoRDXUyGTZ9sCPZ+xXs4JYqqC59aymxd7SrjZJZw8XVjdi/t761d2K9SlZ2Oig8FTmC+MsCSFBe9MAoo6OnqDAJ0eQNuL8PZLDp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NBHK/CFd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H66r6PfV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NBHK/CFd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H66r6PfV"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC0WRa2252715
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 15:25:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NZe5apiwn/op4s13rCf0Ijf+H1F+RrDOUK2IOt7qJyU=; b=NBHK/CFd/ZrBFzWT
	aRJWhS0oEFo8PMHo//Ps1Vs36tFac1tmJGjQN7fgCwtol+OVmP+4/fx5B3BuPFQB
	EbOxccSkp5hFp62ycCh1v5hcteNRPmZR/JRMm1BL37vPh43jSmyTVvHehv3B6Ee5
	OApYBwUAK0nUyTRVLIppWCMuF2AfT6HkuoFvqkv2n87DmIvMPqxjIzyU9e/gWS0b
	Bp5972s/HfKn+OcWI64EQqZuxvJf/12K7b5hzDpBzf3BVk/bEfHDlq3xuL4U2Hzv
	Jv+bZz/GrkxjOB7xUJ/lLN/5PTgf+6HIUGeIHYwd2EAiKlvSqWuWHKbQ/cH4a6al
	WlZ4Lg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8j713pd7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 15:25:05 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7c0e2566d30so38696137.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 08:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791818705; x=1792423505; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NZe5apiwn/op4s13rCf0Ijf+H1F+RrDOUK2IOt7qJyU=;
        b=H66r6PfVzE2BVRL+0x6sgFSdPLzuO5B+3NHITiAlgXTRE52AHDkCfKnd11umdV+VkF
         8ITZDcoRXVcmO8Ag5QFu2pKzELQTOVcVxVZkTY2GQf8nfKI6/kIJn52EiC6jJcnnewTu
         nu+hWc1GaS04543CvQZnUJtGpXp8Sy5sptGRSdYbi6mlUPjL71ePyNwECgVYK/Eac8Zq
         gH2uFEWH5InnVDKh8y52MDi1UU59w6ebicMDC/F5N7PWrDcU/ntD8I/P0WTd+1wEnowg
         Tm2AJ457yjjnAaOeXDCnLFNrIhPdsi0j91bu9QKXPHKrECzkG1JGwQCeOaqbmEQLvipU
         HWew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791818705; x=1792423505;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NZe5apiwn/op4s13rCf0Ijf+H1F+RrDOUK2IOt7qJyU=;
        b=h3aiNdAoz+2AnBhSaCMvLp0+eO2DBu/Jr/T1LW/3khzFlKzRTaAe/onVtg7fWTVvy9
         g6l28S+xwek4D7XYLG3glFfLZeHGvw8ipH76Zq5Pj16u95kbr3Sy93EcWnfzKfBzleSe
         yd9Q5/M+o8b08tReFENEJJZqE5M2zXOQm+BVYqtIFT6jSvEqLXX4PXXt3U+8jMLvnNMv
         Du8m7jj5QasbWADXxp7WslcnT5ur2AcTtZfFiPbpuX1lTE6tr3i+KubojURFp1F5mjpi
         9EGPiGLKXRcEEtosUXTuTBW7uSupwwHwlatoxeqCPhzblF+l92BjfpNaMdvtC95FVAX5
         JvJA==
X-Forwarded-Encrypted: i=1; AKwUvBwD4mR8SPtsSZmB+Z9SGkg8E3m9F3YzDD8L51YB6Sp9MagmWfL1tSy5tUGg21RqzfxfEjvK/QxPZrGX8aFF@vger.kernel.org
X-Gm-Message-State: AFq9FYJ+XLID6E9jd1tFMy0cC6zyPkjn8xQu2mFf3iACPvp9zUJfiuoE
	JDoNz3/sCpHQ18VE4bnjmD6txXw93kQ1ApCkXI2rW5vRywl2IKx6WT+nnwqOR2Q9EsN0jpOH44e
	Cb0JTmR1ZuLZ5ohk28/3ByKEXi4xKHdeYEwW4YM0oJH6ymW/uzMIOijU4foyHFtE88dBD
X-Gm-Gg: AYBFou3PhHQJ3FTYuun9C3MI8b+jsSpmdAZT/iwxhkeRaYfdOWkJz7dYFep6hBPnSC6
	W0nZi5ALoS0rqQ9H0l3Y8GG7tZR07hXCica3vA53eTtZ8yrWBlhLrrsYKGmtgwaYz0mrDg2KqMV
	WRKMzNFTUypprZOCgFPuMLbmX/k8dFCMIGGEbF53ntjKt7Rw1mjuj8F+EHYWePLhlqWJeIGo8+V
	e8d/gZR3O62/yS/AiOb0QcQFZZphbusFRUGXB9QOpjj6n1ECGuLwojZ1WTu69Lq/qgMZtkNaf2N
	HgOgBt8HkdoP00v5l+lTap9q0+pfxsTNuuv3mTBAmepgqWmOXmpFf6gljM0xbWzegToH1qJGCKf
	O+jlfDpNaXpo+BNvntFUmVg==
X-Received: by 2002:a05:6122:a5c8:10b0:5c9:ac9f:b7f8 with SMTP id 71dfb90a1353d-5e91ef9f2b5mr1351481e0c.0.1791818705124;
        Mon, 12 Oct 2026 08:25:05 -0700 (PDT)
X-Received: by 2002:a05:6122:a5c8:10b0:5c9:ac9f:b7f8 with SMTP id 71dfb90a1353d-5e91ef9f2b5mr1351473e0c.0.1791818704381;
        Mon, 12 Oct 2026 08:25:04 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9766209sm479310166b.3.2026.10.12.08.25.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 08:25:03 -0700 (PDT)
Message-ID: <95de1721-4393-4afa-a973-6ed657a0b69a@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 17:25:02 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/38] arm: dts: qcom: ipq4018: Indent closing brace
 properly
To: Waqar Hameed <waqar.hameed@axis.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: kernel@axis.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1790892852.git.waqar.hameed@axis.com>
 <0436be338751fbbf30d8d6baee9b0eb8ad8d9938.1790892852.git.waqar.hameed@axis.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <0436be338751fbbf30d8d6baee9b0eb8ad8d9938.1790892852.git.waqar.hameed@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfXxqeBO0ILNaE/
 Qlh1hFmXMuIZ3NBD3fAg4Gk9wZUtDaMNFuWtqiP1+K0DzM62IYY+xvMAeuLsoZF1OOB+YoCXEYE
 /ug6G+HOBUErmXEvr1YDIHS2J4tjuLM=
X-Proofpoint-GUID: -NHIwnvj0-CV2y8sbtiUjP4eWNEyCwT0
X-Proofpoint-ORIG-GUID: -NHIwnvj0-CV2y8sbtiUjP4eWNEyCwT0
X-Authority-Analysis: v=2.4 cv=ePGGH3p1 c=1 sm=1 tr=0 ts=6accfbd1 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=3-RhneuVAAAA:8 a=EUspDBNiAAAA:8 a=K5Q5qJNcHL0jdGHZGqYA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22 a=VLVLkjT_5ZicWzSuYqSo:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfX4WL6cAewBvai
 HunSfXG1Xpb4DHzjvrc0MYz1mJ5pUsj/aWfYzNK6JXbudAzEf7D8+Cke21eqD8GXk/ZOKkOHTAu
 nnmf61VZE4HZPOi21x8mmQepv5SclojznkTQtYG7QHGZfqG4KCOnuo0lziLefscVZQSyno3lEBa
 1GCq+pbfZtHjblua8Rat3q5bnnQH+RCVJa/WHSjNEHsH5pZkGzzcGi9VdhYIJp3OrhQ1grdcUZQ
 2m75TlmXVUEevKwEHVObPKru07JJpKJkxm5g2C2Cy7sx4Abs0XBgV0qmjDv9G16HqjJdsCJtWSI
 urG+9o6H2T7+pqaW4XdLR3HpctXI40jEX2fAcZrw7hH1XiItpgeTgiHDVIY7lrxCubMCrKFWcit
 7rNS4GXG28J+tLSxenhmP5hEVXNYlq5PRA6bI8oIutMSA2pm1JxL7DXUfqTEQ62JCeUOZYVZaz+
 CuY5gh1jh6lWnp3w+VA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120061

On 10/2/26 12:36 AM, Waqar Hameed wrote:
> Closing brace of a node definition should be indented like subnode
> name/reference. Found/fixed with dtfmt (Devicetree Source formatter).
> 
> Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
