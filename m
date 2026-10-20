Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792476209;
	b=5MEVuPHlDWD5gabtyOFky0f5xbdfdrYQVv6val38W5ojSP8D4upr5xeWjuJqorP4XIWT
	 FPM584QG3qBSsNryU+wgphe7+Vj7JQNpzMTDv8pnTa86B66BS2c6r6PkmOeKwI+yCAC1W
	 Fg8fo1F9O4z1WAY58ql+LjLa4+Ovp5Ia+oKzhpCXS7gEtWYdXxiZcgYJs/ageGlFb5bcg
	 zOaiLa2pRoNBAXIjIFGSn/Hk+efwozQJJHPmtVDWVQC+WJ6pTtYSidi/vr4UcBGXJqWe0
	 r4xbRqXHBF2ZokER/+aoxo+9+mjg2Xuu4i6SHdLP85o8cBwFFL+Lyjf2YE/ixvsHNng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792476209;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=p8cJylFC2g4xbGQA1ArE9XXjG87bsiOPk+iTHEazeWw=;
	b=v6uFmv/NWiokXdN1e3AmBEOVEUX+nt1ikUSVulxnNhzJA7ep8yM83NoSJ9zR4J8GnFZn
	 VsbmWWTg0wG9hl2ofbaVgoz4Yud6PAlkeqsoL6wKjyTjy1UutB9ZK8DtOF1SMs1aK1HJX
	 gNjxPFFz+bvxb8NJZGZ27rt9UQwSbsh5vYiEsR4cZGO9Hs/CgreU9CsqXhVjdfDCVVzf7
	 gIwEUfjxNMxYsYTmhf/5KruK+M04+k3Ub2nrSx8atIrTzvfNo6OO5LKRq2Tt864kciPKP
	 m6Ft1q1XlWS3WBrAr+lqgZxgeWP+YnL+k1t7v/XonzKlHK/9vxNpHmdlEBQeVHtekEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lsyykRCx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=He4L9fa8;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11934606A31B
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 06:03:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11934606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lsyykRCx;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=He4L9fa8
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K0tItp4178062
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 06:03:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p8cJylFC2g4xbGQA1ArE9XXjG87bsiOPk+iTHEazeWw=; b=lsyykRCxmk0X2yMV
	fC0SGhNT+34pD5YUjJp7LEeqLhnm/671lV9hjYQ7GpUiL8JdhBFjsQ1BkTneatSq
	OzcBJMLf9+nfPk+yWvMpQR9N7HVoD1SG+dbYmOyF6Ci5v2d9gn38caRuw+SGFLXO
	TNdE+sMV8Hm8ny6ho7RzOJ0Muqn0x+9LQvQIEWYd7tsJ/79v8KJY7c03/CNtkLVY
	rh4lAGKQNDwvT5ouWvBTXUJ9Nd0YvqMJzRncjmuDIqENR0pkF2EU09pp8wHNoYzp
	TvnVJEXqhrMDgjoojBFvfJzNPMhs17mhXMI36tl269a1kAcA2lUkz+mBZO1OOEyO
	IFIJjg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n12c0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 06:03:27 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f3960dca5so41380485a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 23:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792476207; x=1793081007; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p8cJylFC2g4xbGQA1ArE9XXjG87bsiOPk+iTHEazeWw=;
        b=He4L9fa86t3Gv7XrM61vN902fWUmrLK/qPnB6z+oGm+G32Z6aReXhp9kwcnKDbOhXK
         K7FEjN1zJ4nueR7s4s46iN3y9QTpNa6l13rHUAzzG0Fe/IYVWegLjMvuzi1RXqMhBPoy
         T3fEpeTCimeTTv4K81PxJac5dRdLbqjMTmWDFIqtbM0vg08bBWDXZF7ujR4/ayTYCnxT
         q3nVMsOzT3pKXnuy8PRLbttVhPFLsolWrt7sqJB342flOWeYADZnYvBKa/FyvfWk6Pq2
         YXO8qzlfTLg6aoclSmYWiJ9kh41y53hZ4MWc2STvKDXr0ewneTm1sdFFAKrrLtp2tSOF
         SGvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792476207; x=1793081007;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p8cJylFC2g4xbGQA1ArE9XXjG87bsiOPk+iTHEazeWw=;
        b=yXkS4NHTWrMLTxL7fBaJANMXmtz7Mer1fW7pq+wSO8aybzoQpkgRMIWfgyKn235IWR
         bu2pdbuNcwgps1DhMUoOtPx5xBPN8EP9cm9WxT0J1DoK6BrEI2hfY/7l12yibkuVm8XY
         lTxlCZNfW43dvLI+CiwmVCy4mdk9H3V+ufwb93NSYyU18rzn7suCLQBM/sH9aqXGWFgx
         aJEs7z3mnE5E9mTT54cQtTybnSOOQ5+U15kFnp+GhW0EK9/U+k21pI9GrRPNwXTcqD2P
         cmA7DULC9DKCPqtnUwZSxUmvDkCKD3OYCiNQlFIq6T6pXYR1Uwh6DUxJR/tjhs/XBXu8
         PqLQ==
X-Gm-Message-State: AFq9FYIfQHNllncE6FOw9McntYQctNIFDVvaXJH1wS25fuSZacM8lcFq
	kp1qD4O6y2CeRBYjj+EPJeVJsVqqrHPazXm/7TNskPcF+EbrPUN9SeqQDxW1vGwvSZ9e37o3kB7
	xknPQfbBxc/EewS7eA9H1NtoVa2ahiRU3X5b+9G0xc9Yk8DKLqQvVOAF9pJltAQLgkYD1
X-Gm-Gg: AYBFou3s8eywesXQW3h7GDblKumJUgV3MQq4MG1smRE0qMHqgb/wfwVFSalaoi9ml+h
	UG+xdK2zW1sGJveiRVYudVluwlcL8Qyn4DN9Od2ypoI+Za/BNmOoc2j1Xpb/S/2/uUDiRv3i6Ez
	E3jVE0iXFqdC/iXnXIuhb9SouMFVSTxg5E4ALhXG18iBTR+je4wKfuEeXkUAgs/GrwwzW47msju
	x7hBQj2iopFWG/WZvLpZlIx/hxNdO9or3dPPJTd+VLNtaV3sBN2TdrFH4mm9w0aEFhu/kzPxDWq
	OR3THYta5UUbLWQCxom1kCi5hY3uccgDK1pMnNssLYoiiXDillQwfHDhygY5Jbgg+pBdvb3oG+l
	viHQvp0w=
X-Received: by 2002:a05:620a:3728:b0:93e:5a3f:ac13 with SMTP id af79cd13be357-93f29a0a71dmr1879895685a.0.1792476207130;
        Mon, 19 Oct 2026 23:03:27 -0700 (PDT)
X-Received: by 2002:a05:620a:3728:b0:93e:5a3f:ac13 with SMTP id af79cd13be357-93f29a0a71dmr1879892685a.0.1792476206592;
        Mon, 19 Oct 2026 23:03:26 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c409239a167sm448288766b.84.2026.10.19.23.03.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 23:03:25 -0700 (PDT)
Message-ID: <bbfb11f6-0a8a-4952-b372-fa3782c96aef@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 08:03:23 +0200
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
Subject: Re: [PATCH 2/3] soc: qcom: spm: don't clobber the SAW control
 registers
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephan Gerhold <stephan@gerhold.net>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Clark Williams <clrkwllms@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ilia Lin <ilialin@codeaurora.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-rt-devel@lists.linux.dev
References: <20261019-fix-qcom-saw-v1-0-9c7ba3fc2493@oss.qualcomm.com>
 <20261019-fix-qcom-saw-v1-2-9c7ba3fc2493@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261019-fix-qcom-saw-v1-2-9c7ba3fc2493@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Trkeg02eFHpxqkzQbX-Bd0wBieKwuO5J
X-Proofpoint-ORIG-GUID: Trkeg02eFHpxqkzQbX-Bd0wBieKwuO5J
X-Authority-Analysis: v=2.4 cv=L7qI0OT8 c=1 sm=1 tr=0 ts=6ad7042f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=WNvXFvV67iztUfGrp4YA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAyMyBTYWx0ZWRfX49u/mLn+AlR5
 MOoUiv2xbb9DBQxhql1m86EuTiIOzsTLfyosvHnUq91+37D+ascAEZoAtPm4QmUEfjdkc+aySy5
 hU5dDrAOxehApBi6ou4sIRMCAG8HVsoezWs18Q1Fj0URxG4/igmeJPe1kQ5jLdTbxzs4jUNaQUZ
 tndLtCmQy9K8sMrHn+Z34/DRcIVZgXxJ3KP+UPOHylDtF6fHFh75TAwGk8l2EWQ2YpfagGo1R6q
 ENfT3w6kssaJhGNn8Jz56AOkB3djf1fmUw2MrqxoEPHsmi0aBPJLB2614DfEFQ6TtiOyZnDcT9s
 pDwoK7tunveov9KzuzdOPrtyRCeIUk8El0djbvhjVwK7hWo9Uj7o90jNKXtw5JZNmJ0T7BWlNLR
 C2r+K3IdolTcmtlCQuUlvPscnhEVpE6KeINNZxKLFkBJm6DG0xDLbZx1gO66Z8VCwnWUPZv6UnU
 maH7U0Nq6cg4Z5NkqGg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAyMyBTYWx0ZWRfXxBRmSYN6QYTQ
 toNhVLbpPsQpQyb+mvgOEhU1C1CdUPcLkPIRLQcOP5RkqCPiYYPMIeDvoAwNFctOfKixNVN0RSb
 Yk2iSORYmULcXPxZrCgkyxtrwKKDbXQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200023

On 10/19/26 4:39 PM, Dmitry Baryshkov wrote:
> The SAWv4.1 and SAWv2.3 register tables have no sequence entry, so
> probe copies the all-zero sequence buffer to offset 0 instead, wiping
> the SPM_CTL, SPM_DLY and SAW_CFG values the boot firmware programmed.
> On MSM8998 the firmware then still powers the gold cluster down once
> its last CPU goes offline, but never brings it back: PSCI CPU_ON leaves
> the first CPU pending and the SoC hangs or resets.
> 
> Only write the sequence when the SAW has a sequence entry, like the
> other registers.
> 
> Fixes: 13e72c3e2261 ("soc: qcom: spm: Implement support for SAWv4.1, SDM630/660 L2 AVS")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

>  drivers/soc/qcom/spm.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/soc/qcom/spm.c b/drivers/soc/qcom/spm.c
> index d41c94d32b51..6f2f14eb9022 100644
> --- a/drivers/soc/qcom/spm.c
> +++ b/drivers/soc/qcom/spm.c
> @@ -528,9 +528,11 @@ static int spm_dev_probe(struct platform_device *pdev)
>  	platform_set_drvdata(pdev, drv);
>  
>  	/* Write the SPM sequences first.. */
> -	addr = drv->reg_base + drv->reg_data->reg_offset[SPM_REG_SEQ_ENTRY];
> -	__iowrite32_copy(addr, drv->reg_data->seq,
> -			ARRAY_SIZE(drv->reg_data->seq) / 4);
> +	if (drv->reg_data->reg_offset[SPM_REG_SEQ_ENTRY]) {
> +		addr = drv->reg_base + drv->reg_data->reg_offset[SPM_REG_SEQ_ENTRY];
> +		__iowrite32_copy(addr, drv->reg_data->seq,
> +				 ARRAY_SIZE(drv->reg_data->seq) / 4);
> +	}
>  
>  	/*
>  	 * ..and then the control registers.
> 
