Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795451433;
	b=ga6WWmmXi7/od518Ohq0d+zLOzWn1/YtH6YIMAdK0cABfhplZNBO7HKYwcV8K3Qhy0/d
	 8WKNXEBkaOPIn85KxwCOLBFCU4zrVjXc9Yw1mjdbJRCSNrEUiauy8j3xklr1Oht/AO9Jn
	 eNY8GtJ+a3iYl/VzvfEsVrIGpLF0JJQ+48bMPd2TH6u5833tgd9yX/HhFkocjvo5Gh5pI
	 3t5lNJhzUGyy2s4+U5Zv/CdFBEesvsbbpx2tftiz3j65sk/lTzzVEEiBFtSADcv1owaXv
	 0Mc9hVJyE0anFw/crKpA7cjjfbtXhI8HaJcF4jg5kbtd/oPIWrF0uU3NAOY+wUlSAXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795451433;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=wgZfL8OCYcaFEVWVRs6dEMoZxrUulD37lUUHWyqfj9w=;
	b=050q6iYoVlM2FX2/+9a08cAd5UDS1hh9IbJrEYuyPej50wEFHy0FSDgXcaeY5VFrrfrk
	 nhZ6KQMucYU7m0Ua9h3qz+F2JoGNVwZqI73z0lQD/3NtiVVFkGCfD2g7R6fwFUr25cz6w
	 /N587CDEkp94yXYyv/vy1DI6nN0A9PS8FF1HU4577VZEec5AA52SDcN0O8SkIOj3OKC/F
	 2IS6w/ea/3AjNgITXR6W998omoVUWKaGRaP2EGO5f1D80YAD3u25E7oBgMPBHu3jRLOyE
	 lx/lOyGl+y8AJ5LEeUBr0Oap6CXzyh4wBg4hO9od/aF4KxrMNNPuxkI8lCZtD8YM48Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mgWnxa2m;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D3jxMl3s;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5E68606A32E
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 16:30:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5E68606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mgWnxa2m;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D3jxMl3s
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGGvbL2844352
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 16:30:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wgZfL8OCYcaFEVWVRs6dEMoZ
	xrUulD37lUUHWyqfj9w=; b=mgWnxa2msZDhh/78aD+5C/N8FOOlsQjvX+EY8RJ8
	6Ftkx3pL/fuLZ/bX7oZXJsLdaTIEE5gpMfEZJ+U1p2eOriVOWtEeO1PqJF4+eVOD
	lq7lleRFixoOL0Jze/JpLQpa0YdOUCCJH0BOHlyYNpV61qz961OXFQHkKzzbiU9m
	7seMcdXqmdfUYW3rc4p99IsbPTDe1dbJ33OCnDCjWmNr1SCpsTEoLZrTjAsiogfx
	R2ule6o9S8yYkvGfL9UJdoDjdugcOKhRKtHbZkNE7Rjb4TCh9qLQbk8y6RKX1I/1
	Hgh2HzDsh5/VIC5menYQlMoDcj1QALp85QEe5+IJz9TMAQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g1k2bx4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 16:30:30 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33713e5e6daso6368740eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 08:30:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795451430; x=1796056230; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wgZfL8OCYcaFEVWVRs6dEMoZxrUulD37lUUHWyqfj9w=;
        b=D3jxMl3sbEXg2zXYuGnY///1p+SBPYRbIPuVLFqrZOwZEcizJeGcbhnzvenEwqMsaL
         zf0moEPIQAGu58rPmtixN4A6Hd5+0it84gsHQComwpk7345JOqZmFwVM35cEuO52pu45
         cj/mVZcrdrQUSipN935vXMIXiM2I3I/SXePg7zoSmmCMEiuE6qzKVzzrkykeJ//tk90H
         gf/+LdZNvG33Vi1kAkWCfBF6KyThh9fkniHxEgqtRI4xNDgBVAQQElItWLP/m8BDRkWi
         PKK8/IfKi4yKZmeU6A7V5WwUWOUPCT/ah+WEpBIcYxMIBeVTRyYuXsNYQVzgXgHv0XFo
         3dcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795451430; x=1796056230;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wgZfL8OCYcaFEVWVRs6dEMoZxrUulD37lUUHWyqfj9w=;
        b=2sbSURfBmJtB5m9Sd3iNgGVY/6p+JYJ+x3zmcGO9iqlp3wrxVfGfWOUIvor5ipa/nU
         rFiexB0yO4g7xojqueO7bakuUHRLBfdlQxV0SFl5bBtRNszg58zkHvytJqmdC4bnY8Kj
         YA69BypyPmq0uVW2kEjnF8Nl/eNm7M8O3TVwe0Aiv26csJQ8hiJ1V0H2h9nnnz6kc/Nd
         FQ3f+IVtuwfmFZWj0oCnWvZzHE2u/FkV6Dz2EpILP+ME+Xbd/7tzye4B6C/oXDFxlcXv
         vGXQmc5XI+mPk2RYYtdPsBCDPEAufykOmL2L6rocTDhkMZVI4YCraKW4tQVjValvR0ca
         bwqg==
X-Forwarded-Encrypted: i=1; AL+hErFLcW7ej4Env9GX9I7bXwtyJYDgjx+Px2pLlH7lCQCZ4aHOehl8xjJsYn+eQgLTJ0UYqn5IATjAnGOfdfet@vger.kernel.org
X-Gm-Message-State: APuU4Z+WKgb8taOfQw0u/J3ulsxaVLBP2PFjc1ik/KoDi5JlWoZbB02I
	7VBWl8Iweqk/5MuW7N/NO8JIzhe0H3DDzY89En3TzExeFhkarYF1nvlwcHtNyWQbT06n5cUKv3/
	dStBoGbH7dn19odRzW4lA0XSEKE3pSml4b3eeGbUCKB/KhDSrJLbPAIHiXFTKmq3yb9yD
X-Gm-Gg: AZFdTZfULYDfm5g1DGIYLgWzCFn2iFLWVfSy5CdOP2+0f2szRysJ0upW2cUvB9Fhi7f
	J50SfBxMYcWqUhFGeUt6qDBx8FxWjU+oDmybvk+T9enVrQt6bs5qWymUO+Qin7a44+ljjWgxYaa
	xaEDxl6Buth2uRMSn97WH1GrZoOGZaHeBjxzQhk7UoVL+oQ+MEfUq5I90I8QddrVGhFMKH2SPaK
	TalindT4V4vOfzpqw8Ic4L48znSv4WL1styXreh5Bvy48P/asq+cW7aVMh0vff5ijbvbtGU0f3h
	Hgj6Y0pCnaGxFq4SYK/a0/lt31VHIXyp9ENUGL6gEzEJAVQr6IUGehqutZt5QrZ5H4KpzzgqoIt
	VzPqAYmk6EluzsH9IiCIl9j5StadAUkYRyavbnxOlMgNmkvfh7WELlQSjP9223tNE4f7CT7z505
	k1
X-Received: by 2002:a05:693c:414b:10b0:386:9e32:a65b with SMTP id 5a478bee46e88-3869e32aac6mr8747300eec.1.1795451429514;
        Mon, 23 Nov 2026 08:30:29 -0800 (PST)
X-Received: by 2002:a05:693c:414b:10b0:386:9e32:a65b with SMTP id 5a478bee46e88-3869e32aac6mr8747241eec.1.1795451428755;
        Mon, 23 Nov 2026 08:30:28 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm47044806eec.5.2026.11.23.08.30.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 08:30:28 -0800 (PST)
Date: Mon, 23 Nov 2026 22:00:19 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Xueyao An <xueyao.an@oss.qualcomm.com>,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Monish Chunara <quic_mchunara@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] arm64: dts: qcom: shikra: Mark RPM message RAM as
 no-memory-wc
Message-ID: <20261123163019.msbsccmfzdmfjvei@hu-mojha-hyd.qualcomm.com>
References: <20261123-rpm-memory-non-wc-v2-0-3e868b4bfa48@oss.qualcomm.com>
 <20261123-rpm-memory-non-wc-v2-1-3e868b4bfa48@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261123-rpm-memory-non-wc-v2-1-3e868b4bfa48@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2NSBTYWx0ZWRfX9qh5Xm237QJm
 zlFiAlCF1LRkW0RZkvM+D8MFjD1fJO6/jrfAX65nYrIFrpxSQc2rs2hSYUdcMkK3q+UfeDUAj3U
 tIQzd0CEsMHAJWhosBQn0fYMYhfBbIk=
X-Proofpoint-GUID: ehXvB5RRM37MX8iZp0HLgPXZyfI9qTT9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2NSBTYWx0ZWRfXxZ9vTQv4SdwI
 lNJyOkfUlALvEPTuSgQ393UpHfMO64l574LZsSEUWrqbx+Aie3QiLt8A4CMBjSK/2TiiRVWoksf
 ZmN1XIDIg5+yo6Iui+Agi8kjwW//sIbBScj2flEqK5JwybpCbpXW14nTkClXJKsUWgU36ZGbHcq
 GRK8slY6HrSGCncNDNoMKHrl23Nqz4b6naLKxENAo5HwnBLngShn/9g6gH3rLbvCJrrT/P3++Qm
 PseATxQezZdkkI6C6qob4Xm12LBO2thQRYdIrFvZc4RTeNn4pF2AYP9Y8xm8HAXMAfeCOWE+3Ih
 YhGZdIxhIuNXGbxc76UDoVkdFc6JqhSZBn9c0eeW+eHUMmI2BaGa4RUjjNUW4G1Km2S8STGf6j4
 StWOsf0zl0WgMs4UlOUxjaMR5mifXOqprEn+fGiHHODAx56mJs2KuK4RXpVCtr0NsOwWJwJ49+q
 GUDy7ISiVnJemg6Ss0A==
X-Proofpoint-ORIG-GUID: ehXvB5RRM37MX8iZp0HLgPXZyfI9qTT9
X-Authority-Analysis: v=2.4 cv=cpIOAF4i c=1 sm=1 tr=0 ts=6b046a26 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=I6c21bvp6He-TJasAPkA:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230065

On Mon, Nov 23, 2026 at 11:48:56AM +0530, Vishnu Santhosh wrote:
> The RPM message RAM is shared with other subsystems, and parts of it
> are not accessible to the APSS. It is expected to be mapped as Device
> memory.
> 
> The "mmio-sram" compatible makes the SRAM driver map the region as
> write-combined (Normal Non-cacheable) memory instead, which allows
> speculative reads into the protected parts and results in XPU
> violations.
> 
> The violations are seen when Linux runs at EL2 (KVM with VHE), where
> there is no stage-2 translation and the write-combined mapping takes
> effect. When Linux runs at EL1 under Gunyah, Gunyah maps this region
> as Device memory at stage-2, and the stricter stage-2 memory type
> applies.
> 
> Add no-memory-wc so the region is mapped as Device memory.
> 
> Fixes: 66664b5701da ("arm64: dts: qcom: Introduce Shikra SoC base dtsi")
> Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>

Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
-- 
-Mukesh Ojha
