Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC9A334EF05
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 14:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792160929; cv=none; b=I3HY7KmW8LaF+5AdPFATFXEhjVjv5m1XMnJndamXt4VcZuojVnxb6slUFw1Hd/H+JcS81MzBMDBICQ2DT8HI/lqBE45UjE/OSeG1HDyNjNXAO/aT+YZU5pSBBsMm6k0r6kGffMG51H9HC12MHhcpjOA/UmKKe5cR0QsUNxNdFGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792160929; c=relaxed/simple;
	bh=wEWwyMc0T7Glz7xaHz5ir1knPQzXPDlng/UZQJWPPnY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h4inj6tMa13n3v0tHtUXZMqfeaesvrmQ/ITqAIF4STaX8TuGkPaZ8cKY4/A8KIFuR6bfm7TTDkZ/6xVC8HIhVO1xpJMDD/RrEZW9nup8OEYeLIlkslJ+xNXxvjEMLe8FmJbq0yDbja0sOcnfUDGzsuH5rYfbldWeXYfyYPsStD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T/LBB79F; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fpQwDn1L; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T/LBB79F";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fpQwDn1L"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GE5n4N1450283
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 14:28:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L0rmY6+I62XSWrX3zVFz46D1qgMcH3MIWCV0yy9Nt3U=; b=T/LBB79Fy33pT89n
	nV+TvA4KZMAJH/UJ5rahkinEew1pMHvSgTQMiy3XD88S11kOSQIQAmv6WdwBTO+n
	xoIIdWx/Pj4HZyG8V8z7ouuXY7rQM8N1TODaeBB/v+5QQkxFQiwbZhewi5kbCJZn
	UbP6b9eEyWsLlSGrp7g47WZQMGcT16JSyryudBhjUPSa3mNcMCICbzCM22hkCuVu
	qURtbLzYpc4QmvLFg7Mo9iZIpGkQizwMmFrksQnjccVAzAq0n9YljIZd/MbF1yww
	xu+WRJS1gN6+nfNNw8AU8DnCsitN3AAIr6hTvEJq4YI6FamDdrJcZfnKl+lAZ0By
	a9v2uA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbhur0x2j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 14:28:46 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f0aa07824so221585a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 07:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792160926; x=1792765726; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L0rmY6+I62XSWrX3zVFz46D1qgMcH3MIWCV0yy9Nt3U=;
        b=fpQwDn1L8AnODr/CWCxowwdf/O8mD5S3sMQRBZeHjkm/Wv9E43goVtzpiS4m+X7r7f
         Yg0GiKFI5NVCHtYoOEr4xziqzmbxrJeWHxYgtEcXzdfZ510KmTGw+YtntO5UAfvpkW5y
         QnHCOTHAlWB3/POy/ZYCvaRHV7z5NQelQLJQQvJBsC0pjIDQm/rKb51GaPYwJG4ePjE0
         PJMIPAmKy7ffip3aZwES0sUW9CQ+ndUvTzRtTx8BMGdLWir6t1kZI04rZlqAP+8zOpXL
         m2Xs9rU9RNs+sfzbyBl/aadYFtv2VE0mNcIvPSEbjq6f1Fpd8INKNoOLYX5bPotfZEPp
         s0hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792160926; x=1792765726;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L0rmY6+I62XSWrX3zVFz46D1qgMcH3MIWCV0yy9Nt3U=;
        b=IzSnXpqJQGp/FO9V5KcDjIAPubeX7maZg8c8ua6+1xNbaTC/6j2RVr0JAZJptO7ncN
         sPeONIANHMfVZVYGSODNXk82zqD+FfO5iAJ9pJmhVz6pdg1RSRfRYVuByi88gtTt1KNJ
         NoTzEe0Fy6AyMNKRSBU2kn2IlRXgaxBTnqMhrvEA9OLUgYrLY6RC0eJZWBIi3pnEop9u
         IjgrrRXbjtcOmMonk8PvHH57TYZBeMhslOkb2BZFIclo3ro/m//qyxrObY9FQVAe5EBd
         NVU0Fk+lnll2d0ZTDkpgYumorSb8+DhPFKNWfBEJyfK7jzyfPQQhqDCUS1zK9wIVcX+R
         U6Nw==
X-Forwarded-Encrypted: i=1; AKwUvBxfHVlToJCffjnrfR+MoQWDYKcpRn4rV1Al3qr6+UwW6YIv3h/l5eKBqbOMfYNmu7GDBNWAYbuZ3lKeeoIA@vger.kernel.org
X-Gm-Message-State: AFq9FYKyZjiO/sA0jL9P4ffwlLAjGqjDRU6MJLVlLbs4upCqa6BPvakh
	tMknVwttx7hgcadl65Q/2EcO0b4DHOhAZx9Sh0uSkeedLD8ICZDqguPPsFFxIKglDNSpA751rY8
	Ecy9+jh1J5VXsAjOSREwZJDZsznKXEkBHeFcDUqF/BmhGxQIag5C7ZssbQOE3Bw44Lzye
X-Gm-Gg: AYBFou3ScPpdLn4QrxBPciadQeyWxPBuqp3D85YeV6bOsVjb3ilYc0B8rjF7l93o35u
	EF7p5xFTd54WamwMhYPBYFvXjhvLwS2GISZxcJ6rioPqUqyYjfm0fLF1ikXX/itpFy0jBPYP1G9
	cdZRTCchrw71I0DCS31ZNOnu43E7CoDvysC6vYcxDhPyHHzt1LWnvygLiFXQ4aqvZblOQ1ti88V
	Jvx1ujZTv1QnfyYIMqOvashvypU3+RER8PTfKXF7SxHBS1woBCjFT7aJygbchjyalL4m912mJRb
	KLbYDhjFHS3el3yU1MN2NouP8alMkJRg2u8A3TEhwrse1rG2hRUaDPAZl33aPhCqD3jy2BDKV8W
	U4ktu3R9whRjMKngG8WOfrg==
X-Received: by 2002:a05:620a:6410:b0:93f:1fc5:f07b with SMTP id af79cd13be357-93f29c4bde6mr2995085a.2.1792160926059;
        Fri, 16 Oct 2026 07:28:46 -0700 (PDT)
X-Received: by 2002:a05:620a:6410:b0:93f:1fc5:f07b with SMTP id af79cd13be357-93f29c4bde6mr2989385a.2.1792160925614;
        Fri, 16 Oct 2026 07:28:45 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ab16e44f43sm5140781fa.8.2026.10.16.07.28.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 07:28:44 -0700 (PDT)
Message-ID: <8b657e3e-d38c-4cd5-8b21-254211a24869@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 16:28:42 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: kaanapali: Add memory-region for audio
 PD
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260922-knp-rh-v1-1-35e29b104809@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260922-knp-rh-v1-1-35e29b104809@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA1NyBTYWx0ZWRfX6XE08fKrrS5o
 kId3wOlPQZDVQwg30WXRqB3M6q3jW6tasqRFI5Q2RCcqd28Nkb0o4H0U5MDM8mX63pu0If/YCtC
 wCThBJf9aA6XVbnincx2lj3KOVnUL6GUrqyrjN8lcbx6t5gtQWCvsYGupggGVBtThQIAAivDCqf
 YkT2zQPzIWRohR6aj+QUxwTidf7kI2LQRz195N9FQprTJGnWzJREIa+PAj84nCUf2wipvu4pwqM
 VI2gEW0i4CjNXzEdbzdj/6nTzjsKyziGHBLDueviGMtaSDpnSc5L8AeRfaFjkwgqSW6xCbhvPQs
 +QNA+3/0CXPOT07Hx7sqK8UXRrsULP6RBQ6RukXlvHsQ8ef37kjT0tYC8Uit1yJ68exmQAhRSvv
 HLYRCz0pDYJvQ0ANeRhyYF1Psw8S84AGRszP4g0wGlSQprmZkAjJvvrKGBnEUzfSLmZiMwf+Duo
 r0ZGKAWsgGV6dzqTRwg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA1NyBTYWx0ZWRfX5JMeUqDYLyZl
 NjJl1UIjYZzU6pIeEefDqw5Z2h9OkHPbrLpCqMcCpTnbbBE5+HMPGMCgMEbpWhTAaiJr6I1mq0F
 w6EUqRfrnGuItURWqkrvRxhR/7ohcjY=
X-Authority-Analysis: v=2.4 cv=PqsG/AM3 c=1 sm=1 tr=0 ts=6ad2349e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=mwt7irkxnfVBBxs0BpcA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: c_4dQEwaZWQdd12EKauCNiYwRWMUIAqe
X-Proofpoint-GUID: c_4dQEwaZWQdd12EKauCNiYwRWMUIAqe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 phishscore=0 clxscore=1015 malwarescore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160057

On 9/22/26 9:27 AM, Ekansh Gupta wrote:
> Reserve memory region for audio PD dynamic loading and remote heap
> requirements. Add the required VMID list for memory ownership
> transfers.
> 
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kaanapali.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> index 131fd2a16c54..f79f7679de02 100644
> --- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> @@ -451,6 +451,14 @@ rmtfs_mem: rmtfs@d7c00000 {
>  			qcom,client-id = <1>;
>  			qcom,vmid = <QCOM_SCM_VMID_MSS_MSA>;
>  		};
> +
> +		adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap {
> +			compatible = "shared-dma-pool";
> +			alloc-ranges = <0x0 0x0 0x1 0x0>;
> +			reusable;

-> no-map

Konrad
