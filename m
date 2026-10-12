Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA80D49D5BD
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 15:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791818818; cv=none; b=EAw6ab7heFYMKcaCxt12uZcNrf/d+u961LcWkns1WDQWLo0NVi16keTB/9JpBtgJwjcE++5c0SEbGoHj4SnobGse7T/wNyrKMALzvdoFtMk9w40bEgx1Uws3f48BurVrdKH8HKWG7jl5R7M6hy1umw5BXNBBdrBPWRRSP2KgMb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791818818; c=relaxed/simple;
	bh=s/Mbf0x0sIgUm6VG+i/AMdI84Hw7nY61I9jfRK0CkHA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N7Y1FYk5dnlL5XrnWpPGmoNjm+fC4qYfq7OjdmJ1TgA9sHGA+nJ2+buxWMnapzIk58Hz8vXfXq45N9syot9DUac0GCAmqg96+HNfEv0eQbF9IFS4Cso889CVYT/rFbF3pMUCu2GgeOXWkRDVbdcJKHytMWKr1bTxyl9Ow0kLES8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=er/ecCqd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e4cj1Wh3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="er/ecCqd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e4cj1Wh3"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC07nQ1933167
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 15:26:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GPlb/6FP/XOC0zbZ9c/es8B3def34aaz5lIhTTHLCRc=; b=er/ecCqdF3NzjTNV
	5XsRRO2qNpYaNX0GtDi+pqYiN9tDidI6nRMXIXt7iJroSVLWBZ9++OpUpJ/MWIqf
	OA6sM0tEueIQ60rLw4kfjHTKGKwzvTN2v52h9HkvaeTjDgaW+QLz2aXukVo3FSvq
	Z8nMe8n4xEfLvSSCAh2qQIwjyb8zCMsDC4sZxaQH+E79qMqKdQuhf+s5rQa1rzIC
	aegRoXRm7xMdVOIljqWX/MDtuJCQeURRXanNFQ0EvEgnQ8PaBMJ+TWnZ9y6JCz4h
	lFlf3cIXeVDdrrvm+LSvqc8cE3tRlzEDhlXDRepj4KjpZD7hSETEApTiWIwC7rMp
	N/bDTQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8qtkjw2x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 15:26:55 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7c1fd351530so39339137.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 08:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791818815; x=1792423615; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GPlb/6FP/XOC0zbZ9c/es8B3def34aaz5lIhTTHLCRc=;
        b=e4cj1Wh3bUx82scOQA9j3GYnGCSMYxg6SR1zof0w/De+otC+CJJ5lmDPI58CqkKuYd
         hP0j+gTYEN8vcxQ8aUw5tEcEIt9GZKnr8QJat62cQC/Sr+YslF8IvHgKz4Z6Ki3gEC3P
         tIlqjYUznLa6eyEZuDnIiquPszEvxk6y4wGE1YqaplABWWUXRIeO6MbPvtMJIgsVFpEl
         wY6khYud05rdy7F/q+SNZVTGZAWlYs0CugpYjHaB52OtL8QeP2+07112vLfnaEWHm2EL
         k82OegLIKLxDDBgwb6qtvSk0nQM/miValuNC9OHneZsIwkYw6C4K2l6gCFq/6tWSE5nX
         ObzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791818815; x=1792423615;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GPlb/6FP/XOC0zbZ9c/es8B3def34aaz5lIhTTHLCRc=;
        b=Og1FiAyoh0YB5AyIXlROHNECfeEd01J5G8fp3x14X7d3z4/NYnilsRrblyUav3bqE5
         ohc4MKXabErr7lHthYhSxezp3Won4K8+UYoZNHiYNDJNikFnMoWz0vM/VCSC3r36pmnr
         CaWrZn+ifyGLM5y1zB0OmyIFdl0pyQO/G2E9bbEas+3//HlNzBJwHUrfHkRrsc9i4dr5
         V3rLR3coQXuAd1HZpAVFQrsIyua7XFLAwJIPh5nxa1eCR3vvriiP2da4z8kpUhE2NeRh
         4Xb2SysrYYwjwvLBxfNn9SHtJakCCh7VjMUNcpuVKirXyqDnbTmS7WAzC/Ky0U/W0qY5
         BWLw==
X-Forwarded-Encrypted: i=1; AKwUvByQCkgwH4tq6nbm2B7xevJ+P7NfqpxiBfU/i6yo3vBFAt9QzmI9NGmjLtylMasJ3XpGsuNnIaART82COQfz@vger.kernel.org
X-Gm-Message-State: AFq9FYI43JlgiEtoTixSHkRtiPTHNOZRMUOYrCq8vg2Q/PtQvK4eeMo3
	vPt5KdN+V2Zl5K5Mw7lZmKbVnBRaFLaMHVnlngyarxSq4DImCPkut27vM6YthvBuPdcEDP191q+
	6aEc6QauwnjZbnitTr2AZzMvkm44D2ix3gZhpgaV3vTlsMvMmvKAMFnF2lhDy7gGVv4Vb
X-Gm-Gg: AYBFou2hdGHsOHZNYzsE65wuUaasFKOGK9ZC261p0DtgYNMLhiaDm4jTbaKIfsS9Tw2
	AE85OTXDlEqpUX7PW/R7PzVjuUofgWUxsftPgaSXWnvdXW8zZkaVTLmeavHUoMI8OGgMIV/rv+e
	HCJZstyzVOBRrPtkG4a/ojVuhBNS6h/JBCV+pEA3PJ1Si8aBrj8zD/lmoX+ok+Msk6dPx9CnwJt
	kVvRqjOTyJTKsnYAY+4PhHC2BYsVXGUhFeRMhZ4h9XUO1rzGOcevYcrycfGAJuQAR6ZSWesw7if
	N+XtWEeeGkFIg7PoxmbCBIKJb4wMJSCH2fiCj5qf6xgoCFAY03Fh4bYpXeDnh00fRpr9aRyJsE/
	W/EfUfiwah6UeJzkbmCjG8A==
X-Received: by 2002:ac5:c54a:0:b0:5d1:9e07:8db1 with SMTP id 71dfb90a1353d-5e91f2b155bmr1991540e0c.1.1791818815135;
        Mon, 12 Oct 2026 08:26:55 -0700 (PDT)
X-Received: by 2002:ac5:c54a:0:b0:5d1:9e07:8db1 with SMTP id 71dfb90a1353d-5e91f2b155bmr1991530e0c.1.1791818814625;
        Mon, 12 Oct 2026 08:26:54 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9765d1asm468815566b.8.2026.10.12.08.26.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 08:26:52 -0700 (PDT)
Message-ID: <b61f86d8-a913-4879-ba82-a56b4ffdb354@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 17:26:50 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 18/38] arm: dts: qcom: ipq4019: Align multiple property
 data
To: Waqar Hameed <waqar.hameed@axis.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: kernel@axis.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1790892852.git.waqar.hameed@axis.com>
 <11b9df95b8ee7fb12a118aba7004a74616896399.1790892852.git.waqar.hameed@axis.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <11b9df95b8ee7fb12a118aba7004a74616896399.1790892852.git.waqar.hameed@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfX//TpkG4L4VN8
 ks2AU+QDLhr/Z5uV6Owhn/GyLHRS37a9wBY7AJv7CC9+lQvOQ5R9+pVZnI+T6xRRnqGyALuKq0D
 Y2Nfke2Dn175xiFrGD6xFeXwSNjXtDS6AY3m6LhUAoL3L768jg9AvzWDU2MMti5Pa4IP2hBd6xe
 3Qedgllgw2HKsRL9xCVWy1mRbBAAizTqXUn1Zx+/9QOIAUHjGkLLXOOJKS5YUlzLNdCb6j7JXOd
 cVVGNaDKnM1H3ScDpbHgo8ZX1fprw/jah0wkX5IWj7cO0pyBS0SUHxyiqWOMt2hGMLrSzm8XsPf
 GtW0fqXM2gAjaxht719Ig4jTqDjkDjRB4goKIl0UJInDcVxflK0ndeSb8GP1Q4htyx02aMYdxA8
 +f5wI/Wr4QaU7qKyGrpX19TlPh95KLwYlOrICHQ0gJhd+xo4VmlDB2UIp/ecgTEw9jxZmbKB8f9
 a3NtEOoERH+gIRbI42w==
X-Authority-Analysis: v=2.4 cv=c8U+0h9l c=1 sm=1 tr=0 ts=6accfc3f cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=3-RhneuVAAAA:8 a=EUspDBNiAAAA:8 a=Bz_mBq91WImKixDMOFkA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22 a=VLVLkjT_5ZicWzSuYqSo:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfXwrJGv0TB1Atd
 6MK4UZzXMP2QWAcESFUF1f9IapamZ6W6/3SjhbgGB+zNh7QDW7FkPjH5pUpt3gfi29adocssIV7
 rjH4Rsd2HhRfEHYMG+I4iaAk+8PElKE=
X-Proofpoint-ORIG-GUID: NvCIdDGUnmXVcXGTGNIslMeQhw-wWacZ
X-Proofpoint-GUID: NvCIdDGUnmXVcXGTGNIslMeQhw-wWacZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120061

On 10/2/26 12:36 AM, Waqar Hameed wrote:
> Multiple property data on a newline should be aligned with the first
> one. Found/fixed with dtfmt (Devicetree Source formatter).
> 
> Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
