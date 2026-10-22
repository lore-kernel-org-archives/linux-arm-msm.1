Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792660517;
	b=z8q/xRrz7zDKTYSS0kbLjk9iM8LMJESgxII806sKcvodn5uKozNwvi7nS7u3Qp72r13L
	 Ym2aRKIVbcwAJNV5ny64Cq0DlWl4QIoGHBAyZdgTMg5sh7KHAaKXti2vPbpx7RerMZtAa
	 J0G8tz2wgGn5skrfoGw+rDL133FbcHpePUxZP+uuep71GjqdtR+Jkzar6/9/wpDUyy6xX
	 W6ZBRO/yINCV0oCs9dv8YM7AHSsnT0PhMah45P25QfdmR9zvBOC5b9Z3kDoXNQaqeEUkJ
	 J1o380YdUXxa6I0DSMMjMCav41mGqXIkbQ7Ec0fzXvwIdT3PEZ7rznWBND+i/E0cFkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792660517;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=6IyF4jsgjXMIXqYYBjNbrM7/Kalk/zFMeim4YfJjXwQ=;
	b=U7f6K87KKI1Ue/8yKSvtBAuGLR69yNUlV1Xml4kTM4YENl8li3bbPq7zTTb26vQXZDmB
	 4EOYGVwLqpnLG+4zwgjZmeRafR7SwOSnFIS+650oMh6I5spJfrAYWdV82mBHJXwc2xCod
	 n8y4n1X4SLYhNS+npeQM7oM6LLa6ZkmAOUbVvDDn9TrchSMsT4XsDzZx3P2J5C1xOcSEl
	 JQizCQQbA1cVk23cTptiAf/bIZN50rFbNeDBYZDUfWdFJ9CDF1Ur7spPsxuM/i4Y3rjSs
	 QF/PvckibhkFYUVh0awL/qCZQWX8ZVexgGkX3jh6ayW6l56VgL9OuhVkZ0M57QjuDkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GhSpwpBD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=P++bMImR;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E0A3606A319
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 09:15:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E0A3606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GhSpwpBD;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=P++bMImR
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M708tO3025122
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 09:15:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6IyF4jsgjXMIXqYYBjNbrM7/Kalk/zFMeim4YfJjXwQ=; b=GhSpwpBDTx4whiF8
	H+7IU3lH+queWeCYxxzD85GVF8LsYxu6vQlqQDBrYgFuliTAH047tkWpCHhxd5t5
	UosdZCVp2SlDAjrZKnRxJWR/PDRc+h6ZknnYGnf4tbnZJwA32eeAelbEkbHAXhuz
	Gz+Hxey/4HfPNvjg6PrLEQm0mHFjYeJCoaMojKbEnGmxF/YbRBiV+lKN3aGbvpue
	kCbT+SBtWc4ZLxt0elx2HVEgIatgZcK3Cx39TKaTEOfyagr80n1xCqVNP6u3ENmq
	jDhUWKefIwQUtuL+ZSdhm/musld6YKnD5E3hUBHrAg9kHBu+d2sIRIEPHz+5bPTz
	dQx9Cg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93askbd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 09:15:16 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cac495d99so30496585a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 02:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792660516; x=1793265316; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6IyF4jsgjXMIXqYYBjNbrM7/Kalk/zFMeim4YfJjXwQ=;
        b=P++bMImR7Iyi6DfJ5uHV4DrYzUSN2FT+vJTaoAR/6EAH2QX68CKHpzyrCfURhHLipP
         QgEm7bRwkklB/wEENVUhnhxMLlETLIuc/NtdHWSZ+G2nREBzYi7C8o3MsNlWKfpmwjXe
         PtE/NaWGmVQ42M8E2/Y2bqO5PlO0qAzbvG7K4DHsG7U3Ol+cEx7WngKw3CTTuhNcjrIy
         hPFQhna0Zh0lcHxq1jMPBjjyAIT4SiX50++qqohzqvD/BvSHDw/a/ODlBc0demmltmYc
         mVZ8yd+GYMm7x5OvmNmjeYwZjilf94k622HXJO5HuYP9iX4biLl4nvUyOvhqD9CdCiwC
         rqmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792660516; x=1793265316;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6IyF4jsgjXMIXqYYBjNbrM7/Kalk/zFMeim4YfJjXwQ=;
        b=vdHPgTFngnalgypzbk+T4sYYTm+BbGwrTQip6vIsZ2Ble+kGh30oltgzJDUz7vYDf/
         P2y66z8vUlHd+44yhzkBUmMRBLjjvihiuttVGcAba0WoLhjxehx/GRlZoQHjaNLSSUEC
         oyGUcbhgS01i5y+QGD/oG6NozGGesxC7ORkaC055BJxurX5XbEthf1B9kKL84G4+GDk6
         t5o24NT8sBfdBDGM3v//qwteHkX+Mg0HQXdkKQlXI/bmDCbvtbpIYEq3DcR0wPY4r2bC
         lHjOsgN+oKyHPq7c0MHuUd0iL+12iJ0IQDX+LEYd8bsLm6sFqEjbuBGDrBaSMg7gw7Y0
         67KA==
X-Gm-Message-State: AFq9FYL2xHtXI7btJBXDfznzimg7n5TydZSkdzsF7eHaDSDJMOSF0Fhs
	gnWGSMnAZnvepwLDDhi1GRp+jaWVT1LF3f5hcdsPZdvn2k5YlEFESriG8sLAJPVJ1KwzwvRWtJG
	w6F1T7eaOwtQDkMNLELiWPBtzdFhsGXlsyiXrYIuSmqQBV1g6B9XuCrcyfkx4Ey0Ebv7/
X-Gm-Gg: AYBFou3ZXJ3MLAUrBNSsF5V6V472Pe2kVJGh3LSZbXkncHwhr5NUkBjNfFahvWV2+y4
	jkVLGNEJqq5ruPYpQ1h+P9Hsy5jfYQitby9WnQDvb9OZd6f9a+78bLV4DiWGug7rVQmBvULXMNs
	AuPL3io4j22cxHTqPaad1uijDp6ROifVs++EHnEptgAY/HABktFj9xFORYWWdIIb6RAKkvshnYx
	Ras6w06631Y/JDmCpYN41s16U+0niNH9+wGrWrOJZ5EndAb8OF+E63lEF/hqLYdVdhtJVhYfgVj
	WSiqhAKZrnCyjHTQvJ4oBq/XaAXcPeXUCFS/HsGZVlaoXMvEMJ1gcdS0r5LMBVdERN2bea+jmLX
	QxR8qRBkxN9gRJgywYnbkNQ==
X-Received: by 2002:a05:620a:4687:b0:93f:1a1a:2974 with SMTP id af79cd13be357-93f580066d8mr1113496785a.6.1792660515719;
        Thu, 22 Oct 2026 02:15:15 -0700 (PDT)
X-Received: by 2002:a05:620a:4687:b0:93f:1a1a:2974 with SMTP id af79cd13be357-93f580066d8mr1113492385a.6.1792660515307;
        Thu, 22 Oct 2026 02:15:15 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a61a2bcsm82138266b.87.2026.10.22.02.15.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 02:15:14 -0700 (PDT)
Message-ID: <5130b971-7576-44b8-a27b-49f3c104e250@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 11:15:12 +0200
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
Subject: Re: [PATCH v3 3/5] arm64: dts: qcom: eliza: Separate common CQS SoM
 and eMMC configuration
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260928-dts-qcom-eliza-add-ufs-variant-v3-0-9a2fdbf6baf2@oss.qualcomm.com>
 <20260928-dts-qcom-eliza-add-ufs-variant-v3-3-9a2fdbf6baf2@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260928-dts-qcom-eliza-add-ufs-variant-v3-3-9a2fdbf6baf2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzNiBTYWx0ZWRfX2zAe86fiEui+
 qt6bTv3xVPJLUuGG+2pe2GlO61+P6Yeou3MMSw83VZ/boD6+fXjCoflkBwwNSGKosue+yE+l9Xb
 BWZJKjj7y62EDqnAN+RmwmSDmBrFaifWKtrXip/AjFGERf1DAH6aLx1vO08UZaOJkD37ciUEnXw
 fGtlm3CcFUm1vGyVRlHY1eIKUnnCFwnOjQSe2WdPyzzfW1si+5MxxAhu9ZJO26+Nzb6MSgO6WOS
 RFH1ofHeTCyhZuxSrOGhk5EOImHVAHBQAR+ySpNWhAKYBi2Icmpa8w8NKoGxPypTphKNSs36JsU
 govqCGY0X6SFyliOoo6R296tzr0XK10kq5nXDwE3Cn/NmrDBfh3S6TxkKJWKkvVFpPZrZdMVCaZ
 vD7ILy7iAH/7290JY+zHLYjHqIIZxUbhvXJJqx4XuOk55MTkzlka2lcZ6A6/Z84z0GK18FPDlAq
 VsfQznGKHDMjDtNBvVQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzNiBTYWx0ZWRfX7LsXjWwKH2ib
 TE0yjl0W9AFMdt8WwUyVE7jLFwgCwAFEI329KD05K+9YDtxsLIhAN4+xRpAKWoqAxTR5MLK8ux0
 JGHPHG2FwLJIynPNrkKbbcQf2z3vSP8=
X-Authority-Analysis: v=2.4 cv=QPn91QLL c=1 sm=1 tr=0 ts=6ad9d424 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=f-_yMVppHRA7q8N3D6sA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: 4LMJJo0KhrGCw8CEuhTlAPCMHbtvZmhZ
X-Proofpoint-ORIG-GUID: 4LMJJo0KhrGCw8CEuhTlAPCMHbtvZmhZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610220036

On 9/28/26 6:36 PM, Abel Vesa wrote:
> The existing CQS SoM description includes its eMMC storage configuration,
> while the SoM and EVK filenames and compatibles do not identify the
> storage variant. The UFS-equipped CQS SoM uses the same EVK carrier and
> shares the rest of the SoM hardware, so duplicating the existing SoM
> description would leave two copies of that shared configuration.
> 
> Keep the common hardware in eliza-cqs-som.dtsi and move the eMMC
> controller configuration and its 1.8 V I/O supply constraint into
> eliza-cqs-som-emmc.dtsi. This lets the UFS variant include the common
> hardware directly without inheriting and disabling eMMC configuration.
> 
> Rename the existing EVK DTS and its compatible strings to identify the
> assembly using the eMMC-equipped SoM. The carrier hardware is unchanged.
> Neither the CQS SoM nor the EVK assembly has been made publicly available,
> so the DTB rename does not affect existing users.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
