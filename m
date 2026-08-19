Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57379393DDC
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 14:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787150475; cv=none; b=j09nVc9t50BxTzVpl156ZZaZFivuotJcl3A3W112MhlHhvRJVg8CCd63EpddLK1TzHFRIOWYNDHdOudQPEOrhsTuHDtKAxsPfaqG8b+JbTQTZ2xO2TmYBvfTFyFQer14MBRqjxMGGQdA5W3LOTPhalGNGg0iyaojwVq6Prf9Ay4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787150475; c=relaxed/simple;
	bh=uP1Vm39mGXJ/9f4RTFIjWj5GN267Chxo03KGXfMZxLE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i2p5v8WFEZa8rJe66YbyvsU5RR1UgavTYSBiatIGdxEG6ucv/0InNBQ4cGU6a074bVXSVXbPnthrzNj0XzOxLTXujv2e9RsqtPghOcrw2OsPp04kyX0w14HA1M40Pm1MJwvsREaPcOrRNKkAtP5ZNrjKyNKlIipe2PekI3yC+Io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IWaHMneY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HJygEiMN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IWaHMneY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HJygEiMN"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JEbgqu135347
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 14:41:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	et6FsqPMKm7fed5oniWthllmYXZYgRzS1qcnjI8OPWo=; b=IWaHMneY/cxAQvPP
	wDJR4ArWk5uMeAvO/SffF+oCpqZeLZ01tE0GPKcSAUnCQlqIEUcoqu5baZ9l9yJI
	+TXz0q3MEgjaEXAekIHwZCDWU8wpX5A4aZGnL7IU3cOK1olAqZ7o4T1BsMkCKvoI
	3mIoNIf0AQye+MiuwV1TBw3TwKdwAlVZQHGvRKdRmM256HdZUXlhFgfEIN+p/foi
	Qb/wUDNFk6Ug7YO3ZxDoXAksQbWMTSaE4woKKQGuJ0OXREuwJTawOKFDUHuWQ8St
	DWl8G6LmDVuRrfQZbB2AV1ISC6JQ1W5isBnwqHEs4FddqQraHpdeEs+dQvmfbzmI
	mmKu/g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfmbqqa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 14:41:13 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52b4e315000so3638921cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 07:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787150472; x=1787755272; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=et6FsqPMKm7fed5oniWthllmYXZYgRzS1qcnjI8OPWo=;
        b=HJygEiMNayTuCeL1TQSOEZmQIzH79GdQdVFantqGXKQzaTdX1gyp0KaFarv3roNLTQ
         2EMJoc+cKaDzFVql4ZQUvGc4oGOkMwg5hz/yFrCe6Mu8erlCwHG0aUhmu9ZYlDqE2q6m
         iyz+3IBdwrDyUaUpOYpjDR6Pu0iLkrbBXmFfKRDADkdVwTKjR1h/4/oYZkZ8dK4GxcjK
         eNHKIRiHGAxio+fSKi2zFTPLrK52RW486TmeAuhdggqKpOdaOh2gMUyehsKdEEVH9ZR1
         g4g/OqQdE+1zrEQXYTr8v+h9qP56yhlwhAw3fX03DtboETZLgqaBD5IDHSJO0XTSYKUS
         ERnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787150472; x=1787755272;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=et6FsqPMKm7fed5oniWthllmYXZYgRzS1qcnjI8OPWo=;
        b=IqZkh492Yw00alRxIoc+A7Sh7eIcAH688QpwhIc+KYkGCf3PpF76YbtOL1HSCnQCb1
         yvSx7sRvHDZKvntN8MnrduuUcCWzTtULy+TABOBW+B3192aOEO6GrGM8wQRXHfhvEff7
         5o0NkdCsEuO+cwHffV6rSr/BWqSZUkhOY27BN8ifQ92WinxZomBQfH6R+RxG54P8lgal
         aDUvCTtIYQpG/r3aCRbl8jpK/YFSZCUC95TMh4ViYfnCfIgo0T6etMrM0WE0gmnP4i4P
         cGV4uOgqMTKVJGm8qn8OW2iO6sIDvl1yMwUcRwhqsBotPq5JjthNn2YRIuqQawIuUIeF
         Mflw==
X-Gm-Message-State: AOJu0YyMASlKcq17EypW8vFJkXBJjsI4EvBT+ZB0qE6Ppv2R6c1SMRY+
	opb+4acGeL04/53Q5btI/S0KGyjtSQths/BDou6s+po+MumEkuQldkUqfsSMfk0tZ56U24a9+in
	Drb3e8lpd8Sqa9lLOr737yUXDy1BGR4vtRlmyl48L9pEYgB+HyX9nJCGowCRFy+QgaogY
X-Gm-Gg: AR+sD13gR41sTPEj8OB8zefkymcK7B5Evf0gFyO5FHHY/33t/sBTCUkXW6+A7K4KYx0
	1zXTha6pGt3p4YRhgelfdqiqMH6giPJ8eQyXADwQV9efoSy79utr+FzGyMw6k4S6YXs6Ogp0AyR
	ISHLyBWCjU4cR1UK+Xto2m5WUEujqOV0y7ZmEkGcBXOQODl1kzIAwXtARvouwjrsIpksM65d7UT
	mOzU0bMkyyRCaEktPqTgOk4WovZz/bMChVHFvmLKlILMWx+fpfFswBaZxRf6kWN+V1kCGoIw+oK
	xO3Rc+CLmLd7HKWqi3LORlUpMa6k9/ILtYvqxcEGdBC8/e+Z+mRNksm0jaWOcMahWICQmk8zaw2
	d8KTvkGswjs+K9Z801dorzxSD
X-Received: by 2002:a05:622a:2d4:b0:51c:2324:666 with SMTP id d75a77b69052e-52dd5e287c9mr36595961cf.3.1787150472024;
        Wed, 19 Aug 2026 07:41:12 -0700 (PDT)
X-Received: by 2002:a05:622a:2d4:b0:51c:2324:666 with SMTP id d75a77b69052e-52dd5e287c9mr36595551cf.3.1787150471535;
        Wed, 19 Aug 2026 07:41:11 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c244b6a5277sm18028766b.36.2026.08.19.07.41.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 07:41:10 -0700 (PDT)
Message-ID: <67a37c6e-ff13-406b-8897-1faac3ec9f27@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 16:41:08 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sdm845-oneplus: Move touchscreen
 y-axis to the right place
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Marcus Ramberg <marcus@means.no>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260819-oneplus-ts-quirk-v1-0-0cdbcea195a2@ixit.cz>
 <20260819-oneplus-ts-quirk-v1-1-0cdbcea195a2@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260819-oneplus-ts-quirk-v1-1-0cdbcea195a2@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDExNCBTYWx0ZWRfXx3/gJ0LSS95w
 evLf+aFccL/Kor6g8/N3pSoGQuTv5byJZzAQ5PoiWLRVGCegBKku9weATwSDNUyJBfJyaZCyqw6
 0hJQyKl+IqpE/46O7yFcqgIUAgcO/Gt7VWsPkWhnZ4jeh4q49c5EZp4TLAgMzJuNiwgPUifPB/E
 7CAj7Y0KFIx3U2STB/SSPoSfgZILsqMePOF8J/0DzowZNYy2lD9kwgKNYbr00y8uuaEJNuT/ISe
 I35iCMDo27UC+/Zd2ORT/ElCJSpUUwP2xnxYHTrsgJNxRClzMu3rd9ELOWjWgjF/grW0uaz+fTg
 d/EQvp7m2Rkh8nDerGQW45NyXUZN/5bK4hzfqlTkSH/x0MY19EFtnoAfVZ2P4yGYCdP2Ilvellm
 8H8g2ou78vFH9IZoIVnQwaC39naNOip/UVwpXbCN8ulStnBJUbVMJ4gn6aEmbSr2Y/lchWE89xz
 XLQQtXRzfid/g54AgBw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDExNCBTYWx0ZWRfX5A/YgZGoWBS3
 weGPfp7QMMjCezqbhSAxP9NXcRP/AFBWEY/KTr4uy70On+SrJI3SbZgMgjz+MdahGJXP4GzAMW9
 OOj3lAZ3G8FrowKP+DQ74zq8UAkvFhg=
X-Proofpoint-GUID: j6UgYDev5kYFGqthEIaOZyoabns-iQqr
X-Proofpoint-ORIG-GUID: j6UgYDev5kYFGqthEIaOZyoabns-iQqr
X-Authority-Analysis: v=2.4 cv=J+SaKgnS c=1 sm=1 tr=0 ts=6a85c089 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=3R9UXOM9zR6sg_fn3_IA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_04,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190114

On 8/19/26 3:56 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> This value belongs only to enchilada, fajita sets it's own (as the width
> / y-axis differs).
> 
> No functional change.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
