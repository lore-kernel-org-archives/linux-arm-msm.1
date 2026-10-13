Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E0CD3BBA0A
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 08:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791881612; cv=none; b=Wg/tuTGN4a3zLlT4KeebDOlY+L/FfnlECNaEJdV6iqO9rZyqXPTVKIqVcU/agcVBbsK6Ajq97pSezxFOZQIWXBuCPWVqYPJPLG/NHG95RiRH2mNEYlIvRZuiAIXnHSBitzFWaX7ki6TdJsT7kqyG7wRExXAm+eamAof7ERoyeuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791881612; c=relaxed/simple;
	bh=bNzuXJG/ObGhI+jJpprxQn884T6DsuURzX+nVh6WQWs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DK2JvHACFjhLIXx8fKIkl3EgJMkL7TxgqVGWP8wyt8ZY0Pk4lQSjcuMLDL4Upwzm8uavYuC6lEJD+y+7aiOG5N50OIpFjQ0wBcN2L/pFIxYL+9z/hgHoFtAmTmySG5eH1cES/RyB4vjH7+jlB7j0b/w6DctPjxGEC3o73w8xGSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C9fjrvT8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jHSsPLxq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C9fjrvT8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jHSsPLxq"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D88XJZ3752521
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 08:53:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yvqAxKgwJzOB0MsEzFeNKT1R
	wFJ4QQpfU5psf5Dlwps=; b=C9fjrvT82Oek4i6GusRwzPC8QWwlTAff/vKdu0pJ
	Ss5Yw+N90OM/c3OYTJfn3vFf7DsBT9dSD1bnQCeYo4PWUBgmnQZs8lRm0xHBb3/x
	XgTXKMogKq7splJjlq9jBpI68l72Bxpa2w6JB8IOYjaetBVPVoBivoEvCjbIe46E
	vwGpVmwVxAr0r/oasdc57qIRUAxXwSP7+dk1xhOEBlET3ohUfUwaEnZ/5YvhDud2
	xgIsvLHRlr9lTq5EQ2F7wUSnDXLc3AkhzN9eFJVrahtja1fjmZpZp/xtBInI9S9X
	rYAek8w0EGDwez0NjG6KvdsDtxKa5JvtM0D+1CPCcsEo7g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h940w36hx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 08:53:29 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93dea1b6c89so527159085a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 01:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791881609; x=1792486409; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yvqAxKgwJzOB0MsEzFeNKT1RwFJ4QQpfU5psf5Dlwps=;
        b=jHSsPLxqGbMWlbBauS8U80xqU79r+vdjoyNW+GChlt8kk/P0QnHXGEV93JZgyU3dhb
         +Nk9fZtN35rCHuhNn0qUmXjP4cdNZZNkpyPU6aWhpjF5ymcHX5zg7E7UOvevkMRY/tbD
         SHAEGp3rhVxJOzqzZQpMOLXoc8/LyN577shvtjjFToAP6jkJhz/kOHA99rl/9MccpJBs
         dflNaDxeOOsO+8ImmaC2dlSiXIIVlSpaojnmz6c9vCOkhYnI2A0n716kUCiiLPe2R4wZ
         tlFPr9B5yxjDGkPGLpDOEg0ENO2CiKDioIdVFupeeMPT5ttQVhLt1ihcfvvPn26cD+GX
         4/Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791881609; x=1792486409;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yvqAxKgwJzOB0MsEzFeNKT1RwFJ4QQpfU5psf5Dlwps=;
        b=m6D/lcdBixloGfvr5dSViyHwMWwMlSuxISfIsX7qRsiHIZs1td+uck/Ehx7biR6lEL
         j/Kj6u8NFfGQfIc16qYXWLXYa3h8vmroq2pta7IY+6C5ESRtkldJJ2lCS8ScHVqEp0yS
         OZGYK3eR70pFCbnB/8PBW7KjR6d8Uskvz6xCwBGGhw0vJyBAE0kCHt7CElET2wubqpFi
         quFiiE3w7uVk6wsTHYcpOT94/w66vy3HPRtJ8KM8iD5rf2mzSBffmVZCnlOiewxi0843
         ck/6prN3l0qXPNSdUeotcHV8lnRleodMkh+ifoIhzuBoJZ25EGy+R88NVFDPajvkkV3+
         j2rA==
X-Forwarded-Encrypted: i=1; AKwUvBzrbRJ7DQo5Kzzmb8oCepf7D5OyQhaPdfn1Fa9eeMdHFznzhP51Rn9zhlBH0shsLZq9nTyw23LajNAiYlAE@vger.kernel.org
X-Gm-Message-State: AFq9FYKNM7/gwcpCqtVQ9SLqT2ozr5SNzEFIHMv2UhIAOU1UkmqdXmmj
	jJ+GCN/hSnCxL0DPupf8ktaYmyNwzFObYI44D6WQe8wQ6otGIyMz9OBYnKzZXpbneMyp40arv+k
	gXKccFH8+NrsnaCNU9qE36gI0dKojjuimcfLe/fLRZYmjB0kckYROWe1ZatwfWZ1qbEo6
X-Gm-Gg: AYBFou3xPgIco2QaP3IW9Eod6W7Q32dmz+ZdGGq2NEtu+t9klco3WXKn/t8MPVuhXW9
	Cw134mbwrSZiVHhGS3mDWdgLLCdl5XKolzHZhN7b61atdSeQ6n3DOvMOn5Az6oJHcVbDPajx4bd
	xd6Wkgq2MRagC93ilPS0qtpJMUhncCpbS6KOdsw9VuJu6LyN35WdMou5jxAkfjfJGZHs3LcAOA0
	8qoCemdAHYp7R8/p4MSoH3ELyLq8dxkkMdI7HYKBTUJBjN2BOakNFqh920ECd1/qfUb78Cc1x+0
	63o8/E60HfosJ6hvlI2RLDWtfBXOzd5zMCYfwIzWjDIKm+nv2jE7tlzzwclC+19zJBfX/IAWEuU
	GW8OAkQTNVTmG5Sg=
X-Received: by 2002:a05:620a:199e:b0:93c:ca3e:7230 with SMTP id af79cd13be357-93ebd259ae7mr1798116185a.52.1791881609144;
        Tue, 13 Oct 2026 01:53:29 -0700 (PDT)
X-Received: by 2002:a05:620a:199e:b0:93c:ca3e:7230 with SMTP id af79cd13be357-93ebd259ae7mr1798113085a.52.1791881608431;
        Tue, 13 Oct 2026 01:53:28 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.215])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18beabbd0sm401710915e9.12.2026.10.13.01.53.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 01:53:27 -0700 (PDT)
Date: Tue, 13 Oct 2026 11:53:26 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3] arm64: dts: qcom: nord: Add adreno SMMU nodes
Message-ID: <oorw6v4f2pn52haoedhpwo4ihzfasknxj4pvceahgkddzuilln@awp5y6hs53gr>
References: <20261010072823.3952417-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261010072823.3952417-1-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-GUID: DrGGyHxaqyfRL3ShcwcoLaGKNwGwQy16
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAzNSBTYWx0ZWRfX9jyiuJx/8xag
 XewyN7OXn/sE5TvcHFtDPZCu2GkVle462ulRomJMmIndOPQpNVcM8AsOw2MJfA6m4sLuHS8kmyZ
 bFNugN1HUlBez8QmP9wmi9P7ROpdoTc+FNTnZZ122JCec7IdjWzcg270vhNmN9iJ6bXDoXPhvGx
 mh4gIlbofn4u2tTAP081kZJ09rqaPiWDkZNzy2O5cq84xss+mviTyGusAA7s4kGBdKpnBCk6JW2
 JKEFIK5UKrQrCzLyXie+CuE0avUjd2ijyRcac11+7/O8JC5vqf3gwthAW6jmC/Du1o9jc7HYmO4
 ptelfJotKSGXzg9znkppli1vt/GquA+ex0S4xyMvQMocsvErQCHTeyAlE2kHbx+A41Y0Js+2yXl
 AggOxZftIpVV+5Ley3kXvbeBhLZZIqcNMhgkqn1am7GHDeBdijgtt5P1IR4BwE7dnpVwbgwOhau
 Wc6MKbyv27xiCLHMzUg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAzNSBTYWx0ZWRfX53p+ur+79Z7/
 ROqqzIASiZjeKI3I/zuqoOKC7w0Zq/QNs8icjNhOEP7D/lDBtsvEMCOKRELUGoi3iNDjC/rMu4r
 o6512yZ23ss6Hu4IjZAy7LiGcLyE/Rg=
X-Authority-Analysis: v=2.4 cv=ftZJ914f c=1 sm=1 tr=0 ts=6acdf189 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Rt3kCFFBWhWisHNmluDamg==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=wHuZuJDevlIp4-gc4M8A:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: DrGGyHxaqyfRL3ShcwcoLaGKNwGwQy16
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130035

On 26-10-10 15:28:22, Shawn Guo wrote:
> From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> 
> Add the Adreno GPU SMMMUs (MMU-500) for both GPU instances.
> 
> Wire up the gpucc clock and power domain on both adreno SMMU nodes in
> nord-embedded.dtsi for embedded Nord variants where gpucc is available.
> 
> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
