Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE8811F938
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 08:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792051268; cv=none; b=otys+Kvwpe4Wbbr6o+V4cenbyBkym73qPuS6yoB9BP418+9+onyzS7M421tuWiZRGFzfCT7h0KKvwY5pymyK/B+Fzv3jzCG0ozeO0hgn3aJY4jGmj7i8seoaJXAcnTpXsfpHkJeOcnveYN8RaUX1bFkdo/zxaxNOO+Kzujezn1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792051268; c=relaxed/simple;
	bh=wXyFOoGBCz03tUFEq6nVZ5iLN4xicYygVoYyQwqwqZg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qeQzQZJFq1rF10itcpejQ5MndKoS+ytxVJxPDlxvGzAQ0VSgAF0JoqhOorMBPVpOfTaI9FWVg2UbspAEsQ6HsRoZHMzMw7sVtrcL1tM375A9TnRX0ckfBgdzjHkv4Gjgpk+qNcJ8al3JatESrbqIwHpA42otCEaR7obk2nHfw9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=peCk39eT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j2b62kRj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="peCk39eT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j2b62kRj"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F6GjSN644870
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 08:01:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Sjp8LTqAsf6BTSQKxdshUs0WWCvko5i3JGSkwCL2Oco=; b=peCk39eT6uYglLRt
	yhtlLZfzptStSGoGvtDeeMDvvRcEmrAwb1WSzL8Z3zFODn6f6ieANSmSa51HKBDp
	d7P7if3XRb2nivCCRJSue8XqRSElF/p/VrHEwrGpMMlFmQr8H4lGAqub6uqH1sGp
	veqJVj0u3ezPJwDMjv8uIf62ae5AadSzIPPsbIL/nRjFVybmH1S/xtARVNP/jN4c
	JGfowzb1hWAUnIYKzY6vHZiOOArWdNxymietWf270BpmH829Gmm8S7CRmlK27u9Z
	y3l/daZxTf+cXBiyNRFQGjFKPkP6XSlrNB+z29FlsplUMf2itc665u4HMsu6LRfg
	copvyQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hajmy9uu1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 08:01:06 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-533962f6bc9so10943401cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 01:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792051266; x=1792656066; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Sjp8LTqAsf6BTSQKxdshUs0WWCvko5i3JGSkwCL2Oco=;
        b=j2b62kRj1MaySNcSB46wxCjnvT5AR2DMPW+V9CnqYPzDN/3k4BtZAO1x7Vq00dikpV
         oBiZkOQH3TRgNr+FkQBpAcz9OldMYgIqsQ3cYqO4osjdgGwhcLzHGCQcR4dL5XYEC27e
         pylqBZNyM2X8+lvfzU4iGUQcgBu7fgLDeWgS3Ni6w5zyMTCaWobqHwp2rAeEtuOxeLdX
         qywYxzFVMpuHe8h3pwfhOFcTOU/v+IhvuUS+kzKKrAS1VnKC5BIlBDjeaFEcnShehSUu
         Bxe6PhGXteDfdnpW/NgQxLmV/gq9jQD4V142kqj9FnZmKs5+ia607A2XUEn53SD0i8iB
         /dKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792051266; x=1792656066;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sjp8LTqAsf6BTSQKxdshUs0WWCvko5i3JGSkwCL2Oco=;
        b=F2HmLy3YKyHv4f4FPZWGhmONyZJa5CvUfGC1KOgwoMiZ6sTRSHQngm/6en9Dbg7GX1
         mDjOTnHjXrB5kiQW90NOcl8vFmpqQ5uLHbabNJAUTMXDA6sMnx9xiKGpzMS+rxARLJeA
         l+if5SLyHgALVm34GeCr474Mps+r0QuKM1wX8Km/hFqnn4wkAP5r37/3vDmoJrsf8Bvr
         ZLFTBLEH3G+Wa3Okt47YOf8lCZPUaPsPpuSgIWHJWojD/vT0AZvZW1HSLUvwKE0BMSSS
         1tbKhYXKvqzzI8FtdtZ5fanvitR3l6tzA3Notc1pJxv/qR0G20mFc8DZ9HUuR2rPSUHT
         NHTA==
X-Forwarded-Encrypted: i=1; AKwUvBzpV0z7rSS4atDIt5moqfWCg00kdYETz7zevMMPaUc8FhrnyBoMUsY/YPJHt727bUwhEKTs6TBbDxFa1Y/0@vger.kernel.org
X-Gm-Message-State: AFq9FYKC0wRAleuizgHQgCvnrE7t3BVzxaxRiVIEhasT3HgLxDnynv5p
	egIuWHTPFMeRQnDX8l3t66P31ZfueMaD9nDtcEvAltO1NSV0XlTK6JeT5kp+IAJ2/o4ZD50D9cb
	kVgiKZ4wvrqV6b0kl+qCYJ20o7Zoac1r8vpDCb6qtOfB+xDXbvtyhUGSE7deB1UTKo69G
X-Gm-Gg: AYBFou0CDstYr/OU1Mi4j48iIGo5j1UcXDFVn5umEm9OsWeQ4zc5VCl38MyFs/uzod1
	TiQU3Mb7J6t5mYvaYzVRzo13fHzWqkISH237l3sa1tChJlXrtz+PYOITYmn4dez1YkXItZvMk30
	L+PS+P3DUWanK7Pil3hWX5/989+RJpNdnKFYzLosTnIxQu5FSSuRHtszoXcHzIVYpdzz383NAIy
	pnTlPz3fYsqrZlYe8JuRNMnbIH5BE2cn22EoBkKtzU3vKuz5Rvh1UgwyDC/vF22prSNzwHaMjxQ
	uBSvaasYm0kIWruUUKIiAHrEVTFi2X9GZXwSBnlrr+A4DiM8wXxjAcXI/kUqSe6QR/NJDPGCL7V
	uModdey1Gvrz/OXXEfqfJ+g==
X-Received: by 2002:ac8:7f52:0:b0:535:1a83:1251 with SMTP id d75a77b69052e-5359fae166amr344295751cf.4.1792051265863;
        Thu, 15 Oct 2026 01:01:05 -0700 (PDT)
X-Received: by 2002:ac8:7f52:0:b0:535:1a83:1251 with SMTP id d75a77b69052e-5359fae166amr344294911cf.4.1792051265100;
        Thu, 15 Oct 2026 01:01:05 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3eda044aabsm91788766b.57.2026.10.15.01.01.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 01:01:02 -0700 (PDT)
Message-ID: <658c4734-35fe-492e-a9b0-4a4d89afd231@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 10:01:00 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 4/4] arm64: dts: qcom: sm8750: Make the ADSP remote
 heap no-map
To: Jianping Li <jianping.li@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com
References: <20261015071511.977-1-jianping.li@oss.qualcomm.com>
 <20261015071511.977-5-jianping.li@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261015071511.977-5-jianping.li@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: KWoFc_U2kpmfFzHV2BJTGcpJPYrPGODi
X-Proofpoint-ORIG-GUID: KWoFc_U2kpmfFzHV2BJTGcpJPYrPGODi
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzMSBTYWx0ZWRfXzdnfV0w6IiSm
 wuArgnQ4u9ldwZe2/5G6vX9d5waF4FM+Aa1dQC1WDE+GCd9/1WpvJLubXb5Ki9D59cxtww37PMJ
 4lvNUQr9SzVGs6naSR7eUZdnQR46sxU=
X-Authority-Analysis: v=2.4 cv=TbQDJhQh c=1 sm=1 tr=0 ts=6ad08842 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=CjiZw0He1JKpzbGRn1AA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzMSBTYWx0ZWRfX/Gf4hduDhgEV
 2MQTs8BJu6MG+IgQOQqbwsdwQNBphOdEN1NSE5NPaLIric3xWw0LdlfjdhKIhhqxbaD8m7NC03A
 0OejvEqUSiP7oKUvHp6Pb7O8H9SvQMcJkGQLCn6MFLqsYI9BqWQSrGw9INc2UliPIUUzS9yEXEX
 d/HLpjS2acJIYWXkWtph92jPffTOqPk80VVRHrzce6yj4ZAcIrHCWEzdBS0cinSZfYKKYTL3GCx
 3u08o7P+uvVKzMJ3i8C8EDKBLc05OPnWAmAt9GPHqBuA4ox8glZcKDq13K41Jy5nO6TI793EqO5
 p94xbglkZ2o69e4cc3SvSIct3E3ldUotn3ROLjLWRlPC/BV+/q6BXTOKuD0DSOqaHpqYmAVPzjp
 72jrQmxSx0K65TTbY+CV7bWRaVDLeb9mEyffMb8+t2DgRxd2+km9vznfXAoDToaHnmys8cCSSOM
 t3cnhSdgoYVR/FKMVOw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150031

On 10/15/26 9:15 AM, Jianping Li wrote:
> The ADSP remote heap is declared as a reusable shared DMA pool.
> Allowing the kernel to reuse this region is incompatible with handing
> the entire region over to the DSP, as HLOS allocations may access
> pages for which HLOS no longer has access permissions.
> 
> The same configuration has caused synchronous external aborts on
> other platforms when the kernel accesses pages within the ADSP remote
> heap.
> 
> Replace reusable with no-map to keep the region reserved for the DSP
> and exclude it from the kernel's standard memory mapping.
> 
> Fixes: 0bcf9ca23a873 ("arm64: dts: qcom: sm8750: add memory node for adsp fastrpc")
> Link: https://lore.kernel.org/all/20251209-sm8750-fastrpc-adsp-v3-1-ccfff49a8af9@linaro.org/
> Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
